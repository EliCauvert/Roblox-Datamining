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
		var3, var143 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.input_data ~= nil then
		local var5 = self.input_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var146 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
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
			error("Unsupported wire type: " .. var150)
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
		var22, var173 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var20 = var23
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var24, var175 = protoModule.writeString(var24, var25, self.roblox_component)
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
			error("Unsupported wire type: " .. var179)
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
		var40, var201 = protoModule.writeString(var40, var41, self.roblox_component)
		buff = var40
		var39 = var41
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var42 = self.input_data.value:encode()
		local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var43, var204 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var39 = var44
	end
	if self.cta_buttons ~= nil then
		local var45 = self.cta_buttons:encode()
		local var46, var47 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
		var46, var207 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
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
			error("Unsupported wire type: " .. var211)
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
		var61, var235 = protoModule.writeString(var61, var62, self.roblox_component)
		buff = var61
		var60 = var62
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var63 = self.input_data.value:encode()
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var238 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var60 = var65
		elseif self.input_data.type == "video" then
			local var66 = self.input_data.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var241 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
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
			error("Unsupported wire type: " .. var245)
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
			var83, var270 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var81 = var84
		elseif self.kind.type == "badge_details" then
			local var85 = self.kind.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
			var86, var273 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var81 = var87
		elseif self.kind.type == "static_content" then
			local var88 = self.kind.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var81, 3, protoModule.wireTypes.lengthDelimited)
			var89, var276 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var81 = var90
		elseif self.kind.type == "experience_attribution_row" then
			local var91 = self.kind.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var81, 4, protoModule.wireTypes.lengthDelimited)
			var92, var279 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var81 = var93
		elseif self.kind.type == "experience_action_module" then
			local var94 = self.kind.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var81, 5, protoModule.wireTypes.lengthDelimited)
			var95, var282 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var81 = var96
		elseif self.kind.type == "experience_media_gallery" then
			local var97 = self.kind.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var81, 6, protoModule.wireTypes.lengthDelimited)
			var98, var285 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var81 = var99
		elseif self.kind.type == "experience_description" then
			local var100 = self.kind.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var81, 7, protoModule.wireTypes.lengthDelimited)
			var101, var288 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var81 = var102
		elseif self.kind.type == "experience_stat_row" then
			local var103 = self.kind.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var81, 8, protoModule.wireTypes.lengthDelimited)
			var104, var291 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var81 = var105
		elseif self.kind.type == "experience_info_table" then
			local var106 = self.kind.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var81, 9, protoModule.wireTypes.lengthDelimited)
			var107, var294 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var81 = var108
		elseif self.kind.type == "social_link_row" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var81, 10, protoModule.wireTypes.lengthDelimited)
			var110, var297 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var81 = var111
		elseif self.kind.type == "experience_carousel" then
			local var112 = self.kind.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var81, 11, protoModule.wireTypes.lengthDelimited)
			var113, var300 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var81 = var114
		elseif self.kind.type == "song_carousel" then
			local var115 = self.kind.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var81, 12, protoModule.wireTypes.lengthDelimited)
			var116, var303 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var81 = var117
		elseif self.kind.type == "events_carousel" then
			local var118 = self.kind.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var81, 13, protoModule.wireTypes.lengthDelimited)
			var119, var306 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var81 = var120
		elseif self.kind.type == "game_pass_collection" then
			local var121 = self.kind.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var81, 14, protoModule.wireTypes.lengthDelimited)
			var122, var309 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var81 = var123
		elseif self.kind.type == "developer_product_collection" then
			local var124 = self.kind.value:encode()
			local var125, var126 = protoModule.writeTag(buff, var81, 15, protoModule.wireTypes.lengthDelimited)
			var125, var312 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
			buff = var125
			var81 = var126
		elseif self.kind.type == "subscription_collection" then
			local var127 = self.kind.value:encode()
			local var128, var129 = protoModule.writeTag(buff, var81, 16, protoModule.wireTypes.lengthDelimited)
			var128, var315 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var81 = var129
		elseif self.kind.type == "dynamic_store_category" then
			local var130 = self.kind.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var81, 17, protoModule.wireTypes.lengthDelimited)
			var131, var318 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var81 = var132
		elseif self.kind.type == "card_container" then
			local var133 = self.kind.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var81, 20, protoModule.wireTypes.lengthDelimited)
			var134, var321 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var81 = var135
		elseif self.kind.type == "card" then
			local var136 = self.kind.value:encode()
			local var137, var138 = protoModule.writeTag(buff, var81, 21, protoModule.wireTypes.lengthDelimited)
			var137, var324 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
			buff = var137
			var81 = var138
		elseif self.kind.type == "dialog" then
			local var139 = self.kind.value:encode()
			local var140, var141 = protoModule.writeTag(buff, var81, 22, protoModule.wireTypes.lengthDelimited)
			var140, var327 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var81 = var141
		elseif self.kind.type == "banner" then
			local var142 = self.kind.value:encode()
			local var143, var144 = protoModule.writeTag(buff, var81, 23, protoModule.wireTypes.lengthDelimited)
			var143, var330 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
			buff = var143
			var81 = var144
		elseif self.kind.type == "tooltip" then
			local var145 = self.kind.value:encode()
			local var146, var147 = protoModule.writeTag(buff, var81, 24, protoModule.wireTypes.lengthDelimited)
			var146, var333 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var81 = var147
		elseif self.kind.type == "coachmark" then
			local var148 = self.kind.value:encode()
			local var149, var150 = protoModule.writeTag(buff, var81, 25, protoModule.wireTypes.lengthDelimited)
			var149, var336 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
			buff = var149
			var81 = var150
		elseif self.kind.type == "system_banner_prompt" then
			local var151 = self.kind.value:encode()
			local var152, var153 = protoModule.writeTag(buff, var81, 28, protoModule.wireTypes.lengthDelimited)
			var152, var339 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
			buff = var152
			var81 = var153
		elseif self.kind.type == "age_check_upsell" then
			local var154 = self.kind.value:encode()
			local var155, var156 = protoModule.writeTag(buff, var81, 29, protoModule.wireTypes.lengthDelimited)
			var155, var342 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
			buff = var155
			var81 = var156
		elseif self.kind.type == "catalog_item_list" then
			local var157 = self.kind.value:encode()
			local var158, var159 = protoModule.writeTag(buff, var81, 26, protoModule.wireTypes.lengthDelimited)
			var158, var345 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var81 = var159
		elseif self.kind.type == "user_list" then
			local var160 = self.kind.value:encode()
			local var161, var162 = protoModule.writeTag(buff, var81, 27, protoModule.wireTypes.lengthDelimited)
			var161, var348 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
			buff = var161
			var81 = var162
		elseif self.kind.type == "experience_content_rating_label" then
			local var163 = self.kind.value:encode()
			local var164, var165 = protoModule.writeTag(buff, var81, 30, protoModule.wireTypes.lengthDelimited)
			var164, var351 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
			buff = var164
			var81 = var165
		elseif self.kind.type == "experience_refund_policy" then
			local var166 = self.kind.value:encode()
			local var167, var168 = protoModule.writeTag(buff, var81, 31, protoModule.wireTypes.lengthDelimited)
			var167, var354 = protoModule.writeBuffer(var167, var168, var166, buffer.len(var166))
			buff = var167
			var81 = var168
		elseif self.kind.type == "experience_play_with_reward" then
			local var169 = self.kind.value:encode()
			local var170, var171 = protoModule.writeTag(buff, var81, 32, protoModule.wireTypes.lengthDelimited)
			var170, var357 = protoModule.writeBuffer(var170, var171, var169, buffer.len(var169))
			buff = var170
			var81 = var171
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var172 = self.kind.value:encode()
			local var173, var174 = protoModule.writeTag(buff, var81, 33, protoModule.wireTypes.lengthDelimited)
			var173, var360 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
			buff = var173
			var81 = var174
		elseif self.kind.type == "community_section" then
			local var175 = self.kind.value:encode()
			local var176, var177 = protoModule.writeTag(buff, var81, 35, protoModule.wireTypes.lengthDelimited)
			var176, var363 = protoModule.writeBuffer(var176, var177, var175, buffer.len(var175))
			buff = var176
			var81 = var177
		elseif self.kind.type == "moments_carousel" then
			local var178 = self.kind.value:encode()
			local var179, var180 = protoModule.writeTag(buff, var81, 34, protoModule.wireTypes.lengthDelimited)
			var179, var366 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var81 = var180
		elseif self.kind.type == "text" then
			local var181 = self.kind.value:encode()
			local var182, var183 = protoModule.writeTag(buff, var81, 40, protoModule.wireTypes.lengthDelimited)
			var182, var369 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
			buff = var182
			var81 = var183
		elseif self.kind.type == "vertical_feed" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var81, 41, protoModule.wireTypes.lengthDelimited)
			var185, var372 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var81 = var186
		elseif self.kind.type == "page_header" then
			local var187 = self.kind.value:encode()
			local var188, var189 = protoModule.writeTag(buff, var81, 42, protoModule.wireTypes.lengthDelimited)
			var188, var375 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var81 = var189
		elseif self.kind.type == "image_cta_section" then
			local var190 = self.kind.value:encode()
			local var191, var192 = protoModule.writeTag(buff, var81, 43, protoModule.wireTypes.lengthDelimited)
			var191, var378 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
			buff = var191
			var81 = var192
		elseif self.kind.type == "experience_details_feed" then
			local var193 = self.kind.value:encode()
			local var194, var195 = protoModule.writeTag(buff, var81, 500, protoModule.wireTypes.lengthDelimited)
			var194, var381 = protoModule.writeBuffer(var194, var195, var193, buffer.len(var193))
			buff = var194
			var81 = var195
		elseif self.kind.type == "experience_details_action_bar" then
			local var196 = self.kind.value:encode()
			local var197, var198 = protoModule.writeTag(buff, var81, 501, protoModule.wireTypes.lengthDelimited)
			var197, var384 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
			buff = var197
			var81 = var198
		elseif self.kind.type == "experience_details_banner_image" then
			local var199 = self.kind.value:encode()
			local var200, var201 = protoModule.writeTag(buff, var81, 502, protoModule.wireTypes.lengthDelimited)
			var200, var387 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
			buff = var200
			var81 = var201
		elseif self.kind.type == "experience_details_sticky_header" then
			local var202 = self.kind.value:encode()
			local var203, var204 = protoModule.writeTag(buff, var81, 503, protoModule.wireTypes.lengthDelimited)
			var203, var390 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
			buff = var203
			var81 = var204
		elseif self.kind.type == "event_details_feed" then
			local var205 = self.kind.value:encode()
			local var206, var207 = protoModule.writeTag(buff, var81, 600, protoModule.wireTypes.lengthDelimited)
			var206, var393 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var81 = var207
		elseif self.kind.type == "event_details_action_bar" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var81, 601, protoModule.wireTypes.lengthDelimited)
			var209, var396 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var81 = var210
		elseif self.kind.type == "event_attribution_row" then
			local var211 = self.kind.value:encode()
			local var212, var213 = protoModule.writeTag(buff, var81, 602, protoModule.wireTypes.lengthDelimited)
			var212, var399 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
			buff = var212
			var81 = var213
		elseif self.kind.type == "event_description" then
			local var214 = self.kind.value:encode()
			local var215, var216 = protoModule.writeTag(buff, var81, 603, protoModule.wireTypes.lengthDelimited)
			var215, var402 = protoModule.writeBuffer(var215, var216, var214, buffer.len(var214))
			buff = var215
			var81 = var216
		elseif self.kind.type == "event_info_table" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var81, 604, protoModule.wireTypes.lengthDelimited)
			var218, var405 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var81 = var219
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var220 = self.kind.value:encode()
			local var221, var222 = protoModule.writeTag(buff, var81, 605, protoModule.wireTypes.lengthDelimited)
			var221, var408 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var81 = var222
		elseif self.kind.type == "event_notifications_modal" then
			local var223 = self.kind.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var81, 606, protoModule.wireTypes.lengthDelimited)
			var224, var411 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var81 = var225
		elseif self.kind.type == "dev_store_feed" then
			local var226 = self.kind.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var81, 700, protoModule.wireTypes.lengthDelimited)
			var227, var414 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var81 = var228
		elseif self.kind.type == "charts_feed" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var81, 800, protoModule.wireTypes.lengthDelimited)
			var230, var417 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var81 = var231
		elseif self.kind.type == "filter_pills" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var81, 801, protoModule.wireTypes.lengthDelimited)
			var233, var420 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var81 = var234
		elseif self.kind.type == "sort_selector" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var81, 802, protoModule.wireTypes.lengthDelimited)
			var236, var423 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var81 = var237
		elseif self.kind.type == "genre_selector" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var81, 803, protoModule.wireTypes.lengthDelimited)
			var239, var426 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var81 = var240
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var81, 900, protoModule.wireTypes.lengthDelimited)
			var242, var429 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var81 = var243
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var81, 901, protoModule.wireTypes.lengthDelimited)
			var245, var432 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var81 = var246
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var81, 902, protoModule.wireTypes.lengthDelimited)
			var248, var435 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var81 = var249
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var81, 903, protoModule.wireTypes.lengthDelimited)
			var251, var438 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var81 = var252
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var81, 904, protoModule.wireTypes.lengthDelimited)
			var254, var441 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var81 = var255
		elseif self.kind.type == "catalog_item_grid" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var81, 905, protoModule.wireTypes.lengthDelimited)
			var257, var444 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var81 = var258
		elseif self.kind.type == "marketplace_offer_modal" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var81, 906, protoModule.wireTypes.lengthDelimited)
			var260, var447 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var81 = var261
		elseif self.kind.type == "search_results_feed" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var81, 1000, protoModule.wireTypes.lengthDelimited)
			var263, var450 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var81 = var264
		elseif self.kind.type == "power_search_ai_overview" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var81, 1001, protoModule.wireTypes.lengthDelimited)
			var266, var453 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var81 = var267
		elseif self.kind.type == "experience_emphasis_tile" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var81, 1002, protoModule.wireTypes.lengthDelimited)
			var269, var456 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var81 = var270
		elseif self.kind.type == "option_selector_carousel" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var81, 1100, protoModule.wireTypes.lengthDelimited)
			var272, var459 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var81 = var273
		elseif self.kind.type == "game_items_carousel" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var81, 1101, protoModule.wireTypes.lengthDelimited)
			var275, var462 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var81 = var276
		elseif self.kind.type == "hero_unit" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var81, 1102, protoModule.wireTypes.lengthDelimited)
			var278, var465 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var81 = var279
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var81, 1103, protoModule.wireTypes.lengthDelimited)
			var281, var468 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var81 = var282
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var81, 1200, protoModule.wireTypes.lengthDelimited)
			var284, var471 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var81 = var285
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var81, 1300, protoModule.wireTypes.lengthDelimited)
			var287, var474 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var81 = var288
		elseif self.kind.type == "community_announcement" then
			local var289 = self.kind.value:encode()
			local var290, var291 = protoModule.writeTag(buff, var81, 1400, protoModule.wireTypes.lengthDelimited)
			var290, var477 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
			buff = var290
			var81 = var291
		elseif self.kind.type == "settings_row" then
			local var292 = self.kind.value:encode()
			local var293, var294 = protoModule.writeTag(buff, var81, 1500, protoModule.wireTypes.lengthDelimited)
			var293, var480 = protoModule.writeBuffer(var293, var294, var292, buffer.len(var292))
			buff = var293
			var81 = var294
		elseif self.kind.type == "settings_toggle" then
			local var295 = self.kind.value:encode()
			local var296, var297 = protoModule.writeTag(buff, var81, 1501, protoModule.wireTypes.lengthDelimited)
			var296, var483 = protoModule.writeBuffer(var296, var297, var295, buffer.len(var295))
			buff = var296
			var81 = var297
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
			elseif var87 == 1501 then
				local _ = nil
				local var232, var233 = protoModule.readBuffer(p5, var82)
				var82 = var233
				var81.kind = {
					type = "settings_toggle",
					value = t.SettingsToggleInputData.decode(var232)
				}
			else
				local _ = nil
				local var234, var235 = protoModule.readVarInt(p5, var82)
				var82 = var235 + var234
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var236, var237 = protoModule.readFixed32(p5, var82)
			local _ = var236
			var82 = var237
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var238, var239 = protoModule.readFixed64(p5, var82)
			local _ = var238
			var82 = var239
		else
			error("Unsupported wire type: " .. var487)
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
			
			return t
		elseif self.kind.type == "settings_toggle" then
			t.settingsToggle = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var240 = t_5.new()
	
	if self.badges_grid ~= nil then
		var240.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var240.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var240.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var240.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var240.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var240.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var240.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var240.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var240.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var240.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var240.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var240.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var240.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var240.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var240.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var240.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var240.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var240.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var240.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var240.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var240.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var240.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var240.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var240.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var240.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var240.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var240.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var240.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var240.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var240.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var240.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var240.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var240.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var240.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var240.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var240.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var240.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var240.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var240.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var240.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var240.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var240.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var240.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var240.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var240.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var240.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var240.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var240.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var240.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var240.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var240.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var240.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var240.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var240.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var240.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var240.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var240.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var240.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var240.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var240.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var240.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var240.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var240.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var240.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var240.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var240.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var240.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var240.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.experience_details_feed ~= nil then
		var240.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var240.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var240.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var240.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var240.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var240.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var240.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var240.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var240.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var240.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var240.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var240.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var240.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var240.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var240.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var240.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var240.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var240.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var240.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var240.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var240.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var240.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var240.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var240.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var240.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var240.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var240.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var240.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var240.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var240.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var240.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var240.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var240.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var240.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var240.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var240.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var240.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var240.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var240.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var240.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var240.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var240.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var240.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var240.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var240.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var240.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var240.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var240.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var240.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var240.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var240.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var240.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var240.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var240.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var240.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var240.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var240.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var240.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var240.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var240.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var240.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var240.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var240.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var240.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	if self.community_announcement ~= nil then
		var240.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.community_announcement)
		}
	end
	if self.communityAnnouncement ~= nil then
		var240.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.communityAnnouncement)
		}
	end
	if self.settings_row ~= nil then
		var240.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settings_row)
		}
	end
	if self.settingsRow ~= nil then
		var240.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settingsRow)
		}
	end
	if self.settings_toggle ~= nil then
		var240.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settings_toggle)
		}
	end
	if self.settingsToggle ~= nil then
		var240.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settingsToggle)
		}
	end
	return var240
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
	local var240 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var241, var242 = protoModule.writeTag(buff, var240, 1, protoModule.wireTypes.lengthDelimited)
		var241, var649 = protoModule.writeString(var241, var242, self.section_title)
		buff = var241
		var240 = var242
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var243 = v:encode()
			local var244, var245 = protoModule.writeTag(buff, var240, 2, protoModule.wireTypes.lengthDelimited)
			var244, var652 = protoModule.writeBuffer(var244, var245, var243, buffer.len(var243))
			buff = var244
			var240 = var245
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var246, var247 = protoModule.writeTag(buff, var240, 3, protoModule.wireTypes.lengthDelimited)
		var246, var654 = protoModule.writeString(var246, var247, self.collection_id)
		buff = var246
		var240 = var247
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var248, var249 = protoModule.writeTag(buff, var240, 4, protoModule.wireTypes.lengthDelimited)
		var248, var656 = protoModule.writeString(var248, var249, self.collection_position)
		buff = var248
		var240 = var249
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var250, var251 = protoModule.writeTag(buff, var240, 5, protoModule.wireTypes.lengthDelimited)
		var250, var658 = protoModule.writeString(var250, var251, self.universe_id)
		buff = var250
		var240 = var251
	end
	local buff_1 = buffer.create(var240)
	buffer.copy(buff_1, 0, buff, 0, var240)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var252 = t_6.new()
	local var253 = 0
	while var253 < buffer.len(p6) do
		local _ = nil
		local var254 = nil
		local var255, var256, var257 = protoModule.readTag(p6, var253)
		local var258 = var255
		var254 = var256
		var253 = var257
		
		if var254 == protoModule.wireTypes.varint then
			local _ = nil
			local var259, var260 = protoModule.readVarInt(p6, var253)
			local _ = var259
			var253 = var260
			continue
		end
		if var254 == protoModule.wireTypes.lengthDelimited then
			if var258 == 1 then
				local _ = nil
				local var261, var262 = protoModule.readBuffer(p6, var253)
				var253 = var262
				var252.section_title = buffer.tostring(var261)
			elseif var258 == 2 then
				local _ = nil
				local var263, var264 = protoModule.readBuffer(p6, var253)
				var253 = var264
				table.insert(var252.badges, t.BadgesGridInputData_BadgeInputData.decode(var263))
			elseif var258 == 3 then
				local _ = nil
				local var265, var266 = protoModule.readBuffer(p6, var253)
				var253 = var266
				var252.collection_id = buffer.tostring(var265)
			elseif var258 == 4 then
				local _ = nil
				local var267, var268 = protoModule.readBuffer(p6, var253)
				var253 = var268
				var252.collection_position = buffer.tostring(var267)
			elseif var258 == 5 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p6, var253)
				var253 = var270
				var252.universe_id = buffer.tostring(var269)
			else
				local _ = nil
				local var271, var272 = protoModule.readVarInt(p6, var253)
				var253 = var272 + var271
			end
		elseif var254 == protoModule.wireTypes.i32 then
			local _ = nil
			local var273, var274 = protoModule.readFixed32(p6, var253)
			local _ = var273
			var253 = var274
		elseif var254 == protoModule.wireTypes.i64 then
			local _ = nil
			local var275, var276 = protoModule.readFixed64(p6, var253)
			local _ = var275
			var253 = var276
		else
			error("Unsupported wire type: " .. var662)
		end
	end
	return var252
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
	local var277 = t_6.new()
	
	if self.section_title ~= nil then
		var277.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var277.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var277.badges = t_1
	end
	if self.collection_id ~= nil then
		var277.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var277.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var277.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var277.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var277.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var277.universe_id = self.universeId
	end
	return var277
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
	local var278 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var279, var280 = protoModule.writeTag(buff, var278, 1, protoModule.wireTypes.lengthDelimited)
		var279, var692 = protoModule.writeString(var279, var280, self.badge_id)
		buff = var279
		var278 = var280
	end
	local buff_1 = buffer.create(var278)
	buffer.copy(buff_1, 0, buff, 0, var278)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var278 = t_7.new()
	local var279 = 0
	while var279 < buffer.len(p7) do
		local _ = nil
		local var280 = nil
		local var281, var282, var283 = protoModule.readTag(p7, var279)
		local var284 = var281
		var280 = var282
		var279 = var283
		
		if var280 == protoModule.wireTypes.varint then
			local _ = nil
			local var285, var286 = protoModule.readVarInt(p7, var279)
			local _ = var285
			var279 = var286
			continue
		end
		if var280 == protoModule.wireTypes.lengthDelimited then
			if var284 == 1 then
				local _ = nil
				local var287, var288 = protoModule.readBuffer(p7, var279)
				var279 = var288
				var278.badge_id = buffer.tostring(var287)
			else
				local _ = nil
				local var289, var290 = protoModule.readVarInt(p7, var279)
				var279 = var290 + var289
			end
		elseif var280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var291, var292 = protoModule.readFixed32(p7, var279)
			local _ = var291
			var279 = var292
		elseif var280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var293, var294 = protoModule.readFixed64(p7, var279)
			local _ = var293
			var279 = var294
		else
			error("Unsupported wire type: " .. var696)
		end
	end
	return var278
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
	local var295 = t_7.new()
	
	if self.badge_id ~= nil then
		var295.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var295.badge_id = self.badgeId
	end
	return var295
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
	local var295 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var296, var297 = protoModule.writeTag(buff, var295, 1, protoModule.wireTypes.lengthDelimited)
		var296, var716 = protoModule.writeString(var296, var297, self.badge_id)
		buff = var296
		var295 = var297
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var298, var299 = protoModule.writeTag(buff, var295, 2, protoModule.wireTypes.lengthDelimited)
		var298, var718 = protoModule.writeString(var298, var299, self.universe_id)
		buff = var298
		var295 = var299
	end
	if self.localized_literals ~= nil then
		local var300 = self.localized_literals:encode()
		local var301, var302 = protoModule.writeTag(buff, var295, 3, protoModule.wireTypes.lengthDelimited)
		var301, var721 = protoModule.writeBuffer(var301, var302, var300, buffer.len(var300))
		buff = var301
		var295 = var302
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var303, var304 = protoModule.writeTag(buff, var295, 4, protoModule.wireTypes.lengthDelimited)
		var303, var723 = protoModule.writeString(var303, var304, self.creator_key)
		buff = var303
		var295 = var304
	end
	local buff_1 = buffer.create(var295)
	buffer.copy(buff_1, 0, buff, 0, var295)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var295 = t_8.new()
	local var296 = 0
	while var296 < buffer.len(p8) do
		local _ = nil
		local var297 = nil
		local var298, var299, var300 = protoModule.readTag(p8, var296)
		local var301 = var298
		var297 = var299
		var296 = var300
		
		if var297 == protoModule.wireTypes.varint then
			local _ = nil
			local var302, var303 = protoModule.readVarInt(p8, var296)
			local _ = var302
			var296 = var303
			continue
		end
		if var297 == protoModule.wireTypes.lengthDelimited then
			if var301 == 1 then
				local _ = nil
				local var304, var305 = protoModule.readBuffer(p8, var296)
				var296 = var305
				var295.badge_id = buffer.tostring(var304)
			elseif var301 == 2 then
				local _ = nil
				local var306, var307 = protoModule.readBuffer(p8, var296)
				var296 = var307
				var295.universe_id = buffer.tostring(var306)
			elseif var301 == 3 then
				local _ = nil
				local var308, var309 = protoModule.readBuffer(p8, var296)
				var296 = var309
				var295.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var308)
			elseif var301 == 4 then
				local _ = nil
				local var310, var311 = protoModule.readBuffer(p8, var296)
				var296 = var311
				var295.creator_key = buffer.tostring(var310)
			else
				local _ = nil
				local var312, var313 = protoModule.readVarInt(p8, var296)
				var296 = var313 + var312
			end
		elseif var297 == protoModule.wireTypes.i32 then
			local _ = nil
			local var314, var315 = protoModule.readFixed32(p8, var296)
			local _ = var314
			var296 = var315
		elseif var297 == protoModule.wireTypes.i64 then
			local _ = nil
			local var316, var317 = protoModule.readFixed64(p8, var296)
			local _ = var316
			var296 = var317
		else
			error("Unsupported wire type: " .. var727)
		end
	end
	return var295
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
	local var318 = t_8.new()
	
	if self.badge_id ~= nil then
		var318.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var318.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var318.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var318.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var318.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var318.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var318.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var318.creator_key = self.creatorKey
	end
	return var318
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
	local var318 = 0
	
	if self.info_table ~= nil then
		local var319 = self.info_table:encode()
		local var320, var321 = protoModule.writeTag(buff, var318, 1, protoModule.wireTypes.lengthDelimited)
		var320, var754 = protoModule.writeBuffer(var320, var321, var319, buffer.len(var319))
		buff = var320
		var318 = var321
	end
	if self.action_module ~= nil then
		local var322 = self.action_module:encode()
		local var323, var324 = protoModule.writeTag(buff, var318, 2, protoModule.wireTypes.lengthDelimited)
		var323, var757 = protoModule.writeBuffer(var323, var324, var322, buffer.len(var322))
		buff = var323
		var318 = var324
	end
	if self.overflow_menu ~= nil then
		local var325 = self.overflow_menu:encode()
		local var326, var327 = protoModule.writeTag(buff, var318, 3, protoModule.wireTypes.lengthDelimited)
		var326, var760 = protoModule.writeBuffer(var326, var327, var325, buffer.len(var325))
		buff = var326
		var318 = var327
	end
	local buff_1 = buffer.create(var318)
	buffer.copy(buff_1, 0, buff, 0, var318)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var318 = t_9.new()
	local var319 = 0
	while var319 < buffer.len(p9) do
		local _ = nil
		local var320 = nil
		local var321, var322, var323 = protoModule.readTag(p9, var319)
		local var324 = var321
		var320 = var322
		var319 = var323
		
		if var320 == protoModule.wireTypes.varint then
			local _ = nil
			local var325, var326 = protoModule.readVarInt(p9, var319)
			local _ = var325
			var319 = var326
			continue
		end
		if var320 == protoModule.wireTypes.lengthDelimited then
			if var324 == 1 then
				local _ = nil
				local var327, var328 = protoModule.readBuffer(p9, var319)
				var319 = var328
				var318.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var327)
			elseif var324 == 2 then
				local _ = nil
				local var329, var330 = protoModule.readBuffer(p9, var319)
				var319 = var330
				var318.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var329)
			elseif var324 == 3 then
				local _ = nil
				local var331, var332 = protoModule.readBuffer(p9, var319)
				var319 = var332
				var318.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var331)
			else
				local _ = nil
				local var333, var334 = protoModule.readVarInt(p9, var319)
				var319 = var334 + var333
			end
		elseif var320 == protoModule.wireTypes.i32 then
			local _ = nil
			local var335, var336 = protoModule.readFixed32(p9, var319)
			local _ = var335
			var319 = var336
		elseif var320 == protoModule.wireTypes.i64 then
			local _ = nil
			local var337, var338 = protoModule.readFixed64(p9, var319)
			local _ = var337
			var319 = var338
		else
			error("Unsupported wire type: " .. var764)
		end
	end
	return var318
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
	local var339 = t_9.new()
	
	if self.info_table ~= nil then
		var339.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var339.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var339.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var339.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var339.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var339.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var339
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
	local var339 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var340, var341 = protoModule.writeTag(buff, var339, 1, protoModule.wireTypes.lengthDelimited)
		var340, var788 = protoModule.writeString(var340, var341, self.type_label)
		buff = var340
		var339 = var341
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var342, var343 = protoModule.writeTag(buff, var339, 2, protoModule.wireTypes.lengthDelimited)
		var342, var790 = protoModule.writeString(var342, var343, self.earned_label)
		buff = var342
		var339 = var343
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var344, var345 = protoModule.writeTag(buff, var339, 3, protoModule.wireTypes.lengthDelimited)
		var344, var792 = protoModule.writeString(var344, var345, self.updated_label)
		buff = var344
		var339 = var345
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var346, var347 = protoModule.writeTag(buff, var339, 4, protoModule.wireTypes.lengthDelimited)
		var346, var794 = protoModule.writeString(var346, var347, self.experience_label)
		buff = var346
		var339 = var347
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var348, var349 = protoModule.writeTag(buff, var339, 5, protoModule.wireTypes.lengthDelimited)
		var348, var796 = protoModule.writeString(var348, var349, self.rarity_label)
		buff = var348
		var339 = var349
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var350, var351 = protoModule.writeTag(buff, var339, 6, protoModule.wireTypes.lengthDelimited)
		var350, var798 = protoModule.writeString(var350, var351, self.won_yesterday_label)
		buff = var350
		var339 = var351
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var352, var353 = protoModule.writeTag(buff, var339, 7, protoModule.wireTypes.lengthDelimited)
		var352, var800 = protoModule.writeString(var352, var353, self.won_ever_label)
		buff = var352
		var339 = var353
	end
	local buff_1 = buffer.create(var339)
	buffer.copy(buff_1, 0, buff, 0, var339)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var339 = t_10.new()
	local var340 = 0
	while var340 < buffer.len(p10) do
		local _ = nil
		local var341 = nil
		local var342, var343, var344 = protoModule.readTag(p10, var340)
		local var345 = var342
		var341 = var343
		var340 = var344
		
		if var341 == protoModule.wireTypes.varint then
			local _ = nil
			local var346, var347 = protoModule.readVarInt(p10, var340)
			local _ = var346
			var340 = var347
			continue
		end
		if var341 == protoModule.wireTypes.lengthDelimited then
			if var345 == 1 then
				local _ = nil
				local var348, var349 = protoModule.readBuffer(p10, var340)
				var340 = var349
				var339.type_label = buffer.tostring(var348)
			elseif var345 == 2 then
				local _ = nil
				local var350, var351 = protoModule.readBuffer(p10, var340)
				var340 = var351
				var339.earned_label = buffer.tostring(var350)
			elseif var345 == 3 then
				local _ = nil
				local var352, var353 = protoModule.readBuffer(p10, var340)
				var340 = var353
				var339.updated_label = buffer.tostring(var352)
			elseif var345 == 4 then
				local _ = nil
				local var354, var355 = protoModule.readBuffer(p10, var340)
				var340 = var355
				var339.experience_label = buffer.tostring(var354)
			elseif var345 == 5 then
				local _ = nil
				local var356, var357 = protoModule.readBuffer(p10, var340)
				var340 = var357
				var339.rarity_label = buffer.tostring(var356)
			elseif var345 == 6 then
				local _ = nil
				local var358, var359 = protoModule.readBuffer(p10, var340)
				var340 = var359
				var339.won_yesterday_label = buffer.tostring(var358)
			elseif var345 == 7 then
				local _ = nil
				local var360, var361 = protoModule.readBuffer(p10, var340)
				var340 = var361
				var339.won_ever_label = buffer.tostring(var360)
			else
				local _ = nil
				local var362, var363 = protoModule.readVarInt(p10, var340)
				var340 = var363 + var362
			end
		elseif var341 == protoModule.wireTypes.i32 then
			local _ = nil
			local var364, var365 = protoModule.readFixed32(p10, var340)
			local _ = var364
			var340 = var365
		elseif var341 == protoModule.wireTypes.i64 then
			local _ = nil
			local var366, var367 = protoModule.readFixed64(p10, var340)
			local _ = var366
			var340 = var367
		else
			error("Unsupported wire type: " .. var804)
		end
	end
	return var339
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
	local var368 = t_10.new()
	
	if self.type_label ~= nil then
		var368.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var368.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var368.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var368.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var368.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var368.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var368.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var368.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var368.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var368.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var368.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var368.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var368.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var368.won_ever_label = self.wonEverLabel
	end
	return var368
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
	local var368 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var369, var370 = protoModule.writeTag(buff, var368, 1, protoModule.wireTypes.lengthDelimited)
		var369, var836 = protoModule.writeString(var369, var370, self.share)
		buff = var369
		var368 = var370
	end
	if self.report ~= nil and self.report ~= "" then
		local var371, var372 = protoModule.writeTag(buff, var368, 2, protoModule.wireTypes.lengthDelimited)
		var371, var838 = protoModule.writeString(var371, var372, self.report)
		buff = var371
		var368 = var372
	end
	local buff_1 = buffer.create(var368)
	buffer.copy(buff_1, 0, buff, 0, var368)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var368 = t_11.new()
	local var369 = 0
	while var369 < buffer.len(p11) do
		local _ = nil
		local var370 = nil
		local var371, var372, var373 = protoModule.readTag(p11, var369)
		local var374 = var371
		var370 = var372
		var369 = var373
		
		if var370 == protoModule.wireTypes.varint then
			local _ = nil
			local var375, var376 = protoModule.readVarInt(p11, var369)
			local _ = var375
			var369 = var376
			continue
		end
		if var370 == protoModule.wireTypes.lengthDelimited then
			if var374 == 1 then
				local _ = nil
				local var377, var378 = protoModule.readBuffer(p11, var369)
				var369 = var378
				var368.share = buffer.tostring(var377)
			elseif var374 == 2 then
				local _ = nil
				local var379, var380 = protoModule.readBuffer(p11, var369)
				var369 = var380
				var368.report = buffer.tostring(var379)
			else
				local _ = nil
				local var381, var382 = protoModule.readVarInt(p11, var369)
				var369 = var382 + var381
			end
		elseif var370 == protoModule.wireTypes.i32 then
			local _ = nil
			local var383, var384 = protoModule.readFixed32(p11, var369)
			local _ = var383
			var369 = var384
		elseif var370 == protoModule.wireTypes.i64 then
			local _ = nil
			local var385, var386 = protoModule.readFixed64(p11, var369)
			local _ = var385
			var369 = var386
		else
			error("Unsupported wire type: " .. var842)
		end
	end
	return var368
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
	local var387 = t_11.new()
	
	if self.share ~= nil then
		var387.share = self.share
	end
	if self.report ~= nil then
		var387.report = self.report
	end
	return var387
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
	local var387 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var388, var389 = protoModule.writeTag(buff, var387, 1, protoModule.wireTypes.lengthDelimited)
		var388, var864 = protoModule.writeString(var388, var389, self.report)
		buff = var388
		var387 = var389
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var390, var391 = protoModule.writeTag(buff, var387, 2, protoModule.wireTypes.lengthDelimited)
		var390, var866 = protoModule.writeString(var390, var391, self.remove)
		buff = var390
		var387 = var391
	end
	local buff_1 = buffer.create(var387)
	buffer.copy(buff_1, 0, buff, 0, var387)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var387 = t_12.new()
	local var388 = 0
	while var388 < buffer.len(p12) do
		local _ = nil
		local var389 = nil
		local var390, var391, var392 = protoModule.readTag(p12, var388)
		local var393 = var390
		var389 = var391
		var388 = var392
		
		if var389 == protoModule.wireTypes.varint then
			local _ = nil
			local var394, var395 = protoModule.readVarInt(p12, var388)
			local _ = var394
			var388 = var395
			continue
		end
		if var389 == protoModule.wireTypes.lengthDelimited then
			if var393 == 1 then
				local _ = nil
				local var396, var397 = protoModule.readBuffer(p12, var388)
				var388 = var397
				var387.report = buffer.tostring(var396)
			elseif var393 == 2 then
				local _ = nil
				local var398, var399 = protoModule.readBuffer(p12, var388)
				var388 = var399
				var387.remove = buffer.tostring(var398)
			else
				local _ = nil
				local var400, var401 = protoModule.readVarInt(p12, var388)
				var388 = var401 + var400
			end
		elseif var389 == protoModule.wireTypes.i32 then
			local _ = nil
			local var402, var403 = protoModule.readFixed32(p12, var388)
			local _ = var402
			var388 = var403
		elseif var389 == protoModule.wireTypes.i64 then
			local _ = nil
			local var404, var405 = protoModule.readFixed64(p12, var388)
			local _ = var404
			var388 = var405
		else
			error("Unsupported wire type: " .. var870)
		end
	end
	return var387
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
	local var406 = t_12.new()
	
	if self.report ~= nil then
		var406.report = self.report
	end
	if self.remove ~= nil then
		var406.remove = self.remove
	end
	return var406
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
	local var406 = t_13.new()
	local var407 = 0
	while var407 < buffer.len(p13) do
		local var408 = nil
		local _ = nil
		local var409, var410, var411 = protoModule.readTag(p13, var407)
		var408 = var409
		local var412 = var410
		var407 = var411
		
		if var412 == protoModule.wireTypes.varint then
			local _ = nil
			local var413, var414 = protoModule.readVarInt(p13, var407)
			local _ = var413
			var407 = var414
		elseif var412 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var415, var416 = protoModule.readVarInt(p13, var407)
			var407 = var416 + var415
		elseif var412 == protoModule.wireTypes.i32 then
			local _ = nil
			local var417, var418 = protoModule.readFixed32(p13, var407)
			local _ = var417
			var407 = var418
		elseif var412 == protoModule.wireTypes.i64 then
			local _ = nil
			local var419, var420 = protoModule.readFixed64(p13, var407)
			local _ = var419
			var407 = var420
		else
			error("Unsupported wire type: " .. var896)
		end
	end
	return var406
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
	local var421 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var422, var423 = protoModule.writeTag(buff, var421, 1, protoModule.wireTypes.lengthDelimited)
		var422, var908 = protoModule.writeString(var422, var423, self.universe_id)
		buff = var422
		var421 = var423
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var424, var425 = protoModule.writeTag(buff, var421, 2, protoModule.wireTypes.lengthDelimited)
		var424, var910 = protoModule.writeString(var424, var425, self.creator_key)
		buff = var424
		var421 = var425
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var426, var427 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var426, var912 = protoModule.writeString(var426, var427, i)
			local var428 = v:encode()
			var427, var914 = protoModule.writeTag(var426, var427, 2, protoModule.wireTypes.lengthDelimited)
			var427, var914 = protoModule.writeBuffer(var427, var914, var428, buffer.len(var428))
			local var429 = var427
			local var430 = var914
			local var431, var432 = protoModule.writeTag(buff, var421, 3, protoModule.wireTypes.lengthDelimited)
			var431, var918 = protoModule.writeBuffer(var431, var432, var429, var430)
			buff = var431
			var421 = var432
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var433, var434 = protoModule.writeTag(buff, var421, 4, protoModule.wireTypes.lengthDelimited)
			var433, var920 = protoModule.writeString(var433, var434, v)
			buff = var433
			var421 = var434
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var435, var436 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var435, var922 = protoModule.writeString(var435, var436, i)
			local var437 = v:encode()
			var436, var924 = protoModule.writeTag(var435, var436, 2, protoModule.wireTypes.lengthDelimited)
			var436, var924 = protoModule.writeBuffer(var436, var924, var437, buffer.len(var437))
			local var438 = var436
			local var439 = var924
			local var440, var441 = protoModule.writeTag(buff, var421, 5, protoModule.wireTypes.lengthDelimited)
			var440, var928 = protoModule.writeBuffer(var440, var441, var438, var439)
			buff = var440
			var421 = var441
		end
	end
	local buff_1 = buffer.create(var421)
	buffer.copy(buff_1, 0, buff, 0, var421)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var442 = t_14.new()
	local var443 = 0
	while var443 < buffer.len(p14) do
		local _ = nil
		local var444 = nil
		local var445, var446, var447 = protoModule.readTag(p14, var443)
		local var448 = var445
		var444 = var446
		var443 = var447
		
		if var444 == protoModule.wireTypes.varint then
			local _ = nil
			local var449, var450 = protoModule.readVarInt(p14, var443)
			local _ = var449
			var443 = var450
			continue
		end
		if var444 == protoModule.wireTypes.lengthDelimited then
			if var448 == 1 then
				local _ = nil
				local var451, var452 = protoModule.readBuffer(p14, var443)
				var443 = var452
				var442.universe_id = buffer.tostring(var451)
			elseif var448 == 2 then
				local _ = nil
				local var453, var454 = protoModule.readBuffer(p14, var443)
				var443 = var454
				var442.creator_key = buffer.tostring(var453)
			elseif var448 == 3 then
				local _ = nil
				local var455, var456 = protoModule.readBuffer(p14, var443)
				var443 = var456
				var455 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var455)
				var442.entry_map[var455.key or ""] = var455.value or t.FeedEntry.new()
			elseif var448 == 4 then
				local _ = nil
				local var457, var458 = protoModule.readBuffer(p14, var443)
				var443 = var458
				table.insert(var442.entry_order, buffer.tostring(var457))
			elseif var448 == 5 then
				local _ = nil
				local var459, var460 = protoModule.readBuffer(p14, var443)
				var443 = var460
				var459 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var459)
				var442.entry_order_map[var459.key or ""] = var459.value or t.EntryOrder.new()
			else
				local _ = nil
				local var461, var462 = protoModule.readVarInt(p14, var443)
				var443 = var462 + var461
			end
		elseif var444 == protoModule.wireTypes.i32 then
			local _ = nil
			local var463, var464 = protoModule.readFixed32(p14, var443)
			local _ = var463
			var443 = var464
		elseif var444 == protoModule.wireTypes.i64 then
			local _ = nil
			local var465, var466 = protoModule.readFixed64(p14, var443)
			local _ = var465
			var443 = var466
		else
			error("Unsupported wire type: " .. var932)
		end
	end
	return var442
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
	local var467 = t_14.new()
	
	if self.universe_id ~= nil then
		var467.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var467.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var467.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var467.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var467.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var467.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var467.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var467.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var467.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var467.entry_order_map = t_1
	end
	return var467
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
	local var468 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var469, var470 = protoModule.writeTag(buff, var468, 1, protoModule.wireTypes.lengthDelimited)
		var469, var969 = protoModule.writeString(var469, var470, self.key)
		buff = var469
		var468 = var470
	end
	if self.value ~= nil then
		local var471 = self.value:encode()
		local var472, var473 = protoModule.writeTag(buff, var468, 2, protoModule.wireTypes.lengthDelimited)
		var472, var972 = protoModule.writeBuffer(var472, var473, var471, buffer.len(var471))
		buff = var472
		var468 = var473
	end
	local buff_1 = buffer.create(var468)
	buffer.copy(buff_1, 0, buff, 0, var468)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var468 = t_15.new()
	local var469 = 0
	while var469 < buffer.len(p15) do
		local _ = nil
		local var470 = nil
		local var471, var472, var473 = protoModule.readTag(p15, var469)
		local var474 = var471
		var470 = var472
		var469 = var473
		
		if var470 == protoModule.wireTypes.varint then
			local _ = nil
			local var475, var476 = protoModule.readVarInt(p15, var469)
			local _ = var475
			var469 = var476
			continue
		end
		if var470 == protoModule.wireTypes.lengthDelimited then
			if var474 == 1 then
				local _ = nil
				local var477, var478 = protoModule.readBuffer(p15, var469)
				var469 = var478
				var468.key = buffer.tostring(var477)
			elseif var474 == 2 then
				local _ = nil
				local var479, var480 = protoModule.readBuffer(p15, var469)
				var469 = var480
				var468.value = t.FeedEntry.decode(var479)
			else
				local _ = nil
				local var481, var482 = protoModule.readVarInt(p15, var469)
				var469 = var482 + var481
			end
		elseif var470 == protoModule.wireTypes.i32 then
			local _ = nil
			local var483, var484 = protoModule.readFixed32(p15, var469)
			local _ = var483
			var469 = var484
		elseif var470 == protoModule.wireTypes.i64 then
			local _ = nil
			local var485, var486 = protoModule.readFixed64(p15, var469)
			local _ = var485
			var469 = var486
		else
			error("Unsupported wire type: " .. var976)
		end
	end
	return var468
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
	local var487 = t_15.new()
	
	if self.key ~= nil then
		var487.key = self.key
	end
	if self.value ~= nil then
		var487.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var487
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
	local var487 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var488, var489 = protoModule.writeTag(buff, var487, 1, protoModule.wireTypes.lengthDelimited)
		var488, var998 = protoModule.writeString(var488, var489, self.key)
		buff = var488
		var487 = var489
	end
	if self.value ~= nil then
		local var490 = self.value:encode()
		local var491, var492 = protoModule.writeTag(buff, var487, 2, protoModule.wireTypes.lengthDelimited)
		var491, var1001 = protoModule.writeBuffer(var491, var492, var490, buffer.len(var490))
		buff = var491
		var487 = var492
	end
	local buff_1 = buffer.create(var487)
	buffer.copy(buff_1, 0, buff, 0, var487)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var487 = t_16.new()
	local var488 = 0
	while var488 < buffer.len(p16) do
		local _ = nil
		local var489 = nil
		local var490, var491, var492 = protoModule.readTag(p16, var488)
		local var493 = var490
		var489 = var491
		var488 = var492
		
		if var489 == protoModule.wireTypes.varint then
			local _ = nil
			local var494, var495 = protoModule.readVarInt(p16, var488)
			local _ = var494
			var488 = var495
			continue
		end
		if var489 == protoModule.wireTypes.lengthDelimited then
			if var493 == 1 then
				local _ = nil
				local var496, var497 = protoModule.readBuffer(p16, var488)
				var488 = var497
				var487.key = buffer.tostring(var496)
			elseif var493 == 2 then
				local _ = nil
				local var498, var499 = protoModule.readBuffer(p16, var488)
				var488 = var499
				var487.value = t.EntryOrder.decode(var498)
			else
				local _ = nil
				local var500, var501 = protoModule.readVarInt(p16, var488)
				var488 = var501 + var500
			end
		elseif var489 == protoModule.wireTypes.i32 then
			local _ = nil
			local var502, var503 = protoModule.readFixed32(p16, var488)
			local _ = var502
			var488 = var503
		elseif var489 == protoModule.wireTypes.i64 then
			local _ = nil
			local var504, var505 = protoModule.readFixed64(p16, var488)
			local _ = var504
			var488 = var505
		else
			error("Unsupported wire type: " .. var1005)
		end
	end
	return var487
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
	local var506 = t_16.new()
	
	if self.key ~= nil then
		var506.key = self.key
	end
	if self.value ~= nil then
		var506.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var506
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
	local var506 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var507, var508 = protoModule.writeTag(buff, var506, 1, protoModule.wireTypes.lengthDelimited)
			var507, var1027 = protoModule.writeString(var507, var508, v)
			buff = var507
			var506 = var508
		end
	end
	local buff_1 = buffer.create(var506)
	buffer.copy(buff_1, 0, buff, 0, var506)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var509 = t_17.new()
	local var510 = 0
	while var510 < buffer.len(p17) do
		local _ = nil
		local var511 = nil
		local var512, var513, var514 = protoModule.readTag(p17, var510)
		local var515 = var512
		var511 = var513
		var510 = var514
		
		if var511 == protoModule.wireTypes.varint then
			local _ = nil
			local var516, var517 = protoModule.readVarInt(p17, var510)
			local _ = var516
			var510 = var517
			continue
		end
		if var511 == protoModule.wireTypes.lengthDelimited then
			if var515 == 1 then
				local _ = nil
				local var518, var519 = protoModule.readBuffer(p17, var510)
				var510 = var519
				table.insert(var509.items, buffer.tostring(var518))
			else
				local _ = nil
				local var520, var521 = protoModule.readVarInt(p17, var510)
				var510 = var521 + var520
			end
		elseif var511 == protoModule.wireTypes.i32 then
			local _ = nil
			local var522, var523 = protoModule.readFixed32(p17, var510)
			local _ = var522
			var510 = var523
		elseif var511 == protoModule.wireTypes.i64 then
			local _ = nil
			local var524, var525 = protoModule.readFixed64(p17, var510)
			local _ = var524
			var510 = var525
		else
			error("Unsupported wire type: " .. var1031)
		end
	end
	return var509
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
	local var526 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var526.items = t
	end
	return var526
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
	local var527 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var528, var529 = protoModule.writeTag(buff, var527, 1, protoModule.wireTypes.lengthDelimited)
		var528, var1053 = protoModule.writeString(var528, var529, self.universe_id)
		buff = var528
		var527 = var529
	end
	if self.user_owns_experience then
		local var530, var531 = protoModule.writeTag(buff, var527, 2, protoModule.wireTypes.varint)
		var530, var1055 = protoModule.writeVarInt(var530, var531, if self.user_owns_experience then 1 else 0)
		buff = var530
		var527 = var531
	end
	local buff_1 = buffer.create(var527)
	buffer.copy(buff_1, 0, buff, 0, var527)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var527 = t_18.new()
	local var528 = 0
	while var528 < buffer.len(p18) do
		local _ = nil
		local var529 = nil
		local var530, var531, var532 = protoModule.readTag(p18, var528)
		local var533 = var530
		var529 = var531
		var528 = var532
		
		if var529 == protoModule.wireTypes.varint then
			if var533 == 2 then
				local _ = nil
				local var534, var535 = protoModule.readVarInt(p18, var528)
				var528 = var535
				var527.user_owns_experience = var534 ~= 0
			else
				local _ = nil
				local var536, var537 = protoModule.readVarInt(p18, var528)
				local _ = var536
				var528 = var537
			end
		end
		if var529 == protoModule.wireTypes.lengthDelimited then
			if var533 == 1 then
				local _ = nil
				local var538, var539 = protoModule.readBuffer(p18, var528)
				var528 = var539
				var527.universe_id = buffer.tostring(var538)
			else
				local _ = nil
				local var540, var541 = protoModule.readVarInt(p18, var528)
				var528 = var541 + var540
			end
		elseif var529 == protoModule.wireTypes.i32 then
			local _ = nil
			local var542, var543 = protoModule.readFixed32(p18, var528)
			local _ = var542
			var528 = var543
		elseif var529 == protoModule.wireTypes.i64 then
			local _ = nil
			local var544, var545 = protoModule.readFixed64(p18, var528)
			local _ = var544
			var528 = var545
		else
			error("Unsupported wire type: " .. var1059)
		end
	end
	return var527
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
	local var546 = t_18.new()
	
	if self.universe_id ~= nil then
		var546.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var546.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var546.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var546.user_owns_experience = self.userOwnsExperience
	end
	return var546
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
	local var546 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var547, var548 = protoModule.writeTag(buff, var546, 1, protoModule.wireTypes.lengthDelimited)
		var547, var1081 = protoModule.writeString(var547, var548, self.media_asset_id)
		buff = var547
		var546 = var548
	end
	local buff_1 = buffer.create(var546)
	buffer.copy(buff_1, 0, buff, 0, var546)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var546 = t_19.new()
	local var547 = 0
	while var547 < buffer.len(p19) do
		local _ = nil
		local var548 = nil
		local var549, var550, var551 = protoModule.readTag(p19, var547)
		local var552 = var549
		var548 = var550
		var547 = var551
		
		if var548 == protoModule.wireTypes.varint then
			local _ = nil
			local var553, var554 = protoModule.readVarInt(p19, var547)
			local _ = var553
			var547 = var554
			continue
		end
		if var548 == protoModule.wireTypes.lengthDelimited then
			if var552 == 1 then
				local _ = nil
				local var555, var556 = protoModule.readBuffer(p19, var547)
				var547 = var556
				var546.media_asset_id = buffer.tostring(var555)
			else
				local _ = nil
				local var557, var558 = protoModule.readVarInt(p19, var547)
				var547 = var558 + var557
			end
		elseif var548 == protoModule.wireTypes.i32 then
			local _ = nil
			local var559, var560 = protoModule.readFixed32(p19, var547)
			local _ = var559
			var547 = var560
		elseif var548 == protoModule.wireTypes.i64 then
			local _ = nil
			local var561, var562 = protoModule.readFixed64(p19, var547)
			local _ = var561
			var547 = var562
		else
			error("Unsupported wire type: " .. var1085)
		end
	end
	return var546
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
	local var563 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var563.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var563.media_asset_id = self.mediaAssetId
	end
	return var563
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
	local var563 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var564, var565 = protoModule.writeTag(buff, var563, 1, protoModule.wireTypes.lengthDelimited)
		var564, var1105 = protoModule.writeString(var564, var565, self.universe_id)
		buff = var564
		var563 = var565
	end
	local buff_1 = buffer.create(var563)
	buffer.copy(buff_1, 0, buff, 0, var563)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var563 = t_20.new()
	local var564 = 0
	while var564 < buffer.len(p20) do
		local _ = nil
		local var565 = nil
		local var566, var567, var568 = protoModule.readTag(p20, var564)
		local var569 = var566
		var565 = var567
		var564 = var568
		
		if var565 == protoModule.wireTypes.varint then
			local _ = nil
			local var570, var571 = protoModule.readVarInt(p20, var564)
			local _ = var570
			var564 = var571
			continue
		end
		if var565 == protoModule.wireTypes.lengthDelimited then
			if var569 == 1 then
				local _ = nil
				local var572, var573 = protoModule.readBuffer(p20, var564)
				var564 = var573
				var563.universe_id = buffer.tostring(var572)
			else
				local _ = nil
				local var574, var575 = protoModule.readVarInt(p20, var564)
				var564 = var575 + var574
			end
		elseif var565 == protoModule.wireTypes.i32 then
			local _ = nil
			local var576, var577 = protoModule.readFixed32(p20, var564)
			local _ = var576
			var564 = var577
		elseif var565 == protoModule.wireTypes.i64 then
			local _ = nil
			local var578, var579 = protoModule.readFixed64(p20, var564)
			local _ = var578
			var564 = var579
		else
			error("Unsupported wire type: " .. var1109)
		end
	end
	return var563
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
	local var580 = t_20.new()
	
	if self.universe_id ~= nil then
		var580.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var580.universe_id = self.universeId
	end
	return var580
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
	local var580 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var581, var582 = protoModule.writeTag(buff, var580, 1, protoModule.wireTypes.lengthDelimited)
		var581, var1129 = protoModule.writeString(var581, var582, self.universe_id)
		buff = var581
		var580 = var582
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var583, var584 = protoModule.writeTag(buff, var580, 2, protoModule.wireTypes.lengthDelimited)
		var583, var1131 = protoModule.writeString(var583, var584, self.creator_key)
		buff = var583
		var580 = var584
	end
	local buff_1 = buffer.create(var580)
	buffer.copy(buff_1, 0, buff, 0, var580)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var580 = t_21.new()
	local var581 = 0
	while var581 < buffer.len(p21) do
		local _ = nil
		local var582 = nil
		local var583, var584, var585 = protoModule.readTag(p21, var581)
		local var586 = var583
		var582 = var584
		var581 = var585
		
		if var582 == protoModule.wireTypes.varint then
			local _ = nil
			local var587, var588 = protoModule.readVarInt(p21, var581)
			local _ = var587
			var581 = var588
			continue
		end
		if var582 == protoModule.wireTypes.lengthDelimited then
			if var586 == 1 then
				local _ = nil
				local var589, var590 = protoModule.readBuffer(p21, var581)
				var581 = var590
				var580.universe_id = buffer.tostring(var589)
			elseif var586 == 2 then
				local _ = nil
				local var591, var592 = protoModule.readBuffer(p21, var581)
				var581 = var592
				var580.creator_key = buffer.tostring(var591)
			else
				local _ = nil
				local var593, var594 = protoModule.readVarInt(p21, var581)
				var581 = var594 + var593
			end
		elseif var582 == protoModule.wireTypes.i32 then
			local _ = nil
			local var595, var596 = protoModule.readFixed32(p21, var581)
			local _ = var595
			var581 = var596
		elseif var582 == protoModule.wireTypes.i64 then
			local _ = nil
			local var597, var598 = protoModule.readFixed64(p21, var581)
			local _ = var597
			var581 = var598
		else
			error("Unsupported wire type: " .. var1135)
		end
	end
	return var580
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
	local var599 = t_21.new()
	
	if self.universe_id ~= nil then
		var599.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var599.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var599.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var599.creator_key = self.creatorKey
	end
	return var599
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
	local var599 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var600, var601 = protoModule.writeTag(buff, var599, 1, protoModule.wireTypes.lengthDelimited)
		var600, var1157 = protoModule.writeString(var600, var601, self.universe_id)
		buff = var600
		var599 = var601
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var602, var603 = protoModule.writeTag(buff, var599, 2, protoModule.wireTypes.lengthDelimited)
		var602, var1159 = protoModule.writeString(var602, var603, self.root_place_id)
		buff = var602
		var599 = var603
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var604, var605 = protoModule.writeTag(buff, var599, 3, protoModule.wireTypes.lengthDelimited)
		var604, var1161 = protoModule.writeString(var604, var605, self.connection_played_display_name)
		buff = var604
		var599 = var605
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var606, var607 = protoModule.writeTag(buff, var599, 4, protoModule.wireTypes.lengthDelimited)
		var606, var1163 = protoModule.writeString(var606, var607, self.upsell_prompt)
		buff = var606
		var599 = var607
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var608 = v:encode()
			local var609, var610 = protoModule.writeTag(buff, var599, 5, protoModule.wireTypes.lengthDelimited)
			var609, var1166 = protoModule.writeBuffer(var609, var610, var608, buffer.len(var608))
			buff = var609
			var599 = var610
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var611, var612 = protoModule.writeTag(buff, var599, 6, protoModule.wireTypes.varint)
		var611, var1168 = protoModule.writeVarInt(var611, var612, self.connection_played_num_others)
		buff = var611
		var599 = var612
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var613, var614 = protoModule.writeTag(buff, var599, 7, protoModule.wireTypes.varint)
		var613, var1170 = protoModule.writeVarInt(var613, var614, self.connection_played_total_count)
		buff = var613
		var599 = var614
	end
	local buff_1 = buffer.create(var599)
	buffer.copy(buff_1, 0, buff, 0, var599)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var615 = t_22.new()
	local var616 = 0
	while var616 < buffer.len(p22) do
		local _ = nil
		local var617 = nil
		local var618, var619, var620 = protoModule.readTag(p22, var616)
		local var621 = var618
		var617 = var619
		var616 = var620
		
		if var617 == protoModule.wireTypes.varint then
			if var621 == 6 then
				local _ = nil
				local var622, var623 = protoModule.readVarIntI32(p22, var616)
				var616 = var623
				var615.connection_played_num_others = var622
			elseif var621 == 7 then
				local _ = nil
				local var624, var625 = protoModule.readVarIntI32(p22, var616)
				var616 = var625
				var615.connection_played_total_count = var624
			else
				local _ = nil
				local var626, var627 = protoModule.readVarInt(p22, var616)
				local _ = var626
				var616 = var627
			end
		end
		if var617 == protoModule.wireTypes.lengthDelimited then
			if var621 == 1 then
				local _ = nil
				local var628, var629 = protoModule.readBuffer(p22, var616)
				var616 = var629
				var615.universe_id = buffer.tostring(var628)
			elseif var621 == 2 then
				local _ = nil
				local var630, var631 = protoModule.readBuffer(p22, var616)
				var616 = var631
				var615.root_place_id = buffer.tostring(var630)
			elseif var621 == 3 then
				local _ = nil
				local var632, var633 = protoModule.readBuffer(p22, var616)
				var616 = var633
				var615.connection_played_display_name = buffer.tostring(var632)
			elseif var621 == 4 then
				local _ = nil
				local var634, var635 = protoModule.readBuffer(p22, var616)
				var616 = var635
				var615.upsell_prompt = buffer.tostring(var634)
			elseif var621 == 5 then
				local _ = nil
				local var636, var637 = protoModule.readBuffer(p22, var616)
				var616 = var637
				table.insert(var615.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var636))
			else
				local _ = nil
				local var638, var639 = protoModule.readVarInt(p22, var616)
				var616 = var639 + var638
			end
		elseif var617 == protoModule.wireTypes.i32 then
			local _ = nil
			local var640, var641 = protoModule.readFixed32(p22, var616)
			local _ = var640
			var616 = var641
		elseif var617 == protoModule.wireTypes.i64 then
			local _ = nil
			local var642, var643 = protoModule.readFixed64(p22, var616)
			local _ = var642
			var616 = var643
		else
			error("Unsupported wire type: " .. var1174)
		end
	end
	return var615
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
	local var644 = t_22.new()
	
	if self.universe_id ~= nil then
		var644.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var644.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var644.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var644.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var644.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var644.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var644.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var644.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var644.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var644.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var644.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var644.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var644.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var644.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var644
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
	local var645 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var646, var647 = protoModule.writeTag(buff, var645, 1, protoModule.wireTypes.lengthDelimited)
		var646, var1209 = protoModule.writeString(var646, var647, self.user_id)
		buff = var646
		var645 = var647
	end
	local buff_1 = buffer.create(var645)
	buffer.copy(buff_1, 0, buff, 0, var645)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var645 = t_23.new()
	local var646 = 0
	while var646 < buffer.len(p23) do
		local _ = nil
		local var647 = nil
		local var648, var649, var650 = protoModule.readTag(p23, var646)
		local var651 = var648
		var647 = var649
		var646 = var650
		
		if var647 == protoModule.wireTypes.varint then
			local _ = nil
			local var652, var653 = protoModule.readVarInt(p23, var646)
			local _ = var652
			var646 = var653
			continue
		end
		if var647 == protoModule.wireTypes.lengthDelimited then
			if var651 == 1 then
				local _ = nil
				local var654, var655 = protoModule.readBuffer(p23, var646)
				var646 = var655
				var645.user_id = buffer.tostring(var654)
			else
				local _ = nil
				local var656, var657 = protoModule.readVarInt(p23, var646)
				var646 = var657 + var656
			end
		elseif var647 == protoModule.wireTypes.i32 then
			local _ = nil
			local var658, var659 = protoModule.readFixed32(p23, var646)
			local _ = var658
			var646 = var659
		elseif var647 == protoModule.wireTypes.i64 then
			local _ = nil
			local var660, var661 = protoModule.readFixed64(p23, var646)
			local _ = var660
			var646 = var661
		else
			error("Unsupported wire type: " .. var1213)
		end
	end
	return var645
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
	local var662 = t_23.new()
	
	if self.user_id ~= nil then
		var662.user_id = self.user_id
	end
	if self.userId ~= nil then
		var662.user_id = self.userId
	end
	return var662
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
	local var662 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var663 = v:encode()
			local var664, var665 = protoModule.writeTag(buff, var662, 1, protoModule.wireTypes.lengthDelimited)
			var664, var1234 = protoModule.writeBuffer(var664, var665, var663, buffer.len(var663))
			buff = var664
			var662 = var665
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var666, var667 = protoModule.writeTag(buff, var662, 2, protoModule.wireTypes.lengthDelimited)
		var666, var1236 = protoModule.writeString(var666, var667, self.universe_id)
		buff = var666
		var662 = var667
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var668, var669 = protoModule.writeTag(buff, var662, 3, protoModule.wireTypes.lengthDelimited)
		var668, var1238 = protoModule.writeString(var668, var669, self.place_id)
		buff = var668
		var662 = var669
	end
	local buff_1 = buffer.create(var662)
	buffer.copy(buff_1, 0, buff, 0, var662)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var670 = t_24.new()
	local var671 = 0
	while var671 < buffer.len(p24) do
		local _ = nil
		local var672 = nil
		local var673, var674, var675 = protoModule.readTag(p24, var671)
		local var676 = var673
		var672 = var674
		var671 = var675
		
		if var672 == protoModule.wireTypes.varint then
			local _ = nil
			local var677, var678 = protoModule.readVarInt(p24, var671)
			local _ = var677
			var671 = var678
			continue
		end
		if var672 == protoModule.wireTypes.lengthDelimited then
			if var676 == 1 then
				local _ = nil
				local var679, var680 = protoModule.readBuffer(p24, var671)
				var671 = var680
				table.insert(var670.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var679))
			elseif var676 == 2 then
				local _ = nil
				local var681, var682 = protoModule.readBuffer(p24, var671)
				var671 = var682
				var670.universe_id = buffer.tostring(var681)
			elseif var676 == 3 then
				local _ = nil
				local var683, var684 = protoModule.readBuffer(p24, var671)
				var671 = var684
				var670.place_id = buffer.tostring(var683)
			else
				local _ = nil
				local var685, var686 = protoModule.readVarInt(p24, var671)
				var671 = var686 + var685
			end
		elseif var672 == protoModule.wireTypes.i32 then
			local _ = nil
			local var687, var688 = protoModule.readFixed32(p24, var671)
			local _ = var687
			var671 = var688
		elseif var672 == protoModule.wireTypes.i64 then
			local _ = nil
			local var689, var690 = protoModule.readFixed64(p24, var671)
			local _ = var689
			var671 = var690
		else
			error("Unsupported wire type: " .. var1242)
		end
	end
	return var670
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
	local var691 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var691.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var691.media_items = t_1
	end
	if self.universe_id ~= nil then
		var691.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var691.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var691.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var691.place_id = self.placeId
	end
	return var691
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
	local var692 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var693, var694 = protoModule.writeTag(buff, var692, 1, protoModule.wireTypes.lengthDelimited)
		var693, var1269 = protoModule.writeString(var693, var694, self.media_asset_id)
		buff = var693
		var692 = var694
	end
	local buff_1 = buffer.create(var692)
	buffer.copy(buff_1, 0, buff, 0, var692)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref)
	local var692 = t_25.new()
	local var693 = 0
	while var693 < buffer.len(p25) do
		local _ = nil
		local var694 = nil
		local var695, var696, var697 = protoModule.readTag(p25, var693)
		local var698 = var695
		var694 = var696
		var693 = var697
		
		if var694 == protoModule.wireTypes.varint then
			local _ = nil
			local var699, var700 = protoModule.readVarInt(p25, var693)
			local _ = var699
			var693 = var700
			continue
		end
		if var694 == protoModule.wireTypes.lengthDelimited then
			if var698 == 1 then
				local _ = nil
				local var701, var702 = protoModule.readBuffer(p25, var693)
				var693 = var702
				var692.media_asset_id = buffer.tostring(var701)
			else
				local _ = nil
				local var703, var704 = protoModule.readVarInt(p25, var693)
				var693 = var704 + var703
			end
		elseif var694 == protoModule.wireTypes.i32 then
			local _ = nil
			local var705, var706 = protoModule.readFixed32(p25, var693)
			local _ = var705
			var693 = var706
		elseif var694 == protoModule.wireTypes.i64 then
			local _ = nil
			local var707, var708 = protoModule.readFixed64(p25, var693)
			local _ = var707
			var693 = var708
		else
			error("Unsupported wire type: " .. var1273)
		end
	end
	return var692
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
	local var709 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var709.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var709.media_asset_id = self.mediaAssetId
	end
	return var709
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
	local var709 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var710, var711 = protoModule.writeTag(buff, var709, 1, protoModule.wireTypes.lengthDelimited)
		var710, var1293 = protoModule.writeString(var710, var711, self.universe_id)
		buff = var710
		var709 = var711
	end
	local buff_1 = buffer.create(var709)
	buffer.copy(buff_1, 0, buff, 0, var709)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var709 = t_26.new()
	local var710 = 0
	while var710 < buffer.len(p26) do
		local _ = nil
		local var711 = nil
		local var712, var713, var714 = protoModule.readTag(p26, var710)
		local var715 = var712
		var711 = var713
		var710 = var714
		
		if var711 == protoModule.wireTypes.varint then
			local _ = nil
			local var716, var717 = protoModule.readVarInt(p26, var710)
			local _ = var716
			var710 = var717
			continue
		end
		if var711 == protoModule.wireTypes.lengthDelimited then
			if var715 == 1 then
				local _ = nil
				local var718, var719 = protoModule.readBuffer(p26, var710)
				var710 = var719
				var709.universe_id = buffer.tostring(var718)
			else
				local _ = nil
				local var720, var721 = protoModule.readVarInt(p26, var710)
				var710 = var721 + var720
			end
		elseif var711 == protoModule.wireTypes.i32 then
			local _ = nil
			local var722, var723 = protoModule.readFixed32(p26, var710)
			local _ = var722
			var710 = var723
		elseif var711 == protoModule.wireTypes.i64 then
			local _ = nil
			local var724, var725 = protoModule.readFixed64(p26, var710)
			local _ = var724
			var710 = var725
		else
			error("Unsupported wire type: " .. var1297)
		end
	end
	return var709
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
	local var726 = t_26.new()
	
	if self.universe_id ~= nil then
		var726.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var726.universe_id = self.universeId
	end
	return var726
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
	local var726 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var727, var728 = protoModule.writeTag(buff, var726, 1, protoModule.wireTypes.lengthDelimited)
		var727, var1317 = protoModule.writeString(var727, var728, self.universe_id)
		buff = var727
		var726 = var728
	end
	local buff_1 = buffer.create(var726)
	buffer.copy(buff_1, 0, buff, 0, var726)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var726 = t_27.new()
	local var727 = 0
	while var727 < buffer.len(p27) do
		local _ = nil
		local var728 = nil
		local var729, var730, var731 = protoModule.readTag(p27, var727)
		local var732 = var729
		var728 = var730
		var727 = var731
		
		if var728 == protoModule.wireTypes.varint then
			local _ = nil
			local var733, var734 = protoModule.readVarInt(p27, var727)
			local _ = var733
			var727 = var734
			continue
		end
		if var728 == protoModule.wireTypes.lengthDelimited then
			if var732 == 1 then
				local _ = nil
				local var735, var736 = protoModule.readBuffer(p27, var727)
				var727 = var736
				var726.universe_id = buffer.tostring(var735)
			else
				local _ = nil
				local var737, var738 = protoModule.readVarInt(p27, var727)
				var727 = var738 + var737
			end
		elseif var728 == protoModule.wireTypes.i32 then
			local _ = nil
			local var739, var740 = protoModule.readFixed32(p27, var727)
			local _ = var739
			var727 = var740
		elseif var728 == protoModule.wireTypes.i64 then
			local _ = nil
			local var741, var742 = protoModule.readFixed64(p27, var727)
			local _ = var741
			var727 = var742
		else
			error("Unsupported wire type: " .. var1321)
		end
	end
	return var726
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
	local var743 = t_27.new()
	
	if self.universe_id ~= nil then
		var743.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var743.universe_id = self.universeId
	end
	return var743
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
	local var743 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var744, var745 = protoModule.writeTag(buff, var743, 1, protoModule.wireTypes.lengthDelimited)
		var744, var1341 = protoModule.writeString(var744, var745, self.universe_id)
		buff = var744
		var743 = var745
	end
	if self.has_store_items then
		local var746, var747 = protoModule.writeTag(buff, var743, 2, protoModule.wireTypes.varint)
		var746, var1343 = protoModule.writeVarInt(var746, var747, if self.has_store_items then 1 else 0)
		buff = var746
		var743 = var747
	end
	if self.has_badges then
		local var748, var749 = protoModule.writeTag(buff, var743, 3, protoModule.wireTypes.varint)
		var748, var1345 = protoModule.writeVarInt(var748, var749, if self.has_badges then 1 else 0)
		buff = var748
		var743 = var749
	end
	if self.has_game_passes then
		local var750, var751 = protoModule.writeTag(buff, var743, 4, protoModule.wireTypes.varint)
		var750, var1347 = protoModule.writeVarInt(var750, var751, if self.has_game_passes then 1 else 0)
		buff = var750
		var743 = var751
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var752, var753 = protoModule.writeTag(buff, var743, 5, protoModule.wireTypes.lengthDelimited)
		var752, var1349 = protoModule.writeString(var752, var753, self.community_id)
		buff = var752
		var743 = var753
	end
	local buff_1 = buffer.create(var743)
	buffer.copy(buff_1, 0, buff, 0, var743)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var743 = t_28.new()
	local var744 = 0
	while var744 < buffer.len(p28) do
		local _ = nil
		local var745 = nil
		local var746, var747, var748 = protoModule.readTag(p28, var744)
		local var749 = var746
		var745 = var747
		var744 = var748
		
		if var745 == protoModule.wireTypes.varint then
			if var749 == 2 then
				local _ = nil
				local var750, var751 = protoModule.readVarInt(p28, var744)
				var744 = var751
				var743.has_store_items = var750 ~= 0
			elseif var749 == 3 then
				local _ = nil
				local var752, var753 = protoModule.readVarInt(p28, var744)
				var744 = var753
				var743.has_badges = var752 ~= 0
			elseif var749 == 4 then
				local _ = nil
				local var754, var755 = protoModule.readVarInt(p28, var744)
				var744 = var755
				var743.has_game_passes = var754 ~= 0
			else
				local _ = nil
				local var756, var757 = protoModule.readVarInt(p28, var744)
				local _ = var756
				var744 = var757
			end
		end
		if var745 == protoModule.wireTypes.lengthDelimited then
			if var749 == 1 then
				local _ = nil
				local var758, var759 = protoModule.readBuffer(p28, var744)
				var744 = var759
				var743.universe_id = buffer.tostring(var758)
			elseif var749 == 5 then
				local _ = nil
				local var760, var761 = protoModule.readBuffer(p28, var744)
				var744 = var761
				var743.community_id = buffer.tostring(var760)
			else
				local _ = nil
				local var762, var763 = protoModule.readVarInt(p28, var744)
				var744 = var763 + var762
			end
		elseif var745 == protoModule.wireTypes.i32 then
			local _ = nil
			local var764, var765 = protoModule.readFixed32(p28, var744)
			local _ = var764
			var744 = var765
		elseif var745 == protoModule.wireTypes.i64 then
			local _ = nil
			local var766, var767 = protoModule.readFixed64(p28, var744)
			local _ = var766
			var744 = var767
		else
			error("Unsupported wire type: " .. var1353)
		end
	end
	return var743
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
	local var768 = t_28.new()
	
	if self.universe_id ~= nil then
		var768.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var768.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var768.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var768.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var768.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var768.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var768.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var768.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var768.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var768.community_id = self.communityId
	end
	return var768
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
	local var768 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var769, var770 = protoModule.writeTag(buff, var768, 1, protoModule.wireTypes.lengthDelimited)
		var769, var1381 = protoModule.writeString(var769, var770, self.universe_id)
		buff = var769
		var768 = var770
	end
	local buff_1 = buffer.create(var768)
	buffer.copy(buff_1, 0, buff, 0, var768)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var768 = t_29.new()
	local var769 = 0
	while var769 < buffer.len(p29) do
		local _ = nil
		local var770 = nil
		local var771, var772, var773 = protoModule.readTag(p29, var769)
		local var774 = var771
		var770 = var772
		var769 = var773
		
		if var770 == protoModule.wireTypes.varint then
			local _ = nil
			local var775, var776 = protoModule.readVarInt(p29, var769)
			local _ = var775
			var769 = var776
			continue
		end
		if var770 == protoModule.wireTypes.lengthDelimited then
			if var774 == 1 then
				local _ = nil
				local var777, var778 = protoModule.readBuffer(p29, var769)
				var769 = var778
				var768.universe_id = buffer.tostring(var777)
			else
				local _ = nil
				local var779, var780 = protoModule.readVarInt(p29, var769)
				var769 = var780 + var779
			end
		elseif var770 == protoModule.wireTypes.i32 then
			local _ = nil
			local var781, var782 = protoModule.readFixed32(p29, var769)
			local _ = var781
			var769 = var782
		elseif var770 == protoModule.wireTypes.i64 then
			local _ = nil
			local var783, var784 = protoModule.readFixed64(p29, var769)
			local _ = var783
			var769 = var784
		else
			error("Unsupported wire type: " .. var1385)
		end
	end
	return var768
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
	local var785 = t_29.new()
	
	if self.universe_id ~= nil then
		var785.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var785.universe_id = self.universeId
	end
	return var785
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
	local var785 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var786, var787 = protoModule.writeTag(buff, var785, 1, protoModule.wireTypes.lengthDelimited)
		var786, var1405 = protoModule.writeString(var786, var787, self.universe_id)
		buff = var786
		var785 = var787
	end
	if self.user_owns_experience then
		local var788, var789 = protoModule.writeTag(buff, var785, 2, protoModule.wireTypes.varint)
		var788, var1407 = protoModule.writeVarInt(var788, var789, if self.user_owns_experience then 1 else 0)
		buff = var788
		var785 = var789
	end
	local buff_1 = buffer.create(var785)
	buffer.copy(buff_1, 0, buff, 0, var785)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var785 = t_30.new()
	local var786 = 0
	while var786 < buffer.len(p30) do
		local _ = nil
		local var787 = nil
		local var788, var789, var790 = protoModule.readTag(p30, var786)
		local var791 = var788
		var787 = var789
		var786 = var790
		
		if var787 == protoModule.wireTypes.varint then
			if var791 == 2 then
				local _ = nil
				local var792, var793 = protoModule.readVarInt(p30, var786)
				var786 = var793
				var785.user_owns_experience = var792 ~= 0
			else
				local _ = nil
				local var794, var795 = protoModule.readVarInt(p30, var786)
				local _ = var794
				var786 = var795
			end
		end
		if var787 == protoModule.wireTypes.lengthDelimited then
			if var791 == 1 then
				local _ = nil
				local var796, var797 = protoModule.readBuffer(p30, var786)
				var786 = var797
				var785.universe_id = buffer.tostring(var796)
			else
				local _ = nil
				local var798, var799 = protoModule.readVarInt(p30, var786)
				var786 = var799 + var798
			end
		elseif var787 == protoModule.wireTypes.i32 then
			local _ = nil
			local var800, var801 = protoModule.readFixed32(p30, var786)
			local _ = var800
			var786 = var801
		elseif var787 == protoModule.wireTypes.i64 then
			local _ = nil
			local var802, var803 = protoModule.readFixed64(p30, var786)
			local _ = var802
			var786 = var803
		else
			error("Unsupported wire type: " .. var1411)
		end
	end
	return var785
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
	local var804 = t_30.new()
	
	if self.universe_id ~= nil then
		var804.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var804.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var804.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var804.user_owns_experience = self.userOwnsExperience
	end
	return var804
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
	local var804 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var805, var806 = protoModule.writeTag(buff, var804, 1, protoModule.wireTypes.lengthDelimited)
		var805, var1433 = protoModule.writeString(var805, var806, self.universe_id)
		buff = var805
		var804 = var806
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var807, var808 = protoModule.writeTag(buff, var804, 2, protoModule.wireTypes.lengthDelimited)
		var807, var1435 = protoModule.writeString(var807, var808, self.place_id)
		buff = var807
		var804 = var808
	end
	local buff_1 = buffer.create(var804)
	buffer.copy(buff_1, 0, buff, 0, var804)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var804 = t_31.new()
	local var805 = 0
	while var805 < buffer.len(p31) do
		local _ = nil
		local var806 = nil
		local var807, var808, var809 = protoModule.readTag(p31, var805)
		local var810 = var807
		var806 = var808
		var805 = var809
		
		if var806 == protoModule.wireTypes.varint then
			local _ = nil
			local var811, var812 = protoModule.readVarInt(p31, var805)
			local _ = var811
			var805 = var812
			continue
		end
		if var806 == protoModule.wireTypes.lengthDelimited then
			if var810 == 1 then
				local _ = nil
				local var813, var814 = protoModule.readBuffer(p31, var805)
				var805 = var814
				var804.universe_id = buffer.tostring(var813)
			elseif var810 == 2 then
				local _ = nil
				local var815, var816 = protoModule.readBuffer(p31, var805)
				var805 = var816
				var804.place_id = buffer.tostring(var815)
			else
				local _ = nil
				local var817, var818 = protoModule.readVarInt(p31, var805)
				var805 = var818 + var817
			end
		elseif var806 == protoModule.wireTypes.i32 then
			local _ = nil
			local var819, var820 = protoModule.readFixed32(p31, var805)
			local _ = var819
			var805 = var820
		elseif var806 == protoModule.wireTypes.i64 then
			local _ = nil
			local var821, var822 = protoModule.readFixed64(p31, var805)
			local _ = var821
			var805 = var822
		else
			error("Unsupported wire type: " .. var1439)
		end
	end
	return var804
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
	local var823 = t_31.new()
	
	if self.universe_id ~= nil then
		var823.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var823.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var823.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var823.place_id = self.placeId
	end
	return var823
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
	local var823 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var824, var825 = protoModule.writeTag(buff, var823, 1, protoModule.wireTypes.lengthDelimited)
		var824, var1461 = protoModule.writeString(var824, var825, self.community_id)
		buff = var824
		var823 = var825
	end
	local buff_1 = buffer.create(var823)
	buffer.copy(buff_1, 0, buff, 0, var823)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var823 = t_32.new()
	local var824 = 0
	while var824 < buffer.len(p32) do
		local _ = nil
		local var825 = nil
		local var826, var827, var828 = protoModule.readTag(p32, var824)
		local var829 = var826
		var825 = var827
		var824 = var828
		
		if var825 == protoModule.wireTypes.varint then
			local _ = nil
			local var830, var831 = protoModule.readVarInt(p32, var824)
			local _ = var830
			var824 = var831
			continue
		end
		if var825 == protoModule.wireTypes.lengthDelimited then
			if var829 == 1 then
				local _ = nil
				local var832, var833 = protoModule.readBuffer(p32, var824)
				var824 = var833
				var823.community_id = buffer.tostring(var832)
			else
				local _ = nil
				local var834, var835 = protoModule.readVarInt(p32, var824)
				var824 = var835 + var834
			end
		elseif var825 == protoModule.wireTypes.i32 then
			local _ = nil
			local var836, var837 = protoModule.readFixed32(p32, var824)
			local _ = var836
			var824 = var837
		elseif var825 == protoModule.wireTypes.i64 then
			local _ = nil
			local var838, var839 = protoModule.readFixed64(p32, var824)
			local _ = var838
			var824 = var839
		else
			error("Unsupported wire type: " .. var1465)
		end
	end
	return var823
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
	local var840 = t_32.new()
	
	if self.community_id ~= nil then
		var840.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var840.community_id = self.communityId
	end
	return var840
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
	local var840 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var841 = v:encode()
			local var842, var843 = protoModule.writeTag(buff, var840, 1, protoModule.wireTypes.lengthDelimited)
			var842, var1486 = protoModule.writeBuffer(var842, var843, var841, buffer.len(var841))
			buff = var842
			var840 = var843
		end
	end
	local buff_1 = buffer.create(var840)
	buffer.copy(buff_1, 0, buff, 0, var840)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var844 = t_33.new()
	local var845 = 0
	while var845 < buffer.len(p33) do
		local _ = nil
		local var846 = nil
		local var847, var848, var849 = protoModule.readTag(p33, var845)
		local var850 = var847
		var846 = var848
		var845 = var849
		
		if var846 == protoModule.wireTypes.varint then
			local _ = nil
			local var851, var852 = protoModule.readVarInt(p33, var845)
			local _ = var851
			var845 = var852
			continue
		end
		if var846 == protoModule.wireTypes.lengthDelimited then
			if var850 == 1 then
				local _ = nil
				local var853, var854 = protoModule.readBuffer(p33, var845)
				var845 = var854
				table.insert(var844.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var853))
			else
				local _ = nil
				local var855, var856 = protoModule.readVarInt(p33, var845)
				var845 = var856 + var855
			end
		elseif var846 == protoModule.wireTypes.i32 then
			local _ = nil
			local var857, var858 = protoModule.readFixed32(p33, var845)
			local _ = var857
			var845 = var858
		elseif var846 == protoModule.wireTypes.i64 then
			local _ = nil
			local var859, var860 = protoModule.readFixed64(p33, var845)
			local _ = var859
			var845 = var860
		else
			error("Unsupported wire type: " .. var1490)
		end
	end
	return var844
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
	local var861 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var861.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var861.social_link_items = t_1
	end
	return var861
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
	local var862 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var863, var864 = protoModule.writeTag(buff, var862, 1, protoModule.wireTypes.lengthDelimited)
		var863, var1513 = protoModule.writeString(var863, var864, self.social_link_id)
		buff = var863
		var862 = var864
	end
	local buff_1 = buffer.create(var862)
	buffer.copy(buff_1, 0, buff, 0, var862)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref)
	local var862 = t_34.new()
	local var863 = 0
	while var863 < buffer.len(p34) do
		local _ = nil
		local var864 = nil
		local var865, var866, var867 = protoModule.readTag(p34, var863)
		local var868 = var865
		var864 = var866
		var863 = var867
		
		if var864 == protoModule.wireTypes.varint then
			local _ = nil
			local var869, var870 = protoModule.readVarInt(p34, var863)
			local _ = var869
			var863 = var870
			continue
		end
		if var864 == protoModule.wireTypes.lengthDelimited then
			if var868 == 1 then
				local _ = nil
				local var871, var872 = protoModule.readBuffer(p34, var863)
				var863 = var872
				var862.social_link_id = buffer.tostring(var871)
			else
				local _ = nil
				local var873, var874 = protoModule.readVarInt(p34, var863)
				var863 = var874 + var873
			end
		elseif var864 == protoModule.wireTypes.i32 then
			local _ = nil
			local var875, var876 = protoModule.readFixed32(p34, var863)
			local _ = var875
			var863 = var876
		elseif var864 == protoModule.wireTypes.i64 then
			local _ = nil
			local var877, var878 = protoModule.readFixed64(p34, var863)
			local _ = var877
			var863 = var878
		else
			error("Unsupported wire type: " .. var1517)
		end
	end
	return var862
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
	local var879 = t_34.new()
	
	if self.social_link_id ~= nil then
		var879.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var879.social_link_id = self.socialLinkId
	end
	return var879
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
		collection_item_size = if p35 == nil or p35.collection_item_size == nil then nil else p35.collection_item_size
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var879 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var880, var881 = protoModule.writeTag(buff, var879, 1, protoModule.wireTypes.lengthDelimited)
		var880, var1537 = protoModule.writeString(var880, var881, self.title)
		buff = var880
		var879 = var881
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var882 = v:encode()
			local var883, var884 = protoModule.writeTag(buff, var879, 2, protoModule.wireTypes.lengthDelimited)
			var883, var1540 = protoModule.writeBuffer(var883, var884, var882, buffer.len(var882))
			buff = var883
			var879 = var884
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var885, var886 = protoModule.writeTag(buff, var879, 3, protoModule.wireTypes.lengthDelimited)
		var885, var1542 = protoModule.writeString(var885, var886, self.next_page_token)
		buff = var885
		var879 = var886
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var887, var888 = protoModule.writeTag(buff, var879, 4, protoModule.wireTypes.lengthDelimited)
		var887, var1544 = protoModule.writeString(var887, var888, self.sort_id)
		buff = var887
		var879 = var888
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var889, var890 = protoModule.writeTag(buff, var879, 5, protoModule.wireTypes.varint)
		var889, var1546 = protoModule.writeVarInt(var889, var890, self.secondary_sort_id)
		buff = var889
		var879 = var890
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var891, var892 = protoModule.writeTag(buff, var879, 6, protoModule.wireTypes.varint)
		var891, var1548 = protoModule.writeVarInt(var891, var892, self.max_visible_rows)
		buff = var891
		var879 = var892
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var893, var894 = protoModule.writeTag(buff, var879, 7, protoModule.wireTypes.lengthDelimited)
		var893, var1550 = protoModule.writeString(var893, var894, self.subtitle)
		buff = var893
		var879 = var894
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var895, var896 = protoModule.writeTag(buff, var879, 8, protoModule.wireTypes.lengthDelimited)
		var895, var1552 = protoModule.writeString(var895, var896, self.info_text)
		buff = var895
		var879 = var896
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var897, var898 = protoModule.writeTag(buff, var879, 9, protoModule.wireTypes.lengthDelimited)
		var897, var1554 = protoModule.writeString(var897, var898, self.subtitle_link_path)
		buff = var897
		var879 = var898
	end
	if self.is_placeholder ~= nil then
		local var899, var900 = protoModule.writeTag(buff, var879, 10, protoModule.wireTypes.varint)
		var899, var1556 = protoModule.writeVarInt(var899, var900, if self.is_placeholder then 1 else 0)
		buff = var899
		var879 = var900
	end
	if self.primary_sort_id ~= nil then
		local var901, var902 = protoModule.writeTag(buff, var879, 11, protoModule.wireTypes.varint)
		var901, var1558 = protoModule.writeVarInt(var901, var902, self.primary_sort_id)
		buff = var901
		var879 = var902
	end
	if self.applied_filters ~= nil then
		local var903, var904 = protoModule.writeTag(buff, var879, 12, protoModule.wireTypes.lengthDelimited)
		var903, var1560 = protoModule.writeString(var903, var904, self.applied_filters)
		buff = var903
		var879 = var904
	end
	if self.pool_id ~= nil then
		local var905, var906 = protoModule.writeTag(buff, var879, 13, protoModule.wireTypes.lengthDelimited)
		var905, var1562 = protoModule.writeString(var905, var906, self.pool_id)
		buff = var905
		var879 = var906
	end
	if self.has_emphasized_tile then
		local var907, var908 = protoModule.writeTag(buff, var879, 14, protoModule.wireTypes.varint)
		var907, var1564 = protoModule.writeVarInt(var907, var908, if self.has_emphasized_tile then 1 else 0)
		buff = var907
		var879 = var908
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var909, var910 = protoModule.writeTag(buff, var879, 15, protoModule.wireTypes.lengthDelimited)
		var909, var1566 = protoModule.writeString(var909, var910, self.tile_activation_mode)
		buff = var909
		var879 = var910
	end
	if self.initial_feed_visible_rows ~= nil then
		local var911, var912 = protoModule.writeTag(buff, var879, 16, protoModule.wireTypes.varint)
		var911, var1568 = protoModule.writeVarInt(var911, var912, self.initial_feed_visible_rows)
		buff = var911
		var879 = var912
	end
	if self.visible_rows_per_reveal ~= nil then
		local var913, var914 = protoModule.writeTag(buff, var879, 17, protoModule.wireTypes.varint)
		var913, var1570 = protoModule.writeVarInt(var913, var914, self.visible_rows_per_reveal)
		buff = var913
		var879 = var914
	end
	if self.sponsored_user_cohort ~= nil then
		local var915, var916 = protoModule.writeTag(buff, var879, 18, protoModule.wireTypes.lengthDelimited)
		var915, var1572 = protoModule.writeString(var915, var916, self.sponsored_user_cohort)
		buff = var915
		var879 = var916
	end
	if self.anchor_tag ~= nil then
		local var917, var918 = protoModule.writeTag(buff, var879, 19, protoModule.wireTypes.lengthDelimited)
		var917, var1574 = protoModule.writeString(var917, var918, self.anchor_tag)
		buff = var917
		var879 = var918
	end
	if self.collection_item_size ~= nil then
		local var919, var920 = protoModule.writeTag(buff, var879, 20, protoModule.wireTypes.lengthDelimited)
		var919, var1576 = protoModule.writeString(var919, var920, self.collection_item_size)
		buff = var919
		var879 = var920
	end
	local buff_1 = buffer.create(var879)
	buffer.copy(buff_1, 0, buff, 0, var879)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var921 = t_35.new()
	local var922 = 0
	while var922 < buffer.len(p35) do
		local _ = nil
		local var923 = nil
		local var924, var925, var926 = protoModule.readTag(p35, var922)
		local var927 = var924
		var923 = var925
		var922 = var926
		
		if var923 == protoModule.wireTypes.varint then
			if var927 == 5 then
				local _ = nil
				local var928, var929 = protoModule.readVarIntI32(p35, var922)
				var922 = var929
				var921.secondary_sort_id = var928
			elseif var927 == 6 then
				local _ = nil
				local var930, var931 = protoModule.readVarIntI32(p35, var922)
				var922 = var931
				var921.max_visible_rows = var930
			elseif var927 == 10 then
				local _ = nil
				local var932, var933 = protoModule.readVarInt(p35, var922)
				var922 = var933
				var921.is_placeholder = var932 ~= 0
			elseif var927 == 11 then
				local _ = nil
				local var934, var935 = protoModule.readVarIntI32(p35, var922)
				var922 = var935
				var921.primary_sort_id = var934
			elseif var927 == 14 then
				local _ = nil
				local var936, var937 = protoModule.readVarInt(p35, var922)
				var922 = var937
				var921.has_emphasized_tile = var936 ~= 0
			elseif var927 == 16 then
				local _ = nil
				local var938, var939 = protoModule.readVarIntI32(p35, var922)
				var922 = var939
				var921.initial_feed_visible_rows = var938
			elseif var927 == 17 then
				local _ = nil
				local var940, var941 = protoModule.readVarIntI32(p35, var922)
				var922 = var941
				var921.visible_rows_per_reveal = var940
			else
				local _ = nil
				local var942, var943 = protoModule.readVarInt(p35, var922)
				local _ = var942
				var922 = var943
			end
		end
		if var923 == protoModule.wireTypes.lengthDelimited then
			if var927 == 1 then
				local _ = nil
				local var944, var945 = protoModule.readBuffer(p35, var922)
				var922 = var945
				var921.title = buffer.tostring(var944)
			elseif var927 == 2 then
				local _ = nil
				local var946, var947 = protoModule.readBuffer(p35, var922)
				var922 = var947
				table.insert(var921.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var946))
			elseif var927 == 3 then
				local _ = nil
				local var948, var949 = protoModule.readBuffer(p35, var922)
				var922 = var949
				var921.next_page_token = buffer.tostring(var948)
			elseif var927 == 4 then
				local _ = nil
				local var950, var951 = protoModule.readBuffer(p35, var922)
				var922 = var951
				var921.sort_id = buffer.tostring(var950)
			elseif var927 == 7 then
				local _ = nil
				local var952, var953 = protoModule.readBuffer(p35, var922)
				var922 = var953
				var921.subtitle = buffer.tostring(var952)
			elseif var927 == 8 then
				local _ = nil
				local var954, var955 = protoModule.readBuffer(p35, var922)
				var922 = var955
				var921.info_text = buffer.tostring(var954)
			elseif var927 == 9 then
				local _ = nil
				local var956, var957 = protoModule.readBuffer(p35, var922)
				var922 = var957
				var921.subtitle_link_path = buffer.tostring(var956)
			elseif var927 == 12 then
				local _ = nil
				local var958, var959 = protoModule.readBuffer(p35, var922)
				var922 = var959
				var921.applied_filters = buffer.tostring(var958)
			elseif var927 == 13 then
				local _ = nil
				local var960, var961 = protoModule.readBuffer(p35, var922)
				var922 = var961
				var921.pool_id = buffer.tostring(var960)
			elseif var927 == 15 then
				local _ = nil
				local var962, var963 = protoModule.readBuffer(p35, var922)
				var922 = var963
				var921.tile_activation_mode = buffer.tostring(var962)
			elseif var927 == 18 then
				local _ = nil
				local var964, var965 = protoModule.readBuffer(p35, var922)
				var922 = var965
				var921.sponsored_user_cohort = buffer.tostring(var964)
			elseif var927 == 19 then
				local _ = nil
				local var966, var967 = protoModule.readBuffer(p35, var922)
				var922 = var967
				var921.anchor_tag = buffer.tostring(var966)
			elseif var927 == 20 then
				local _ = nil
				local var968, var969 = protoModule.readBuffer(p35, var922)
				var922 = var969
				var921.collection_item_size = buffer.tostring(var968)
			else
				local _ = nil
				local var970, var971 = protoModule.readVarInt(p35, var922)
				var922 = var971 + var970
			end
		elseif var923 == protoModule.wireTypes.i32 then
			local _ = nil
			local var972, var973 = protoModule.readFixed32(p35, var922)
			local _ = var972
			var922 = var973
		elseif var923 == protoModule.wireTypes.i64 then
			local _ = nil
			local var974, var975 = protoModule.readFixed64(p35, var922)
			local _ = var974
			var922 = var975
		else
			error("Unsupported wire type: " .. var1580)
		end
	end
	return var921
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
	return t
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), t (ref)
	local var976 = t_35.new()
	
	if self.title ~= nil then
		var976.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var976.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var976.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var976.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var976.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var976.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var976.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var976.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var976.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var976.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var976.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var976.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var976.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var976.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var976.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var976.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var976.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var976.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var976.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var976.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var976.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var976.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var976.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var976.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var976.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var976.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var976.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var976.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var976.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var976.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var976.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var976.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var976.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var976.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		var976.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var976.anchor_tag = self.anchorTag
	end
	if self.collection_item_size ~= nil then
		var976.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var976.collection_item_size = self.collectionItemSize
	end
	return var976
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
	local var977 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var978, var979 = protoModule.writeTag(buff, var977, 1, protoModule.wireTypes.lengthDelimited)
		var978, var1641 = protoModule.writeString(var978, var979, self.universe_id)
		buff = var978
		var977 = var979
	end
	if self.is_sponsored then
		local var980, var981 = protoModule.writeTag(buff, var977, 2, protoModule.wireTypes.varint)
		var980, var1643 = protoModule.writeVarInt(var980, var981, if self.is_sponsored then 1 else 0)
		buff = var980
		var977 = var981
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var982, var983 = protoModule.writeTag(buff, var977, 3, protoModule.wireTypes.lengthDelimited)
		var982, var1645 = protoModule.writeString(var982, var983, self.roblox_component)
		buff = var982
		var977 = var983
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var984, var985 = protoModule.writeTag(buff, var977, 4, protoModule.wireTypes.lengthDelimited)
		var984, var1647 = protoModule.writeString(var984, var985, self.native_ad_data)
		buff = var984
		var977 = var985
	end
	if self.is_content_locked then
		local var986, var987 = protoModule.writeTag(buff, var977, 5, protoModule.wireTypes.varint)
		var986, var1649 = protoModule.writeVarInt(var986, var987, if self.is_content_locked then 1 else 0)
		buff = var986
		var977 = var987
	end
	if self.title ~= nil and self.title ~= "" then
		local var988, var989 = protoModule.writeTag(buff, var977, 6, protoModule.wireTypes.lengthDelimited)
		var988, var1651 = protoModule.writeString(var988, var989, self.title)
		buff = var988
		var977 = var989
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var990, var991 = protoModule.writeTag(buff, var977, 7, protoModule.wireTypes.lengthDelimited)
		var990, var1653 = protoModule.writeString(var990, var991, self.subtitle)
		buff = var990
		var977 = var991
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var992, var993 = protoModule.writeTag(buff, var977, 8, protoModule.wireTypes.lengthDelimited)
		var992, var1655 = protoModule.writeString(var992, var993, self.image_asset_id)
		buff = var992
		var977 = var993
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var994, var995 = protoModule.writeTag(buff, var977, 9, protoModule.wireTypes.lengthDelimited)
		var994, var1657 = protoModule.writeString(var994, var995, self.video_asset_id)
		buff = var994
		var977 = var995
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var996, var997 = protoModule.writeTag(buff, var977, 10, protoModule.wireTypes.lengthDelimited)
		var996, var1659 = protoModule.writeString(var996, var997, self.badge_text)
		buff = var996
		var977 = var997
	end
	if self.player_count ~= nil then
		local var998, var999 = protoModule.writeTag(buff, var977, 11, protoModule.wireTypes.varint)
		var998, var1661 = protoModule.writeVarInt(var998, var999, self.player_count)
		buff = var998
		var977 = var999
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1000, var1001 = protoModule.writeTag(buff, var977, 12, protoModule.wireTypes.lengthDelimited)
		var1000, var1663 = protoModule.writeString(var1000, var1001, self.creator_key)
		buff = var1000
		var977 = var1001
	end
	if self.rank ~= nil then
		local var1002, var1003 = protoModule.writeTag(buff, var977, 13, protoModule.wireTypes.varint)
		var1002, var1665 = protoModule.writeVarInt(var1002, var1003, self.rank)
		buff = var1002
		var977 = var1003
	end
	if self.payer_name ~= nil then
		local var1004, var1005 = protoModule.writeTag(buff, var977, 14, protoModule.wireTypes.lengthDelimited)
		var1004, var1667 = protoModule.writeString(var1004, var1005, self.payer_name)
		buff = var1004
		var977 = var1005
	end
	if self.logo_asset_id ~= nil then
		local var1006, var1007 = protoModule.writeTag(buff, var977, 15, protoModule.wireTypes.lengthDelimited)
		var1006, var1669 = protoModule.writeString(var1006, var1007, self.logo_asset_id)
		buff = var1006
		var977 = var1007
	end
	if self.logo_aspect_ratio ~= nil then
		local var1008, var1009 = protoModule.writeTag(buff, var977, 16, protoModule.wireTypes.i64)
		var1008, var1671 = protoModule.writeDouble(var1008, var1009, self.logo_aspect_ratio)
		buff = var1008
		var977 = var1009
	end
	if self.place_id ~= nil then
		local var1010, var1011 = protoModule.writeTag(buff, var977, 17, protoModule.wireTypes.lengthDelimited)
		var1010, var1673 = protoModule.writeString(var1010, var1011, self.place_id)
		buff = var1010
		var977 = var1011
	end
	if self.launch_data ~= nil then
		local var1012, var1013 = protoModule.writeTag(buff, var977, 18, protoModule.wireTypes.lengthDelimited)
		var1012, var1675 = protoModule.writeString(var1012, var1013, self.launch_data)
		buff = var1012
		var977 = var1013
	end
	if self.tile_variant ~= nil then
		local var1014, var1015 = protoModule.writeTag(buff, var977, 19, protoModule.wireTypes.lengthDelimited)
		var1014, var1677 = protoModule.writeString(var1014, var1015, self.tile_variant)
		buff = var1014
		var977 = var1015
	end
	if self.cta_text ~= nil then
		local var1016, var1017 = protoModule.writeTag(buff, var977, 20, protoModule.wireTypes.lengthDelimited)
		var1016, var1679 = protoModule.writeString(var1016, var1017, self.cta_text)
		buff = var1016
		var977 = var1017
	end
	if self.badge_analytics_id ~= nil then
		local var1018, var1019 = protoModule.writeTag(buff, var977, 21, protoModule.wireTypes.lengthDelimited)
		var1018, var1681 = protoModule.writeString(var1018, var1019, self.badge_analytics_id)
		buff = var1018
		var977 = var1019
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1020 = v:encode()
			local var1021, var1022 = protoModule.writeTag(buff, var977, 22, protoModule.wireTypes.lengthDelimited)
			var1021, var1684 = protoModule.writeBuffer(var1021, var1022, var1020, buffer.len(var1020))
			buff = var1021
			var977 = var1022
		end
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var1023, var1024 = protoModule.writeTag(buff, var977, 23, protoModule.wireTypes.lengthDelimited)
		var1023, var1686 = protoModule.writeString(var1023, var1024, self.attribution_thumbnail_asset_id)
		buff = var1023
		var977 = var1024
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		for i, v in self.game_items_compact do
			local var1025 = v:encode()
			local var1026, var1027 = protoModule.writeTag(buff, var977, 24, protoModule.wireTypes.lengthDelimited)
			var1026, var1689 = protoModule.writeBuffer(var1026, var1027, var1025, buffer.len(var1025))
			buff = var1026
			var977 = var1027
		end
	end
	local buff_1 = buffer.create(var977)
	buffer.copy(buff_1, 0, buff, 0, var977)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1028 = t_36.new()
	local var1029 = 0
	while var1029 < buffer.len(p36) do
		local _ = nil
		local var1030 = nil
		local var1031, var1032, var1033 = protoModule.readTag(p36, var1029)
		local var1034 = var1031
		var1030 = var1032
		var1029 = var1033
		
		if var1030 == protoModule.wireTypes.varint then
			if var1034 == 2 then
				local _ = nil
				local var1035, var1036 = protoModule.readVarInt(p36, var1029)
				var1029 = var1036
				var1028.is_sponsored = var1035 ~= 0
			elseif var1034 == 5 then
				local _ = nil
				local var1037, var1038 = protoModule.readVarInt(p36, var1029)
				var1029 = var1038
				var1028.is_content_locked = var1037 ~= 0
			elseif var1034 == 11 then
				local _ = nil
				local var1039, var1040 = protoModule.readVarIntI64(p36, var1029)
				var1029 = var1040
				var1028.player_count = var1039
			elseif var1034 == 13 then
				local _ = nil
				local var1041, var1042 = protoModule.readVarIntI32(p36, var1029)
				var1029 = var1042
				var1028.rank = var1041
			else
				local _ = nil
				local var1043, var1044 = protoModule.readVarInt(p36, var1029)
				local _ = var1043
				var1029 = var1044
			end
		end
		if var1030 == protoModule.wireTypes.lengthDelimited then
			if var1034 == 1 then
				local _ = nil
				local var1045, var1046 = protoModule.readBuffer(p36, var1029)
				var1029 = var1046
				var1028.universe_id = buffer.tostring(var1045)
			elseif var1034 == 3 then
				local _ = nil
				local var1047, var1048 = protoModule.readBuffer(p36, var1029)
				var1029 = var1048
				var1028.roblox_component = buffer.tostring(var1047)
			elseif var1034 == 4 then
				local _ = nil
				local var1049, var1050 = protoModule.readBuffer(p36, var1029)
				var1029 = var1050
				var1028.native_ad_data = buffer.tostring(var1049)
			elseif var1034 == 6 then
				local _ = nil
				local var1051, var1052 = protoModule.readBuffer(p36, var1029)
				var1029 = var1052
				var1028.title = buffer.tostring(var1051)
			elseif var1034 == 7 then
				local _ = nil
				local var1053, var1054 = protoModule.readBuffer(p36, var1029)
				var1029 = var1054
				var1028.subtitle = buffer.tostring(var1053)
			elseif var1034 == 8 then
				local _ = nil
				local var1055, var1056 = protoModule.readBuffer(p36, var1029)
				var1029 = var1056
				var1028.image_asset_id = buffer.tostring(var1055)
			elseif var1034 == 9 then
				local _ = nil
				local var1057, var1058 = protoModule.readBuffer(p36, var1029)
				var1029 = var1058
				var1028.video_asset_id = buffer.tostring(var1057)
			elseif var1034 == 10 then
				local _ = nil
				local var1059, var1060 = protoModule.readBuffer(p36, var1029)
				var1029 = var1060
				var1028.badge_text = buffer.tostring(var1059)
			elseif var1034 == 12 then
				local _ = nil
				local var1061, var1062 = protoModule.readBuffer(p36, var1029)
				var1029 = var1062
				var1028.creator_key = buffer.tostring(var1061)
			elseif var1034 == 14 then
				local _ = nil
				local var1063, var1064 = protoModule.readBuffer(p36, var1029)
				var1029 = var1064
				var1028.payer_name = buffer.tostring(var1063)
			elseif var1034 == 15 then
				local _ = nil
				local var1065, var1066 = protoModule.readBuffer(p36, var1029)
				var1029 = var1066
				var1028.logo_asset_id = buffer.tostring(var1065)
			elseif var1034 == 17 then
				local _ = nil
				local var1067, var1068 = protoModule.readBuffer(p36, var1029)
				var1029 = var1068
				var1028.place_id = buffer.tostring(var1067)
			elseif var1034 == 18 then
				local _ = nil
				local var1069, var1070 = protoModule.readBuffer(p36, var1029)
				var1029 = var1070
				var1028.launch_data = buffer.tostring(var1069)
			elseif var1034 == 19 then
				local _ = nil
				local var1071, var1072 = protoModule.readBuffer(p36, var1029)
				var1029 = var1072
				var1028.tile_variant = buffer.tostring(var1071)
			elseif var1034 == 20 then
				local _ = nil
				local var1073, var1074 = protoModule.readBuffer(p36, var1029)
				var1029 = var1074
				var1028.cta_text = buffer.tostring(var1073)
			elseif var1034 == 21 then
				local _ = nil
				local var1075, var1076 = protoModule.readBuffer(p36, var1029)
				var1029 = var1076
				var1028.badge_analytics_id = buffer.tostring(var1075)
			elseif var1034 == 22 then
				local _ = nil
				local var1077, var1078 = protoModule.readBuffer(p36, var1029)
				var1029 = var1078
				table.insert(var1028.game_items, t.GameItemInputData.decode(var1077))
			elseif var1034 == 23 then
				local _ = nil
				local var1079, var1080 = protoModule.readBuffer(p36, var1029)
				var1029 = var1080
				var1028.attribution_thumbnail_asset_id = buffer.tostring(var1079)
			elseif var1034 == 24 then
				local _ = nil
				local var1081, var1082 = protoModule.readBuffer(p36, var1029)
				var1029 = var1082
				table.insert(var1028.game_items_compact, t.GameItemInputData.decode(var1081))
			else
				local _ = nil
				local var1083, var1084 = protoModule.readVarInt(p36, var1029)
				var1029 = var1084 + var1083
			end
		elseif var1030 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1085, var1086 = protoModule.readFixed32(p36, var1029)
			local _ = var1085
			var1029 = var1086
		elseif var1030 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1693)
		elseif var1034 == 16 then
			local _ = nil
			local var1087, var1088 = protoModule.readDouble(p36, var1029)
			var1029 = var1088
			var1028.logo_aspect_ratio = var1087
		else
			local _ = nil
			local var1089, var1090 = protoModule.readFixed64(p36, var1029)
			local _ = var1089
			var1029 = var1090
		end
	end
	return var1028
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
	local var1091 = t_36.new()
	
	if self.universe_id ~= nil then
		var1091.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1091.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1091.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1091.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1091.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1091.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1091.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1091.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1091.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1091.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1091.title = self.title
	end
	if self.subtitle ~= nil then
		var1091.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1091.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1091.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1091.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1091.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1091.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1091.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1091.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1091.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1091.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1091.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1091.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1091.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1091.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1091.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1091.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1091.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1091.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1091.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1091.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1091.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1091.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1091.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1091.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1091.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1091.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1091.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1091.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1091.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1091.game_items = t_1
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var1091.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var1091.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	if self.game_items_compact ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items_compact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1091.game_items_compact = t_1
	end
	if self.gameItemsCompact ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItemsCompact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1091.game_items_compact = t_1
	end
	return var1091
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
	local var1092 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1093, var1094 = protoModule.writeTag(buff, var1092, 1, protoModule.wireTypes.lengthDelimited)
		var1093, var1765 = protoModule.writeString(var1093, var1094, self.title)
		buff = var1093
		var1092 = var1094
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1095 = v:encode()
			local var1096, var1097 = protoModule.writeTag(buff, var1092, 2, protoModule.wireTypes.lengthDelimited)
			var1096, var1768 = protoModule.writeBuffer(var1096, var1097, var1095, buffer.len(var1095))
			buff = var1096
			var1092 = var1097
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1098, var1099 = protoModule.writeTag(buff, var1092, 3, protoModule.wireTypes.lengthDelimited)
		var1098, var1770 = protoModule.writeString(var1098, var1099, self.next_page_token)
		buff = var1098
		var1092 = var1099
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1100, var1101 = protoModule.writeTag(buff, var1092, 4, protoModule.wireTypes.lengthDelimited)
		var1100, var1772 = protoModule.writeString(var1100, var1101, self.sort_id)
		buff = var1100
		var1092 = var1101
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1102, var1103 = protoModule.writeTag(buff, var1092, 5, protoModule.wireTypes.varint)
		var1102, var1774 = protoModule.writeVarInt(var1102, var1103, self.secondary_sort_id)
		buff = var1102
		var1092 = var1103
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1104, var1105 = protoModule.writeTag(buff, var1092, 6, protoModule.wireTypes.lengthDelimited)
		var1104, var1776 = protoModule.writeString(var1104, var1105, self.subtitle)
		buff = var1104
		var1092 = var1105
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1106, var1107 = protoModule.writeTag(buff, var1092, 7, protoModule.wireTypes.lengthDelimited)
		var1106, var1778 = protoModule.writeString(var1106, var1107, self.info_text)
		buff = var1106
		var1092 = var1107
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1108, var1109 = protoModule.writeTag(buff, var1092, 8, protoModule.wireTypes.lengthDelimited)
		var1108, var1780 = protoModule.writeString(var1108, var1109, self.subtitle_link_path)
		buff = var1108
		var1092 = var1109
	end
	if self.is_placeholder ~= nil then
		local var1110, var1111 = protoModule.writeTag(buff, var1092, 9, protoModule.wireTypes.varint)
		var1110, var1782 = protoModule.writeVarInt(var1110, var1111, if self.is_placeholder then 1 else 0)
		buff = var1110
		var1092 = var1111
	end
	if self.primary_sort_id ~= nil then
		local var1112, var1113 = protoModule.writeTag(buff, var1092, 10, protoModule.wireTypes.varint)
		var1112, var1784 = protoModule.writeVarInt(var1112, var1113, self.primary_sort_id)
		buff = var1112
		var1092 = var1113
	end
	if self.applied_filters ~= nil then
		local var1114, var1115 = protoModule.writeTag(buff, var1092, 11, protoModule.wireTypes.lengthDelimited)
		var1114, var1786 = protoModule.writeString(var1114, var1115, self.applied_filters)
		buff = var1114
		var1092 = var1115
	end
	local buff_1 = buffer.create(var1092)
	buffer.copy(buff_1, 0, buff, 0, var1092)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1116 = t_37.new()
	local var1117 = 0
	while var1117 < buffer.len(p37) do
		local _ = nil
		local var1118 = nil
		local var1119, var1120, var1121 = protoModule.readTag(p37, var1117)
		local var1122 = var1119
		var1118 = var1120
		var1117 = var1121
		
		if var1118 == protoModule.wireTypes.varint then
			if var1122 == 5 then
				local _ = nil
				local var1123, var1124 = protoModule.readVarIntI32(p37, var1117)
				var1117 = var1124
				var1116.secondary_sort_id = var1123
			elseif var1122 == 9 then
				local _ = nil
				local var1125, var1126 = protoModule.readVarInt(p37, var1117)
				var1117 = var1126
				var1116.is_placeholder = var1125 ~= 0
			elseif var1122 == 10 then
				local _ = nil
				local var1127, var1128 = protoModule.readVarIntI32(p37, var1117)
				var1117 = var1128
				var1116.primary_sort_id = var1127
			else
				local _ = nil
				local var1129, var1130 = protoModule.readVarInt(p37, var1117)
				local _ = var1129
				var1117 = var1130
			end
		end
		if var1118 == protoModule.wireTypes.lengthDelimited then
			if var1122 == 1 then
				local _ = nil
				local var1131, var1132 = protoModule.readBuffer(p37, var1117)
				var1117 = var1132
				var1116.title = buffer.tostring(var1131)
			elseif var1122 == 2 then
				local _ = nil
				local var1133, var1134 = protoModule.readBuffer(p37, var1117)
				var1117 = var1134
				table.insert(var1116.song_items, t.SongCarouselInputData_SongItem.decode(var1133))
			elseif var1122 == 3 then
				local _ = nil
				local var1135, var1136 = protoModule.readBuffer(p37, var1117)
				var1117 = var1136
				var1116.next_page_token = buffer.tostring(var1135)
			elseif var1122 == 4 then
				local _ = nil
				local var1137, var1138 = protoModule.readBuffer(p37, var1117)
				var1117 = var1138
				var1116.sort_id = buffer.tostring(var1137)
			elseif var1122 == 6 then
				local _ = nil
				local var1139, var1140 = protoModule.readBuffer(p37, var1117)
				var1117 = var1140
				var1116.subtitle = buffer.tostring(var1139)
			elseif var1122 == 7 then
				local _ = nil
				local var1141, var1142 = protoModule.readBuffer(p37, var1117)
				var1117 = var1142
				var1116.info_text = buffer.tostring(var1141)
			elseif var1122 == 8 then
				local _ = nil
				local var1143, var1144 = protoModule.readBuffer(p37, var1117)
				var1117 = var1144
				var1116.subtitle_link_path = buffer.tostring(var1143)
			elseif var1122 == 11 then
				local _ = nil
				local var1145, var1146 = protoModule.readBuffer(p37, var1117)
				var1117 = var1146
				var1116.applied_filters = buffer.tostring(var1145)
			else
				local _ = nil
				local var1147, var1148 = protoModule.readVarInt(p37, var1117)
				var1117 = var1148 + var1147
			end
		elseif var1118 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1149, var1150 = protoModule.readFixed32(p37, var1117)
			local _ = var1149
			var1117 = var1150
		elseif var1118 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1151, var1152 = protoModule.readFixed64(p37, var1117)
			local _ = var1151
			var1117 = var1152
		else
			error("Unsupported wire type: " .. var1790)
		end
	end
	return var1116
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
	local var1153 = t_37.new()
	
	if self.title ~= nil then
		var1153.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1153.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1153.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1153.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1153.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1153.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1153.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1153.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1153.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1153.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1153.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1153.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1153.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1153.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1153.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1153.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1153.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1153.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1153.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1153.applied_filters = self.appliedFilters
	end
	return var1153
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
	local var1154 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1155, var1156 = protoModule.writeTag(buff, var1154, 1, protoModule.wireTypes.lengthDelimited)
		var1155, var1833 = protoModule.writeString(var1155, var1156, self.song_id)
		buff = var1155
		var1154 = var1156
	end
	local buff_1 = buffer.create(var1154)
	buffer.copy(buff_1, 0, buff, 0, var1154)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1154 = t_38.new()
	local var1155 = 0
	while var1155 < buffer.len(p38) do
		local _ = nil
		local var1156 = nil
		local var1157, var1158, var1159 = protoModule.readTag(p38, var1155)
		local var1160 = var1157
		var1156 = var1158
		var1155 = var1159
		
		if var1156 == protoModule.wireTypes.varint then
			local _ = nil
			local var1161, var1162 = protoModule.readVarInt(p38, var1155)
			local _ = var1161
			var1155 = var1162
			continue
		end
		if var1156 == protoModule.wireTypes.lengthDelimited then
			if var1160 == 1 then
				local _ = nil
				local var1163, var1164 = protoModule.readBuffer(p38, var1155)
				var1155 = var1164
				var1154.song_id = buffer.tostring(var1163)
			else
				local _ = nil
				local var1165, var1166 = protoModule.readVarInt(p38, var1155)
				var1155 = var1166 + var1165
			end
		elseif var1156 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1167, var1168 = protoModule.readFixed32(p38, var1155)
			local _ = var1167
			var1155 = var1168
		elseif var1156 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1169, var1170 = protoModule.readFixed64(p38, var1155)
			local _ = var1169
			var1155 = var1170
		else
			error("Unsupported wire type: " .. var1837)
		end
	end
	return var1154
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
	local var1171 = t_38.new()
	
	if self.song_id ~= nil then
		var1171.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1171.song_id = self.songId
	end
	return var1171
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
	local var1171 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1172, var1173 = protoModule.writeTag(buff, var1171, 1, protoModule.wireTypes.lengthDelimited)
		var1172, var1857 = protoModule.writeString(var1172, var1173, self.title)
		buff = var1172
		var1171 = var1173
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1174 = v:encode()
			local var1175, var1176 = protoModule.writeTag(buff, var1171, 2, protoModule.wireTypes.lengthDelimited)
			var1175, var1860 = protoModule.writeBuffer(var1175, var1176, var1174, buffer.len(var1174))
			buff = var1175
			var1171 = var1176
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1177, var1178 = protoModule.writeTag(buff, var1171, 3, protoModule.wireTypes.lengthDelimited)
		var1177, var1862 = protoModule.writeString(var1177, var1178, self.universe_id)
		buff = var1177
		var1171 = var1178
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1179, var1180 = protoModule.writeTag(buff, var1171, 4, protoModule.wireTypes.lengthDelimited)
		var1179, var1864 = protoModule.writeString(var1179, var1180, self.sort_id)
		buff = var1179
		var1171 = var1180
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1181, var1182 = protoModule.writeTag(buff, var1171, 5, protoModule.wireTypes.lengthDelimited)
		var1181, var1866 = protoModule.writeString(var1181, var1182, self.subtitle)
		buff = var1181
		var1171 = var1182
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1183, var1184 = protoModule.writeTag(buff, var1171, 6, protoModule.wireTypes.lengthDelimited)
		var1183, var1868 = protoModule.writeString(var1183, var1184, self.info_text)
		buff = var1183
		var1171 = var1184
	end
	local buff_1 = buffer.create(var1171)
	buffer.copy(buff_1, 0, buff, 0, var1171)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1185 = t_39.new()
	local var1186 = 0
	while var1186 < buffer.len(p39) do
		local _ = nil
		local var1187 = nil
		local var1188, var1189, var1190 = protoModule.readTag(p39, var1186)
		local var1191 = var1188
		var1187 = var1189
		var1186 = var1190
		
		if var1187 == protoModule.wireTypes.varint then
			local _ = nil
			local var1192, var1193 = protoModule.readVarInt(p39, var1186)
			local _ = var1192
			var1186 = var1193
			continue
		end
		if var1187 == protoModule.wireTypes.lengthDelimited then
			if var1191 == 1 then
				local _ = nil
				local var1194, var1195 = protoModule.readBuffer(p39, var1186)
				var1186 = var1195
				var1185.title = buffer.tostring(var1194)
			elseif var1191 == 2 then
				local _ = nil
				local var1196, var1197 = protoModule.readBuffer(p39, var1186)
				var1186 = var1197
				table.insert(var1185.event_items, t.EventsCarouselInputData_EventItem.decode(var1196))
			elseif var1191 == 3 then
				local _ = nil
				local var1198, var1199 = protoModule.readBuffer(p39, var1186)
				var1186 = var1199
				var1185.universe_id = buffer.tostring(var1198)
			elseif var1191 == 4 then
				local _ = nil
				local var1200, var1201 = protoModule.readBuffer(p39, var1186)
				var1186 = var1201
				var1185.sort_id = buffer.tostring(var1200)
			elseif var1191 == 5 then
				local _ = nil
				local var1202, var1203 = protoModule.readBuffer(p39, var1186)
				var1186 = var1203
				var1185.subtitle = buffer.tostring(var1202)
			elseif var1191 == 6 then
				local _ = nil
				local var1204, var1205 = protoModule.readBuffer(p39, var1186)
				var1186 = var1205
				var1185.info_text = buffer.tostring(var1204)
			else
				local _ = nil
				local var1206, var1207 = protoModule.readVarInt(p39, var1186)
				var1186 = var1207 + var1206
			end
		elseif var1187 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1208, var1209 = protoModule.readFixed32(p39, var1186)
			local _ = var1208
			var1186 = var1209
		elseif var1187 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1210, var1211 = protoModule.readFixed64(p39, var1186)
			local _ = var1210
			var1186 = var1211
		else
			error("Unsupported wire type: " .. var1872)
		end
	end
	return var1185
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
	local var1212 = t_39.new()
	
	if self.title ~= nil then
		var1212.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1212.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1212.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1212.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1212.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1212.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1212.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1212.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1212.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1212.info_text = self.infoText
	end
	return var1212
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
	local var1213 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1214, var1215 = protoModule.writeTag(buff, var1213, 1, protoModule.wireTypes.lengthDelimited)
		var1214, var1905 = protoModule.writeString(var1214, var1215, self.event_id)
		buff = var1214
		var1213 = var1215
	end
	local buff_1 = buffer.create(var1213)
	buffer.copy(buff_1, 0, buff, 0, var1213)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1213 = t_40.new()
	local var1214 = 0
	while var1214 < buffer.len(p40) do
		local _ = nil
		local var1215 = nil
		local var1216, var1217, var1218 = protoModule.readTag(p40, var1214)
		local var1219 = var1216
		var1215 = var1217
		var1214 = var1218
		
		if var1215 == protoModule.wireTypes.varint then
			local _ = nil
			local var1220, var1221 = protoModule.readVarInt(p40, var1214)
			local _ = var1220
			var1214 = var1221
			continue
		end
		if var1215 == protoModule.wireTypes.lengthDelimited then
			if var1219 == 1 then
				local _ = nil
				local var1222, var1223 = protoModule.readBuffer(p40, var1214)
				var1214 = var1223
				var1213.event_id = buffer.tostring(var1222)
			else
				local _ = nil
				local var1224, var1225 = protoModule.readVarInt(p40, var1214)
				var1214 = var1225 + var1224
			end
		elseif var1215 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1226, var1227 = protoModule.readFixed32(p40, var1214)
			local _ = var1226
			var1214 = var1227
		elseif var1215 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1228, var1229 = protoModule.readFixed64(p40, var1214)
			local _ = var1228
			var1214 = var1229
		else
			error("Unsupported wire type: " .. var1909)
		end
	end
	return var1213
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
	local var1230 = t_40.new()
	
	if self.event_id ~= nil then
		var1230.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1230.event_id = self.eventId
	end
	return var1230
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
	local var1230 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1231, var1232 = protoModule.writeTag(buff, var1230, 1, protoModule.wireTypes.lengthDelimited)
		var1231, var1929 = protoModule.writeString(var1231, var1232, self.universe_id)
		buff = var1231
		var1230 = var1232
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1233, var1234 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1233, var1931 = protoModule.writeString(var1233, var1234, i)
			local var1235 = v:encode()
			var1234, var1933 = protoModule.writeTag(var1233, var1234, 2, protoModule.wireTypes.lengthDelimited)
			var1234, var1933 = protoModule.writeBuffer(var1234, var1933, var1235, buffer.len(var1235))
			local var1236 = var1234
			local var1237 = var1933
			local var1238, var1239 = protoModule.writeTag(buff, var1230, 2, protoModule.wireTypes.lengthDelimited)
			var1238, var1937 = protoModule.writeBuffer(var1238, var1239, var1236, var1237)
			buff = var1238
			var1230 = var1239
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1240, var1241 = protoModule.writeTag(buff, var1230, 3, protoModule.wireTypes.lengthDelimited)
			var1240, var1939 = protoModule.writeString(var1240, var1241, v)
			buff = var1240
			var1230 = var1241
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1242, var1243 = protoModule.writeTag(buff, var1230, 4, protoModule.wireTypes.lengthDelimited)
		var1242, var1941 = protoModule.writeString(var1242, var1243, self.creator_key)
		buff = var1242
		var1230 = var1243
	end
	if self.pill_tabs ~= nil then
		local var1244 = self.pill_tabs:encode()
		local var1245, var1246 = protoModule.writeTag(buff, var1230, 5, protoModule.wireTypes.lengthDelimited)
		var1245, var1944 = protoModule.writeBuffer(var1245, var1246, var1244, buffer.len(var1244))
		buff = var1245
		var1230 = var1246
	end
	local buff_1 = buffer.create(var1230)
	buffer.copy(buff_1, 0, buff, 0, var1230)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1247 = t_41.new()
	local var1248 = 0
	while var1248 < buffer.len(p41) do
		local _ = nil
		local var1249 = nil
		local var1250, var1251, var1252 = protoModule.readTag(p41, var1248)
		local var1253 = var1250
		var1249 = var1251
		var1248 = var1252
		
		if var1249 == protoModule.wireTypes.varint then
			local _ = nil
			local var1254, var1255 = protoModule.readVarInt(p41, var1248)
			local _ = var1254
			var1248 = var1255
			continue
		end
		if var1249 == protoModule.wireTypes.lengthDelimited then
			if var1253 == 1 then
				local _ = nil
				local var1256, var1257 = protoModule.readBuffer(p41, var1248)
				var1248 = var1257
				var1247.universe_id = buffer.tostring(var1256)
			elseif var1253 == 2 then
				local _ = nil
				local var1258, var1259 = protoModule.readBuffer(p41, var1248)
				var1248 = var1259
				var1258 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1258)
				var1247.entry_map[var1258.key or ""] = var1258.value or t.FeedEntry.new()
			elseif var1253 == 3 then
				local _ = nil
				local var1260, var1261 = protoModule.readBuffer(p41, var1248)
				var1248 = var1261
				table.insert(var1247.entry_order, buffer.tostring(var1260))
			elseif var1253 == 4 then
				local _ = nil
				local var1262, var1263 = protoModule.readBuffer(p41, var1248)
				var1248 = var1263
				var1247.creator_key = buffer.tostring(var1262)
			elseif var1253 == 5 then
				local _ = nil
				local var1264, var1265 = protoModule.readBuffer(p41, var1248)
				var1248 = var1265
				var1247.pill_tabs = t.PillTabsInputData.decode(var1264)
			else
				local _ = nil
				local var1266, var1267 = protoModule.readVarInt(p41, var1248)
				var1248 = var1267 + var1266
			end
		elseif var1249 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1268, var1269 = protoModule.readFixed32(p41, var1248)
			local _ = var1268
			var1248 = var1269
		elseif var1249 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1270, var1271 = protoModule.readFixed64(p41, var1248)
			local _ = var1270
			var1248 = var1271
		else
			error("Unsupported wire type: " .. var1948)
		end
	end
	return var1247
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
	local var1272 = t_41.new()
	
	if self.universe_id ~= nil then
		var1272.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1272.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1272.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1272.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1272.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1272.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1272.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1272.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1272.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1272.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1272
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
	local var1273 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1274, var1275 = protoModule.writeTag(buff, var1273, 1, protoModule.wireTypes.lengthDelimited)
		var1274, var1982 = protoModule.writeString(var1274, var1275, self.key)
		buff = var1274
		var1273 = var1275
	end
	if self.value ~= nil then
		local var1276 = self.value:encode()
		local var1277, var1278 = protoModule.writeTag(buff, var1273, 2, protoModule.wireTypes.lengthDelimited)
		var1277, var1985 = protoModule.writeBuffer(var1277, var1278, var1276, buffer.len(var1276))
		buff = var1277
		var1273 = var1278
	end
	local buff_1 = buffer.create(var1273)
	buffer.copy(buff_1, 0, buff, 0, var1273)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1273 = t_42.new()
	local var1274 = 0
	while var1274 < buffer.len(p42) do
		local _ = nil
		local var1275 = nil
		local var1276, var1277, var1278 = protoModule.readTag(p42, var1274)
		local var1279 = var1276
		var1275 = var1277
		var1274 = var1278
		
		if var1275 == protoModule.wireTypes.varint then
			local _ = nil
			local var1280, var1281 = protoModule.readVarInt(p42, var1274)
			local _ = var1280
			var1274 = var1281
			continue
		end
		if var1275 == protoModule.wireTypes.lengthDelimited then
			if var1279 == 1 then
				local _ = nil
				local var1282, var1283 = protoModule.readBuffer(p42, var1274)
				var1274 = var1283
				var1273.key = buffer.tostring(var1282)
			elseif var1279 == 2 then
				local _ = nil
				local var1284, var1285 = protoModule.readBuffer(p42, var1274)
				var1274 = var1285
				var1273.value = t.FeedEntry.decode(var1284)
			else
				local _ = nil
				local var1286, var1287 = protoModule.readVarInt(p42, var1274)
				var1274 = var1287 + var1286
			end
		elseif var1275 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1288, var1289 = protoModule.readFixed32(p42, var1274)
			local _ = var1288
			var1274 = var1289
		elseif var1275 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1290, var1291 = protoModule.readFixed64(p42, var1274)
			local _ = var1290
			var1274 = var1291
		else
			error("Unsupported wire type: " .. var1989)
		end
	end
	return var1273
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
	local var1292 = t_42.new()
	
	if self.key ~= nil then
		var1292.key = self.key
	end
	if self.value ~= nil then
		var1292.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1292
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
	local var1292 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1293 = v:encode()
			local var1294, var1295 = protoModule.writeTag(buff, var1292, 1, protoModule.wireTypes.lengthDelimited)
			var1294, var2012 = protoModule.writeBuffer(var1294, var1295, var1293, buffer.len(var1293))
			buff = var1294
			var1292 = var1295
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1296, var1297 = protoModule.writeTag(buff, var1292, 2, protoModule.wireTypes.lengthDelimited)
		var1296, var2014 = protoModule.writeString(var1296, var1297, self.default_option_id)
		buff = var1296
		var1292 = var1297
	end
	local buff_1 = buffer.create(var1292)
	buffer.copy(buff_1, 0, buff, 0, var1292)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1298 = t_43.new()
	local var1299 = 0
	while var1299 < buffer.len(p43) do
		local _ = nil
		local var1300 = nil
		local var1301, var1302, var1303 = protoModule.readTag(p43, var1299)
		local var1304 = var1301
		var1300 = var1302
		var1299 = var1303
		
		if var1300 == protoModule.wireTypes.varint then
			local _ = nil
			local var1305, var1306 = protoModule.readVarInt(p43, var1299)
			local _ = var1305
			var1299 = var1306
			continue
		end
		if var1300 == protoModule.wireTypes.lengthDelimited then
			if var1304 == 1 then
				local _ = nil
				local var1307, var1308 = protoModule.readBuffer(p43, var1299)
				var1299 = var1308
				table.insert(var1298.options, t.PillTabsInputData_PillTabOption.decode(var1307))
			elseif var1304 == 2 then
				local _ = nil
				local var1309, var1310 = protoModule.readBuffer(p43, var1299)
				var1299 = var1310
				var1298.default_option_id = buffer.tostring(var1309)
			else
				local _ = nil
				local var1311, var1312 = protoModule.readVarInt(p43, var1299)
				var1299 = var1312 + var1311
			end
		elseif var1300 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1313, var1314 = protoModule.readFixed32(p43, var1299)
			local _ = var1313
			var1299 = var1314
		elseif var1300 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1315, var1316 = protoModule.readFixed64(p43, var1299)
			local _ = var1315
			var1299 = var1316
		else
			error("Unsupported wire type: " .. var2018)
		end
	end
	return var1298
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
	local var1317 = t_43.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1317.options = t_1
	end
	if self.default_option_id ~= nil then
		var1317.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1317.default_option_id = self.defaultOptionId
	end
	return var1317
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
	local var1318 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1319, var1320 = protoModule.writeTag(buff, var1318, 1, protoModule.wireTypes.lengthDelimited)
		var1319, var2042 = protoModule.writeString(var1319, var1320, self.option_id)
		buff = var1319
		var1318 = var1320
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1321, var1322 = protoModule.writeTag(buff, var1318, 2, protoModule.wireTypes.lengthDelimited)
		var1321, var2044 = protoModule.writeString(var1321, var1322, self.display_name)
		buff = var1321
		var1318 = var1322
	end
	local buff_1 = buffer.create(var1318)
	buffer.copy(buff_1, 0, buff, 0, var1318)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1318 = t_44.new()
	local var1319 = 0
	while var1319 < buffer.len(p44) do
		local _ = nil
		local var1320 = nil
		local var1321, var1322, var1323 = protoModule.readTag(p44, var1319)
		local var1324 = var1321
		var1320 = var1322
		var1319 = var1323
		
		if var1320 == protoModule.wireTypes.varint then
			local _ = nil
			local var1325, var1326 = protoModule.readVarInt(p44, var1319)
			local _ = var1325
			var1319 = var1326
			continue
		end
		if var1320 == protoModule.wireTypes.lengthDelimited then
			if var1324 == 1 then
				local _ = nil
				local var1327, var1328 = protoModule.readBuffer(p44, var1319)
				var1319 = var1328
				var1318.option_id = buffer.tostring(var1327)
			elseif var1324 == 2 then
				local _ = nil
				local var1329, var1330 = protoModule.readBuffer(p44, var1319)
				var1319 = var1330
				var1318.display_name = buffer.tostring(var1329)
			else
				local _ = nil
				local var1331, var1332 = protoModule.readVarInt(p44, var1319)
				var1319 = var1332 + var1331
			end
		elseif var1320 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1333, var1334 = protoModule.readFixed32(p44, var1319)
			local _ = var1333
			var1319 = var1334
		elseif var1320 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1335, var1336 = protoModule.readFixed64(p44, var1319)
			local _ = var1335
			var1319 = var1336
		else
			error("Unsupported wire type: " .. var2048)
		end
	end
	return var1318
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
	local var1337 = t_44.new()
	
	if self.option_id ~= nil then
		var1337.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1337.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1337.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1337.display_name = self.displayName
	end
	return var1337
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
	local var1337 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1338 = v:encode()
			local var1339, var1340 = protoModule.writeTag(buff, var1337, 1, protoModule.wireTypes.lengthDelimited)
			var1339, var2071 = protoModule.writeBuffer(var1339, var1340, var1338, buffer.len(var1338))
			buff = var1339
			var1337 = var1340
		end
	end
	local buff_1 = buffer.create(var1337)
	buffer.copy(buff_1, 0, buff, 0, var1337)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1341 = t_45.new()
	local var1342 = 0
	while var1342 < buffer.len(p45) do
		local _ = nil
		local var1343 = nil
		local var1344, var1345, var1346 = protoModule.readTag(p45, var1342)
		local var1347 = var1344
		var1343 = var1345
		var1342 = var1346
		
		if var1343 == protoModule.wireTypes.varint then
			local _ = nil
			local var1348, var1349 = protoModule.readVarInt(p45, var1342)
			local _ = var1348
			var1342 = var1349
			continue
		end
		if var1343 == protoModule.wireTypes.lengthDelimited then
			if var1347 == 1 then
				local _ = nil
				local var1350, var1351 = protoModule.readBuffer(p45, var1342)
				var1342 = var1351
				table.insert(var1341.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1350))
			else
				local _ = nil
				local var1352, var1353 = protoModule.readVarInt(p45, var1342)
				var1342 = var1353 + var1352
			end
		elseif var1343 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1354, var1355 = protoModule.readFixed32(p45, var1342)
			local _ = var1354
			var1342 = var1355
		elseif var1343 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1356, var1357 = protoModule.readFixed64(p45, var1342)
			local _ = var1356
			var1342 = var1357
		else
			error("Unsupported wire type: " .. var2075)
		end
	end
	return var1341
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
	local var1358 = t_45.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1358.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1358.game_passes = t_1
	end
	return var1358
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
	local var1359 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1360, var1361 = protoModule.writeTag(buff, var1359, 1, protoModule.wireTypes.lengthDelimited)
		var1360, var2098 = protoModule.writeString(var1360, var1361, self.game_pass_id)
		buff = var1360
		var1359 = var1361
	end
	local buff_1 = buffer.create(var1359)
	buffer.copy(buff_1, 0, buff, 0, var1359)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1359 = t_46.new()
	local var1360 = 0
	while var1360 < buffer.len(p46) do
		local _ = nil
		local var1361 = nil
		local var1362, var1363, var1364 = protoModule.readTag(p46, var1360)
		local var1365 = var1362
		var1361 = var1363
		var1360 = var1364
		
		if var1361 == protoModule.wireTypes.varint then
			local _ = nil
			local var1366, var1367 = protoModule.readVarInt(p46, var1360)
			local _ = var1366
			var1360 = var1367
			continue
		end
		if var1361 == protoModule.wireTypes.lengthDelimited then
			if var1365 == 1 then
				local _ = nil
				local var1368, var1369 = protoModule.readBuffer(p46, var1360)
				var1360 = var1369
				var1359.game_pass_id = buffer.tostring(var1368)
			else
				local _ = nil
				local var1370, var1371 = protoModule.readVarInt(p46, var1360)
				var1360 = var1371 + var1370
			end
		elseif var1361 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1372, var1373 = protoModule.readFixed32(p46, var1360)
			local _ = var1372
			var1360 = var1373
		elseif var1361 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1374, var1375 = protoModule.readFixed64(p46, var1360)
			local _ = var1374
			var1360 = var1375
		else
			error("Unsupported wire type: " .. var2102)
		end
	end
	return var1359
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
	local var1376 = t_46.new()
	
	if self.game_pass_id ~= nil then
		var1376.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1376.game_pass_id = self.gamePassId
	end
	return var1376
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
	local var1376 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1377 = v:encode()
			local var1378, var1379 = protoModule.writeTag(buff, var1376, 1, protoModule.wireTypes.lengthDelimited)
			var1378, var2123 = protoModule.writeBuffer(var1378, var1379, var1377, buffer.len(var1377))
			buff = var1378
			var1376 = var1379
		end
	end
	local buff_1 = buffer.create(var1376)
	buffer.copy(buff_1, 0, buff, 0, var1376)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1380 = t_47.new()
	local var1381 = 0
	while var1381 < buffer.len(p47) do
		local _ = nil
		local var1382 = nil
		local var1383, var1384, var1385 = protoModule.readTag(p47, var1381)
		local var1386 = var1383
		var1382 = var1384
		var1381 = var1385
		
		if var1382 == protoModule.wireTypes.varint then
			local _ = nil
			local var1387, var1388 = protoModule.readVarInt(p47, var1381)
			local _ = var1387
			var1381 = var1388
			continue
		end
		if var1382 == protoModule.wireTypes.lengthDelimited then
			if var1386 == 1 then
				local _ = nil
				local var1389, var1390 = protoModule.readBuffer(p47, var1381)
				var1381 = var1390
				table.insert(var1380.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1389))
			else
				local _ = nil
				local var1391, var1392 = protoModule.readVarInt(p47, var1381)
				var1381 = var1392 + var1391
			end
		elseif var1382 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1393, var1394 = protoModule.readFixed32(p47, var1381)
			local _ = var1393
			var1381 = var1394
		elseif var1382 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1395, var1396 = protoModule.readFixed64(p47, var1381)
			local _ = var1395
			var1381 = var1396
		else
			error("Unsupported wire type: " .. var2127)
		end
	end
	return var1380
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
	local var1397 = t_47.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1397.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1397.developer_products = t_1
	end
	return var1397
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
	local var1398 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1399, var1400 = protoModule.writeTag(buff, var1398, 1, protoModule.wireTypes.lengthDelimited)
		var1399, var2150 = protoModule.writeString(var1399, var1400, self.developer_product_id)
		buff = var1399
		var1398 = var1400
	end
	local buff_1 = buffer.create(var1398)
	buffer.copy(buff_1, 0, buff, 0, var1398)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1398 = t_48.new()
	local var1399 = 0
	while var1399 < buffer.len(p48) do
		local _ = nil
		local var1400 = nil
		local var1401, var1402, var1403 = protoModule.readTag(p48, var1399)
		local var1404 = var1401
		var1400 = var1402
		var1399 = var1403
		
		if var1400 == protoModule.wireTypes.varint then
			local _ = nil
			local var1405, var1406 = protoModule.readVarInt(p48, var1399)
			local _ = var1405
			var1399 = var1406
			continue
		end
		if var1400 == protoModule.wireTypes.lengthDelimited then
			if var1404 == 1 then
				local _ = nil
				local var1407, var1408 = protoModule.readBuffer(p48, var1399)
				var1399 = var1408
				var1398.developer_product_id = buffer.tostring(var1407)
			else
				local _ = nil
				local var1409, var1410 = protoModule.readVarInt(p48, var1399)
				var1399 = var1410 + var1409
			end
		elseif var1400 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1411, var1412 = protoModule.readFixed32(p48, var1399)
			local _ = var1411
			var1399 = var1412
		elseif var1400 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1413, var1414 = protoModule.readFixed64(p48, var1399)
			local _ = var1413
			var1399 = var1414
		else
			error("Unsupported wire type: " .. var2154)
		end
	end
	return var1398
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
	local var1415 = t_48.new()
	
	if self.developer_product_id ~= nil then
		var1415.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1415.developer_product_id = self.developerProductId
	end
	return var1415
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
	local var1415 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1416 = v:encode()
			local var1417, var1418 = protoModule.writeTag(buff, var1415, 1, protoModule.wireTypes.lengthDelimited)
			var1417, var2175 = protoModule.writeBuffer(var1417, var1418, var1416, buffer.len(var1416))
			buff = var1417
			var1415 = var1418
		end
	end
	local buff_1 = buffer.create(var1415)
	buffer.copy(buff_1, 0, buff, 0, var1415)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1419 = t_49.new()
	local var1420 = 0
	while var1420 < buffer.len(p49) do
		local _ = nil
		local var1421 = nil
		local var1422, var1423, var1424 = protoModule.readTag(p49, var1420)
		local var1425 = var1422
		var1421 = var1423
		var1420 = var1424
		
		if var1421 == protoModule.wireTypes.varint then
			local _ = nil
			local var1426, var1427 = protoModule.readVarInt(p49, var1420)
			local _ = var1426
			var1420 = var1427
			continue
		end
		if var1421 == protoModule.wireTypes.lengthDelimited then
			if var1425 == 1 then
				local _ = nil
				local var1428, var1429 = protoModule.readBuffer(p49, var1420)
				var1420 = var1429
				table.insert(var1419.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1428))
			else
				local _ = nil
				local var1430, var1431 = protoModule.readVarInt(p49, var1420)
				var1420 = var1431 + var1430
			end
		elseif var1421 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1432, var1433 = protoModule.readFixed32(p49, var1420)
			local _ = var1432
			var1420 = var1433
		elseif var1421 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1434, var1435 = protoModule.readFixed64(p49, var1420)
			local _ = var1434
			var1420 = var1435
		else
			error("Unsupported wire type: " .. var2179)
		end
	end
	return var1419
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
	local var1436 = t_49.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1436.subscriptions = t_1
	end
	return var1436
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
	local var1437 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1438, var1439 = protoModule.writeTag(buff, var1437, 1, protoModule.wireTypes.lengthDelimited)
		var1438, var2201 = protoModule.writeString(var1438, var1439, self.subscription_id)
		buff = var1438
		var1437 = var1439
	end
	local buff_1 = buffer.create(var1437)
	buffer.copy(buff_1, 0, buff, 0, var1437)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref)
	local var1437 = t_50.new()
	local var1438 = 0
	while var1438 < buffer.len(p50) do
		local _ = nil
		local var1439 = nil
		local var1440, var1441, var1442 = protoModule.readTag(p50, var1438)
		local var1443 = var1440
		var1439 = var1441
		var1438 = var1442
		
		if var1439 == protoModule.wireTypes.varint then
			local _ = nil
			local var1444, var1445 = protoModule.readVarInt(p50, var1438)
			local _ = var1444
			var1438 = var1445
			continue
		end
		if var1439 == protoModule.wireTypes.lengthDelimited then
			if var1443 == 1 then
				local _ = nil
				local var1446, var1447 = protoModule.readBuffer(p50, var1438)
				var1438 = var1447
				var1437.subscription_id = buffer.tostring(var1446)
			else
				local _ = nil
				local var1448, var1449 = protoModule.readVarInt(p50, var1438)
				var1438 = var1449 + var1448
			end
		elseif var1439 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1450, var1451 = protoModule.readFixed32(p50, var1438)
			local _ = var1450
			var1438 = var1451
		elseif var1439 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1452, var1453 = protoModule.readFixed64(p50, var1438)
			local _ = var1452
			var1438 = var1453
		else
			error("Unsupported wire type: " .. var2205)
		end
	end
	return var1437
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
	local var1454 = t_50.new()
	
	if self.subscription_id ~= nil then
		var1454.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1454.subscription_id = self.subscriptionId
	end
	return var1454
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
	local var1454 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1455 = v:encode()
			local var1456, var1457 = protoModule.writeTag(buff, var1454, 1, protoModule.wireTypes.lengthDelimited)
			var1456, var2226 = protoModule.writeBuffer(var1456, var1457, var1455, buffer.len(var1455))
			buff = var1456
			var1454 = var1457
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1458, var1459 = protoModule.writeTag(buff, var1454, 2, protoModule.wireTypes.lengthDelimited)
		var1458, var2228 = protoModule.writeString(var1458, var1459, self.universe_id)
		buff = var1458
		var1454 = var1459
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1460, var1461 = protoModule.writeTag(buff, var1454, 3, protoModule.wireTypes.lengthDelimited)
		var1460, var2230 = protoModule.writeString(var1460, var1461, self.section_title)
		buff = var1460
		var1454 = var1461
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1462, var1463 = protoModule.writeTag(buff, var1454, 4, protoModule.wireTypes.lengthDelimited)
		var1462, var2232 = protoModule.writeString(var1462, var1463, self.creator_key)
		buff = var1462
		var1454 = var1463
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1464, var1465 = protoModule.writeTag(buff, var1454, 5, protoModule.wireTypes.lengthDelimited)
		var1464, var2234 = protoModule.writeString(var1464, var1465, self.collection_item_size)
		buff = var1464
		var1454 = var1465
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1466, var1467 = protoModule.writeTag(buff, var1454, 6, protoModule.wireTypes.lengthDelimited)
		var1466, var2236 = protoModule.writeString(var1466, var1467, self.item_height_mode)
		buff = var1466
		var1454 = var1467
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1468, var1469 = protoModule.writeTag(buff, var1454, 7, protoModule.wireTypes.lengthDelimited)
		var1468, var2238 = protoModule.writeString(var1468, var1469, self.experience_store_product_type)
		buff = var1468
		var1454 = var1469
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1470, var1471 = protoModule.writeTag(buff, var1454, 8, protoModule.wireTypes.lengthDelimited)
		var1470, var2240 = protoModule.writeString(var1470, var1471, self.content_type)
		buff = var1470
		var1454 = var1471
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1472, var1473 = protoModule.writeTag(buff, var1454, 9, protoModule.wireTypes.lengthDelimited)
		var1472, var2242 = protoModule.writeString(var1472, var1473, self.item_type)
		buff = var1472
		var1454 = var1473
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1474, var1475 = protoModule.writeTag(buff, var1454, 10, protoModule.wireTypes.lengthDelimited)
		var1474, var2244 = protoModule.writeString(var1474, var1475, self.filter_category_id)
		buff = var1474
		var1454 = var1475
	end
	local buff_1 = buffer.create(var1454)
	buffer.copy(buff_1, 0, buff, 0, var1454)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1476 = t_51.new()
	local var1477 = 0
	while var1477 < buffer.len(p51) do
		local _ = nil
		local var1478 = nil
		local var1479, var1480, var1481 = protoModule.readTag(p51, var1477)
		local var1482 = var1479
		var1478 = var1480
		var1477 = var1481
		
		if var1478 == protoModule.wireTypes.varint then
			local _ = nil
			local var1483, var1484 = protoModule.readVarInt(p51, var1477)
			local _ = var1483
			var1477 = var1484
			continue
		end
		if var1478 == protoModule.wireTypes.lengthDelimited then
			if var1482 == 1 then
				local _ = nil
				local var1485, var1486 = protoModule.readBuffer(p51, var1477)
				var1477 = var1486
				table.insert(var1476.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1485))
			elseif var1482 == 2 then
				local _ = nil
				local var1487, var1488 = protoModule.readBuffer(p51, var1477)
				var1477 = var1488
				var1476.universe_id = buffer.tostring(var1487)
			elseif var1482 == 3 then
				local _ = nil
				local var1489, var1490 = protoModule.readBuffer(p51, var1477)
				var1477 = var1490
				var1476.section_title = buffer.tostring(var1489)
			elseif var1482 == 4 then
				local _ = nil
				local var1491, var1492 = protoModule.readBuffer(p51, var1477)
				var1477 = var1492
				var1476.creator_key = buffer.tostring(var1491)
			elseif var1482 == 5 then
				local _ = nil
				local var1493, var1494 = protoModule.readBuffer(p51, var1477)
				var1477 = var1494
				var1476.collection_item_size = buffer.tostring(var1493)
			elseif var1482 == 6 then
				local _ = nil
				local var1495, var1496 = protoModule.readBuffer(p51, var1477)
				var1477 = var1496
				var1476.item_height_mode = buffer.tostring(var1495)
			elseif var1482 == 7 then
				local _ = nil
				local var1497, var1498 = protoModule.readBuffer(p51, var1477)
				var1477 = var1498
				var1476.experience_store_product_type = buffer.tostring(var1497)
			elseif var1482 == 8 then
				local _ = nil
				local var1499, var1500 = protoModule.readBuffer(p51, var1477)
				var1477 = var1500
				var1476.content_type = buffer.tostring(var1499)
			elseif var1482 == 9 then
				local _ = nil
				local var1501, var1502 = protoModule.readBuffer(p51, var1477)
				var1477 = var1502
				var1476.item_type = buffer.tostring(var1501)
			elseif var1482 == 10 then
				local _ = nil
				local var1503, var1504 = protoModule.readBuffer(p51, var1477)
				var1477 = var1504
				var1476.filter_category_id = buffer.tostring(var1503)
			else
				local _ = nil
				local var1505, var1506 = protoModule.readVarInt(p51, var1477)
				var1477 = var1506 + var1505
			end
		elseif var1478 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1507, var1508 = protoModule.readFixed32(p51, var1477)
			local _ = var1507
			var1477 = var1508
		elseif var1478 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1509, var1510 = protoModule.readFixed64(p51, var1477)
			local _ = var1509
			var1477 = var1510
		else
			error("Unsupported wire type: " .. var2248)
		end
	end
	return var1476
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
	local var1511 = t_51.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1511.items = t_1
	end
	if self.universe_id ~= nil then
		var1511.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1511.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1511.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1511.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1511.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1511.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1511.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1511.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1511.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1511.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1511.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1511.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1511.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1511.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1511.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1511.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1511.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1511.filter_category_id = self.filterCategoryId
	end
	return var1511
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
	local var1512 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1513, var1514 = protoModule.writeTag(buff, var1512, 1, protoModule.wireTypes.lengthDelimited)
		var1513, var2288 = protoModule.writeString(var1513, var1514, self.item_id)
		buff = var1513
		var1512 = var1514
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1515, var1516 = protoModule.writeTag(buff, var1512, 2, protoModule.wireTypes.varint)
		var1515, var2290 = protoModule.writeVarInt(var1515, var1516, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1515
		var1512 = var1516
	end
	local buff_1 = buffer.create(var1512)
	buffer.copy(buff_1, 0, buff, 0, var1512)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1512 = t_52.new()
	local var1513 = 0
	while var1513 < buffer.len(p52) do
		local _ = nil
		local var1514 = nil
		local var1515, var1516, var1517 = protoModule.readTag(p52, var1513)
		local var1518 = var1515
		var1514 = var1516
		var1513 = var1517
		
		if var1514 == protoModule.wireTypes.varint then
			if var1518 == 2 then
				local _ = nil
				local var1519, var1520 = protoModule.readVarIntI32(p52, var1513)
				local var1521 = var1519
				var1513 = var1520
				var1512.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1521) or var1521
			else
				local _ = nil
				local var1522, var1523 = protoModule.readVarInt(p52, var1513)
				local _ = var1522
				var1513 = var1523
			end
		end
		if var1514 == protoModule.wireTypes.lengthDelimited then
			if var1518 == 1 then
				local _ = nil
				local var1524, var1525 = protoModule.readBuffer(p52, var1513)
				var1513 = var1525
				var1512.item_id = buffer.tostring(var1524)
			else
				local _ = nil
				local var1526, var1527 = protoModule.readVarInt(p52, var1513)
				var1513 = var1527 + var1526
			end
		elseif var1514 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1528, var1529 = protoModule.readFixed32(p52, var1513)
			local _ = var1528
			var1513 = var1529
		elseif var1514 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1530, var1531 = protoModule.readFixed64(p52, var1513)
			local _ = var1530
			var1513 = var1531
		else
			error("Unsupported wire type: " .. var2294)
		end
	end
	return var1512
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
	local var1532 = t_52.new()
	
	if self.item_id ~= nil then
		var1532.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1532.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1532.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1532
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
	local var1532 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1533, var1534 = protoModule.writeTag(buff, var1532, 1, protoModule.wireTypes.lengthDelimited)
		var1533, var2317 = protoModule.writeString(var1533, var1534, self.roblox_component)
		buff = var1533
		var1532 = var1534
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1535, var1536 = protoModule.writeTag(buff, var1532, 2, protoModule.wireTypes.lengthDelimited)
		var1535, var2319 = protoModule.writeString(var1535, var1536, self.identifier)
		buff = var1535
		var1532 = var1536
	end
	if self.title ~= nil and self.title ~= "" then
		local var1537, var1538 = protoModule.writeTag(buff, var1532, 3, protoModule.wireTypes.lengthDelimited)
		var1537, var2321 = protoModule.writeString(var1537, var1538, self.title)
		buff = var1537
		var1532 = var1538
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1539, var1540 = protoModule.writeTag(buff, var1532, 4, protoModule.wireTypes.lengthDelimited)
		var1539, var2323 = protoModule.writeString(var1539, var1540, self.user_id)
		buff = var1539
		var1532 = var1540
	end
	if self.description ~= nil and self.description ~= "" then
		local var1541, var1542 = protoModule.writeTag(buff, var1532, 5, protoModule.wireTypes.lengthDelimited)
		var1541, var2325 = protoModule.writeString(var1541, var1542, self.description)
		buff = var1541
		var1532 = var1542
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1543, var1544 = protoModule.writeTag(buff, var1532, 6, protoModule.wireTypes.lengthDelimited)
		var1543, var2327 = protoModule.writeString(var1543, var1544, self.cta_text)
		buff = var1543
		var1532 = var1544
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1545, var1546 = protoModule.writeTag(buff, var1532, 7, protoModule.wireTypes.lengthDelimited)
		var1545, var2329 = protoModule.writeString(var1545, var1546, self.prompt_id)
		buff = var1545
		var1532 = var1546
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1547, var1548 = protoModule.writeTag(buff, var1532, 8, protoModule.wireTypes.lengthDelimited)
		var1547, var2331 = protoModule.writeString(var1547, var1548, self.prompt_type)
		buff = var1547
		var1532 = var1548
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1549, var1550 = protoModule.writeTag(buff, var1532, 9, protoModule.wireTypes.lengthDelimited)
		var1549, var2333 = protoModule.writeString(var1549, var1550, self.entity_id)
		buff = var1549
		var1532 = var1550
	end
	local buff_1 = buffer.create(var1532)
	buffer.copy(buff_1, 0, buff, 0, var1532)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref)
	local var1532 = t_53.new()
	local var1533 = 0
	while var1533 < buffer.len(p53) do
		local _ = nil
		local var1534 = nil
		local var1535, var1536, var1537 = protoModule.readTag(p53, var1533)
		local var1538 = var1535
		var1534 = var1536
		var1533 = var1537
		
		if var1534 == protoModule.wireTypes.varint then
			local _ = nil
			local var1539, var1540 = protoModule.readVarInt(p53, var1533)
			local _ = var1539
			var1533 = var1540
			continue
		end
		if var1534 == protoModule.wireTypes.lengthDelimited then
			if var1538 == 1 then
				local _ = nil
				local var1541, var1542 = protoModule.readBuffer(p53, var1533)
				var1533 = var1542
				var1532.roblox_component = buffer.tostring(var1541)
			elseif var1538 == 2 then
				local _ = nil
				local var1543, var1544 = protoModule.readBuffer(p53, var1533)
				var1533 = var1544
				var1532.identifier = buffer.tostring(var1543)
			elseif var1538 == 3 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p53, var1533)
				var1533 = var1546
				var1532.title = buffer.tostring(var1545)
			elseif var1538 == 4 then
				local _ = nil
				local var1547, var1548 = protoModule.readBuffer(p53, var1533)
				var1533 = var1548
				var1532.user_id = buffer.tostring(var1547)
			elseif var1538 == 5 then
				local _ = nil
				local var1549, var1550 = protoModule.readBuffer(p53, var1533)
				var1533 = var1550
				var1532.description = buffer.tostring(var1549)
			elseif var1538 == 6 then
				local _ = nil
				local var1551, var1552 = protoModule.readBuffer(p53, var1533)
				var1533 = var1552
				var1532.cta_text = buffer.tostring(var1551)
			elseif var1538 == 7 then
				local _ = nil
				local var1553, var1554 = protoModule.readBuffer(p53, var1533)
				var1533 = var1554
				var1532.prompt_id = buffer.tostring(var1553)
			elseif var1538 == 8 then
				local _ = nil
				local var1555, var1556 = protoModule.readBuffer(p53, var1533)
				var1533 = var1556
				var1532.prompt_type = buffer.tostring(var1555)
			elseif var1538 == 9 then
				local _ = nil
				local var1557, var1558 = protoModule.readBuffer(p53, var1533)
				var1533 = var1558
				var1532.entity_id = buffer.tostring(var1557)
			else
				local _ = nil
				local var1559, var1560 = protoModule.readVarInt(p53, var1533)
				var1533 = var1560 + var1559
			end
		elseif var1534 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1561, var1562 = protoModule.readFixed32(p53, var1533)
			local _ = var1561
			var1533 = var1562
		elseif var1534 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1563, var1564 = protoModule.readFixed64(p53, var1533)
			local _ = var1563
			var1533 = var1564
		else
			error("Unsupported wire type: " .. var2337)
		end
	end
	return var1532
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
	local var1565 = t_53.new()
	
	if self.roblox_component ~= nil then
		var1565.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1565.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1565.identifier = self.identifier
	end
	if self.title ~= nil then
		var1565.title = self.title
	end
	if self.user_id ~= nil then
		var1565.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1565.user_id = self.userId
	end
	if self.description ~= nil then
		var1565.description = self.description
	end
	if self.cta_text ~= nil then
		var1565.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1565.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1565.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1565.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1565.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1565.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1565.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1565.entity_id = self.entityId
	end
	return var1565
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
	local var1565 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1566, var1567 = protoModule.writeTag(buff, var1565, 1, protoModule.wireTypes.lengthDelimited)
		var1566, var2373 = protoModule.writeString(var1566, var1567, self.group_id)
		buff = var1566
		var1565 = var1567
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1568, var1569 = protoModule.writeTag(buff, var1565, 2, protoModule.wireTypes.lengthDelimited)
		var1568, var2375 = protoModule.writeString(var1568, var1569, self.experience_id)
		buff = var1568
		var1565 = var1569
	end
	local buff_1 = buffer.create(var1565)
	buffer.copy(buff_1, 0, buff, 0, var1565)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1565 = t_54.new()
	local var1566 = 0
	while var1566 < buffer.len(p54) do
		local _ = nil
		local var1567 = nil
		local var1568, var1569, var1570 = protoModule.readTag(p54, var1566)
		local var1571 = var1568
		var1567 = var1569
		var1566 = var1570
		
		if var1567 == protoModule.wireTypes.varint then
			local _ = nil
			local var1572, var1573 = protoModule.readVarInt(p54, var1566)
			local _ = var1572
			var1566 = var1573
			continue
		end
		if var1567 == protoModule.wireTypes.lengthDelimited then
			if var1571 == 1 then
				local _ = nil
				local var1574, var1575 = protoModule.readBuffer(p54, var1566)
				var1566 = var1575
				var1565.group_id = buffer.tostring(var1574)
			elseif var1571 == 2 then
				local _ = nil
				local var1576, var1577 = protoModule.readBuffer(p54, var1566)
				var1566 = var1577
				var1565.experience_id = buffer.tostring(var1576)
			else
				local _ = nil
				local var1578, var1579 = protoModule.readVarInt(p54, var1566)
				var1566 = var1579 + var1578
			end
		elseif var1567 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1580, var1581 = protoModule.readFixed32(p54, var1566)
			local _ = var1580
			var1566 = var1581
		elseif var1567 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1582, var1583 = protoModule.readFixed64(p54, var1566)
			local _ = var1582
			var1566 = var1583
		else
			error("Unsupported wire type: " .. var2379)
		end
	end
	return var1565
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
	local var1584 = t_54.new()
	
	if self.group_id ~= nil then
		var1584.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1584.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1584.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1584.experience_id = self.experienceId
	end
	return var1584
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
	local var1584 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1585, var1586 = protoModule.writeTag(buff, var1584, 1, protoModule.wireTypes.lengthDelimited)
		var1585, var2401 = protoModule.writeString(var1585, var1586, self.title)
		buff = var1585
		var1584 = var1586
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1587, var1588 = protoModule.writeTag(buff, var1584, 2, protoModule.wireTypes.lengthDelimited)
		var1587, var2403 = protoModule.writeString(var1587, var1588, self.dismiss_text)
		buff = var1587
		var1584 = var1588
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1589, var1590 = protoModule.writeTag(buff, var1584, 3, protoModule.wireTypes.lengthDelimited)
		var1589, var2405 = protoModule.writeString(var1589, var1590, self.user_id)
		buff = var1589
		var1584 = var1590
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1591 = v:encode()
			local var1592, var1593 = protoModule.writeTag(buff, var1584, 4, protoModule.wireTypes.lengthDelimited)
			var1592, var2408 = protoModule.writeBuffer(var1592, var1593, var1591, buffer.len(var1591))
			buff = var1592
			var1584 = var1593
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1594, var1595 = protoModule.writeTag(buff, var1584, 5, protoModule.wireTypes.lengthDelimited)
		var1594, var2410 = protoModule.writeString(var1594, var1595, self.prompt_id)
		buff = var1594
		var1584 = var1595
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1596, var1597 = protoModule.writeTag(buff, var1584, 6, protoModule.wireTypes.lengthDelimited)
		var1596, var2412 = protoModule.writeString(var1596, var1597, self.prompt_type)
		buff = var1596
		var1584 = var1597
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1598, var1599 = protoModule.writeTag(buff, var1584, 7, protoModule.wireTypes.lengthDelimited)
		var1598, var2414 = protoModule.writeString(var1598, var1599, self.sort_id)
		buff = var1598
		var1584 = var1599
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1600, var1601 = protoModule.writeTag(buff, var1584, 8, protoModule.wireTypes.lengthDelimited)
		var1600, var2416 = protoModule.writeString(var1600, var1601, self.feed_item_key)
		buff = var1600
		var1584 = var1601
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1602 = self.client_attributes.value:encode()
		local var1603, var1604 = protoModule.writeTag(buff, var1584, 9, protoModule.wireTypes.lengthDelimited)
		var1603, var2419 = protoModule.writeBuffer(var1603, var1604, var1602, buffer.len(var1602))
		buff = var1603
		var1584 = var1604
	end
	local buff_1 = buffer.create(var1584)
	buffer.copy(buff_1, 0, buff, 0, var1584)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref), t (ref)
	local var1605 = t_55.new()
	local var1606 = 0
	while var1606 < buffer.len(p55) do
		local _ = nil
		local var1607 = nil
		local var1608, var1609, var1610 = protoModule.readTag(p55, var1606)
		local var1611 = var1608
		var1607 = var1609
		var1606 = var1610
		
		if var1607 == protoModule.wireTypes.varint then
			local _ = nil
			local var1612, var1613 = protoModule.readVarInt(p55, var1606)
			local _ = var1612
			var1606 = var1613
			continue
		end
		if var1607 == protoModule.wireTypes.lengthDelimited then
			if var1611 == 1 then
				local _ = nil
				local var1614, var1615 = protoModule.readBuffer(p55, var1606)
				var1606 = var1615
				var1605.title = buffer.tostring(var1614)
			elseif var1611 == 2 then
				local _ = nil
				local var1616, var1617 = protoModule.readBuffer(p55, var1606)
				var1606 = var1617
				var1605.dismiss_text = buffer.tostring(var1616)
			elseif var1611 == 3 then
				local _ = nil
				local var1618, var1619 = protoModule.readBuffer(p55, var1606)
				var1606 = var1619
				var1605.user_id = buffer.tostring(var1618)
			elseif var1611 == 4 then
				local _ = nil
				local var1620, var1621 = protoModule.readBuffer(p55, var1606)
				var1606 = var1621
				table.insert(var1605.cards, t.CardContainerCardInputData.decode(var1620))
			elseif var1611 == 5 then
				local _ = nil
				local var1622, var1623 = protoModule.readBuffer(p55, var1606)
				var1606 = var1623
				var1605.prompt_id = buffer.tostring(var1622)
			elseif var1611 == 6 then
				local _ = nil
				local var1624, var1625 = protoModule.readBuffer(p55, var1606)
				var1606 = var1625
				var1605.prompt_type = buffer.tostring(var1624)
			elseif var1611 == 7 then
				local _ = nil
				local var1626, var1627 = protoModule.readBuffer(p55, var1606)
				var1606 = var1627
				var1605.sort_id = buffer.tostring(var1626)
			elseif var1611 == 8 then
				local _ = nil
				local var1628, var1629 = protoModule.readBuffer(p55, var1606)
				var1606 = var1629
				var1605.feed_item_key = buffer.tostring(var1628)
			elseif var1611 == 9 then
				local _ = nil
				local var1630, var1631 = protoModule.readBuffer(p55, var1606)
				var1606 = var1631
				var1605.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1630)
				}
			else
				local _ = nil
				local var1632, var1633 = protoModule.readVarInt(p55, var1606)
				var1606 = var1633 + var1632
			end
		elseif var1607 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1634, var1635 = protoModule.readFixed32(p55, var1606)
			local _ = var1634
			var1606 = var1635
		elseif var1607 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1636, var1637 = protoModule.readFixed64(p55, var1606)
			local _ = var1636
			var1606 = var1637
		else
			error("Unsupported wire type: " .. var2423)
		end
	end
	return var1605
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
	local var1638 = t_55.new()
	
	if self.title ~= nil then
		var1638.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1638.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1638.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1638.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1638.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1638.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1638.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1638.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1638.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1638.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1638.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1638.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1638.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1638.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1638.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1638.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1638
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
	local var1639 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1640, var1641 = protoModule.writeTag(buff, var1639, 1, protoModule.wireTypes.lengthDelimited)
		var1640, var2461 = protoModule.writeString(var1640, var1641, self.title)
		buff = var1640
		var1639 = var1641
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1642, var1643 = protoModule.writeTag(buff, var1639, 2, protoModule.wireTypes.lengthDelimited)
		var1642, var2463 = protoModule.writeString(var1642, var1643, self.user_id)
		buff = var1642
		var1639 = var1643
	end
	if self.description ~= nil and self.description ~= "" then
		local var1644, var1645 = protoModule.writeTag(buff, var1639, 3, protoModule.wireTypes.lengthDelimited)
		var1644, var2465 = protoModule.writeString(var1644, var1645, self.description)
		buff = var1644
		var1639 = var1645
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1646, var1647 = protoModule.writeTag(buff, var1639, 4, protoModule.wireTypes.lengthDelimited)
		var1646, var2467 = protoModule.writeString(var1646, var1647, self.cta_text)
		buff = var1646
		var1639 = var1647
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1648, var1649 = protoModule.writeTag(buff, var1639, 5, protoModule.wireTypes.lengthDelimited)
		var1648, var2469 = protoModule.writeString(var1648, var1649, self.prompt_id)
		buff = var1648
		var1639 = var1649
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1650, var1651 = protoModule.writeTag(buff, var1639, 6, protoModule.wireTypes.lengthDelimited)
		var1650, var2471 = protoModule.writeString(var1650, var1651, self.prompt_type)
		buff = var1650
		var1639 = var1651
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1652, var1653 = protoModule.writeTag(buff, var1639, 7, protoModule.wireTypes.lengthDelimited)
		var1652, var2473 = protoModule.writeString(var1652, var1653, self.entity_id)
		buff = var1652
		var1639 = var1653
	end
	local buff_1 = buffer.create(var1639)
	buffer.copy(buff_1, 0, buff, 0, var1639)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1639 = t_56.new()
	local var1640 = 0
	while var1640 < buffer.len(p56) do
		local _ = nil
		local var1641 = nil
		local var1642, var1643, var1644 = protoModule.readTag(p56, var1640)
		local var1645 = var1642
		var1641 = var1643
		var1640 = var1644
		
		if var1641 == protoModule.wireTypes.varint then
			local _ = nil
			local var1646, var1647 = protoModule.readVarInt(p56, var1640)
			local _ = var1646
			var1640 = var1647
			continue
		end
		if var1641 == protoModule.wireTypes.lengthDelimited then
			if var1645 == 1 then
				local _ = nil
				local var1648, var1649 = protoModule.readBuffer(p56, var1640)
				var1640 = var1649
				var1639.title = buffer.tostring(var1648)
			elseif var1645 == 2 then
				local _ = nil
				local var1650, var1651 = protoModule.readBuffer(p56, var1640)
				var1640 = var1651
				var1639.user_id = buffer.tostring(var1650)
			elseif var1645 == 3 then
				local _ = nil
				local var1652, var1653 = protoModule.readBuffer(p56, var1640)
				var1640 = var1653
				var1639.description = buffer.tostring(var1652)
			elseif var1645 == 4 then
				local _ = nil
				local var1654, var1655 = protoModule.readBuffer(p56, var1640)
				var1640 = var1655
				var1639.cta_text = buffer.tostring(var1654)
			elseif var1645 == 5 then
				local _ = nil
				local var1656, var1657 = protoModule.readBuffer(p56, var1640)
				var1640 = var1657
				var1639.prompt_id = buffer.tostring(var1656)
			elseif var1645 == 6 then
				local _ = nil
				local var1658, var1659 = protoModule.readBuffer(p56, var1640)
				var1640 = var1659
				var1639.prompt_type = buffer.tostring(var1658)
			elseif var1645 == 7 then
				local _ = nil
				local var1660, var1661 = protoModule.readBuffer(p56, var1640)
				var1640 = var1661
				var1639.entity_id = buffer.tostring(var1660)
			else
				local _ = nil
				local var1662, var1663 = protoModule.readVarInt(p56, var1640)
				var1640 = var1663 + var1662
			end
		elseif var1641 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1664, var1665 = protoModule.readFixed32(p56, var1640)
			local _ = var1664
			var1640 = var1665
		elseif var1641 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1666, var1667 = protoModule.readFixed64(p56, var1640)
			local _ = var1666
			var1640 = var1667
		else
			error("Unsupported wire type: " .. var2477)
		end
	end
	return var1639
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
	local var1668 = t_56.new()
	
	if self.title ~= nil then
		var1668.title = self.title
	end
	if self.user_id ~= nil then
		var1668.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1668.user_id = self.userId
	end
	if self.description ~= nil then
		var1668.description = self.description
	end
	if self.cta_text ~= nil then
		var1668.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1668.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1668.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1668.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1668.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1668.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1668.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1668.entity_id = self.entityId
	end
	return var1668
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
	local var1668 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1669, var1670 = protoModule.writeTag(buff, var1668, 1, protoModule.wireTypes.lengthDelimited)
		var1669, var2509 = protoModule.writeString(var1669, var1670, self.prompt_id)
		buff = var1669
		var1668 = var1670
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1671, var1672 = protoModule.writeTag(buff, var1668, 2, protoModule.wireTypes.lengthDelimited)
		var1671, var2511 = protoModule.writeString(var1671, var1672, self.prompt_type)
		buff = var1671
		var1668 = var1672
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1673, var1674 = protoModule.writeTag(buff, var1668, 3, protoModule.wireTypes.lengthDelimited)
		var1673, var2513 = protoModule.writeString(var1673, var1674, self.user_id)
		buff = var1673
		var1668 = var1674
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1675, var1676 = protoModule.writeTag(buff, var1668, 4, protoModule.wireTypes.lengthDelimited)
		var1675, var2515 = protoModule.writeString(var1675, var1676, self.audit_data)
		buff = var1675
		var1668 = var1676
	end
	local buff_1 = buffer.create(var1668)
	buffer.copy(buff_1, 0, buff, 0, var1668)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref)
	local var1668 = t_57.new()
	local var1669 = 0
	while var1669 < buffer.len(p57) do
		local _ = nil
		local var1670 = nil
		local var1671, var1672, var1673 = protoModule.readTag(p57, var1669)
		local var1674 = var1671
		var1670 = var1672
		var1669 = var1673
		
		if var1670 == protoModule.wireTypes.varint then
			local _ = nil
			local var1675, var1676 = protoModule.readVarInt(p57, var1669)
			local _ = var1675
			var1669 = var1676
			continue
		end
		if var1670 == protoModule.wireTypes.lengthDelimited then
			if var1674 == 1 then
				local _ = nil
				local var1677, var1678 = protoModule.readBuffer(p57, var1669)
				var1669 = var1678
				var1668.prompt_id = buffer.tostring(var1677)
			elseif var1674 == 2 then
				local _ = nil
				local var1679, var1680 = protoModule.readBuffer(p57, var1669)
				var1669 = var1680
				var1668.prompt_type = buffer.tostring(var1679)
			elseif var1674 == 3 then
				local _ = nil
				local var1681, var1682 = protoModule.readBuffer(p57, var1669)
				var1669 = var1682
				var1668.user_id = buffer.tostring(var1681)
			elseif var1674 == 4 then
				local _ = nil
				local var1683, var1684 = protoModule.readBuffer(p57, var1669)
				var1669 = var1684
				var1668.audit_data = buffer.tostring(var1683)
			else
				local _ = nil
				local var1685, var1686 = protoModule.readVarInt(p57, var1669)
				var1669 = var1686 + var1685
			end
		elseif var1670 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1687, var1688 = protoModule.readFixed32(p57, var1669)
			local _ = var1687
			var1669 = var1688
		elseif var1670 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1689, var1690 = protoModule.readFixed64(p57, var1669)
			local _ = var1689
			var1669 = var1690
		else
			error("Unsupported wire type: " .. var2519)
		end
	end
	return var1668
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
	local var1691 = t_57.new()
	
	if self.prompt_id ~= nil then
		var1691.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1691.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1691.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1691.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1691.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1691.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1691.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1691.audit_data = self.auditData
	end
	return var1691
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
	local var1691 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1692, var1693 = protoModule.writeTag(buff, var1691, 1, protoModule.wireTypes.varint)
		var1692, var2545 = protoModule.writeVarInt(var1692, var1693, self.sender_count)
		buff = var1692
		var1691 = var1693
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1694, var1695 = protoModule.writeTag(buff, var1691, 2, protoModule.wireTypes.varint)
		var1694, var2547 = protoModule.writeVarInt(var1694, var1695, self.total_robux_amount)
		buff = var1694
		var1691 = var1695
	end
	local buff_1 = buffer.create(var1691)
	buffer.copy(buff_1, 0, buff, 0, var1691)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1691 = t_58.new()
	local var1692 = 0
	while var1692 < buffer.len(p58) do
		local _ = nil
		local _ = nil
		local var1693, var1694, var1695 = protoModule.readTag(p58, var1692)
		local var1696 = var1693
		local var1697 = var1694
		var1692 = var1695
		
		if var1697 == protoModule.wireTypes.varint then
			if var1696 == 1 then
				local _ = nil
				local var1698, var1699 = protoModule.readVarIntI32(p58, var1692)
				var1692 = var1699
				var1691.sender_count = var1698
			elseif var1696 == 2 then
				local _ = nil
				local var1700, var1701 = protoModule.readVarIntI64(p58, var1692)
				var1692 = var1701
				var1691.total_robux_amount = var1700
			else
				local _ = nil
				local var1702, var1703 = protoModule.readVarInt(p58, var1692)
				local _ = var1702
				var1692 = var1703
			end
		elseif var1697 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1704, var1705 = protoModule.readVarInt(p58, var1692)
			var1692 = var1705 + var1704
		elseif var1697 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1706, var1707 = protoModule.readFixed32(p58, var1692)
			local _ = var1706
			var1692 = var1707
		elseif var1697 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1708, var1709 = protoModule.readFixed64(p58, var1692)
			local _ = var1708
			var1692 = var1709
		else
			error("Unsupported wire type: " .. var2555)
		end
	end
	return var1691
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
	local var1710 = t_58.new()
	
	if self.sender_count ~= nil then
		var1710.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1710.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1710.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1710.total_robux_amount = self.totalRobuxAmount
	end
	return var1710
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
	local var1710 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1711, var1712 = protoModule.writeTag(buff, var1710, 1, protoModule.wireTypes.lengthDelimited)
		var1711, var2573 = protoModule.writeString(var1711, var1712, self.title)
		buff = var1711
		var1710 = var1712
	end
	if self.description ~= nil and self.description ~= "" then
		local var1713, var1714 = protoModule.writeTag(buff, var1710, 2, protoModule.wireTypes.lengthDelimited)
		var1713, var2575 = protoModule.writeString(var1713, var1714, self.description)
		buff = var1713
		var1710 = var1714
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1715, var1716 = protoModule.writeTag(buff, var1710, 3, protoModule.wireTypes.lengthDelimited)
		var1715, var2577 = protoModule.writeString(var1715, var1716, self.primary_text)
		buff = var1715
		var1710 = var1716
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1717, var1718 = protoModule.writeTag(buff, var1710, 4, protoModule.wireTypes.lengthDelimited)
		var1717, var2579 = protoModule.writeString(var1717, var1718, self.secondary_text)
		buff = var1717
		var1710 = var1718
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1719, var1720 = protoModule.writeTag(buff, var1710, 5, protoModule.wireTypes.lengthDelimited)
		var1719, var2581 = protoModule.writeString(var1719, var1720, self.prompt_id)
		buff = var1719
		var1710 = var1720
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1721, var1722 = protoModule.writeTag(buff, var1710, 6, protoModule.wireTypes.lengthDelimited)
		var1721, var2583 = protoModule.writeString(var1721, var1722, self.prompt_type)
		buff = var1721
		var1710 = var1722
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1723, var1724 = protoModule.writeTag(buff, var1710, 7, protoModule.wireTypes.varint)
		var1723, var2585 = protoModule.writeVarInt(var1723, var1724, self.times_seen)
		buff = var1723
		var1710 = var1724
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1725 = self.content.value:encode()
		local var1726, var1727 = protoModule.writeTag(buff, var1710, 8, protoModule.wireTypes.lengthDelimited)
		var1726, var2588 = protoModule.writeBuffer(var1726, var1727, var1725, buffer.len(var1725))
		buff = var1726
		var1710 = var1727
	end
	if self.sort_id ~= nil then
		local var1728, var1729 = protoModule.writeTag(buff, var1710, 9, protoModule.wireTypes.lengthDelimited)
		var1728, var2590 = protoModule.writeString(var1728, var1729, self.sort_id)
		buff = var1728
		var1710 = var1729
	end
	local buff_1 = buffer.create(var1710)
	buffer.copy(buff_1, 0, buff, 0, var1710)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref), t (ref)
	local var1710 = t_59.new()
	local var1711 = 0
	while var1711 < buffer.len(p59) do
		local _ = nil
		local var1712 = nil
		local var1713, var1714, var1715 = protoModule.readTag(p59, var1711)
		local var1716 = var1713
		var1712 = var1714
		var1711 = var1715
		
		if var1712 == protoModule.wireTypes.varint then
			if var1716 == 7 then
				local _ = nil
				local var1717, var1718 = protoModule.readVarIntI32(p59, var1711)
				var1711 = var1718
				var1710.times_seen = var1717
			else
				local _ = nil
				local var1719, var1720 = protoModule.readVarInt(p59, var1711)
				local _ = var1719
				var1711 = var1720
			end
		end
		if var1712 == protoModule.wireTypes.lengthDelimited then
			if var1716 == 1 then
				local _ = nil
				local var1721, var1722 = protoModule.readBuffer(p59, var1711)
				var1711 = var1722
				var1710.title = buffer.tostring(var1721)
			elseif var1716 == 2 then
				local _ = nil
				local var1723, var1724 = protoModule.readBuffer(p59, var1711)
				var1711 = var1724
				var1710.description = buffer.tostring(var1723)
			elseif var1716 == 3 then
				local _ = nil
				local var1725, var1726 = protoModule.readBuffer(p59, var1711)
				var1711 = var1726
				var1710.primary_text = buffer.tostring(var1725)
			elseif var1716 == 4 then
				local _ = nil
				local var1727, var1728 = protoModule.readBuffer(p59, var1711)
				var1711 = var1728
				var1710.secondary_text = buffer.tostring(var1727)
			elseif var1716 == 5 then
				local _ = nil
				local var1729, var1730 = protoModule.readBuffer(p59, var1711)
				var1711 = var1730
				var1710.prompt_id = buffer.tostring(var1729)
			elseif var1716 == 6 then
				local _ = nil
				local var1731, var1732 = protoModule.readBuffer(p59, var1711)
				var1711 = var1732
				var1710.prompt_type = buffer.tostring(var1731)
			elseif var1716 == 8 then
				local _ = nil
				local var1733, var1734 = protoModule.readBuffer(p59, var1711)
				var1711 = var1734
				var1710.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1733)
				}
			elseif var1716 == 9 then
				local _ = nil
				local var1735, var1736 = protoModule.readBuffer(p59, var1711)
				var1711 = var1736
				var1710.sort_id = buffer.tostring(var1735)
			else
				local _ = nil
				local var1737, var1738 = protoModule.readVarInt(p59, var1711)
				var1711 = var1738 + var1737
			end
		elseif var1712 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1739, var1740 = protoModule.readFixed32(p59, var1711)
			local _ = var1739
			var1711 = var1740
		elseif var1712 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1741, var1742 = protoModule.readFixed64(p59, var1711)
			local _ = var1741
			var1711 = var1742
		else
			error("Unsupported wire type: " .. var2594)
		end
	end
	return var1710
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
	local var1743 = t_59.new()
	
	if self.title ~= nil then
		var1743.title = self.title
	end
	if self.description ~= nil then
		var1743.description = self.description
	end
	if self.primary_text ~= nil then
		var1743.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1743.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1743.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1743.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1743.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1743.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1743.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1743.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1743.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1743.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1743.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1743.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1743.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1743.sort_id = self.sortId
	end
	return var1743
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
	local var1743 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1744, var1745 = protoModule.writeTag(buff, var1743, 1, protoModule.wireTypes.lengthDelimited)
		var1744, var2630 = protoModule.writeString(var1744, var1745, self.tooltip_text)
		buff = var1744
		var1743 = var1745
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1746, var1747 = protoModule.writeTag(buff, var1743, 2, protoModule.wireTypes.lengthDelimited)
		var1746, var2632 = protoModule.writeString(var1746, var1747, self.prompt_id)
		buff = var1746
		var1743 = var1747
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1748, var1749 = protoModule.writeTag(buff, var1743, 3, protoModule.wireTypes.lengthDelimited)
		var1748, var2634 = protoModule.writeString(var1748, var1749, self.prompt_type)
		buff = var1748
		var1743 = var1749
	end
	local buff_1 = buffer.create(var1743)
	buffer.copy(buff_1, 0, buff, 0, var1743)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1743 = t_60.new()
	local var1744 = 0
	while var1744 < buffer.len(p60) do
		local _ = nil
		local var1745 = nil
		local var1746, var1747, var1748 = protoModule.readTag(p60, var1744)
		local var1749 = var1746
		var1745 = var1747
		var1744 = var1748
		
		if var1745 == protoModule.wireTypes.varint then
			local _ = nil
			local var1750, var1751 = protoModule.readVarInt(p60, var1744)
			local _ = var1750
			var1744 = var1751
			continue
		end
		if var1745 == protoModule.wireTypes.lengthDelimited then
			if var1749 == 1 then
				local _ = nil
				local var1752, var1753 = protoModule.readBuffer(p60, var1744)
				var1744 = var1753
				var1743.tooltip_text = buffer.tostring(var1752)
			elseif var1749 == 2 then
				local _ = nil
				local var1754, var1755 = protoModule.readBuffer(p60, var1744)
				var1744 = var1755
				var1743.prompt_id = buffer.tostring(var1754)
			elseif var1749 == 3 then
				local _ = nil
				local var1756, var1757 = protoModule.readBuffer(p60, var1744)
				var1744 = var1757
				var1743.prompt_type = buffer.tostring(var1756)
			else
				local _ = nil
				local var1758, var1759 = protoModule.readVarInt(p60, var1744)
				var1744 = var1759 + var1758
			end
		elseif var1745 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1760, var1761 = protoModule.readFixed32(p60, var1744)
			local _ = var1760
			var1744 = var1761
		elseif var1745 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1762, var1763 = protoModule.readFixed64(p60, var1744)
			local _ = var1762
			var1744 = var1763
		else
			error("Unsupported wire type: " .. var2638)
		end
	end
	return var1743
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
	local var1764 = t_60.new()
	
	if self.tooltip_text ~= nil then
		var1764.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1764.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1764.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1764.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1764.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1764.prompt_type = self.promptType
	end
	return var1764
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
	local var1764 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1765, var1766 = protoModule.writeTag(buff, var1764, 1, protoModule.wireTypes.lengthDelimited)
		var1765, var2662 = protoModule.writeString(var1765, var1766, self.media_id)
		buff = var1765
		var1764 = var1766
	end
	if self.title ~= nil and self.title ~= "" then
		local var1767, var1768 = protoModule.writeTag(buff, var1764, 2, protoModule.wireTypes.lengthDelimited)
		var1767, var2664 = protoModule.writeString(var1767, var1768, self.title)
		buff = var1767
		var1764 = var1768
	end
	if self.description ~= nil and self.description ~= "" then
		local var1769, var1770 = protoModule.writeTag(buff, var1764, 3, protoModule.wireTypes.lengthDelimited)
		var1769, var2666 = protoModule.writeString(var1769, var1770, self.description)
		buff = var1769
		var1764 = var1770
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1771, var1772 = protoModule.writeTag(buff, var1764, 4, protoModule.wireTypes.lengthDelimited)
		var1771, var2668 = protoModule.writeString(var1771, var1772, self.prompt_id)
		buff = var1771
		var1764 = var1772
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1773, var1774 = protoModule.writeTag(buff, var1764, 5, protoModule.wireTypes.lengthDelimited)
		var1773, var2670 = protoModule.writeString(var1773, var1774, self.prompt_type)
		buff = var1773
		var1764 = var1774
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1775, var1776 = protoModule.writeTag(buff, var1764, 6, protoModule.wireTypes.lengthDelimited)
		var1775, var2672 = protoModule.writeString(var1775, var1776, self.anchor_tag)
		buff = var1775
		var1764 = var1776
	end
	local buff_1 = buffer.create(var1764)
	buffer.copy(buff_1, 0, buff, 0, var1764)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1764 = t_61.new()
	local var1765 = 0
	while var1765 < buffer.len(p61) do
		local _ = nil
		local var1766 = nil
		local var1767, var1768, var1769 = protoModule.readTag(p61, var1765)
		local var1770 = var1767
		var1766 = var1768
		var1765 = var1769
		
		if var1766 == protoModule.wireTypes.varint then
			local _ = nil
			local var1771, var1772 = protoModule.readVarInt(p61, var1765)
			local _ = var1771
			var1765 = var1772
			continue
		end
		if var1766 == protoModule.wireTypes.lengthDelimited then
			if var1770 == 1 then
				local _ = nil
				local var1773, var1774 = protoModule.readBuffer(p61, var1765)
				var1765 = var1774
				var1764.media_id = buffer.tostring(var1773)
			elseif var1770 == 2 then
				local _ = nil
				local var1775, var1776 = protoModule.readBuffer(p61, var1765)
				var1765 = var1776
				var1764.title = buffer.tostring(var1775)
			elseif var1770 == 3 then
				local _ = nil
				local var1777, var1778 = protoModule.readBuffer(p61, var1765)
				var1765 = var1778
				var1764.description = buffer.tostring(var1777)
			elseif var1770 == 4 then
				local _ = nil
				local var1779, var1780 = protoModule.readBuffer(p61, var1765)
				var1765 = var1780
				var1764.prompt_id = buffer.tostring(var1779)
			elseif var1770 == 5 then
				local _ = nil
				local var1781, var1782 = protoModule.readBuffer(p61, var1765)
				var1765 = var1782
				var1764.prompt_type = buffer.tostring(var1781)
			elseif var1770 == 6 then
				local _ = nil
				local var1783, var1784 = protoModule.readBuffer(p61, var1765)
				var1765 = var1784
				var1764.anchor_tag = buffer.tostring(var1783)
			else
				local _ = nil
				local var1785, var1786 = protoModule.readVarInt(p61, var1765)
				var1765 = var1786 + var1785
			end
		elseif var1766 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1787, var1788 = protoModule.readFixed32(p61, var1765)
			local _ = var1787
			var1765 = var1788
		elseif var1766 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1789, var1790 = protoModule.readFixed64(p61, var1765)
			local _ = var1789
			var1765 = var1790
		else
			error("Unsupported wire type: " .. var2676)
		end
	end
	return var1764
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
	local var1791 = t_61.new()
	
	if self.media_id ~= nil then
		var1791.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1791.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1791.title = self.title
	end
	if self.description ~= nil then
		var1791.description = self.description
	end
	if self.prompt_id ~= nil then
		var1791.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1791.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1791.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1791.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1791.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1791.anchor_tag = self.anchorTag
	end
	return var1791
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
	local var1791 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1792, var1793 = protoModule.writeTag(buff, var1791, 1, protoModule.wireTypes.lengthDelimited)
		var1792, var2706 = protoModule.writeString(var1792, var1793, self.prompt_id)
		buff = var1792
		var1791 = var1793
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1794, var1795 = protoModule.writeTag(buff, var1791, 2, protoModule.wireTypes.lengthDelimited)
		var1794, var2708 = protoModule.writeString(var1794, var1795, self.prompt_type)
		buff = var1794
		var1791 = var1795
	end
	local buff_1 = buffer.create(var1791)
	buffer.copy(buff_1, 0, buff, 0, var1791)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1791 = t_62.new()
	local var1792 = 0
	while var1792 < buffer.len(p62) do
		local _ = nil
		local var1793 = nil
		local var1794, var1795, var1796 = protoModule.readTag(p62, var1792)
		local var1797 = var1794
		var1793 = var1795
		var1792 = var1796
		
		if var1793 == protoModule.wireTypes.varint then
			local _ = nil
			local var1798, var1799 = protoModule.readVarInt(p62, var1792)
			local _ = var1798
			var1792 = var1799
			continue
		end
		if var1793 == protoModule.wireTypes.lengthDelimited then
			if var1797 == 1 then
				local _ = nil
				local var1800, var1801 = protoModule.readBuffer(p62, var1792)
				var1792 = var1801
				var1791.prompt_id = buffer.tostring(var1800)
			elseif var1797 == 2 then
				local _ = nil
				local var1802, var1803 = protoModule.readBuffer(p62, var1792)
				var1792 = var1803
				var1791.prompt_type = buffer.tostring(var1802)
			else
				local _ = nil
				local var1804, var1805 = protoModule.readVarInt(p62, var1792)
				var1792 = var1805 + var1804
			end
		elseif var1793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1806, var1807 = protoModule.readFixed32(p62, var1792)
			local _ = var1806
			var1792 = var1807
		elseif var1793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1808, var1809 = protoModule.readFixed64(p62, var1792)
			local _ = var1808
			var1792 = var1809
		else
			error("Unsupported wire type: " .. var2712)
		end
	end
	return var1791
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
	local var1810 = t_62.new()
	
	if self.prompt_id ~= nil then
		var1810.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1810.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1810.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1810.prompt_type = self.promptType
	end
	return var1810
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
	local var1810 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1811, var1812 = protoModule.writeTag(buff, var1810, 1, protoModule.wireTypes.lengthDelimited)
		var1811, var2734 = protoModule.writeString(var1811, var1812, self.upsell_prompt)
		buff = var1811
		var1810 = var1812
	end
	local buff_1 = buffer.create(var1810)
	buffer.copy(buff_1, 0, buff, 0, var1810)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref)
	local var1810 = t_63.new()
	local var1811 = 0
	while var1811 < buffer.len(p63) do
		local _ = nil
		local var1812 = nil
		local var1813, var1814, var1815 = protoModule.readTag(p63, var1811)
		local var1816 = var1813
		var1812 = var1814
		var1811 = var1815
		
		if var1812 == protoModule.wireTypes.varint then
			local _ = nil
			local var1817, var1818 = protoModule.readVarInt(p63, var1811)
			local _ = var1817
			var1811 = var1818
			continue
		end
		if var1812 == protoModule.wireTypes.lengthDelimited then
			if var1816 == 1 then
				local _ = nil
				local var1819, var1820 = protoModule.readBuffer(p63, var1811)
				var1811 = var1820
				var1810.upsell_prompt = buffer.tostring(var1819)
			else
				local _ = nil
				local var1821, var1822 = protoModule.readVarInt(p63, var1811)
				var1811 = var1822 + var1821
			end
		elseif var1812 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1823, var1824 = protoModule.readFixed32(p63, var1811)
			local _ = var1823
			var1811 = var1824
		elseif var1812 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1825, var1826 = protoModule.readFixed64(p63, var1811)
			local _ = var1825
			var1811 = var1826
		else
			error("Unsupported wire type: " .. var2738)
		end
	end
	return var1810
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
	local var1827 = t_63.new()
	
	if self.upsell_prompt ~= nil then
		var1827.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1827.upsell_prompt = self.upsellPrompt
	end
	return var1827
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
	local var1827 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1828, var1829 = protoModule.writeTag(buff, var1827, 1, protoModule.wireTypes.lengthDelimited)
		var1828, var2758 = protoModule.writeString(var1828, var1829, self.modal_variant)
		buff = var1828
		var1827 = var1829
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1830, var1831 = protoModule.writeTag(buff, var1827, 2, protoModule.wireTypes.lengthDelimited)
		var1830, var2760 = protoModule.writeString(var1830, var1831, self.modal_sequence)
		buff = var1830
		var1827 = var1831
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1832, var1833 = protoModule.writeTag(buff, var1827, 3, protoModule.wireTypes.lengthDelimited)
		var1832, var2762 = protoModule.writeString(var1832, var1833, self.conversation_id)
		buff = var1832
		var1827 = var1833
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1834, var1835 = protoModule.writeTag(buff, var1827, 4, protoModule.wireTypes.lengthDelimited)
		var1834, var2764 = protoModule.writeString(var1834, var1835, self.friend_id)
		buff = var1834
		var1827 = var1835
	end
	local buff_1 = buffer.create(var1827)
	buffer.copy(buff_1, 0, buff, 0, var1827)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref)
	local var1827 = t_64.new()
	local var1828 = 0
	while var1828 < buffer.len(p64) do
		local _ = nil
		local var1829 = nil
		local var1830, var1831, var1832 = protoModule.readTag(p64, var1828)
		local var1833 = var1830
		var1829 = var1831
		var1828 = var1832
		
		if var1829 == protoModule.wireTypes.varint then
			local _ = nil
			local var1834, var1835 = protoModule.readVarInt(p64, var1828)
			local _ = var1834
			var1828 = var1835
			continue
		end
		if var1829 == protoModule.wireTypes.lengthDelimited then
			if var1833 == 1 then
				local _ = nil
				local var1836, var1837 = protoModule.readBuffer(p64, var1828)
				var1828 = var1837
				var1827.modal_variant = buffer.tostring(var1836)
			elseif var1833 == 2 then
				local _ = nil
				local var1838, var1839 = protoModule.readBuffer(p64, var1828)
				var1828 = var1839
				var1827.modal_sequence = buffer.tostring(var1838)
			elseif var1833 == 3 then
				local _ = nil
				local var1840, var1841 = protoModule.readBuffer(p64, var1828)
				var1828 = var1841
				var1827.conversation_id = buffer.tostring(var1840)
			elseif var1833 == 4 then
				local _ = nil
				local var1842, var1843 = protoModule.readBuffer(p64, var1828)
				var1828 = var1843
				var1827.friend_id = buffer.tostring(var1842)
			else
				local _ = nil
				local var1844, var1845 = protoModule.readVarInt(p64, var1828)
				var1828 = var1845 + var1844
			end
		elseif var1829 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1846, var1847 = protoModule.readFixed32(p64, var1828)
			local _ = var1846
			var1828 = var1847
		elseif var1829 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1848, var1849 = protoModule.readFixed64(p64, var1828)
			local _ = var1848
			var1828 = var1849
		else
			error("Unsupported wire type: " .. var2768)
		end
	end
	return var1827
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
	local var1850 = t_64.new()
	
	if self.modal_variant ~= nil then
		var1850.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1850.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1850.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1850.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1850.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1850.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1850.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1850.friend_id = self.friendId
	end
	return var1850
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
	local var1850 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1851, var1852 = protoModule.writeTag(buff, var1850, 1, protoModule.wireTypes.lengthDelimited)
		var1851, var2794 = protoModule.writeString(var1851, var1852, self.event_id)
		buff = var1851
		var1850 = var1852
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1853, var1854 = protoModule.writeTag(buff, var1850, 2, protoModule.wireTypes.lengthDelimited)
		var1853, var2796 = protoModule.writeString(var1853, var1854, self.universe_id)
		buff = var1853
		var1850 = var1854
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1855, var1856 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1855, var2798 = protoModule.writeString(var1855, var1856, i)
			local var1857 = v:encode()
			var1856, var2800 = protoModule.writeTag(var1855, var1856, 2, protoModule.wireTypes.lengthDelimited)
			var1856, var2800 = protoModule.writeBuffer(var1856, var2800, var1857, buffer.len(var1857))
			local var1858 = var1856
			local var1859 = var2800
			local var1860, var1861 = protoModule.writeTag(buff, var1850, 3, protoModule.wireTypes.lengthDelimited)
			var1860, var2804 = protoModule.writeBuffer(var1860, var1861, var1858, var1859)
			buff = var1860
			var1850 = var1861
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1862, var1863 = protoModule.writeTag(buff, var1850, 4, protoModule.wireTypes.lengthDelimited)
			var1862, var2806 = protoModule.writeString(var1862, var1863, v)
			buff = var1862
			var1850 = var1863
		end
	end
	local buff_1 = buffer.create(var1850)
	buffer.copy(buff_1, 0, buff, 0, var1850)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref), t (ref)
	local var1864 = t_65.new()
	local var1865 = 0
	while var1865 < buffer.len(p65) do
		local _ = nil
		local var1866 = nil
		local var1867, var1868, var1869 = protoModule.readTag(p65, var1865)
		local var1870 = var1867
		var1866 = var1868
		var1865 = var1869
		
		if var1866 == protoModule.wireTypes.varint then
			local _ = nil
			local var1871, var1872 = protoModule.readVarInt(p65, var1865)
			local _ = var1871
			var1865 = var1872
			continue
		end
		if var1866 == protoModule.wireTypes.lengthDelimited then
			if var1870 == 1 then
				local _ = nil
				local var1873, var1874 = protoModule.readBuffer(p65, var1865)
				var1865 = var1874
				var1864.event_id = buffer.tostring(var1873)
			elseif var1870 == 2 then
				local _ = nil
				local var1875, var1876 = protoModule.readBuffer(p65, var1865)
				var1865 = var1876
				var1864.universe_id = buffer.tostring(var1875)
			elseif var1870 == 3 then
				local _ = nil
				local var1877, var1878 = protoModule.readBuffer(p65, var1865)
				var1865 = var1878
				var1877 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1877)
				var1864.entry_map[var1877.key or ""] = var1877.value or t.FeedEntry.new()
			elseif var1870 == 4 then
				local _ = nil
				local var1879, var1880 = protoModule.readBuffer(p65, var1865)
				var1865 = var1880
				table.insert(var1864.entry_order, buffer.tostring(var1879))
			else
				local _ = nil
				local var1881, var1882 = protoModule.readVarInt(p65, var1865)
				var1865 = var1882 + var1881
			end
		elseif var1866 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1883, var1884 = protoModule.readFixed32(p65, var1865)
			local _ = var1883
			var1865 = var1884
		elseif var1866 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1885, var1886 = protoModule.readFixed64(p65, var1865)
			local _ = var1885
			var1865 = var1886
		else
			error("Unsupported wire type: " .. var2810)
		end
	end
	return var1864
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
	local var1887 = t_65.new()
	
	if self.event_id ~= nil then
		var1887.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1887.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1887.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1887.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1887.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1887.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1887.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1887.entry_order = t_1
	end
	return var1887
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
	local var1888 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1889, var1890 = protoModule.writeTag(buff, var1888, 1, protoModule.wireTypes.lengthDelimited)
		var1889, var2842 = protoModule.writeString(var1889, var1890, self.key)
		buff = var1889
		var1888 = var1890
	end
	if self.value ~= nil then
		local var1891 = self.value:encode()
		local var1892, var1893 = protoModule.writeTag(buff, var1888, 2, protoModule.wireTypes.lengthDelimited)
		var1892, var2845 = protoModule.writeBuffer(var1892, var1893, var1891, buffer.len(var1891))
		buff = var1892
		var1888 = var1893
	end
	local buff_1 = buffer.create(var1888)
	buffer.copy(buff_1, 0, buff, 0, var1888)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1888 = t_66.new()
	local var1889 = 0
	while var1889 < buffer.len(p66) do
		local _ = nil
		local var1890 = nil
		local var1891, var1892, var1893 = protoModule.readTag(p66, var1889)
		local var1894 = var1891
		var1890 = var1892
		var1889 = var1893
		
		if var1890 == protoModule.wireTypes.varint then
			local _ = nil
			local var1895, var1896 = protoModule.readVarInt(p66, var1889)
			local _ = var1895
			var1889 = var1896
			continue
		end
		if var1890 == protoModule.wireTypes.lengthDelimited then
			if var1894 == 1 then
				local _ = nil
				local var1897, var1898 = protoModule.readBuffer(p66, var1889)
				var1889 = var1898
				var1888.key = buffer.tostring(var1897)
			elseif var1894 == 2 then
				local _ = nil
				local var1899, var1900 = protoModule.readBuffer(p66, var1889)
				var1889 = var1900
				var1888.value = t.FeedEntry.decode(var1899)
			else
				local _ = nil
				local var1901, var1902 = protoModule.readVarInt(p66, var1889)
				var1889 = var1902 + var1901
			end
		elseif var1890 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1903, var1904 = protoModule.readFixed32(p66, var1889)
			local _ = var1903
			var1889 = var1904
		elseif var1890 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1905, var1906 = protoModule.readFixed64(p66, var1889)
			local _ = var1905
			var1889 = var1906
		else
			error("Unsupported wire type: " .. var2849)
		end
	end
	return var1888
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
	local var1907 = t_66.new()
	
	if self.key ~= nil then
		var1907.key = self.key
	end
	if self.value ~= nil then
		var1907.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1907
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
	local var1907 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1908, var1909 = protoModule.writeTag(buff, var1907, 1, protoModule.wireTypes.lengthDelimited)
		var1908, var2871 = protoModule.writeString(var1908, var1909, self.event_id)
		buff = var1908
		var1907 = var1909
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1910, var1911 = protoModule.writeTag(buff, var1907, 2, protoModule.wireTypes.lengthDelimited)
		var1910, var2873 = protoModule.writeString(var1910, var1911, self.universe_id)
		buff = var1910
		var1907 = var1911
	end
	local buff_1 = buffer.create(var1907)
	buffer.copy(buff_1, 0, buff, 0, var1907)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref)
	local var1907 = t_67.new()
	local var1908 = 0
	while var1908 < buffer.len(p67) do
		local _ = nil
		local var1909 = nil
		local var1910, var1911, var1912 = protoModule.readTag(p67, var1908)
		local var1913 = var1910
		var1909 = var1911
		var1908 = var1912
		
		if var1909 == protoModule.wireTypes.varint then
			local _ = nil
			local var1914, var1915 = protoModule.readVarInt(p67, var1908)
			local _ = var1914
			var1908 = var1915
			continue
		end
		if var1909 == protoModule.wireTypes.lengthDelimited then
			if var1913 == 1 then
				local _ = nil
				local var1916, var1917 = protoModule.readBuffer(p67, var1908)
				var1908 = var1917
				var1907.event_id = buffer.tostring(var1916)
			elseif var1913 == 2 then
				local _ = nil
				local var1918, var1919 = protoModule.readBuffer(p67, var1908)
				var1908 = var1919
				var1907.universe_id = buffer.tostring(var1918)
			else
				local _ = nil
				local var1920, var1921 = protoModule.readVarInt(p67, var1908)
				var1908 = var1921 + var1920
			end
		elseif var1909 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1922, var1923 = protoModule.readFixed32(p67, var1908)
			local _ = var1922
			var1908 = var1923
		elseif var1909 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1924, var1925 = protoModule.readFixed64(p67, var1908)
			local _ = var1924
			var1908 = var1925
		else
			error("Unsupported wire type: " .. var2877)
		end
	end
	return var1907
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
	local var1926 = t_67.new()
	
	if self.event_id ~= nil then
		var1926.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1926.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1926.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1926.universe_id = self.universeId
	end
	return var1926
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
	local var1926 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1927, var1928 = protoModule.writeTag(buff, var1926, 1, protoModule.wireTypes.lengthDelimited)
		var1927, var2899 = protoModule.writeString(var1927, var1928, self.event_id)
		buff = var1927
		var1926 = var1928
	end
	local buff_1 = buffer.create(var1926)
	buffer.copy(buff_1, 0, buff, 0, var1926)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1926 = t_68.new()
	local var1927 = 0
	while var1927 < buffer.len(p68) do
		local _ = nil
		local var1928 = nil
		local var1929, var1930, var1931 = protoModule.readTag(p68, var1927)
		local var1932 = var1929
		var1928 = var1930
		var1927 = var1931
		
		if var1928 == protoModule.wireTypes.varint then
			local _ = nil
			local var1933, var1934 = protoModule.readVarInt(p68, var1927)
			local _ = var1933
			var1927 = var1934
			continue
		end
		if var1928 == protoModule.wireTypes.lengthDelimited then
			if var1932 == 1 then
				local _ = nil
				local var1935, var1936 = protoModule.readBuffer(p68, var1927)
				var1927 = var1936
				var1926.event_id = buffer.tostring(var1935)
			else
				local _ = nil
				local var1937, var1938 = protoModule.readVarInt(p68, var1927)
				var1927 = var1938 + var1937
			end
		elseif var1928 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1939, var1940 = protoModule.readFixed32(p68, var1927)
			local _ = var1939
			var1927 = var1940
		elseif var1928 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1941, var1942 = protoModule.readFixed64(p68, var1927)
			local _ = var1941
			var1927 = var1942
		else
			error("Unsupported wire type: " .. var2903)
		end
	end
	return var1926
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
	local var1943 = t_68.new()
	
	if self.event_id ~= nil then
		var1943.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1943.event_id = self.eventId
	end
	return var1943
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
	local var1943 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1944, var1945 = protoModule.writeTag(buff, var1943, 1, protoModule.wireTypes.lengthDelimited)
		var1944, var2923 = protoModule.writeString(var1944, var1945, self.event_id)
		buff = var1944
		var1943 = var1945
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1946, var1947 = protoModule.writeTag(buff, var1943, 2, protoModule.wireTypes.lengthDelimited)
		var1946, var2925 = protoModule.writeString(var1946, var1947, self.universe_id)
		buff = var1946
		var1943 = var1947
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var1948 = v:encode()
			local var1949, var1950 = protoModule.writeTag(buff, var1943, 3, protoModule.wireTypes.lengthDelimited)
			var1949, var2928 = protoModule.writeBuffer(var1949, var1950, var1948, buffer.len(var1948))
			buff = var1949
			var1943 = var1950
		end
	end
	local buff_1 = buffer.create(var1943)
	buffer.copy(buff_1, 0, buff, 0, var1943)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref), t (ref)
	local var1951 = t_69.new()
	local var1952 = 0
	while var1952 < buffer.len(p69) do
		local _ = nil
		local var1953 = nil
		local var1954, var1955, var1956 = protoModule.readTag(p69, var1952)
		local var1957 = var1954
		var1953 = var1955
		var1952 = var1956
		
		if var1953 == protoModule.wireTypes.varint then
			local _ = nil
			local var1958, var1959 = protoModule.readVarInt(p69, var1952)
			local _ = var1958
			var1952 = var1959
			continue
		end
		if var1953 == protoModule.wireTypes.lengthDelimited then
			if var1957 == 1 then
				local _ = nil
				local var1960, var1961 = protoModule.readBuffer(p69, var1952)
				var1952 = var1961
				var1951.event_id = buffer.tostring(var1960)
			elseif var1957 == 2 then
				local _ = nil
				local var1962, var1963 = protoModule.readBuffer(p69, var1952)
				var1952 = var1963
				var1951.universe_id = buffer.tostring(var1962)
			elseif var1957 == 3 then
				local _ = nil
				local var1964, var1965 = protoModule.readBuffer(p69, var1952)
				var1952 = var1965
				table.insert(var1951.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var1964))
			else
				local _ = nil
				local var1966, var1967 = protoModule.readVarInt(p69, var1952)
				var1952 = var1967 + var1966
			end
		elseif var1953 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1968, var1969 = protoModule.readFixed32(p69, var1952)
			local _ = var1968
			var1952 = var1969
		elseif var1953 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1970, var1971 = protoModule.readFixed64(p69, var1952)
			local _ = var1970
			var1952 = var1971
		else
			error("Unsupported wire type: " .. var2932)
		end
	end
	return var1951
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
	local var1972 = t_69.new()
	
	if self.event_id ~= nil then
		var1972.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1972.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1972.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1972.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1972.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1972.rsvp_users = t_1
	end
	return var1972
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
	local var1973 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var1974, var1975 = protoModule.writeTag(buff, var1973, 1, protoModule.wireTypes.varint)
		var1974, var2959 = protoModule.writeVarInt(var1974, var1975, self.user_id)
		buff = var1974
		var1973 = var1975
	end
	local buff_1 = buffer.create(var1973)
	buffer.copy(buff_1, 0, buff, 0, var1973)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var1973 = t_70.new()
	local var1974 = 0
	while var1974 < buffer.len(p70) do
		local _ = nil
		local _ = nil
		local var1975, var1976, var1977 = protoModule.readTag(p70, var1974)
		local var1978 = var1975
		local var1979 = var1976
		var1974 = var1977
		
		if var1979 == protoModule.wireTypes.varint then
			if var1978 == 1 then
				local _ = nil
				local var1980, var1981 = protoModule.readVarIntI64(p70, var1974)
				var1974 = var1981
				var1973.user_id = var1980
			else
				local _ = nil
				local var1982, var1983 = protoModule.readVarInt(p70, var1974)
				local _ = var1982
				var1974 = var1983
			end
		elseif var1979 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1984, var1985 = protoModule.readVarInt(p70, var1974)
			var1974 = var1985 + var1984
		elseif var1979 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1986, var1987 = protoModule.readFixed32(p70, var1974)
			local _ = var1986
			var1974 = var1987
		elseif var1979 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1988, var1989 = protoModule.readFixed64(p70, var1974)
			local _ = var1988
			var1974 = var1989
		else
			error("Unsupported wire type: " .. var2967)
		end
	end
	return var1973
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
	local var1990 = t_70.new()
	
	if self.user_id ~= nil then
		var1990.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1990.user_id = self.userId
	end
	return var1990
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
	local var1990 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1991, var1992 = protoModule.writeTag(buff, var1990, 1, protoModule.wireTypes.lengthDelimited)
		var1991, var2983 = protoModule.writeString(var1991, var1992, self.event_id)
		buff = var1991
		var1990 = var1992
	end
	local buff_1 = buffer.create(var1990)
	buffer.copy(buff_1, 0, buff, 0, var1990)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var1990 = t_71.new()
	local var1991 = 0
	while var1991 < buffer.len(p71) do
		local _ = nil
		local var1992 = nil
		local var1993, var1994, var1995 = protoModule.readTag(p71, var1991)
		local var1996 = var1993
		var1992 = var1994
		var1991 = var1995
		
		if var1992 == protoModule.wireTypes.varint then
			local _ = nil
			local var1997, var1998 = protoModule.readVarInt(p71, var1991)
			local _ = var1997
			var1991 = var1998
			continue
		end
		if var1992 == protoModule.wireTypes.lengthDelimited then
			if var1996 == 1 then
				local _ = nil
				local var1999, var2000 = protoModule.readBuffer(p71, var1991)
				var1991 = var2000
				var1990.event_id = buffer.tostring(var1999)
			else
				local _ = nil
				local var2001, var2002 = protoModule.readVarInt(p71, var1991)
				var1991 = var2002 + var2001
			end
		elseif var1992 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2003, var2004 = protoModule.readFixed32(p71, var1991)
			local _ = var2003
			var1991 = var2004
		elseif var1992 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2005, var2006 = protoModule.readFixed64(p71, var1991)
			local _ = var2005
			var1991 = var2006
		else
			error("Unsupported wire type: " .. var2987)
		end
	end
	return var1990
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
	local var2007 = t_71.new()
	
	if self.event_id ~= nil then
		var2007.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2007.event_id = self.eventId
	end
	return var2007
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
	local var2007 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2008, var2009 = protoModule.writeTag(buff, var2007, 1, protoModule.wireTypes.lengthDelimited)
		var2008, var3007 = protoModule.writeString(var2008, var2009, self.event_id)
		buff = var2008
		var2007 = var2009
	end
	local buff_1 = buffer.create(var2007)
	buffer.copy(buff_1, 0, buff, 0, var2007)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2007 = t_72.new()
	local var2008 = 0
	while var2008 < buffer.len(p72) do
		local _ = nil
		local var2009 = nil
		local var2010, var2011, var2012 = protoModule.readTag(p72, var2008)
		local var2013 = var2010
		var2009 = var2011
		var2008 = var2012
		
		if var2009 == protoModule.wireTypes.varint then
			local _ = nil
			local var2014, var2015 = protoModule.readVarInt(p72, var2008)
			local _ = var2014
			var2008 = var2015
			continue
		end
		if var2009 == protoModule.wireTypes.lengthDelimited then
			if var2013 == 1 then
				local _ = nil
				local var2016, var2017 = protoModule.readBuffer(p72, var2008)
				var2008 = var2017
				var2007.event_id = buffer.tostring(var2016)
			else
				local _ = nil
				local var2018, var2019 = protoModule.readVarInt(p72, var2008)
				var2008 = var2019 + var2018
			end
		elseif var2009 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2020, var2021 = protoModule.readFixed32(p72, var2008)
			local _ = var2020
			var2008 = var2021
		elseif var2009 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2022, var2023 = protoModule.readFixed64(p72, var2008)
			local _ = var2022
			var2008 = var2023
		else
			error("Unsupported wire type: " .. var3011)
		end
	end
	return var2007
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
	local var2024 = t_72.new()
	
	if self.event_id ~= nil then
		var2024.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2024.event_id = self.eventId
	end
	return var2024
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
	local var2024 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2025, var2026 = protoModule.writeTag(buff, var2024, 1, protoModule.wireTypes.lengthDelimited)
		var2025, var3031 = protoModule.writeString(var2025, var2026, self.event_id)
		buff = var2025
		var2024 = var2026
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2027, var2028 = protoModule.writeTag(buff, var2024, 2, protoModule.wireTypes.lengthDelimited)
		var2027, var3033 = protoModule.writeString(var2027, var2028, self.universe_id)
		buff = var2027
		var2024 = var2028
	end
	local buff_1 = buffer.create(var2024)
	buffer.copy(buff_1, 0, buff, 0, var2024)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2024 = t_73.new()
	local var2025 = 0
	while var2025 < buffer.len(p73) do
		local _ = nil
		local var2026 = nil
		local var2027, var2028, var2029 = protoModule.readTag(p73, var2025)
		local var2030 = var2027
		var2026 = var2028
		var2025 = var2029
		
		if var2026 == protoModule.wireTypes.varint then
			local _ = nil
			local var2031, var2032 = protoModule.readVarInt(p73, var2025)
			local _ = var2031
			var2025 = var2032
			continue
		end
		if var2026 == protoModule.wireTypes.lengthDelimited then
			if var2030 == 1 then
				local _ = nil
				local var2033, var2034 = protoModule.readBuffer(p73, var2025)
				var2025 = var2034
				var2024.event_id = buffer.tostring(var2033)
			elseif var2030 == 2 then
				local _ = nil
				local var2035, var2036 = protoModule.readBuffer(p73, var2025)
				var2025 = var2036
				var2024.universe_id = buffer.tostring(var2035)
			else
				local _ = nil
				local var2037, var2038 = protoModule.readVarInt(p73, var2025)
				var2025 = var2038 + var2037
			end
		elseif var2026 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2039, var2040 = protoModule.readFixed32(p73, var2025)
			local _ = var2039
			var2025 = var2040
		elseif var2026 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2041, var2042 = protoModule.readFixed64(p73, var2025)
			local _ = var2041
			var2025 = var2042
		else
			error("Unsupported wire type: " .. var3037)
		end
	end
	return var2024
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
	local var2043 = t_73.new()
	
	if self.event_id ~= nil then
		var2043.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2043.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2043.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2043.universe_id = self.universeId
	end
	return var2043
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
	local var2043 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2044, var2045 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2044, var3059 = protoModule.writeString(var2044, var2045, i)
			local var2046 = v:encode()
			var2045, var3061 = protoModule.writeTag(var2044, var2045, 2, protoModule.wireTypes.lengthDelimited)
			var2045, var3061 = protoModule.writeBuffer(var2045, var3061, var2046, buffer.len(var2046))
			local var2047 = var2045
			local var2048 = var3061
			local var2049, var2050 = protoModule.writeTag(buff, var2043, 1, protoModule.wireTypes.lengthDelimited)
			var2049, var3065 = protoModule.writeBuffer(var2049, var2050, var2047, var2048)
			buff = var2049
			var2043 = var2050
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2051, var2052 = protoModule.writeTag(buff, var2043, 2, protoModule.wireTypes.lengthDelimited)
			var2051, var3067 = protoModule.writeString(var2051, var2052, v)
			buff = var2051
			var2043 = var2052
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2053, var2054 = protoModule.writeTag(buff, var2043, 3, protoModule.wireTypes.lengthDelimited)
		var2053, var3069 = protoModule.writeString(var2053, var2054, self.next_page_token)
		buff = var2053
		var2043 = var2054
	end
	if self.sticky_filter_pills ~= nil then
		local var2055 = self.sticky_filter_pills:encode()
		local var2056, var2057 = protoModule.writeTag(buff, var2043, 4, protoModule.wireTypes.lengthDelimited)
		var2056, var3072 = protoModule.writeBuffer(var2056, var2057, var2055, buffer.len(var2055))
		buff = var2056
		var2043 = var2057
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2058, var2059 = protoModule.writeTag(buff, var2043, 5, protoModule.wireTypes.lengthDelimited)
		var2058, var3074 = protoModule.writeString(var2058, var2059, self.applied_filters)
		buff = var2058
		var2043 = var2059
	end
	local buff_1 = buffer.create(var2043)
	buffer.copy(buff_1, 0, buff, 0, var2043)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2060 = t_74.new()
	local var2061 = 0
	while var2061 < buffer.len(p74) do
		local _ = nil
		local var2062 = nil
		local var2063, var2064, var2065 = protoModule.readTag(p74, var2061)
		local var2066 = var2063
		var2062 = var2064
		var2061 = var2065
		
		if var2062 == protoModule.wireTypes.varint then
			local _ = nil
			local var2067, var2068 = protoModule.readVarInt(p74, var2061)
			local _ = var2067
			var2061 = var2068
			continue
		end
		if var2062 == protoModule.wireTypes.lengthDelimited then
			if var2066 == 1 then
				local _ = nil
				local var2069, var2070 = protoModule.readBuffer(p74, var2061)
				var2061 = var2070
				var2069 = t.ChartsFeedInputData_EntryMapEntry.decode(var2069)
				var2060.entry_map[var2069.key or ""] = var2069.value or t.FeedEntry.new()
			elseif var2066 == 2 then
				local _ = nil
				local var2071, var2072 = protoModule.readBuffer(p74, var2061)
				var2061 = var2072
				table.insert(var2060.entry_order, buffer.tostring(var2071))
			elseif var2066 == 3 then
				local _ = nil
				local var2073, var2074 = protoModule.readBuffer(p74, var2061)
				var2061 = var2074
				var2060.next_page_token = buffer.tostring(var2073)
			elseif var2066 == 4 then
				local _ = nil
				local var2075, var2076 = protoModule.readBuffer(p74, var2061)
				var2061 = var2076
				var2060.sticky_filter_pills = t.FilterPillsInputData.decode(var2075)
			elseif var2066 == 5 then
				local _ = nil
				local var2077, var2078 = protoModule.readBuffer(p74, var2061)
				var2061 = var2078
				var2060.applied_filters = buffer.tostring(var2077)
			else
				local _ = nil
				local var2079, var2080 = protoModule.readVarInt(p74, var2061)
				var2061 = var2080 + var2079
			end
		elseif var2062 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2081, var2082 = protoModule.readFixed32(p74, var2061)
			local _ = var2081
			var2061 = var2082
		elseif var2062 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2083, var2084 = protoModule.readFixed64(p74, var2061)
			local _ = var2083
			var2061 = var2084
		else
			error("Unsupported wire type: " .. var3078)
		end
	end
	return var2060
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
	local var2085 = t_74.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2085.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2085.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2085.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2085.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2085.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2085.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2085.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2085.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2085.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2085.applied_filters = self.appliedFilters
	end
	return var2085
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
	local var2086 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2087, var2088 = protoModule.writeTag(buff, var2086, 1, protoModule.wireTypes.lengthDelimited)
		var2087, var3112 = protoModule.writeString(var2087, var2088, self.key)
		buff = var2087
		var2086 = var2088
	end
	if self.value ~= nil then
		local var2089 = self.value:encode()
		local var2090, var2091 = protoModule.writeTag(buff, var2086, 2, protoModule.wireTypes.lengthDelimited)
		var2090, var3115 = protoModule.writeBuffer(var2090, var2091, var2089, buffer.len(var2089))
		buff = var2090
		var2086 = var2091
	end
	local buff_1 = buffer.create(var2086)
	buffer.copy(buff_1, 0, buff, 0, var2086)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2086 = t_75.new()
	local var2087 = 0
	while var2087 < buffer.len(p75) do
		local _ = nil
		local var2088 = nil
		local var2089, var2090, var2091 = protoModule.readTag(p75, var2087)
		local var2092 = var2089
		var2088 = var2090
		var2087 = var2091
		
		if var2088 == protoModule.wireTypes.varint then
			local _ = nil
			local var2093, var2094 = protoModule.readVarInt(p75, var2087)
			local _ = var2093
			var2087 = var2094
			continue
		end
		if var2088 == protoModule.wireTypes.lengthDelimited then
			if var2092 == 1 then
				local _ = nil
				local var2095, var2096 = protoModule.readBuffer(p75, var2087)
				var2087 = var2096
				var2086.key = buffer.tostring(var2095)
			elseif var2092 == 2 then
				local _ = nil
				local var2097, var2098 = protoModule.readBuffer(p75, var2087)
				var2087 = var2098
				var2086.value = t.FeedEntry.decode(var2097)
			else
				local _ = nil
				local var2099, var2100 = protoModule.readVarInt(p75, var2087)
				var2087 = var2100 + var2099
			end
		elseif var2088 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2101, var2102 = protoModule.readFixed32(p75, var2087)
			local _ = var2101
			var2087 = var2102
		elseif var2088 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2103, var2104 = protoModule.readFixed64(p75, var2087)
			local _ = var2103
			var2087 = var2104
		else
			error("Unsupported wire type: " .. var3119)
		end
	end
	return var2086
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
	local var2105 = t_75.new()
	
	if self.key ~= nil then
		var2105.key = self.key
	end
	if self.value ~= nil then
		var2105.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2105
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
	local var2105 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2106 = v:encode()
			local var2107, var2108 = protoModule.writeTag(buff, var2105, 1, protoModule.wireTypes.lengthDelimited)
			var2107, var3142 = protoModule.writeBuffer(var2107, var2108, var2106, buffer.len(var2106))
			buff = var2107
			var2105 = var2108
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2109, var2110 = protoModule.writeTag(buff, var2105, 2, protoModule.wireTypes.lengthDelimited)
		var2109, var3144 = protoModule.writeString(var2109, var2110, self.sort_id)
		buff = var2109
		var2105 = var2110
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2111, var2112 = protoModule.writeTag(buff, var2105, 3, protoModule.wireTypes.varint)
		var2111, var3146 = protoModule.writeVarInt(var2111, var2112, self.secondary_sort_id)
		buff = var2111
		var2105 = var2112
	end
	if self.title ~= nil and self.title ~= "" then
		local var2113, var2114 = protoModule.writeTag(buff, var2105, 4, protoModule.wireTypes.lengthDelimited)
		var2113, var3148 = protoModule.writeString(var2113, var2114, self.title)
		buff = var2113
		var2105 = var2114
	end
	if self.primary_sort_id ~= nil then
		local var2115, var2116 = protoModule.writeTag(buff, var2105, 5, protoModule.wireTypes.varint)
		var2115, var3150 = protoModule.writeVarInt(var2115, var2116, self.primary_sort_id)
		buff = var2115
		var2105 = var2116
	end
	if self.applied_filters ~= nil then
		local var2117, var2118 = protoModule.writeTag(buff, var2105, 6, protoModule.wireTypes.lengthDelimited)
		var2117, var3152 = protoModule.writeString(var2117, var2118, self.applied_filters)
		buff = var2117
		var2105 = var2118
	end
	local buff_1 = buffer.create(var2105)
	buffer.copy(buff_1, 0, buff, 0, var2105)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2119 = t_76.new()
	local var2120 = 0
	while var2120 < buffer.len(p76) do
		local _ = nil
		local var2121 = nil
		local var2122, var2123, var2124 = protoModule.readTag(p76, var2120)
		local var2125 = var2122
		var2121 = var2123
		var2120 = var2124
		
		if var2121 == protoModule.wireTypes.varint then
			if var2125 == 3 then
				local _ = nil
				local var2126, var2127 = protoModule.readVarIntI32(p76, var2120)
				var2120 = var2127
				var2119.secondary_sort_id = var2126
			elseif var2125 == 5 then
				local _ = nil
				local var2128, var2129 = protoModule.readVarIntI32(p76, var2120)
				var2120 = var2129
				var2119.primary_sort_id = var2128
			else
				local _ = nil
				local var2130, var2131 = protoModule.readVarInt(p76, var2120)
				local _ = var2130
				var2120 = var2131
			end
		end
		if var2121 == protoModule.wireTypes.lengthDelimited then
			if var2125 == 1 then
				local _ = nil
				local var2132, var2133 = protoModule.readBuffer(p76, var2120)
				var2120 = var2133
				table.insert(var2119.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2132))
			elseif var2125 == 2 then
				local _ = nil
				local var2134, var2135 = protoModule.readBuffer(p76, var2120)
				var2120 = var2135
				var2119.sort_id = buffer.tostring(var2134)
			elseif var2125 == 4 then
				local _ = nil
				local var2136, var2137 = protoModule.readBuffer(p76, var2120)
				var2120 = var2137
				var2119.title = buffer.tostring(var2136)
			elseif var2125 == 6 then
				local _ = nil
				local var2138, var2139 = protoModule.readBuffer(p76, var2120)
				var2120 = var2139
				var2119.applied_filters = buffer.tostring(var2138)
			else
				local _ = nil
				local var2140, var2141 = protoModule.readVarInt(p76, var2120)
				var2120 = var2141 + var2140
			end
		elseif var2121 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2142, var2143 = protoModule.readFixed32(p76, var2120)
			local _ = var2142
			var2120 = var2143
		elseif var2121 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2144, var2145 = protoModule.readFixed64(p76, var2120)
			local _ = var2144
			var2120 = var2145
		else
			error("Unsupported wire type: " .. var3156)
		end
	end
	return var2119
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
	local var2146 = t_76.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2146.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2146.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2146.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2146.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2146.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2146.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2146.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2146.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2146.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2146.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2146.applied_filters = self.appliedFilters
	end
	return var2146
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
	local var2147 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2148, var2149 = protoModule.writeTag(buff, var2147, 1, protoModule.wireTypes.lengthDelimited)
		var2148, var3189 = protoModule.writeString(var2148, var2149, self.filter_id)
		buff = var2148
		var2147 = var2149
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2150, var2151 = protoModule.writeTag(buff, var2147, 2, protoModule.wireTypes.lengthDelimited)
		var2150, var3191 = protoModule.writeString(var2150, var2151, self.display_name)
		buff = var2150
		var2147 = var2151
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2152 = v:encode()
			local var2153, var2154 = protoModule.writeTag(buff, var2147, 3, protoModule.wireTypes.lengthDelimited)
			var2153, var3194 = protoModule.writeBuffer(var2153, var2154, var2152, buffer.len(var2152))
			buff = var2153
			var2147 = var2154
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2155, var2156 = protoModule.writeTag(buff, var2147, 4, protoModule.wireTypes.lengthDelimited)
		var2155, var3196 = protoModule.writeString(var2155, var2156, self.default_option_id)
		buff = var2155
		var2147 = var2156
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2157, var2158 = protoModule.writeTag(buff, var2147, 5, protoModule.wireTypes.lengthDelimited)
		var2157, var3198 = protoModule.writeString(var2157, var2158, self.selected_option_id)
		buff = var2157
		var2147 = var2158
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2159, var2160 = protoModule.writeTag(buff, var2147, 6, protoModule.wireTypes.lengthDelimited)
		var2159, var3200 = protoModule.writeString(var2159, var2160, self.filter_type)
		buff = var2159
		var2147 = var2160
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2161, var2162 = protoModule.writeTag(buff, var2147, 7, protoModule.wireTypes.lengthDelimited)
			var2161, var3202 = protoModule.writeString(var2161, var2162, v)
			buff = var2161
			var2147 = var2162
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2163, var2164 = protoModule.writeTag(buff, var2147, 8, protoModule.wireTypes.lengthDelimited)
		var2163, var3204 = protoModule.writeString(var2163, var2164, self.info_text)
		buff = var2163
		var2147 = var2164
	end
	local buff_1 = buffer.create(var2147)
	buffer.copy(buff_1, 0, buff, 0, var2147)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2165 = t_77.new()
	local var2166 = 0
	while var2166 < buffer.len(p77) do
		local _ = nil
		local var2167 = nil
		local var2168, var2169, var2170 = protoModule.readTag(p77, var2166)
		local var2171 = var2168
		var2167 = var2169
		var2166 = var2170
		
		if var2167 == protoModule.wireTypes.varint then
			local _ = nil
			local var2172, var2173 = protoModule.readVarInt(p77, var2166)
			local _ = var2172
			var2166 = var2173
			continue
		end
		if var2167 == protoModule.wireTypes.lengthDelimited then
			if var2171 == 1 then
				local _ = nil
				local var2174, var2175 = protoModule.readBuffer(p77, var2166)
				var2166 = var2175
				var2165.filter_id = buffer.tostring(var2174)
			elseif var2171 == 2 then
				local _ = nil
				local var2176, var2177 = protoModule.readBuffer(p77, var2166)
				var2166 = var2177
				var2165.display_name = buffer.tostring(var2176)
			elseif var2171 == 3 then
				local _ = nil
				local var2178, var2179 = protoModule.readBuffer(p77, var2166)
				var2166 = var2179
				table.insert(var2165.options, t.FilterPillsInputData_FilterOption.decode(var2178))
			elseif var2171 == 4 then
				local _ = nil
				local var2180, var2181 = protoModule.readBuffer(p77, var2166)
				var2166 = var2181
				var2165.default_option_id = buffer.tostring(var2180)
			elseif var2171 == 5 then
				local _ = nil
				local var2182, var2183 = protoModule.readBuffer(p77, var2166)
				var2166 = var2183
				var2165.selected_option_id = buffer.tostring(var2182)
			elseif var2171 == 6 then
				local _ = nil
				local var2184, var2185 = protoModule.readBuffer(p77, var2166)
				var2166 = var2185
				var2165.filter_type = buffer.tostring(var2184)
			elseif var2171 == 7 then
				local _ = nil
				local var2186, var2187 = protoModule.readBuffer(p77, var2166)
				var2166 = var2187
				table.insert(var2165.inactive_option_ids, buffer.tostring(var2186))
			elseif var2171 == 8 then
				local _ = nil
				local var2188, var2189 = protoModule.readBuffer(p77, var2166)
				var2166 = var2189
				var2165.info_text = buffer.tostring(var2188)
			else
				local _ = nil
				local var2190, var2191 = protoModule.readVarInt(p77, var2166)
				var2166 = var2191 + var2190
			end
		elseif var2167 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2192, var2193 = protoModule.readFixed32(p77, var2166)
			local _ = var2192
			var2166 = var2193
		elseif var2167 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2194, var2195 = protoModule.readFixed64(p77, var2166)
			local _ = var2194
			var2166 = var2195
		else
			error("Unsupported wire type: " .. var3208)
		end
	end
	return var2165
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
	local var2196 = t_77.new()
	
	if self.filter_id ~= nil then
		var2196.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2196.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2196.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2196.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2196.options = t_1
	end
	if self.default_option_id ~= nil then
		var2196.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2196.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2196.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2196.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2196.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2196.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2196.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2196.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2196.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2196.info_text = self.infoText
	end
	return var2196
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
	local var2197 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2198, var2199 = protoModule.writeTag(buff, var2197, 1, protoModule.wireTypes.lengthDelimited)
		var2198, var3247 = protoModule.writeString(var2198, var2199, self.option_id)
		buff = var2198
		var2197 = var2199
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2200, var2201 = protoModule.writeTag(buff, var2197, 2, protoModule.wireTypes.lengthDelimited)
		var2200, var3249 = protoModule.writeString(var2200, var2201, self.display_name)
		buff = var2200
		var2197 = var2201
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2202, var2203 = protoModule.writeTag(buff, var2197, 3, protoModule.wireTypes.lengthDelimited)
		var2202, var3251 = protoModule.writeString(var2202, var2203, self.option_context_tag)
		buff = var2202
		var2197 = var2203
	end
	local buff_1 = buffer.create(var2197)
	buffer.copy(buff_1, 0, buff, 0, var2197)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var2197 = t_78.new()
	local var2198 = 0
	while var2198 < buffer.len(p78) do
		local _ = nil
		local var2199 = nil
		local var2200, var2201, var2202 = protoModule.readTag(p78, var2198)
		local var2203 = var2200
		var2199 = var2201
		var2198 = var2202
		
		if var2199 == protoModule.wireTypes.varint then
			local _ = nil
			local var2204, var2205 = protoModule.readVarInt(p78, var2198)
			local _ = var2204
			var2198 = var2205
			continue
		end
		if var2199 == protoModule.wireTypes.lengthDelimited then
			if var2203 == 1 then
				local _ = nil
				local var2206, var2207 = protoModule.readBuffer(p78, var2198)
				var2198 = var2207
				var2197.option_id = buffer.tostring(var2206)
			elseif var2203 == 2 then
				local _ = nil
				local var2208, var2209 = protoModule.readBuffer(p78, var2198)
				var2198 = var2209
				var2197.display_name = buffer.tostring(var2208)
			elseif var2203 == 3 then
				local _ = nil
				local var2210, var2211 = protoModule.readBuffer(p78, var2198)
				var2198 = var2211
				var2197.option_context_tag = buffer.tostring(var2210)
			else
				local _ = nil
				local var2212, var2213 = protoModule.readVarInt(p78, var2198)
				var2198 = var2213 + var2212
			end
		elseif var2199 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2214, var2215 = protoModule.readFixed32(p78, var2198)
			local _ = var2214
			var2198 = var2215
		elseif var2199 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2216, var2217 = protoModule.readFixed64(p78, var2198)
			local _ = var2216
			var2198 = var2217
		else
			error("Unsupported wire type: " .. var3255)
		end
	end
	return var2197
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
	local var2218 = t_78.new()
	
	if self.option_id ~= nil then
		var2218.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2218.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2218.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2218.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2218.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2218.option_context_tag = self.optionContextTag
	end
	return var2218
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
	local var2218 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2219 = v:encode()
			local var2220, var2221 = protoModule.writeTag(buff, var2218, 1, protoModule.wireTypes.lengthDelimited)
			var2220, var3280 = protoModule.writeBuffer(var2220, var2221, var2219, buffer.len(var2219))
			buff = var2220
			var2218 = var2221
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2222, var2223 = protoModule.writeTag(buff, var2218, 2, protoModule.wireTypes.lengthDelimited)
		var2222, var3282 = protoModule.writeString(var2222, var2223, self.selected_sort_id)
		buff = var2222
		var2218 = var2223
	end
	local buff_1 = buffer.create(var2218)
	buffer.copy(buff_1, 0, buff, 0, var2218)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2224 = t_79.new()
	local var2225 = 0
	while var2225 < buffer.len(p79) do
		local _ = nil
		local var2226 = nil
		local var2227, var2228, var2229 = protoModule.readTag(p79, var2225)
		local var2230 = var2227
		var2226 = var2228
		var2225 = var2229
		
		if var2226 == protoModule.wireTypes.varint then
			local _ = nil
			local var2231, var2232 = protoModule.readVarInt(p79, var2225)
			local _ = var2231
			var2225 = var2232
			continue
		end
		if var2226 == protoModule.wireTypes.lengthDelimited then
			if var2230 == 1 then
				local _ = nil
				local var2233, var2234 = protoModule.readBuffer(p79, var2225)
				var2225 = var2234
				table.insert(var2224.sort_options, t.SortSelectorInputData_SortOption.decode(var2233))
			elseif var2230 == 2 then
				local _ = nil
				local var2235, var2236 = protoModule.readBuffer(p79, var2225)
				var2225 = var2236
				var2224.selected_sort_id = buffer.tostring(var2235)
			else
				local _ = nil
				local var2237, var2238 = protoModule.readVarInt(p79, var2225)
				var2225 = var2238 + var2237
			end
		elseif var2226 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2239, var2240 = protoModule.readFixed32(p79, var2225)
			local _ = var2239
			var2225 = var2240
		elseif var2226 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2241, var2242 = protoModule.readFixed64(p79, var2225)
			local _ = var2241
			var2225 = var2242
		else
			error("Unsupported wire type: " .. var3286)
		end
	end
	return var2224
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
	local var2243 = t_79.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2243.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2243.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2243.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2243.selected_sort_id = self.selectedSortId
	end
	return var2243
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
	local var2244 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2245, var2246 = protoModule.writeTag(buff, var2244, 1, protoModule.wireTypes.lengthDelimited)
		var2245, var3311 = protoModule.writeString(var2245, var2246, self.sort_id)
		buff = var2245
		var2244 = var2246
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2247, var2248 = protoModule.writeTag(buff, var2244, 2, protoModule.wireTypes.lengthDelimited)
		var2247, var3313 = protoModule.writeString(var2247, var2248, self.display_name)
		buff = var2247
		var2244 = var2248
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2249, var2250 = protoModule.writeTag(buff, var2244, 3, protoModule.wireTypes.lengthDelimited)
		var2249, var3315 = protoModule.writeString(var2249, var2250, self.content_type)
		buff = var2249
		var2244 = var2250
	end
	local buff_1 = buffer.create(var2244)
	buffer.copy(buff_1, 0, buff, 0, var2244)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref)
	local var2244 = t_80.new()
	local var2245 = 0
	while var2245 < buffer.len(p80) do
		local _ = nil
		local var2246 = nil
		local var2247, var2248, var2249 = protoModule.readTag(p80, var2245)
		local var2250 = var2247
		var2246 = var2248
		var2245 = var2249
		
		if var2246 == protoModule.wireTypes.varint then
			local _ = nil
			local var2251, var2252 = protoModule.readVarInt(p80, var2245)
			local _ = var2251
			var2245 = var2252
			continue
		end
		if var2246 == protoModule.wireTypes.lengthDelimited then
			if var2250 == 1 then
				local _ = nil
				local var2253, var2254 = protoModule.readBuffer(p80, var2245)
				var2245 = var2254
				var2244.sort_id = buffer.tostring(var2253)
			elseif var2250 == 2 then
				local _ = nil
				local var2255, var2256 = protoModule.readBuffer(p80, var2245)
				var2245 = var2256
				var2244.display_name = buffer.tostring(var2255)
			elseif var2250 == 3 then
				local _ = nil
				local var2257, var2258 = protoModule.readBuffer(p80, var2245)
				var2245 = var2258
				var2244.content_type = buffer.tostring(var2257)
			else
				local _ = nil
				local var2259, var2260 = protoModule.readVarInt(p80, var2245)
				var2245 = var2260 + var2259
			end
		elseif var2246 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2261, var2262 = protoModule.readFixed32(p80, var2245)
			local _ = var2261
			var2245 = var2262
		elseif var2246 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2263, var2264 = protoModule.readFixed64(p80, var2245)
			local _ = var2263
			var2245 = var2264
		else
			error("Unsupported wire type: " .. var3319)
		end
	end
	return var2244
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
	local var2265 = t_80.new()
	
	if self.sort_id ~= nil then
		var2265.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2265.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2265.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2265.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2265.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2265.content_type = self.contentType
	end
	return var2265
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
	local var2265 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2266, var2267 = protoModule.writeTag(buff, var2265, 1, protoModule.wireTypes.lengthDelimited)
		var2266, var3343 = protoModule.writeString(var2266, var2267, self.selected_option)
		buff = var2266
		var2265 = var2267
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2268 = v:encode()
			local var2269, var2270 = protoModule.writeTag(buff, var2265, 2, protoModule.wireTypes.lengthDelimited)
			var2269, var3346 = protoModule.writeBuffer(var2269, var2270, var2268, buffer.len(var2268))
			buff = var2269
			var2265 = var2270
		end
	end
	if self.experience_carousel ~= nil then
		local var2271 = self.experience_carousel:encode()
		local var2272, var2273 = protoModule.writeTag(buff, var2265, 3, protoModule.wireTypes.lengthDelimited)
		var2272, var3349 = protoModule.writeBuffer(var2272, var2273, var2271, buffer.len(var2271))
		buff = var2272
		var2265 = var2273
	end
	local buff_1 = buffer.create(var2265)
	buffer.copy(buff_1, 0, buff, 0, var2265)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2274 = t_81.new()
	local var2275 = 0
	while var2275 < buffer.len(p81) do
		local _ = nil
		local var2276 = nil
		local var2277, var2278, var2279 = protoModule.readTag(p81, var2275)
		local var2280 = var2277
		var2276 = var2278
		var2275 = var2279
		
		if var2276 == protoModule.wireTypes.varint then
			local _ = nil
			local var2281, var2282 = protoModule.readVarInt(p81, var2275)
			local _ = var2281
			var2275 = var2282
			continue
		end
		if var2276 == protoModule.wireTypes.lengthDelimited then
			if var2280 == 1 then
				local _ = nil
				local var2283, var2284 = protoModule.readBuffer(p81, var2275)
				var2275 = var2284
				var2274.selected_option = buffer.tostring(var2283)
			elseif var2280 == 2 then
				local _ = nil
				local var2285, var2286 = protoModule.readBuffer(p81, var2275)
				var2275 = var2286
				table.insert(var2274.options, t.SelectorOption.decode(var2285))
			elseif var2280 == 3 then
				local _ = nil
				local var2287, var2288 = protoModule.readBuffer(p81, var2275)
				var2275 = var2288
				var2274.experience_carousel = t.ExperienceCarouselInputData.decode(var2287)
			else
				local _ = nil
				local var2289, var2290 = protoModule.readVarInt(p81, var2275)
				var2275 = var2290 + var2289
			end
		elseif var2276 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2291, var2292 = protoModule.readFixed32(p81, var2275)
			local _ = var2291
			var2275 = var2292
		elseif var2276 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2293, var2294 = protoModule.readFixed64(p81, var2275)
			local _ = var2293
			var2275 = var2294
		else
			error("Unsupported wire type: " .. var3353)
		end
	end
	return var2274
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
	local var2295 = t_81.new()
	
	if self.selected_option ~= nil then
		var2295.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2295.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2295.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2295.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2295.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2295
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
	local var2296 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2297, var2298 = protoModule.writeTag(buff, var2296, 1, protoModule.wireTypes.lengthDelimited)
		var2297, var3379 = protoModule.writeString(var2297, var2298, self.id)
		buff = var2297
		var2296 = var2298
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2299, var2300 = protoModule.writeTag(buff, var2296, 4, protoModule.wireTypes.varint)
		var2299, var3381 = protoModule.writeVarInt(var2299, var2300, self.preview_rows)
		buff = var2299
		var2296 = var2300
	end
	if self.widget_style ~= nil then
		local var2301 = self.widget_style:encode()
		local var2302, var2303 = protoModule.writeTag(buff, var2296, 3, protoModule.wireTypes.lengthDelimited)
		var2302, var3384 = protoModule.writeBuffer(var2302, var2303, var2301, buffer.len(var2301))
		buff = var2302
		var2296 = var2303
	end
	if self.see_all_button then
		local var2304, var2305 = protoModule.writeTag(buff, var2296, 5, protoModule.wireTypes.varint)
		var2304, var3386 = protoModule.writeVarInt(var2304, var2305, if self.see_all_button then 1 else 0)
		buff = var2304
		var2296 = var2305
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2306, var2307 = protoModule.writeTag(buff, var2296, 6, protoModule.wireTypes.lengthDelimited)
		var2306, var3388 = protoModule.writeString(var2306, var2307, self.information_popover_text)
		buff = var2306
		var2296 = var2307
	end
	local buff_1 = buffer.create(var2296)
	buffer.copy(buff_1, 0, buff, 0, var2296)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2296 = t_82.new()
	local var2297 = 0
	while var2297 < buffer.len(p82) do
		local _ = nil
		local var2298 = nil
		local var2299, var2300, var2301 = protoModule.readTag(p82, var2297)
		local var2302 = var2299
		var2298 = var2300
		var2297 = var2301
		
		if var2298 == protoModule.wireTypes.varint then
			if var2302 == 4 then
				local _ = nil
				local var2303, var2304 = protoModule.readVarIntI64(p82, var2297)
				var2297 = var2304
				var2296.preview_rows = var2303
			elseif var2302 == 5 then
				local _ = nil
				local var2305, var2306 = protoModule.readVarInt(p82, var2297)
				var2297 = var2306
				var2296.see_all_button = var2305 ~= 0
			else
				local _ = nil
				local var2307, var2308 = protoModule.readVarInt(p82, var2297)
				local _ = var2307
				var2297 = var2308
			end
		end
		if var2298 == protoModule.wireTypes.lengthDelimited then
			if var2302 == 1 then
				local _ = nil
				local var2309, var2310 = protoModule.readBuffer(p82, var2297)
				var2297 = var2310
				var2296.id = buffer.tostring(var2309)
			elseif var2302 == 3 then
				local _ = nil
				local var2311, var2312 = protoModule.readBuffer(p82, var2297)
				var2297 = var2312
				var2296.widget_style = t.WidgetStyleData.decode(var2311)
			elseif var2302 == 6 then
				local _ = nil
				local var2313, var2314 = protoModule.readBuffer(p82, var2297)
				var2297 = var2314
				var2296.information_popover_text = buffer.tostring(var2313)
			else
				local _ = nil
				local var2315, var2316 = protoModule.readVarInt(p82, var2297)
				var2297 = var2316 + var2315
			end
		elseif var2298 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2317, var2318 = protoModule.readFixed32(p82, var2297)
			local _ = var2317
			var2297 = var2318
		elseif var2298 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2319, var2320 = protoModule.readFixed64(p82, var2297)
			local _ = var2319
			var2297 = var2320
		else
			error("Unsupported wire type: " .. var3392)
		end
	end
	return var2296
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
	local var2321 = t_82.new()
	
	if self.id ~= nil then
		var2321.id = self.id
	end
	if self.preview_rows ~= nil then
		var2321.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2321.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2321.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2321.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2321.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2321.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2321.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2321.information_popover_text = self.informationPopoverText
	end
	return var2321
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
	local var2321 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2322, var2323 = protoModule.writeTag(buff, var2321, 1, protoModule.wireTypes.lengthDelimited)
		var2322, var3420 = protoModule.writeString(var2322, var2323, self.id)
		buff = var2322
		var2321 = var2323
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2324, var2325 = protoModule.writeTag(buff, var2321, 5, protoModule.wireTypes.varint)
		var2324, var3422 = protoModule.writeVarInt(var2324, var2325, self.num_items_to_show)
		buff = var2324
		var2321 = var2325
	end
	if self.widget_style ~= nil then
		local var2326 = self.widget_style:encode()
		local var2327, var2328 = protoModule.writeTag(buff, var2321, 3, protoModule.wireTypes.lengthDelimited)
		var2327, var3425 = protoModule.writeBuffer(var2327, var2328, var2326, buffer.len(var2326))
		buff = var2327
		var2321 = var2328
	end
	if self.see_all_button then
		local var2329, var2330 = protoModule.writeTag(buff, var2321, 6, protoModule.wireTypes.varint)
		var2329, var3427 = protoModule.writeVarInt(var2329, var2330, if self.see_all_button then 1 else 0)
		buff = var2329
		var2321 = var2330
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2331, var2332 = protoModule.writeTag(buff, var2321, 7, protoModule.wireTypes.lengthDelimited)
		var2331, var3429 = protoModule.writeString(var2331, var2332, self.information_popover_text)
		buff = var2331
		var2321 = var2332
	end
	local buff_1 = buffer.create(var2321)
	buffer.copy(buff_1, 0, buff, 0, var2321)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2321 = t_83.new()
	local var2322 = 0
	while var2322 < buffer.len(p83) do
		local _ = nil
		local var2323 = nil
		local var2324, var2325, var2326 = protoModule.readTag(p83, var2322)
		local var2327 = var2324
		var2323 = var2325
		var2322 = var2326
		
		if var2323 == protoModule.wireTypes.varint then
			if var2327 == 5 then
				local _ = nil
				local var2328, var2329 = protoModule.readVarIntI64(p83, var2322)
				var2322 = var2329
				var2321.num_items_to_show = var2328
			elseif var2327 == 6 then
				local _ = nil
				local var2330, var2331 = protoModule.readVarInt(p83, var2322)
				var2322 = var2331
				var2321.see_all_button = var2330 ~= 0
			else
				local _ = nil
				local var2332, var2333 = protoModule.readVarInt(p83, var2322)
				local _ = var2332
				var2322 = var2333
			end
		end
		if var2323 == protoModule.wireTypes.lengthDelimited then
			if var2327 == 1 then
				local _ = nil
				local var2334, var2335 = protoModule.readBuffer(p83, var2322)
				var2322 = var2335
				var2321.id = buffer.tostring(var2334)
			elseif var2327 == 3 then
				local _ = nil
				local var2336, var2337 = protoModule.readBuffer(p83, var2322)
				var2322 = var2337
				var2321.widget_style = t.WidgetStyleData.decode(var2336)
			elseif var2327 == 7 then
				local _ = nil
				local var2338, var2339 = protoModule.readBuffer(p83, var2322)
				var2322 = var2339
				var2321.information_popover_text = buffer.tostring(var2338)
			else
				local _ = nil
				local var2340, var2341 = protoModule.readVarInt(p83, var2322)
				var2322 = var2341 + var2340
			end
		elseif var2323 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2342, var2343 = protoModule.readFixed32(p83, var2322)
			local _ = var2342
			var2322 = var2343
		elseif var2323 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2344, var2345 = protoModule.readFixed64(p83, var2322)
			local _ = var2344
			var2322 = var2345
		else
			error("Unsupported wire type: " .. var3433)
		end
	end
	return var2321
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
	local var2346 = t_83.new()
	
	if self.id ~= nil then
		var2346.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2346.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2346.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2346.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2346.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2346.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2346.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2346.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2346.information_popover_text = self.informationPopoverText
	end
	return var2346
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
	local var2346 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2347 = v:encode()
			local var2348, var2349 = protoModule.writeTag(buff, var2346, 1, protoModule.wireTypes.lengthDelimited)
			var2348, var3462 = protoModule.writeBuffer(var2348, var2349, var2347, buffer.len(var2347))
			buff = var2348
			var2346 = var2349
		end
	end
	local buff_1 = buffer.create(var2346)
	buffer.copy(buff_1, 0, buff, 0, var2346)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2350 = t_84.new()
	local var2351 = 0
	while var2351 < buffer.len(p84) do
		local _ = nil
		local var2352 = nil
		local var2353, var2354, var2355 = protoModule.readTag(p84, var2351)
		local var2356 = var2353
		var2352 = var2354
		var2351 = var2355
		
		if var2352 == protoModule.wireTypes.varint then
			local _ = nil
			local var2357, var2358 = protoModule.readVarInt(p84, var2351)
			local _ = var2357
			var2351 = var2358
			continue
		end
		if var2352 == protoModule.wireTypes.lengthDelimited then
			if var2356 == 1 then
				local _ = nil
				local var2359, var2360 = protoModule.readBuffer(p84, var2351)
				var2351 = var2360
				table.insert(var2350.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2359))
			else
				local _ = nil
				local var2361, var2362 = protoModule.readVarInt(p84, var2351)
				var2351 = var2362 + var2361
			end
		elseif var2352 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2363, var2364 = protoModule.readFixed32(p84, var2351)
			local _ = var2363
			var2351 = var2364
		elseif var2352 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2365, var2366 = protoModule.readFixed64(p84, var2351)
			local _ = var2365
			var2351 = var2366
		else
			error("Unsupported wire type: " .. var3466)
		end
	end
	return var2350
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
	local var2367 = t_84.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2367.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2367.background_layers = t
	end
	return var2367
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
	local var2368 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2369, var2370 = protoModule.writeTag(buff, var2368, 1, protoModule.wireTypes.lengthDelimited)
		var2369, var3489 = protoModule.writeString(var2369, var2370, self.id)
		buff = var2369
		var2368 = var2370
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2371, var2372 = protoModule.writeTag(buff, var2368, 2, protoModule.wireTypes.lengthDelimited)
		var2371, var3491 = protoModule.writeString(var2371, var2372, self.available_until)
		buff = var2371
		var2368 = var2372
	end
	if self.widget_style ~= nil then
		local var2373 = self.widget_style:encode()
		local var2374, var2375 = protoModule.writeTag(buff, var2368, 3, protoModule.wireTypes.lengthDelimited)
		var2374, var3494 = protoModule.writeBuffer(var2374, var2375, var2373, buffer.len(var2373))
		buff = var2374
		var2368 = var2375
	end
	local buff_1 = buffer.create(var2368)
	buffer.copy(buff_1, 0, buff, 0, var2368)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2368 = t_85.new()
	local var2369 = 0
	while var2369 < buffer.len(p85) do
		local _ = nil
		local var2370 = nil
		local var2371, var2372, var2373 = protoModule.readTag(p85, var2369)
		local var2374 = var2371
		var2370 = var2372
		var2369 = var2373
		
		if var2370 == protoModule.wireTypes.varint then
			local _ = nil
			local var2375, var2376 = protoModule.readVarInt(p85, var2369)
			local _ = var2375
			var2369 = var2376
			continue
		end
		if var2370 == protoModule.wireTypes.lengthDelimited then
			if var2374 == 1 then
				local _ = nil
				local var2377, var2378 = protoModule.readBuffer(p85, var2369)
				var2369 = var2378
				var2368.id = buffer.tostring(var2377)
			elseif var2374 == 2 then
				local _ = nil
				local var2379, var2380 = protoModule.readBuffer(p85, var2369)
				var2369 = var2380
				var2368.available_until = buffer.tostring(var2379)
			elseif var2374 == 3 then
				local _ = nil
				local var2381, var2382 = protoModule.readBuffer(p85, var2369)
				var2369 = var2382
				var2368.widget_style = t.WidgetStyleData.decode(var2381)
			else
				local _ = nil
				local var2383, var2384 = protoModule.readVarInt(p85, var2369)
				var2369 = var2384 + var2383
			end
		elseif var2370 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2385, var2386 = protoModule.readFixed32(p85, var2369)
			local _ = var2385
			var2369 = var2386
		elseif var2370 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2387, var2388 = protoModule.readFixed64(p85, var2369)
			local _ = var2387
			var2369 = var2388
		else
			error("Unsupported wire type: " .. var3498)
		end
	end
	return var2368
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
	local var2389 = t_85.new()
	
	if self.id ~= nil then
		var2389.id = self.id
	end
	if self.available_until ~= nil then
		var2389.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2389.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2389.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2389.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2389
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
	local var2389 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2390, var2391 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2390, var3522 = protoModule.writeString(var2390, var2391, i)
			local var2392 = v:encode()
			var2391, var3524 = protoModule.writeTag(var2390, var2391, 2, protoModule.wireTypes.lengthDelimited)
			var2391, var3524 = protoModule.writeBuffer(var2391, var3524, var2392, buffer.len(var2392))
			local var2393 = var2391
			local var2394 = var3524
			local var2395, var2396 = protoModule.writeTag(buff, var2389, 1, protoModule.wireTypes.lengthDelimited)
			var2395, var3528 = protoModule.writeBuffer(var2395, var2396, var2393, var2394)
			buff = var2395
			var2389 = var2396
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2397, var2398 = protoModule.writeTag(buff, var2389, 2, protoModule.wireTypes.lengthDelimited)
			var2397, var3530 = protoModule.writeString(var2397, var2398, v)
			buff = var2397
			var2389 = var2398
		end
	end
	local buff_1 = buffer.create(var2389)
	buffer.copy(buff_1, 0, buff, 0, var2389)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2399 = t_86.new()
	local var2400 = 0
	while var2400 < buffer.len(p86) do
		local _ = nil
		local var2401 = nil
		local var2402, var2403, var2404 = protoModule.readTag(p86, var2400)
		local var2405 = var2402
		var2401 = var2403
		var2400 = var2404
		
		if var2401 == protoModule.wireTypes.varint then
			local _ = nil
			local var2406, var2407 = protoModule.readVarInt(p86, var2400)
			local _ = var2406
			var2400 = var2407
			continue
		end
		if var2401 == protoModule.wireTypes.lengthDelimited then
			if var2405 == 1 then
				local _ = nil
				local var2408, var2409 = protoModule.readBuffer(p86, var2400)
				var2400 = var2409
				var2408 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2408)
				var2399.entry_map[var2408.key or ""] = var2408.value or t.FeedEntry.new()
			elseif var2405 == 2 then
				local _ = nil
				local var2410, var2411 = protoModule.readBuffer(p86, var2400)
				var2400 = var2411
				table.insert(var2399.entry_order, buffer.tostring(var2410))
			else
				local _ = nil
				local var2412, var2413 = protoModule.readVarInt(p86, var2400)
				var2400 = var2413 + var2412
			end
		elseif var2401 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2414, var2415 = protoModule.readFixed32(p86, var2400)
			local _ = var2414
			var2400 = var2415
		elseif var2401 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2416, var2417 = protoModule.readFixed64(p86, var2400)
			local _ = var2416
			var2400 = var2417
		else
			error("Unsupported wire type: " .. var3534)
		end
	end
	return var2399
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
	local var2418 = t_86.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2418.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2418.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2418.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2418.entry_order = t_1
	end
	return var2418
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
	local var2419 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2420, var2421 = protoModule.writeTag(buff, var2419, 1, protoModule.wireTypes.lengthDelimited)
		var2420, var3562 = protoModule.writeString(var2420, var2421, self.key)
		buff = var2420
		var2419 = var2421
	end
	if self.value ~= nil then
		local var2422 = self.value:encode()
		local var2423, var2424 = protoModule.writeTag(buff, var2419, 2, protoModule.wireTypes.lengthDelimited)
		var2423, var3565 = protoModule.writeBuffer(var2423, var2424, var2422, buffer.len(var2422))
		buff = var2423
		var2419 = var2424
	end
	local buff_1 = buffer.create(var2419)
	buffer.copy(buff_1, 0, buff, 0, var2419)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2419 = t_87.new()
	local var2420 = 0
	while var2420 < buffer.len(p87) do
		local _ = nil
		local var2421 = nil
		local var2422, var2423, var2424 = protoModule.readTag(p87, var2420)
		local var2425 = var2422
		var2421 = var2423
		var2420 = var2424
		
		if var2421 == protoModule.wireTypes.varint then
			local _ = nil
			local var2426, var2427 = protoModule.readVarInt(p87, var2420)
			local _ = var2426
			var2420 = var2427
			continue
		end
		if var2421 == protoModule.wireTypes.lengthDelimited then
			if var2425 == 1 then
				local _ = nil
				local var2428, var2429 = protoModule.readBuffer(p87, var2420)
				var2420 = var2429
				var2419.key = buffer.tostring(var2428)
			elseif var2425 == 2 then
				local _ = nil
				local var2430, var2431 = protoModule.readBuffer(p87, var2420)
				var2420 = var2431
				var2419.value = t.FeedEntry.decode(var2430)
			else
				local _ = nil
				local var2432, var2433 = protoModule.readVarInt(p87, var2420)
				var2420 = var2433 + var2432
			end
		elseif var2421 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2434, var2435 = protoModule.readFixed32(p87, var2420)
			local _ = var2434
			var2420 = var2435
		elseif var2421 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2436, var2437 = protoModule.readFixed64(p87, var2420)
			local _ = var2436
			var2420 = var2437
		else
			error("Unsupported wire type: " .. var3569)
		end
	end
	return var2419
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
	local var2438 = t_87.new()
	
	if self.key ~= nil then
		var2438.key = self.key
	end
	if self.value ~= nil then
		var2438.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2438
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
	local var2438 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2439 = v:encode()
			local var2440, var2441 = protoModule.writeTag(buff, var2438, 1, protoModule.wireTypes.lengthDelimited)
			var2440, var3592 = protoModule.writeBuffer(var2440, var2441, var2439, buffer.len(var2439))
			buff = var2440
			var2438 = var2441
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2442, var2443 = protoModule.writeTag(buff, var2438, 2, protoModule.wireTypes.lengthDelimited)
		var2442, var3594 = protoModule.writeString(var2442, var2443, self.active_category_id)
		buff = var2442
		var2438 = var2443
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2444, var2445 = protoModule.writeTag(buff, var2438, 3, protoModule.wireTypes.varint)
		var2444, var3596 = protoModule.writeVarInt(var2444, var2445, self.active_tooltip_idx)
		buff = var2444
		var2438 = var2445
	end
	local buff_1 = buffer.create(var2438)
	buffer.copy(buff_1, 0, buff, 0, var2438)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2446 = t_88.new()
	local var2447 = 0
	while var2447 < buffer.len(p88) do
		local _ = nil
		local var2448 = nil
		local var2449, var2450, var2451 = protoModule.readTag(p88, var2447)
		local var2452 = var2449
		var2448 = var2450
		var2447 = var2451
		
		if var2448 == protoModule.wireTypes.varint then
			if var2452 == 3 then
				local _ = nil
				local var2453, var2454 = protoModule.readVarIntI64(p88, var2447)
				var2447 = var2454
				var2446.active_tooltip_idx = var2453
			else
				local _ = nil
				local var2455, var2456 = protoModule.readVarInt(p88, var2447)
				local _ = var2455
				var2447 = var2456
			end
		end
		if var2448 == protoModule.wireTypes.lengthDelimited then
			if var2452 == 1 then
				local _ = nil
				local var2457, var2458 = protoModule.readBuffer(p88, var2447)
				var2447 = var2458
				table.insert(var2446.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2457))
			elseif var2452 == 2 then
				local _ = nil
				local var2459, var2460 = protoModule.readBuffer(p88, var2447)
				var2447 = var2460
				var2446.active_category_id = buffer.tostring(var2459)
			else
				local _ = nil
				local var2461, var2462 = protoModule.readVarInt(p88, var2447)
				var2447 = var2462 + var2461
			end
		elseif var2448 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2463, var2464 = protoModule.readFixed32(p88, var2447)
			local _ = var2463
			var2447 = var2464
		elseif var2448 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2465, var2466 = protoModule.readFixed64(p88, var2447)
			local _ = var2465
			var2447 = var2466
		else
			error("Unsupported wire type: " .. var3600)
		end
	end
	return var2446
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
	local var2467 = t_88.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2467.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2467.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2467.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2467.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2467.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2467.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2467
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
	local var2468 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2469, var2470 = protoModule.writeTag(buff, var2468, 1, protoModule.wireTypes.lengthDelimited)
		var2469, var3627 = protoModule.writeString(var2469, var2470, self.marketplace_catalog_category_item_id)
		buff = var2469
		var2468 = var2470
	end
	local buff_1 = buffer.create(var2468)
	buffer.copy(buff_1, 0, buff, 0, var2468)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref)
	local var2468 = t_89.new()
	local var2469 = 0
	while var2469 < buffer.len(p89) do
		local _ = nil
		local var2470 = nil
		local var2471, var2472, var2473 = protoModule.readTag(p89, var2469)
		local var2474 = var2471
		var2470 = var2472
		var2469 = var2473
		
		if var2470 == protoModule.wireTypes.varint then
			local _ = nil
			local var2475, var2476 = protoModule.readVarInt(p89, var2469)
			local _ = var2475
			var2469 = var2476
			continue
		end
		if var2470 == protoModule.wireTypes.lengthDelimited then
			if var2474 == 1 then
				local _ = nil
				local var2477, var2478 = protoModule.readBuffer(p89, var2469)
				var2469 = var2478
				var2468.marketplace_catalog_category_item_id = buffer.tostring(var2477)
			else
				local _ = nil
				local var2479, var2480 = protoModule.readVarInt(p89, var2469)
				var2469 = var2480 + var2479
			end
		elseif var2470 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2481, var2482 = protoModule.readFixed32(p89, var2469)
			local _ = var2481
			var2469 = var2482
		elseif var2470 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2483, var2484 = protoModule.readFixed64(p89, var2469)
			local _ = var2483
			var2469 = var2484
		else
			error("Unsupported wire type: " .. var3631)
		end
	end
	return var2468
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
	local var2485 = t_89.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2485.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2485.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2485
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
	local var2485 = 0
	
	if self.hero_icon ~= nil then
		local var2486, var2487 = protoModule.writeTag(buff, var2485, 1, protoModule.wireTypes.lengthDelimited)
		var2486, var3651 = protoModule.writeString(var2486, var2487, self.hero_icon)
		buff = var2486
		var2485 = var2487
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2488, var2489 = protoModule.writeTag(buff, var2485, 2, protoModule.wireTypes.lengthDelimited)
		var2488, var3653 = protoModule.writeString(var2488, var2489, self.body_dismiss_button_text)
		buff = var2488
		var2485 = var2489
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2490, var2491 = protoModule.writeTag(buff, var2485, 3, protoModule.wireTypes.lengthDelimited)
		var2490, var3655 = protoModule.writeString(var2490, var2491, self.body_title)
		buff = var2490
		var2485 = var2491
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2492, var2493 = protoModule.writeTag(buff, var2485, 4, protoModule.wireTypes.lengthDelimited)
		var2492, var3657 = protoModule.writeString(var2492, var2493, self.body_rich_text)
		buff = var2492
		var2485 = var2493
	end
	if self.terms_link_text ~= nil then
		local var2494, var2495 = protoModule.writeTag(buff, var2485, 5, protoModule.wireTypes.lengthDelimited)
		var2494, var3659 = protoModule.writeString(var2494, var2495, self.terms_link_text)
		buff = var2494
		var2485 = var2495
	end
	if self.terms_title ~= nil then
		local var2496, var2497 = protoModule.writeTag(buff, var2485, 6, protoModule.wireTypes.lengthDelimited)
		var2496, var3661 = protoModule.writeString(var2496, var2497, self.terms_title)
		buff = var2496
		var2485 = var2497
	end
	if self.terms_body_rich_text ~= nil then
		local var2498, var2499 = protoModule.writeTag(buff, var2485, 7, protoModule.wireTypes.lengthDelimited)
		var2498, var3663 = protoModule.writeString(var2498, var2499, self.terms_body_rich_text)
		buff = var2498
		var2485 = var2499
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2500, var2501 = protoModule.writeTag(buff, var2485, 8, protoModule.wireTypes.lengthDelimited)
		var2500, var3665 = protoModule.writeString(var2500, var2501, self.terms_dismiss_button_text)
		buff = var2500
		var2485 = var2501
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2502, var2503 = protoModule.writeTag(buff, var2485, 9, protoModule.wireTypes.lengthDelimited)
		var2502, var3667 = protoModule.writeString(var2502, var2503, self.offer_id)
		buff = var2502
		var2485 = var2503
	end
	local buff_1 = buffer.create(var2485)
	buffer.copy(buff_1, 0, buff, 0, var2485)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2485 = t_90.new()
	local var2486 = 0
	while var2486 < buffer.len(p90) do
		local _ = nil
		local var2487 = nil
		local var2488, var2489, var2490 = protoModule.readTag(p90, var2486)
		local var2491 = var2488
		var2487 = var2489
		var2486 = var2490
		
		if var2487 == protoModule.wireTypes.varint then
			local _ = nil
			local var2492, var2493 = protoModule.readVarInt(p90, var2486)
			local _ = var2492
			var2486 = var2493
			continue
		end
		if var2487 == protoModule.wireTypes.lengthDelimited then
			if var2491 == 1 then
				local _ = nil
				local var2494, var2495 = protoModule.readBuffer(p90, var2486)
				var2486 = var2495
				var2485.hero_icon = buffer.tostring(var2494)
			elseif var2491 == 2 then
				local _ = nil
				local var2496, var2497 = protoModule.readBuffer(p90, var2486)
				var2486 = var2497
				var2485.body_dismiss_button_text = buffer.tostring(var2496)
			elseif var2491 == 3 then
				local _ = nil
				local var2498, var2499 = protoModule.readBuffer(p90, var2486)
				var2486 = var2499
				var2485.body_title = buffer.tostring(var2498)
			elseif var2491 == 4 then
				local _ = nil
				local var2500, var2501 = protoModule.readBuffer(p90, var2486)
				var2486 = var2501
				var2485.body_rich_text = buffer.tostring(var2500)
			elseif var2491 == 5 then
				local _ = nil
				local var2502, var2503 = protoModule.readBuffer(p90, var2486)
				var2486 = var2503
				var2485.terms_link_text = buffer.tostring(var2502)
			elseif var2491 == 6 then
				local _ = nil
				local var2504, var2505 = protoModule.readBuffer(p90, var2486)
				var2486 = var2505
				var2485.terms_title = buffer.tostring(var2504)
			elseif var2491 == 7 then
				local _ = nil
				local var2506, var2507 = protoModule.readBuffer(p90, var2486)
				var2486 = var2507
				var2485.terms_body_rich_text = buffer.tostring(var2506)
			elseif var2491 == 8 then
				local _ = nil
				local var2508, var2509 = protoModule.readBuffer(p90, var2486)
				var2486 = var2509
				var2485.terms_dismiss_button_text = buffer.tostring(var2508)
			elseif var2491 == 9 then
				local _ = nil
				local var2510, var2511 = protoModule.readBuffer(p90, var2486)
				var2486 = var2511
				var2485.offer_id = buffer.tostring(var2510)
			else
				local _ = nil
				local var2512, var2513 = protoModule.readVarInt(p90, var2486)
				var2486 = var2513 + var2512
			end
		elseif var2487 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2514, var2515 = protoModule.readFixed32(p90, var2486)
			local _ = var2514
			var2486 = var2515
		elseif var2487 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2516, var2517 = protoModule.readFixed64(p90, var2486)
			local _ = var2516
			var2486 = var2517
		else
			error("Unsupported wire type: " .. var3671)
		end
	end
	return var2485
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
	local var2518 = t_90.new()
	
	if self.hero_icon ~= nil then
		var2518.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2518.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2518.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2518.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2518.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2518.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2518.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2518.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2518.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2518.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2518.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2518.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2518.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2518.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2518.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2518.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2518.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2518.offer_id = self.offerId
	end
	return var2518
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
	local var2518 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2519 = v:encode()
			local var2520, var2521 = protoModule.writeTag(buff, var2518, 1, protoModule.wireTypes.lengthDelimited)
			var2520, var3708 = protoModule.writeBuffer(var2520, var2521, var2519, buffer.len(var2519))
			buff = var2520
			var2518 = var2521
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2522, var2523 = protoModule.writeTag(buff, var2518, 2, protoModule.wireTypes.varint)
		var2522, var3710 = protoModule.writeVarInt(var2522, var2523, self.preview_columns)
		buff = var2522
		var2518 = var2523
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2524, var2525 = protoModule.writeTag(buff, var2518, 3, protoModule.wireTypes.lengthDelimited)
		var2524, var3712 = protoModule.writeString(var2524, var2525, self.impression_id)
		buff = var2524
		var2518 = var2525
	end
	local buff_1 = buffer.create(var2518)
	buffer.copy(buff_1, 0, buff, 0, var2518)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var2526 = t_91.new()
	local var2527 = 0
	while var2527 < buffer.len(p91) do
		local _ = nil
		local var2528 = nil
		local var2529, var2530, var2531 = protoModule.readTag(p91, var2527)
		local var2532 = var2529
		var2528 = var2530
		var2527 = var2531
		
		if var2528 == protoModule.wireTypes.varint then
			if var2532 == 2 then
				local _ = nil
				local var2533, var2534 = protoModule.readVarIntI32(p91, var2527)
				var2527 = var2534
				var2526.preview_columns = var2533
			else
				local _ = nil
				local var2535, var2536 = protoModule.readVarInt(p91, var2527)
				local _ = var2535
				var2527 = var2536
			end
		end
		if var2528 == protoModule.wireTypes.lengthDelimited then
			if var2532 == 1 then
				local _ = nil
				local var2537, var2538 = protoModule.readBuffer(p91, var2527)
				var2527 = var2538
				table.insert(var2526.items, t.CatalogItemGridInputData_CatalogItem.decode(var2537))
			elseif var2532 == 3 then
				local _ = nil
				local var2539, var2540 = protoModule.readBuffer(p91, var2527)
				var2527 = var2540
				var2526.impression_id = buffer.tostring(var2539)
			else
				local _ = nil
				local var2541, var2542 = protoModule.readVarInt(p91, var2527)
				var2527 = var2542 + var2541
			end
		elseif var2528 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2543, var2544 = protoModule.readFixed32(p91, var2527)
			local _ = var2543
			var2527 = var2544
		elseif var2528 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2545, var2546 = protoModule.readFixed64(p91, var2527)
			local _ = var2545
			var2527 = var2546
		else
			error("Unsupported wire type: " .. var3716)
		end
	end
	return var2526
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
	local var2547 = t_91.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2547.items = t_1
	end
	if self.preview_columns ~= nil then
		var2547.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2547.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2547.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2547.impression_id = self.impressionId
	end
	return var2547
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
	local var2548 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2549, var2550 = protoModule.writeTag(buff, var2548, 1, protoModule.wireTypes.lengthDelimited)
		var2549, var3742 = protoModule.writeString(var2549, var2550, self.id)
		buff = var2549
		var2548 = var2550
	end
	if self.type ~= nil and self.type ~= "" then
		local var2551, var2552 = protoModule.writeTag(buff, var2548, 2, protoModule.wireTypes.lengthDelimited)
		var2551, var3744 = protoModule.writeString(var2551, var2552, self.type)
		buff = var2551
		var2548 = var2552
	end
	local buff_1 = buffer.create(var2548)
	buffer.copy(buff_1, 0, buff, 0, var2548)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref)
	local var2548 = t_92.new()
	local var2549 = 0
	while var2549 < buffer.len(p92) do
		local _ = nil
		local var2550 = nil
		local var2551, var2552, var2553 = protoModule.readTag(p92, var2549)
		local var2554 = var2551
		var2550 = var2552
		var2549 = var2553
		
		if var2550 == protoModule.wireTypes.varint then
			local _ = nil
			local var2555, var2556 = protoModule.readVarInt(p92, var2549)
			local _ = var2555
			var2549 = var2556
			continue
		end
		if var2550 == protoModule.wireTypes.lengthDelimited then
			if var2554 == 1 then
				local _ = nil
				local var2557, var2558 = protoModule.readBuffer(p92, var2549)
				var2549 = var2558
				var2548.id = buffer.tostring(var2557)
			elseif var2554 == 2 then
				local _ = nil
				local var2559, var2560 = protoModule.readBuffer(p92, var2549)
				var2549 = var2560
				var2548.type = buffer.tostring(var2559)
			else
				local _ = nil
				local var2561, var2562 = protoModule.readVarInt(p92, var2549)
				var2549 = var2562 + var2561
			end
		elseif var2550 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2563, var2564 = protoModule.readFixed32(p92, var2549)
			local _ = var2563
			var2549 = var2564
		elseif var2550 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2565, var2566 = protoModule.readFixed64(p92, var2549)
			local _ = var2565
			var2549 = var2566
		else
			error("Unsupported wire type: " .. var3748)
		end
	end
	return var2548
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
	local var2567 = t_92.new()
	
	if self.id ~= nil then
		var2567.id = self.id
	end
	if self.type ~= nil then
		var2567.type = self.type
	end
	return var2567
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
	local var2567 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2568, var2569 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2568, var3770 = protoModule.writeString(var2568, var2569, i)
			local var2570 = v:encode()
			var2569, var3772 = protoModule.writeTag(var2568, var2569, 2, protoModule.wireTypes.lengthDelimited)
			var2569, var3772 = protoModule.writeBuffer(var2569, var3772, var2570, buffer.len(var2570))
			local var2571 = var2569
			local var2572 = var3772
			local var2573, var2574 = protoModule.writeTag(buff, var2567, 1, protoModule.wireTypes.lengthDelimited)
			var2573, var3776 = protoModule.writeBuffer(var2573, var2574, var2571, var2572)
			buff = var2573
			var2567 = var2574
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2575, var2576 = protoModule.writeTag(buff, var2567, 2, protoModule.wireTypes.lengthDelimited)
			var2575, var3778 = protoModule.writeString(var2575, var2576, v)
			buff = var2575
			var2567 = var2576
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2577, var2578 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2577, var3780 = protoModule.writeString(var2577, var2578, i)
			local var2579 = v:encode()
			var2578, var3782 = protoModule.writeTag(var2577, var2578, 2, protoModule.wireTypes.lengthDelimited)
			var2578, var3782 = protoModule.writeBuffer(var2578, var3782, var2579, buffer.len(var2579))
			local var2580 = var2578
			local var2581 = var3782
			local var2582, var2583 = protoModule.writeTag(buff, var2567, 3, protoModule.wireTypes.lengthDelimited)
			var2582, var3786 = protoModule.writeBuffer(var2582, var2583, var2580, var2581)
			buff = var2582
			var2567 = var2583
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2584, var2585 = protoModule.writeTag(buff, var2567, 4, protoModule.wireTypes.lengthDelimited)
		var2584, var3788 = protoModule.writeString(var2584, var2585, self.search_session_id)
		buff = var2584
		var2567 = var2585
	end
	local buff_1 = buffer.create(var2567)
	buffer.copy(buff_1, 0, buff, 0, var2567)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2586 = t_93.new()
	local var2587 = 0
	while var2587 < buffer.len(p93) do
		local _ = nil
		local var2588 = nil
		local var2589, var2590, var2591 = protoModule.readTag(p93, var2587)
		local var2592 = var2589
		var2588 = var2590
		var2587 = var2591
		
		if var2588 == protoModule.wireTypes.varint then
			local _ = nil
			local var2593, var2594 = protoModule.readVarInt(p93, var2587)
			local _ = var2593
			var2587 = var2594
			continue
		end
		if var2588 == protoModule.wireTypes.lengthDelimited then
			if var2592 == 1 then
				local _ = nil
				local var2595, var2596 = protoModule.readBuffer(p93, var2587)
				var2587 = var2596
				var2595 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2595)
				var2586.entry_map[var2595.key or ""] = var2595.value or t.FeedEntry.new()
			elseif var2592 == 2 then
				local _ = nil
				local var2597, var2598 = protoModule.readBuffer(p93, var2587)
				var2587 = var2598
				table.insert(var2586.entry_order, buffer.tostring(var2597))
			elseif var2592 == 3 then
				local _ = nil
				local var2599, var2600 = protoModule.readBuffer(p93, var2587)
				var2587 = var2600
				var2599 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2599)
				var2586.content_pools[var2599.key or ""] = var2599.value or t.ContentPool.new()
			elseif var2592 == 4 then
				local _ = nil
				local var2601, var2602 = protoModule.readBuffer(p93, var2587)
				var2587 = var2602
				var2586.search_session_id = buffer.tostring(var2601)
			else
				local _ = nil
				local var2603, var2604 = protoModule.readVarInt(p93, var2587)
				var2587 = var2604 + var2603
			end
		elseif var2588 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2605, var2606 = protoModule.readFixed32(p93, var2587)
			local _ = var2605
			var2587 = var2606
		elseif var2588 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2607, var2608 = protoModule.readFixed64(p93, var2587)
			local _ = var2607
			var2587 = var2608
		else
			error("Unsupported wire type: " .. var3792)
		end
	end
	return var2586
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
	local var2609 = t_93.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2609.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2609.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2609.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2609.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2609.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2609.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2609.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2609.search_session_id = self.searchSessionId
	end
	return var2609
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
	local var2610 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2611, var2612 = protoModule.writeTag(buff, var2610, 1, protoModule.wireTypes.lengthDelimited)
		var2611, var3827 = protoModule.writeString(var2611, var2612, self.key)
		buff = var2611
		var2610 = var2612
	end
	if self.value ~= nil then
		local var2613 = self.value:encode()
		local var2614, var2615 = protoModule.writeTag(buff, var2610, 2, protoModule.wireTypes.lengthDelimited)
		var2614, var3830 = protoModule.writeBuffer(var2614, var2615, var2613, buffer.len(var2613))
		buff = var2614
		var2610 = var2615
	end
	local buff_1 = buffer.create(var2610)
	buffer.copy(buff_1, 0, buff, 0, var2610)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var2610 = t_94.new()
	local var2611 = 0
	while var2611 < buffer.len(p94) do
		local _ = nil
		local var2612 = nil
		local var2613, var2614, var2615 = protoModule.readTag(p94, var2611)
		local var2616 = var2613
		var2612 = var2614
		var2611 = var2615
		
		if var2612 == protoModule.wireTypes.varint then
			local _ = nil
			local var2617, var2618 = protoModule.readVarInt(p94, var2611)
			local _ = var2617
			var2611 = var2618
			continue
		end
		if var2612 == protoModule.wireTypes.lengthDelimited then
			if var2616 == 1 then
				local _ = nil
				local var2619, var2620 = protoModule.readBuffer(p94, var2611)
				var2611 = var2620
				var2610.key = buffer.tostring(var2619)
			elseif var2616 == 2 then
				local _ = nil
				local var2621, var2622 = protoModule.readBuffer(p94, var2611)
				var2611 = var2622
				var2610.value = t.FeedEntry.decode(var2621)
			else
				local _ = nil
				local var2623, var2624 = protoModule.readVarInt(p94, var2611)
				var2611 = var2624 + var2623
			end
		elseif var2612 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2625, var2626 = protoModule.readFixed32(p94, var2611)
			local _ = var2625
			var2611 = var2626
		elseif var2612 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2627, var2628 = protoModule.readFixed64(p94, var2611)
			local _ = var2627
			var2611 = var2628
		else
			error("Unsupported wire type: " .. var3834)
		end
	end
	return var2610
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
	local var2629 = t_94.new()
	
	if self.key ~= nil then
		var2629.key = self.key
	end
	if self.value ~= nil then
		var2629.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2629
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
	local var2629 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2630, var2631 = protoModule.writeTag(buff, var2629, 1, protoModule.wireTypes.lengthDelimited)
		var2630, var3856 = protoModule.writeString(var2630, var2631, self.key)
		buff = var2630
		var2629 = var2631
	end
	if self.value ~= nil then
		local var2632 = self.value:encode()
		local var2633, var2634 = protoModule.writeTag(buff, var2629, 2, protoModule.wireTypes.lengthDelimited)
		var2633, var3859 = protoModule.writeBuffer(var2633, var2634, var2632, buffer.len(var2632))
		buff = var2633
		var2629 = var2634
	end
	local buff_1 = buffer.create(var2629)
	buffer.copy(buff_1, 0, buff, 0, var2629)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2629 = t_95.new()
	local var2630 = 0
	while var2630 < buffer.len(p95) do
		local _ = nil
		local var2631 = nil
		local var2632, var2633, var2634 = protoModule.readTag(p95, var2630)
		local var2635 = var2632
		var2631 = var2633
		var2630 = var2634
		
		if var2631 == protoModule.wireTypes.varint then
			local _ = nil
			local var2636, var2637 = protoModule.readVarInt(p95, var2630)
			local _ = var2636
			var2630 = var2637
			continue
		end
		if var2631 == protoModule.wireTypes.lengthDelimited then
			if var2635 == 1 then
				local _ = nil
				local var2638, var2639 = protoModule.readBuffer(p95, var2630)
				var2630 = var2639
				var2629.key = buffer.tostring(var2638)
			elseif var2635 == 2 then
				local _ = nil
				local var2640, var2641 = protoModule.readBuffer(p95, var2630)
				var2630 = var2641
				var2629.value = t.ContentPool.decode(var2640)
			else
				local _ = nil
				local var2642, var2643 = protoModule.readVarInt(p95, var2630)
				var2630 = var2643 + var2642
			end
		elseif var2631 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2644, var2645 = protoModule.readFixed32(p95, var2630)
			local _ = var2644
			var2630 = var2645
		elseif var2631 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2646, var2647 = protoModule.readFixed64(p95, var2630)
			local _ = var2646
			var2630 = var2647
		else
			error("Unsupported wire type: " .. var3863)
		end
	end
	return var2629
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
	local var2648 = t_95.new()
	
	if self.key ~= nil then
		var2648.key = self.key
	end
	if self.value ~= nil then
		var2648.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2648
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
	local var2648 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2649, var2650 = protoModule.writeTag(buff, var2648, 1, protoModule.wireTypes.lengthDelimited)
		var2649, var3885 = protoModule.writeString(var2649, var2650, self.universe_id)
		buff = var2649
		var2648 = var2650
	end
	if self.is_content_locked then
		local var2651, var2652 = protoModule.writeTag(buff, var2648, 2, protoModule.wireTypes.varint)
		var2651, var3887 = protoModule.writeVarInt(var2651, var2652, if self.is_content_locked then 1 else 0)
		buff = var2651
		var2648 = var2652
	end
	local buff_1 = buffer.create(var2648)
	buffer.copy(buff_1, 0, buff, 0, var2648)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref)
	local var2648 = t_96.new()
	local var2649 = 0
	while var2649 < buffer.len(p96) do
		local _ = nil
		local var2650 = nil
		local var2651, var2652, var2653 = protoModule.readTag(p96, var2649)
		local var2654 = var2651
		var2650 = var2652
		var2649 = var2653
		
		if var2650 == protoModule.wireTypes.varint then
			if var2654 == 2 then
				local _ = nil
				local var2655, var2656 = protoModule.readVarInt(p96, var2649)
				var2649 = var2656
				var2648.is_content_locked = var2655 ~= 0
			else
				local _ = nil
				local var2657, var2658 = protoModule.readVarInt(p96, var2649)
				local _ = var2657
				var2649 = var2658
			end
		end
		if var2650 == protoModule.wireTypes.lengthDelimited then
			if var2654 == 1 then
				local _ = nil
				local var2659, var2660 = protoModule.readBuffer(p96, var2649)
				var2649 = var2660
				var2648.universe_id = buffer.tostring(var2659)
			else
				local _ = nil
				local var2661, var2662 = protoModule.readVarInt(p96, var2649)
				var2649 = var2662 + var2661
			end
		elseif var2650 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2663, var2664 = protoModule.readFixed32(p96, var2649)
			local _ = var2663
			var2649 = var2664
		elseif var2650 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2665, var2666 = protoModule.readFixed64(p96, var2649)
			local _ = var2665
			var2649 = var2666
		else
			error("Unsupported wire type: " .. var3891)
		end
	end
	return var2648
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
	local var2667 = t_96.new()
	
	if self.universe_id ~= nil then
		var2667.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2667.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2667.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2667.is_content_locked = self.isContentLocked
	end
	return var2667
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
	local var2667 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2668, var2669 = protoModule.writeTag(buff, var2667, 1, protoModule.wireTypes.lengthDelimited)
		var2668, var3913 = protoModule.writeString(var2668, var2669, self.overview_rich_text)
		buff = var2668
		var2667 = var2669
	end
	if self.result_entry ~= nil then
		local var2670 = self.result_entry:encode()
		local var2671, var2672 = protoModule.writeTag(buff, var2667, 2, protoModule.wireTypes.lengthDelimited)
		var2671, var3916 = protoModule.writeBuffer(var2671, var2672, var2670, buffer.len(var2670))
		buff = var2671
		var2667 = var2672
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2673, var2674 = protoModule.writeTag(buff, var2667, 3, protoModule.wireTypes.lengthDelimited)
			var2673, var3918 = protoModule.writeString(var2673, var2674, v)
			buff = var2673
			var2667 = var2674
		end
	end
	if self.show_loading then
		local var2675, var2676 = protoModule.writeTag(buff, var2667, 4, protoModule.wireTypes.varint)
		var2675, var3920 = protoModule.writeVarInt(var2675, var2676, if self.show_loading then 1 else 0)
		buff = var2675
		var2667 = var2676
	end
	if self.title ~= nil and self.title ~= "" then
		local var2677, var2678 = protoModule.writeTag(buff, var2667, 5, protoModule.wireTypes.lengthDelimited)
		var2677, var3922 = protoModule.writeString(var2677, var2678, self.title)
		buff = var2677
		var2667 = var2678
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2679, var2680 = protoModule.writeTag(buff, var2667, 6, protoModule.wireTypes.lengthDelimited)
		var2679, var3924 = protoModule.writeString(var2679, var2680, self.search_query)
		buff = var2679
		var2667 = var2680
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2681, var2682 = protoModule.writeTag(buff, var2667, 8, protoModule.wireTypes.lengthDelimited)
		var2681, var3926 = protoModule.writeString(var2681, var2682, self.universe_ids)
		buff = var2681
		var2667 = var2682
	end
	local buff_1 = buffer.create(var2667)
	buffer.copy(buff_1, 0, buff, 0, var2667)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var2683 = t_97.new()
	local var2684 = 0
	while var2684 < buffer.len(p97) do
		local _ = nil
		local var2685 = nil
		local var2686, var2687, var2688 = protoModule.readTag(p97, var2684)
		local var2689 = var2686
		var2685 = var2687
		var2684 = var2688
		
		if var2685 == protoModule.wireTypes.varint then
			if var2689 == 4 then
				local _ = nil
				local var2690, var2691 = protoModule.readVarInt(p97, var2684)
				var2684 = var2691
				var2683.show_loading = var2690 ~= 0
			else
				local _ = nil
				local var2692, var2693 = protoModule.readVarInt(p97, var2684)
				local _ = var2692
				var2684 = var2693
			end
		end
		if var2685 == protoModule.wireTypes.lengthDelimited then
			if var2689 == 1 then
				local _ = nil
				local var2694, var2695 = protoModule.readBuffer(p97, var2684)
				var2684 = var2695
				var2683.overview_rich_text = buffer.tostring(var2694)
			elseif var2689 == 2 then
				local _ = nil
				local var2696, var2697 = protoModule.readBuffer(p97, var2684)
				var2684 = var2697
				var2683.result_entry = t.FeedEntry.decode(var2696)
			elseif var2689 == 3 then
				local _ = nil
				local var2698, var2699 = protoModule.readBuffer(p97, var2684)
				var2684 = var2699
				table.insert(var2683.follow_up_queries, buffer.tostring(var2698))
			elseif var2689 == 5 then
				local _ = nil
				local var2700, var2701 = protoModule.readBuffer(p97, var2684)
				var2684 = var2701
				var2683.title = buffer.tostring(var2700)
			elseif var2689 == 6 then
				local _ = nil
				local var2702, var2703 = protoModule.readBuffer(p97, var2684)
				var2684 = var2703
				var2683.search_query = buffer.tostring(var2702)
			elseif var2689 == 8 then
				local _ = nil
				local var2704, var2705 = protoModule.readBuffer(p97, var2684)
				var2684 = var2705
				var2683.universe_ids = buffer.tostring(var2704)
			else
				local _ = nil
				local var2706, var2707 = protoModule.readVarInt(p97, var2684)
				var2684 = var2707 + var2706
			end
		elseif var2685 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2708, var2709 = protoModule.readFixed32(p97, var2684)
			local _ = var2708
			var2684 = var2709
		elseif var2685 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2710, var2711 = protoModule.readFixed64(p97, var2684)
			local _ = var2710
			var2684 = var2711
		else
			error("Unsupported wire type: " .. var3930)
		end
	end
	return var2683
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
	local var2712 = t_97.new()
	
	if self.overview_rich_text ~= nil then
		var2712.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2712.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2712.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2712.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2712.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2712.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2712.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2712.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2712.title = self.title
	end
	if self.search_query ~= nil then
		var2712.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2712.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2712.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2712.universe_ids = self.universeIds
	end
	return var2712
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
	local var2713 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2714, var2715 = protoModule.writeTag(buff, var2713, 1, protoModule.wireTypes.lengthDelimited)
		var2714, var3965 = protoModule.writeString(var2714, var2715, self.title)
		buff = var2714
		var2713 = var2715
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2716 = v:encode()
			local var2717, var2718 = protoModule.writeTag(buff, var2713, 2, protoModule.wireTypes.lengthDelimited)
			var2717, var3968 = protoModule.writeBuffer(var2717, var2718, var2716, buffer.len(var2716))
			buff = var2717
			var2713 = var2718
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2719, var2720 = protoModule.writeTag(buff, var2713, 3, protoModule.wireTypes.varint)
		var2719, var3970 = protoModule.writeVarInt(var2719, var2720, self.max_visible_rows)
		buff = var2719
		var2713 = var2720
	end
	if self.sort_id ~= nil then
		local var2721, var2722 = protoModule.writeTag(buff, var2713, 4, protoModule.wireTypes.lengthDelimited)
		var2721, var3972 = protoModule.writeString(var2721, var2722, self.sort_id)
		buff = var2721
		var2713 = var2722
	end
	local buff_1 = buffer.create(var2713)
	buffer.copy(buff_1, 0, buff, 0, var2713)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2723 = t_98.new()
	local var2724 = 0
	while var2724 < buffer.len(p98) do
		local _ = nil
		local var2725 = nil
		local var2726, var2727, var2728 = protoModule.readTag(p98, var2724)
		local var2729 = var2726
		var2725 = var2727
		var2724 = var2728
		
		if var2725 == protoModule.wireTypes.varint then
			if var2729 == 3 then
				local _ = nil
				local var2730, var2731 = protoModule.readVarIntI32(p98, var2724)
				var2724 = var2731
				var2723.max_visible_rows = var2730
			else
				local _ = nil
				local var2732, var2733 = protoModule.readVarInt(p98, var2724)
				local _ = var2732
				var2724 = var2733
			end
		end
		if var2725 == protoModule.wireTypes.lengthDelimited then
			if var2729 == 1 then
				local _ = nil
				local var2734, var2735 = protoModule.readBuffer(p98, var2724)
				var2724 = var2735
				var2723.title = buffer.tostring(var2734)
			elseif var2729 == 2 then
				local _ = nil
				local var2736, var2737 = protoModule.readBuffer(p98, var2724)
				var2724 = var2737
				table.insert(var2723.user_items, t.UserListInputData_UserItem.decode(var2736))
			elseif var2729 == 4 then
				local _ = nil
				local var2738, var2739 = protoModule.readBuffer(p98, var2724)
				var2724 = var2739
				var2723.sort_id = buffer.tostring(var2738)
			else
				local _ = nil
				local var2740, var2741 = protoModule.readVarInt(p98, var2724)
				var2724 = var2741 + var2740
			end
		elseif var2725 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2742, var2743 = protoModule.readFixed32(p98, var2724)
			local _ = var2742
			var2724 = var2743
		elseif var2725 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2744, var2745 = protoModule.readFixed64(p98, var2724)
			local _ = var2744
			var2724 = var2745
		else
			error("Unsupported wire type: " .. var3976)
		end
	end
	return var2723
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
	local var2746 = t_98.new()
	
	if self.title ~= nil then
		var2746.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2746.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2746.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2746.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2746.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2746.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2746.sort_id = self.sortId
	end
	return var2746
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
	local var2747 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2748, var2749 = protoModule.writeTag(buff, var2747, 1, protoModule.wireTypes.lengthDelimited)
		var2748, var4005 = protoModule.writeString(var2748, var2749, self.user_id)
		buff = var2748
		var2747 = var2749
	end
	local buff_1 = buffer.create(var2747)
	buffer.copy(buff_1, 0, buff, 0, var2747)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2747 = t_99.new()
	local var2748 = 0
	while var2748 < buffer.len(p99) do
		local _ = nil
		local var2749 = nil
		local var2750, var2751, var2752 = protoModule.readTag(p99, var2748)
		local var2753 = var2750
		var2749 = var2751
		var2748 = var2752
		
		if var2749 == protoModule.wireTypes.varint then
			local _ = nil
			local var2754, var2755 = protoModule.readVarInt(p99, var2748)
			local _ = var2754
			var2748 = var2755
			continue
		end
		if var2749 == protoModule.wireTypes.lengthDelimited then
			if var2753 == 1 then
				local _ = nil
				local var2756, var2757 = protoModule.readBuffer(p99, var2748)
				var2748 = var2757
				var2747.user_id = buffer.tostring(var2756)
			else
				local _ = nil
				local var2758, var2759 = protoModule.readVarInt(p99, var2748)
				var2748 = var2759 + var2758
			end
		elseif var2749 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2760, var2761 = protoModule.readFixed32(p99, var2748)
			local _ = var2760
			var2748 = var2761
		elseif var2749 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2762, var2763 = protoModule.readFixed64(p99, var2748)
			local _ = var2762
			var2748 = var2763
		else
			error("Unsupported wire type: " .. var4009)
		end
	end
	return var2747
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
	local var2764 = t_99.new()
	
	if self.user_id ~= nil then
		var2764.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2764.user_id = self.userId
	end
	return var2764
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
	local var2764 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2765, var2766 = protoModule.writeTag(buff, var2764, 1, protoModule.wireTypes.lengthDelimited)
		var2765, var4029 = protoModule.writeString(var2765, var2766, self.title)
		buff = var2765
		var2764 = var2766
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2767 = v:encode()
			local var2768, var2769 = protoModule.writeTag(buff, var2764, 2, protoModule.wireTypes.lengthDelimited)
			var2768, var4032 = protoModule.writeBuffer(var2768, var2769, var2767, buffer.len(var2767))
			buff = var2768
			var2764 = var2769
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2770, var2771 = protoModule.writeTag(buff, var2764, 3, protoModule.wireTypes.varint)
		var2770, var4034 = protoModule.writeVarInt(var2770, var2771, self.max_visible_rows)
		buff = var2770
		var2764 = var2771
	end
	if self.sort_id ~= nil then
		local var2772, var2773 = protoModule.writeTag(buff, var2764, 4, protoModule.wireTypes.lengthDelimited)
		var2772, var4036 = protoModule.writeString(var2772, var2773, self.sort_id)
		buff = var2772
		var2764 = var2773
	end
	local buff_1 = buffer.create(var2764)
	buffer.copy(buff_1, 0, buff, 0, var2764)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2774 = t_100.new()
	local var2775 = 0
	while var2775 < buffer.len(p100) do
		local _ = nil
		local var2776 = nil
		local var2777, var2778, var2779 = protoModule.readTag(p100, var2775)
		local var2780 = var2777
		var2776 = var2778
		var2775 = var2779
		
		if var2776 == protoModule.wireTypes.varint then
			if var2780 == 3 then
				local _ = nil
				local var2781, var2782 = protoModule.readVarIntI32(p100, var2775)
				var2775 = var2782
				var2774.max_visible_rows = var2781
			else
				local _ = nil
				local var2783, var2784 = protoModule.readVarInt(p100, var2775)
				local _ = var2783
				var2775 = var2784
			end
		end
		if var2776 == protoModule.wireTypes.lengthDelimited then
			if var2780 == 1 then
				local _ = nil
				local var2785, var2786 = protoModule.readBuffer(p100, var2775)
				var2775 = var2786
				var2774.title = buffer.tostring(var2785)
			elseif var2780 == 2 then
				local _ = nil
				local var2787, var2788 = protoModule.readBuffer(p100, var2775)
				var2775 = var2788
				table.insert(var2774.items, t.CatalogItemListInputData_CatalogItem.decode(var2787))
			elseif var2780 == 4 then
				local _ = nil
				local var2789, var2790 = protoModule.readBuffer(p100, var2775)
				var2775 = var2790
				var2774.sort_id = buffer.tostring(var2789)
			else
				local _ = nil
				local var2791, var2792 = protoModule.readVarInt(p100, var2775)
				var2775 = var2792 + var2791
			end
		elseif var2776 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2793, var2794 = protoModule.readFixed32(p100, var2775)
			local _ = var2793
			var2775 = var2794
		elseif var2776 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2795, var2796 = protoModule.readFixed64(p100, var2775)
			local _ = var2795
			var2775 = var2796
		else
			error("Unsupported wire type: " .. var4040)
		end
	end
	return var2774
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
	local var2797 = t_100.new()
	
	if self.title ~= nil then
		var2797.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2797.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2797.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2797.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2797.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2797.sort_id = self.sortId
	end
	return var2797
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
	local var2798 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2799, var2800 = protoModule.writeTag(buff, var2798, 1, protoModule.wireTypes.lengthDelimited)
		var2799, var4068 = protoModule.writeString(var2799, var2800, self.item_id)
		buff = var2799
		var2798 = var2800
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2801, var2802 = protoModule.writeTag(buff, var2798, 2, protoModule.wireTypes.lengthDelimited)
		var2801, var4070 = protoModule.writeString(var2801, var2802, self.item_type)
		buff = var2801
		var2798 = var2802
	end
	local buff_1 = buffer.create(var2798)
	buffer.copy(buff_1, 0, buff, 0, var2798)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref)
	local var2798 = t_101.new()
	local var2799 = 0
	while var2799 < buffer.len(p101) do
		local _ = nil
		local var2800 = nil
		local var2801, var2802, var2803 = protoModule.readTag(p101, var2799)
		local var2804 = var2801
		var2800 = var2802
		var2799 = var2803
		
		if var2800 == protoModule.wireTypes.varint then
			local _ = nil
			local var2805, var2806 = protoModule.readVarInt(p101, var2799)
			local _ = var2805
			var2799 = var2806
			continue
		end
		if var2800 == protoModule.wireTypes.lengthDelimited then
			if var2804 == 1 then
				local _ = nil
				local var2807, var2808 = protoModule.readBuffer(p101, var2799)
				var2799 = var2808
				var2798.item_id = buffer.tostring(var2807)
			elseif var2804 == 2 then
				local _ = nil
				local var2809, var2810 = protoModule.readBuffer(p101, var2799)
				var2799 = var2810
				var2798.item_type = buffer.tostring(var2809)
			else
				local _ = nil
				local var2811, var2812 = protoModule.readVarInt(p101, var2799)
				var2799 = var2812 + var2811
			end
		elseif var2800 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2813, var2814 = protoModule.readFixed32(p101, var2799)
			local _ = var2813
			var2799 = var2814
		elseif var2800 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2815, var2816 = protoModule.readFixed64(p101, var2799)
			local _ = var2815
			var2799 = var2816
		else
			error("Unsupported wire type: " .. var4074)
		end
	end
	return var2798
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
	local var2817 = t_101.new()
	
	if self.item_id ~= nil then
		var2817.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2817.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2817.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2817.item_type = self.itemType
	end
	return var2817
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
	local var2817 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2818, var2819 = protoModule.writeTag(buff, var2817, 1, protoModule.wireTypes.lengthDelimited)
		var2818, var4096 = protoModule.writeString(var2818, var2819, self.universe_id)
		buff = var2818
		var2817 = var2819
	end
	local buff_1 = buffer.create(var2817)
	buffer.copy(buff_1, 0, buff, 0, var2817)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2817 = t_102.new()
	local var2818 = 0
	while var2818 < buffer.len(p102) do
		local _ = nil
		local var2819 = nil
		local var2820, var2821, var2822 = protoModule.readTag(p102, var2818)
		local var2823 = var2820
		var2819 = var2821
		var2818 = var2822
		
		if var2819 == protoModule.wireTypes.varint then
			local _ = nil
			local var2824, var2825 = protoModule.readVarInt(p102, var2818)
			local _ = var2824
			var2818 = var2825
			continue
		end
		if var2819 == protoModule.wireTypes.lengthDelimited then
			if var2823 == 1 then
				local _ = nil
				local var2826, var2827 = protoModule.readBuffer(p102, var2818)
				var2818 = var2827
				var2817.universe_id = buffer.tostring(var2826)
			else
				local _ = nil
				local var2828, var2829 = protoModule.readVarInt(p102, var2818)
				var2818 = var2829 + var2828
			end
		elseif var2819 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2830, var2831 = protoModule.readFixed32(p102, var2818)
			local _ = var2830
			var2818 = var2831
		elseif var2819 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2832, var2833 = protoModule.readFixed64(p102, var2818)
			local _ = var2832
			var2818 = var2833
		else
			error("Unsupported wire type: " .. var4100)
		end
	end
	return var2817
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
	local var2834 = t_102.new()
	
	if self.universe_id ~= nil then
		var2834.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2834.universe_id = self.universeId
	end
	return var2834
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
	local var2834 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2835, var2836 = protoModule.writeTag(buff, var2834, 1, protoModule.wireTypes.lengthDelimited)
		var2835, var4120 = protoModule.writeString(var2835, var2836, self.title)
		buff = var2835
		var2834 = var2836
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2837, var2838 = protoModule.writeTag(buff, var2834, 2, protoModule.wireTypes.lengthDelimited)
		var2837, var4122 = protoModule.writeString(var2837, var2838, self.subtitle)
		buff = var2837
		var2834 = var2838
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2839 = v:encode()
			local var2840, var2841 = protoModule.writeTag(buff, var2834, 3, protoModule.wireTypes.lengthDelimited)
			var2840, var4125 = protoModule.writeBuffer(var2840, var2841, var2839, buffer.len(var2839))
			buff = var2840
			var2834 = var2841
		end
	end
	local buff_1 = buffer.create(var2834)
	buffer.copy(buff_1, 0, buff, 0, var2834)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), t (ref)
	local var2842 = t_103.new()
	local var2843 = 0
	while var2843 < buffer.len(p103) do
		local _ = nil
		local var2844 = nil
		local var2845, var2846, var2847 = protoModule.readTag(p103, var2843)
		local var2848 = var2845
		var2844 = var2846
		var2843 = var2847
		
		if var2844 == protoModule.wireTypes.varint then
			local _ = nil
			local var2849, var2850 = protoModule.readVarInt(p103, var2843)
			local _ = var2849
			var2843 = var2850
			continue
		end
		if var2844 == protoModule.wireTypes.lengthDelimited then
			if var2848 == 1 then
				local _ = nil
				local var2851, var2852 = protoModule.readBuffer(p103, var2843)
				var2843 = var2852
				var2842.title = buffer.tostring(var2851)
			elseif var2848 == 2 then
				local _ = nil
				local var2853, var2854 = protoModule.readBuffer(p103, var2843)
				var2843 = var2854
				var2842.subtitle = buffer.tostring(var2853)
			elseif var2848 == 3 then
				local _ = nil
				local var2855, var2856 = protoModule.readBuffer(p103, var2843)
				var2843 = var2856
				table.insert(var2842.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2855))
			else
				local _ = nil
				local var2857, var2858 = protoModule.readVarInt(p103, var2843)
				var2843 = var2858 + var2857
			end
		elseif var2844 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2859, var2860 = protoModule.readFixed32(p103, var2843)
			local _ = var2859
			var2843 = var2860
		elseif var2844 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2861, var2862 = protoModule.readFixed64(p103, var2843)
			local _ = var2861
			var2843 = var2862
		else
			error("Unsupported wire type: " .. var4129)
		end
	end
	return var2842
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
	local var2863 = t_103.new()
	
	if self.title ~= nil then
		var2863.title = self.title
	end
	if self.subtitle ~= nil then
		var2863.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2863.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2863.moment_items = t_1
	end
	return var2863
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
	local var2864 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2865, var2866 = protoModule.writeTag(buff, var2864, 1, protoModule.wireTypes.lengthDelimited)
		var2865, var4156 = protoModule.writeString(var2865, var2866, self.moment_id)
		buff = var2865
		var2864 = var2866
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2867, var2868 = protoModule.writeTag(buff, var2864, 2, protoModule.wireTypes.lengthDelimited)
		var2867, var4158 = protoModule.writeString(var2867, var2868, self.video_asset_id)
		buff = var2867
		var2864 = var2868
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2869, var2870 = protoModule.writeTag(buff, var2864, 3, protoModule.wireTypes.lengthDelimited)
		var2869, var4160 = protoModule.writeString(var2869, var2870, self.target_universe_id)
		buff = var2869
		var2864 = var2870
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2871, var2872 = protoModule.writeTag(buff, var2864, 4, protoModule.wireTypes.lengthDelimited)
		var2871, var4162 = protoModule.writeString(var2871, var2872, self.target_place_id)
		buff = var2871
		var2864 = var2872
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2873, var2874 = protoModule.writeTag(buff, var2864, 5, protoModule.wireTypes.lengthDelimited)
		var2873, var4164 = protoModule.writeString(var2873, var2874, self.feed_item_id)
		buff = var2873
		var2864 = var2874
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2875, var2876 = protoModule.writeTag(buff, var2864, 6, protoModule.wireTypes.lengthDelimited)
		var2875, var4166 = protoModule.writeString(var2875, var2876, self.capture_universe_id)
		buff = var2875
		var2864 = var2876
	end
	local buff_1 = buffer.create(var2864)
	buffer.copy(buff_1, 0, buff, 0, var2864)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2864 = t_104.new()
	local var2865 = 0
	while var2865 < buffer.len(p104) do
		local _ = nil
		local var2866 = nil
		local var2867, var2868, var2869 = protoModule.readTag(p104, var2865)
		local var2870 = var2867
		var2866 = var2868
		var2865 = var2869
		
		if var2866 == protoModule.wireTypes.varint then
			local _ = nil
			local var2871, var2872 = protoModule.readVarInt(p104, var2865)
			local _ = var2871
			var2865 = var2872
			continue
		end
		if var2866 == protoModule.wireTypes.lengthDelimited then
			if var2870 == 1 then
				local _ = nil
				local var2873, var2874 = protoModule.readBuffer(p104, var2865)
				var2865 = var2874
				var2864.moment_id = buffer.tostring(var2873)
			elseif var2870 == 2 then
				local _ = nil
				local var2875, var2876 = protoModule.readBuffer(p104, var2865)
				var2865 = var2876
				var2864.video_asset_id = buffer.tostring(var2875)
			elseif var2870 == 3 then
				local _ = nil
				local var2877, var2878 = protoModule.readBuffer(p104, var2865)
				var2865 = var2878
				var2864.target_universe_id = buffer.tostring(var2877)
			elseif var2870 == 4 then
				local _ = nil
				local var2879, var2880 = protoModule.readBuffer(p104, var2865)
				var2865 = var2880
				var2864.target_place_id = buffer.tostring(var2879)
			elseif var2870 == 5 then
				local _ = nil
				local var2881, var2882 = protoModule.readBuffer(p104, var2865)
				var2865 = var2882
				var2864.feed_item_id = buffer.tostring(var2881)
			elseif var2870 == 6 then
				local _ = nil
				local var2883, var2884 = protoModule.readBuffer(p104, var2865)
				var2865 = var2884
				var2864.capture_universe_id = buffer.tostring(var2883)
			else
				local _ = nil
				local var2885, var2886 = protoModule.readVarInt(p104, var2865)
				var2865 = var2886 + var2885
			end
		elseif var2866 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2887, var2888 = protoModule.readFixed32(p104, var2865)
			local _ = var2887
			var2865 = var2888
		elseif var2866 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2889, var2890 = protoModule.readFixed64(p104, var2865)
			local _ = var2889
			var2865 = var2890
		else
			error("Unsupported wire type: " .. var4170)
		end
	end
	return var2864
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
	local var2891 = t_104.new()
	
	if self.moment_id ~= nil then
		var2891.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var2891.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var2891.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2891.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var2891.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var2891.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var2891.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var2891.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var2891.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var2891.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var2891.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var2891.capture_universe_id = self.captureUniverseId
	end
	return var2891
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
	local var2891 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2892, var2893 = protoModule.writeTag(buff, var2891, 1, protoModule.wireTypes.lengthDelimited)
		var2892, var4200 = protoModule.writeString(var2892, var2893, self.title)
		buff = var2892
		var2891 = var2893
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2894, var2895 = protoModule.writeTag(buff, var2891, 2, protoModule.wireTypes.lengthDelimited)
		var2894, var4202 = protoModule.writeString(var2894, var2895, self.subtitle)
		buff = var2894
		var2891 = var2895
	end
	local buff_1 = buffer.create(var2891)
	buffer.copy(buff_1, 0, buff, 0, var2891)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2891 = t_105.new()
	local var2892 = 0
	while var2892 < buffer.len(p105) do
		local _ = nil
		local var2893 = nil
		local var2894, var2895, var2896 = protoModule.readTag(p105, var2892)
		local var2897 = var2894
		var2893 = var2895
		var2892 = var2896
		
		if var2893 == protoModule.wireTypes.varint then
			local _ = nil
			local var2898, var2899 = protoModule.readVarInt(p105, var2892)
			local _ = var2898
			var2892 = var2899
			continue
		end
		if var2893 == protoModule.wireTypes.lengthDelimited then
			if var2897 == 1 then
				local _ = nil
				local var2900, var2901 = protoModule.readBuffer(p105, var2892)
				var2892 = var2901
				var2891.title = buffer.tostring(var2900)
			elseif var2897 == 2 then
				local _ = nil
				local var2902, var2903 = protoModule.readBuffer(p105, var2892)
				var2892 = var2903
				var2891.subtitle = buffer.tostring(var2902)
			else
				local _ = nil
				local var2904, var2905 = protoModule.readVarInt(p105, var2892)
				var2892 = var2905 + var2904
			end
		elseif var2893 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2906, var2907 = protoModule.readFixed32(p105, var2892)
			local _ = var2906
			var2892 = var2907
		elseif var2893 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2908, var2909 = protoModule.readFixed64(p105, var2892)
			local _ = var2908
			var2892 = var2909
		else
			error("Unsupported wire type: " .. var4206)
		end
	end
	return var2891
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
	local var2910 = t_105.new()
	
	if self.title ~= nil then
		var2910.title = self.title
	end
	if self.subtitle ~= nil then
		var2910.subtitle = self.subtitle
	end
	return var2910
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
	local var2910 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var2911, var2912 = protoModule.writeTag(buff, var2910, 1, protoModule.wireTypes.lengthDelimited)
		var2911, var4228 = protoModule.writeString(var2911, var2912, self.primary_cta_button_text)
		buff = var2911
		var2910 = var2912
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var2913, var2914 = protoModule.writeTag(buff, var2910, 2, protoModule.wireTypes.lengthDelimited)
		var2913, var4230 = protoModule.writeString(var2913, var2914, self.secondary_cta_button_text)
		buff = var2913
		var2910 = var2914
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var2915, var2916 = protoModule.writeTag(buff, var2910, 3, protoModule.wireTypes.lengthDelimited)
		var2915, var4232 = protoModule.writeString(var2915, var2916, self.primary_cta_type)
		buff = var2915
		var2910 = var2916
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var2917, var2918 = protoModule.writeTag(buff, var2910, 4, protoModule.wireTypes.lengthDelimited)
		var2917, var4234 = protoModule.writeString(var2917, var2918, self.secondary_cta_type)
		buff = var2917
		var2910 = var2918
	end
	local buff_1 = buffer.create(var2910)
	buffer.copy(buff_1, 0, buff, 0, var2910)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var2910 = t_106.new()
	local var2911 = 0
	while var2911 < buffer.len(p106) do
		local _ = nil
		local var2912 = nil
		local var2913, var2914, var2915 = protoModule.readTag(p106, var2911)
		local var2916 = var2913
		var2912 = var2914
		var2911 = var2915
		
		if var2912 == protoModule.wireTypes.varint then
			local _ = nil
			local var2917, var2918 = protoModule.readVarInt(p106, var2911)
			local _ = var2917
			var2911 = var2918
			continue
		end
		if var2912 == protoModule.wireTypes.lengthDelimited then
			if var2916 == 1 then
				local _ = nil
				local var2919, var2920 = protoModule.readBuffer(p106, var2911)
				var2911 = var2920
				var2910.primary_cta_button_text = buffer.tostring(var2919)
			elseif var2916 == 2 then
				local _ = nil
				local var2921, var2922 = protoModule.readBuffer(p106, var2911)
				var2911 = var2922
				var2910.secondary_cta_button_text = buffer.tostring(var2921)
			elseif var2916 == 3 then
				local _ = nil
				local var2923, var2924 = protoModule.readBuffer(p106, var2911)
				var2911 = var2924
				var2910.primary_cta_type = buffer.tostring(var2923)
			elseif var2916 == 4 then
				local _ = nil
				local var2925, var2926 = protoModule.readBuffer(p106, var2911)
				var2911 = var2926
				var2910.secondary_cta_type = buffer.tostring(var2925)
			else
				local _ = nil
				local var2927, var2928 = protoModule.readVarInt(p106, var2911)
				var2911 = var2928 + var2927
			end
		elseif var2912 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2929, var2930 = protoModule.readFixed32(p106, var2911)
			local _ = var2929
			var2911 = var2930
		elseif var2912 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2931, var2932 = protoModule.readFixed64(p106, var2911)
			local _ = var2931
			var2911 = var2932
		else
			error("Unsupported wire type: " .. var4238)
		end
	end
	return var2910
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
	local var2933 = t_106.new()
	
	if self.primary_cta_button_text ~= nil then
		var2933.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var2933.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var2933.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var2933.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var2933.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var2933.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var2933.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var2933.secondary_cta_type = self.secondaryCtaType
	end
	return var2933
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
	local var2933 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2934, var2935 = protoModule.writeTag(buff, var2933, 1, protoModule.wireTypes.lengthDelimited)
		var2934, var4264 = protoModule.writeString(var2934, var2935, self.image_asset_id)
		buff = var2934
		var2933 = var2935
	end
	local buff_1 = buffer.create(var2933)
	buffer.copy(buff_1, 0, buff, 0, var2933)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2933 = t_107.new()
	local var2934 = 0
	while var2934 < buffer.len(p107) do
		local _ = nil
		local var2935 = nil
		local var2936, var2937, var2938 = protoModule.readTag(p107, var2934)
		local var2939 = var2936
		var2935 = var2937
		var2934 = var2938
		
		if var2935 == protoModule.wireTypes.varint then
			local _ = nil
			local var2940, var2941 = protoModule.readVarInt(p107, var2934)
			local _ = var2940
			var2934 = var2941
			continue
		end
		if var2935 == protoModule.wireTypes.lengthDelimited then
			if var2939 == 1 then
				local _ = nil
				local var2942, var2943 = protoModule.readBuffer(p107, var2934)
				var2934 = var2943
				var2933.image_asset_id = buffer.tostring(var2942)
			else
				local _ = nil
				local var2944, var2945 = protoModule.readVarInt(p107, var2934)
				var2934 = var2945 + var2944
			end
		elseif var2935 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2946, var2947 = protoModule.readFixed32(p107, var2934)
			local _ = var2946
			var2934 = var2947
		elseif var2935 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2948, var2949 = protoModule.readFixed64(p107, var2934)
			local _ = var2948
			var2934 = var2949
		else
			error("Unsupported wire type: " .. var4268)
		end
	end
	return var2933
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
	local var2950 = t_107.new()
	
	if self.image_asset_id ~= nil then
		var2950.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var2950.image_asset_id = self.imageAssetId
	end
	return var2950
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
	local var2950 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2951, var2952 = protoModule.writeTag(buff, var2950, 1, protoModule.wireTypes.lengthDelimited)
		var2951, var4288 = protoModule.writeString(var2951, var2952, self.video_asset_id)
		buff = var2951
		var2950 = var2952
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var2953, var2954 = protoModule.writeTag(buff, var2950, 2, protoModule.wireTypes.lengthDelimited)
		var2953, var4290 = protoModule.writeString(var2953, var2954, self.loading_image_asset_id)
		buff = var2953
		var2950 = var2954
	end
	local buff_1 = buffer.create(var2950)
	buffer.copy(buff_1, 0, buff, 0, var2950)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var2950 = t_108.new()
	local var2951 = 0
	while var2951 < buffer.len(p108) do
		local _ = nil
		local var2952 = nil
		local var2953, var2954, var2955 = protoModule.readTag(p108, var2951)
		local var2956 = var2953
		var2952 = var2954
		var2951 = var2955
		
		if var2952 == protoModule.wireTypes.varint then
			local _ = nil
			local var2957, var2958 = protoModule.readVarInt(p108, var2951)
			local _ = var2957
			var2951 = var2958
			continue
		end
		if var2952 == protoModule.wireTypes.lengthDelimited then
			if var2956 == 1 then
				local _ = nil
				local var2959, var2960 = protoModule.readBuffer(p108, var2951)
				var2951 = var2960
				var2950.video_asset_id = buffer.tostring(var2959)
			elseif var2956 == 2 then
				local _ = nil
				local var2961, var2962 = protoModule.readBuffer(p108, var2951)
				var2951 = var2962
				var2950.loading_image_asset_id = buffer.tostring(var2961)
			else
				local _ = nil
				local var2963, var2964 = protoModule.readVarInt(p108, var2951)
				var2951 = var2964 + var2963
			end
		elseif var2952 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2965, var2966 = protoModule.readFixed32(p108, var2951)
			local _ = var2965
			var2951 = var2966
		elseif var2952 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2967, var2968 = protoModule.readFixed64(p108, var2951)
			local _ = var2967
			var2951 = var2968
		else
			error("Unsupported wire type: " .. var4294)
		end
	end
	return var2950
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
	local var2969 = t_108.new()
	
	if self.video_asset_id ~= nil then
		var2969.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2969.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var2969.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var2969.loading_image_asset_id = self.loadingImageAssetId
	end
	return var2969
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
	local var2969 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var2970, var2971 = protoModule.writeTag(buff, var2969, 1, protoModule.wireTypes.lengthDelimited)
		var2970, var4316 = protoModule.writeString(var2970, var2971, self.text)
		buff = var2970
		var2969 = var2971
	end
	if self.is_rendered_text then
		local var2972, var2973 = protoModule.writeTag(buff, var2969, 2, protoModule.wireTypes.varint)
		var2972, var4318 = protoModule.writeVarInt(var2972, var2973, if self.is_rendered_text then 1 else 0)
		buff = var2972
		var2969 = var2973
	end
	local buff_1 = buffer.create(var2969)
	buffer.copy(buff_1, 0, buff, 0, var2969)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref)
	local var2969 = t_109.new()
	local var2970 = 0
	while var2970 < buffer.len(p109) do
		local _ = nil
		local var2971 = nil
		local var2972, var2973, var2974 = protoModule.readTag(p109, var2970)
		local var2975 = var2972
		var2971 = var2973
		var2970 = var2974
		
		if var2971 == protoModule.wireTypes.varint then
			if var2975 == 2 then
				local _ = nil
				local var2976, var2977 = protoModule.readVarInt(p109, var2970)
				var2970 = var2977
				var2969.is_rendered_text = var2976 ~= 0
			else
				local _ = nil
				local var2978, var2979 = protoModule.readVarInt(p109, var2970)
				local _ = var2978
				var2970 = var2979
			end
		end
		if var2971 == protoModule.wireTypes.lengthDelimited then
			if var2975 == 1 then
				local _ = nil
				local var2980, var2981 = protoModule.readBuffer(p109, var2970)
				var2970 = var2981
				var2969.text = buffer.tostring(var2980)
			else
				local _ = nil
				local var2982, var2983 = protoModule.readVarInt(p109, var2970)
				var2970 = var2983 + var2982
			end
		elseif var2971 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2984, var2985 = protoModule.readFixed32(p109, var2970)
			local _ = var2984
			var2970 = var2985
		elseif var2971 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2986, var2987 = protoModule.readFixed64(p109, var2970)
			local _ = var2986
			var2970 = var2987
		else
			error("Unsupported wire type: " .. var4322)
		end
	end
	return var2969
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
	local var2988 = t_109.new()
	
	if self.text ~= nil then
		var2988.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var2988.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var2988.is_rendered_text = self.isRenderedText
	end
	return var2988
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
	local var2988 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2989, var2990 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2989, var4344 = protoModule.writeString(var2989, var2990, i)
			local var2991 = v:encode()
			var2990, var4346 = protoModule.writeTag(var2989, var2990, 2, protoModule.wireTypes.lengthDelimited)
			var2990, var4346 = protoModule.writeBuffer(var2990, var4346, var2991, buffer.len(var2991))
			local var2992 = var2990
			local var2993 = var4346
			local var2994, var2995 = protoModule.writeTag(buff, var2988, 1, protoModule.wireTypes.lengthDelimited)
			var2994, var4350 = protoModule.writeBuffer(var2994, var2995, var2992, var2993)
			buff = var2994
			var2988 = var2995
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2996, var2997 = protoModule.writeTag(buff, var2988, 2, protoModule.wireTypes.lengthDelimited)
			var2996, var4352 = protoModule.writeString(var2996, var2997, v)
			buff = var2996
			var2988 = var2997
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var2998, var2999 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2998, var4354 = protoModule.writeString(var2998, var2999, i)
			local var3000 = v:encode()
			var2999, var4356 = protoModule.writeTag(var2998, var2999, 2, protoModule.wireTypes.lengthDelimited)
			var2999, var4356 = protoModule.writeBuffer(var2999, var4356, var3000, buffer.len(var3000))
			local var3001 = var2999
			local var3002 = var4356
			local var3003, var3004 = protoModule.writeTag(buff, var2988, 3, protoModule.wireTypes.lengthDelimited)
			var3003, var4360 = protoModule.writeBuffer(var3003, var3004, var3001, var3002)
			buff = var3003
			var2988 = var3004
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3005, var3006 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3005, var4362 = protoModule.writeString(var3005, var3006, i)
			local var3007 = v:encode()
			var3006, var4364 = protoModule.writeTag(var3005, var3006, 2, protoModule.wireTypes.lengthDelimited)
			var3006, var4364 = protoModule.writeBuffer(var3006, var4364, var3007, buffer.len(var3007))
			local var3008 = var3006
			local var3009 = var4364
			local var3010, var3011 = protoModule.writeTag(buff, var2988, 4, protoModule.wireTypes.lengthDelimited)
			var3010, var4368 = protoModule.writeBuffer(var3010, var3011, var3008, var3009)
			buff = var3010
			var2988 = var3011
		end
	end
	local buff_1 = buffer.create(var2988)
	buffer.copy(buff_1, 0, buff, 0, var2988)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var3012 = t_110.new()
	local var3013 = 0
	while var3013 < buffer.len(p110) do
		local _ = nil
		local var3014 = nil
		local var3015, var3016, var3017 = protoModule.readTag(p110, var3013)
		local var3018 = var3015
		var3014 = var3016
		var3013 = var3017
		
		if var3014 == protoModule.wireTypes.varint then
			local _ = nil
			local var3019, var3020 = protoModule.readVarInt(p110, var3013)
			local _ = var3019
			var3013 = var3020
			continue
		end
		if var3014 == protoModule.wireTypes.lengthDelimited then
			if var3018 == 1 then
				local _ = nil
				local var3021, var3022 = protoModule.readBuffer(p110, var3013)
				var3013 = var3022
				var3021 = t.VerticalFeedInputData_EntryMapEntry.decode(var3021)
				var3012.entry_map[var3021.key or ""] = var3021.value or t.FeedEntry.new()
			elseif var3018 == 2 then
				local _ = nil
				local var3023, var3024 = protoModule.readBuffer(p110, var3013)
				var3013 = var3024
				table.insert(var3012.entry_order, buffer.tostring(var3023))
			elseif var3018 == 3 then
				local _ = nil
				local var3025, var3026 = protoModule.readBuffer(p110, var3013)
				var3013 = var3026
				var3025 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3025)
				var3012.entry_order_map[var3025.key or ""] = var3025.value or t.EntryOrder.new()
			elseif var3018 == 4 then
				local _ = nil
				local var3027, var3028 = protoModule.readBuffer(p110, var3013)
				var3013 = var3028
				var3027 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3027)
				var3012.content_pools[var3027.key or ""] = var3027.value or t.ContentPool.new()
			else
				local _ = nil
				local var3029, var3030 = protoModule.readVarInt(p110, var3013)
				var3013 = var3030 + var3029
			end
		elseif var3014 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3031, var3032 = protoModule.readFixed32(p110, var3013)
			local _ = var3031
			var3013 = var3032
		elseif var3014 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3033, var3034 = protoModule.readFixed64(p110, var3013)
			local _ = var3033
			var3013 = var3034
		else
			error("Unsupported wire type: " .. var4372)
		end
	end
	return var3012
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
	local var3035 = t_110.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3035.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3035.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3035.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3035.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3035.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3035.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3035.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3035.content_pools = t_1
	end
	return var3035
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
	local var3036 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3037, var3038 = protoModule.writeTag(buff, var3036, 1, protoModule.wireTypes.lengthDelimited)
		var3037, var4410 = protoModule.writeString(var3037, var3038, self.key)
		buff = var3037
		var3036 = var3038
	end
	if self.value ~= nil then
		local var3039 = self.value:encode()
		local var3040, var3041 = protoModule.writeTag(buff, var3036, 2, protoModule.wireTypes.lengthDelimited)
		var3040, var4413 = protoModule.writeBuffer(var3040, var3041, var3039, buffer.len(var3039))
		buff = var3040
		var3036 = var3041
	end
	local buff_1 = buffer.create(var3036)
	buffer.copy(buff_1, 0, buff, 0, var3036)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var3036 = t_111.new()
	local var3037 = 0
	while var3037 < buffer.len(p111) do
		local _ = nil
		local var3038 = nil
		local var3039, var3040, var3041 = protoModule.readTag(p111, var3037)
		local var3042 = var3039
		var3038 = var3040
		var3037 = var3041
		
		if var3038 == protoModule.wireTypes.varint then
			local _ = nil
			local var3043, var3044 = protoModule.readVarInt(p111, var3037)
			local _ = var3043
			var3037 = var3044
			continue
		end
		if var3038 == protoModule.wireTypes.lengthDelimited then
			if var3042 == 1 then
				local _ = nil
				local var3045, var3046 = protoModule.readBuffer(p111, var3037)
				var3037 = var3046
				var3036.key = buffer.tostring(var3045)
			elseif var3042 == 2 then
				local _ = nil
				local var3047, var3048 = protoModule.readBuffer(p111, var3037)
				var3037 = var3048
				var3036.value = t.FeedEntry.decode(var3047)
			else
				local _ = nil
				local var3049, var3050 = protoModule.readVarInt(p111, var3037)
				var3037 = var3050 + var3049
			end
		elseif var3038 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3051, var3052 = protoModule.readFixed32(p111, var3037)
			local _ = var3051
			var3037 = var3052
		elseif var3038 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3053, var3054 = protoModule.readFixed64(p111, var3037)
			local _ = var3053
			var3037 = var3054
		else
			error("Unsupported wire type: " .. var4417)
		end
	end
	return var3036
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
	local var3055 = t_111.new()
	
	if self.key ~= nil then
		var3055.key = self.key
	end
	if self.value ~= nil then
		var3055.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3055
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
	local var3055 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3056, var3057 = protoModule.writeTag(buff, var3055, 1, protoModule.wireTypes.lengthDelimited)
		var3056, var4439 = protoModule.writeString(var3056, var3057, self.key)
		buff = var3056
		var3055 = var3057
	end
	if self.value ~= nil then
		local var3058 = self.value:encode()
		local var3059, var3060 = protoModule.writeTag(buff, var3055, 2, protoModule.wireTypes.lengthDelimited)
		var3059, var4442 = protoModule.writeBuffer(var3059, var3060, var3058, buffer.len(var3058))
		buff = var3059
		var3055 = var3060
	end
	local buff_1 = buffer.create(var3055)
	buffer.copy(buff_1, 0, buff, 0, var3055)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var3055 = t_112.new()
	local var3056 = 0
	while var3056 < buffer.len(p112) do
		local _ = nil
		local var3057 = nil
		local var3058, var3059, var3060 = protoModule.readTag(p112, var3056)
		local var3061 = var3058
		var3057 = var3059
		var3056 = var3060
		
		if var3057 == protoModule.wireTypes.varint then
			local _ = nil
			local var3062, var3063 = protoModule.readVarInt(p112, var3056)
			local _ = var3062
			var3056 = var3063
			continue
		end
		if var3057 == protoModule.wireTypes.lengthDelimited then
			if var3061 == 1 then
				local _ = nil
				local var3064, var3065 = protoModule.readBuffer(p112, var3056)
				var3056 = var3065
				var3055.key = buffer.tostring(var3064)
			elseif var3061 == 2 then
				local _ = nil
				local var3066, var3067 = protoModule.readBuffer(p112, var3056)
				var3056 = var3067
				var3055.value = t.EntryOrder.decode(var3066)
			else
				local _ = nil
				local var3068, var3069 = protoModule.readVarInt(p112, var3056)
				var3056 = var3069 + var3068
			end
		elseif var3057 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3070, var3071 = protoModule.readFixed32(p112, var3056)
			local _ = var3070
			var3056 = var3071
		elseif var3057 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3072, var3073 = protoModule.readFixed64(p112, var3056)
			local _ = var3072
			var3056 = var3073
		else
			error("Unsupported wire type: " .. var4446)
		end
	end
	return var3055
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
	local var3074 = t_112.new()
	
	if self.key ~= nil then
		var3074.key = self.key
	end
	if self.value ~= nil then
		var3074.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3074
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
	local var3074 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3075, var3076 = protoModule.writeTag(buff, var3074, 1, protoModule.wireTypes.lengthDelimited)
		var3075, var4468 = protoModule.writeString(var3075, var3076, self.key)
		buff = var3075
		var3074 = var3076
	end
	if self.value ~= nil then
		local var3077 = self.value:encode()
		local var3078, var3079 = protoModule.writeTag(buff, var3074, 2, protoModule.wireTypes.lengthDelimited)
		var3078, var4471 = protoModule.writeBuffer(var3078, var3079, var3077, buffer.len(var3077))
		buff = var3078
		var3074 = var3079
	end
	local buff_1 = buffer.create(var3074)
	buffer.copy(buff_1, 0, buff, 0, var3074)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var3074 = t_113.new()
	local var3075 = 0
	while var3075 < buffer.len(p113) do
		local _ = nil
		local var3076 = nil
		local var3077, var3078, var3079 = protoModule.readTag(p113, var3075)
		local var3080 = var3077
		var3076 = var3078
		var3075 = var3079
		
		if var3076 == protoModule.wireTypes.varint then
			local _ = nil
			local var3081, var3082 = protoModule.readVarInt(p113, var3075)
			local _ = var3081
			var3075 = var3082
			continue
		end
		if var3076 == protoModule.wireTypes.lengthDelimited then
			if var3080 == 1 then
				local _ = nil
				local var3083, var3084 = protoModule.readBuffer(p113, var3075)
				var3075 = var3084
				var3074.key = buffer.tostring(var3083)
			elseif var3080 == 2 then
				local _ = nil
				local var3085, var3086 = protoModule.readBuffer(p113, var3075)
				var3075 = var3086
				var3074.value = t.ContentPool.decode(var3085)
			else
				local _ = nil
				local var3087, var3088 = protoModule.readVarInt(p113, var3075)
				var3075 = var3088 + var3087
			end
		elseif var3076 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3089, var3090 = protoModule.readFixed32(p113, var3075)
			local _ = var3089
			var3075 = var3090
		elseif var3076 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3091, var3092 = protoModule.readFixed64(p113, var3075)
			local _ = var3091
			var3075 = var3092
		else
			error("Unsupported wire type: " .. var4475)
		end
	end
	return var3074
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
	local var3093 = t_113.new()
	
	if self.key ~= nil then
		var3093.key = self.key
	end
	if self.value ~= nil then
		var3093.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3093
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
	local var3093 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3094 = self.foreground_header_entry:encode()
		local var3095, var3096 = protoModule.writeTag(buff, var3093, 1, protoModule.wireTypes.lengthDelimited)
		var3095, var4498 = protoModule.writeBuffer(var3095, var3096, var3094, buffer.len(var3094))
		buff = var3095
		var3093 = var3096
	end
	if self.background_header_entry ~= nil then
		local var3097 = self.background_header_entry:encode()
		local var3098, var3099 = protoModule.writeTag(buff, var3093, 2, protoModule.wireTypes.lengthDelimited)
		var3098, var4501 = protoModule.writeBuffer(var3098, var3099, var3097, buffer.len(var3097))
		buff = var3098
		var3093 = var3099
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3100, var3101 = protoModule.writeTag(buff, var3093, 3, protoModule.wireTypes.lengthDelimited)
		var3100, var4503 = protoModule.writeString(var3100, var3101, self.layout_variant)
		buff = var3100
		var3093 = var3101
	end
	local buff_1 = buffer.create(var3093)
	buffer.copy(buff_1, 0, buff, 0, var3093)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3093 = t_114.new()
	local var3094 = 0
	while var3094 < buffer.len(p114) do
		local _ = nil
		local var3095 = nil
		local var3096, var3097, var3098 = protoModule.readTag(p114, var3094)
		local var3099 = var3096
		var3095 = var3097
		var3094 = var3098
		
		if var3095 == protoModule.wireTypes.varint then
			local _ = nil
			local var3100, var3101 = protoModule.readVarInt(p114, var3094)
			local _ = var3100
			var3094 = var3101
			continue
		end
		if var3095 == protoModule.wireTypes.lengthDelimited then
			if var3099 == 1 then
				local _ = nil
				local var3102, var3103 = protoModule.readBuffer(p114, var3094)
				var3094 = var3103
				var3093.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3102)
			elseif var3099 == 2 then
				local _ = nil
				local var3104, var3105 = protoModule.readBuffer(p114, var3094)
				var3094 = var3105
				var3093.background_header_entry = t.BackgroundHeaderEntry.decode(var3104)
			elseif var3099 == 3 then
				local _ = nil
				local var3106, var3107 = protoModule.readBuffer(p114, var3094)
				var3094 = var3107
				var3093.layout_variant = buffer.tostring(var3106)
			else
				local _ = nil
				local var3108, var3109 = protoModule.readVarInt(p114, var3094)
				var3094 = var3109 + var3108
			end
		elseif var3095 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3110, var3111 = protoModule.readFixed32(p114, var3094)
			local _ = var3110
			var3094 = var3111
		elseif var3095 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3112, var3113 = protoModule.readFixed64(p114, var3094)
			local _ = var3112
			var3094 = var3113
		else
			error("Unsupported wire type: " .. var4507)
		end
	end
	return var3093
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
	local var3114 = t_114.new()
	
	if self.foreground_header_entry ~= nil then
		var3114.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3114.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3114.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3114.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3114.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3114.layout_variant = self.layoutVariant
	end
	return var3114
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
	local var3114 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3115, var3116 = protoModule.writeTag(buff, var3114, 1, protoModule.wireTypes.lengthDelimited)
		var3115, var4531 = protoModule.writeString(var3115, var3116, self.cta_button_text)
		buff = var3115
		var3114 = var3116
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3117, var3118 = protoModule.writeTag(buff, var3114, 2, protoModule.wireTypes.lengthDelimited)
		var3117, var4533 = protoModule.writeString(var3117, var3118, self.cta_type)
		buff = var3117
		var3114 = var3118
	end
	local buff_1 = buffer.create(var3114)
	buffer.copy(buff_1, 0, buff, 0, var3114)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref)
	local var3114 = t_115.new()
	local var3115 = 0
	while var3115 < buffer.len(p115) do
		local _ = nil
		local var3116 = nil
		local var3117, var3118, var3119 = protoModule.readTag(p115, var3115)
		local var3120 = var3117
		var3116 = var3118
		var3115 = var3119
		
		if var3116 == protoModule.wireTypes.varint then
			local _ = nil
			local var3121, var3122 = protoModule.readVarInt(p115, var3115)
			local _ = var3121
			var3115 = var3122
			continue
		end
		if var3116 == protoModule.wireTypes.lengthDelimited then
			if var3120 == 1 then
				local _ = nil
				local var3123, var3124 = protoModule.readBuffer(p115, var3115)
				var3115 = var3124
				var3114.cta_button_text = buffer.tostring(var3123)
			elseif var3120 == 2 then
				local _ = nil
				local var3125, var3126 = protoModule.readBuffer(p115, var3115)
				var3115 = var3126
				var3114.cta_type = buffer.tostring(var3125)
			else
				local _ = nil
				local var3127, var3128 = protoModule.readVarInt(p115, var3115)
				var3115 = var3128 + var3127
			end
		elseif var3116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3129, var3130 = protoModule.readFixed32(p115, var3115)
			local _ = var3129
			var3115 = var3130
		elseif var3116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3131, var3132 = protoModule.readFixed64(p115, var3115)
			local _ = var3131
			var3115 = var3132
		else
			error("Unsupported wire type: " .. var4537)
		end
	end
	return var3114
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
	local var3133 = t_115.new()
	
	if self.cta_button_text ~= nil then
		var3133.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3133.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3133.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3133.cta_type = self.ctaType
	end
	return var3133
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
	local var3133 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3134, var3135 = protoModule.writeTag(buff, var3133, 1, protoModule.wireTypes.lengthDelimited)
		var3134, var4559 = protoModule.writeString(var3134, var3135, self.title)
		buff = var3134
		var3133 = var3135
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3136, var3137 = protoModule.writeTag(buff, var3133, 2, protoModule.wireTypes.lengthDelimited)
		var3136, var4561 = protoModule.writeString(var3136, var3137, self.cta_button_text)
		buff = var3136
		var3133 = var3137
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3138, var3139 = protoModule.writeTag(buff, var3133, 3, protoModule.wireTypes.lengthDelimited)
		var3138, var4563 = protoModule.writeString(var3138, var3139, self.image_asset_id)
		buff = var3138
		var3133 = var3139
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3140, var3141 = protoModule.writeTag(buff, var3133, 4, protoModule.wireTypes.lengthDelimited)
		var3140, var4565 = protoModule.writeString(var3140, var3141, self.cta_type)
		buff = var3140
		var3133 = var3141
	end
	local buff_1 = buffer.create(var3133)
	buffer.copy(buff_1, 0, buff, 0, var3133)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3133 = t_116.new()
	local var3134 = 0
	while var3134 < buffer.len(p116) do
		local _ = nil
		local var3135 = nil
		local var3136, var3137, var3138 = protoModule.readTag(p116, var3134)
		local var3139 = var3136
		var3135 = var3137
		var3134 = var3138
		
		if var3135 == protoModule.wireTypes.varint then
			local _ = nil
			local var3140, var3141 = protoModule.readVarInt(p116, var3134)
			local _ = var3140
			var3134 = var3141
			continue
		end
		if var3135 == protoModule.wireTypes.lengthDelimited then
			if var3139 == 1 then
				local _ = nil
				local var3142, var3143 = protoModule.readBuffer(p116, var3134)
				var3134 = var3143
				var3133.title = buffer.tostring(var3142)
			elseif var3139 == 2 then
				local _ = nil
				local var3144, var3145 = protoModule.readBuffer(p116, var3134)
				var3134 = var3145
				var3133.cta_button_text = buffer.tostring(var3144)
			elseif var3139 == 3 then
				local _ = nil
				local var3146, var3147 = protoModule.readBuffer(p116, var3134)
				var3134 = var3147
				var3133.image_asset_id = buffer.tostring(var3146)
			elseif var3139 == 4 then
				local _ = nil
				local var3148, var3149 = protoModule.readBuffer(p116, var3134)
				var3134 = var3149
				var3133.cta_type = buffer.tostring(var3148)
			else
				local _ = nil
				local var3150, var3151 = protoModule.readVarInt(p116, var3134)
				var3134 = var3151 + var3150
			end
		elseif var3135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3152, var3153 = protoModule.readFixed32(p116, var3134)
			local _ = var3152
			var3134 = var3153
		elseif var3135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3154, var3155 = protoModule.readFixed64(p116, var3134)
			local _ = var3154
			var3134 = var3155
		else
			error("Unsupported wire type: " .. var4569)
		end
	end
	return var3133
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
	local var3156 = t_116.new()
	
	if self.title ~= nil then
		var3156.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3156.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3156.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3156.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3156.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3156.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3156.cta_type = self.ctaType
	end
	return var3156
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
	local var3156 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3157, var3158 = protoModule.writeTag(buff, var3156, 1, protoModule.wireTypes.lengthDelimited)
		var3157, var4595 = protoModule.writeString(var3157, var3158, self.title)
		buff = var3157
		var3156 = var3158
	end
	if self.url ~= nil then
		local var3159, var3160 = protoModule.writeTag(buff, var3156, 2, protoModule.wireTypes.lengthDelimited)
		var3159, var4597 = protoModule.writeString(var3159, var3160, self.url)
		buff = var3159
		var3156 = var3160
	end
	if self.destination ~= nil then
		local var3161, var3162 = protoModule.writeTag(buff, var3156, 3, protoModule.wireTypes.lengthDelimited)
		var3161, var4599 = protoModule.writeString(var3161, var3162, self.destination)
		buff = var3161
		var3156 = var3162
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local var3163, var3164 = protoModule.writeTag(buff, var3156, 4, protoModule.wireTypes.lengthDelimited)
		var3163, var4601 = protoModule.writeString(var3163, var3164, self.row_id)
		buff = var3163
		var3156 = var3164
	end
	local buff_1 = buffer.create(var3156)
	buffer.copy(buff_1, 0, buff, 0, var3156)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var3156 = t_117.new()
	local var3157 = 0
	while var3157 < buffer.len(p117) do
		local _ = nil
		local var3158 = nil
		local var3159, var3160, var3161 = protoModule.readTag(p117, var3157)
		local var3162 = var3159
		var3158 = var3160
		var3157 = var3161
		
		if var3158 == protoModule.wireTypes.varint then
			local _ = nil
			local var3163, var3164 = protoModule.readVarInt(p117, var3157)
			local _ = var3163
			var3157 = var3164
			continue
		end
		if var3158 == protoModule.wireTypes.lengthDelimited then
			if var3162 == 1 then
				local _ = nil
				local var3165, var3166 = protoModule.readBuffer(p117, var3157)
				var3157 = var3166
				var3156.title = buffer.tostring(var3165)
			elseif var3162 == 2 then
				local _ = nil
				local var3167, var3168 = protoModule.readBuffer(p117, var3157)
				var3157 = var3168
				var3156.url = buffer.tostring(var3167)
			elseif var3162 == 3 then
				local _ = nil
				local var3169, var3170 = protoModule.readBuffer(p117, var3157)
				var3157 = var3170
				var3156.destination = buffer.tostring(var3169)
			elseif var3162 == 4 then
				local _ = nil
				local var3171, var3172 = protoModule.readBuffer(p117, var3157)
				var3157 = var3172
				var3156.row_id = buffer.tostring(var3171)
			else
				local _ = nil
				local var3173, var3174 = protoModule.readVarInt(p117, var3157)
				var3157 = var3174 + var3173
			end
		elseif var3158 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3175, var3176 = protoModule.readFixed32(p117, var3157)
			local _ = var3175
			var3157 = var3176
		elseif var3158 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3177, var3178 = protoModule.readFixed64(p117, var3157)
			local _ = var3177
			var3157 = var3178
		else
			error("Unsupported wire type: " .. var4605)
		end
	end
	return var3156
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
	local var3179 = t_117.new()
	
	if self.title ~= nil then
		var3179.title = self.title
	end
	if self.url ~= nil then
		var3179.url = self.url
	end
	if self.destination ~= nil then
		var3179.destination = self.destination
	end
	if self.row_id ~= nil then
		var3179.row_id = self.row_id
	end
	if self.rowId ~= nil then
		var3179.row_id = self.rowId
	end
	return var3179
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
		setting_key = if p118 == nil or p118.setting_key == nil then "" else p118.setting_key,
		label = if p118 == nil or p118.label == nil then "" else p118.label,
		description = if p118 == nil or p118.description == nil then "" else p118.description,
		is_checked = if p118 == nil or p118.is_checked == nil then false else p118.is_checked,
		is_disabled = if p118 == nil or p118.is_disabled == nil then false else p118.is_disabled,
		audit_data = if p118 == nil or p118.audit_data == nil then "" else p118.audit_data
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3179 = 0
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		local var3180, var3181 = protoModule.writeTag(buff, var3179, 1, protoModule.wireTypes.lengthDelimited)
		var3180, var4631 = protoModule.writeString(var3180, var3181, self.setting_key)
		buff = var3180
		var3179 = var3181
	end
	if self.label ~= nil and self.label ~= "" then
		local var3182, var3183 = protoModule.writeTag(buff, var3179, 2, protoModule.wireTypes.lengthDelimited)
		var3182, var4633 = protoModule.writeString(var3182, var3183, self.label)
		buff = var3182
		var3179 = var3183
	end
	if self.description ~= nil and self.description ~= "" then
		local var3184, var3185 = protoModule.writeTag(buff, var3179, 3, protoModule.wireTypes.lengthDelimited)
		var3184, var4635 = protoModule.writeString(var3184, var3185, self.description)
		buff = var3184
		var3179 = var3185
	end
	if self.is_checked then
		local var3186, var3187 = protoModule.writeTag(buff, var3179, 4, protoModule.wireTypes.varint)
		var3186, var4637 = protoModule.writeVarInt(var3186, var3187, if self.is_checked then 1 else 0)
		buff = var3186
		var3179 = var3187
	end
	if self.is_disabled then
		local var3188, var3189 = protoModule.writeTag(buff, var3179, 5, protoModule.wireTypes.varint)
		var3188, var4639 = protoModule.writeVarInt(var3188, var3189, if self.is_disabled then 1 else 0)
		buff = var3188
		var3179 = var3189
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var3190, var3191 = protoModule.writeTag(buff, var3179, 6, protoModule.wireTypes.lengthDelimited)
		var3190, var4641 = protoModule.writeString(var3190, var3191, self.audit_data)
		buff = var3190
		var3179 = var3191
	end
	local buff_1 = buffer.create(var3179)
	buffer.copy(buff_1, 0, buff, 0, var3179)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref)
	local var3179 = t_118.new()
	local var3180 = 0
	while var3180 < buffer.len(p118) do
		local _ = nil
		local var3181 = nil
		local var3182, var3183, var3184 = protoModule.readTag(p118, var3180)
		local var3185 = var3182
		var3181 = var3183
		var3180 = var3184
		
		if var3181 == protoModule.wireTypes.varint then
			if var3185 == 4 then
				local _ = nil
				local var3186, var3187 = protoModule.readVarInt(p118, var3180)
				var3180 = var3187
				var3179.is_checked = var3186 ~= 0
			elseif var3185 == 5 then
				local _ = nil
				local var3188, var3189 = protoModule.readVarInt(p118, var3180)
				var3180 = var3189
				var3179.is_disabled = var3188 ~= 0
			else
				local _ = nil
				local var3190, var3191 = protoModule.readVarInt(p118, var3180)
				local _ = var3190
				var3180 = var3191
			end
		end
		if var3181 == protoModule.wireTypes.lengthDelimited then
			if var3185 == 1 then
				local _ = nil
				local var3192, var3193 = protoModule.readBuffer(p118, var3180)
				var3180 = var3193
				var3179.setting_key = buffer.tostring(var3192)
			elseif var3185 == 2 then
				local _ = nil
				local var3194, var3195 = protoModule.readBuffer(p118, var3180)
				var3180 = var3195
				var3179.label = buffer.tostring(var3194)
			elseif var3185 == 3 then
				local _ = nil
				local var3196, var3197 = protoModule.readBuffer(p118, var3180)
				var3180 = var3197
				var3179.description = buffer.tostring(var3196)
			elseif var3185 == 6 then
				local _ = nil
				local var3198, var3199 = protoModule.readBuffer(p118, var3180)
				var3180 = var3199
				var3179.audit_data = buffer.tostring(var3198)
			else
				local _ = nil
				local var3200, var3201 = protoModule.readVarInt(p118, var3180)
				var3180 = var3201 + var3200
			end
		elseif var3181 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3202, var3203 = protoModule.readFixed32(p118, var3180)
			local _ = var3202
			var3180 = var3203
		elseif var3181 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3204, var3205 = protoModule.readFixed64(p118, var3180)
			local _ = var3204
			var3180 = var3205
		else
			error("Unsupported wire type: " .. var4645)
		end
	end
	return var3179
end

function t_118:jsonEncode()
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

function t_118:jsonDecode()
	-- upvalues: t_118 (ref)
	local var3206 = t_118.new()
	
	if self.setting_key ~= nil then
		var3206.setting_key = self.setting_key
	end
	if self.settingKey ~= nil then
		var3206.setting_key = self.settingKey
	end
	if self.label ~= nil then
		var3206.label = self.label
	end
	if self.description ~= nil then
		var3206.description = self.description
	end
	if self.is_checked ~= nil then
		var3206.is_checked = self.is_checked
	end
	if self.isChecked ~= nil then
		var3206.is_checked = self.isChecked
	end
	if self.is_disabled ~= nil then
		var3206.is_disabled = self.is_disabled
	end
	if self.isDisabled ~= nil then
		var3206.is_disabled = self.isDisabled
	end
	if self.audit_data ~= nil then
		var3206.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var3206.audit_data = self.auditData
	end
	return var3206
end

t_118.descriptor = {
	name = "SettingsToggleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsToggleInputData"
}
t.SettingsToggleInputData = t_118
typeRegistryModule.default:register(t.SettingsToggleInputData)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p119)
	-- upvalues: t_119 (ref)
	return setmetatable({
		universe_id = if p119 == nil or p119.universe_id == nil then nil else p119.universe_id,
		title = if p119 == nil or p119.title == nil then nil else p119.title,
		subtitle = if p119 == nil or p119.subtitle == nil then nil else p119.subtitle,
		badge_text = if p119 == nil or p119.badge_text == nil then nil else p119.badge_text,
		foreground = if p119 == nil or p119.foreground == nil then nil else p119.foreground,
		background = if p119 == nil or p119.background == nil then nil else p119.background,
		title_image = if p119 == nil or p119.title_image == nil then nil else p119.title_image,
		asset_title = if p119 == nil or p119.asset_title == nil then nil else p119.asset_title,
		asset_subtitle = if p119 == nil or p119.asset_subtitle == nil then nil else p119.asset_subtitle,
		gradient = if p119 == nil or p119.gradient == nil then nil else p119.gradient,
		playable_text = if p119 == nil or p119.playable_text == nil then nil else p119.playable_text,
		collection_id = if p119 == nil or p119.collection_id == nil then nil else p119.collection_id,
		campaign_id = if p119 == nil or p119.campaign_id == nil then nil else p119.campaign_id,
		cohort_id = if p119 == nil or p119.cohort_id == nil then nil else p119.cohort_id,
		sort_id = if p119 == nil or p119.sort_id == nil then nil else p119.sort_id,
		hero_unit_id = if p119 == nil or p119.hero_unit_id == nil then nil else p119.hero_unit_id,
		analytics_id = if p119 == nil or p119.analytics_id == nil then nil else p119.analytics_id,
		is_sponsored = if p119 == nil or p119.is_sponsored == nil then nil else p119.is_sponsored
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3206 = 0
	
	if self.universe_id ~= nil then
		local var3207, var3208 = protoModule.writeTag(buff, var3206, 1, protoModule.wireTypes.lengthDelimited)
		var3207, var4675 = protoModule.writeString(var3207, var3208, self.universe_id)
		buff = var3207
		var3206 = var3208
	end
	if self.title ~= nil then
		local var3209, var3210 = protoModule.writeTag(buff, var3206, 2, protoModule.wireTypes.lengthDelimited)
		var3209, var4677 = protoModule.writeString(var3209, var3210, self.title)
		buff = var3209
		var3206 = var3210
	end
	if self.subtitle ~= nil then
		local var3211, var3212 = protoModule.writeTag(buff, var3206, 3, protoModule.wireTypes.lengthDelimited)
		var3211, var4679 = protoModule.writeString(var3211, var3212, self.subtitle)
		buff = var3211
		var3206 = var3212
	end
	if self.badge_text ~= nil then
		local var3213, var3214 = protoModule.writeTag(buff, var3206, 4, protoModule.wireTypes.lengthDelimited)
		var3213, var4681 = protoModule.writeString(var3213, var3214, self.badge_text)
		buff = var3213
		var3206 = var3214
	end
	if self.foreground ~= nil then
		local var3215 = self.foreground:encode()
		local var3216, var3217 = protoModule.writeTag(buff, var3206, 5, protoModule.wireTypes.lengthDelimited)
		var3216, var4684 = protoModule.writeBuffer(var3216, var3217, var3215, buffer.len(var3215))
		buff = var3216
		var3206 = var3217
	end
	if self.background ~= nil then
		local var3218 = self.background:encode()
		local var3219, var3220 = protoModule.writeTag(buff, var3206, 6, protoModule.wireTypes.lengthDelimited)
		var3219, var4687 = protoModule.writeBuffer(var3219, var3220, var3218, buffer.len(var3218))
		buff = var3219
		var3206 = var3220
	end
	if self.title_image ~= nil then
		local var3221 = self.title_image:encode()
		local var3222, var3223 = protoModule.writeTag(buff, var3206, 7, protoModule.wireTypes.lengthDelimited)
		var3222, var4690 = protoModule.writeBuffer(var3222, var3223, var3221, buffer.len(var3221))
		buff = var3222
		var3206 = var3223
	end
	if self.asset_title ~= nil then
		local var3224, var3225 = protoModule.writeTag(buff, var3206, 8, protoModule.wireTypes.lengthDelimited)
		var3224, var4692 = protoModule.writeString(var3224, var3225, self.asset_title)
		buff = var3224
		var3206 = var3225
	end
	if self.asset_subtitle ~= nil then
		local var3226, var3227 = protoModule.writeTag(buff, var3206, 9, protoModule.wireTypes.lengthDelimited)
		var3226, var4694 = protoModule.writeString(var3226, var3227, self.asset_subtitle)
		buff = var3226
		var3206 = var3227
	end
	if self.gradient ~= nil then
		local var3228 = self.gradient:encode()
		local var3229, var3230 = protoModule.writeTag(buff, var3206, 10, protoModule.wireTypes.lengthDelimited)
		var3229, var4697 = protoModule.writeBuffer(var3229, var3230, var3228, buffer.len(var3228))
		buff = var3229
		var3206 = var3230
	end
	if self.playable_text ~= nil then
		local var3231, var3232 = protoModule.writeTag(buff, var3206, 11, protoModule.wireTypes.lengthDelimited)
		var3231, var4699 = protoModule.writeString(var3231, var3232, self.playable_text)
		buff = var3231
		var3206 = var3232
	end
	if self.collection_id ~= nil then
		local var3233, var3234 = protoModule.writeTag(buff, var3206, 12, protoModule.wireTypes.lengthDelimited)
		var3233, var4701 = protoModule.writeString(var3233, var3234, self.collection_id)
		buff = var3233
		var3206 = var3234
	end
	if self.campaign_id ~= nil then
		local var3235, var3236 = protoModule.writeTag(buff, var3206, 13, protoModule.wireTypes.lengthDelimited)
		var3235, var4703 = protoModule.writeString(var3235, var3236, self.campaign_id)
		buff = var3235
		var3206 = var3236
	end
	if self.cohort_id ~= nil then
		local var3237, var3238 = protoModule.writeTag(buff, var3206, 14, protoModule.wireTypes.lengthDelimited)
		var3237, var4705 = protoModule.writeString(var3237, var3238, self.cohort_id)
		buff = var3237
		var3206 = var3238
	end
	if self.sort_id ~= nil then
		local var3239, var3240 = protoModule.writeTag(buff, var3206, 15, protoModule.wireTypes.lengthDelimited)
		var3239, var4707 = protoModule.writeString(var3239, var3240, self.sort_id)
		buff = var3239
		var3206 = var3240
	end
	if self.hero_unit_id ~= nil then
		local var3241, var3242 = protoModule.writeTag(buff, var3206, 16, protoModule.wireTypes.lengthDelimited)
		var3241, var4709 = protoModule.writeString(var3241, var3242, self.hero_unit_id)
		buff = var3241
		var3206 = var3242
	end
	if self.analytics_id ~= nil then
		local var3243, var3244 = protoModule.writeTag(buff, var3206, 17, protoModule.wireTypes.lengthDelimited)
		var3243, var4711 = protoModule.writeString(var3243, var3244, self.analytics_id)
		buff = var3243
		var3206 = var3244
	end
	if self.is_sponsored ~= nil then
		local var3245, var3246 = protoModule.writeTag(buff, var3206, 18, protoModule.wireTypes.varint)
		var3245, var4713 = protoModule.writeVarInt(var3245, var3246, if self.is_sponsored then 1 else 0)
		buff = var3245
		var3206 = var3246
	end
	local buff_1 = buffer.create(var3206)
	buffer.copy(buff_1, 0, buff, 0, var3206)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var3206 = t_119.new()
	local var3207 = 0
	while var3207 < buffer.len(p119) do
		local _ = nil
		local var3208 = nil
		local var3209, var3210, var3211 = protoModule.readTag(p119, var3207)
		local var3212 = var3209
		var3208 = var3210
		var3207 = var3211
		
		if var3208 == protoModule.wireTypes.varint then
			if var3212 == 18 then
				local _ = nil
				local var3213, var3214 = protoModule.readVarInt(p119, var3207)
				var3207 = var3214
				var3206.is_sponsored = var3213 ~= 0
			else
				local _ = nil
				local var3215, var3216 = protoModule.readVarInt(p119, var3207)
				local _ = var3215
				var3207 = var3216
			end
		end
		if var3208 == protoModule.wireTypes.lengthDelimited then
			if var3212 == 1 then
				local _ = nil
				local var3217, var3218 = protoModule.readBuffer(p119, var3207)
				var3207 = var3218
				var3206.universe_id = buffer.tostring(var3217)
			elseif var3212 == 2 then
				local _ = nil
				local var3219, var3220 = protoModule.readBuffer(p119, var3207)
				var3207 = var3220
				var3206.title = buffer.tostring(var3219)
			elseif var3212 == 3 then
				local _ = nil
				local var3221, var3222 = protoModule.readBuffer(p119, var3207)
				var3207 = var3222
				var3206.subtitle = buffer.tostring(var3221)
			elseif var3212 == 4 then
				local _ = nil
				local var3223, var3224 = protoModule.readBuffer(p119, var3207)
				var3207 = var3224
				var3206.badge_text = buffer.tostring(var3223)
			elseif var3212 == 5 then
				local _ = nil
				local var3225, var3226 = protoModule.readBuffer(p119, var3207)
				var3207 = var3226
				var3206.foreground = t.HeroUnitInputData_VisualAsset.decode(var3225)
			elseif var3212 == 6 then
				local _ = nil
				local var3227, var3228 = protoModule.readBuffer(p119, var3207)
				var3207 = var3228
				var3206.background = t.HeroUnitInputData_VisualAsset.decode(var3227)
			elseif var3212 == 7 then
				local _ = nil
				local var3229, var3230 = protoModule.readBuffer(p119, var3207)
				var3207 = var3230
				var3206.title_image = t.HeroUnitInputData_VisualAsset.decode(var3229)
			elseif var3212 == 8 then
				local _ = nil
				local var3231, var3232 = protoModule.readBuffer(p119, var3207)
				var3207 = var3232
				var3206.asset_title = buffer.tostring(var3231)
			elseif var3212 == 9 then
				local _ = nil
				local var3233, var3234 = protoModule.readBuffer(p119, var3207)
				var3207 = var3234
				var3206.asset_subtitle = buffer.tostring(var3233)
			elseif var3212 == 10 then
				local _ = nil
				local var3235, var3236 = protoModule.readBuffer(p119, var3207)
				var3207 = var3236
				var3206.gradient = t.HeroUnitInputData_Gradient.decode(var3235)
			elseif var3212 == 11 then
				local _ = nil
				local var3237, var3238 = protoModule.readBuffer(p119, var3207)
				var3207 = var3238
				var3206.playable_text = buffer.tostring(var3237)
			elseif var3212 == 12 then
				local _ = nil
				local var3239, var3240 = protoModule.readBuffer(p119, var3207)
				var3207 = var3240
				var3206.collection_id = buffer.tostring(var3239)
			elseif var3212 == 13 then
				local _ = nil
				local var3241, var3242 = protoModule.readBuffer(p119, var3207)
				var3207 = var3242
				var3206.campaign_id = buffer.tostring(var3241)
			elseif var3212 == 14 then
				local _ = nil
				local var3243, var3244 = protoModule.readBuffer(p119, var3207)
				var3207 = var3244
				var3206.cohort_id = buffer.tostring(var3243)
			elseif var3212 == 15 then
				local _ = nil
				local var3245, var3246 = protoModule.readBuffer(p119, var3207)
				var3207 = var3246
				var3206.sort_id = buffer.tostring(var3245)
			elseif var3212 == 16 then
				local _ = nil
				local var3247, var3248 = protoModule.readBuffer(p119, var3207)
				var3207 = var3248
				var3206.hero_unit_id = buffer.tostring(var3247)
			elseif var3212 == 17 then
				local _ = nil
				local var3249, var3250 = protoModule.readBuffer(p119, var3207)
				var3207 = var3250
				var3206.analytics_id = buffer.tostring(var3249)
			else
				local _ = nil
				local var3251, var3252 = protoModule.readVarInt(p119, var3207)
				var3207 = var3252 + var3251
			end
		elseif var3208 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3253, var3254 = protoModule.readFixed32(p119, var3207)
			local _ = var3253
			var3207 = var3254
		elseif var3208 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3255, var3256 = protoModule.readFixed64(p119, var3207)
			local _ = var3255
			var3207 = var3256
		else
			error("Unsupported wire type: " .. var4717)
		end
	end
	return var3206
end

function t_119:jsonEncode()
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

function t_119:jsonDecode()
	-- upvalues: t_119 (ref), t (ref)
	local var3257 = t_119.new()
	
	if self.universe_id ~= nil then
		var3257.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3257.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3257.title = self.title
	end
	if self.subtitle ~= nil then
		var3257.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3257.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3257.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3257.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3257.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3257.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3257.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3257.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3257.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3257.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3257.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3257.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3257.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3257.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3257.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3257.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3257.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3257.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3257.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3257.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3257.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3257.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3257.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3257.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3257.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3257.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3257.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3257.is_sponsored = self.isSponsored
	end
	return var3257
end

t_119.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_119
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		asset_id = if p120 == nil or p120.asset_id == nil then "" else p120.asset_id,
		aspect_ratio = if p120 == nil or p120.aspect_ratio == nil then nil else p120.aspect_ratio,
		enable_animation = if p120 == nil or p120.enable_animation == nil then nil else p120.enable_animation
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3257 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3258, var3259 = protoModule.writeTag(buff, var3257, 1, protoModule.wireTypes.lengthDelimited)
		var3258, var4771 = protoModule.writeString(var3258, var3259, self.asset_id)
		buff = var3258
		var3257 = var3259
	end
	if self.aspect_ratio ~= nil then
		local var3260, var3261 = protoModule.writeTag(buff, var3257, 2, protoModule.wireTypes.i64)
		var3260, var4773 = protoModule.writeDouble(var3260, var3261, self.aspect_ratio)
		buff = var3260
		var3257 = var3261
	end
	if self.enable_animation ~= nil then
		local var3262, var3263 = protoModule.writeTag(buff, var3257, 3, protoModule.wireTypes.varint)
		var3262, var4775 = protoModule.writeVarInt(var3262, var3263, if self.enable_animation then 1 else 0)
		buff = var3262
		var3257 = var3263
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
			if var3263 == 3 then
				local _ = nil
				local var3264, var3265 = protoModule.readVarInt(p120, var3258)
				var3258 = var3265
				var3257.enable_animation = var3264 ~= 0
			else
				local _ = nil
				local var3266, var3267 = protoModule.readVarInt(p120, var3258)
				local _ = var3266
				var3258 = var3267
			end
		end
		if var3259 == protoModule.wireTypes.lengthDelimited then
			if var3263 == 1 then
				local _ = nil
				local var3268, var3269 = protoModule.readBuffer(p120, var3258)
				var3258 = var3269
				var3257.asset_id = buffer.tostring(var3268)
			else
				local _ = nil
				local var3270, var3271 = protoModule.readVarInt(p120, var3258)
				var3258 = var3271 + var3270
			end
		elseif var3259 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3272, var3273 = protoModule.readFixed32(p120, var3258)
			local _ = var3272
			var3258 = var3273
		elseif var3259 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4779)
		elseif var3263 == 2 then
			local _ = nil
			local var3274, var3275 = protoModule.readDouble(p120, var3258)
			var3258 = var3275
			var3257.aspect_ratio = var3274
		else
			local _ = nil
			local var3276, var3277 = protoModule.readFixed64(p120, var3258)
			local _ = var3276
			var3258 = var3277
		end
	end
	return var3257
end

function t_120:jsonEncode()
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

function t_120:jsonDecode()
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3278 = t_120.new()
	
	if self.asset_id ~= nil then
		var3278.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3278.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3278.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3278.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3278.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3278.enable_animation = self.enableAnimation
	end
	return var3278
end

t_120.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_120
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p121)
	-- upvalues: t_121 (ref)
	return setmetatable({
		start_color = if p121 == nil or p121.start_color == nil then nil else p121.start_color,
		end_color = if p121 == nil or p121.end_color == nil then nil else p121.end_color,
		start_opacity = if p121 == nil or p121.start_opacity == nil then nil else p121.start_opacity,
		end_opacity = if p121 == nil or p121.end_opacity == nil then nil else p121.end_opacity,
		degree = if p121 == nil or p121.degree == nil then nil else p121.degree
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3278 = 0
	
	if self.start_color ~= nil then
		local var3279, var3280 = protoModule.writeTag(buff, var3278, 1, protoModule.wireTypes.lengthDelimited)
		var3279, var4803 = protoModule.writeString(var3279, var3280, self.start_color)
		buff = var3279
		var3278 = var3280
	end
	if self.end_color ~= nil then
		local var3281, var3282 = protoModule.writeTag(buff, var3278, 2, protoModule.wireTypes.lengthDelimited)
		var3281, var4805 = protoModule.writeString(var3281, var3282, self.end_color)
		buff = var3281
		var3278 = var3282
	end
	if self.start_opacity ~= nil then
		local var3283, var3284 = protoModule.writeTag(buff, var3278, 3, protoModule.wireTypes.i64)
		var3283, var4807 = protoModule.writeDouble(var3283, var3284, self.start_opacity)
		buff = var3283
		var3278 = var3284
	end
	if self.end_opacity ~= nil then
		local var3285, var3286 = protoModule.writeTag(buff, var3278, 4, protoModule.wireTypes.i64)
		var3285, var4809 = protoModule.writeDouble(var3285, var3286, self.end_opacity)
		buff = var3285
		var3278 = var3286
	end
	if self.degree ~= nil then
		local var3287, var3288 = protoModule.writeTag(buff, var3278, 5, protoModule.wireTypes.i64)
		var3287, var4811 = protoModule.writeDouble(var3287, var3288, self.degree)
		buff = var3287
		var3278 = var3288
	end
	local buff_1 = buffer.create(var3278)
	buffer.copy(buff_1, 0, buff, 0, var3278)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref)
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
				var3278.start_color = buffer.tostring(var3287)
			elseif var3284 == 2 then
				local _ = nil
				local var3289, var3290 = protoModule.readBuffer(p121, var3279)
				var3279 = var3290
				var3278.end_color = buffer.tostring(var3289)
			else
				local _ = nil
				local var3291, var3292 = protoModule.readVarInt(p121, var3279)
				var3279 = var3292 + var3291
			end
		elseif var3280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3293, var3294 = protoModule.readFixed32(p121, var3279)
			local _ = var3293
			var3279 = var3294
		elseif var3280 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4815)
		elseif var3284 == 3 then
			local _ = nil
			local var3295, var3296 = protoModule.readDouble(p121, var3279)
			var3279 = var3296
			var3278.start_opacity = var3295
		elseif var3284 == 4 then
			local _ = nil
			local var3297, var3298 = protoModule.readDouble(p121, var3279)
			var3279 = var3298
			var3278.end_opacity = var3297
		elseif var3284 == 5 then
			local _ = nil
			local var3299, var3300 = protoModule.readDouble(p121, var3279)
			var3279 = var3300
			var3278.degree = var3299
		else
			local _ = nil
			local var3301, var3302 = protoModule.readFixed64(p121, var3279)
			local _ = var3301
			var3279 = var3302
		end
	end
	return var3278
end

function t_121:jsonEncode()
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

function t_121:jsonDecode()
	-- upvalues: t_121 (ref), protoModule (ref)
	local var3303 = t_121.new()
	
	if self.start_color ~= nil then
		var3303.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3303.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3303.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3303.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3303.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3303.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3303.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3303.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3303.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3303
end

t_121.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_121
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p122)
	-- upvalues: t_122 (ref)
	return setmetatable({
		items = if p122 == nil or p122.items == nil then {} else p122.items,
		sort_id = if p122 == nil or p122.sort_id == nil then "" else p122.sort_id,
		recommendation_request_id = if p122 == nil or p122.recommendation_request_id == nil then "" else p122.recommendation_request_id
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3303 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3304 = v:encode()
			local var3305, var3306 = protoModule.writeTag(buff, var3303, 1, protoModule.wireTypes.lengthDelimited)
			var3305, var4844 = protoModule.writeBuffer(var3305, var3306, var3304, buffer.len(var3304))
			buff = var3305
			var3303 = var3306
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3307, var3308 = protoModule.writeTag(buff, var3303, 2, protoModule.wireTypes.lengthDelimited)
		var3307, var4846 = protoModule.writeString(var3307, var3308, self.sort_id)
		buff = var3307
		var3303 = var3308
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3309, var3310 = protoModule.writeTag(buff, var3303, 3, protoModule.wireTypes.lengthDelimited)
		var3309, var4848 = protoModule.writeString(var3309, var3310, self.recommendation_request_id)
		buff = var3309
		var3303 = var3310
	end
	local buff_1 = buffer.create(var3303)
	buffer.copy(buff_1, 0, buff, 0, var3303)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3311 = t_122.new()
	local var3312 = 0
	while var3312 < buffer.len(p122) do
		local _ = nil
		local var3313 = nil
		local var3314, var3315, var3316 = protoModule.readTag(p122, var3312)
		local var3317 = var3314
		var3313 = var3315
		var3312 = var3316
		
		if var3313 == protoModule.wireTypes.varint then
			local _ = nil
			local var3318, var3319 = protoModule.readVarInt(p122, var3312)
			local _ = var3318
			var3312 = var3319
			continue
		end
		if var3313 == protoModule.wireTypes.lengthDelimited then
			if var3317 == 1 then
				local _ = nil
				local var3320, var3321 = protoModule.readBuffer(p122, var3312)
				var3312 = var3321
				table.insert(var3311.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3320))
			elseif var3317 == 2 then
				local _ = nil
				local var3322, var3323 = protoModule.readBuffer(p122, var3312)
				var3312 = var3323
				var3311.sort_id = buffer.tostring(var3322)
			elseif var3317 == 3 then
				local _ = nil
				local var3324, var3325 = protoModule.readBuffer(p122, var3312)
				var3312 = var3325
				var3311.recommendation_request_id = buffer.tostring(var3324)
			else
				local _ = nil
				local var3326, var3327 = protoModule.readVarInt(p122, var3312)
				var3312 = var3327 + var3326
			end
		elseif var3313 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3328, var3329 = protoModule.readFixed32(p122, var3312)
			local _ = var3328
			var3312 = var3329
		elseif var3313 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3330, var3331 = protoModule.readFixed64(p122, var3312)
			local _ = var3330
			var3312 = var3331
		else
			error("Unsupported wire type: " .. var4852)
		end
	end
	return var3311
end

function t_122:jsonEncode()
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

function t_122:jsonDecode()
	-- upvalues: t_122 (ref), t (ref)
	local var3332 = t_122.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3332.items = t_1
	end
	if self.sort_id ~= nil then
		var3332.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3332.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3332.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3332.recommendation_request_id = self.recommendationRequestId
	end
	return var3332
end

t_122.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_122
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p123)
	-- upvalues: t_123 (ref)
	return setmetatable({
		item_id = if p123 == nil or p123.item_id == nil then "" else p123.item_id,
		has_pending_friend_request = if p123 == nil or p123.has_pending_friend_request == nil then false else p123.has_pending_friend_request
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3333 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3334, var3335 = protoModule.writeTag(buff, var3333, 1, protoModule.wireTypes.lengthDelimited)
		var3334, var4878 = protoModule.writeString(var3334, var3335, self.item_id)
		buff = var3334
		var3333 = var3335
	end
	if self.has_pending_friend_request then
		local var3336, var3337 = protoModule.writeTag(buff, var3333, 2, protoModule.wireTypes.varint)
		var3336, var4880 = protoModule.writeVarInt(var3336, var3337, if self.has_pending_friend_request then 1 else 0)
		buff = var3336
		var3333 = var3337
	end
	local buff_1 = buffer.create(var3333)
	buffer.copy(buff_1, 0, buff, 0, var3333)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3333 = t_123.new()
	local var3334 = 0
	while var3334 < buffer.len(p123) do
		local _ = nil
		local var3335 = nil
		local var3336, var3337, var3338 = protoModule.readTag(p123, var3334)
		local var3339 = var3336
		var3335 = var3337
		var3334 = var3338
		
		if var3335 == protoModule.wireTypes.varint then
			if var3339 == 2 then
				local _ = nil
				local var3340, var3341 = protoModule.readVarInt(p123, var3334)
				var3334 = var3341
				var3333.has_pending_friend_request = var3340 ~= 0
			else
				local _ = nil
				local var3342, var3343 = protoModule.readVarInt(p123, var3334)
				local _ = var3342
				var3334 = var3343
			end
		end
		if var3335 == protoModule.wireTypes.lengthDelimited then
			if var3339 == 1 then
				local _ = nil
				local var3344, var3345 = protoModule.readBuffer(p123, var3334)
				var3334 = var3345
				var3333.item_id = buffer.tostring(var3344)
			else
				local _ = nil
				local var3346, var3347 = protoModule.readVarInt(p123, var3334)
				var3334 = var3347 + var3346
			end
		elseif var3335 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3348, var3349 = protoModule.readFixed32(p123, var3334)
			local _ = var3348
			var3334 = var3349
		elseif var3335 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3350, var3351 = protoModule.readFixed64(p123, var3334)
			local _ = var3350
			var3334 = var3351
		else
			error("Unsupported wire type: " .. var4884)
		end
	end
	return var3333
end

function t_123:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function t_123:jsonDecode()
	-- upvalues: t_123 (ref)
	local var3352 = t_123.new()
	
	if self.item_id ~= nil then
		var3352.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3352.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3352.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3352.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3352
end

t_123.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_123
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p124)
	-- upvalues: t_124 (ref)
	return setmetatable({
		selected_option = if p124 == nil or p124.selected_option == nil then "" else p124.selected_option,
		sort_id = if p124 == nil or p124.sort_id == nil then "" else p124.sort_id,
		options = if p124 == nil or p124.options == nil then {} else p124.options,
		experience_carousel = if p124 == nil or p124.experience_carousel == nil then nil else p124.experience_carousel,
		feed_item_key = if p124 == nil or p124.feed_item_key == nil then "" else p124.feed_item_key
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3352 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3353, var3354 = protoModule.writeTag(buff, var3352, 1, protoModule.wireTypes.lengthDelimited)
		var3353, var4906 = protoModule.writeString(var3353, var3354, self.selected_option)
		buff = var3353
		var3352 = var3354
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3355, var3356 = protoModule.writeTag(buff, var3352, 2, protoModule.wireTypes.lengthDelimited)
		var3355, var4908 = protoModule.writeString(var3355, var3356, self.sort_id)
		buff = var3355
		var3352 = var3356
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3357 = v:encode()
			local var3358, var3359 = protoModule.writeTag(buff, var3352, 3, protoModule.wireTypes.lengthDelimited)
			var3358, var4911 = protoModule.writeBuffer(var3358, var3359, var3357, buffer.len(var3357))
			buff = var3358
			var3352 = var3359
		end
	end
	if self.experience_carousel ~= nil then
		local var3360 = self.experience_carousel:encode()
		local var3361, var3362 = protoModule.writeTag(buff, var3352, 4, protoModule.wireTypes.lengthDelimited)
		var3361, var4914 = protoModule.writeBuffer(var3361, var3362, var3360, buffer.len(var3360))
		buff = var3361
		var3352 = var3362
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3363, var3364 = protoModule.writeTag(buff, var3352, 5, protoModule.wireTypes.lengthDelimited)
		var3363, var4916 = protoModule.writeString(var3363, var3364, self.feed_item_key)
		buff = var3363
		var3352 = var3364
	end
	local buff_1 = buffer.create(var3352)
	buffer.copy(buff_1, 0, buff, 0, var3352)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var3365 = t_124.new()
	local var3366 = 0
	while var3366 < buffer.len(p124) do
		local _ = nil
		local var3367 = nil
		local var3368, var3369, var3370 = protoModule.readTag(p124, var3366)
		local var3371 = var3368
		var3367 = var3369
		var3366 = var3370
		
		if var3367 == protoModule.wireTypes.varint then
			local _ = nil
			local var3372, var3373 = protoModule.readVarInt(p124, var3366)
			local _ = var3372
			var3366 = var3373
			continue
		end
		if var3367 == protoModule.wireTypes.lengthDelimited then
			if var3371 == 1 then
				local _ = nil
				local var3374, var3375 = protoModule.readBuffer(p124, var3366)
				var3366 = var3375
				var3365.selected_option = buffer.tostring(var3374)
			elseif var3371 == 2 then
				local _ = nil
				local var3376, var3377 = protoModule.readBuffer(p124, var3366)
				var3366 = var3377
				var3365.sort_id = buffer.tostring(var3376)
			elseif var3371 == 3 then
				local _ = nil
				local var3378, var3379 = protoModule.readBuffer(p124, var3366)
				var3366 = var3379
				table.insert(var3365.options, t.SelectorOption.decode(var3378))
			elseif var3371 == 4 then
				local _ = nil
				local var3380, var3381 = protoModule.readBuffer(p124, var3366)
				var3366 = var3381
				var3365.experience_carousel = t.ExperienceCarouselInputData.decode(var3380)
			elseif var3371 == 5 then
				local _ = nil
				local var3382, var3383 = protoModule.readBuffer(p124, var3366)
				var3366 = var3383
				var3365.feed_item_key = buffer.tostring(var3382)
			else
				local _ = nil
				local var3384, var3385 = protoModule.readVarInt(p124, var3366)
				var3366 = var3385 + var3384
			end
		elseif var3367 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3386, var3387 = protoModule.readFixed32(p124, var3366)
			local _ = var3386
			var3366 = var3387
		elseif var3367 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3388, var3389 = protoModule.readFixed64(p124, var3366)
			local _ = var3388
			var3366 = var3389
		else
			error("Unsupported wire type: " .. var4920)
		end
	end
	return var3365
end

function t_124:jsonEncode()
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

function t_124:jsonDecode()
	-- upvalues: t_124 (ref), t (ref)
	local var3390 = t_124.new()
	
	if self.selected_option ~= nil then
		var3390.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3390.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3390.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3390.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3390.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3390.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3390.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3390.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3390.feed_item_key = self.feedItemKey
	end
	return var3390
end

t_124.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_124
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p125)
	-- upvalues: t_125 (ref)
	return setmetatable({
		id = if p125 == nil or p125.id == nil then "" else p125.id,
		display_name = if p125 == nil or p125.display_name == nil then "" else p125.display_name,
		is_selected = if p125 == nil or p125.is_selected == nil then false else p125.is_selected
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3391 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3392, var3393 = protoModule.writeTag(buff, var3391, 1, protoModule.wireTypes.lengthDelimited)
		var3392, var4950 = protoModule.writeString(var3392, var3393, self.id)
		buff = var3392
		var3391 = var3393
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3394, var3395 = protoModule.writeTag(buff, var3391, 2, protoModule.wireTypes.lengthDelimited)
		var3394, var4952 = protoModule.writeString(var3394, var3395, self.display_name)
		buff = var3394
		var3391 = var3395
	end
	if self.is_selected then
		local var3396, var3397 = protoModule.writeTag(buff, var3391, 3, protoModule.wireTypes.varint)
		var3396, var4954 = protoModule.writeVarInt(var3396, var3397, if self.is_selected then 1 else 0)
		buff = var3396
		var3391 = var3397
	end
	local buff_1 = buffer.create(var3391)
	buffer.copy(buff_1, 0, buff, 0, var3391)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref)
	local var3391 = t_125.new()
	local var3392 = 0
	while var3392 < buffer.len(p125) do
		local _ = nil
		local var3393 = nil
		local var3394, var3395, var3396 = protoModule.readTag(p125, var3392)
		local var3397 = var3394
		var3393 = var3395
		var3392 = var3396
		
		if var3393 == protoModule.wireTypes.varint then
			if var3397 == 3 then
				local _ = nil
				local var3398, var3399 = protoModule.readVarInt(p125, var3392)
				var3392 = var3399
				var3391.is_selected = var3398 ~= 0
			else
				local _ = nil
				local var3400, var3401 = protoModule.readVarInt(p125, var3392)
				local _ = var3400
				var3392 = var3401
			end
		end
		if var3393 == protoModule.wireTypes.lengthDelimited then
			if var3397 == 1 then
				local _ = nil
				local var3402, var3403 = protoModule.readBuffer(p125, var3392)
				var3392 = var3403
				var3391.id = buffer.tostring(var3402)
			elseif var3397 == 2 then
				local _ = nil
				local var3404, var3405 = protoModule.readBuffer(p125, var3392)
				var3392 = var3405
				var3391.display_name = buffer.tostring(var3404)
			else
				local _ = nil
				local var3406, var3407 = protoModule.readVarInt(p125, var3392)
				var3392 = var3407 + var3406
			end
		elseif var3393 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3408, var3409 = protoModule.readFixed32(p125, var3392)
			local _ = var3408
			var3392 = var3409
		elseif var3393 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3410, var3411 = protoModule.readFixed64(p125, var3392)
			local _ = var3410
			var3392 = var3411
		else
			error("Unsupported wire type: " .. var4958)
		end
	end
	return var3391
end

function t_125:jsonEncode()
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

function t_125:jsonDecode()
	-- upvalues: t_125 (ref)
	local var3412 = t_125.new()
	
	if self.id ~= nil then
		var3412.id = self.id
	end
	if self.display_name ~= nil then
		var3412.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3412.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3412.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3412.is_selected = self.isSelected
	end
	return var3412
end

t_125.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_125
typeRegistryModule.default:register(t.SelectorOption)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p126)
	-- upvalues: t_126 (ref)
	return setmetatable({
		cards = if p126 == nil or p126.cards == nil then {} else p126.cards,
		title = if p126 == nil or p126.title == nil then "" else p126.title,
		sort_id = if p126 == nil or p126.sort_id == nil then nil else p126.sort_id
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3412 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3413 = v:encode()
			local var3414, var3415 = protoModule.writeTag(buff, var3412, 1, protoModule.wireTypes.lengthDelimited)
			var3414, var4983 = protoModule.writeBuffer(var3414, var3415, var3413, buffer.len(var3413))
			buff = var3414
			var3412 = var3415
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3416, var3417 = protoModule.writeTag(buff, var3412, 2, protoModule.wireTypes.lengthDelimited)
		var3416, var4985 = protoModule.writeString(var3416, var3417, self.title)
		buff = var3416
		var3412 = var3417
	end
	if self.sort_id ~= nil then
		local var3418, var3419 = protoModule.writeTag(buff, var3412, 3, protoModule.wireTypes.lengthDelimited)
		var3418, var4987 = protoModule.writeString(var3418, var3419, self.sort_id)
		buff = var3418
		var3412 = var3419
	end
	local buff_1 = buffer.create(var3412)
	buffer.copy(buff_1, 0, buff, 0, var3412)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref), t (ref)
	local var3420 = t_126.new()
	local var3421 = 0
	while var3421 < buffer.len(p126) do
		local _ = nil
		local var3422 = nil
		local var3423, var3424, var3425 = protoModule.readTag(p126, var3421)
		local var3426 = var3423
		var3422 = var3424
		var3421 = var3425
		
		if var3422 == protoModule.wireTypes.varint then
			local _ = nil
			local var3427, var3428 = protoModule.readVarInt(p126, var3421)
			local _ = var3427
			var3421 = var3428
			continue
		end
		if var3422 == protoModule.wireTypes.lengthDelimited then
			if var3426 == 1 then
				local _ = nil
				local var3429, var3430 = protoModule.readBuffer(p126, var3421)
				var3421 = var3430
				table.insert(var3420.cards, t.GameItemsCardInputData.decode(var3429))
			elseif var3426 == 2 then
				local _ = nil
				local var3431, var3432 = protoModule.readBuffer(p126, var3421)
				var3421 = var3432
				var3420.title = buffer.tostring(var3431)
			elseif var3426 == 3 then
				local _ = nil
				local var3433, var3434 = protoModule.readBuffer(p126, var3421)
				var3421 = var3434
				var3420.sort_id = buffer.tostring(var3433)
			else
				local _ = nil
				local var3435, var3436 = protoModule.readVarInt(p126, var3421)
				var3421 = var3436 + var3435
			end
		elseif var3422 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3437, var3438 = protoModule.readFixed32(p126, var3421)
			local _ = var3437
			var3421 = var3438
		elseif var3422 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3439, var3440 = protoModule.readFixed64(p126, var3421)
			local _ = var3439
			var3421 = var3440
		else
			error("Unsupported wire type: " .. var4991)
		end
	end
	return var3420
end

function t_126:jsonEncode()
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

function t_126:jsonDecode()
	-- upvalues: t_126 (ref), t (ref)
	local var3441 = t_126.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3441.cards = t_1
	end
	if self.title ~= nil then
		var3441.title = self.title
	end
	if self.sort_id ~= nil then
		var3441.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3441.sort_id = self.sortId
	end
	return var3441
end

t_126.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_126
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p127)
	-- upvalues: t_127 (ref)
	return setmetatable({
		universe_id = if p127 == nil or p127.universe_id == nil then "" else p127.universe_id,
		items = if p127 == nil or p127.items == nil then {} else p127.items
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3442 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3443, var3444 = protoModule.writeTag(buff, var3442, 1, protoModule.wireTypes.lengthDelimited)
		var3443, var5017 = protoModule.writeString(var3443, var3444, self.universe_id)
		buff = var3443
		var3442 = var3444
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3445 = v:encode()
			local var3446, var3447 = protoModule.writeTag(buff, var3442, 2, protoModule.wireTypes.lengthDelimited)
			var3446, var5020 = protoModule.writeBuffer(var3446, var3447, var3445, buffer.len(var3445))
			buff = var3446
			var3442 = var3447
		end
	end
	local buff_1 = buffer.create(var3442)
	buffer.copy(buff_1, 0, buff, 0, var3442)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref), t (ref)
	local var3448 = t_127.new()
	local var3449 = 0
	while var3449 < buffer.len(p127) do
		local _ = nil
		local var3450 = nil
		local var3451, var3452, var3453 = protoModule.readTag(p127, var3449)
		local var3454 = var3451
		var3450 = var3452
		var3449 = var3453
		
		if var3450 == protoModule.wireTypes.varint then
			local _ = nil
			local var3455, var3456 = protoModule.readVarInt(p127, var3449)
			local _ = var3455
			var3449 = var3456
			continue
		end
		if var3450 == protoModule.wireTypes.lengthDelimited then
			if var3454 == 1 then
				local _ = nil
				local var3457, var3458 = protoModule.readBuffer(p127, var3449)
				var3449 = var3458
				var3448.universe_id = buffer.tostring(var3457)
			elseif var3454 == 2 then
				local _ = nil
				local var3459, var3460 = protoModule.readBuffer(p127, var3449)
				var3449 = var3460
				table.insert(var3448.items, t.GameItemInputData.decode(var3459))
			else
				local _ = nil
				local var3461, var3462 = protoModule.readVarInt(p127, var3449)
				var3449 = var3462 + var3461
			end
		elseif var3450 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3463, var3464 = protoModule.readFixed32(p127, var3449)
			local _ = var3463
			var3449 = var3464
		elseif var3450 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3465, var3466 = protoModule.readFixed64(p127, var3449)
			local _ = var3465
			var3449 = var3466
		else
			error("Unsupported wire type: " .. var5024)
		end
	end
	return var3448
end

function t_127:jsonEncode()
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

function t_127:jsonDecode()
	-- upvalues: t_127 (ref), t (ref)
	local var3467 = t_127.new()
	
	if self.universe_id ~= nil then
		var3467.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3467.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3467.items = t_1
	end
	return var3467
end

t_127.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_127
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p128)
	-- upvalues: t_128 (ref)
	return setmetatable({
		item_id = if p128 == nil or p128.item_id == nil then "" else p128.item_id,
		item_type = if p128 == nil or p128.item_type == nil then "" else p128.item_type
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3468 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3469, var3470 = protoModule.writeTag(buff, var3468, 1, protoModule.wireTypes.lengthDelimited)
		var3469, var5048 = protoModule.writeString(var3469, var3470, self.item_id)
		buff = var3469
		var3468 = var3470
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3471, var3472 = protoModule.writeTag(buff, var3468, 2, protoModule.wireTypes.lengthDelimited)
		var3471, var5050 = protoModule.writeString(var3471, var3472, self.item_type)
		buff = var3471
		var3468 = var3472
	end
	local buff_1 = buffer.create(var3468)
	buffer.copy(buff_1, 0, buff, 0, var3468)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref)
	local var3468 = t_128.new()
	local var3469 = 0
	while var3469 < buffer.len(p128) do
		local _ = nil
		local var3470 = nil
		local var3471, var3472, var3473 = protoModule.readTag(p128, var3469)
		local var3474 = var3471
		var3470 = var3472
		var3469 = var3473
		
		if var3470 == protoModule.wireTypes.varint then
			local _ = nil
			local var3475, var3476 = protoModule.readVarInt(p128, var3469)
			local _ = var3475
			var3469 = var3476
			continue
		end
		if var3470 == protoModule.wireTypes.lengthDelimited then
			if var3474 == 1 then
				local _ = nil
				local var3477, var3478 = protoModule.readBuffer(p128, var3469)
				var3469 = var3478
				var3468.item_id = buffer.tostring(var3477)
			elseif var3474 == 2 then
				local _ = nil
				local var3479, var3480 = protoModule.readBuffer(p128, var3469)
				var3469 = var3480
				var3468.item_type = buffer.tostring(var3479)
			else
				local _ = nil
				local var3481, var3482 = protoModule.readVarInt(p128, var3469)
				var3469 = var3482 + var3481
			end
		elseif var3470 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3483, var3484 = protoModule.readFixed32(p128, var3469)
			local _ = var3483
			var3469 = var3484
		elseif var3470 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3485, var3486 = protoModule.readFixed64(p128, var3469)
			local _ = var3485
			var3469 = var3486
		else
			error("Unsupported wire type: " .. var5054)
		end
	end
	return var3468
end

function t_128:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_128:jsonDecode()
	-- upvalues: t_128 (ref)
	local var3487 = t_128.new()
	
	if self.item_id ~= nil then
		var3487.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3487.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3487.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3487.item_type = self.itemType
	end
	return var3487
end

t_128.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_128
typeRegistryModule.default:register(t.GameItemInputData)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p129)
	-- upvalues: t_129 (ref)
	return setmetatable({
		clickout_url = if p129 == nil or p129.clickout_url == nil then "" else p129.clickout_url,
		native_ad_data = if p129 == nil or p129.native_ad_data == nil then "" else p129.native_ad_data,
		payer_name = if p129 == nil or p129.payer_name == nil then nil else p129.payer_name,
		logo_asset_id = if p129 == nil or p129.logo_asset_id == nil then nil else p129.logo_asset_id,
		logo_aspect_ratio = if p129 == nil or p129.logo_aspect_ratio == nil then nil else p129.logo_aspect_ratio,
		cta_text = if p129 == nil or p129.cta_text == nil then nil else p129.cta_text,
		title = if p129 == nil or p129.title == nil then nil else p129.title,
		subtitle = if p129 == nil or p129.subtitle == nil then nil else p129.subtitle,
		image_asset_id = if p129 == nil or p129.image_asset_id == nil then nil else p129.image_asset_id,
		video_asset_id = if p129 == nil or p129.video_asset_id == nil then nil else p129.video_asset_id,
		badge_text = if p129 == nil or p129.badge_text == nil then nil else p129.badge_text,
		badge_analytics_id = if p129 == nil or p129.badge_analytics_id == nil then nil else p129.badge_analytics_id,
		roblox_component = if p129 == nil or p129.roblox_component == nil then nil else p129.roblox_component,
		attribution_thumbnail_asset_id = if p129 == nil or p129.attribution_thumbnail_asset_id == nil then nil else p129.attribution_thumbnail_asset_id
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3487 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3488, var3489 = protoModule.writeTag(buff, var3487, 1, protoModule.wireTypes.lengthDelimited)
		var3488, var5076 = protoModule.writeString(var3488, var3489, self.clickout_url)
		buff = var3488
		var3487 = var3489
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3490, var3491 = protoModule.writeTag(buff, var3487, 2, protoModule.wireTypes.lengthDelimited)
		var3490, var5078 = protoModule.writeString(var3490, var3491, self.native_ad_data)
		buff = var3490
		var3487 = var3491
	end
	if self.payer_name ~= nil then
		local var3492, var3493 = protoModule.writeTag(buff, var3487, 3, protoModule.wireTypes.lengthDelimited)
		var3492, var5080 = protoModule.writeString(var3492, var3493, self.payer_name)
		buff = var3492
		var3487 = var3493
	end
	if self.logo_asset_id ~= nil then
		local var3494, var3495 = protoModule.writeTag(buff, var3487, 4, protoModule.wireTypes.lengthDelimited)
		var3494, var5082 = protoModule.writeString(var3494, var3495, self.logo_asset_id)
		buff = var3494
		var3487 = var3495
	end
	if self.logo_aspect_ratio ~= nil then
		local var3496, var3497 = protoModule.writeTag(buff, var3487, 5, protoModule.wireTypes.i64)
		var3496, var5084 = protoModule.writeDouble(var3496, var3497, self.logo_aspect_ratio)
		buff = var3496
		var3487 = var3497
	end
	if self.cta_text ~= nil then
		local var3498, var3499 = protoModule.writeTag(buff, var3487, 6, protoModule.wireTypes.lengthDelimited)
		var3498, var5086 = protoModule.writeString(var3498, var3499, self.cta_text)
		buff = var3498
		var3487 = var3499
	end
	if self.title ~= nil then
		local var3500, var3501 = protoModule.writeTag(buff, var3487, 7, protoModule.wireTypes.lengthDelimited)
		var3500, var5088 = protoModule.writeString(var3500, var3501, self.title)
		buff = var3500
		var3487 = var3501
	end
	if self.subtitle ~= nil then
		local var3502, var3503 = protoModule.writeTag(buff, var3487, 8, protoModule.wireTypes.lengthDelimited)
		var3502, var5090 = protoModule.writeString(var3502, var3503, self.subtitle)
		buff = var3502
		var3487 = var3503
	end
	if self.image_asset_id ~= nil then
		local var3504, var3505 = protoModule.writeTag(buff, var3487, 9, protoModule.wireTypes.lengthDelimited)
		var3504, var5092 = protoModule.writeString(var3504, var3505, self.image_asset_id)
		buff = var3504
		var3487 = var3505
	end
	if self.video_asset_id ~= nil then
		local var3506, var3507 = protoModule.writeTag(buff, var3487, 10, protoModule.wireTypes.lengthDelimited)
		var3506, var5094 = protoModule.writeString(var3506, var3507, self.video_asset_id)
		buff = var3506
		var3487 = var3507
	end
	if self.badge_text ~= nil then
		local var3508, var3509 = protoModule.writeTag(buff, var3487, 11, protoModule.wireTypes.lengthDelimited)
		var3508, var5096 = protoModule.writeString(var3508, var3509, self.badge_text)
		buff = var3508
		var3487 = var3509
	end
	if self.badge_analytics_id ~= nil then
		local var3510, var3511 = protoModule.writeTag(buff, var3487, 12, protoModule.wireTypes.lengthDelimited)
		var3510, var5098 = protoModule.writeString(var3510, var3511, self.badge_analytics_id)
		buff = var3510
		var3487 = var3511
	end
	if self.roblox_component ~= nil then
		local var3512, var3513 = protoModule.writeTag(buff, var3487, 13, protoModule.wireTypes.lengthDelimited)
		var3512, var5100 = protoModule.writeString(var3512, var3513, self.roblox_component)
		buff = var3512
		var3487 = var3513
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var3514, var3515 = protoModule.writeTag(buff, var3487, 14, protoModule.wireTypes.lengthDelimited)
		var3514, var5102 = protoModule.writeString(var3514, var3515, self.attribution_thumbnail_asset_id)
		buff = var3514
		var3487 = var3515
	end
	local buff_1 = buffer.create(var3487)
	buffer.copy(buff_1, 0, buff, 0, var3487)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref)
	local var3487 = t_129.new()
	local var3488 = 0
	while var3488 < buffer.len(p129) do
		local _ = nil
		local var3489 = nil
		local var3490, var3491, var3492 = protoModule.readTag(p129, var3488)
		local var3493 = var3490
		var3489 = var3491
		var3488 = var3492
		
		if var3489 == protoModule.wireTypes.varint then
			local _ = nil
			local var3494, var3495 = protoModule.readVarInt(p129, var3488)
			local _ = var3494
			var3488 = var3495
			continue
		end
		if var3489 == protoModule.wireTypes.lengthDelimited then
			if var3493 == 1 then
				local _ = nil
				local var3496, var3497 = protoModule.readBuffer(p129, var3488)
				var3488 = var3497
				var3487.clickout_url = buffer.tostring(var3496)
			elseif var3493 == 2 then
				local _ = nil
				local var3498, var3499 = protoModule.readBuffer(p129, var3488)
				var3488 = var3499
				var3487.native_ad_data = buffer.tostring(var3498)
			elseif var3493 == 3 then
				local _ = nil
				local var3500, var3501 = protoModule.readBuffer(p129, var3488)
				var3488 = var3501
				var3487.payer_name = buffer.tostring(var3500)
			elseif var3493 == 4 then
				local _ = nil
				local var3502, var3503 = protoModule.readBuffer(p129, var3488)
				var3488 = var3503
				var3487.logo_asset_id = buffer.tostring(var3502)
			elseif var3493 == 6 then
				local _ = nil
				local var3504, var3505 = protoModule.readBuffer(p129, var3488)
				var3488 = var3505
				var3487.cta_text = buffer.tostring(var3504)
			elseif var3493 == 7 then
				local _ = nil
				local var3506, var3507 = protoModule.readBuffer(p129, var3488)
				var3488 = var3507
				var3487.title = buffer.tostring(var3506)
			elseif var3493 == 8 then
				local _ = nil
				local var3508, var3509 = protoModule.readBuffer(p129, var3488)
				var3488 = var3509
				var3487.subtitle = buffer.tostring(var3508)
			elseif var3493 == 9 then
				local _ = nil
				local var3510, var3511 = protoModule.readBuffer(p129, var3488)
				var3488 = var3511
				var3487.image_asset_id = buffer.tostring(var3510)
			elseif var3493 == 10 then
				local _ = nil
				local var3512, var3513 = protoModule.readBuffer(p129, var3488)
				var3488 = var3513
				var3487.video_asset_id = buffer.tostring(var3512)
			elseif var3493 == 11 then
				local _ = nil
				local var3514, var3515 = protoModule.readBuffer(p129, var3488)
				var3488 = var3515
				var3487.badge_text = buffer.tostring(var3514)
			elseif var3493 == 12 then
				local _ = nil
				local var3516, var3517 = protoModule.readBuffer(p129, var3488)
				var3488 = var3517
				var3487.badge_analytics_id = buffer.tostring(var3516)
			elseif var3493 == 13 then
				local _ = nil
				local var3518, var3519 = protoModule.readBuffer(p129, var3488)
				var3488 = var3519
				var3487.roblox_component = buffer.tostring(var3518)
			elseif var3493 == 14 then
				local _ = nil
				local var3520, var3521 = protoModule.readBuffer(p129, var3488)
				var3488 = var3521
				var3487.attribution_thumbnail_asset_id = buffer.tostring(var3520)
			else
				local _ = nil
				local var3522, var3523 = protoModule.readVarInt(p129, var3488)
				var3488 = var3523 + var3522
			end
		elseif var3489 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3524, var3525 = protoModule.readFixed32(p129, var3488)
			local _ = var3524
			var3488 = var3525
		elseif var3489 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5106)
		elseif var3493 == 5 then
			local _ = nil
			local var3526, var3527 = protoModule.readDouble(p129, var3488)
			var3488 = var3527
			var3487.logo_aspect_ratio = var3526
		else
			local _ = nil
			local var3528, var3529 = protoModule.readFixed64(p129, var3488)
			local _ = var3528
			var3488 = var3529
		end
	end
	return var3487
end

function t_129:jsonEncode()
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

function t_129:jsonDecode()
	-- upvalues: t_129 (ref), protoModule (ref)
	local var3530 = t_129.new()
	
	if self.clickout_url ~= nil then
		var3530.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3530.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3530.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3530.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3530.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3530.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3530.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3530.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3530.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3530.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3530.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3530.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3530.title = self.title
	end
	if self.subtitle ~= nil then
		var3530.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3530.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3530.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3530.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3530.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3530.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3530.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3530.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3530.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3530.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3530.roblox_component = self.robloxComponent
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var3530.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var3530.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	return var3530
end

t_129.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = t_129
typeRegistryModule.default:register(t.AdLinkItem)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p130)
	-- upvalues: t_130 (ref)
	return setmetatable({
		layout = if p130 == nil or p130.layout == nil then nil else p130.layout,
		kind = if p130 == nil or p130.kind == nil then nil else p130.kind
	}, t_130)
end

function t_130:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3530 = 0
	
	if self.layout ~= nil then
		local var3531 = self.layout:encode()
		local var3532, var3533 = protoModule.writeTag(buff, var3530, 1, protoModule.wireTypes.lengthDelimited)
		var3532, var5153 = protoModule.writeBuffer(var3532, var3533, var3531, buffer.len(var3531))
		buff = var3532
		var3530 = var3533
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3534 = self.kind.value:encode()
			local var3535, var3536 = protoModule.writeTag(buff, var3530, 2, protoModule.wireTypes.lengthDelimited)
			var3535, var5156 = protoModule.writeBuffer(var3535, var3536, var3534, buffer.len(var3534))
			buff = var3535
			var3530 = var3536
		elseif self.kind.type == "ad_link" then
			local var3537 = self.kind.value:encode()
			local var3538, var3539 = protoModule.writeTag(buff, var3530, 3, protoModule.wireTypes.lengthDelimited)
			var3538, var5159 = protoModule.writeBuffer(var3538, var3539, var3537, buffer.len(var3537))
			buff = var3538
			var3530 = var3539
		end
	end
	local buff_1 = buffer.create(var3530)
	buffer.copy(buff_1, 0, buff, 0, var3530)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var3530 = t_130.new()
	local var3531 = 0
	while var3531 < buffer.len(p130) do
		local _ = nil
		local var3532 = nil
		local var3533, var3534, var3535 = protoModule.readTag(p130, var3531)
		local var3536 = var3533
		var3532 = var3534
		var3531 = var3535
		
		if var3532 == protoModule.wireTypes.varint then
			local _ = nil
			local var3537, var3538 = protoModule.readVarInt(p130, var3531)
			local _ = var3537
			var3531 = var3538
			continue
		end
		if var3532 == protoModule.wireTypes.lengthDelimited then
			if var3536 == 1 then
				local _ = nil
				local var3539, var3540 = protoModule.readBuffer(p130, var3531)
				var3531 = var3540
				var3530.layout = t.ItemLayout.decode(var3539)
			elseif var3536 == 2 then
				local _ = nil
				local var3541, var3542 = protoModule.readBuffer(p130, var3531)
				var3531 = var3542
				var3530.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3541)
				}
			elseif var3536 == 3 then
				local _ = nil
				local var3543, var3544 = protoModule.readBuffer(p130, var3531)
				var3531 = var3544
				var3530.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3543) }
			else
				local _ = nil
				local var3545, var3546 = protoModule.readVarInt(p130, var3531)
				var3531 = var3546 + var3545
			end
		elseif var3532 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3547, var3548 = protoModule.readFixed32(p130, var3531)
			local _ = var3547
			var3531 = var3548
		elseif var3532 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3549, var3550 = protoModule.readFixed64(p130, var3531)
			local _ = var3549
			var3531 = var3550
		else
			error("Unsupported wire type: " .. var5163)
		end
	end
	return var3530
end

function t_130:jsonEncode()
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

function t_130:jsonDecode()
	-- upvalues: t_130 (ref), t (ref)
	local var3551 = t_130.new()
	
	if self.layout ~= nil then
		var3551.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3551.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3551.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3551.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3551
end

t_130.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_130
typeRegistryModule.default:register(t.ItemWithLayout)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p131)
	-- upvalues: t_131 (ref)
	return setmetatable({
		items = if p131 == nil or p131.items == nil then {} else p131.items,
		collection_item_size = if p131 == nil or p131.collection_item_size == nil then nil else p131.collection_item_size
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3551 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3552 = v:encode()
			local var3553, var3554 = protoModule.writeTag(buff, var3551, 1, protoModule.wireTypes.lengthDelimited)
			var3553, var5188 = protoModule.writeBuffer(var3553, var3554, var3552, buffer.len(var3552))
			buff = var3553
			var3551 = var3554
		end
	end
	if self.collection_item_size ~= nil then
		local var3555, var3556 = protoModule.writeTag(buff, var3551, 2, protoModule.wireTypes.lengthDelimited)
		var3555, var5190 = protoModule.writeString(var3555, var3556, self.collection_item_size)
		buff = var3555
		var3551 = var3556
	end
	local buff_1 = buffer.create(var3551)
	buffer.copy(buff_1, 0, buff, 0, var3551)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref), t (ref)
	local var3557 = t_131.new()
	local var3558 = 0
	while var3558 < buffer.len(p131) do
		local _ = nil
		local var3559 = nil
		local var3560, var3561, var3562 = protoModule.readTag(p131, var3558)
		local var3563 = var3560
		var3559 = var3561
		var3558 = var3562
		
		if var3559 == protoModule.wireTypes.varint then
			local _ = nil
			local var3564, var3565 = protoModule.readVarInt(p131, var3558)
			local _ = var3564
			var3558 = var3565
			continue
		end
		if var3559 == protoModule.wireTypes.lengthDelimited then
			if var3563 == 1 then
				local _ = nil
				local var3566, var3567 = protoModule.readBuffer(p131, var3558)
				var3558 = var3567
				table.insert(var3557.items, t.ItemWithLayout.decode(var3566))
			elseif var3563 == 2 then
				local _ = nil
				local var3568, var3569 = protoModule.readBuffer(p131, var3558)
				var3558 = var3569
				var3557.collection_item_size = buffer.tostring(var3568)
			else
				local _ = nil
				local var3570, var3571 = protoModule.readVarInt(p131, var3558)
				var3558 = var3571 + var3570
			end
		elseif var3559 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3572, var3573 = protoModule.readFixed32(p131, var3558)
			local _ = var3572
			var3558 = var3573
		elseif var3559 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3574, var3575 = protoModule.readFixed64(p131, var3558)
			local _ = var3574
			var3558 = var3575
		else
			error("Unsupported wire type: " .. var5194)
		end
	end
	return var3557
end

function t_131:jsonEncode()
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

function t_131:jsonDecode()
	-- upvalues: t_131 (ref), t (ref)
	local var3576 = t_131.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3576.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3576.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3576.collection_item_size = self.collectionItemSize
	end
	return var3576
end

t_131.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_131
typeRegistryModule.default:register(t.ContentPool)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p132)
	-- upvalues: t_132 (ref)
	return setmetatable({
		col_span = if p132 == nil or p132.col_span == nil then 0 else p132.col_span,
		row_span = if p132 == nil or p132.row_span == nil then 0 else p132.row_span,
		alignment_type = if p132 == nil or p132.alignment_type == nil then "" else p132.alignment_type,
		min_row_padding = if p132 == nil or p132.min_row_padding == nil then 0 else p132.min_row_padding
	}, t_132)
end

function t_132:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3577 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3578, var3579 = protoModule.writeTag(buff, var3577, 1, protoModule.wireTypes.varint)
		var3578, var5218 = protoModule.writeVarInt(var3578, var3579, self.col_span)
		buff = var3578
		var3577 = var3579
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3580, var3581 = protoModule.writeTag(buff, var3577, 2, protoModule.wireTypes.varint)
		var3580, var5220 = protoModule.writeVarInt(var3580, var3581, self.row_span)
		buff = var3580
		var3577 = var3581
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3582, var3583 = protoModule.writeTag(buff, var3577, 3, protoModule.wireTypes.lengthDelimited)
		var3582, var5222 = protoModule.writeString(var3582, var3583, self.alignment_type)
		buff = var3582
		var3577 = var3583
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3584, var3585 = protoModule.writeTag(buff, var3577, 4, protoModule.wireTypes.varint)
		var3584, var5224 = protoModule.writeVarInt(var3584, var3585, self.min_row_padding)
		buff = var3584
		var3577 = var3585
	end
	local buff_1 = buffer.create(var3577)
	buffer.copy(buff_1, 0, buff, 0, var3577)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref)
	local var3577 = t_132.new()
	local var3578 = 0
	while var3578 < buffer.len(p132) do
		local _ = nil
		local var3579 = nil
		local var3580, var3581, var3582 = protoModule.readTag(p132, var3578)
		local var3583 = var3580
		var3579 = var3581
		var3578 = var3582
		
		if var3579 == protoModule.wireTypes.varint then
			if var3583 == 1 then
				local _ = nil
				local var3584, var3585 = protoModule.readVarIntI32(p132, var3578)
				var3578 = var3585
				var3577.col_span = var3584
			elseif var3583 == 2 then
				local _ = nil
				local var3586, var3587 = protoModule.readVarIntI32(p132, var3578)
				var3578 = var3587
				var3577.row_span = var3586
			elseif var3583 == 4 then
				local _ = nil
				local var3588, var3589 = protoModule.readVarIntI32(p132, var3578)
				var3578 = var3589
				var3577.min_row_padding = var3588
			else
				local _ = nil
				local var3590, var3591 = protoModule.readVarInt(p132, var3578)
				local _ = var3590
				var3578 = var3591
			end
		end
		if var3579 == protoModule.wireTypes.lengthDelimited then
			if var3583 == 3 then
				local _ = nil
				local var3592, var3593 = protoModule.readBuffer(p132, var3578)
				var3578 = var3593
				var3577.alignment_type = buffer.tostring(var3592)
			else
				local _ = nil
				local var3594, var3595 = protoModule.readVarInt(p132, var3578)
				var3578 = var3595 + var3594
			end
		elseif var3579 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3596, var3597 = protoModule.readFixed32(p132, var3578)
			local _ = var3596
			var3578 = var3597
		elseif var3579 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3598, var3599 = protoModule.readFixed64(p132, var3578)
			local _ = var3598
			var3578 = var3599
		else
			error("Unsupported wire type: " .. var5228)
		end
	end
	return var3577
end

function t_132:jsonEncode()
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

function t_132:jsonDecode()
	-- upvalues: t_132 (ref)
	local var3600 = t_132.new()
	
	if self.col_span ~= nil then
		var3600.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3600.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3600.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3600.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3600.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3600.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3600.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3600.min_row_padding = self.minRowPadding
	end
	return var3600
end

t_132.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_132
typeRegistryModule.default:register(t.ItemLayout)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p133)
	-- upvalues: t_133 (ref)
	return setmetatable({
		community_id = if p133 == nil or p133.community_id == nil then "" else p133.community_id,
		announcement_id = if p133 == nil or p133.announcement_id == nil then "" else p133.announcement_id,
		message_id = if p133 == nil or p133.message_id == nil then "" else p133.message_id,
		title = if p133 == nil or p133.title == nil then "" else p133.title,
		body = if p133 == nil or p133.body == nil then "" else p133.body,
		creator_key = if p133 == nil or p133.creator_key == nil then "" else p133.creator_key,
		creator_role_name = if p133 == nil or p133.creator_role_name == nil then nil else p133.creator_role_name,
		media_asset_id = if p133 == nil or p133.media_asset_id == nil then nil else p133.media_asset_id,
		created_time = if p133 == nil or p133.created_time == nil then nil else p133.created_time
	}, t_133)
end

function t_133:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3600 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3601, var3602 = protoModule.writeTag(buff, var3600, 1, protoModule.wireTypes.lengthDelimited)
		var3601, var5254 = protoModule.writeString(var3601, var3602, self.community_id)
		buff = var3601
		var3600 = var3602
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3603, var3604 = protoModule.writeTag(buff, var3600, 2, protoModule.wireTypes.lengthDelimited)
		var3603, var5256 = protoModule.writeString(var3603, var3604, self.announcement_id)
		buff = var3603
		var3600 = var3604
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3605, var3606 = protoModule.writeTag(buff, var3600, 3, protoModule.wireTypes.lengthDelimited)
		var3605, var5258 = protoModule.writeString(var3605, var3606, self.message_id)
		buff = var3605
		var3600 = var3606
	end
	if self.title ~= nil and self.title ~= "" then
		local var3607, var3608 = protoModule.writeTag(buff, var3600, 4, protoModule.wireTypes.lengthDelimited)
		var3607, var5260 = protoModule.writeString(var3607, var3608, self.title)
		buff = var3607
		var3600 = var3608
	end
	if self.body ~= nil and self.body ~= "" then
		local var3609, var3610 = protoModule.writeTag(buff, var3600, 5, protoModule.wireTypes.lengthDelimited)
		var3609, var5262 = protoModule.writeString(var3609, var3610, self.body)
		buff = var3609
		var3600 = var3610
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3611, var3612 = protoModule.writeTag(buff, var3600, 6, protoModule.wireTypes.lengthDelimited)
		var3611, var5264 = protoModule.writeString(var3611, var3612, self.creator_key)
		buff = var3611
		var3600 = var3612
	end
	if self.creator_role_name ~= nil then
		local var3613, var3614 = protoModule.writeTag(buff, var3600, 7, protoModule.wireTypes.lengthDelimited)
		var3613, var5266 = protoModule.writeString(var3613, var3614, self.creator_role_name)
		buff = var3613
		var3600 = var3614
	end
	if self.media_asset_id ~= nil then
		local var3615, var3616 = protoModule.writeTag(buff, var3600, 8, protoModule.wireTypes.lengthDelimited)
		var3615, var5268 = protoModule.writeString(var3615, var3616, self.media_asset_id)
		buff = var3615
		var3600 = var3616
	end
	if self.created_time ~= nil then
		local var3617 = self.created_time:encode()
		local var3618, var3619 = protoModule.writeTag(buff, var3600, 9, protoModule.wireTypes.lengthDelimited)
		var3618, var5271 = protoModule.writeBuffer(var3618, var3619, var3617, buffer.len(var3617))
		buff = var3618
		var3600 = var3619
	end
	local buff_1 = buffer.create(var3600)
	buffer.copy(buff_1, 0, buff, 0, var3600)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref), timestampModule (ref)
	local var3600 = t_133.new()
	local var3601 = 0
	while var3601 < buffer.len(p133) do
		local _ = nil
		local var3602 = nil
		local var3603, var3604, var3605 = protoModule.readTag(p133, var3601)
		local var3606 = var3603
		var3602 = var3604
		var3601 = var3605
		
		if var3602 == protoModule.wireTypes.varint then
			local _ = nil
			local var3607, var3608 = protoModule.readVarInt(p133, var3601)
			local _ = var3607
			var3601 = var3608
			continue
		end
		if var3602 == protoModule.wireTypes.lengthDelimited then
			if var3606 == 1 then
				local _ = nil
				local var3609, var3610 = protoModule.readBuffer(p133, var3601)
				var3601 = var3610
				var3600.community_id = buffer.tostring(var3609)
			elseif var3606 == 2 then
				local _ = nil
				local var3611, var3612 = protoModule.readBuffer(p133, var3601)
				var3601 = var3612
				var3600.announcement_id = buffer.tostring(var3611)
			elseif var3606 == 3 then
				local _ = nil
				local var3613, var3614 = protoModule.readBuffer(p133, var3601)
				var3601 = var3614
				var3600.message_id = buffer.tostring(var3613)
			elseif var3606 == 4 then
				local _ = nil
				local var3615, var3616 = protoModule.readBuffer(p133, var3601)
				var3601 = var3616
				var3600.title = buffer.tostring(var3615)
			elseif var3606 == 5 then
				local _ = nil
				local var3617, var3618 = protoModule.readBuffer(p133, var3601)
				var3601 = var3618
				var3600.body = buffer.tostring(var3617)
			elseif var3606 == 6 then
				local _ = nil
				local var3619, var3620 = protoModule.readBuffer(p133, var3601)
				var3601 = var3620
				var3600.creator_key = buffer.tostring(var3619)
			elseif var3606 == 7 then
				local _ = nil
				local var3621, var3622 = protoModule.readBuffer(p133, var3601)
				var3601 = var3622
				var3600.creator_role_name = buffer.tostring(var3621)
			elseif var3606 == 8 then
				local _ = nil
				local var3623, var3624 = protoModule.readBuffer(p133, var3601)
				var3601 = var3624
				var3600.media_asset_id = buffer.tostring(var3623)
			elseif var3606 == 9 then
				local _ = nil
				local var3625, var3626 = protoModule.readBuffer(p133, var3601)
				var3601 = var3626
				var3600.created_time = timestampModule.Timestamp.decode(var3625)
			else
				local _ = nil
				local var3627, var3628 = protoModule.readVarInt(p133, var3601)
				var3601 = var3628 + var3627
			end
		elseif var3602 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3629, var3630 = protoModule.readFixed32(p133, var3601)
			local _ = var3629
			var3601 = var3630
		elseif var3602 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3631, var3632 = protoModule.readFixed64(p133, var3601)
			local _ = var3631
			var3601 = var3632
		else
			error("Unsupported wire type: " .. var5275)
		end
	end
	return var3600
end

function t_133:jsonEncode()
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

function t_133:jsonDecode()
	-- upvalues: t_133 (ref), timestampModule (ref)
	local var3633 = t_133.new()
	
	if self.community_id ~= nil then
		var3633.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3633.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3633.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3633.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3633.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3633.message_id = self.messageId
	end
	if self.title ~= nil then
		var3633.title = self.title
	end
	if self.body ~= nil then
		var3633.body = self.body
	end
	if self.creator_key ~= nil then
		var3633.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3633.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3633.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3633.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3633.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3633.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3633.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3633.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3633
end

t_133.descriptor = {
	name = "CommunityAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityAnnouncementInputData"
}
t.CommunityAnnouncementInputData = t_133
typeRegistryModule.default:register(t.CommunityAnnouncementInputData)
t.PageEntryFormat = {
	fromNumber = function(p134)
		return if p134 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p134 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p134)
		return if p134 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p134 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p134
	end,
	fromName = function(p134)
		return if p134 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p134 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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