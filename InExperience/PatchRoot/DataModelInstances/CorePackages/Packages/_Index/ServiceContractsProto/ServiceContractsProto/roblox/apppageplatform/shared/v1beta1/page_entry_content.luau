local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
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
		var3, var142 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.input_data ~= nil then
		local var5 = self.input_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var145 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
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
			error("Unsupported wire type: " .. var149)
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
		var22, var172 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var20 = var23
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var24, var174 = protoModule.writeString(var24, var25, self.roblox_component)
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
			error("Unsupported wire type: " .. var178)
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
		var40, var200 = protoModule.writeString(var40, var41, self.roblox_component)
		buff = var40
		var39 = var41
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var42 = self.input_data.value:encode()
		local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var43, var203 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var39 = var44
	end
	if self.cta_buttons ~= nil then
		local var45 = self.cta_buttons:encode()
		local var46, var47 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
		var46, var206 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
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
			error("Unsupported wire type: " .. var210)
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
		var61, var234 = protoModule.writeString(var61, var62, self.roblox_component)
		buff = var61
		var60 = var62
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var63 = self.input_data.value:encode()
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var237 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var60 = var65
		elseif self.input_data.type == "video" then
			local var66 = self.input_data.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var240 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
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
			error("Unsupported wire type: " .. var244)
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
			var83, var269 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var81 = var84
		elseif self.kind.type == "badge_details" then
			local var85 = self.kind.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
			var86, var272 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var81 = var87
		elseif self.kind.type == "static_content" then
			local var88 = self.kind.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var81, 3, protoModule.wireTypes.lengthDelimited)
			var89, var275 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var81 = var90
		elseif self.kind.type == "experience_attribution_row" then
			local var91 = self.kind.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var81, 4, protoModule.wireTypes.lengthDelimited)
			var92, var278 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var81 = var93
		elseif self.kind.type == "experience_action_module" then
			local var94 = self.kind.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var81, 5, protoModule.wireTypes.lengthDelimited)
			var95, var281 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var81 = var96
		elseif self.kind.type == "experience_media_gallery" then
			local var97 = self.kind.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var81, 6, protoModule.wireTypes.lengthDelimited)
			var98, var284 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var81 = var99
		elseif self.kind.type == "experience_description" then
			local var100 = self.kind.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var81, 7, protoModule.wireTypes.lengthDelimited)
			var101, var287 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var81 = var102
		elseif self.kind.type == "experience_stat_row" then
			local var103 = self.kind.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var81, 8, protoModule.wireTypes.lengthDelimited)
			var104, var290 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var81 = var105
		elseif self.kind.type == "experience_info_table" then
			local var106 = self.kind.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var81, 9, protoModule.wireTypes.lengthDelimited)
			var107, var293 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var81 = var108
		elseif self.kind.type == "social_link_row" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var81, 10, protoModule.wireTypes.lengthDelimited)
			var110, var296 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var81 = var111
		elseif self.kind.type == "experience_carousel" then
			local var112 = self.kind.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var81, 11, protoModule.wireTypes.lengthDelimited)
			var113, var299 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var81 = var114
		elseif self.kind.type == "song_carousel" then
			local var115 = self.kind.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var81, 12, protoModule.wireTypes.lengthDelimited)
			var116, var302 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var81 = var117
		elseif self.kind.type == "events_carousel" then
			local var118 = self.kind.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var81, 13, protoModule.wireTypes.lengthDelimited)
			var119, var305 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var81 = var120
		elseif self.kind.type == "game_pass_collection" then
			local var121 = self.kind.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var81, 14, protoModule.wireTypes.lengthDelimited)
			var122, var308 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var81 = var123
		elseif self.kind.type == "developer_product_collection" then
			local var124 = self.kind.value:encode()
			local var125, var126 = protoModule.writeTag(buff, var81, 15, protoModule.wireTypes.lengthDelimited)
			var125, var311 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
			buff = var125
			var81 = var126
		elseif self.kind.type == "subscription_collection" then
			local var127 = self.kind.value:encode()
			local var128, var129 = protoModule.writeTag(buff, var81, 16, protoModule.wireTypes.lengthDelimited)
			var128, var314 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var81 = var129
		elseif self.kind.type == "dynamic_store_category" then
			local var130 = self.kind.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var81, 17, protoModule.wireTypes.lengthDelimited)
			var131, var317 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var81 = var132
		elseif self.kind.type == "card_container" then
			local var133 = self.kind.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var81, 20, protoModule.wireTypes.lengthDelimited)
			var134, var320 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var81 = var135
		elseif self.kind.type == "card" then
			local var136 = self.kind.value:encode()
			local var137, var138 = protoModule.writeTag(buff, var81, 21, protoModule.wireTypes.lengthDelimited)
			var137, var323 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
			buff = var137
			var81 = var138
		elseif self.kind.type == "dialog" then
			local var139 = self.kind.value:encode()
			local var140, var141 = protoModule.writeTag(buff, var81, 22, protoModule.wireTypes.lengthDelimited)
			var140, var326 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var81 = var141
		elseif self.kind.type == "banner" then
			local var142 = self.kind.value:encode()
			local var143, var144 = protoModule.writeTag(buff, var81, 23, protoModule.wireTypes.lengthDelimited)
			var143, var329 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
			buff = var143
			var81 = var144
		elseif self.kind.type == "tooltip" then
			local var145 = self.kind.value:encode()
			local var146, var147 = protoModule.writeTag(buff, var81, 24, protoModule.wireTypes.lengthDelimited)
			var146, var332 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var81 = var147
		elseif self.kind.type == "coachmark" then
			local var148 = self.kind.value:encode()
			local var149, var150 = protoModule.writeTag(buff, var81, 25, protoModule.wireTypes.lengthDelimited)
			var149, var335 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
			buff = var149
			var81 = var150
		elseif self.kind.type == "system_banner_prompt" then
			local var151 = self.kind.value:encode()
			local var152, var153 = protoModule.writeTag(buff, var81, 28, protoModule.wireTypes.lengthDelimited)
			var152, var338 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
			buff = var152
			var81 = var153
		elseif self.kind.type == "age_check_upsell" then
			local var154 = self.kind.value:encode()
			local var155, var156 = protoModule.writeTag(buff, var81, 29, protoModule.wireTypes.lengthDelimited)
			var155, var341 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
			buff = var155
			var81 = var156
		elseif self.kind.type == "catalog_item_list" then
			local var157 = self.kind.value:encode()
			local var158, var159 = protoModule.writeTag(buff, var81, 26, protoModule.wireTypes.lengthDelimited)
			var158, var344 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var81 = var159
		elseif self.kind.type == "user_list" then
			local var160 = self.kind.value:encode()
			local var161, var162 = protoModule.writeTag(buff, var81, 27, protoModule.wireTypes.lengthDelimited)
			var161, var347 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
			buff = var161
			var81 = var162
		elseif self.kind.type == "experience_content_rating_label" then
			local var163 = self.kind.value:encode()
			local var164, var165 = protoModule.writeTag(buff, var81, 30, protoModule.wireTypes.lengthDelimited)
			var164, var350 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
			buff = var164
			var81 = var165
		elseif self.kind.type == "experience_refund_policy" then
			local var166 = self.kind.value:encode()
			local var167, var168 = protoModule.writeTag(buff, var81, 31, protoModule.wireTypes.lengthDelimited)
			var167, var353 = protoModule.writeBuffer(var167, var168, var166, buffer.len(var166))
			buff = var167
			var81 = var168
		elseif self.kind.type == "experience_play_with_reward" then
			local var169 = self.kind.value:encode()
			local var170, var171 = protoModule.writeTag(buff, var81, 32, protoModule.wireTypes.lengthDelimited)
			var170, var356 = protoModule.writeBuffer(var170, var171, var169, buffer.len(var169))
			buff = var170
			var81 = var171
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var172 = self.kind.value:encode()
			local var173, var174 = protoModule.writeTag(buff, var81, 33, protoModule.wireTypes.lengthDelimited)
			var173, var359 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
			buff = var173
			var81 = var174
		elseif self.kind.type == "community_section" then
			local var175 = self.kind.value:encode()
			local var176, var177 = protoModule.writeTag(buff, var81, 35, protoModule.wireTypes.lengthDelimited)
			var176, var362 = protoModule.writeBuffer(var176, var177, var175, buffer.len(var175))
			buff = var176
			var81 = var177
		elseif self.kind.type == "moments_carousel" then
			local var178 = self.kind.value:encode()
			local var179, var180 = protoModule.writeTag(buff, var81, 34, protoModule.wireTypes.lengthDelimited)
			var179, var365 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var81 = var180
		elseif self.kind.type == "text" then
			local var181 = self.kind.value:encode()
			local var182, var183 = protoModule.writeTag(buff, var81, 40, protoModule.wireTypes.lengthDelimited)
			var182, var368 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
			buff = var182
			var81 = var183
		elseif self.kind.type == "vertical_feed" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var81, 41, protoModule.wireTypes.lengthDelimited)
			var185, var371 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var81 = var186
		elseif self.kind.type == "page_header" then
			local var187 = self.kind.value:encode()
			local var188, var189 = protoModule.writeTag(buff, var81, 42, protoModule.wireTypes.lengthDelimited)
			var188, var374 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var81 = var189
		elseif self.kind.type == "image_cta_section" then
			local var190 = self.kind.value:encode()
			local var191, var192 = protoModule.writeTag(buff, var81, 43, protoModule.wireTypes.lengthDelimited)
			var191, var377 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
			buff = var191
			var81 = var192
		elseif self.kind.type == "experience_details_feed" then
			local var193 = self.kind.value:encode()
			local var194, var195 = protoModule.writeTag(buff, var81, 500, protoModule.wireTypes.lengthDelimited)
			var194, var380 = protoModule.writeBuffer(var194, var195, var193, buffer.len(var193))
			buff = var194
			var81 = var195
		elseif self.kind.type == "experience_details_action_bar" then
			local var196 = self.kind.value:encode()
			local var197, var198 = protoModule.writeTag(buff, var81, 501, protoModule.wireTypes.lengthDelimited)
			var197, var383 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
			buff = var197
			var81 = var198
		elseif self.kind.type == "experience_details_banner_image" then
			local var199 = self.kind.value:encode()
			local var200, var201 = protoModule.writeTag(buff, var81, 502, protoModule.wireTypes.lengthDelimited)
			var200, var386 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
			buff = var200
			var81 = var201
		elseif self.kind.type == "experience_details_sticky_header" then
			local var202 = self.kind.value:encode()
			local var203, var204 = protoModule.writeTag(buff, var81, 503, protoModule.wireTypes.lengthDelimited)
			var203, var389 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
			buff = var203
			var81 = var204
		elseif self.kind.type == "event_details_feed" then
			local var205 = self.kind.value:encode()
			local var206, var207 = protoModule.writeTag(buff, var81, 600, protoModule.wireTypes.lengthDelimited)
			var206, var392 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var81 = var207
		elseif self.kind.type == "event_details_action_bar" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var81, 601, protoModule.wireTypes.lengthDelimited)
			var209, var395 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var81 = var210
		elseif self.kind.type == "event_attribution_row" then
			local var211 = self.kind.value:encode()
			local var212, var213 = protoModule.writeTag(buff, var81, 602, protoModule.wireTypes.lengthDelimited)
			var212, var398 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
			buff = var212
			var81 = var213
		elseif self.kind.type == "event_description" then
			local var214 = self.kind.value:encode()
			local var215, var216 = protoModule.writeTag(buff, var81, 603, protoModule.wireTypes.lengthDelimited)
			var215, var401 = protoModule.writeBuffer(var215, var216, var214, buffer.len(var214))
			buff = var215
			var81 = var216
		elseif self.kind.type == "event_info_table" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var81, 604, protoModule.wireTypes.lengthDelimited)
			var218, var404 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var81 = var219
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var220 = self.kind.value:encode()
			local var221, var222 = protoModule.writeTag(buff, var81, 605, protoModule.wireTypes.lengthDelimited)
			var221, var407 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var81 = var222
		elseif self.kind.type == "event_notifications_modal" then
			local var223 = self.kind.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var81, 606, protoModule.wireTypes.lengthDelimited)
			var224, var410 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var81 = var225
		elseif self.kind.type == "dev_store_feed" then
			local var226 = self.kind.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var81, 700, protoModule.wireTypes.lengthDelimited)
			var227, var413 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var81 = var228
		elseif self.kind.type == "charts_feed" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var81, 800, protoModule.wireTypes.lengthDelimited)
			var230, var416 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var81 = var231
		elseif self.kind.type == "filter_pills" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var81, 801, protoModule.wireTypes.lengthDelimited)
			var233, var419 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var81 = var234
		elseif self.kind.type == "sort_selector" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var81, 802, protoModule.wireTypes.lengthDelimited)
			var236, var422 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var81 = var237
		elseif self.kind.type == "genre_selector" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var81, 803, protoModule.wireTypes.lengthDelimited)
			var239, var425 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var81 = var240
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var81, 900, protoModule.wireTypes.lengthDelimited)
			var242, var428 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var81 = var243
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var81, 901, protoModule.wireTypes.lengthDelimited)
			var245, var431 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var81 = var246
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var81, 902, protoModule.wireTypes.lengthDelimited)
			var248, var434 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var81 = var249
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var81, 903, protoModule.wireTypes.lengthDelimited)
			var251, var437 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var81 = var252
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var81, 904, protoModule.wireTypes.lengthDelimited)
			var254, var440 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var81 = var255
		elseif self.kind.type == "catalog_item_grid" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var81, 905, protoModule.wireTypes.lengthDelimited)
			var257, var443 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var81 = var258
		elseif self.kind.type == "marketplace_offer_modal" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var81, 906, protoModule.wireTypes.lengthDelimited)
			var260, var446 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var81 = var261
		elseif self.kind.type == "search_results_feed" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var81, 1000, protoModule.wireTypes.lengthDelimited)
			var263, var449 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var81 = var264
		elseif self.kind.type == "power_search_ai_overview" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var81, 1001, protoModule.wireTypes.lengthDelimited)
			var266, var452 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var81 = var267
		elseif self.kind.type == "experience_emphasis_tile" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var81, 1002, protoModule.wireTypes.lengthDelimited)
			var269, var455 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var81 = var270
		elseif self.kind.type == "option_selector_carousel" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var81, 1100, protoModule.wireTypes.lengthDelimited)
			var272, var458 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var81 = var273
		elseif self.kind.type == "game_items_carousel" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var81, 1101, protoModule.wireTypes.lengthDelimited)
			var275, var461 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var81 = var276
		elseif self.kind.type == "hero_unit" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var81, 1102, protoModule.wireTypes.lengthDelimited)
			var278, var464 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var81 = var279
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var81, 1103, protoModule.wireTypes.lengthDelimited)
			var281, var467 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var81 = var282
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var81, 1200, protoModule.wireTypes.lengthDelimited)
			var284, var470 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var81 = var285
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var81, 1300, protoModule.wireTypes.lengthDelimited)
			var287, var473 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var81 = var288
		elseif self.kind.type == "community_announcement" then
			local var289 = self.kind.value:encode()
			local var290, var291 = protoModule.writeTag(buff, var81, 1400, protoModule.wireTypes.lengthDelimited)
			var290, var476 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
			buff = var290
			var81 = var291
		elseif self.kind.type == "settings_row" then
			local var292 = self.kind.value:encode()
			local var293, var294 = protoModule.writeTag(buff, var81, 1500, protoModule.wireTypes.lengthDelimited)
			var293, var479 = protoModule.writeBuffer(var293, var294, var292, buffer.len(var292))
			buff = var293
			var81 = var294
		end
	end
	local buff_1 = buffer.create(var81)
	buffer.copy(buff_1, 0, buff, 0, var81)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
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
			elseif var87 == 500 then
				local _ = nil
				local var164, var165 = protoModule.readBuffer(p5, var82)
				var82 = var165
				var81.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var164)
				}
			elseif var87 == 501 then
				local _ = nil
				local var166, var167 = protoModule.readBuffer(p5, var82)
				var82 = var167
				var81.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var166)
				}
			elseif var87 == 502 then
				local _ = nil
				local var168, var169 = protoModule.readBuffer(p5, var82)
				var82 = var169
				var81.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var168)
				}
			elseif var87 == 503 then
				local _ = nil
				local var170, var171 = protoModule.readBuffer(p5, var82)
				var82 = var171
				var81.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var170)
				}
			elseif var87 == 600 then
				local _ = nil
				local var172, var173 = protoModule.readBuffer(p5, var82)
				var82 = var173
				var81.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var172)
				}
			elseif var87 == 601 then
				local _ = nil
				local var174, var175 = protoModule.readBuffer(p5, var82)
				var82 = var175
				var81.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var174)
				}
			elseif var87 == 602 then
				local _ = nil
				local var176, var177 = protoModule.readBuffer(p5, var82)
				var82 = var177
				var81.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var176)
				}
			elseif var87 == 603 then
				local _ = nil
				local var178, var179 = protoModule.readBuffer(p5, var82)
				var82 = var179
				var81.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var178)
				}
			elseif var87 == 604 then
				local _ = nil
				local var180, var181 = protoModule.readBuffer(p5, var82)
				var82 = var181
				var81.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var180)
				}
			elseif var87 == 605 then
				local _ = nil
				local var182, var183 = protoModule.readBuffer(p5, var82)
				var82 = var183
				var81.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var182)
				}
			elseif var87 == 606 then
				local _ = nil
				local var184, var185 = protoModule.readBuffer(p5, var82)
				var82 = var185
				var81.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var184)
				}
			elseif var87 == 700 then
				local _ = nil
				local var186, var187 = protoModule.readBuffer(p5, var82)
				var82 = var187
				var81.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var186)
				}
			elseif var87 == 800 then
				local _ = nil
				local var188, var189 = protoModule.readBuffer(p5, var82)
				var82 = var189
				var81.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var188)
				}
			elseif var87 == 801 then
				local _ = nil
				local var190, var191 = protoModule.readBuffer(p5, var82)
				var82 = var191
				var81.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var190)
				}
			elseif var87 == 802 then
				local _ = nil
				local var192, var193 = protoModule.readBuffer(p5, var82)
				var82 = var193
				var81.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var192)
				}
			elseif var87 == 803 then
				local _ = nil
				local var194, var195 = protoModule.readBuffer(p5, var82)
				var82 = var195
				var81.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(var194)
				}
			elseif var87 == 900 then
				local _ = nil
				local var196, var197 = protoModule.readBuffer(p5, var82)
				var82 = var197
				var81.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var196)
				}
			elseif var87 == 901 then
				local _ = nil
				local var198, var199 = protoModule.readBuffer(p5, var82)
				var82 = var199
				var81.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var198)
				}
			elseif var87 == 902 then
				local _ = nil
				local var200, var201 = protoModule.readBuffer(p5, var82)
				var82 = var201
				var81.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var200)
				}
			elseif var87 == 903 then
				local _ = nil
				local var202, var203 = protoModule.readBuffer(p5, var82)
				var82 = var203
				var81.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var202)
				}
			elseif var87 == 904 then
				local _ = nil
				local var204, var205 = protoModule.readBuffer(p5, var82)
				var82 = var205
				var81.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var204)
				}
			elseif var87 == 905 then
				local _ = nil
				local var206, var207 = protoModule.readBuffer(p5, var82)
				var82 = var207
				var81.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(var206)
				}
			elseif var87 == 906 then
				local _ = nil
				local var208, var209 = protoModule.readBuffer(p5, var82)
				var82 = var209
				var81.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(var208)
				}
			elseif var87 == 1000 then
				local _ = nil
				local var210, var211 = protoModule.readBuffer(p5, var82)
				var82 = var211
				var81.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var210)
				}
			elseif var87 == 1001 then
				local _ = nil
				local var212, var213 = protoModule.readBuffer(p5, var82)
				var82 = var213
				var81.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var212)
				}
			elseif var87 == 1002 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p5, var82)
				var82 = var215
				var81.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var214)
				}
			elseif var87 == 1100 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p5, var82)
				var82 = var217
				var81.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var216)
				}
			elseif var87 == 1101 then
				local _ = nil
				local var218, var219 = protoModule.readBuffer(p5, var82)
				var82 = var219
				var81.kind = {
					type = "game_items_carousel",
					value = t.GameItemsCarouselInputData.decode(var218)
				}
			elseif var87 == 1102 then
				local _ = nil
				local var220, var221 = protoModule.readBuffer(p5, var82)
				var82 = var221
				var81.kind = {
					type = "hero_unit",
					value = t.HeroUnitInputData.decode(var220)
				}
			elseif var87 == 1103 then
				local _ = nil
				local var222, var223 = protoModule.readBuffer(p5, var82)
				var82 = var223
				var81.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(var222)
				}
			elseif var87 == 1200 then
				local _ = nil
				local var224, var225 = protoModule.readBuffer(p5, var82)
				var82 = var225
				var81.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var224)
				}
			elseif var87 == 1300 then
				local _ = nil
				local var226, var227 = protoModule.readBuffer(p5, var82)
				var82 = var227
				var81.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var226)
				}
			elseif var87 == 1400 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p5, var82)
				var82 = var229
				var81.kind = {
					type = "community_announcement",
					value = t.CommunityAnnouncementInputData.decode(var228)
				}
			elseif var87 == 1500 then
				local _ = nil
				local var230, var231 = protoModule.readBuffer(p5, var82)
				var82 = var231
				var81.kind = {
					type = "settings_row",
					value = t.SettingsRowInputData.decode(var230)
				}
			else
				local _ = nil
				local var232, var233 = protoModule.readVarInt(p5, var82)
				var82 = var233 + var232
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var234, var235 = protoModule.readFixed32(p5, var82)
			local _ = var234
			var82 = var235
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var236, var237 = protoModule.readFixed64(p5, var82)
			local _ = var236
			var82 = var237
		else
			error("Unsupported wire type: " .. var483)
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
		end
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var238 = t_5.new()
	
	if self.badges_grid ~= nil then
		var238.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var238.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var238.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var238.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var238.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var238.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var238.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var238.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var238.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var238.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var238.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var238.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var238.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var238.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var238.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var238.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var238.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var238.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var238.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var238.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var238.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var238.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var238.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var238.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var238.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var238.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var238.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var238.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var238.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var238.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var238.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var238.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var238.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var238.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var238.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var238.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var238.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var238.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var238.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var238.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var238.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var238.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var238.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var238.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var238.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var238.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var238.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var238.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var238.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var238.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var238.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var238.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var238.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var238.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var238.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var238.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var238.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var238.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var238.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var238.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var238.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var238.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var238.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var238.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var238.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var238.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var238.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var238.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.experience_details_feed ~= nil then
		var238.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var238.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var238.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var238.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var238.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var238.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var238.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var238.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var238.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var238.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var238.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var238.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var238.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var238.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var238.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var238.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var238.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var238.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var238.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var238.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var238.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var238.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var238.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var238.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var238.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var238.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var238.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var238.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var238.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var238.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var238.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var238.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var238.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var238.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var238.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var238.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var238.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var238.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var238.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var238.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var238.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var238.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var238.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var238.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var238.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var238.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var238.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var238.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var238.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var238.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var238.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var238.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var238.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var238.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var238.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var238.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var238.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var238.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var238.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var238.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var238.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var238.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var238.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var238.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	if self.community_announcement ~= nil then
		var238.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.community_announcement)
		}
	end
	if self.communityAnnouncement ~= nil then
		var238.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.communityAnnouncement)
		}
	end
	if self.settings_row ~= nil then
		var238.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settings_row)
		}
	end
	if self.settingsRow ~= nil then
		var238.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settingsRow)
		}
	end
	return var238
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
	local var238 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var239, var240 = protoModule.writeTag(buff, var238, 1, protoModule.wireTypes.lengthDelimited)
		var239, var643 = protoModule.writeString(var239, var240, self.section_title)
		buff = var239
		var238 = var240
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var241 = v:encode()
			local var242, var243 = protoModule.writeTag(buff, var238, 2, protoModule.wireTypes.lengthDelimited)
			var242, var646 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var238 = var243
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var244, var245 = protoModule.writeTag(buff, var238, 3, protoModule.wireTypes.lengthDelimited)
		var244, var648 = protoModule.writeString(var244, var245, self.collection_id)
		buff = var244
		var238 = var245
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var246, var247 = protoModule.writeTag(buff, var238, 4, protoModule.wireTypes.lengthDelimited)
		var246, var650 = protoModule.writeString(var246, var247, self.collection_position)
		buff = var246
		var238 = var247
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var248, var249 = protoModule.writeTag(buff, var238, 5, protoModule.wireTypes.lengthDelimited)
		var248, var652 = protoModule.writeString(var248, var249, self.universe_id)
		buff = var248
		var238 = var249
	end
	local buff_1 = buffer.create(var238)
	buffer.copy(buff_1, 0, buff, 0, var238)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var250 = t_6.new()
	local var251 = 0
	while var251 < buffer.len(p6) do
		local _ = nil
		local var252 = nil
		local var253, var254, var255 = protoModule.readTag(p6, var251)
		local var256 = var253
		var252 = var254
		var251 = var255
		
		if var252 == protoModule.wireTypes.varint then
			local _ = nil
			local var257, var258 = protoModule.readVarInt(p6, var251)
			local _ = var257
			var251 = var258
			continue
		end
		if var252 == protoModule.wireTypes.lengthDelimited then
			if var256 == 1 then
				local _ = nil
				local var259, var260 = protoModule.readBuffer(p6, var251)
				var251 = var260
				var250.section_title = buffer.tostring(var259)
			elseif var256 == 2 then
				local _ = nil
				local var261, var262 = protoModule.readBuffer(p6, var251)
				var251 = var262
				table.insert(var250.badges, t.BadgesGridInputData_BadgeInputData.decode(var261))
			elseif var256 == 3 then
				local _ = nil
				local var263, var264 = protoModule.readBuffer(p6, var251)
				var251 = var264
				var250.collection_id = buffer.tostring(var263)
			elseif var256 == 4 then
				local _ = nil
				local var265, var266 = protoModule.readBuffer(p6, var251)
				var251 = var266
				var250.collection_position = buffer.tostring(var265)
			elseif var256 == 5 then
				local _ = nil
				local var267, var268 = protoModule.readBuffer(p6, var251)
				var251 = var268
				var250.universe_id = buffer.tostring(var267)
			else
				local _ = nil
				local var269, var270 = protoModule.readVarInt(p6, var251)
				var251 = var270 + var269
			end
		elseif var252 == protoModule.wireTypes.i32 then
			local _ = nil
			local var271, var272 = protoModule.readFixed32(p6, var251)
			local _ = var271
			var251 = var272
		elseif var252 == protoModule.wireTypes.i64 then
			local _ = nil
			local var273, var274 = protoModule.readFixed64(p6, var251)
			local _ = var273
			var251 = var274
		else
			error("Unsupported wire type: " .. var656)
		end
	end
	return var250
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
	local var275 = t_6.new()
	
	if self.section_title ~= nil then
		var275.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var275.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var275.badges = t_1
	end
	if self.collection_id ~= nil then
		var275.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var275.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var275.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var275.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var275.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var275.universe_id = self.universeId
	end
	return var275
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
	local var276 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var277, var278 = protoModule.writeTag(buff, var276, 1, protoModule.wireTypes.lengthDelimited)
		var277, var686 = protoModule.writeString(var277, var278, self.badge_id)
		buff = var277
		var276 = var278
	end
	local buff_1 = buffer.create(var276)
	buffer.copy(buff_1, 0, buff, 0, var276)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var276 = t_7.new()
	local var277 = 0
	while var277 < buffer.len(p7) do
		local _ = nil
		local var278 = nil
		local var279, var280, var281 = protoModule.readTag(p7, var277)
		local var282 = var279
		var278 = var280
		var277 = var281
		
		if var278 == protoModule.wireTypes.varint then
			local _ = nil
			local var283, var284 = protoModule.readVarInt(p7, var277)
			local _ = var283
			var277 = var284
			continue
		end
		if var278 == protoModule.wireTypes.lengthDelimited then
			if var282 == 1 then
				local _ = nil
				local var285, var286 = protoModule.readBuffer(p7, var277)
				var277 = var286
				var276.badge_id = buffer.tostring(var285)
			else
				local _ = nil
				local var287, var288 = protoModule.readVarInt(p7, var277)
				var277 = var288 + var287
			end
		elseif var278 == protoModule.wireTypes.i32 then
			local _ = nil
			local var289, var290 = protoModule.readFixed32(p7, var277)
			local _ = var289
			var277 = var290
		elseif var278 == protoModule.wireTypes.i64 then
			local _ = nil
			local var291, var292 = protoModule.readFixed64(p7, var277)
			local _ = var291
			var277 = var292
		else
			error("Unsupported wire type: " .. var690)
		end
	end
	return var276
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
	local var293 = t_7.new()
	
	if self.badge_id ~= nil then
		var293.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var293.badge_id = self.badgeId
	end
	return var293
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
	local var293 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var294, var295 = protoModule.writeTag(buff, var293, 1, protoModule.wireTypes.lengthDelimited)
		var294, var710 = protoModule.writeString(var294, var295, self.badge_id)
		buff = var294
		var293 = var295
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var296, var297 = protoModule.writeTag(buff, var293, 2, protoModule.wireTypes.lengthDelimited)
		var296, var712 = protoModule.writeString(var296, var297, self.universe_id)
		buff = var296
		var293 = var297
	end
	if self.localized_literals ~= nil then
		local var298 = self.localized_literals:encode()
		local var299, var300 = protoModule.writeTag(buff, var293, 3, protoModule.wireTypes.lengthDelimited)
		var299, var715 = protoModule.writeBuffer(var299, var300, var298, buffer.len(var298))
		buff = var299
		var293 = var300
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var301, var302 = protoModule.writeTag(buff, var293, 4, protoModule.wireTypes.lengthDelimited)
		var301, var717 = protoModule.writeString(var301, var302, self.creator_key)
		buff = var301
		var293 = var302
	end
	local buff_1 = buffer.create(var293)
	buffer.copy(buff_1, 0, buff, 0, var293)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var293 = t_8.new()
	local var294 = 0
	while var294 < buffer.len(p8) do
		local _ = nil
		local var295 = nil
		local var296, var297, var298 = protoModule.readTag(p8, var294)
		local var299 = var296
		var295 = var297
		var294 = var298
		
		if var295 == protoModule.wireTypes.varint then
			local _ = nil
			local var300, var301 = protoModule.readVarInt(p8, var294)
			local _ = var300
			var294 = var301
			continue
		end
		if var295 == protoModule.wireTypes.lengthDelimited then
			if var299 == 1 then
				local _ = nil
				local var302, var303 = protoModule.readBuffer(p8, var294)
				var294 = var303
				var293.badge_id = buffer.tostring(var302)
			elseif var299 == 2 then
				local _ = nil
				local var304, var305 = protoModule.readBuffer(p8, var294)
				var294 = var305
				var293.universe_id = buffer.tostring(var304)
			elseif var299 == 3 then
				local _ = nil
				local var306, var307 = protoModule.readBuffer(p8, var294)
				var294 = var307
				var293.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var306)
			elseif var299 == 4 then
				local _ = nil
				local var308, var309 = protoModule.readBuffer(p8, var294)
				var294 = var309
				var293.creator_key = buffer.tostring(var308)
			else
				local _ = nil
				local var310, var311 = protoModule.readVarInt(p8, var294)
				var294 = var311 + var310
			end
		elseif var295 == protoModule.wireTypes.i32 then
			local _ = nil
			local var312, var313 = protoModule.readFixed32(p8, var294)
			local _ = var312
			var294 = var313
		elseif var295 == protoModule.wireTypes.i64 then
			local _ = nil
			local var314, var315 = protoModule.readFixed64(p8, var294)
			local _ = var314
			var294 = var315
		else
			error("Unsupported wire type: " .. var721)
		end
	end
	return var293
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
	local var316 = t_8.new()
	
	if self.badge_id ~= nil then
		var316.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var316.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var316.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var316.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var316.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var316.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var316.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var316.creator_key = self.creatorKey
	end
	return var316
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
	local var316 = 0
	
	if self.info_table ~= nil then
		local var317 = self.info_table:encode()
		local var318, var319 = protoModule.writeTag(buff, var316, 1, protoModule.wireTypes.lengthDelimited)
		var318, var748 = protoModule.writeBuffer(var318, var319, var317, buffer.len(var317))
		buff = var318
		var316 = var319
	end
	if self.action_module ~= nil then
		local var320 = self.action_module:encode()
		local var321, var322 = protoModule.writeTag(buff, var316, 2, protoModule.wireTypes.lengthDelimited)
		var321, var751 = protoModule.writeBuffer(var321, var322, var320, buffer.len(var320))
		buff = var321
		var316 = var322
	end
	if self.overflow_menu ~= nil then
		local var323 = self.overflow_menu:encode()
		local var324, var325 = protoModule.writeTag(buff, var316, 3, protoModule.wireTypes.lengthDelimited)
		var324, var754 = protoModule.writeBuffer(var324, var325, var323, buffer.len(var323))
		buff = var324
		var316 = var325
	end
	local buff_1 = buffer.create(var316)
	buffer.copy(buff_1, 0, buff, 0, var316)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var316 = t_9.new()
	local var317 = 0
	while var317 < buffer.len(p9) do
		local _ = nil
		local var318 = nil
		local var319, var320, var321 = protoModule.readTag(p9, var317)
		local var322 = var319
		var318 = var320
		var317 = var321
		
		if var318 == protoModule.wireTypes.varint then
			local _ = nil
			local var323, var324 = protoModule.readVarInt(p9, var317)
			local _ = var323
			var317 = var324
			continue
		end
		if var318 == protoModule.wireTypes.lengthDelimited then
			if var322 == 1 then
				local _ = nil
				local var325, var326 = protoModule.readBuffer(p9, var317)
				var317 = var326
				var316.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var325)
			elseif var322 == 2 then
				local _ = nil
				local var327, var328 = protoModule.readBuffer(p9, var317)
				var317 = var328
				var316.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var327)
			elseif var322 == 3 then
				local _ = nil
				local var329, var330 = protoModule.readBuffer(p9, var317)
				var317 = var330
				var316.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var329)
			else
				local _ = nil
				local var331, var332 = protoModule.readVarInt(p9, var317)
				var317 = var332 + var331
			end
		elseif var318 == protoModule.wireTypes.i32 then
			local _ = nil
			local var333, var334 = protoModule.readFixed32(p9, var317)
			local _ = var333
			var317 = var334
		elseif var318 == protoModule.wireTypes.i64 then
			local _ = nil
			local var335, var336 = protoModule.readFixed64(p9, var317)
			local _ = var335
			var317 = var336
		else
			error("Unsupported wire type: " .. var758)
		end
	end
	return var316
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
	local var337 = t_9.new()
	
	if self.info_table ~= nil then
		var337.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var337.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var337.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var337.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var337.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var337.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var337
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
	local var337 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var338, var339 = protoModule.writeTag(buff, var337, 1, protoModule.wireTypes.lengthDelimited)
		var338, var782 = protoModule.writeString(var338, var339, self.type_label)
		buff = var338
		var337 = var339
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var340, var341 = protoModule.writeTag(buff, var337, 2, protoModule.wireTypes.lengthDelimited)
		var340, var784 = protoModule.writeString(var340, var341, self.earned_label)
		buff = var340
		var337 = var341
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var342, var343 = protoModule.writeTag(buff, var337, 3, protoModule.wireTypes.lengthDelimited)
		var342, var786 = protoModule.writeString(var342, var343, self.updated_label)
		buff = var342
		var337 = var343
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var344, var345 = protoModule.writeTag(buff, var337, 4, protoModule.wireTypes.lengthDelimited)
		var344, var788 = protoModule.writeString(var344, var345, self.experience_label)
		buff = var344
		var337 = var345
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var346, var347 = protoModule.writeTag(buff, var337, 5, protoModule.wireTypes.lengthDelimited)
		var346, var790 = protoModule.writeString(var346, var347, self.rarity_label)
		buff = var346
		var337 = var347
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var348, var349 = protoModule.writeTag(buff, var337, 6, protoModule.wireTypes.lengthDelimited)
		var348, var792 = protoModule.writeString(var348, var349, self.won_yesterday_label)
		buff = var348
		var337 = var349
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var350, var351 = protoModule.writeTag(buff, var337, 7, protoModule.wireTypes.lengthDelimited)
		var350, var794 = protoModule.writeString(var350, var351, self.won_ever_label)
		buff = var350
		var337 = var351
	end
	local buff_1 = buffer.create(var337)
	buffer.copy(buff_1, 0, buff, 0, var337)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var337 = t_10.new()
	local var338 = 0
	while var338 < buffer.len(p10) do
		local _ = nil
		local var339 = nil
		local var340, var341, var342 = protoModule.readTag(p10, var338)
		local var343 = var340
		var339 = var341
		var338 = var342
		
		if var339 == protoModule.wireTypes.varint then
			local _ = nil
			local var344, var345 = protoModule.readVarInt(p10, var338)
			local _ = var344
			var338 = var345
			continue
		end
		if var339 == protoModule.wireTypes.lengthDelimited then
			if var343 == 1 then
				local _ = nil
				local var346, var347 = protoModule.readBuffer(p10, var338)
				var338 = var347
				var337.type_label = buffer.tostring(var346)
			elseif var343 == 2 then
				local _ = nil
				local var348, var349 = protoModule.readBuffer(p10, var338)
				var338 = var349
				var337.earned_label = buffer.tostring(var348)
			elseif var343 == 3 then
				local _ = nil
				local var350, var351 = protoModule.readBuffer(p10, var338)
				var338 = var351
				var337.updated_label = buffer.tostring(var350)
			elseif var343 == 4 then
				local _ = nil
				local var352, var353 = protoModule.readBuffer(p10, var338)
				var338 = var353
				var337.experience_label = buffer.tostring(var352)
			elseif var343 == 5 then
				local _ = nil
				local var354, var355 = protoModule.readBuffer(p10, var338)
				var338 = var355
				var337.rarity_label = buffer.tostring(var354)
			elseif var343 == 6 then
				local _ = nil
				local var356, var357 = protoModule.readBuffer(p10, var338)
				var338 = var357
				var337.won_yesterday_label = buffer.tostring(var356)
			elseif var343 == 7 then
				local _ = nil
				local var358, var359 = protoModule.readBuffer(p10, var338)
				var338 = var359
				var337.won_ever_label = buffer.tostring(var358)
			else
				local _ = nil
				local var360, var361 = protoModule.readVarInt(p10, var338)
				var338 = var361 + var360
			end
		elseif var339 == protoModule.wireTypes.i32 then
			local _ = nil
			local var362, var363 = protoModule.readFixed32(p10, var338)
			local _ = var362
			var338 = var363
		elseif var339 == protoModule.wireTypes.i64 then
			local _ = nil
			local var364, var365 = protoModule.readFixed64(p10, var338)
			local _ = var364
			var338 = var365
		else
			error("Unsupported wire type: " .. var798)
		end
	end
	return var337
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
	local var366 = t_10.new()
	
	if self.type_label ~= nil then
		var366.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var366.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var366.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var366.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var366.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var366.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var366.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var366.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var366.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var366.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var366.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var366.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var366.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var366.won_ever_label = self.wonEverLabel
	end
	return var366
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
	local var366 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var367, var368 = protoModule.writeTag(buff, var366, 1, protoModule.wireTypes.lengthDelimited)
		var367, var830 = protoModule.writeString(var367, var368, self.share)
		buff = var367
		var366 = var368
	end
	if self.report ~= nil and self.report ~= "" then
		local var369, var370 = protoModule.writeTag(buff, var366, 2, protoModule.wireTypes.lengthDelimited)
		var369, var832 = protoModule.writeString(var369, var370, self.report)
		buff = var369
		var366 = var370
	end
	local buff_1 = buffer.create(var366)
	buffer.copy(buff_1, 0, buff, 0, var366)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var366 = t_11.new()
	local var367 = 0
	while var367 < buffer.len(p11) do
		local _ = nil
		local var368 = nil
		local var369, var370, var371 = protoModule.readTag(p11, var367)
		local var372 = var369
		var368 = var370
		var367 = var371
		
		if var368 == protoModule.wireTypes.varint then
			local _ = nil
			local var373, var374 = protoModule.readVarInt(p11, var367)
			local _ = var373
			var367 = var374
			continue
		end
		if var368 == protoModule.wireTypes.lengthDelimited then
			if var372 == 1 then
				local _ = nil
				local var375, var376 = protoModule.readBuffer(p11, var367)
				var367 = var376
				var366.share = buffer.tostring(var375)
			elseif var372 == 2 then
				local _ = nil
				local var377, var378 = protoModule.readBuffer(p11, var367)
				var367 = var378
				var366.report = buffer.tostring(var377)
			else
				local _ = nil
				local var379, var380 = protoModule.readVarInt(p11, var367)
				var367 = var380 + var379
			end
		elseif var368 == protoModule.wireTypes.i32 then
			local _ = nil
			local var381, var382 = protoModule.readFixed32(p11, var367)
			local _ = var381
			var367 = var382
		elseif var368 == protoModule.wireTypes.i64 then
			local _ = nil
			local var383, var384 = protoModule.readFixed64(p11, var367)
			local _ = var383
			var367 = var384
		else
			error("Unsupported wire type: " .. var836)
		end
	end
	return var366
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
	local var385 = t_11.new()
	
	if self.share ~= nil then
		var385.share = self.share
	end
	if self.report ~= nil then
		var385.report = self.report
	end
	return var385
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
	local var385 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var386, var387 = protoModule.writeTag(buff, var385, 1, protoModule.wireTypes.lengthDelimited)
		var386, var858 = protoModule.writeString(var386, var387, self.report)
		buff = var386
		var385 = var387
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var388, var389 = protoModule.writeTag(buff, var385, 2, protoModule.wireTypes.lengthDelimited)
		var388, var860 = protoModule.writeString(var388, var389, self.remove)
		buff = var388
		var385 = var389
	end
	local buff_1 = buffer.create(var385)
	buffer.copy(buff_1, 0, buff, 0, var385)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var385 = t_12.new()
	local var386 = 0
	while var386 < buffer.len(p12) do
		local _ = nil
		local var387 = nil
		local var388, var389, var390 = protoModule.readTag(p12, var386)
		local var391 = var388
		var387 = var389
		var386 = var390
		
		if var387 == protoModule.wireTypes.varint then
			local _ = nil
			local var392, var393 = protoModule.readVarInt(p12, var386)
			local _ = var392
			var386 = var393
			continue
		end
		if var387 == protoModule.wireTypes.lengthDelimited then
			if var391 == 1 then
				local _ = nil
				local var394, var395 = protoModule.readBuffer(p12, var386)
				var386 = var395
				var385.report = buffer.tostring(var394)
			elseif var391 == 2 then
				local _ = nil
				local var396, var397 = protoModule.readBuffer(p12, var386)
				var386 = var397
				var385.remove = buffer.tostring(var396)
			else
				local _ = nil
				local var398, var399 = protoModule.readVarInt(p12, var386)
				var386 = var399 + var398
			end
		elseif var387 == protoModule.wireTypes.i32 then
			local _ = nil
			local var400, var401 = protoModule.readFixed32(p12, var386)
			local _ = var400
			var386 = var401
		elseif var387 == protoModule.wireTypes.i64 then
			local _ = nil
			local var402, var403 = protoModule.readFixed64(p12, var386)
			local _ = var402
			var386 = var403
		else
			error("Unsupported wire type: " .. var864)
		end
	end
	return var385
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
	local var404 = t_12.new()
	
	if self.report ~= nil then
		var404.report = self.report
	end
	if self.remove ~= nil then
		var404.remove = self.remove
	end
	return var404
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
	local var404 = t_13.new()
	local var405 = 0
	while var405 < buffer.len(p13) do
		local var406 = nil
		local _ = nil
		local var407, var408, var409 = protoModule.readTag(p13, var405)
		var406 = var407
		local var410 = var408
		var405 = var409
		
		if var410 == protoModule.wireTypes.varint then
			local _ = nil
			local var411, var412 = protoModule.readVarInt(p13, var405)
			local _ = var411
			var405 = var412
		elseif var410 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var413, var414 = protoModule.readVarInt(p13, var405)
			var405 = var414 + var413
		elseif var410 == protoModule.wireTypes.i32 then
			local _ = nil
			local var415, var416 = protoModule.readFixed32(p13, var405)
			local _ = var415
			var405 = var416
		elseif var410 == protoModule.wireTypes.i64 then
			local _ = nil
			local var417, var418 = protoModule.readFixed64(p13, var405)
			local _ = var417
			var405 = var418
		else
			error("Unsupported wire type: " .. var890)
		end
	end
	return var404
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
	local var419 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var420, var421 = protoModule.writeTag(buff, var419, 1, protoModule.wireTypes.lengthDelimited)
		var420, var902 = protoModule.writeString(var420, var421, self.universe_id)
		buff = var420
		var419 = var421
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var422, var423 = protoModule.writeTag(buff, var419, 2, protoModule.wireTypes.lengthDelimited)
		var422, var904 = protoModule.writeString(var422, var423, self.creator_key)
		buff = var422
		var419 = var423
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var424, var425 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var424, var906 = protoModule.writeString(var424, var425, i)
			local var426 = v:encode()
			var425, var908 = protoModule.writeTag(var424, var425, 2, protoModule.wireTypes.lengthDelimited)
			var425, var908 = protoModule.writeBuffer(var425, var908, var426, buffer.len(var426))
			local var427 = var425
			local var428 = var908
			local var429, var430 = protoModule.writeTag(buff, var419, 3, protoModule.wireTypes.lengthDelimited)
			var429, var912 = protoModule.writeBuffer(var429, var430, var427, var428)
			buff = var429
			var419 = var430
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var431, var432 = protoModule.writeTag(buff, var419, 4, protoModule.wireTypes.lengthDelimited)
			var431, var914 = protoModule.writeString(var431, var432, v)
			buff = var431
			var419 = var432
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var433, var434 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var433, var916 = protoModule.writeString(var433, var434, i)
			local var435 = v:encode()
			var434, var918 = protoModule.writeTag(var433, var434, 2, protoModule.wireTypes.lengthDelimited)
			var434, var918 = protoModule.writeBuffer(var434, var918, var435, buffer.len(var435))
			local var436 = var434
			local var437 = var918
			local var438, var439 = protoModule.writeTag(buff, var419, 5, protoModule.wireTypes.lengthDelimited)
			var438, var922 = protoModule.writeBuffer(var438, var439, var436, var437)
			buff = var438
			var419 = var439
		end
	end
	local buff_1 = buffer.create(var419)
	buffer.copy(buff_1, 0, buff, 0, var419)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var440 = t_14.new()
	local var441 = 0
	while var441 < buffer.len(p14) do
		local _ = nil
		local var442 = nil
		local var443, var444, var445 = protoModule.readTag(p14, var441)
		local var446 = var443
		var442 = var444
		var441 = var445
		
		if var442 == protoModule.wireTypes.varint then
			local _ = nil
			local var447, var448 = protoModule.readVarInt(p14, var441)
			local _ = var447
			var441 = var448
			continue
		end
		if var442 == protoModule.wireTypes.lengthDelimited then
			if var446 == 1 then
				local _ = nil
				local var449, var450 = protoModule.readBuffer(p14, var441)
				var441 = var450
				var440.universe_id = buffer.tostring(var449)
			elseif var446 == 2 then
				local _ = nil
				local var451, var452 = protoModule.readBuffer(p14, var441)
				var441 = var452
				var440.creator_key = buffer.tostring(var451)
			elseif var446 == 3 then
				local _ = nil
				local var453, var454 = protoModule.readBuffer(p14, var441)
				var441 = var454
				var453 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var453)
				var440.entry_map[var453.key or ""] = var453.value or t.FeedEntry.new()
			elseif var446 == 4 then
				local _ = nil
				local var455, var456 = protoModule.readBuffer(p14, var441)
				var441 = var456
				table.insert(var440.entry_order, buffer.tostring(var455))
			elseif var446 == 5 then
				local _ = nil
				local var457, var458 = protoModule.readBuffer(p14, var441)
				var441 = var458
				var457 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var457)
				var440.entry_order_map[var457.key or ""] = var457.value or t.EntryOrder.new()
			else
				local _ = nil
				local var459, var460 = protoModule.readVarInt(p14, var441)
				var441 = var460 + var459
			end
		elseif var442 == protoModule.wireTypes.i32 then
			local _ = nil
			local var461, var462 = protoModule.readFixed32(p14, var441)
			local _ = var461
			var441 = var462
		elseif var442 == protoModule.wireTypes.i64 then
			local _ = nil
			local var463, var464 = protoModule.readFixed64(p14, var441)
			local _ = var463
			var441 = var464
		else
			error("Unsupported wire type: " .. var926)
		end
	end
	return var440
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
	local var465 = t_14.new()
	
	if self.universe_id ~= nil then
		var465.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var465.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var465.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var465.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var465.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var465.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var465.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var465.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var465.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var465.entry_order_map = t_1
	end
	return var465
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
	local var466 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var467, var468 = protoModule.writeTag(buff, var466, 1, protoModule.wireTypes.lengthDelimited)
		var467, var963 = protoModule.writeString(var467, var468, self.key)
		buff = var467
		var466 = var468
	end
	if self.value ~= nil then
		local var469 = self.value:encode()
		local var470, var471 = protoModule.writeTag(buff, var466, 2, protoModule.wireTypes.lengthDelimited)
		var470, var966 = protoModule.writeBuffer(var470, var471, var469, buffer.len(var469))
		buff = var470
		var466 = var471
	end
	local buff_1 = buffer.create(var466)
	buffer.copy(buff_1, 0, buff, 0, var466)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var466 = t_15.new()
	local var467 = 0
	while var467 < buffer.len(p15) do
		local _ = nil
		local var468 = nil
		local var469, var470, var471 = protoModule.readTag(p15, var467)
		local var472 = var469
		var468 = var470
		var467 = var471
		
		if var468 == protoModule.wireTypes.varint then
			local _ = nil
			local var473, var474 = protoModule.readVarInt(p15, var467)
			local _ = var473
			var467 = var474
			continue
		end
		if var468 == protoModule.wireTypes.lengthDelimited then
			if var472 == 1 then
				local _ = nil
				local var475, var476 = protoModule.readBuffer(p15, var467)
				var467 = var476
				var466.key = buffer.tostring(var475)
			elseif var472 == 2 then
				local _ = nil
				local var477, var478 = protoModule.readBuffer(p15, var467)
				var467 = var478
				var466.value = t.FeedEntry.decode(var477)
			else
				local _ = nil
				local var479, var480 = protoModule.readVarInt(p15, var467)
				var467 = var480 + var479
			end
		elseif var468 == protoModule.wireTypes.i32 then
			local _ = nil
			local var481, var482 = protoModule.readFixed32(p15, var467)
			local _ = var481
			var467 = var482
		elseif var468 == protoModule.wireTypes.i64 then
			local _ = nil
			local var483, var484 = protoModule.readFixed64(p15, var467)
			local _ = var483
			var467 = var484
		else
			error("Unsupported wire type: " .. var970)
		end
	end
	return var466
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
	local var485 = t_15.new()
	
	if self.key ~= nil then
		var485.key = self.key
	end
	if self.value ~= nil then
		var485.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var485
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
	local var485 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var486, var487 = protoModule.writeTag(buff, var485, 1, protoModule.wireTypes.lengthDelimited)
		var486, var992 = protoModule.writeString(var486, var487, self.key)
		buff = var486
		var485 = var487
	end
	if self.value ~= nil then
		local var488 = self.value:encode()
		local var489, var490 = protoModule.writeTag(buff, var485, 2, protoModule.wireTypes.lengthDelimited)
		var489, var995 = protoModule.writeBuffer(var489, var490, var488, buffer.len(var488))
		buff = var489
		var485 = var490
	end
	local buff_1 = buffer.create(var485)
	buffer.copy(buff_1, 0, buff, 0, var485)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var485 = t_16.new()
	local var486 = 0
	while var486 < buffer.len(p16) do
		local _ = nil
		local var487 = nil
		local var488, var489, var490 = protoModule.readTag(p16, var486)
		local var491 = var488
		var487 = var489
		var486 = var490
		
		if var487 == protoModule.wireTypes.varint then
			local _ = nil
			local var492, var493 = protoModule.readVarInt(p16, var486)
			local _ = var492
			var486 = var493
			continue
		end
		if var487 == protoModule.wireTypes.lengthDelimited then
			if var491 == 1 then
				local _ = nil
				local var494, var495 = protoModule.readBuffer(p16, var486)
				var486 = var495
				var485.key = buffer.tostring(var494)
			elseif var491 == 2 then
				local _ = nil
				local var496, var497 = protoModule.readBuffer(p16, var486)
				var486 = var497
				var485.value = t.EntryOrder.decode(var496)
			else
				local _ = nil
				local var498, var499 = protoModule.readVarInt(p16, var486)
				var486 = var499 + var498
			end
		elseif var487 == protoModule.wireTypes.i32 then
			local _ = nil
			local var500, var501 = protoModule.readFixed32(p16, var486)
			local _ = var500
			var486 = var501
		elseif var487 == protoModule.wireTypes.i64 then
			local _ = nil
			local var502, var503 = protoModule.readFixed64(p16, var486)
			local _ = var502
			var486 = var503
		else
			error("Unsupported wire type: " .. var999)
		end
	end
	return var485
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
	local var504 = t_16.new()
	
	if self.key ~= nil then
		var504.key = self.key
	end
	if self.value ~= nil then
		var504.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var504
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
	local var504 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var505, var506 = protoModule.writeTag(buff, var504, 1, protoModule.wireTypes.lengthDelimited)
			var505, var1021 = protoModule.writeString(var505, var506, v)
			buff = var505
			var504 = var506
		end
	end
	local buff_1 = buffer.create(var504)
	buffer.copy(buff_1, 0, buff, 0, var504)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var507 = t_17.new()
	local var508 = 0
	while var508 < buffer.len(p17) do
		local _ = nil
		local var509 = nil
		local var510, var511, var512 = protoModule.readTag(p17, var508)
		local var513 = var510
		var509 = var511
		var508 = var512
		
		if var509 == protoModule.wireTypes.varint then
			local _ = nil
			local var514, var515 = protoModule.readVarInt(p17, var508)
			local _ = var514
			var508 = var515
			continue
		end
		if var509 == protoModule.wireTypes.lengthDelimited then
			if var513 == 1 then
				local _ = nil
				local var516, var517 = protoModule.readBuffer(p17, var508)
				var508 = var517
				table.insert(var507.items, buffer.tostring(var516))
			else
				local _ = nil
				local var518, var519 = protoModule.readVarInt(p17, var508)
				var508 = var519 + var518
			end
		elseif var509 == protoModule.wireTypes.i32 then
			local _ = nil
			local var520, var521 = protoModule.readFixed32(p17, var508)
			local _ = var520
			var508 = var521
		elseif var509 == protoModule.wireTypes.i64 then
			local _ = nil
			local var522, var523 = protoModule.readFixed64(p17, var508)
			local _ = var522
			var508 = var523
		else
			error("Unsupported wire type: " .. var1025)
		end
	end
	return var507
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
	local var524 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var524.items = t
	end
	return var524
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
	local var525 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var526, var527 = protoModule.writeTag(buff, var525, 1, protoModule.wireTypes.lengthDelimited)
		var526, var1047 = protoModule.writeString(var526, var527, self.universe_id)
		buff = var526
		var525 = var527
	end
	if self.user_owns_experience then
		local var528, var529 = protoModule.writeTag(buff, var525, 2, protoModule.wireTypes.varint)
		var528, var1049 = protoModule.writeVarInt(var528, var529, if self.user_owns_experience then 1 else 0)
		buff = var528
		var525 = var529
	end
	local buff_1 = buffer.create(var525)
	buffer.copy(buff_1, 0, buff, 0, var525)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var525 = t_18.new()
	local var526 = 0
	while var526 < buffer.len(p18) do
		local _ = nil
		local var527 = nil
		local var528, var529, var530 = protoModule.readTag(p18, var526)
		local var531 = var528
		var527 = var529
		var526 = var530
		
		if var527 == protoModule.wireTypes.varint then
			if var531 == 2 then
				local _ = nil
				local var532, var533 = protoModule.readVarInt(p18, var526)
				var526 = var533
				var525.user_owns_experience = var532 ~= 0
			else
				local _ = nil
				local var534, var535 = protoModule.readVarInt(p18, var526)
				local _ = var534
				var526 = var535
			end
		end
		if var527 == protoModule.wireTypes.lengthDelimited then
			if var531 == 1 then
				local _ = nil
				local var536, var537 = protoModule.readBuffer(p18, var526)
				var526 = var537
				var525.universe_id = buffer.tostring(var536)
			else
				local _ = nil
				local var538, var539 = protoModule.readVarInt(p18, var526)
				var526 = var539 + var538
			end
		elseif var527 == protoModule.wireTypes.i32 then
			local _ = nil
			local var540, var541 = protoModule.readFixed32(p18, var526)
			local _ = var540
			var526 = var541
		elseif var527 == protoModule.wireTypes.i64 then
			local _ = nil
			local var542, var543 = protoModule.readFixed64(p18, var526)
			local _ = var542
			var526 = var543
		else
			error("Unsupported wire type: " .. var1053)
		end
	end
	return var525
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
	local var544 = t_18.new()
	
	if self.universe_id ~= nil then
		var544.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var544.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var544.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var544.user_owns_experience = self.userOwnsExperience
	end
	return var544
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
	local var544 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var545, var546 = protoModule.writeTag(buff, var544, 1, protoModule.wireTypes.lengthDelimited)
		var545, var1075 = protoModule.writeString(var545, var546, self.media_asset_id)
		buff = var545
		var544 = var546
	end
	local buff_1 = buffer.create(var544)
	buffer.copy(buff_1, 0, buff, 0, var544)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var544 = t_19.new()
	local var545 = 0
	while var545 < buffer.len(p19) do
		local _ = nil
		local var546 = nil
		local var547, var548, var549 = protoModule.readTag(p19, var545)
		local var550 = var547
		var546 = var548
		var545 = var549
		
		if var546 == protoModule.wireTypes.varint then
			local _ = nil
			local var551, var552 = protoModule.readVarInt(p19, var545)
			local _ = var551
			var545 = var552
			continue
		end
		if var546 == protoModule.wireTypes.lengthDelimited then
			if var550 == 1 then
				local _ = nil
				local var553, var554 = protoModule.readBuffer(p19, var545)
				var545 = var554
				var544.media_asset_id = buffer.tostring(var553)
			else
				local _ = nil
				local var555, var556 = protoModule.readVarInt(p19, var545)
				var545 = var556 + var555
			end
		elseif var546 == protoModule.wireTypes.i32 then
			local _ = nil
			local var557, var558 = protoModule.readFixed32(p19, var545)
			local _ = var557
			var545 = var558
		elseif var546 == protoModule.wireTypes.i64 then
			local _ = nil
			local var559, var560 = protoModule.readFixed64(p19, var545)
			local _ = var559
			var545 = var560
		else
			error("Unsupported wire type: " .. var1079)
		end
	end
	return var544
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
	local var561 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var561.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var561.media_asset_id = self.mediaAssetId
	end
	return var561
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
	local var561 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var562, var563 = protoModule.writeTag(buff, var561, 1, protoModule.wireTypes.lengthDelimited)
		var562, var1099 = protoModule.writeString(var562, var563, self.universe_id)
		buff = var562
		var561 = var563
	end
	local buff_1 = buffer.create(var561)
	buffer.copy(buff_1, 0, buff, 0, var561)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var561 = t_20.new()
	local var562 = 0
	while var562 < buffer.len(p20) do
		local _ = nil
		local var563 = nil
		local var564, var565, var566 = protoModule.readTag(p20, var562)
		local var567 = var564
		var563 = var565
		var562 = var566
		
		if var563 == protoModule.wireTypes.varint then
			local _ = nil
			local var568, var569 = protoModule.readVarInt(p20, var562)
			local _ = var568
			var562 = var569
			continue
		end
		if var563 == protoModule.wireTypes.lengthDelimited then
			if var567 == 1 then
				local _ = nil
				local var570, var571 = protoModule.readBuffer(p20, var562)
				var562 = var571
				var561.universe_id = buffer.tostring(var570)
			else
				local _ = nil
				local var572, var573 = protoModule.readVarInt(p20, var562)
				var562 = var573 + var572
			end
		elseif var563 == protoModule.wireTypes.i32 then
			local _ = nil
			local var574, var575 = protoModule.readFixed32(p20, var562)
			local _ = var574
			var562 = var575
		elseif var563 == protoModule.wireTypes.i64 then
			local _ = nil
			local var576, var577 = protoModule.readFixed64(p20, var562)
			local _ = var576
			var562 = var577
		else
			error("Unsupported wire type: " .. var1103)
		end
	end
	return var561
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
	local var578 = t_20.new()
	
	if self.universe_id ~= nil then
		var578.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var578.universe_id = self.universeId
	end
	return var578
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
	local var578 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var579, var580 = protoModule.writeTag(buff, var578, 1, protoModule.wireTypes.lengthDelimited)
		var579, var1123 = protoModule.writeString(var579, var580, self.universe_id)
		buff = var579
		var578 = var580
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var581, var582 = protoModule.writeTag(buff, var578, 2, protoModule.wireTypes.lengthDelimited)
		var581, var1125 = protoModule.writeString(var581, var582, self.creator_key)
		buff = var581
		var578 = var582
	end
	local buff_1 = buffer.create(var578)
	buffer.copy(buff_1, 0, buff, 0, var578)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var578 = t_21.new()
	local var579 = 0
	while var579 < buffer.len(p21) do
		local _ = nil
		local var580 = nil
		local var581, var582, var583 = protoModule.readTag(p21, var579)
		local var584 = var581
		var580 = var582
		var579 = var583
		
		if var580 == protoModule.wireTypes.varint then
			local _ = nil
			local var585, var586 = protoModule.readVarInt(p21, var579)
			local _ = var585
			var579 = var586
			continue
		end
		if var580 == protoModule.wireTypes.lengthDelimited then
			if var584 == 1 then
				local _ = nil
				local var587, var588 = protoModule.readBuffer(p21, var579)
				var579 = var588
				var578.universe_id = buffer.tostring(var587)
			elseif var584 == 2 then
				local _ = nil
				local var589, var590 = protoModule.readBuffer(p21, var579)
				var579 = var590
				var578.creator_key = buffer.tostring(var589)
			else
				local _ = nil
				local var591, var592 = protoModule.readVarInt(p21, var579)
				var579 = var592 + var591
			end
		elseif var580 == protoModule.wireTypes.i32 then
			local _ = nil
			local var593, var594 = protoModule.readFixed32(p21, var579)
			local _ = var593
			var579 = var594
		elseif var580 == protoModule.wireTypes.i64 then
			local _ = nil
			local var595, var596 = protoModule.readFixed64(p21, var579)
			local _ = var595
			var579 = var596
		else
			error("Unsupported wire type: " .. var1129)
		end
	end
	return var578
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
	local var597 = t_21.new()
	
	if self.universe_id ~= nil then
		var597.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var597.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var597.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var597.creator_key = self.creatorKey
	end
	return var597
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
	local var597 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var598, var599 = protoModule.writeTag(buff, var597, 1, protoModule.wireTypes.lengthDelimited)
		var598, var1151 = protoModule.writeString(var598, var599, self.universe_id)
		buff = var598
		var597 = var599
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var600, var601 = protoModule.writeTag(buff, var597, 2, protoModule.wireTypes.lengthDelimited)
		var600, var1153 = protoModule.writeString(var600, var601, self.root_place_id)
		buff = var600
		var597 = var601
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var602, var603 = protoModule.writeTag(buff, var597, 3, protoModule.wireTypes.lengthDelimited)
		var602, var1155 = protoModule.writeString(var602, var603, self.connection_played_display_name)
		buff = var602
		var597 = var603
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var604, var605 = protoModule.writeTag(buff, var597, 4, protoModule.wireTypes.lengthDelimited)
		var604, var1157 = protoModule.writeString(var604, var605, self.upsell_prompt)
		buff = var604
		var597 = var605
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var606 = v:encode()
			local var607, var608 = protoModule.writeTag(buff, var597, 5, protoModule.wireTypes.lengthDelimited)
			var607, var1160 = protoModule.writeBuffer(var607, var608, var606, buffer.len(var606))
			buff = var607
			var597 = var608
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var609, var610 = protoModule.writeTag(buff, var597, 6, protoModule.wireTypes.varint)
		var609, var1162 = protoModule.writeVarInt(var609, var610, self.connection_played_num_others)
		buff = var609
		var597 = var610
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var611, var612 = protoModule.writeTag(buff, var597, 7, protoModule.wireTypes.varint)
		var611, var1164 = protoModule.writeVarInt(var611, var612, self.connection_played_total_count)
		buff = var611
		var597 = var612
	end
	local buff_1 = buffer.create(var597)
	buffer.copy(buff_1, 0, buff, 0, var597)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var613 = t_22.new()
	local var614 = 0
	while var614 < buffer.len(p22) do
		local _ = nil
		local var615 = nil
		local var616, var617, var618 = protoModule.readTag(p22, var614)
		local var619 = var616
		var615 = var617
		var614 = var618
		
		if var615 == protoModule.wireTypes.varint then
			if var619 == 6 then
				local _ = nil
				local var620, var621 = protoModule.readVarIntI32(p22, var614)
				var614 = var621
				var613.connection_played_num_others = var620
			elseif var619 == 7 then
				local _ = nil
				local var622, var623 = protoModule.readVarIntI32(p22, var614)
				var614 = var623
				var613.connection_played_total_count = var622
			else
				local _ = nil
				local var624, var625 = protoModule.readVarInt(p22, var614)
				local _ = var624
				var614 = var625
			end
		end
		if var615 == protoModule.wireTypes.lengthDelimited then
			if var619 == 1 then
				local _ = nil
				local var626, var627 = protoModule.readBuffer(p22, var614)
				var614 = var627
				var613.universe_id = buffer.tostring(var626)
			elseif var619 == 2 then
				local _ = nil
				local var628, var629 = protoModule.readBuffer(p22, var614)
				var614 = var629
				var613.root_place_id = buffer.tostring(var628)
			elseif var619 == 3 then
				local _ = nil
				local var630, var631 = protoModule.readBuffer(p22, var614)
				var614 = var631
				var613.connection_played_display_name = buffer.tostring(var630)
			elseif var619 == 4 then
				local _ = nil
				local var632, var633 = protoModule.readBuffer(p22, var614)
				var614 = var633
				var613.upsell_prompt = buffer.tostring(var632)
			elseif var619 == 5 then
				local _ = nil
				local var634, var635 = protoModule.readBuffer(p22, var614)
				var614 = var635
				table.insert(var613.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var634))
			else
				local _ = nil
				local var636, var637 = protoModule.readVarInt(p22, var614)
				var614 = var637 + var636
			end
		elseif var615 == protoModule.wireTypes.i32 then
			local _ = nil
			local var638, var639 = protoModule.readFixed32(p22, var614)
			local _ = var638
			var614 = var639
		elseif var615 == protoModule.wireTypes.i64 then
			local _ = nil
			local var640, var641 = protoModule.readFixed64(p22, var614)
			local _ = var640
			var614 = var641
		else
			error("Unsupported wire type: " .. var1168)
		end
	end
	return var613
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
	local var642 = t_22.new()
	
	if self.universe_id ~= nil then
		var642.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var642.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var642.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var642.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var642.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var642.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var642.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var642.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var642.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var642.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var642.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var642.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var642.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var642.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var642
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
	local var643 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var644, var645 = protoModule.writeTag(buff, var643, 1, protoModule.wireTypes.lengthDelimited)
		var644, var1203 = protoModule.writeString(var644, var645, self.user_id)
		buff = var644
		var643 = var645
	end
	local buff_1 = buffer.create(var643)
	buffer.copy(buff_1, 0, buff, 0, var643)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var643 = t_23.new()
	local var644 = 0
	while var644 < buffer.len(p23) do
		local _ = nil
		local var645 = nil
		local var646, var647, var648 = protoModule.readTag(p23, var644)
		local var649 = var646
		var645 = var647
		var644 = var648
		
		if var645 == protoModule.wireTypes.varint then
			local _ = nil
			local var650, var651 = protoModule.readVarInt(p23, var644)
			local _ = var650
			var644 = var651
			continue
		end
		if var645 == protoModule.wireTypes.lengthDelimited then
			if var649 == 1 then
				local _ = nil
				local var652, var653 = protoModule.readBuffer(p23, var644)
				var644 = var653
				var643.user_id = buffer.tostring(var652)
			else
				local _ = nil
				local var654, var655 = protoModule.readVarInt(p23, var644)
				var644 = var655 + var654
			end
		elseif var645 == protoModule.wireTypes.i32 then
			local _ = nil
			local var656, var657 = protoModule.readFixed32(p23, var644)
			local _ = var656
			var644 = var657
		elseif var645 == protoModule.wireTypes.i64 then
			local _ = nil
			local var658, var659 = protoModule.readFixed64(p23, var644)
			local _ = var658
			var644 = var659
		else
			error("Unsupported wire type: " .. var1207)
		end
	end
	return var643
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
	local var660 = t_23.new()
	
	if self.user_id ~= nil then
		var660.user_id = self.user_id
	end
	if self.userId ~= nil then
		var660.user_id = self.userId
	end
	return var660
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
	local var660 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var661 = v:encode()
			local var662, var663 = protoModule.writeTag(buff, var660, 1, protoModule.wireTypes.lengthDelimited)
			var662, var1228 = protoModule.writeBuffer(var662, var663, var661, buffer.len(var661))
			buff = var662
			var660 = var663
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var664, var665 = protoModule.writeTag(buff, var660, 2, protoModule.wireTypes.lengthDelimited)
		var664, var1230 = protoModule.writeString(var664, var665, self.universe_id)
		buff = var664
		var660 = var665
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var666, var667 = protoModule.writeTag(buff, var660, 3, protoModule.wireTypes.lengthDelimited)
		var666, var1232 = protoModule.writeString(var666, var667, self.place_id)
		buff = var666
		var660 = var667
	end
	local buff_1 = buffer.create(var660)
	buffer.copy(buff_1, 0, buff, 0, var660)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var668 = t_24.new()
	local var669 = 0
	while var669 < buffer.len(p24) do
		local _ = nil
		local var670 = nil
		local var671, var672, var673 = protoModule.readTag(p24, var669)
		local var674 = var671
		var670 = var672
		var669 = var673
		
		if var670 == protoModule.wireTypes.varint then
			local _ = nil
			local var675, var676 = protoModule.readVarInt(p24, var669)
			local _ = var675
			var669 = var676
			continue
		end
		if var670 == protoModule.wireTypes.lengthDelimited then
			if var674 == 1 then
				local _ = nil
				local var677, var678 = protoModule.readBuffer(p24, var669)
				var669 = var678
				table.insert(var668.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var677))
			elseif var674 == 2 then
				local _ = nil
				local var679, var680 = protoModule.readBuffer(p24, var669)
				var669 = var680
				var668.universe_id = buffer.tostring(var679)
			elseif var674 == 3 then
				local _ = nil
				local var681, var682 = protoModule.readBuffer(p24, var669)
				var669 = var682
				var668.place_id = buffer.tostring(var681)
			else
				local _ = nil
				local var683, var684 = protoModule.readVarInt(p24, var669)
				var669 = var684 + var683
			end
		elseif var670 == protoModule.wireTypes.i32 then
			local _ = nil
			local var685, var686 = protoModule.readFixed32(p24, var669)
			local _ = var685
			var669 = var686
		elseif var670 == protoModule.wireTypes.i64 then
			local _ = nil
			local var687, var688 = protoModule.readFixed64(p24, var669)
			local _ = var687
			var669 = var688
		else
			error("Unsupported wire type: " .. var1236)
		end
	end
	return var668
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
	local var689 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var689.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var689.media_items = t_1
	end
	if self.universe_id ~= nil then
		var689.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var689.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var689.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var689.place_id = self.placeId
	end
	return var689
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
	local var690 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var691, var692 = protoModule.writeTag(buff, var690, 1, protoModule.wireTypes.lengthDelimited)
		var691, var1263 = protoModule.writeString(var691, var692, self.media_asset_id)
		buff = var691
		var690 = var692
	end
	local buff_1 = buffer.create(var690)
	buffer.copy(buff_1, 0, buff, 0, var690)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref)
	local var690 = t_25.new()
	local var691 = 0
	while var691 < buffer.len(p25) do
		local _ = nil
		local var692 = nil
		local var693, var694, var695 = protoModule.readTag(p25, var691)
		local var696 = var693
		var692 = var694
		var691 = var695
		
		if var692 == protoModule.wireTypes.varint then
			local _ = nil
			local var697, var698 = protoModule.readVarInt(p25, var691)
			local _ = var697
			var691 = var698
			continue
		end
		if var692 == protoModule.wireTypes.lengthDelimited then
			if var696 == 1 then
				local _ = nil
				local var699, var700 = protoModule.readBuffer(p25, var691)
				var691 = var700
				var690.media_asset_id = buffer.tostring(var699)
			else
				local _ = nil
				local var701, var702 = protoModule.readVarInt(p25, var691)
				var691 = var702 + var701
			end
		elseif var692 == protoModule.wireTypes.i32 then
			local _ = nil
			local var703, var704 = protoModule.readFixed32(p25, var691)
			local _ = var703
			var691 = var704
		elseif var692 == protoModule.wireTypes.i64 then
			local _ = nil
			local var705, var706 = protoModule.readFixed64(p25, var691)
			local _ = var705
			var691 = var706
		else
			error("Unsupported wire type: " .. var1267)
		end
	end
	return var690
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
	local var707 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var707.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var707.media_asset_id = self.mediaAssetId
	end
	return var707
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
	local var707 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var708, var709 = protoModule.writeTag(buff, var707, 1, protoModule.wireTypes.lengthDelimited)
		var708, var1287 = protoModule.writeString(var708, var709, self.universe_id)
		buff = var708
		var707 = var709
	end
	local buff_1 = buffer.create(var707)
	buffer.copy(buff_1, 0, buff, 0, var707)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var707 = t_26.new()
	local var708 = 0
	while var708 < buffer.len(p26) do
		local _ = nil
		local var709 = nil
		local var710, var711, var712 = protoModule.readTag(p26, var708)
		local var713 = var710
		var709 = var711
		var708 = var712
		
		if var709 == protoModule.wireTypes.varint then
			local _ = nil
			local var714, var715 = protoModule.readVarInt(p26, var708)
			local _ = var714
			var708 = var715
			continue
		end
		if var709 == protoModule.wireTypes.lengthDelimited then
			if var713 == 1 then
				local _ = nil
				local var716, var717 = protoModule.readBuffer(p26, var708)
				var708 = var717
				var707.universe_id = buffer.tostring(var716)
			else
				local _ = nil
				local var718, var719 = protoModule.readVarInt(p26, var708)
				var708 = var719 + var718
			end
		elseif var709 == protoModule.wireTypes.i32 then
			local _ = nil
			local var720, var721 = protoModule.readFixed32(p26, var708)
			local _ = var720
			var708 = var721
		elseif var709 == protoModule.wireTypes.i64 then
			local _ = nil
			local var722, var723 = protoModule.readFixed64(p26, var708)
			local _ = var722
			var708 = var723
		else
			error("Unsupported wire type: " .. var1291)
		end
	end
	return var707
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
	local var724 = t_26.new()
	
	if self.universe_id ~= nil then
		var724.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var724.universe_id = self.universeId
	end
	return var724
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
	local var724 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var725, var726 = protoModule.writeTag(buff, var724, 1, protoModule.wireTypes.lengthDelimited)
		var725, var1311 = protoModule.writeString(var725, var726, self.universe_id)
		buff = var725
		var724 = var726
	end
	local buff_1 = buffer.create(var724)
	buffer.copy(buff_1, 0, buff, 0, var724)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var724 = t_27.new()
	local var725 = 0
	while var725 < buffer.len(p27) do
		local _ = nil
		local var726 = nil
		local var727, var728, var729 = protoModule.readTag(p27, var725)
		local var730 = var727
		var726 = var728
		var725 = var729
		
		if var726 == protoModule.wireTypes.varint then
			local _ = nil
			local var731, var732 = protoModule.readVarInt(p27, var725)
			local _ = var731
			var725 = var732
			continue
		end
		if var726 == protoModule.wireTypes.lengthDelimited then
			if var730 == 1 then
				local _ = nil
				local var733, var734 = protoModule.readBuffer(p27, var725)
				var725 = var734
				var724.universe_id = buffer.tostring(var733)
			else
				local _ = nil
				local var735, var736 = protoModule.readVarInt(p27, var725)
				var725 = var736 + var735
			end
		elseif var726 == protoModule.wireTypes.i32 then
			local _ = nil
			local var737, var738 = protoModule.readFixed32(p27, var725)
			local _ = var737
			var725 = var738
		elseif var726 == protoModule.wireTypes.i64 then
			local _ = nil
			local var739, var740 = protoModule.readFixed64(p27, var725)
			local _ = var739
			var725 = var740
		else
			error("Unsupported wire type: " .. var1315)
		end
	end
	return var724
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
	local var741 = t_27.new()
	
	if self.universe_id ~= nil then
		var741.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var741.universe_id = self.universeId
	end
	return var741
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
	local var741 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var742, var743 = protoModule.writeTag(buff, var741, 1, protoModule.wireTypes.lengthDelimited)
		var742, var1335 = protoModule.writeString(var742, var743, self.universe_id)
		buff = var742
		var741 = var743
	end
	if self.has_store_items then
		local var744, var745 = protoModule.writeTag(buff, var741, 2, protoModule.wireTypes.varint)
		var744, var1337 = protoModule.writeVarInt(var744, var745, if self.has_store_items then 1 else 0)
		buff = var744
		var741 = var745
	end
	if self.has_badges then
		local var746, var747 = protoModule.writeTag(buff, var741, 3, protoModule.wireTypes.varint)
		var746, var1339 = protoModule.writeVarInt(var746, var747, if self.has_badges then 1 else 0)
		buff = var746
		var741 = var747
	end
	if self.has_game_passes then
		local var748, var749 = protoModule.writeTag(buff, var741, 4, protoModule.wireTypes.varint)
		var748, var1341 = protoModule.writeVarInt(var748, var749, if self.has_game_passes then 1 else 0)
		buff = var748
		var741 = var749
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var750, var751 = protoModule.writeTag(buff, var741, 5, protoModule.wireTypes.lengthDelimited)
		var750, var1343 = protoModule.writeString(var750, var751, self.community_id)
		buff = var750
		var741 = var751
	end
	local buff_1 = buffer.create(var741)
	buffer.copy(buff_1, 0, buff, 0, var741)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var741 = t_28.new()
	local var742 = 0
	while var742 < buffer.len(p28) do
		local _ = nil
		local var743 = nil
		local var744, var745, var746 = protoModule.readTag(p28, var742)
		local var747 = var744
		var743 = var745
		var742 = var746
		
		if var743 == protoModule.wireTypes.varint then
			if var747 == 2 then
				local _ = nil
				local var748, var749 = protoModule.readVarInt(p28, var742)
				var742 = var749
				var741.has_store_items = var748 ~= 0
			elseif var747 == 3 then
				local _ = nil
				local var750, var751 = protoModule.readVarInt(p28, var742)
				var742 = var751
				var741.has_badges = var750 ~= 0
			elseif var747 == 4 then
				local _ = nil
				local var752, var753 = protoModule.readVarInt(p28, var742)
				var742 = var753
				var741.has_game_passes = var752 ~= 0
			else
				local _ = nil
				local var754, var755 = protoModule.readVarInt(p28, var742)
				local _ = var754
				var742 = var755
			end
		end
		if var743 == protoModule.wireTypes.lengthDelimited then
			if var747 == 1 then
				local _ = nil
				local var756, var757 = protoModule.readBuffer(p28, var742)
				var742 = var757
				var741.universe_id = buffer.tostring(var756)
			elseif var747 == 5 then
				local _ = nil
				local var758, var759 = protoModule.readBuffer(p28, var742)
				var742 = var759
				var741.community_id = buffer.tostring(var758)
			else
				local _ = nil
				local var760, var761 = protoModule.readVarInt(p28, var742)
				var742 = var761 + var760
			end
		elseif var743 == protoModule.wireTypes.i32 then
			local _ = nil
			local var762, var763 = protoModule.readFixed32(p28, var742)
			local _ = var762
			var742 = var763
		elseif var743 == protoModule.wireTypes.i64 then
			local _ = nil
			local var764, var765 = protoModule.readFixed64(p28, var742)
			local _ = var764
			var742 = var765
		else
			error("Unsupported wire type: " .. var1347)
		end
	end
	return var741
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
	local var766 = t_28.new()
	
	if self.universe_id ~= nil then
		var766.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var766.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var766.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var766.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var766.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var766.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var766.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var766.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var766.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var766.community_id = self.communityId
	end
	return var766
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
	local var766 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var767, var768 = protoModule.writeTag(buff, var766, 1, protoModule.wireTypes.lengthDelimited)
		var767, var1375 = protoModule.writeString(var767, var768, self.universe_id)
		buff = var767
		var766 = var768
	end
	local buff_1 = buffer.create(var766)
	buffer.copy(buff_1, 0, buff, 0, var766)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var766 = t_29.new()
	local var767 = 0
	while var767 < buffer.len(p29) do
		local _ = nil
		local var768 = nil
		local var769, var770, var771 = protoModule.readTag(p29, var767)
		local var772 = var769
		var768 = var770
		var767 = var771
		
		if var768 == protoModule.wireTypes.varint then
			local _ = nil
			local var773, var774 = protoModule.readVarInt(p29, var767)
			local _ = var773
			var767 = var774
			continue
		end
		if var768 == protoModule.wireTypes.lengthDelimited then
			if var772 == 1 then
				local _ = nil
				local var775, var776 = protoModule.readBuffer(p29, var767)
				var767 = var776
				var766.universe_id = buffer.tostring(var775)
			else
				local _ = nil
				local var777, var778 = protoModule.readVarInt(p29, var767)
				var767 = var778 + var777
			end
		elseif var768 == protoModule.wireTypes.i32 then
			local _ = nil
			local var779, var780 = protoModule.readFixed32(p29, var767)
			local _ = var779
			var767 = var780
		elseif var768 == protoModule.wireTypes.i64 then
			local _ = nil
			local var781, var782 = protoModule.readFixed64(p29, var767)
			local _ = var781
			var767 = var782
		else
			error("Unsupported wire type: " .. var1379)
		end
	end
	return var766
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
	local var783 = t_29.new()
	
	if self.universe_id ~= nil then
		var783.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var783.universe_id = self.universeId
	end
	return var783
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
	local var783 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var784, var785 = protoModule.writeTag(buff, var783, 1, protoModule.wireTypes.lengthDelimited)
		var784, var1399 = protoModule.writeString(var784, var785, self.universe_id)
		buff = var784
		var783 = var785
	end
	if self.user_owns_experience then
		local var786, var787 = protoModule.writeTag(buff, var783, 2, protoModule.wireTypes.varint)
		var786, var1401 = protoModule.writeVarInt(var786, var787, if self.user_owns_experience then 1 else 0)
		buff = var786
		var783 = var787
	end
	local buff_1 = buffer.create(var783)
	buffer.copy(buff_1, 0, buff, 0, var783)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var783 = t_30.new()
	local var784 = 0
	while var784 < buffer.len(p30) do
		local _ = nil
		local var785 = nil
		local var786, var787, var788 = protoModule.readTag(p30, var784)
		local var789 = var786
		var785 = var787
		var784 = var788
		
		if var785 == protoModule.wireTypes.varint then
			if var789 == 2 then
				local _ = nil
				local var790, var791 = protoModule.readVarInt(p30, var784)
				var784 = var791
				var783.user_owns_experience = var790 ~= 0
			else
				local _ = nil
				local var792, var793 = protoModule.readVarInt(p30, var784)
				local _ = var792
				var784 = var793
			end
		end
		if var785 == protoModule.wireTypes.lengthDelimited then
			if var789 == 1 then
				local _ = nil
				local var794, var795 = protoModule.readBuffer(p30, var784)
				var784 = var795
				var783.universe_id = buffer.tostring(var794)
			else
				local _ = nil
				local var796, var797 = protoModule.readVarInt(p30, var784)
				var784 = var797 + var796
			end
		elseif var785 == protoModule.wireTypes.i32 then
			local _ = nil
			local var798, var799 = protoModule.readFixed32(p30, var784)
			local _ = var798
			var784 = var799
		elseif var785 == protoModule.wireTypes.i64 then
			local _ = nil
			local var800, var801 = protoModule.readFixed64(p30, var784)
			local _ = var800
			var784 = var801
		else
			error("Unsupported wire type: " .. var1405)
		end
	end
	return var783
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
	local var802 = t_30.new()
	
	if self.universe_id ~= nil then
		var802.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var802.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var802.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var802.user_owns_experience = self.userOwnsExperience
	end
	return var802
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
	local var802 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var803, var804 = protoModule.writeTag(buff, var802, 1, protoModule.wireTypes.lengthDelimited)
		var803, var1427 = protoModule.writeString(var803, var804, self.universe_id)
		buff = var803
		var802 = var804
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var805, var806 = protoModule.writeTag(buff, var802, 2, protoModule.wireTypes.lengthDelimited)
		var805, var1429 = protoModule.writeString(var805, var806, self.place_id)
		buff = var805
		var802 = var806
	end
	local buff_1 = buffer.create(var802)
	buffer.copy(buff_1, 0, buff, 0, var802)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var802 = t_31.new()
	local var803 = 0
	while var803 < buffer.len(p31) do
		local _ = nil
		local var804 = nil
		local var805, var806, var807 = protoModule.readTag(p31, var803)
		local var808 = var805
		var804 = var806
		var803 = var807
		
		if var804 == protoModule.wireTypes.varint then
			local _ = nil
			local var809, var810 = protoModule.readVarInt(p31, var803)
			local _ = var809
			var803 = var810
			continue
		end
		if var804 == protoModule.wireTypes.lengthDelimited then
			if var808 == 1 then
				local _ = nil
				local var811, var812 = protoModule.readBuffer(p31, var803)
				var803 = var812
				var802.universe_id = buffer.tostring(var811)
			elseif var808 == 2 then
				local _ = nil
				local var813, var814 = protoModule.readBuffer(p31, var803)
				var803 = var814
				var802.place_id = buffer.tostring(var813)
			else
				local _ = nil
				local var815, var816 = protoModule.readVarInt(p31, var803)
				var803 = var816 + var815
			end
		elseif var804 == protoModule.wireTypes.i32 then
			local _ = nil
			local var817, var818 = protoModule.readFixed32(p31, var803)
			local _ = var817
			var803 = var818
		elseif var804 == protoModule.wireTypes.i64 then
			local _ = nil
			local var819, var820 = protoModule.readFixed64(p31, var803)
			local _ = var819
			var803 = var820
		else
			error("Unsupported wire type: " .. var1433)
		end
	end
	return var802
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
	local var821 = t_31.new()
	
	if self.universe_id ~= nil then
		var821.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var821.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var821.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var821.place_id = self.placeId
	end
	return var821
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
	local var821 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var822, var823 = protoModule.writeTag(buff, var821, 1, protoModule.wireTypes.lengthDelimited)
		var822, var1455 = protoModule.writeString(var822, var823, self.community_id)
		buff = var822
		var821 = var823
	end
	local buff_1 = buffer.create(var821)
	buffer.copy(buff_1, 0, buff, 0, var821)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var821 = t_32.new()
	local var822 = 0
	while var822 < buffer.len(p32) do
		local _ = nil
		local var823 = nil
		local var824, var825, var826 = protoModule.readTag(p32, var822)
		local var827 = var824
		var823 = var825
		var822 = var826
		
		if var823 == protoModule.wireTypes.varint then
			local _ = nil
			local var828, var829 = protoModule.readVarInt(p32, var822)
			local _ = var828
			var822 = var829
			continue
		end
		if var823 == protoModule.wireTypes.lengthDelimited then
			if var827 == 1 then
				local _ = nil
				local var830, var831 = protoModule.readBuffer(p32, var822)
				var822 = var831
				var821.community_id = buffer.tostring(var830)
			else
				local _ = nil
				local var832, var833 = protoModule.readVarInt(p32, var822)
				var822 = var833 + var832
			end
		elseif var823 == protoModule.wireTypes.i32 then
			local _ = nil
			local var834, var835 = protoModule.readFixed32(p32, var822)
			local _ = var834
			var822 = var835
		elseif var823 == protoModule.wireTypes.i64 then
			local _ = nil
			local var836, var837 = protoModule.readFixed64(p32, var822)
			local _ = var836
			var822 = var837
		else
			error("Unsupported wire type: " .. var1459)
		end
	end
	return var821
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
	local var838 = t_32.new()
	
	if self.community_id ~= nil then
		var838.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var838.community_id = self.communityId
	end
	return var838
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
	local var838 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var839 = v:encode()
			local var840, var841 = protoModule.writeTag(buff, var838, 1, protoModule.wireTypes.lengthDelimited)
			var840, var1480 = protoModule.writeBuffer(var840, var841, var839, buffer.len(var839))
			buff = var840
			var838 = var841
		end
	end
	local buff_1 = buffer.create(var838)
	buffer.copy(buff_1, 0, buff, 0, var838)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var842 = t_33.new()
	local var843 = 0
	while var843 < buffer.len(p33) do
		local _ = nil
		local var844 = nil
		local var845, var846, var847 = protoModule.readTag(p33, var843)
		local var848 = var845
		var844 = var846
		var843 = var847
		
		if var844 == protoModule.wireTypes.varint then
			local _ = nil
			local var849, var850 = protoModule.readVarInt(p33, var843)
			local _ = var849
			var843 = var850
			continue
		end
		if var844 == protoModule.wireTypes.lengthDelimited then
			if var848 == 1 then
				local _ = nil
				local var851, var852 = protoModule.readBuffer(p33, var843)
				var843 = var852
				table.insert(var842.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var851))
			else
				local _ = nil
				local var853, var854 = protoModule.readVarInt(p33, var843)
				var843 = var854 + var853
			end
		elseif var844 == protoModule.wireTypes.i32 then
			local _ = nil
			local var855, var856 = protoModule.readFixed32(p33, var843)
			local _ = var855
			var843 = var856
		elseif var844 == protoModule.wireTypes.i64 then
			local _ = nil
			local var857, var858 = protoModule.readFixed64(p33, var843)
			local _ = var857
			var843 = var858
		else
			error("Unsupported wire type: " .. var1484)
		end
	end
	return var842
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
	local var859 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var859.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var859.social_link_items = t_1
	end
	return var859
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
	local var860 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var861, var862 = protoModule.writeTag(buff, var860, 1, protoModule.wireTypes.lengthDelimited)
		var861, var1507 = protoModule.writeString(var861, var862, self.social_link_id)
		buff = var861
		var860 = var862
	end
	local buff_1 = buffer.create(var860)
	buffer.copy(buff_1, 0, buff, 0, var860)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref)
	local var860 = t_34.new()
	local var861 = 0
	while var861 < buffer.len(p34) do
		local _ = nil
		local var862 = nil
		local var863, var864, var865 = protoModule.readTag(p34, var861)
		local var866 = var863
		var862 = var864
		var861 = var865
		
		if var862 == protoModule.wireTypes.varint then
			local _ = nil
			local var867, var868 = protoModule.readVarInt(p34, var861)
			local _ = var867
			var861 = var868
			continue
		end
		if var862 == protoModule.wireTypes.lengthDelimited then
			if var866 == 1 then
				local _ = nil
				local var869, var870 = protoModule.readBuffer(p34, var861)
				var861 = var870
				var860.social_link_id = buffer.tostring(var869)
			else
				local _ = nil
				local var871, var872 = protoModule.readVarInt(p34, var861)
				var861 = var872 + var871
			end
		elseif var862 == protoModule.wireTypes.i32 then
			local _ = nil
			local var873, var874 = protoModule.readFixed32(p34, var861)
			local _ = var873
			var861 = var874
		elseif var862 == protoModule.wireTypes.i64 then
			local _ = nil
			local var875, var876 = protoModule.readFixed64(p34, var861)
			local _ = var875
			var861 = var876
		else
			error("Unsupported wire type: " .. var1511)
		end
	end
	return var860
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
	local var877 = t_34.new()
	
	if self.social_link_id ~= nil then
		var877.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var877.social_link_id = self.socialLinkId
	end
	return var877
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
		anchor_tag = if p35 == nil or p35.anchor_tag == nil then nil else p35.anchor_tag
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var877 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var878, var879 = protoModule.writeTag(buff, var877, 1, protoModule.wireTypes.lengthDelimited)
		var878, var1531 = protoModule.writeString(var878, var879, self.title)
		buff = var878
		var877 = var879
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var880 = v:encode()
			local var881, var882 = protoModule.writeTag(buff, var877, 2, protoModule.wireTypes.lengthDelimited)
			var881, var1534 = protoModule.writeBuffer(var881, var882, var880, buffer.len(var880))
			buff = var881
			var877 = var882
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var883, var884 = protoModule.writeTag(buff, var877, 3, protoModule.wireTypes.lengthDelimited)
		var883, var1536 = protoModule.writeString(var883, var884, self.next_page_token)
		buff = var883
		var877 = var884
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var885, var886 = protoModule.writeTag(buff, var877, 4, protoModule.wireTypes.lengthDelimited)
		var885, var1538 = protoModule.writeString(var885, var886, self.sort_id)
		buff = var885
		var877 = var886
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var887, var888 = protoModule.writeTag(buff, var877, 5, protoModule.wireTypes.varint)
		var887, var1540 = protoModule.writeVarInt(var887, var888, self.secondary_sort_id)
		buff = var887
		var877 = var888
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var889, var890 = protoModule.writeTag(buff, var877, 6, protoModule.wireTypes.varint)
		var889, var1542 = protoModule.writeVarInt(var889, var890, self.max_visible_rows)
		buff = var889
		var877 = var890
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var891, var892 = protoModule.writeTag(buff, var877, 7, protoModule.wireTypes.lengthDelimited)
		var891, var1544 = protoModule.writeString(var891, var892, self.subtitle)
		buff = var891
		var877 = var892
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var893, var894 = protoModule.writeTag(buff, var877, 8, protoModule.wireTypes.lengthDelimited)
		var893, var1546 = protoModule.writeString(var893, var894, self.info_text)
		buff = var893
		var877 = var894
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var895, var896 = protoModule.writeTag(buff, var877, 9, protoModule.wireTypes.lengthDelimited)
		var895, var1548 = protoModule.writeString(var895, var896, self.subtitle_link_path)
		buff = var895
		var877 = var896
	end
	if self.is_placeholder ~= nil then
		local var897, var898 = protoModule.writeTag(buff, var877, 10, protoModule.wireTypes.varint)
		var897, var1550 = protoModule.writeVarInt(var897, var898, if self.is_placeholder then 1 else 0)
		buff = var897
		var877 = var898
	end
	if self.primary_sort_id ~= nil then
		local var899, var900 = protoModule.writeTag(buff, var877, 11, protoModule.wireTypes.varint)
		var899, var1552 = protoModule.writeVarInt(var899, var900, self.primary_sort_id)
		buff = var899
		var877 = var900
	end
	if self.applied_filters ~= nil then
		local var901, var902 = protoModule.writeTag(buff, var877, 12, protoModule.wireTypes.lengthDelimited)
		var901, var1554 = protoModule.writeString(var901, var902, self.applied_filters)
		buff = var901
		var877 = var902
	end
	if self.pool_id ~= nil then
		local var903, var904 = protoModule.writeTag(buff, var877, 13, protoModule.wireTypes.lengthDelimited)
		var903, var1556 = protoModule.writeString(var903, var904, self.pool_id)
		buff = var903
		var877 = var904
	end
	if self.has_emphasized_tile then
		local var905, var906 = protoModule.writeTag(buff, var877, 14, protoModule.wireTypes.varint)
		var905, var1558 = protoModule.writeVarInt(var905, var906, if self.has_emphasized_tile then 1 else 0)
		buff = var905
		var877 = var906
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var907, var908 = protoModule.writeTag(buff, var877, 15, protoModule.wireTypes.lengthDelimited)
		var907, var1560 = protoModule.writeString(var907, var908, self.tile_activation_mode)
		buff = var907
		var877 = var908
	end
	if self.initial_feed_visible_rows ~= nil then
		local var909, var910 = protoModule.writeTag(buff, var877, 16, protoModule.wireTypes.varint)
		var909, var1562 = protoModule.writeVarInt(var909, var910, self.initial_feed_visible_rows)
		buff = var909
		var877 = var910
	end
	if self.visible_rows_per_reveal ~= nil then
		local var911, var912 = protoModule.writeTag(buff, var877, 17, protoModule.wireTypes.varint)
		var911, var1564 = protoModule.writeVarInt(var911, var912, self.visible_rows_per_reveal)
		buff = var911
		var877 = var912
	end
	if self.sponsored_user_cohort ~= nil then
		local var913, var914 = protoModule.writeTag(buff, var877, 18, protoModule.wireTypes.lengthDelimited)
		var913, var1566 = protoModule.writeString(var913, var914, self.sponsored_user_cohort)
		buff = var913
		var877 = var914
	end
	if self.anchor_tag ~= nil then
		local var915, var916 = protoModule.writeTag(buff, var877, 19, protoModule.wireTypes.lengthDelimited)
		var915, var1568 = protoModule.writeString(var915, var916, self.anchor_tag)
		buff = var915
		var877 = var916
	end
	local buff_1 = buffer.create(var877)
	buffer.copy(buff_1, 0, buff, 0, var877)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var917 = t_35.new()
	local var918 = 0
	while var918 < buffer.len(p35) do
		local _ = nil
		local var919 = nil
		local var920, var921, var922 = protoModule.readTag(p35, var918)
		local var923 = var920
		var919 = var921
		var918 = var922
		
		if var919 == protoModule.wireTypes.varint then
			if var923 == 5 then
				local _ = nil
				local var924, var925 = protoModule.readVarIntI32(p35, var918)
				var918 = var925
				var917.secondary_sort_id = var924
			elseif var923 == 6 then
				local _ = nil
				local var926, var927 = protoModule.readVarIntI32(p35, var918)
				var918 = var927
				var917.max_visible_rows = var926
			elseif var923 == 10 then
				local _ = nil
				local var928, var929 = protoModule.readVarInt(p35, var918)
				var918 = var929
				var917.is_placeholder = var928 ~= 0
			elseif var923 == 11 then
				local _ = nil
				local var930, var931 = protoModule.readVarIntI32(p35, var918)
				var918 = var931
				var917.primary_sort_id = var930
			elseif var923 == 14 then
				local _ = nil
				local var932, var933 = protoModule.readVarInt(p35, var918)
				var918 = var933
				var917.has_emphasized_tile = var932 ~= 0
			elseif var923 == 16 then
				local _ = nil
				local var934, var935 = protoModule.readVarIntI32(p35, var918)
				var918 = var935
				var917.initial_feed_visible_rows = var934
			elseif var923 == 17 then
				local _ = nil
				local var936, var937 = protoModule.readVarIntI32(p35, var918)
				var918 = var937
				var917.visible_rows_per_reveal = var936
			else
				local _ = nil
				local var938, var939 = protoModule.readVarInt(p35, var918)
				local _ = var938
				var918 = var939
			end
		end
		if var919 == protoModule.wireTypes.lengthDelimited then
			if var923 == 1 then
				local _ = nil
				local var940, var941 = protoModule.readBuffer(p35, var918)
				var918 = var941
				var917.title = buffer.tostring(var940)
			elseif var923 == 2 then
				local _ = nil
				local var942, var943 = protoModule.readBuffer(p35, var918)
				var918 = var943
				table.insert(var917.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var942))
			elseif var923 == 3 then
				local _ = nil
				local var944, var945 = protoModule.readBuffer(p35, var918)
				var918 = var945
				var917.next_page_token = buffer.tostring(var944)
			elseif var923 == 4 then
				local _ = nil
				local var946, var947 = protoModule.readBuffer(p35, var918)
				var918 = var947
				var917.sort_id = buffer.tostring(var946)
			elseif var923 == 7 then
				local _ = nil
				local var948, var949 = protoModule.readBuffer(p35, var918)
				var918 = var949
				var917.subtitle = buffer.tostring(var948)
			elseif var923 == 8 then
				local _ = nil
				local var950, var951 = protoModule.readBuffer(p35, var918)
				var918 = var951
				var917.info_text = buffer.tostring(var950)
			elseif var923 == 9 then
				local _ = nil
				local var952, var953 = protoModule.readBuffer(p35, var918)
				var918 = var953
				var917.subtitle_link_path = buffer.tostring(var952)
			elseif var923 == 12 then
				local _ = nil
				local var954, var955 = protoModule.readBuffer(p35, var918)
				var918 = var955
				var917.applied_filters = buffer.tostring(var954)
			elseif var923 == 13 then
				local _ = nil
				local var956, var957 = protoModule.readBuffer(p35, var918)
				var918 = var957
				var917.pool_id = buffer.tostring(var956)
			elseif var923 == 15 then
				local _ = nil
				local var958, var959 = protoModule.readBuffer(p35, var918)
				var918 = var959
				var917.tile_activation_mode = buffer.tostring(var958)
			elseif var923 == 18 then
				local _ = nil
				local var960, var961 = protoModule.readBuffer(p35, var918)
				var918 = var961
				var917.sponsored_user_cohort = buffer.tostring(var960)
			elseif var923 == 19 then
				local _ = nil
				local var962, var963 = protoModule.readBuffer(p35, var918)
				var918 = var963
				var917.anchor_tag = buffer.tostring(var962)
			else
				local _ = nil
				local var964, var965 = protoModule.readVarInt(p35, var918)
				var918 = var965 + var964
			end
		elseif var919 == protoModule.wireTypes.i32 then
			local _ = nil
			local var966, var967 = protoModule.readFixed32(p35, var918)
			local _ = var966
			var918 = var967
		elseif var919 == protoModule.wireTypes.i64 then
			local _ = nil
			local var968, var969 = protoModule.readFixed64(p35, var918)
			local _ = var968
			var918 = var969
		else
			error("Unsupported wire type: " .. var1572)
		end
	end
	return var917
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
	return t
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), t (ref)
	local var970 = t_35.new()
	
	if self.title ~= nil then
		var970.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var970.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var970.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var970.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var970.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var970.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var970.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var970.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var970.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var970.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var970.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var970.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var970.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var970.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var970.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var970.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var970.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var970.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var970.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var970.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var970.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var970.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var970.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var970.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var970.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var970.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var970.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var970.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var970.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var970.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var970.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var970.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var970.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var970.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		var970.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var970.anchor_tag = self.anchorTag
	end
	return var970
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
		game_items = if p36 == nil or p36.game_items == nil then {} else p36.game_items
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var971 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var972, var973 = protoModule.writeTag(buff, var971, 1, protoModule.wireTypes.lengthDelimited)
		var972, var1631 = protoModule.writeString(var972, var973, self.universe_id)
		buff = var972
		var971 = var973
	end
	if self.is_sponsored then
		local var974, var975 = protoModule.writeTag(buff, var971, 2, protoModule.wireTypes.varint)
		var974, var1633 = protoModule.writeVarInt(var974, var975, if self.is_sponsored then 1 else 0)
		buff = var974
		var971 = var975
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var976, var977 = protoModule.writeTag(buff, var971, 3, protoModule.wireTypes.lengthDelimited)
		var976, var1635 = protoModule.writeString(var976, var977, self.roblox_component)
		buff = var976
		var971 = var977
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var978, var979 = protoModule.writeTag(buff, var971, 4, protoModule.wireTypes.lengthDelimited)
		var978, var1637 = protoModule.writeString(var978, var979, self.native_ad_data)
		buff = var978
		var971 = var979
	end
	if self.is_content_locked then
		local var980, var981 = protoModule.writeTag(buff, var971, 5, protoModule.wireTypes.varint)
		var980, var1639 = protoModule.writeVarInt(var980, var981, if self.is_content_locked then 1 else 0)
		buff = var980
		var971 = var981
	end
	if self.title ~= nil and self.title ~= "" then
		local var982, var983 = protoModule.writeTag(buff, var971, 6, protoModule.wireTypes.lengthDelimited)
		var982, var1641 = protoModule.writeString(var982, var983, self.title)
		buff = var982
		var971 = var983
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var984, var985 = protoModule.writeTag(buff, var971, 7, protoModule.wireTypes.lengthDelimited)
		var984, var1643 = protoModule.writeString(var984, var985, self.subtitle)
		buff = var984
		var971 = var985
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var986, var987 = protoModule.writeTag(buff, var971, 8, protoModule.wireTypes.lengthDelimited)
		var986, var1645 = protoModule.writeString(var986, var987, self.image_asset_id)
		buff = var986
		var971 = var987
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var988, var989 = protoModule.writeTag(buff, var971, 9, protoModule.wireTypes.lengthDelimited)
		var988, var1647 = protoModule.writeString(var988, var989, self.video_asset_id)
		buff = var988
		var971 = var989
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var990, var991 = protoModule.writeTag(buff, var971, 10, protoModule.wireTypes.lengthDelimited)
		var990, var1649 = protoModule.writeString(var990, var991, self.badge_text)
		buff = var990
		var971 = var991
	end
	if self.player_count ~= nil then
		local var992, var993 = protoModule.writeTag(buff, var971, 11, protoModule.wireTypes.varint)
		var992, var1651 = protoModule.writeVarInt(var992, var993, self.player_count)
		buff = var992
		var971 = var993
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var994, var995 = protoModule.writeTag(buff, var971, 12, protoModule.wireTypes.lengthDelimited)
		var994, var1653 = protoModule.writeString(var994, var995, self.creator_key)
		buff = var994
		var971 = var995
	end
	if self.rank ~= nil then
		local var996, var997 = protoModule.writeTag(buff, var971, 13, protoModule.wireTypes.varint)
		var996, var1655 = protoModule.writeVarInt(var996, var997, self.rank)
		buff = var996
		var971 = var997
	end
	if self.payer_name ~= nil then
		local var998, var999 = protoModule.writeTag(buff, var971, 14, protoModule.wireTypes.lengthDelimited)
		var998, var1657 = protoModule.writeString(var998, var999, self.payer_name)
		buff = var998
		var971 = var999
	end
	if self.logo_asset_id ~= nil then
		local var1000, var1001 = protoModule.writeTag(buff, var971, 15, protoModule.wireTypes.lengthDelimited)
		var1000, var1659 = protoModule.writeString(var1000, var1001, self.logo_asset_id)
		buff = var1000
		var971 = var1001
	end
	if self.logo_aspect_ratio ~= nil then
		local var1002, var1003 = protoModule.writeTag(buff, var971, 16, protoModule.wireTypes.i64)
		var1002, var1661 = protoModule.writeDouble(var1002, var1003, self.logo_aspect_ratio)
		buff = var1002
		var971 = var1003
	end
	if self.place_id ~= nil then
		local var1004, var1005 = protoModule.writeTag(buff, var971, 17, protoModule.wireTypes.lengthDelimited)
		var1004, var1663 = protoModule.writeString(var1004, var1005, self.place_id)
		buff = var1004
		var971 = var1005
	end
	if self.launch_data ~= nil then
		local var1006, var1007 = protoModule.writeTag(buff, var971, 18, protoModule.wireTypes.lengthDelimited)
		var1006, var1665 = protoModule.writeString(var1006, var1007, self.launch_data)
		buff = var1006
		var971 = var1007
	end
	if self.tile_variant ~= nil then
		local var1008, var1009 = protoModule.writeTag(buff, var971, 19, protoModule.wireTypes.lengthDelimited)
		var1008, var1667 = protoModule.writeString(var1008, var1009, self.tile_variant)
		buff = var1008
		var971 = var1009
	end
	if self.cta_text ~= nil then
		local var1010, var1011 = protoModule.writeTag(buff, var971, 20, protoModule.wireTypes.lengthDelimited)
		var1010, var1669 = protoModule.writeString(var1010, var1011, self.cta_text)
		buff = var1010
		var971 = var1011
	end
	if self.badge_analytics_id ~= nil then
		local var1012, var1013 = protoModule.writeTag(buff, var971, 21, protoModule.wireTypes.lengthDelimited)
		var1012, var1671 = protoModule.writeString(var1012, var1013, self.badge_analytics_id)
		buff = var1012
		var971 = var1013
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1014 = v:encode()
			local var1015, var1016 = protoModule.writeTag(buff, var971, 22, protoModule.wireTypes.lengthDelimited)
			var1015, var1674 = protoModule.writeBuffer(var1015, var1016, var1014, buffer.len(var1014))
			buff = var1015
			var971 = var1016
		end
	end
	local buff_1 = buffer.create(var971)
	buffer.copy(buff_1, 0, buff, 0, var971)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1017 = t_36.new()
	local var1018 = 0
	while var1018 < buffer.len(p36) do
		local _ = nil
		local var1019 = nil
		local var1020, var1021, var1022 = protoModule.readTag(p36, var1018)
		local var1023 = var1020
		var1019 = var1021
		var1018 = var1022
		
		if var1019 == protoModule.wireTypes.varint then
			if var1023 == 2 then
				local _ = nil
				local var1024, var1025 = protoModule.readVarInt(p36, var1018)
				var1018 = var1025
				var1017.is_sponsored = var1024 ~= 0
			elseif var1023 == 5 then
				local _ = nil
				local var1026, var1027 = protoModule.readVarInt(p36, var1018)
				var1018 = var1027
				var1017.is_content_locked = var1026 ~= 0
			elseif var1023 == 11 then
				local _ = nil
				local var1028, var1029 = protoModule.readVarIntI64(p36, var1018)
				var1018 = var1029
				var1017.player_count = var1028
			elseif var1023 == 13 then
				local _ = nil
				local var1030, var1031 = protoModule.readVarIntI32(p36, var1018)
				var1018 = var1031
				var1017.rank = var1030
			else
				local _ = nil
				local var1032, var1033 = protoModule.readVarInt(p36, var1018)
				local _ = var1032
				var1018 = var1033
			end
		end
		if var1019 == protoModule.wireTypes.lengthDelimited then
			if var1023 == 1 then
				local _ = nil
				local var1034, var1035 = protoModule.readBuffer(p36, var1018)
				var1018 = var1035
				var1017.universe_id = buffer.tostring(var1034)
			elseif var1023 == 3 then
				local _ = nil
				local var1036, var1037 = protoModule.readBuffer(p36, var1018)
				var1018 = var1037
				var1017.roblox_component = buffer.tostring(var1036)
			elseif var1023 == 4 then
				local _ = nil
				local var1038, var1039 = protoModule.readBuffer(p36, var1018)
				var1018 = var1039
				var1017.native_ad_data = buffer.tostring(var1038)
			elseif var1023 == 6 then
				local _ = nil
				local var1040, var1041 = protoModule.readBuffer(p36, var1018)
				var1018 = var1041
				var1017.title = buffer.tostring(var1040)
			elseif var1023 == 7 then
				local _ = nil
				local var1042, var1043 = protoModule.readBuffer(p36, var1018)
				var1018 = var1043
				var1017.subtitle = buffer.tostring(var1042)
			elseif var1023 == 8 then
				local _ = nil
				local var1044, var1045 = protoModule.readBuffer(p36, var1018)
				var1018 = var1045
				var1017.image_asset_id = buffer.tostring(var1044)
			elseif var1023 == 9 then
				local _ = nil
				local var1046, var1047 = protoModule.readBuffer(p36, var1018)
				var1018 = var1047
				var1017.video_asset_id = buffer.tostring(var1046)
			elseif var1023 == 10 then
				local _ = nil
				local var1048, var1049 = protoModule.readBuffer(p36, var1018)
				var1018 = var1049
				var1017.badge_text = buffer.tostring(var1048)
			elseif var1023 == 12 then
				local _ = nil
				local var1050, var1051 = protoModule.readBuffer(p36, var1018)
				var1018 = var1051
				var1017.creator_key = buffer.tostring(var1050)
			elseif var1023 == 14 then
				local _ = nil
				local var1052, var1053 = protoModule.readBuffer(p36, var1018)
				var1018 = var1053
				var1017.payer_name = buffer.tostring(var1052)
			elseif var1023 == 15 then
				local _ = nil
				local var1054, var1055 = protoModule.readBuffer(p36, var1018)
				var1018 = var1055
				var1017.logo_asset_id = buffer.tostring(var1054)
			elseif var1023 == 17 then
				local _ = nil
				local var1056, var1057 = protoModule.readBuffer(p36, var1018)
				var1018 = var1057
				var1017.place_id = buffer.tostring(var1056)
			elseif var1023 == 18 then
				local _ = nil
				local var1058, var1059 = protoModule.readBuffer(p36, var1018)
				var1018 = var1059
				var1017.launch_data = buffer.tostring(var1058)
			elseif var1023 == 19 then
				local _ = nil
				local var1060, var1061 = protoModule.readBuffer(p36, var1018)
				var1018 = var1061
				var1017.tile_variant = buffer.tostring(var1060)
			elseif var1023 == 20 then
				local _ = nil
				local var1062, var1063 = protoModule.readBuffer(p36, var1018)
				var1018 = var1063
				var1017.cta_text = buffer.tostring(var1062)
			elseif var1023 == 21 then
				local _ = nil
				local var1064, var1065 = protoModule.readBuffer(p36, var1018)
				var1018 = var1065
				var1017.badge_analytics_id = buffer.tostring(var1064)
			elseif var1023 == 22 then
				local _ = nil
				local var1066, var1067 = protoModule.readBuffer(p36, var1018)
				var1018 = var1067
				table.insert(var1017.game_items, t.GameItemInputData.decode(var1066))
			else
				local _ = nil
				local var1068, var1069 = protoModule.readVarInt(p36, var1018)
				var1018 = var1069 + var1068
			end
		elseif var1019 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1070, var1071 = protoModule.readFixed32(p36, var1018)
			local _ = var1070
			var1018 = var1071
		elseif var1019 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1678)
		elseif var1023 == 16 then
			local _ = nil
			local var1072, var1073 = protoModule.readDouble(p36, var1018)
			var1018 = var1073
			var1017.logo_aspect_ratio = var1072
		else
			local _ = nil
			local var1074, var1075 = protoModule.readFixed64(p36, var1018)
			local _ = var1074
			var1018 = var1075
		end
	end
	return var1017
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
	return t
end

function t_36:jsonDecode()
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1076 = t_36.new()
	
	if self.universe_id ~= nil then
		var1076.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1076.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1076.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1076.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1076.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1076.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1076.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1076.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1076.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1076.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1076.title = self.title
	end
	if self.subtitle ~= nil then
		var1076.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1076.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1076.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1076.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1076.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1076.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1076.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1076.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1076.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1076.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1076.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1076.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1076.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1076.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1076.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1076.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1076.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1076.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1076.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1076.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1076.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1076.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1076.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1076.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1076.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1076.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1076.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1076.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1076.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1076.game_items = t_1
	end
	return var1076
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
		title = if p37 == nil or p37.title == nil then "" else p37.title,
		song_items = if p37 == nil or p37.song_items == nil then {} else p37.song_items,
		next_page_token = if p37 == nil or p37.next_page_token == nil then "" else p37.next_page_token,
		sort_id = if p37 == nil or p37.sort_id == nil then "" else p37.sort_id,
		secondary_sort_id = if p37 == nil or p37.secondary_sort_id == nil then 0 else p37.secondary_sort_id,
		subtitle = if p37 == nil or p37.subtitle == nil then "" else p37.subtitle,
		info_text = if p37 == nil or p37.info_text == nil then "" else p37.info_text,
		subtitle_link_path = if p37 == nil or p37.subtitle_link_path == nil then "" else p37.subtitle_link_path,
		is_placeholder = if p37 == nil or p37.is_placeholder == nil then nil else p37.is_placeholder,
		primary_sort_id = if p37 == nil or p37.primary_sort_id == nil then nil else p37.primary_sort_id,
		applied_filters = if p37 == nil or p37.applied_filters == nil then nil else p37.applied_filters
	}, t_37)
end

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1077 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1078, var1079 = protoModule.writeTag(buff, var1077, 1, protoModule.wireTypes.lengthDelimited)
		var1078, var1743 = protoModule.writeString(var1078, var1079, self.title)
		buff = var1078
		var1077 = var1079
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1080 = v:encode()
			local var1081, var1082 = protoModule.writeTag(buff, var1077, 2, protoModule.wireTypes.lengthDelimited)
			var1081, var1746 = protoModule.writeBuffer(var1081, var1082, var1080, buffer.len(var1080))
			buff = var1081
			var1077 = var1082
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1083, var1084 = protoModule.writeTag(buff, var1077, 3, protoModule.wireTypes.lengthDelimited)
		var1083, var1748 = protoModule.writeString(var1083, var1084, self.next_page_token)
		buff = var1083
		var1077 = var1084
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1085, var1086 = protoModule.writeTag(buff, var1077, 4, protoModule.wireTypes.lengthDelimited)
		var1085, var1750 = protoModule.writeString(var1085, var1086, self.sort_id)
		buff = var1085
		var1077 = var1086
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1087, var1088 = protoModule.writeTag(buff, var1077, 5, protoModule.wireTypes.varint)
		var1087, var1752 = protoModule.writeVarInt(var1087, var1088, self.secondary_sort_id)
		buff = var1087
		var1077 = var1088
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1089, var1090 = protoModule.writeTag(buff, var1077, 6, protoModule.wireTypes.lengthDelimited)
		var1089, var1754 = protoModule.writeString(var1089, var1090, self.subtitle)
		buff = var1089
		var1077 = var1090
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1091, var1092 = protoModule.writeTag(buff, var1077, 7, protoModule.wireTypes.lengthDelimited)
		var1091, var1756 = protoModule.writeString(var1091, var1092, self.info_text)
		buff = var1091
		var1077 = var1092
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1093, var1094 = protoModule.writeTag(buff, var1077, 8, protoModule.wireTypes.lengthDelimited)
		var1093, var1758 = protoModule.writeString(var1093, var1094, self.subtitle_link_path)
		buff = var1093
		var1077 = var1094
	end
	if self.is_placeholder ~= nil then
		local var1095, var1096 = protoModule.writeTag(buff, var1077, 9, protoModule.wireTypes.varint)
		var1095, var1760 = protoModule.writeVarInt(var1095, var1096, if self.is_placeholder then 1 else 0)
		buff = var1095
		var1077 = var1096
	end
	if self.primary_sort_id ~= nil then
		local var1097, var1098 = protoModule.writeTag(buff, var1077, 10, protoModule.wireTypes.varint)
		var1097, var1762 = protoModule.writeVarInt(var1097, var1098, self.primary_sort_id)
		buff = var1097
		var1077 = var1098
	end
	if self.applied_filters ~= nil then
		local var1099, var1100 = protoModule.writeTag(buff, var1077, 11, protoModule.wireTypes.lengthDelimited)
		var1099, var1764 = protoModule.writeString(var1099, var1100, self.applied_filters)
		buff = var1099
		var1077 = var1100
	end
	local buff_1 = buffer.create(var1077)
	buffer.copy(buff_1, 0, buff, 0, var1077)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1101 = t_37.new()
	local var1102 = 0
	while var1102 < buffer.len(p37) do
		local _ = nil
		local var1103 = nil
		local var1104, var1105, var1106 = protoModule.readTag(p37, var1102)
		local var1107 = var1104
		var1103 = var1105
		var1102 = var1106
		
		if var1103 == protoModule.wireTypes.varint then
			if var1107 == 5 then
				local _ = nil
				local var1108, var1109 = protoModule.readVarIntI32(p37, var1102)
				var1102 = var1109
				var1101.secondary_sort_id = var1108
			elseif var1107 == 9 then
				local _ = nil
				local var1110, var1111 = protoModule.readVarInt(p37, var1102)
				var1102 = var1111
				var1101.is_placeholder = var1110 ~= 0
			elseif var1107 == 10 then
				local _ = nil
				local var1112, var1113 = protoModule.readVarIntI32(p37, var1102)
				var1102 = var1113
				var1101.primary_sort_id = var1112
			else
				local _ = nil
				local var1114, var1115 = protoModule.readVarInt(p37, var1102)
				local _ = var1114
				var1102 = var1115
			end
		end
		if var1103 == protoModule.wireTypes.lengthDelimited then
			if var1107 == 1 then
				local _ = nil
				local var1116, var1117 = protoModule.readBuffer(p37, var1102)
				var1102 = var1117
				var1101.title = buffer.tostring(var1116)
			elseif var1107 == 2 then
				local _ = nil
				local var1118, var1119 = protoModule.readBuffer(p37, var1102)
				var1102 = var1119
				table.insert(var1101.song_items, t.SongCarouselInputData_SongItem.decode(var1118))
			elseif var1107 == 3 then
				local _ = nil
				local var1120, var1121 = protoModule.readBuffer(p37, var1102)
				var1102 = var1121
				var1101.next_page_token = buffer.tostring(var1120)
			elseif var1107 == 4 then
				local _ = nil
				local var1122, var1123 = protoModule.readBuffer(p37, var1102)
				var1102 = var1123
				var1101.sort_id = buffer.tostring(var1122)
			elseif var1107 == 6 then
				local _ = nil
				local var1124, var1125 = protoModule.readBuffer(p37, var1102)
				var1102 = var1125
				var1101.subtitle = buffer.tostring(var1124)
			elseif var1107 == 7 then
				local _ = nil
				local var1126, var1127 = protoModule.readBuffer(p37, var1102)
				var1102 = var1127
				var1101.info_text = buffer.tostring(var1126)
			elseif var1107 == 8 then
				local _ = nil
				local var1128, var1129 = protoModule.readBuffer(p37, var1102)
				var1102 = var1129
				var1101.subtitle_link_path = buffer.tostring(var1128)
			elseif var1107 == 11 then
				local _ = nil
				local var1130, var1131 = protoModule.readBuffer(p37, var1102)
				var1102 = var1131
				var1101.applied_filters = buffer.tostring(var1130)
			else
				local _ = nil
				local var1132, var1133 = protoModule.readVarInt(p37, var1102)
				var1102 = var1133 + var1132
			end
		elseif var1103 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1134, var1135 = protoModule.readFixed32(p37, var1102)
			local _ = var1134
			var1102 = var1135
		elseif var1103 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1136, var1137 = protoModule.readFixed64(p37, var1102)
			local _ = var1136
			var1102 = var1137
		else
			error("Unsupported wire type: " .. var1768)
		end
	end
	return var1101
end

function t_37:jsonEncode()
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

function t_37:jsonDecode()
	-- upvalues: t_37 (ref), t (ref)
	local var1138 = t_37.new()
	
	if self.title ~= nil then
		var1138.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1138.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1138.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1138.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1138.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1138.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1138.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1138.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1138.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1138.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1138.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1138.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1138.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1138.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1138.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1138.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1138.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1138.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1138.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1138.applied_filters = self.appliedFilters
	end
	return var1138
end

t_37.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_37
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p38)
	-- upvalues: t_38 (ref)
	return setmetatable({
		song_id = if p38 == nil or p38.song_id == nil then "" else p38.song_id
	}, t_38)
end

function t_38:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1139 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1140, var1141 = protoModule.writeTag(buff, var1139, 1, protoModule.wireTypes.lengthDelimited)
		var1140, var1811 = protoModule.writeString(var1140, var1141, self.song_id)
		buff = var1140
		var1139 = var1141
	end
	local buff_1 = buffer.create(var1139)
	buffer.copy(buff_1, 0, buff, 0, var1139)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1139 = t_38.new()
	local var1140 = 0
	while var1140 < buffer.len(p38) do
		local _ = nil
		local var1141 = nil
		local var1142, var1143, var1144 = protoModule.readTag(p38, var1140)
		local var1145 = var1142
		var1141 = var1143
		var1140 = var1144
		
		if var1141 == protoModule.wireTypes.varint then
			local _ = nil
			local var1146, var1147 = protoModule.readVarInt(p38, var1140)
			local _ = var1146
			var1140 = var1147
			continue
		end
		if var1141 == protoModule.wireTypes.lengthDelimited then
			if var1145 == 1 then
				local _ = nil
				local var1148, var1149 = protoModule.readBuffer(p38, var1140)
				var1140 = var1149
				var1139.song_id = buffer.tostring(var1148)
			else
				local _ = nil
				local var1150, var1151 = protoModule.readVarInt(p38, var1140)
				var1140 = var1151 + var1150
			end
		elseif var1141 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1152, var1153 = protoModule.readFixed32(p38, var1140)
			local _ = var1152
			var1140 = var1153
		elseif var1141 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1154, var1155 = protoModule.readFixed64(p38, var1140)
			local _ = var1154
			var1140 = var1155
		else
			error("Unsupported wire type: " .. var1815)
		end
	end
	return var1139
end

function t_38:jsonEncode()
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_38:jsonDecode()
	-- upvalues: t_38 (ref)
	local var1156 = t_38.new()
	
	if self.song_id ~= nil then
		var1156.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1156.song_id = self.songId
	end
	return var1156
end

t_38.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_38
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p39)
	-- upvalues: t_39 (ref)
	return setmetatable({
		title = if p39 == nil or p39.title == nil then "" else p39.title,
		event_items = if p39 == nil or p39.event_items == nil then {} else p39.event_items,
		universe_id = if p39 == nil or p39.universe_id == nil then "" else p39.universe_id,
		sort_id = if p39 == nil or p39.sort_id == nil then "" else p39.sort_id,
		subtitle = if p39 == nil or p39.subtitle == nil then "" else p39.subtitle,
		info_text = if p39 == nil or p39.info_text == nil then "" else p39.info_text
	}, t_39)
end

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1156 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1157, var1158 = protoModule.writeTag(buff, var1156, 1, protoModule.wireTypes.lengthDelimited)
		var1157, var1835 = protoModule.writeString(var1157, var1158, self.title)
		buff = var1157
		var1156 = var1158
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1159 = v:encode()
			local var1160, var1161 = protoModule.writeTag(buff, var1156, 2, protoModule.wireTypes.lengthDelimited)
			var1160, var1838 = protoModule.writeBuffer(var1160, var1161, var1159, buffer.len(var1159))
			buff = var1160
			var1156 = var1161
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1162, var1163 = protoModule.writeTag(buff, var1156, 3, protoModule.wireTypes.lengthDelimited)
		var1162, var1840 = protoModule.writeString(var1162, var1163, self.universe_id)
		buff = var1162
		var1156 = var1163
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1164, var1165 = protoModule.writeTag(buff, var1156, 4, protoModule.wireTypes.lengthDelimited)
		var1164, var1842 = protoModule.writeString(var1164, var1165, self.sort_id)
		buff = var1164
		var1156 = var1165
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1166, var1167 = protoModule.writeTag(buff, var1156, 5, protoModule.wireTypes.lengthDelimited)
		var1166, var1844 = protoModule.writeString(var1166, var1167, self.subtitle)
		buff = var1166
		var1156 = var1167
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1168, var1169 = protoModule.writeTag(buff, var1156, 6, protoModule.wireTypes.lengthDelimited)
		var1168, var1846 = protoModule.writeString(var1168, var1169, self.info_text)
		buff = var1168
		var1156 = var1169
	end
	local buff_1 = buffer.create(var1156)
	buffer.copy(buff_1, 0, buff, 0, var1156)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1170 = t_39.new()
	local var1171 = 0
	while var1171 < buffer.len(p39) do
		local _ = nil
		local var1172 = nil
		local var1173, var1174, var1175 = protoModule.readTag(p39, var1171)
		local var1176 = var1173
		var1172 = var1174
		var1171 = var1175
		
		if var1172 == protoModule.wireTypes.varint then
			local _ = nil
			local var1177, var1178 = protoModule.readVarInt(p39, var1171)
			local _ = var1177
			var1171 = var1178
			continue
		end
		if var1172 == protoModule.wireTypes.lengthDelimited then
			if var1176 == 1 then
				local _ = nil
				local var1179, var1180 = protoModule.readBuffer(p39, var1171)
				var1171 = var1180
				var1170.title = buffer.tostring(var1179)
			elseif var1176 == 2 then
				local _ = nil
				local var1181, var1182 = protoModule.readBuffer(p39, var1171)
				var1171 = var1182
				table.insert(var1170.event_items, t.EventsCarouselInputData_EventItem.decode(var1181))
			elseif var1176 == 3 then
				local _ = nil
				local var1183, var1184 = protoModule.readBuffer(p39, var1171)
				var1171 = var1184
				var1170.universe_id = buffer.tostring(var1183)
			elseif var1176 == 4 then
				local _ = nil
				local var1185, var1186 = protoModule.readBuffer(p39, var1171)
				var1171 = var1186
				var1170.sort_id = buffer.tostring(var1185)
			elseif var1176 == 5 then
				local _ = nil
				local var1187, var1188 = protoModule.readBuffer(p39, var1171)
				var1171 = var1188
				var1170.subtitle = buffer.tostring(var1187)
			elseif var1176 == 6 then
				local _ = nil
				local var1189, var1190 = protoModule.readBuffer(p39, var1171)
				var1171 = var1190
				var1170.info_text = buffer.tostring(var1189)
			else
				local _ = nil
				local var1191, var1192 = protoModule.readVarInt(p39, var1171)
				var1171 = var1192 + var1191
			end
		elseif var1172 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1193, var1194 = protoModule.readFixed32(p39, var1171)
			local _ = var1193
			var1171 = var1194
		elseif var1172 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1195, var1196 = protoModule.readFixed64(p39, var1171)
			local _ = var1195
			var1171 = var1196
		else
			error("Unsupported wire type: " .. var1850)
		end
	end
	return var1170
end

function t_39:jsonEncode()
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

function t_39:jsonDecode()
	-- upvalues: t_39 (ref), t (ref)
	local var1197 = t_39.new()
	
	if self.title ~= nil then
		var1197.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1197.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1197.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1197.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1197.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1197.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1197.sort_id = self.sortId
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
	return var1197
end

t_39.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_39
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p40)
	-- upvalues: t_40 (ref)
	return setmetatable({
		event_id = if p40 == nil or p40.event_id == nil then "" else p40.event_id
	}, t_40)
end

function t_40:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1198 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1199, var1200 = protoModule.writeTag(buff, var1198, 1, protoModule.wireTypes.lengthDelimited)
		var1199, var1883 = protoModule.writeString(var1199, var1200, self.event_id)
		buff = var1199
		var1198 = var1200
	end
	local buff_1 = buffer.create(var1198)
	buffer.copy(buff_1, 0, buff, 0, var1198)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1198 = t_40.new()
	local var1199 = 0
	while var1199 < buffer.len(p40) do
		local _ = nil
		local var1200 = nil
		local var1201, var1202, var1203 = protoModule.readTag(p40, var1199)
		local var1204 = var1201
		var1200 = var1202
		var1199 = var1203
		
		if var1200 == protoModule.wireTypes.varint then
			local _ = nil
			local var1205, var1206 = protoModule.readVarInt(p40, var1199)
			local _ = var1205
			var1199 = var1206
			continue
		end
		if var1200 == protoModule.wireTypes.lengthDelimited then
			if var1204 == 1 then
				local _ = nil
				local var1207, var1208 = protoModule.readBuffer(p40, var1199)
				var1199 = var1208
				var1198.event_id = buffer.tostring(var1207)
			else
				local _ = nil
				local var1209, var1210 = protoModule.readVarInt(p40, var1199)
				var1199 = var1210 + var1209
			end
		elseif var1200 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1211, var1212 = protoModule.readFixed32(p40, var1199)
			local _ = var1211
			var1199 = var1212
		elseif var1200 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1213, var1214 = protoModule.readFixed64(p40, var1199)
			local _ = var1213
			var1199 = var1214
		else
			error("Unsupported wire type: " .. var1887)
		end
	end
	return var1198
end

function t_40:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_40:jsonDecode()
	-- upvalues: t_40 (ref)
	local var1215 = t_40.new()
	
	if self.event_id ~= nil then
		var1215.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1215.event_id = self.eventId
	end
	return var1215
end

t_40.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_40
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p41)
	-- upvalues: t_41 (ref)
	return setmetatable({
		universe_id = if p41 == nil or p41.universe_id == nil then "" else p41.universe_id,
		entry_map = if p41 == nil or p41.entry_map == nil then {} else p41.entry_map,
		entry_order = if p41 == nil or p41.entry_order == nil then {} else p41.entry_order,
		creator_key = if p41 == nil or p41.creator_key == nil then "" else p41.creator_key,
		pill_tabs = if p41 == nil or p41.pill_tabs == nil then nil else p41.pill_tabs
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1215 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1216, var1217 = protoModule.writeTag(buff, var1215, 1, protoModule.wireTypes.lengthDelimited)
		var1216, var1907 = protoModule.writeString(var1216, var1217, self.universe_id)
		buff = var1216
		var1215 = var1217
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1218, var1219 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1218, var1909 = protoModule.writeString(var1218, var1219, i)
			local var1220 = v:encode()
			var1219, var1911 = protoModule.writeTag(var1218, var1219, 2, protoModule.wireTypes.lengthDelimited)
			var1219, var1911 = protoModule.writeBuffer(var1219, var1911, var1220, buffer.len(var1220))
			local var1221 = var1219
			local var1222 = var1911
			local var1223, var1224 = protoModule.writeTag(buff, var1215, 2, protoModule.wireTypes.lengthDelimited)
			var1223, var1915 = protoModule.writeBuffer(var1223, var1224, var1221, var1222)
			buff = var1223
			var1215 = var1224
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1225, var1226 = protoModule.writeTag(buff, var1215, 3, protoModule.wireTypes.lengthDelimited)
			var1225, var1917 = protoModule.writeString(var1225, var1226, v)
			buff = var1225
			var1215 = var1226
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1227, var1228 = protoModule.writeTag(buff, var1215, 4, protoModule.wireTypes.lengthDelimited)
		var1227, var1919 = protoModule.writeString(var1227, var1228, self.creator_key)
		buff = var1227
		var1215 = var1228
	end
	if self.pill_tabs ~= nil then
		local var1229 = self.pill_tabs:encode()
		local var1230, var1231 = protoModule.writeTag(buff, var1215, 5, protoModule.wireTypes.lengthDelimited)
		var1230, var1922 = protoModule.writeBuffer(var1230, var1231, var1229, buffer.len(var1229))
		buff = var1230
		var1215 = var1231
	end
	local buff_1 = buffer.create(var1215)
	buffer.copy(buff_1, 0, buff, 0, var1215)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1232 = t_41.new()
	local var1233 = 0
	while var1233 < buffer.len(p41) do
		local _ = nil
		local var1234 = nil
		local var1235, var1236, var1237 = protoModule.readTag(p41, var1233)
		local var1238 = var1235
		var1234 = var1236
		var1233 = var1237
		
		if var1234 == protoModule.wireTypes.varint then
			local _ = nil
			local var1239, var1240 = protoModule.readVarInt(p41, var1233)
			local _ = var1239
			var1233 = var1240
			continue
		end
		if var1234 == protoModule.wireTypes.lengthDelimited then
			if var1238 == 1 then
				local _ = nil
				local var1241, var1242 = protoModule.readBuffer(p41, var1233)
				var1233 = var1242
				var1232.universe_id = buffer.tostring(var1241)
			elseif var1238 == 2 then
				local _ = nil
				local var1243, var1244 = protoModule.readBuffer(p41, var1233)
				var1233 = var1244
				var1243 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1243)
				var1232.entry_map[var1243.key or ""] = var1243.value or t.FeedEntry.new()
			elseif var1238 == 3 then
				local _ = nil
				local var1245, var1246 = protoModule.readBuffer(p41, var1233)
				var1233 = var1246
				table.insert(var1232.entry_order, buffer.tostring(var1245))
			elseif var1238 == 4 then
				local _ = nil
				local var1247, var1248 = protoModule.readBuffer(p41, var1233)
				var1233 = var1248
				var1232.creator_key = buffer.tostring(var1247)
			elseif var1238 == 5 then
				local _ = nil
				local var1249, var1250 = protoModule.readBuffer(p41, var1233)
				var1233 = var1250
				var1232.pill_tabs = t.PillTabsInputData.decode(var1249)
			else
				local _ = nil
				local var1251, var1252 = protoModule.readVarInt(p41, var1233)
				var1233 = var1252 + var1251
			end
		elseif var1234 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1253, var1254 = protoModule.readFixed32(p41, var1233)
			local _ = var1253
			var1233 = var1254
		elseif var1234 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1255, var1256 = protoModule.readFixed64(p41, var1233)
			local _ = var1255
			var1233 = var1256
		else
			error("Unsupported wire type: " .. var1926)
		end
	end
	return var1232
end

function t_41:jsonEncode()
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

function t_41:jsonDecode()
	-- upvalues: t_41 (ref), t (ref)
	local var1257 = t_41.new()
	
	if self.universe_id ~= nil then
		var1257.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1257.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1257.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1257.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1257.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1257.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1257.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1257.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1257.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1257.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1257
end

t_41.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_41
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p42)
	-- upvalues: t_42 (ref)
	return setmetatable({
		key = if p42 == nil or p42.key == nil then "" else p42.key,
		value = if p42 == nil or p42.value == nil then nil else p42.value
	}, t_42)
end

function t_42:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1258 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1259, var1260 = protoModule.writeTag(buff, var1258, 1, protoModule.wireTypes.lengthDelimited)
		var1259, var1960 = protoModule.writeString(var1259, var1260, self.key)
		buff = var1259
		var1258 = var1260
	end
	if self.value ~= nil then
		local var1261 = self.value:encode()
		local var1262, var1263 = protoModule.writeTag(buff, var1258, 2, protoModule.wireTypes.lengthDelimited)
		var1262, var1963 = protoModule.writeBuffer(var1262, var1263, var1261, buffer.len(var1261))
		buff = var1262
		var1258 = var1263
	end
	local buff_1 = buffer.create(var1258)
	buffer.copy(buff_1, 0, buff, 0, var1258)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1258 = t_42.new()
	local var1259 = 0
	while var1259 < buffer.len(p42) do
		local _ = nil
		local var1260 = nil
		local var1261, var1262, var1263 = protoModule.readTag(p42, var1259)
		local var1264 = var1261
		var1260 = var1262
		var1259 = var1263
		
		if var1260 == protoModule.wireTypes.varint then
			local _ = nil
			local var1265, var1266 = protoModule.readVarInt(p42, var1259)
			local _ = var1265
			var1259 = var1266
			continue
		end
		if var1260 == protoModule.wireTypes.lengthDelimited then
			if var1264 == 1 then
				local _ = nil
				local var1267, var1268 = protoModule.readBuffer(p42, var1259)
				var1259 = var1268
				var1258.key = buffer.tostring(var1267)
			elseif var1264 == 2 then
				local _ = nil
				local var1269, var1270 = protoModule.readBuffer(p42, var1259)
				var1259 = var1270
				var1258.value = t.FeedEntry.decode(var1269)
			else
				local _ = nil
				local var1271, var1272 = protoModule.readVarInt(p42, var1259)
				var1259 = var1272 + var1271
			end
		elseif var1260 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1273, var1274 = protoModule.readFixed32(p42, var1259)
			local _ = var1273
			var1259 = var1274
		elseif var1260 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1275, var1276 = protoModule.readFixed64(p42, var1259)
			local _ = var1275
			var1259 = var1276
		else
			error("Unsupported wire type: " .. var1967)
		end
	end
	return var1258
end

function t_42:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_42:jsonDecode()
	-- upvalues: t_42 (ref), t (ref)
	local var1277 = t_42.new()
	
	if self.key ~= nil then
		var1277.key = self.key
	end
	if self.value ~= nil then
		var1277.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1277
end

t_42.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_42
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p43)
	-- upvalues: t_43 (ref)
	return setmetatable({
		options = if p43 == nil or p43.options == nil then {} else p43.options,
		default_option_id = if p43 == nil or p43.default_option_id == nil then "" else p43.default_option_id
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1277 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1278 = v:encode()
			local var1279, var1280 = protoModule.writeTag(buff, var1277, 1, protoModule.wireTypes.lengthDelimited)
			var1279, var1990 = protoModule.writeBuffer(var1279, var1280, var1278, buffer.len(var1278))
			buff = var1279
			var1277 = var1280
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1281, var1282 = protoModule.writeTag(buff, var1277, 2, protoModule.wireTypes.lengthDelimited)
		var1281, var1992 = protoModule.writeString(var1281, var1282, self.default_option_id)
		buff = var1281
		var1277 = var1282
	end
	local buff_1 = buffer.create(var1277)
	buffer.copy(buff_1, 0, buff, 0, var1277)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1283 = t_43.new()
	local var1284 = 0
	while var1284 < buffer.len(p43) do
		local _ = nil
		local var1285 = nil
		local var1286, var1287, var1288 = protoModule.readTag(p43, var1284)
		local var1289 = var1286
		var1285 = var1287
		var1284 = var1288
		
		if var1285 == protoModule.wireTypes.varint then
			local _ = nil
			local var1290, var1291 = protoModule.readVarInt(p43, var1284)
			local _ = var1290
			var1284 = var1291
			continue
		end
		if var1285 == protoModule.wireTypes.lengthDelimited then
			if var1289 == 1 then
				local _ = nil
				local var1292, var1293 = protoModule.readBuffer(p43, var1284)
				var1284 = var1293
				table.insert(var1283.options, t.PillTabsInputData_PillTabOption.decode(var1292))
			elseif var1289 == 2 then
				local _ = nil
				local var1294, var1295 = protoModule.readBuffer(p43, var1284)
				var1284 = var1295
				var1283.default_option_id = buffer.tostring(var1294)
			else
				local _ = nil
				local var1296, var1297 = protoModule.readVarInt(p43, var1284)
				var1284 = var1297 + var1296
			end
		elseif var1285 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1298, var1299 = protoModule.readFixed32(p43, var1284)
			local _ = var1298
			var1284 = var1299
		elseif var1285 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1300, var1301 = protoModule.readFixed64(p43, var1284)
			local _ = var1300
			var1284 = var1301
		else
			error("Unsupported wire type: " .. var1996)
		end
	end
	return var1283
end

function t_43:jsonEncode()
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

function t_43:jsonDecode()
	-- upvalues: t_43 (ref), t (ref)
	local var1302 = t_43.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1302.options = t_1
	end
	if self.default_option_id ~= nil then
		var1302.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1302.default_option_id = self.defaultOptionId
	end
	return var1302
end

t_43.descriptor = {
	name = "PillTabsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabsInputData"
}
t.PillTabsInputData = t_43
typeRegistryModule.default:register(t.PillTabsInputData)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p44)
	-- upvalues: t_44 (ref)
	return setmetatable({
		option_id = if p44 == nil or p44.option_id == nil then "" else p44.option_id,
		display_name = if p44 == nil or p44.display_name == nil then "" else p44.display_name
	}, t_44)
end

function t_44:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1303 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1304, var1305 = protoModule.writeTag(buff, var1303, 1, protoModule.wireTypes.lengthDelimited)
		var1304, var2020 = protoModule.writeString(var1304, var1305, self.option_id)
		buff = var1304
		var1303 = var1305
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1306, var1307 = protoModule.writeTag(buff, var1303, 2, protoModule.wireTypes.lengthDelimited)
		var1306, var2022 = protoModule.writeString(var1306, var1307, self.display_name)
		buff = var1306
		var1303 = var1307
	end
	local buff_1 = buffer.create(var1303)
	buffer.copy(buff_1, 0, buff, 0, var1303)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1303 = t_44.new()
	local var1304 = 0
	while var1304 < buffer.len(p44) do
		local _ = nil
		local var1305 = nil
		local var1306, var1307, var1308 = protoModule.readTag(p44, var1304)
		local var1309 = var1306
		var1305 = var1307
		var1304 = var1308
		
		if var1305 == protoModule.wireTypes.varint then
			local _ = nil
			local var1310, var1311 = protoModule.readVarInt(p44, var1304)
			local _ = var1310
			var1304 = var1311
			continue
		end
		if var1305 == protoModule.wireTypes.lengthDelimited then
			if var1309 == 1 then
				local _ = nil
				local var1312, var1313 = protoModule.readBuffer(p44, var1304)
				var1304 = var1313
				var1303.option_id = buffer.tostring(var1312)
			elseif var1309 == 2 then
				local _ = nil
				local var1314, var1315 = protoModule.readBuffer(p44, var1304)
				var1304 = var1315
				var1303.display_name = buffer.tostring(var1314)
			else
				local _ = nil
				local var1316, var1317 = protoModule.readVarInt(p44, var1304)
				var1304 = var1317 + var1316
			end
		elseif var1305 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1318, var1319 = protoModule.readFixed32(p44, var1304)
			local _ = var1318
			var1304 = var1319
		elseif var1305 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1320, var1321 = protoModule.readFixed64(p44, var1304)
			local _ = var1320
			var1304 = var1321
		else
			error("Unsupported wire type: " .. var2026)
		end
	end
	return var1303
end

function t_44:jsonEncode()
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	return t
end

function t_44:jsonDecode()
	-- upvalues: t_44 (ref)
	local var1322 = t_44.new()
	
	if self.option_id ~= nil then
		var1322.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1322.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1322.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1322.display_name = self.displayName
	end
	return var1322
end

t_44.descriptor = {
	name = "PillTabsInputData_PillTabOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabOption"
}
t.PillTabsInputData_PillTabOption = t_44
typeRegistryModule.default:register(t.PillTabsInputData_PillTabOption)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p45)
	-- upvalues: t_45 (ref)
	return setmetatable({
		game_passes = if p45 == nil or p45.game_passes == nil then {} else p45.game_passes
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1322 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1323 = v:encode()
			local var1324, var1325 = protoModule.writeTag(buff, var1322, 1, protoModule.wireTypes.lengthDelimited)
			var1324, var2049 = protoModule.writeBuffer(var1324, var1325, var1323, buffer.len(var1323))
			buff = var1324
			var1322 = var1325
		end
	end
	local buff_1 = buffer.create(var1322)
	buffer.copy(buff_1, 0, buff, 0, var1322)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1326 = t_45.new()
	local var1327 = 0
	while var1327 < buffer.len(p45) do
		local _ = nil
		local var1328 = nil
		local var1329, var1330, var1331 = protoModule.readTag(p45, var1327)
		local var1332 = var1329
		var1328 = var1330
		var1327 = var1331
		
		if var1328 == protoModule.wireTypes.varint then
			local _ = nil
			local var1333, var1334 = protoModule.readVarInt(p45, var1327)
			local _ = var1333
			var1327 = var1334
			continue
		end
		if var1328 == protoModule.wireTypes.lengthDelimited then
			if var1332 == 1 then
				local _ = nil
				local var1335, var1336 = protoModule.readBuffer(p45, var1327)
				var1327 = var1336
				table.insert(var1326.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1335))
			else
				local _ = nil
				local var1337, var1338 = protoModule.readVarInt(p45, var1327)
				var1327 = var1338 + var1337
			end
		elseif var1328 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1339, var1340 = protoModule.readFixed32(p45, var1327)
			local _ = var1339
			var1327 = var1340
		elseif var1328 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1341, var1342 = protoModule.readFixed64(p45, var1327)
			local _ = var1341
			var1327 = var1342
		else
			error("Unsupported wire type: " .. var2053)
		end
	end
	return var1326
end

function t_45:jsonEncode()
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

function t_45:jsonDecode()
	-- upvalues: t_45 (ref), t (ref)
	local var1343 = t_45.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1343.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1343.game_passes = t_1
	end
	return var1343
end

t_45.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_45
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p46)
	-- upvalues: t_46 (ref)
	return setmetatable({
		game_pass_id = if p46 == nil or p46.game_pass_id == nil then "" else p46.game_pass_id
	}, t_46)
end

function t_46:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1344 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1345, var1346 = protoModule.writeTag(buff, var1344, 1, protoModule.wireTypes.lengthDelimited)
		var1345, var2076 = protoModule.writeString(var1345, var1346, self.game_pass_id)
		buff = var1345
		var1344 = var1346
	end
	local buff_1 = buffer.create(var1344)
	buffer.copy(buff_1, 0, buff, 0, var1344)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1344 = t_46.new()
	local var1345 = 0
	while var1345 < buffer.len(p46) do
		local _ = nil
		local var1346 = nil
		local var1347, var1348, var1349 = protoModule.readTag(p46, var1345)
		local var1350 = var1347
		var1346 = var1348
		var1345 = var1349
		
		if var1346 == protoModule.wireTypes.varint then
			local _ = nil
			local var1351, var1352 = protoModule.readVarInt(p46, var1345)
			local _ = var1351
			var1345 = var1352
			continue
		end
		if var1346 == protoModule.wireTypes.lengthDelimited then
			if var1350 == 1 then
				local _ = nil
				local var1353, var1354 = protoModule.readBuffer(p46, var1345)
				var1345 = var1354
				var1344.game_pass_id = buffer.tostring(var1353)
			else
				local _ = nil
				local var1355, var1356 = protoModule.readVarInt(p46, var1345)
				var1345 = var1356 + var1355
			end
		elseif var1346 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1357, var1358 = protoModule.readFixed32(p46, var1345)
			local _ = var1357
			var1345 = var1358
		elseif var1346 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1359, var1360 = protoModule.readFixed64(p46, var1345)
			local _ = var1359
			var1345 = var1360
		else
			error("Unsupported wire type: " .. var2080)
		end
	end
	return var1344
end

function t_46:jsonEncode()
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_46:jsonDecode()
	-- upvalues: t_46 (ref)
	local var1361 = t_46.new()
	
	if self.game_pass_id ~= nil then
		var1361.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1361.game_pass_id = self.gamePassId
	end
	return var1361
end

t_46.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_46
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p47)
	-- upvalues: t_47 (ref)
	return setmetatable({
		developer_products = if p47 == nil or p47.developer_products == nil then {} else p47.developer_products
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1361 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1362 = v:encode()
			local var1363, var1364 = protoModule.writeTag(buff, var1361, 1, protoModule.wireTypes.lengthDelimited)
			var1363, var2101 = protoModule.writeBuffer(var1363, var1364, var1362, buffer.len(var1362))
			buff = var1363
			var1361 = var1364
		end
	end
	local buff_1 = buffer.create(var1361)
	buffer.copy(buff_1, 0, buff, 0, var1361)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1365 = t_47.new()
	local var1366 = 0
	while var1366 < buffer.len(p47) do
		local _ = nil
		local var1367 = nil
		local var1368, var1369, var1370 = protoModule.readTag(p47, var1366)
		local var1371 = var1368
		var1367 = var1369
		var1366 = var1370
		
		if var1367 == protoModule.wireTypes.varint then
			local _ = nil
			local var1372, var1373 = protoModule.readVarInt(p47, var1366)
			local _ = var1372
			var1366 = var1373
			continue
		end
		if var1367 == protoModule.wireTypes.lengthDelimited then
			if var1371 == 1 then
				local _ = nil
				local var1374, var1375 = protoModule.readBuffer(p47, var1366)
				var1366 = var1375
				table.insert(var1365.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1374))
			else
				local _ = nil
				local var1376, var1377 = protoModule.readVarInt(p47, var1366)
				var1366 = var1377 + var1376
			end
		elseif var1367 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1378, var1379 = protoModule.readFixed32(p47, var1366)
			local _ = var1378
			var1366 = var1379
		elseif var1367 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1380, var1381 = protoModule.readFixed64(p47, var1366)
			local _ = var1380
			var1366 = var1381
		else
			error("Unsupported wire type: " .. var2105)
		end
	end
	return var1365
end

function t_47:jsonEncode()
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

function t_47:jsonDecode()
	-- upvalues: t_47 (ref), t (ref)
	local var1382 = t_47.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1382.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1382.developer_products = t_1
	end
	return var1382
end

t_47.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_47
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p48)
	-- upvalues: t_48 (ref)
	return setmetatable({
		developer_product_id = if p48 == nil or p48.developer_product_id == nil then "" else p48.developer_product_id
	}, t_48)
end

function t_48:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1383 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1384, var1385 = protoModule.writeTag(buff, var1383, 1, protoModule.wireTypes.lengthDelimited)
		var1384, var2128 = protoModule.writeString(var1384, var1385, self.developer_product_id)
		buff = var1384
		var1383 = var1385
	end
	local buff_1 = buffer.create(var1383)
	buffer.copy(buff_1, 0, buff, 0, var1383)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1383 = t_48.new()
	local var1384 = 0
	while var1384 < buffer.len(p48) do
		local _ = nil
		local var1385 = nil
		local var1386, var1387, var1388 = protoModule.readTag(p48, var1384)
		local var1389 = var1386
		var1385 = var1387
		var1384 = var1388
		
		if var1385 == protoModule.wireTypes.varint then
			local _ = nil
			local var1390, var1391 = protoModule.readVarInt(p48, var1384)
			local _ = var1390
			var1384 = var1391
			continue
		end
		if var1385 == protoModule.wireTypes.lengthDelimited then
			if var1389 == 1 then
				local _ = nil
				local var1392, var1393 = protoModule.readBuffer(p48, var1384)
				var1384 = var1393
				var1383.developer_product_id = buffer.tostring(var1392)
			else
				local _ = nil
				local var1394, var1395 = protoModule.readVarInt(p48, var1384)
				var1384 = var1395 + var1394
			end
		elseif var1385 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1396, var1397 = protoModule.readFixed32(p48, var1384)
			local _ = var1396
			var1384 = var1397
		elseif var1385 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1398, var1399 = protoModule.readFixed64(p48, var1384)
			local _ = var1398
			var1384 = var1399
		else
			error("Unsupported wire type: " .. var2132)
		end
	end
	return var1383
end

function t_48:jsonEncode()
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_48:jsonDecode()
	-- upvalues: t_48 (ref)
	local var1400 = t_48.new()
	
	if self.developer_product_id ~= nil then
		var1400.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1400.developer_product_id = self.developerProductId
	end
	return var1400
end

t_48.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_48
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p49)
	-- upvalues: t_49 (ref)
	return setmetatable({
		subscriptions = if p49 == nil or p49.subscriptions == nil then {} else p49.subscriptions
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1400 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1401 = v:encode()
			local var1402, var1403 = protoModule.writeTag(buff, var1400, 1, protoModule.wireTypes.lengthDelimited)
			var1402, var2153 = protoModule.writeBuffer(var1402, var1403, var1401, buffer.len(var1401))
			buff = var1402
			var1400 = var1403
		end
	end
	local buff_1 = buffer.create(var1400)
	buffer.copy(buff_1, 0, buff, 0, var1400)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1404 = t_49.new()
	local var1405 = 0
	while var1405 < buffer.len(p49) do
		local _ = nil
		local var1406 = nil
		local var1407, var1408, var1409 = protoModule.readTag(p49, var1405)
		local var1410 = var1407
		var1406 = var1408
		var1405 = var1409
		
		if var1406 == protoModule.wireTypes.varint then
			local _ = nil
			local var1411, var1412 = protoModule.readVarInt(p49, var1405)
			local _ = var1411
			var1405 = var1412
			continue
		end
		if var1406 == protoModule.wireTypes.lengthDelimited then
			if var1410 == 1 then
				local _ = nil
				local var1413, var1414 = protoModule.readBuffer(p49, var1405)
				var1405 = var1414
				table.insert(var1404.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1413))
			else
				local _ = nil
				local var1415, var1416 = protoModule.readVarInt(p49, var1405)
				var1405 = var1416 + var1415
			end
		elseif var1406 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1417, var1418 = protoModule.readFixed32(p49, var1405)
			local _ = var1417
			var1405 = var1418
		elseif var1406 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1419, var1420 = protoModule.readFixed64(p49, var1405)
			local _ = var1419
			var1405 = var1420
		else
			error("Unsupported wire type: " .. var2157)
		end
	end
	return var1404
end

function t_49:jsonEncode()
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

function t_49:jsonDecode()
	-- upvalues: t_49 (ref), t (ref)
	local var1421 = t_49.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1421.subscriptions = t_1
	end
	return var1421
end

t_49.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_49
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p50)
	-- upvalues: t_50 (ref)
	return setmetatable({
		subscription_id = if p50 == nil or p50.subscription_id == nil then "" else p50.subscription_id
	}, t_50)
end

function t_50:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1422 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1423, var1424 = protoModule.writeTag(buff, var1422, 1, protoModule.wireTypes.lengthDelimited)
		var1423, var2179 = protoModule.writeString(var1423, var1424, self.subscription_id)
		buff = var1423
		var1422 = var1424
	end
	local buff_1 = buffer.create(var1422)
	buffer.copy(buff_1, 0, buff, 0, var1422)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref)
	local var1422 = t_50.new()
	local var1423 = 0
	while var1423 < buffer.len(p50) do
		local _ = nil
		local var1424 = nil
		local var1425, var1426, var1427 = protoModule.readTag(p50, var1423)
		local var1428 = var1425
		var1424 = var1426
		var1423 = var1427
		
		if var1424 == protoModule.wireTypes.varint then
			local _ = nil
			local var1429, var1430 = protoModule.readVarInt(p50, var1423)
			local _ = var1429
			var1423 = var1430
			continue
		end
		if var1424 == protoModule.wireTypes.lengthDelimited then
			if var1428 == 1 then
				local _ = nil
				local var1431, var1432 = protoModule.readBuffer(p50, var1423)
				var1423 = var1432
				var1422.subscription_id = buffer.tostring(var1431)
			else
				local _ = nil
				local var1433, var1434 = protoModule.readVarInt(p50, var1423)
				var1423 = var1434 + var1433
			end
		elseif var1424 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1435, var1436 = protoModule.readFixed32(p50, var1423)
			local _ = var1435
			var1423 = var1436
		elseif var1424 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1437, var1438 = protoModule.readFixed64(p50, var1423)
			local _ = var1437
			var1423 = var1438
		else
			error("Unsupported wire type: " .. var2183)
		end
	end
	return var1422
end

function t_50:jsonEncode()
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_50:jsonDecode()
	-- upvalues: t_50 (ref)
	local var1439 = t_50.new()
	
	if self.subscription_id ~= nil then
		var1439.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1439.subscription_id = self.subscriptionId
	end
	return var1439
end

t_50.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_50
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p51)
	-- upvalues: t_51 (ref)
	return setmetatable({
		items = if p51 == nil or p51.items == nil then {} else p51.items,
		universe_id = if p51 == nil or p51.universe_id == nil then "" else p51.universe_id,
		section_title = if p51 == nil or p51.section_title == nil then "" else p51.section_title,
		creator_key = if p51 == nil or p51.creator_key == nil then "" else p51.creator_key,
		collection_item_size = if p51 == nil or p51.collection_item_size == nil then "" else p51.collection_item_size,
		item_height_mode = if p51 == nil or p51.item_height_mode == nil then "" else p51.item_height_mode,
		experience_store_product_type = if p51 == nil or p51.experience_store_product_type == nil then "" else p51.experience_store_product_type,
		content_type = if p51 == nil or p51.content_type == nil then "" else p51.content_type,
		item_type = if p51 == nil or p51.item_type == nil then "" else p51.item_type,
		filter_category_id = if p51 == nil or p51.filter_category_id == nil then "" else p51.filter_category_id
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1439 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1440 = v:encode()
			local var1441, var1442 = protoModule.writeTag(buff, var1439, 1, protoModule.wireTypes.lengthDelimited)
			var1441, var2204 = protoModule.writeBuffer(var1441, var1442, var1440, buffer.len(var1440))
			buff = var1441
			var1439 = var1442
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1443, var1444 = protoModule.writeTag(buff, var1439, 2, protoModule.wireTypes.lengthDelimited)
		var1443, var2206 = protoModule.writeString(var1443, var1444, self.universe_id)
		buff = var1443
		var1439 = var1444
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1445, var1446 = protoModule.writeTag(buff, var1439, 3, protoModule.wireTypes.lengthDelimited)
		var1445, var2208 = protoModule.writeString(var1445, var1446, self.section_title)
		buff = var1445
		var1439 = var1446
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1447, var1448 = protoModule.writeTag(buff, var1439, 4, protoModule.wireTypes.lengthDelimited)
		var1447, var2210 = protoModule.writeString(var1447, var1448, self.creator_key)
		buff = var1447
		var1439 = var1448
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1449, var1450 = protoModule.writeTag(buff, var1439, 5, protoModule.wireTypes.lengthDelimited)
		var1449, var2212 = protoModule.writeString(var1449, var1450, self.collection_item_size)
		buff = var1449
		var1439 = var1450
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1451, var1452 = protoModule.writeTag(buff, var1439, 6, protoModule.wireTypes.lengthDelimited)
		var1451, var2214 = protoModule.writeString(var1451, var1452, self.item_height_mode)
		buff = var1451
		var1439 = var1452
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1453, var1454 = protoModule.writeTag(buff, var1439, 7, protoModule.wireTypes.lengthDelimited)
		var1453, var2216 = protoModule.writeString(var1453, var1454, self.experience_store_product_type)
		buff = var1453
		var1439 = var1454
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1455, var1456 = protoModule.writeTag(buff, var1439, 8, protoModule.wireTypes.lengthDelimited)
		var1455, var2218 = protoModule.writeString(var1455, var1456, self.content_type)
		buff = var1455
		var1439 = var1456
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1457, var1458 = protoModule.writeTag(buff, var1439, 9, protoModule.wireTypes.lengthDelimited)
		var1457, var2220 = protoModule.writeString(var1457, var1458, self.item_type)
		buff = var1457
		var1439 = var1458
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1459, var1460 = protoModule.writeTag(buff, var1439, 10, protoModule.wireTypes.lengthDelimited)
		var1459, var2222 = protoModule.writeString(var1459, var1460, self.filter_category_id)
		buff = var1459
		var1439 = var1460
	end
	local buff_1 = buffer.create(var1439)
	buffer.copy(buff_1, 0, buff, 0, var1439)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1461 = t_51.new()
	local var1462 = 0
	while var1462 < buffer.len(p51) do
		local _ = nil
		local var1463 = nil
		local var1464, var1465, var1466 = protoModule.readTag(p51, var1462)
		local var1467 = var1464
		var1463 = var1465
		var1462 = var1466
		
		if var1463 == protoModule.wireTypes.varint then
			local _ = nil
			local var1468, var1469 = protoModule.readVarInt(p51, var1462)
			local _ = var1468
			var1462 = var1469
			continue
		end
		if var1463 == protoModule.wireTypes.lengthDelimited then
			if var1467 == 1 then
				local _ = nil
				local var1470, var1471 = protoModule.readBuffer(p51, var1462)
				var1462 = var1471
				table.insert(var1461.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1470))
			elseif var1467 == 2 then
				local _ = nil
				local var1472, var1473 = protoModule.readBuffer(p51, var1462)
				var1462 = var1473
				var1461.universe_id = buffer.tostring(var1472)
			elseif var1467 == 3 then
				local _ = nil
				local var1474, var1475 = protoModule.readBuffer(p51, var1462)
				var1462 = var1475
				var1461.section_title = buffer.tostring(var1474)
			elseif var1467 == 4 then
				local _ = nil
				local var1476, var1477 = protoModule.readBuffer(p51, var1462)
				var1462 = var1477
				var1461.creator_key = buffer.tostring(var1476)
			elseif var1467 == 5 then
				local _ = nil
				local var1478, var1479 = protoModule.readBuffer(p51, var1462)
				var1462 = var1479
				var1461.collection_item_size = buffer.tostring(var1478)
			elseif var1467 == 6 then
				local _ = nil
				local var1480, var1481 = protoModule.readBuffer(p51, var1462)
				var1462 = var1481
				var1461.item_height_mode = buffer.tostring(var1480)
			elseif var1467 == 7 then
				local _ = nil
				local var1482, var1483 = protoModule.readBuffer(p51, var1462)
				var1462 = var1483
				var1461.experience_store_product_type = buffer.tostring(var1482)
			elseif var1467 == 8 then
				local _ = nil
				local var1484, var1485 = protoModule.readBuffer(p51, var1462)
				var1462 = var1485
				var1461.content_type = buffer.tostring(var1484)
			elseif var1467 == 9 then
				local _ = nil
				local var1486, var1487 = protoModule.readBuffer(p51, var1462)
				var1462 = var1487
				var1461.item_type = buffer.tostring(var1486)
			elseif var1467 == 10 then
				local _ = nil
				local var1488, var1489 = protoModule.readBuffer(p51, var1462)
				var1462 = var1489
				var1461.filter_category_id = buffer.tostring(var1488)
			else
				local _ = nil
				local var1490, var1491 = protoModule.readVarInt(p51, var1462)
				var1462 = var1491 + var1490
			end
		elseif var1463 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1492, var1493 = protoModule.readFixed32(p51, var1462)
			local _ = var1492
			var1462 = var1493
		elseif var1463 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1494, var1495 = protoModule.readFixed64(p51, var1462)
			local _ = var1494
			var1462 = var1495
		else
			error("Unsupported wire type: " .. var2226)
		end
	end
	return var1461
end

function t_51:jsonEncode()
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

function t_51:jsonDecode()
	-- upvalues: t_51 (ref), t (ref)
	local var1496 = t_51.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1496.items = t_1
	end
	if self.universe_id ~= nil then
		var1496.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1496.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1496.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1496.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1496.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1496.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1496.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1496.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1496.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1496.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1496.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1496.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1496.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1496.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1496.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1496.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1496.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1496.filter_category_id = self.filterCategoryId
	end
	return var1496
end

t_51.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_51
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p52)
	-- upvalues: t (ref), t_52 (ref)
	return setmetatable({
		item_id = if p52 == nil or p52.item_id == nil then "" else p52.item_id,
		identifier = if p52 == nil or p52.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p52.identifier
	}, t_52)
end

function t_52:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1497 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1498, var1499 = protoModule.writeTag(buff, var1497, 1, protoModule.wireTypes.lengthDelimited)
		var1498, var2266 = protoModule.writeString(var1498, var1499, self.item_id)
		buff = var1498
		var1497 = var1499
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1500, var1501 = protoModule.writeTag(buff, var1497, 2, protoModule.wireTypes.varint)
		var1500, var2268 = protoModule.writeVarInt(var1500, var1501, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1500
		var1497 = var1501
	end
	local buff_1 = buffer.create(var1497)
	buffer.copy(buff_1, 0, buff, 0, var1497)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1497 = t_52.new()
	local var1498 = 0
	while var1498 < buffer.len(p52) do
		local _ = nil
		local var1499 = nil
		local var1500, var1501, var1502 = protoModule.readTag(p52, var1498)
		local var1503 = var1500
		var1499 = var1501
		var1498 = var1502
		
		if var1499 == protoModule.wireTypes.varint then
			if var1503 == 2 then
				local _ = nil
				local var1504, var1505 = protoModule.readVarIntI32(p52, var1498)
				local var1506 = var1504
				var1498 = var1505
				var1497.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1506) or var1506
			else
				local _ = nil
				local var1507, var1508 = protoModule.readVarInt(p52, var1498)
				local _ = var1507
				var1498 = var1508
			end
		end
		if var1499 == protoModule.wireTypes.lengthDelimited then
			if var1503 == 1 then
				local _ = nil
				local var1509, var1510 = protoModule.readBuffer(p52, var1498)
				var1498 = var1510
				var1497.item_id = buffer.tostring(var1509)
			else
				local _ = nil
				local var1511, var1512 = protoModule.readVarInt(p52, var1498)
				var1498 = var1512 + var1511
			end
		elseif var1499 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1513, var1514 = protoModule.readFixed32(p52, var1498)
			local _ = var1513
			var1498 = var1514
		elseif var1499 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1515, var1516 = protoModule.readFixed64(p52, var1498)
			local _ = var1515
			var1498 = var1516
		else
			error("Unsupported wire type: " .. var2272)
		end
	end
	return var1497
end

function t_52:jsonEncode()
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

function t_52:jsonDecode()
	-- upvalues: t_52 (ref), t (ref)
	local var1517 = t_52.new()
	
	if self.item_id ~= nil then
		var1517.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1517.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1517.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1517
end

t_52.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_52
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p53)
		return if p53 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p53 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p53 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p53 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p53)
		return if p53 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p53 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p53 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p53 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p53
	end,
	fromName = function(p53)
		return if p53 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p53 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p53 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p53 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_53 = {}
t_53.__index = t_53

function t_53.new(p53)
	-- upvalues: t_53 (ref)
	return setmetatable({
		roblox_component = if p53 == nil or p53.roblox_component == nil then "" else p53.roblox_component,
		identifier = if p53 == nil or p53.identifier == nil then "" else p53.identifier,
		title = if p53 == nil or p53.title == nil then "" else p53.title,
		user_id = if p53 == nil or p53.user_id == nil then "" else p53.user_id,
		description = if p53 == nil or p53.description == nil then "" else p53.description,
		cta_text = if p53 == nil or p53.cta_text == nil then "" else p53.cta_text,
		prompt_id = if p53 == nil or p53.prompt_id == nil then "" else p53.prompt_id,
		prompt_type = if p53 == nil or p53.prompt_type == nil then "" else p53.prompt_type,
		entity_id = if p53 == nil or p53.entity_id == nil then "" else p53.entity_id
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1517 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1518, var1519 = protoModule.writeTag(buff, var1517, 1, protoModule.wireTypes.lengthDelimited)
		var1518, var2295 = protoModule.writeString(var1518, var1519, self.roblox_component)
		buff = var1518
		var1517 = var1519
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1520, var1521 = protoModule.writeTag(buff, var1517, 2, protoModule.wireTypes.lengthDelimited)
		var1520, var2297 = protoModule.writeString(var1520, var1521, self.identifier)
		buff = var1520
		var1517 = var1521
	end
	if self.title ~= nil and self.title ~= "" then
		local var1522, var1523 = protoModule.writeTag(buff, var1517, 3, protoModule.wireTypes.lengthDelimited)
		var1522, var2299 = protoModule.writeString(var1522, var1523, self.title)
		buff = var1522
		var1517 = var1523
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1524, var1525 = protoModule.writeTag(buff, var1517, 4, protoModule.wireTypes.lengthDelimited)
		var1524, var2301 = protoModule.writeString(var1524, var1525, self.user_id)
		buff = var1524
		var1517 = var1525
	end
	if self.description ~= nil and self.description ~= "" then
		local var1526, var1527 = protoModule.writeTag(buff, var1517, 5, protoModule.wireTypes.lengthDelimited)
		var1526, var2303 = protoModule.writeString(var1526, var1527, self.description)
		buff = var1526
		var1517 = var1527
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1528, var1529 = protoModule.writeTag(buff, var1517, 6, protoModule.wireTypes.lengthDelimited)
		var1528, var2305 = protoModule.writeString(var1528, var1529, self.cta_text)
		buff = var1528
		var1517 = var1529
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1530, var1531 = protoModule.writeTag(buff, var1517, 7, protoModule.wireTypes.lengthDelimited)
		var1530, var2307 = protoModule.writeString(var1530, var1531, self.prompt_id)
		buff = var1530
		var1517 = var1531
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1532, var1533 = protoModule.writeTag(buff, var1517, 8, protoModule.wireTypes.lengthDelimited)
		var1532, var2309 = protoModule.writeString(var1532, var1533, self.prompt_type)
		buff = var1532
		var1517 = var1533
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1534, var1535 = protoModule.writeTag(buff, var1517, 9, protoModule.wireTypes.lengthDelimited)
		var1534, var2311 = protoModule.writeString(var1534, var1535, self.entity_id)
		buff = var1534
		var1517 = var1535
	end
	local buff_1 = buffer.create(var1517)
	buffer.copy(buff_1, 0, buff, 0, var1517)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref)
	local var1517 = t_53.new()
	local var1518 = 0
	while var1518 < buffer.len(p53) do
		local _ = nil
		local var1519 = nil
		local var1520, var1521, var1522 = protoModule.readTag(p53, var1518)
		local var1523 = var1520
		var1519 = var1521
		var1518 = var1522
		
		if var1519 == protoModule.wireTypes.varint then
			local _ = nil
			local var1524, var1525 = protoModule.readVarInt(p53, var1518)
			local _ = var1524
			var1518 = var1525
			continue
		end
		if var1519 == protoModule.wireTypes.lengthDelimited then
			if var1523 == 1 then
				local _ = nil
				local var1526, var1527 = protoModule.readBuffer(p53, var1518)
				var1518 = var1527
				var1517.roblox_component = buffer.tostring(var1526)
			elseif var1523 == 2 then
				local _ = nil
				local var1528, var1529 = protoModule.readBuffer(p53, var1518)
				var1518 = var1529
				var1517.identifier = buffer.tostring(var1528)
			elseif var1523 == 3 then
				local _ = nil
				local var1530, var1531 = protoModule.readBuffer(p53, var1518)
				var1518 = var1531
				var1517.title = buffer.tostring(var1530)
			elseif var1523 == 4 then
				local _ = nil
				local var1532, var1533 = protoModule.readBuffer(p53, var1518)
				var1518 = var1533
				var1517.user_id = buffer.tostring(var1532)
			elseif var1523 == 5 then
				local _ = nil
				local var1534, var1535 = protoModule.readBuffer(p53, var1518)
				var1518 = var1535
				var1517.description = buffer.tostring(var1534)
			elseif var1523 == 6 then
				local _ = nil
				local var1536, var1537 = protoModule.readBuffer(p53, var1518)
				var1518 = var1537
				var1517.cta_text = buffer.tostring(var1536)
			elseif var1523 == 7 then
				local _ = nil
				local var1538, var1539 = protoModule.readBuffer(p53, var1518)
				var1518 = var1539
				var1517.prompt_id = buffer.tostring(var1538)
			elseif var1523 == 8 then
				local _ = nil
				local var1540, var1541 = protoModule.readBuffer(p53, var1518)
				var1518 = var1541
				var1517.prompt_type = buffer.tostring(var1540)
			elseif var1523 == 9 then
				local _ = nil
				local var1542, var1543 = protoModule.readBuffer(p53, var1518)
				var1518 = var1543
				var1517.entity_id = buffer.tostring(var1542)
			else
				local _ = nil
				local var1544, var1545 = protoModule.readVarInt(p53, var1518)
				var1518 = var1545 + var1544
			end
		elseif var1519 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1546, var1547 = protoModule.readFixed32(p53, var1518)
			local _ = var1546
			var1518 = var1547
		elseif var1519 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1548, var1549 = protoModule.readFixed64(p53, var1518)
			local _ = var1548
			var1518 = var1549
		else
			error("Unsupported wire type: " .. var2315)
		end
	end
	return var1517
end

function t_53:jsonEncode()
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

function t_53:jsonDecode()
	-- upvalues: t_53 (ref)
	local var1550 = t_53.new()
	
	if self.roblox_component ~= nil then
		var1550.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1550.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1550.identifier = self.identifier
	end
	if self.title ~= nil then
		var1550.title = self.title
	end
	if self.user_id ~= nil then
		var1550.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1550.user_id = self.userId
	end
	if self.description ~= nil then
		var1550.description = self.description
	end
	if self.cta_text ~= nil then
		var1550.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1550.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1550.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1550.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1550.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1550.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1550.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1550.entity_id = self.entityId
	end
	return var1550
end

t_53.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_53
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p54)
	-- upvalues: t_54 (ref)
	return setmetatable({
		group_id = if p54 == nil or p54.group_id == nil then "" else p54.group_id,
		experience_id = if p54 == nil or p54.experience_id == nil then "" else p54.experience_id
	}, t_54)
end

function t_54:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1550 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1551, var1552 = protoModule.writeTag(buff, var1550, 1, protoModule.wireTypes.lengthDelimited)
		var1551, var2351 = protoModule.writeString(var1551, var1552, self.group_id)
		buff = var1551
		var1550 = var1552
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1553, var1554 = protoModule.writeTag(buff, var1550, 2, protoModule.wireTypes.lengthDelimited)
		var1553, var2353 = protoModule.writeString(var1553, var1554, self.experience_id)
		buff = var1553
		var1550 = var1554
	end
	local buff_1 = buffer.create(var1550)
	buffer.copy(buff_1, 0, buff, 0, var1550)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1550 = t_54.new()
	local var1551 = 0
	while var1551 < buffer.len(p54) do
		local _ = nil
		local var1552 = nil
		local var1553, var1554, var1555 = protoModule.readTag(p54, var1551)
		local var1556 = var1553
		var1552 = var1554
		var1551 = var1555
		
		if var1552 == protoModule.wireTypes.varint then
			local _ = nil
			local var1557, var1558 = protoModule.readVarInt(p54, var1551)
			local _ = var1557
			var1551 = var1558
			continue
		end
		if var1552 == protoModule.wireTypes.lengthDelimited then
			if var1556 == 1 then
				local _ = nil
				local var1559, var1560 = protoModule.readBuffer(p54, var1551)
				var1551 = var1560
				var1550.group_id = buffer.tostring(var1559)
			elseif var1556 == 2 then
				local _ = nil
				local var1561, var1562 = protoModule.readBuffer(p54, var1551)
				var1551 = var1562
				var1550.experience_id = buffer.tostring(var1561)
			else
				local _ = nil
				local var1563, var1564 = protoModule.readVarInt(p54, var1551)
				var1551 = var1564 + var1563
			end
		elseif var1552 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1565, var1566 = protoModule.readFixed32(p54, var1551)
			local _ = var1565
			var1551 = var1566
		elseif var1552 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1567, var1568 = protoModule.readFixed64(p54, var1551)
			local _ = var1567
			var1551 = var1568
		else
			error("Unsupported wire type: " .. var2357)
		end
	end
	return var1550
end

function t_54:jsonEncode()
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_54:jsonDecode()
	-- upvalues: t_54 (ref)
	local var1569 = t_54.new()
	
	if self.group_id ~= nil then
		var1569.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1569.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1569.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1569.experience_id = self.experienceId
	end
	return var1569
end

t_54.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_54
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p55)
	-- upvalues: t_55 (ref)
	return setmetatable({
		title = if p55 == nil or p55.title == nil then "" else p55.title,
		dismiss_text = if p55 == nil or p55.dismiss_text == nil then "" else p55.dismiss_text,
		user_id = if p55 == nil or p55.user_id == nil then "" else p55.user_id,
		cards = if p55 == nil or p55.cards == nil then {} else p55.cards,
		prompt_id = if p55 == nil or p55.prompt_id == nil then "" else p55.prompt_id,
		prompt_type = if p55 == nil or p55.prompt_type == nil then "" else p55.prompt_type,
		sort_id = if p55 == nil or p55.sort_id == nil then "" else p55.sort_id,
		feed_item_key = if p55 == nil or p55.feed_item_key == nil then "" else p55.feed_item_key,
		client_attributes = if p55 == nil or p55.client_attributes == nil then nil else p55.client_attributes
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1569 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1570, var1571 = protoModule.writeTag(buff, var1569, 1, protoModule.wireTypes.lengthDelimited)
		var1570, var2379 = protoModule.writeString(var1570, var1571, self.title)
		buff = var1570
		var1569 = var1571
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1572, var1573 = protoModule.writeTag(buff, var1569, 2, protoModule.wireTypes.lengthDelimited)
		var1572, var2381 = protoModule.writeString(var1572, var1573, self.dismiss_text)
		buff = var1572
		var1569 = var1573
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1574, var1575 = protoModule.writeTag(buff, var1569, 3, protoModule.wireTypes.lengthDelimited)
		var1574, var2383 = protoModule.writeString(var1574, var1575, self.user_id)
		buff = var1574
		var1569 = var1575
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1576 = v:encode()
			local var1577, var1578 = protoModule.writeTag(buff, var1569, 4, protoModule.wireTypes.lengthDelimited)
			var1577, var2386 = protoModule.writeBuffer(var1577, var1578, var1576, buffer.len(var1576))
			buff = var1577
			var1569 = var1578
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1579, var1580 = protoModule.writeTag(buff, var1569, 5, protoModule.wireTypes.lengthDelimited)
		var1579, var2388 = protoModule.writeString(var1579, var1580, self.prompt_id)
		buff = var1579
		var1569 = var1580
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1581, var1582 = protoModule.writeTag(buff, var1569, 6, protoModule.wireTypes.lengthDelimited)
		var1581, var2390 = protoModule.writeString(var1581, var1582, self.prompt_type)
		buff = var1581
		var1569 = var1582
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1583, var1584 = protoModule.writeTag(buff, var1569, 7, protoModule.wireTypes.lengthDelimited)
		var1583, var2392 = protoModule.writeString(var1583, var1584, self.sort_id)
		buff = var1583
		var1569 = var1584
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1585, var1586 = protoModule.writeTag(buff, var1569, 8, protoModule.wireTypes.lengthDelimited)
		var1585, var2394 = protoModule.writeString(var1585, var1586, self.feed_item_key)
		buff = var1585
		var1569 = var1586
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1587 = self.client_attributes.value:encode()
		local var1588, var1589 = protoModule.writeTag(buff, var1569, 9, protoModule.wireTypes.lengthDelimited)
		var1588, var2397 = protoModule.writeBuffer(var1588, var1589, var1587, buffer.len(var1587))
		buff = var1588
		var1569 = var1589
	end
	local buff_1 = buffer.create(var1569)
	buffer.copy(buff_1, 0, buff, 0, var1569)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref), t (ref)
	local var1590 = t_55.new()
	local var1591 = 0
	while var1591 < buffer.len(p55) do
		local _ = nil
		local var1592 = nil
		local var1593, var1594, var1595 = protoModule.readTag(p55, var1591)
		local var1596 = var1593
		var1592 = var1594
		var1591 = var1595
		
		if var1592 == protoModule.wireTypes.varint then
			local _ = nil
			local var1597, var1598 = protoModule.readVarInt(p55, var1591)
			local _ = var1597
			var1591 = var1598
			continue
		end
		if var1592 == protoModule.wireTypes.lengthDelimited then
			if var1596 == 1 then
				local _ = nil
				local var1599, var1600 = protoModule.readBuffer(p55, var1591)
				var1591 = var1600
				var1590.title = buffer.tostring(var1599)
			elseif var1596 == 2 then
				local _ = nil
				local var1601, var1602 = protoModule.readBuffer(p55, var1591)
				var1591 = var1602
				var1590.dismiss_text = buffer.tostring(var1601)
			elseif var1596 == 3 then
				local _ = nil
				local var1603, var1604 = protoModule.readBuffer(p55, var1591)
				var1591 = var1604
				var1590.user_id = buffer.tostring(var1603)
			elseif var1596 == 4 then
				local _ = nil
				local var1605, var1606 = protoModule.readBuffer(p55, var1591)
				var1591 = var1606
				table.insert(var1590.cards, t.CardContainerCardInputData.decode(var1605))
			elseif var1596 == 5 then
				local _ = nil
				local var1607, var1608 = protoModule.readBuffer(p55, var1591)
				var1591 = var1608
				var1590.prompt_id = buffer.tostring(var1607)
			elseif var1596 == 6 then
				local _ = nil
				local var1609, var1610 = protoModule.readBuffer(p55, var1591)
				var1591 = var1610
				var1590.prompt_type = buffer.tostring(var1609)
			elseif var1596 == 7 then
				local _ = nil
				local var1611, var1612 = protoModule.readBuffer(p55, var1591)
				var1591 = var1612
				var1590.sort_id = buffer.tostring(var1611)
			elseif var1596 == 8 then
				local _ = nil
				local var1613, var1614 = protoModule.readBuffer(p55, var1591)
				var1591 = var1614
				var1590.feed_item_key = buffer.tostring(var1613)
			elseif var1596 == 9 then
				local _ = nil
				local var1615, var1616 = protoModule.readBuffer(p55, var1591)
				var1591 = var1616
				var1590.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1615)
				}
			else
				local _ = nil
				local var1617, var1618 = protoModule.readVarInt(p55, var1591)
				var1591 = var1618 + var1617
			end
		elseif var1592 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1619, var1620 = protoModule.readFixed32(p55, var1591)
			local _ = var1619
			var1591 = var1620
		elseif var1592 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1621, var1622 = protoModule.readFixed64(p55, var1591)
			local _ = var1621
			var1591 = var1622
		else
			error("Unsupported wire type: " .. var2401)
		end
	end
	return var1590
end

function t_55:jsonEncode()
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

function t_55:jsonDecode()
	-- upvalues: t_55 (ref), t (ref)
	local var1623 = t_55.new()
	
	if self.title ~= nil then
		var1623.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1623.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1623.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1623.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1623.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1623.cards = t_1
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
	if self.sort_id ~= nil then
		var1623.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1623.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1623.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1623.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1623.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1623.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1623
end

t_55.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_55
typeRegistryModule.default:register(t.CardContainerInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p56)
	-- upvalues: t_56 (ref)
	return setmetatable({
		title = if p56 == nil or p56.title == nil then "" else p56.title,
		user_id = if p56 == nil or p56.user_id == nil then "" else p56.user_id,
		description = if p56 == nil or p56.description == nil then "" else p56.description,
		cta_text = if p56 == nil or p56.cta_text == nil then "" else p56.cta_text,
		prompt_id = if p56 == nil or p56.prompt_id == nil then "" else p56.prompt_id,
		prompt_type = if p56 == nil or p56.prompt_type == nil then "" else p56.prompt_type,
		entity_id = if p56 == nil or p56.entity_id == nil then "" else p56.entity_id
	}, t_56)
end

function t_56:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1624 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1625, var1626 = protoModule.writeTag(buff, var1624, 1, protoModule.wireTypes.lengthDelimited)
		var1625, var2439 = protoModule.writeString(var1625, var1626, self.title)
		buff = var1625
		var1624 = var1626
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1627, var1628 = protoModule.writeTag(buff, var1624, 2, protoModule.wireTypes.lengthDelimited)
		var1627, var2441 = protoModule.writeString(var1627, var1628, self.user_id)
		buff = var1627
		var1624 = var1628
	end
	if self.description ~= nil and self.description ~= "" then
		local var1629, var1630 = protoModule.writeTag(buff, var1624, 3, protoModule.wireTypes.lengthDelimited)
		var1629, var2443 = protoModule.writeString(var1629, var1630, self.description)
		buff = var1629
		var1624 = var1630
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1631, var1632 = protoModule.writeTag(buff, var1624, 4, protoModule.wireTypes.lengthDelimited)
		var1631, var2445 = protoModule.writeString(var1631, var1632, self.cta_text)
		buff = var1631
		var1624 = var1632
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1633, var1634 = protoModule.writeTag(buff, var1624, 5, protoModule.wireTypes.lengthDelimited)
		var1633, var2447 = protoModule.writeString(var1633, var1634, self.prompt_id)
		buff = var1633
		var1624 = var1634
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1635, var1636 = protoModule.writeTag(buff, var1624, 6, protoModule.wireTypes.lengthDelimited)
		var1635, var2449 = protoModule.writeString(var1635, var1636, self.prompt_type)
		buff = var1635
		var1624 = var1636
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1637, var1638 = protoModule.writeTag(buff, var1624, 7, protoModule.wireTypes.lengthDelimited)
		var1637, var2451 = protoModule.writeString(var1637, var1638, self.entity_id)
		buff = var1637
		var1624 = var1638
	end
	local buff_1 = buffer.create(var1624)
	buffer.copy(buff_1, 0, buff, 0, var1624)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1624 = t_56.new()
	local var1625 = 0
	while var1625 < buffer.len(p56) do
		local _ = nil
		local var1626 = nil
		local var1627, var1628, var1629 = protoModule.readTag(p56, var1625)
		local var1630 = var1627
		var1626 = var1628
		var1625 = var1629
		
		if var1626 == protoModule.wireTypes.varint then
			local _ = nil
			local var1631, var1632 = protoModule.readVarInt(p56, var1625)
			local _ = var1631
			var1625 = var1632
			continue
		end
		if var1626 == protoModule.wireTypes.lengthDelimited then
			if var1630 == 1 then
				local _ = nil
				local var1633, var1634 = protoModule.readBuffer(p56, var1625)
				var1625 = var1634
				var1624.title = buffer.tostring(var1633)
			elseif var1630 == 2 then
				local _ = nil
				local var1635, var1636 = protoModule.readBuffer(p56, var1625)
				var1625 = var1636
				var1624.user_id = buffer.tostring(var1635)
			elseif var1630 == 3 then
				local _ = nil
				local var1637, var1638 = protoModule.readBuffer(p56, var1625)
				var1625 = var1638
				var1624.description = buffer.tostring(var1637)
			elseif var1630 == 4 then
				local _ = nil
				local var1639, var1640 = protoModule.readBuffer(p56, var1625)
				var1625 = var1640
				var1624.cta_text = buffer.tostring(var1639)
			elseif var1630 == 5 then
				local _ = nil
				local var1641, var1642 = protoModule.readBuffer(p56, var1625)
				var1625 = var1642
				var1624.prompt_id = buffer.tostring(var1641)
			elseif var1630 == 6 then
				local _ = nil
				local var1643, var1644 = protoModule.readBuffer(p56, var1625)
				var1625 = var1644
				var1624.prompt_type = buffer.tostring(var1643)
			elseif var1630 == 7 then
				local _ = nil
				local var1645, var1646 = protoModule.readBuffer(p56, var1625)
				var1625 = var1646
				var1624.entity_id = buffer.tostring(var1645)
			else
				local _ = nil
				local var1647, var1648 = protoModule.readVarInt(p56, var1625)
				var1625 = var1648 + var1647
			end
		elseif var1626 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1649, var1650 = protoModule.readFixed32(p56, var1625)
			local _ = var1649
			var1625 = var1650
		elseif var1626 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1651, var1652 = protoModule.readFixed64(p56, var1625)
			local _ = var1651
			var1625 = var1652
		else
			error("Unsupported wire type: " .. var2455)
		end
	end
	return var1624
end

function t_56:jsonEncode()
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

function t_56:jsonDecode()
	-- upvalues: t_56 (ref)
	local var1653 = t_56.new()
	
	if self.title ~= nil then
		var1653.title = self.title
	end
	if self.user_id ~= nil then
		var1653.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1653.user_id = self.userId
	end
	if self.description ~= nil then
		var1653.description = self.description
	end
	if self.cta_text ~= nil then
		var1653.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1653.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1653.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1653.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1653.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1653.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1653.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1653.entity_id = self.entityId
	end
	return var1653
end

t_56.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_56
typeRegistryModule.default:register(t.CardInputData)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p57)
	-- upvalues: t_57 (ref)
	return setmetatable({
		prompt_id = if p57 == nil or p57.prompt_id == nil then "" else p57.prompt_id,
		prompt_type = if p57 == nil or p57.prompt_type == nil then "" else p57.prompt_type,
		user_id = if p57 == nil or p57.user_id == nil then "" else p57.user_id,
		audit_data = if p57 == nil or p57.audit_data == nil then "" else p57.audit_data
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1653 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1654, var1655 = protoModule.writeTag(buff, var1653, 1, protoModule.wireTypes.lengthDelimited)
		var1654, var2487 = protoModule.writeString(var1654, var1655, self.prompt_id)
		buff = var1654
		var1653 = var1655
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1656, var1657 = protoModule.writeTag(buff, var1653, 2, protoModule.wireTypes.lengthDelimited)
		var1656, var2489 = protoModule.writeString(var1656, var1657, self.prompt_type)
		buff = var1656
		var1653 = var1657
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1658, var1659 = protoModule.writeTag(buff, var1653, 3, protoModule.wireTypes.lengthDelimited)
		var1658, var2491 = protoModule.writeString(var1658, var1659, self.user_id)
		buff = var1658
		var1653 = var1659
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1660, var1661 = protoModule.writeTag(buff, var1653, 4, protoModule.wireTypes.lengthDelimited)
		var1660, var2493 = protoModule.writeString(var1660, var1661, self.audit_data)
		buff = var1660
		var1653 = var1661
	end
	local buff_1 = buffer.create(var1653)
	buffer.copy(buff_1, 0, buff, 0, var1653)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref)
	local var1653 = t_57.new()
	local var1654 = 0
	while var1654 < buffer.len(p57) do
		local _ = nil
		local var1655 = nil
		local var1656, var1657, var1658 = protoModule.readTag(p57, var1654)
		local var1659 = var1656
		var1655 = var1657
		var1654 = var1658
		
		if var1655 == protoModule.wireTypes.varint then
			local _ = nil
			local var1660, var1661 = protoModule.readVarInt(p57, var1654)
			local _ = var1660
			var1654 = var1661
			continue
		end
		if var1655 == protoModule.wireTypes.lengthDelimited then
			if var1659 == 1 then
				local _ = nil
				local var1662, var1663 = protoModule.readBuffer(p57, var1654)
				var1654 = var1663
				var1653.prompt_id = buffer.tostring(var1662)
			elseif var1659 == 2 then
				local _ = nil
				local var1664, var1665 = protoModule.readBuffer(p57, var1654)
				var1654 = var1665
				var1653.prompt_type = buffer.tostring(var1664)
			elseif var1659 == 3 then
				local _ = nil
				local var1666, var1667 = protoModule.readBuffer(p57, var1654)
				var1654 = var1667
				var1653.user_id = buffer.tostring(var1666)
			elseif var1659 == 4 then
				local _ = nil
				local var1668, var1669 = protoModule.readBuffer(p57, var1654)
				var1654 = var1669
				var1653.audit_data = buffer.tostring(var1668)
			else
				local _ = nil
				local var1670, var1671 = protoModule.readVarInt(p57, var1654)
				var1654 = var1671 + var1670
			end
		elseif var1655 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1672, var1673 = protoModule.readFixed32(p57, var1654)
			local _ = var1672
			var1654 = var1673
		elseif var1655 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1674, var1675 = protoModule.readFixed64(p57, var1654)
			local _ = var1674
			var1654 = var1675
		else
			error("Unsupported wire type: " .. var2497)
		end
	end
	return var1653
end

function t_57:jsonEncode()
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

function t_57:jsonDecode()
	-- upvalues: t_57 (ref)
	local var1676 = t_57.new()
	
	if self.prompt_id ~= nil then
		var1676.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1676.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1676.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1676.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1676.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1676.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1676.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1676.audit_data = self.auditData
	end
	return var1676
end

t_57.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_57
typeRegistryModule.default:register(t.DialogInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p58)
	-- upvalues: t_58 (ref)
	return setmetatable({
		sender_count = if p58 == nil or p58.sender_count == nil then 0 else p58.sender_count,
		total_robux_amount = if p58 == nil or p58.total_robux_amount == nil then 0 else p58.total_robux_amount
	}, t_58)
end

function t_58:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1676 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1677, var1678 = protoModule.writeTag(buff, var1676, 1, protoModule.wireTypes.varint)
		var1677, var2523 = protoModule.writeVarInt(var1677, var1678, self.sender_count)
		buff = var1677
		var1676 = var1678
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1679, var1680 = protoModule.writeTag(buff, var1676, 2, protoModule.wireTypes.varint)
		var1679, var2525 = protoModule.writeVarInt(var1679, var1680, self.total_robux_amount)
		buff = var1679
		var1676 = var1680
	end
	local buff_1 = buffer.create(var1676)
	buffer.copy(buff_1, 0, buff, 0, var1676)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1676 = t_58.new()
	local var1677 = 0
	while var1677 < buffer.len(p58) do
		local _ = nil
		local _ = nil
		local var1678, var1679, var1680 = protoModule.readTag(p58, var1677)
		local var1681 = var1678
		local var1682 = var1679
		var1677 = var1680
		
		if var1682 == protoModule.wireTypes.varint then
			if var1681 == 1 then
				local _ = nil
				local var1683, var1684 = protoModule.readVarIntI32(p58, var1677)
				var1677 = var1684
				var1676.sender_count = var1683
			elseif var1681 == 2 then
				local _ = nil
				local var1685, var1686 = protoModule.readVarIntI64(p58, var1677)
				var1677 = var1686
				var1676.total_robux_amount = var1685
			else
				local _ = nil
				local var1687, var1688 = protoModule.readVarInt(p58, var1677)
				local _ = var1687
				var1677 = var1688
			end
		elseif var1682 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1689, var1690 = protoModule.readVarInt(p58, var1677)
			var1677 = var1690 + var1689
		elseif var1682 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1691, var1692 = protoModule.readFixed32(p58, var1677)
			local _ = var1691
			var1677 = var1692
		elseif var1682 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1693, var1694 = protoModule.readFixed64(p58, var1677)
			local _ = var1693
			var1677 = var1694
		else
			error("Unsupported wire type: " .. var2533)
		end
	end
	return var1676
end

function t_58:jsonEncode()
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_58:jsonDecode()
	-- upvalues: t_58 (ref)
	local var1695 = t_58.new()
	
	if self.sender_count ~= nil then
		var1695.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1695.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1695.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1695.total_robux_amount = self.totalRobuxAmount
	end
	return var1695
end

t_58.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_58
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p59)
	-- upvalues: t_59 (ref)
	return setmetatable({
		title = if p59 == nil or p59.title == nil then "" else p59.title,
		description = if p59 == nil or p59.description == nil then "" else p59.description,
		primary_text = if p59 == nil or p59.primary_text == nil then "" else p59.primary_text,
		secondary_text = if p59 == nil or p59.secondary_text == nil then "" else p59.secondary_text,
		prompt_id = if p59 == nil or p59.prompt_id == nil then "" else p59.prompt_id,
		prompt_type = if p59 == nil or p59.prompt_type == nil then "" else p59.prompt_type,
		times_seen = if p59 == nil or p59.times_seen == nil then 0 else p59.times_seen,
		content = if p59 == nil or p59.content == nil then nil else p59.content,
		sort_id = if p59 == nil or p59.sort_id == nil then nil else p59.sort_id
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1695 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1696, var1697 = protoModule.writeTag(buff, var1695, 1, protoModule.wireTypes.lengthDelimited)
		var1696, var2551 = protoModule.writeString(var1696, var1697, self.title)
		buff = var1696
		var1695 = var1697
	end
	if self.description ~= nil and self.description ~= "" then
		local var1698, var1699 = protoModule.writeTag(buff, var1695, 2, protoModule.wireTypes.lengthDelimited)
		var1698, var2553 = protoModule.writeString(var1698, var1699, self.description)
		buff = var1698
		var1695 = var1699
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1700, var1701 = protoModule.writeTag(buff, var1695, 3, protoModule.wireTypes.lengthDelimited)
		var1700, var2555 = protoModule.writeString(var1700, var1701, self.primary_text)
		buff = var1700
		var1695 = var1701
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1702, var1703 = protoModule.writeTag(buff, var1695, 4, protoModule.wireTypes.lengthDelimited)
		var1702, var2557 = protoModule.writeString(var1702, var1703, self.secondary_text)
		buff = var1702
		var1695 = var1703
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1704, var1705 = protoModule.writeTag(buff, var1695, 5, protoModule.wireTypes.lengthDelimited)
		var1704, var2559 = protoModule.writeString(var1704, var1705, self.prompt_id)
		buff = var1704
		var1695 = var1705
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1706, var1707 = protoModule.writeTag(buff, var1695, 6, protoModule.wireTypes.lengthDelimited)
		var1706, var2561 = protoModule.writeString(var1706, var1707, self.prompt_type)
		buff = var1706
		var1695 = var1707
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1708, var1709 = protoModule.writeTag(buff, var1695, 7, protoModule.wireTypes.varint)
		var1708, var2563 = protoModule.writeVarInt(var1708, var1709, self.times_seen)
		buff = var1708
		var1695 = var1709
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1710 = self.content.value:encode()
		local var1711, var1712 = protoModule.writeTag(buff, var1695, 8, protoModule.wireTypes.lengthDelimited)
		var1711, var2566 = protoModule.writeBuffer(var1711, var1712, var1710, buffer.len(var1710))
		buff = var1711
		var1695 = var1712
	end
	if self.sort_id ~= nil then
		local var1713, var1714 = protoModule.writeTag(buff, var1695, 9, protoModule.wireTypes.lengthDelimited)
		var1713, var2568 = protoModule.writeString(var1713, var1714, self.sort_id)
		buff = var1713
		var1695 = var1714
	end
	local buff_1 = buffer.create(var1695)
	buffer.copy(buff_1, 0, buff, 0, var1695)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref), t (ref)
	local var1695 = t_59.new()
	local var1696 = 0
	while var1696 < buffer.len(p59) do
		local _ = nil
		local var1697 = nil
		local var1698, var1699, var1700 = protoModule.readTag(p59, var1696)
		local var1701 = var1698
		var1697 = var1699
		var1696 = var1700
		
		if var1697 == protoModule.wireTypes.varint then
			if var1701 == 7 then
				local _ = nil
				local var1702, var1703 = protoModule.readVarIntI32(p59, var1696)
				var1696 = var1703
				var1695.times_seen = var1702
			else
				local _ = nil
				local var1704, var1705 = protoModule.readVarInt(p59, var1696)
				local _ = var1704
				var1696 = var1705
			end
		end
		if var1697 == protoModule.wireTypes.lengthDelimited then
			if var1701 == 1 then
				local _ = nil
				local var1706, var1707 = protoModule.readBuffer(p59, var1696)
				var1696 = var1707
				var1695.title = buffer.tostring(var1706)
			elseif var1701 == 2 then
				local _ = nil
				local var1708, var1709 = protoModule.readBuffer(p59, var1696)
				var1696 = var1709
				var1695.description = buffer.tostring(var1708)
			elseif var1701 == 3 then
				local _ = nil
				local var1710, var1711 = protoModule.readBuffer(p59, var1696)
				var1696 = var1711
				var1695.primary_text = buffer.tostring(var1710)
			elseif var1701 == 4 then
				local _ = nil
				local var1712, var1713 = protoModule.readBuffer(p59, var1696)
				var1696 = var1713
				var1695.secondary_text = buffer.tostring(var1712)
			elseif var1701 == 5 then
				local _ = nil
				local var1714, var1715 = protoModule.readBuffer(p59, var1696)
				var1696 = var1715
				var1695.prompt_id = buffer.tostring(var1714)
			elseif var1701 == 6 then
				local _ = nil
				local var1716, var1717 = protoModule.readBuffer(p59, var1696)
				var1696 = var1717
				var1695.prompt_type = buffer.tostring(var1716)
			elseif var1701 == 8 then
				local _ = nil
				local var1718, var1719 = protoModule.readBuffer(p59, var1696)
				var1696 = var1719
				var1695.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1718)
				}
			elseif var1701 == 9 then
				local _ = nil
				local var1720, var1721 = protoModule.readBuffer(p59, var1696)
				var1696 = var1721
				var1695.sort_id = buffer.tostring(var1720)
			else
				local _ = nil
				local var1722, var1723 = protoModule.readVarInt(p59, var1696)
				var1696 = var1723 + var1722
			end
		elseif var1697 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1724, var1725 = protoModule.readFixed32(p59, var1696)
			local _ = var1724
			var1696 = var1725
		elseif var1697 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1726, var1727 = protoModule.readFixed64(p59, var1696)
			local _ = var1726
			var1696 = var1727
		else
			error("Unsupported wire type: " .. var2572)
		end
	end
	return var1695
end

function t_59:jsonEncode()
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

function t_59:jsonDecode()
	-- upvalues: t_59 (ref), t (ref)
	local var1728 = t_59.new()
	
	if self.title ~= nil then
		var1728.title = self.title
	end
	if self.description ~= nil then
		var1728.description = self.description
	end
	if self.primary_text ~= nil then
		var1728.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1728.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1728.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1728.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1728.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1728.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1728.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1728.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1728.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1728.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1728.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1728.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1728.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1728.sort_id = self.sortId
	end
	return var1728
end

t_59.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_59
typeRegistryModule.default:register(t.BannerInputData)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p60)
	-- upvalues: t_60 (ref)
	return setmetatable({
		tooltip_text = if p60 == nil or p60.tooltip_text == nil then "" else p60.tooltip_text,
		prompt_id = if p60 == nil or p60.prompt_id == nil then "" else p60.prompt_id,
		prompt_type = if p60 == nil or p60.prompt_type == nil then "" else p60.prompt_type
	}, t_60)
end

function t_60:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1728 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1729, var1730 = protoModule.writeTag(buff, var1728, 1, protoModule.wireTypes.lengthDelimited)
		var1729, var2608 = protoModule.writeString(var1729, var1730, self.tooltip_text)
		buff = var1729
		var1728 = var1730
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1731, var1732 = protoModule.writeTag(buff, var1728, 2, protoModule.wireTypes.lengthDelimited)
		var1731, var2610 = protoModule.writeString(var1731, var1732, self.prompt_id)
		buff = var1731
		var1728 = var1732
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1733, var1734 = protoModule.writeTag(buff, var1728, 3, protoModule.wireTypes.lengthDelimited)
		var1733, var2612 = protoModule.writeString(var1733, var1734, self.prompt_type)
		buff = var1733
		var1728 = var1734
	end
	local buff_1 = buffer.create(var1728)
	buffer.copy(buff_1, 0, buff, 0, var1728)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1728 = t_60.new()
	local var1729 = 0
	while var1729 < buffer.len(p60) do
		local _ = nil
		local var1730 = nil
		local var1731, var1732, var1733 = protoModule.readTag(p60, var1729)
		local var1734 = var1731
		var1730 = var1732
		var1729 = var1733
		
		if var1730 == protoModule.wireTypes.varint then
			local _ = nil
			local var1735, var1736 = protoModule.readVarInt(p60, var1729)
			local _ = var1735
			var1729 = var1736
			continue
		end
		if var1730 == protoModule.wireTypes.lengthDelimited then
			if var1734 == 1 then
				local _ = nil
				local var1737, var1738 = protoModule.readBuffer(p60, var1729)
				var1729 = var1738
				var1728.tooltip_text = buffer.tostring(var1737)
			elseif var1734 == 2 then
				local _ = nil
				local var1739, var1740 = protoModule.readBuffer(p60, var1729)
				var1729 = var1740
				var1728.prompt_id = buffer.tostring(var1739)
			elseif var1734 == 3 then
				local _ = nil
				local var1741, var1742 = protoModule.readBuffer(p60, var1729)
				var1729 = var1742
				var1728.prompt_type = buffer.tostring(var1741)
			else
				local _ = nil
				local var1743, var1744 = protoModule.readVarInt(p60, var1729)
				var1729 = var1744 + var1743
			end
		elseif var1730 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1745, var1746 = protoModule.readFixed32(p60, var1729)
			local _ = var1745
			var1729 = var1746
		elseif var1730 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1747, var1748 = protoModule.readFixed64(p60, var1729)
			local _ = var1747
			var1729 = var1748
		else
			error("Unsupported wire type: " .. var2616)
		end
	end
	return var1728
end

function t_60:jsonEncode()
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

function t_60:jsonDecode()
	-- upvalues: t_60 (ref)
	local var1749 = t_60.new()
	
	if self.tooltip_text ~= nil then
		var1749.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1749.tooltip_text = self.tooltipText
	end
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
	return var1749
end

t_60.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_60
typeRegistryModule.default:register(t.TooltipInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p61)
	-- upvalues: t_61 (ref)
	return setmetatable({
		media_id = if p61 == nil or p61.media_id == nil then "" else p61.media_id,
		title = if p61 == nil or p61.title == nil then "" else p61.title,
		description = if p61 == nil or p61.description == nil then "" else p61.description,
		prompt_id = if p61 == nil or p61.prompt_id == nil then "" else p61.prompt_id,
		prompt_type = if p61 == nil or p61.prompt_type == nil then "" else p61.prompt_type,
		anchor_tag = if p61 == nil or p61.anchor_tag == nil then "" else p61.anchor_tag
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1749 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1750, var1751 = protoModule.writeTag(buff, var1749, 1, protoModule.wireTypes.lengthDelimited)
		var1750, var2640 = protoModule.writeString(var1750, var1751, self.media_id)
		buff = var1750
		var1749 = var1751
	end
	if self.title ~= nil and self.title ~= "" then
		local var1752, var1753 = protoModule.writeTag(buff, var1749, 2, protoModule.wireTypes.lengthDelimited)
		var1752, var2642 = protoModule.writeString(var1752, var1753, self.title)
		buff = var1752
		var1749 = var1753
	end
	if self.description ~= nil and self.description ~= "" then
		local var1754, var1755 = protoModule.writeTag(buff, var1749, 3, protoModule.wireTypes.lengthDelimited)
		var1754, var2644 = protoModule.writeString(var1754, var1755, self.description)
		buff = var1754
		var1749 = var1755
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1756, var1757 = protoModule.writeTag(buff, var1749, 4, protoModule.wireTypes.lengthDelimited)
		var1756, var2646 = protoModule.writeString(var1756, var1757, self.prompt_id)
		buff = var1756
		var1749 = var1757
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1758, var1759 = protoModule.writeTag(buff, var1749, 5, protoModule.wireTypes.lengthDelimited)
		var1758, var2648 = protoModule.writeString(var1758, var1759, self.prompt_type)
		buff = var1758
		var1749 = var1759
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1760, var1761 = protoModule.writeTag(buff, var1749, 6, protoModule.wireTypes.lengthDelimited)
		var1760, var2650 = protoModule.writeString(var1760, var1761, self.anchor_tag)
		buff = var1760
		var1749 = var1761
	end
	local buff_1 = buffer.create(var1749)
	buffer.copy(buff_1, 0, buff, 0, var1749)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1749 = t_61.new()
	local var1750 = 0
	while var1750 < buffer.len(p61) do
		local _ = nil
		local var1751 = nil
		local var1752, var1753, var1754 = protoModule.readTag(p61, var1750)
		local var1755 = var1752
		var1751 = var1753
		var1750 = var1754
		
		if var1751 == protoModule.wireTypes.varint then
			local _ = nil
			local var1756, var1757 = protoModule.readVarInt(p61, var1750)
			local _ = var1756
			var1750 = var1757
			continue
		end
		if var1751 == protoModule.wireTypes.lengthDelimited then
			if var1755 == 1 then
				local _ = nil
				local var1758, var1759 = protoModule.readBuffer(p61, var1750)
				var1750 = var1759
				var1749.media_id = buffer.tostring(var1758)
			elseif var1755 == 2 then
				local _ = nil
				local var1760, var1761 = protoModule.readBuffer(p61, var1750)
				var1750 = var1761
				var1749.title = buffer.tostring(var1760)
			elseif var1755 == 3 then
				local _ = nil
				local var1762, var1763 = protoModule.readBuffer(p61, var1750)
				var1750 = var1763
				var1749.description = buffer.tostring(var1762)
			elseif var1755 == 4 then
				local _ = nil
				local var1764, var1765 = protoModule.readBuffer(p61, var1750)
				var1750 = var1765
				var1749.prompt_id = buffer.tostring(var1764)
			elseif var1755 == 5 then
				local _ = nil
				local var1766, var1767 = protoModule.readBuffer(p61, var1750)
				var1750 = var1767
				var1749.prompt_type = buffer.tostring(var1766)
			elseif var1755 == 6 then
				local _ = nil
				local var1768, var1769 = protoModule.readBuffer(p61, var1750)
				var1750 = var1769
				var1749.anchor_tag = buffer.tostring(var1768)
			else
				local _ = nil
				local var1770, var1771 = protoModule.readVarInt(p61, var1750)
				var1750 = var1771 + var1770
			end
		elseif var1751 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1772, var1773 = protoModule.readFixed32(p61, var1750)
			local _ = var1772
			var1750 = var1773
		elseif var1751 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1774, var1775 = protoModule.readFixed64(p61, var1750)
			local _ = var1774
			var1750 = var1775
		else
			error("Unsupported wire type: " .. var2654)
		end
	end
	return var1749
end

function t_61:jsonEncode()
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

function t_61:jsonDecode()
	-- upvalues: t_61 (ref)
	local var1776 = t_61.new()
	
	if self.media_id ~= nil then
		var1776.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1776.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1776.title = self.title
	end
	if self.description ~= nil then
		var1776.description = self.description
	end
	if self.prompt_id ~= nil then
		var1776.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1776.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1776.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1776.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1776.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1776.anchor_tag = self.anchorTag
	end
	return var1776
end

t_61.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_61
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p62)
	-- upvalues: t_62 (ref)
	return setmetatable({
		prompt_id = if p62 == nil or p62.prompt_id == nil then "" else p62.prompt_id,
		prompt_type = if p62 == nil or p62.prompt_type == nil then "" else p62.prompt_type
	}, t_62)
end

function t_62:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1776 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1777, var1778 = protoModule.writeTag(buff, var1776, 1, protoModule.wireTypes.lengthDelimited)
		var1777, var2684 = protoModule.writeString(var1777, var1778, self.prompt_id)
		buff = var1777
		var1776 = var1778
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1779, var1780 = protoModule.writeTag(buff, var1776, 2, protoModule.wireTypes.lengthDelimited)
		var1779, var2686 = protoModule.writeString(var1779, var1780, self.prompt_type)
		buff = var1779
		var1776 = var1780
	end
	local buff_1 = buffer.create(var1776)
	buffer.copy(buff_1, 0, buff, 0, var1776)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1776 = t_62.new()
	local var1777 = 0
	while var1777 < buffer.len(p62) do
		local _ = nil
		local var1778 = nil
		local var1779, var1780, var1781 = protoModule.readTag(p62, var1777)
		local var1782 = var1779
		var1778 = var1780
		var1777 = var1781
		
		if var1778 == protoModule.wireTypes.varint then
			local _ = nil
			local var1783, var1784 = protoModule.readVarInt(p62, var1777)
			local _ = var1783
			var1777 = var1784
			continue
		end
		if var1778 == protoModule.wireTypes.lengthDelimited then
			if var1782 == 1 then
				local _ = nil
				local var1785, var1786 = protoModule.readBuffer(p62, var1777)
				var1777 = var1786
				var1776.prompt_id = buffer.tostring(var1785)
			elseif var1782 == 2 then
				local _ = nil
				local var1787, var1788 = protoModule.readBuffer(p62, var1777)
				var1777 = var1788
				var1776.prompt_type = buffer.tostring(var1787)
			else
				local _ = nil
				local var1789, var1790 = protoModule.readVarInt(p62, var1777)
				var1777 = var1790 + var1789
			end
		elseif var1778 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1791, var1792 = protoModule.readFixed32(p62, var1777)
			local _ = var1791
			var1777 = var1792
		elseif var1778 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1793, var1794 = protoModule.readFixed64(p62, var1777)
			local _ = var1793
			var1777 = var1794
		else
			error("Unsupported wire type: " .. var2690)
		end
	end
	return var1776
end

function t_62:jsonEncode()
	local t = {}
	
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
	local var1795 = t_62.new()
	
	if self.prompt_id ~= nil then
		var1795.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1795.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1795.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1795.prompt_type = self.promptType
	end
	return var1795
end

t_62.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_62
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p63)
	-- upvalues: t_63 (ref)
	return setmetatable({
		upsell_prompt = if p63 == nil or p63.upsell_prompt == nil then "" else p63.upsell_prompt
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1795 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1796, var1797 = protoModule.writeTag(buff, var1795, 1, protoModule.wireTypes.lengthDelimited)
		var1796, var2712 = protoModule.writeString(var1796, var1797, self.upsell_prompt)
		buff = var1796
		var1795 = var1797
	end
	local buff_1 = buffer.create(var1795)
	buffer.copy(buff_1, 0, buff, 0, var1795)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref)
	local var1795 = t_63.new()
	local var1796 = 0
	while var1796 < buffer.len(p63) do
		local _ = nil
		local var1797 = nil
		local var1798, var1799, var1800 = protoModule.readTag(p63, var1796)
		local var1801 = var1798
		var1797 = var1799
		var1796 = var1800
		
		if var1797 == protoModule.wireTypes.varint then
			local _ = nil
			local var1802, var1803 = protoModule.readVarInt(p63, var1796)
			local _ = var1802
			var1796 = var1803
			continue
		end
		if var1797 == protoModule.wireTypes.lengthDelimited then
			if var1801 == 1 then
				local _ = nil
				local var1804, var1805 = protoModule.readBuffer(p63, var1796)
				var1796 = var1805
				var1795.upsell_prompt = buffer.tostring(var1804)
			else
				local _ = nil
				local var1806, var1807 = protoModule.readVarInt(p63, var1796)
				var1796 = var1807 + var1806
			end
		elseif var1797 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1808, var1809 = protoModule.readFixed32(p63, var1796)
			local _ = var1808
			var1796 = var1809
		elseif var1797 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1810, var1811 = protoModule.readFixed64(p63, var1796)
			local _ = var1810
			var1796 = var1811
		else
			error("Unsupported wire type: " .. var2716)
		end
	end
	return var1795
end

function t_63:jsonEncode()
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_63:jsonDecode()
	-- upvalues: t_63 (ref)
	local var1812 = t_63.new()
	
	if self.upsell_prompt ~= nil then
		var1812.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1812.upsell_prompt = self.upsellPrompt
	end
	return var1812
end

t_63.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_63
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p64)
	-- upvalues: t_64 (ref)
	return setmetatable({
		modal_variant = if p64 == nil or p64.modal_variant == nil then "" else p64.modal_variant,
		modal_sequence = if p64 == nil or p64.modal_sequence == nil then "" else p64.modal_sequence,
		conversation_id = if p64 == nil or p64.conversation_id == nil then "" else p64.conversation_id,
		friend_id = if p64 == nil or p64.friend_id == nil then "" else p64.friend_id
	}, t_64)
end

function t_64:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1812 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1813, var1814 = protoModule.writeTag(buff, var1812, 1, protoModule.wireTypes.lengthDelimited)
		var1813, var2736 = protoModule.writeString(var1813, var1814, self.modal_variant)
		buff = var1813
		var1812 = var1814
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1815, var1816 = protoModule.writeTag(buff, var1812, 2, protoModule.wireTypes.lengthDelimited)
		var1815, var2738 = protoModule.writeString(var1815, var1816, self.modal_sequence)
		buff = var1815
		var1812 = var1816
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1817, var1818 = protoModule.writeTag(buff, var1812, 3, protoModule.wireTypes.lengthDelimited)
		var1817, var2740 = protoModule.writeString(var1817, var1818, self.conversation_id)
		buff = var1817
		var1812 = var1818
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1819, var1820 = protoModule.writeTag(buff, var1812, 4, protoModule.wireTypes.lengthDelimited)
		var1819, var2742 = protoModule.writeString(var1819, var1820, self.friend_id)
		buff = var1819
		var1812 = var1820
	end
	local buff_1 = buffer.create(var1812)
	buffer.copy(buff_1, 0, buff, 0, var1812)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref)
	local var1812 = t_64.new()
	local var1813 = 0
	while var1813 < buffer.len(p64) do
		local _ = nil
		local var1814 = nil
		local var1815, var1816, var1817 = protoModule.readTag(p64, var1813)
		local var1818 = var1815
		var1814 = var1816
		var1813 = var1817
		
		if var1814 == protoModule.wireTypes.varint then
			local _ = nil
			local var1819, var1820 = protoModule.readVarInt(p64, var1813)
			local _ = var1819
			var1813 = var1820
			continue
		end
		if var1814 == protoModule.wireTypes.lengthDelimited then
			if var1818 == 1 then
				local _ = nil
				local var1821, var1822 = protoModule.readBuffer(p64, var1813)
				var1813 = var1822
				var1812.modal_variant = buffer.tostring(var1821)
			elseif var1818 == 2 then
				local _ = nil
				local var1823, var1824 = protoModule.readBuffer(p64, var1813)
				var1813 = var1824
				var1812.modal_sequence = buffer.tostring(var1823)
			elseif var1818 == 3 then
				local _ = nil
				local var1825, var1826 = protoModule.readBuffer(p64, var1813)
				var1813 = var1826
				var1812.conversation_id = buffer.tostring(var1825)
			elseif var1818 == 4 then
				local _ = nil
				local var1827, var1828 = protoModule.readBuffer(p64, var1813)
				var1813 = var1828
				var1812.friend_id = buffer.tostring(var1827)
			else
				local _ = nil
				local var1829, var1830 = protoModule.readVarInt(p64, var1813)
				var1813 = var1830 + var1829
			end
		elseif var1814 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1831, var1832 = protoModule.readFixed32(p64, var1813)
			local _ = var1831
			var1813 = var1832
		elseif var1814 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1833, var1834 = protoModule.readFixed64(p64, var1813)
			local _ = var1833
			var1813 = var1834
		else
			error("Unsupported wire type: " .. var2746)
		end
	end
	return var1812
end

function t_64:jsonEncode()
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

function t_64:jsonDecode()
	-- upvalues: t_64 (ref)
	local var1835 = t_64.new()
	
	if self.modal_variant ~= nil then
		var1835.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1835.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1835.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1835.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1835.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1835.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1835.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1835.friend_id = self.friendId
	end
	return var1835
end

t_64.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_64
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p65)
	-- upvalues: t_65 (ref)
	return setmetatable({
		event_id = if p65 == nil or p65.event_id == nil then "" else p65.event_id,
		universe_id = if p65 == nil or p65.universe_id == nil then "" else p65.universe_id,
		entry_map = if p65 == nil or p65.entry_map == nil then {} else p65.entry_map,
		entry_order = if p65 == nil or p65.entry_order == nil then {} else p65.entry_order
	}, t_65)
end

function t_65:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1835 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1836, var1837 = protoModule.writeTag(buff, var1835, 1, protoModule.wireTypes.lengthDelimited)
		var1836, var2772 = protoModule.writeString(var1836, var1837, self.event_id)
		buff = var1836
		var1835 = var1837
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1838, var1839 = protoModule.writeTag(buff, var1835, 2, protoModule.wireTypes.lengthDelimited)
		var1838, var2774 = protoModule.writeString(var1838, var1839, self.universe_id)
		buff = var1838
		var1835 = var1839
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1840, var1841 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1840, var2776 = protoModule.writeString(var1840, var1841, i)
			local var1842 = v:encode()
			var1841, var2778 = protoModule.writeTag(var1840, var1841, 2, protoModule.wireTypes.lengthDelimited)
			var1841, var2778 = protoModule.writeBuffer(var1841, var2778, var1842, buffer.len(var1842))
			local var1843 = var1841
			local var1844 = var2778
			local var1845, var1846 = protoModule.writeTag(buff, var1835, 3, protoModule.wireTypes.lengthDelimited)
			var1845, var2782 = protoModule.writeBuffer(var1845, var1846, var1843, var1844)
			buff = var1845
			var1835 = var1846
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1847, var1848 = protoModule.writeTag(buff, var1835, 4, protoModule.wireTypes.lengthDelimited)
			var1847, var2784 = protoModule.writeString(var1847, var1848, v)
			buff = var1847
			var1835 = var1848
		end
	end
	local buff_1 = buffer.create(var1835)
	buffer.copy(buff_1, 0, buff, 0, var1835)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref), t (ref)
	local var1849 = t_65.new()
	local var1850 = 0
	while var1850 < buffer.len(p65) do
		local _ = nil
		local var1851 = nil
		local var1852, var1853, var1854 = protoModule.readTag(p65, var1850)
		local var1855 = var1852
		var1851 = var1853
		var1850 = var1854
		
		if var1851 == protoModule.wireTypes.varint then
			local _ = nil
			local var1856, var1857 = protoModule.readVarInt(p65, var1850)
			local _ = var1856
			var1850 = var1857
			continue
		end
		if var1851 == protoModule.wireTypes.lengthDelimited then
			if var1855 == 1 then
				local _ = nil
				local var1858, var1859 = protoModule.readBuffer(p65, var1850)
				var1850 = var1859
				var1849.event_id = buffer.tostring(var1858)
			elseif var1855 == 2 then
				local _ = nil
				local var1860, var1861 = protoModule.readBuffer(p65, var1850)
				var1850 = var1861
				var1849.universe_id = buffer.tostring(var1860)
			elseif var1855 == 3 then
				local _ = nil
				local var1862, var1863 = protoModule.readBuffer(p65, var1850)
				var1850 = var1863
				var1862 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1862)
				var1849.entry_map[var1862.key or ""] = var1862.value or t.FeedEntry.new()
			elseif var1855 == 4 then
				local _ = nil
				local var1864, var1865 = protoModule.readBuffer(p65, var1850)
				var1850 = var1865
				table.insert(var1849.entry_order, buffer.tostring(var1864))
			else
				local _ = nil
				local var1866, var1867 = protoModule.readVarInt(p65, var1850)
				var1850 = var1867 + var1866
			end
		elseif var1851 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1868, var1869 = protoModule.readFixed32(p65, var1850)
			local _ = var1868
			var1850 = var1869
		elseif var1851 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1870, var1871 = protoModule.readFixed64(p65, var1850)
			local _ = var1870
			var1850 = var1871
		else
			error("Unsupported wire type: " .. var2788)
		end
	end
	return var1849
end

function t_65:jsonEncode()
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

function t_65:jsonDecode()
	-- upvalues: t_65 (ref), t (ref)
	local var1872 = t_65.new()
	
	if self.event_id ~= nil then
		var1872.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1872.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1872.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1872.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1872.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1872.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1872.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1872.entry_order = t_1
	end
	return var1872
end

t_65.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_65
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p66)
	-- upvalues: t_66 (ref)
	return setmetatable({
		key = if p66 == nil or p66.key == nil then "" else p66.key,
		value = if p66 == nil or p66.value == nil then nil else p66.value
	}, t_66)
end

function t_66:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1873 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1874, var1875 = protoModule.writeTag(buff, var1873, 1, protoModule.wireTypes.lengthDelimited)
		var1874, var2820 = protoModule.writeString(var1874, var1875, self.key)
		buff = var1874
		var1873 = var1875
	end
	if self.value ~= nil then
		local var1876 = self.value:encode()
		local var1877, var1878 = protoModule.writeTag(buff, var1873, 2, protoModule.wireTypes.lengthDelimited)
		var1877, var2823 = protoModule.writeBuffer(var1877, var1878, var1876, buffer.len(var1876))
		buff = var1877
		var1873 = var1878
	end
	local buff_1 = buffer.create(var1873)
	buffer.copy(buff_1, 0, buff, 0, var1873)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1873 = t_66.new()
	local var1874 = 0
	while var1874 < buffer.len(p66) do
		local _ = nil
		local var1875 = nil
		local var1876, var1877, var1878 = protoModule.readTag(p66, var1874)
		local var1879 = var1876
		var1875 = var1877
		var1874 = var1878
		
		if var1875 == protoModule.wireTypes.varint then
			local _ = nil
			local var1880, var1881 = protoModule.readVarInt(p66, var1874)
			local _ = var1880
			var1874 = var1881
			continue
		end
		if var1875 == protoModule.wireTypes.lengthDelimited then
			if var1879 == 1 then
				local _ = nil
				local var1882, var1883 = protoModule.readBuffer(p66, var1874)
				var1874 = var1883
				var1873.key = buffer.tostring(var1882)
			elseif var1879 == 2 then
				local _ = nil
				local var1884, var1885 = protoModule.readBuffer(p66, var1874)
				var1874 = var1885
				var1873.value = t.FeedEntry.decode(var1884)
			else
				local _ = nil
				local var1886, var1887 = protoModule.readVarInt(p66, var1874)
				var1874 = var1887 + var1886
			end
		elseif var1875 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1888, var1889 = protoModule.readFixed32(p66, var1874)
			local _ = var1888
			var1874 = var1889
		elseif var1875 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1890, var1891 = protoModule.readFixed64(p66, var1874)
			local _ = var1890
			var1874 = var1891
		else
			error("Unsupported wire type: " .. var2827)
		end
	end
	return var1873
end

function t_66:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_66:jsonDecode()
	-- upvalues: t_66 (ref), t (ref)
	local var1892 = t_66.new()
	
	if self.key ~= nil then
		var1892.key = self.key
	end
	if self.value ~= nil then
		var1892.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1892
end

t_66.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_66
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p67)
	-- upvalues: t_67 (ref)
	return setmetatable({
		event_id = if p67 == nil or p67.event_id == nil then "" else p67.event_id,
		universe_id = if p67 == nil or p67.universe_id == nil then "" else p67.universe_id
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1892 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1893, var1894 = protoModule.writeTag(buff, var1892, 1, protoModule.wireTypes.lengthDelimited)
		var1893, var2849 = protoModule.writeString(var1893, var1894, self.event_id)
		buff = var1893
		var1892 = var1894
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1895, var1896 = protoModule.writeTag(buff, var1892, 2, protoModule.wireTypes.lengthDelimited)
		var1895, var2851 = protoModule.writeString(var1895, var1896, self.universe_id)
		buff = var1895
		var1892 = var1896
	end
	local buff_1 = buffer.create(var1892)
	buffer.copy(buff_1, 0, buff, 0, var1892)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref)
	local var1892 = t_67.new()
	local var1893 = 0
	while var1893 < buffer.len(p67) do
		local _ = nil
		local var1894 = nil
		local var1895, var1896, var1897 = protoModule.readTag(p67, var1893)
		local var1898 = var1895
		var1894 = var1896
		var1893 = var1897
		
		if var1894 == protoModule.wireTypes.varint then
			local _ = nil
			local var1899, var1900 = protoModule.readVarInt(p67, var1893)
			local _ = var1899
			var1893 = var1900
			continue
		end
		if var1894 == protoModule.wireTypes.lengthDelimited then
			if var1898 == 1 then
				local _ = nil
				local var1901, var1902 = protoModule.readBuffer(p67, var1893)
				var1893 = var1902
				var1892.event_id = buffer.tostring(var1901)
			elseif var1898 == 2 then
				local _ = nil
				local var1903, var1904 = protoModule.readBuffer(p67, var1893)
				var1893 = var1904
				var1892.universe_id = buffer.tostring(var1903)
			else
				local _ = nil
				local var1905, var1906 = protoModule.readVarInt(p67, var1893)
				var1893 = var1906 + var1905
			end
		elseif var1894 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1907, var1908 = protoModule.readFixed32(p67, var1893)
			local _ = var1907
			var1893 = var1908
		elseif var1894 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1909, var1910 = protoModule.readFixed64(p67, var1893)
			local _ = var1909
			var1893 = var1910
		else
			error("Unsupported wire type: " .. var2855)
		end
	end
	return var1892
end

function t_67:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_67:jsonDecode()
	-- upvalues: t_67 (ref)
	local var1911 = t_67.new()
	
	if self.event_id ~= nil then
		var1911.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1911.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1911.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1911.universe_id = self.universeId
	end
	return var1911
end

t_67.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_67
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p68)
	-- upvalues: t_68 (ref)
	return setmetatable({
		event_id = if p68 == nil or p68.event_id == nil then "" else p68.event_id
	}, t_68)
end

function t_68:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1911 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1912, var1913 = protoModule.writeTag(buff, var1911, 1, protoModule.wireTypes.lengthDelimited)
		var1912, var2877 = protoModule.writeString(var1912, var1913, self.event_id)
		buff = var1912
		var1911 = var1913
	end
	local buff_1 = buffer.create(var1911)
	buffer.copy(buff_1, 0, buff, 0, var1911)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1911 = t_68.new()
	local var1912 = 0
	while var1912 < buffer.len(p68) do
		local _ = nil
		local var1913 = nil
		local var1914, var1915, var1916 = protoModule.readTag(p68, var1912)
		local var1917 = var1914
		var1913 = var1915
		var1912 = var1916
		
		if var1913 == protoModule.wireTypes.varint then
			local _ = nil
			local var1918, var1919 = protoModule.readVarInt(p68, var1912)
			local _ = var1918
			var1912 = var1919
			continue
		end
		if var1913 == protoModule.wireTypes.lengthDelimited then
			if var1917 == 1 then
				local _ = nil
				local var1920, var1921 = protoModule.readBuffer(p68, var1912)
				var1912 = var1921
				var1911.event_id = buffer.tostring(var1920)
			else
				local _ = nil
				local var1922, var1923 = protoModule.readVarInt(p68, var1912)
				var1912 = var1923 + var1922
			end
		elseif var1913 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1924, var1925 = protoModule.readFixed32(p68, var1912)
			local _ = var1924
			var1912 = var1925
		elseif var1913 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1926, var1927 = protoModule.readFixed64(p68, var1912)
			local _ = var1926
			var1912 = var1927
		else
			error("Unsupported wire type: " .. var2881)
		end
	end
	return var1911
end

function t_68:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_68:jsonDecode()
	-- upvalues: t_68 (ref)
	local var1928 = t_68.new()
	
	if self.event_id ~= nil then
		var1928.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1928.event_id = self.eventId
	end
	return var1928
end

t_68.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_68
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p69)
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p69 == nil or p69.event_id == nil then "" else p69.event_id,
		universe_id = if p69 == nil or p69.universe_id == nil then "" else p69.universe_id,
		rsvp_users = if p69 == nil or p69.rsvp_users == nil then {} else p69.rsvp_users
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1928 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1929, var1930 = protoModule.writeTag(buff, var1928, 1, protoModule.wireTypes.lengthDelimited)
		var1929, var2901 = protoModule.writeString(var1929, var1930, self.event_id)
		buff = var1929
		var1928 = var1930
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1931, var1932 = protoModule.writeTag(buff, var1928, 2, protoModule.wireTypes.lengthDelimited)
		var1931, var2903 = protoModule.writeString(var1931, var1932, self.universe_id)
		buff = var1931
		var1928 = var1932
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var1933 = v:encode()
			local var1934, var1935 = protoModule.writeTag(buff, var1928, 3, protoModule.wireTypes.lengthDelimited)
			var1934, var2906 = protoModule.writeBuffer(var1934, var1935, var1933, buffer.len(var1933))
			buff = var1934
			var1928 = var1935
		end
	end
	local buff_1 = buffer.create(var1928)
	buffer.copy(buff_1, 0, buff, 0, var1928)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref), t (ref)
	local var1936 = t_69.new()
	local var1937 = 0
	while var1937 < buffer.len(p69) do
		local _ = nil
		local var1938 = nil
		local var1939, var1940, var1941 = protoModule.readTag(p69, var1937)
		local var1942 = var1939
		var1938 = var1940
		var1937 = var1941
		
		if var1938 == protoModule.wireTypes.varint then
			local _ = nil
			local var1943, var1944 = protoModule.readVarInt(p69, var1937)
			local _ = var1943
			var1937 = var1944
			continue
		end
		if var1938 == protoModule.wireTypes.lengthDelimited then
			if var1942 == 1 then
				local _ = nil
				local var1945, var1946 = protoModule.readBuffer(p69, var1937)
				var1937 = var1946
				var1936.event_id = buffer.tostring(var1945)
			elseif var1942 == 2 then
				local _ = nil
				local var1947, var1948 = protoModule.readBuffer(p69, var1937)
				var1937 = var1948
				var1936.universe_id = buffer.tostring(var1947)
			elseif var1942 == 3 then
				local _ = nil
				local var1949, var1950 = protoModule.readBuffer(p69, var1937)
				var1937 = var1950
				table.insert(var1936.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var1949))
			else
				local _ = nil
				local var1951, var1952 = protoModule.readVarInt(p69, var1937)
				var1937 = var1952 + var1951
			end
		elseif var1938 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1953, var1954 = protoModule.readFixed32(p69, var1937)
			local _ = var1953
			var1937 = var1954
		elseif var1938 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1955, var1956 = protoModule.readFixed64(p69, var1937)
			local _ = var1955
			var1937 = var1956
		else
			error("Unsupported wire type: " .. var2910)
		end
	end
	return var1936
end

function t_69:jsonEncode()
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

function t_69:jsonDecode()
	-- upvalues: t_69 (ref), t (ref)
	local var1957 = t_69.new()
	
	if self.event_id ~= nil then
		var1957.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1957.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1957.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1957.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1957.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1957.rsvp_users = t_1
	end
	return var1957
end

t_69.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_69
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p70)
	-- upvalues: t_70 (ref)
	return setmetatable({
		user_id = if p70 == nil or p70.user_id == nil then 0 else p70.user_id
	}, t_70)
end

function t_70:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1958 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var1959, var1960 = protoModule.writeTag(buff, var1958, 1, protoModule.wireTypes.varint)
		var1959, var2937 = protoModule.writeVarInt(var1959, var1960, self.user_id)
		buff = var1959
		var1958 = var1960
	end
	local buff_1 = buffer.create(var1958)
	buffer.copy(buff_1, 0, buff, 0, var1958)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var1958 = t_70.new()
	local var1959 = 0
	while var1959 < buffer.len(p70) do
		local _ = nil
		local _ = nil
		local var1960, var1961, var1962 = protoModule.readTag(p70, var1959)
		local var1963 = var1960
		local var1964 = var1961
		var1959 = var1962
		
		if var1964 == protoModule.wireTypes.varint then
			if var1963 == 1 then
				local _ = nil
				local var1965, var1966 = protoModule.readVarIntI64(p70, var1959)
				var1959 = var1966
				var1958.user_id = var1965
			else
				local _ = nil
				local var1967, var1968 = protoModule.readVarInt(p70, var1959)
				local _ = var1967
				var1959 = var1968
			end
		elseif var1964 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1969, var1970 = protoModule.readVarInt(p70, var1959)
			var1959 = var1970 + var1969
		elseif var1964 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1971, var1972 = protoModule.readFixed32(p70, var1959)
			local _ = var1971
			var1959 = var1972
		elseif var1964 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1973, var1974 = protoModule.readFixed64(p70, var1959)
			local _ = var1973
			var1959 = var1974
		else
			error("Unsupported wire type: " .. var2945)
		end
	end
	return var1958
end

function t_70:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_70:jsonDecode()
	-- upvalues: t_70 (ref)
	local var1975 = t_70.new()
	
	if self.user_id ~= nil then
		var1975.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1975.user_id = self.userId
	end
	return var1975
end

t_70.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = t_70
typeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p71)
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p71 == nil or p71.event_id == nil then "" else p71.event_id
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1975 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1976, var1977 = protoModule.writeTag(buff, var1975, 1, protoModule.wireTypes.lengthDelimited)
		var1976, var2961 = protoModule.writeString(var1976, var1977, self.event_id)
		buff = var1976
		var1975 = var1977
	end
	local buff_1 = buffer.create(var1975)
	buffer.copy(buff_1, 0, buff, 0, var1975)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var1975 = t_71.new()
	local var1976 = 0
	while var1976 < buffer.len(p71) do
		local _ = nil
		local var1977 = nil
		local var1978, var1979, var1980 = protoModule.readTag(p71, var1976)
		local var1981 = var1978
		var1977 = var1979
		var1976 = var1980
		
		if var1977 == protoModule.wireTypes.varint then
			local _ = nil
			local var1982, var1983 = protoModule.readVarInt(p71, var1976)
			local _ = var1982
			var1976 = var1983
			continue
		end
		if var1977 == protoModule.wireTypes.lengthDelimited then
			if var1981 == 1 then
				local _ = nil
				local var1984, var1985 = protoModule.readBuffer(p71, var1976)
				var1976 = var1985
				var1975.event_id = buffer.tostring(var1984)
			else
				local _ = nil
				local var1986, var1987 = protoModule.readVarInt(p71, var1976)
				var1976 = var1987 + var1986
			end
		elseif var1977 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1988, var1989 = protoModule.readFixed32(p71, var1976)
			local _ = var1988
			var1976 = var1989
		elseif var1977 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1990, var1991 = protoModule.readFixed64(p71, var1976)
			local _ = var1990
			var1976 = var1991
		else
			error("Unsupported wire type: " .. var2965)
		end
	end
	return var1975
end

function t_71:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_71:jsonDecode()
	-- upvalues: t_71 (ref)
	local var1992 = t_71.new()
	
	if self.event_id ~= nil then
		var1992.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1992.event_id = self.eventId
	end
	return var1992
end

t_71.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_71
typeRegistryModule.default:register(t.EventInfoTableInputData)
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
	local var1992 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1993, var1994 = protoModule.writeTag(buff, var1992, 1, protoModule.wireTypes.lengthDelimited)
		var1993, var2985 = protoModule.writeString(var1993, var1994, self.event_id)
		buff = var1993
		var1992 = var1994
	end
	local buff_1 = buffer.create(var1992)
	buffer.copy(buff_1, 0, buff, 0, var1992)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var1992 = t_72.new()
	local var1993 = 0
	while var1993 < buffer.len(p72) do
		local _ = nil
		local var1994 = nil
		local var1995, var1996, var1997 = protoModule.readTag(p72, var1993)
		local var1998 = var1995
		var1994 = var1996
		var1993 = var1997
		
		if var1994 == protoModule.wireTypes.varint then
			local _ = nil
			local var1999, var2000 = protoModule.readVarInt(p72, var1993)
			local _ = var1999
			var1993 = var2000
			continue
		end
		if var1994 == protoModule.wireTypes.lengthDelimited then
			if var1998 == 1 then
				local _ = nil
				local var2001, var2002 = protoModule.readBuffer(p72, var1993)
				var1993 = var2002
				var1992.event_id = buffer.tostring(var2001)
			else
				local _ = nil
				local var2003, var2004 = protoModule.readVarInt(p72, var1993)
				var1993 = var2004 + var2003
			end
		elseif var1994 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2005, var2006 = protoModule.readFixed32(p72, var1993)
			local _ = var2005
			var1993 = var2006
		elseif var1994 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2007, var2008 = protoModule.readFixed64(p72, var1993)
			local _ = var2007
			var1993 = var2008
		else
			error("Unsupported wire type: " .. var2989)
		end
	end
	return var1992
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
	local var2009 = t_72.new()
	
	if self.event_id ~= nil then
		var2009.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2009.event_id = self.eventId
	end
	return var2009
end

t_72.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_72
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p73)
	-- upvalues: t_73 (ref)
	return setmetatable({
		event_id = if p73 == nil or p73.event_id == nil then "" else p73.event_id,
		universe_id = if p73 == nil or p73.universe_id == nil then "" else p73.universe_id
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2009 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2010, var2011 = protoModule.writeTag(buff, var2009, 1, protoModule.wireTypes.lengthDelimited)
		var2010, var3009 = protoModule.writeString(var2010, var2011, self.event_id)
		buff = var2010
		var2009 = var2011
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2012, var2013 = protoModule.writeTag(buff, var2009, 2, protoModule.wireTypes.lengthDelimited)
		var2012, var3011 = protoModule.writeString(var2012, var2013, self.universe_id)
		buff = var2012
		var2009 = var2013
	end
	local buff_1 = buffer.create(var2009)
	buffer.copy(buff_1, 0, buff, 0, var2009)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2009 = t_73.new()
	local var2010 = 0
	while var2010 < buffer.len(p73) do
		local _ = nil
		local var2011 = nil
		local var2012, var2013, var2014 = protoModule.readTag(p73, var2010)
		local var2015 = var2012
		var2011 = var2013
		var2010 = var2014
		
		if var2011 == protoModule.wireTypes.varint then
			local _ = nil
			local var2016, var2017 = protoModule.readVarInt(p73, var2010)
			local _ = var2016
			var2010 = var2017
			continue
		end
		if var2011 == protoModule.wireTypes.lengthDelimited then
			if var2015 == 1 then
				local _ = nil
				local var2018, var2019 = protoModule.readBuffer(p73, var2010)
				var2010 = var2019
				var2009.event_id = buffer.tostring(var2018)
			elseif var2015 == 2 then
				local _ = nil
				local var2020, var2021 = protoModule.readBuffer(p73, var2010)
				var2010 = var2021
				var2009.universe_id = buffer.tostring(var2020)
			else
				local _ = nil
				local var2022, var2023 = protoModule.readVarInt(p73, var2010)
				var2010 = var2023 + var2022
			end
		elseif var2011 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2024, var2025 = protoModule.readFixed32(p73, var2010)
			local _ = var2024
			var2010 = var2025
		elseif var2011 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2026, var2027 = protoModule.readFixed64(p73, var2010)
			local _ = var2026
			var2010 = var2027
		else
			error("Unsupported wire type: " .. var3015)
		end
	end
	return var2009
end

function t_73:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_73:jsonDecode()
	-- upvalues: t_73 (ref)
	local var2028 = t_73.new()
	
	if self.event_id ~= nil then
		var2028.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2028.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2028.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2028.universe_id = self.universeId
	end
	return var2028
end

t_73.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_73
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p74)
	-- upvalues: t_74 (ref)
	return setmetatable({
		entry_map = if p74 == nil or p74.entry_map == nil then {} else p74.entry_map,
		entry_order = if p74 == nil or p74.entry_order == nil then {} else p74.entry_order,
		next_page_token = if p74 == nil or p74.next_page_token == nil then "" else p74.next_page_token,
		sticky_filter_pills = if p74 == nil or p74.sticky_filter_pills == nil then nil else p74.sticky_filter_pills,
		applied_filters = if p74 == nil or p74.applied_filters == nil then "" else p74.applied_filters
	}, t_74)
end

function t_74:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2028 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2029, var2030 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2029, var3037 = protoModule.writeString(var2029, var2030, i)
			local var2031 = v:encode()
			var2030, var3039 = protoModule.writeTag(var2029, var2030, 2, protoModule.wireTypes.lengthDelimited)
			var2030, var3039 = protoModule.writeBuffer(var2030, var3039, var2031, buffer.len(var2031))
			local var2032 = var2030
			local var2033 = var3039
			local var2034, var2035 = protoModule.writeTag(buff, var2028, 1, protoModule.wireTypes.lengthDelimited)
			var2034, var3043 = protoModule.writeBuffer(var2034, var2035, var2032, var2033)
			buff = var2034
			var2028 = var2035
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2036, var2037 = protoModule.writeTag(buff, var2028, 2, protoModule.wireTypes.lengthDelimited)
			var2036, var3045 = protoModule.writeString(var2036, var2037, v)
			buff = var2036
			var2028 = var2037
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2038, var2039 = protoModule.writeTag(buff, var2028, 3, protoModule.wireTypes.lengthDelimited)
		var2038, var3047 = protoModule.writeString(var2038, var2039, self.next_page_token)
		buff = var2038
		var2028 = var2039
	end
	if self.sticky_filter_pills ~= nil then
		local var2040 = self.sticky_filter_pills:encode()
		local var2041, var2042 = protoModule.writeTag(buff, var2028, 4, protoModule.wireTypes.lengthDelimited)
		var2041, var3050 = protoModule.writeBuffer(var2041, var2042, var2040, buffer.len(var2040))
		buff = var2041
		var2028 = var2042
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2043, var2044 = protoModule.writeTag(buff, var2028, 5, protoModule.wireTypes.lengthDelimited)
		var2043, var3052 = protoModule.writeString(var2043, var2044, self.applied_filters)
		buff = var2043
		var2028 = var2044
	end
	local buff_1 = buffer.create(var2028)
	buffer.copy(buff_1, 0, buff, 0, var2028)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2045 = t_74.new()
	local var2046 = 0
	while var2046 < buffer.len(p74) do
		local _ = nil
		local var2047 = nil
		local var2048, var2049, var2050 = protoModule.readTag(p74, var2046)
		local var2051 = var2048
		var2047 = var2049
		var2046 = var2050
		
		if var2047 == protoModule.wireTypes.varint then
			local _ = nil
			local var2052, var2053 = protoModule.readVarInt(p74, var2046)
			local _ = var2052
			var2046 = var2053
			continue
		end
		if var2047 == protoModule.wireTypes.lengthDelimited then
			if var2051 == 1 then
				local _ = nil
				local var2054, var2055 = protoModule.readBuffer(p74, var2046)
				var2046 = var2055
				var2054 = t.ChartsFeedInputData_EntryMapEntry.decode(var2054)
				var2045.entry_map[var2054.key or ""] = var2054.value or t.FeedEntry.new()
			elseif var2051 == 2 then
				local _ = nil
				local var2056, var2057 = protoModule.readBuffer(p74, var2046)
				var2046 = var2057
				table.insert(var2045.entry_order, buffer.tostring(var2056))
			elseif var2051 == 3 then
				local _ = nil
				local var2058, var2059 = protoModule.readBuffer(p74, var2046)
				var2046 = var2059
				var2045.next_page_token = buffer.tostring(var2058)
			elseif var2051 == 4 then
				local _ = nil
				local var2060, var2061 = protoModule.readBuffer(p74, var2046)
				var2046 = var2061
				var2045.sticky_filter_pills = t.FilterPillsInputData.decode(var2060)
			elseif var2051 == 5 then
				local _ = nil
				local var2062, var2063 = protoModule.readBuffer(p74, var2046)
				var2046 = var2063
				var2045.applied_filters = buffer.tostring(var2062)
			else
				local _ = nil
				local var2064, var2065 = protoModule.readVarInt(p74, var2046)
				var2046 = var2065 + var2064
			end
		elseif var2047 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2066, var2067 = protoModule.readFixed32(p74, var2046)
			local _ = var2066
			var2046 = var2067
		elseif var2047 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2068, var2069 = protoModule.readFixed64(p74, var2046)
			local _ = var2068
			var2046 = var2069
		else
			error("Unsupported wire type: " .. var3056)
		end
	end
	return var2045
end

function t_74:jsonEncode()
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

function t_74:jsonDecode()
	-- upvalues: t_74 (ref), t (ref)
	local var2070 = t_74.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2070.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2070.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2070.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2070.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2070.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2070.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2070.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2070.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2070.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2070.applied_filters = self.appliedFilters
	end
	return var2070
end

t_74.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_74
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p75)
	-- upvalues: t_75 (ref)
	return setmetatable({
		key = if p75 == nil or p75.key == nil then "" else p75.key,
		value = if p75 == nil or p75.value == nil then nil else p75.value
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2071 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2072, var2073 = protoModule.writeTag(buff, var2071, 1, protoModule.wireTypes.lengthDelimited)
		var2072, var3090 = protoModule.writeString(var2072, var2073, self.key)
		buff = var2072
		var2071 = var2073
	end
	if self.value ~= nil then
		local var2074 = self.value:encode()
		local var2075, var2076 = protoModule.writeTag(buff, var2071, 2, protoModule.wireTypes.lengthDelimited)
		var2075, var3093 = protoModule.writeBuffer(var2075, var2076, var2074, buffer.len(var2074))
		buff = var2075
		var2071 = var2076
	end
	local buff_1 = buffer.create(var2071)
	buffer.copy(buff_1, 0, buff, 0, var2071)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2071 = t_75.new()
	local var2072 = 0
	while var2072 < buffer.len(p75) do
		local _ = nil
		local var2073 = nil
		local var2074, var2075, var2076 = protoModule.readTag(p75, var2072)
		local var2077 = var2074
		var2073 = var2075
		var2072 = var2076
		
		if var2073 == protoModule.wireTypes.varint then
			local _ = nil
			local var2078, var2079 = protoModule.readVarInt(p75, var2072)
			local _ = var2078
			var2072 = var2079
			continue
		end
		if var2073 == protoModule.wireTypes.lengthDelimited then
			if var2077 == 1 then
				local _ = nil
				local var2080, var2081 = protoModule.readBuffer(p75, var2072)
				var2072 = var2081
				var2071.key = buffer.tostring(var2080)
			elseif var2077 == 2 then
				local _ = nil
				local var2082, var2083 = protoModule.readBuffer(p75, var2072)
				var2072 = var2083
				var2071.value = t.FeedEntry.decode(var2082)
			else
				local _ = nil
				local var2084, var2085 = protoModule.readVarInt(p75, var2072)
				var2072 = var2085 + var2084
			end
		elseif var2073 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2086, var2087 = protoModule.readFixed32(p75, var2072)
			local _ = var2086
			var2072 = var2087
		elseif var2073 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2088, var2089 = protoModule.readFixed64(p75, var2072)
			local _ = var2088
			var2072 = var2089
		else
			error("Unsupported wire type: " .. var3097)
		end
	end
	return var2071
end

function t_75:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_75:jsonDecode()
	-- upvalues: t_75 (ref), t (ref)
	local var2090 = t_75.new()
	
	if self.key ~= nil then
		var2090.key = self.key
	end
	if self.value ~= nil then
		var2090.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2090
end

t_75.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_75
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p76)
	-- upvalues: t_76 (ref)
	return setmetatable({
		filter_groups = if p76 == nil or p76.filter_groups == nil then {} else p76.filter_groups,
		sort_id = if p76 == nil or p76.sort_id == nil then "" else p76.sort_id,
		secondary_sort_id = if p76 == nil or p76.secondary_sort_id == nil then 0 else p76.secondary_sort_id,
		title = if p76 == nil or p76.title == nil then "" else p76.title,
		primary_sort_id = if p76 == nil or p76.primary_sort_id == nil then nil else p76.primary_sort_id,
		applied_filters = if p76 == nil or p76.applied_filters == nil then nil else p76.applied_filters
	}, t_76)
end

function t_76:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2090 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2091 = v:encode()
			local var2092, var2093 = protoModule.writeTag(buff, var2090, 1, protoModule.wireTypes.lengthDelimited)
			var2092, var3120 = protoModule.writeBuffer(var2092, var2093, var2091, buffer.len(var2091))
			buff = var2092
			var2090 = var2093
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2094, var2095 = protoModule.writeTag(buff, var2090, 2, protoModule.wireTypes.lengthDelimited)
		var2094, var3122 = protoModule.writeString(var2094, var2095, self.sort_id)
		buff = var2094
		var2090 = var2095
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2096, var2097 = protoModule.writeTag(buff, var2090, 3, protoModule.wireTypes.varint)
		var2096, var3124 = protoModule.writeVarInt(var2096, var2097, self.secondary_sort_id)
		buff = var2096
		var2090 = var2097
	end
	if self.title ~= nil and self.title ~= "" then
		local var2098, var2099 = protoModule.writeTag(buff, var2090, 4, protoModule.wireTypes.lengthDelimited)
		var2098, var3126 = protoModule.writeString(var2098, var2099, self.title)
		buff = var2098
		var2090 = var2099
	end
	if self.primary_sort_id ~= nil then
		local var2100, var2101 = protoModule.writeTag(buff, var2090, 5, protoModule.wireTypes.varint)
		var2100, var3128 = protoModule.writeVarInt(var2100, var2101, self.primary_sort_id)
		buff = var2100
		var2090 = var2101
	end
	if self.applied_filters ~= nil then
		local var2102, var2103 = protoModule.writeTag(buff, var2090, 6, protoModule.wireTypes.lengthDelimited)
		var2102, var3130 = protoModule.writeString(var2102, var2103, self.applied_filters)
		buff = var2102
		var2090 = var2103
	end
	local buff_1 = buffer.create(var2090)
	buffer.copy(buff_1, 0, buff, 0, var2090)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2104 = t_76.new()
	local var2105 = 0
	while var2105 < buffer.len(p76) do
		local _ = nil
		local var2106 = nil
		local var2107, var2108, var2109 = protoModule.readTag(p76, var2105)
		local var2110 = var2107
		var2106 = var2108
		var2105 = var2109
		
		if var2106 == protoModule.wireTypes.varint then
			if var2110 == 3 then
				local _ = nil
				local var2111, var2112 = protoModule.readVarIntI32(p76, var2105)
				var2105 = var2112
				var2104.secondary_sort_id = var2111
			elseif var2110 == 5 then
				local _ = nil
				local var2113, var2114 = protoModule.readVarIntI32(p76, var2105)
				var2105 = var2114
				var2104.primary_sort_id = var2113
			else
				local _ = nil
				local var2115, var2116 = protoModule.readVarInt(p76, var2105)
				local _ = var2115
				var2105 = var2116
			end
		end
		if var2106 == protoModule.wireTypes.lengthDelimited then
			if var2110 == 1 then
				local _ = nil
				local var2117, var2118 = protoModule.readBuffer(p76, var2105)
				var2105 = var2118
				table.insert(var2104.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2117))
			elseif var2110 == 2 then
				local _ = nil
				local var2119, var2120 = protoModule.readBuffer(p76, var2105)
				var2105 = var2120
				var2104.sort_id = buffer.tostring(var2119)
			elseif var2110 == 4 then
				local _ = nil
				local var2121, var2122 = protoModule.readBuffer(p76, var2105)
				var2105 = var2122
				var2104.title = buffer.tostring(var2121)
			elseif var2110 == 6 then
				local _ = nil
				local var2123, var2124 = protoModule.readBuffer(p76, var2105)
				var2105 = var2124
				var2104.applied_filters = buffer.tostring(var2123)
			else
				local _ = nil
				local var2125, var2126 = protoModule.readVarInt(p76, var2105)
				var2105 = var2126 + var2125
			end
		elseif var2106 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2127, var2128 = protoModule.readFixed32(p76, var2105)
			local _ = var2127
			var2105 = var2128
		elseif var2106 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2129, var2130 = protoModule.readFixed64(p76, var2105)
			local _ = var2129
			var2105 = var2130
		else
			error("Unsupported wire type: " .. var3134)
		end
	end
	return var2104
end

function t_76:jsonEncode()
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

function t_76:jsonDecode()
	-- upvalues: t_76 (ref), t (ref)
	local var2131 = t_76.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2131.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2131.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2131.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2131.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2131.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2131.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2131.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2131.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2131.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2131.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2131.applied_filters = self.appliedFilters
	end
	return var2131
end

t_76.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_76
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p77)
	-- upvalues: t_77 (ref)
	return setmetatable({
		filter_id = if p77 == nil or p77.filter_id == nil then "" else p77.filter_id,
		display_name = if p77 == nil or p77.display_name == nil then "" else p77.display_name,
		options = if p77 == nil or p77.options == nil then {} else p77.options,
		default_option_id = if p77 == nil or p77.default_option_id == nil then "" else p77.default_option_id,
		selected_option_id = if p77 == nil or p77.selected_option_id == nil then "" else p77.selected_option_id,
		filter_type = if p77 == nil or p77.filter_type == nil then "" else p77.filter_type,
		inactive_option_ids = if p77 == nil or p77.inactive_option_ids == nil then {} else p77.inactive_option_ids,
		info_text = if p77 == nil or p77.info_text == nil then "" else p77.info_text
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2132 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2133, var2134 = protoModule.writeTag(buff, var2132, 1, protoModule.wireTypes.lengthDelimited)
		var2133, var3167 = protoModule.writeString(var2133, var2134, self.filter_id)
		buff = var2133
		var2132 = var2134
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2135, var2136 = protoModule.writeTag(buff, var2132, 2, protoModule.wireTypes.lengthDelimited)
		var2135, var3169 = protoModule.writeString(var2135, var2136, self.display_name)
		buff = var2135
		var2132 = var2136
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2137 = v:encode()
			local var2138, var2139 = protoModule.writeTag(buff, var2132, 3, protoModule.wireTypes.lengthDelimited)
			var2138, var3172 = protoModule.writeBuffer(var2138, var2139, var2137, buffer.len(var2137))
			buff = var2138
			var2132 = var2139
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2140, var2141 = protoModule.writeTag(buff, var2132, 4, protoModule.wireTypes.lengthDelimited)
		var2140, var3174 = protoModule.writeString(var2140, var2141, self.default_option_id)
		buff = var2140
		var2132 = var2141
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2142, var2143 = protoModule.writeTag(buff, var2132, 5, protoModule.wireTypes.lengthDelimited)
		var2142, var3176 = protoModule.writeString(var2142, var2143, self.selected_option_id)
		buff = var2142
		var2132 = var2143
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2144, var2145 = protoModule.writeTag(buff, var2132, 6, protoModule.wireTypes.lengthDelimited)
		var2144, var3178 = protoModule.writeString(var2144, var2145, self.filter_type)
		buff = var2144
		var2132 = var2145
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2146, var2147 = protoModule.writeTag(buff, var2132, 7, protoModule.wireTypes.lengthDelimited)
			var2146, var3180 = protoModule.writeString(var2146, var2147, v)
			buff = var2146
			var2132 = var2147
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2148, var2149 = protoModule.writeTag(buff, var2132, 8, protoModule.wireTypes.lengthDelimited)
		var2148, var3182 = protoModule.writeString(var2148, var2149, self.info_text)
		buff = var2148
		var2132 = var2149
	end
	local buff_1 = buffer.create(var2132)
	buffer.copy(buff_1, 0, buff, 0, var2132)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2150 = t_77.new()
	local var2151 = 0
	while var2151 < buffer.len(p77) do
		local _ = nil
		local var2152 = nil
		local var2153, var2154, var2155 = protoModule.readTag(p77, var2151)
		local var2156 = var2153
		var2152 = var2154
		var2151 = var2155
		
		if var2152 == protoModule.wireTypes.varint then
			local _ = nil
			local var2157, var2158 = protoModule.readVarInt(p77, var2151)
			local _ = var2157
			var2151 = var2158
			continue
		end
		if var2152 == protoModule.wireTypes.lengthDelimited then
			if var2156 == 1 then
				local _ = nil
				local var2159, var2160 = protoModule.readBuffer(p77, var2151)
				var2151 = var2160
				var2150.filter_id = buffer.tostring(var2159)
			elseif var2156 == 2 then
				local _ = nil
				local var2161, var2162 = protoModule.readBuffer(p77, var2151)
				var2151 = var2162
				var2150.display_name = buffer.tostring(var2161)
			elseif var2156 == 3 then
				local _ = nil
				local var2163, var2164 = protoModule.readBuffer(p77, var2151)
				var2151 = var2164
				table.insert(var2150.options, t.FilterPillsInputData_FilterOption.decode(var2163))
			elseif var2156 == 4 then
				local _ = nil
				local var2165, var2166 = protoModule.readBuffer(p77, var2151)
				var2151 = var2166
				var2150.default_option_id = buffer.tostring(var2165)
			elseif var2156 == 5 then
				local _ = nil
				local var2167, var2168 = protoModule.readBuffer(p77, var2151)
				var2151 = var2168
				var2150.selected_option_id = buffer.tostring(var2167)
			elseif var2156 == 6 then
				local _ = nil
				local var2169, var2170 = protoModule.readBuffer(p77, var2151)
				var2151 = var2170
				var2150.filter_type = buffer.tostring(var2169)
			elseif var2156 == 7 then
				local _ = nil
				local var2171, var2172 = protoModule.readBuffer(p77, var2151)
				var2151 = var2172
				table.insert(var2150.inactive_option_ids, buffer.tostring(var2171))
			elseif var2156 == 8 then
				local _ = nil
				local var2173, var2174 = protoModule.readBuffer(p77, var2151)
				var2151 = var2174
				var2150.info_text = buffer.tostring(var2173)
			else
				local _ = nil
				local var2175, var2176 = protoModule.readVarInt(p77, var2151)
				var2151 = var2176 + var2175
			end
		elseif var2152 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2177, var2178 = protoModule.readFixed32(p77, var2151)
			local _ = var2177
			var2151 = var2178
		elseif var2152 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2179, var2180 = protoModule.readFixed64(p77, var2151)
			local _ = var2179
			var2151 = var2180
		else
			error("Unsupported wire type: " .. var3186)
		end
	end
	return var2150
end

function t_77:jsonEncode()
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

function t_77:jsonDecode()
	-- upvalues: t_77 (ref), t (ref)
	local var2181 = t_77.new()
	
	if self.filter_id ~= nil then
		var2181.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2181.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2181.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2181.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2181.options = t_1
	end
	if self.default_option_id ~= nil then
		var2181.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2181.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2181.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2181.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2181.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2181.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2181.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2181.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2181.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2181.info_text = self.infoText
	end
	return var2181
end

t_77.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_77
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p78)
	-- upvalues: t_78 (ref)
	return setmetatable({
		option_id = if p78 == nil or p78.option_id == nil then "" else p78.option_id,
		display_name = if p78 == nil or p78.display_name == nil then "" else p78.display_name,
		option_context_tag = if p78 == nil or p78.option_context_tag == nil then "" else p78.option_context_tag
	}, t_78)
end

function t_78:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2182 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2183, var2184 = protoModule.writeTag(buff, var2182, 1, protoModule.wireTypes.lengthDelimited)
		var2183, var3225 = protoModule.writeString(var2183, var2184, self.option_id)
		buff = var2183
		var2182 = var2184
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2185, var2186 = protoModule.writeTag(buff, var2182, 2, protoModule.wireTypes.lengthDelimited)
		var2185, var3227 = protoModule.writeString(var2185, var2186, self.display_name)
		buff = var2185
		var2182 = var2186
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2187, var2188 = protoModule.writeTag(buff, var2182, 3, protoModule.wireTypes.lengthDelimited)
		var2187, var3229 = protoModule.writeString(var2187, var2188, self.option_context_tag)
		buff = var2187
		var2182 = var2188
	end
	local buff_1 = buffer.create(var2182)
	buffer.copy(buff_1, 0, buff, 0, var2182)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var2182 = t_78.new()
	local var2183 = 0
	while var2183 < buffer.len(p78) do
		local _ = nil
		local var2184 = nil
		local var2185, var2186, var2187 = protoModule.readTag(p78, var2183)
		local var2188 = var2185
		var2184 = var2186
		var2183 = var2187
		
		if var2184 == protoModule.wireTypes.varint then
			local _ = nil
			local var2189, var2190 = protoModule.readVarInt(p78, var2183)
			local _ = var2189
			var2183 = var2190
			continue
		end
		if var2184 == protoModule.wireTypes.lengthDelimited then
			if var2188 == 1 then
				local _ = nil
				local var2191, var2192 = protoModule.readBuffer(p78, var2183)
				var2183 = var2192
				var2182.option_id = buffer.tostring(var2191)
			elseif var2188 == 2 then
				local _ = nil
				local var2193, var2194 = protoModule.readBuffer(p78, var2183)
				var2183 = var2194
				var2182.display_name = buffer.tostring(var2193)
			elseif var2188 == 3 then
				local _ = nil
				local var2195, var2196 = protoModule.readBuffer(p78, var2183)
				var2183 = var2196
				var2182.option_context_tag = buffer.tostring(var2195)
			else
				local _ = nil
				local var2197, var2198 = protoModule.readVarInt(p78, var2183)
				var2183 = var2198 + var2197
			end
		elseif var2184 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2199, var2200 = protoModule.readFixed32(p78, var2183)
			local _ = var2199
			var2183 = var2200
		elseif var2184 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2201, var2202 = protoModule.readFixed64(p78, var2183)
			local _ = var2201
			var2183 = var2202
		else
			error("Unsupported wire type: " .. var3233)
		end
	end
	return var2182
end

function t_78:jsonEncode()
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

function t_78:jsonDecode()
	-- upvalues: t_78 (ref)
	local var2203 = t_78.new()
	
	if self.option_id ~= nil then
		var2203.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2203.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2203.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2203.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2203.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2203.option_context_tag = self.optionContextTag
	end
	return var2203
end

t_78.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_78
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p79)
	-- upvalues: t_79 (ref)
	return setmetatable({
		sort_options = if p79 == nil or p79.sort_options == nil then {} else p79.sort_options,
		selected_sort_id = if p79 == nil or p79.selected_sort_id == nil then "" else p79.selected_sort_id
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2203 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2204 = v:encode()
			local var2205, var2206 = protoModule.writeTag(buff, var2203, 1, protoModule.wireTypes.lengthDelimited)
			var2205, var3258 = protoModule.writeBuffer(var2205, var2206, var2204, buffer.len(var2204))
			buff = var2205
			var2203 = var2206
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2207, var2208 = protoModule.writeTag(buff, var2203, 2, protoModule.wireTypes.lengthDelimited)
		var2207, var3260 = protoModule.writeString(var2207, var2208, self.selected_sort_id)
		buff = var2207
		var2203 = var2208
	end
	local buff_1 = buffer.create(var2203)
	buffer.copy(buff_1, 0, buff, 0, var2203)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2209 = t_79.new()
	local var2210 = 0
	while var2210 < buffer.len(p79) do
		local _ = nil
		local var2211 = nil
		local var2212, var2213, var2214 = protoModule.readTag(p79, var2210)
		local var2215 = var2212
		var2211 = var2213
		var2210 = var2214
		
		if var2211 == protoModule.wireTypes.varint then
			local _ = nil
			local var2216, var2217 = protoModule.readVarInt(p79, var2210)
			local _ = var2216
			var2210 = var2217
			continue
		end
		if var2211 == protoModule.wireTypes.lengthDelimited then
			if var2215 == 1 then
				local _ = nil
				local var2218, var2219 = protoModule.readBuffer(p79, var2210)
				var2210 = var2219
				table.insert(var2209.sort_options, t.SortSelectorInputData_SortOption.decode(var2218))
			elseif var2215 == 2 then
				local _ = nil
				local var2220, var2221 = protoModule.readBuffer(p79, var2210)
				var2210 = var2221
				var2209.selected_sort_id = buffer.tostring(var2220)
			else
				local _ = nil
				local var2222, var2223 = protoModule.readVarInt(p79, var2210)
				var2210 = var2223 + var2222
			end
		elseif var2211 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2224, var2225 = protoModule.readFixed32(p79, var2210)
			local _ = var2224
			var2210 = var2225
		elseif var2211 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2226, var2227 = protoModule.readFixed64(p79, var2210)
			local _ = var2226
			var2210 = var2227
		else
			error("Unsupported wire type: " .. var3264)
		end
	end
	return var2209
end

function t_79:jsonEncode()
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

function t_79:jsonDecode()
	-- upvalues: t_79 (ref), t (ref)
	local var2228 = t_79.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2228.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2228.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2228.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2228.selected_sort_id = self.selectedSortId
	end
	return var2228
end

t_79.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_79
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p80)
	-- upvalues: t_80 (ref)
	return setmetatable({
		sort_id = if p80 == nil or p80.sort_id == nil then "" else p80.sort_id,
		display_name = if p80 == nil or p80.display_name == nil then "" else p80.display_name,
		content_type = if p80 == nil or p80.content_type == nil then "" else p80.content_type
	}, t_80)
end

function t_80:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2229 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2230, var2231 = protoModule.writeTag(buff, var2229, 1, protoModule.wireTypes.lengthDelimited)
		var2230, var3289 = protoModule.writeString(var2230, var2231, self.sort_id)
		buff = var2230
		var2229 = var2231
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2232, var2233 = protoModule.writeTag(buff, var2229, 2, protoModule.wireTypes.lengthDelimited)
		var2232, var3291 = protoModule.writeString(var2232, var2233, self.display_name)
		buff = var2232
		var2229 = var2233
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2234, var2235 = protoModule.writeTag(buff, var2229, 3, protoModule.wireTypes.lengthDelimited)
		var2234, var3293 = protoModule.writeString(var2234, var2235, self.content_type)
		buff = var2234
		var2229 = var2235
	end
	local buff_1 = buffer.create(var2229)
	buffer.copy(buff_1, 0, buff, 0, var2229)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref)
	local var2229 = t_80.new()
	local var2230 = 0
	while var2230 < buffer.len(p80) do
		local _ = nil
		local var2231 = nil
		local var2232, var2233, var2234 = protoModule.readTag(p80, var2230)
		local var2235 = var2232
		var2231 = var2233
		var2230 = var2234
		
		if var2231 == protoModule.wireTypes.varint then
			local _ = nil
			local var2236, var2237 = protoModule.readVarInt(p80, var2230)
			local _ = var2236
			var2230 = var2237
			continue
		end
		if var2231 == protoModule.wireTypes.lengthDelimited then
			if var2235 == 1 then
				local _ = nil
				local var2238, var2239 = protoModule.readBuffer(p80, var2230)
				var2230 = var2239
				var2229.sort_id = buffer.tostring(var2238)
			elseif var2235 == 2 then
				local _ = nil
				local var2240, var2241 = protoModule.readBuffer(p80, var2230)
				var2230 = var2241
				var2229.display_name = buffer.tostring(var2240)
			elseif var2235 == 3 then
				local _ = nil
				local var2242, var2243 = protoModule.readBuffer(p80, var2230)
				var2230 = var2243
				var2229.content_type = buffer.tostring(var2242)
			else
				local _ = nil
				local var2244, var2245 = protoModule.readVarInt(p80, var2230)
				var2230 = var2245 + var2244
			end
		elseif var2231 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2246, var2247 = protoModule.readFixed32(p80, var2230)
			local _ = var2246
			var2230 = var2247
		elseif var2231 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2248, var2249 = protoModule.readFixed64(p80, var2230)
			local _ = var2248
			var2230 = var2249
		else
			error("Unsupported wire type: " .. var3297)
		end
	end
	return var2229
end

function t_80:jsonEncode()
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

function t_80:jsonDecode()
	-- upvalues: t_80 (ref)
	local var2250 = t_80.new()
	
	if self.sort_id ~= nil then
		var2250.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2250.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2250.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2250.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2250.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2250.content_type = self.contentType
	end
	return var2250
end

t_80.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_80
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p81)
	-- upvalues: t_81 (ref)
	return setmetatable({
		selected_option = if p81 == nil or p81.selected_option == nil then "" else p81.selected_option,
		options = if p81 == nil or p81.options == nil then {} else p81.options,
		experience_carousel = if p81 == nil or p81.experience_carousel == nil then nil else p81.experience_carousel
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2250 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2251, var2252 = protoModule.writeTag(buff, var2250, 1, protoModule.wireTypes.lengthDelimited)
		var2251, var3321 = protoModule.writeString(var2251, var2252, self.selected_option)
		buff = var2251
		var2250 = var2252
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2253 = v:encode()
			local var2254, var2255 = protoModule.writeTag(buff, var2250, 2, protoModule.wireTypes.lengthDelimited)
			var2254, var3324 = protoModule.writeBuffer(var2254, var2255, var2253, buffer.len(var2253))
			buff = var2254
			var2250 = var2255
		end
	end
	if self.experience_carousel ~= nil then
		local var2256 = self.experience_carousel:encode()
		local var2257, var2258 = protoModule.writeTag(buff, var2250, 3, protoModule.wireTypes.lengthDelimited)
		var2257, var3327 = protoModule.writeBuffer(var2257, var2258, var2256, buffer.len(var2256))
		buff = var2257
		var2250 = var2258
	end
	local buff_1 = buffer.create(var2250)
	buffer.copy(buff_1, 0, buff, 0, var2250)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2259 = t_81.new()
	local var2260 = 0
	while var2260 < buffer.len(p81) do
		local _ = nil
		local var2261 = nil
		local var2262, var2263, var2264 = protoModule.readTag(p81, var2260)
		local var2265 = var2262
		var2261 = var2263
		var2260 = var2264
		
		if var2261 == protoModule.wireTypes.varint then
			local _ = nil
			local var2266, var2267 = protoModule.readVarInt(p81, var2260)
			local _ = var2266
			var2260 = var2267
			continue
		end
		if var2261 == protoModule.wireTypes.lengthDelimited then
			if var2265 == 1 then
				local _ = nil
				local var2268, var2269 = protoModule.readBuffer(p81, var2260)
				var2260 = var2269
				var2259.selected_option = buffer.tostring(var2268)
			elseif var2265 == 2 then
				local _ = nil
				local var2270, var2271 = protoModule.readBuffer(p81, var2260)
				var2260 = var2271
				table.insert(var2259.options, t.SelectorOption.decode(var2270))
			elseif var2265 == 3 then
				local _ = nil
				local var2272, var2273 = protoModule.readBuffer(p81, var2260)
				var2260 = var2273
				var2259.experience_carousel = t.ExperienceCarouselInputData.decode(var2272)
			else
				local _ = nil
				local var2274, var2275 = protoModule.readVarInt(p81, var2260)
				var2260 = var2275 + var2274
			end
		elseif var2261 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2276, var2277 = protoModule.readFixed32(p81, var2260)
			local _ = var2276
			var2260 = var2277
		elseif var2261 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2278, var2279 = protoModule.readFixed64(p81, var2260)
			local _ = var2278
			var2260 = var2279
		else
			error("Unsupported wire type: " .. var3331)
		end
	end
	return var2259
end

function t_81:jsonEncode()
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

function t_81:jsonDecode()
	-- upvalues: t_81 (ref), t (ref)
	local var2280 = t_81.new()
	
	if self.selected_option ~= nil then
		var2280.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2280.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2280.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2280.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2280.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2280
end

t_81.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_81
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p82)
	-- upvalues: t_82 (ref)
	return setmetatable({
		id = if p82 == nil or p82.id == nil then "" else p82.id,
		preview_rows = if p82 == nil or p82.preview_rows == nil then 0 else p82.preview_rows,
		widget_style = if p82 == nil or p82.widget_style == nil then nil else p82.widget_style,
		see_all_button = if p82 == nil or p82.see_all_button == nil then false else p82.see_all_button,
		information_popover_text = if p82 == nil or p82.information_popover_text == nil then "" else p82.information_popover_text
	}, t_82)
end

function t_82:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2281 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2282, var2283 = protoModule.writeTag(buff, var2281, 1, protoModule.wireTypes.lengthDelimited)
		var2282, var3357 = protoModule.writeString(var2282, var2283, self.id)
		buff = var2282
		var2281 = var2283
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2284, var2285 = protoModule.writeTag(buff, var2281, 4, protoModule.wireTypes.varint)
		var2284, var3359 = protoModule.writeVarInt(var2284, var2285, self.preview_rows)
		buff = var2284
		var2281 = var2285
	end
	if self.widget_style ~= nil then
		local var2286 = self.widget_style:encode()
		local var2287, var2288 = protoModule.writeTag(buff, var2281, 3, protoModule.wireTypes.lengthDelimited)
		var2287, var3362 = protoModule.writeBuffer(var2287, var2288, var2286, buffer.len(var2286))
		buff = var2287
		var2281 = var2288
	end
	if self.see_all_button then
		local var2289, var2290 = protoModule.writeTag(buff, var2281, 5, protoModule.wireTypes.varint)
		var2289, var3364 = protoModule.writeVarInt(var2289, var2290, if self.see_all_button then 1 else 0)
		buff = var2289
		var2281 = var2290
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2291, var2292 = protoModule.writeTag(buff, var2281, 6, protoModule.wireTypes.lengthDelimited)
		var2291, var3366 = protoModule.writeString(var2291, var2292, self.information_popover_text)
		buff = var2291
		var2281 = var2292
	end
	local buff_1 = buffer.create(var2281)
	buffer.copy(buff_1, 0, buff, 0, var2281)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2281 = t_82.new()
	local var2282 = 0
	while var2282 < buffer.len(p82) do
		local _ = nil
		local var2283 = nil
		local var2284, var2285, var2286 = protoModule.readTag(p82, var2282)
		local var2287 = var2284
		var2283 = var2285
		var2282 = var2286
		
		if var2283 == protoModule.wireTypes.varint then
			if var2287 == 4 then
				local _ = nil
				local var2288, var2289 = protoModule.readVarIntI64(p82, var2282)
				var2282 = var2289
				var2281.preview_rows = var2288
			elseif var2287 == 5 then
				local _ = nil
				local var2290, var2291 = protoModule.readVarInt(p82, var2282)
				var2282 = var2291
				var2281.see_all_button = var2290 ~= 0
			else
				local _ = nil
				local var2292, var2293 = protoModule.readVarInt(p82, var2282)
				local _ = var2292
				var2282 = var2293
			end
		end
		if var2283 == protoModule.wireTypes.lengthDelimited then
			if var2287 == 1 then
				local _ = nil
				local var2294, var2295 = protoModule.readBuffer(p82, var2282)
				var2282 = var2295
				var2281.id = buffer.tostring(var2294)
			elseif var2287 == 3 then
				local _ = nil
				local var2296, var2297 = protoModule.readBuffer(p82, var2282)
				var2282 = var2297
				var2281.widget_style = t.WidgetStyleData.decode(var2296)
			elseif var2287 == 6 then
				local _ = nil
				local var2298, var2299 = protoModule.readBuffer(p82, var2282)
				var2282 = var2299
				var2281.information_popover_text = buffer.tostring(var2298)
			else
				local _ = nil
				local var2300, var2301 = protoModule.readVarInt(p82, var2282)
				var2282 = var2301 + var2300
			end
		elseif var2283 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2302, var2303 = protoModule.readFixed32(p82, var2282)
			local _ = var2302
			var2282 = var2303
		elseif var2283 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2304, var2305 = protoModule.readFixed64(p82, var2282)
			local _ = var2304
			var2282 = var2305
		else
			error("Unsupported wire type: " .. var3370)
		end
	end
	return var2281
end

function t_82:jsonEncode()
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

function t_82:jsonDecode()
	-- upvalues: t_82 (ref), t (ref)
	local var2306 = t_82.new()
	
	if self.id ~= nil then
		var2306.id = self.id
	end
	if self.preview_rows ~= nil then
		var2306.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2306.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2306.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2306.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2306.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2306.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2306.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2306.information_popover_text = self.informationPopoverText
	end
	return var2306
end

t_82.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_82
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p83)
	-- upvalues: t_83 (ref)
	return setmetatable({
		id = if p83 == nil or p83.id == nil then "" else p83.id,
		num_items_to_show = if p83 == nil or p83.num_items_to_show == nil then 0 else p83.num_items_to_show,
		widget_style = if p83 == nil or p83.widget_style == nil then nil else p83.widget_style,
		see_all_button = if p83 == nil or p83.see_all_button == nil then false else p83.see_all_button,
		information_popover_text = if p83 == nil or p83.information_popover_text == nil then "" else p83.information_popover_text
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2306 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2307, var2308 = protoModule.writeTag(buff, var2306, 1, protoModule.wireTypes.lengthDelimited)
		var2307, var3398 = protoModule.writeString(var2307, var2308, self.id)
		buff = var2307
		var2306 = var2308
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2309, var2310 = protoModule.writeTag(buff, var2306, 5, protoModule.wireTypes.varint)
		var2309, var3400 = protoModule.writeVarInt(var2309, var2310, self.num_items_to_show)
		buff = var2309
		var2306 = var2310
	end
	if self.widget_style ~= nil then
		local var2311 = self.widget_style:encode()
		local var2312, var2313 = protoModule.writeTag(buff, var2306, 3, protoModule.wireTypes.lengthDelimited)
		var2312, var3403 = protoModule.writeBuffer(var2312, var2313, var2311, buffer.len(var2311))
		buff = var2312
		var2306 = var2313
	end
	if self.see_all_button then
		local var2314, var2315 = protoModule.writeTag(buff, var2306, 6, protoModule.wireTypes.varint)
		var2314, var3405 = protoModule.writeVarInt(var2314, var2315, if self.see_all_button then 1 else 0)
		buff = var2314
		var2306 = var2315
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2316, var2317 = protoModule.writeTag(buff, var2306, 7, protoModule.wireTypes.lengthDelimited)
		var2316, var3407 = protoModule.writeString(var2316, var2317, self.information_popover_text)
		buff = var2316
		var2306 = var2317
	end
	local buff_1 = buffer.create(var2306)
	buffer.copy(buff_1, 0, buff, 0, var2306)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2306 = t_83.new()
	local var2307 = 0
	while var2307 < buffer.len(p83) do
		local _ = nil
		local var2308 = nil
		local var2309, var2310, var2311 = protoModule.readTag(p83, var2307)
		local var2312 = var2309
		var2308 = var2310
		var2307 = var2311
		
		if var2308 == protoModule.wireTypes.varint then
			if var2312 == 5 then
				local _ = nil
				local var2313, var2314 = protoModule.readVarIntI64(p83, var2307)
				var2307 = var2314
				var2306.num_items_to_show = var2313
			elseif var2312 == 6 then
				local _ = nil
				local var2315, var2316 = protoModule.readVarInt(p83, var2307)
				var2307 = var2316
				var2306.see_all_button = var2315 ~= 0
			else
				local _ = nil
				local var2317, var2318 = protoModule.readVarInt(p83, var2307)
				local _ = var2317
				var2307 = var2318
			end
		end
		if var2308 == protoModule.wireTypes.lengthDelimited then
			if var2312 == 1 then
				local _ = nil
				local var2319, var2320 = protoModule.readBuffer(p83, var2307)
				var2307 = var2320
				var2306.id = buffer.tostring(var2319)
			elseif var2312 == 3 then
				local _ = nil
				local var2321, var2322 = protoModule.readBuffer(p83, var2307)
				var2307 = var2322
				var2306.widget_style = t.WidgetStyleData.decode(var2321)
			elseif var2312 == 7 then
				local _ = nil
				local var2323, var2324 = protoModule.readBuffer(p83, var2307)
				var2307 = var2324
				var2306.information_popover_text = buffer.tostring(var2323)
			else
				local _ = nil
				local var2325, var2326 = protoModule.readVarInt(p83, var2307)
				var2307 = var2326 + var2325
			end
		elseif var2308 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2327, var2328 = protoModule.readFixed32(p83, var2307)
			local _ = var2327
			var2307 = var2328
		elseif var2308 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2329, var2330 = protoModule.readFixed64(p83, var2307)
			local _ = var2329
			var2307 = var2330
		else
			error("Unsupported wire type: " .. var3411)
		end
	end
	return var2306
end

function t_83:jsonEncode()
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

function t_83:jsonDecode()
	-- upvalues: t_83 (ref), t (ref)
	local var2331 = t_83.new()
	
	if self.id ~= nil then
		var2331.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2331.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2331.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2331.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2331.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2331.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2331.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2331.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2331.information_popover_text = self.informationPopoverText
	end
	return var2331
end

t_83.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_83
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p84)
	-- upvalues: t_84 (ref)
	return setmetatable({
		background_layers = if p84 == nil or p84.background_layers == nil then {} else p84.background_layers
	}, t_84)
end

function t_84:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2331 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2332 = v:encode()
			local var2333, var2334 = protoModule.writeTag(buff, var2331, 1, protoModule.wireTypes.lengthDelimited)
			var2333, var3440 = protoModule.writeBuffer(var2333, var2334, var2332, buffer.len(var2332))
			buff = var2333
			var2331 = var2334
		end
	end
	local buff_1 = buffer.create(var2331)
	buffer.copy(buff_1, 0, buff, 0, var2331)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2335 = t_84.new()
	local var2336 = 0
	while var2336 < buffer.len(p84) do
		local _ = nil
		local var2337 = nil
		local var2338, var2339, var2340 = protoModule.readTag(p84, var2336)
		local var2341 = var2338
		var2337 = var2339
		var2336 = var2340
		
		if var2337 == protoModule.wireTypes.varint then
			local _ = nil
			local var2342, var2343 = protoModule.readVarInt(p84, var2336)
			local _ = var2342
			var2336 = var2343
			continue
		end
		if var2337 == protoModule.wireTypes.lengthDelimited then
			if var2341 == 1 then
				local _ = nil
				local var2344, var2345 = protoModule.readBuffer(p84, var2336)
				var2336 = var2345
				table.insert(var2335.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2344))
			else
				local _ = nil
				local var2346, var2347 = protoModule.readVarInt(p84, var2336)
				var2336 = var2347 + var2346
			end
		elseif var2337 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2348, var2349 = protoModule.readFixed32(p84, var2336)
			local _ = var2348
			var2336 = var2349
		elseif var2337 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2350, var2351 = protoModule.readFixed64(p84, var2336)
			local _ = var2350
			var2336 = var2351
		else
			error("Unsupported wire type: " .. var3444)
		end
	end
	return var2335
end

function t_84:jsonEncode()
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

function t_84:jsonDecode()
	-- upvalues: t_84 (ref), backgroundLayerModule (ref)
	local var2352 = t_84.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2352.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2352.background_layers = t
	end
	return var2352
end

t_84.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_84
typeRegistryModule.default:register(t.WidgetStyleData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p85)
	-- upvalues: t_85 (ref)
	return setmetatable({
		id = if p85 == nil or p85.id == nil then "" else p85.id,
		available_until = if p85 == nil or p85.available_until == nil then "" else p85.available_until,
		widget_style = if p85 == nil or p85.widget_style == nil then nil else p85.widget_style
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2353 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2354, var2355 = protoModule.writeTag(buff, var2353, 1, protoModule.wireTypes.lengthDelimited)
		var2354, var3467 = protoModule.writeString(var2354, var2355, self.id)
		buff = var2354
		var2353 = var2355
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2356, var2357 = protoModule.writeTag(buff, var2353, 2, protoModule.wireTypes.lengthDelimited)
		var2356, var3469 = protoModule.writeString(var2356, var2357, self.available_until)
		buff = var2356
		var2353 = var2357
	end
	if self.widget_style ~= nil then
		local var2358 = self.widget_style:encode()
		local var2359, var2360 = protoModule.writeTag(buff, var2353, 3, protoModule.wireTypes.lengthDelimited)
		var2359, var3472 = protoModule.writeBuffer(var2359, var2360, var2358, buffer.len(var2358))
		buff = var2359
		var2353 = var2360
	end
	local buff_1 = buffer.create(var2353)
	buffer.copy(buff_1, 0, buff, 0, var2353)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2353 = t_85.new()
	local var2354 = 0
	while var2354 < buffer.len(p85) do
		local _ = nil
		local var2355 = nil
		local var2356, var2357, var2358 = protoModule.readTag(p85, var2354)
		local var2359 = var2356
		var2355 = var2357
		var2354 = var2358
		
		if var2355 == protoModule.wireTypes.varint then
			local _ = nil
			local var2360, var2361 = protoModule.readVarInt(p85, var2354)
			local _ = var2360
			var2354 = var2361
			continue
		end
		if var2355 == protoModule.wireTypes.lengthDelimited then
			if var2359 == 1 then
				local _ = nil
				local var2362, var2363 = protoModule.readBuffer(p85, var2354)
				var2354 = var2363
				var2353.id = buffer.tostring(var2362)
			elseif var2359 == 2 then
				local _ = nil
				local var2364, var2365 = protoModule.readBuffer(p85, var2354)
				var2354 = var2365
				var2353.available_until = buffer.tostring(var2364)
			elseif var2359 == 3 then
				local _ = nil
				local var2366, var2367 = protoModule.readBuffer(p85, var2354)
				var2354 = var2367
				var2353.widget_style = t.WidgetStyleData.decode(var2366)
			else
				local _ = nil
				local var2368, var2369 = protoModule.readVarInt(p85, var2354)
				var2354 = var2369 + var2368
			end
		elseif var2355 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2370, var2371 = protoModule.readFixed32(p85, var2354)
			local _ = var2370
			var2354 = var2371
		elseif var2355 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2372, var2373 = protoModule.readFixed64(p85, var2354)
			local _ = var2372
			var2354 = var2373
		else
			error("Unsupported wire type: " .. var3476)
		end
	end
	return var2353
end

function t_85:jsonEncode()
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

function t_85:jsonDecode()
	-- upvalues: t_85 (ref), t (ref)
	local var2374 = t_85.new()
	
	if self.id ~= nil then
		var2374.id = self.id
	end
	if self.available_until ~= nil then
		var2374.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2374.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2374.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2374.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2374
end

t_85.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_85
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p86)
	-- upvalues: t_86 (ref)
	return setmetatable({
		entry_map = if p86 == nil or p86.entry_map == nil then {} else p86.entry_map,
		entry_order = if p86 == nil or p86.entry_order == nil then {} else p86.entry_order
	}, t_86)
end

function t_86:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2374 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2375, var2376 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2375, var3500 = protoModule.writeString(var2375, var2376, i)
			local var2377 = v:encode()
			var2376, var3502 = protoModule.writeTag(var2375, var2376, 2, protoModule.wireTypes.lengthDelimited)
			var2376, var3502 = protoModule.writeBuffer(var2376, var3502, var2377, buffer.len(var2377))
			local var2378 = var2376
			local var2379 = var3502
			local var2380, var2381 = protoModule.writeTag(buff, var2374, 1, protoModule.wireTypes.lengthDelimited)
			var2380, var3506 = protoModule.writeBuffer(var2380, var2381, var2378, var2379)
			buff = var2380
			var2374 = var2381
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2382, var2383 = protoModule.writeTag(buff, var2374, 2, protoModule.wireTypes.lengthDelimited)
			var2382, var3508 = protoModule.writeString(var2382, var2383, v)
			buff = var2382
			var2374 = var2383
		end
	end
	local buff_1 = buffer.create(var2374)
	buffer.copy(buff_1, 0, buff, 0, var2374)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2384 = t_86.new()
	local var2385 = 0
	while var2385 < buffer.len(p86) do
		local _ = nil
		local var2386 = nil
		local var2387, var2388, var2389 = protoModule.readTag(p86, var2385)
		local var2390 = var2387
		var2386 = var2388
		var2385 = var2389
		
		if var2386 == protoModule.wireTypes.varint then
			local _ = nil
			local var2391, var2392 = protoModule.readVarInt(p86, var2385)
			local _ = var2391
			var2385 = var2392
			continue
		end
		if var2386 == protoModule.wireTypes.lengthDelimited then
			if var2390 == 1 then
				local _ = nil
				local var2393, var2394 = protoModule.readBuffer(p86, var2385)
				var2385 = var2394
				var2393 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2393)
				var2384.entry_map[var2393.key or ""] = var2393.value or t.FeedEntry.new()
			elseif var2390 == 2 then
				local _ = nil
				local var2395, var2396 = protoModule.readBuffer(p86, var2385)
				var2385 = var2396
				table.insert(var2384.entry_order, buffer.tostring(var2395))
			else
				local _ = nil
				local var2397, var2398 = protoModule.readVarInt(p86, var2385)
				var2385 = var2398 + var2397
			end
		elseif var2386 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2399, var2400 = protoModule.readFixed32(p86, var2385)
			local _ = var2399
			var2385 = var2400
		elseif var2386 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2401, var2402 = protoModule.readFixed64(p86, var2385)
			local _ = var2401
			var2385 = var2402
		else
			error("Unsupported wire type: " .. var3512)
		end
	end
	return var2384
end

function t_86:jsonEncode()
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

function t_86:jsonDecode()
	-- upvalues: t_86 (ref), t (ref)
	local var2403 = t_86.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2403.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2403.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2403.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2403.entry_order = t_1
	end
	return var2403
end

t_86.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_86
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p87)
	-- upvalues: t_87 (ref)
	return setmetatable({
		key = if p87 == nil or p87.key == nil then "" else p87.key,
		value = if p87 == nil or p87.value == nil then nil else p87.value
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2404 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2405, var2406 = protoModule.writeTag(buff, var2404, 1, protoModule.wireTypes.lengthDelimited)
		var2405, var3540 = protoModule.writeString(var2405, var2406, self.key)
		buff = var2405
		var2404 = var2406
	end
	if self.value ~= nil then
		local var2407 = self.value:encode()
		local var2408, var2409 = protoModule.writeTag(buff, var2404, 2, protoModule.wireTypes.lengthDelimited)
		var2408, var3543 = protoModule.writeBuffer(var2408, var2409, var2407, buffer.len(var2407))
		buff = var2408
		var2404 = var2409
	end
	local buff_1 = buffer.create(var2404)
	buffer.copy(buff_1, 0, buff, 0, var2404)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2404 = t_87.new()
	local var2405 = 0
	while var2405 < buffer.len(p87) do
		local _ = nil
		local var2406 = nil
		local var2407, var2408, var2409 = protoModule.readTag(p87, var2405)
		local var2410 = var2407
		var2406 = var2408
		var2405 = var2409
		
		if var2406 == protoModule.wireTypes.varint then
			local _ = nil
			local var2411, var2412 = protoModule.readVarInt(p87, var2405)
			local _ = var2411
			var2405 = var2412
			continue
		end
		if var2406 == protoModule.wireTypes.lengthDelimited then
			if var2410 == 1 then
				local _ = nil
				local var2413, var2414 = protoModule.readBuffer(p87, var2405)
				var2405 = var2414
				var2404.key = buffer.tostring(var2413)
			elseif var2410 == 2 then
				local _ = nil
				local var2415, var2416 = protoModule.readBuffer(p87, var2405)
				var2405 = var2416
				var2404.value = t.FeedEntry.decode(var2415)
			else
				local _ = nil
				local var2417, var2418 = protoModule.readVarInt(p87, var2405)
				var2405 = var2418 + var2417
			end
		elseif var2406 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2419, var2420 = protoModule.readFixed32(p87, var2405)
			local _ = var2419
			var2405 = var2420
		elseif var2406 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2421, var2422 = protoModule.readFixed64(p87, var2405)
			local _ = var2421
			var2405 = var2422
		else
			error("Unsupported wire type: " .. var3547)
		end
	end
	return var2404
end

function t_87:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_87:jsonDecode()
	-- upvalues: t_87 (ref), t (ref)
	local var2423 = t_87.new()
	
	if self.key ~= nil then
		var2423.key = self.key
	end
	if self.value ~= nil then
		var2423.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2423
end

t_87.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_87
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p88)
	-- upvalues: t_88 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p88 == nil or p88.marketplace_catalog_category_items == nil then {} else p88.marketplace_catalog_category_items,
		active_category_id = if p88 == nil or p88.active_category_id == nil then "" else p88.active_category_id,
		active_tooltip_idx = if p88 == nil or p88.active_tooltip_idx == nil then 0 else p88.active_tooltip_idx
	}, t_88)
end

function t_88:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2423 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2424 = v:encode()
			local var2425, var2426 = protoModule.writeTag(buff, var2423, 1, protoModule.wireTypes.lengthDelimited)
			var2425, var3570 = protoModule.writeBuffer(var2425, var2426, var2424, buffer.len(var2424))
			buff = var2425
			var2423 = var2426
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2427, var2428 = protoModule.writeTag(buff, var2423, 2, protoModule.wireTypes.lengthDelimited)
		var2427, var3572 = protoModule.writeString(var2427, var2428, self.active_category_id)
		buff = var2427
		var2423 = var2428
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2429, var2430 = protoModule.writeTag(buff, var2423, 3, protoModule.wireTypes.varint)
		var2429, var3574 = protoModule.writeVarInt(var2429, var2430, self.active_tooltip_idx)
		buff = var2429
		var2423 = var2430
	end
	local buff_1 = buffer.create(var2423)
	buffer.copy(buff_1, 0, buff, 0, var2423)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2431 = t_88.new()
	local var2432 = 0
	while var2432 < buffer.len(p88) do
		local _ = nil
		local var2433 = nil
		local var2434, var2435, var2436 = protoModule.readTag(p88, var2432)
		local var2437 = var2434
		var2433 = var2435
		var2432 = var2436
		
		if var2433 == protoModule.wireTypes.varint then
			if var2437 == 3 then
				local _ = nil
				local var2438, var2439 = protoModule.readVarIntI64(p88, var2432)
				var2432 = var2439
				var2431.active_tooltip_idx = var2438
			else
				local _ = nil
				local var2440, var2441 = protoModule.readVarInt(p88, var2432)
				local _ = var2440
				var2432 = var2441
			end
		end
		if var2433 == protoModule.wireTypes.lengthDelimited then
			if var2437 == 1 then
				local _ = nil
				local var2442, var2443 = protoModule.readBuffer(p88, var2432)
				var2432 = var2443
				table.insert(var2431.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2442))
			elseif var2437 == 2 then
				local _ = nil
				local var2444, var2445 = protoModule.readBuffer(p88, var2432)
				var2432 = var2445
				var2431.active_category_id = buffer.tostring(var2444)
			else
				local _ = nil
				local var2446, var2447 = protoModule.readVarInt(p88, var2432)
				var2432 = var2447 + var2446
			end
		elseif var2433 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2448, var2449 = protoModule.readFixed32(p88, var2432)
			local _ = var2448
			var2432 = var2449
		elseif var2433 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2450, var2451 = protoModule.readFixed64(p88, var2432)
			local _ = var2450
			var2432 = var2451
		else
			error("Unsupported wire type: " .. var3578)
		end
	end
	return var2431
end

function t_88:jsonEncode()
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

function t_88:jsonDecode()
	-- upvalues: t_88 (ref), t (ref)
	local var2452 = t_88.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2452.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2452.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2452.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2452.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2452.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2452.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2452
end

t_88.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_88
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p89)
	-- upvalues: t_89 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p89 == nil or p89.marketplace_catalog_category_item_id == nil then "" else p89.marketplace_catalog_category_item_id
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2453 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2454, var2455 = protoModule.writeTag(buff, var2453, 1, protoModule.wireTypes.lengthDelimited)
		var2454, var3605 = protoModule.writeString(var2454, var2455, self.marketplace_catalog_category_item_id)
		buff = var2454
		var2453 = var2455
	end
	local buff_1 = buffer.create(var2453)
	buffer.copy(buff_1, 0, buff, 0, var2453)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref)
	local var2453 = t_89.new()
	local var2454 = 0
	while var2454 < buffer.len(p89) do
		local _ = nil
		local var2455 = nil
		local var2456, var2457, var2458 = protoModule.readTag(p89, var2454)
		local var2459 = var2456
		var2455 = var2457
		var2454 = var2458
		
		if var2455 == protoModule.wireTypes.varint then
			local _ = nil
			local var2460, var2461 = protoModule.readVarInt(p89, var2454)
			local _ = var2460
			var2454 = var2461
			continue
		end
		if var2455 == protoModule.wireTypes.lengthDelimited then
			if var2459 == 1 then
				local _ = nil
				local var2462, var2463 = protoModule.readBuffer(p89, var2454)
				var2454 = var2463
				var2453.marketplace_catalog_category_item_id = buffer.tostring(var2462)
			else
				local _ = nil
				local var2464, var2465 = protoModule.readVarInt(p89, var2454)
				var2454 = var2465 + var2464
			end
		elseif var2455 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2466, var2467 = protoModule.readFixed32(p89, var2454)
			local _ = var2466
			var2454 = var2467
		elseif var2455 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2468, var2469 = protoModule.readFixed64(p89, var2454)
			local _ = var2468
			var2454 = var2469
		else
			error("Unsupported wire type: " .. var3609)
		end
	end
	return var2453
end

function t_89:jsonEncode()
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_89:jsonDecode()
	-- upvalues: t_89 (ref)
	local var2470 = t_89.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2470.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2470.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2470
end

t_89.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_89
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p90)
	-- upvalues: t_90 (ref)
	return setmetatable({
		hero_icon = if p90 == nil or p90.hero_icon == nil then nil else p90.hero_icon,
		body_dismiss_button_text = if p90 == nil or p90.body_dismiss_button_text == nil then "" else p90.body_dismiss_button_text,
		body_title = if p90 == nil or p90.body_title == nil then "" else p90.body_title,
		body_rich_text = if p90 == nil or p90.body_rich_text == nil then "" else p90.body_rich_text,
		terms_link_text = if p90 == nil or p90.terms_link_text == nil then nil else p90.terms_link_text,
		terms_title = if p90 == nil or p90.terms_title == nil then nil else p90.terms_title,
		terms_body_rich_text = if p90 == nil or p90.terms_body_rich_text == nil then nil else p90.terms_body_rich_text,
		terms_dismiss_button_text = if p90 == nil or p90.terms_dismiss_button_text == nil then nil else p90.terms_dismiss_button_text,
		offer_id = if p90 == nil or p90.offer_id == nil then "" else p90.offer_id
	}, t_90)
end

function t_90:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2470 = 0
	
	if self.hero_icon ~= nil then
		local var2471, var2472 = protoModule.writeTag(buff, var2470, 1, protoModule.wireTypes.lengthDelimited)
		var2471, var3629 = protoModule.writeString(var2471, var2472, self.hero_icon)
		buff = var2471
		var2470 = var2472
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2473, var2474 = protoModule.writeTag(buff, var2470, 2, protoModule.wireTypes.lengthDelimited)
		var2473, var3631 = protoModule.writeString(var2473, var2474, self.body_dismiss_button_text)
		buff = var2473
		var2470 = var2474
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2475, var2476 = protoModule.writeTag(buff, var2470, 3, protoModule.wireTypes.lengthDelimited)
		var2475, var3633 = protoModule.writeString(var2475, var2476, self.body_title)
		buff = var2475
		var2470 = var2476
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2477, var2478 = protoModule.writeTag(buff, var2470, 4, protoModule.wireTypes.lengthDelimited)
		var2477, var3635 = protoModule.writeString(var2477, var2478, self.body_rich_text)
		buff = var2477
		var2470 = var2478
	end
	if self.terms_link_text ~= nil then
		local var2479, var2480 = protoModule.writeTag(buff, var2470, 5, protoModule.wireTypes.lengthDelimited)
		var2479, var3637 = protoModule.writeString(var2479, var2480, self.terms_link_text)
		buff = var2479
		var2470 = var2480
	end
	if self.terms_title ~= nil then
		local var2481, var2482 = protoModule.writeTag(buff, var2470, 6, protoModule.wireTypes.lengthDelimited)
		var2481, var3639 = protoModule.writeString(var2481, var2482, self.terms_title)
		buff = var2481
		var2470 = var2482
	end
	if self.terms_body_rich_text ~= nil then
		local var2483, var2484 = protoModule.writeTag(buff, var2470, 7, protoModule.wireTypes.lengthDelimited)
		var2483, var3641 = protoModule.writeString(var2483, var2484, self.terms_body_rich_text)
		buff = var2483
		var2470 = var2484
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2485, var2486 = protoModule.writeTag(buff, var2470, 8, protoModule.wireTypes.lengthDelimited)
		var2485, var3643 = protoModule.writeString(var2485, var2486, self.terms_dismiss_button_text)
		buff = var2485
		var2470 = var2486
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2487, var2488 = protoModule.writeTag(buff, var2470, 9, protoModule.wireTypes.lengthDelimited)
		var2487, var3645 = protoModule.writeString(var2487, var2488, self.offer_id)
		buff = var2487
		var2470 = var2488
	end
	local buff_1 = buffer.create(var2470)
	buffer.copy(buff_1, 0, buff, 0, var2470)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2470 = t_90.new()
	local var2471 = 0
	while var2471 < buffer.len(p90) do
		local _ = nil
		local var2472 = nil
		local var2473, var2474, var2475 = protoModule.readTag(p90, var2471)
		local var2476 = var2473
		var2472 = var2474
		var2471 = var2475
		
		if var2472 == protoModule.wireTypes.varint then
			local _ = nil
			local var2477, var2478 = protoModule.readVarInt(p90, var2471)
			local _ = var2477
			var2471 = var2478
			continue
		end
		if var2472 == protoModule.wireTypes.lengthDelimited then
			if var2476 == 1 then
				local _ = nil
				local var2479, var2480 = protoModule.readBuffer(p90, var2471)
				var2471 = var2480
				var2470.hero_icon = buffer.tostring(var2479)
			elseif var2476 == 2 then
				local _ = nil
				local var2481, var2482 = protoModule.readBuffer(p90, var2471)
				var2471 = var2482
				var2470.body_dismiss_button_text = buffer.tostring(var2481)
			elseif var2476 == 3 then
				local _ = nil
				local var2483, var2484 = protoModule.readBuffer(p90, var2471)
				var2471 = var2484
				var2470.body_title = buffer.tostring(var2483)
			elseif var2476 == 4 then
				local _ = nil
				local var2485, var2486 = protoModule.readBuffer(p90, var2471)
				var2471 = var2486
				var2470.body_rich_text = buffer.tostring(var2485)
			elseif var2476 == 5 then
				local _ = nil
				local var2487, var2488 = protoModule.readBuffer(p90, var2471)
				var2471 = var2488
				var2470.terms_link_text = buffer.tostring(var2487)
			elseif var2476 == 6 then
				local _ = nil
				local var2489, var2490 = protoModule.readBuffer(p90, var2471)
				var2471 = var2490
				var2470.terms_title = buffer.tostring(var2489)
			elseif var2476 == 7 then
				local _ = nil
				local var2491, var2492 = protoModule.readBuffer(p90, var2471)
				var2471 = var2492
				var2470.terms_body_rich_text = buffer.tostring(var2491)
			elseif var2476 == 8 then
				local _ = nil
				local var2493, var2494 = protoModule.readBuffer(p90, var2471)
				var2471 = var2494
				var2470.terms_dismiss_button_text = buffer.tostring(var2493)
			elseif var2476 == 9 then
				local _ = nil
				local var2495, var2496 = protoModule.readBuffer(p90, var2471)
				var2471 = var2496
				var2470.offer_id = buffer.tostring(var2495)
			else
				local _ = nil
				local var2497, var2498 = protoModule.readVarInt(p90, var2471)
				var2471 = var2498 + var2497
			end
		elseif var2472 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2499, var2500 = protoModule.readFixed32(p90, var2471)
			local _ = var2499
			var2471 = var2500
		elseif var2472 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2501, var2502 = protoModule.readFixed64(p90, var2471)
			local _ = var2501
			var2471 = var2502
		else
			error("Unsupported wire type: " .. var3649)
		end
	end
	return var2470
end

function t_90:jsonEncode()
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

function t_90:jsonDecode()
	-- upvalues: t_90 (ref)
	local var2503 = t_90.new()
	
	if self.hero_icon ~= nil then
		var2503.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2503.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2503.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2503.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2503.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2503.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2503.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2503.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2503.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2503.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2503.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2503.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2503.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2503.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2503.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2503.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2503.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2503.offer_id = self.offerId
	end
	return var2503
end

t_90.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_90
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p91)
	-- upvalues: t_91 (ref)
	return setmetatable({
		items = if p91 == nil or p91.items == nil then {} else p91.items,
		preview_columns = if p91 == nil or p91.preview_columns == nil then 0 else p91.preview_columns,
		impression_id = if p91 == nil or p91.impression_id == nil then "" else p91.impression_id
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2503 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2504 = v:encode()
			local var2505, var2506 = protoModule.writeTag(buff, var2503, 1, protoModule.wireTypes.lengthDelimited)
			var2505, var3686 = protoModule.writeBuffer(var2505, var2506, var2504, buffer.len(var2504))
			buff = var2505
			var2503 = var2506
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2507, var2508 = protoModule.writeTag(buff, var2503, 2, protoModule.wireTypes.varint)
		var2507, var3688 = protoModule.writeVarInt(var2507, var2508, self.preview_columns)
		buff = var2507
		var2503 = var2508
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2509, var2510 = protoModule.writeTag(buff, var2503, 3, protoModule.wireTypes.lengthDelimited)
		var2509, var3690 = protoModule.writeString(var2509, var2510, self.impression_id)
		buff = var2509
		var2503 = var2510
	end
	local buff_1 = buffer.create(var2503)
	buffer.copy(buff_1, 0, buff, 0, var2503)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var2511 = t_91.new()
	local var2512 = 0
	while var2512 < buffer.len(p91) do
		local _ = nil
		local var2513 = nil
		local var2514, var2515, var2516 = protoModule.readTag(p91, var2512)
		local var2517 = var2514
		var2513 = var2515
		var2512 = var2516
		
		if var2513 == protoModule.wireTypes.varint then
			if var2517 == 2 then
				local _ = nil
				local var2518, var2519 = protoModule.readVarIntI32(p91, var2512)
				var2512 = var2519
				var2511.preview_columns = var2518
			else
				local _ = nil
				local var2520, var2521 = protoModule.readVarInt(p91, var2512)
				local _ = var2520
				var2512 = var2521
			end
		end
		if var2513 == protoModule.wireTypes.lengthDelimited then
			if var2517 == 1 then
				local _ = nil
				local var2522, var2523 = protoModule.readBuffer(p91, var2512)
				var2512 = var2523
				table.insert(var2511.items, t.CatalogItemGridInputData_CatalogItem.decode(var2522))
			elseif var2517 == 3 then
				local _ = nil
				local var2524, var2525 = protoModule.readBuffer(p91, var2512)
				var2512 = var2525
				var2511.impression_id = buffer.tostring(var2524)
			else
				local _ = nil
				local var2526, var2527 = protoModule.readVarInt(p91, var2512)
				var2512 = var2527 + var2526
			end
		elseif var2513 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2528, var2529 = protoModule.readFixed32(p91, var2512)
			local _ = var2528
			var2512 = var2529
		elseif var2513 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2530, var2531 = protoModule.readFixed64(p91, var2512)
			local _ = var2530
			var2512 = var2531
		else
			error("Unsupported wire type: " .. var3694)
		end
	end
	return var2511
end

function t_91:jsonEncode()
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

function t_91:jsonDecode()
	-- upvalues: t_91 (ref), t (ref)
	local var2532 = t_91.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2532.items = t_1
	end
	if self.preview_columns ~= nil then
		var2532.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2532.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2532.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2532.impression_id = self.impressionId
	end
	return var2532
end

t_91.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_91
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p92)
	-- upvalues: t_92 (ref)
	return setmetatable({
		id = if p92 == nil or p92.id == nil then "" else p92.id,
		type = if p92 == nil or p92.type == nil then "" else p92.type
	}, t_92)
end

function t_92:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2533 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2534, var2535 = protoModule.writeTag(buff, var2533, 1, protoModule.wireTypes.lengthDelimited)
		var2534, var3720 = protoModule.writeString(var2534, var2535, self.id)
		buff = var2534
		var2533 = var2535
	end
	if self.type ~= nil and self.type ~= "" then
		local var2536, var2537 = protoModule.writeTag(buff, var2533, 2, protoModule.wireTypes.lengthDelimited)
		var2536, var3722 = protoModule.writeString(var2536, var2537, self.type)
		buff = var2536
		var2533 = var2537
	end
	local buff_1 = buffer.create(var2533)
	buffer.copy(buff_1, 0, buff, 0, var2533)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref)
	local var2533 = t_92.new()
	local var2534 = 0
	while var2534 < buffer.len(p92) do
		local _ = nil
		local var2535 = nil
		local var2536, var2537, var2538 = protoModule.readTag(p92, var2534)
		local var2539 = var2536
		var2535 = var2537
		var2534 = var2538
		
		if var2535 == protoModule.wireTypes.varint then
			local _ = nil
			local var2540, var2541 = protoModule.readVarInt(p92, var2534)
			local _ = var2540
			var2534 = var2541
			continue
		end
		if var2535 == protoModule.wireTypes.lengthDelimited then
			if var2539 == 1 then
				local _ = nil
				local var2542, var2543 = protoModule.readBuffer(p92, var2534)
				var2534 = var2543
				var2533.id = buffer.tostring(var2542)
			elseif var2539 == 2 then
				local _ = nil
				local var2544, var2545 = protoModule.readBuffer(p92, var2534)
				var2534 = var2545
				var2533.type = buffer.tostring(var2544)
			else
				local _ = nil
				local var2546, var2547 = protoModule.readVarInt(p92, var2534)
				var2534 = var2547 + var2546
			end
		elseif var2535 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2548, var2549 = protoModule.readFixed32(p92, var2534)
			local _ = var2548
			var2534 = var2549
		elseif var2535 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2550, var2551 = protoModule.readFixed64(p92, var2534)
			local _ = var2550
			var2534 = var2551
		else
			error("Unsupported wire type: " .. var3726)
		end
	end
	return var2533
end

function t_92:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_92:jsonDecode()
	-- upvalues: t_92 (ref)
	local var2552 = t_92.new()
	
	if self.id ~= nil then
		var2552.id = self.id
	end
	if self.type ~= nil then
		var2552.type = self.type
	end
	return var2552
end

t_92.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_92
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p93)
	-- upvalues: t_93 (ref)
	return setmetatable({
		entry_map = if p93 == nil or p93.entry_map == nil then {} else p93.entry_map,
		entry_order = if p93 == nil or p93.entry_order == nil then {} else p93.entry_order,
		content_pools = if p93 == nil or p93.content_pools == nil then {} else p93.content_pools,
		search_session_id = if p93 == nil or p93.search_session_id == nil then "" else p93.search_session_id
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2552 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2553, var2554 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2553, var3748 = protoModule.writeString(var2553, var2554, i)
			local var2555 = v:encode()
			var2554, var3750 = protoModule.writeTag(var2553, var2554, 2, protoModule.wireTypes.lengthDelimited)
			var2554, var3750 = protoModule.writeBuffer(var2554, var3750, var2555, buffer.len(var2555))
			local var2556 = var2554
			local var2557 = var3750
			local var2558, var2559 = protoModule.writeTag(buff, var2552, 1, protoModule.wireTypes.lengthDelimited)
			var2558, var3754 = protoModule.writeBuffer(var2558, var2559, var2556, var2557)
			buff = var2558
			var2552 = var2559
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2560, var2561 = protoModule.writeTag(buff, var2552, 2, protoModule.wireTypes.lengthDelimited)
			var2560, var3756 = protoModule.writeString(var2560, var2561, v)
			buff = var2560
			var2552 = var2561
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2562, var2563 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2562, var3758 = protoModule.writeString(var2562, var2563, i)
			local var2564 = v:encode()
			var2563, var3760 = protoModule.writeTag(var2562, var2563, 2, protoModule.wireTypes.lengthDelimited)
			var2563, var3760 = protoModule.writeBuffer(var2563, var3760, var2564, buffer.len(var2564))
			local var2565 = var2563
			local var2566 = var3760
			local var2567, var2568 = protoModule.writeTag(buff, var2552, 3, protoModule.wireTypes.lengthDelimited)
			var2567, var3764 = protoModule.writeBuffer(var2567, var2568, var2565, var2566)
			buff = var2567
			var2552 = var2568
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2569, var2570 = protoModule.writeTag(buff, var2552, 4, protoModule.wireTypes.lengthDelimited)
		var2569, var3766 = protoModule.writeString(var2569, var2570, self.search_session_id)
		buff = var2569
		var2552 = var2570
	end
	local buff_1 = buffer.create(var2552)
	buffer.copy(buff_1, 0, buff, 0, var2552)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2571 = t_93.new()
	local var2572 = 0
	while var2572 < buffer.len(p93) do
		local _ = nil
		local var2573 = nil
		local var2574, var2575, var2576 = protoModule.readTag(p93, var2572)
		local var2577 = var2574
		var2573 = var2575
		var2572 = var2576
		
		if var2573 == protoModule.wireTypes.varint then
			local _ = nil
			local var2578, var2579 = protoModule.readVarInt(p93, var2572)
			local _ = var2578
			var2572 = var2579
			continue
		end
		if var2573 == protoModule.wireTypes.lengthDelimited then
			if var2577 == 1 then
				local _ = nil
				local var2580, var2581 = protoModule.readBuffer(p93, var2572)
				var2572 = var2581
				var2580 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2580)
				var2571.entry_map[var2580.key or ""] = var2580.value or t.FeedEntry.new()
			elseif var2577 == 2 then
				local _ = nil
				local var2582, var2583 = protoModule.readBuffer(p93, var2572)
				var2572 = var2583
				table.insert(var2571.entry_order, buffer.tostring(var2582))
			elseif var2577 == 3 then
				local _ = nil
				local var2584, var2585 = protoModule.readBuffer(p93, var2572)
				var2572 = var2585
				var2584 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2584)
				var2571.content_pools[var2584.key or ""] = var2584.value or t.ContentPool.new()
			elseif var2577 == 4 then
				local _ = nil
				local var2586, var2587 = protoModule.readBuffer(p93, var2572)
				var2572 = var2587
				var2571.search_session_id = buffer.tostring(var2586)
			else
				local _ = nil
				local var2588, var2589 = protoModule.readVarInt(p93, var2572)
				var2572 = var2589 + var2588
			end
		elseif var2573 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2590, var2591 = protoModule.readFixed32(p93, var2572)
			local _ = var2590
			var2572 = var2591
		elseif var2573 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2592, var2593 = protoModule.readFixed64(p93, var2572)
			local _ = var2592
			var2572 = var2593
		else
			error("Unsupported wire type: " .. var3770)
		end
	end
	return var2571
end

function t_93:jsonEncode()
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

function t_93:jsonDecode()
	-- upvalues: t_93 (ref), t (ref)
	local var2594 = t_93.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2594.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2594.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2594.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2594.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2594.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2594.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2594.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2594.search_session_id = self.searchSessionId
	end
	return var2594
end

t_93.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_93
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p94)
	-- upvalues: t_94 (ref)
	return setmetatable({
		key = if p94 == nil or p94.key == nil then "" else p94.key,
		value = if p94 == nil or p94.value == nil then nil else p94.value
	}, t_94)
end

function t_94:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2595 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2596, var2597 = protoModule.writeTag(buff, var2595, 1, protoModule.wireTypes.lengthDelimited)
		var2596, var3805 = protoModule.writeString(var2596, var2597, self.key)
		buff = var2596
		var2595 = var2597
	end
	if self.value ~= nil then
		local var2598 = self.value:encode()
		local var2599, var2600 = protoModule.writeTag(buff, var2595, 2, protoModule.wireTypes.lengthDelimited)
		var2599, var3808 = protoModule.writeBuffer(var2599, var2600, var2598, buffer.len(var2598))
		buff = var2599
		var2595 = var2600
	end
	local buff_1 = buffer.create(var2595)
	buffer.copy(buff_1, 0, buff, 0, var2595)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var2595 = t_94.new()
	local var2596 = 0
	while var2596 < buffer.len(p94) do
		local _ = nil
		local var2597 = nil
		local var2598, var2599, var2600 = protoModule.readTag(p94, var2596)
		local var2601 = var2598
		var2597 = var2599
		var2596 = var2600
		
		if var2597 == protoModule.wireTypes.varint then
			local _ = nil
			local var2602, var2603 = protoModule.readVarInt(p94, var2596)
			local _ = var2602
			var2596 = var2603
			continue
		end
		if var2597 == protoModule.wireTypes.lengthDelimited then
			if var2601 == 1 then
				local _ = nil
				local var2604, var2605 = protoModule.readBuffer(p94, var2596)
				var2596 = var2605
				var2595.key = buffer.tostring(var2604)
			elseif var2601 == 2 then
				local _ = nil
				local var2606, var2607 = protoModule.readBuffer(p94, var2596)
				var2596 = var2607
				var2595.value = t.FeedEntry.decode(var2606)
			else
				local _ = nil
				local var2608, var2609 = protoModule.readVarInt(p94, var2596)
				var2596 = var2609 + var2608
			end
		elseif var2597 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2610, var2611 = protoModule.readFixed32(p94, var2596)
			local _ = var2610
			var2596 = var2611
		elseif var2597 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2612, var2613 = protoModule.readFixed64(p94, var2596)
			local _ = var2612
			var2596 = var2613
		else
			error("Unsupported wire type: " .. var3812)
		end
	end
	return var2595
end

function t_94:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_94:jsonDecode()
	-- upvalues: t_94 (ref), t (ref)
	local var2614 = t_94.new()
	
	if self.key ~= nil then
		var2614.key = self.key
	end
	if self.value ~= nil then
		var2614.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2614
end

t_94.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_94
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p95)
	-- upvalues: t_95 (ref)
	return setmetatable({
		key = if p95 == nil or p95.key == nil then "" else p95.key,
		value = if p95 == nil or p95.value == nil then nil else p95.value
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2614 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2615, var2616 = protoModule.writeTag(buff, var2614, 1, protoModule.wireTypes.lengthDelimited)
		var2615, var3834 = protoModule.writeString(var2615, var2616, self.key)
		buff = var2615
		var2614 = var2616
	end
	if self.value ~= nil then
		local var2617 = self.value:encode()
		local var2618, var2619 = protoModule.writeTag(buff, var2614, 2, protoModule.wireTypes.lengthDelimited)
		var2618, var3837 = protoModule.writeBuffer(var2618, var2619, var2617, buffer.len(var2617))
		buff = var2618
		var2614 = var2619
	end
	local buff_1 = buffer.create(var2614)
	buffer.copy(buff_1, 0, buff, 0, var2614)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2614 = t_95.new()
	local var2615 = 0
	while var2615 < buffer.len(p95) do
		local _ = nil
		local var2616 = nil
		local var2617, var2618, var2619 = protoModule.readTag(p95, var2615)
		local var2620 = var2617
		var2616 = var2618
		var2615 = var2619
		
		if var2616 == protoModule.wireTypes.varint then
			local _ = nil
			local var2621, var2622 = protoModule.readVarInt(p95, var2615)
			local _ = var2621
			var2615 = var2622
			continue
		end
		if var2616 == protoModule.wireTypes.lengthDelimited then
			if var2620 == 1 then
				local _ = nil
				local var2623, var2624 = protoModule.readBuffer(p95, var2615)
				var2615 = var2624
				var2614.key = buffer.tostring(var2623)
			elseif var2620 == 2 then
				local _ = nil
				local var2625, var2626 = protoModule.readBuffer(p95, var2615)
				var2615 = var2626
				var2614.value = t.ContentPool.decode(var2625)
			else
				local _ = nil
				local var2627, var2628 = protoModule.readVarInt(p95, var2615)
				var2615 = var2628 + var2627
			end
		elseif var2616 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2629, var2630 = protoModule.readFixed32(p95, var2615)
			local _ = var2629
			var2615 = var2630
		elseif var2616 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2631, var2632 = protoModule.readFixed64(p95, var2615)
			local _ = var2631
			var2615 = var2632
		else
			error("Unsupported wire type: " .. var3841)
		end
	end
	return var2614
end

function t_95:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_95:jsonDecode()
	-- upvalues: t_95 (ref), t (ref)
	local var2633 = t_95.new()
	
	if self.key ~= nil then
		var2633.key = self.key
	end
	if self.value ~= nil then
		var2633.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2633
end

t_95.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_95
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p96)
	-- upvalues: t_96 (ref)
	return setmetatable({
		universe_id = if p96 == nil or p96.universe_id == nil then "" else p96.universe_id,
		is_content_locked = if p96 == nil or p96.is_content_locked == nil then false else p96.is_content_locked
	}, t_96)
end

function t_96:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2633 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2634, var2635 = protoModule.writeTag(buff, var2633, 1, protoModule.wireTypes.lengthDelimited)
		var2634, var3863 = protoModule.writeString(var2634, var2635, self.universe_id)
		buff = var2634
		var2633 = var2635
	end
	if self.is_content_locked then
		local var2636, var2637 = protoModule.writeTag(buff, var2633, 2, protoModule.wireTypes.varint)
		var2636, var3865 = protoModule.writeVarInt(var2636, var2637, if self.is_content_locked then 1 else 0)
		buff = var2636
		var2633 = var2637
	end
	local buff_1 = buffer.create(var2633)
	buffer.copy(buff_1, 0, buff, 0, var2633)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref)
	local var2633 = t_96.new()
	local var2634 = 0
	while var2634 < buffer.len(p96) do
		local _ = nil
		local var2635 = nil
		local var2636, var2637, var2638 = protoModule.readTag(p96, var2634)
		local var2639 = var2636
		var2635 = var2637
		var2634 = var2638
		
		if var2635 == protoModule.wireTypes.varint then
			if var2639 == 2 then
				local _ = nil
				local var2640, var2641 = protoModule.readVarInt(p96, var2634)
				var2634 = var2641
				var2633.is_content_locked = var2640 ~= 0
			else
				local _ = nil
				local var2642, var2643 = protoModule.readVarInt(p96, var2634)
				local _ = var2642
				var2634 = var2643
			end
		end
		if var2635 == protoModule.wireTypes.lengthDelimited then
			if var2639 == 1 then
				local _ = nil
				local var2644, var2645 = protoModule.readBuffer(p96, var2634)
				var2634 = var2645
				var2633.universe_id = buffer.tostring(var2644)
			else
				local _ = nil
				local var2646, var2647 = protoModule.readVarInt(p96, var2634)
				var2634 = var2647 + var2646
			end
		elseif var2635 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2648, var2649 = protoModule.readFixed32(p96, var2634)
			local _ = var2648
			var2634 = var2649
		elseif var2635 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2650, var2651 = protoModule.readFixed64(p96, var2634)
			local _ = var2650
			var2634 = var2651
		else
			error("Unsupported wire type: " .. var3869)
		end
	end
	return var2633
end

function t_96:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_96:jsonDecode()
	-- upvalues: t_96 (ref)
	local var2652 = t_96.new()
	
	if self.universe_id ~= nil then
		var2652.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2652.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2652.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2652.is_content_locked = self.isContentLocked
	end
	return var2652
end

t_96.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_96
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p97)
	-- upvalues: t_97 (ref)
	return setmetatable({
		overview_rich_text = if p97 == nil or p97.overview_rich_text == nil then "" else p97.overview_rich_text,
		result_entry = if p97 == nil or p97.result_entry == nil then nil else p97.result_entry,
		follow_up_queries = if p97 == nil or p97.follow_up_queries == nil then {} else p97.follow_up_queries,
		show_loading = if p97 == nil or p97.show_loading == nil then false else p97.show_loading,
		title = if p97 == nil or p97.title == nil then "" else p97.title,
		search_query = if p97 == nil or p97.search_query == nil then "" else p97.search_query,
		universe_ids = if p97 == nil or p97.universe_ids == nil then "" else p97.universe_ids
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2652 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2653, var2654 = protoModule.writeTag(buff, var2652, 1, protoModule.wireTypes.lengthDelimited)
		var2653, var3891 = protoModule.writeString(var2653, var2654, self.overview_rich_text)
		buff = var2653
		var2652 = var2654
	end
	if self.result_entry ~= nil then
		local var2655 = self.result_entry:encode()
		local var2656, var2657 = protoModule.writeTag(buff, var2652, 2, protoModule.wireTypes.lengthDelimited)
		var2656, var3894 = protoModule.writeBuffer(var2656, var2657, var2655, buffer.len(var2655))
		buff = var2656
		var2652 = var2657
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2658, var2659 = protoModule.writeTag(buff, var2652, 3, protoModule.wireTypes.lengthDelimited)
			var2658, var3896 = protoModule.writeString(var2658, var2659, v)
			buff = var2658
			var2652 = var2659
		end
	end
	if self.show_loading then
		local var2660, var2661 = protoModule.writeTag(buff, var2652, 4, protoModule.wireTypes.varint)
		var2660, var3898 = protoModule.writeVarInt(var2660, var2661, if self.show_loading then 1 else 0)
		buff = var2660
		var2652 = var2661
	end
	if self.title ~= nil and self.title ~= "" then
		local var2662, var2663 = protoModule.writeTag(buff, var2652, 5, protoModule.wireTypes.lengthDelimited)
		var2662, var3900 = protoModule.writeString(var2662, var2663, self.title)
		buff = var2662
		var2652 = var2663
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2664, var2665 = protoModule.writeTag(buff, var2652, 6, protoModule.wireTypes.lengthDelimited)
		var2664, var3902 = protoModule.writeString(var2664, var2665, self.search_query)
		buff = var2664
		var2652 = var2665
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2666, var2667 = protoModule.writeTag(buff, var2652, 8, protoModule.wireTypes.lengthDelimited)
		var2666, var3904 = protoModule.writeString(var2666, var2667, self.universe_ids)
		buff = var2666
		var2652 = var2667
	end
	local buff_1 = buffer.create(var2652)
	buffer.copy(buff_1, 0, buff, 0, var2652)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var2668 = t_97.new()
	local var2669 = 0
	while var2669 < buffer.len(p97) do
		local _ = nil
		local var2670 = nil
		local var2671, var2672, var2673 = protoModule.readTag(p97, var2669)
		local var2674 = var2671
		var2670 = var2672
		var2669 = var2673
		
		if var2670 == protoModule.wireTypes.varint then
			if var2674 == 4 then
				local _ = nil
				local var2675, var2676 = protoModule.readVarInt(p97, var2669)
				var2669 = var2676
				var2668.show_loading = var2675 ~= 0
			else
				local _ = nil
				local var2677, var2678 = protoModule.readVarInt(p97, var2669)
				local _ = var2677
				var2669 = var2678
			end
		end
		if var2670 == protoModule.wireTypes.lengthDelimited then
			if var2674 == 1 then
				local _ = nil
				local var2679, var2680 = protoModule.readBuffer(p97, var2669)
				var2669 = var2680
				var2668.overview_rich_text = buffer.tostring(var2679)
			elseif var2674 == 2 then
				local _ = nil
				local var2681, var2682 = protoModule.readBuffer(p97, var2669)
				var2669 = var2682
				var2668.result_entry = t.FeedEntry.decode(var2681)
			elseif var2674 == 3 then
				local _ = nil
				local var2683, var2684 = protoModule.readBuffer(p97, var2669)
				var2669 = var2684
				table.insert(var2668.follow_up_queries, buffer.tostring(var2683))
			elseif var2674 == 5 then
				local _ = nil
				local var2685, var2686 = protoModule.readBuffer(p97, var2669)
				var2669 = var2686
				var2668.title = buffer.tostring(var2685)
			elseif var2674 == 6 then
				local _ = nil
				local var2687, var2688 = protoModule.readBuffer(p97, var2669)
				var2669 = var2688
				var2668.search_query = buffer.tostring(var2687)
			elseif var2674 == 8 then
				local _ = nil
				local var2689, var2690 = protoModule.readBuffer(p97, var2669)
				var2669 = var2690
				var2668.universe_ids = buffer.tostring(var2689)
			else
				local _ = nil
				local var2691, var2692 = protoModule.readVarInt(p97, var2669)
				var2669 = var2692 + var2691
			end
		elseif var2670 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2693, var2694 = protoModule.readFixed32(p97, var2669)
			local _ = var2693
			var2669 = var2694
		elseif var2670 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2695, var2696 = protoModule.readFixed64(p97, var2669)
			local _ = var2695
			var2669 = var2696
		else
			error("Unsupported wire type: " .. var3908)
		end
	end
	return var2668
end

function t_97:jsonEncode()
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

function t_97:jsonDecode()
	-- upvalues: t_97 (ref), t (ref)
	local var2697 = t_97.new()
	
	if self.overview_rich_text ~= nil then
		var2697.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2697.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2697.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2697.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2697.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2697.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2697.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2697.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2697.title = self.title
	end
	if self.search_query ~= nil then
		var2697.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2697.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2697.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2697.universe_ids = self.universeIds
	end
	return var2697
end

t_97.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_97
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p98)
	-- upvalues: t_98 (ref)
	return setmetatable({
		title = if p98 == nil or p98.title == nil then "" else p98.title,
		user_items = if p98 == nil or p98.user_items == nil then {} else p98.user_items,
		max_visible_rows = if p98 == nil or p98.max_visible_rows == nil then 0 else p98.max_visible_rows,
		sort_id = if p98 == nil or p98.sort_id == nil then nil else p98.sort_id
	}, t_98)
end

function t_98:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2698 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2699, var2700 = protoModule.writeTag(buff, var2698, 1, protoModule.wireTypes.lengthDelimited)
		var2699, var3943 = protoModule.writeString(var2699, var2700, self.title)
		buff = var2699
		var2698 = var2700
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2701 = v:encode()
			local var2702, var2703 = protoModule.writeTag(buff, var2698, 2, protoModule.wireTypes.lengthDelimited)
			var2702, var3946 = protoModule.writeBuffer(var2702, var2703, var2701, buffer.len(var2701))
			buff = var2702
			var2698 = var2703
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2704, var2705 = protoModule.writeTag(buff, var2698, 3, protoModule.wireTypes.varint)
		var2704, var3948 = protoModule.writeVarInt(var2704, var2705, self.max_visible_rows)
		buff = var2704
		var2698 = var2705
	end
	if self.sort_id ~= nil then
		local var2706, var2707 = protoModule.writeTag(buff, var2698, 4, protoModule.wireTypes.lengthDelimited)
		var2706, var3950 = protoModule.writeString(var2706, var2707, self.sort_id)
		buff = var2706
		var2698 = var2707
	end
	local buff_1 = buffer.create(var2698)
	buffer.copy(buff_1, 0, buff, 0, var2698)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2708 = t_98.new()
	local var2709 = 0
	while var2709 < buffer.len(p98) do
		local _ = nil
		local var2710 = nil
		local var2711, var2712, var2713 = protoModule.readTag(p98, var2709)
		local var2714 = var2711
		var2710 = var2712
		var2709 = var2713
		
		if var2710 == protoModule.wireTypes.varint then
			if var2714 == 3 then
				local _ = nil
				local var2715, var2716 = protoModule.readVarIntI32(p98, var2709)
				var2709 = var2716
				var2708.max_visible_rows = var2715
			else
				local _ = nil
				local var2717, var2718 = protoModule.readVarInt(p98, var2709)
				local _ = var2717
				var2709 = var2718
			end
		end
		if var2710 == protoModule.wireTypes.lengthDelimited then
			if var2714 == 1 then
				local _ = nil
				local var2719, var2720 = protoModule.readBuffer(p98, var2709)
				var2709 = var2720
				var2708.title = buffer.tostring(var2719)
			elseif var2714 == 2 then
				local _ = nil
				local var2721, var2722 = protoModule.readBuffer(p98, var2709)
				var2709 = var2722
				table.insert(var2708.user_items, t.UserListInputData_UserItem.decode(var2721))
			elseif var2714 == 4 then
				local _ = nil
				local var2723, var2724 = protoModule.readBuffer(p98, var2709)
				var2709 = var2724
				var2708.sort_id = buffer.tostring(var2723)
			else
				local _ = nil
				local var2725, var2726 = protoModule.readVarInt(p98, var2709)
				var2709 = var2726 + var2725
			end
		elseif var2710 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2727, var2728 = protoModule.readFixed32(p98, var2709)
			local _ = var2727
			var2709 = var2728
		elseif var2710 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2729, var2730 = protoModule.readFixed64(p98, var2709)
			local _ = var2729
			var2709 = var2730
		else
			error("Unsupported wire type: " .. var3954)
		end
	end
	return var2708
end

function t_98:jsonEncode()
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

function t_98:jsonDecode()
	-- upvalues: t_98 (ref), t (ref)
	local var2731 = t_98.new()
	
	if self.title ~= nil then
		var2731.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2731.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2731.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2731.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2731.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2731.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2731.sort_id = self.sortId
	end
	return var2731
end

t_98.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_98
typeRegistryModule.default:register(t.UserListInputData)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p99)
	-- upvalues: t_99 (ref)
	return setmetatable({
		user_id = if p99 == nil or p99.user_id == nil then "" else p99.user_id
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2732 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2733, var2734 = protoModule.writeTag(buff, var2732, 1, protoModule.wireTypes.lengthDelimited)
		var2733, var3983 = protoModule.writeString(var2733, var2734, self.user_id)
		buff = var2733
		var2732 = var2734
	end
	local buff_1 = buffer.create(var2732)
	buffer.copy(buff_1, 0, buff, 0, var2732)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2732 = t_99.new()
	local var2733 = 0
	while var2733 < buffer.len(p99) do
		local _ = nil
		local var2734 = nil
		local var2735, var2736, var2737 = protoModule.readTag(p99, var2733)
		local var2738 = var2735
		var2734 = var2736
		var2733 = var2737
		
		if var2734 == protoModule.wireTypes.varint then
			local _ = nil
			local var2739, var2740 = protoModule.readVarInt(p99, var2733)
			local _ = var2739
			var2733 = var2740
			continue
		end
		if var2734 == protoModule.wireTypes.lengthDelimited then
			if var2738 == 1 then
				local _ = nil
				local var2741, var2742 = protoModule.readBuffer(p99, var2733)
				var2733 = var2742
				var2732.user_id = buffer.tostring(var2741)
			else
				local _ = nil
				local var2743, var2744 = protoModule.readVarInt(p99, var2733)
				var2733 = var2744 + var2743
			end
		elseif var2734 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2745, var2746 = protoModule.readFixed32(p99, var2733)
			local _ = var2745
			var2733 = var2746
		elseif var2734 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2747, var2748 = protoModule.readFixed64(p99, var2733)
			local _ = var2747
			var2733 = var2748
		else
			error("Unsupported wire type: " .. var3987)
		end
	end
	return var2732
end

function t_99:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_99:jsonDecode()
	-- upvalues: t_99 (ref)
	local var2749 = t_99.new()
	
	if self.user_id ~= nil then
		var2749.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2749.user_id = self.userId
	end
	return var2749
end

t_99.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_99
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p100)
	-- upvalues: t_100 (ref)
	return setmetatable({
		title = if p100 == nil or p100.title == nil then "" else p100.title,
		items = if p100 == nil or p100.items == nil then {} else p100.items,
		max_visible_rows = if p100 == nil or p100.max_visible_rows == nil then 0 else p100.max_visible_rows,
		sort_id = if p100 == nil or p100.sort_id == nil then nil else p100.sort_id
	}, t_100)
end

function t_100:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2749 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2750, var2751 = protoModule.writeTag(buff, var2749, 1, protoModule.wireTypes.lengthDelimited)
		var2750, var4007 = protoModule.writeString(var2750, var2751, self.title)
		buff = var2750
		var2749 = var2751
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2752 = v:encode()
			local var2753, var2754 = protoModule.writeTag(buff, var2749, 2, protoModule.wireTypes.lengthDelimited)
			var2753, var4010 = protoModule.writeBuffer(var2753, var2754, var2752, buffer.len(var2752))
			buff = var2753
			var2749 = var2754
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2755, var2756 = protoModule.writeTag(buff, var2749, 3, protoModule.wireTypes.varint)
		var2755, var4012 = protoModule.writeVarInt(var2755, var2756, self.max_visible_rows)
		buff = var2755
		var2749 = var2756
	end
	if self.sort_id ~= nil then
		local var2757, var2758 = protoModule.writeTag(buff, var2749, 4, protoModule.wireTypes.lengthDelimited)
		var2757, var4014 = protoModule.writeString(var2757, var2758, self.sort_id)
		buff = var2757
		var2749 = var2758
	end
	local buff_1 = buffer.create(var2749)
	buffer.copy(buff_1, 0, buff, 0, var2749)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2759 = t_100.new()
	local var2760 = 0
	while var2760 < buffer.len(p100) do
		local _ = nil
		local var2761 = nil
		local var2762, var2763, var2764 = protoModule.readTag(p100, var2760)
		local var2765 = var2762
		var2761 = var2763
		var2760 = var2764
		
		if var2761 == protoModule.wireTypes.varint then
			if var2765 == 3 then
				local _ = nil
				local var2766, var2767 = protoModule.readVarIntI32(p100, var2760)
				var2760 = var2767
				var2759.max_visible_rows = var2766
			else
				local _ = nil
				local var2768, var2769 = protoModule.readVarInt(p100, var2760)
				local _ = var2768
				var2760 = var2769
			end
		end
		if var2761 == protoModule.wireTypes.lengthDelimited then
			if var2765 == 1 then
				local _ = nil
				local var2770, var2771 = protoModule.readBuffer(p100, var2760)
				var2760 = var2771
				var2759.title = buffer.tostring(var2770)
			elseif var2765 == 2 then
				local _ = nil
				local var2772, var2773 = protoModule.readBuffer(p100, var2760)
				var2760 = var2773
				table.insert(var2759.items, t.CatalogItemListInputData_CatalogItem.decode(var2772))
			elseif var2765 == 4 then
				local _ = nil
				local var2774, var2775 = protoModule.readBuffer(p100, var2760)
				var2760 = var2775
				var2759.sort_id = buffer.tostring(var2774)
			else
				local _ = nil
				local var2776, var2777 = protoModule.readVarInt(p100, var2760)
				var2760 = var2777 + var2776
			end
		elseif var2761 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2778, var2779 = protoModule.readFixed32(p100, var2760)
			local _ = var2778
			var2760 = var2779
		elseif var2761 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2780, var2781 = protoModule.readFixed64(p100, var2760)
			local _ = var2780
			var2760 = var2781
		else
			error("Unsupported wire type: " .. var4018)
		end
	end
	return var2759
end

function t_100:jsonEncode()
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

function t_100:jsonDecode()
	-- upvalues: t_100 (ref), t (ref)
	local var2782 = t_100.new()
	
	if self.title ~= nil then
		var2782.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2782.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2782.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2782.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2782.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2782.sort_id = self.sortId
	end
	return var2782
end

t_100.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_100
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p101)
	-- upvalues: t_101 (ref)
	return setmetatable({
		item_id = if p101 == nil or p101.item_id == nil then "" else p101.item_id,
		item_type = if p101 == nil or p101.item_type == nil then "" else p101.item_type
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2783 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2784, var2785 = protoModule.writeTag(buff, var2783, 1, protoModule.wireTypes.lengthDelimited)
		var2784, var4046 = protoModule.writeString(var2784, var2785, self.item_id)
		buff = var2784
		var2783 = var2785
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2786, var2787 = protoModule.writeTag(buff, var2783, 2, protoModule.wireTypes.lengthDelimited)
		var2786, var4048 = protoModule.writeString(var2786, var2787, self.item_type)
		buff = var2786
		var2783 = var2787
	end
	local buff_1 = buffer.create(var2783)
	buffer.copy(buff_1, 0, buff, 0, var2783)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref)
	local var2783 = t_101.new()
	local var2784 = 0
	while var2784 < buffer.len(p101) do
		local _ = nil
		local var2785 = nil
		local var2786, var2787, var2788 = protoModule.readTag(p101, var2784)
		local var2789 = var2786
		var2785 = var2787
		var2784 = var2788
		
		if var2785 == protoModule.wireTypes.varint then
			local _ = nil
			local var2790, var2791 = protoModule.readVarInt(p101, var2784)
			local _ = var2790
			var2784 = var2791
			continue
		end
		if var2785 == protoModule.wireTypes.lengthDelimited then
			if var2789 == 1 then
				local _ = nil
				local var2792, var2793 = protoModule.readBuffer(p101, var2784)
				var2784 = var2793
				var2783.item_id = buffer.tostring(var2792)
			elseif var2789 == 2 then
				local _ = nil
				local var2794, var2795 = protoModule.readBuffer(p101, var2784)
				var2784 = var2795
				var2783.item_type = buffer.tostring(var2794)
			else
				local _ = nil
				local var2796, var2797 = protoModule.readVarInt(p101, var2784)
				var2784 = var2797 + var2796
			end
		elseif var2785 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2798, var2799 = protoModule.readFixed32(p101, var2784)
			local _ = var2798
			var2784 = var2799
		elseif var2785 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2800, var2801 = protoModule.readFixed64(p101, var2784)
			local _ = var2800
			var2784 = var2801
		else
			error("Unsupported wire type: " .. var4052)
		end
	end
	return var2783
end

function t_101:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_101:jsonDecode()
	-- upvalues: t_101 (ref)
	local var2802 = t_101.new()
	
	if self.item_id ~= nil then
		var2802.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2802.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2802.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2802.item_type = self.itemType
	end
	return var2802
end

t_101.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_101
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p102)
	-- upvalues: t_102 (ref)
	return setmetatable({
		universe_id = if p102 == nil or p102.universe_id == nil then "" else p102.universe_id
	}, t_102)
end

function t_102:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2802 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2803, var2804 = protoModule.writeTag(buff, var2802, 1, protoModule.wireTypes.lengthDelimited)
		var2803, var4074 = protoModule.writeString(var2803, var2804, self.universe_id)
		buff = var2803
		var2802 = var2804
	end
	local buff_1 = buffer.create(var2802)
	buffer.copy(buff_1, 0, buff, 0, var2802)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2802 = t_102.new()
	local var2803 = 0
	while var2803 < buffer.len(p102) do
		local _ = nil
		local var2804 = nil
		local var2805, var2806, var2807 = protoModule.readTag(p102, var2803)
		local var2808 = var2805
		var2804 = var2806
		var2803 = var2807
		
		if var2804 == protoModule.wireTypes.varint then
			local _ = nil
			local var2809, var2810 = protoModule.readVarInt(p102, var2803)
			local _ = var2809
			var2803 = var2810
			continue
		end
		if var2804 == protoModule.wireTypes.lengthDelimited then
			if var2808 == 1 then
				local _ = nil
				local var2811, var2812 = protoModule.readBuffer(p102, var2803)
				var2803 = var2812
				var2802.universe_id = buffer.tostring(var2811)
			else
				local _ = nil
				local var2813, var2814 = protoModule.readVarInt(p102, var2803)
				var2803 = var2814 + var2813
			end
		elseif var2804 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2815, var2816 = protoModule.readFixed32(p102, var2803)
			local _ = var2815
			var2803 = var2816
		elseif var2804 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2817, var2818 = protoModule.readFixed64(p102, var2803)
			local _ = var2817
			var2803 = var2818
		else
			error("Unsupported wire type: " .. var4078)
		end
	end
	return var2802
end

function t_102:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_102:jsonDecode()
	-- upvalues: t_102 (ref)
	local var2819 = t_102.new()
	
	if self.universe_id ~= nil then
		var2819.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2819.universe_id = self.universeId
	end
	return var2819
end

t_102.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_102
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p103)
	-- upvalues: t_103 (ref)
	return setmetatable({
		title = if p103 == nil or p103.title == nil then "" else p103.title,
		subtitle = if p103 == nil or p103.subtitle == nil then "" else p103.subtitle,
		moment_items = if p103 == nil or p103.moment_items == nil then {} else p103.moment_items
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2819 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2820, var2821 = protoModule.writeTag(buff, var2819, 1, protoModule.wireTypes.lengthDelimited)
		var2820, var4098 = protoModule.writeString(var2820, var2821, self.title)
		buff = var2820
		var2819 = var2821
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2822, var2823 = protoModule.writeTag(buff, var2819, 2, protoModule.wireTypes.lengthDelimited)
		var2822, var4100 = protoModule.writeString(var2822, var2823, self.subtitle)
		buff = var2822
		var2819 = var2823
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2824 = v:encode()
			local var2825, var2826 = protoModule.writeTag(buff, var2819, 3, protoModule.wireTypes.lengthDelimited)
			var2825, var4103 = protoModule.writeBuffer(var2825, var2826, var2824, buffer.len(var2824))
			buff = var2825
			var2819 = var2826
		end
	end
	local buff_1 = buffer.create(var2819)
	buffer.copy(buff_1, 0, buff, 0, var2819)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), t (ref)
	local var2827 = t_103.new()
	local var2828 = 0
	while var2828 < buffer.len(p103) do
		local _ = nil
		local var2829 = nil
		local var2830, var2831, var2832 = protoModule.readTag(p103, var2828)
		local var2833 = var2830
		var2829 = var2831
		var2828 = var2832
		
		if var2829 == protoModule.wireTypes.varint then
			local _ = nil
			local var2834, var2835 = protoModule.readVarInt(p103, var2828)
			local _ = var2834
			var2828 = var2835
			continue
		end
		if var2829 == protoModule.wireTypes.lengthDelimited then
			if var2833 == 1 then
				local _ = nil
				local var2836, var2837 = protoModule.readBuffer(p103, var2828)
				var2828 = var2837
				var2827.title = buffer.tostring(var2836)
			elseif var2833 == 2 then
				local _ = nil
				local var2838, var2839 = protoModule.readBuffer(p103, var2828)
				var2828 = var2839
				var2827.subtitle = buffer.tostring(var2838)
			elseif var2833 == 3 then
				local _ = nil
				local var2840, var2841 = protoModule.readBuffer(p103, var2828)
				var2828 = var2841
				table.insert(var2827.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2840))
			else
				local _ = nil
				local var2842, var2843 = protoModule.readVarInt(p103, var2828)
				var2828 = var2843 + var2842
			end
		elseif var2829 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2844, var2845 = protoModule.readFixed32(p103, var2828)
			local _ = var2844
			var2828 = var2845
		elseif var2829 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2846, var2847 = protoModule.readFixed64(p103, var2828)
			local _ = var2846
			var2828 = var2847
		else
			error("Unsupported wire type: " .. var4107)
		end
	end
	return var2827
end

function t_103:jsonEncode()
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

function t_103:jsonDecode()
	-- upvalues: t_103 (ref), t (ref)
	local var2848 = t_103.new()
	
	if self.title ~= nil then
		var2848.title = self.title
	end
	if self.subtitle ~= nil then
		var2848.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2848.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2848.moment_items = t_1
	end
	return var2848
end

t_103.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_103
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p104)
	-- upvalues: t_104 (ref)
	return setmetatable({
		moment_id = if p104 == nil or p104.moment_id == nil then "" else p104.moment_id,
		video_asset_id = if p104 == nil or p104.video_asset_id == nil then "" else p104.video_asset_id,
		target_universe_id = if p104 == nil or p104.target_universe_id == nil then "" else p104.target_universe_id,
		target_place_id = if p104 == nil or p104.target_place_id == nil then "" else p104.target_place_id,
		feed_item_id = if p104 == nil or p104.feed_item_id == nil then "" else p104.feed_item_id,
		capture_universe_id = if p104 == nil or p104.capture_universe_id == nil then "" else p104.capture_universe_id
	}, t_104)
end

function t_104:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2849 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2850, var2851 = protoModule.writeTag(buff, var2849, 1, protoModule.wireTypes.lengthDelimited)
		var2850, var4134 = protoModule.writeString(var2850, var2851, self.moment_id)
		buff = var2850
		var2849 = var2851
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2852, var2853 = protoModule.writeTag(buff, var2849, 2, protoModule.wireTypes.lengthDelimited)
		var2852, var4136 = protoModule.writeString(var2852, var2853, self.video_asset_id)
		buff = var2852
		var2849 = var2853
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2854, var2855 = protoModule.writeTag(buff, var2849, 3, protoModule.wireTypes.lengthDelimited)
		var2854, var4138 = protoModule.writeString(var2854, var2855, self.target_universe_id)
		buff = var2854
		var2849 = var2855
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2856, var2857 = protoModule.writeTag(buff, var2849, 4, protoModule.wireTypes.lengthDelimited)
		var2856, var4140 = protoModule.writeString(var2856, var2857, self.target_place_id)
		buff = var2856
		var2849 = var2857
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2858, var2859 = protoModule.writeTag(buff, var2849, 5, protoModule.wireTypes.lengthDelimited)
		var2858, var4142 = protoModule.writeString(var2858, var2859, self.feed_item_id)
		buff = var2858
		var2849 = var2859
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2860, var2861 = protoModule.writeTag(buff, var2849, 6, protoModule.wireTypes.lengthDelimited)
		var2860, var4144 = protoModule.writeString(var2860, var2861, self.capture_universe_id)
		buff = var2860
		var2849 = var2861
	end
	local buff_1 = buffer.create(var2849)
	buffer.copy(buff_1, 0, buff, 0, var2849)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2849 = t_104.new()
	local var2850 = 0
	while var2850 < buffer.len(p104) do
		local _ = nil
		local var2851 = nil
		local var2852, var2853, var2854 = protoModule.readTag(p104, var2850)
		local var2855 = var2852
		var2851 = var2853
		var2850 = var2854
		
		if var2851 == protoModule.wireTypes.varint then
			local _ = nil
			local var2856, var2857 = protoModule.readVarInt(p104, var2850)
			local _ = var2856
			var2850 = var2857
			continue
		end
		if var2851 == protoModule.wireTypes.lengthDelimited then
			if var2855 == 1 then
				local _ = nil
				local var2858, var2859 = protoModule.readBuffer(p104, var2850)
				var2850 = var2859
				var2849.moment_id = buffer.tostring(var2858)
			elseif var2855 == 2 then
				local _ = nil
				local var2860, var2861 = protoModule.readBuffer(p104, var2850)
				var2850 = var2861
				var2849.video_asset_id = buffer.tostring(var2860)
			elseif var2855 == 3 then
				local _ = nil
				local var2862, var2863 = protoModule.readBuffer(p104, var2850)
				var2850 = var2863
				var2849.target_universe_id = buffer.tostring(var2862)
			elseif var2855 == 4 then
				local _ = nil
				local var2864, var2865 = protoModule.readBuffer(p104, var2850)
				var2850 = var2865
				var2849.target_place_id = buffer.tostring(var2864)
			elseif var2855 == 5 then
				local _ = nil
				local var2866, var2867 = protoModule.readBuffer(p104, var2850)
				var2850 = var2867
				var2849.feed_item_id = buffer.tostring(var2866)
			elseif var2855 == 6 then
				local _ = nil
				local var2868, var2869 = protoModule.readBuffer(p104, var2850)
				var2850 = var2869
				var2849.capture_universe_id = buffer.tostring(var2868)
			else
				local _ = nil
				local var2870, var2871 = protoModule.readVarInt(p104, var2850)
				var2850 = var2871 + var2870
			end
		elseif var2851 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2872, var2873 = protoModule.readFixed32(p104, var2850)
			local _ = var2872
			var2850 = var2873
		elseif var2851 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2874, var2875 = protoModule.readFixed64(p104, var2850)
			local _ = var2874
			var2850 = var2875
		else
			error("Unsupported wire type: " .. var4148)
		end
	end
	return var2849
end

function t_104:jsonEncode()
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

function t_104:jsonDecode()
	-- upvalues: t_104 (ref)
	local var2876 = t_104.new()
	
	if self.moment_id ~= nil then
		var2876.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var2876.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var2876.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2876.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var2876.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var2876.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var2876.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var2876.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var2876.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var2876.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var2876.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var2876.capture_universe_id = self.captureUniverseId
	end
	return var2876
end

t_104.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_104
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p105)
	-- upvalues: t_105 (ref)
	return setmetatable({
		title = if p105 == nil or p105.title == nil then "" else p105.title,
		subtitle = if p105 == nil or p105.subtitle == nil then "" else p105.subtitle
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2876 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2877, var2878 = protoModule.writeTag(buff, var2876, 1, protoModule.wireTypes.lengthDelimited)
		var2877, var4178 = protoModule.writeString(var2877, var2878, self.title)
		buff = var2877
		var2876 = var2878
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2879, var2880 = protoModule.writeTag(buff, var2876, 2, protoModule.wireTypes.lengthDelimited)
		var2879, var4180 = protoModule.writeString(var2879, var2880, self.subtitle)
		buff = var2879
		var2876 = var2880
	end
	local buff_1 = buffer.create(var2876)
	buffer.copy(buff_1, 0, buff, 0, var2876)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2876 = t_105.new()
	local var2877 = 0
	while var2877 < buffer.len(p105) do
		local _ = nil
		local var2878 = nil
		local var2879, var2880, var2881 = protoModule.readTag(p105, var2877)
		local var2882 = var2879
		var2878 = var2880
		var2877 = var2881
		
		if var2878 == protoModule.wireTypes.varint then
			local _ = nil
			local var2883, var2884 = protoModule.readVarInt(p105, var2877)
			local _ = var2883
			var2877 = var2884
			continue
		end
		if var2878 == protoModule.wireTypes.lengthDelimited then
			if var2882 == 1 then
				local _ = nil
				local var2885, var2886 = protoModule.readBuffer(p105, var2877)
				var2877 = var2886
				var2876.title = buffer.tostring(var2885)
			elseif var2882 == 2 then
				local _ = nil
				local var2887, var2888 = protoModule.readBuffer(p105, var2877)
				var2877 = var2888
				var2876.subtitle = buffer.tostring(var2887)
			else
				local _ = nil
				local var2889, var2890 = protoModule.readVarInt(p105, var2877)
				var2877 = var2890 + var2889
			end
		elseif var2878 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2891, var2892 = protoModule.readFixed32(p105, var2877)
			local _ = var2891
			var2877 = var2892
		elseif var2878 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2893, var2894 = protoModule.readFixed64(p105, var2877)
			local _ = var2893
			var2877 = var2894
		else
			error("Unsupported wire type: " .. var4184)
		end
	end
	return var2876
end

function t_105:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_105:jsonDecode()
	-- upvalues: t_105 (ref)
	local var2895 = t_105.new()
	
	if self.title ~= nil then
		var2895.title = self.title
	end
	if self.subtitle ~= nil then
		var2895.subtitle = self.subtitle
	end
	return var2895
end

t_105.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_105
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p106)
	-- upvalues: t_106 (ref)
	return setmetatable({
		primary_cta_button_text = if p106 == nil or p106.primary_cta_button_text == nil then "" else p106.primary_cta_button_text,
		secondary_cta_button_text = if p106 == nil or p106.secondary_cta_button_text == nil then "" else p106.secondary_cta_button_text,
		primary_cta_type = if p106 == nil or p106.primary_cta_type == nil then "" else p106.primary_cta_type,
		secondary_cta_type = if p106 == nil or p106.secondary_cta_type == nil then "" else p106.secondary_cta_type
	}, t_106)
end

function t_106:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2895 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var2896, var2897 = protoModule.writeTag(buff, var2895, 1, protoModule.wireTypes.lengthDelimited)
		var2896, var4206 = protoModule.writeString(var2896, var2897, self.primary_cta_button_text)
		buff = var2896
		var2895 = var2897
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var2898, var2899 = protoModule.writeTag(buff, var2895, 2, protoModule.wireTypes.lengthDelimited)
		var2898, var4208 = protoModule.writeString(var2898, var2899, self.secondary_cta_button_text)
		buff = var2898
		var2895 = var2899
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var2900, var2901 = protoModule.writeTag(buff, var2895, 3, protoModule.wireTypes.lengthDelimited)
		var2900, var4210 = protoModule.writeString(var2900, var2901, self.primary_cta_type)
		buff = var2900
		var2895 = var2901
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var2902, var2903 = protoModule.writeTag(buff, var2895, 4, protoModule.wireTypes.lengthDelimited)
		var2902, var4212 = protoModule.writeString(var2902, var2903, self.secondary_cta_type)
		buff = var2902
		var2895 = var2903
	end
	local buff_1 = buffer.create(var2895)
	buffer.copy(buff_1, 0, buff, 0, var2895)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var2895 = t_106.new()
	local var2896 = 0
	while var2896 < buffer.len(p106) do
		local _ = nil
		local var2897 = nil
		local var2898, var2899, var2900 = protoModule.readTag(p106, var2896)
		local var2901 = var2898
		var2897 = var2899
		var2896 = var2900
		
		if var2897 == protoModule.wireTypes.varint then
			local _ = nil
			local var2902, var2903 = protoModule.readVarInt(p106, var2896)
			local _ = var2902
			var2896 = var2903
			continue
		end
		if var2897 == protoModule.wireTypes.lengthDelimited then
			if var2901 == 1 then
				local _ = nil
				local var2904, var2905 = protoModule.readBuffer(p106, var2896)
				var2896 = var2905
				var2895.primary_cta_button_text = buffer.tostring(var2904)
			elseif var2901 == 2 then
				local _ = nil
				local var2906, var2907 = protoModule.readBuffer(p106, var2896)
				var2896 = var2907
				var2895.secondary_cta_button_text = buffer.tostring(var2906)
			elseif var2901 == 3 then
				local _ = nil
				local var2908, var2909 = protoModule.readBuffer(p106, var2896)
				var2896 = var2909
				var2895.primary_cta_type = buffer.tostring(var2908)
			elseif var2901 == 4 then
				local _ = nil
				local var2910, var2911 = protoModule.readBuffer(p106, var2896)
				var2896 = var2911
				var2895.secondary_cta_type = buffer.tostring(var2910)
			else
				local _ = nil
				local var2912, var2913 = protoModule.readVarInt(p106, var2896)
				var2896 = var2913 + var2912
			end
		elseif var2897 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2914, var2915 = protoModule.readFixed32(p106, var2896)
			local _ = var2914
			var2896 = var2915
		elseif var2897 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2916, var2917 = protoModule.readFixed64(p106, var2896)
			local _ = var2916
			var2896 = var2917
		else
			error("Unsupported wire type: " .. var4216)
		end
	end
	return var2895
end

function t_106:jsonEncode()
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

function t_106:jsonDecode()
	-- upvalues: t_106 (ref)
	local var2918 = t_106.new()
	
	if self.primary_cta_button_text ~= nil then
		var2918.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var2918.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var2918.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var2918.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var2918.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var2918.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var2918.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var2918.secondary_cta_type = self.secondaryCtaType
	end
	return var2918
end

t_106.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_106
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p107)
	-- upvalues: t_107 (ref)
	return setmetatable({
		image_asset_id = if p107 == nil or p107.image_asset_id == nil then "" else p107.image_asset_id
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2918 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2919, var2920 = protoModule.writeTag(buff, var2918, 1, protoModule.wireTypes.lengthDelimited)
		var2919, var4242 = protoModule.writeString(var2919, var2920, self.image_asset_id)
		buff = var2919
		var2918 = var2920
	end
	local buff_1 = buffer.create(var2918)
	buffer.copy(buff_1, 0, buff, 0, var2918)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2918 = t_107.new()
	local var2919 = 0
	while var2919 < buffer.len(p107) do
		local _ = nil
		local var2920 = nil
		local var2921, var2922, var2923 = protoModule.readTag(p107, var2919)
		local var2924 = var2921
		var2920 = var2922
		var2919 = var2923
		
		if var2920 == protoModule.wireTypes.varint then
			local _ = nil
			local var2925, var2926 = protoModule.readVarInt(p107, var2919)
			local _ = var2925
			var2919 = var2926
			continue
		end
		if var2920 == protoModule.wireTypes.lengthDelimited then
			if var2924 == 1 then
				local _ = nil
				local var2927, var2928 = protoModule.readBuffer(p107, var2919)
				var2919 = var2928
				var2918.image_asset_id = buffer.tostring(var2927)
			else
				local _ = nil
				local var2929, var2930 = protoModule.readVarInt(p107, var2919)
				var2919 = var2930 + var2929
			end
		elseif var2920 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2931, var2932 = protoModule.readFixed32(p107, var2919)
			local _ = var2931
			var2919 = var2932
		elseif var2920 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2933, var2934 = protoModule.readFixed64(p107, var2919)
			local _ = var2933
			var2919 = var2934
		else
			error("Unsupported wire type: " .. var4246)
		end
	end
	return var2918
end

function t_107:jsonEncode()
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_107:jsonDecode()
	-- upvalues: t_107 (ref)
	local var2935 = t_107.new()
	
	if self.image_asset_id ~= nil then
		var2935.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var2935.image_asset_id = self.imageAssetId
	end
	return var2935
end

t_107.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_107
typeRegistryModule.default:register(t.ImageInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p108)
	-- upvalues: t_108 (ref)
	return setmetatable({
		video_asset_id = if p108 == nil or p108.video_asset_id == nil then "" else p108.video_asset_id,
		loading_image_asset_id = if p108 == nil or p108.loading_image_asset_id == nil then "" else p108.loading_image_asset_id
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2935 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2936, var2937 = protoModule.writeTag(buff, var2935, 1, protoModule.wireTypes.lengthDelimited)
		var2936, var4266 = protoModule.writeString(var2936, var2937, self.video_asset_id)
		buff = var2936
		var2935 = var2937
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var2938, var2939 = protoModule.writeTag(buff, var2935, 2, protoModule.wireTypes.lengthDelimited)
		var2938, var4268 = protoModule.writeString(var2938, var2939, self.loading_image_asset_id)
		buff = var2938
		var2935 = var2939
	end
	local buff_1 = buffer.create(var2935)
	buffer.copy(buff_1, 0, buff, 0, var2935)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var2935 = t_108.new()
	local var2936 = 0
	while var2936 < buffer.len(p108) do
		local _ = nil
		local var2937 = nil
		local var2938, var2939, var2940 = protoModule.readTag(p108, var2936)
		local var2941 = var2938
		var2937 = var2939
		var2936 = var2940
		
		if var2937 == protoModule.wireTypes.varint then
			local _ = nil
			local var2942, var2943 = protoModule.readVarInt(p108, var2936)
			local _ = var2942
			var2936 = var2943
			continue
		end
		if var2937 == protoModule.wireTypes.lengthDelimited then
			if var2941 == 1 then
				local _ = nil
				local var2944, var2945 = protoModule.readBuffer(p108, var2936)
				var2936 = var2945
				var2935.video_asset_id = buffer.tostring(var2944)
			elseif var2941 == 2 then
				local _ = nil
				local var2946, var2947 = protoModule.readBuffer(p108, var2936)
				var2936 = var2947
				var2935.loading_image_asset_id = buffer.tostring(var2946)
			else
				local _ = nil
				local var2948, var2949 = protoModule.readVarInt(p108, var2936)
				var2936 = var2949 + var2948
			end
		elseif var2937 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2950, var2951 = protoModule.readFixed32(p108, var2936)
			local _ = var2950
			var2936 = var2951
		elseif var2937 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2952, var2953 = protoModule.readFixed64(p108, var2936)
			local _ = var2952
			var2936 = var2953
		else
			error("Unsupported wire type: " .. var4272)
		end
	end
	return var2935
end

function t_108:jsonEncode()
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		t.loadingImageAssetId = self.loading_image_asset_id
	end
	return t
end

function t_108:jsonDecode()
	-- upvalues: t_108 (ref)
	local var2954 = t_108.new()
	
	if self.video_asset_id ~= nil then
		var2954.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2954.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var2954.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var2954.loading_image_asset_id = self.loadingImageAssetId
	end
	return var2954
end

t_108.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_108
typeRegistryModule.default:register(t.VideoInputData)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p109)
	-- upvalues: t_109 (ref)
	return setmetatable({
		text = if p109 == nil or p109.text == nil then "" else p109.text,
		is_rendered_text = if p109 == nil or p109.is_rendered_text == nil then false else p109.is_rendered_text
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2954 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var2955, var2956 = protoModule.writeTag(buff, var2954, 1, protoModule.wireTypes.lengthDelimited)
		var2955, var4294 = protoModule.writeString(var2955, var2956, self.text)
		buff = var2955
		var2954 = var2956
	end
	if self.is_rendered_text then
		local var2957, var2958 = protoModule.writeTag(buff, var2954, 2, protoModule.wireTypes.varint)
		var2957, var4296 = protoModule.writeVarInt(var2957, var2958, if self.is_rendered_text then 1 else 0)
		buff = var2957
		var2954 = var2958
	end
	local buff_1 = buffer.create(var2954)
	buffer.copy(buff_1, 0, buff, 0, var2954)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref)
	local var2954 = t_109.new()
	local var2955 = 0
	while var2955 < buffer.len(p109) do
		local _ = nil
		local var2956 = nil
		local var2957, var2958, var2959 = protoModule.readTag(p109, var2955)
		local var2960 = var2957
		var2956 = var2958
		var2955 = var2959
		
		if var2956 == protoModule.wireTypes.varint then
			if var2960 == 2 then
				local _ = nil
				local var2961, var2962 = protoModule.readVarInt(p109, var2955)
				var2955 = var2962
				var2954.is_rendered_text = var2961 ~= 0
			else
				local _ = nil
				local var2963, var2964 = protoModule.readVarInt(p109, var2955)
				local _ = var2963
				var2955 = var2964
			end
		end
		if var2956 == protoModule.wireTypes.lengthDelimited then
			if var2960 == 1 then
				local _ = nil
				local var2965, var2966 = protoModule.readBuffer(p109, var2955)
				var2955 = var2966
				var2954.text = buffer.tostring(var2965)
			else
				local _ = nil
				local var2967, var2968 = protoModule.readVarInt(p109, var2955)
				var2955 = var2968 + var2967
			end
		elseif var2956 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2969, var2970 = protoModule.readFixed32(p109, var2955)
			local _ = var2969
			var2955 = var2970
		elseif var2956 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2971, var2972 = protoModule.readFixed64(p109, var2955)
			local _ = var2971
			var2955 = var2972
		else
			error("Unsupported wire type: " .. var4300)
		end
	end
	return var2954
end

function t_109:jsonEncode()
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function t_109:jsonDecode()
	-- upvalues: t_109 (ref)
	local var2973 = t_109.new()
	
	if self.text ~= nil then
		var2973.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var2973.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var2973.is_rendered_text = self.isRenderedText
	end
	return var2973
end

t_109.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_109
typeRegistryModule.default:register(t.TextInputData)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p110)
	-- upvalues: t_110 (ref)
	return setmetatable({
		entry_map = if p110 == nil or p110.entry_map == nil then {} else p110.entry_map,
		entry_order = if p110 == nil or p110.entry_order == nil then {} else p110.entry_order,
		entry_order_map = if p110 == nil or p110.entry_order_map == nil then {} else p110.entry_order_map,
		content_pools = if p110 == nil or p110.content_pools == nil then {} else p110.content_pools
	}, t_110)
end

function t_110:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2973 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2974, var2975 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2974, var4322 = protoModule.writeString(var2974, var2975, i)
			local var2976 = v:encode()
			var2975, var4324 = protoModule.writeTag(var2974, var2975, 2, protoModule.wireTypes.lengthDelimited)
			var2975, var4324 = protoModule.writeBuffer(var2975, var4324, var2976, buffer.len(var2976))
			local var2977 = var2975
			local var2978 = var4324
			local var2979, var2980 = protoModule.writeTag(buff, var2973, 1, protoModule.wireTypes.lengthDelimited)
			var2979, var4328 = protoModule.writeBuffer(var2979, var2980, var2977, var2978)
			buff = var2979
			var2973 = var2980
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2981, var2982 = protoModule.writeTag(buff, var2973, 2, protoModule.wireTypes.lengthDelimited)
			var2981, var4330 = protoModule.writeString(var2981, var2982, v)
			buff = var2981
			var2973 = var2982
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var2983, var2984 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2983, var4332 = protoModule.writeString(var2983, var2984, i)
			local var2985 = v:encode()
			var2984, var4334 = protoModule.writeTag(var2983, var2984, 2, protoModule.wireTypes.lengthDelimited)
			var2984, var4334 = protoModule.writeBuffer(var2984, var4334, var2985, buffer.len(var2985))
			local var2986 = var2984
			local var2987 = var4334
			local var2988, var2989 = protoModule.writeTag(buff, var2973, 3, protoModule.wireTypes.lengthDelimited)
			var2988, var4338 = protoModule.writeBuffer(var2988, var2989, var2986, var2987)
			buff = var2988
			var2973 = var2989
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2990, var2991 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2990, var4340 = protoModule.writeString(var2990, var2991, i)
			local var2992 = v:encode()
			var2991, var4342 = protoModule.writeTag(var2990, var2991, 2, protoModule.wireTypes.lengthDelimited)
			var2991, var4342 = protoModule.writeBuffer(var2991, var4342, var2992, buffer.len(var2992))
			local var2993 = var2991
			local var2994 = var4342
			local var2995, var2996 = protoModule.writeTag(buff, var2973, 4, protoModule.wireTypes.lengthDelimited)
			var2995, var4346 = protoModule.writeBuffer(var2995, var2996, var2993, var2994)
			buff = var2995
			var2973 = var2996
		end
	end
	local buff_1 = buffer.create(var2973)
	buffer.copy(buff_1, 0, buff, 0, var2973)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var2997 = t_110.new()
	local var2998 = 0
	while var2998 < buffer.len(p110) do
		local _ = nil
		local var2999 = nil
		local var3000, var3001, var3002 = protoModule.readTag(p110, var2998)
		local var3003 = var3000
		var2999 = var3001
		var2998 = var3002
		
		if var2999 == protoModule.wireTypes.varint then
			local _ = nil
			local var3004, var3005 = protoModule.readVarInt(p110, var2998)
			local _ = var3004
			var2998 = var3005
			continue
		end
		if var2999 == protoModule.wireTypes.lengthDelimited then
			if var3003 == 1 then
				local _ = nil
				local var3006, var3007 = protoModule.readBuffer(p110, var2998)
				var2998 = var3007
				var3006 = t.VerticalFeedInputData_EntryMapEntry.decode(var3006)
				var2997.entry_map[var3006.key or ""] = var3006.value or t.FeedEntry.new()
			elseif var3003 == 2 then
				local _ = nil
				local var3008, var3009 = protoModule.readBuffer(p110, var2998)
				var2998 = var3009
				table.insert(var2997.entry_order, buffer.tostring(var3008))
			elseif var3003 == 3 then
				local _ = nil
				local var3010, var3011 = protoModule.readBuffer(p110, var2998)
				var2998 = var3011
				var3010 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3010)
				var2997.entry_order_map[var3010.key or ""] = var3010.value or t.EntryOrder.new()
			elseif var3003 == 4 then
				local _ = nil
				local var3012, var3013 = protoModule.readBuffer(p110, var2998)
				var2998 = var3013
				var3012 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3012)
				var2997.content_pools[var3012.key or ""] = var3012.value or t.ContentPool.new()
			else
				local _ = nil
				local var3014, var3015 = protoModule.readVarInt(p110, var2998)
				var2998 = var3015 + var3014
			end
		elseif var2999 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3016, var3017 = protoModule.readFixed32(p110, var2998)
			local _ = var3016
			var2998 = var3017
		elseif var2999 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3018, var3019 = protoModule.readFixed64(p110, var2998)
			local _ = var3018
			var2998 = var3019
		else
			error("Unsupported wire type: " .. var4350)
		end
	end
	return var2997
end

function t_110:jsonEncode()
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

function t_110:jsonDecode()
	-- upvalues: t_110 (ref), t (ref)
	local var3020 = t_110.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3020.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3020.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3020.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3020.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3020.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3020.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3020.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3020.content_pools = t_1
	end
	return var3020
end

t_110.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_110
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p111)
	-- upvalues: t_111 (ref)
	return setmetatable({
		key = if p111 == nil or p111.key == nil then "" else p111.key,
		value = if p111 == nil or p111.value == nil then nil else p111.value
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3021 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3022, var3023 = protoModule.writeTag(buff, var3021, 1, protoModule.wireTypes.lengthDelimited)
		var3022, var4388 = protoModule.writeString(var3022, var3023, self.key)
		buff = var3022
		var3021 = var3023
	end
	if self.value ~= nil then
		local var3024 = self.value:encode()
		local var3025, var3026 = protoModule.writeTag(buff, var3021, 2, protoModule.wireTypes.lengthDelimited)
		var3025, var4391 = protoModule.writeBuffer(var3025, var3026, var3024, buffer.len(var3024))
		buff = var3025
		var3021 = var3026
	end
	local buff_1 = buffer.create(var3021)
	buffer.copy(buff_1, 0, buff, 0, var3021)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var3021 = t_111.new()
	local var3022 = 0
	while var3022 < buffer.len(p111) do
		local _ = nil
		local var3023 = nil
		local var3024, var3025, var3026 = protoModule.readTag(p111, var3022)
		local var3027 = var3024
		var3023 = var3025
		var3022 = var3026
		
		if var3023 == protoModule.wireTypes.varint then
			local _ = nil
			local var3028, var3029 = protoModule.readVarInt(p111, var3022)
			local _ = var3028
			var3022 = var3029
			continue
		end
		if var3023 == protoModule.wireTypes.lengthDelimited then
			if var3027 == 1 then
				local _ = nil
				local var3030, var3031 = protoModule.readBuffer(p111, var3022)
				var3022 = var3031
				var3021.key = buffer.tostring(var3030)
			elseif var3027 == 2 then
				local _ = nil
				local var3032, var3033 = protoModule.readBuffer(p111, var3022)
				var3022 = var3033
				var3021.value = t.FeedEntry.decode(var3032)
			else
				local _ = nil
				local var3034, var3035 = protoModule.readVarInt(p111, var3022)
				var3022 = var3035 + var3034
			end
		elseif var3023 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3036, var3037 = protoModule.readFixed32(p111, var3022)
			local _ = var3036
			var3022 = var3037
		elseif var3023 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3038, var3039 = protoModule.readFixed64(p111, var3022)
			local _ = var3038
			var3022 = var3039
		else
			error("Unsupported wire type: " .. var4395)
		end
	end
	return var3021
end

function t_111:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_111:jsonDecode()
	-- upvalues: t_111 (ref), t (ref)
	local var3040 = t_111.new()
	
	if self.key ~= nil then
		var3040.key = self.key
	end
	if self.value ~= nil then
		var3040.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3040
end

t_111.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_111
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p112)
	-- upvalues: t_112 (ref)
	return setmetatable({
		key = if p112 == nil or p112.key == nil then "" else p112.key,
		value = if p112 == nil or p112.value == nil then nil else p112.value
	}, t_112)
end

function t_112:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3040 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3041, var3042 = protoModule.writeTag(buff, var3040, 1, protoModule.wireTypes.lengthDelimited)
		var3041, var4417 = protoModule.writeString(var3041, var3042, self.key)
		buff = var3041
		var3040 = var3042
	end
	if self.value ~= nil then
		local var3043 = self.value:encode()
		local var3044, var3045 = protoModule.writeTag(buff, var3040, 2, protoModule.wireTypes.lengthDelimited)
		var3044, var4420 = protoModule.writeBuffer(var3044, var3045, var3043, buffer.len(var3043))
		buff = var3044
		var3040 = var3045
	end
	local buff_1 = buffer.create(var3040)
	buffer.copy(buff_1, 0, buff, 0, var3040)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var3040 = t_112.new()
	local var3041 = 0
	while var3041 < buffer.len(p112) do
		local _ = nil
		local var3042 = nil
		local var3043, var3044, var3045 = protoModule.readTag(p112, var3041)
		local var3046 = var3043
		var3042 = var3044
		var3041 = var3045
		
		if var3042 == protoModule.wireTypes.varint then
			local _ = nil
			local var3047, var3048 = protoModule.readVarInt(p112, var3041)
			local _ = var3047
			var3041 = var3048
			continue
		end
		if var3042 == protoModule.wireTypes.lengthDelimited then
			if var3046 == 1 then
				local _ = nil
				local var3049, var3050 = protoModule.readBuffer(p112, var3041)
				var3041 = var3050
				var3040.key = buffer.tostring(var3049)
			elseif var3046 == 2 then
				local _ = nil
				local var3051, var3052 = protoModule.readBuffer(p112, var3041)
				var3041 = var3052
				var3040.value = t.EntryOrder.decode(var3051)
			else
				local _ = nil
				local var3053, var3054 = protoModule.readVarInt(p112, var3041)
				var3041 = var3054 + var3053
			end
		elseif var3042 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3055, var3056 = protoModule.readFixed32(p112, var3041)
			local _ = var3055
			var3041 = var3056
		elseif var3042 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3057, var3058 = protoModule.readFixed64(p112, var3041)
			local _ = var3057
			var3041 = var3058
		else
			error("Unsupported wire type: " .. var4424)
		end
	end
	return var3040
end

function t_112:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_112:jsonDecode()
	-- upvalues: t_112 (ref), t (ref)
	local var3059 = t_112.new()
	
	if self.key ~= nil then
		var3059.key = self.key
	end
	if self.value ~= nil then
		var3059.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3059
end

t_112.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_112
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p113)
	-- upvalues: t_113 (ref)
	return setmetatable({
		key = if p113 == nil or p113.key == nil then "" else p113.key,
		value = if p113 == nil or p113.value == nil then nil else p113.value
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3059 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3060, var3061 = protoModule.writeTag(buff, var3059, 1, protoModule.wireTypes.lengthDelimited)
		var3060, var4446 = protoModule.writeString(var3060, var3061, self.key)
		buff = var3060
		var3059 = var3061
	end
	if self.value ~= nil then
		local var3062 = self.value:encode()
		local var3063, var3064 = protoModule.writeTag(buff, var3059, 2, protoModule.wireTypes.lengthDelimited)
		var3063, var4449 = protoModule.writeBuffer(var3063, var3064, var3062, buffer.len(var3062))
		buff = var3063
		var3059 = var3064
	end
	local buff_1 = buffer.create(var3059)
	buffer.copy(buff_1, 0, buff, 0, var3059)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var3059 = t_113.new()
	local var3060 = 0
	while var3060 < buffer.len(p113) do
		local _ = nil
		local var3061 = nil
		local var3062, var3063, var3064 = protoModule.readTag(p113, var3060)
		local var3065 = var3062
		var3061 = var3063
		var3060 = var3064
		
		if var3061 == protoModule.wireTypes.varint then
			local _ = nil
			local var3066, var3067 = protoModule.readVarInt(p113, var3060)
			local _ = var3066
			var3060 = var3067
			continue
		end
		if var3061 == protoModule.wireTypes.lengthDelimited then
			if var3065 == 1 then
				local _ = nil
				local var3068, var3069 = protoModule.readBuffer(p113, var3060)
				var3060 = var3069
				var3059.key = buffer.tostring(var3068)
			elseif var3065 == 2 then
				local _ = nil
				local var3070, var3071 = protoModule.readBuffer(p113, var3060)
				var3060 = var3071
				var3059.value = t.ContentPool.decode(var3070)
			else
				local _ = nil
				local var3072, var3073 = protoModule.readVarInt(p113, var3060)
				var3060 = var3073 + var3072
			end
		elseif var3061 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3074, var3075 = protoModule.readFixed32(p113, var3060)
			local _ = var3074
			var3060 = var3075
		elseif var3061 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3076, var3077 = protoModule.readFixed64(p113, var3060)
			local _ = var3076
			var3060 = var3077
		else
			error("Unsupported wire type: " .. var4453)
		end
	end
	return var3059
end

function t_113:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_113:jsonDecode()
	-- upvalues: t_113 (ref), t (ref)
	local var3078 = t_113.new()
	
	if self.key ~= nil then
		var3078.key = self.key
	end
	if self.value ~= nil then
		var3078.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3078
end

t_113.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_113
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p114)
	-- upvalues: t_114 (ref)
	return setmetatable({
		foreground_header_entry = if p114 == nil or p114.foreground_header_entry == nil then nil else p114.foreground_header_entry,
		background_header_entry = if p114 == nil or p114.background_header_entry == nil then nil else p114.background_header_entry,
		layout_variant = if p114 == nil or p114.layout_variant == nil then "" else p114.layout_variant
	}, t_114)
end

function t_114:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3078 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3079 = self.foreground_header_entry:encode()
		local var3080, var3081 = protoModule.writeTag(buff, var3078, 1, protoModule.wireTypes.lengthDelimited)
		var3080, var4476 = protoModule.writeBuffer(var3080, var3081, var3079, buffer.len(var3079))
		buff = var3080
		var3078 = var3081
	end
	if self.background_header_entry ~= nil then
		local var3082 = self.background_header_entry:encode()
		local var3083, var3084 = protoModule.writeTag(buff, var3078, 2, protoModule.wireTypes.lengthDelimited)
		var3083, var4479 = protoModule.writeBuffer(var3083, var3084, var3082, buffer.len(var3082))
		buff = var3083
		var3078 = var3084
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3085, var3086 = protoModule.writeTag(buff, var3078, 3, protoModule.wireTypes.lengthDelimited)
		var3085, var4481 = protoModule.writeString(var3085, var3086, self.layout_variant)
		buff = var3085
		var3078 = var3086
	end
	local buff_1 = buffer.create(var3078)
	buffer.copy(buff_1, 0, buff, 0, var3078)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3078 = t_114.new()
	local var3079 = 0
	while var3079 < buffer.len(p114) do
		local _ = nil
		local var3080 = nil
		local var3081, var3082, var3083 = protoModule.readTag(p114, var3079)
		local var3084 = var3081
		var3080 = var3082
		var3079 = var3083
		
		if var3080 == protoModule.wireTypes.varint then
			local _ = nil
			local var3085, var3086 = protoModule.readVarInt(p114, var3079)
			local _ = var3085
			var3079 = var3086
			continue
		end
		if var3080 == protoModule.wireTypes.lengthDelimited then
			if var3084 == 1 then
				local _ = nil
				local var3087, var3088 = protoModule.readBuffer(p114, var3079)
				var3079 = var3088
				var3078.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3087)
			elseif var3084 == 2 then
				local _ = nil
				local var3089, var3090 = protoModule.readBuffer(p114, var3079)
				var3079 = var3090
				var3078.background_header_entry = t.BackgroundHeaderEntry.decode(var3089)
			elseif var3084 == 3 then
				local _ = nil
				local var3091, var3092 = protoModule.readBuffer(p114, var3079)
				var3079 = var3092
				var3078.layout_variant = buffer.tostring(var3091)
			else
				local _ = nil
				local var3093, var3094 = protoModule.readVarInt(p114, var3079)
				var3079 = var3094 + var3093
			end
		elseif var3080 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3095, var3096 = protoModule.readFixed32(p114, var3079)
			local _ = var3095
			var3079 = var3096
		elseif var3080 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3097, var3098 = protoModule.readFixed64(p114, var3079)
			local _ = var3097
			var3079 = var3098
		else
			error("Unsupported wire type: " .. var4485)
		end
	end
	return var3078
end

function t_114:jsonEncode()
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

function t_114:jsonDecode()
	-- upvalues: t_114 (ref), t (ref)
	local var3099 = t_114.new()
	
	if self.foreground_header_entry ~= nil then
		var3099.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3099.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3099.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3099.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3099.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3099.layout_variant = self.layoutVariant
	end
	return var3099
end

t_114.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_114
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p115)
	-- upvalues: t_115 (ref)
	return setmetatable({
		cta_button_text = if p115 == nil or p115.cta_button_text == nil then "" else p115.cta_button_text,
		cta_type = if p115 == nil or p115.cta_type == nil then "" else p115.cta_type
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3099 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3100, var3101 = protoModule.writeTag(buff, var3099, 1, protoModule.wireTypes.lengthDelimited)
		var3100, var4509 = protoModule.writeString(var3100, var3101, self.cta_button_text)
		buff = var3100
		var3099 = var3101
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3102, var3103 = protoModule.writeTag(buff, var3099, 2, protoModule.wireTypes.lengthDelimited)
		var3102, var4511 = protoModule.writeString(var3102, var3103, self.cta_type)
		buff = var3102
		var3099 = var3103
	end
	local buff_1 = buffer.create(var3099)
	buffer.copy(buff_1, 0, buff, 0, var3099)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref)
	local var3099 = t_115.new()
	local var3100 = 0
	while var3100 < buffer.len(p115) do
		local _ = nil
		local var3101 = nil
		local var3102, var3103, var3104 = protoModule.readTag(p115, var3100)
		local var3105 = var3102
		var3101 = var3103
		var3100 = var3104
		
		if var3101 == protoModule.wireTypes.varint then
			local _ = nil
			local var3106, var3107 = protoModule.readVarInt(p115, var3100)
			local _ = var3106
			var3100 = var3107
			continue
		end
		if var3101 == protoModule.wireTypes.lengthDelimited then
			if var3105 == 1 then
				local _ = nil
				local var3108, var3109 = protoModule.readBuffer(p115, var3100)
				var3100 = var3109
				var3099.cta_button_text = buffer.tostring(var3108)
			elseif var3105 == 2 then
				local _ = nil
				local var3110, var3111 = protoModule.readBuffer(p115, var3100)
				var3100 = var3111
				var3099.cta_type = buffer.tostring(var3110)
			else
				local _ = nil
				local var3112, var3113 = protoModule.readVarInt(p115, var3100)
				var3100 = var3113 + var3112
			end
		elseif var3101 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3114, var3115 = protoModule.readFixed32(p115, var3100)
			local _ = var3114
			var3100 = var3115
		elseif var3101 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3116, var3117 = protoModule.readFixed64(p115, var3100)
			local _ = var3116
			var3100 = var3117
		else
			error("Unsupported wire type: " .. var4515)
		end
	end
	return var3099
end

function t_115:jsonEncode()
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_115:jsonDecode()
	-- upvalues: t_115 (ref)
	local var3118 = t_115.new()
	
	if self.cta_button_text ~= nil then
		var3118.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3118.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3118.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3118.cta_type = self.ctaType
	end
	return var3118
end

t_115.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_115
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p116)
	-- upvalues: t_116 (ref)
	return setmetatable({
		title = if p116 == nil or p116.title == nil then "" else p116.title,
		cta_button_text = if p116 == nil or p116.cta_button_text == nil then "" else p116.cta_button_text,
		image_asset_id = if p116 == nil or p116.image_asset_id == nil then "" else p116.image_asset_id,
		cta_type = if p116 == nil or p116.cta_type == nil then "" else p116.cta_type
	}, t_116)
end

function t_116:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3118 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3119, var3120 = protoModule.writeTag(buff, var3118, 1, protoModule.wireTypes.lengthDelimited)
		var3119, var4537 = protoModule.writeString(var3119, var3120, self.title)
		buff = var3119
		var3118 = var3120
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3121, var3122 = protoModule.writeTag(buff, var3118, 2, protoModule.wireTypes.lengthDelimited)
		var3121, var4539 = protoModule.writeString(var3121, var3122, self.cta_button_text)
		buff = var3121
		var3118 = var3122
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3123, var3124 = protoModule.writeTag(buff, var3118, 3, protoModule.wireTypes.lengthDelimited)
		var3123, var4541 = protoModule.writeString(var3123, var3124, self.image_asset_id)
		buff = var3123
		var3118 = var3124
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3125, var3126 = protoModule.writeTag(buff, var3118, 4, protoModule.wireTypes.lengthDelimited)
		var3125, var4543 = protoModule.writeString(var3125, var3126, self.cta_type)
		buff = var3125
		var3118 = var3126
	end
	local buff_1 = buffer.create(var3118)
	buffer.copy(buff_1, 0, buff, 0, var3118)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3118 = t_116.new()
	local var3119 = 0
	while var3119 < buffer.len(p116) do
		local _ = nil
		local var3120 = nil
		local var3121, var3122, var3123 = protoModule.readTag(p116, var3119)
		local var3124 = var3121
		var3120 = var3122
		var3119 = var3123
		
		if var3120 == protoModule.wireTypes.varint then
			local _ = nil
			local var3125, var3126 = protoModule.readVarInt(p116, var3119)
			local _ = var3125
			var3119 = var3126
			continue
		end
		if var3120 == protoModule.wireTypes.lengthDelimited then
			if var3124 == 1 then
				local _ = nil
				local var3127, var3128 = protoModule.readBuffer(p116, var3119)
				var3119 = var3128
				var3118.title = buffer.tostring(var3127)
			elseif var3124 == 2 then
				local _ = nil
				local var3129, var3130 = protoModule.readBuffer(p116, var3119)
				var3119 = var3130
				var3118.cta_button_text = buffer.tostring(var3129)
			elseif var3124 == 3 then
				local _ = nil
				local var3131, var3132 = protoModule.readBuffer(p116, var3119)
				var3119 = var3132
				var3118.image_asset_id = buffer.tostring(var3131)
			elseif var3124 == 4 then
				local _ = nil
				local var3133, var3134 = protoModule.readBuffer(p116, var3119)
				var3119 = var3134
				var3118.cta_type = buffer.tostring(var3133)
			else
				local _ = nil
				local var3135, var3136 = protoModule.readVarInt(p116, var3119)
				var3119 = var3136 + var3135
			end
		elseif var3120 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3137, var3138 = protoModule.readFixed32(p116, var3119)
			local _ = var3137
			var3119 = var3138
		elseif var3120 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3139, var3140 = protoModule.readFixed64(p116, var3119)
			local _ = var3139
			var3119 = var3140
		else
			error("Unsupported wire type: " .. var4547)
		end
	end
	return var3118
end

function t_116:jsonEncode()
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

function t_116:jsonDecode()
	-- upvalues: t_116 (ref)
	local var3141 = t_116.new()
	
	if self.title ~= nil then
		var3141.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3141.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3141.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3141.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3141.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3141.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3141.cta_type = self.ctaType
	end
	return var3141
end

t_116.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_116
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p117)
	-- upvalues: t_117 (ref)
	return setmetatable({
		title = if p117 == nil or p117.title == nil then "" else p117.title,
		url = if p117 == nil or p117.url == nil then nil else p117.url,
		destination = if p117 == nil or p117.destination == nil then nil else p117.destination,
		row_id = if p117 == nil or p117.row_id == nil then "" else p117.row_id
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3141 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3142, var3143 = protoModule.writeTag(buff, var3141, 1, protoModule.wireTypes.lengthDelimited)
		var3142, var4573 = protoModule.writeString(var3142, var3143, self.title)
		buff = var3142
		var3141 = var3143
	end
	if self.url ~= nil then
		local var3144, var3145 = protoModule.writeTag(buff, var3141, 2, protoModule.wireTypes.lengthDelimited)
		var3144, var4575 = protoModule.writeString(var3144, var3145, self.url)
		buff = var3144
		var3141 = var3145
	end
	if self.destination ~= nil then
		local var3146, var3147 = protoModule.writeTag(buff, var3141, 3, protoModule.wireTypes.lengthDelimited)
		var3146, var4577 = protoModule.writeString(var3146, var3147, self.destination)
		buff = var3146
		var3141 = var3147
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local var3148, var3149 = protoModule.writeTag(buff, var3141, 4, protoModule.wireTypes.lengthDelimited)
		var3148, var4579 = protoModule.writeString(var3148, var3149, self.row_id)
		buff = var3148
		var3141 = var3149
	end
	local buff_1 = buffer.create(var3141)
	buffer.copy(buff_1, 0, buff, 0, var3141)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var3141 = t_117.new()
	local var3142 = 0
	while var3142 < buffer.len(p117) do
		local _ = nil
		local var3143 = nil
		local var3144, var3145, var3146 = protoModule.readTag(p117, var3142)
		local var3147 = var3144
		var3143 = var3145
		var3142 = var3146
		
		if var3143 == protoModule.wireTypes.varint then
			local _ = nil
			local var3148, var3149 = protoModule.readVarInt(p117, var3142)
			local _ = var3148
			var3142 = var3149
			continue
		end
		if var3143 == protoModule.wireTypes.lengthDelimited then
			if var3147 == 1 then
				local _ = nil
				local var3150, var3151 = protoModule.readBuffer(p117, var3142)
				var3142 = var3151
				var3141.title = buffer.tostring(var3150)
			elseif var3147 == 2 then
				local _ = nil
				local var3152, var3153 = protoModule.readBuffer(p117, var3142)
				var3142 = var3153
				var3141.url = buffer.tostring(var3152)
			elseif var3147 == 3 then
				local _ = nil
				local var3154, var3155 = protoModule.readBuffer(p117, var3142)
				var3142 = var3155
				var3141.destination = buffer.tostring(var3154)
			elseif var3147 == 4 then
				local _ = nil
				local var3156, var3157 = protoModule.readBuffer(p117, var3142)
				var3142 = var3157
				var3141.row_id = buffer.tostring(var3156)
			else
				local _ = nil
				local var3158, var3159 = protoModule.readVarInt(p117, var3142)
				var3142 = var3159 + var3158
			end
		elseif var3143 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3160, var3161 = protoModule.readFixed32(p117, var3142)
			local _ = var3160
			var3142 = var3161
		elseif var3143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3162, var3163 = protoModule.readFixed64(p117, var3142)
			local _ = var3162
			var3142 = var3163
		else
			error("Unsupported wire type: " .. var4583)
		end
	end
	return var3141
end

function t_117:jsonEncode()
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

function t_117:jsonDecode()
	-- upvalues: t_117 (ref)
	local var3164 = t_117.new()
	
	if self.title ~= nil then
		var3164.title = self.title
	end
	if self.url ~= nil then
		var3164.url = self.url
	end
	if self.destination ~= nil then
		var3164.destination = self.destination
	end
	if self.row_id ~= nil then
		var3164.row_id = self.row_id
	end
	if self.rowId ~= nil then
		var3164.row_id = self.rowId
	end
	return var3164
end

t_117.descriptor = {
	name = "SettingsRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsRowInputData"
}
t.SettingsRowInputData = t_117
typeRegistryModule.default:register(t.SettingsRowInputData)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p118)
	-- upvalues: t_118 (ref)
	return setmetatable({
		universe_id = if p118 == nil or p118.universe_id == nil then nil else p118.universe_id,
		title = if p118 == nil or p118.title == nil then nil else p118.title,
		subtitle = if p118 == nil or p118.subtitle == nil then nil else p118.subtitle,
		badge_text = if p118 == nil or p118.badge_text == nil then nil else p118.badge_text,
		foreground = if p118 == nil or p118.foreground == nil then nil else p118.foreground,
		background = if p118 == nil or p118.background == nil then nil else p118.background,
		title_image = if p118 == nil or p118.title_image == nil then nil else p118.title_image,
		asset_title = if p118 == nil or p118.asset_title == nil then nil else p118.asset_title,
		asset_subtitle = if p118 == nil or p118.asset_subtitle == nil then nil else p118.asset_subtitle,
		gradient = if p118 == nil or p118.gradient == nil then nil else p118.gradient,
		playable_text = if p118 == nil or p118.playable_text == nil then nil else p118.playable_text,
		collection_id = if p118 == nil or p118.collection_id == nil then nil else p118.collection_id,
		campaign_id = if p118 == nil or p118.campaign_id == nil then nil else p118.campaign_id,
		cohort_id = if p118 == nil or p118.cohort_id == nil then nil else p118.cohort_id,
		sort_id = if p118 == nil or p118.sort_id == nil then nil else p118.sort_id,
		hero_unit_id = if p118 == nil or p118.hero_unit_id == nil then nil else p118.hero_unit_id,
		analytics_id = if p118 == nil or p118.analytics_id == nil then nil else p118.analytics_id,
		is_sponsored = if p118 == nil or p118.is_sponsored == nil then nil else p118.is_sponsored
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3164 = 0
	
	if self.universe_id ~= nil then
		local var3165, var3166 = protoModule.writeTag(buff, var3164, 1, protoModule.wireTypes.lengthDelimited)
		var3165, var4609 = protoModule.writeString(var3165, var3166, self.universe_id)
		buff = var3165
		var3164 = var3166
	end
	if self.title ~= nil then
		local var3167, var3168 = protoModule.writeTag(buff, var3164, 2, protoModule.wireTypes.lengthDelimited)
		var3167, var4611 = protoModule.writeString(var3167, var3168, self.title)
		buff = var3167
		var3164 = var3168
	end
	if self.subtitle ~= nil then
		local var3169, var3170 = protoModule.writeTag(buff, var3164, 3, protoModule.wireTypes.lengthDelimited)
		var3169, var4613 = protoModule.writeString(var3169, var3170, self.subtitle)
		buff = var3169
		var3164 = var3170
	end
	if self.badge_text ~= nil then
		local var3171, var3172 = protoModule.writeTag(buff, var3164, 4, protoModule.wireTypes.lengthDelimited)
		var3171, var4615 = protoModule.writeString(var3171, var3172, self.badge_text)
		buff = var3171
		var3164 = var3172
	end
	if self.foreground ~= nil then
		local var3173 = self.foreground:encode()
		local var3174, var3175 = protoModule.writeTag(buff, var3164, 5, protoModule.wireTypes.lengthDelimited)
		var3174, var4618 = protoModule.writeBuffer(var3174, var3175, var3173, buffer.len(var3173))
		buff = var3174
		var3164 = var3175
	end
	if self.background ~= nil then
		local var3176 = self.background:encode()
		local var3177, var3178 = protoModule.writeTag(buff, var3164, 6, protoModule.wireTypes.lengthDelimited)
		var3177, var4621 = protoModule.writeBuffer(var3177, var3178, var3176, buffer.len(var3176))
		buff = var3177
		var3164 = var3178
	end
	if self.title_image ~= nil then
		local var3179 = self.title_image:encode()
		local var3180, var3181 = protoModule.writeTag(buff, var3164, 7, protoModule.wireTypes.lengthDelimited)
		var3180, var4624 = protoModule.writeBuffer(var3180, var3181, var3179, buffer.len(var3179))
		buff = var3180
		var3164 = var3181
	end
	if self.asset_title ~= nil then
		local var3182, var3183 = protoModule.writeTag(buff, var3164, 8, protoModule.wireTypes.lengthDelimited)
		var3182, var4626 = protoModule.writeString(var3182, var3183, self.asset_title)
		buff = var3182
		var3164 = var3183
	end
	if self.asset_subtitle ~= nil then
		local var3184, var3185 = protoModule.writeTag(buff, var3164, 9, protoModule.wireTypes.lengthDelimited)
		var3184, var4628 = protoModule.writeString(var3184, var3185, self.asset_subtitle)
		buff = var3184
		var3164 = var3185
	end
	if self.gradient ~= nil then
		local var3186 = self.gradient:encode()
		local var3187, var3188 = protoModule.writeTag(buff, var3164, 10, protoModule.wireTypes.lengthDelimited)
		var3187, var4631 = protoModule.writeBuffer(var3187, var3188, var3186, buffer.len(var3186))
		buff = var3187
		var3164 = var3188
	end
	if self.playable_text ~= nil then
		local var3189, var3190 = protoModule.writeTag(buff, var3164, 11, protoModule.wireTypes.lengthDelimited)
		var3189, var4633 = protoModule.writeString(var3189, var3190, self.playable_text)
		buff = var3189
		var3164 = var3190
	end
	if self.collection_id ~= nil then
		local var3191, var3192 = protoModule.writeTag(buff, var3164, 12, protoModule.wireTypes.lengthDelimited)
		var3191, var4635 = protoModule.writeString(var3191, var3192, self.collection_id)
		buff = var3191
		var3164 = var3192
	end
	if self.campaign_id ~= nil then
		local var3193, var3194 = protoModule.writeTag(buff, var3164, 13, protoModule.wireTypes.lengthDelimited)
		var3193, var4637 = protoModule.writeString(var3193, var3194, self.campaign_id)
		buff = var3193
		var3164 = var3194
	end
	if self.cohort_id ~= nil then
		local var3195, var3196 = protoModule.writeTag(buff, var3164, 14, protoModule.wireTypes.lengthDelimited)
		var3195, var4639 = protoModule.writeString(var3195, var3196, self.cohort_id)
		buff = var3195
		var3164 = var3196
	end
	if self.sort_id ~= nil then
		local var3197, var3198 = protoModule.writeTag(buff, var3164, 15, protoModule.wireTypes.lengthDelimited)
		var3197, var4641 = protoModule.writeString(var3197, var3198, self.sort_id)
		buff = var3197
		var3164 = var3198
	end
	if self.hero_unit_id ~= nil then
		local var3199, var3200 = protoModule.writeTag(buff, var3164, 16, protoModule.wireTypes.lengthDelimited)
		var3199, var4643 = protoModule.writeString(var3199, var3200, self.hero_unit_id)
		buff = var3199
		var3164 = var3200
	end
	if self.analytics_id ~= nil then
		local var3201, var3202 = protoModule.writeTag(buff, var3164, 17, protoModule.wireTypes.lengthDelimited)
		var3201, var4645 = protoModule.writeString(var3201, var3202, self.analytics_id)
		buff = var3201
		var3164 = var3202
	end
	if self.is_sponsored ~= nil then
		local var3203, var3204 = protoModule.writeTag(buff, var3164, 18, protoModule.wireTypes.varint)
		var3203, var4647 = protoModule.writeVarInt(var3203, var3204, if self.is_sponsored then 1 else 0)
		buff = var3203
		var3164 = var3204
	end
	local buff_1 = buffer.create(var3164)
	buffer.copy(buff_1, 0, buff, 0, var3164)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var3164 = t_118.new()
	local var3165 = 0
	while var3165 < buffer.len(p118) do
		local _ = nil
		local var3166 = nil
		local var3167, var3168, var3169 = protoModule.readTag(p118, var3165)
		local var3170 = var3167
		var3166 = var3168
		var3165 = var3169
		
		if var3166 == protoModule.wireTypes.varint then
			if var3170 == 18 then
				local _ = nil
				local var3171, var3172 = protoModule.readVarInt(p118, var3165)
				var3165 = var3172
				var3164.is_sponsored = var3171 ~= 0
			else
				local _ = nil
				local var3173, var3174 = protoModule.readVarInt(p118, var3165)
				local _ = var3173
				var3165 = var3174
			end
		end
		if var3166 == protoModule.wireTypes.lengthDelimited then
			if var3170 == 1 then
				local _ = nil
				local var3175, var3176 = protoModule.readBuffer(p118, var3165)
				var3165 = var3176
				var3164.universe_id = buffer.tostring(var3175)
			elseif var3170 == 2 then
				local _ = nil
				local var3177, var3178 = protoModule.readBuffer(p118, var3165)
				var3165 = var3178
				var3164.title = buffer.tostring(var3177)
			elseif var3170 == 3 then
				local _ = nil
				local var3179, var3180 = protoModule.readBuffer(p118, var3165)
				var3165 = var3180
				var3164.subtitle = buffer.tostring(var3179)
			elseif var3170 == 4 then
				local _ = nil
				local var3181, var3182 = protoModule.readBuffer(p118, var3165)
				var3165 = var3182
				var3164.badge_text = buffer.tostring(var3181)
			elseif var3170 == 5 then
				local _ = nil
				local var3183, var3184 = protoModule.readBuffer(p118, var3165)
				var3165 = var3184
				var3164.foreground = t.HeroUnitInputData_VisualAsset.decode(var3183)
			elseif var3170 == 6 then
				local _ = nil
				local var3185, var3186 = protoModule.readBuffer(p118, var3165)
				var3165 = var3186
				var3164.background = t.HeroUnitInputData_VisualAsset.decode(var3185)
			elseif var3170 == 7 then
				local _ = nil
				local var3187, var3188 = protoModule.readBuffer(p118, var3165)
				var3165 = var3188
				var3164.title_image = t.HeroUnitInputData_VisualAsset.decode(var3187)
			elseif var3170 == 8 then
				local _ = nil
				local var3189, var3190 = protoModule.readBuffer(p118, var3165)
				var3165 = var3190
				var3164.asset_title = buffer.tostring(var3189)
			elseif var3170 == 9 then
				local _ = nil
				local var3191, var3192 = protoModule.readBuffer(p118, var3165)
				var3165 = var3192
				var3164.asset_subtitle = buffer.tostring(var3191)
			elseif var3170 == 10 then
				local _ = nil
				local var3193, var3194 = protoModule.readBuffer(p118, var3165)
				var3165 = var3194
				var3164.gradient = t.HeroUnitInputData_Gradient.decode(var3193)
			elseif var3170 == 11 then
				local _ = nil
				local var3195, var3196 = protoModule.readBuffer(p118, var3165)
				var3165 = var3196
				var3164.playable_text = buffer.tostring(var3195)
			elseif var3170 == 12 then
				local _ = nil
				local var3197, var3198 = protoModule.readBuffer(p118, var3165)
				var3165 = var3198
				var3164.collection_id = buffer.tostring(var3197)
			elseif var3170 == 13 then
				local _ = nil
				local var3199, var3200 = protoModule.readBuffer(p118, var3165)
				var3165 = var3200
				var3164.campaign_id = buffer.tostring(var3199)
			elseif var3170 == 14 then
				local _ = nil
				local var3201, var3202 = protoModule.readBuffer(p118, var3165)
				var3165 = var3202
				var3164.cohort_id = buffer.tostring(var3201)
			elseif var3170 == 15 then
				local _ = nil
				local var3203, var3204 = protoModule.readBuffer(p118, var3165)
				var3165 = var3204
				var3164.sort_id = buffer.tostring(var3203)
			elseif var3170 == 16 then
				local _ = nil
				local var3205, var3206 = protoModule.readBuffer(p118, var3165)
				var3165 = var3206
				var3164.hero_unit_id = buffer.tostring(var3205)
			elseif var3170 == 17 then
				local _ = nil
				local var3207, var3208 = protoModule.readBuffer(p118, var3165)
				var3165 = var3208
				var3164.analytics_id = buffer.tostring(var3207)
			else
				local _ = nil
				local var3209, var3210 = protoModule.readVarInt(p118, var3165)
				var3165 = var3210 + var3209
			end
		elseif var3166 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3211, var3212 = protoModule.readFixed32(p118, var3165)
			local _ = var3211
			var3165 = var3212
		elseif var3166 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3213, var3214 = protoModule.readFixed64(p118, var3165)
			local _ = var3213
			var3165 = var3214
		else
			error("Unsupported wire type: " .. var4651)
		end
	end
	return var3164
end

function t_118:jsonEncode()
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

function t_118:jsonDecode()
	-- upvalues: t_118 (ref), t (ref)
	local var3215 = t_118.new()
	
	if self.universe_id ~= nil then
		var3215.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3215.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3215.title = self.title
	end
	if self.subtitle ~= nil then
		var3215.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3215.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3215.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3215.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3215.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3215.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3215.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3215.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3215.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3215.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3215.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3215.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3215.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3215.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3215.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3215.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3215.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3215.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3215.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3215.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3215.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3215.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3215.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3215.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3215.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3215.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3215.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3215.is_sponsored = self.isSponsored
	end
	return var3215
end

t_118.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_118
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p119)
	-- upvalues: t_119 (ref)
	return setmetatable({
		asset_id = if p119 == nil or p119.asset_id == nil then "" else p119.asset_id,
		aspect_ratio = if p119 == nil or p119.aspect_ratio == nil then nil else p119.aspect_ratio,
		enable_animation = if p119 == nil or p119.enable_animation == nil then nil else p119.enable_animation
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3215 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3216, var3217 = protoModule.writeTag(buff, var3215, 1, protoModule.wireTypes.lengthDelimited)
		var3216, var4705 = protoModule.writeString(var3216, var3217, self.asset_id)
		buff = var3216
		var3215 = var3217
	end
	if self.aspect_ratio ~= nil then
		local var3218, var3219 = protoModule.writeTag(buff, var3215, 2, protoModule.wireTypes.i64)
		var3218, var4707 = protoModule.writeDouble(var3218, var3219, self.aspect_ratio)
		buff = var3218
		var3215 = var3219
	end
	if self.enable_animation ~= nil then
		local var3220, var3221 = protoModule.writeTag(buff, var3215, 3, protoModule.wireTypes.varint)
		var3220, var4709 = protoModule.writeVarInt(var3220, var3221, if self.enable_animation then 1 else 0)
		buff = var3220
		var3215 = var3221
	end
	local buff_1 = buffer.create(var3215)
	buffer.copy(buff_1, 0, buff, 0, var3215)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3215 = t_119.new()
	local var3216 = 0
	while var3216 < buffer.len(p119) do
		local _ = nil
		local var3217 = nil
		local var3218, var3219, var3220 = protoModule.readTag(p119, var3216)
		local var3221 = var3218
		var3217 = var3219
		var3216 = var3220
		
		if var3217 == protoModule.wireTypes.varint then
			if var3221 == 3 then
				local _ = nil
				local var3222, var3223 = protoModule.readVarInt(p119, var3216)
				var3216 = var3223
				var3215.enable_animation = var3222 ~= 0
			else
				local _ = nil
				local var3224, var3225 = protoModule.readVarInt(p119, var3216)
				local _ = var3224
				var3216 = var3225
			end
		end
		if var3217 == protoModule.wireTypes.lengthDelimited then
			if var3221 == 1 then
				local _ = nil
				local var3226, var3227 = protoModule.readBuffer(p119, var3216)
				var3216 = var3227
				var3215.asset_id = buffer.tostring(var3226)
			else
				local _ = nil
				local var3228, var3229 = protoModule.readVarInt(p119, var3216)
				var3216 = var3229 + var3228
			end
		elseif var3217 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3230, var3231 = protoModule.readFixed32(p119, var3216)
			local _ = var3230
			var3216 = var3231
		elseif var3217 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4713)
		elseif var3221 == 2 then
			local _ = nil
			local var3232, var3233 = protoModule.readDouble(p119, var3216)
			var3216 = var3233
			var3215.aspect_ratio = var3232
		else
			local _ = nil
			local var3234, var3235 = protoModule.readFixed64(p119, var3216)
			local _ = var3234
			var3216 = var3235
		end
	end
	return var3215
end

function t_119:jsonEncode()
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

function t_119:jsonDecode()
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3236 = t_119.new()
	
	if self.asset_id ~= nil then
		var3236.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3236.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3236.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3236.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3236.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3236.enable_animation = self.enableAnimation
	end
	return var3236
end

t_119.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_119
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		start_color = if p120 == nil or p120.start_color == nil then nil else p120.start_color,
		end_color = if p120 == nil or p120.end_color == nil then nil else p120.end_color,
		start_opacity = if p120 == nil or p120.start_opacity == nil then nil else p120.start_opacity,
		end_opacity = if p120 == nil or p120.end_opacity == nil then nil else p120.end_opacity,
		degree = if p120 == nil or p120.degree == nil then nil else p120.degree
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3236 = 0
	
	if self.start_color ~= nil then
		local var3237, var3238 = protoModule.writeTag(buff, var3236, 1, protoModule.wireTypes.lengthDelimited)
		var3237, var4737 = protoModule.writeString(var3237, var3238, self.start_color)
		buff = var3237
		var3236 = var3238
	end
	if self.end_color ~= nil then
		local var3239, var3240 = protoModule.writeTag(buff, var3236, 2, protoModule.wireTypes.lengthDelimited)
		var3239, var4739 = protoModule.writeString(var3239, var3240, self.end_color)
		buff = var3239
		var3236 = var3240
	end
	if self.start_opacity ~= nil then
		local var3241, var3242 = protoModule.writeTag(buff, var3236, 3, protoModule.wireTypes.i64)
		var3241, var4741 = protoModule.writeDouble(var3241, var3242, self.start_opacity)
		buff = var3241
		var3236 = var3242
	end
	if self.end_opacity ~= nil then
		local var3243, var3244 = protoModule.writeTag(buff, var3236, 4, protoModule.wireTypes.i64)
		var3243, var4743 = protoModule.writeDouble(var3243, var3244, self.end_opacity)
		buff = var3243
		var3236 = var3244
	end
	if self.degree ~= nil then
		local var3245, var3246 = protoModule.writeTag(buff, var3236, 5, protoModule.wireTypes.i64)
		var3245, var4745 = protoModule.writeDouble(var3245, var3246, self.degree)
		buff = var3245
		var3236 = var3246
	end
	local buff_1 = buffer.create(var3236)
	buffer.copy(buff_1, 0, buff, 0, var3236)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3236 = t_120.new()
	local var3237 = 0
	while var3237 < buffer.len(p120) do
		local _ = nil
		local var3238 = nil
		local var3239, var3240, var3241 = protoModule.readTag(p120, var3237)
		local var3242 = var3239
		var3238 = var3240
		var3237 = var3241
		
		if var3238 == protoModule.wireTypes.varint then
			local _ = nil
			local var3243, var3244 = protoModule.readVarInt(p120, var3237)
			local _ = var3243
			var3237 = var3244
			continue
		end
		if var3238 == protoModule.wireTypes.lengthDelimited then
			if var3242 == 1 then
				local _ = nil
				local var3245, var3246 = protoModule.readBuffer(p120, var3237)
				var3237 = var3246
				var3236.start_color = buffer.tostring(var3245)
			elseif var3242 == 2 then
				local _ = nil
				local var3247, var3248 = protoModule.readBuffer(p120, var3237)
				var3237 = var3248
				var3236.end_color = buffer.tostring(var3247)
			else
				local _ = nil
				local var3249, var3250 = protoModule.readVarInt(p120, var3237)
				var3237 = var3250 + var3249
			end
		elseif var3238 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3251, var3252 = protoModule.readFixed32(p120, var3237)
			local _ = var3251
			var3237 = var3252
		elseif var3238 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4749)
		elseif var3242 == 3 then
			local _ = nil
			local var3253, var3254 = protoModule.readDouble(p120, var3237)
			var3237 = var3254
			var3236.start_opacity = var3253
		elseif var3242 == 4 then
			local _ = nil
			local var3255, var3256 = protoModule.readDouble(p120, var3237)
			var3237 = var3256
			var3236.end_opacity = var3255
		elseif var3242 == 5 then
			local _ = nil
			local var3257, var3258 = protoModule.readDouble(p120, var3237)
			var3237 = var3258
			var3236.degree = var3257
		else
			local _ = nil
			local var3259, var3260 = protoModule.readFixed64(p120, var3237)
			local _ = var3259
			var3237 = var3260
		end
	end
	return var3236
end

function t_120:jsonEncode()
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

function t_120:jsonDecode()
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3261 = t_120.new()
	
	if self.start_color ~= nil then
		var3261.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3261.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3261.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3261.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3261.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3261.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3261.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3261.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3261.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3261
end

t_120.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_120
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p121)
	-- upvalues: t_121 (ref)
	return setmetatable({
		items = if p121 == nil or p121.items == nil then {} else p121.items,
		sort_id = if p121 == nil or p121.sort_id == nil then "" else p121.sort_id,
		recommendation_request_id = if p121 == nil or p121.recommendation_request_id == nil then "" else p121.recommendation_request_id
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3261 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3262 = v:encode()
			local var3263, var3264 = protoModule.writeTag(buff, var3261, 1, protoModule.wireTypes.lengthDelimited)
			var3263, var4778 = protoModule.writeBuffer(var3263, var3264, var3262, buffer.len(var3262))
			buff = var3263
			var3261 = var3264
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3265, var3266 = protoModule.writeTag(buff, var3261, 2, protoModule.wireTypes.lengthDelimited)
		var3265, var4780 = protoModule.writeString(var3265, var3266, self.sort_id)
		buff = var3265
		var3261 = var3266
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3267, var3268 = protoModule.writeTag(buff, var3261, 3, protoModule.wireTypes.lengthDelimited)
		var3267, var4782 = protoModule.writeString(var3267, var3268, self.recommendation_request_id)
		buff = var3267
		var3261 = var3268
	end
	local buff_1 = buffer.create(var3261)
	buffer.copy(buff_1, 0, buff, 0, var3261)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var3269 = t_121.new()
	local var3270 = 0
	while var3270 < buffer.len(p121) do
		local _ = nil
		local var3271 = nil
		local var3272, var3273, var3274 = protoModule.readTag(p121, var3270)
		local var3275 = var3272
		var3271 = var3273
		var3270 = var3274
		
		if var3271 == protoModule.wireTypes.varint then
			local _ = nil
			local var3276, var3277 = protoModule.readVarInt(p121, var3270)
			local _ = var3276
			var3270 = var3277
			continue
		end
		if var3271 == protoModule.wireTypes.lengthDelimited then
			if var3275 == 1 then
				local _ = nil
				local var3278, var3279 = protoModule.readBuffer(p121, var3270)
				var3270 = var3279
				table.insert(var3269.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3278))
			elseif var3275 == 2 then
				local _ = nil
				local var3280, var3281 = protoModule.readBuffer(p121, var3270)
				var3270 = var3281
				var3269.sort_id = buffer.tostring(var3280)
			elseif var3275 == 3 then
				local _ = nil
				local var3282, var3283 = protoModule.readBuffer(p121, var3270)
				var3270 = var3283
				var3269.recommendation_request_id = buffer.tostring(var3282)
			else
				local _ = nil
				local var3284, var3285 = protoModule.readVarInt(p121, var3270)
				var3270 = var3285 + var3284
			end
		elseif var3271 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3286, var3287 = protoModule.readFixed32(p121, var3270)
			local _ = var3286
			var3270 = var3287
		elseif var3271 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3288, var3289 = protoModule.readFixed64(p121, var3270)
			local _ = var3288
			var3270 = var3289
		else
			error("Unsupported wire type: " .. var4786)
		end
	end
	return var3269
end

function t_121:jsonEncode()
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

function t_121:jsonDecode()
	-- upvalues: t_121 (ref), t (ref)
	local var3290 = t_121.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3290.items = t_1
	end
	if self.sort_id ~= nil then
		var3290.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3290.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3290.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3290.recommendation_request_id = self.recommendationRequestId
	end
	return var3290
end

t_121.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_121
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p122)
	-- upvalues: t_122 (ref)
	return setmetatable({
		item_id = if p122 == nil or p122.item_id == nil then "" else p122.item_id,
		has_pending_friend_request = if p122 == nil or p122.has_pending_friend_request == nil then false else p122.has_pending_friend_request
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3291 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3292, var3293 = protoModule.writeTag(buff, var3291, 1, protoModule.wireTypes.lengthDelimited)
		var3292, var4812 = protoModule.writeString(var3292, var3293, self.item_id)
		buff = var3292
		var3291 = var3293
	end
	if self.has_pending_friend_request then
		local var3294, var3295 = protoModule.writeTag(buff, var3291, 2, protoModule.wireTypes.varint)
		var3294, var4814 = protoModule.writeVarInt(var3294, var3295, if self.has_pending_friend_request then 1 else 0)
		buff = var3294
		var3291 = var3295
	end
	local buff_1 = buffer.create(var3291)
	buffer.copy(buff_1, 0, buff, 0, var3291)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref)
	local var3291 = t_122.new()
	local var3292 = 0
	while var3292 < buffer.len(p122) do
		local _ = nil
		local var3293 = nil
		local var3294, var3295, var3296 = protoModule.readTag(p122, var3292)
		local var3297 = var3294
		var3293 = var3295
		var3292 = var3296
		
		if var3293 == protoModule.wireTypes.varint then
			if var3297 == 2 then
				local _ = nil
				local var3298, var3299 = protoModule.readVarInt(p122, var3292)
				var3292 = var3299
				var3291.has_pending_friend_request = var3298 ~= 0
			else
				local _ = nil
				local var3300, var3301 = protoModule.readVarInt(p122, var3292)
				local _ = var3300
				var3292 = var3301
			end
		end
		if var3293 == protoModule.wireTypes.lengthDelimited then
			if var3297 == 1 then
				local _ = nil
				local var3302, var3303 = protoModule.readBuffer(p122, var3292)
				var3292 = var3303
				var3291.item_id = buffer.tostring(var3302)
			else
				local _ = nil
				local var3304, var3305 = protoModule.readVarInt(p122, var3292)
				var3292 = var3305 + var3304
			end
		elseif var3293 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3306, var3307 = protoModule.readFixed32(p122, var3292)
			local _ = var3306
			var3292 = var3307
		elseif var3293 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3308, var3309 = protoModule.readFixed64(p122, var3292)
			local _ = var3308
			var3292 = var3309
		else
			error("Unsupported wire type: " .. var4818)
		end
	end
	return var3291
end

function t_122:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function t_122:jsonDecode()
	-- upvalues: t_122 (ref)
	local var3310 = t_122.new()
	
	if self.item_id ~= nil then
		var3310.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3310.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3310.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3310.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3310
end

t_122.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_122
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p123)
	-- upvalues: t_123 (ref)
	return setmetatable({
		selected_option = if p123 == nil or p123.selected_option == nil then "" else p123.selected_option,
		sort_id = if p123 == nil or p123.sort_id == nil then "" else p123.sort_id,
		options = if p123 == nil or p123.options == nil then {} else p123.options,
		experience_carousel = if p123 == nil or p123.experience_carousel == nil then nil else p123.experience_carousel,
		feed_item_key = if p123 == nil or p123.feed_item_key == nil then "" else p123.feed_item_key
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3310 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3311, var3312 = protoModule.writeTag(buff, var3310, 1, protoModule.wireTypes.lengthDelimited)
		var3311, var4840 = protoModule.writeString(var3311, var3312, self.selected_option)
		buff = var3311
		var3310 = var3312
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3313, var3314 = protoModule.writeTag(buff, var3310, 2, protoModule.wireTypes.lengthDelimited)
		var3313, var4842 = protoModule.writeString(var3313, var3314, self.sort_id)
		buff = var3313
		var3310 = var3314
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3315 = v:encode()
			local var3316, var3317 = protoModule.writeTag(buff, var3310, 3, protoModule.wireTypes.lengthDelimited)
			var3316, var4845 = protoModule.writeBuffer(var3316, var3317, var3315, buffer.len(var3315))
			buff = var3316
			var3310 = var3317
		end
	end
	if self.experience_carousel ~= nil then
		local var3318 = self.experience_carousel:encode()
		local var3319, var3320 = protoModule.writeTag(buff, var3310, 4, protoModule.wireTypes.lengthDelimited)
		var3319, var4848 = protoModule.writeBuffer(var3319, var3320, var3318, buffer.len(var3318))
		buff = var3319
		var3310 = var3320
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3321, var3322 = protoModule.writeTag(buff, var3310, 5, protoModule.wireTypes.lengthDelimited)
		var3321, var4850 = protoModule.writeString(var3321, var3322, self.feed_item_key)
		buff = var3321
		var3310 = var3322
	end
	local buff_1 = buffer.create(var3310)
	buffer.copy(buff_1, 0, buff, 0, var3310)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var3323 = t_123.new()
	local var3324 = 0
	while var3324 < buffer.len(p123) do
		local _ = nil
		local var3325 = nil
		local var3326, var3327, var3328 = protoModule.readTag(p123, var3324)
		local var3329 = var3326
		var3325 = var3327
		var3324 = var3328
		
		if var3325 == protoModule.wireTypes.varint then
			local _ = nil
			local var3330, var3331 = protoModule.readVarInt(p123, var3324)
			local _ = var3330
			var3324 = var3331
			continue
		end
		if var3325 == protoModule.wireTypes.lengthDelimited then
			if var3329 == 1 then
				local _ = nil
				local var3332, var3333 = protoModule.readBuffer(p123, var3324)
				var3324 = var3333
				var3323.selected_option = buffer.tostring(var3332)
			elseif var3329 == 2 then
				local _ = nil
				local var3334, var3335 = protoModule.readBuffer(p123, var3324)
				var3324 = var3335
				var3323.sort_id = buffer.tostring(var3334)
			elseif var3329 == 3 then
				local _ = nil
				local var3336, var3337 = protoModule.readBuffer(p123, var3324)
				var3324 = var3337
				table.insert(var3323.options, t.SelectorOption.decode(var3336))
			elseif var3329 == 4 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p123, var3324)
				var3324 = var3339
				var3323.experience_carousel = t.ExperienceCarouselInputData.decode(var3338)
			elseif var3329 == 5 then
				local _ = nil
				local var3340, var3341 = protoModule.readBuffer(p123, var3324)
				var3324 = var3341
				var3323.feed_item_key = buffer.tostring(var3340)
			else
				local _ = nil
				local var3342, var3343 = protoModule.readVarInt(p123, var3324)
				var3324 = var3343 + var3342
			end
		elseif var3325 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3344, var3345 = protoModule.readFixed32(p123, var3324)
			local _ = var3344
			var3324 = var3345
		elseif var3325 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3346, var3347 = protoModule.readFixed64(p123, var3324)
			local _ = var3346
			var3324 = var3347
		else
			error("Unsupported wire type: " .. var4854)
		end
	end
	return var3323
end

function t_123:jsonEncode()
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

function t_123:jsonDecode()
	-- upvalues: t_123 (ref), t (ref)
	local var3348 = t_123.new()
	
	if self.selected_option ~= nil then
		var3348.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3348.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3348.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3348.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3348.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3348.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3348.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3348.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3348.feed_item_key = self.feedItemKey
	end
	return var3348
end

t_123.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_123
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p124)
	-- upvalues: t_124 (ref)
	return setmetatable({
		id = if p124 == nil or p124.id == nil then "" else p124.id,
		display_name = if p124 == nil or p124.display_name == nil then "" else p124.display_name,
		is_selected = if p124 == nil or p124.is_selected == nil then false else p124.is_selected
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3349 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3350, var3351 = protoModule.writeTag(buff, var3349, 1, protoModule.wireTypes.lengthDelimited)
		var3350, var4884 = protoModule.writeString(var3350, var3351, self.id)
		buff = var3350
		var3349 = var3351
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3352, var3353 = protoModule.writeTag(buff, var3349, 2, protoModule.wireTypes.lengthDelimited)
		var3352, var4886 = protoModule.writeString(var3352, var3353, self.display_name)
		buff = var3352
		var3349 = var3353
	end
	if self.is_selected then
		local var3354, var3355 = protoModule.writeTag(buff, var3349, 3, protoModule.wireTypes.varint)
		var3354, var4888 = protoModule.writeVarInt(var3354, var3355, if self.is_selected then 1 else 0)
		buff = var3354
		var3349 = var3355
	end
	local buff_1 = buffer.create(var3349)
	buffer.copy(buff_1, 0, buff, 0, var3349)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3349 = t_124.new()
	local var3350 = 0
	while var3350 < buffer.len(p124) do
		local _ = nil
		local var3351 = nil
		local var3352, var3353, var3354 = protoModule.readTag(p124, var3350)
		local var3355 = var3352
		var3351 = var3353
		var3350 = var3354
		
		if var3351 == protoModule.wireTypes.varint then
			if var3355 == 3 then
				local _ = nil
				local var3356, var3357 = protoModule.readVarInt(p124, var3350)
				var3350 = var3357
				var3349.is_selected = var3356 ~= 0
			else
				local _ = nil
				local var3358, var3359 = protoModule.readVarInt(p124, var3350)
				local _ = var3358
				var3350 = var3359
			end
		end
		if var3351 == protoModule.wireTypes.lengthDelimited then
			if var3355 == 1 then
				local _ = nil
				local var3360, var3361 = protoModule.readBuffer(p124, var3350)
				var3350 = var3361
				var3349.id = buffer.tostring(var3360)
			elseif var3355 == 2 then
				local _ = nil
				local var3362, var3363 = protoModule.readBuffer(p124, var3350)
				var3350 = var3363
				var3349.display_name = buffer.tostring(var3362)
			else
				local _ = nil
				local var3364, var3365 = protoModule.readVarInt(p124, var3350)
				var3350 = var3365 + var3364
			end
		elseif var3351 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3366, var3367 = protoModule.readFixed32(p124, var3350)
			local _ = var3366
			var3350 = var3367
		elseif var3351 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3368, var3369 = protoModule.readFixed64(p124, var3350)
			local _ = var3368
			var3350 = var3369
		else
			error("Unsupported wire type: " .. var4892)
		end
	end
	return var3349
end

function t_124:jsonEncode()
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

function t_124:jsonDecode()
	-- upvalues: t_124 (ref)
	local var3370 = t_124.new()
	
	if self.id ~= nil then
		var3370.id = self.id
	end
	if self.display_name ~= nil then
		var3370.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3370.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3370.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3370.is_selected = self.isSelected
	end
	return var3370
end

t_124.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_124
typeRegistryModule.default:register(t.SelectorOption)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p125)
	-- upvalues: t_125 (ref)
	return setmetatable({
		cards = if p125 == nil or p125.cards == nil then {} else p125.cards,
		title = if p125 == nil or p125.title == nil then "" else p125.title,
		sort_id = if p125 == nil or p125.sort_id == nil then nil else p125.sort_id
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3370 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3371 = v:encode()
			local var3372, var3373 = protoModule.writeTag(buff, var3370, 1, protoModule.wireTypes.lengthDelimited)
			var3372, var4917 = protoModule.writeBuffer(var3372, var3373, var3371, buffer.len(var3371))
			buff = var3372
			var3370 = var3373
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3374, var3375 = protoModule.writeTag(buff, var3370, 2, protoModule.wireTypes.lengthDelimited)
		var3374, var4919 = protoModule.writeString(var3374, var3375, self.title)
		buff = var3374
		var3370 = var3375
	end
	if self.sort_id ~= nil then
		local var3376, var3377 = protoModule.writeTag(buff, var3370, 3, protoModule.wireTypes.lengthDelimited)
		var3376, var4921 = protoModule.writeString(var3376, var3377, self.sort_id)
		buff = var3376
		var3370 = var3377
	end
	local buff_1 = buffer.create(var3370)
	buffer.copy(buff_1, 0, buff, 0, var3370)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3378 = t_125.new()
	local var3379 = 0
	while var3379 < buffer.len(p125) do
		local _ = nil
		local var3380 = nil
		local var3381, var3382, var3383 = protoModule.readTag(p125, var3379)
		local var3384 = var3381
		var3380 = var3382
		var3379 = var3383
		
		if var3380 == protoModule.wireTypes.varint then
			local _ = nil
			local var3385, var3386 = protoModule.readVarInt(p125, var3379)
			local _ = var3385
			var3379 = var3386
			continue
		end
		if var3380 == protoModule.wireTypes.lengthDelimited then
			if var3384 == 1 then
				local _ = nil
				local var3387, var3388 = protoModule.readBuffer(p125, var3379)
				var3379 = var3388
				table.insert(var3378.cards, t.GameItemsCardInputData.decode(var3387))
			elseif var3384 == 2 then
				local _ = nil
				local var3389, var3390 = protoModule.readBuffer(p125, var3379)
				var3379 = var3390
				var3378.title = buffer.tostring(var3389)
			elseif var3384 == 3 then
				local _ = nil
				local var3391, var3392 = protoModule.readBuffer(p125, var3379)
				var3379 = var3392
				var3378.sort_id = buffer.tostring(var3391)
			else
				local _ = nil
				local var3393, var3394 = protoModule.readVarInt(p125, var3379)
				var3379 = var3394 + var3393
			end
		elseif var3380 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3395, var3396 = protoModule.readFixed32(p125, var3379)
			local _ = var3395
			var3379 = var3396
		elseif var3380 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3397, var3398 = protoModule.readFixed64(p125, var3379)
			local _ = var3397
			var3379 = var3398
		else
			error("Unsupported wire type: " .. var4925)
		end
	end
	return var3378
end

function t_125:jsonEncode()
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

function t_125:jsonDecode()
	-- upvalues: t_125 (ref), t (ref)
	local var3399 = t_125.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3399.cards = t_1
	end
	if self.title ~= nil then
		var3399.title = self.title
	end
	if self.sort_id ~= nil then
		var3399.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3399.sort_id = self.sortId
	end
	return var3399
end

t_125.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_125
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p126)
	-- upvalues: t_126 (ref)
	return setmetatable({
		universe_id = if p126 == nil or p126.universe_id == nil then "" else p126.universe_id,
		items = if p126 == nil or p126.items == nil then {} else p126.items
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3400 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3401, var3402 = protoModule.writeTag(buff, var3400, 1, protoModule.wireTypes.lengthDelimited)
		var3401, var4951 = protoModule.writeString(var3401, var3402, self.universe_id)
		buff = var3401
		var3400 = var3402
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3403 = v:encode()
			local var3404, var3405 = protoModule.writeTag(buff, var3400, 2, protoModule.wireTypes.lengthDelimited)
			var3404, var4954 = protoModule.writeBuffer(var3404, var3405, var3403, buffer.len(var3403))
			buff = var3404
			var3400 = var3405
		end
	end
	local buff_1 = buffer.create(var3400)
	buffer.copy(buff_1, 0, buff, 0, var3400)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref), t (ref)
	local var3406 = t_126.new()
	local var3407 = 0
	while var3407 < buffer.len(p126) do
		local _ = nil
		local var3408 = nil
		local var3409, var3410, var3411 = protoModule.readTag(p126, var3407)
		local var3412 = var3409
		var3408 = var3410
		var3407 = var3411
		
		if var3408 == protoModule.wireTypes.varint then
			local _ = nil
			local var3413, var3414 = protoModule.readVarInt(p126, var3407)
			local _ = var3413
			var3407 = var3414
			continue
		end
		if var3408 == protoModule.wireTypes.lengthDelimited then
			if var3412 == 1 then
				local _ = nil
				local var3415, var3416 = protoModule.readBuffer(p126, var3407)
				var3407 = var3416
				var3406.universe_id = buffer.tostring(var3415)
			elseif var3412 == 2 then
				local _ = nil
				local var3417, var3418 = protoModule.readBuffer(p126, var3407)
				var3407 = var3418
				table.insert(var3406.items, t.GameItemInputData.decode(var3417))
			else
				local _ = nil
				local var3419, var3420 = protoModule.readVarInt(p126, var3407)
				var3407 = var3420 + var3419
			end
		elseif var3408 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3421, var3422 = protoModule.readFixed32(p126, var3407)
			local _ = var3421
			var3407 = var3422
		elseif var3408 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3423, var3424 = protoModule.readFixed64(p126, var3407)
			local _ = var3423
			var3407 = var3424
		else
			error("Unsupported wire type: " .. var4958)
		end
	end
	return var3406
end

function t_126:jsonEncode()
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

function t_126:jsonDecode()
	-- upvalues: t_126 (ref), t (ref)
	local var3425 = t_126.new()
	
	if self.universe_id ~= nil then
		var3425.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3425.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3425.items = t_1
	end
	return var3425
end

t_126.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_126
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p127)
	-- upvalues: t_127 (ref)
	return setmetatable({
		item_id = if p127 == nil or p127.item_id == nil then "" else p127.item_id,
		item_type = if p127 == nil or p127.item_type == nil then "" else p127.item_type
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3426 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3427, var3428 = protoModule.writeTag(buff, var3426, 1, protoModule.wireTypes.lengthDelimited)
		var3427, var4982 = protoModule.writeString(var3427, var3428, self.item_id)
		buff = var3427
		var3426 = var3428
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3429, var3430 = protoModule.writeTag(buff, var3426, 2, protoModule.wireTypes.lengthDelimited)
		var3429, var4984 = protoModule.writeString(var3429, var3430, self.item_type)
		buff = var3429
		var3426 = var3430
	end
	local buff_1 = buffer.create(var3426)
	buffer.copy(buff_1, 0, buff, 0, var3426)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3426 = t_127.new()
	local var3427 = 0
	while var3427 < buffer.len(p127) do
		local _ = nil
		local var3428 = nil
		local var3429, var3430, var3431 = protoModule.readTag(p127, var3427)
		local var3432 = var3429
		var3428 = var3430
		var3427 = var3431
		
		if var3428 == protoModule.wireTypes.varint then
			local _ = nil
			local var3433, var3434 = protoModule.readVarInt(p127, var3427)
			local _ = var3433
			var3427 = var3434
			continue
		end
		if var3428 == protoModule.wireTypes.lengthDelimited then
			if var3432 == 1 then
				local _ = nil
				local var3435, var3436 = protoModule.readBuffer(p127, var3427)
				var3427 = var3436
				var3426.item_id = buffer.tostring(var3435)
			elseif var3432 == 2 then
				local _ = nil
				local var3437, var3438 = protoModule.readBuffer(p127, var3427)
				var3427 = var3438
				var3426.item_type = buffer.tostring(var3437)
			else
				local _ = nil
				local var3439, var3440 = protoModule.readVarInt(p127, var3427)
				var3427 = var3440 + var3439
			end
		elseif var3428 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3441, var3442 = protoModule.readFixed32(p127, var3427)
			local _ = var3441
			var3427 = var3442
		elseif var3428 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3443, var3444 = protoModule.readFixed64(p127, var3427)
			local _ = var3443
			var3427 = var3444
		else
			error("Unsupported wire type: " .. var4988)
		end
	end
	return var3426
end

function t_127:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_127:jsonDecode()
	-- upvalues: t_127 (ref)
	local var3445 = t_127.new()
	
	if self.item_id ~= nil then
		var3445.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3445.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3445.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3445.item_type = self.itemType
	end
	return var3445
end

t_127.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_127
typeRegistryModule.default:register(t.GameItemInputData)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p128)
	-- upvalues: t_128 (ref)
	return setmetatable({
		clickout_url = if p128 == nil or p128.clickout_url == nil then "" else p128.clickout_url,
		native_ad_data = if p128 == nil or p128.native_ad_data == nil then "" else p128.native_ad_data,
		payer_name = if p128 == nil or p128.payer_name == nil then nil else p128.payer_name,
		logo_asset_id = if p128 == nil or p128.logo_asset_id == nil then nil else p128.logo_asset_id,
		logo_aspect_ratio = if p128 == nil or p128.logo_aspect_ratio == nil then nil else p128.logo_aspect_ratio,
		cta_text = if p128 == nil or p128.cta_text == nil then nil else p128.cta_text,
		title = if p128 == nil or p128.title == nil then nil else p128.title,
		subtitle = if p128 == nil or p128.subtitle == nil then nil else p128.subtitle,
		image_asset_id = if p128 == nil or p128.image_asset_id == nil then nil else p128.image_asset_id,
		video_asset_id = if p128 == nil or p128.video_asset_id == nil then nil else p128.video_asset_id,
		badge_text = if p128 == nil or p128.badge_text == nil then nil else p128.badge_text,
		badge_analytics_id = if p128 == nil or p128.badge_analytics_id == nil then nil else p128.badge_analytics_id,
		roblox_component = if p128 == nil or p128.roblox_component == nil then nil else p128.roblox_component
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3445 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3446, var3447 = protoModule.writeTag(buff, var3445, 1, protoModule.wireTypes.lengthDelimited)
		var3446, var5010 = protoModule.writeString(var3446, var3447, self.clickout_url)
		buff = var3446
		var3445 = var3447
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3448, var3449 = protoModule.writeTag(buff, var3445, 2, protoModule.wireTypes.lengthDelimited)
		var3448, var5012 = protoModule.writeString(var3448, var3449, self.native_ad_data)
		buff = var3448
		var3445 = var3449
	end
	if self.payer_name ~= nil then
		local var3450, var3451 = protoModule.writeTag(buff, var3445, 3, protoModule.wireTypes.lengthDelimited)
		var3450, var5014 = protoModule.writeString(var3450, var3451, self.payer_name)
		buff = var3450
		var3445 = var3451
	end
	if self.logo_asset_id ~= nil then
		local var3452, var3453 = protoModule.writeTag(buff, var3445, 4, protoModule.wireTypes.lengthDelimited)
		var3452, var5016 = protoModule.writeString(var3452, var3453, self.logo_asset_id)
		buff = var3452
		var3445 = var3453
	end
	if self.logo_aspect_ratio ~= nil then
		local var3454, var3455 = protoModule.writeTag(buff, var3445, 5, protoModule.wireTypes.i64)
		var3454, var5018 = protoModule.writeDouble(var3454, var3455, self.logo_aspect_ratio)
		buff = var3454
		var3445 = var3455
	end
	if self.cta_text ~= nil then
		local var3456, var3457 = protoModule.writeTag(buff, var3445, 6, protoModule.wireTypes.lengthDelimited)
		var3456, var5020 = protoModule.writeString(var3456, var3457, self.cta_text)
		buff = var3456
		var3445 = var3457
	end
	if self.title ~= nil then
		local var3458, var3459 = protoModule.writeTag(buff, var3445, 7, protoModule.wireTypes.lengthDelimited)
		var3458, var5022 = protoModule.writeString(var3458, var3459, self.title)
		buff = var3458
		var3445 = var3459
	end
	if self.subtitle ~= nil then
		local var3460, var3461 = protoModule.writeTag(buff, var3445, 8, protoModule.wireTypes.lengthDelimited)
		var3460, var5024 = protoModule.writeString(var3460, var3461, self.subtitle)
		buff = var3460
		var3445 = var3461
	end
	if self.image_asset_id ~= nil then
		local var3462, var3463 = protoModule.writeTag(buff, var3445, 9, protoModule.wireTypes.lengthDelimited)
		var3462, var5026 = protoModule.writeString(var3462, var3463, self.image_asset_id)
		buff = var3462
		var3445 = var3463
	end
	if self.video_asset_id ~= nil then
		local var3464, var3465 = protoModule.writeTag(buff, var3445, 10, protoModule.wireTypes.lengthDelimited)
		var3464, var5028 = protoModule.writeString(var3464, var3465, self.video_asset_id)
		buff = var3464
		var3445 = var3465
	end
	if self.badge_text ~= nil then
		local var3466, var3467 = protoModule.writeTag(buff, var3445, 11, protoModule.wireTypes.lengthDelimited)
		var3466, var5030 = protoModule.writeString(var3466, var3467, self.badge_text)
		buff = var3466
		var3445 = var3467
	end
	if self.badge_analytics_id ~= nil then
		local var3468, var3469 = protoModule.writeTag(buff, var3445, 12, protoModule.wireTypes.lengthDelimited)
		var3468, var5032 = protoModule.writeString(var3468, var3469, self.badge_analytics_id)
		buff = var3468
		var3445 = var3469
	end
	if self.roblox_component ~= nil then
		local var3470, var3471 = protoModule.writeTag(buff, var3445, 13, protoModule.wireTypes.lengthDelimited)
		var3470, var5034 = protoModule.writeString(var3470, var3471, self.roblox_component)
		buff = var3470
		var3445 = var3471
	end
	local buff_1 = buffer.create(var3445)
	buffer.copy(buff_1, 0, buff, 0, var3445)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref)
	local var3445 = t_128.new()
	local var3446 = 0
	while var3446 < buffer.len(p128) do
		local _ = nil
		local var3447 = nil
		local var3448, var3449, var3450 = protoModule.readTag(p128, var3446)
		local var3451 = var3448
		var3447 = var3449
		var3446 = var3450
		
		if var3447 == protoModule.wireTypes.varint then
			local _ = nil
			local var3452, var3453 = protoModule.readVarInt(p128, var3446)
			local _ = var3452
			var3446 = var3453
			continue
		end
		if var3447 == protoModule.wireTypes.lengthDelimited then
			if var3451 == 1 then
				local _ = nil
				local var3454, var3455 = protoModule.readBuffer(p128, var3446)
				var3446 = var3455
				var3445.clickout_url = buffer.tostring(var3454)
			elseif var3451 == 2 then
				local _ = nil
				local var3456, var3457 = protoModule.readBuffer(p128, var3446)
				var3446 = var3457
				var3445.native_ad_data = buffer.tostring(var3456)
			elseif var3451 == 3 then
				local _ = nil
				local var3458, var3459 = protoModule.readBuffer(p128, var3446)
				var3446 = var3459
				var3445.payer_name = buffer.tostring(var3458)
			elseif var3451 == 4 then
				local _ = nil
				local var3460, var3461 = protoModule.readBuffer(p128, var3446)
				var3446 = var3461
				var3445.logo_asset_id = buffer.tostring(var3460)
			elseif var3451 == 6 then
				local _ = nil
				local var3462, var3463 = protoModule.readBuffer(p128, var3446)
				var3446 = var3463
				var3445.cta_text = buffer.tostring(var3462)
			elseif var3451 == 7 then
				local _ = nil
				local var3464, var3465 = protoModule.readBuffer(p128, var3446)
				var3446 = var3465
				var3445.title = buffer.tostring(var3464)
			elseif var3451 == 8 then
				local _ = nil
				local var3466, var3467 = protoModule.readBuffer(p128, var3446)
				var3446 = var3467
				var3445.subtitle = buffer.tostring(var3466)
			elseif var3451 == 9 then
				local _ = nil
				local var3468, var3469 = protoModule.readBuffer(p128, var3446)
				var3446 = var3469
				var3445.image_asset_id = buffer.tostring(var3468)
			elseif var3451 == 10 then
				local _ = nil
				local var3470, var3471 = protoModule.readBuffer(p128, var3446)
				var3446 = var3471
				var3445.video_asset_id = buffer.tostring(var3470)
			elseif var3451 == 11 then
				local _ = nil
				local var3472, var3473 = protoModule.readBuffer(p128, var3446)
				var3446 = var3473
				var3445.badge_text = buffer.tostring(var3472)
			elseif var3451 == 12 then
				local _ = nil
				local var3474, var3475 = protoModule.readBuffer(p128, var3446)
				var3446 = var3475
				var3445.badge_analytics_id = buffer.tostring(var3474)
			elseif var3451 == 13 then
				local _ = nil
				local var3476, var3477 = protoModule.readBuffer(p128, var3446)
				var3446 = var3477
				var3445.roblox_component = buffer.tostring(var3476)
			else
				local _ = nil
				local var3478, var3479 = protoModule.readVarInt(p128, var3446)
				var3446 = var3479 + var3478
			end
		elseif var3447 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3480, var3481 = protoModule.readFixed32(p128, var3446)
			local _ = var3480
			var3446 = var3481
		elseif var3447 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5038)
		elseif var3451 == 5 then
			local _ = nil
			local var3482, var3483 = protoModule.readDouble(p128, var3446)
			var3446 = var3483
			var3445.logo_aspect_ratio = var3482
		else
			local _ = nil
			local var3484, var3485 = protoModule.readFixed64(p128, var3446)
			local _ = var3484
			var3446 = var3485
		end
	end
	return var3445
end

function t_128:jsonEncode()
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
	return t
end

function t_128:jsonDecode()
	-- upvalues: t_128 (ref), protoModule (ref)
	local var3486 = t_128.new()
	
	if self.clickout_url ~= nil then
		var3486.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3486.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3486.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3486.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3486.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3486.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3486.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3486.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3486.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3486.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3486.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3486.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3486.title = self.title
	end
	if self.subtitle ~= nil then
		var3486.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3486.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3486.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3486.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3486.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3486.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3486.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3486.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3486.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3486.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3486.roblox_component = self.robloxComponent
	end
	return var3486
end

t_128.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = t_128
typeRegistryModule.default:register(t.AdLinkItem)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p129)
	-- upvalues: t_129 (ref)
	return setmetatable({
		layout = if p129 == nil or p129.layout == nil then nil else p129.layout,
		kind = if p129 == nil or p129.kind == nil then nil else p129.kind
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3486 = 0
	
	if self.layout ~= nil then
		local var3487 = self.layout:encode()
		local var3488, var3489 = protoModule.writeTag(buff, var3486, 1, protoModule.wireTypes.lengthDelimited)
		var3488, var5083 = protoModule.writeBuffer(var3488, var3489, var3487, buffer.len(var3487))
		buff = var3488
		var3486 = var3489
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3490 = self.kind.value:encode()
			local var3491, var3492 = protoModule.writeTag(buff, var3486, 2, protoModule.wireTypes.lengthDelimited)
			var3491, var5086 = protoModule.writeBuffer(var3491, var3492, var3490, buffer.len(var3490))
			buff = var3491
			var3486 = var3492
		elseif self.kind.type == "ad_link" then
			local var3493 = self.kind.value:encode()
			local var3494, var3495 = protoModule.writeTag(buff, var3486, 3, protoModule.wireTypes.lengthDelimited)
			var3494, var5089 = protoModule.writeBuffer(var3494, var3495, var3493, buffer.len(var3493))
			buff = var3494
			var3486 = var3495
		end
	end
	local buff_1 = buffer.create(var3486)
	buffer.copy(buff_1, 0, buff, 0, var3486)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3486 = t_129.new()
	local var3487 = 0
	while var3487 < buffer.len(p129) do
		local _ = nil
		local var3488 = nil
		local var3489, var3490, var3491 = protoModule.readTag(p129, var3487)
		local var3492 = var3489
		var3488 = var3490
		var3487 = var3491
		
		if var3488 == protoModule.wireTypes.varint then
			local _ = nil
			local var3493, var3494 = protoModule.readVarInt(p129, var3487)
			local _ = var3493
			var3487 = var3494
			continue
		end
		if var3488 == protoModule.wireTypes.lengthDelimited then
			if var3492 == 1 then
				local _ = nil
				local var3495, var3496 = protoModule.readBuffer(p129, var3487)
				var3487 = var3496
				var3486.layout = t.ItemLayout.decode(var3495)
			elseif var3492 == 2 then
				local _ = nil
				local var3497, var3498 = protoModule.readBuffer(p129, var3487)
				var3487 = var3498
				var3486.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3497)
				}
			elseif var3492 == 3 then
				local _ = nil
				local var3499, var3500 = protoModule.readBuffer(p129, var3487)
				var3487 = var3500
				var3486.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3499) }
			else
				local _ = nil
				local var3501, var3502 = protoModule.readVarInt(p129, var3487)
				var3487 = var3502 + var3501
			end
		elseif var3488 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3503, var3504 = protoModule.readFixed32(p129, var3487)
			local _ = var3503
			var3487 = var3504
		elseif var3488 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3505, var3506 = protoModule.readFixed64(p129, var3487)
			local _ = var3505
			var3487 = var3506
		else
			error("Unsupported wire type: " .. var5093)
		end
	end
	return var3486
end

function t_129:jsonEncode()
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

function t_129:jsonDecode()
	-- upvalues: t_129 (ref), t (ref)
	local var3507 = t_129.new()
	
	if self.layout ~= nil then
		var3507.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3507.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3507.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3507.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3507
end

t_129.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_129
typeRegistryModule.default:register(t.ItemWithLayout)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p130)
	-- upvalues: t_130 (ref)
	return setmetatable({
		items = if p130 == nil or p130.items == nil then {} else p130.items,
		collection_item_size = if p130 == nil or p130.collection_item_size == nil then nil else p130.collection_item_size
	}, t_130)
end

function t_130:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3507 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3508 = v:encode()
			local var3509, var3510 = protoModule.writeTag(buff, var3507, 1, protoModule.wireTypes.lengthDelimited)
			var3509, var5118 = protoModule.writeBuffer(var3509, var3510, var3508, buffer.len(var3508))
			buff = var3509
			var3507 = var3510
		end
	end
	if self.collection_item_size ~= nil then
		local var3511, var3512 = protoModule.writeTag(buff, var3507, 2, protoModule.wireTypes.lengthDelimited)
		var3511, var5120 = protoModule.writeString(var3511, var3512, self.collection_item_size)
		buff = var3511
		var3507 = var3512
	end
	local buff_1 = buffer.create(var3507)
	buffer.copy(buff_1, 0, buff, 0, var3507)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var3513 = t_130.new()
	local var3514 = 0
	while var3514 < buffer.len(p130) do
		local _ = nil
		local var3515 = nil
		local var3516, var3517, var3518 = protoModule.readTag(p130, var3514)
		local var3519 = var3516
		var3515 = var3517
		var3514 = var3518
		
		if var3515 == protoModule.wireTypes.varint then
			local _ = nil
			local var3520, var3521 = protoModule.readVarInt(p130, var3514)
			local _ = var3520
			var3514 = var3521
			continue
		end
		if var3515 == protoModule.wireTypes.lengthDelimited then
			if var3519 == 1 then
				local _ = nil
				local var3522, var3523 = protoModule.readBuffer(p130, var3514)
				var3514 = var3523
				table.insert(var3513.items, t.ItemWithLayout.decode(var3522))
			elseif var3519 == 2 then
				local _ = nil
				local var3524, var3525 = protoModule.readBuffer(p130, var3514)
				var3514 = var3525
				var3513.collection_item_size = buffer.tostring(var3524)
			else
				local _ = nil
				local var3526, var3527 = protoModule.readVarInt(p130, var3514)
				var3514 = var3527 + var3526
			end
		elseif var3515 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3528, var3529 = protoModule.readFixed32(p130, var3514)
			local _ = var3528
			var3514 = var3529
		elseif var3515 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3530, var3531 = protoModule.readFixed64(p130, var3514)
			local _ = var3530
			var3514 = var3531
		else
			error("Unsupported wire type: " .. var5124)
		end
	end
	return var3513
end

function t_130:jsonEncode()
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

function t_130:jsonDecode()
	-- upvalues: t_130 (ref), t (ref)
	local var3532 = t_130.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3532.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3532.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3532.collection_item_size = self.collectionItemSize
	end
	return var3532
end

t_130.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_130
typeRegistryModule.default:register(t.ContentPool)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p131)
	-- upvalues: t_131 (ref)
	return setmetatable({
		col_span = if p131 == nil or p131.col_span == nil then 0 else p131.col_span,
		row_span = if p131 == nil or p131.row_span == nil then 0 else p131.row_span,
		alignment_type = if p131 == nil or p131.alignment_type == nil then "" else p131.alignment_type,
		min_row_padding = if p131 == nil or p131.min_row_padding == nil then 0 else p131.min_row_padding
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3533 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3534, var3535 = protoModule.writeTag(buff, var3533, 1, protoModule.wireTypes.varint)
		var3534, var5148 = protoModule.writeVarInt(var3534, var3535, self.col_span)
		buff = var3534
		var3533 = var3535
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3536, var3537 = protoModule.writeTag(buff, var3533, 2, protoModule.wireTypes.varint)
		var3536, var5150 = protoModule.writeVarInt(var3536, var3537, self.row_span)
		buff = var3536
		var3533 = var3537
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3538, var3539 = protoModule.writeTag(buff, var3533, 3, protoModule.wireTypes.lengthDelimited)
		var3538, var5152 = protoModule.writeString(var3538, var3539, self.alignment_type)
		buff = var3538
		var3533 = var3539
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3540, var3541 = protoModule.writeTag(buff, var3533, 4, protoModule.wireTypes.varint)
		var3540, var5154 = protoModule.writeVarInt(var3540, var3541, self.min_row_padding)
		buff = var3540
		var3533 = var3541
	end
	local buff_1 = buffer.create(var3533)
	buffer.copy(buff_1, 0, buff, 0, var3533)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref)
	local var3533 = t_131.new()
	local var3534 = 0
	while var3534 < buffer.len(p131) do
		local _ = nil
		local var3535 = nil
		local var3536, var3537, var3538 = protoModule.readTag(p131, var3534)
		local var3539 = var3536
		var3535 = var3537
		var3534 = var3538
		
		if var3535 == protoModule.wireTypes.varint then
			if var3539 == 1 then
				local _ = nil
				local var3540, var3541 = protoModule.readVarIntI32(p131, var3534)
				var3534 = var3541
				var3533.col_span = var3540
			elseif var3539 == 2 then
				local _ = nil
				local var3542, var3543 = protoModule.readVarIntI32(p131, var3534)
				var3534 = var3543
				var3533.row_span = var3542
			elseif var3539 == 4 then
				local _ = nil
				local var3544, var3545 = protoModule.readVarIntI32(p131, var3534)
				var3534 = var3545
				var3533.min_row_padding = var3544
			else
				local _ = nil
				local var3546, var3547 = protoModule.readVarInt(p131, var3534)
				local _ = var3546
				var3534 = var3547
			end
		end
		if var3535 == protoModule.wireTypes.lengthDelimited then
			if var3539 == 3 then
				local _ = nil
				local var3548, var3549 = protoModule.readBuffer(p131, var3534)
				var3534 = var3549
				var3533.alignment_type = buffer.tostring(var3548)
			else
				local _ = nil
				local var3550, var3551 = protoModule.readVarInt(p131, var3534)
				var3534 = var3551 + var3550
			end
		elseif var3535 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3552, var3553 = protoModule.readFixed32(p131, var3534)
			local _ = var3552
			var3534 = var3553
		elseif var3535 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3554, var3555 = protoModule.readFixed64(p131, var3534)
			local _ = var3554
			var3534 = var3555
		else
			error("Unsupported wire type: " .. var5158)
		end
	end
	return var3533
end

function t_131:jsonEncode()
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

function t_131:jsonDecode()
	-- upvalues: t_131 (ref)
	local var3556 = t_131.new()
	
	if self.col_span ~= nil then
		var3556.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3556.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3556.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3556.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3556.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3556.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3556.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3556.min_row_padding = self.minRowPadding
	end
	return var3556
end

t_131.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_131
typeRegistryModule.default:register(t.ItemLayout)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p132)
	-- upvalues: t_132 (ref)
	return setmetatable({
		community_id = if p132 == nil or p132.community_id == nil then "" else p132.community_id,
		announcement_id = if p132 == nil or p132.announcement_id == nil then "" else p132.announcement_id,
		message_id = if p132 == nil or p132.message_id == nil then "" else p132.message_id,
		title = if p132 == nil or p132.title == nil then "" else p132.title,
		body = if p132 == nil or p132.body == nil then "" else p132.body,
		creator_key = if p132 == nil or p132.creator_key == nil then "" else p132.creator_key,
		creator_role_name = if p132 == nil or p132.creator_role_name == nil then nil else p132.creator_role_name,
		media_asset_id = if p132 == nil or p132.media_asset_id == nil then nil else p132.media_asset_id,
		created_time = if p132 == nil or p132.created_time == nil then nil else p132.created_time
	}, t_132)
end

function t_132:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3556 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3557, var3558 = protoModule.writeTag(buff, var3556, 1, protoModule.wireTypes.lengthDelimited)
		var3557, var5184 = protoModule.writeString(var3557, var3558, self.community_id)
		buff = var3557
		var3556 = var3558
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3559, var3560 = protoModule.writeTag(buff, var3556, 2, protoModule.wireTypes.lengthDelimited)
		var3559, var5186 = protoModule.writeString(var3559, var3560, self.announcement_id)
		buff = var3559
		var3556 = var3560
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3561, var3562 = protoModule.writeTag(buff, var3556, 3, protoModule.wireTypes.lengthDelimited)
		var3561, var5188 = protoModule.writeString(var3561, var3562, self.message_id)
		buff = var3561
		var3556 = var3562
	end
	if self.title ~= nil and self.title ~= "" then
		local var3563, var3564 = protoModule.writeTag(buff, var3556, 4, protoModule.wireTypes.lengthDelimited)
		var3563, var5190 = protoModule.writeString(var3563, var3564, self.title)
		buff = var3563
		var3556 = var3564
	end
	if self.body ~= nil and self.body ~= "" then
		local var3565, var3566 = protoModule.writeTag(buff, var3556, 5, protoModule.wireTypes.lengthDelimited)
		var3565, var5192 = protoModule.writeString(var3565, var3566, self.body)
		buff = var3565
		var3556 = var3566
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3567, var3568 = protoModule.writeTag(buff, var3556, 6, protoModule.wireTypes.lengthDelimited)
		var3567, var5194 = protoModule.writeString(var3567, var3568, self.creator_key)
		buff = var3567
		var3556 = var3568
	end
	if self.creator_role_name ~= nil then
		local var3569, var3570 = protoModule.writeTag(buff, var3556, 7, protoModule.wireTypes.lengthDelimited)
		var3569, var5196 = protoModule.writeString(var3569, var3570, self.creator_role_name)
		buff = var3569
		var3556 = var3570
	end
	if self.media_asset_id ~= nil then
		local var3571, var3572 = protoModule.writeTag(buff, var3556, 8, protoModule.wireTypes.lengthDelimited)
		var3571, var5198 = protoModule.writeString(var3571, var3572, self.media_asset_id)
		buff = var3571
		var3556 = var3572
	end
	if self.created_time ~= nil then
		local var3573 = self.created_time:encode()
		local var3574, var3575 = protoModule.writeTag(buff, var3556, 9, protoModule.wireTypes.lengthDelimited)
		var3574, var5201 = protoModule.writeBuffer(var3574, var3575, var3573, buffer.len(var3573))
		buff = var3574
		var3556 = var3575
	end
	local buff_1 = buffer.create(var3556)
	buffer.copy(buff_1, 0, buff, 0, var3556)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref), timestampModule (ref)
	local var3556 = t_132.new()
	local var3557 = 0
	while var3557 < buffer.len(p132) do
		local _ = nil
		local var3558 = nil
		local var3559, var3560, var3561 = protoModule.readTag(p132, var3557)
		local var3562 = var3559
		var3558 = var3560
		var3557 = var3561
		
		if var3558 == protoModule.wireTypes.varint then
			local _ = nil
			local var3563, var3564 = protoModule.readVarInt(p132, var3557)
			local _ = var3563
			var3557 = var3564
			continue
		end
		if var3558 == protoModule.wireTypes.lengthDelimited then
			if var3562 == 1 then
				local _ = nil
				local var3565, var3566 = protoModule.readBuffer(p132, var3557)
				var3557 = var3566
				var3556.community_id = buffer.tostring(var3565)
			elseif var3562 == 2 then
				local _ = nil
				local var3567, var3568 = protoModule.readBuffer(p132, var3557)
				var3557 = var3568
				var3556.announcement_id = buffer.tostring(var3567)
			elseif var3562 == 3 then
				local _ = nil
				local var3569, var3570 = protoModule.readBuffer(p132, var3557)
				var3557 = var3570
				var3556.message_id = buffer.tostring(var3569)
			elseif var3562 == 4 then
				local _ = nil
				local var3571, var3572 = protoModule.readBuffer(p132, var3557)
				var3557 = var3572
				var3556.title = buffer.tostring(var3571)
			elseif var3562 == 5 then
				local _ = nil
				local var3573, var3574 = protoModule.readBuffer(p132, var3557)
				var3557 = var3574
				var3556.body = buffer.tostring(var3573)
			elseif var3562 == 6 then
				local _ = nil
				local var3575, var3576 = protoModule.readBuffer(p132, var3557)
				var3557 = var3576
				var3556.creator_key = buffer.tostring(var3575)
			elseif var3562 == 7 then
				local _ = nil
				local var3577, var3578 = protoModule.readBuffer(p132, var3557)
				var3557 = var3578
				var3556.creator_role_name = buffer.tostring(var3577)
			elseif var3562 == 8 then
				local _ = nil
				local var3579, var3580 = protoModule.readBuffer(p132, var3557)
				var3557 = var3580
				var3556.media_asset_id = buffer.tostring(var3579)
			elseif var3562 == 9 then
				local _ = nil
				local var3581, var3582 = protoModule.readBuffer(p132, var3557)
				var3557 = var3582
				var3556.created_time = timestampModule.Timestamp.decode(var3581)
			else
				local _ = nil
				local var3583, var3584 = protoModule.readVarInt(p132, var3557)
				var3557 = var3584 + var3583
			end
		elseif var3558 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3585, var3586 = protoModule.readFixed32(p132, var3557)
			local _ = var3585
			var3557 = var3586
		elseif var3558 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3587, var3588 = protoModule.readFixed64(p132, var3557)
			local _ = var3587
			var3557 = var3588
		else
			error("Unsupported wire type: " .. var5205)
		end
	end
	return var3556
end

function t_132:jsonEncode()
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

function t_132:jsonDecode()
	-- upvalues: t_132 (ref), timestampModule (ref)
	local var3589 = t_132.new()
	
	if self.community_id ~= nil then
		var3589.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3589.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3589.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3589.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3589.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3589.message_id = self.messageId
	end
	if self.title ~= nil then
		var3589.title = self.title
	end
	if self.body ~= nil then
		var3589.body = self.body
	end
	if self.creator_key ~= nil then
		var3589.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3589.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3589.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3589.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3589.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3589.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3589.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3589.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3589
end

t_132.descriptor = {
	name = "CommunityAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityAnnouncementInputData"
}
t.CommunityAnnouncementInputData = t_132
typeRegistryModule.default:register(t.CommunityAnnouncementInputData)
t.PageEntryFormat = {
	fromNumber = function(p133)
		return if p133 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p133 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p133)
		return if p133 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p133 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p133
	end,
	fromName = function(p133)
		return if p133 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p133 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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