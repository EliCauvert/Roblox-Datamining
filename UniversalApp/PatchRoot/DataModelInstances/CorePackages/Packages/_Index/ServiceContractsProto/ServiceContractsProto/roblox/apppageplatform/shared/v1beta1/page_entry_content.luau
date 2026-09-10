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
		game_items = if p36 == nil or p36.game_items == nil then {} else p36.game_items,
		attribution_thumbnail_asset_id = if p36 == nil or p36.attribution_thumbnail_asset_id == nil then nil else p36.attribution_thumbnail_asset_id,
		game_items_compact = if p36 == nil or p36.game_items_compact == nil then {} else p36.game_items_compact
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
	if self.attribution_thumbnail_asset_id ~= nil then
		local var1017, var1018 = protoModule.writeTag(buff, var971, 23, protoModule.wireTypes.lengthDelimited)
		var1017, var1676 = protoModule.writeString(var1017, var1018, self.attribution_thumbnail_asset_id)
		buff = var1017
		var971 = var1018
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		for i, v in self.game_items_compact do
			local var1019 = v:encode()
			local var1020, var1021 = protoModule.writeTag(buff, var971, 24, protoModule.wireTypes.lengthDelimited)
			var1020, var1679 = protoModule.writeBuffer(var1020, var1021, var1019, buffer.len(var1019))
			buff = var1020
			var971 = var1021
		end
	end
	local buff_1 = buffer.create(var971)
	buffer.copy(buff_1, 0, buff, 0, var971)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1022 = t_36.new()
	local var1023 = 0
	while var1023 < buffer.len(p36) do
		local _ = nil
		local var1024 = nil
		local var1025, var1026, var1027 = protoModule.readTag(p36, var1023)
		local var1028 = var1025
		var1024 = var1026
		var1023 = var1027
		
		if var1024 == protoModule.wireTypes.varint then
			if var1028 == 2 then
				local _ = nil
				local var1029, var1030 = protoModule.readVarInt(p36, var1023)
				var1023 = var1030
				var1022.is_sponsored = var1029 ~= 0
			elseif var1028 == 5 then
				local _ = nil
				local var1031, var1032 = protoModule.readVarInt(p36, var1023)
				var1023 = var1032
				var1022.is_content_locked = var1031 ~= 0
			elseif var1028 == 11 then
				local _ = nil
				local var1033, var1034 = protoModule.readVarIntI64(p36, var1023)
				var1023 = var1034
				var1022.player_count = var1033
			elseif var1028 == 13 then
				local _ = nil
				local var1035, var1036 = protoModule.readVarIntI32(p36, var1023)
				var1023 = var1036
				var1022.rank = var1035
			else
				local _ = nil
				local var1037, var1038 = protoModule.readVarInt(p36, var1023)
				local _ = var1037
				var1023 = var1038
			end
		end
		if var1024 == protoModule.wireTypes.lengthDelimited then
			if var1028 == 1 then
				local _ = nil
				local var1039, var1040 = protoModule.readBuffer(p36, var1023)
				var1023 = var1040
				var1022.universe_id = buffer.tostring(var1039)
			elseif var1028 == 3 then
				local _ = nil
				local var1041, var1042 = protoModule.readBuffer(p36, var1023)
				var1023 = var1042
				var1022.roblox_component = buffer.tostring(var1041)
			elseif var1028 == 4 then
				local _ = nil
				local var1043, var1044 = protoModule.readBuffer(p36, var1023)
				var1023 = var1044
				var1022.native_ad_data = buffer.tostring(var1043)
			elseif var1028 == 6 then
				local _ = nil
				local var1045, var1046 = protoModule.readBuffer(p36, var1023)
				var1023 = var1046
				var1022.title = buffer.tostring(var1045)
			elseif var1028 == 7 then
				local _ = nil
				local var1047, var1048 = protoModule.readBuffer(p36, var1023)
				var1023 = var1048
				var1022.subtitle = buffer.tostring(var1047)
			elseif var1028 == 8 then
				local _ = nil
				local var1049, var1050 = protoModule.readBuffer(p36, var1023)
				var1023 = var1050
				var1022.image_asset_id = buffer.tostring(var1049)
			elseif var1028 == 9 then
				local _ = nil
				local var1051, var1052 = protoModule.readBuffer(p36, var1023)
				var1023 = var1052
				var1022.video_asset_id = buffer.tostring(var1051)
			elseif var1028 == 10 then
				local _ = nil
				local var1053, var1054 = protoModule.readBuffer(p36, var1023)
				var1023 = var1054
				var1022.badge_text = buffer.tostring(var1053)
			elseif var1028 == 12 then
				local _ = nil
				local var1055, var1056 = protoModule.readBuffer(p36, var1023)
				var1023 = var1056
				var1022.creator_key = buffer.tostring(var1055)
			elseif var1028 == 14 then
				local _ = nil
				local var1057, var1058 = protoModule.readBuffer(p36, var1023)
				var1023 = var1058
				var1022.payer_name = buffer.tostring(var1057)
			elseif var1028 == 15 then
				local _ = nil
				local var1059, var1060 = protoModule.readBuffer(p36, var1023)
				var1023 = var1060
				var1022.logo_asset_id = buffer.tostring(var1059)
			elseif var1028 == 17 then
				local _ = nil
				local var1061, var1062 = protoModule.readBuffer(p36, var1023)
				var1023 = var1062
				var1022.place_id = buffer.tostring(var1061)
			elseif var1028 == 18 then
				local _ = nil
				local var1063, var1064 = protoModule.readBuffer(p36, var1023)
				var1023 = var1064
				var1022.launch_data = buffer.tostring(var1063)
			elseif var1028 == 19 then
				local _ = nil
				local var1065, var1066 = protoModule.readBuffer(p36, var1023)
				var1023 = var1066
				var1022.tile_variant = buffer.tostring(var1065)
			elseif var1028 == 20 then
				local _ = nil
				local var1067, var1068 = protoModule.readBuffer(p36, var1023)
				var1023 = var1068
				var1022.cta_text = buffer.tostring(var1067)
			elseif var1028 == 21 then
				local _ = nil
				local var1069, var1070 = protoModule.readBuffer(p36, var1023)
				var1023 = var1070
				var1022.badge_analytics_id = buffer.tostring(var1069)
			elseif var1028 == 22 then
				local _ = nil
				local var1071, var1072 = protoModule.readBuffer(p36, var1023)
				var1023 = var1072
				table.insert(var1022.game_items, t.GameItemInputData.decode(var1071))
			elseif var1028 == 23 then
				local _ = nil
				local var1073, var1074 = protoModule.readBuffer(p36, var1023)
				var1023 = var1074
				var1022.attribution_thumbnail_asset_id = buffer.tostring(var1073)
			elseif var1028 == 24 then
				local _ = nil
				local var1075, var1076 = protoModule.readBuffer(p36, var1023)
				var1023 = var1076
				table.insert(var1022.game_items_compact, t.GameItemInputData.decode(var1075))
			else
				local _ = nil
				local var1077, var1078 = protoModule.readVarInt(p36, var1023)
				var1023 = var1078 + var1077
			end
		elseif var1024 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1079, var1080 = protoModule.readFixed32(p36, var1023)
			local _ = var1079
			var1023 = var1080
		elseif var1024 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1683)
		elseif var1028 == 16 then
			local _ = nil
			local var1081, var1082 = protoModule.readDouble(p36, var1023)
			var1023 = var1082
			var1022.logo_aspect_ratio = var1081
		else
			local _ = nil
			local var1083, var1084 = protoModule.readFixed64(p36, var1023)
			local _ = var1083
			var1023 = var1084
		end
	end
	return var1022
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
	return t
end

function t_36:jsonDecode()
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1085 = t_36.new()
	
	if self.universe_id ~= nil then
		var1085.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1085.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1085.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1085.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1085.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1085.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1085.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1085.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1085.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1085.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1085.title = self.title
	end
	if self.subtitle ~= nil then
		var1085.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1085.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1085.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1085.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1085.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1085.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1085.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1085.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1085.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1085.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1085.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1085.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1085.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1085.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1085.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1085.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1085.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1085.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1085.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1085.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1085.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1085.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1085.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1085.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1085.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1085.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1085.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1085.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1085.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1085.game_items = t_1
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var1085.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var1085.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	if self.game_items_compact ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items_compact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1085.game_items_compact = t_1
	end
	if self.gameItemsCompact ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItemsCompact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1085.game_items_compact = t_1
	end
	return var1085
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
	local var1086 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1087, var1088 = protoModule.writeTag(buff, var1086, 1, protoModule.wireTypes.lengthDelimited)
		var1087, var1755 = protoModule.writeString(var1087, var1088, self.title)
		buff = var1087
		var1086 = var1088
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1089 = v:encode()
			local var1090, var1091 = protoModule.writeTag(buff, var1086, 2, protoModule.wireTypes.lengthDelimited)
			var1090, var1758 = protoModule.writeBuffer(var1090, var1091, var1089, buffer.len(var1089))
			buff = var1090
			var1086 = var1091
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1092, var1093 = protoModule.writeTag(buff, var1086, 3, protoModule.wireTypes.lengthDelimited)
		var1092, var1760 = protoModule.writeString(var1092, var1093, self.next_page_token)
		buff = var1092
		var1086 = var1093
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1094, var1095 = protoModule.writeTag(buff, var1086, 4, protoModule.wireTypes.lengthDelimited)
		var1094, var1762 = protoModule.writeString(var1094, var1095, self.sort_id)
		buff = var1094
		var1086 = var1095
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1096, var1097 = protoModule.writeTag(buff, var1086, 5, protoModule.wireTypes.varint)
		var1096, var1764 = protoModule.writeVarInt(var1096, var1097, self.secondary_sort_id)
		buff = var1096
		var1086 = var1097
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1098, var1099 = protoModule.writeTag(buff, var1086, 6, protoModule.wireTypes.lengthDelimited)
		var1098, var1766 = protoModule.writeString(var1098, var1099, self.subtitle)
		buff = var1098
		var1086 = var1099
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1100, var1101 = protoModule.writeTag(buff, var1086, 7, protoModule.wireTypes.lengthDelimited)
		var1100, var1768 = protoModule.writeString(var1100, var1101, self.info_text)
		buff = var1100
		var1086 = var1101
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1102, var1103 = protoModule.writeTag(buff, var1086, 8, protoModule.wireTypes.lengthDelimited)
		var1102, var1770 = protoModule.writeString(var1102, var1103, self.subtitle_link_path)
		buff = var1102
		var1086 = var1103
	end
	if self.is_placeholder ~= nil then
		local var1104, var1105 = protoModule.writeTag(buff, var1086, 9, protoModule.wireTypes.varint)
		var1104, var1772 = protoModule.writeVarInt(var1104, var1105, if self.is_placeholder then 1 else 0)
		buff = var1104
		var1086 = var1105
	end
	if self.primary_sort_id ~= nil then
		local var1106, var1107 = protoModule.writeTag(buff, var1086, 10, protoModule.wireTypes.varint)
		var1106, var1774 = protoModule.writeVarInt(var1106, var1107, self.primary_sort_id)
		buff = var1106
		var1086 = var1107
	end
	if self.applied_filters ~= nil then
		local var1108, var1109 = protoModule.writeTag(buff, var1086, 11, protoModule.wireTypes.lengthDelimited)
		var1108, var1776 = protoModule.writeString(var1108, var1109, self.applied_filters)
		buff = var1108
		var1086 = var1109
	end
	local buff_1 = buffer.create(var1086)
	buffer.copy(buff_1, 0, buff, 0, var1086)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1110 = t_37.new()
	local var1111 = 0
	while var1111 < buffer.len(p37) do
		local _ = nil
		local var1112 = nil
		local var1113, var1114, var1115 = protoModule.readTag(p37, var1111)
		local var1116 = var1113
		var1112 = var1114
		var1111 = var1115
		
		if var1112 == protoModule.wireTypes.varint then
			if var1116 == 5 then
				local _ = nil
				local var1117, var1118 = protoModule.readVarIntI32(p37, var1111)
				var1111 = var1118
				var1110.secondary_sort_id = var1117
			elseif var1116 == 9 then
				local _ = nil
				local var1119, var1120 = protoModule.readVarInt(p37, var1111)
				var1111 = var1120
				var1110.is_placeholder = var1119 ~= 0
			elseif var1116 == 10 then
				local _ = nil
				local var1121, var1122 = protoModule.readVarIntI32(p37, var1111)
				var1111 = var1122
				var1110.primary_sort_id = var1121
			else
				local _ = nil
				local var1123, var1124 = protoModule.readVarInt(p37, var1111)
				local _ = var1123
				var1111 = var1124
			end
		end
		if var1112 == protoModule.wireTypes.lengthDelimited then
			if var1116 == 1 then
				local _ = nil
				local var1125, var1126 = protoModule.readBuffer(p37, var1111)
				var1111 = var1126
				var1110.title = buffer.tostring(var1125)
			elseif var1116 == 2 then
				local _ = nil
				local var1127, var1128 = protoModule.readBuffer(p37, var1111)
				var1111 = var1128
				table.insert(var1110.song_items, t.SongCarouselInputData_SongItem.decode(var1127))
			elseif var1116 == 3 then
				local _ = nil
				local var1129, var1130 = protoModule.readBuffer(p37, var1111)
				var1111 = var1130
				var1110.next_page_token = buffer.tostring(var1129)
			elseif var1116 == 4 then
				local _ = nil
				local var1131, var1132 = protoModule.readBuffer(p37, var1111)
				var1111 = var1132
				var1110.sort_id = buffer.tostring(var1131)
			elseif var1116 == 6 then
				local _ = nil
				local var1133, var1134 = protoModule.readBuffer(p37, var1111)
				var1111 = var1134
				var1110.subtitle = buffer.tostring(var1133)
			elseif var1116 == 7 then
				local _ = nil
				local var1135, var1136 = protoModule.readBuffer(p37, var1111)
				var1111 = var1136
				var1110.info_text = buffer.tostring(var1135)
			elseif var1116 == 8 then
				local _ = nil
				local var1137, var1138 = protoModule.readBuffer(p37, var1111)
				var1111 = var1138
				var1110.subtitle_link_path = buffer.tostring(var1137)
			elseif var1116 == 11 then
				local _ = nil
				local var1139, var1140 = protoModule.readBuffer(p37, var1111)
				var1111 = var1140
				var1110.applied_filters = buffer.tostring(var1139)
			else
				local _ = nil
				local var1141, var1142 = protoModule.readVarInt(p37, var1111)
				var1111 = var1142 + var1141
			end
		elseif var1112 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1143, var1144 = protoModule.readFixed32(p37, var1111)
			local _ = var1143
			var1111 = var1144
		elseif var1112 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1145, var1146 = protoModule.readFixed64(p37, var1111)
			local _ = var1145
			var1111 = var1146
		else
			error("Unsupported wire type: " .. var1780)
		end
	end
	return var1110
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
	local var1147 = t_37.new()
	
	if self.title ~= nil then
		var1147.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1147.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1147.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1147.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1147.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1147.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1147.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1147.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1147.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1147.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1147.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1147.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1147.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1147.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1147.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1147.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1147.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1147.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1147.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1147.applied_filters = self.appliedFilters
	end
	return var1147
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
	local var1148 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1149, var1150 = protoModule.writeTag(buff, var1148, 1, protoModule.wireTypes.lengthDelimited)
		var1149, var1823 = protoModule.writeString(var1149, var1150, self.song_id)
		buff = var1149
		var1148 = var1150
	end
	local buff_1 = buffer.create(var1148)
	buffer.copy(buff_1, 0, buff, 0, var1148)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1148 = t_38.new()
	local var1149 = 0
	while var1149 < buffer.len(p38) do
		local _ = nil
		local var1150 = nil
		local var1151, var1152, var1153 = protoModule.readTag(p38, var1149)
		local var1154 = var1151
		var1150 = var1152
		var1149 = var1153
		
		if var1150 == protoModule.wireTypes.varint then
			local _ = nil
			local var1155, var1156 = protoModule.readVarInt(p38, var1149)
			local _ = var1155
			var1149 = var1156
			continue
		end
		if var1150 == protoModule.wireTypes.lengthDelimited then
			if var1154 == 1 then
				local _ = nil
				local var1157, var1158 = protoModule.readBuffer(p38, var1149)
				var1149 = var1158
				var1148.song_id = buffer.tostring(var1157)
			else
				local _ = nil
				local var1159, var1160 = protoModule.readVarInt(p38, var1149)
				var1149 = var1160 + var1159
			end
		elseif var1150 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1161, var1162 = protoModule.readFixed32(p38, var1149)
			local _ = var1161
			var1149 = var1162
		elseif var1150 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1163, var1164 = protoModule.readFixed64(p38, var1149)
			local _ = var1163
			var1149 = var1164
		else
			error("Unsupported wire type: " .. var1827)
		end
	end
	return var1148
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
	local var1165 = t_38.new()
	
	if self.song_id ~= nil then
		var1165.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1165.song_id = self.songId
	end
	return var1165
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
	local var1165 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1166, var1167 = protoModule.writeTag(buff, var1165, 1, protoModule.wireTypes.lengthDelimited)
		var1166, var1847 = protoModule.writeString(var1166, var1167, self.title)
		buff = var1166
		var1165 = var1167
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1168 = v:encode()
			local var1169, var1170 = protoModule.writeTag(buff, var1165, 2, protoModule.wireTypes.lengthDelimited)
			var1169, var1850 = protoModule.writeBuffer(var1169, var1170, var1168, buffer.len(var1168))
			buff = var1169
			var1165 = var1170
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1171, var1172 = protoModule.writeTag(buff, var1165, 3, protoModule.wireTypes.lengthDelimited)
		var1171, var1852 = protoModule.writeString(var1171, var1172, self.universe_id)
		buff = var1171
		var1165 = var1172
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1173, var1174 = protoModule.writeTag(buff, var1165, 4, protoModule.wireTypes.lengthDelimited)
		var1173, var1854 = protoModule.writeString(var1173, var1174, self.sort_id)
		buff = var1173
		var1165 = var1174
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1175, var1176 = protoModule.writeTag(buff, var1165, 5, protoModule.wireTypes.lengthDelimited)
		var1175, var1856 = protoModule.writeString(var1175, var1176, self.subtitle)
		buff = var1175
		var1165 = var1176
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1177, var1178 = protoModule.writeTag(buff, var1165, 6, protoModule.wireTypes.lengthDelimited)
		var1177, var1858 = protoModule.writeString(var1177, var1178, self.info_text)
		buff = var1177
		var1165 = var1178
	end
	local buff_1 = buffer.create(var1165)
	buffer.copy(buff_1, 0, buff, 0, var1165)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1179 = t_39.new()
	local var1180 = 0
	while var1180 < buffer.len(p39) do
		local _ = nil
		local var1181 = nil
		local var1182, var1183, var1184 = protoModule.readTag(p39, var1180)
		local var1185 = var1182
		var1181 = var1183
		var1180 = var1184
		
		if var1181 == protoModule.wireTypes.varint then
			local _ = nil
			local var1186, var1187 = protoModule.readVarInt(p39, var1180)
			local _ = var1186
			var1180 = var1187
			continue
		end
		if var1181 == protoModule.wireTypes.lengthDelimited then
			if var1185 == 1 then
				local _ = nil
				local var1188, var1189 = protoModule.readBuffer(p39, var1180)
				var1180 = var1189
				var1179.title = buffer.tostring(var1188)
			elseif var1185 == 2 then
				local _ = nil
				local var1190, var1191 = protoModule.readBuffer(p39, var1180)
				var1180 = var1191
				table.insert(var1179.event_items, t.EventsCarouselInputData_EventItem.decode(var1190))
			elseif var1185 == 3 then
				local _ = nil
				local var1192, var1193 = protoModule.readBuffer(p39, var1180)
				var1180 = var1193
				var1179.universe_id = buffer.tostring(var1192)
			elseif var1185 == 4 then
				local _ = nil
				local var1194, var1195 = protoModule.readBuffer(p39, var1180)
				var1180 = var1195
				var1179.sort_id = buffer.tostring(var1194)
			elseif var1185 == 5 then
				local _ = nil
				local var1196, var1197 = protoModule.readBuffer(p39, var1180)
				var1180 = var1197
				var1179.subtitle = buffer.tostring(var1196)
			elseif var1185 == 6 then
				local _ = nil
				local var1198, var1199 = protoModule.readBuffer(p39, var1180)
				var1180 = var1199
				var1179.info_text = buffer.tostring(var1198)
			else
				local _ = nil
				local var1200, var1201 = protoModule.readVarInt(p39, var1180)
				var1180 = var1201 + var1200
			end
		elseif var1181 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1202, var1203 = protoModule.readFixed32(p39, var1180)
			local _ = var1202
			var1180 = var1203
		elseif var1181 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1204, var1205 = protoModule.readFixed64(p39, var1180)
			local _ = var1204
			var1180 = var1205
		else
			error("Unsupported wire type: " .. var1862)
		end
	end
	return var1179
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
	local var1206 = t_39.new()
	
	if self.title ~= nil then
		var1206.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1206.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1206.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1206.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1206.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1206.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1206.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1206.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1206.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1206.info_text = self.infoText
	end
	return var1206
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
	local var1207 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1208, var1209 = protoModule.writeTag(buff, var1207, 1, protoModule.wireTypes.lengthDelimited)
		var1208, var1895 = protoModule.writeString(var1208, var1209, self.event_id)
		buff = var1208
		var1207 = var1209
	end
	local buff_1 = buffer.create(var1207)
	buffer.copy(buff_1, 0, buff, 0, var1207)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1207 = t_40.new()
	local var1208 = 0
	while var1208 < buffer.len(p40) do
		local _ = nil
		local var1209 = nil
		local var1210, var1211, var1212 = protoModule.readTag(p40, var1208)
		local var1213 = var1210
		var1209 = var1211
		var1208 = var1212
		
		if var1209 == protoModule.wireTypes.varint then
			local _ = nil
			local var1214, var1215 = protoModule.readVarInt(p40, var1208)
			local _ = var1214
			var1208 = var1215
			continue
		end
		if var1209 == protoModule.wireTypes.lengthDelimited then
			if var1213 == 1 then
				local _ = nil
				local var1216, var1217 = protoModule.readBuffer(p40, var1208)
				var1208 = var1217
				var1207.event_id = buffer.tostring(var1216)
			else
				local _ = nil
				local var1218, var1219 = protoModule.readVarInt(p40, var1208)
				var1208 = var1219 + var1218
			end
		elseif var1209 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1220, var1221 = protoModule.readFixed32(p40, var1208)
			local _ = var1220
			var1208 = var1221
		elseif var1209 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1222, var1223 = protoModule.readFixed64(p40, var1208)
			local _ = var1222
			var1208 = var1223
		else
			error("Unsupported wire type: " .. var1899)
		end
	end
	return var1207
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
	local var1224 = t_40.new()
	
	if self.event_id ~= nil then
		var1224.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1224.event_id = self.eventId
	end
	return var1224
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
	local var1224 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1225, var1226 = protoModule.writeTag(buff, var1224, 1, protoModule.wireTypes.lengthDelimited)
		var1225, var1919 = protoModule.writeString(var1225, var1226, self.universe_id)
		buff = var1225
		var1224 = var1226
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1227, var1228 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1227, var1921 = protoModule.writeString(var1227, var1228, i)
			local var1229 = v:encode()
			var1228, var1923 = protoModule.writeTag(var1227, var1228, 2, protoModule.wireTypes.lengthDelimited)
			var1228, var1923 = protoModule.writeBuffer(var1228, var1923, var1229, buffer.len(var1229))
			local var1230 = var1228
			local var1231 = var1923
			local var1232, var1233 = protoModule.writeTag(buff, var1224, 2, protoModule.wireTypes.lengthDelimited)
			var1232, var1927 = protoModule.writeBuffer(var1232, var1233, var1230, var1231)
			buff = var1232
			var1224 = var1233
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1234, var1235 = protoModule.writeTag(buff, var1224, 3, protoModule.wireTypes.lengthDelimited)
			var1234, var1929 = protoModule.writeString(var1234, var1235, v)
			buff = var1234
			var1224 = var1235
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1236, var1237 = protoModule.writeTag(buff, var1224, 4, protoModule.wireTypes.lengthDelimited)
		var1236, var1931 = protoModule.writeString(var1236, var1237, self.creator_key)
		buff = var1236
		var1224 = var1237
	end
	if self.pill_tabs ~= nil then
		local var1238 = self.pill_tabs:encode()
		local var1239, var1240 = protoModule.writeTag(buff, var1224, 5, protoModule.wireTypes.lengthDelimited)
		var1239, var1934 = protoModule.writeBuffer(var1239, var1240, var1238, buffer.len(var1238))
		buff = var1239
		var1224 = var1240
	end
	local buff_1 = buffer.create(var1224)
	buffer.copy(buff_1, 0, buff, 0, var1224)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1241 = t_41.new()
	local var1242 = 0
	while var1242 < buffer.len(p41) do
		local _ = nil
		local var1243 = nil
		local var1244, var1245, var1246 = protoModule.readTag(p41, var1242)
		local var1247 = var1244
		var1243 = var1245
		var1242 = var1246
		
		if var1243 == protoModule.wireTypes.varint then
			local _ = nil
			local var1248, var1249 = protoModule.readVarInt(p41, var1242)
			local _ = var1248
			var1242 = var1249
			continue
		end
		if var1243 == protoModule.wireTypes.lengthDelimited then
			if var1247 == 1 then
				local _ = nil
				local var1250, var1251 = protoModule.readBuffer(p41, var1242)
				var1242 = var1251
				var1241.universe_id = buffer.tostring(var1250)
			elseif var1247 == 2 then
				local _ = nil
				local var1252, var1253 = protoModule.readBuffer(p41, var1242)
				var1242 = var1253
				var1252 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1252)
				var1241.entry_map[var1252.key or ""] = var1252.value or t.FeedEntry.new()
			elseif var1247 == 3 then
				local _ = nil
				local var1254, var1255 = protoModule.readBuffer(p41, var1242)
				var1242 = var1255
				table.insert(var1241.entry_order, buffer.tostring(var1254))
			elseif var1247 == 4 then
				local _ = nil
				local var1256, var1257 = protoModule.readBuffer(p41, var1242)
				var1242 = var1257
				var1241.creator_key = buffer.tostring(var1256)
			elseif var1247 == 5 then
				local _ = nil
				local var1258, var1259 = protoModule.readBuffer(p41, var1242)
				var1242 = var1259
				var1241.pill_tabs = t.PillTabsInputData.decode(var1258)
			else
				local _ = nil
				local var1260, var1261 = protoModule.readVarInt(p41, var1242)
				var1242 = var1261 + var1260
			end
		elseif var1243 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1262, var1263 = protoModule.readFixed32(p41, var1242)
			local _ = var1262
			var1242 = var1263
		elseif var1243 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1264, var1265 = protoModule.readFixed64(p41, var1242)
			local _ = var1264
			var1242 = var1265
		else
			error("Unsupported wire type: " .. var1938)
		end
	end
	return var1241
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
	local var1266 = t_41.new()
	
	if self.universe_id ~= nil then
		var1266.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1266.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1266.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1266.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1266.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1266.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1266.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1266.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1266.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1266.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1266
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
	local var1267 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1268, var1269 = protoModule.writeTag(buff, var1267, 1, protoModule.wireTypes.lengthDelimited)
		var1268, var1972 = protoModule.writeString(var1268, var1269, self.key)
		buff = var1268
		var1267 = var1269
	end
	if self.value ~= nil then
		local var1270 = self.value:encode()
		local var1271, var1272 = protoModule.writeTag(buff, var1267, 2, protoModule.wireTypes.lengthDelimited)
		var1271, var1975 = protoModule.writeBuffer(var1271, var1272, var1270, buffer.len(var1270))
		buff = var1271
		var1267 = var1272
	end
	local buff_1 = buffer.create(var1267)
	buffer.copy(buff_1, 0, buff, 0, var1267)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1267 = t_42.new()
	local var1268 = 0
	while var1268 < buffer.len(p42) do
		local _ = nil
		local var1269 = nil
		local var1270, var1271, var1272 = protoModule.readTag(p42, var1268)
		local var1273 = var1270
		var1269 = var1271
		var1268 = var1272
		
		if var1269 == protoModule.wireTypes.varint then
			local _ = nil
			local var1274, var1275 = protoModule.readVarInt(p42, var1268)
			local _ = var1274
			var1268 = var1275
			continue
		end
		if var1269 == protoModule.wireTypes.lengthDelimited then
			if var1273 == 1 then
				local _ = nil
				local var1276, var1277 = protoModule.readBuffer(p42, var1268)
				var1268 = var1277
				var1267.key = buffer.tostring(var1276)
			elseif var1273 == 2 then
				local _ = nil
				local var1278, var1279 = protoModule.readBuffer(p42, var1268)
				var1268 = var1279
				var1267.value = t.FeedEntry.decode(var1278)
			else
				local _ = nil
				local var1280, var1281 = protoModule.readVarInt(p42, var1268)
				var1268 = var1281 + var1280
			end
		elseif var1269 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1282, var1283 = protoModule.readFixed32(p42, var1268)
			local _ = var1282
			var1268 = var1283
		elseif var1269 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1284, var1285 = protoModule.readFixed64(p42, var1268)
			local _ = var1284
			var1268 = var1285
		else
			error("Unsupported wire type: " .. var1979)
		end
	end
	return var1267
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
	local var1286 = t_42.new()
	
	if self.key ~= nil then
		var1286.key = self.key
	end
	if self.value ~= nil then
		var1286.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1286
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
	local var1286 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1287 = v:encode()
			local var1288, var1289 = protoModule.writeTag(buff, var1286, 1, protoModule.wireTypes.lengthDelimited)
			var1288, var2002 = protoModule.writeBuffer(var1288, var1289, var1287, buffer.len(var1287))
			buff = var1288
			var1286 = var1289
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1290, var1291 = protoModule.writeTag(buff, var1286, 2, protoModule.wireTypes.lengthDelimited)
		var1290, var2004 = protoModule.writeString(var1290, var1291, self.default_option_id)
		buff = var1290
		var1286 = var1291
	end
	local buff_1 = buffer.create(var1286)
	buffer.copy(buff_1, 0, buff, 0, var1286)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1292 = t_43.new()
	local var1293 = 0
	while var1293 < buffer.len(p43) do
		local _ = nil
		local var1294 = nil
		local var1295, var1296, var1297 = protoModule.readTag(p43, var1293)
		local var1298 = var1295
		var1294 = var1296
		var1293 = var1297
		
		if var1294 == protoModule.wireTypes.varint then
			local _ = nil
			local var1299, var1300 = protoModule.readVarInt(p43, var1293)
			local _ = var1299
			var1293 = var1300
			continue
		end
		if var1294 == protoModule.wireTypes.lengthDelimited then
			if var1298 == 1 then
				local _ = nil
				local var1301, var1302 = protoModule.readBuffer(p43, var1293)
				var1293 = var1302
				table.insert(var1292.options, t.PillTabsInputData_PillTabOption.decode(var1301))
			elseif var1298 == 2 then
				local _ = nil
				local var1303, var1304 = protoModule.readBuffer(p43, var1293)
				var1293 = var1304
				var1292.default_option_id = buffer.tostring(var1303)
			else
				local _ = nil
				local var1305, var1306 = protoModule.readVarInt(p43, var1293)
				var1293 = var1306 + var1305
			end
		elseif var1294 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1307, var1308 = protoModule.readFixed32(p43, var1293)
			local _ = var1307
			var1293 = var1308
		elseif var1294 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1309, var1310 = protoModule.readFixed64(p43, var1293)
			local _ = var1309
			var1293 = var1310
		else
			error("Unsupported wire type: " .. var2008)
		end
	end
	return var1292
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
	local var1311 = t_43.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1311.options = t_1
	end
	if self.default_option_id ~= nil then
		var1311.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1311.default_option_id = self.defaultOptionId
	end
	return var1311
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
	local var1312 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1313, var1314 = protoModule.writeTag(buff, var1312, 1, protoModule.wireTypes.lengthDelimited)
		var1313, var2032 = protoModule.writeString(var1313, var1314, self.option_id)
		buff = var1313
		var1312 = var1314
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1315, var1316 = protoModule.writeTag(buff, var1312, 2, protoModule.wireTypes.lengthDelimited)
		var1315, var2034 = protoModule.writeString(var1315, var1316, self.display_name)
		buff = var1315
		var1312 = var1316
	end
	local buff_1 = buffer.create(var1312)
	buffer.copy(buff_1, 0, buff, 0, var1312)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1312 = t_44.new()
	local var1313 = 0
	while var1313 < buffer.len(p44) do
		local _ = nil
		local var1314 = nil
		local var1315, var1316, var1317 = protoModule.readTag(p44, var1313)
		local var1318 = var1315
		var1314 = var1316
		var1313 = var1317
		
		if var1314 == protoModule.wireTypes.varint then
			local _ = nil
			local var1319, var1320 = protoModule.readVarInt(p44, var1313)
			local _ = var1319
			var1313 = var1320
			continue
		end
		if var1314 == protoModule.wireTypes.lengthDelimited then
			if var1318 == 1 then
				local _ = nil
				local var1321, var1322 = protoModule.readBuffer(p44, var1313)
				var1313 = var1322
				var1312.option_id = buffer.tostring(var1321)
			elseif var1318 == 2 then
				local _ = nil
				local var1323, var1324 = protoModule.readBuffer(p44, var1313)
				var1313 = var1324
				var1312.display_name = buffer.tostring(var1323)
			else
				local _ = nil
				local var1325, var1326 = protoModule.readVarInt(p44, var1313)
				var1313 = var1326 + var1325
			end
		elseif var1314 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1327, var1328 = protoModule.readFixed32(p44, var1313)
			local _ = var1327
			var1313 = var1328
		elseif var1314 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1329, var1330 = protoModule.readFixed64(p44, var1313)
			local _ = var1329
			var1313 = var1330
		else
			error("Unsupported wire type: " .. var2038)
		end
	end
	return var1312
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
	local var1331 = t_44.new()
	
	if self.option_id ~= nil then
		var1331.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1331.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1331.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1331.display_name = self.displayName
	end
	return var1331
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
	local var1331 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1332 = v:encode()
			local var1333, var1334 = protoModule.writeTag(buff, var1331, 1, protoModule.wireTypes.lengthDelimited)
			var1333, var2061 = protoModule.writeBuffer(var1333, var1334, var1332, buffer.len(var1332))
			buff = var1333
			var1331 = var1334
		end
	end
	local buff_1 = buffer.create(var1331)
	buffer.copy(buff_1, 0, buff, 0, var1331)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1335 = t_45.new()
	local var1336 = 0
	while var1336 < buffer.len(p45) do
		local _ = nil
		local var1337 = nil
		local var1338, var1339, var1340 = protoModule.readTag(p45, var1336)
		local var1341 = var1338
		var1337 = var1339
		var1336 = var1340
		
		if var1337 == protoModule.wireTypes.varint then
			local _ = nil
			local var1342, var1343 = protoModule.readVarInt(p45, var1336)
			local _ = var1342
			var1336 = var1343
			continue
		end
		if var1337 == protoModule.wireTypes.lengthDelimited then
			if var1341 == 1 then
				local _ = nil
				local var1344, var1345 = protoModule.readBuffer(p45, var1336)
				var1336 = var1345
				table.insert(var1335.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1344))
			else
				local _ = nil
				local var1346, var1347 = protoModule.readVarInt(p45, var1336)
				var1336 = var1347 + var1346
			end
		elseif var1337 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1348, var1349 = protoModule.readFixed32(p45, var1336)
			local _ = var1348
			var1336 = var1349
		elseif var1337 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1350, var1351 = protoModule.readFixed64(p45, var1336)
			local _ = var1350
			var1336 = var1351
		else
			error("Unsupported wire type: " .. var2065)
		end
	end
	return var1335
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
	local var1352 = t_45.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1352.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1352.game_passes = t_1
	end
	return var1352
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
	local var1353 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1354, var1355 = protoModule.writeTag(buff, var1353, 1, protoModule.wireTypes.lengthDelimited)
		var1354, var2088 = protoModule.writeString(var1354, var1355, self.game_pass_id)
		buff = var1354
		var1353 = var1355
	end
	local buff_1 = buffer.create(var1353)
	buffer.copy(buff_1, 0, buff, 0, var1353)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1353 = t_46.new()
	local var1354 = 0
	while var1354 < buffer.len(p46) do
		local _ = nil
		local var1355 = nil
		local var1356, var1357, var1358 = protoModule.readTag(p46, var1354)
		local var1359 = var1356
		var1355 = var1357
		var1354 = var1358
		
		if var1355 == protoModule.wireTypes.varint then
			local _ = nil
			local var1360, var1361 = protoModule.readVarInt(p46, var1354)
			local _ = var1360
			var1354 = var1361
			continue
		end
		if var1355 == protoModule.wireTypes.lengthDelimited then
			if var1359 == 1 then
				local _ = nil
				local var1362, var1363 = protoModule.readBuffer(p46, var1354)
				var1354 = var1363
				var1353.game_pass_id = buffer.tostring(var1362)
			else
				local _ = nil
				local var1364, var1365 = protoModule.readVarInt(p46, var1354)
				var1354 = var1365 + var1364
			end
		elseif var1355 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1366, var1367 = protoModule.readFixed32(p46, var1354)
			local _ = var1366
			var1354 = var1367
		elseif var1355 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1368, var1369 = protoModule.readFixed64(p46, var1354)
			local _ = var1368
			var1354 = var1369
		else
			error("Unsupported wire type: " .. var2092)
		end
	end
	return var1353
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
	local var1370 = t_46.new()
	
	if self.game_pass_id ~= nil then
		var1370.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1370.game_pass_id = self.gamePassId
	end
	return var1370
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
	local var1370 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1371 = v:encode()
			local var1372, var1373 = protoModule.writeTag(buff, var1370, 1, protoModule.wireTypes.lengthDelimited)
			var1372, var2113 = protoModule.writeBuffer(var1372, var1373, var1371, buffer.len(var1371))
			buff = var1372
			var1370 = var1373
		end
	end
	local buff_1 = buffer.create(var1370)
	buffer.copy(buff_1, 0, buff, 0, var1370)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1374 = t_47.new()
	local var1375 = 0
	while var1375 < buffer.len(p47) do
		local _ = nil
		local var1376 = nil
		local var1377, var1378, var1379 = protoModule.readTag(p47, var1375)
		local var1380 = var1377
		var1376 = var1378
		var1375 = var1379
		
		if var1376 == protoModule.wireTypes.varint then
			local _ = nil
			local var1381, var1382 = protoModule.readVarInt(p47, var1375)
			local _ = var1381
			var1375 = var1382
			continue
		end
		if var1376 == protoModule.wireTypes.lengthDelimited then
			if var1380 == 1 then
				local _ = nil
				local var1383, var1384 = protoModule.readBuffer(p47, var1375)
				var1375 = var1384
				table.insert(var1374.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1383))
			else
				local _ = nil
				local var1385, var1386 = protoModule.readVarInt(p47, var1375)
				var1375 = var1386 + var1385
			end
		elseif var1376 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1387, var1388 = protoModule.readFixed32(p47, var1375)
			local _ = var1387
			var1375 = var1388
		elseif var1376 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1389, var1390 = protoModule.readFixed64(p47, var1375)
			local _ = var1389
			var1375 = var1390
		else
			error("Unsupported wire type: " .. var2117)
		end
	end
	return var1374
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
	local var1391 = t_47.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1391.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1391.developer_products = t_1
	end
	return var1391
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
	local var1392 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1393, var1394 = protoModule.writeTag(buff, var1392, 1, protoModule.wireTypes.lengthDelimited)
		var1393, var2140 = protoModule.writeString(var1393, var1394, self.developer_product_id)
		buff = var1393
		var1392 = var1394
	end
	local buff_1 = buffer.create(var1392)
	buffer.copy(buff_1, 0, buff, 0, var1392)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1392 = t_48.new()
	local var1393 = 0
	while var1393 < buffer.len(p48) do
		local _ = nil
		local var1394 = nil
		local var1395, var1396, var1397 = protoModule.readTag(p48, var1393)
		local var1398 = var1395
		var1394 = var1396
		var1393 = var1397
		
		if var1394 == protoModule.wireTypes.varint then
			local _ = nil
			local var1399, var1400 = protoModule.readVarInt(p48, var1393)
			local _ = var1399
			var1393 = var1400
			continue
		end
		if var1394 == protoModule.wireTypes.lengthDelimited then
			if var1398 == 1 then
				local _ = nil
				local var1401, var1402 = protoModule.readBuffer(p48, var1393)
				var1393 = var1402
				var1392.developer_product_id = buffer.tostring(var1401)
			else
				local _ = nil
				local var1403, var1404 = protoModule.readVarInt(p48, var1393)
				var1393 = var1404 + var1403
			end
		elseif var1394 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1405, var1406 = protoModule.readFixed32(p48, var1393)
			local _ = var1405
			var1393 = var1406
		elseif var1394 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1407, var1408 = protoModule.readFixed64(p48, var1393)
			local _ = var1407
			var1393 = var1408
		else
			error("Unsupported wire type: " .. var2144)
		end
	end
	return var1392
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
	local var1409 = t_48.new()
	
	if self.developer_product_id ~= nil then
		var1409.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1409.developer_product_id = self.developerProductId
	end
	return var1409
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
	local var1409 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1410 = v:encode()
			local var1411, var1412 = protoModule.writeTag(buff, var1409, 1, protoModule.wireTypes.lengthDelimited)
			var1411, var2165 = protoModule.writeBuffer(var1411, var1412, var1410, buffer.len(var1410))
			buff = var1411
			var1409 = var1412
		end
	end
	local buff_1 = buffer.create(var1409)
	buffer.copy(buff_1, 0, buff, 0, var1409)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1413 = t_49.new()
	local var1414 = 0
	while var1414 < buffer.len(p49) do
		local _ = nil
		local var1415 = nil
		local var1416, var1417, var1418 = protoModule.readTag(p49, var1414)
		local var1419 = var1416
		var1415 = var1417
		var1414 = var1418
		
		if var1415 == protoModule.wireTypes.varint then
			local _ = nil
			local var1420, var1421 = protoModule.readVarInt(p49, var1414)
			local _ = var1420
			var1414 = var1421
			continue
		end
		if var1415 == protoModule.wireTypes.lengthDelimited then
			if var1419 == 1 then
				local _ = nil
				local var1422, var1423 = protoModule.readBuffer(p49, var1414)
				var1414 = var1423
				table.insert(var1413.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1422))
			else
				local _ = nil
				local var1424, var1425 = protoModule.readVarInt(p49, var1414)
				var1414 = var1425 + var1424
			end
		elseif var1415 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1426, var1427 = protoModule.readFixed32(p49, var1414)
			local _ = var1426
			var1414 = var1427
		elseif var1415 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1428, var1429 = protoModule.readFixed64(p49, var1414)
			local _ = var1428
			var1414 = var1429
		else
			error("Unsupported wire type: " .. var2169)
		end
	end
	return var1413
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
	local var1430 = t_49.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1430.subscriptions = t_1
	end
	return var1430
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
	local var1431 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1432, var1433 = protoModule.writeTag(buff, var1431, 1, protoModule.wireTypes.lengthDelimited)
		var1432, var2191 = protoModule.writeString(var1432, var1433, self.subscription_id)
		buff = var1432
		var1431 = var1433
	end
	local buff_1 = buffer.create(var1431)
	buffer.copy(buff_1, 0, buff, 0, var1431)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref)
	local var1431 = t_50.new()
	local var1432 = 0
	while var1432 < buffer.len(p50) do
		local _ = nil
		local var1433 = nil
		local var1434, var1435, var1436 = protoModule.readTag(p50, var1432)
		local var1437 = var1434
		var1433 = var1435
		var1432 = var1436
		
		if var1433 == protoModule.wireTypes.varint then
			local _ = nil
			local var1438, var1439 = protoModule.readVarInt(p50, var1432)
			local _ = var1438
			var1432 = var1439
			continue
		end
		if var1433 == protoModule.wireTypes.lengthDelimited then
			if var1437 == 1 then
				local _ = nil
				local var1440, var1441 = protoModule.readBuffer(p50, var1432)
				var1432 = var1441
				var1431.subscription_id = buffer.tostring(var1440)
			else
				local _ = nil
				local var1442, var1443 = protoModule.readVarInt(p50, var1432)
				var1432 = var1443 + var1442
			end
		elseif var1433 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1444, var1445 = protoModule.readFixed32(p50, var1432)
			local _ = var1444
			var1432 = var1445
		elseif var1433 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1446, var1447 = protoModule.readFixed64(p50, var1432)
			local _ = var1446
			var1432 = var1447
		else
			error("Unsupported wire type: " .. var2195)
		end
	end
	return var1431
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
	local var1448 = t_50.new()
	
	if self.subscription_id ~= nil then
		var1448.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1448.subscription_id = self.subscriptionId
	end
	return var1448
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
	local var1448 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1449 = v:encode()
			local var1450, var1451 = protoModule.writeTag(buff, var1448, 1, protoModule.wireTypes.lengthDelimited)
			var1450, var2216 = protoModule.writeBuffer(var1450, var1451, var1449, buffer.len(var1449))
			buff = var1450
			var1448 = var1451
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1452, var1453 = protoModule.writeTag(buff, var1448, 2, protoModule.wireTypes.lengthDelimited)
		var1452, var2218 = protoModule.writeString(var1452, var1453, self.universe_id)
		buff = var1452
		var1448 = var1453
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1454, var1455 = protoModule.writeTag(buff, var1448, 3, protoModule.wireTypes.lengthDelimited)
		var1454, var2220 = protoModule.writeString(var1454, var1455, self.section_title)
		buff = var1454
		var1448 = var1455
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1456, var1457 = protoModule.writeTag(buff, var1448, 4, protoModule.wireTypes.lengthDelimited)
		var1456, var2222 = protoModule.writeString(var1456, var1457, self.creator_key)
		buff = var1456
		var1448 = var1457
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1458, var1459 = protoModule.writeTag(buff, var1448, 5, protoModule.wireTypes.lengthDelimited)
		var1458, var2224 = protoModule.writeString(var1458, var1459, self.collection_item_size)
		buff = var1458
		var1448 = var1459
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1460, var1461 = protoModule.writeTag(buff, var1448, 6, protoModule.wireTypes.lengthDelimited)
		var1460, var2226 = protoModule.writeString(var1460, var1461, self.item_height_mode)
		buff = var1460
		var1448 = var1461
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1462, var1463 = protoModule.writeTag(buff, var1448, 7, protoModule.wireTypes.lengthDelimited)
		var1462, var2228 = protoModule.writeString(var1462, var1463, self.experience_store_product_type)
		buff = var1462
		var1448 = var1463
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1464, var1465 = protoModule.writeTag(buff, var1448, 8, protoModule.wireTypes.lengthDelimited)
		var1464, var2230 = protoModule.writeString(var1464, var1465, self.content_type)
		buff = var1464
		var1448 = var1465
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1466, var1467 = protoModule.writeTag(buff, var1448, 9, protoModule.wireTypes.lengthDelimited)
		var1466, var2232 = protoModule.writeString(var1466, var1467, self.item_type)
		buff = var1466
		var1448 = var1467
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1468, var1469 = protoModule.writeTag(buff, var1448, 10, protoModule.wireTypes.lengthDelimited)
		var1468, var2234 = protoModule.writeString(var1468, var1469, self.filter_category_id)
		buff = var1468
		var1448 = var1469
	end
	local buff_1 = buffer.create(var1448)
	buffer.copy(buff_1, 0, buff, 0, var1448)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1470 = t_51.new()
	local var1471 = 0
	while var1471 < buffer.len(p51) do
		local _ = nil
		local var1472 = nil
		local var1473, var1474, var1475 = protoModule.readTag(p51, var1471)
		local var1476 = var1473
		var1472 = var1474
		var1471 = var1475
		
		if var1472 == protoModule.wireTypes.varint then
			local _ = nil
			local var1477, var1478 = protoModule.readVarInt(p51, var1471)
			local _ = var1477
			var1471 = var1478
			continue
		end
		if var1472 == protoModule.wireTypes.lengthDelimited then
			if var1476 == 1 then
				local _ = nil
				local var1479, var1480 = protoModule.readBuffer(p51, var1471)
				var1471 = var1480
				table.insert(var1470.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1479))
			elseif var1476 == 2 then
				local _ = nil
				local var1481, var1482 = protoModule.readBuffer(p51, var1471)
				var1471 = var1482
				var1470.universe_id = buffer.tostring(var1481)
			elseif var1476 == 3 then
				local _ = nil
				local var1483, var1484 = protoModule.readBuffer(p51, var1471)
				var1471 = var1484
				var1470.section_title = buffer.tostring(var1483)
			elseif var1476 == 4 then
				local _ = nil
				local var1485, var1486 = protoModule.readBuffer(p51, var1471)
				var1471 = var1486
				var1470.creator_key = buffer.tostring(var1485)
			elseif var1476 == 5 then
				local _ = nil
				local var1487, var1488 = protoModule.readBuffer(p51, var1471)
				var1471 = var1488
				var1470.collection_item_size = buffer.tostring(var1487)
			elseif var1476 == 6 then
				local _ = nil
				local var1489, var1490 = protoModule.readBuffer(p51, var1471)
				var1471 = var1490
				var1470.item_height_mode = buffer.tostring(var1489)
			elseif var1476 == 7 then
				local _ = nil
				local var1491, var1492 = protoModule.readBuffer(p51, var1471)
				var1471 = var1492
				var1470.experience_store_product_type = buffer.tostring(var1491)
			elseif var1476 == 8 then
				local _ = nil
				local var1493, var1494 = protoModule.readBuffer(p51, var1471)
				var1471 = var1494
				var1470.content_type = buffer.tostring(var1493)
			elseif var1476 == 9 then
				local _ = nil
				local var1495, var1496 = protoModule.readBuffer(p51, var1471)
				var1471 = var1496
				var1470.item_type = buffer.tostring(var1495)
			elseif var1476 == 10 then
				local _ = nil
				local var1497, var1498 = protoModule.readBuffer(p51, var1471)
				var1471 = var1498
				var1470.filter_category_id = buffer.tostring(var1497)
			else
				local _ = nil
				local var1499, var1500 = protoModule.readVarInt(p51, var1471)
				var1471 = var1500 + var1499
			end
		elseif var1472 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1501, var1502 = protoModule.readFixed32(p51, var1471)
			local _ = var1501
			var1471 = var1502
		elseif var1472 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1503, var1504 = protoModule.readFixed64(p51, var1471)
			local _ = var1503
			var1471 = var1504
		else
			error("Unsupported wire type: " .. var2238)
		end
	end
	return var1470
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
	local var1505 = t_51.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1505.items = t_1
	end
	if self.universe_id ~= nil then
		var1505.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1505.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1505.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1505.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1505.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1505.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1505.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1505.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1505.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1505.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1505.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1505.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1505.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1505.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1505.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1505.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1505.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1505.filter_category_id = self.filterCategoryId
	end
	return var1505
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
	local var1506 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1507, var1508 = protoModule.writeTag(buff, var1506, 1, protoModule.wireTypes.lengthDelimited)
		var1507, var2278 = protoModule.writeString(var1507, var1508, self.item_id)
		buff = var1507
		var1506 = var1508
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1509, var1510 = protoModule.writeTag(buff, var1506, 2, protoModule.wireTypes.varint)
		var1509, var2280 = protoModule.writeVarInt(var1509, var1510, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1509
		var1506 = var1510
	end
	local buff_1 = buffer.create(var1506)
	buffer.copy(buff_1, 0, buff, 0, var1506)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1506 = t_52.new()
	local var1507 = 0
	while var1507 < buffer.len(p52) do
		local _ = nil
		local var1508 = nil
		local var1509, var1510, var1511 = protoModule.readTag(p52, var1507)
		local var1512 = var1509
		var1508 = var1510
		var1507 = var1511
		
		if var1508 == protoModule.wireTypes.varint then
			if var1512 == 2 then
				local _ = nil
				local var1513, var1514 = protoModule.readVarIntI32(p52, var1507)
				local var1515 = var1513
				var1507 = var1514
				var1506.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1515) or var1515
			else
				local _ = nil
				local var1516, var1517 = protoModule.readVarInt(p52, var1507)
				local _ = var1516
				var1507 = var1517
			end
		end
		if var1508 == protoModule.wireTypes.lengthDelimited then
			if var1512 == 1 then
				local _ = nil
				local var1518, var1519 = protoModule.readBuffer(p52, var1507)
				var1507 = var1519
				var1506.item_id = buffer.tostring(var1518)
			else
				local _ = nil
				local var1520, var1521 = protoModule.readVarInt(p52, var1507)
				var1507 = var1521 + var1520
			end
		elseif var1508 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1522, var1523 = protoModule.readFixed32(p52, var1507)
			local _ = var1522
			var1507 = var1523
		elseif var1508 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1524, var1525 = protoModule.readFixed64(p52, var1507)
			local _ = var1524
			var1507 = var1525
		else
			error("Unsupported wire type: " .. var2284)
		end
	end
	return var1506
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
	local var1526 = t_52.new()
	
	if self.item_id ~= nil then
		var1526.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1526.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1526.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1526
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
	local var1526 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1527, var1528 = protoModule.writeTag(buff, var1526, 1, protoModule.wireTypes.lengthDelimited)
		var1527, var2307 = protoModule.writeString(var1527, var1528, self.roblox_component)
		buff = var1527
		var1526 = var1528
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1529, var1530 = protoModule.writeTag(buff, var1526, 2, protoModule.wireTypes.lengthDelimited)
		var1529, var2309 = protoModule.writeString(var1529, var1530, self.identifier)
		buff = var1529
		var1526 = var1530
	end
	if self.title ~= nil and self.title ~= "" then
		local var1531, var1532 = protoModule.writeTag(buff, var1526, 3, protoModule.wireTypes.lengthDelimited)
		var1531, var2311 = protoModule.writeString(var1531, var1532, self.title)
		buff = var1531
		var1526 = var1532
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1533, var1534 = protoModule.writeTag(buff, var1526, 4, protoModule.wireTypes.lengthDelimited)
		var1533, var2313 = protoModule.writeString(var1533, var1534, self.user_id)
		buff = var1533
		var1526 = var1534
	end
	if self.description ~= nil and self.description ~= "" then
		local var1535, var1536 = protoModule.writeTag(buff, var1526, 5, protoModule.wireTypes.lengthDelimited)
		var1535, var2315 = protoModule.writeString(var1535, var1536, self.description)
		buff = var1535
		var1526 = var1536
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1537, var1538 = protoModule.writeTag(buff, var1526, 6, protoModule.wireTypes.lengthDelimited)
		var1537, var2317 = protoModule.writeString(var1537, var1538, self.cta_text)
		buff = var1537
		var1526 = var1538
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1539, var1540 = protoModule.writeTag(buff, var1526, 7, protoModule.wireTypes.lengthDelimited)
		var1539, var2319 = protoModule.writeString(var1539, var1540, self.prompt_id)
		buff = var1539
		var1526 = var1540
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1541, var1542 = protoModule.writeTag(buff, var1526, 8, protoModule.wireTypes.lengthDelimited)
		var1541, var2321 = protoModule.writeString(var1541, var1542, self.prompt_type)
		buff = var1541
		var1526 = var1542
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1543, var1544 = protoModule.writeTag(buff, var1526, 9, protoModule.wireTypes.lengthDelimited)
		var1543, var2323 = protoModule.writeString(var1543, var1544, self.entity_id)
		buff = var1543
		var1526 = var1544
	end
	local buff_1 = buffer.create(var1526)
	buffer.copy(buff_1, 0, buff, 0, var1526)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref)
	local var1526 = t_53.new()
	local var1527 = 0
	while var1527 < buffer.len(p53) do
		local _ = nil
		local var1528 = nil
		local var1529, var1530, var1531 = protoModule.readTag(p53, var1527)
		local var1532 = var1529
		var1528 = var1530
		var1527 = var1531
		
		if var1528 == protoModule.wireTypes.varint then
			local _ = nil
			local var1533, var1534 = protoModule.readVarInt(p53, var1527)
			local _ = var1533
			var1527 = var1534
			continue
		end
		if var1528 == protoModule.wireTypes.lengthDelimited then
			if var1532 == 1 then
				local _ = nil
				local var1535, var1536 = protoModule.readBuffer(p53, var1527)
				var1527 = var1536
				var1526.roblox_component = buffer.tostring(var1535)
			elseif var1532 == 2 then
				local _ = nil
				local var1537, var1538 = protoModule.readBuffer(p53, var1527)
				var1527 = var1538
				var1526.identifier = buffer.tostring(var1537)
			elseif var1532 == 3 then
				local _ = nil
				local var1539, var1540 = protoModule.readBuffer(p53, var1527)
				var1527 = var1540
				var1526.title = buffer.tostring(var1539)
			elseif var1532 == 4 then
				local _ = nil
				local var1541, var1542 = protoModule.readBuffer(p53, var1527)
				var1527 = var1542
				var1526.user_id = buffer.tostring(var1541)
			elseif var1532 == 5 then
				local _ = nil
				local var1543, var1544 = protoModule.readBuffer(p53, var1527)
				var1527 = var1544
				var1526.description = buffer.tostring(var1543)
			elseif var1532 == 6 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p53, var1527)
				var1527 = var1546
				var1526.cta_text = buffer.tostring(var1545)
			elseif var1532 == 7 then
				local _ = nil
				local var1547, var1548 = protoModule.readBuffer(p53, var1527)
				var1527 = var1548
				var1526.prompt_id = buffer.tostring(var1547)
			elseif var1532 == 8 then
				local _ = nil
				local var1549, var1550 = protoModule.readBuffer(p53, var1527)
				var1527 = var1550
				var1526.prompt_type = buffer.tostring(var1549)
			elseif var1532 == 9 then
				local _ = nil
				local var1551, var1552 = protoModule.readBuffer(p53, var1527)
				var1527 = var1552
				var1526.entity_id = buffer.tostring(var1551)
			else
				local _ = nil
				local var1553, var1554 = protoModule.readVarInt(p53, var1527)
				var1527 = var1554 + var1553
			end
		elseif var1528 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1555, var1556 = protoModule.readFixed32(p53, var1527)
			local _ = var1555
			var1527 = var1556
		elseif var1528 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1557, var1558 = protoModule.readFixed64(p53, var1527)
			local _ = var1557
			var1527 = var1558
		else
			error("Unsupported wire type: " .. var2327)
		end
	end
	return var1526
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
	local var1559 = t_53.new()
	
	if self.roblox_component ~= nil then
		var1559.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1559.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1559.identifier = self.identifier
	end
	if self.title ~= nil then
		var1559.title = self.title
	end
	if self.user_id ~= nil then
		var1559.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1559.user_id = self.userId
	end
	if self.description ~= nil then
		var1559.description = self.description
	end
	if self.cta_text ~= nil then
		var1559.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1559.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1559.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1559.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1559.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1559.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1559.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1559.entity_id = self.entityId
	end
	return var1559
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
	local var1559 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1560, var1561 = protoModule.writeTag(buff, var1559, 1, protoModule.wireTypes.lengthDelimited)
		var1560, var2363 = protoModule.writeString(var1560, var1561, self.group_id)
		buff = var1560
		var1559 = var1561
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1562, var1563 = protoModule.writeTag(buff, var1559, 2, protoModule.wireTypes.lengthDelimited)
		var1562, var2365 = protoModule.writeString(var1562, var1563, self.experience_id)
		buff = var1562
		var1559 = var1563
	end
	local buff_1 = buffer.create(var1559)
	buffer.copy(buff_1, 0, buff, 0, var1559)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1559 = t_54.new()
	local var1560 = 0
	while var1560 < buffer.len(p54) do
		local _ = nil
		local var1561 = nil
		local var1562, var1563, var1564 = protoModule.readTag(p54, var1560)
		local var1565 = var1562
		var1561 = var1563
		var1560 = var1564
		
		if var1561 == protoModule.wireTypes.varint then
			local _ = nil
			local var1566, var1567 = protoModule.readVarInt(p54, var1560)
			local _ = var1566
			var1560 = var1567
			continue
		end
		if var1561 == protoModule.wireTypes.lengthDelimited then
			if var1565 == 1 then
				local _ = nil
				local var1568, var1569 = protoModule.readBuffer(p54, var1560)
				var1560 = var1569
				var1559.group_id = buffer.tostring(var1568)
			elseif var1565 == 2 then
				local _ = nil
				local var1570, var1571 = protoModule.readBuffer(p54, var1560)
				var1560 = var1571
				var1559.experience_id = buffer.tostring(var1570)
			else
				local _ = nil
				local var1572, var1573 = protoModule.readVarInt(p54, var1560)
				var1560 = var1573 + var1572
			end
		elseif var1561 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1574, var1575 = protoModule.readFixed32(p54, var1560)
			local _ = var1574
			var1560 = var1575
		elseif var1561 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1576, var1577 = protoModule.readFixed64(p54, var1560)
			local _ = var1576
			var1560 = var1577
		else
			error("Unsupported wire type: " .. var2369)
		end
	end
	return var1559
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
	local var1578 = t_54.new()
	
	if self.group_id ~= nil then
		var1578.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1578.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1578.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1578.experience_id = self.experienceId
	end
	return var1578
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
	local var1578 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1579, var1580 = protoModule.writeTag(buff, var1578, 1, protoModule.wireTypes.lengthDelimited)
		var1579, var2391 = protoModule.writeString(var1579, var1580, self.title)
		buff = var1579
		var1578 = var1580
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1581, var1582 = protoModule.writeTag(buff, var1578, 2, protoModule.wireTypes.lengthDelimited)
		var1581, var2393 = protoModule.writeString(var1581, var1582, self.dismiss_text)
		buff = var1581
		var1578 = var1582
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1583, var1584 = protoModule.writeTag(buff, var1578, 3, protoModule.wireTypes.lengthDelimited)
		var1583, var2395 = protoModule.writeString(var1583, var1584, self.user_id)
		buff = var1583
		var1578 = var1584
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1585 = v:encode()
			local var1586, var1587 = protoModule.writeTag(buff, var1578, 4, protoModule.wireTypes.lengthDelimited)
			var1586, var2398 = protoModule.writeBuffer(var1586, var1587, var1585, buffer.len(var1585))
			buff = var1586
			var1578 = var1587
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1588, var1589 = protoModule.writeTag(buff, var1578, 5, protoModule.wireTypes.lengthDelimited)
		var1588, var2400 = protoModule.writeString(var1588, var1589, self.prompt_id)
		buff = var1588
		var1578 = var1589
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1590, var1591 = protoModule.writeTag(buff, var1578, 6, protoModule.wireTypes.lengthDelimited)
		var1590, var2402 = protoModule.writeString(var1590, var1591, self.prompt_type)
		buff = var1590
		var1578 = var1591
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1592, var1593 = protoModule.writeTag(buff, var1578, 7, protoModule.wireTypes.lengthDelimited)
		var1592, var2404 = protoModule.writeString(var1592, var1593, self.sort_id)
		buff = var1592
		var1578 = var1593
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1594, var1595 = protoModule.writeTag(buff, var1578, 8, protoModule.wireTypes.lengthDelimited)
		var1594, var2406 = protoModule.writeString(var1594, var1595, self.feed_item_key)
		buff = var1594
		var1578 = var1595
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1596 = self.client_attributes.value:encode()
		local var1597, var1598 = protoModule.writeTag(buff, var1578, 9, protoModule.wireTypes.lengthDelimited)
		var1597, var2409 = protoModule.writeBuffer(var1597, var1598, var1596, buffer.len(var1596))
		buff = var1597
		var1578 = var1598
	end
	local buff_1 = buffer.create(var1578)
	buffer.copy(buff_1, 0, buff, 0, var1578)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref), t (ref)
	local var1599 = t_55.new()
	local var1600 = 0
	while var1600 < buffer.len(p55) do
		local _ = nil
		local var1601 = nil
		local var1602, var1603, var1604 = protoModule.readTag(p55, var1600)
		local var1605 = var1602
		var1601 = var1603
		var1600 = var1604
		
		if var1601 == protoModule.wireTypes.varint then
			local _ = nil
			local var1606, var1607 = protoModule.readVarInt(p55, var1600)
			local _ = var1606
			var1600 = var1607
			continue
		end
		if var1601 == protoModule.wireTypes.lengthDelimited then
			if var1605 == 1 then
				local _ = nil
				local var1608, var1609 = protoModule.readBuffer(p55, var1600)
				var1600 = var1609
				var1599.title = buffer.tostring(var1608)
			elseif var1605 == 2 then
				local _ = nil
				local var1610, var1611 = protoModule.readBuffer(p55, var1600)
				var1600 = var1611
				var1599.dismiss_text = buffer.tostring(var1610)
			elseif var1605 == 3 then
				local _ = nil
				local var1612, var1613 = protoModule.readBuffer(p55, var1600)
				var1600 = var1613
				var1599.user_id = buffer.tostring(var1612)
			elseif var1605 == 4 then
				local _ = nil
				local var1614, var1615 = protoModule.readBuffer(p55, var1600)
				var1600 = var1615
				table.insert(var1599.cards, t.CardContainerCardInputData.decode(var1614))
			elseif var1605 == 5 then
				local _ = nil
				local var1616, var1617 = protoModule.readBuffer(p55, var1600)
				var1600 = var1617
				var1599.prompt_id = buffer.tostring(var1616)
			elseif var1605 == 6 then
				local _ = nil
				local var1618, var1619 = protoModule.readBuffer(p55, var1600)
				var1600 = var1619
				var1599.prompt_type = buffer.tostring(var1618)
			elseif var1605 == 7 then
				local _ = nil
				local var1620, var1621 = protoModule.readBuffer(p55, var1600)
				var1600 = var1621
				var1599.sort_id = buffer.tostring(var1620)
			elseif var1605 == 8 then
				local _ = nil
				local var1622, var1623 = protoModule.readBuffer(p55, var1600)
				var1600 = var1623
				var1599.feed_item_key = buffer.tostring(var1622)
			elseif var1605 == 9 then
				local _ = nil
				local var1624, var1625 = protoModule.readBuffer(p55, var1600)
				var1600 = var1625
				var1599.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1624)
				}
			else
				local _ = nil
				local var1626, var1627 = protoModule.readVarInt(p55, var1600)
				var1600 = var1627 + var1626
			end
		elseif var1601 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1628, var1629 = protoModule.readFixed32(p55, var1600)
			local _ = var1628
			var1600 = var1629
		elseif var1601 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1630, var1631 = protoModule.readFixed64(p55, var1600)
			local _ = var1630
			var1600 = var1631
		else
			error("Unsupported wire type: " .. var2413)
		end
	end
	return var1599
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
	local var1632 = t_55.new()
	
	if self.title ~= nil then
		var1632.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1632.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1632.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1632.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1632.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1632.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1632.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1632.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1632.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1632.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1632.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1632.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1632.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1632.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1632.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1632.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1632
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
	local var1633 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1634, var1635 = protoModule.writeTag(buff, var1633, 1, protoModule.wireTypes.lengthDelimited)
		var1634, var2451 = protoModule.writeString(var1634, var1635, self.title)
		buff = var1634
		var1633 = var1635
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1636, var1637 = protoModule.writeTag(buff, var1633, 2, protoModule.wireTypes.lengthDelimited)
		var1636, var2453 = protoModule.writeString(var1636, var1637, self.user_id)
		buff = var1636
		var1633 = var1637
	end
	if self.description ~= nil and self.description ~= "" then
		local var1638, var1639 = protoModule.writeTag(buff, var1633, 3, protoModule.wireTypes.lengthDelimited)
		var1638, var2455 = protoModule.writeString(var1638, var1639, self.description)
		buff = var1638
		var1633 = var1639
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1640, var1641 = protoModule.writeTag(buff, var1633, 4, protoModule.wireTypes.lengthDelimited)
		var1640, var2457 = protoModule.writeString(var1640, var1641, self.cta_text)
		buff = var1640
		var1633 = var1641
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1642, var1643 = protoModule.writeTag(buff, var1633, 5, protoModule.wireTypes.lengthDelimited)
		var1642, var2459 = protoModule.writeString(var1642, var1643, self.prompt_id)
		buff = var1642
		var1633 = var1643
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1644, var1645 = protoModule.writeTag(buff, var1633, 6, protoModule.wireTypes.lengthDelimited)
		var1644, var2461 = protoModule.writeString(var1644, var1645, self.prompt_type)
		buff = var1644
		var1633 = var1645
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1646, var1647 = protoModule.writeTag(buff, var1633, 7, protoModule.wireTypes.lengthDelimited)
		var1646, var2463 = protoModule.writeString(var1646, var1647, self.entity_id)
		buff = var1646
		var1633 = var1647
	end
	local buff_1 = buffer.create(var1633)
	buffer.copy(buff_1, 0, buff, 0, var1633)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1633 = t_56.new()
	local var1634 = 0
	while var1634 < buffer.len(p56) do
		local _ = nil
		local var1635 = nil
		local var1636, var1637, var1638 = protoModule.readTag(p56, var1634)
		local var1639 = var1636
		var1635 = var1637
		var1634 = var1638
		
		if var1635 == protoModule.wireTypes.varint then
			local _ = nil
			local var1640, var1641 = protoModule.readVarInt(p56, var1634)
			local _ = var1640
			var1634 = var1641
			continue
		end
		if var1635 == protoModule.wireTypes.lengthDelimited then
			if var1639 == 1 then
				local _ = nil
				local var1642, var1643 = protoModule.readBuffer(p56, var1634)
				var1634 = var1643
				var1633.title = buffer.tostring(var1642)
			elseif var1639 == 2 then
				local _ = nil
				local var1644, var1645 = protoModule.readBuffer(p56, var1634)
				var1634 = var1645
				var1633.user_id = buffer.tostring(var1644)
			elseif var1639 == 3 then
				local _ = nil
				local var1646, var1647 = protoModule.readBuffer(p56, var1634)
				var1634 = var1647
				var1633.description = buffer.tostring(var1646)
			elseif var1639 == 4 then
				local _ = nil
				local var1648, var1649 = protoModule.readBuffer(p56, var1634)
				var1634 = var1649
				var1633.cta_text = buffer.tostring(var1648)
			elseif var1639 == 5 then
				local _ = nil
				local var1650, var1651 = protoModule.readBuffer(p56, var1634)
				var1634 = var1651
				var1633.prompt_id = buffer.tostring(var1650)
			elseif var1639 == 6 then
				local _ = nil
				local var1652, var1653 = protoModule.readBuffer(p56, var1634)
				var1634 = var1653
				var1633.prompt_type = buffer.tostring(var1652)
			elseif var1639 == 7 then
				local _ = nil
				local var1654, var1655 = protoModule.readBuffer(p56, var1634)
				var1634 = var1655
				var1633.entity_id = buffer.tostring(var1654)
			else
				local _ = nil
				local var1656, var1657 = protoModule.readVarInt(p56, var1634)
				var1634 = var1657 + var1656
			end
		elseif var1635 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1658, var1659 = protoModule.readFixed32(p56, var1634)
			local _ = var1658
			var1634 = var1659
		elseif var1635 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1660, var1661 = protoModule.readFixed64(p56, var1634)
			local _ = var1660
			var1634 = var1661
		else
			error("Unsupported wire type: " .. var2467)
		end
	end
	return var1633
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
	local var1662 = t_56.new()
	
	if self.title ~= nil then
		var1662.title = self.title
	end
	if self.user_id ~= nil then
		var1662.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1662.user_id = self.userId
	end
	if self.description ~= nil then
		var1662.description = self.description
	end
	if self.cta_text ~= nil then
		var1662.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1662.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1662.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1662.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1662.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1662.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1662.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1662.entity_id = self.entityId
	end
	return var1662
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
	local var1662 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1663, var1664 = protoModule.writeTag(buff, var1662, 1, protoModule.wireTypes.lengthDelimited)
		var1663, var2499 = protoModule.writeString(var1663, var1664, self.prompt_id)
		buff = var1663
		var1662 = var1664
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1665, var1666 = protoModule.writeTag(buff, var1662, 2, protoModule.wireTypes.lengthDelimited)
		var1665, var2501 = protoModule.writeString(var1665, var1666, self.prompt_type)
		buff = var1665
		var1662 = var1666
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1667, var1668 = protoModule.writeTag(buff, var1662, 3, protoModule.wireTypes.lengthDelimited)
		var1667, var2503 = protoModule.writeString(var1667, var1668, self.user_id)
		buff = var1667
		var1662 = var1668
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1669, var1670 = protoModule.writeTag(buff, var1662, 4, protoModule.wireTypes.lengthDelimited)
		var1669, var2505 = protoModule.writeString(var1669, var1670, self.audit_data)
		buff = var1669
		var1662 = var1670
	end
	local buff_1 = buffer.create(var1662)
	buffer.copy(buff_1, 0, buff, 0, var1662)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref)
	local var1662 = t_57.new()
	local var1663 = 0
	while var1663 < buffer.len(p57) do
		local _ = nil
		local var1664 = nil
		local var1665, var1666, var1667 = protoModule.readTag(p57, var1663)
		local var1668 = var1665
		var1664 = var1666
		var1663 = var1667
		
		if var1664 == protoModule.wireTypes.varint then
			local _ = nil
			local var1669, var1670 = protoModule.readVarInt(p57, var1663)
			local _ = var1669
			var1663 = var1670
			continue
		end
		if var1664 == protoModule.wireTypes.lengthDelimited then
			if var1668 == 1 then
				local _ = nil
				local var1671, var1672 = protoModule.readBuffer(p57, var1663)
				var1663 = var1672
				var1662.prompt_id = buffer.tostring(var1671)
			elseif var1668 == 2 then
				local _ = nil
				local var1673, var1674 = protoModule.readBuffer(p57, var1663)
				var1663 = var1674
				var1662.prompt_type = buffer.tostring(var1673)
			elseif var1668 == 3 then
				local _ = nil
				local var1675, var1676 = protoModule.readBuffer(p57, var1663)
				var1663 = var1676
				var1662.user_id = buffer.tostring(var1675)
			elseif var1668 == 4 then
				local _ = nil
				local var1677, var1678 = protoModule.readBuffer(p57, var1663)
				var1663 = var1678
				var1662.audit_data = buffer.tostring(var1677)
			else
				local _ = nil
				local var1679, var1680 = protoModule.readVarInt(p57, var1663)
				var1663 = var1680 + var1679
			end
		elseif var1664 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1681, var1682 = protoModule.readFixed32(p57, var1663)
			local _ = var1681
			var1663 = var1682
		elseif var1664 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1683, var1684 = protoModule.readFixed64(p57, var1663)
			local _ = var1683
			var1663 = var1684
		else
			error("Unsupported wire type: " .. var2509)
		end
	end
	return var1662
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
	local var1685 = t_57.new()
	
	if self.prompt_id ~= nil then
		var1685.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1685.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1685.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1685.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1685.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1685.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1685.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1685.audit_data = self.auditData
	end
	return var1685
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
	local var1685 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1686, var1687 = protoModule.writeTag(buff, var1685, 1, protoModule.wireTypes.varint)
		var1686, var2535 = protoModule.writeVarInt(var1686, var1687, self.sender_count)
		buff = var1686
		var1685 = var1687
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1688, var1689 = protoModule.writeTag(buff, var1685, 2, protoModule.wireTypes.varint)
		var1688, var2537 = protoModule.writeVarInt(var1688, var1689, self.total_robux_amount)
		buff = var1688
		var1685 = var1689
	end
	local buff_1 = buffer.create(var1685)
	buffer.copy(buff_1, 0, buff, 0, var1685)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1685 = t_58.new()
	local var1686 = 0
	while var1686 < buffer.len(p58) do
		local _ = nil
		local _ = nil
		local var1687, var1688, var1689 = protoModule.readTag(p58, var1686)
		local var1690 = var1687
		local var1691 = var1688
		var1686 = var1689
		
		if var1691 == protoModule.wireTypes.varint then
			if var1690 == 1 then
				local _ = nil
				local var1692, var1693 = protoModule.readVarIntI32(p58, var1686)
				var1686 = var1693
				var1685.sender_count = var1692
			elseif var1690 == 2 then
				local _ = nil
				local var1694, var1695 = protoModule.readVarIntI64(p58, var1686)
				var1686 = var1695
				var1685.total_robux_amount = var1694
			else
				local _ = nil
				local var1696, var1697 = protoModule.readVarInt(p58, var1686)
				local _ = var1696
				var1686 = var1697
			end
		elseif var1691 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1698, var1699 = protoModule.readVarInt(p58, var1686)
			var1686 = var1699 + var1698
		elseif var1691 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1700, var1701 = protoModule.readFixed32(p58, var1686)
			local _ = var1700
			var1686 = var1701
		elseif var1691 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1702, var1703 = protoModule.readFixed64(p58, var1686)
			local _ = var1702
			var1686 = var1703
		else
			error("Unsupported wire type: " .. var2545)
		end
	end
	return var1685
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
	local var1704 = t_58.new()
	
	if self.sender_count ~= nil then
		var1704.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1704.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1704.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1704.total_robux_amount = self.totalRobuxAmount
	end
	return var1704
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
	local var1704 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1705, var1706 = protoModule.writeTag(buff, var1704, 1, protoModule.wireTypes.lengthDelimited)
		var1705, var2563 = protoModule.writeString(var1705, var1706, self.title)
		buff = var1705
		var1704 = var1706
	end
	if self.description ~= nil and self.description ~= "" then
		local var1707, var1708 = protoModule.writeTag(buff, var1704, 2, protoModule.wireTypes.lengthDelimited)
		var1707, var2565 = protoModule.writeString(var1707, var1708, self.description)
		buff = var1707
		var1704 = var1708
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1709, var1710 = protoModule.writeTag(buff, var1704, 3, protoModule.wireTypes.lengthDelimited)
		var1709, var2567 = protoModule.writeString(var1709, var1710, self.primary_text)
		buff = var1709
		var1704 = var1710
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1711, var1712 = protoModule.writeTag(buff, var1704, 4, protoModule.wireTypes.lengthDelimited)
		var1711, var2569 = protoModule.writeString(var1711, var1712, self.secondary_text)
		buff = var1711
		var1704 = var1712
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1713, var1714 = protoModule.writeTag(buff, var1704, 5, protoModule.wireTypes.lengthDelimited)
		var1713, var2571 = protoModule.writeString(var1713, var1714, self.prompt_id)
		buff = var1713
		var1704 = var1714
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1715, var1716 = protoModule.writeTag(buff, var1704, 6, protoModule.wireTypes.lengthDelimited)
		var1715, var2573 = protoModule.writeString(var1715, var1716, self.prompt_type)
		buff = var1715
		var1704 = var1716
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1717, var1718 = protoModule.writeTag(buff, var1704, 7, protoModule.wireTypes.varint)
		var1717, var2575 = protoModule.writeVarInt(var1717, var1718, self.times_seen)
		buff = var1717
		var1704 = var1718
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1719 = self.content.value:encode()
		local var1720, var1721 = protoModule.writeTag(buff, var1704, 8, protoModule.wireTypes.lengthDelimited)
		var1720, var2578 = protoModule.writeBuffer(var1720, var1721, var1719, buffer.len(var1719))
		buff = var1720
		var1704 = var1721
	end
	if self.sort_id ~= nil then
		local var1722, var1723 = protoModule.writeTag(buff, var1704, 9, protoModule.wireTypes.lengthDelimited)
		var1722, var2580 = protoModule.writeString(var1722, var1723, self.sort_id)
		buff = var1722
		var1704 = var1723
	end
	local buff_1 = buffer.create(var1704)
	buffer.copy(buff_1, 0, buff, 0, var1704)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref), t (ref)
	local var1704 = t_59.new()
	local var1705 = 0
	while var1705 < buffer.len(p59) do
		local _ = nil
		local var1706 = nil
		local var1707, var1708, var1709 = protoModule.readTag(p59, var1705)
		local var1710 = var1707
		var1706 = var1708
		var1705 = var1709
		
		if var1706 == protoModule.wireTypes.varint then
			if var1710 == 7 then
				local _ = nil
				local var1711, var1712 = protoModule.readVarIntI32(p59, var1705)
				var1705 = var1712
				var1704.times_seen = var1711
			else
				local _ = nil
				local var1713, var1714 = protoModule.readVarInt(p59, var1705)
				local _ = var1713
				var1705 = var1714
			end
		end
		if var1706 == protoModule.wireTypes.lengthDelimited then
			if var1710 == 1 then
				local _ = nil
				local var1715, var1716 = protoModule.readBuffer(p59, var1705)
				var1705 = var1716
				var1704.title = buffer.tostring(var1715)
			elseif var1710 == 2 then
				local _ = nil
				local var1717, var1718 = protoModule.readBuffer(p59, var1705)
				var1705 = var1718
				var1704.description = buffer.tostring(var1717)
			elseif var1710 == 3 then
				local _ = nil
				local var1719, var1720 = protoModule.readBuffer(p59, var1705)
				var1705 = var1720
				var1704.primary_text = buffer.tostring(var1719)
			elseif var1710 == 4 then
				local _ = nil
				local var1721, var1722 = protoModule.readBuffer(p59, var1705)
				var1705 = var1722
				var1704.secondary_text = buffer.tostring(var1721)
			elseif var1710 == 5 then
				local _ = nil
				local var1723, var1724 = protoModule.readBuffer(p59, var1705)
				var1705 = var1724
				var1704.prompt_id = buffer.tostring(var1723)
			elseif var1710 == 6 then
				local _ = nil
				local var1725, var1726 = protoModule.readBuffer(p59, var1705)
				var1705 = var1726
				var1704.prompt_type = buffer.tostring(var1725)
			elseif var1710 == 8 then
				local _ = nil
				local var1727, var1728 = protoModule.readBuffer(p59, var1705)
				var1705 = var1728
				var1704.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1727)
				}
			elseif var1710 == 9 then
				local _ = nil
				local var1729, var1730 = protoModule.readBuffer(p59, var1705)
				var1705 = var1730
				var1704.sort_id = buffer.tostring(var1729)
			else
				local _ = nil
				local var1731, var1732 = protoModule.readVarInt(p59, var1705)
				var1705 = var1732 + var1731
			end
		elseif var1706 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1733, var1734 = protoModule.readFixed32(p59, var1705)
			local _ = var1733
			var1705 = var1734
		elseif var1706 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1735, var1736 = protoModule.readFixed64(p59, var1705)
			local _ = var1735
			var1705 = var1736
		else
			error("Unsupported wire type: " .. var2584)
		end
	end
	return var1704
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
	local var1737 = t_59.new()
	
	if self.title ~= nil then
		var1737.title = self.title
	end
	if self.description ~= nil then
		var1737.description = self.description
	end
	if self.primary_text ~= nil then
		var1737.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1737.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1737.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1737.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1737.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1737.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1737.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1737.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1737.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1737.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1737.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1737.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1737.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1737.sort_id = self.sortId
	end
	return var1737
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
	local var1737 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1738, var1739 = protoModule.writeTag(buff, var1737, 1, protoModule.wireTypes.lengthDelimited)
		var1738, var2620 = protoModule.writeString(var1738, var1739, self.tooltip_text)
		buff = var1738
		var1737 = var1739
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1740, var1741 = protoModule.writeTag(buff, var1737, 2, protoModule.wireTypes.lengthDelimited)
		var1740, var2622 = protoModule.writeString(var1740, var1741, self.prompt_id)
		buff = var1740
		var1737 = var1741
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1742, var1743 = protoModule.writeTag(buff, var1737, 3, protoModule.wireTypes.lengthDelimited)
		var1742, var2624 = protoModule.writeString(var1742, var1743, self.prompt_type)
		buff = var1742
		var1737 = var1743
	end
	local buff_1 = buffer.create(var1737)
	buffer.copy(buff_1, 0, buff, 0, var1737)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1737 = t_60.new()
	local var1738 = 0
	while var1738 < buffer.len(p60) do
		local _ = nil
		local var1739 = nil
		local var1740, var1741, var1742 = protoModule.readTag(p60, var1738)
		local var1743 = var1740
		var1739 = var1741
		var1738 = var1742
		
		if var1739 == protoModule.wireTypes.varint then
			local _ = nil
			local var1744, var1745 = protoModule.readVarInt(p60, var1738)
			local _ = var1744
			var1738 = var1745
			continue
		end
		if var1739 == protoModule.wireTypes.lengthDelimited then
			if var1743 == 1 then
				local _ = nil
				local var1746, var1747 = protoModule.readBuffer(p60, var1738)
				var1738 = var1747
				var1737.tooltip_text = buffer.tostring(var1746)
			elseif var1743 == 2 then
				local _ = nil
				local var1748, var1749 = protoModule.readBuffer(p60, var1738)
				var1738 = var1749
				var1737.prompt_id = buffer.tostring(var1748)
			elseif var1743 == 3 then
				local _ = nil
				local var1750, var1751 = protoModule.readBuffer(p60, var1738)
				var1738 = var1751
				var1737.prompt_type = buffer.tostring(var1750)
			else
				local _ = nil
				local var1752, var1753 = protoModule.readVarInt(p60, var1738)
				var1738 = var1753 + var1752
			end
		elseif var1739 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1754, var1755 = protoModule.readFixed32(p60, var1738)
			local _ = var1754
			var1738 = var1755
		elseif var1739 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1756, var1757 = protoModule.readFixed64(p60, var1738)
			local _ = var1756
			var1738 = var1757
		else
			error("Unsupported wire type: " .. var2628)
		end
	end
	return var1737
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
	local var1758 = t_60.new()
	
	if self.tooltip_text ~= nil then
		var1758.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1758.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1758.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1758.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1758.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1758.prompt_type = self.promptType
	end
	return var1758
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
	local var1758 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1759, var1760 = protoModule.writeTag(buff, var1758, 1, protoModule.wireTypes.lengthDelimited)
		var1759, var2652 = protoModule.writeString(var1759, var1760, self.media_id)
		buff = var1759
		var1758 = var1760
	end
	if self.title ~= nil and self.title ~= "" then
		local var1761, var1762 = protoModule.writeTag(buff, var1758, 2, protoModule.wireTypes.lengthDelimited)
		var1761, var2654 = protoModule.writeString(var1761, var1762, self.title)
		buff = var1761
		var1758 = var1762
	end
	if self.description ~= nil and self.description ~= "" then
		local var1763, var1764 = protoModule.writeTag(buff, var1758, 3, protoModule.wireTypes.lengthDelimited)
		var1763, var2656 = protoModule.writeString(var1763, var1764, self.description)
		buff = var1763
		var1758 = var1764
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1765, var1766 = protoModule.writeTag(buff, var1758, 4, protoModule.wireTypes.lengthDelimited)
		var1765, var2658 = protoModule.writeString(var1765, var1766, self.prompt_id)
		buff = var1765
		var1758 = var1766
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1767, var1768 = protoModule.writeTag(buff, var1758, 5, protoModule.wireTypes.lengthDelimited)
		var1767, var2660 = protoModule.writeString(var1767, var1768, self.prompt_type)
		buff = var1767
		var1758 = var1768
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1769, var1770 = protoModule.writeTag(buff, var1758, 6, protoModule.wireTypes.lengthDelimited)
		var1769, var2662 = protoModule.writeString(var1769, var1770, self.anchor_tag)
		buff = var1769
		var1758 = var1770
	end
	local buff_1 = buffer.create(var1758)
	buffer.copy(buff_1, 0, buff, 0, var1758)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1758 = t_61.new()
	local var1759 = 0
	while var1759 < buffer.len(p61) do
		local _ = nil
		local var1760 = nil
		local var1761, var1762, var1763 = protoModule.readTag(p61, var1759)
		local var1764 = var1761
		var1760 = var1762
		var1759 = var1763
		
		if var1760 == protoModule.wireTypes.varint then
			local _ = nil
			local var1765, var1766 = protoModule.readVarInt(p61, var1759)
			local _ = var1765
			var1759 = var1766
			continue
		end
		if var1760 == protoModule.wireTypes.lengthDelimited then
			if var1764 == 1 then
				local _ = nil
				local var1767, var1768 = protoModule.readBuffer(p61, var1759)
				var1759 = var1768
				var1758.media_id = buffer.tostring(var1767)
			elseif var1764 == 2 then
				local _ = nil
				local var1769, var1770 = protoModule.readBuffer(p61, var1759)
				var1759 = var1770
				var1758.title = buffer.tostring(var1769)
			elseif var1764 == 3 then
				local _ = nil
				local var1771, var1772 = protoModule.readBuffer(p61, var1759)
				var1759 = var1772
				var1758.description = buffer.tostring(var1771)
			elseif var1764 == 4 then
				local _ = nil
				local var1773, var1774 = protoModule.readBuffer(p61, var1759)
				var1759 = var1774
				var1758.prompt_id = buffer.tostring(var1773)
			elseif var1764 == 5 then
				local _ = nil
				local var1775, var1776 = protoModule.readBuffer(p61, var1759)
				var1759 = var1776
				var1758.prompt_type = buffer.tostring(var1775)
			elseif var1764 == 6 then
				local _ = nil
				local var1777, var1778 = protoModule.readBuffer(p61, var1759)
				var1759 = var1778
				var1758.anchor_tag = buffer.tostring(var1777)
			else
				local _ = nil
				local var1779, var1780 = protoModule.readVarInt(p61, var1759)
				var1759 = var1780 + var1779
			end
		elseif var1760 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1781, var1782 = protoModule.readFixed32(p61, var1759)
			local _ = var1781
			var1759 = var1782
		elseif var1760 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1783, var1784 = protoModule.readFixed64(p61, var1759)
			local _ = var1783
			var1759 = var1784
		else
			error("Unsupported wire type: " .. var2666)
		end
	end
	return var1758
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
	local var1785 = t_61.new()
	
	if self.media_id ~= nil then
		var1785.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1785.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1785.title = self.title
	end
	if self.description ~= nil then
		var1785.description = self.description
	end
	if self.prompt_id ~= nil then
		var1785.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1785.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1785.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1785.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1785.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1785.anchor_tag = self.anchorTag
	end
	return var1785
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
	local var1785 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1786, var1787 = protoModule.writeTag(buff, var1785, 1, protoModule.wireTypes.lengthDelimited)
		var1786, var2696 = protoModule.writeString(var1786, var1787, self.prompt_id)
		buff = var1786
		var1785 = var1787
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1788, var1789 = protoModule.writeTag(buff, var1785, 2, protoModule.wireTypes.lengthDelimited)
		var1788, var2698 = protoModule.writeString(var1788, var1789, self.prompt_type)
		buff = var1788
		var1785 = var1789
	end
	local buff_1 = buffer.create(var1785)
	buffer.copy(buff_1, 0, buff, 0, var1785)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1785 = t_62.new()
	local var1786 = 0
	while var1786 < buffer.len(p62) do
		local _ = nil
		local var1787 = nil
		local var1788, var1789, var1790 = protoModule.readTag(p62, var1786)
		local var1791 = var1788
		var1787 = var1789
		var1786 = var1790
		
		if var1787 == protoModule.wireTypes.varint then
			local _ = nil
			local var1792, var1793 = protoModule.readVarInt(p62, var1786)
			local _ = var1792
			var1786 = var1793
			continue
		end
		if var1787 == protoModule.wireTypes.lengthDelimited then
			if var1791 == 1 then
				local _ = nil
				local var1794, var1795 = protoModule.readBuffer(p62, var1786)
				var1786 = var1795
				var1785.prompt_id = buffer.tostring(var1794)
			elseif var1791 == 2 then
				local _ = nil
				local var1796, var1797 = protoModule.readBuffer(p62, var1786)
				var1786 = var1797
				var1785.prompt_type = buffer.tostring(var1796)
			else
				local _ = nil
				local var1798, var1799 = protoModule.readVarInt(p62, var1786)
				var1786 = var1799 + var1798
			end
		elseif var1787 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1800, var1801 = protoModule.readFixed32(p62, var1786)
			local _ = var1800
			var1786 = var1801
		elseif var1787 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1802, var1803 = protoModule.readFixed64(p62, var1786)
			local _ = var1802
			var1786 = var1803
		else
			error("Unsupported wire type: " .. var2702)
		end
	end
	return var1785
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
	local var1804 = t_62.new()
	
	if self.prompt_id ~= nil then
		var1804.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1804.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1804.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1804.prompt_type = self.promptType
	end
	return var1804
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
	local var1804 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1805, var1806 = protoModule.writeTag(buff, var1804, 1, protoModule.wireTypes.lengthDelimited)
		var1805, var2724 = protoModule.writeString(var1805, var1806, self.upsell_prompt)
		buff = var1805
		var1804 = var1806
	end
	local buff_1 = buffer.create(var1804)
	buffer.copy(buff_1, 0, buff, 0, var1804)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref)
	local var1804 = t_63.new()
	local var1805 = 0
	while var1805 < buffer.len(p63) do
		local _ = nil
		local var1806 = nil
		local var1807, var1808, var1809 = protoModule.readTag(p63, var1805)
		local var1810 = var1807
		var1806 = var1808
		var1805 = var1809
		
		if var1806 == protoModule.wireTypes.varint then
			local _ = nil
			local var1811, var1812 = protoModule.readVarInt(p63, var1805)
			local _ = var1811
			var1805 = var1812
			continue
		end
		if var1806 == protoModule.wireTypes.lengthDelimited then
			if var1810 == 1 then
				local _ = nil
				local var1813, var1814 = protoModule.readBuffer(p63, var1805)
				var1805 = var1814
				var1804.upsell_prompt = buffer.tostring(var1813)
			else
				local _ = nil
				local var1815, var1816 = protoModule.readVarInt(p63, var1805)
				var1805 = var1816 + var1815
			end
		elseif var1806 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1817, var1818 = protoModule.readFixed32(p63, var1805)
			local _ = var1817
			var1805 = var1818
		elseif var1806 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1819, var1820 = protoModule.readFixed64(p63, var1805)
			local _ = var1819
			var1805 = var1820
		else
			error("Unsupported wire type: " .. var2728)
		end
	end
	return var1804
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
	local var1821 = t_63.new()
	
	if self.upsell_prompt ~= nil then
		var1821.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1821.upsell_prompt = self.upsellPrompt
	end
	return var1821
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
	local var1821 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1822, var1823 = protoModule.writeTag(buff, var1821, 1, protoModule.wireTypes.lengthDelimited)
		var1822, var2748 = protoModule.writeString(var1822, var1823, self.modal_variant)
		buff = var1822
		var1821 = var1823
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1824, var1825 = protoModule.writeTag(buff, var1821, 2, protoModule.wireTypes.lengthDelimited)
		var1824, var2750 = protoModule.writeString(var1824, var1825, self.modal_sequence)
		buff = var1824
		var1821 = var1825
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1826, var1827 = protoModule.writeTag(buff, var1821, 3, protoModule.wireTypes.lengthDelimited)
		var1826, var2752 = protoModule.writeString(var1826, var1827, self.conversation_id)
		buff = var1826
		var1821 = var1827
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1828, var1829 = protoModule.writeTag(buff, var1821, 4, protoModule.wireTypes.lengthDelimited)
		var1828, var2754 = protoModule.writeString(var1828, var1829, self.friend_id)
		buff = var1828
		var1821 = var1829
	end
	local buff_1 = buffer.create(var1821)
	buffer.copy(buff_1, 0, buff, 0, var1821)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref)
	local var1821 = t_64.new()
	local var1822 = 0
	while var1822 < buffer.len(p64) do
		local _ = nil
		local var1823 = nil
		local var1824, var1825, var1826 = protoModule.readTag(p64, var1822)
		local var1827 = var1824
		var1823 = var1825
		var1822 = var1826
		
		if var1823 == protoModule.wireTypes.varint then
			local _ = nil
			local var1828, var1829 = protoModule.readVarInt(p64, var1822)
			local _ = var1828
			var1822 = var1829
			continue
		end
		if var1823 == protoModule.wireTypes.lengthDelimited then
			if var1827 == 1 then
				local _ = nil
				local var1830, var1831 = protoModule.readBuffer(p64, var1822)
				var1822 = var1831
				var1821.modal_variant = buffer.tostring(var1830)
			elseif var1827 == 2 then
				local _ = nil
				local var1832, var1833 = protoModule.readBuffer(p64, var1822)
				var1822 = var1833
				var1821.modal_sequence = buffer.tostring(var1832)
			elseif var1827 == 3 then
				local _ = nil
				local var1834, var1835 = protoModule.readBuffer(p64, var1822)
				var1822 = var1835
				var1821.conversation_id = buffer.tostring(var1834)
			elseif var1827 == 4 then
				local _ = nil
				local var1836, var1837 = protoModule.readBuffer(p64, var1822)
				var1822 = var1837
				var1821.friend_id = buffer.tostring(var1836)
			else
				local _ = nil
				local var1838, var1839 = protoModule.readVarInt(p64, var1822)
				var1822 = var1839 + var1838
			end
		elseif var1823 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1840, var1841 = protoModule.readFixed32(p64, var1822)
			local _ = var1840
			var1822 = var1841
		elseif var1823 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1842, var1843 = protoModule.readFixed64(p64, var1822)
			local _ = var1842
			var1822 = var1843
		else
			error("Unsupported wire type: " .. var2758)
		end
	end
	return var1821
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
	local var1844 = t_64.new()
	
	if self.modal_variant ~= nil then
		var1844.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1844.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1844.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1844.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1844.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1844.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1844.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1844.friend_id = self.friendId
	end
	return var1844
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
	local var1844 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1845, var1846 = protoModule.writeTag(buff, var1844, 1, protoModule.wireTypes.lengthDelimited)
		var1845, var2784 = protoModule.writeString(var1845, var1846, self.event_id)
		buff = var1845
		var1844 = var1846
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1847, var1848 = protoModule.writeTag(buff, var1844, 2, protoModule.wireTypes.lengthDelimited)
		var1847, var2786 = protoModule.writeString(var1847, var1848, self.universe_id)
		buff = var1847
		var1844 = var1848
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1849, var1850 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1849, var2788 = protoModule.writeString(var1849, var1850, i)
			local var1851 = v:encode()
			var1850, var2790 = protoModule.writeTag(var1849, var1850, 2, protoModule.wireTypes.lengthDelimited)
			var1850, var2790 = protoModule.writeBuffer(var1850, var2790, var1851, buffer.len(var1851))
			local var1852 = var1850
			local var1853 = var2790
			local var1854, var1855 = protoModule.writeTag(buff, var1844, 3, protoModule.wireTypes.lengthDelimited)
			var1854, var2794 = protoModule.writeBuffer(var1854, var1855, var1852, var1853)
			buff = var1854
			var1844 = var1855
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1856, var1857 = protoModule.writeTag(buff, var1844, 4, protoModule.wireTypes.lengthDelimited)
			var1856, var2796 = protoModule.writeString(var1856, var1857, v)
			buff = var1856
			var1844 = var1857
		end
	end
	local buff_1 = buffer.create(var1844)
	buffer.copy(buff_1, 0, buff, 0, var1844)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref), t (ref)
	local var1858 = t_65.new()
	local var1859 = 0
	while var1859 < buffer.len(p65) do
		local _ = nil
		local var1860 = nil
		local var1861, var1862, var1863 = protoModule.readTag(p65, var1859)
		local var1864 = var1861
		var1860 = var1862
		var1859 = var1863
		
		if var1860 == protoModule.wireTypes.varint then
			local _ = nil
			local var1865, var1866 = protoModule.readVarInt(p65, var1859)
			local _ = var1865
			var1859 = var1866
			continue
		end
		if var1860 == protoModule.wireTypes.lengthDelimited then
			if var1864 == 1 then
				local _ = nil
				local var1867, var1868 = protoModule.readBuffer(p65, var1859)
				var1859 = var1868
				var1858.event_id = buffer.tostring(var1867)
			elseif var1864 == 2 then
				local _ = nil
				local var1869, var1870 = protoModule.readBuffer(p65, var1859)
				var1859 = var1870
				var1858.universe_id = buffer.tostring(var1869)
			elseif var1864 == 3 then
				local _ = nil
				local var1871, var1872 = protoModule.readBuffer(p65, var1859)
				var1859 = var1872
				var1871 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1871)
				var1858.entry_map[var1871.key or ""] = var1871.value or t.FeedEntry.new()
			elseif var1864 == 4 then
				local _ = nil
				local var1873, var1874 = protoModule.readBuffer(p65, var1859)
				var1859 = var1874
				table.insert(var1858.entry_order, buffer.tostring(var1873))
			else
				local _ = nil
				local var1875, var1876 = protoModule.readVarInt(p65, var1859)
				var1859 = var1876 + var1875
			end
		elseif var1860 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1877, var1878 = protoModule.readFixed32(p65, var1859)
			local _ = var1877
			var1859 = var1878
		elseif var1860 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1879, var1880 = protoModule.readFixed64(p65, var1859)
			local _ = var1879
			var1859 = var1880
		else
			error("Unsupported wire type: " .. var2800)
		end
	end
	return var1858
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
	local var1881 = t_65.new()
	
	if self.event_id ~= nil then
		var1881.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1881.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1881.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1881.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1881.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1881.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1881.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1881.entry_order = t_1
	end
	return var1881
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
	local var1882 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1883, var1884 = protoModule.writeTag(buff, var1882, 1, protoModule.wireTypes.lengthDelimited)
		var1883, var2832 = protoModule.writeString(var1883, var1884, self.key)
		buff = var1883
		var1882 = var1884
	end
	if self.value ~= nil then
		local var1885 = self.value:encode()
		local var1886, var1887 = protoModule.writeTag(buff, var1882, 2, protoModule.wireTypes.lengthDelimited)
		var1886, var2835 = protoModule.writeBuffer(var1886, var1887, var1885, buffer.len(var1885))
		buff = var1886
		var1882 = var1887
	end
	local buff_1 = buffer.create(var1882)
	buffer.copy(buff_1, 0, buff, 0, var1882)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1882 = t_66.new()
	local var1883 = 0
	while var1883 < buffer.len(p66) do
		local _ = nil
		local var1884 = nil
		local var1885, var1886, var1887 = protoModule.readTag(p66, var1883)
		local var1888 = var1885
		var1884 = var1886
		var1883 = var1887
		
		if var1884 == protoModule.wireTypes.varint then
			local _ = nil
			local var1889, var1890 = protoModule.readVarInt(p66, var1883)
			local _ = var1889
			var1883 = var1890
			continue
		end
		if var1884 == protoModule.wireTypes.lengthDelimited then
			if var1888 == 1 then
				local _ = nil
				local var1891, var1892 = protoModule.readBuffer(p66, var1883)
				var1883 = var1892
				var1882.key = buffer.tostring(var1891)
			elseif var1888 == 2 then
				local _ = nil
				local var1893, var1894 = protoModule.readBuffer(p66, var1883)
				var1883 = var1894
				var1882.value = t.FeedEntry.decode(var1893)
			else
				local _ = nil
				local var1895, var1896 = protoModule.readVarInt(p66, var1883)
				var1883 = var1896 + var1895
			end
		elseif var1884 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1897, var1898 = protoModule.readFixed32(p66, var1883)
			local _ = var1897
			var1883 = var1898
		elseif var1884 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1899, var1900 = protoModule.readFixed64(p66, var1883)
			local _ = var1899
			var1883 = var1900
		else
			error("Unsupported wire type: " .. var2839)
		end
	end
	return var1882
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
	local var1901 = t_66.new()
	
	if self.key ~= nil then
		var1901.key = self.key
	end
	if self.value ~= nil then
		var1901.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1901
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
	local var1901 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1902, var1903 = protoModule.writeTag(buff, var1901, 1, protoModule.wireTypes.lengthDelimited)
		var1902, var2861 = protoModule.writeString(var1902, var1903, self.event_id)
		buff = var1902
		var1901 = var1903
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1904, var1905 = protoModule.writeTag(buff, var1901, 2, protoModule.wireTypes.lengthDelimited)
		var1904, var2863 = protoModule.writeString(var1904, var1905, self.universe_id)
		buff = var1904
		var1901 = var1905
	end
	local buff_1 = buffer.create(var1901)
	buffer.copy(buff_1, 0, buff, 0, var1901)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref)
	local var1901 = t_67.new()
	local var1902 = 0
	while var1902 < buffer.len(p67) do
		local _ = nil
		local var1903 = nil
		local var1904, var1905, var1906 = protoModule.readTag(p67, var1902)
		local var1907 = var1904
		var1903 = var1905
		var1902 = var1906
		
		if var1903 == protoModule.wireTypes.varint then
			local _ = nil
			local var1908, var1909 = protoModule.readVarInt(p67, var1902)
			local _ = var1908
			var1902 = var1909
			continue
		end
		if var1903 == protoModule.wireTypes.lengthDelimited then
			if var1907 == 1 then
				local _ = nil
				local var1910, var1911 = protoModule.readBuffer(p67, var1902)
				var1902 = var1911
				var1901.event_id = buffer.tostring(var1910)
			elseif var1907 == 2 then
				local _ = nil
				local var1912, var1913 = protoModule.readBuffer(p67, var1902)
				var1902 = var1913
				var1901.universe_id = buffer.tostring(var1912)
			else
				local _ = nil
				local var1914, var1915 = protoModule.readVarInt(p67, var1902)
				var1902 = var1915 + var1914
			end
		elseif var1903 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1916, var1917 = protoModule.readFixed32(p67, var1902)
			local _ = var1916
			var1902 = var1917
		elseif var1903 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1918, var1919 = protoModule.readFixed64(p67, var1902)
			local _ = var1918
			var1902 = var1919
		else
			error("Unsupported wire type: " .. var2867)
		end
	end
	return var1901
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
	local var1920 = t_67.new()
	
	if self.event_id ~= nil then
		var1920.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1920.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1920.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1920.universe_id = self.universeId
	end
	return var1920
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
	local var1920 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1921, var1922 = protoModule.writeTag(buff, var1920, 1, protoModule.wireTypes.lengthDelimited)
		var1921, var2889 = protoModule.writeString(var1921, var1922, self.event_id)
		buff = var1921
		var1920 = var1922
	end
	local buff_1 = buffer.create(var1920)
	buffer.copy(buff_1, 0, buff, 0, var1920)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1920 = t_68.new()
	local var1921 = 0
	while var1921 < buffer.len(p68) do
		local _ = nil
		local var1922 = nil
		local var1923, var1924, var1925 = protoModule.readTag(p68, var1921)
		local var1926 = var1923
		var1922 = var1924
		var1921 = var1925
		
		if var1922 == protoModule.wireTypes.varint then
			local _ = nil
			local var1927, var1928 = protoModule.readVarInt(p68, var1921)
			local _ = var1927
			var1921 = var1928
			continue
		end
		if var1922 == protoModule.wireTypes.lengthDelimited then
			if var1926 == 1 then
				local _ = nil
				local var1929, var1930 = protoModule.readBuffer(p68, var1921)
				var1921 = var1930
				var1920.event_id = buffer.tostring(var1929)
			else
				local _ = nil
				local var1931, var1932 = protoModule.readVarInt(p68, var1921)
				var1921 = var1932 + var1931
			end
		elseif var1922 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1933, var1934 = protoModule.readFixed32(p68, var1921)
			local _ = var1933
			var1921 = var1934
		elseif var1922 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1935, var1936 = protoModule.readFixed64(p68, var1921)
			local _ = var1935
			var1921 = var1936
		else
			error("Unsupported wire type: " .. var2893)
		end
	end
	return var1920
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
	local var1937 = t_68.new()
	
	if self.event_id ~= nil then
		var1937.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1937.event_id = self.eventId
	end
	return var1937
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
	local var1937 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1938, var1939 = protoModule.writeTag(buff, var1937, 1, protoModule.wireTypes.lengthDelimited)
		var1938, var2913 = protoModule.writeString(var1938, var1939, self.event_id)
		buff = var1938
		var1937 = var1939
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1940, var1941 = protoModule.writeTag(buff, var1937, 2, protoModule.wireTypes.lengthDelimited)
		var1940, var2915 = protoModule.writeString(var1940, var1941, self.universe_id)
		buff = var1940
		var1937 = var1941
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var1942 = v:encode()
			local var1943, var1944 = protoModule.writeTag(buff, var1937, 3, protoModule.wireTypes.lengthDelimited)
			var1943, var2918 = protoModule.writeBuffer(var1943, var1944, var1942, buffer.len(var1942))
			buff = var1943
			var1937 = var1944
		end
	end
	local buff_1 = buffer.create(var1937)
	buffer.copy(buff_1, 0, buff, 0, var1937)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref), t (ref)
	local var1945 = t_69.new()
	local var1946 = 0
	while var1946 < buffer.len(p69) do
		local _ = nil
		local var1947 = nil
		local var1948, var1949, var1950 = protoModule.readTag(p69, var1946)
		local var1951 = var1948
		var1947 = var1949
		var1946 = var1950
		
		if var1947 == protoModule.wireTypes.varint then
			local _ = nil
			local var1952, var1953 = protoModule.readVarInt(p69, var1946)
			local _ = var1952
			var1946 = var1953
			continue
		end
		if var1947 == protoModule.wireTypes.lengthDelimited then
			if var1951 == 1 then
				local _ = nil
				local var1954, var1955 = protoModule.readBuffer(p69, var1946)
				var1946 = var1955
				var1945.event_id = buffer.tostring(var1954)
			elseif var1951 == 2 then
				local _ = nil
				local var1956, var1957 = protoModule.readBuffer(p69, var1946)
				var1946 = var1957
				var1945.universe_id = buffer.tostring(var1956)
			elseif var1951 == 3 then
				local _ = nil
				local var1958, var1959 = protoModule.readBuffer(p69, var1946)
				var1946 = var1959
				table.insert(var1945.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var1958))
			else
				local _ = nil
				local var1960, var1961 = protoModule.readVarInt(p69, var1946)
				var1946 = var1961 + var1960
			end
		elseif var1947 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1962, var1963 = protoModule.readFixed32(p69, var1946)
			local _ = var1962
			var1946 = var1963
		elseif var1947 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1964, var1965 = protoModule.readFixed64(p69, var1946)
			local _ = var1964
			var1946 = var1965
		else
			error("Unsupported wire type: " .. var2922)
		end
	end
	return var1945
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
	local var1966 = t_69.new()
	
	if self.event_id ~= nil then
		var1966.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1966.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1966.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1966.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1966.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1966.rsvp_users = t_1
	end
	return var1966
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
	local var1967 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var1968, var1969 = protoModule.writeTag(buff, var1967, 1, protoModule.wireTypes.varint)
		var1968, var2949 = protoModule.writeVarInt(var1968, var1969, self.user_id)
		buff = var1968
		var1967 = var1969
	end
	local buff_1 = buffer.create(var1967)
	buffer.copy(buff_1, 0, buff, 0, var1967)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var1967 = t_70.new()
	local var1968 = 0
	while var1968 < buffer.len(p70) do
		local _ = nil
		local _ = nil
		local var1969, var1970, var1971 = protoModule.readTag(p70, var1968)
		local var1972 = var1969
		local var1973 = var1970
		var1968 = var1971
		
		if var1973 == protoModule.wireTypes.varint then
			if var1972 == 1 then
				local _ = nil
				local var1974, var1975 = protoModule.readVarIntI64(p70, var1968)
				var1968 = var1975
				var1967.user_id = var1974
			else
				local _ = nil
				local var1976, var1977 = protoModule.readVarInt(p70, var1968)
				local _ = var1976
				var1968 = var1977
			end
		elseif var1973 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1978, var1979 = protoModule.readVarInt(p70, var1968)
			var1968 = var1979 + var1978
		elseif var1973 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1980, var1981 = protoModule.readFixed32(p70, var1968)
			local _ = var1980
			var1968 = var1981
		elseif var1973 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1982, var1983 = protoModule.readFixed64(p70, var1968)
			local _ = var1982
			var1968 = var1983
		else
			error("Unsupported wire type: " .. var2957)
		end
	end
	return var1967
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
	local var1984 = t_70.new()
	
	if self.user_id ~= nil then
		var1984.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1984.user_id = self.userId
	end
	return var1984
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
	local var1984 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1985, var1986 = protoModule.writeTag(buff, var1984, 1, protoModule.wireTypes.lengthDelimited)
		var1985, var2973 = protoModule.writeString(var1985, var1986, self.event_id)
		buff = var1985
		var1984 = var1986
	end
	local buff_1 = buffer.create(var1984)
	buffer.copy(buff_1, 0, buff, 0, var1984)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var1984 = t_71.new()
	local var1985 = 0
	while var1985 < buffer.len(p71) do
		local _ = nil
		local var1986 = nil
		local var1987, var1988, var1989 = protoModule.readTag(p71, var1985)
		local var1990 = var1987
		var1986 = var1988
		var1985 = var1989
		
		if var1986 == protoModule.wireTypes.varint then
			local _ = nil
			local var1991, var1992 = protoModule.readVarInt(p71, var1985)
			local _ = var1991
			var1985 = var1992
			continue
		end
		if var1986 == protoModule.wireTypes.lengthDelimited then
			if var1990 == 1 then
				local _ = nil
				local var1993, var1994 = protoModule.readBuffer(p71, var1985)
				var1985 = var1994
				var1984.event_id = buffer.tostring(var1993)
			else
				local _ = nil
				local var1995, var1996 = protoModule.readVarInt(p71, var1985)
				var1985 = var1996 + var1995
			end
		elseif var1986 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1997, var1998 = protoModule.readFixed32(p71, var1985)
			local _ = var1997
			var1985 = var1998
		elseif var1986 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1999, var2000 = protoModule.readFixed64(p71, var1985)
			local _ = var1999
			var1985 = var2000
		else
			error("Unsupported wire type: " .. var2977)
		end
	end
	return var1984
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
	local var2001 = t_71.new()
	
	if self.event_id ~= nil then
		var2001.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2001.event_id = self.eventId
	end
	return var2001
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
	local var2001 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2002, var2003 = protoModule.writeTag(buff, var2001, 1, protoModule.wireTypes.lengthDelimited)
		var2002, var2997 = protoModule.writeString(var2002, var2003, self.event_id)
		buff = var2002
		var2001 = var2003
	end
	local buff_1 = buffer.create(var2001)
	buffer.copy(buff_1, 0, buff, 0, var2001)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2001 = t_72.new()
	local var2002 = 0
	while var2002 < buffer.len(p72) do
		local _ = nil
		local var2003 = nil
		local var2004, var2005, var2006 = protoModule.readTag(p72, var2002)
		local var2007 = var2004
		var2003 = var2005
		var2002 = var2006
		
		if var2003 == protoModule.wireTypes.varint then
			local _ = nil
			local var2008, var2009 = protoModule.readVarInt(p72, var2002)
			local _ = var2008
			var2002 = var2009
			continue
		end
		if var2003 == protoModule.wireTypes.lengthDelimited then
			if var2007 == 1 then
				local _ = nil
				local var2010, var2011 = protoModule.readBuffer(p72, var2002)
				var2002 = var2011
				var2001.event_id = buffer.tostring(var2010)
			else
				local _ = nil
				local var2012, var2013 = protoModule.readVarInt(p72, var2002)
				var2002 = var2013 + var2012
			end
		elseif var2003 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2014, var2015 = protoModule.readFixed32(p72, var2002)
			local _ = var2014
			var2002 = var2015
		elseif var2003 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2016, var2017 = protoModule.readFixed64(p72, var2002)
			local _ = var2016
			var2002 = var2017
		else
			error("Unsupported wire type: " .. var3001)
		end
	end
	return var2001
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
	local var2018 = t_72.new()
	
	if self.event_id ~= nil then
		var2018.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2018.event_id = self.eventId
	end
	return var2018
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
	local var2018 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2019, var2020 = protoModule.writeTag(buff, var2018, 1, protoModule.wireTypes.lengthDelimited)
		var2019, var3021 = protoModule.writeString(var2019, var2020, self.event_id)
		buff = var2019
		var2018 = var2020
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2021, var2022 = protoModule.writeTag(buff, var2018, 2, protoModule.wireTypes.lengthDelimited)
		var2021, var3023 = protoModule.writeString(var2021, var2022, self.universe_id)
		buff = var2021
		var2018 = var2022
	end
	local buff_1 = buffer.create(var2018)
	buffer.copy(buff_1, 0, buff, 0, var2018)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2018 = t_73.new()
	local var2019 = 0
	while var2019 < buffer.len(p73) do
		local _ = nil
		local var2020 = nil
		local var2021, var2022, var2023 = protoModule.readTag(p73, var2019)
		local var2024 = var2021
		var2020 = var2022
		var2019 = var2023
		
		if var2020 == protoModule.wireTypes.varint then
			local _ = nil
			local var2025, var2026 = protoModule.readVarInt(p73, var2019)
			local _ = var2025
			var2019 = var2026
			continue
		end
		if var2020 == protoModule.wireTypes.lengthDelimited then
			if var2024 == 1 then
				local _ = nil
				local var2027, var2028 = protoModule.readBuffer(p73, var2019)
				var2019 = var2028
				var2018.event_id = buffer.tostring(var2027)
			elseif var2024 == 2 then
				local _ = nil
				local var2029, var2030 = protoModule.readBuffer(p73, var2019)
				var2019 = var2030
				var2018.universe_id = buffer.tostring(var2029)
			else
				local _ = nil
				local var2031, var2032 = protoModule.readVarInt(p73, var2019)
				var2019 = var2032 + var2031
			end
		elseif var2020 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2033, var2034 = protoModule.readFixed32(p73, var2019)
			local _ = var2033
			var2019 = var2034
		elseif var2020 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2035, var2036 = protoModule.readFixed64(p73, var2019)
			local _ = var2035
			var2019 = var2036
		else
			error("Unsupported wire type: " .. var3027)
		end
	end
	return var2018
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
	local var2037 = t_73.new()
	
	if self.event_id ~= nil then
		var2037.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2037.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2037.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2037.universe_id = self.universeId
	end
	return var2037
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
	local var2037 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2038, var2039 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2038, var3049 = protoModule.writeString(var2038, var2039, i)
			local var2040 = v:encode()
			var2039, var3051 = protoModule.writeTag(var2038, var2039, 2, protoModule.wireTypes.lengthDelimited)
			var2039, var3051 = protoModule.writeBuffer(var2039, var3051, var2040, buffer.len(var2040))
			local var2041 = var2039
			local var2042 = var3051
			local var2043, var2044 = protoModule.writeTag(buff, var2037, 1, protoModule.wireTypes.lengthDelimited)
			var2043, var3055 = protoModule.writeBuffer(var2043, var2044, var2041, var2042)
			buff = var2043
			var2037 = var2044
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2045, var2046 = protoModule.writeTag(buff, var2037, 2, protoModule.wireTypes.lengthDelimited)
			var2045, var3057 = protoModule.writeString(var2045, var2046, v)
			buff = var2045
			var2037 = var2046
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2047, var2048 = protoModule.writeTag(buff, var2037, 3, protoModule.wireTypes.lengthDelimited)
		var2047, var3059 = protoModule.writeString(var2047, var2048, self.next_page_token)
		buff = var2047
		var2037 = var2048
	end
	if self.sticky_filter_pills ~= nil then
		local var2049 = self.sticky_filter_pills:encode()
		local var2050, var2051 = protoModule.writeTag(buff, var2037, 4, protoModule.wireTypes.lengthDelimited)
		var2050, var3062 = protoModule.writeBuffer(var2050, var2051, var2049, buffer.len(var2049))
		buff = var2050
		var2037 = var2051
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2052, var2053 = protoModule.writeTag(buff, var2037, 5, protoModule.wireTypes.lengthDelimited)
		var2052, var3064 = protoModule.writeString(var2052, var2053, self.applied_filters)
		buff = var2052
		var2037 = var2053
	end
	local buff_1 = buffer.create(var2037)
	buffer.copy(buff_1, 0, buff, 0, var2037)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2054 = t_74.new()
	local var2055 = 0
	while var2055 < buffer.len(p74) do
		local _ = nil
		local var2056 = nil
		local var2057, var2058, var2059 = protoModule.readTag(p74, var2055)
		local var2060 = var2057
		var2056 = var2058
		var2055 = var2059
		
		if var2056 == protoModule.wireTypes.varint then
			local _ = nil
			local var2061, var2062 = protoModule.readVarInt(p74, var2055)
			local _ = var2061
			var2055 = var2062
			continue
		end
		if var2056 == protoModule.wireTypes.lengthDelimited then
			if var2060 == 1 then
				local _ = nil
				local var2063, var2064 = protoModule.readBuffer(p74, var2055)
				var2055 = var2064
				var2063 = t.ChartsFeedInputData_EntryMapEntry.decode(var2063)
				var2054.entry_map[var2063.key or ""] = var2063.value or t.FeedEntry.new()
			elseif var2060 == 2 then
				local _ = nil
				local var2065, var2066 = protoModule.readBuffer(p74, var2055)
				var2055 = var2066
				table.insert(var2054.entry_order, buffer.tostring(var2065))
			elseif var2060 == 3 then
				local _ = nil
				local var2067, var2068 = protoModule.readBuffer(p74, var2055)
				var2055 = var2068
				var2054.next_page_token = buffer.tostring(var2067)
			elseif var2060 == 4 then
				local _ = nil
				local var2069, var2070 = protoModule.readBuffer(p74, var2055)
				var2055 = var2070
				var2054.sticky_filter_pills = t.FilterPillsInputData.decode(var2069)
			elseif var2060 == 5 then
				local _ = nil
				local var2071, var2072 = protoModule.readBuffer(p74, var2055)
				var2055 = var2072
				var2054.applied_filters = buffer.tostring(var2071)
			else
				local _ = nil
				local var2073, var2074 = protoModule.readVarInt(p74, var2055)
				var2055 = var2074 + var2073
			end
		elseif var2056 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2075, var2076 = protoModule.readFixed32(p74, var2055)
			local _ = var2075
			var2055 = var2076
		elseif var2056 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2077, var2078 = protoModule.readFixed64(p74, var2055)
			local _ = var2077
			var2055 = var2078
		else
			error("Unsupported wire type: " .. var3068)
		end
	end
	return var2054
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
	local var2079 = t_74.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2079.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2079.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2079.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2079.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2079.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2079.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2079.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2079.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2079.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2079.applied_filters = self.appliedFilters
	end
	return var2079
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
	local var2080 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2081, var2082 = protoModule.writeTag(buff, var2080, 1, protoModule.wireTypes.lengthDelimited)
		var2081, var3102 = protoModule.writeString(var2081, var2082, self.key)
		buff = var2081
		var2080 = var2082
	end
	if self.value ~= nil then
		local var2083 = self.value:encode()
		local var2084, var2085 = protoModule.writeTag(buff, var2080, 2, protoModule.wireTypes.lengthDelimited)
		var2084, var3105 = protoModule.writeBuffer(var2084, var2085, var2083, buffer.len(var2083))
		buff = var2084
		var2080 = var2085
	end
	local buff_1 = buffer.create(var2080)
	buffer.copy(buff_1, 0, buff, 0, var2080)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2080 = t_75.new()
	local var2081 = 0
	while var2081 < buffer.len(p75) do
		local _ = nil
		local var2082 = nil
		local var2083, var2084, var2085 = protoModule.readTag(p75, var2081)
		local var2086 = var2083
		var2082 = var2084
		var2081 = var2085
		
		if var2082 == protoModule.wireTypes.varint then
			local _ = nil
			local var2087, var2088 = protoModule.readVarInt(p75, var2081)
			local _ = var2087
			var2081 = var2088
			continue
		end
		if var2082 == protoModule.wireTypes.lengthDelimited then
			if var2086 == 1 then
				local _ = nil
				local var2089, var2090 = protoModule.readBuffer(p75, var2081)
				var2081 = var2090
				var2080.key = buffer.tostring(var2089)
			elseif var2086 == 2 then
				local _ = nil
				local var2091, var2092 = protoModule.readBuffer(p75, var2081)
				var2081 = var2092
				var2080.value = t.FeedEntry.decode(var2091)
			else
				local _ = nil
				local var2093, var2094 = protoModule.readVarInt(p75, var2081)
				var2081 = var2094 + var2093
			end
		elseif var2082 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2095, var2096 = protoModule.readFixed32(p75, var2081)
			local _ = var2095
			var2081 = var2096
		elseif var2082 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2097, var2098 = protoModule.readFixed64(p75, var2081)
			local _ = var2097
			var2081 = var2098
		else
			error("Unsupported wire type: " .. var3109)
		end
	end
	return var2080
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
	local var2099 = t_75.new()
	
	if self.key ~= nil then
		var2099.key = self.key
	end
	if self.value ~= nil then
		var2099.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2099
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
	local var2099 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2100 = v:encode()
			local var2101, var2102 = protoModule.writeTag(buff, var2099, 1, protoModule.wireTypes.lengthDelimited)
			var2101, var3132 = protoModule.writeBuffer(var2101, var2102, var2100, buffer.len(var2100))
			buff = var2101
			var2099 = var2102
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2103, var2104 = protoModule.writeTag(buff, var2099, 2, protoModule.wireTypes.lengthDelimited)
		var2103, var3134 = protoModule.writeString(var2103, var2104, self.sort_id)
		buff = var2103
		var2099 = var2104
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2105, var2106 = protoModule.writeTag(buff, var2099, 3, protoModule.wireTypes.varint)
		var2105, var3136 = protoModule.writeVarInt(var2105, var2106, self.secondary_sort_id)
		buff = var2105
		var2099 = var2106
	end
	if self.title ~= nil and self.title ~= "" then
		local var2107, var2108 = protoModule.writeTag(buff, var2099, 4, protoModule.wireTypes.lengthDelimited)
		var2107, var3138 = protoModule.writeString(var2107, var2108, self.title)
		buff = var2107
		var2099 = var2108
	end
	if self.primary_sort_id ~= nil then
		local var2109, var2110 = protoModule.writeTag(buff, var2099, 5, protoModule.wireTypes.varint)
		var2109, var3140 = protoModule.writeVarInt(var2109, var2110, self.primary_sort_id)
		buff = var2109
		var2099 = var2110
	end
	if self.applied_filters ~= nil then
		local var2111, var2112 = protoModule.writeTag(buff, var2099, 6, protoModule.wireTypes.lengthDelimited)
		var2111, var3142 = protoModule.writeString(var2111, var2112, self.applied_filters)
		buff = var2111
		var2099 = var2112
	end
	local buff_1 = buffer.create(var2099)
	buffer.copy(buff_1, 0, buff, 0, var2099)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2113 = t_76.new()
	local var2114 = 0
	while var2114 < buffer.len(p76) do
		local _ = nil
		local var2115 = nil
		local var2116, var2117, var2118 = protoModule.readTag(p76, var2114)
		local var2119 = var2116
		var2115 = var2117
		var2114 = var2118
		
		if var2115 == protoModule.wireTypes.varint then
			if var2119 == 3 then
				local _ = nil
				local var2120, var2121 = protoModule.readVarIntI32(p76, var2114)
				var2114 = var2121
				var2113.secondary_sort_id = var2120
			elseif var2119 == 5 then
				local _ = nil
				local var2122, var2123 = protoModule.readVarIntI32(p76, var2114)
				var2114 = var2123
				var2113.primary_sort_id = var2122
			else
				local _ = nil
				local var2124, var2125 = protoModule.readVarInt(p76, var2114)
				local _ = var2124
				var2114 = var2125
			end
		end
		if var2115 == protoModule.wireTypes.lengthDelimited then
			if var2119 == 1 then
				local _ = nil
				local var2126, var2127 = protoModule.readBuffer(p76, var2114)
				var2114 = var2127
				table.insert(var2113.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2126))
			elseif var2119 == 2 then
				local _ = nil
				local var2128, var2129 = protoModule.readBuffer(p76, var2114)
				var2114 = var2129
				var2113.sort_id = buffer.tostring(var2128)
			elseif var2119 == 4 then
				local _ = nil
				local var2130, var2131 = protoModule.readBuffer(p76, var2114)
				var2114 = var2131
				var2113.title = buffer.tostring(var2130)
			elseif var2119 == 6 then
				local _ = nil
				local var2132, var2133 = protoModule.readBuffer(p76, var2114)
				var2114 = var2133
				var2113.applied_filters = buffer.tostring(var2132)
			else
				local _ = nil
				local var2134, var2135 = protoModule.readVarInt(p76, var2114)
				var2114 = var2135 + var2134
			end
		elseif var2115 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2136, var2137 = protoModule.readFixed32(p76, var2114)
			local _ = var2136
			var2114 = var2137
		elseif var2115 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2138, var2139 = protoModule.readFixed64(p76, var2114)
			local _ = var2138
			var2114 = var2139
		else
			error("Unsupported wire type: " .. var3146)
		end
	end
	return var2113
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
	local var2140 = t_76.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2140.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2140.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2140.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2140.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2140.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2140.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2140.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2140.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2140.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2140.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2140.applied_filters = self.appliedFilters
	end
	return var2140
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
	local var2141 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2142, var2143 = protoModule.writeTag(buff, var2141, 1, protoModule.wireTypes.lengthDelimited)
		var2142, var3179 = protoModule.writeString(var2142, var2143, self.filter_id)
		buff = var2142
		var2141 = var2143
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2144, var2145 = protoModule.writeTag(buff, var2141, 2, protoModule.wireTypes.lengthDelimited)
		var2144, var3181 = protoModule.writeString(var2144, var2145, self.display_name)
		buff = var2144
		var2141 = var2145
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2146 = v:encode()
			local var2147, var2148 = protoModule.writeTag(buff, var2141, 3, protoModule.wireTypes.lengthDelimited)
			var2147, var3184 = protoModule.writeBuffer(var2147, var2148, var2146, buffer.len(var2146))
			buff = var2147
			var2141 = var2148
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2149, var2150 = protoModule.writeTag(buff, var2141, 4, protoModule.wireTypes.lengthDelimited)
		var2149, var3186 = protoModule.writeString(var2149, var2150, self.default_option_id)
		buff = var2149
		var2141 = var2150
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2151, var2152 = protoModule.writeTag(buff, var2141, 5, protoModule.wireTypes.lengthDelimited)
		var2151, var3188 = protoModule.writeString(var2151, var2152, self.selected_option_id)
		buff = var2151
		var2141 = var2152
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2153, var2154 = protoModule.writeTag(buff, var2141, 6, protoModule.wireTypes.lengthDelimited)
		var2153, var3190 = protoModule.writeString(var2153, var2154, self.filter_type)
		buff = var2153
		var2141 = var2154
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2155, var2156 = protoModule.writeTag(buff, var2141, 7, protoModule.wireTypes.lengthDelimited)
			var2155, var3192 = protoModule.writeString(var2155, var2156, v)
			buff = var2155
			var2141 = var2156
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2157, var2158 = protoModule.writeTag(buff, var2141, 8, protoModule.wireTypes.lengthDelimited)
		var2157, var3194 = protoModule.writeString(var2157, var2158, self.info_text)
		buff = var2157
		var2141 = var2158
	end
	local buff_1 = buffer.create(var2141)
	buffer.copy(buff_1, 0, buff, 0, var2141)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2159 = t_77.new()
	local var2160 = 0
	while var2160 < buffer.len(p77) do
		local _ = nil
		local var2161 = nil
		local var2162, var2163, var2164 = protoModule.readTag(p77, var2160)
		local var2165 = var2162
		var2161 = var2163
		var2160 = var2164
		
		if var2161 == protoModule.wireTypes.varint then
			local _ = nil
			local var2166, var2167 = protoModule.readVarInt(p77, var2160)
			local _ = var2166
			var2160 = var2167
			continue
		end
		if var2161 == protoModule.wireTypes.lengthDelimited then
			if var2165 == 1 then
				local _ = nil
				local var2168, var2169 = protoModule.readBuffer(p77, var2160)
				var2160 = var2169
				var2159.filter_id = buffer.tostring(var2168)
			elseif var2165 == 2 then
				local _ = nil
				local var2170, var2171 = protoModule.readBuffer(p77, var2160)
				var2160 = var2171
				var2159.display_name = buffer.tostring(var2170)
			elseif var2165 == 3 then
				local _ = nil
				local var2172, var2173 = protoModule.readBuffer(p77, var2160)
				var2160 = var2173
				table.insert(var2159.options, t.FilterPillsInputData_FilterOption.decode(var2172))
			elseif var2165 == 4 then
				local _ = nil
				local var2174, var2175 = protoModule.readBuffer(p77, var2160)
				var2160 = var2175
				var2159.default_option_id = buffer.tostring(var2174)
			elseif var2165 == 5 then
				local _ = nil
				local var2176, var2177 = protoModule.readBuffer(p77, var2160)
				var2160 = var2177
				var2159.selected_option_id = buffer.tostring(var2176)
			elseif var2165 == 6 then
				local _ = nil
				local var2178, var2179 = protoModule.readBuffer(p77, var2160)
				var2160 = var2179
				var2159.filter_type = buffer.tostring(var2178)
			elseif var2165 == 7 then
				local _ = nil
				local var2180, var2181 = protoModule.readBuffer(p77, var2160)
				var2160 = var2181
				table.insert(var2159.inactive_option_ids, buffer.tostring(var2180))
			elseif var2165 == 8 then
				local _ = nil
				local var2182, var2183 = protoModule.readBuffer(p77, var2160)
				var2160 = var2183
				var2159.info_text = buffer.tostring(var2182)
			else
				local _ = nil
				local var2184, var2185 = protoModule.readVarInt(p77, var2160)
				var2160 = var2185 + var2184
			end
		elseif var2161 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2186, var2187 = protoModule.readFixed32(p77, var2160)
			local _ = var2186
			var2160 = var2187
		elseif var2161 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2188, var2189 = protoModule.readFixed64(p77, var2160)
			local _ = var2188
			var2160 = var2189
		else
			error("Unsupported wire type: " .. var3198)
		end
	end
	return var2159
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
	local var2190 = t_77.new()
	
	if self.filter_id ~= nil then
		var2190.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2190.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2190.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2190.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2190.options = t_1
	end
	if self.default_option_id ~= nil then
		var2190.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2190.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2190.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2190.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2190.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2190.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2190.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2190.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2190.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2190.info_text = self.infoText
	end
	return var2190
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
	local var2191 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2192, var2193 = protoModule.writeTag(buff, var2191, 1, protoModule.wireTypes.lengthDelimited)
		var2192, var3237 = protoModule.writeString(var2192, var2193, self.option_id)
		buff = var2192
		var2191 = var2193
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2194, var2195 = protoModule.writeTag(buff, var2191, 2, protoModule.wireTypes.lengthDelimited)
		var2194, var3239 = protoModule.writeString(var2194, var2195, self.display_name)
		buff = var2194
		var2191 = var2195
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2196, var2197 = protoModule.writeTag(buff, var2191, 3, protoModule.wireTypes.lengthDelimited)
		var2196, var3241 = protoModule.writeString(var2196, var2197, self.option_context_tag)
		buff = var2196
		var2191 = var2197
	end
	local buff_1 = buffer.create(var2191)
	buffer.copy(buff_1, 0, buff, 0, var2191)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var2191 = t_78.new()
	local var2192 = 0
	while var2192 < buffer.len(p78) do
		local _ = nil
		local var2193 = nil
		local var2194, var2195, var2196 = protoModule.readTag(p78, var2192)
		local var2197 = var2194
		var2193 = var2195
		var2192 = var2196
		
		if var2193 == protoModule.wireTypes.varint then
			local _ = nil
			local var2198, var2199 = protoModule.readVarInt(p78, var2192)
			local _ = var2198
			var2192 = var2199
			continue
		end
		if var2193 == protoModule.wireTypes.lengthDelimited then
			if var2197 == 1 then
				local _ = nil
				local var2200, var2201 = protoModule.readBuffer(p78, var2192)
				var2192 = var2201
				var2191.option_id = buffer.tostring(var2200)
			elseif var2197 == 2 then
				local _ = nil
				local var2202, var2203 = protoModule.readBuffer(p78, var2192)
				var2192 = var2203
				var2191.display_name = buffer.tostring(var2202)
			elseif var2197 == 3 then
				local _ = nil
				local var2204, var2205 = protoModule.readBuffer(p78, var2192)
				var2192 = var2205
				var2191.option_context_tag = buffer.tostring(var2204)
			else
				local _ = nil
				local var2206, var2207 = protoModule.readVarInt(p78, var2192)
				var2192 = var2207 + var2206
			end
		elseif var2193 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2208, var2209 = protoModule.readFixed32(p78, var2192)
			local _ = var2208
			var2192 = var2209
		elseif var2193 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2210, var2211 = protoModule.readFixed64(p78, var2192)
			local _ = var2210
			var2192 = var2211
		else
			error("Unsupported wire type: " .. var3245)
		end
	end
	return var2191
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
	local var2212 = t_78.new()
	
	if self.option_id ~= nil then
		var2212.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2212.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2212.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2212.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2212.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2212.option_context_tag = self.optionContextTag
	end
	return var2212
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
	local var2212 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2213 = v:encode()
			local var2214, var2215 = protoModule.writeTag(buff, var2212, 1, protoModule.wireTypes.lengthDelimited)
			var2214, var3270 = protoModule.writeBuffer(var2214, var2215, var2213, buffer.len(var2213))
			buff = var2214
			var2212 = var2215
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2216, var2217 = protoModule.writeTag(buff, var2212, 2, protoModule.wireTypes.lengthDelimited)
		var2216, var3272 = protoModule.writeString(var2216, var2217, self.selected_sort_id)
		buff = var2216
		var2212 = var2217
	end
	local buff_1 = buffer.create(var2212)
	buffer.copy(buff_1, 0, buff, 0, var2212)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2218 = t_79.new()
	local var2219 = 0
	while var2219 < buffer.len(p79) do
		local _ = nil
		local var2220 = nil
		local var2221, var2222, var2223 = protoModule.readTag(p79, var2219)
		local var2224 = var2221
		var2220 = var2222
		var2219 = var2223
		
		if var2220 == protoModule.wireTypes.varint then
			local _ = nil
			local var2225, var2226 = protoModule.readVarInt(p79, var2219)
			local _ = var2225
			var2219 = var2226
			continue
		end
		if var2220 == protoModule.wireTypes.lengthDelimited then
			if var2224 == 1 then
				local _ = nil
				local var2227, var2228 = protoModule.readBuffer(p79, var2219)
				var2219 = var2228
				table.insert(var2218.sort_options, t.SortSelectorInputData_SortOption.decode(var2227))
			elseif var2224 == 2 then
				local _ = nil
				local var2229, var2230 = protoModule.readBuffer(p79, var2219)
				var2219 = var2230
				var2218.selected_sort_id = buffer.tostring(var2229)
			else
				local _ = nil
				local var2231, var2232 = protoModule.readVarInt(p79, var2219)
				var2219 = var2232 + var2231
			end
		elseif var2220 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2233, var2234 = protoModule.readFixed32(p79, var2219)
			local _ = var2233
			var2219 = var2234
		elseif var2220 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2235, var2236 = protoModule.readFixed64(p79, var2219)
			local _ = var2235
			var2219 = var2236
		else
			error("Unsupported wire type: " .. var3276)
		end
	end
	return var2218
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
	local var2237 = t_79.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2237.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2237.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2237.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2237.selected_sort_id = self.selectedSortId
	end
	return var2237
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
	local var2238 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2239, var2240 = protoModule.writeTag(buff, var2238, 1, protoModule.wireTypes.lengthDelimited)
		var2239, var3301 = protoModule.writeString(var2239, var2240, self.sort_id)
		buff = var2239
		var2238 = var2240
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2241, var2242 = protoModule.writeTag(buff, var2238, 2, protoModule.wireTypes.lengthDelimited)
		var2241, var3303 = protoModule.writeString(var2241, var2242, self.display_name)
		buff = var2241
		var2238 = var2242
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2243, var2244 = protoModule.writeTag(buff, var2238, 3, protoModule.wireTypes.lengthDelimited)
		var2243, var3305 = protoModule.writeString(var2243, var2244, self.content_type)
		buff = var2243
		var2238 = var2244
	end
	local buff_1 = buffer.create(var2238)
	buffer.copy(buff_1, 0, buff, 0, var2238)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref)
	local var2238 = t_80.new()
	local var2239 = 0
	while var2239 < buffer.len(p80) do
		local _ = nil
		local var2240 = nil
		local var2241, var2242, var2243 = protoModule.readTag(p80, var2239)
		local var2244 = var2241
		var2240 = var2242
		var2239 = var2243
		
		if var2240 == protoModule.wireTypes.varint then
			local _ = nil
			local var2245, var2246 = protoModule.readVarInt(p80, var2239)
			local _ = var2245
			var2239 = var2246
			continue
		end
		if var2240 == protoModule.wireTypes.lengthDelimited then
			if var2244 == 1 then
				local _ = nil
				local var2247, var2248 = protoModule.readBuffer(p80, var2239)
				var2239 = var2248
				var2238.sort_id = buffer.tostring(var2247)
			elseif var2244 == 2 then
				local _ = nil
				local var2249, var2250 = protoModule.readBuffer(p80, var2239)
				var2239 = var2250
				var2238.display_name = buffer.tostring(var2249)
			elseif var2244 == 3 then
				local _ = nil
				local var2251, var2252 = protoModule.readBuffer(p80, var2239)
				var2239 = var2252
				var2238.content_type = buffer.tostring(var2251)
			else
				local _ = nil
				local var2253, var2254 = protoModule.readVarInt(p80, var2239)
				var2239 = var2254 + var2253
			end
		elseif var2240 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2255, var2256 = protoModule.readFixed32(p80, var2239)
			local _ = var2255
			var2239 = var2256
		elseif var2240 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2257, var2258 = protoModule.readFixed64(p80, var2239)
			local _ = var2257
			var2239 = var2258
		else
			error("Unsupported wire type: " .. var3309)
		end
	end
	return var2238
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
	local var2259 = t_80.new()
	
	if self.sort_id ~= nil then
		var2259.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2259.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2259.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2259.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2259.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2259.content_type = self.contentType
	end
	return var2259
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
	local var2259 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2260, var2261 = protoModule.writeTag(buff, var2259, 1, protoModule.wireTypes.lengthDelimited)
		var2260, var3333 = protoModule.writeString(var2260, var2261, self.selected_option)
		buff = var2260
		var2259 = var2261
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2262 = v:encode()
			local var2263, var2264 = protoModule.writeTag(buff, var2259, 2, protoModule.wireTypes.lengthDelimited)
			var2263, var3336 = protoModule.writeBuffer(var2263, var2264, var2262, buffer.len(var2262))
			buff = var2263
			var2259 = var2264
		end
	end
	if self.experience_carousel ~= nil then
		local var2265 = self.experience_carousel:encode()
		local var2266, var2267 = protoModule.writeTag(buff, var2259, 3, protoModule.wireTypes.lengthDelimited)
		var2266, var3339 = protoModule.writeBuffer(var2266, var2267, var2265, buffer.len(var2265))
		buff = var2266
		var2259 = var2267
	end
	local buff_1 = buffer.create(var2259)
	buffer.copy(buff_1, 0, buff, 0, var2259)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2268 = t_81.new()
	local var2269 = 0
	while var2269 < buffer.len(p81) do
		local _ = nil
		local var2270 = nil
		local var2271, var2272, var2273 = protoModule.readTag(p81, var2269)
		local var2274 = var2271
		var2270 = var2272
		var2269 = var2273
		
		if var2270 == protoModule.wireTypes.varint then
			local _ = nil
			local var2275, var2276 = protoModule.readVarInt(p81, var2269)
			local _ = var2275
			var2269 = var2276
			continue
		end
		if var2270 == protoModule.wireTypes.lengthDelimited then
			if var2274 == 1 then
				local _ = nil
				local var2277, var2278 = protoModule.readBuffer(p81, var2269)
				var2269 = var2278
				var2268.selected_option = buffer.tostring(var2277)
			elseif var2274 == 2 then
				local _ = nil
				local var2279, var2280 = protoModule.readBuffer(p81, var2269)
				var2269 = var2280
				table.insert(var2268.options, t.SelectorOption.decode(var2279))
			elseif var2274 == 3 then
				local _ = nil
				local var2281, var2282 = protoModule.readBuffer(p81, var2269)
				var2269 = var2282
				var2268.experience_carousel = t.ExperienceCarouselInputData.decode(var2281)
			else
				local _ = nil
				local var2283, var2284 = protoModule.readVarInt(p81, var2269)
				var2269 = var2284 + var2283
			end
		elseif var2270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2285, var2286 = protoModule.readFixed32(p81, var2269)
			local _ = var2285
			var2269 = var2286
		elseif var2270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2287, var2288 = protoModule.readFixed64(p81, var2269)
			local _ = var2287
			var2269 = var2288
		else
			error("Unsupported wire type: " .. var3343)
		end
	end
	return var2268
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
	local var2289 = t_81.new()
	
	if self.selected_option ~= nil then
		var2289.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2289.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2289.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2289.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2289.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2289
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
	local var2290 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2291, var2292 = protoModule.writeTag(buff, var2290, 1, protoModule.wireTypes.lengthDelimited)
		var2291, var3369 = protoModule.writeString(var2291, var2292, self.id)
		buff = var2291
		var2290 = var2292
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2293, var2294 = protoModule.writeTag(buff, var2290, 4, protoModule.wireTypes.varint)
		var2293, var3371 = protoModule.writeVarInt(var2293, var2294, self.preview_rows)
		buff = var2293
		var2290 = var2294
	end
	if self.widget_style ~= nil then
		local var2295 = self.widget_style:encode()
		local var2296, var2297 = protoModule.writeTag(buff, var2290, 3, protoModule.wireTypes.lengthDelimited)
		var2296, var3374 = protoModule.writeBuffer(var2296, var2297, var2295, buffer.len(var2295))
		buff = var2296
		var2290 = var2297
	end
	if self.see_all_button then
		local var2298, var2299 = protoModule.writeTag(buff, var2290, 5, protoModule.wireTypes.varint)
		var2298, var3376 = protoModule.writeVarInt(var2298, var2299, if self.see_all_button then 1 else 0)
		buff = var2298
		var2290 = var2299
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2300, var2301 = protoModule.writeTag(buff, var2290, 6, protoModule.wireTypes.lengthDelimited)
		var2300, var3378 = protoModule.writeString(var2300, var2301, self.information_popover_text)
		buff = var2300
		var2290 = var2301
	end
	local buff_1 = buffer.create(var2290)
	buffer.copy(buff_1, 0, buff, 0, var2290)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2290 = t_82.new()
	local var2291 = 0
	while var2291 < buffer.len(p82) do
		local _ = nil
		local var2292 = nil
		local var2293, var2294, var2295 = protoModule.readTag(p82, var2291)
		local var2296 = var2293
		var2292 = var2294
		var2291 = var2295
		
		if var2292 == protoModule.wireTypes.varint then
			if var2296 == 4 then
				local _ = nil
				local var2297, var2298 = protoModule.readVarIntI64(p82, var2291)
				var2291 = var2298
				var2290.preview_rows = var2297
			elseif var2296 == 5 then
				local _ = nil
				local var2299, var2300 = protoModule.readVarInt(p82, var2291)
				var2291 = var2300
				var2290.see_all_button = var2299 ~= 0
			else
				local _ = nil
				local var2301, var2302 = protoModule.readVarInt(p82, var2291)
				local _ = var2301
				var2291 = var2302
			end
		end
		if var2292 == protoModule.wireTypes.lengthDelimited then
			if var2296 == 1 then
				local _ = nil
				local var2303, var2304 = protoModule.readBuffer(p82, var2291)
				var2291 = var2304
				var2290.id = buffer.tostring(var2303)
			elseif var2296 == 3 then
				local _ = nil
				local var2305, var2306 = protoModule.readBuffer(p82, var2291)
				var2291 = var2306
				var2290.widget_style = t.WidgetStyleData.decode(var2305)
			elseif var2296 == 6 then
				local _ = nil
				local var2307, var2308 = protoModule.readBuffer(p82, var2291)
				var2291 = var2308
				var2290.information_popover_text = buffer.tostring(var2307)
			else
				local _ = nil
				local var2309, var2310 = protoModule.readVarInt(p82, var2291)
				var2291 = var2310 + var2309
			end
		elseif var2292 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2311, var2312 = protoModule.readFixed32(p82, var2291)
			local _ = var2311
			var2291 = var2312
		elseif var2292 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2313, var2314 = protoModule.readFixed64(p82, var2291)
			local _ = var2313
			var2291 = var2314
		else
			error("Unsupported wire type: " .. var3382)
		end
	end
	return var2290
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
	local var2315 = t_82.new()
	
	if self.id ~= nil then
		var2315.id = self.id
	end
	if self.preview_rows ~= nil then
		var2315.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2315.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2315.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2315.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2315.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2315.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2315.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2315.information_popover_text = self.informationPopoverText
	end
	return var2315
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
	local var2315 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2316, var2317 = protoModule.writeTag(buff, var2315, 1, protoModule.wireTypes.lengthDelimited)
		var2316, var3410 = protoModule.writeString(var2316, var2317, self.id)
		buff = var2316
		var2315 = var2317
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2318, var2319 = protoModule.writeTag(buff, var2315, 5, protoModule.wireTypes.varint)
		var2318, var3412 = protoModule.writeVarInt(var2318, var2319, self.num_items_to_show)
		buff = var2318
		var2315 = var2319
	end
	if self.widget_style ~= nil then
		local var2320 = self.widget_style:encode()
		local var2321, var2322 = protoModule.writeTag(buff, var2315, 3, protoModule.wireTypes.lengthDelimited)
		var2321, var3415 = protoModule.writeBuffer(var2321, var2322, var2320, buffer.len(var2320))
		buff = var2321
		var2315 = var2322
	end
	if self.see_all_button then
		local var2323, var2324 = protoModule.writeTag(buff, var2315, 6, protoModule.wireTypes.varint)
		var2323, var3417 = protoModule.writeVarInt(var2323, var2324, if self.see_all_button then 1 else 0)
		buff = var2323
		var2315 = var2324
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2325, var2326 = protoModule.writeTag(buff, var2315, 7, protoModule.wireTypes.lengthDelimited)
		var2325, var3419 = protoModule.writeString(var2325, var2326, self.information_popover_text)
		buff = var2325
		var2315 = var2326
	end
	local buff_1 = buffer.create(var2315)
	buffer.copy(buff_1, 0, buff, 0, var2315)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2315 = t_83.new()
	local var2316 = 0
	while var2316 < buffer.len(p83) do
		local _ = nil
		local var2317 = nil
		local var2318, var2319, var2320 = protoModule.readTag(p83, var2316)
		local var2321 = var2318
		var2317 = var2319
		var2316 = var2320
		
		if var2317 == protoModule.wireTypes.varint then
			if var2321 == 5 then
				local _ = nil
				local var2322, var2323 = protoModule.readVarIntI64(p83, var2316)
				var2316 = var2323
				var2315.num_items_to_show = var2322
			elseif var2321 == 6 then
				local _ = nil
				local var2324, var2325 = protoModule.readVarInt(p83, var2316)
				var2316 = var2325
				var2315.see_all_button = var2324 ~= 0
			else
				local _ = nil
				local var2326, var2327 = protoModule.readVarInt(p83, var2316)
				local _ = var2326
				var2316 = var2327
			end
		end
		if var2317 == protoModule.wireTypes.lengthDelimited then
			if var2321 == 1 then
				local _ = nil
				local var2328, var2329 = protoModule.readBuffer(p83, var2316)
				var2316 = var2329
				var2315.id = buffer.tostring(var2328)
			elseif var2321 == 3 then
				local _ = nil
				local var2330, var2331 = protoModule.readBuffer(p83, var2316)
				var2316 = var2331
				var2315.widget_style = t.WidgetStyleData.decode(var2330)
			elseif var2321 == 7 then
				local _ = nil
				local var2332, var2333 = protoModule.readBuffer(p83, var2316)
				var2316 = var2333
				var2315.information_popover_text = buffer.tostring(var2332)
			else
				local _ = nil
				local var2334, var2335 = protoModule.readVarInt(p83, var2316)
				var2316 = var2335 + var2334
			end
		elseif var2317 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2336, var2337 = protoModule.readFixed32(p83, var2316)
			local _ = var2336
			var2316 = var2337
		elseif var2317 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2338, var2339 = protoModule.readFixed64(p83, var2316)
			local _ = var2338
			var2316 = var2339
		else
			error("Unsupported wire type: " .. var3423)
		end
	end
	return var2315
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
	local var2340 = t_83.new()
	
	if self.id ~= nil then
		var2340.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2340.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2340.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2340.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2340.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2340.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2340.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2340.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2340.information_popover_text = self.informationPopoverText
	end
	return var2340
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
	local var2340 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2341 = v:encode()
			local var2342, var2343 = protoModule.writeTag(buff, var2340, 1, protoModule.wireTypes.lengthDelimited)
			var2342, var3452 = protoModule.writeBuffer(var2342, var2343, var2341, buffer.len(var2341))
			buff = var2342
			var2340 = var2343
		end
	end
	local buff_1 = buffer.create(var2340)
	buffer.copy(buff_1, 0, buff, 0, var2340)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2344 = t_84.new()
	local var2345 = 0
	while var2345 < buffer.len(p84) do
		local _ = nil
		local var2346 = nil
		local var2347, var2348, var2349 = protoModule.readTag(p84, var2345)
		local var2350 = var2347
		var2346 = var2348
		var2345 = var2349
		
		if var2346 == protoModule.wireTypes.varint then
			local _ = nil
			local var2351, var2352 = protoModule.readVarInt(p84, var2345)
			local _ = var2351
			var2345 = var2352
			continue
		end
		if var2346 == protoModule.wireTypes.lengthDelimited then
			if var2350 == 1 then
				local _ = nil
				local var2353, var2354 = protoModule.readBuffer(p84, var2345)
				var2345 = var2354
				table.insert(var2344.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2353))
			else
				local _ = nil
				local var2355, var2356 = protoModule.readVarInt(p84, var2345)
				var2345 = var2356 + var2355
			end
		elseif var2346 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2357, var2358 = protoModule.readFixed32(p84, var2345)
			local _ = var2357
			var2345 = var2358
		elseif var2346 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2359, var2360 = protoModule.readFixed64(p84, var2345)
			local _ = var2359
			var2345 = var2360
		else
			error("Unsupported wire type: " .. var3456)
		end
	end
	return var2344
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
	local var2361 = t_84.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2361.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2361.background_layers = t
	end
	return var2361
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
	local var2362 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2363, var2364 = protoModule.writeTag(buff, var2362, 1, protoModule.wireTypes.lengthDelimited)
		var2363, var3479 = protoModule.writeString(var2363, var2364, self.id)
		buff = var2363
		var2362 = var2364
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2365, var2366 = protoModule.writeTag(buff, var2362, 2, protoModule.wireTypes.lengthDelimited)
		var2365, var3481 = protoModule.writeString(var2365, var2366, self.available_until)
		buff = var2365
		var2362 = var2366
	end
	if self.widget_style ~= nil then
		local var2367 = self.widget_style:encode()
		local var2368, var2369 = protoModule.writeTag(buff, var2362, 3, protoModule.wireTypes.lengthDelimited)
		var2368, var3484 = protoModule.writeBuffer(var2368, var2369, var2367, buffer.len(var2367))
		buff = var2368
		var2362 = var2369
	end
	local buff_1 = buffer.create(var2362)
	buffer.copy(buff_1, 0, buff, 0, var2362)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2362 = t_85.new()
	local var2363 = 0
	while var2363 < buffer.len(p85) do
		local _ = nil
		local var2364 = nil
		local var2365, var2366, var2367 = protoModule.readTag(p85, var2363)
		local var2368 = var2365
		var2364 = var2366
		var2363 = var2367
		
		if var2364 == protoModule.wireTypes.varint then
			local _ = nil
			local var2369, var2370 = protoModule.readVarInt(p85, var2363)
			local _ = var2369
			var2363 = var2370
			continue
		end
		if var2364 == protoModule.wireTypes.lengthDelimited then
			if var2368 == 1 then
				local _ = nil
				local var2371, var2372 = protoModule.readBuffer(p85, var2363)
				var2363 = var2372
				var2362.id = buffer.tostring(var2371)
			elseif var2368 == 2 then
				local _ = nil
				local var2373, var2374 = protoModule.readBuffer(p85, var2363)
				var2363 = var2374
				var2362.available_until = buffer.tostring(var2373)
			elseif var2368 == 3 then
				local _ = nil
				local var2375, var2376 = protoModule.readBuffer(p85, var2363)
				var2363 = var2376
				var2362.widget_style = t.WidgetStyleData.decode(var2375)
			else
				local _ = nil
				local var2377, var2378 = protoModule.readVarInt(p85, var2363)
				var2363 = var2378 + var2377
			end
		elseif var2364 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2379, var2380 = protoModule.readFixed32(p85, var2363)
			local _ = var2379
			var2363 = var2380
		elseif var2364 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2381, var2382 = protoModule.readFixed64(p85, var2363)
			local _ = var2381
			var2363 = var2382
		else
			error("Unsupported wire type: " .. var3488)
		end
	end
	return var2362
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
	local var2383 = t_85.new()
	
	if self.id ~= nil then
		var2383.id = self.id
	end
	if self.available_until ~= nil then
		var2383.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2383.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2383.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2383.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2383
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
	local var2383 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2384, var2385 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2384, var3512 = protoModule.writeString(var2384, var2385, i)
			local var2386 = v:encode()
			var2385, var3514 = protoModule.writeTag(var2384, var2385, 2, protoModule.wireTypes.lengthDelimited)
			var2385, var3514 = protoModule.writeBuffer(var2385, var3514, var2386, buffer.len(var2386))
			local var2387 = var2385
			local var2388 = var3514
			local var2389, var2390 = protoModule.writeTag(buff, var2383, 1, protoModule.wireTypes.lengthDelimited)
			var2389, var3518 = protoModule.writeBuffer(var2389, var2390, var2387, var2388)
			buff = var2389
			var2383 = var2390
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2391, var2392 = protoModule.writeTag(buff, var2383, 2, protoModule.wireTypes.lengthDelimited)
			var2391, var3520 = protoModule.writeString(var2391, var2392, v)
			buff = var2391
			var2383 = var2392
		end
	end
	local buff_1 = buffer.create(var2383)
	buffer.copy(buff_1, 0, buff, 0, var2383)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2393 = t_86.new()
	local var2394 = 0
	while var2394 < buffer.len(p86) do
		local _ = nil
		local var2395 = nil
		local var2396, var2397, var2398 = protoModule.readTag(p86, var2394)
		local var2399 = var2396
		var2395 = var2397
		var2394 = var2398
		
		if var2395 == protoModule.wireTypes.varint then
			local _ = nil
			local var2400, var2401 = protoModule.readVarInt(p86, var2394)
			local _ = var2400
			var2394 = var2401
			continue
		end
		if var2395 == protoModule.wireTypes.lengthDelimited then
			if var2399 == 1 then
				local _ = nil
				local var2402, var2403 = protoModule.readBuffer(p86, var2394)
				var2394 = var2403
				var2402 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2402)
				var2393.entry_map[var2402.key or ""] = var2402.value or t.FeedEntry.new()
			elseif var2399 == 2 then
				local _ = nil
				local var2404, var2405 = protoModule.readBuffer(p86, var2394)
				var2394 = var2405
				table.insert(var2393.entry_order, buffer.tostring(var2404))
			else
				local _ = nil
				local var2406, var2407 = protoModule.readVarInt(p86, var2394)
				var2394 = var2407 + var2406
			end
		elseif var2395 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2408, var2409 = protoModule.readFixed32(p86, var2394)
			local _ = var2408
			var2394 = var2409
		elseif var2395 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2410, var2411 = protoModule.readFixed64(p86, var2394)
			local _ = var2410
			var2394 = var2411
		else
			error("Unsupported wire type: " .. var3524)
		end
	end
	return var2393
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
	local var2412 = t_86.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2412.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2412.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2412.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2412.entry_order = t_1
	end
	return var2412
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
	local var2413 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2414, var2415 = protoModule.writeTag(buff, var2413, 1, protoModule.wireTypes.lengthDelimited)
		var2414, var3552 = protoModule.writeString(var2414, var2415, self.key)
		buff = var2414
		var2413 = var2415
	end
	if self.value ~= nil then
		local var2416 = self.value:encode()
		local var2417, var2418 = protoModule.writeTag(buff, var2413, 2, protoModule.wireTypes.lengthDelimited)
		var2417, var3555 = protoModule.writeBuffer(var2417, var2418, var2416, buffer.len(var2416))
		buff = var2417
		var2413 = var2418
	end
	local buff_1 = buffer.create(var2413)
	buffer.copy(buff_1, 0, buff, 0, var2413)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2413 = t_87.new()
	local var2414 = 0
	while var2414 < buffer.len(p87) do
		local _ = nil
		local var2415 = nil
		local var2416, var2417, var2418 = protoModule.readTag(p87, var2414)
		local var2419 = var2416
		var2415 = var2417
		var2414 = var2418
		
		if var2415 == protoModule.wireTypes.varint then
			local _ = nil
			local var2420, var2421 = protoModule.readVarInt(p87, var2414)
			local _ = var2420
			var2414 = var2421
			continue
		end
		if var2415 == protoModule.wireTypes.lengthDelimited then
			if var2419 == 1 then
				local _ = nil
				local var2422, var2423 = protoModule.readBuffer(p87, var2414)
				var2414 = var2423
				var2413.key = buffer.tostring(var2422)
			elseif var2419 == 2 then
				local _ = nil
				local var2424, var2425 = protoModule.readBuffer(p87, var2414)
				var2414 = var2425
				var2413.value = t.FeedEntry.decode(var2424)
			else
				local _ = nil
				local var2426, var2427 = protoModule.readVarInt(p87, var2414)
				var2414 = var2427 + var2426
			end
		elseif var2415 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2428, var2429 = protoModule.readFixed32(p87, var2414)
			local _ = var2428
			var2414 = var2429
		elseif var2415 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2430, var2431 = protoModule.readFixed64(p87, var2414)
			local _ = var2430
			var2414 = var2431
		else
			error("Unsupported wire type: " .. var3559)
		end
	end
	return var2413
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
	local var2432 = t_87.new()
	
	if self.key ~= nil then
		var2432.key = self.key
	end
	if self.value ~= nil then
		var2432.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2432
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
	local var2432 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2433 = v:encode()
			local var2434, var2435 = protoModule.writeTag(buff, var2432, 1, protoModule.wireTypes.lengthDelimited)
			var2434, var3582 = protoModule.writeBuffer(var2434, var2435, var2433, buffer.len(var2433))
			buff = var2434
			var2432 = var2435
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2436, var2437 = protoModule.writeTag(buff, var2432, 2, protoModule.wireTypes.lengthDelimited)
		var2436, var3584 = protoModule.writeString(var2436, var2437, self.active_category_id)
		buff = var2436
		var2432 = var2437
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2438, var2439 = protoModule.writeTag(buff, var2432, 3, protoModule.wireTypes.varint)
		var2438, var3586 = protoModule.writeVarInt(var2438, var2439, self.active_tooltip_idx)
		buff = var2438
		var2432 = var2439
	end
	local buff_1 = buffer.create(var2432)
	buffer.copy(buff_1, 0, buff, 0, var2432)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2440 = t_88.new()
	local var2441 = 0
	while var2441 < buffer.len(p88) do
		local _ = nil
		local var2442 = nil
		local var2443, var2444, var2445 = protoModule.readTag(p88, var2441)
		local var2446 = var2443
		var2442 = var2444
		var2441 = var2445
		
		if var2442 == protoModule.wireTypes.varint then
			if var2446 == 3 then
				local _ = nil
				local var2447, var2448 = protoModule.readVarIntI64(p88, var2441)
				var2441 = var2448
				var2440.active_tooltip_idx = var2447
			else
				local _ = nil
				local var2449, var2450 = protoModule.readVarInt(p88, var2441)
				local _ = var2449
				var2441 = var2450
			end
		end
		if var2442 == protoModule.wireTypes.lengthDelimited then
			if var2446 == 1 then
				local _ = nil
				local var2451, var2452 = protoModule.readBuffer(p88, var2441)
				var2441 = var2452
				table.insert(var2440.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2451))
			elseif var2446 == 2 then
				local _ = nil
				local var2453, var2454 = protoModule.readBuffer(p88, var2441)
				var2441 = var2454
				var2440.active_category_id = buffer.tostring(var2453)
			else
				local _ = nil
				local var2455, var2456 = protoModule.readVarInt(p88, var2441)
				var2441 = var2456 + var2455
			end
		elseif var2442 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2457, var2458 = protoModule.readFixed32(p88, var2441)
			local _ = var2457
			var2441 = var2458
		elseif var2442 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2459, var2460 = protoModule.readFixed64(p88, var2441)
			local _ = var2459
			var2441 = var2460
		else
			error("Unsupported wire type: " .. var3590)
		end
	end
	return var2440
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
	local var2461 = t_88.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2461.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2461.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2461.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2461.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2461.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2461.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2461
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
	local var2462 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2463, var2464 = protoModule.writeTag(buff, var2462, 1, protoModule.wireTypes.lengthDelimited)
		var2463, var3617 = protoModule.writeString(var2463, var2464, self.marketplace_catalog_category_item_id)
		buff = var2463
		var2462 = var2464
	end
	local buff_1 = buffer.create(var2462)
	buffer.copy(buff_1, 0, buff, 0, var2462)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref)
	local var2462 = t_89.new()
	local var2463 = 0
	while var2463 < buffer.len(p89) do
		local _ = nil
		local var2464 = nil
		local var2465, var2466, var2467 = protoModule.readTag(p89, var2463)
		local var2468 = var2465
		var2464 = var2466
		var2463 = var2467
		
		if var2464 == protoModule.wireTypes.varint then
			local _ = nil
			local var2469, var2470 = protoModule.readVarInt(p89, var2463)
			local _ = var2469
			var2463 = var2470
			continue
		end
		if var2464 == protoModule.wireTypes.lengthDelimited then
			if var2468 == 1 then
				local _ = nil
				local var2471, var2472 = protoModule.readBuffer(p89, var2463)
				var2463 = var2472
				var2462.marketplace_catalog_category_item_id = buffer.tostring(var2471)
			else
				local _ = nil
				local var2473, var2474 = protoModule.readVarInt(p89, var2463)
				var2463 = var2474 + var2473
			end
		elseif var2464 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2475, var2476 = protoModule.readFixed32(p89, var2463)
			local _ = var2475
			var2463 = var2476
		elseif var2464 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2477, var2478 = protoModule.readFixed64(p89, var2463)
			local _ = var2477
			var2463 = var2478
		else
			error("Unsupported wire type: " .. var3621)
		end
	end
	return var2462
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
	local var2479 = t_89.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2479.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2479.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2479
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
	local var2479 = 0
	
	if self.hero_icon ~= nil then
		local var2480, var2481 = protoModule.writeTag(buff, var2479, 1, protoModule.wireTypes.lengthDelimited)
		var2480, var3641 = protoModule.writeString(var2480, var2481, self.hero_icon)
		buff = var2480
		var2479 = var2481
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2482, var2483 = protoModule.writeTag(buff, var2479, 2, protoModule.wireTypes.lengthDelimited)
		var2482, var3643 = protoModule.writeString(var2482, var2483, self.body_dismiss_button_text)
		buff = var2482
		var2479 = var2483
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2484, var2485 = protoModule.writeTag(buff, var2479, 3, protoModule.wireTypes.lengthDelimited)
		var2484, var3645 = protoModule.writeString(var2484, var2485, self.body_title)
		buff = var2484
		var2479 = var2485
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2486, var2487 = protoModule.writeTag(buff, var2479, 4, protoModule.wireTypes.lengthDelimited)
		var2486, var3647 = protoModule.writeString(var2486, var2487, self.body_rich_text)
		buff = var2486
		var2479 = var2487
	end
	if self.terms_link_text ~= nil then
		local var2488, var2489 = protoModule.writeTag(buff, var2479, 5, protoModule.wireTypes.lengthDelimited)
		var2488, var3649 = protoModule.writeString(var2488, var2489, self.terms_link_text)
		buff = var2488
		var2479 = var2489
	end
	if self.terms_title ~= nil then
		local var2490, var2491 = protoModule.writeTag(buff, var2479, 6, protoModule.wireTypes.lengthDelimited)
		var2490, var3651 = protoModule.writeString(var2490, var2491, self.terms_title)
		buff = var2490
		var2479 = var2491
	end
	if self.terms_body_rich_text ~= nil then
		local var2492, var2493 = protoModule.writeTag(buff, var2479, 7, protoModule.wireTypes.lengthDelimited)
		var2492, var3653 = protoModule.writeString(var2492, var2493, self.terms_body_rich_text)
		buff = var2492
		var2479 = var2493
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2494, var2495 = protoModule.writeTag(buff, var2479, 8, protoModule.wireTypes.lengthDelimited)
		var2494, var3655 = protoModule.writeString(var2494, var2495, self.terms_dismiss_button_text)
		buff = var2494
		var2479 = var2495
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2496, var2497 = protoModule.writeTag(buff, var2479, 9, protoModule.wireTypes.lengthDelimited)
		var2496, var3657 = protoModule.writeString(var2496, var2497, self.offer_id)
		buff = var2496
		var2479 = var2497
	end
	local buff_1 = buffer.create(var2479)
	buffer.copy(buff_1, 0, buff, 0, var2479)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2479 = t_90.new()
	local var2480 = 0
	while var2480 < buffer.len(p90) do
		local _ = nil
		local var2481 = nil
		local var2482, var2483, var2484 = protoModule.readTag(p90, var2480)
		local var2485 = var2482
		var2481 = var2483
		var2480 = var2484
		
		if var2481 == protoModule.wireTypes.varint then
			local _ = nil
			local var2486, var2487 = protoModule.readVarInt(p90, var2480)
			local _ = var2486
			var2480 = var2487
			continue
		end
		if var2481 == protoModule.wireTypes.lengthDelimited then
			if var2485 == 1 then
				local _ = nil
				local var2488, var2489 = protoModule.readBuffer(p90, var2480)
				var2480 = var2489
				var2479.hero_icon = buffer.tostring(var2488)
			elseif var2485 == 2 then
				local _ = nil
				local var2490, var2491 = protoModule.readBuffer(p90, var2480)
				var2480 = var2491
				var2479.body_dismiss_button_text = buffer.tostring(var2490)
			elseif var2485 == 3 then
				local _ = nil
				local var2492, var2493 = protoModule.readBuffer(p90, var2480)
				var2480 = var2493
				var2479.body_title = buffer.tostring(var2492)
			elseif var2485 == 4 then
				local _ = nil
				local var2494, var2495 = protoModule.readBuffer(p90, var2480)
				var2480 = var2495
				var2479.body_rich_text = buffer.tostring(var2494)
			elseif var2485 == 5 then
				local _ = nil
				local var2496, var2497 = protoModule.readBuffer(p90, var2480)
				var2480 = var2497
				var2479.terms_link_text = buffer.tostring(var2496)
			elseif var2485 == 6 then
				local _ = nil
				local var2498, var2499 = protoModule.readBuffer(p90, var2480)
				var2480 = var2499
				var2479.terms_title = buffer.tostring(var2498)
			elseif var2485 == 7 then
				local _ = nil
				local var2500, var2501 = protoModule.readBuffer(p90, var2480)
				var2480 = var2501
				var2479.terms_body_rich_text = buffer.tostring(var2500)
			elseif var2485 == 8 then
				local _ = nil
				local var2502, var2503 = protoModule.readBuffer(p90, var2480)
				var2480 = var2503
				var2479.terms_dismiss_button_text = buffer.tostring(var2502)
			elseif var2485 == 9 then
				local _ = nil
				local var2504, var2505 = protoModule.readBuffer(p90, var2480)
				var2480 = var2505
				var2479.offer_id = buffer.tostring(var2504)
			else
				local _ = nil
				local var2506, var2507 = protoModule.readVarInt(p90, var2480)
				var2480 = var2507 + var2506
			end
		elseif var2481 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2508, var2509 = protoModule.readFixed32(p90, var2480)
			local _ = var2508
			var2480 = var2509
		elseif var2481 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2510, var2511 = protoModule.readFixed64(p90, var2480)
			local _ = var2510
			var2480 = var2511
		else
			error("Unsupported wire type: " .. var3661)
		end
	end
	return var2479
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
	local var2512 = t_90.new()
	
	if self.hero_icon ~= nil then
		var2512.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2512.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2512.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2512.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2512.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2512.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2512.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2512.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2512.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2512.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2512.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2512.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2512.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2512.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2512.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2512.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2512.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2512.offer_id = self.offerId
	end
	return var2512
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
	local var2512 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2513 = v:encode()
			local var2514, var2515 = protoModule.writeTag(buff, var2512, 1, protoModule.wireTypes.lengthDelimited)
			var2514, var3698 = protoModule.writeBuffer(var2514, var2515, var2513, buffer.len(var2513))
			buff = var2514
			var2512 = var2515
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2516, var2517 = protoModule.writeTag(buff, var2512, 2, protoModule.wireTypes.varint)
		var2516, var3700 = protoModule.writeVarInt(var2516, var2517, self.preview_columns)
		buff = var2516
		var2512 = var2517
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2518, var2519 = protoModule.writeTag(buff, var2512, 3, protoModule.wireTypes.lengthDelimited)
		var2518, var3702 = protoModule.writeString(var2518, var2519, self.impression_id)
		buff = var2518
		var2512 = var2519
	end
	local buff_1 = buffer.create(var2512)
	buffer.copy(buff_1, 0, buff, 0, var2512)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var2520 = t_91.new()
	local var2521 = 0
	while var2521 < buffer.len(p91) do
		local _ = nil
		local var2522 = nil
		local var2523, var2524, var2525 = protoModule.readTag(p91, var2521)
		local var2526 = var2523
		var2522 = var2524
		var2521 = var2525
		
		if var2522 == protoModule.wireTypes.varint then
			if var2526 == 2 then
				local _ = nil
				local var2527, var2528 = protoModule.readVarIntI32(p91, var2521)
				var2521 = var2528
				var2520.preview_columns = var2527
			else
				local _ = nil
				local var2529, var2530 = protoModule.readVarInt(p91, var2521)
				local _ = var2529
				var2521 = var2530
			end
		end
		if var2522 == protoModule.wireTypes.lengthDelimited then
			if var2526 == 1 then
				local _ = nil
				local var2531, var2532 = protoModule.readBuffer(p91, var2521)
				var2521 = var2532
				table.insert(var2520.items, t.CatalogItemGridInputData_CatalogItem.decode(var2531))
			elseif var2526 == 3 then
				local _ = nil
				local var2533, var2534 = protoModule.readBuffer(p91, var2521)
				var2521 = var2534
				var2520.impression_id = buffer.tostring(var2533)
			else
				local _ = nil
				local var2535, var2536 = protoModule.readVarInt(p91, var2521)
				var2521 = var2536 + var2535
			end
		elseif var2522 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2537, var2538 = protoModule.readFixed32(p91, var2521)
			local _ = var2537
			var2521 = var2538
		elseif var2522 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2539, var2540 = protoModule.readFixed64(p91, var2521)
			local _ = var2539
			var2521 = var2540
		else
			error("Unsupported wire type: " .. var3706)
		end
	end
	return var2520
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
	local var2541 = t_91.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2541.items = t_1
	end
	if self.preview_columns ~= nil then
		var2541.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2541.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2541.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2541.impression_id = self.impressionId
	end
	return var2541
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
	local var2542 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2543, var2544 = protoModule.writeTag(buff, var2542, 1, protoModule.wireTypes.lengthDelimited)
		var2543, var3732 = protoModule.writeString(var2543, var2544, self.id)
		buff = var2543
		var2542 = var2544
	end
	if self.type ~= nil and self.type ~= "" then
		local var2545, var2546 = protoModule.writeTag(buff, var2542, 2, protoModule.wireTypes.lengthDelimited)
		var2545, var3734 = protoModule.writeString(var2545, var2546, self.type)
		buff = var2545
		var2542 = var2546
	end
	local buff_1 = buffer.create(var2542)
	buffer.copy(buff_1, 0, buff, 0, var2542)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref)
	local var2542 = t_92.new()
	local var2543 = 0
	while var2543 < buffer.len(p92) do
		local _ = nil
		local var2544 = nil
		local var2545, var2546, var2547 = protoModule.readTag(p92, var2543)
		local var2548 = var2545
		var2544 = var2546
		var2543 = var2547
		
		if var2544 == protoModule.wireTypes.varint then
			local _ = nil
			local var2549, var2550 = protoModule.readVarInt(p92, var2543)
			local _ = var2549
			var2543 = var2550
			continue
		end
		if var2544 == protoModule.wireTypes.lengthDelimited then
			if var2548 == 1 then
				local _ = nil
				local var2551, var2552 = protoModule.readBuffer(p92, var2543)
				var2543 = var2552
				var2542.id = buffer.tostring(var2551)
			elseif var2548 == 2 then
				local _ = nil
				local var2553, var2554 = protoModule.readBuffer(p92, var2543)
				var2543 = var2554
				var2542.type = buffer.tostring(var2553)
			else
				local _ = nil
				local var2555, var2556 = protoModule.readVarInt(p92, var2543)
				var2543 = var2556 + var2555
			end
		elseif var2544 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2557, var2558 = protoModule.readFixed32(p92, var2543)
			local _ = var2557
			var2543 = var2558
		elseif var2544 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2559, var2560 = protoModule.readFixed64(p92, var2543)
			local _ = var2559
			var2543 = var2560
		else
			error("Unsupported wire type: " .. var3738)
		end
	end
	return var2542
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
	local var2561 = t_92.new()
	
	if self.id ~= nil then
		var2561.id = self.id
	end
	if self.type ~= nil then
		var2561.type = self.type
	end
	return var2561
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
	local var2561 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2562, var2563 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2562, var3760 = protoModule.writeString(var2562, var2563, i)
			local var2564 = v:encode()
			var2563, var3762 = protoModule.writeTag(var2562, var2563, 2, protoModule.wireTypes.lengthDelimited)
			var2563, var3762 = protoModule.writeBuffer(var2563, var3762, var2564, buffer.len(var2564))
			local var2565 = var2563
			local var2566 = var3762
			local var2567, var2568 = protoModule.writeTag(buff, var2561, 1, protoModule.wireTypes.lengthDelimited)
			var2567, var3766 = protoModule.writeBuffer(var2567, var2568, var2565, var2566)
			buff = var2567
			var2561 = var2568
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2569, var2570 = protoModule.writeTag(buff, var2561, 2, protoModule.wireTypes.lengthDelimited)
			var2569, var3768 = protoModule.writeString(var2569, var2570, v)
			buff = var2569
			var2561 = var2570
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2571, var2572 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2571, var3770 = protoModule.writeString(var2571, var2572, i)
			local var2573 = v:encode()
			var2572, var3772 = protoModule.writeTag(var2571, var2572, 2, protoModule.wireTypes.lengthDelimited)
			var2572, var3772 = protoModule.writeBuffer(var2572, var3772, var2573, buffer.len(var2573))
			local var2574 = var2572
			local var2575 = var3772
			local var2576, var2577 = protoModule.writeTag(buff, var2561, 3, protoModule.wireTypes.lengthDelimited)
			var2576, var3776 = protoModule.writeBuffer(var2576, var2577, var2574, var2575)
			buff = var2576
			var2561 = var2577
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2578, var2579 = protoModule.writeTag(buff, var2561, 4, protoModule.wireTypes.lengthDelimited)
		var2578, var3778 = protoModule.writeString(var2578, var2579, self.search_session_id)
		buff = var2578
		var2561 = var2579
	end
	local buff_1 = buffer.create(var2561)
	buffer.copy(buff_1, 0, buff, 0, var2561)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2580 = t_93.new()
	local var2581 = 0
	while var2581 < buffer.len(p93) do
		local _ = nil
		local var2582 = nil
		local var2583, var2584, var2585 = protoModule.readTag(p93, var2581)
		local var2586 = var2583
		var2582 = var2584
		var2581 = var2585
		
		if var2582 == protoModule.wireTypes.varint then
			local _ = nil
			local var2587, var2588 = protoModule.readVarInt(p93, var2581)
			local _ = var2587
			var2581 = var2588
			continue
		end
		if var2582 == protoModule.wireTypes.lengthDelimited then
			if var2586 == 1 then
				local _ = nil
				local var2589, var2590 = protoModule.readBuffer(p93, var2581)
				var2581 = var2590
				var2589 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2589)
				var2580.entry_map[var2589.key or ""] = var2589.value or t.FeedEntry.new()
			elseif var2586 == 2 then
				local _ = nil
				local var2591, var2592 = protoModule.readBuffer(p93, var2581)
				var2581 = var2592
				table.insert(var2580.entry_order, buffer.tostring(var2591))
			elseif var2586 == 3 then
				local _ = nil
				local var2593, var2594 = protoModule.readBuffer(p93, var2581)
				var2581 = var2594
				var2593 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2593)
				var2580.content_pools[var2593.key or ""] = var2593.value or t.ContentPool.new()
			elseif var2586 == 4 then
				local _ = nil
				local var2595, var2596 = protoModule.readBuffer(p93, var2581)
				var2581 = var2596
				var2580.search_session_id = buffer.tostring(var2595)
			else
				local _ = nil
				local var2597, var2598 = protoModule.readVarInt(p93, var2581)
				var2581 = var2598 + var2597
			end
		elseif var2582 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2599, var2600 = protoModule.readFixed32(p93, var2581)
			local _ = var2599
			var2581 = var2600
		elseif var2582 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2601, var2602 = protoModule.readFixed64(p93, var2581)
			local _ = var2601
			var2581 = var2602
		else
			error("Unsupported wire type: " .. var3782)
		end
	end
	return var2580
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
	local var2603 = t_93.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2603.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2603.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2603.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2603.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2603.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2603.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2603.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2603.search_session_id = self.searchSessionId
	end
	return var2603
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
	local var2604 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2605, var2606 = protoModule.writeTag(buff, var2604, 1, protoModule.wireTypes.lengthDelimited)
		var2605, var3817 = protoModule.writeString(var2605, var2606, self.key)
		buff = var2605
		var2604 = var2606
	end
	if self.value ~= nil then
		local var2607 = self.value:encode()
		local var2608, var2609 = protoModule.writeTag(buff, var2604, 2, protoModule.wireTypes.lengthDelimited)
		var2608, var3820 = protoModule.writeBuffer(var2608, var2609, var2607, buffer.len(var2607))
		buff = var2608
		var2604 = var2609
	end
	local buff_1 = buffer.create(var2604)
	buffer.copy(buff_1, 0, buff, 0, var2604)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var2604 = t_94.new()
	local var2605 = 0
	while var2605 < buffer.len(p94) do
		local _ = nil
		local var2606 = nil
		local var2607, var2608, var2609 = protoModule.readTag(p94, var2605)
		local var2610 = var2607
		var2606 = var2608
		var2605 = var2609
		
		if var2606 == protoModule.wireTypes.varint then
			local _ = nil
			local var2611, var2612 = protoModule.readVarInt(p94, var2605)
			local _ = var2611
			var2605 = var2612
			continue
		end
		if var2606 == protoModule.wireTypes.lengthDelimited then
			if var2610 == 1 then
				local _ = nil
				local var2613, var2614 = protoModule.readBuffer(p94, var2605)
				var2605 = var2614
				var2604.key = buffer.tostring(var2613)
			elseif var2610 == 2 then
				local _ = nil
				local var2615, var2616 = protoModule.readBuffer(p94, var2605)
				var2605 = var2616
				var2604.value = t.FeedEntry.decode(var2615)
			else
				local _ = nil
				local var2617, var2618 = protoModule.readVarInt(p94, var2605)
				var2605 = var2618 + var2617
			end
		elseif var2606 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2619, var2620 = protoModule.readFixed32(p94, var2605)
			local _ = var2619
			var2605 = var2620
		elseif var2606 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2621, var2622 = protoModule.readFixed64(p94, var2605)
			local _ = var2621
			var2605 = var2622
		else
			error("Unsupported wire type: " .. var3824)
		end
	end
	return var2604
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
	local var2623 = t_94.new()
	
	if self.key ~= nil then
		var2623.key = self.key
	end
	if self.value ~= nil then
		var2623.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2623
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
	local var2623 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2624, var2625 = protoModule.writeTag(buff, var2623, 1, protoModule.wireTypes.lengthDelimited)
		var2624, var3846 = protoModule.writeString(var2624, var2625, self.key)
		buff = var2624
		var2623 = var2625
	end
	if self.value ~= nil then
		local var2626 = self.value:encode()
		local var2627, var2628 = protoModule.writeTag(buff, var2623, 2, protoModule.wireTypes.lengthDelimited)
		var2627, var3849 = protoModule.writeBuffer(var2627, var2628, var2626, buffer.len(var2626))
		buff = var2627
		var2623 = var2628
	end
	local buff_1 = buffer.create(var2623)
	buffer.copy(buff_1, 0, buff, 0, var2623)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2623 = t_95.new()
	local var2624 = 0
	while var2624 < buffer.len(p95) do
		local _ = nil
		local var2625 = nil
		local var2626, var2627, var2628 = protoModule.readTag(p95, var2624)
		local var2629 = var2626
		var2625 = var2627
		var2624 = var2628
		
		if var2625 == protoModule.wireTypes.varint then
			local _ = nil
			local var2630, var2631 = protoModule.readVarInt(p95, var2624)
			local _ = var2630
			var2624 = var2631
			continue
		end
		if var2625 == protoModule.wireTypes.lengthDelimited then
			if var2629 == 1 then
				local _ = nil
				local var2632, var2633 = protoModule.readBuffer(p95, var2624)
				var2624 = var2633
				var2623.key = buffer.tostring(var2632)
			elseif var2629 == 2 then
				local _ = nil
				local var2634, var2635 = protoModule.readBuffer(p95, var2624)
				var2624 = var2635
				var2623.value = t.ContentPool.decode(var2634)
			else
				local _ = nil
				local var2636, var2637 = protoModule.readVarInt(p95, var2624)
				var2624 = var2637 + var2636
			end
		elseif var2625 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2638, var2639 = protoModule.readFixed32(p95, var2624)
			local _ = var2638
			var2624 = var2639
		elseif var2625 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2640, var2641 = protoModule.readFixed64(p95, var2624)
			local _ = var2640
			var2624 = var2641
		else
			error("Unsupported wire type: " .. var3853)
		end
	end
	return var2623
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
	local var2642 = t_95.new()
	
	if self.key ~= nil then
		var2642.key = self.key
	end
	if self.value ~= nil then
		var2642.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2642
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
	local var2642 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2643, var2644 = protoModule.writeTag(buff, var2642, 1, protoModule.wireTypes.lengthDelimited)
		var2643, var3875 = protoModule.writeString(var2643, var2644, self.universe_id)
		buff = var2643
		var2642 = var2644
	end
	if self.is_content_locked then
		local var2645, var2646 = protoModule.writeTag(buff, var2642, 2, protoModule.wireTypes.varint)
		var2645, var3877 = protoModule.writeVarInt(var2645, var2646, if self.is_content_locked then 1 else 0)
		buff = var2645
		var2642 = var2646
	end
	local buff_1 = buffer.create(var2642)
	buffer.copy(buff_1, 0, buff, 0, var2642)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref)
	local var2642 = t_96.new()
	local var2643 = 0
	while var2643 < buffer.len(p96) do
		local _ = nil
		local var2644 = nil
		local var2645, var2646, var2647 = protoModule.readTag(p96, var2643)
		local var2648 = var2645
		var2644 = var2646
		var2643 = var2647
		
		if var2644 == protoModule.wireTypes.varint then
			if var2648 == 2 then
				local _ = nil
				local var2649, var2650 = protoModule.readVarInt(p96, var2643)
				var2643 = var2650
				var2642.is_content_locked = var2649 ~= 0
			else
				local _ = nil
				local var2651, var2652 = protoModule.readVarInt(p96, var2643)
				local _ = var2651
				var2643 = var2652
			end
		end
		if var2644 == protoModule.wireTypes.lengthDelimited then
			if var2648 == 1 then
				local _ = nil
				local var2653, var2654 = protoModule.readBuffer(p96, var2643)
				var2643 = var2654
				var2642.universe_id = buffer.tostring(var2653)
			else
				local _ = nil
				local var2655, var2656 = protoModule.readVarInt(p96, var2643)
				var2643 = var2656 + var2655
			end
		elseif var2644 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2657, var2658 = protoModule.readFixed32(p96, var2643)
			local _ = var2657
			var2643 = var2658
		elseif var2644 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2659, var2660 = protoModule.readFixed64(p96, var2643)
			local _ = var2659
			var2643 = var2660
		else
			error("Unsupported wire type: " .. var3881)
		end
	end
	return var2642
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
	local var2661 = t_96.new()
	
	if self.universe_id ~= nil then
		var2661.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2661.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2661.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2661.is_content_locked = self.isContentLocked
	end
	return var2661
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
	local var2661 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2662, var2663 = protoModule.writeTag(buff, var2661, 1, protoModule.wireTypes.lengthDelimited)
		var2662, var3903 = protoModule.writeString(var2662, var2663, self.overview_rich_text)
		buff = var2662
		var2661 = var2663
	end
	if self.result_entry ~= nil then
		local var2664 = self.result_entry:encode()
		local var2665, var2666 = protoModule.writeTag(buff, var2661, 2, protoModule.wireTypes.lengthDelimited)
		var2665, var3906 = protoModule.writeBuffer(var2665, var2666, var2664, buffer.len(var2664))
		buff = var2665
		var2661 = var2666
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2667, var2668 = protoModule.writeTag(buff, var2661, 3, protoModule.wireTypes.lengthDelimited)
			var2667, var3908 = protoModule.writeString(var2667, var2668, v)
			buff = var2667
			var2661 = var2668
		end
	end
	if self.show_loading then
		local var2669, var2670 = protoModule.writeTag(buff, var2661, 4, protoModule.wireTypes.varint)
		var2669, var3910 = protoModule.writeVarInt(var2669, var2670, if self.show_loading then 1 else 0)
		buff = var2669
		var2661 = var2670
	end
	if self.title ~= nil and self.title ~= "" then
		local var2671, var2672 = protoModule.writeTag(buff, var2661, 5, protoModule.wireTypes.lengthDelimited)
		var2671, var3912 = protoModule.writeString(var2671, var2672, self.title)
		buff = var2671
		var2661 = var2672
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2673, var2674 = protoModule.writeTag(buff, var2661, 6, protoModule.wireTypes.lengthDelimited)
		var2673, var3914 = protoModule.writeString(var2673, var2674, self.search_query)
		buff = var2673
		var2661 = var2674
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2675, var2676 = protoModule.writeTag(buff, var2661, 8, protoModule.wireTypes.lengthDelimited)
		var2675, var3916 = protoModule.writeString(var2675, var2676, self.universe_ids)
		buff = var2675
		var2661 = var2676
	end
	local buff_1 = buffer.create(var2661)
	buffer.copy(buff_1, 0, buff, 0, var2661)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var2677 = t_97.new()
	local var2678 = 0
	while var2678 < buffer.len(p97) do
		local _ = nil
		local var2679 = nil
		local var2680, var2681, var2682 = protoModule.readTag(p97, var2678)
		local var2683 = var2680
		var2679 = var2681
		var2678 = var2682
		
		if var2679 == protoModule.wireTypes.varint then
			if var2683 == 4 then
				local _ = nil
				local var2684, var2685 = protoModule.readVarInt(p97, var2678)
				var2678 = var2685
				var2677.show_loading = var2684 ~= 0
			else
				local _ = nil
				local var2686, var2687 = protoModule.readVarInt(p97, var2678)
				local _ = var2686
				var2678 = var2687
			end
		end
		if var2679 == protoModule.wireTypes.lengthDelimited then
			if var2683 == 1 then
				local _ = nil
				local var2688, var2689 = protoModule.readBuffer(p97, var2678)
				var2678 = var2689
				var2677.overview_rich_text = buffer.tostring(var2688)
			elseif var2683 == 2 then
				local _ = nil
				local var2690, var2691 = protoModule.readBuffer(p97, var2678)
				var2678 = var2691
				var2677.result_entry = t.FeedEntry.decode(var2690)
			elseif var2683 == 3 then
				local _ = nil
				local var2692, var2693 = protoModule.readBuffer(p97, var2678)
				var2678 = var2693
				table.insert(var2677.follow_up_queries, buffer.tostring(var2692))
			elseif var2683 == 5 then
				local _ = nil
				local var2694, var2695 = protoModule.readBuffer(p97, var2678)
				var2678 = var2695
				var2677.title = buffer.tostring(var2694)
			elseif var2683 == 6 then
				local _ = nil
				local var2696, var2697 = protoModule.readBuffer(p97, var2678)
				var2678 = var2697
				var2677.search_query = buffer.tostring(var2696)
			elseif var2683 == 8 then
				local _ = nil
				local var2698, var2699 = protoModule.readBuffer(p97, var2678)
				var2678 = var2699
				var2677.universe_ids = buffer.tostring(var2698)
			else
				local _ = nil
				local var2700, var2701 = protoModule.readVarInt(p97, var2678)
				var2678 = var2701 + var2700
			end
		elseif var2679 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2702, var2703 = protoModule.readFixed32(p97, var2678)
			local _ = var2702
			var2678 = var2703
		elseif var2679 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2704, var2705 = protoModule.readFixed64(p97, var2678)
			local _ = var2704
			var2678 = var2705
		else
			error("Unsupported wire type: " .. var3920)
		end
	end
	return var2677
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
	local var2706 = t_97.new()
	
	if self.overview_rich_text ~= nil then
		var2706.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2706.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2706.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2706.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2706.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2706.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2706.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2706.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2706.title = self.title
	end
	if self.search_query ~= nil then
		var2706.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2706.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2706.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2706.universe_ids = self.universeIds
	end
	return var2706
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
	local var2707 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2708, var2709 = protoModule.writeTag(buff, var2707, 1, protoModule.wireTypes.lengthDelimited)
		var2708, var3955 = protoModule.writeString(var2708, var2709, self.title)
		buff = var2708
		var2707 = var2709
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2710 = v:encode()
			local var2711, var2712 = protoModule.writeTag(buff, var2707, 2, protoModule.wireTypes.lengthDelimited)
			var2711, var3958 = protoModule.writeBuffer(var2711, var2712, var2710, buffer.len(var2710))
			buff = var2711
			var2707 = var2712
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2713, var2714 = protoModule.writeTag(buff, var2707, 3, protoModule.wireTypes.varint)
		var2713, var3960 = protoModule.writeVarInt(var2713, var2714, self.max_visible_rows)
		buff = var2713
		var2707 = var2714
	end
	if self.sort_id ~= nil then
		local var2715, var2716 = protoModule.writeTag(buff, var2707, 4, protoModule.wireTypes.lengthDelimited)
		var2715, var3962 = protoModule.writeString(var2715, var2716, self.sort_id)
		buff = var2715
		var2707 = var2716
	end
	local buff_1 = buffer.create(var2707)
	buffer.copy(buff_1, 0, buff, 0, var2707)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2717 = t_98.new()
	local var2718 = 0
	while var2718 < buffer.len(p98) do
		local _ = nil
		local var2719 = nil
		local var2720, var2721, var2722 = protoModule.readTag(p98, var2718)
		local var2723 = var2720
		var2719 = var2721
		var2718 = var2722
		
		if var2719 == protoModule.wireTypes.varint then
			if var2723 == 3 then
				local _ = nil
				local var2724, var2725 = protoModule.readVarIntI32(p98, var2718)
				var2718 = var2725
				var2717.max_visible_rows = var2724
			else
				local _ = nil
				local var2726, var2727 = protoModule.readVarInt(p98, var2718)
				local _ = var2726
				var2718 = var2727
			end
		end
		if var2719 == protoModule.wireTypes.lengthDelimited then
			if var2723 == 1 then
				local _ = nil
				local var2728, var2729 = protoModule.readBuffer(p98, var2718)
				var2718 = var2729
				var2717.title = buffer.tostring(var2728)
			elseif var2723 == 2 then
				local _ = nil
				local var2730, var2731 = protoModule.readBuffer(p98, var2718)
				var2718 = var2731
				table.insert(var2717.user_items, t.UserListInputData_UserItem.decode(var2730))
			elseif var2723 == 4 then
				local _ = nil
				local var2732, var2733 = protoModule.readBuffer(p98, var2718)
				var2718 = var2733
				var2717.sort_id = buffer.tostring(var2732)
			else
				local _ = nil
				local var2734, var2735 = protoModule.readVarInt(p98, var2718)
				var2718 = var2735 + var2734
			end
		elseif var2719 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2736, var2737 = protoModule.readFixed32(p98, var2718)
			local _ = var2736
			var2718 = var2737
		elseif var2719 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2738, var2739 = protoModule.readFixed64(p98, var2718)
			local _ = var2738
			var2718 = var2739
		else
			error("Unsupported wire type: " .. var3966)
		end
	end
	return var2717
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
	local var2740 = t_98.new()
	
	if self.title ~= nil then
		var2740.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2740.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2740.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2740.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2740.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2740.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2740.sort_id = self.sortId
	end
	return var2740
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
	local var2741 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2742, var2743 = protoModule.writeTag(buff, var2741, 1, protoModule.wireTypes.lengthDelimited)
		var2742, var3995 = protoModule.writeString(var2742, var2743, self.user_id)
		buff = var2742
		var2741 = var2743
	end
	local buff_1 = buffer.create(var2741)
	buffer.copy(buff_1, 0, buff, 0, var2741)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2741 = t_99.new()
	local var2742 = 0
	while var2742 < buffer.len(p99) do
		local _ = nil
		local var2743 = nil
		local var2744, var2745, var2746 = protoModule.readTag(p99, var2742)
		local var2747 = var2744
		var2743 = var2745
		var2742 = var2746
		
		if var2743 == protoModule.wireTypes.varint then
			local _ = nil
			local var2748, var2749 = protoModule.readVarInt(p99, var2742)
			local _ = var2748
			var2742 = var2749
			continue
		end
		if var2743 == protoModule.wireTypes.lengthDelimited then
			if var2747 == 1 then
				local _ = nil
				local var2750, var2751 = protoModule.readBuffer(p99, var2742)
				var2742 = var2751
				var2741.user_id = buffer.tostring(var2750)
			else
				local _ = nil
				local var2752, var2753 = protoModule.readVarInt(p99, var2742)
				var2742 = var2753 + var2752
			end
		elseif var2743 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2754, var2755 = protoModule.readFixed32(p99, var2742)
			local _ = var2754
			var2742 = var2755
		elseif var2743 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2756, var2757 = protoModule.readFixed64(p99, var2742)
			local _ = var2756
			var2742 = var2757
		else
			error("Unsupported wire type: " .. var3999)
		end
	end
	return var2741
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
	local var2758 = t_99.new()
	
	if self.user_id ~= nil then
		var2758.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2758.user_id = self.userId
	end
	return var2758
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
	local var2758 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2759, var2760 = protoModule.writeTag(buff, var2758, 1, protoModule.wireTypes.lengthDelimited)
		var2759, var4019 = protoModule.writeString(var2759, var2760, self.title)
		buff = var2759
		var2758 = var2760
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2761 = v:encode()
			local var2762, var2763 = protoModule.writeTag(buff, var2758, 2, protoModule.wireTypes.lengthDelimited)
			var2762, var4022 = protoModule.writeBuffer(var2762, var2763, var2761, buffer.len(var2761))
			buff = var2762
			var2758 = var2763
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2764, var2765 = protoModule.writeTag(buff, var2758, 3, protoModule.wireTypes.varint)
		var2764, var4024 = protoModule.writeVarInt(var2764, var2765, self.max_visible_rows)
		buff = var2764
		var2758 = var2765
	end
	if self.sort_id ~= nil then
		local var2766, var2767 = protoModule.writeTag(buff, var2758, 4, protoModule.wireTypes.lengthDelimited)
		var2766, var4026 = protoModule.writeString(var2766, var2767, self.sort_id)
		buff = var2766
		var2758 = var2767
	end
	local buff_1 = buffer.create(var2758)
	buffer.copy(buff_1, 0, buff, 0, var2758)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2768 = t_100.new()
	local var2769 = 0
	while var2769 < buffer.len(p100) do
		local _ = nil
		local var2770 = nil
		local var2771, var2772, var2773 = protoModule.readTag(p100, var2769)
		local var2774 = var2771
		var2770 = var2772
		var2769 = var2773
		
		if var2770 == protoModule.wireTypes.varint then
			if var2774 == 3 then
				local _ = nil
				local var2775, var2776 = protoModule.readVarIntI32(p100, var2769)
				var2769 = var2776
				var2768.max_visible_rows = var2775
			else
				local _ = nil
				local var2777, var2778 = protoModule.readVarInt(p100, var2769)
				local _ = var2777
				var2769 = var2778
			end
		end
		if var2770 == protoModule.wireTypes.lengthDelimited then
			if var2774 == 1 then
				local _ = nil
				local var2779, var2780 = protoModule.readBuffer(p100, var2769)
				var2769 = var2780
				var2768.title = buffer.tostring(var2779)
			elseif var2774 == 2 then
				local _ = nil
				local var2781, var2782 = protoModule.readBuffer(p100, var2769)
				var2769 = var2782
				table.insert(var2768.items, t.CatalogItemListInputData_CatalogItem.decode(var2781))
			elseif var2774 == 4 then
				local _ = nil
				local var2783, var2784 = protoModule.readBuffer(p100, var2769)
				var2769 = var2784
				var2768.sort_id = buffer.tostring(var2783)
			else
				local _ = nil
				local var2785, var2786 = protoModule.readVarInt(p100, var2769)
				var2769 = var2786 + var2785
			end
		elseif var2770 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2787, var2788 = protoModule.readFixed32(p100, var2769)
			local _ = var2787
			var2769 = var2788
		elseif var2770 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2789, var2790 = protoModule.readFixed64(p100, var2769)
			local _ = var2789
			var2769 = var2790
		else
			error("Unsupported wire type: " .. var4030)
		end
	end
	return var2768
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
	local var2791 = t_100.new()
	
	if self.title ~= nil then
		var2791.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2791.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2791.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2791.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2791.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2791.sort_id = self.sortId
	end
	return var2791
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
	local var2792 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2793, var2794 = protoModule.writeTag(buff, var2792, 1, protoModule.wireTypes.lengthDelimited)
		var2793, var4058 = protoModule.writeString(var2793, var2794, self.item_id)
		buff = var2793
		var2792 = var2794
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2795, var2796 = protoModule.writeTag(buff, var2792, 2, protoModule.wireTypes.lengthDelimited)
		var2795, var4060 = protoModule.writeString(var2795, var2796, self.item_type)
		buff = var2795
		var2792 = var2796
	end
	local buff_1 = buffer.create(var2792)
	buffer.copy(buff_1, 0, buff, 0, var2792)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref)
	local var2792 = t_101.new()
	local var2793 = 0
	while var2793 < buffer.len(p101) do
		local _ = nil
		local var2794 = nil
		local var2795, var2796, var2797 = protoModule.readTag(p101, var2793)
		local var2798 = var2795
		var2794 = var2796
		var2793 = var2797
		
		if var2794 == protoModule.wireTypes.varint then
			local _ = nil
			local var2799, var2800 = protoModule.readVarInt(p101, var2793)
			local _ = var2799
			var2793 = var2800
			continue
		end
		if var2794 == protoModule.wireTypes.lengthDelimited then
			if var2798 == 1 then
				local _ = nil
				local var2801, var2802 = protoModule.readBuffer(p101, var2793)
				var2793 = var2802
				var2792.item_id = buffer.tostring(var2801)
			elseif var2798 == 2 then
				local _ = nil
				local var2803, var2804 = protoModule.readBuffer(p101, var2793)
				var2793 = var2804
				var2792.item_type = buffer.tostring(var2803)
			else
				local _ = nil
				local var2805, var2806 = protoModule.readVarInt(p101, var2793)
				var2793 = var2806 + var2805
			end
		elseif var2794 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2807, var2808 = protoModule.readFixed32(p101, var2793)
			local _ = var2807
			var2793 = var2808
		elseif var2794 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2809, var2810 = protoModule.readFixed64(p101, var2793)
			local _ = var2809
			var2793 = var2810
		else
			error("Unsupported wire type: " .. var4064)
		end
	end
	return var2792
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
	local var2811 = t_101.new()
	
	if self.item_id ~= nil then
		var2811.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2811.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2811.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2811.item_type = self.itemType
	end
	return var2811
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
	local var2811 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2812, var2813 = protoModule.writeTag(buff, var2811, 1, protoModule.wireTypes.lengthDelimited)
		var2812, var4086 = protoModule.writeString(var2812, var2813, self.universe_id)
		buff = var2812
		var2811 = var2813
	end
	local buff_1 = buffer.create(var2811)
	buffer.copy(buff_1, 0, buff, 0, var2811)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2811 = t_102.new()
	local var2812 = 0
	while var2812 < buffer.len(p102) do
		local _ = nil
		local var2813 = nil
		local var2814, var2815, var2816 = protoModule.readTag(p102, var2812)
		local var2817 = var2814
		var2813 = var2815
		var2812 = var2816
		
		if var2813 == protoModule.wireTypes.varint then
			local _ = nil
			local var2818, var2819 = protoModule.readVarInt(p102, var2812)
			local _ = var2818
			var2812 = var2819
			continue
		end
		if var2813 == protoModule.wireTypes.lengthDelimited then
			if var2817 == 1 then
				local _ = nil
				local var2820, var2821 = protoModule.readBuffer(p102, var2812)
				var2812 = var2821
				var2811.universe_id = buffer.tostring(var2820)
			else
				local _ = nil
				local var2822, var2823 = protoModule.readVarInt(p102, var2812)
				var2812 = var2823 + var2822
			end
		elseif var2813 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2824, var2825 = protoModule.readFixed32(p102, var2812)
			local _ = var2824
			var2812 = var2825
		elseif var2813 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2826, var2827 = protoModule.readFixed64(p102, var2812)
			local _ = var2826
			var2812 = var2827
		else
			error("Unsupported wire type: " .. var4090)
		end
	end
	return var2811
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
	local var2828 = t_102.new()
	
	if self.universe_id ~= nil then
		var2828.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2828.universe_id = self.universeId
	end
	return var2828
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
	local var2828 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2829, var2830 = protoModule.writeTag(buff, var2828, 1, protoModule.wireTypes.lengthDelimited)
		var2829, var4110 = protoModule.writeString(var2829, var2830, self.title)
		buff = var2829
		var2828 = var2830
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2831, var2832 = protoModule.writeTag(buff, var2828, 2, protoModule.wireTypes.lengthDelimited)
		var2831, var4112 = protoModule.writeString(var2831, var2832, self.subtitle)
		buff = var2831
		var2828 = var2832
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2833 = v:encode()
			local var2834, var2835 = protoModule.writeTag(buff, var2828, 3, protoModule.wireTypes.lengthDelimited)
			var2834, var4115 = protoModule.writeBuffer(var2834, var2835, var2833, buffer.len(var2833))
			buff = var2834
			var2828 = var2835
		end
	end
	local buff_1 = buffer.create(var2828)
	buffer.copy(buff_1, 0, buff, 0, var2828)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), t (ref)
	local var2836 = t_103.new()
	local var2837 = 0
	while var2837 < buffer.len(p103) do
		local _ = nil
		local var2838 = nil
		local var2839, var2840, var2841 = protoModule.readTag(p103, var2837)
		local var2842 = var2839
		var2838 = var2840
		var2837 = var2841
		
		if var2838 == protoModule.wireTypes.varint then
			local _ = nil
			local var2843, var2844 = protoModule.readVarInt(p103, var2837)
			local _ = var2843
			var2837 = var2844
			continue
		end
		if var2838 == protoModule.wireTypes.lengthDelimited then
			if var2842 == 1 then
				local _ = nil
				local var2845, var2846 = protoModule.readBuffer(p103, var2837)
				var2837 = var2846
				var2836.title = buffer.tostring(var2845)
			elseif var2842 == 2 then
				local _ = nil
				local var2847, var2848 = protoModule.readBuffer(p103, var2837)
				var2837 = var2848
				var2836.subtitle = buffer.tostring(var2847)
			elseif var2842 == 3 then
				local _ = nil
				local var2849, var2850 = protoModule.readBuffer(p103, var2837)
				var2837 = var2850
				table.insert(var2836.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2849))
			else
				local _ = nil
				local var2851, var2852 = protoModule.readVarInt(p103, var2837)
				var2837 = var2852 + var2851
			end
		elseif var2838 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2853, var2854 = protoModule.readFixed32(p103, var2837)
			local _ = var2853
			var2837 = var2854
		elseif var2838 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2855, var2856 = protoModule.readFixed64(p103, var2837)
			local _ = var2855
			var2837 = var2856
		else
			error("Unsupported wire type: " .. var4119)
		end
	end
	return var2836
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
	local var2857 = t_103.new()
	
	if self.title ~= nil then
		var2857.title = self.title
	end
	if self.subtitle ~= nil then
		var2857.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2857.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2857.moment_items = t_1
	end
	return var2857
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
	local var2858 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2859, var2860 = protoModule.writeTag(buff, var2858, 1, protoModule.wireTypes.lengthDelimited)
		var2859, var4146 = protoModule.writeString(var2859, var2860, self.moment_id)
		buff = var2859
		var2858 = var2860
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2861, var2862 = protoModule.writeTag(buff, var2858, 2, protoModule.wireTypes.lengthDelimited)
		var2861, var4148 = protoModule.writeString(var2861, var2862, self.video_asset_id)
		buff = var2861
		var2858 = var2862
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2863, var2864 = protoModule.writeTag(buff, var2858, 3, protoModule.wireTypes.lengthDelimited)
		var2863, var4150 = protoModule.writeString(var2863, var2864, self.target_universe_id)
		buff = var2863
		var2858 = var2864
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2865, var2866 = protoModule.writeTag(buff, var2858, 4, protoModule.wireTypes.lengthDelimited)
		var2865, var4152 = protoModule.writeString(var2865, var2866, self.target_place_id)
		buff = var2865
		var2858 = var2866
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2867, var2868 = protoModule.writeTag(buff, var2858, 5, protoModule.wireTypes.lengthDelimited)
		var2867, var4154 = protoModule.writeString(var2867, var2868, self.feed_item_id)
		buff = var2867
		var2858 = var2868
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2869, var2870 = protoModule.writeTag(buff, var2858, 6, protoModule.wireTypes.lengthDelimited)
		var2869, var4156 = protoModule.writeString(var2869, var2870, self.capture_universe_id)
		buff = var2869
		var2858 = var2870
	end
	local buff_1 = buffer.create(var2858)
	buffer.copy(buff_1, 0, buff, 0, var2858)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2858 = t_104.new()
	local var2859 = 0
	while var2859 < buffer.len(p104) do
		local _ = nil
		local var2860 = nil
		local var2861, var2862, var2863 = protoModule.readTag(p104, var2859)
		local var2864 = var2861
		var2860 = var2862
		var2859 = var2863
		
		if var2860 == protoModule.wireTypes.varint then
			local _ = nil
			local var2865, var2866 = protoModule.readVarInt(p104, var2859)
			local _ = var2865
			var2859 = var2866
			continue
		end
		if var2860 == protoModule.wireTypes.lengthDelimited then
			if var2864 == 1 then
				local _ = nil
				local var2867, var2868 = protoModule.readBuffer(p104, var2859)
				var2859 = var2868
				var2858.moment_id = buffer.tostring(var2867)
			elseif var2864 == 2 then
				local _ = nil
				local var2869, var2870 = protoModule.readBuffer(p104, var2859)
				var2859 = var2870
				var2858.video_asset_id = buffer.tostring(var2869)
			elseif var2864 == 3 then
				local _ = nil
				local var2871, var2872 = protoModule.readBuffer(p104, var2859)
				var2859 = var2872
				var2858.target_universe_id = buffer.tostring(var2871)
			elseif var2864 == 4 then
				local _ = nil
				local var2873, var2874 = protoModule.readBuffer(p104, var2859)
				var2859 = var2874
				var2858.target_place_id = buffer.tostring(var2873)
			elseif var2864 == 5 then
				local _ = nil
				local var2875, var2876 = protoModule.readBuffer(p104, var2859)
				var2859 = var2876
				var2858.feed_item_id = buffer.tostring(var2875)
			elseif var2864 == 6 then
				local _ = nil
				local var2877, var2878 = protoModule.readBuffer(p104, var2859)
				var2859 = var2878
				var2858.capture_universe_id = buffer.tostring(var2877)
			else
				local _ = nil
				local var2879, var2880 = protoModule.readVarInt(p104, var2859)
				var2859 = var2880 + var2879
			end
		elseif var2860 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2881, var2882 = protoModule.readFixed32(p104, var2859)
			local _ = var2881
			var2859 = var2882
		elseif var2860 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2883, var2884 = protoModule.readFixed64(p104, var2859)
			local _ = var2883
			var2859 = var2884
		else
			error("Unsupported wire type: " .. var4160)
		end
	end
	return var2858
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
	local var2885 = t_104.new()
	
	if self.moment_id ~= nil then
		var2885.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var2885.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var2885.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2885.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var2885.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var2885.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var2885.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var2885.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var2885.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var2885.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var2885.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var2885.capture_universe_id = self.captureUniverseId
	end
	return var2885
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
	local var2885 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2886, var2887 = protoModule.writeTag(buff, var2885, 1, protoModule.wireTypes.lengthDelimited)
		var2886, var4190 = protoModule.writeString(var2886, var2887, self.title)
		buff = var2886
		var2885 = var2887
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2888, var2889 = protoModule.writeTag(buff, var2885, 2, protoModule.wireTypes.lengthDelimited)
		var2888, var4192 = protoModule.writeString(var2888, var2889, self.subtitle)
		buff = var2888
		var2885 = var2889
	end
	local buff_1 = buffer.create(var2885)
	buffer.copy(buff_1, 0, buff, 0, var2885)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2885 = t_105.new()
	local var2886 = 0
	while var2886 < buffer.len(p105) do
		local _ = nil
		local var2887 = nil
		local var2888, var2889, var2890 = protoModule.readTag(p105, var2886)
		local var2891 = var2888
		var2887 = var2889
		var2886 = var2890
		
		if var2887 == protoModule.wireTypes.varint then
			local _ = nil
			local var2892, var2893 = protoModule.readVarInt(p105, var2886)
			local _ = var2892
			var2886 = var2893
			continue
		end
		if var2887 == protoModule.wireTypes.lengthDelimited then
			if var2891 == 1 then
				local _ = nil
				local var2894, var2895 = protoModule.readBuffer(p105, var2886)
				var2886 = var2895
				var2885.title = buffer.tostring(var2894)
			elseif var2891 == 2 then
				local _ = nil
				local var2896, var2897 = protoModule.readBuffer(p105, var2886)
				var2886 = var2897
				var2885.subtitle = buffer.tostring(var2896)
			else
				local _ = nil
				local var2898, var2899 = protoModule.readVarInt(p105, var2886)
				var2886 = var2899 + var2898
			end
		elseif var2887 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2900, var2901 = protoModule.readFixed32(p105, var2886)
			local _ = var2900
			var2886 = var2901
		elseif var2887 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2902, var2903 = protoModule.readFixed64(p105, var2886)
			local _ = var2902
			var2886 = var2903
		else
			error("Unsupported wire type: " .. var4196)
		end
	end
	return var2885
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
	local var2904 = t_105.new()
	
	if self.title ~= nil then
		var2904.title = self.title
	end
	if self.subtitle ~= nil then
		var2904.subtitle = self.subtitle
	end
	return var2904
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
	local var2904 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var2905, var2906 = protoModule.writeTag(buff, var2904, 1, protoModule.wireTypes.lengthDelimited)
		var2905, var4218 = protoModule.writeString(var2905, var2906, self.primary_cta_button_text)
		buff = var2905
		var2904 = var2906
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var2907, var2908 = protoModule.writeTag(buff, var2904, 2, protoModule.wireTypes.lengthDelimited)
		var2907, var4220 = protoModule.writeString(var2907, var2908, self.secondary_cta_button_text)
		buff = var2907
		var2904 = var2908
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var2909, var2910 = protoModule.writeTag(buff, var2904, 3, protoModule.wireTypes.lengthDelimited)
		var2909, var4222 = protoModule.writeString(var2909, var2910, self.primary_cta_type)
		buff = var2909
		var2904 = var2910
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var2911, var2912 = protoModule.writeTag(buff, var2904, 4, protoModule.wireTypes.lengthDelimited)
		var2911, var4224 = protoModule.writeString(var2911, var2912, self.secondary_cta_type)
		buff = var2911
		var2904 = var2912
	end
	local buff_1 = buffer.create(var2904)
	buffer.copy(buff_1, 0, buff, 0, var2904)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var2904 = t_106.new()
	local var2905 = 0
	while var2905 < buffer.len(p106) do
		local _ = nil
		local var2906 = nil
		local var2907, var2908, var2909 = protoModule.readTag(p106, var2905)
		local var2910 = var2907
		var2906 = var2908
		var2905 = var2909
		
		if var2906 == protoModule.wireTypes.varint then
			local _ = nil
			local var2911, var2912 = protoModule.readVarInt(p106, var2905)
			local _ = var2911
			var2905 = var2912
			continue
		end
		if var2906 == protoModule.wireTypes.lengthDelimited then
			if var2910 == 1 then
				local _ = nil
				local var2913, var2914 = protoModule.readBuffer(p106, var2905)
				var2905 = var2914
				var2904.primary_cta_button_text = buffer.tostring(var2913)
			elseif var2910 == 2 then
				local _ = nil
				local var2915, var2916 = protoModule.readBuffer(p106, var2905)
				var2905 = var2916
				var2904.secondary_cta_button_text = buffer.tostring(var2915)
			elseif var2910 == 3 then
				local _ = nil
				local var2917, var2918 = protoModule.readBuffer(p106, var2905)
				var2905 = var2918
				var2904.primary_cta_type = buffer.tostring(var2917)
			elseif var2910 == 4 then
				local _ = nil
				local var2919, var2920 = protoModule.readBuffer(p106, var2905)
				var2905 = var2920
				var2904.secondary_cta_type = buffer.tostring(var2919)
			else
				local _ = nil
				local var2921, var2922 = protoModule.readVarInt(p106, var2905)
				var2905 = var2922 + var2921
			end
		elseif var2906 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2923, var2924 = protoModule.readFixed32(p106, var2905)
			local _ = var2923
			var2905 = var2924
		elseif var2906 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2925, var2926 = protoModule.readFixed64(p106, var2905)
			local _ = var2925
			var2905 = var2926
		else
			error("Unsupported wire type: " .. var4228)
		end
	end
	return var2904
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
	local var2927 = t_106.new()
	
	if self.primary_cta_button_text ~= nil then
		var2927.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var2927.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var2927.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var2927.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var2927.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var2927.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var2927.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var2927.secondary_cta_type = self.secondaryCtaType
	end
	return var2927
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
	local var2927 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2928, var2929 = protoModule.writeTag(buff, var2927, 1, protoModule.wireTypes.lengthDelimited)
		var2928, var4254 = protoModule.writeString(var2928, var2929, self.image_asset_id)
		buff = var2928
		var2927 = var2929
	end
	local buff_1 = buffer.create(var2927)
	buffer.copy(buff_1, 0, buff, 0, var2927)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2927 = t_107.new()
	local var2928 = 0
	while var2928 < buffer.len(p107) do
		local _ = nil
		local var2929 = nil
		local var2930, var2931, var2932 = protoModule.readTag(p107, var2928)
		local var2933 = var2930
		var2929 = var2931
		var2928 = var2932
		
		if var2929 == protoModule.wireTypes.varint then
			local _ = nil
			local var2934, var2935 = protoModule.readVarInt(p107, var2928)
			local _ = var2934
			var2928 = var2935
			continue
		end
		if var2929 == protoModule.wireTypes.lengthDelimited then
			if var2933 == 1 then
				local _ = nil
				local var2936, var2937 = protoModule.readBuffer(p107, var2928)
				var2928 = var2937
				var2927.image_asset_id = buffer.tostring(var2936)
			else
				local _ = nil
				local var2938, var2939 = protoModule.readVarInt(p107, var2928)
				var2928 = var2939 + var2938
			end
		elseif var2929 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2940, var2941 = protoModule.readFixed32(p107, var2928)
			local _ = var2940
			var2928 = var2941
		elseif var2929 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2942, var2943 = protoModule.readFixed64(p107, var2928)
			local _ = var2942
			var2928 = var2943
		else
			error("Unsupported wire type: " .. var4258)
		end
	end
	return var2927
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
	local var2944 = t_107.new()
	
	if self.image_asset_id ~= nil then
		var2944.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var2944.image_asset_id = self.imageAssetId
	end
	return var2944
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
	local var2944 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2945, var2946 = protoModule.writeTag(buff, var2944, 1, protoModule.wireTypes.lengthDelimited)
		var2945, var4278 = protoModule.writeString(var2945, var2946, self.video_asset_id)
		buff = var2945
		var2944 = var2946
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var2947, var2948 = protoModule.writeTag(buff, var2944, 2, protoModule.wireTypes.lengthDelimited)
		var2947, var4280 = protoModule.writeString(var2947, var2948, self.loading_image_asset_id)
		buff = var2947
		var2944 = var2948
	end
	local buff_1 = buffer.create(var2944)
	buffer.copy(buff_1, 0, buff, 0, var2944)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var2944 = t_108.new()
	local var2945 = 0
	while var2945 < buffer.len(p108) do
		local _ = nil
		local var2946 = nil
		local var2947, var2948, var2949 = protoModule.readTag(p108, var2945)
		local var2950 = var2947
		var2946 = var2948
		var2945 = var2949
		
		if var2946 == protoModule.wireTypes.varint then
			local _ = nil
			local var2951, var2952 = protoModule.readVarInt(p108, var2945)
			local _ = var2951
			var2945 = var2952
			continue
		end
		if var2946 == protoModule.wireTypes.lengthDelimited then
			if var2950 == 1 then
				local _ = nil
				local var2953, var2954 = protoModule.readBuffer(p108, var2945)
				var2945 = var2954
				var2944.video_asset_id = buffer.tostring(var2953)
			elseif var2950 == 2 then
				local _ = nil
				local var2955, var2956 = protoModule.readBuffer(p108, var2945)
				var2945 = var2956
				var2944.loading_image_asset_id = buffer.tostring(var2955)
			else
				local _ = nil
				local var2957, var2958 = protoModule.readVarInt(p108, var2945)
				var2945 = var2958 + var2957
			end
		elseif var2946 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2959, var2960 = protoModule.readFixed32(p108, var2945)
			local _ = var2959
			var2945 = var2960
		elseif var2946 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2961, var2962 = protoModule.readFixed64(p108, var2945)
			local _ = var2961
			var2945 = var2962
		else
			error("Unsupported wire type: " .. var4284)
		end
	end
	return var2944
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
	local var2963 = t_108.new()
	
	if self.video_asset_id ~= nil then
		var2963.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2963.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var2963.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var2963.loading_image_asset_id = self.loadingImageAssetId
	end
	return var2963
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
	local var2963 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var2964, var2965 = protoModule.writeTag(buff, var2963, 1, protoModule.wireTypes.lengthDelimited)
		var2964, var4306 = protoModule.writeString(var2964, var2965, self.text)
		buff = var2964
		var2963 = var2965
	end
	if self.is_rendered_text then
		local var2966, var2967 = protoModule.writeTag(buff, var2963, 2, protoModule.wireTypes.varint)
		var2966, var4308 = protoModule.writeVarInt(var2966, var2967, if self.is_rendered_text then 1 else 0)
		buff = var2966
		var2963 = var2967
	end
	local buff_1 = buffer.create(var2963)
	buffer.copy(buff_1, 0, buff, 0, var2963)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref)
	local var2963 = t_109.new()
	local var2964 = 0
	while var2964 < buffer.len(p109) do
		local _ = nil
		local var2965 = nil
		local var2966, var2967, var2968 = protoModule.readTag(p109, var2964)
		local var2969 = var2966
		var2965 = var2967
		var2964 = var2968
		
		if var2965 == protoModule.wireTypes.varint then
			if var2969 == 2 then
				local _ = nil
				local var2970, var2971 = protoModule.readVarInt(p109, var2964)
				var2964 = var2971
				var2963.is_rendered_text = var2970 ~= 0
			else
				local _ = nil
				local var2972, var2973 = protoModule.readVarInt(p109, var2964)
				local _ = var2972
				var2964 = var2973
			end
		end
		if var2965 == protoModule.wireTypes.lengthDelimited then
			if var2969 == 1 then
				local _ = nil
				local var2974, var2975 = protoModule.readBuffer(p109, var2964)
				var2964 = var2975
				var2963.text = buffer.tostring(var2974)
			else
				local _ = nil
				local var2976, var2977 = protoModule.readVarInt(p109, var2964)
				var2964 = var2977 + var2976
			end
		elseif var2965 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2978, var2979 = protoModule.readFixed32(p109, var2964)
			local _ = var2978
			var2964 = var2979
		elseif var2965 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2980, var2981 = protoModule.readFixed64(p109, var2964)
			local _ = var2980
			var2964 = var2981
		else
			error("Unsupported wire type: " .. var4312)
		end
	end
	return var2963
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
	local var2982 = t_109.new()
	
	if self.text ~= nil then
		var2982.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var2982.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var2982.is_rendered_text = self.isRenderedText
	end
	return var2982
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
	local var2982 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2983, var2984 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2983, var4334 = protoModule.writeString(var2983, var2984, i)
			local var2985 = v:encode()
			var2984, var4336 = protoModule.writeTag(var2983, var2984, 2, protoModule.wireTypes.lengthDelimited)
			var2984, var4336 = protoModule.writeBuffer(var2984, var4336, var2985, buffer.len(var2985))
			local var2986 = var2984
			local var2987 = var4336
			local var2988, var2989 = protoModule.writeTag(buff, var2982, 1, protoModule.wireTypes.lengthDelimited)
			var2988, var4340 = protoModule.writeBuffer(var2988, var2989, var2986, var2987)
			buff = var2988
			var2982 = var2989
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2990, var2991 = protoModule.writeTag(buff, var2982, 2, protoModule.wireTypes.lengthDelimited)
			var2990, var4342 = protoModule.writeString(var2990, var2991, v)
			buff = var2990
			var2982 = var2991
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var2992, var2993 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2992, var4344 = protoModule.writeString(var2992, var2993, i)
			local var2994 = v:encode()
			var2993, var4346 = protoModule.writeTag(var2992, var2993, 2, protoModule.wireTypes.lengthDelimited)
			var2993, var4346 = protoModule.writeBuffer(var2993, var4346, var2994, buffer.len(var2994))
			local var2995 = var2993
			local var2996 = var4346
			local var2997, var2998 = protoModule.writeTag(buff, var2982, 3, protoModule.wireTypes.lengthDelimited)
			var2997, var4350 = protoModule.writeBuffer(var2997, var2998, var2995, var2996)
			buff = var2997
			var2982 = var2998
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2999, var3000 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2999, var4352 = protoModule.writeString(var2999, var3000, i)
			local var3001 = v:encode()
			var3000, var4354 = protoModule.writeTag(var2999, var3000, 2, protoModule.wireTypes.lengthDelimited)
			var3000, var4354 = protoModule.writeBuffer(var3000, var4354, var3001, buffer.len(var3001))
			local var3002 = var3000
			local var3003 = var4354
			local var3004, var3005 = protoModule.writeTag(buff, var2982, 4, protoModule.wireTypes.lengthDelimited)
			var3004, var4358 = protoModule.writeBuffer(var3004, var3005, var3002, var3003)
			buff = var3004
			var2982 = var3005
		end
	end
	local buff_1 = buffer.create(var2982)
	buffer.copy(buff_1, 0, buff, 0, var2982)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var3006 = t_110.new()
	local var3007 = 0
	while var3007 < buffer.len(p110) do
		local _ = nil
		local var3008 = nil
		local var3009, var3010, var3011 = protoModule.readTag(p110, var3007)
		local var3012 = var3009
		var3008 = var3010
		var3007 = var3011
		
		if var3008 == protoModule.wireTypes.varint then
			local _ = nil
			local var3013, var3014 = protoModule.readVarInt(p110, var3007)
			local _ = var3013
			var3007 = var3014
			continue
		end
		if var3008 == protoModule.wireTypes.lengthDelimited then
			if var3012 == 1 then
				local _ = nil
				local var3015, var3016 = protoModule.readBuffer(p110, var3007)
				var3007 = var3016
				var3015 = t.VerticalFeedInputData_EntryMapEntry.decode(var3015)
				var3006.entry_map[var3015.key or ""] = var3015.value or t.FeedEntry.new()
			elseif var3012 == 2 then
				local _ = nil
				local var3017, var3018 = protoModule.readBuffer(p110, var3007)
				var3007 = var3018
				table.insert(var3006.entry_order, buffer.tostring(var3017))
			elseif var3012 == 3 then
				local _ = nil
				local var3019, var3020 = protoModule.readBuffer(p110, var3007)
				var3007 = var3020
				var3019 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3019)
				var3006.entry_order_map[var3019.key or ""] = var3019.value or t.EntryOrder.new()
			elseif var3012 == 4 then
				local _ = nil
				local var3021, var3022 = protoModule.readBuffer(p110, var3007)
				var3007 = var3022
				var3021 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3021)
				var3006.content_pools[var3021.key or ""] = var3021.value or t.ContentPool.new()
			else
				local _ = nil
				local var3023, var3024 = protoModule.readVarInt(p110, var3007)
				var3007 = var3024 + var3023
			end
		elseif var3008 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3025, var3026 = protoModule.readFixed32(p110, var3007)
			local _ = var3025
			var3007 = var3026
		elseif var3008 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3027, var3028 = protoModule.readFixed64(p110, var3007)
			local _ = var3027
			var3007 = var3028
		else
			error("Unsupported wire type: " .. var4362)
		end
	end
	return var3006
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
	local var3029 = t_110.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3029.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3029.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3029.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3029.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3029.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3029.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3029.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3029.content_pools = t_1
	end
	return var3029
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
	local var3030 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3031, var3032 = protoModule.writeTag(buff, var3030, 1, protoModule.wireTypes.lengthDelimited)
		var3031, var4400 = protoModule.writeString(var3031, var3032, self.key)
		buff = var3031
		var3030 = var3032
	end
	if self.value ~= nil then
		local var3033 = self.value:encode()
		local var3034, var3035 = protoModule.writeTag(buff, var3030, 2, protoModule.wireTypes.lengthDelimited)
		var3034, var4403 = protoModule.writeBuffer(var3034, var3035, var3033, buffer.len(var3033))
		buff = var3034
		var3030 = var3035
	end
	local buff_1 = buffer.create(var3030)
	buffer.copy(buff_1, 0, buff, 0, var3030)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var3030 = t_111.new()
	local var3031 = 0
	while var3031 < buffer.len(p111) do
		local _ = nil
		local var3032 = nil
		local var3033, var3034, var3035 = protoModule.readTag(p111, var3031)
		local var3036 = var3033
		var3032 = var3034
		var3031 = var3035
		
		if var3032 == protoModule.wireTypes.varint then
			local _ = nil
			local var3037, var3038 = protoModule.readVarInt(p111, var3031)
			local _ = var3037
			var3031 = var3038
			continue
		end
		if var3032 == protoModule.wireTypes.lengthDelimited then
			if var3036 == 1 then
				local _ = nil
				local var3039, var3040 = protoModule.readBuffer(p111, var3031)
				var3031 = var3040
				var3030.key = buffer.tostring(var3039)
			elseif var3036 == 2 then
				local _ = nil
				local var3041, var3042 = protoModule.readBuffer(p111, var3031)
				var3031 = var3042
				var3030.value = t.FeedEntry.decode(var3041)
			else
				local _ = nil
				local var3043, var3044 = protoModule.readVarInt(p111, var3031)
				var3031 = var3044 + var3043
			end
		elseif var3032 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3045, var3046 = protoModule.readFixed32(p111, var3031)
			local _ = var3045
			var3031 = var3046
		elseif var3032 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3047, var3048 = protoModule.readFixed64(p111, var3031)
			local _ = var3047
			var3031 = var3048
		else
			error("Unsupported wire type: " .. var4407)
		end
	end
	return var3030
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
	local var3049 = t_111.new()
	
	if self.key ~= nil then
		var3049.key = self.key
	end
	if self.value ~= nil then
		var3049.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3049
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
	local var3049 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3050, var3051 = protoModule.writeTag(buff, var3049, 1, protoModule.wireTypes.lengthDelimited)
		var3050, var4429 = protoModule.writeString(var3050, var3051, self.key)
		buff = var3050
		var3049 = var3051
	end
	if self.value ~= nil then
		local var3052 = self.value:encode()
		local var3053, var3054 = protoModule.writeTag(buff, var3049, 2, protoModule.wireTypes.lengthDelimited)
		var3053, var4432 = protoModule.writeBuffer(var3053, var3054, var3052, buffer.len(var3052))
		buff = var3053
		var3049 = var3054
	end
	local buff_1 = buffer.create(var3049)
	buffer.copy(buff_1, 0, buff, 0, var3049)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var3049 = t_112.new()
	local var3050 = 0
	while var3050 < buffer.len(p112) do
		local _ = nil
		local var3051 = nil
		local var3052, var3053, var3054 = protoModule.readTag(p112, var3050)
		local var3055 = var3052
		var3051 = var3053
		var3050 = var3054
		
		if var3051 == protoModule.wireTypes.varint then
			local _ = nil
			local var3056, var3057 = protoModule.readVarInt(p112, var3050)
			local _ = var3056
			var3050 = var3057
			continue
		end
		if var3051 == protoModule.wireTypes.lengthDelimited then
			if var3055 == 1 then
				local _ = nil
				local var3058, var3059 = protoModule.readBuffer(p112, var3050)
				var3050 = var3059
				var3049.key = buffer.tostring(var3058)
			elseif var3055 == 2 then
				local _ = nil
				local var3060, var3061 = protoModule.readBuffer(p112, var3050)
				var3050 = var3061
				var3049.value = t.EntryOrder.decode(var3060)
			else
				local _ = nil
				local var3062, var3063 = protoModule.readVarInt(p112, var3050)
				var3050 = var3063 + var3062
			end
		elseif var3051 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3064, var3065 = protoModule.readFixed32(p112, var3050)
			local _ = var3064
			var3050 = var3065
		elseif var3051 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3066, var3067 = protoModule.readFixed64(p112, var3050)
			local _ = var3066
			var3050 = var3067
		else
			error("Unsupported wire type: " .. var4436)
		end
	end
	return var3049
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
	local var3068 = t_112.new()
	
	if self.key ~= nil then
		var3068.key = self.key
	end
	if self.value ~= nil then
		var3068.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3068
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
	local var3068 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3069, var3070 = protoModule.writeTag(buff, var3068, 1, protoModule.wireTypes.lengthDelimited)
		var3069, var4458 = protoModule.writeString(var3069, var3070, self.key)
		buff = var3069
		var3068 = var3070
	end
	if self.value ~= nil then
		local var3071 = self.value:encode()
		local var3072, var3073 = protoModule.writeTag(buff, var3068, 2, protoModule.wireTypes.lengthDelimited)
		var3072, var4461 = protoModule.writeBuffer(var3072, var3073, var3071, buffer.len(var3071))
		buff = var3072
		var3068 = var3073
	end
	local buff_1 = buffer.create(var3068)
	buffer.copy(buff_1, 0, buff, 0, var3068)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var3068 = t_113.new()
	local var3069 = 0
	while var3069 < buffer.len(p113) do
		local _ = nil
		local var3070 = nil
		local var3071, var3072, var3073 = protoModule.readTag(p113, var3069)
		local var3074 = var3071
		var3070 = var3072
		var3069 = var3073
		
		if var3070 == protoModule.wireTypes.varint then
			local _ = nil
			local var3075, var3076 = protoModule.readVarInt(p113, var3069)
			local _ = var3075
			var3069 = var3076
			continue
		end
		if var3070 == protoModule.wireTypes.lengthDelimited then
			if var3074 == 1 then
				local _ = nil
				local var3077, var3078 = protoModule.readBuffer(p113, var3069)
				var3069 = var3078
				var3068.key = buffer.tostring(var3077)
			elseif var3074 == 2 then
				local _ = nil
				local var3079, var3080 = protoModule.readBuffer(p113, var3069)
				var3069 = var3080
				var3068.value = t.ContentPool.decode(var3079)
			else
				local _ = nil
				local var3081, var3082 = protoModule.readVarInt(p113, var3069)
				var3069 = var3082 + var3081
			end
		elseif var3070 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3083, var3084 = protoModule.readFixed32(p113, var3069)
			local _ = var3083
			var3069 = var3084
		elseif var3070 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3085, var3086 = protoModule.readFixed64(p113, var3069)
			local _ = var3085
			var3069 = var3086
		else
			error("Unsupported wire type: " .. var4465)
		end
	end
	return var3068
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
	local var3087 = t_113.new()
	
	if self.key ~= nil then
		var3087.key = self.key
	end
	if self.value ~= nil then
		var3087.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3087
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
	local var3087 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3088 = self.foreground_header_entry:encode()
		local var3089, var3090 = protoModule.writeTag(buff, var3087, 1, protoModule.wireTypes.lengthDelimited)
		var3089, var4488 = protoModule.writeBuffer(var3089, var3090, var3088, buffer.len(var3088))
		buff = var3089
		var3087 = var3090
	end
	if self.background_header_entry ~= nil then
		local var3091 = self.background_header_entry:encode()
		local var3092, var3093 = protoModule.writeTag(buff, var3087, 2, protoModule.wireTypes.lengthDelimited)
		var3092, var4491 = protoModule.writeBuffer(var3092, var3093, var3091, buffer.len(var3091))
		buff = var3092
		var3087 = var3093
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3094, var3095 = protoModule.writeTag(buff, var3087, 3, protoModule.wireTypes.lengthDelimited)
		var3094, var4493 = protoModule.writeString(var3094, var3095, self.layout_variant)
		buff = var3094
		var3087 = var3095
	end
	local buff_1 = buffer.create(var3087)
	buffer.copy(buff_1, 0, buff, 0, var3087)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3087 = t_114.new()
	local var3088 = 0
	while var3088 < buffer.len(p114) do
		local _ = nil
		local var3089 = nil
		local var3090, var3091, var3092 = protoModule.readTag(p114, var3088)
		local var3093 = var3090
		var3089 = var3091
		var3088 = var3092
		
		if var3089 == protoModule.wireTypes.varint then
			local _ = nil
			local var3094, var3095 = protoModule.readVarInt(p114, var3088)
			local _ = var3094
			var3088 = var3095
			continue
		end
		if var3089 == protoModule.wireTypes.lengthDelimited then
			if var3093 == 1 then
				local _ = nil
				local var3096, var3097 = protoModule.readBuffer(p114, var3088)
				var3088 = var3097
				var3087.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3096)
			elseif var3093 == 2 then
				local _ = nil
				local var3098, var3099 = protoModule.readBuffer(p114, var3088)
				var3088 = var3099
				var3087.background_header_entry = t.BackgroundHeaderEntry.decode(var3098)
			elseif var3093 == 3 then
				local _ = nil
				local var3100, var3101 = protoModule.readBuffer(p114, var3088)
				var3088 = var3101
				var3087.layout_variant = buffer.tostring(var3100)
			else
				local _ = nil
				local var3102, var3103 = protoModule.readVarInt(p114, var3088)
				var3088 = var3103 + var3102
			end
		elseif var3089 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3104, var3105 = protoModule.readFixed32(p114, var3088)
			local _ = var3104
			var3088 = var3105
		elseif var3089 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3106, var3107 = protoModule.readFixed64(p114, var3088)
			local _ = var3106
			var3088 = var3107
		else
			error("Unsupported wire type: " .. var4497)
		end
	end
	return var3087
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
	local var3108 = t_114.new()
	
	if self.foreground_header_entry ~= nil then
		var3108.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3108.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3108.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3108.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3108.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3108.layout_variant = self.layoutVariant
	end
	return var3108
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
	local var3108 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3109, var3110 = protoModule.writeTag(buff, var3108, 1, protoModule.wireTypes.lengthDelimited)
		var3109, var4521 = protoModule.writeString(var3109, var3110, self.cta_button_text)
		buff = var3109
		var3108 = var3110
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3111, var3112 = protoModule.writeTag(buff, var3108, 2, protoModule.wireTypes.lengthDelimited)
		var3111, var4523 = protoModule.writeString(var3111, var3112, self.cta_type)
		buff = var3111
		var3108 = var3112
	end
	local buff_1 = buffer.create(var3108)
	buffer.copy(buff_1, 0, buff, 0, var3108)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref)
	local var3108 = t_115.new()
	local var3109 = 0
	while var3109 < buffer.len(p115) do
		local _ = nil
		local var3110 = nil
		local var3111, var3112, var3113 = protoModule.readTag(p115, var3109)
		local var3114 = var3111
		var3110 = var3112
		var3109 = var3113
		
		if var3110 == protoModule.wireTypes.varint then
			local _ = nil
			local var3115, var3116 = protoModule.readVarInt(p115, var3109)
			local _ = var3115
			var3109 = var3116
			continue
		end
		if var3110 == protoModule.wireTypes.lengthDelimited then
			if var3114 == 1 then
				local _ = nil
				local var3117, var3118 = protoModule.readBuffer(p115, var3109)
				var3109 = var3118
				var3108.cta_button_text = buffer.tostring(var3117)
			elseif var3114 == 2 then
				local _ = nil
				local var3119, var3120 = protoModule.readBuffer(p115, var3109)
				var3109 = var3120
				var3108.cta_type = buffer.tostring(var3119)
			else
				local _ = nil
				local var3121, var3122 = protoModule.readVarInt(p115, var3109)
				var3109 = var3122 + var3121
			end
		elseif var3110 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3123, var3124 = protoModule.readFixed32(p115, var3109)
			local _ = var3123
			var3109 = var3124
		elseif var3110 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3125, var3126 = protoModule.readFixed64(p115, var3109)
			local _ = var3125
			var3109 = var3126
		else
			error("Unsupported wire type: " .. var4527)
		end
	end
	return var3108
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
	local var3127 = t_115.new()
	
	if self.cta_button_text ~= nil then
		var3127.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3127.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3127.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3127.cta_type = self.ctaType
	end
	return var3127
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
	local var3127 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3128, var3129 = protoModule.writeTag(buff, var3127, 1, protoModule.wireTypes.lengthDelimited)
		var3128, var4549 = protoModule.writeString(var3128, var3129, self.title)
		buff = var3128
		var3127 = var3129
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3130, var3131 = protoModule.writeTag(buff, var3127, 2, protoModule.wireTypes.lengthDelimited)
		var3130, var4551 = protoModule.writeString(var3130, var3131, self.cta_button_text)
		buff = var3130
		var3127 = var3131
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3132, var3133 = protoModule.writeTag(buff, var3127, 3, protoModule.wireTypes.lengthDelimited)
		var3132, var4553 = protoModule.writeString(var3132, var3133, self.image_asset_id)
		buff = var3132
		var3127 = var3133
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3134, var3135 = protoModule.writeTag(buff, var3127, 4, protoModule.wireTypes.lengthDelimited)
		var3134, var4555 = protoModule.writeString(var3134, var3135, self.cta_type)
		buff = var3134
		var3127 = var3135
	end
	local buff_1 = buffer.create(var3127)
	buffer.copy(buff_1, 0, buff, 0, var3127)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3127 = t_116.new()
	local var3128 = 0
	while var3128 < buffer.len(p116) do
		local _ = nil
		local var3129 = nil
		local var3130, var3131, var3132 = protoModule.readTag(p116, var3128)
		local var3133 = var3130
		var3129 = var3131
		var3128 = var3132
		
		if var3129 == protoModule.wireTypes.varint then
			local _ = nil
			local var3134, var3135 = protoModule.readVarInt(p116, var3128)
			local _ = var3134
			var3128 = var3135
			continue
		end
		if var3129 == protoModule.wireTypes.lengthDelimited then
			if var3133 == 1 then
				local _ = nil
				local var3136, var3137 = protoModule.readBuffer(p116, var3128)
				var3128 = var3137
				var3127.title = buffer.tostring(var3136)
			elseif var3133 == 2 then
				local _ = nil
				local var3138, var3139 = protoModule.readBuffer(p116, var3128)
				var3128 = var3139
				var3127.cta_button_text = buffer.tostring(var3138)
			elseif var3133 == 3 then
				local _ = nil
				local var3140, var3141 = protoModule.readBuffer(p116, var3128)
				var3128 = var3141
				var3127.image_asset_id = buffer.tostring(var3140)
			elseif var3133 == 4 then
				local _ = nil
				local var3142, var3143 = protoModule.readBuffer(p116, var3128)
				var3128 = var3143
				var3127.cta_type = buffer.tostring(var3142)
			else
				local _ = nil
				local var3144, var3145 = protoModule.readVarInt(p116, var3128)
				var3128 = var3145 + var3144
			end
		elseif var3129 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3146, var3147 = protoModule.readFixed32(p116, var3128)
			local _ = var3146
			var3128 = var3147
		elseif var3129 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3148, var3149 = protoModule.readFixed64(p116, var3128)
			local _ = var3148
			var3128 = var3149
		else
			error("Unsupported wire type: " .. var4559)
		end
	end
	return var3127
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
	local var3150 = t_116.new()
	
	if self.title ~= nil then
		var3150.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3150.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3150.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3150.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3150.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3150.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3150.cta_type = self.ctaType
	end
	return var3150
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
	local var3150 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3151, var3152 = protoModule.writeTag(buff, var3150, 1, protoModule.wireTypes.lengthDelimited)
		var3151, var4585 = protoModule.writeString(var3151, var3152, self.title)
		buff = var3151
		var3150 = var3152
	end
	if self.url ~= nil then
		local var3153, var3154 = protoModule.writeTag(buff, var3150, 2, protoModule.wireTypes.lengthDelimited)
		var3153, var4587 = protoModule.writeString(var3153, var3154, self.url)
		buff = var3153
		var3150 = var3154
	end
	if self.destination ~= nil then
		local var3155, var3156 = protoModule.writeTag(buff, var3150, 3, protoModule.wireTypes.lengthDelimited)
		var3155, var4589 = protoModule.writeString(var3155, var3156, self.destination)
		buff = var3155
		var3150 = var3156
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local var3157, var3158 = protoModule.writeTag(buff, var3150, 4, protoModule.wireTypes.lengthDelimited)
		var3157, var4591 = protoModule.writeString(var3157, var3158, self.row_id)
		buff = var3157
		var3150 = var3158
	end
	local buff_1 = buffer.create(var3150)
	buffer.copy(buff_1, 0, buff, 0, var3150)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var3150 = t_117.new()
	local var3151 = 0
	while var3151 < buffer.len(p117) do
		local _ = nil
		local var3152 = nil
		local var3153, var3154, var3155 = protoModule.readTag(p117, var3151)
		local var3156 = var3153
		var3152 = var3154
		var3151 = var3155
		
		if var3152 == protoModule.wireTypes.varint then
			local _ = nil
			local var3157, var3158 = protoModule.readVarInt(p117, var3151)
			local _ = var3157
			var3151 = var3158
			continue
		end
		if var3152 == protoModule.wireTypes.lengthDelimited then
			if var3156 == 1 then
				local _ = nil
				local var3159, var3160 = protoModule.readBuffer(p117, var3151)
				var3151 = var3160
				var3150.title = buffer.tostring(var3159)
			elseif var3156 == 2 then
				local _ = nil
				local var3161, var3162 = protoModule.readBuffer(p117, var3151)
				var3151 = var3162
				var3150.url = buffer.tostring(var3161)
			elseif var3156 == 3 then
				local _ = nil
				local var3163, var3164 = protoModule.readBuffer(p117, var3151)
				var3151 = var3164
				var3150.destination = buffer.tostring(var3163)
			elseif var3156 == 4 then
				local _ = nil
				local var3165, var3166 = protoModule.readBuffer(p117, var3151)
				var3151 = var3166
				var3150.row_id = buffer.tostring(var3165)
			else
				local _ = nil
				local var3167, var3168 = protoModule.readVarInt(p117, var3151)
				var3151 = var3168 + var3167
			end
		elseif var3152 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3169, var3170 = protoModule.readFixed32(p117, var3151)
			local _ = var3169
			var3151 = var3170
		elseif var3152 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3171, var3172 = protoModule.readFixed64(p117, var3151)
			local _ = var3171
			var3151 = var3172
		else
			error("Unsupported wire type: " .. var4595)
		end
	end
	return var3150
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
	local var3173 = t_117.new()
	
	if self.title ~= nil then
		var3173.title = self.title
	end
	if self.url ~= nil then
		var3173.url = self.url
	end
	if self.destination ~= nil then
		var3173.destination = self.destination
	end
	if self.row_id ~= nil then
		var3173.row_id = self.row_id
	end
	if self.rowId ~= nil then
		var3173.row_id = self.rowId
	end
	return var3173
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
	local var3173 = 0
	
	if self.universe_id ~= nil then
		local var3174, var3175 = protoModule.writeTag(buff, var3173, 1, protoModule.wireTypes.lengthDelimited)
		var3174, var4621 = protoModule.writeString(var3174, var3175, self.universe_id)
		buff = var3174
		var3173 = var3175
	end
	if self.title ~= nil then
		local var3176, var3177 = protoModule.writeTag(buff, var3173, 2, protoModule.wireTypes.lengthDelimited)
		var3176, var4623 = protoModule.writeString(var3176, var3177, self.title)
		buff = var3176
		var3173 = var3177
	end
	if self.subtitle ~= nil then
		local var3178, var3179 = protoModule.writeTag(buff, var3173, 3, protoModule.wireTypes.lengthDelimited)
		var3178, var4625 = protoModule.writeString(var3178, var3179, self.subtitle)
		buff = var3178
		var3173 = var3179
	end
	if self.badge_text ~= nil then
		local var3180, var3181 = protoModule.writeTag(buff, var3173, 4, protoModule.wireTypes.lengthDelimited)
		var3180, var4627 = protoModule.writeString(var3180, var3181, self.badge_text)
		buff = var3180
		var3173 = var3181
	end
	if self.foreground ~= nil then
		local var3182 = self.foreground:encode()
		local var3183, var3184 = protoModule.writeTag(buff, var3173, 5, protoModule.wireTypes.lengthDelimited)
		var3183, var4630 = protoModule.writeBuffer(var3183, var3184, var3182, buffer.len(var3182))
		buff = var3183
		var3173 = var3184
	end
	if self.background ~= nil then
		local var3185 = self.background:encode()
		local var3186, var3187 = protoModule.writeTag(buff, var3173, 6, protoModule.wireTypes.lengthDelimited)
		var3186, var4633 = protoModule.writeBuffer(var3186, var3187, var3185, buffer.len(var3185))
		buff = var3186
		var3173 = var3187
	end
	if self.title_image ~= nil then
		local var3188 = self.title_image:encode()
		local var3189, var3190 = protoModule.writeTag(buff, var3173, 7, protoModule.wireTypes.lengthDelimited)
		var3189, var4636 = protoModule.writeBuffer(var3189, var3190, var3188, buffer.len(var3188))
		buff = var3189
		var3173 = var3190
	end
	if self.asset_title ~= nil then
		local var3191, var3192 = protoModule.writeTag(buff, var3173, 8, protoModule.wireTypes.lengthDelimited)
		var3191, var4638 = protoModule.writeString(var3191, var3192, self.asset_title)
		buff = var3191
		var3173 = var3192
	end
	if self.asset_subtitle ~= nil then
		local var3193, var3194 = protoModule.writeTag(buff, var3173, 9, protoModule.wireTypes.lengthDelimited)
		var3193, var4640 = protoModule.writeString(var3193, var3194, self.asset_subtitle)
		buff = var3193
		var3173 = var3194
	end
	if self.gradient ~= nil then
		local var3195 = self.gradient:encode()
		local var3196, var3197 = protoModule.writeTag(buff, var3173, 10, protoModule.wireTypes.lengthDelimited)
		var3196, var4643 = protoModule.writeBuffer(var3196, var3197, var3195, buffer.len(var3195))
		buff = var3196
		var3173 = var3197
	end
	if self.playable_text ~= nil then
		local var3198, var3199 = protoModule.writeTag(buff, var3173, 11, protoModule.wireTypes.lengthDelimited)
		var3198, var4645 = protoModule.writeString(var3198, var3199, self.playable_text)
		buff = var3198
		var3173 = var3199
	end
	if self.collection_id ~= nil then
		local var3200, var3201 = protoModule.writeTag(buff, var3173, 12, protoModule.wireTypes.lengthDelimited)
		var3200, var4647 = protoModule.writeString(var3200, var3201, self.collection_id)
		buff = var3200
		var3173 = var3201
	end
	if self.campaign_id ~= nil then
		local var3202, var3203 = protoModule.writeTag(buff, var3173, 13, protoModule.wireTypes.lengthDelimited)
		var3202, var4649 = protoModule.writeString(var3202, var3203, self.campaign_id)
		buff = var3202
		var3173 = var3203
	end
	if self.cohort_id ~= nil then
		local var3204, var3205 = protoModule.writeTag(buff, var3173, 14, protoModule.wireTypes.lengthDelimited)
		var3204, var4651 = protoModule.writeString(var3204, var3205, self.cohort_id)
		buff = var3204
		var3173 = var3205
	end
	if self.sort_id ~= nil then
		local var3206, var3207 = protoModule.writeTag(buff, var3173, 15, protoModule.wireTypes.lengthDelimited)
		var3206, var4653 = protoModule.writeString(var3206, var3207, self.sort_id)
		buff = var3206
		var3173 = var3207
	end
	if self.hero_unit_id ~= nil then
		local var3208, var3209 = protoModule.writeTag(buff, var3173, 16, protoModule.wireTypes.lengthDelimited)
		var3208, var4655 = protoModule.writeString(var3208, var3209, self.hero_unit_id)
		buff = var3208
		var3173 = var3209
	end
	if self.analytics_id ~= nil then
		local var3210, var3211 = protoModule.writeTag(buff, var3173, 17, protoModule.wireTypes.lengthDelimited)
		var3210, var4657 = protoModule.writeString(var3210, var3211, self.analytics_id)
		buff = var3210
		var3173 = var3211
	end
	if self.is_sponsored ~= nil then
		local var3212, var3213 = protoModule.writeTag(buff, var3173, 18, protoModule.wireTypes.varint)
		var3212, var4659 = protoModule.writeVarInt(var3212, var3213, if self.is_sponsored then 1 else 0)
		buff = var3212
		var3173 = var3213
	end
	local buff_1 = buffer.create(var3173)
	buffer.copy(buff_1, 0, buff, 0, var3173)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var3173 = t_118.new()
	local var3174 = 0
	while var3174 < buffer.len(p118) do
		local _ = nil
		local var3175 = nil
		local var3176, var3177, var3178 = protoModule.readTag(p118, var3174)
		local var3179 = var3176
		var3175 = var3177
		var3174 = var3178
		
		if var3175 == protoModule.wireTypes.varint then
			if var3179 == 18 then
				local _ = nil
				local var3180, var3181 = protoModule.readVarInt(p118, var3174)
				var3174 = var3181
				var3173.is_sponsored = var3180 ~= 0
			else
				local _ = nil
				local var3182, var3183 = protoModule.readVarInt(p118, var3174)
				local _ = var3182
				var3174 = var3183
			end
		end
		if var3175 == protoModule.wireTypes.lengthDelimited then
			if var3179 == 1 then
				local _ = nil
				local var3184, var3185 = protoModule.readBuffer(p118, var3174)
				var3174 = var3185
				var3173.universe_id = buffer.tostring(var3184)
			elseif var3179 == 2 then
				local _ = nil
				local var3186, var3187 = protoModule.readBuffer(p118, var3174)
				var3174 = var3187
				var3173.title = buffer.tostring(var3186)
			elseif var3179 == 3 then
				local _ = nil
				local var3188, var3189 = protoModule.readBuffer(p118, var3174)
				var3174 = var3189
				var3173.subtitle = buffer.tostring(var3188)
			elseif var3179 == 4 then
				local _ = nil
				local var3190, var3191 = protoModule.readBuffer(p118, var3174)
				var3174 = var3191
				var3173.badge_text = buffer.tostring(var3190)
			elseif var3179 == 5 then
				local _ = nil
				local var3192, var3193 = protoModule.readBuffer(p118, var3174)
				var3174 = var3193
				var3173.foreground = t.HeroUnitInputData_VisualAsset.decode(var3192)
			elseif var3179 == 6 then
				local _ = nil
				local var3194, var3195 = protoModule.readBuffer(p118, var3174)
				var3174 = var3195
				var3173.background = t.HeroUnitInputData_VisualAsset.decode(var3194)
			elseif var3179 == 7 then
				local _ = nil
				local var3196, var3197 = protoModule.readBuffer(p118, var3174)
				var3174 = var3197
				var3173.title_image = t.HeroUnitInputData_VisualAsset.decode(var3196)
			elseif var3179 == 8 then
				local _ = nil
				local var3198, var3199 = protoModule.readBuffer(p118, var3174)
				var3174 = var3199
				var3173.asset_title = buffer.tostring(var3198)
			elseif var3179 == 9 then
				local _ = nil
				local var3200, var3201 = protoModule.readBuffer(p118, var3174)
				var3174 = var3201
				var3173.asset_subtitle = buffer.tostring(var3200)
			elseif var3179 == 10 then
				local _ = nil
				local var3202, var3203 = protoModule.readBuffer(p118, var3174)
				var3174 = var3203
				var3173.gradient = t.HeroUnitInputData_Gradient.decode(var3202)
			elseif var3179 == 11 then
				local _ = nil
				local var3204, var3205 = protoModule.readBuffer(p118, var3174)
				var3174 = var3205
				var3173.playable_text = buffer.tostring(var3204)
			elseif var3179 == 12 then
				local _ = nil
				local var3206, var3207 = protoModule.readBuffer(p118, var3174)
				var3174 = var3207
				var3173.collection_id = buffer.tostring(var3206)
			elseif var3179 == 13 then
				local _ = nil
				local var3208, var3209 = protoModule.readBuffer(p118, var3174)
				var3174 = var3209
				var3173.campaign_id = buffer.tostring(var3208)
			elseif var3179 == 14 then
				local _ = nil
				local var3210, var3211 = protoModule.readBuffer(p118, var3174)
				var3174 = var3211
				var3173.cohort_id = buffer.tostring(var3210)
			elseif var3179 == 15 then
				local _ = nil
				local var3212, var3213 = protoModule.readBuffer(p118, var3174)
				var3174 = var3213
				var3173.sort_id = buffer.tostring(var3212)
			elseif var3179 == 16 then
				local _ = nil
				local var3214, var3215 = protoModule.readBuffer(p118, var3174)
				var3174 = var3215
				var3173.hero_unit_id = buffer.tostring(var3214)
			elseif var3179 == 17 then
				local _ = nil
				local var3216, var3217 = protoModule.readBuffer(p118, var3174)
				var3174 = var3217
				var3173.analytics_id = buffer.tostring(var3216)
			else
				local _ = nil
				local var3218, var3219 = protoModule.readVarInt(p118, var3174)
				var3174 = var3219 + var3218
			end
		elseif var3175 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3220, var3221 = protoModule.readFixed32(p118, var3174)
			local _ = var3220
			var3174 = var3221
		elseif var3175 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3222, var3223 = protoModule.readFixed64(p118, var3174)
			local _ = var3222
			var3174 = var3223
		else
			error("Unsupported wire type: " .. var4663)
		end
	end
	return var3173
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
	local var3224 = t_118.new()
	
	if self.universe_id ~= nil then
		var3224.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3224.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3224.title = self.title
	end
	if self.subtitle ~= nil then
		var3224.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3224.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3224.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3224.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3224.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3224.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3224.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3224.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3224.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3224.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3224.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3224.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3224.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3224.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3224.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3224.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3224.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3224.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3224.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3224.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3224.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3224.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3224.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3224.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3224.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3224.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3224.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3224.is_sponsored = self.isSponsored
	end
	return var3224
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
	local var3224 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3225, var3226 = protoModule.writeTag(buff, var3224, 1, protoModule.wireTypes.lengthDelimited)
		var3225, var4717 = protoModule.writeString(var3225, var3226, self.asset_id)
		buff = var3225
		var3224 = var3226
	end
	if self.aspect_ratio ~= nil then
		local var3227, var3228 = protoModule.writeTag(buff, var3224, 2, protoModule.wireTypes.i64)
		var3227, var4719 = protoModule.writeDouble(var3227, var3228, self.aspect_ratio)
		buff = var3227
		var3224 = var3228
	end
	if self.enable_animation ~= nil then
		local var3229, var3230 = protoModule.writeTag(buff, var3224, 3, protoModule.wireTypes.varint)
		var3229, var4721 = protoModule.writeVarInt(var3229, var3230, if self.enable_animation then 1 else 0)
		buff = var3229
		var3224 = var3230
	end
	local buff_1 = buffer.create(var3224)
	buffer.copy(buff_1, 0, buff, 0, var3224)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3224 = t_119.new()
	local var3225 = 0
	while var3225 < buffer.len(p119) do
		local _ = nil
		local var3226 = nil
		local var3227, var3228, var3229 = protoModule.readTag(p119, var3225)
		local var3230 = var3227
		var3226 = var3228
		var3225 = var3229
		
		if var3226 == protoModule.wireTypes.varint then
			if var3230 == 3 then
				local _ = nil
				local var3231, var3232 = protoModule.readVarInt(p119, var3225)
				var3225 = var3232
				var3224.enable_animation = var3231 ~= 0
			else
				local _ = nil
				local var3233, var3234 = protoModule.readVarInt(p119, var3225)
				local _ = var3233
				var3225 = var3234
			end
		end
		if var3226 == protoModule.wireTypes.lengthDelimited then
			if var3230 == 1 then
				local _ = nil
				local var3235, var3236 = protoModule.readBuffer(p119, var3225)
				var3225 = var3236
				var3224.asset_id = buffer.tostring(var3235)
			else
				local _ = nil
				local var3237, var3238 = protoModule.readVarInt(p119, var3225)
				var3225 = var3238 + var3237
			end
		elseif var3226 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3239, var3240 = protoModule.readFixed32(p119, var3225)
			local _ = var3239
			var3225 = var3240
		elseif var3226 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4725)
		elseif var3230 == 2 then
			local _ = nil
			local var3241, var3242 = protoModule.readDouble(p119, var3225)
			var3225 = var3242
			var3224.aspect_ratio = var3241
		else
			local _ = nil
			local var3243, var3244 = protoModule.readFixed64(p119, var3225)
			local _ = var3243
			var3225 = var3244
		end
	end
	return var3224
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
	local var3245 = t_119.new()
	
	if self.asset_id ~= nil then
		var3245.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3245.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3245.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3245.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3245.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3245.enable_animation = self.enableAnimation
	end
	return var3245
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
	local var3245 = 0
	
	if self.start_color ~= nil then
		local var3246, var3247 = protoModule.writeTag(buff, var3245, 1, protoModule.wireTypes.lengthDelimited)
		var3246, var4749 = protoModule.writeString(var3246, var3247, self.start_color)
		buff = var3246
		var3245 = var3247
	end
	if self.end_color ~= nil then
		local var3248, var3249 = protoModule.writeTag(buff, var3245, 2, protoModule.wireTypes.lengthDelimited)
		var3248, var4751 = protoModule.writeString(var3248, var3249, self.end_color)
		buff = var3248
		var3245 = var3249
	end
	if self.start_opacity ~= nil then
		local var3250, var3251 = protoModule.writeTag(buff, var3245, 3, protoModule.wireTypes.i64)
		var3250, var4753 = protoModule.writeDouble(var3250, var3251, self.start_opacity)
		buff = var3250
		var3245 = var3251
	end
	if self.end_opacity ~= nil then
		local var3252, var3253 = protoModule.writeTag(buff, var3245, 4, protoModule.wireTypes.i64)
		var3252, var4755 = protoModule.writeDouble(var3252, var3253, self.end_opacity)
		buff = var3252
		var3245 = var3253
	end
	if self.degree ~= nil then
		local var3254, var3255 = protoModule.writeTag(buff, var3245, 5, protoModule.wireTypes.i64)
		var3254, var4757 = protoModule.writeDouble(var3254, var3255, self.degree)
		buff = var3254
		var3245 = var3255
	end
	local buff_1 = buffer.create(var3245)
	buffer.copy(buff_1, 0, buff, 0, var3245)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3245 = t_120.new()
	local var3246 = 0
	while var3246 < buffer.len(p120) do
		local _ = nil
		local var3247 = nil
		local var3248, var3249, var3250 = protoModule.readTag(p120, var3246)
		local var3251 = var3248
		var3247 = var3249
		var3246 = var3250
		
		if var3247 == protoModule.wireTypes.varint then
			local _ = nil
			local var3252, var3253 = protoModule.readVarInt(p120, var3246)
			local _ = var3252
			var3246 = var3253
			continue
		end
		if var3247 == protoModule.wireTypes.lengthDelimited then
			if var3251 == 1 then
				local _ = nil
				local var3254, var3255 = protoModule.readBuffer(p120, var3246)
				var3246 = var3255
				var3245.start_color = buffer.tostring(var3254)
			elseif var3251 == 2 then
				local _ = nil
				local var3256, var3257 = protoModule.readBuffer(p120, var3246)
				var3246 = var3257
				var3245.end_color = buffer.tostring(var3256)
			else
				local _ = nil
				local var3258, var3259 = protoModule.readVarInt(p120, var3246)
				var3246 = var3259 + var3258
			end
		elseif var3247 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3260, var3261 = protoModule.readFixed32(p120, var3246)
			local _ = var3260
			var3246 = var3261
		elseif var3247 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4761)
		elseif var3251 == 3 then
			local _ = nil
			local var3262, var3263 = protoModule.readDouble(p120, var3246)
			var3246 = var3263
			var3245.start_opacity = var3262
		elseif var3251 == 4 then
			local _ = nil
			local var3264, var3265 = protoModule.readDouble(p120, var3246)
			var3246 = var3265
			var3245.end_opacity = var3264
		elseif var3251 == 5 then
			local _ = nil
			local var3266, var3267 = protoModule.readDouble(p120, var3246)
			var3246 = var3267
			var3245.degree = var3266
		else
			local _ = nil
			local var3268, var3269 = protoModule.readFixed64(p120, var3246)
			local _ = var3268
			var3246 = var3269
		end
	end
	return var3245
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
	local var3270 = t_120.new()
	
	if self.start_color ~= nil then
		var3270.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3270.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3270.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3270.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3270.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3270.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3270.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3270.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3270.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3270
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
	local var3270 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3271 = v:encode()
			local var3272, var3273 = protoModule.writeTag(buff, var3270, 1, protoModule.wireTypes.lengthDelimited)
			var3272, var4790 = protoModule.writeBuffer(var3272, var3273, var3271, buffer.len(var3271))
			buff = var3272
			var3270 = var3273
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3274, var3275 = protoModule.writeTag(buff, var3270, 2, protoModule.wireTypes.lengthDelimited)
		var3274, var4792 = protoModule.writeString(var3274, var3275, self.sort_id)
		buff = var3274
		var3270 = var3275
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3276, var3277 = protoModule.writeTag(buff, var3270, 3, protoModule.wireTypes.lengthDelimited)
		var3276, var4794 = protoModule.writeString(var3276, var3277, self.recommendation_request_id)
		buff = var3276
		var3270 = var3277
	end
	local buff_1 = buffer.create(var3270)
	buffer.copy(buff_1, 0, buff, 0, var3270)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var3278 = t_121.new()
	local var3279 = 0
	while var3279 < buffer.len(p121) do
		local _ = nil
		local var3280 = nil
		local var3281, var3282, var3283 = protoModule.readTag(p121, var3279)
		local var3284 = var3281
		var3280 = var3282
		var3279 = var3283
		
		if var3280 == protoModule.wireTypes.varint then
			local _ = nil
			local var3285, var3286 = protoModule.readVarInt(p121, var3279)
			local _ = var3285
			var3279 = var3286
			continue
		end
		if var3280 == protoModule.wireTypes.lengthDelimited then
			if var3284 == 1 then
				local _ = nil
				local var3287, var3288 = protoModule.readBuffer(p121, var3279)
				var3279 = var3288
				table.insert(var3278.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3287))
			elseif var3284 == 2 then
				local _ = nil
				local var3289, var3290 = protoModule.readBuffer(p121, var3279)
				var3279 = var3290
				var3278.sort_id = buffer.tostring(var3289)
			elseif var3284 == 3 then
				local _ = nil
				local var3291, var3292 = protoModule.readBuffer(p121, var3279)
				var3279 = var3292
				var3278.recommendation_request_id = buffer.tostring(var3291)
			else
				local _ = nil
				local var3293, var3294 = protoModule.readVarInt(p121, var3279)
				var3279 = var3294 + var3293
			end
		elseif var3280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3295, var3296 = protoModule.readFixed32(p121, var3279)
			local _ = var3295
			var3279 = var3296
		elseif var3280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3297, var3298 = protoModule.readFixed64(p121, var3279)
			local _ = var3297
			var3279 = var3298
		else
			error("Unsupported wire type: " .. var4798)
		end
	end
	return var3278
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
	local var3299 = t_121.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3299.items = t_1
	end
	if self.sort_id ~= nil then
		var3299.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3299.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3299.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3299.recommendation_request_id = self.recommendationRequestId
	end
	return var3299
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
	local var3300 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3301, var3302 = protoModule.writeTag(buff, var3300, 1, protoModule.wireTypes.lengthDelimited)
		var3301, var4824 = protoModule.writeString(var3301, var3302, self.item_id)
		buff = var3301
		var3300 = var3302
	end
	if self.has_pending_friend_request then
		local var3303, var3304 = protoModule.writeTag(buff, var3300, 2, protoModule.wireTypes.varint)
		var3303, var4826 = protoModule.writeVarInt(var3303, var3304, if self.has_pending_friend_request then 1 else 0)
		buff = var3303
		var3300 = var3304
	end
	local buff_1 = buffer.create(var3300)
	buffer.copy(buff_1, 0, buff, 0, var3300)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref)
	local var3300 = t_122.new()
	local var3301 = 0
	while var3301 < buffer.len(p122) do
		local _ = nil
		local var3302 = nil
		local var3303, var3304, var3305 = protoModule.readTag(p122, var3301)
		local var3306 = var3303
		var3302 = var3304
		var3301 = var3305
		
		if var3302 == protoModule.wireTypes.varint then
			if var3306 == 2 then
				local _ = nil
				local var3307, var3308 = protoModule.readVarInt(p122, var3301)
				var3301 = var3308
				var3300.has_pending_friend_request = var3307 ~= 0
			else
				local _ = nil
				local var3309, var3310 = protoModule.readVarInt(p122, var3301)
				local _ = var3309
				var3301 = var3310
			end
		end
		if var3302 == protoModule.wireTypes.lengthDelimited then
			if var3306 == 1 then
				local _ = nil
				local var3311, var3312 = protoModule.readBuffer(p122, var3301)
				var3301 = var3312
				var3300.item_id = buffer.tostring(var3311)
			else
				local _ = nil
				local var3313, var3314 = protoModule.readVarInt(p122, var3301)
				var3301 = var3314 + var3313
			end
		elseif var3302 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3315, var3316 = protoModule.readFixed32(p122, var3301)
			local _ = var3315
			var3301 = var3316
		elseif var3302 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3317, var3318 = protoModule.readFixed64(p122, var3301)
			local _ = var3317
			var3301 = var3318
		else
			error("Unsupported wire type: " .. var4830)
		end
	end
	return var3300
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
	local var3319 = t_122.new()
	
	if self.item_id ~= nil then
		var3319.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3319.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3319.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3319.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3319
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
	local var3319 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3320, var3321 = protoModule.writeTag(buff, var3319, 1, protoModule.wireTypes.lengthDelimited)
		var3320, var4852 = protoModule.writeString(var3320, var3321, self.selected_option)
		buff = var3320
		var3319 = var3321
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3322, var3323 = protoModule.writeTag(buff, var3319, 2, protoModule.wireTypes.lengthDelimited)
		var3322, var4854 = protoModule.writeString(var3322, var3323, self.sort_id)
		buff = var3322
		var3319 = var3323
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3324 = v:encode()
			local var3325, var3326 = protoModule.writeTag(buff, var3319, 3, protoModule.wireTypes.lengthDelimited)
			var3325, var4857 = protoModule.writeBuffer(var3325, var3326, var3324, buffer.len(var3324))
			buff = var3325
			var3319 = var3326
		end
	end
	if self.experience_carousel ~= nil then
		local var3327 = self.experience_carousel:encode()
		local var3328, var3329 = protoModule.writeTag(buff, var3319, 4, protoModule.wireTypes.lengthDelimited)
		var3328, var4860 = protoModule.writeBuffer(var3328, var3329, var3327, buffer.len(var3327))
		buff = var3328
		var3319 = var3329
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3330, var3331 = protoModule.writeTag(buff, var3319, 5, protoModule.wireTypes.lengthDelimited)
		var3330, var4862 = protoModule.writeString(var3330, var3331, self.feed_item_key)
		buff = var3330
		var3319 = var3331
	end
	local buff_1 = buffer.create(var3319)
	buffer.copy(buff_1, 0, buff, 0, var3319)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var3332 = t_123.new()
	local var3333 = 0
	while var3333 < buffer.len(p123) do
		local _ = nil
		local var3334 = nil
		local var3335, var3336, var3337 = protoModule.readTag(p123, var3333)
		local var3338 = var3335
		var3334 = var3336
		var3333 = var3337
		
		if var3334 == protoModule.wireTypes.varint then
			local _ = nil
			local var3339, var3340 = protoModule.readVarInt(p123, var3333)
			local _ = var3339
			var3333 = var3340
			continue
		end
		if var3334 == protoModule.wireTypes.lengthDelimited then
			if var3338 == 1 then
				local _ = nil
				local var3341, var3342 = protoModule.readBuffer(p123, var3333)
				var3333 = var3342
				var3332.selected_option = buffer.tostring(var3341)
			elseif var3338 == 2 then
				local _ = nil
				local var3343, var3344 = protoModule.readBuffer(p123, var3333)
				var3333 = var3344
				var3332.sort_id = buffer.tostring(var3343)
			elseif var3338 == 3 then
				local _ = nil
				local var3345, var3346 = protoModule.readBuffer(p123, var3333)
				var3333 = var3346
				table.insert(var3332.options, t.SelectorOption.decode(var3345))
			elseif var3338 == 4 then
				local _ = nil
				local var3347, var3348 = protoModule.readBuffer(p123, var3333)
				var3333 = var3348
				var3332.experience_carousel = t.ExperienceCarouselInputData.decode(var3347)
			elseif var3338 == 5 then
				local _ = nil
				local var3349, var3350 = protoModule.readBuffer(p123, var3333)
				var3333 = var3350
				var3332.feed_item_key = buffer.tostring(var3349)
			else
				local _ = nil
				local var3351, var3352 = protoModule.readVarInt(p123, var3333)
				var3333 = var3352 + var3351
			end
		elseif var3334 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3353, var3354 = protoModule.readFixed32(p123, var3333)
			local _ = var3353
			var3333 = var3354
		elseif var3334 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3355, var3356 = protoModule.readFixed64(p123, var3333)
			local _ = var3355
			var3333 = var3356
		else
			error("Unsupported wire type: " .. var4866)
		end
	end
	return var3332
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
	local var3357 = t_123.new()
	
	if self.selected_option ~= nil then
		var3357.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3357.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3357.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3357.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3357.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3357.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3357.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3357.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3357.feed_item_key = self.feedItemKey
	end
	return var3357
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
	local var3358 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3359, var3360 = protoModule.writeTag(buff, var3358, 1, protoModule.wireTypes.lengthDelimited)
		var3359, var4896 = protoModule.writeString(var3359, var3360, self.id)
		buff = var3359
		var3358 = var3360
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3361, var3362 = protoModule.writeTag(buff, var3358, 2, protoModule.wireTypes.lengthDelimited)
		var3361, var4898 = protoModule.writeString(var3361, var3362, self.display_name)
		buff = var3361
		var3358 = var3362
	end
	if self.is_selected then
		local var3363, var3364 = protoModule.writeTag(buff, var3358, 3, protoModule.wireTypes.varint)
		var3363, var4900 = protoModule.writeVarInt(var3363, var3364, if self.is_selected then 1 else 0)
		buff = var3363
		var3358 = var3364
	end
	local buff_1 = buffer.create(var3358)
	buffer.copy(buff_1, 0, buff, 0, var3358)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3358 = t_124.new()
	local var3359 = 0
	while var3359 < buffer.len(p124) do
		local _ = nil
		local var3360 = nil
		local var3361, var3362, var3363 = protoModule.readTag(p124, var3359)
		local var3364 = var3361
		var3360 = var3362
		var3359 = var3363
		
		if var3360 == protoModule.wireTypes.varint then
			if var3364 == 3 then
				local _ = nil
				local var3365, var3366 = protoModule.readVarInt(p124, var3359)
				var3359 = var3366
				var3358.is_selected = var3365 ~= 0
			else
				local _ = nil
				local var3367, var3368 = protoModule.readVarInt(p124, var3359)
				local _ = var3367
				var3359 = var3368
			end
		end
		if var3360 == protoModule.wireTypes.lengthDelimited then
			if var3364 == 1 then
				local _ = nil
				local var3369, var3370 = protoModule.readBuffer(p124, var3359)
				var3359 = var3370
				var3358.id = buffer.tostring(var3369)
			elseif var3364 == 2 then
				local _ = nil
				local var3371, var3372 = protoModule.readBuffer(p124, var3359)
				var3359 = var3372
				var3358.display_name = buffer.tostring(var3371)
			else
				local _ = nil
				local var3373, var3374 = protoModule.readVarInt(p124, var3359)
				var3359 = var3374 + var3373
			end
		elseif var3360 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3375, var3376 = protoModule.readFixed32(p124, var3359)
			local _ = var3375
			var3359 = var3376
		elseif var3360 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3377, var3378 = protoModule.readFixed64(p124, var3359)
			local _ = var3377
			var3359 = var3378
		else
			error("Unsupported wire type: " .. var4904)
		end
	end
	return var3358
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
	local var3379 = t_124.new()
	
	if self.id ~= nil then
		var3379.id = self.id
	end
	if self.display_name ~= nil then
		var3379.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3379.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3379.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3379.is_selected = self.isSelected
	end
	return var3379
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
	local var3379 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3380 = v:encode()
			local var3381, var3382 = protoModule.writeTag(buff, var3379, 1, protoModule.wireTypes.lengthDelimited)
			var3381, var4929 = protoModule.writeBuffer(var3381, var3382, var3380, buffer.len(var3380))
			buff = var3381
			var3379 = var3382
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3383, var3384 = protoModule.writeTag(buff, var3379, 2, protoModule.wireTypes.lengthDelimited)
		var3383, var4931 = protoModule.writeString(var3383, var3384, self.title)
		buff = var3383
		var3379 = var3384
	end
	if self.sort_id ~= nil then
		local var3385, var3386 = protoModule.writeTag(buff, var3379, 3, protoModule.wireTypes.lengthDelimited)
		var3385, var4933 = protoModule.writeString(var3385, var3386, self.sort_id)
		buff = var3385
		var3379 = var3386
	end
	local buff_1 = buffer.create(var3379)
	buffer.copy(buff_1, 0, buff, 0, var3379)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3387 = t_125.new()
	local var3388 = 0
	while var3388 < buffer.len(p125) do
		local _ = nil
		local var3389 = nil
		local var3390, var3391, var3392 = protoModule.readTag(p125, var3388)
		local var3393 = var3390
		var3389 = var3391
		var3388 = var3392
		
		if var3389 == protoModule.wireTypes.varint then
			local _ = nil
			local var3394, var3395 = protoModule.readVarInt(p125, var3388)
			local _ = var3394
			var3388 = var3395
			continue
		end
		if var3389 == protoModule.wireTypes.lengthDelimited then
			if var3393 == 1 then
				local _ = nil
				local var3396, var3397 = protoModule.readBuffer(p125, var3388)
				var3388 = var3397
				table.insert(var3387.cards, t.GameItemsCardInputData.decode(var3396))
			elseif var3393 == 2 then
				local _ = nil
				local var3398, var3399 = protoModule.readBuffer(p125, var3388)
				var3388 = var3399
				var3387.title = buffer.tostring(var3398)
			elseif var3393 == 3 then
				local _ = nil
				local var3400, var3401 = protoModule.readBuffer(p125, var3388)
				var3388 = var3401
				var3387.sort_id = buffer.tostring(var3400)
			else
				local _ = nil
				local var3402, var3403 = protoModule.readVarInt(p125, var3388)
				var3388 = var3403 + var3402
			end
		elseif var3389 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3404, var3405 = protoModule.readFixed32(p125, var3388)
			local _ = var3404
			var3388 = var3405
		elseif var3389 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3406, var3407 = protoModule.readFixed64(p125, var3388)
			local _ = var3406
			var3388 = var3407
		else
			error("Unsupported wire type: " .. var4937)
		end
	end
	return var3387
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
	local var3408 = t_125.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3408.cards = t_1
	end
	if self.title ~= nil then
		var3408.title = self.title
	end
	if self.sort_id ~= nil then
		var3408.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3408.sort_id = self.sortId
	end
	return var3408
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
	local var3409 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3410, var3411 = protoModule.writeTag(buff, var3409, 1, protoModule.wireTypes.lengthDelimited)
		var3410, var4963 = protoModule.writeString(var3410, var3411, self.universe_id)
		buff = var3410
		var3409 = var3411
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3412 = v:encode()
			local var3413, var3414 = protoModule.writeTag(buff, var3409, 2, protoModule.wireTypes.lengthDelimited)
			var3413, var4966 = protoModule.writeBuffer(var3413, var3414, var3412, buffer.len(var3412))
			buff = var3413
			var3409 = var3414
		end
	end
	local buff_1 = buffer.create(var3409)
	buffer.copy(buff_1, 0, buff, 0, var3409)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref), t (ref)
	local var3415 = t_126.new()
	local var3416 = 0
	while var3416 < buffer.len(p126) do
		local _ = nil
		local var3417 = nil
		local var3418, var3419, var3420 = protoModule.readTag(p126, var3416)
		local var3421 = var3418
		var3417 = var3419
		var3416 = var3420
		
		if var3417 == protoModule.wireTypes.varint then
			local _ = nil
			local var3422, var3423 = protoModule.readVarInt(p126, var3416)
			local _ = var3422
			var3416 = var3423
			continue
		end
		if var3417 == protoModule.wireTypes.lengthDelimited then
			if var3421 == 1 then
				local _ = nil
				local var3424, var3425 = protoModule.readBuffer(p126, var3416)
				var3416 = var3425
				var3415.universe_id = buffer.tostring(var3424)
			elseif var3421 == 2 then
				local _ = nil
				local var3426, var3427 = protoModule.readBuffer(p126, var3416)
				var3416 = var3427
				table.insert(var3415.items, t.GameItemInputData.decode(var3426))
			else
				local _ = nil
				local var3428, var3429 = protoModule.readVarInt(p126, var3416)
				var3416 = var3429 + var3428
			end
		elseif var3417 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3430, var3431 = protoModule.readFixed32(p126, var3416)
			local _ = var3430
			var3416 = var3431
		elseif var3417 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3432, var3433 = protoModule.readFixed64(p126, var3416)
			local _ = var3432
			var3416 = var3433
		else
			error("Unsupported wire type: " .. var4970)
		end
	end
	return var3415
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
	local var3434 = t_126.new()
	
	if self.universe_id ~= nil then
		var3434.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3434.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3434.items = t_1
	end
	return var3434
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
	local var3435 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3436, var3437 = protoModule.writeTag(buff, var3435, 1, protoModule.wireTypes.lengthDelimited)
		var3436, var4994 = protoModule.writeString(var3436, var3437, self.item_id)
		buff = var3436
		var3435 = var3437
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3438, var3439 = protoModule.writeTag(buff, var3435, 2, protoModule.wireTypes.lengthDelimited)
		var3438, var4996 = protoModule.writeString(var3438, var3439, self.item_type)
		buff = var3438
		var3435 = var3439
	end
	local buff_1 = buffer.create(var3435)
	buffer.copy(buff_1, 0, buff, 0, var3435)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3435 = t_127.new()
	local var3436 = 0
	while var3436 < buffer.len(p127) do
		local _ = nil
		local var3437 = nil
		local var3438, var3439, var3440 = protoModule.readTag(p127, var3436)
		local var3441 = var3438
		var3437 = var3439
		var3436 = var3440
		
		if var3437 == protoModule.wireTypes.varint then
			local _ = nil
			local var3442, var3443 = protoModule.readVarInt(p127, var3436)
			local _ = var3442
			var3436 = var3443
			continue
		end
		if var3437 == protoModule.wireTypes.lengthDelimited then
			if var3441 == 1 then
				local _ = nil
				local var3444, var3445 = protoModule.readBuffer(p127, var3436)
				var3436 = var3445
				var3435.item_id = buffer.tostring(var3444)
			elseif var3441 == 2 then
				local _ = nil
				local var3446, var3447 = protoModule.readBuffer(p127, var3436)
				var3436 = var3447
				var3435.item_type = buffer.tostring(var3446)
			else
				local _ = nil
				local var3448, var3449 = protoModule.readVarInt(p127, var3436)
				var3436 = var3449 + var3448
			end
		elseif var3437 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3450, var3451 = protoModule.readFixed32(p127, var3436)
			local _ = var3450
			var3436 = var3451
		elseif var3437 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3452, var3453 = protoModule.readFixed64(p127, var3436)
			local _ = var3452
			var3436 = var3453
		else
			error("Unsupported wire type: " .. var5000)
		end
	end
	return var3435
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
	local var3454 = t_127.new()
	
	if self.item_id ~= nil then
		var3454.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3454.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3454.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3454.item_type = self.itemType
	end
	return var3454
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
		roblox_component = if p128 == nil or p128.roblox_component == nil then nil else p128.roblox_component,
		attribution_thumbnail_asset_id = if p128 == nil or p128.attribution_thumbnail_asset_id == nil then nil else p128.attribution_thumbnail_asset_id
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3454 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3455, var3456 = protoModule.writeTag(buff, var3454, 1, protoModule.wireTypes.lengthDelimited)
		var3455, var5022 = protoModule.writeString(var3455, var3456, self.clickout_url)
		buff = var3455
		var3454 = var3456
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3457, var3458 = protoModule.writeTag(buff, var3454, 2, protoModule.wireTypes.lengthDelimited)
		var3457, var5024 = protoModule.writeString(var3457, var3458, self.native_ad_data)
		buff = var3457
		var3454 = var3458
	end
	if self.payer_name ~= nil then
		local var3459, var3460 = protoModule.writeTag(buff, var3454, 3, protoModule.wireTypes.lengthDelimited)
		var3459, var5026 = protoModule.writeString(var3459, var3460, self.payer_name)
		buff = var3459
		var3454 = var3460
	end
	if self.logo_asset_id ~= nil then
		local var3461, var3462 = protoModule.writeTag(buff, var3454, 4, protoModule.wireTypes.lengthDelimited)
		var3461, var5028 = protoModule.writeString(var3461, var3462, self.logo_asset_id)
		buff = var3461
		var3454 = var3462
	end
	if self.logo_aspect_ratio ~= nil then
		local var3463, var3464 = protoModule.writeTag(buff, var3454, 5, protoModule.wireTypes.i64)
		var3463, var5030 = protoModule.writeDouble(var3463, var3464, self.logo_aspect_ratio)
		buff = var3463
		var3454 = var3464
	end
	if self.cta_text ~= nil then
		local var3465, var3466 = protoModule.writeTag(buff, var3454, 6, protoModule.wireTypes.lengthDelimited)
		var3465, var5032 = protoModule.writeString(var3465, var3466, self.cta_text)
		buff = var3465
		var3454 = var3466
	end
	if self.title ~= nil then
		local var3467, var3468 = protoModule.writeTag(buff, var3454, 7, protoModule.wireTypes.lengthDelimited)
		var3467, var5034 = protoModule.writeString(var3467, var3468, self.title)
		buff = var3467
		var3454 = var3468
	end
	if self.subtitle ~= nil then
		local var3469, var3470 = protoModule.writeTag(buff, var3454, 8, protoModule.wireTypes.lengthDelimited)
		var3469, var5036 = protoModule.writeString(var3469, var3470, self.subtitle)
		buff = var3469
		var3454 = var3470
	end
	if self.image_asset_id ~= nil then
		local var3471, var3472 = protoModule.writeTag(buff, var3454, 9, protoModule.wireTypes.lengthDelimited)
		var3471, var5038 = protoModule.writeString(var3471, var3472, self.image_asset_id)
		buff = var3471
		var3454 = var3472
	end
	if self.video_asset_id ~= nil then
		local var3473, var3474 = protoModule.writeTag(buff, var3454, 10, protoModule.wireTypes.lengthDelimited)
		var3473, var5040 = protoModule.writeString(var3473, var3474, self.video_asset_id)
		buff = var3473
		var3454 = var3474
	end
	if self.badge_text ~= nil then
		local var3475, var3476 = protoModule.writeTag(buff, var3454, 11, protoModule.wireTypes.lengthDelimited)
		var3475, var5042 = protoModule.writeString(var3475, var3476, self.badge_text)
		buff = var3475
		var3454 = var3476
	end
	if self.badge_analytics_id ~= nil then
		local var3477, var3478 = protoModule.writeTag(buff, var3454, 12, protoModule.wireTypes.lengthDelimited)
		var3477, var5044 = protoModule.writeString(var3477, var3478, self.badge_analytics_id)
		buff = var3477
		var3454 = var3478
	end
	if self.roblox_component ~= nil then
		local var3479, var3480 = protoModule.writeTag(buff, var3454, 13, protoModule.wireTypes.lengthDelimited)
		var3479, var5046 = protoModule.writeString(var3479, var3480, self.roblox_component)
		buff = var3479
		var3454 = var3480
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var3481, var3482 = protoModule.writeTag(buff, var3454, 14, protoModule.wireTypes.lengthDelimited)
		var3481, var5048 = protoModule.writeString(var3481, var3482, self.attribution_thumbnail_asset_id)
		buff = var3481
		var3454 = var3482
	end
	local buff_1 = buffer.create(var3454)
	buffer.copy(buff_1, 0, buff, 0, var3454)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref)
	local var3454 = t_128.new()
	local var3455 = 0
	while var3455 < buffer.len(p128) do
		local _ = nil
		local var3456 = nil
		local var3457, var3458, var3459 = protoModule.readTag(p128, var3455)
		local var3460 = var3457
		var3456 = var3458
		var3455 = var3459
		
		if var3456 == protoModule.wireTypes.varint then
			local _ = nil
			local var3461, var3462 = protoModule.readVarInt(p128, var3455)
			local _ = var3461
			var3455 = var3462
			continue
		end
		if var3456 == protoModule.wireTypes.lengthDelimited then
			if var3460 == 1 then
				local _ = nil
				local var3463, var3464 = protoModule.readBuffer(p128, var3455)
				var3455 = var3464
				var3454.clickout_url = buffer.tostring(var3463)
			elseif var3460 == 2 then
				local _ = nil
				local var3465, var3466 = protoModule.readBuffer(p128, var3455)
				var3455 = var3466
				var3454.native_ad_data = buffer.tostring(var3465)
			elseif var3460 == 3 then
				local _ = nil
				local var3467, var3468 = protoModule.readBuffer(p128, var3455)
				var3455 = var3468
				var3454.payer_name = buffer.tostring(var3467)
			elseif var3460 == 4 then
				local _ = nil
				local var3469, var3470 = protoModule.readBuffer(p128, var3455)
				var3455 = var3470
				var3454.logo_asset_id = buffer.tostring(var3469)
			elseif var3460 == 6 then
				local _ = nil
				local var3471, var3472 = protoModule.readBuffer(p128, var3455)
				var3455 = var3472
				var3454.cta_text = buffer.tostring(var3471)
			elseif var3460 == 7 then
				local _ = nil
				local var3473, var3474 = protoModule.readBuffer(p128, var3455)
				var3455 = var3474
				var3454.title = buffer.tostring(var3473)
			elseif var3460 == 8 then
				local _ = nil
				local var3475, var3476 = protoModule.readBuffer(p128, var3455)
				var3455 = var3476
				var3454.subtitle = buffer.tostring(var3475)
			elseif var3460 == 9 then
				local _ = nil
				local var3477, var3478 = protoModule.readBuffer(p128, var3455)
				var3455 = var3478
				var3454.image_asset_id = buffer.tostring(var3477)
			elseif var3460 == 10 then
				local _ = nil
				local var3479, var3480 = protoModule.readBuffer(p128, var3455)
				var3455 = var3480
				var3454.video_asset_id = buffer.tostring(var3479)
			elseif var3460 == 11 then
				local _ = nil
				local var3481, var3482 = protoModule.readBuffer(p128, var3455)
				var3455 = var3482
				var3454.badge_text = buffer.tostring(var3481)
			elseif var3460 == 12 then
				local _ = nil
				local var3483, var3484 = protoModule.readBuffer(p128, var3455)
				var3455 = var3484
				var3454.badge_analytics_id = buffer.tostring(var3483)
			elseif var3460 == 13 then
				local _ = nil
				local var3485, var3486 = protoModule.readBuffer(p128, var3455)
				var3455 = var3486
				var3454.roblox_component = buffer.tostring(var3485)
			elseif var3460 == 14 then
				local _ = nil
				local var3487, var3488 = protoModule.readBuffer(p128, var3455)
				var3455 = var3488
				var3454.attribution_thumbnail_asset_id = buffer.tostring(var3487)
			else
				local _ = nil
				local var3489, var3490 = protoModule.readVarInt(p128, var3455)
				var3455 = var3490 + var3489
			end
		elseif var3456 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3491, var3492 = protoModule.readFixed32(p128, var3455)
			local _ = var3491
			var3455 = var3492
		elseif var3456 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5052)
		elseif var3460 == 5 then
			local _ = nil
			local var3493, var3494 = protoModule.readDouble(p128, var3455)
			var3455 = var3494
			var3454.logo_aspect_ratio = var3493
		else
			local _ = nil
			local var3495, var3496 = protoModule.readFixed64(p128, var3455)
			local _ = var3495
			var3455 = var3496
		end
	end
	return var3454
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
	if self.attribution_thumbnail_asset_id ~= nil then
		t.attributionThumbnailAssetId = self.attribution_thumbnail_asset_id
	end
	return t
end

function t_128:jsonDecode()
	-- upvalues: t_128 (ref), protoModule (ref)
	local var3497 = t_128.new()
	
	if self.clickout_url ~= nil then
		var3497.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3497.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3497.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3497.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3497.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3497.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3497.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3497.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3497.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3497.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3497.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3497.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3497.title = self.title
	end
	if self.subtitle ~= nil then
		var3497.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3497.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3497.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3497.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3497.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3497.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3497.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3497.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3497.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3497.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3497.roblox_component = self.robloxComponent
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var3497.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var3497.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	return var3497
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
	local var3497 = 0
	
	if self.layout ~= nil then
		local var3498 = self.layout:encode()
		local var3499, var3500 = protoModule.writeTag(buff, var3497, 1, protoModule.wireTypes.lengthDelimited)
		var3499, var5099 = protoModule.writeBuffer(var3499, var3500, var3498, buffer.len(var3498))
		buff = var3499
		var3497 = var3500
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3501 = self.kind.value:encode()
			local var3502, var3503 = protoModule.writeTag(buff, var3497, 2, protoModule.wireTypes.lengthDelimited)
			var3502, var5102 = protoModule.writeBuffer(var3502, var3503, var3501, buffer.len(var3501))
			buff = var3502
			var3497 = var3503
		elseif self.kind.type == "ad_link" then
			local var3504 = self.kind.value:encode()
			local var3505, var3506 = protoModule.writeTag(buff, var3497, 3, protoModule.wireTypes.lengthDelimited)
			var3505, var5105 = protoModule.writeBuffer(var3505, var3506, var3504, buffer.len(var3504))
			buff = var3505
			var3497 = var3506
		end
	end
	local buff_1 = buffer.create(var3497)
	buffer.copy(buff_1, 0, buff, 0, var3497)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3497 = t_129.new()
	local var3498 = 0
	while var3498 < buffer.len(p129) do
		local _ = nil
		local var3499 = nil
		local var3500, var3501, var3502 = protoModule.readTag(p129, var3498)
		local var3503 = var3500
		var3499 = var3501
		var3498 = var3502
		
		if var3499 == protoModule.wireTypes.varint then
			local _ = nil
			local var3504, var3505 = protoModule.readVarInt(p129, var3498)
			local _ = var3504
			var3498 = var3505
			continue
		end
		if var3499 == protoModule.wireTypes.lengthDelimited then
			if var3503 == 1 then
				local _ = nil
				local var3506, var3507 = protoModule.readBuffer(p129, var3498)
				var3498 = var3507
				var3497.layout = t.ItemLayout.decode(var3506)
			elseif var3503 == 2 then
				local _ = nil
				local var3508, var3509 = protoModule.readBuffer(p129, var3498)
				var3498 = var3509
				var3497.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3508)
				}
			elseif var3503 == 3 then
				local _ = nil
				local var3510, var3511 = protoModule.readBuffer(p129, var3498)
				var3498 = var3511
				var3497.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3510) }
			else
				local _ = nil
				local var3512, var3513 = protoModule.readVarInt(p129, var3498)
				var3498 = var3513 + var3512
			end
		elseif var3499 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3514, var3515 = protoModule.readFixed32(p129, var3498)
			local _ = var3514
			var3498 = var3515
		elseif var3499 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3516, var3517 = protoModule.readFixed64(p129, var3498)
			local _ = var3516
			var3498 = var3517
		else
			error("Unsupported wire type: " .. var5109)
		end
	end
	return var3497
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
	local var3518 = t_129.new()
	
	if self.layout ~= nil then
		var3518.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3518.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3518.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3518.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3518
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
	local var3518 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3519 = v:encode()
			local var3520, var3521 = protoModule.writeTag(buff, var3518, 1, protoModule.wireTypes.lengthDelimited)
			var3520, var5134 = protoModule.writeBuffer(var3520, var3521, var3519, buffer.len(var3519))
			buff = var3520
			var3518 = var3521
		end
	end
	if self.collection_item_size ~= nil then
		local var3522, var3523 = protoModule.writeTag(buff, var3518, 2, protoModule.wireTypes.lengthDelimited)
		var3522, var5136 = protoModule.writeString(var3522, var3523, self.collection_item_size)
		buff = var3522
		var3518 = var3523
	end
	local buff_1 = buffer.create(var3518)
	buffer.copy(buff_1, 0, buff, 0, var3518)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var3524 = t_130.new()
	local var3525 = 0
	while var3525 < buffer.len(p130) do
		local _ = nil
		local var3526 = nil
		local var3527, var3528, var3529 = protoModule.readTag(p130, var3525)
		local var3530 = var3527
		var3526 = var3528
		var3525 = var3529
		
		if var3526 == protoModule.wireTypes.varint then
			local _ = nil
			local var3531, var3532 = protoModule.readVarInt(p130, var3525)
			local _ = var3531
			var3525 = var3532
			continue
		end
		if var3526 == protoModule.wireTypes.lengthDelimited then
			if var3530 == 1 then
				local _ = nil
				local var3533, var3534 = protoModule.readBuffer(p130, var3525)
				var3525 = var3534
				table.insert(var3524.items, t.ItemWithLayout.decode(var3533))
			elseif var3530 == 2 then
				local _ = nil
				local var3535, var3536 = protoModule.readBuffer(p130, var3525)
				var3525 = var3536
				var3524.collection_item_size = buffer.tostring(var3535)
			else
				local _ = nil
				local var3537, var3538 = protoModule.readVarInt(p130, var3525)
				var3525 = var3538 + var3537
			end
		elseif var3526 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3539, var3540 = protoModule.readFixed32(p130, var3525)
			local _ = var3539
			var3525 = var3540
		elseif var3526 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3541, var3542 = protoModule.readFixed64(p130, var3525)
			local _ = var3541
			var3525 = var3542
		else
			error("Unsupported wire type: " .. var5140)
		end
	end
	return var3524
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
	local var3543 = t_130.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3543.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3543.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3543.collection_item_size = self.collectionItemSize
	end
	return var3543
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
	local var3544 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3545, var3546 = protoModule.writeTag(buff, var3544, 1, protoModule.wireTypes.varint)
		var3545, var5164 = protoModule.writeVarInt(var3545, var3546, self.col_span)
		buff = var3545
		var3544 = var3546
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3547, var3548 = protoModule.writeTag(buff, var3544, 2, protoModule.wireTypes.varint)
		var3547, var5166 = protoModule.writeVarInt(var3547, var3548, self.row_span)
		buff = var3547
		var3544 = var3548
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3549, var3550 = protoModule.writeTag(buff, var3544, 3, protoModule.wireTypes.lengthDelimited)
		var3549, var5168 = protoModule.writeString(var3549, var3550, self.alignment_type)
		buff = var3549
		var3544 = var3550
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3551, var3552 = protoModule.writeTag(buff, var3544, 4, protoModule.wireTypes.varint)
		var3551, var5170 = protoModule.writeVarInt(var3551, var3552, self.min_row_padding)
		buff = var3551
		var3544 = var3552
	end
	local buff_1 = buffer.create(var3544)
	buffer.copy(buff_1, 0, buff, 0, var3544)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref)
	local var3544 = t_131.new()
	local var3545 = 0
	while var3545 < buffer.len(p131) do
		local _ = nil
		local var3546 = nil
		local var3547, var3548, var3549 = protoModule.readTag(p131, var3545)
		local var3550 = var3547
		var3546 = var3548
		var3545 = var3549
		
		if var3546 == protoModule.wireTypes.varint then
			if var3550 == 1 then
				local _ = nil
				local var3551, var3552 = protoModule.readVarIntI32(p131, var3545)
				var3545 = var3552
				var3544.col_span = var3551
			elseif var3550 == 2 then
				local _ = nil
				local var3553, var3554 = protoModule.readVarIntI32(p131, var3545)
				var3545 = var3554
				var3544.row_span = var3553
			elseif var3550 == 4 then
				local _ = nil
				local var3555, var3556 = protoModule.readVarIntI32(p131, var3545)
				var3545 = var3556
				var3544.min_row_padding = var3555
			else
				local _ = nil
				local var3557, var3558 = protoModule.readVarInt(p131, var3545)
				local _ = var3557
				var3545 = var3558
			end
		end
		if var3546 == protoModule.wireTypes.lengthDelimited then
			if var3550 == 3 then
				local _ = nil
				local var3559, var3560 = protoModule.readBuffer(p131, var3545)
				var3545 = var3560
				var3544.alignment_type = buffer.tostring(var3559)
			else
				local _ = nil
				local var3561, var3562 = protoModule.readVarInt(p131, var3545)
				var3545 = var3562 + var3561
			end
		elseif var3546 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3563, var3564 = protoModule.readFixed32(p131, var3545)
			local _ = var3563
			var3545 = var3564
		elseif var3546 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3565, var3566 = protoModule.readFixed64(p131, var3545)
			local _ = var3565
			var3545 = var3566
		else
			error("Unsupported wire type: " .. var5174)
		end
	end
	return var3544
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
	local var3567 = t_131.new()
	
	if self.col_span ~= nil then
		var3567.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3567.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3567.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3567.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3567.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3567.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3567.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3567.min_row_padding = self.minRowPadding
	end
	return var3567
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
	local var3567 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3568, var3569 = protoModule.writeTag(buff, var3567, 1, protoModule.wireTypes.lengthDelimited)
		var3568, var5200 = protoModule.writeString(var3568, var3569, self.community_id)
		buff = var3568
		var3567 = var3569
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3570, var3571 = protoModule.writeTag(buff, var3567, 2, protoModule.wireTypes.lengthDelimited)
		var3570, var5202 = protoModule.writeString(var3570, var3571, self.announcement_id)
		buff = var3570
		var3567 = var3571
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3572, var3573 = protoModule.writeTag(buff, var3567, 3, protoModule.wireTypes.lengthDelimited)
		var3572, var5204 = protoModule.writeString(var3572, var3573, self.message_id)
		buff = var3572
		var3567 = var3573
	end
	if self.title ~= nil and self.title ~= "" then
		local var3574, var3575 = protoModule.writeTag(buff, var3567, 4, protoModule.wireTypes.lengthDelimited)
		var3574, var5206 = protoModule.writeString(var3574, var3575, self.title)
		buff = var3574
		var3567 = var3575
	end
	if self.body ~= nil and self.body ~= "" then
		local var3576, var3577 = protoModule.writeTag(buff, var3567, 5, protoModule.wireTypes.lengthDelimited)
		var3576, var5208 = protoModule.writeString(var3576, var3577, self.body)
		buff = var3576
		var3567 = var3577
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3578, var3579 = protoModule.writeTag(buff, var3567, 6, protoModule.wireTypes.lengthDelimited)
		var3578, var5210 = protoModule.writeString(var3578, var3579, self.creator_key)
		buff = var3578
		var3567 = var3579
	end
	if self.creator_role_name ~= nil then
		local var3580, var3581 = protoModule.writeTag(buff, var3567, 7, protoModule.wireTypes.lengthDelimited)
		var3580, var5212 = protoModule.writeString(var3580, var3581, self.creator_role_name)
		buff = var3580
		var3567 = var3581
	end
	if self.media_asset_id ~= nil then
		local var3582, var3583 = protoModule.writeTag(buff, var3567, 8, protoModule.wireTypes.lengthDelimited)
		var3582, var5214 = protoModule.writeString(var3582, var3583, self.media_asset_id)
		buff = var3582
		var3567 = var3583
	end
	if self.created_time ~= nil then
		local var3584 = self.created_time:encode()
		local var3585, var3586 = protoModule.writeTag(buff, var3567, 9, protoModule.wireTypes.lengthDelimited)
		var3585, var5217 = protoModule.writeBuffer(var3585, var3586, var3584, buffer.len(var3584))
		buff = var3585
		var3567 = var3586
	end
	local buff_1 = buffer.create(var3567)
	buffer.copy(buff_1, 0, buff, 0, var3567)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref), timestampModule (ref)
	local var3567 = t_132.new()
	local var3568 = 0
	while var3568 < buffer.len(p132) do
		local _ = nil
		local var3569 = nil
		local var3570, var3571, var3572 = protoModule.readTag(p132, var3568)
		local var3573 = var3570
		var3569 = var3571
		var3568 = var3572
		
		if var3569 == protoModule.wireTypes.varint then
			local _ = nil
			local var3574, var3575 = protoModule.readVarInt(p132, var3568)
			local _ = var3574
			var3568 = var3575
			continue
		end
		if var3569 == protoModule.wireTypes.lengthDelimited then
			if var3573 == 1 then
				local _ = nil
				local var3576, var3577 = protoModule.readBuffer(p132, var3568)
				var3568 = var3577
				var3567.community_id = buffer.tostring(var3576)
			elseif var3573 == 2 then
				local _ = nil
				local var3578, var3579 = protoModule.readBuffer(p132, var3568)
				var3568 = var3579
				var3567.announcement_id = buffer.tostring(var3578)
			elseif var3573 == 3 then
				local _ = nil
				local var3580, var3581 = protoModule.readBuffer(p132, var3568)
				var3568 = var3581
				var3567.message_id = buffer.tostring(var3580)
			elseif var3573 == 4 then
				local _ = nil
				local var3582, var3583 = protoModule.readBuffer(p132, var3568)
				var3568 = var3583
				var3567.title = buffer.tostring(var3582)
			elseif var3573 == 5 then
				local _ = nil
				local var3584, var3585 = protoModule.readBuffer(p132, var3568)
				var3568 = var3585
				var3567.body = buffer.tostring(var3584)
			elseif var3573 == 6 then
				local _ = nil
				local var3586, var3587 = protoModule.readBuffer(p132, var3568)
				var3568 = var3587
				var3567.creator_key = buffer.tostring(var3586)
			elseif var3573 == 7 then
				local _ = nil
				local var3588, var3589 = protoModule.readBuffer(p132, var3568)
				var3568 = var3589
				var3567.creator_role_name = buffer.tostring(var3588)
			elseif var3573 == 8 then
				local _ = nil
				local var3590, var3591 = protoModule.readBuffer(p132, var3568)
				var3568 = var3591
				var3567.media_asset_id = buffer.tostring(var3590)
			elseif var3573 == 9 then
				local _ = nil
				local var3592, var3593 = protoModule.readBuffer(p132, var3568)
				var3568 = var3593
				var3567.created_time = timestampModule.Timestamp.decode(var3592)
			else
				local _ = nil
				local var3594, var3595 = protoModule.readVarInt(p132, var3568)
				var3568 = var3595 + var3594
			end
		elseif var3569 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3596, var3597 = protoModule.readFixed32(p132, var3568)
			local _ = var3596
			var3568 = var3597
		elseif var3569 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3598, var3599 = protoModule.readFixed64(p132, var3568)
			local _ = var3598
			var3568 = var3599
		else
			error("Unsupported wire type: " .. var5221)
		end
	end
	return var3567
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
	local var3600 = t_132.new()
	
	if self.community_id ~= nil then
		var3600.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3600.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3600.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3600.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3600.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3600.message_id = self.messageId
	end
	if self.title ~= nil then
		var3600.title = self.title
	end
	if self.body ~= nil then
		var3600.body = self.body
	end
	if self.creator_key ~= nil then
		var3600.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3600.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3600.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3600.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3600.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3600.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3600.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3600.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3600
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