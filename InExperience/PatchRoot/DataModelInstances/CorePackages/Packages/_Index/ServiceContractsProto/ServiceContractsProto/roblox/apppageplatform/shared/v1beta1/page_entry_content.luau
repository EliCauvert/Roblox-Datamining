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
		var3, var149 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.input_data ~= nil then
		local var5 = self.input_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var152 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
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
			error("Unsupported wire type: " .. var156)
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
		var22, var179 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var20 = var23
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var24, var181 = protoModule.writeString(var24, var25, self.roblox_component)
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
			error("Unsupported wire type: " .. var185)
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
		var40, var207 = protoModule.writeString(var40, var41, self.roblox_component)
		buff = var40
		var39 = var41
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var42 = self.input_data.value:encode()
		local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var43, var210 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var39 = var44
	end
	if self.cta_buttons ~= nil then
		local var45 = self.cta_buttons:encode()
		local var46, var47 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
		var46, var213 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
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
			error("Unsupported wire type: " .. var217)
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
		var61, var241 = protoModule.writeString(var61, var62, self.roblox_component)
		buff = var61
		var60 = var62
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var63 = self.input_data.value:encode()
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var244 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var60 = var65
		elseif self.input_data.type == "video" then
			local var66 = self.input_data.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var247 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
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
			error("Unsupported wire type: " .. var251)
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
			var83, var276 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var81 = var84
		elseif self.kind.type == "badge_details" then
			local var85 = self.kind.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
			var86, var279 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var81 = var87
		elseif self.kind.type == "static_content" then
			local var88 = self.kind.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var81, 3, protoModule.wireTypes.lengthDelimited)
			var89, var282 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var81 = var90
		elseif self.kind.type == "experience_attribution_row" then
			local var91 = self.kind.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var81, 4, protoModule.wireTypes.lengthDelimited)
			var92, var285 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var81 = var93
		elseif self.kind.type == "experience_action_module" then
			local var94 = self.kind.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var81, 5, protoModule.wireTypes.lengthDelimited)
			var95, var288 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var81 = var96
		elseif self.kind.type == "experience_media_gallery" then
			local var97 = self.kind.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var81, 6, protoModule.wireTypes.lengthDelimited)
			var98, var291 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var81 = var99
		elseif self.kind.type == "experience_description" then
			local var100 = self.kind.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var81, 7, protoModule.wireTypes.lengthDelimited)
			var101, var294 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var81 = var102
		elseif self.kind.type == "experience_stat_row" then
			local var103 = self.kind.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var81, 8, protoModule.wireTypes.lengthDelimited)
			var104, var297 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var81 = var105
		elseif self.kind.type == "experience_info_table" then
			local var106 = self.kind.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var81, 9, protoModule.wireTypes.lengthDelimited)
			var107, var300 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var81 = var108
		elseif self.kind.type == "social_link_row" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var81, 10, protoModule.wireTypes.lengthDelimited)
			var110, var303 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var81 = var111
		elseif self.kind.type == "experience_carousel" then
			local var112 = self.kind.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var81, 11, protoModule.wireTypes.lengthDelimited)
			var113, var306 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var81 = var114
		elseif self.kind.type == "song_carousel" then
			local var115 = self.kind.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var81, 12, protoModule.wireTypes.lengthDelimited)
			var116, var309 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var81 = var117
		elseif self.kind.type == "events_carousel" then
			local var118 = self.kind.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var81, 13, protoModule.wireTypes.lengthDelimited)
			var119, var312 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var81 = var120
		elseif self.kind.type == "game_pass_collection" then
			local var121 = self.kind.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var81, 14, protoModule.wireTypes.lengthDelimited)
			var122, var315 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var81 = var123
		elseif self.kind.type == "developer_product_collection" then
			local var124 = self.kind.value:encode()
			local var125, var126 = protoModule.writeTag(buff, var81, 15, protoModule.wireTypes.lengthDelimited)
			var125, var318 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
			buff = var125
			var81 = var126
		elseif self.kind.type == "subscription_collection" then
			local var127 = self.kind.value:encode()
			local var128, var129 = protoModule.writeTag(buff, var81, 16, protoModule.wireTypes.lengthDelimited)
			var128, var321 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var81 = var129
		elseif self.kind.type == "dynamic_store_category" then
			local var130 = self.kind.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var81, 17, protoModule.wireTypes.lengthDelimited)
			var131, var324 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var81 = var132
		elseif self.kind.type == "card_container" then
			local var133 = self.kind.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var81, 20, protoModule.wireTypes.lengthDelimited)
			var134, var327 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var81 = var135
		elseif self.kind.type == "card" then
			local var136 = self.kind.value:encode()
			local var137, var138 = protoModule.writeTag(buff, var81, 21, protoModule.wireTypes.lengthDelimited)
			var137, var330 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
			buff = var137
			var81 = var138
		elseif self.kind.type == "dialog" then
			local var139 = self.kind.value:encode()
			local var140, var141 = protoModule.writeTag(buff, var81, 22, protoModule.wireTypes.lengthDelimited)
			var140, var333 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var81 = var141
		elseif self.kind.type == "banner" then
			local var142 = self.kind.value:encode()
			local var143, var144 = protoModule.writeTag(buff, var81, 23, protoModule.wireTypes.lengthDelimited)
			var143, var336 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
			buff = var143
			var81 = var144
		elseif self.kind.type == "tooltip" then
			local var145 = self.kind.value:encode()
			local var146, var147 = protoModule.writeTag(buff, var81, 24, protoModule.wireTypes.lengthDelimited)
			var146, var339 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var81 = var147
		elseif self.kind.type == "coachmark" then
			local var148 = self.kind.value:encode()
			local var149, var150 = protoModule.writeTag(buff, var81, 25, protoModule.wireTypes.lengthDelimited)
			var149, var342 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
			buff = var149
			var81 = var150
		elseif self.kind.type == "system_banner_prompt" then
			local var151 = self.kind.value:encode()
			local var152, var153 = protoModule.writeTag(buff, var81, 28, protoModule.wireTypes.lengthDelimited)
			var152, var345 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
			buff = var152
			var81 = var153
		elseif self.kind.type == "age_check_upsell" then
			local var154 = self.kind.value:encode()
			local var155, var156 = protoModule.writeTag(buff, var81, 29, protoModule.wireTypes.lengthDelimited)
			var155, var348 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
			buff = var155
			var81 = var156
		elseif self.kind.type == "catalog_item_list" then
			local var157 = self.kind.value:encode()
			local var158, var159 = protoModule.writeTag(buff, var81, 26, protoModule.wireTypes.lengthDelimited)
			var158, var351 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var81 = var159
		elseif self.kind.type == "user_list" then
			local var160 = self.kind.value:encode()
			local var161, var162 = protoModule.writeTag(buff, var81, 27, protoModule.wireTypes.lengthDelimited)
			var161, var354 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
			buff = var161
			var81 = var162
		elseif self.kind.type == "experience_content_rating_label" then
			local var163 = self.kind.value:encode()
			local var164, var165 = protoModule.writeTag(buff, var81, 30, protoModule.wireTypes.lengthDelimited)
			var164, var357 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
			buff = var164
			var81 = var165
		elseif self.kind.type == "experience_refund_policy" then
			local var166 = self.kind.value:encode()
			local var167, var168 = protoModule.writeTag(buff, var81, 31, protoModule.wireTypes.lengthDelimited)
			var167, var360 = protoModule.writeBuffer(var167, var168, var166, buffer.len(var166))
			buff = var167
			var81 = var168
		elseif self.kind.type == "experience_play_with_reward" then
			local var169 = self.kind.value:encode()
			local var170, var171 = protoModule.writeTag(buff, var81, 32, protoModule.wireTypes.lengthDelimited)
			var170, var363 = protoModule.writeBuffer(var170, var171, var169, buffer.len(var169))
			buff = var170
			var81 = var171
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var172 = self.kind.value:encode()
			local var173, var174 = protoModule.writeTag(buff, var81, 33, protoModule.wireTypes.lengthDelimited)
			var173, var366 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
			buff = var173
			var81 = var174
		elseif self.kind.type == "community_section" then
			local var175 = self.kind.value:encode()
			local var176, var177 = protoModule.writeTag(buff, var81, 35, protoModule.wireTypes.lengthDelimited)
			var176, var369 = protoModule.writeBuffer(var176, var177, var175, buffer.len(var175))
			buff = var176
			var81 = var177
		elseif self.kind.type == "moments_carousel" then
			local var178 = self.kind.value:encode()
			local var179, var180 = protoModule.writeTag(buff, var81, 34, protoModule.wireTypes.lengthDelimited)
			var179, var372 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var81 = var180
		elseif self.kind.type == "text" then
			local var181 = self.kind.value:encode()
			local var182, var183 = protoModule.writeTag(buff, var81, 40, protoModule.wireTypes.lengthDelimited)
			var182, var375 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
			buff = var182
			var81 = var183
		elseif self.kind.type == "vertical_feed" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var81, 41, protoModule.wireTypes.lengthDelimited)
			var185, var378 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var81 = var186
		elseif self.kind.type == "page_header" then
			local var187 = self.kind.value:encode()
			local var188, var189 = protoModule.writeTag(buff, var81, 42, protoModule.wireTypes.lengthDelimited)
			var188, var381 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var81 = var189
		elseif self.kind.type == "image_cta_section" then
			local var190 = self.kind.value:encode()
			local var191, var192 = protoModule.writeTag(buff, var81, 43, protoModule.wireTypes.lengthDelimited)
			var191, var384 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
			buff = var191
			var81 = var192
		elseif self.kind.type == "sandbox_content" then
			local var193 = self.kind.value:encode()
			local var194, var195 = protoModule.writeTag(buff, var81, 50, protoModule.wireTypes.lengthDelimited)
			var194, var387 = protoModule.writeBuffer(var194, var195, var193, buffer.len(var193))
			buff = var194
			var81 = var195
		elseif self.kind.type == "experience_details_feed" then
			local var196 = self.kind.value:encode()
			local var197, var198 = protoModule.writeTag(buff, var81, 500, protoModule.wireTypes.lengthDelimited)
			var197, var390 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
			buff = var197
			var81 = var198
		elseif self.kind.type == "experience_details_action_bar" then
			local var199 = self.kind.value:encode()
			local var200, var201 = protoModule.writeTag(buff, var81, 501, protoModule.wireTypes.lengthDelimited)
			var200, var393 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
			buff = var200
			var81 = var201
		elseif self.kind.type == "experience_details_banner_image" then
			local var202 = self.kind.value:encode()
			local var203, var204 = protoModule.writeTag(buff, var81, 502, protoModule.wireTypes.lengthDelimited)
			var203, var396 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
			buff = var203
			var81 = var204
		elseif self.kind.type == "experience_details_sticky_header" then
			local var205 = self.kind.value:encode()
			local var206, var207 = protoModule.writeTag(buff, var81, 503, protoModule.wireTypes.lengthDelimited)
			var206, var399 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var81 = var207
		elseif self.kind.type == "event_details_feed" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var81, 600, protoModule.wireTypes.lengthDelimited)
			var209, var402 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var81 = var210
		elseif self.kind.type == "event_details_action_bar" then
			local var211 = self.kind.value:encode()
			local var212, var213 = protoModule.writeTag(buff, var81, 601, protoModule.wireTypes.lengthDelimited)
			var212, var405 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
			buff = var212
			var81 = var213
		elseif self.kind.type == "event_attribution_row" then
			local var214 = self.kind.value:encode()
			local var215, var216 = protoModule.writeTag(buff, var81, 602, protoModule.wireTypes.lengthDelimited)
			var215, var408 = protoModule.writeBuffer(var215, var216, var214, buffer.len(var214))
			buff = var215
			var81 = var216
		elseif self.kind.type == "event_description" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var81, 603, protoModule.wireTypes.lengthDelimited)
			var218, var411 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var81 = var219
		elseif self.kind.type == "event_info_table" then
			local var220 = self.kind.value:encode()
			local var221, var222 = protoModule.writeTag(buff, var81, 604, protoModule.wireTypes.lengthDelimited)
			var221, var414 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var81 = var222
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var223 = self.kind.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var81, 605, protoModule.wireTypes.lengthDelimited)
			var224, var417 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var81 = var225
		elseif self.kind.type == "event_notifications_modal" then
			local var226 = self.kind.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var81, 606, protoModule.wireTypes.lengthDelimited)
			var227, var420 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var81 = var228
		elseif self.kind.type == "dev_store_feed" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var81, 700, protoModule.wireTypes.lengthDelimited)
			var230, var423 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var81 = var231
		elseif self.kind.type == "charts_feed" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var81, 800, protoModule.wireTypes.lengthDelimited)
			var233, var426 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var81 = var234
		elseif self.kind.type == "filter_pills" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var81, 801, protoModule.wireTypes.lengthDelimited)
			var236, var429 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var81 = var237
		elseif self.kind.type == "sort_selector" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var81, 802, protoModule.wireTypes.lengthDelimited)
			var239, var432 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var81 = var240
		elseif self.kind.type == "genre_selector" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var81, 803, protoModule.wireTypes.lengthDelimited)
			var242, var435 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var81 = var243
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var81, 900, protoModule.wireTypes.lengthDelimited)
			var245, var438 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var81 = var246
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var81, 901, protoModule.wireTypes.lengthDelimited)
			var248, var441 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var81 = var249
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var81, 902, protoModule.wireTypes.lengthDelimited)
			var251, var444 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var81 = var252
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var81, 903, protoModule.wireTypes.lengthDelimited)
			var254, var447 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var81 = var255
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var81, 904, protoModule.wireTypes.lengthDelimited)
			var257, var450 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var81 = var258
		elseif self.kind.type == "catalog_item_grid" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var81, 905, protoModule.wireTypes.lengthDelimited)
			var260, var453 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var81 = var261
		elseif self.kind.type == "marketplace_offer_modal" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var81, 906, protoModule.wireTypes.lengthDelimited)
			var263, var456 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var81 = var264
		elseif self.kind.type == "marketplace_item_media_header" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var81, 907, protoModule.wireTypes.lengthDelimited)
			var266, var459 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var81 = var267
		elseif self.kind.type == "search_results_feed" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var81, 1000, protoModule.wireTypes.lengthDelimited)
			var269, var462 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var81 = var270
		elseif self.kind.type == "power_search_ai_overview" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var81, 1001, protoModule.wireTypes.lengthDelimited)
			var272, var465 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var81 = var273
		elseif self.kind.type == "experience_emphasis_tile" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var81, 1002, protoModule.wireTypes.lengthDelimited)
			var275, var468 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var81 = var276
		elseif self.kind.type == "option_selector_carousel" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var81, 1100, protoModule.wireTypes.lengthDelimited)
			var278, var471 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var81 = var279
		elseif self.kind.type == "game_items_carousel" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var81, 1101, protoModule.wireTypes.lengthDelimited)
			var281, var474 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var81 = var282
		elseif self.kind.type == "hero_unit" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var81, 1102, protoModule.wireTypes.lengthDelimited)
			var284, var477 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var81 = var285
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var81, 1103, protoModule.wireTypes.lengthDelimited)
			var287, var480 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var81 = var288
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var289 = self.kind.value:encode()
			local var290, var291 = protoModule.writeTag(buff, var81, 1200, protoModule.wireTypes.lengthDelimited)
			var290, var483 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
			buff = var290
			var81 = var291
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var292 = self.kind.value:encode()
			local var293, var294 = protoModule.writeTag(buff, var81, 1300, protoModule.wireTypes.lengthDelimited)
			var293, var486 = protoModule.writeBuffer(var293, var294, var292, buffer.len(var292))
			buff = var293
			var81 = var294
		elseif self.kind.type == "community_announcement" then
			local var295 = self.kind.value:encode()
			local var296, var297 = protoModule.writeTag(buff, var81, 1400, protoModule.wireTypes.lengthDelimited)
			var296, var489 = protoModule.writeBuffer(var296, var297, var295, buffer.len(var295))
			buff = var296
			var81 = var297
		elseif self.kind.type == "group_announcement" then
			local var298 = self.kind.value:encode()
			local var299, var300 = protoModule.writeTag(buff, var81, 1401, protoModule.wireTypes.lengthDelimited)
			var299, var492 = protoModule.writeBuffer(var299, var300, var298, buffer.len(var298))
			buff = var299
			var81 = var300
		elseif self.kind.type == "settings_row" then
			local var301 = self.kind.value:encode()
			local var302, var303 = protoModule.writeTag(buff, var81, 1500, protoModule.wireTypes.lengthDelimited)
			var302, var495 = protoModule.writeBuffer(var302, var303, var301, buffer.len(var301))
			buff = var302
			var81 = var303
		elseif self.kind.type == "settings_toggle" then
			local var304 = self.kind.value:encode()
			local var305, var306 = protoModule.writeTag(buff, var81, 1501, protoModule.wireTypes.lengthDelimited)
			var305, var498 = protoModule.writeBuffer(var305, var306, var304, buffer.len(var304))
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
			error("Unsupported wire type: " .. var502)
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
		var247, var670 = protoModule.writeString(var247, var248, self.section_title)
		buff = var247
		var246 = var248
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var249 = v:encode()
			local var250, var251 = protoModule.writeTag(buff, var246, 2, protoModule.wireTypes.lengthDelimited)
			var250, var673 = protoModule.writeBuffer(var250, var251, var249, buffer.len(var249))
			buff = var250
			var246 = var251
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var252, var253 = protoModule.writeTag(buff, var246, 3, protoModule.wireTypes.lengthDelimited)
		var252, var675 = protoModule.writeString(var252, var253, self.collection_id)
		buff = var252
		var246 = var253
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var254, var255 = protoModule.writeTag(buff, var246, 4, protoModule.wireTypes.lengthDelimited)
		var254, var677 = protoModule.writeString(var254, var255, self.collection_position)
		buff = var254
		var246 = var255
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var256, var257 = protoModule.writeTag(buff, var246, 5, protoModule.wireTypes.lengthDelimited)
		var256, var679 = protoModule.writeString(var256, var257, self.universe_id)
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
			error("Unsupported wire type: " .. var683)
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
		var285, var713 = protoModule.writeString(var285, var286, self.badge_id)
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
			error("Unsupported wire type: " .. var717)
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
		var302, var737 = protoModule.writeString(var302, var303, self.badge_id)
		buff = var302
		var301 = var303
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var304, var305 = protoModule.writeTag(buff, var301, 2, protoModule.wireTypes.lengthDelimited)
		var304, var739 = protoModule.writeString(var304, var305, self.universe_id)
		buff = var304
		var301 = var305
	end
	if self.localized_literals ~= nil then
		local var306 = self.localized_literals:encode()
		local var307, var308 = protoModule.writeTag(buff, var301, 3, protoModule.wireTypes.lengthDelimited)
		var307, var742 = protoModule.writeBuffer(var307, var308, var306, buffer.len(var306))
		buff = var307
		var301 = var308
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var309, var310 = protoModule.writeTag(buff, var301, 4, protoModule.wireTypes.lengthDelimited)
		var309, var744 = protoModule.writeString(var309, var310, self.creator_key)
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
			error("Unsupported wire type: " .. var748)
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
		var326, var775 = protoModule.writeBuffer(var326, var327, var325, buffer.len(var325))
		buff = var326
		var324 = var327
	end
	if self.action_module ~= nil then
		local var328 = self.action_module:encode()
		local var329, var330 = protoModule.writeTag(buff, var324, 2, protoModule.wireTypes.lengthDelimited)
		var329, var778 = protoModule.writeBuffer(var329, var330, var328, buffer.len(var328))
		buff = var329
		var324 = var330
	end
	if self.overflow_menu ~= nil then
		local var331 = self.overflow_menu:encode()
		local var332, var333 = protoModule.writeTag(buff, var324, 3, protoModule.wireTypes.lengthDelimited)
		var332, var781 = protoModule.writeBuffer(var332, var333, var331, buffer.len(var331))
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
			error("Unsupported wire type: " .. var785)
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
		var346, var809 = protoModule.writeString(var346, var347, self.type_label)
		buff = var346
		var345 = var347
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var348, var349 = protoModule.writeTag(buff, var345, 2, protoModule.wireTypes.lengthDelimited)
		var348, var811 = protoModule.writeString(var348, var349, self.earned_label)
		buff = var348
		var345 = var349
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var350, var351 = protoModule.writeTag(buff, var345, 3, protoModule.wireTypes.lengthDelimited)
		var350, var813 = protoModule.writeString(var350, var351, self.updated_label)
		buff = var350
		var345 = var351
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var352, var353 = protoModule.writeTag(buff, var345, 4, protoModule.wireTypes.lengthDelimited)
		var352, var815 = protoModule.writeString(var352, var353, self.experience_label)
		buff = var352
		var345 = var353
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var354, var355 = protoModule.writeTag(buff, var345, 5, protoModule.wireTypes.lengthDelimited)
		var354, var817 = protoModule.writeString(var354, var355, self.rarity_label)
		buff = var354
		var345 = var355
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var356, var357 = protoModule.writeTag(buff, var345, 6, protoModule.wireTypes.lengthDelimited)
		var356, var819 = protoModule.writeString(var356, var357, self.won_yesterday_label)
		buff = var356
		var345 = var357
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var358, var359 = protoModule.writeTag(buff, var345, 7, protoModule.wireTypes.lengthDelimited)
		var358, var821 = protoModule.writeString(var358, var359, self.won_ever_label)
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
			error("Unsupported wire type: " .. var825)
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
		var375, var857 = protoModule.writeString(var375, var376, self.share)
		buff = var375
		var374 = var376
	end
	if self.report ~= nil and self.report ~= "" then
		local var377, var378 = protoModule.writeTag(buff, var374, 2, protoModule.wireTypes.lengthDelimited)
		var377, var859 = protoModule.writeString(var377, var378, self.report)
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
			error("Unsupported wire type: " .. var863)
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
		var394, var885 = protoModule.writeString(var394, var395, self.report)
		buff = var394
		var393 = var395
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var396, var397 = protoModule.writeTag(buff, var393, 2, protoModule.wireTypes.lengthDelimited)
		var396, var887 = protoModule.writeString(var396, var397, self.remove)
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
			error("Unsupported wire type: " .. var891)
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
			error("Unsupported wire type: " .. var917)
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
		var428, var929 = protoModule.writeString(var428, var429, self.universe_id)
		buff = var428
		var427 = var429
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var430, var431 = protoModule.writeTag(buff, var427, 2, protoModule.wireTypes.lengthDelimited)
		var430, var931 = protoModule.writeString(var430, var431, self.creator_key)
		buff = var430
		var427 = var431
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var432, var433 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var432, var933 = protoModule.writeString(var432, var433, i)
			local var434 = v:encode()
			var433, var935 = protoModule.writeTag(var432, var433, 2, protoModule.wireTypes.lengthDelimited)
			var433, var935 = protoModule.writeBuffer(var433, var935, var434, buffer.len(var434))
			local var435 = var433
			local var436 = var935
			local var437, var438 = protoModule.writeTag(buff, var427, 3, protoModule.wireTypes.lengthDelimited)
			var437, var939 = protoModule.writeBuffer(var437, var438, var435, var436)
			buff = var437
			var427 = var438
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var439, var440 = protoModule.writeTag(buff, var427, 4, protoModule.wireTypes.lengthDelimited)
			var439, var941 = protoModule.writeString(var439, var440, v)
			buff = var439
			var427 = var440
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var441, var442 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var441, var943 = protoModule.writeString(var441, var442, i)
			local var443 = v:encode()
			var442, var945 = protoModule.writeTag(var441, var442, 2, protoModule.wireTypes.lengthDelimited)
			var442, var945 = protoModule.writeBuffer(var442, var945, var443, buffer.len(var443))
			local var444 = var442
			local var445 = var945
			local var446, var447 = protoModule.writeTag(buff, var427, 5, protoModule.wireTypes.lengthDelimited)
			var446, var949 = protoModule.writeBuffer(var446, var447, var444, var445)
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
			error("Unsupported wire type: " .. var953)
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
		var475, var990 = protoModule.writeString(var475, var476, self.key)
		buff = var475
		var474 = var476
	end
	if self.value ~= nil then
		local var477 = self.value:encode()
		local var478, var479 = protoModule.writeTag(buff, var474, 2, protoModule.wireTypes.lengthDelimited)
		var478, var993 = protoModule.writeBuffer(var478, var479, var477, buffer.len(var477))
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
			error("Unsupported wire type: " .. var997)
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
		var494, var1019 = protoModule.writeString(var494, var495, self.key)
		buff = var494
		var493 = var495
	end
	if self.value ~= nil then
		local var496 = self.value:encode()
		local var497, var498 = protoModule.writeTag(buff, var493, 2, protoModule.wireTypes.lengthDelimited)
		var497, var1022 = protoModule.writeBuffer(var497, var498, var496, buffer.len(var496))
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
			error("Unsupported wire type: " .. var1026)
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
			var513, var1048 = protoModule.writeString(var513, var514, v)
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
			error("Unsupported wire type: " .. var1052)
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
		var534, var1074 = protoModule.writeString(var534, var535, self.universe_id)
		buff = var534
		var533 = var535
	end
	if self.user_owns_experience then
		local var536, var537 = protoModule.writeTag(buff, var533, 2, protoModule.wireTypes.varint)
		var536, var1076 = protoModule.writeVarInt(var536, var537, if self.user_owns_experience then 1 else 0)
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
			error("Unsupported wire type: " .. var1080)
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
		var553, var1102 = protoModule.writeString(var553, var554, self.media_asset_id)
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
			error("Unsupported wire type: " .. var1106)
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
		var570, var1126 = protoModule.writeString(var570, var571, self.universe_id)
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
			error("Unsupported wire type: " .. var1130)
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
		var587, var1150 = protoModule.writeString(var587, var588, self.universe_id)
		buff = var587
		var586 = var588
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var589, var590 = protoModule.writeTag(buff, var586, 2, protoModule.wireTypes.lengthDelimited)
		var589, var1152 = protoModule.writeString(var589, var590, self.creator_key)
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
			error("Unsupported wire type: " .. var1156)
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
		var606, var1178 = protoModule.writeString(var606, var607, self.universe_id)
		buff = var606
		var605 = var607
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var608, var609 = protoModule.writeTag(buff, var605, 2, protoModule.wireTypes.lengthDelimited)
		var608, var1180 = protoModule.writeString(var608, var609, self.root_place_id)
		buff = var608
		var605 = var609
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var610, var611 = protoModule.writeTag(buff, var605, 3, protoModule.wireTypes.lengthDelimited)
		var610, var1182 = protoModule.writeString(var610, var611, self.connection_played_display_name)
		buff = var610
		var605 = var611
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var612, var613 = protoModule.writeTag(buff, var605, 4, protoModule.wireTypes.lengthDelimited)
		var612, var1184 = protoModule.writeString(var612, var613, self.upsell_prompt)
		buff = var612
		var605 = var613
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var614 = v:encode()
			local var615, var616 = protoModule.writeTag(buff, var605, 5, protoModule.wireTypes.lengthDelimited)
			var615, var1187 = protoModule.writeBuffer(var615, var616, var614, buffer.len(var614))
			buff = var615
			var605 = var616
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var617, var618 = protoModule.writeTag(buff, var605, 6, protoModule.wireTypes.varint)
		var617, var1189 = protoModule.writeVarInt(var617, var618, self.connection_played_num_others)
		buff = var617
		var605 = var618
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var619, var620 = protoModule.writeTag(buff, var605, 7, protoModule.wireTypes.varint)
		var619, var1191 = protoModule.writeVarInt(var619, var620, self.connection_played_total_count)
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
			error("Unsupported wire type: " .. var1195)
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
		var652, var1230 = protoModule.writeString(var652, var653, self.user_id)
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
			error("Unsupported wire type: " .. var1234)
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
			var670, var1255 = protoModule.writeBuffer(var670, var671, var669, buffer.len(var669))
			buff = var670
			var668 = var671
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var672, var673 = protoModule.writeTag(buff, var668, 2, protoModule.wireTypes.lengthDelimited)
		var672, var1257 = protoModule.writeString(var672, var673, self.universe_id)
		buff = var672
		var668 = var673
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var674, var675 = protoModule.writeTag(buff, var668, 3, protoModule.wireTypes.lengthDelimited)
		var674, var1259 = protoModule.writeString(var674, var675, self.place_id)
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
			error("Unsupported wire type: " .. var1263)
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
		media_asset_id = if p25 == nil or p25.media_asset_id == nil then "" else p25.media_asset_id,
		moment_video_playback = if p25 == nil or p25.moment_video_playback == nil then nil else p25.moment_video_playback,
		attribution_user_id = if p25 == nil or p25.attribution_user_id == nil then "" else p25.attribution_user_id
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var698 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var699, var700 = protoModule.writeTag(buff, var698, 1, protoModule.wireTypes.lengthDelimited)
		var699, var1290 = protoModule.writeString(var699, var700, self.media_asset_id)
		buff = var699
		var698 = var700
	end
	if self.moment_video_playback ~= nil then
		local var701 = self.moment_video_playback:encode()
		local var702, var703 = protoModule.writeTag(buff, var698, 2, protoModule.wireTypes.lengthDelimited)
		var702, var1293 = protoModule.writeBuffer(var702, var703, var701, buffer.len(var701))
		buff = var702
		var698 = var703
	end
	if self.attribution_user_id ~= nil and self.attribution_user_id ~= "" then
		local var704, var705 = protoModule.writeTag(buff, var698, 3, protoModule.wireTypes.lengthDelimited)
		var704, var1295 = protoModule.writeString(var704, var705, self.attribution_user_id)
		buff = var704
		var698 = var705
	end
	local buff_1 = buffer.create(var698)
	buffer.copy(buff_1, 0, buff, 0, var698)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
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
			elseif var704 == 2 then
				local _ = nil
				local var709, var710 = protoModule.readBuffer(p25, var699)
				var699 = var710
				var698.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.decode(var709)
			elseif var704 == 3 then
				local _ = nil
				local var711, var712 = protoModule.readBuffer(p25, var699)
				var699 = var712
				var698.attribution_user_id = buffer.tostring(var711)
			else
				local _ = nil
				local var713, var714 = protoModule.readVarInt(p25, var699)
				var699 = var714 + var713
			end
		elseif var700 == protoModule.wireTypes.i32 then
			local _ = nil
			local var715, var716 = protoModule.readFixed32(p25, var699)
			local _ = var715
			var699 = var716
		elseif var700 == protoModule.wireTypes.i64 then
			local _ = nil
			local var717, var718 = protoModule.readFixed64(p25, var699)
			local _ = var717
			var699 = var718
		else
			error("Unsupported wire type: " .. var1299)
		end
	end
	return var698
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
	local var719 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var719.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var719.media_asset_id = self.mediaAssetId
	end
	if self.moment_video_playback ~= nil then
		var719.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		var719.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	if self.attribution_user_id ~= nil then
		var719.attribution_user_id = self.attribution_user_id
	end
	if self.attributionUserId ~= nil then
		var719.attribution_user_id = self.attributionUserId
	end
	return var719
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
	local var719 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var720, var721 = protoModule.writeTag(buff, var719, 1, protoModule.wireTypes.lengthDelimited)
		var720, var1323 = protoModule.writeString(var720, var721, self.asset_id)
		buff = var720
		var719 = var721
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local var722, var723 = protoModule.writeTag(buff, var719, 2, protoModule.wireTypes.lengthDelimited)
		var722, var1325 = protoModule.writeString(var722, var723, self.asset_access_context)
		buff = var722
		var719 = var723
	end
	local buff_1 = buffer.create(var719)
	buffer.copy(buff_1, 0, buff, 0, var719)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var719 = t_26.new()
	local var720 = 0
	while var720 < buffer.len(p26) do
		local _ = nil
		local var721 = nil
		local var722, var723, var724 = protoModule.readTag(p26, var720)
		local var725 = var722
		var721 = var723
		var720 = var724
		
		if var721 == protoModule.wireTypes.varint then
			local _ = nil
			local var726, var727 = protoModule.readVarInt(p26, var720)
			local _ = var726
			var720 = var727
			continue
		end
		if var721 == protoModule.wireTypes.lengthDelimited then
			if var725 == 1 then
				local _ = nil
				local var728, var729 = protoModule.readBuffer(p26, var720)
				var720 = var729
				var719.asset_id = buffer.tostring(var728)
			elseif var725 == 2 then
				local _ = nil
				local var730, var731 = protoModule.readBuffer(p26, var720)
				var720 = var731
				var719.asset_access_context = buffer.tostring(var730)
			else
				local _ = nil
				local var732, var733 = protoModule.readVarInt(p26, var720)
				var720 = var733 + var732
			end
		elseif var721 == protoModule.wireTypes.i32 then
			local _ = nil
			local var734, var735 = protoModule.readFixed32(p26, var720)
			local _ = var734
			var720 = var735
		elseif var721 == protoModule.wireTypes.i64 then
			local _ = nil
			local var736, var737 = protoModule.readFixed64(p26, var720)
			local _ = var736
			var720 = var737
		else
			error("Unsupported wire type: " .. var1329)
		end
	end
	return var719
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
	local var738 = t_26.new()
	
	if self.asset_id ~= nil then
		var738.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var738.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		var738.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		var738.asset_access_context = self.assetAccessContext
	end
	return var738
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
	local var738 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var739, var740 = protoModule.writeTag(buff, var738, 1, protoModule.wireTypes.lengthDelimited)
		var739, var1351 = protoModule.writeString(var739, var740, self.universe_id)
		buff = var739
		var738 = var740
	end
	local buff_1 = buffer.create(var738)
	buffer.copy(buff_1, 0, buff, 0, var738)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var738 = t_27.new()
	local var739 = 0
	while var739 < buffer.len(p27) do
		local _ = nil
		local var740 = nil
		local var741, var742, var743 = protoModule.readTag(p27, var739)
		local var744 = var741
		var740 = var742
		var739 = var743
		
		if var740 == protoModule.wireTypes.varint then
			local _ = nil
			local var745, var746 = protoModule.readVarInt(p27, var739)
			local _ = var745
			var739 = var746
			continue
		end
		if var740 == protoModule.wireTypes.lengthDelimited then
			if var744 == 1 then
				local _ = nil
				local var747, var748 = protoModule.readBuffer(p27, var739)
				var739 = var748
				var738.universe_id = buffer.tostring(var747)
			else
				local _ = nil
				local var749, var750 = protoModule.readVarInt(p27, var739)
				var739 = var750 + var749
			end
		elseif var740 == protoModule.wireTypes.i32 then
			local _ = nil
			local var751, var752 = protoModule.readFixed32(p27, var739)
			local _ = var751
			var739 = var752
		elseif var740 == protoModule.wireTypes.i64 then
			local _ = nil
			local var753, var754 = protoModule.readFixed64(p27, var739)
			local _ = var753
			var739 = var754
		else
			error("Unsupported wire type: " .. var1355)
		end
	end
	return var738
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
	local var755 = t_27.new()
	
	if self.universe_id ~= nil then
		var755.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var755.universe_id = self.universeId
	end
	return var755
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
	local var755 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var756, var757 = protoModule.writeTag(buff, var755, 1, protoModule.wireTypes.lengthDelimited)
		var756, var1375 = protoModule.writeString(var756, var757, self.universe_id)
		buff = var756
		var755 = var757
	end
	local buff_1 = buffer.create(var755)
	buffer.copy(buff_1, 0, buff, 0, var755)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var755 = t_28.new()
	local var756 = 0
	while var756 < buffer.len(p28) do
		local _ = nil
		local var757 = nil
		local var758, var759, var760 = protoModule.readTag(p28, var756)
		local var761 = var758
		var757 = var759
		var756 = var760
		
		if var757 == protoModule.wireTypes.varint then
			local _ = nil
			local var762, var763 = protoModule.readVarInt(p28, var756)
			local _ = var762
			var756 = var763
			continue
		end
		if var757 == protoModule.wireTypes.lengthDelimited then
			if var761 == 1 then
				local _ = nil
				local var764, var765 = protoModule.readBuffer(p28, var756)
				var756 = var765
				var755.universe_id = buffer.tostring(var764)
			else
				local _ = nil
				local var766, var767 = protoModule.readVarInt(p28, var756)
				var756 = var767 + var766
			end
		elseif var757 == protoModule.wireTypes.i32 then
			local _ = nil
			local var768, var769 = protoModule.readFixed32(p28, var756)
			local _ = var768
			var756 = var769
		elseif var757 == protoModule.wireTypes.i64 then
			local _ = nil
			local var770, var771 = protoModule.readFixed64(p28, var756)
			local _ = var770
			var756 = var771
		else
			error("Unsupported wire type: " .. var1379)
		end
	end
	return var755
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
	local var772 = t_28.new()
	
	if self.universe_id ~= nil then
		var772.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var772.universe_id = self.universeId
	end
	return var772
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
	local var772 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var773, var774 = protoModule.writeTag(buff, var772, 1, protoModule.wireTypes.lengthDelimited)
		var773, var1399 = protoModule.writeString(var773, var774, self.universe_id)
		buff = var773
		var772 = var774
	end
	if self.has_store_items then
		local var775, var776 = protoModule.writeTag(buff, var772, 2, protoModule.wireTypes.varint)
		var775, var1401 = protoModule.writeVarInt(var775, var776, if self.has_store_items then 1 else 0)
		buff = var775
		var772 = var776
	end
	if self.has_badges then
		local var777, var778 = protoModule.writeTag(buff, var772, 3, protoModule.wireTypes.varint)
		var777, var1403 = protoModule.writeVarInt(var777, var778, if self.has_badges then 1 else 0)
		buff = var777
		var772 = var778
	end
	if self.has_game_passes then
		local var779, var780 = protoModule.writeTag(buff, var772, 4, protoModule.wireTypes.varint)
		var779, var1405 = protoModule.writeVarInt(var779, var780, if self.has_game_passes then 1 else 0)
		buff = var779
		var772 = var780
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var781, var782 = protoModule.writeTag(buff, var772, 5, protoModule.wireTypes.lengthDelimited)
		var781, var1407 = protoModule.writeString(var781, var782, self.community_id)
		buff = var781
		var772 = var782
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
			if var778 == 2 then
				local _ = nil
				local var779, var780 = protoModule.readVarInt(p29, var773)
				var773 = var780
				var772.has_store_items = var779 ~= 0
			elseif var778 == 3 then
				local _ = nil
				local var781, var782 = protoModule.readVarInt(p29, var773)
				var773 = var782
				var772.has_badges = var781 ~= 0
			elseif var778 == 4 then
				local _ = nil
				local var783, var784 = protoModule.readVarInt(p29, var773)
				var773 = var784
				var772.has_game_passes = var783 ~= 0
			else
				local _ = nil
				local var785, var786 = protoModule.readVarInt(p29, var773)
				local _ = var785
				var773 = var786
			end
		end
		if var774 == protoModule.wireTypes.lengthDelimited then
			if var778 == 1 then
				local _ = nil
				local var787, var788 = protoModule.readBuffer(p29, var773)
				var773 = var788
				var772.universe_id = buffer.tostring(var787)
			elseif var778 == 5 then
				local _ = nil
				local var789, var790 = protoModule.readBuffer(p29, var773)
				var773 = var790
				var772.community_id = buffer.tostring(var789)
			else
				local _ = nil
				local var791, var792 = protoModule.readVarInt(p29, var773)
				var773 = var792 + var791
			end
		elseif var774 == protoModule.wireTypes.i32 then
			local _ = nil
			local var793, var794 = protoModule.readFixed32(p29, var773)
			local _ = var793
			var773 = var794
		elseif var774 == protoModule.wireTypes.i64 then
			local _ = nil
			local var795, var796 = protoModule.readFixed64(p29, var773)
			local _ = var795
			var773 = var796
		else
			error("Unsupported wire type: " .. var1411)
		end
	end
	return var772
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
	local var797 = t_29.new()
	
	if self.universe_id ~= nil then
		var797.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var797.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var797.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var797.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var797.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var797.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var797.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var797.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var797.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var797.community_id = self.communityId
	end
	return var797
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
	local var797 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var798, var799 = protoModule.writeTag(buff, var797, 1, protoModule.wireTypes.lengthDelimited)
		var798, var1439 = protoModule.writeString(var798, var799, self.universe_id)
		buff = var798
		var797 = var799
	end
	local buff_1 = buffer.create(var797)
	buffer.copy(buff_1, 0, buff, 0, var797)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var797 = t_30.new()
	local var798 = 0
	while var798 < buffer.len(p30) do
		local _ = nil
		local var799 = nil
		local var800, var801, var802 = protoModule.readTag(p30, var798)
		local var803 = var800
		var799 = var801
		var798 = var802
		
		if var799 == protoModule.wireTypes.varint then
			local _ = nil
			local var804, var805 = protoModule.readVarInt(p30, var798)
			local _ = var804
			var798 = var805
			continue
		end
		if var799 == protoModule.wireTypes.lengthDelimited then
			if var803 == 1 then
				local _ = nil
				local var806, var807 = protoModule.readBuffer(p30, var798)
				var798 = var807
				var797.universe_id = buffer.tostring(var806)
			else
				local _ = nil
				local var808, var809 = protoModule.readVarInt(p30, var798)
				var798 = var809 + var808
			end
		elseif var799 == protoModule.wireTypes.i32 then
			local _ = nil
			local var810, var811 = protoModule.readFixed32(p30, var798)
			local _ = var810
			var798 = var811
		elseif var799 == protoModule.wireTypes.i64 then
			local _ = nil
			local var812, var813 = protoModule.readFixed64(p30, var798)
			local _ = var812
			var798 = var813
		else
			error("Unsupported wire type: " .. var1443)
		end
	end
	return var797
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
	local var814 = t_30.new()
	
	if self.universe_id ~= nil then
		var814.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var814.universe_id = self.universeId
	end
	return var814
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
	local var814 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var815, var816 = protoModule.writeTag(buff, var814, 1, protoModule.wireTypes.lengthDelimited)
		var815, var1463 = protoModule.writeString(var815, var816, self.universe_id)
		buff = var815
		var814 = var816
	end
	if self.user_owns_experience then
		local var817, var818 = protoModule.writeTag(buff, var814, 2, protoModule.wireTypes.varint)
		var817, var1465 = protoModule.writeVarInt(var817, var818, if self.user_owns_experience then 1 else 0)
		buff = var817
		var814 = var818
	end
	local buff_1 = buffer.create(var814)
	buffer.copy(buff_1, 0, buff, 0, var814)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var814 = t_31.new()
	local var815 = 0
	while var815 < buffer.len(p31) do
		local _ = nil
		local var816 = nil
		local var817, var818, var819 = protoModule.readTag(p31, var815)
		local var820 = var817
		var816 = var818
		var815 = var819
		
		if var816 == protoModule.wireTypes.varint then
			if var820 == 2 then
				local _ = nil
				local var821, var822 = protoModule.readVarInt(p31, var815)
				var815 = var822
				var814.user_owns_experience = var821 ~= 0
			else
				local _ = nil
				local var823, var824 = protoModule.readVarInt(p31, var815)
				local _ = var823
				var815 = var824
			end
		end
		if var816 == protoModule.wireTypes.lengthDelimited then
			if var820 == 1 then
				local _ = nil
				local var825, var826 = protoModule.readBuffer(p31, var815)
				var815 = var826
				var814.universe_id = buffer.tostring(var825)
			else
				local _ = nil
				local var827, var828 = protoModule.readVarInt(p31, var815)
				var815 = var828 + var827
			end
		elseif var816 == protoModule.wireTypes.i32 then
			local _ = nil
			local var829, var830 = protoModule.readFixed32(p31, var815)
			local _ = var829
			var815 = var830
		elseif var816 == protoModule.wireTypes.i64 then
			local _ = nil
			local var831, var832 = protoModule.readFixed64(p31, var815)
			local _ = var831
			var815 = var832
		else
			error("Unsupported wire type: " .. var1469)
		end
	end
	return var814
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
	local var833 = t_31.new()
	
	if self.universe_id ~= nil then
		var833.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var833.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var833.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var833.user_owns_experience = self.userOwnsExperience
	end
	return var833
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
	local var833 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var834, var835 = protoModule.writeTag(buff, var833, 1, protoModule.wireTypes.lengthDelimited)
		var834, var1491 = protoModule.writeString(var834, var835, self.universe_id)
		buff = var834
		var833 = var835
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var836, var837 = protoModule.writeTag(buff, var833, 2, protoModule.wireTypes.lengthDelimited)
		var836, var1493 = protoModule.writeString(var836, var837, self.place_id)
		buff = var836
		var833 = var837
	end
	if self.product_id ~= nil and self.product_id ~= "" then
		local var838, var839 = protoModule.writeTag(buff, var833, 3, protoModule.wireTypes.lengthDelimited)
		var838, var1495 = protoModule.writeString(var838, var839, self.product_id)
		buff = var838
		var833 = var839
	end
	if self.product_image_asset_id ~= nil and self.product_image_asset_id ~= "" then
		local var840, var841 = protoModule.writeTag(buff, var833, 4, protoModule.wireTypes.lengthDelimited)
		var840, var1497 = protoModule.writeString(var840, var841, self.product_image_asset_id)
		buff = var840
		var833 = var841
	end
	if self.product_name ~= nil and self.product_name ~= "" then
		local var842, var843 = protoModule.writeTag(buff, var833, 5, protoModule.wireTypes.lengthDelimited)
		var842, var1499 = protoModule.writeString(var842, var843, self.product_name)
		buff = var842
		var833 = var843
	end
	if self.variant_id ~= nil and self.variant_id ~= "" then
		local var844, var845 = protoModule.writeTag(buff, var833, 6, protoModule.wireTypes.lengthDelimited)
		var844, var1501 = protoModule.writeString(var844, var845, self.variant_id)
		buff = var844
		var833 = var845
	end
	local buff_1 = buffer.create(var833)
	buffer.copy(buff_1, 0, buff, 0, var833)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var833 = t_32.new()
	local var834 = 0
	while var834 < buffer.len(p32) do
		local _ = nil
		local var835 = nil
		local var836, var837, var838 = protoModule.readTag(p32, var834)
		local var839 = var836
		var835 = var837
		var834 = var838
		
		if var835 == protoModule.wireTypes.varint then
			local _ = nil
			local var840, var841 = protoModule.readVarInt(p32, var834)
			local _ = var840
			var834 = var841
			continue
		end
		if var835 == protoModule.wireTypes.lengthDelimited then
			if var839 == 1 then
				local _ = nil
				local var842, var843 = protoModule.readBuffer(p32, var834)
				var834 = var843
				var833.universe_id = buffer.tostring(var842)
			elseif var839 == 2 then
				local _ = nil
				local var844, var845 = protoModule.readBuffer(p32, var834)
				var834 = var845
				var833.place_id = buffer.tostring(var844)
			elseif var839 == 3 then
				local _ = nil
				local var846, var847 = protoModule.readBuffer(p32, var834)
				var834 = var847
				var833.product_id = buffer.tostring(var846)
			elseif var839 == 4 then
				local _ = nil
				local var848, var849 = protoModule.readBuffer(p32, var834)
				var834 = var849
				var833.product_image_asset_id = buffer.tostring(var848)
			elseif var839 == 5 then
				local _ = nil
				local var850, var851 = protoModule.readBuffer(p32, var834)
				var834 = var851
				var833.product_name = buffer.tostring(var850)
			elseif var839 == 6 then
				local _ = nil
				local var852, var853 = protoModule.readBuffer(p32, var834)
				var834 = var853
				var833.variant_id = buffer.tostring(var852)
			else
				local _ = nil
				local var854, var855 = protoModule.readVarInt(p32, var834)
				var834 = var855 + var854
			end
		elseif var835 == protoModule.wireTypes.i32 then
			local _ = nil
			local var856, var857 = protoModule.readFixed32(p32, var834)
			local _ = var856
			var834 = var857
		elseif var835 == protoModule.wireTypes.i64 then
			local _ = nil
			local var858, var859 = protoModule.readFixed64(p32, var834)
			local _ = var858
			var834 = var859
		else
			error("Unsupported wire type: " .. var1505)
		end
	end
	return var833
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
	local var860 = t_32.new()
	
	if self.universe_id ~= nil then
		var860.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var860.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var860.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var860.place_id = self.placeId
	end
	if self.product_id ~= nil then
		var860.product_id = self.product_id
	end
	if self.productId ~= nil then
		var860.product_id = self.productId
	end
	if self.product_image_asset_id ~= nil then
		var860.product_image_asset_id = self.product_image_asset_id
	end
	if self.productImageAssetId ~= nil then
		var860.product_image_asset_id = self.productImageAssetId
	end
	if self.product_name ~= nil then
		var860.product_name = self.product_name
	end
	if self.productName ~= nil then
		var860.product_name = self.productName
	end
	if self.variant_id ~= nil then
		var860.variant_id = self.variant_id
	end
	if self.variantId ~= nil then
		var860.variant_id = self.variantId
	end
	return var860
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
	local var860 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var861, var862 = protoModule.writeTag(buff, var860, 1, protoModule.wireTypes.lengthDelimited)
		var861, var1535 = protoModule.writeString(var861, var862, self.community_id)
		buff = var861
		var860 = var862
	end
	local buff_1 = buffer.create(var860)
	buffer.copy(buff_1, 0, buff, 0, var860)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref)
	local var860 = t_33.new()
	local var861 = 0
	while var861 < buffer.len(p33) do
		local _ = nil
		local var862 = nil
		local var863, var864, var865 = protoModule.readTag(p33, var861)
		local var866 = var863
		var862 = var864
		var861 = var865
		
		if var862 == protoModule.wireTypes.varint then
			local _ = nil
			local var867, var868 = protoModule.readVarInt(p33, var861)
			local _ = var867
			var861 = var868
			continue
		end
		if var862 == protoModule.wireTypes.lengthDelimited then
			if var866 == 1 then
				local _ = nil
				local var869, var870 = protoModule.readBuffer(p33, var861)
				var861 = var870
				var860.community_id = buffer.tostring(var869)
			else
				local _ = nil
				local var871, var872 = protoModule.readVarInt(p33, var861)
				var861 = var872 + var871
			end
		elseif var862 == protoModule.wireTypes.i32 then
			local _ = nil
			local var873, var874 = protoModule.readFixed32(p33, var861)
			local _ = var873
			var861 = var874
		elseif var862 == protoModule.wireTypes.i64 then
			local _ = nil
			local var875, var876 = protoModule.readFixed64(p33, var861)
			local _ = var875
			var861 = var876
		else
			error("Unsupported wire type: " .. var1539)
		end
	end
	return var860
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
	local var877 = t_33.new()
	
	if self.community_id ~= nil then
		var877.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var877.community_id = self.communityId
	end
	return var877
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
	local var877 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var878 = v:encode()
			local var879, var880 = protoModule.writeTag(buff, var877, 1, protoModule.wireTypes.lengthDelimited)
			var879, var1560 = protoModule.writeBuffer(var879, var880, var878, buffer.len(var878))
			buff = var879
			var877 = var880
		end
	end
	local buff_1 = buffer.create(var877)
	buffer.copy(buff_1, 0, buff, 0, var877)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var881 = t_34.new()
	local var882 = 0
	while var882 < buffer.len(p34) do
		local _ = nil
		local var883 = nil
		local var884, var885, var886 = protoModule.readTag(p34, var882)
		local var887 = var884
		var883 = var885
		var882 = var886
		
		if var883 == protoModule.wireTypes.varint then
			local _ = nil
			local var888, var889 = protoModule.readVarInt(p34, var882)
			local _ = var888
			var882 = var889
			continue
		end
		if var883 == protoModule.wireTypes.lengthDelimited then
			if var887 == 1 then
				local _ = nil
				local var890, var891 = protoModule.readBuffer(p34, var882)
				var882 = var891
				table.insert(var881.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var890))
			else
				local _ = nil
				local var892, var893 = protoModule.readVarInt(p34, var882)
				var882 = var893 + var892
			end
		elseif var883 == protoModule.wireTypes.i32 then
			local _ = nil
			local var894, var895 = protoModule.readFixed32(p34, var882)
			local _ = var894
			var882 = var895
		elseif var883 == protoModule.wireTypes.i64 then
			local _ = nil
			local var896, var897 = protoModule.readFixed64(p34, var882)
			local _ = var896
			var882 = var897
		else
			error("Unsupported wire type: " .. var1564)
		end
	end
	return var881
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
	local var898 = t_34.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var898.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var898.social_link_items = t_1
	end
	return var898
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
	local var899 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var900, var901 = protoModule.writeTag(buff, var899, 1, protoModule.wireTypes.lengthDelimited)
		var900, var1587 = protoModule.writeString(var900, var901, self.social_link_id)
		buff = var900
		var899 = var901
	end
	local buff_1 = buffer.create(var899)
	buffer.copy(buff_1, 0, buff, 0, var899)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref)
	local var899 = t_35.new()
	local var900 = 0
	while var900 < buffer.len(p35) do
		local _ = nil
		local var901 = nil
		local var902, var903, var904 = protoModule.readTag(p35, var900)
		local var905 = var902
		var901 = var903
		var900 = var904
		
		if var901 == protoModule.wireTypes.varint then
			local _ = nil
			local var906, var907 = protoModule.readVarInt(p35, var900)
			local _ = var906
			var900 = var907
			continue
		end
		if var901 == protoModule.wireTypes.lengthDelimited then
			if var905 == 1 then
				local _ = nil
				local var908, var909 = protoModule.readBuffer(p35, var900)
				var900 = var909
				var899.social_link_id = buffer.tostring(var908)
			else
				local _ = nil
				local var910, var911 = protoModule.readVarInt(p35, var900)
				var900 = var911 + var910
			end
		elseif var901 == protoModule.wireTypes.i32 then
			local _ = nil
			local var912, var913 = protoModule.readFixed32(p35, var900)
			local _ = var912
			var900 = var913
		elseif var901 == protoModule.wireTypes.i64 then
			local _ = nil
			local var914, var915 = protoModule.readFixed64(p35, var900)
			local _ = var914
			var900 = var915
		else
			error("Unsupported wire type: " .. var1591)
		end
	end
	return var899
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
	local var916 = t_35.new()
	
	if self.social_link_id ~= nil then
		var916.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var916.social_link_id = self.socialLinkId
	end
	return var916
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
	local var916 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var917, var918 = protoModule.writeTag(buff, var916, 1, protoModule.wireTypes.lengthDelimited)
		var917, var1611 = protoModule.writeString(var917, var918, self.title)
		buff = var917
		var916 = var918
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var919 = v:encode()
			local var920, var921 = protoModule.writeTag(buff, var916, 2, protoModule.wireTypes.lengthDelimited)
			var920, var1614 = protoModule.writeBuffer(var920, var921, var919, buffer.len(var919))
			buff = var920
			var916 = var921
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var922, var923 = protoModule.writeTag(buff, var916, 3, protoModule.wireTypes.lengthDelimited)
		var922, var1616 = protoModule.writeString(var922, var923, self.next_page_token)
		buff = var922
		var916 = var923
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var924, var925 = protoModule.writeTag(buff, var916, 4, protoModule.wireTypes.lengthDelimited)
		var924, var1618 = protoModule.writeString(var924, var925, self.sort_id)
		buff = var924
		var916 = var925
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var926, var927 = protoModule.writeTag(buff, var916, 5, protoModule.wireTypes.varint)
		var926, var1620 = protoModule.writeVarInt(var926, var927, self.secondary_sort_id)
		buff = var926
		var916 = var927
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var928, var929 = protoModule.writeTag(buff, var916, 6, protoModule.wireTypes.varint)
		var928, var1622 = protoModule.writeVarInt(var928, var929, self.max_visible_rows)
		buff = var928
		var916 = var929
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var930, var931 = protoModule.writeTag(buff, var916, 7, protoModule.wireTypes.lengthDelimited)
		var930, var1624 = protoModule.writeString(var930, var931, self.subtitle)
		buff = var930
		var916 = var931
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var932, var933 = protoModule.writeTag(buff, var916, 8, protoModule.wireTypes.lengthDelimited)
		var932, var1626 = protoModule.writeString(var932, var933, self.info_text)
		buff = var932
		var916 = var933
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var934, var935 = protoModule.writeTag(buff, var916, 9, protoModule.wireTypes.lengthDelimited)
		var934, var1628 = protoModule.writeString(var934, var935, self.subtitle_link_path)
		buff = var934
		var916 = var935
	end
	if self.is_placeholder ~= nil then
		local var936, var937 = protoModule.writeTag(buff, var916, 10, protoModule.wireTypes.varint)
		var936, var1630 = protoModule.writeVarInt(var936, var937, if self.is_placeholder then 1 else 0)
		buff = var936
		var916 = var937
	end
	if self.primary_sort_id ~= nil then
		local var938, var939 = protoModule.writeTag(buff, var916, 11, protoModule.wireTypes.varint)
		var938, var1632 = protoModule.writeVarInt(var938, var939, self.primary_sort_id)
		buff = var938
		var916 = var939
	end
	if self.applied_filters ~= nil then
		local var940, var941 = protoModule.writeTag(buff, var916, 12, protoModule.wireTypes.lengthDelimited)
		var940, var1634 = protoModule.writeString(var940, var941, self.applied_filters)
		buff = var940
		var916 = var941
	end
	if self.pool_id ~= nil then
		local var942, var943 = protoModule.writeTag(buff, var916, 13, protoModule.wireTypes.lengthDelimited)
		var942, var1636 = protoModule.writeString(var942, var943, self.pool_id)
		buff = var942
		var916 = var943
	end
	if self.has_emphasized_tile then
		local var944, var945 = protoModule.writeTag(buff, var916, 14, protoModule.wireTypes.varint)
		var944, var1638 = protoModule.writeVarInt(var944, var945, if self.has_emphasized_tile then 1 else 0)
		buff = var944
		var916 = var945
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var946, var947 = protoModule.writeTag(buff, var916, 15, protoModule.wireTypes.lengthDelimited)
		var946, var1640 = protoModule.writeString(var946, var947, self.tile_activation_mode)
		buff = var946
		var916 = var947
	end
	if self.initial_feed_visible_rows ~= nil then
		local var948, var949 = protoModule.writeTag(buff, var916, 16, protoModule.wireTypes.varint)
		var948, var1642 = protoModule.writeVarInt(var948, var949, self.initial_feed_visible_rows)
		buff = var948
		var916 = var949
	end
	if self.visible_rows_per_reveal ~= nil then
		local var950, var951 = protoModule.writeTag(buff, var916, 17, protoModule.wireTypes.varint)
		var950, var1644 = protoModule.writeVarInt(var950, var951, self.visible_rows_per_reveal)
		buff = var950
		var916 = var951
	end
	if self.sponsored_user_cohort ~= nil then
		local var952, var953 = protoModule.writeTag(buff, var916, 18, protoModule.wireTypes.lengthDelimited)
		var952, var1646 = protoModule.writeString(var952, var953, self.sponsored_user_cohort)
		buff = var952
		var916 = var953
	end
	if self.anchor_tag ~= nil then
		local var954, var955 = protoModule.writeTag(buff, var916, 19, protoModule.wireTypes.lengthDelimited)
		var954, var1648 = protoModule.writeString(var954, var955, self.anchor_tag)
		buff = var954
		var916 = var955
	end
	if self.collection_item_size ~= nil then
		local var956, var957 = protoModule.writeTag(buff, var916, 20, protoModule.wireTypes.lengthDelimited)
		var956, var1650 = protoModule.writeString(var956, var957, self.collection_item_size)
		buff = var956
		var916 = var957
	end
	if self.sort_sub_id ~= nil then
		local var958, var959 = protoModule.writeTag(buff, var916, 21, protoModule.wireTypes.lengthDelimited)
		var958, var1652 = protoModule.writeString(var958, var959, self.sort_sub_id)
		buff = var958
		var916 = var959
	end
	if self.enable_game_tile_videos then
		local var960, var961 = protoModule.writeTag(buff, var916, 22, protoModule.wireTypes.varint)
		var960, var1654 = protoModule.writeVarInt(var960, var961, if self.enable_game_tile_videos then 1 else 0)
		buff = var960
		var916 = var961
	end
	if self.continues_previous_section ~= nil then
		local var962, var963 = protoModule.writeTag(buff, var916, 23, protoModule.wireTypes.varint)
		var962, var1656 = protoModule.writeVarInt(var962, var963, if self.continues_previous_section then 1 else 0)
		buff = var962
		var916 = var963
	end
	local buff_1 = buffer.create(var916)
	buffer.copy(buff_1, 0, buff, 0, var916)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var964 = t_36.new()
	local var965 = 0
	while var965 < buffer.len(p36) do
		local _ = nil
		local var966 = nil
		local var967, var968, var969 = protoModule.readTag(p36, var965)
		local var970 = var967
		var966 = var968
		var965 = var969
		
		if var966 == protoModule.wireTypes.varint then
			if var970 == 5 then
				local _ = nil
				local var971, var972 = protoModule.readVarIntI32(p36, var965)
				var965 = var972
				var964.secondary_sort_id = var971
			elseif var970 == 6 then
				local _ = nil
				local var973, var974 = protoModule.readVarIntI32(p36, var965)
				var965 = var974
				var964.max_visible_rows = var973
			elseif var970 == 10 then
				local _ = nil
				local var975, var976 = protoModule.readVarInt(p36, var965)
				var965 = var976
				var964.is_placeholder = var975 ~= 0
			elseif var970 == 11 then
				local _ = nil
				local var977, var978 = protoModule.readVarIntI32(p36, var965)
				var965 = var978
				var964.primary_sort_id = var977
			elseif var970 == 14 then
				local _ = nil
				local var979, var980 = protoModule.readVarInt(p36, var965)
				var965 = var980
				var964.has_emphasized_tile = var979 ~= 0
			elseif var970 == 16 then
				local _ = nil
				local var981, var982 = protoModule.readVarIntI32(p36, var965)
				var965 = var982
				var964.initial_feed_visible_rows = var981
			elseif var970 == 17 then
				local _ = nil
				local var983, var984 = protoModule.readVarIntI32(p36, var965)
				var965 = var984
				var964.visible_rows_per_reveal = var983
			elseif var970 == 22 then
				local _ = nil
				local var985, var986 = protoModule.readVarInt(p36, var965)
				var965 = var986
				var964.enable_game_tile_videos = var985 ~= 0
			elseif var970 == 23 then
				local _ = nil
				local var987, var988 = protoModule.readVarInt(p36, var965)
				var965 = var988
				var964.continues_previous_section = var987 ~= 0
			else
				local _ = nil
				local var989, var990 = protoModule.readVarInt(p36, var965)
				local _ = var989
				var965 = var990
			end
		end
		if var966 == protoModule.wireTypes.lengthDelimited then
			if var970 == 1 then
				local _ = nil
				local var991, var992 = protoModule.readBuffer(p36, var965)
				var965 = var992
				var964.title = buffer.tostring(var991)
			elseif var970 == 2 then
				local _ = nil
				local var993, var994 = protoModule.readBuffer(p36, var965)
				var965 = var994
				table.insert(var964.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var993))
			elseif var970 == 3 then
				local _ = nil
				local var995, var996 = protoModule.readBuffer(p36, var965)
				var965 = var996
				var964.next_page_token = buffer.tostring(var995)
			elseif var970 == 4 then
				local _ = nil
				local var997, var998 = protoModule.readBuffer(p36, var965)
				var965 = var998
				var964.sort_id = buffer.tostring(var997)
			elseif var970 == 7 then
				local _ = nil
				local var999, var1000 = protoModule.readBuffer(p36, var965)
				var965 = var1000
				var964.subtitle = buffer.tostring(var999)
			elseif var970 == 8 then
				local _ = nil
				local var1001, var1002 = protoModule.readBuffer(p36, var965)
				var965 = var1002
				var964.info_text = buffer.tostring(var1001)
			elseif var970 == 9 then
				local _ = nil
				local var1003, var1004 = protoModule.readBuffer(p36, var965)
				var965 = var1004
				var964.subtitle_link_path = buffer.tostring(var1003)
			elseif var970 == 12 then
				local _ = nil
				local var1005, var1006 = protoModule.readBuffer(p36, var965)
				var965 = var1006
				var964.applied_filters = buffer.tostring(var1005)
			elseif var970 == 13 then
				local _ = nil
				local var1007, var1008 = protoModule.readBuffer(p36, var965)
				var965 = var1008
				var964.pool_id = buffer.tostring(var1007)
			elseif var970 == 15 then
				local _ = nil
				local var1009, var1010 = protoModule.readBuffer(p36, var965)
				var965 = var1010
				var964.tile_activation_mode = buffer.tostring(var1009)
			elseif var970 == 18 then
				local _ = nil
				local var1011, var1012 = protoModule.readBuffer(p36, var965)
				var965 = var1012
				var964.sponsored_user_cohort = buffer.tostring(var1011)
			elseif var970 == 19 then
				local _ = nil
				local var1013, var1014 = protoModule.readBuffer(p36, var965)
				var965 = var1014
				var964.anchor_tag = buffer.tostring(var1013)
			elseif var970 == 20 then
				local _ = nil
				local var1015, var1016 = protoModule.readBuffer(p36, var965)
				var965 = var1016
				var964.collection_item_size = buffer.tostring(var1015)
			elseif var970 == 21 then
				local _ = nil
				local var1017, var1018 = protoModule.readBuffer(p36, var965)
				var965 = var1018
				var964.sort_sub_id = buffer.tostring(var1017)
			else
				local _ = nil
				local var1019, var1020 = protoModule.readVarInt(p36, var965)
				var965 = var1020 + var1019
			end
		elseif var966 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1021, var1022 = protoModule.readFixed32(p36, var965)
			local _ = var1021
			var965 = var1022
		elseif var966 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1023, var1024 = protoModule.readFixed64(p36, var965)
			local _ = var1023
			var965 = var1024
		else
			error("Unsupported wire type: " .. var1660)
		end
	end
	return var964
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
	local var1025 = t_36.new()
	
	if self.title ~= nil then
		var1025.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1025.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1025.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1025.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1025.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1025.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1025.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1025.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1025.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1025.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1025.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1025.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1025.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1025.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1025.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1025.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1025.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1025.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1025.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1025.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1025.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1025.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1025.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1025.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1025.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1025.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var1025.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var1025.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var1025.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var1025.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var1025.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var1025.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var1025.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var1025.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		var1025.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1025.anchor_tag = self.anchorTag
	end
	if self.collection_item_size ~= nil then
		var1025.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1025.collection_item_size = self.collectionItemSize
	end
	if self.sort_sub_id ~= nil then
		var1025.sort_sub_id = self.sort_sub_id
	end
	if self.sortSubId ~= nil then
		var1025.sort_sub_id = self.sortSubId
	end
	if self.enable_game_tile_videos ~= nil then
		var1025.enable_game_tile_videos = self.enable_game_tile_videos
	end
	if self.enableGameTileVideos ~= nil then
		var1025.enable_game_tile_videos = self.enableGameTileVideos
	end
	if self.continues_previous_section ~= nil then
		var1025.continues_previous_section = self.continues_previous_section
	end
	if self.continuesPreviousSection ~= nil then
		var1025.continues_previous_section = self.continuesPreviousSection
	end
	return var1025
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
	local var1026 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1027, var1028 = protoModule.writeTag(buff, var1026, 1, protoModule.wireTypes.lengthDelimited)
		var1027, var1727 = protoModule.writeString(var1027, var1028, self.universe_id)
		buff = var1027
		var1026 = var1028
	end
	if self.is_sponsored then
		local var1029, var1030 = protoModule.writeTag(buff, var1026, 2, protoModule.wireTypes.varint)
		var1029, var1729 = protoModule.writeVarInt(var1029, var1030, if self.is_sponsored then 1 else 0)
		buff = var1029
		var1026 = var1030
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1031, var1032 = protoModule.writeTag(buff, var1026, 3, protoModule.wireTypes.lengthDelimited)
		var1031, var1731 = protoModule.writeString(var1031, var1032, self.roblox_component)
		buff = var1031
		var1026 = var1032
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1033, var1034 = protoModule.writeTag(buff, var1026, 4, protoModule.wireTypes.lengthDelimited)
		var1033, var1733 = protoModule.writeString(var1033, var1034, self.native_ad_data)
		buff = var1033
		var1026 = var1034
	end
	if self.is_content_locked then
		local var1035, var1036 = protoModule.writeTag(buff, var1026, 5, protoModule.wireTypes.varint)
		var1035, var1735 = protoModule.writeVarInt(var1035, var1036, if self.is_content_locked then 1 else 0)
		buff = var1035
		var1026 = var1036
	end
	if self.title ~= nil and self.title ~= "" then
		local var1037, var1038 = protoModule.writeTag(buff, var1026, 6, protoModule.wireTypes.lengthDelimited)
		var1037, var1737 = protoModule.writeString(var1037, var1038, self.title)
		buff = var1037
		var1026 = var1038
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1039, var1040 = protoModule.writeTag(buff, var1026, 7, protoModule.wireTypes.lengthDelimited)
		var1039, var1739 = protoModule.writeString(var1039, var1040, self.subtitle)
		buff = var1039
		var1026 = var1040
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1041, var1042 = protoModule.writeTag(buff, var1026, 8, protoModule.wireTypes.lengthDelimited)
		var1041, var1741 = protoModule.writeString(var1041, var1042, self.image_asset_id)
		buff = var1041
		var1026 = var1042
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1043, var1044 = protoModule.writeTag(buff, var1026, 9, protoModule.wireTypes.lengthDelimited)
		var1043, var1743 = protoModule.writeString(var1043, var1044, self.video_asset_id)
		buff = var1043
		var1026 = var1044
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1045, var1046 = protoModule.writeTag(buff, var1026, 10, protoModule.wireTypes.lengthDelimited)
		var1045, var1745 = protoModule.writeString(var1045, var1046, self.badge_text)
		buff = var1045
		var1026 = var1046
	end
	if self.player_count ~= nil then
		local var1047, var1048 = protoModule.writeTag(buff, var1026, 11, protoModule.wireTypes.varint)
		var1047, var1747 = protoModule.writeVarInt(var1047, var1048, self.player_count)
		buff = var1047
		var1026 = var1048
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1049, var1050 = protoModule.writeTag(buff, var1026, 12, protoModule.wireTypes.lengthDelimited)
		var1049, var1749 = protoModule.writeString(var1049, var1050, self.creator_key)
		buff = var1049
		var1026 = var1050
	end
	if self.rank ~= nil then
		local var1051, var1052 = protoModule.writeTag(buff, var1026, 13, protoModule.wireTypes.varint)
		var1051, var1751 = protoModule.writeVarInt(var1051, var1052, self.rank)
		buff = var1051
		var1026 = var1052
	end
	if self.payer_name ~= nil then
		local var1053, var1054 = protoModule.writeTag(buff, var1026, 14, protoModule.wireTypes.lengthDelimited)
		var1053, var1753 = protoModule.writeString(var1053, var1054, self.payer_name)
		buff = var1053
		var1026 = var1054
	end
	if self.logo_asset_id ~= nil then
		local var1055, var1056 = protoModule.writeTag(buff, var1026, 15, protoModule.wireTypes.lengthDelimited)
		var1055, var1755 = protoModule.writeString(var1055, var1056, self.logo_asset_id)
		buff = var1055
		var1026 = var1056
	end
	if self.logo_aspect_ratio ~= nil then
		local var1057, var1058 = protoModule.writeTag(buff, var1026, 16, protoModule.wireTypes.i64)
		var1057, var1757 = protoModule.writeDouble(var1057, var1058, self.logo_aspect_ratio)
		buff = var1057
		var1026 = var1058
	end
	if self.place_id ~= nil then
		local var1059, var1060 = protoModule.writeTag(buff, var1026, 17, protoModule.wireTypes.lengthDelimited)
		var1059, var1759 = protoModule.writeString(var1059, var1060, self.place_id)
		buff = var1059
		var1026 = var1060
	end
	if self.launch_data ~= nil then
		local var1061, var1062 = protoModule.writeTag(buff, var1026, 18, protoModule.wireTypes.lengthDelimited)
		var1061, var1761 = protoModule.writeString(var1061, var1062, self.launch_data)
		buff = var1061
		var1026 = var1062
	end
	if self.tile_variant ~= nil then
		local var1063, var1064 = protoModule.writeTag(buff, var1026, 19, protoModule.wireTypes.lengthDelimited)
		var1063, var1763 = protoModule.writeString(var1063, var1064, self.tile_variant)
		buff = var1063
		var1026 = var1064
	end
	if self.cta_text ~= nil then
		local var1065, var1066 = protoModule.writeTag(buff, var1026, 20, protoModule.wireTypes.lengthDelimited)
		var1065, var1765 = protoModule.writeString(var1065, var1066, self.cta_text)
		buff = var1065
		var1026 = var1066
	end
	if self.badge_analytics_id ~= nil then
		local var1067, var1068 = protoModule.writeTag(buff, var1026, 21, protoModule.wireTypes.lengthDelimited)
		var1067, var1767 = protoModule.writeString(var1067, var1068, self.badge_analytics_id)
		buff = var1067
		var1026 = var1068
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1069 = v:encode()
			local var1070, var1071 = protoModule.writeTag(buff, var1026, 22, protoModule.wireTypes.lengthDelimited)
			var1070, var1770 = protoModule.writeBuffer(var1070, var1071, var1069, buffer.len(var1069))
			buff = var1070
			var1026 = var1071
		end
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var1072, var1073 = protoModule.writeTag(buff, var1026, 23, protoModule.wireTypes.lengthDelimited)
		var1072, var1772 = protoModule.writeString(var1072, var1073, self.attribution_thumbnail_asset_id)
		buff = var1072
		var1026 = var1073
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		for i, v in self.game_items_compact do
			local var1074 = v:encode()
			local var1075, var1076 = protoModule.writeTag(buff, var1026, 24, protoModule.wireTypes.lengthDelimited)
			var1075, var1775 = protoModule.writeBuffer(var1075, var1076, var1074, buffer.len(var1074))
			buff = var1075
			var1026 = var1076
		end
	end
	if self.source_sort_id ~= nil then
		local var1077, var1078 = protoModule.writeTag(buff, var1026, 25, protoModule.wireTypes.lengthDelimited)
		var1077, var1777 = protoModule.writeString(var1077, var1078, self.source_sort_id)
		buff = var1077
		var1026 = var1078
	end
	if self.new_game_enum ~= nil then
		local var1079, var1080 = protoModule.writeTag(buff, var1026, 26, protoModule.wireTypes.varint)
		var1079, var1779 = protoModule.writeVarInt(var1079, var1080, self.new_game_enum)
		buff = var1079
		var1026 = var1080
	end
	if self.moment_video_playback ~= nil then
		local var1081 = self.moment_video_playback:encode()
		local var1082, var1083 = protoModule.writeTag(buff, var1026, 27, protoModule.wireTypes.lengthDelimited)
		var1082, var1782 = protoModule.writeBuffer(var1082, var1083, var1081, buffer.len(var1081))
		buff = var1082
		var1026 = var1083
	end
	local buff_1 = buffer.create(var1026)
	buffer.copy(buff_1, 0, buff, 0, var1026)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1084 = t_37.new()
	local var1085 = 0
	while var1085 < buffer.len(p37) do
		local _ = nil
		local var1086 = nil
		local var1087, var1088, var1089 = protoModule.readTag(p37, var1085)
		local var1090 = var1087
		var1086 = var1088
		var1085 = var1089
		
		if var1086 == protoModule.wireTypes.varint then
			if var1090 == 2 then
				local _ = nil
				local var1091, var1092 = protoModule.readVarInt(p37, var1085)
				var1085 = var1092
				var1084.is_sponsored = var1091 ~= 0
			elseif var1090 == 5 then
				local _ = nil
				local var1093, var1094 = protoModule.readVarInt(p37, var1085)
				var1085 = var1094
				var1084.is_content_locked = var1093 ~= 0
			elseif var1090 == 11 then
				local _ = nil
				local var1095, var1096 = protoModule.readVarIntI64(p37, var1085)
				var1085 = var1096
				var1084.player_count = var1095
			elseif var1090 == 13 then
				local _ = nil
				local var1097, var1098 = protoModule.readVarIntI32(p37, var1085)
				var1085 = var1098
				var1084.rank = var1097
			elseif var1090 == 26 then
				local _ = nil
				local var1099, var1100 = protoModule.readVarIntI32(p37, var1085)
				var1085 = var1100
				var1084.new_game_enum = var1099
			else
				local _ = nil
				local var1101, var1102 = protoModule.readVarInt(p37, var1085)
				local _ = var1101
				var1085 = var1102
			end
		end
		if var1086 == protoModule.wireTypes.lengthDelimited then
			if var1090 == 1 then
				local _ = nil
				local var1103, var1104 = protoModule.readBuffer(p37, var1085)
				var1085 = var1104
				var1084.universe_id = buffer.tostring(var1103)
			elseif var1090 == 3 then
				local _ = nil
				local var1105, var1106 = protoModule.readBuffer(p37, var1085)
				var1085 = var1106
				var1084.roblox_component = buffer.tostring(var1105)
			elseif var1090 == 4 then
				local _ = nil
				local var1107, var1108 = protoModule.readBuffer(p37, var1085)
				var1085 = var1108
				var1084.native_ad_data = buffer.tostring(var1107)
			elseif var1090 == 6 then
				local _ = nil
				local var1109, var1110 = protoModule.readBuffer(p37, var1085)
				var1085 = var1110
				var1084.title = buffer.tostring(var1109)
			elseif var1090 == 7 then
				local _ = nil
				local var1111, var1112 = protoModule.readBuffer(p37, var1085)
				var1085 = var1112
				var1084.subtitle = buffer.tostring(var1111)
			elseif var1090 == 8 then
				local _ = nil
				local var1113, var1114 = protoModule.readBuffer(p37, var1085)
				var1085 = var1114
				var1084.image_asset_id = buffer.tostring(var1113)
			elseif var1090 == 9 then
				local _ = nil
				local var1115, var1116 = protoModule.readBuffer(p37, var1085)
				var1085 = var1116
				var1084.video_asset_id = buffer.tostring(var1115)
			elseif var1090 == 10 then
				local _ = nil
				local var1117, var1118 = protoModule.readBuffer(p37, var1085)
				var1085 = var1118
				var1084.badge_text = buffer.tostring(var1117)
			elseif var1090 == 12 then
				local _ = nil
				local var1119, var1120 = protoModule.readBuffer(p37, var1085)
				var1085 = var1120
				var1084.creator_key = buffer.tostring(var1119)
			elseif var1090 == 14 then
				local _ = nil
				local var1121, var1122 = protoModule.readBuffer(p37, var1085)
				var1085 = var1122
				var1084.payer_name = buffer.tostring(var1121)
			elseif var1090 == 15 then
				local _ = nil
				local var1123, var1124 = protoModule.readBuffer(p37, var1085)
				var1085 = var1124
				var1084.logo_asset_id = buffer.tostring(var1123)
			elseif var1090 == 17 then
				local _ = nil
				local var1125, var1126 = protoModule.readBuffer(p37, var1085)
				var1085 = var1126
				var1084.place_id = buffer.tostring(var1125)
			elseif var1090 == 18 then
				local _ = nil
				local var1127, var1128 = protoModule.readBuffer(p37, var1085)
				var1085 = var1128
				var1084.launch_data = buffer.tostring(var1127)
			elseif var1090 == 19 then
				local _ = nil
				local var1129, var1130 = protoModule.readBuffer(p37, var1085)
				var1085 = var1130
				var1084.tile_variant = buffer.tostring(var1129)
			elseif var1090 == 20 then
				local _ = nil
				local var1131, var1132 = protoModule.readBuffer(p37, var1085)
				var1085 = var1132
				var1084.cta_text = buffer.tostring(var1131)
			elseif var1090 == 21 then
				local _ = nil
				local var1133, var1134 = protoModule.readBuffer(p37, var1085)
				var1085 = var1134
				var1084.badge_analytics_id = buffer.tostring(var1133)
			elseif var1090 == 22 then
				local _ = nil
				local var1135, var1136 = protoModule.readBuffer(p37, var1085)
				var1085 = var1136
				table.insert(var1084.game_items, t.GameItemInputData.decode(var1135))
			elseif var1090 == 23 then
				local _ = nil
				local var1137, var1138 = protoModule.readBuffer(p37, var1085)
				var1085 = var1138
				var1084.attribution_thumbnail_asset_id = buffer.tostring(var1137)
			elseif var1090 == 24 then
				local _ = nil
				local var1139, var1140 = protoModule.readBuffer(p37, var1085)
				var1085 = var1140
				table.insert(var1084.game_items_compact, t.GameItemInputData.decode(var1139))
			elseif var1090 == 25 then
				local _ = nil
				local var1141, var1142 = protoModule.readBuffer(p37, var1085)
				var1085 = var1142
				var1084.source_sort_id = buffer.tostring(var1141)
			elseif var1090 == 27 then
				local _ = nil
				local var1143, var1144 = protoModule.readBuffer(p37, var1085)
				var1085 = var1144
				var1084.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.decode(var1143)
			else
				local _ = nil
				local var1145, var1146 = protoModule.readVarInt(p37, var1085)
				var1085 = var1146 + var1145
			end
		elseif var1086 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1147, var1148 = protoModule.readFixed32(p37, var1085)
			local _ = var1147
			var1085 = var1148
		elseif var1086 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1786)
		elseif var1090 == 16 then
			local _ = nil
			local var1149, var1150 = protoModule.readDouble(p37, var1085)
			var1085 = var1150
			var1084.logo_aspect_ratio = var1149
		else
			local _ = nil
			local var1151, var1152 = protoModule.readFixed64(p37, var1085)
			local _ = var1151
			var1085 = var1152
		end
	end
	return var1084
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
	local var1153 = t_37.new()
	
	if self.universe_id ~= nil then
		var1153.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1153.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1153.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1153.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1153.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1153.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1153.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1153.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1153.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1153.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1153.title = self.title
	end
	if self.subtitle ~= nil then
		var1153.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1153.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1153.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1153.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1153.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1153.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1153.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1153.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1153.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1153.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1153.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1153.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1153.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1153.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1153.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1153.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1153.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1153.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1153.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1153.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1153.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1153.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1153.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1153.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1153.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1153.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1153.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1153.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1153.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1153.game_items = t_1
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var1153.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var1153.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	if self.game_items_compact ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items_compact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1153.game_items_compact = t_1
	end
	if self.gameItemsCompact ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItemsCompact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1153.game_items_compact = t_1
	end
	if self.source_sort_id ~= nil then
		var1153.source_sort_id = self.source_sort_id
	end
	if self.sourceSortId ~= nil then
		var1153.source_sort_id = self.sourceSortId
	end
	if self.new_game_enum ~= nil then
		var1153.new_game_enum = self.new_game_enum
	end
	if self.newGameEnum ~= nil then
		var1153.new_game_enum = self.newGameEnum
	end
	if self.moment_video_playback ~= nil then
		var1153.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		var1153.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	return var1153
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
	local var1154 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var1155, var1156 = protoModule.writeTag(buff, var1154, 1, protoModule.wireTypes.lengthDelimited)
		var1155, var1864 = protoModule.writeString(var1155, var1156, self.asset_id)
		buff = var1155
		var1154 = var1156
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local var1157, var1158 = protoModule.writeTag(buff, var1154, 2, protoModule.wireTypes.lengthDelimited)
		var1157, var1866 = protoModule.writeString(var1157, var1158, self.asset_access_context)
		buff = var1157
		var1154 = var1158
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
				var1154.asset_id = buffer.tostring(var1163)
			elseif var1160 == 2 then
				local _ = nil
				local var1165, var1166 = protoModule.readBuffer(p38, var1155)
				var1155 = var1166
				var1154.asset_access_context = buffer.tostring(var1165)
			else
				local _ = nil
				local var1167, var1168 = protoModule.readVarInt(p38, var1155)
				var1155 = var1168 + var1167
			end
		elseif var1156 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1169, var1170 = protoModule.readFixed32(p38, var1155)
			local _ = var1169
			var1155 = var1170
		elseif var1156 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1171, var1172 = protoModule.readFixed64(p38, var1155)
			local _ = var1171
			var1155 = var1172
		else
			error("Unsupported wire type: " .. var1870)
		end
	end
	return var1154
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
	local var1173 = t_38.new()
	
	if self.asset_id ~= nil then
		var1173.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var1173.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		var1173.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		var1173.asset_access_context = self.assetAccessContext
	end
	return var1173
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
	local var1173 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1174, var1175 = protoModule.writeTag(buff, var1173, 1, protoModule.wireTypes.lengthDelimited)
		var1174, var1892 = protoModule.writeString(var1174, var1175, self.title)
		buff = var1174
		var1173 = var1175
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1176 = v:encode()
			local var1177, var1178 = protoModule.writeTag(buff, var1173, 2, protoModule.wireTypes.lengthDelimited)
			var1177, var1895 = protoModule.writeBuffer(var1177, var1178, var1176, buffer.len(var1176))
			buff = var1177
			var1173 = var1178
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1179, var1180 = protoModule.writeTag(buff, var1173, 3, protoModule.wireTypes.lengthDelimited)
		var1179, var1897 = protoModule.writeString(var1179, var1180, self.next_page_token)
		buff = var1179
		var1173 = var1180
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1181, var1182 = protoModule.writeTag(buff, var1173, 4, protoModule.wireTypes.lengthDelimited)
		var1181, var1899 = protoModule.writeString(var1181, var1182, self.sort_id)
		buff = var1181
		var1173 = var1182
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1183, var1184 = protoModule.writeTag(buff, var1173, 5, protoModule.wireTypes.varint)
		var1183, var1901 = protoModule.writeVarInt(var1183, var1184, self.secondary_sort_id)
		buff = var1183
		var1173 = var1184
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1185, var1186 = protoModule.writeTag(buff, var1173, 6, protoModule.wireTypes.lengthDelimited)
		var1185, var1903 = protoModule.writeString(var1185, var1186, self.subtitle)
		buff = var1185
		var1173 = var1186
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1187, var1188 = protoModule.writeTag(buff, var1173, 7, protoModule.wireTypes.lengthDelimited)
		var1187, var1905 = protoModule.writeString(var1187, var1188, self.info_text)
		buff = var1187
		var1173 = var1188
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1189, var1190 = protoModule.writeTag(buff, var1173, 8, protoModule.wireTypes.lengthDelimited)
		var1189, var1907 = protoModule.writeString(var1189, var1190, self.subtitle_link_path)
		buff = var1189
		var1173 = var1190
	end
	if self.is_placeholder ~= nil then
		local var1191, var1192 = protoModule.writeTag(buff, var1173, 9, protoModule.wireTypes.varint)
		var1191, var1909 = protoModule.writeVarInt(var1191, var1192, if self.is_placeholder then 1 else 0)
		buff = var1191
		var1173 = var1192
	end
	if self.primary_sort_id ~= nil then
		local var1193, var1194 = protoModule.writeTag(buff, var1173, 10, protoModule.wireTypes.varint)
		var1193, var1911 = protoModule.writeVarInt(var1193, var1194, self.primary_sort_id)
		buff = var1193
		var1173 = var1194
	end
	if self.applied_filters ~= nil then
		local var1195, var1196 = protoModule.writeTag(buff, var1173, 11, protoModule.wireTypes.lengthDelimited)
		var1195, var1913 = protoModule.writeString(var1195, var1196, self.applied_filters)
		buff = var1195
		var1173 = var1196
	end
	local buff_1 = buffer.create(var1173)
	buffer.copy(buff_1, 0, buff, 0, var1173)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1197 = t_39.new()
	local var1198 = 0
	while var1198 < buffer.len(p39) do
		local _ = nil
		local var1199 = nil
		local var1200, var1201, var1202 = protoModule.readTag(p39, var1198)
		local var1203 = var1200
		var1199 = var1201
		var1198 = var1202
		
		if var1199 == protoModule.wireTypes.varint then
			if var1203 == 5 then
				local _ = nil
				local var1204, var1205 = protoModule.readVarIntI32(p39, var1198)
				var1198 = var1205
				var1197.secondary_sort_id = var1204
			elseif var1203 == 9 then
				local _ = nil
				local var1206, var1207 = protoModule.readVarInt(p39, var1198)
				var1198 = var1207
				var1197.is_placeholder = var1206 ~= 0
			elseif var1203 == 10 then
				local _ = nil
				local var1208, var1209 = protoModule.readVarIntI32(p39, var1198)
				var1198 = var1209
				var1197.primary_sort_id = var1208
			else
				local _ = nil
				local var1210, var1211 = protoModule.readVarInt(p39, var1198)
				local _ = var1210
				var1198 = var1211
			end
		end
		if var1199 == protoModule.wireTypes.lengthDelimited then
			if var1203 == 1 then
				local _ = nil
				local var1212, var1213 = protoModule.readBuffer(p39, var1198)
				var1198 = var1213
				var1197.title = buffer.tostring(var1212)
			elseif var1203 == 2 then
				local _ = nil
				local var1214, var1215 = protoModule.readBuffer(p39, var1198)
				var1198 = var1215
				table.insert(var1197.song_items, t.SongCarouselInputData_SongItem.decode(var1214))
			elseif var1203 == 3 then
				local _ = nil
				local var1216, var1217 = protoModule.readBuffer(p39, var1198)
				var1198 = var1217
				var1197.next_page_token = buffer.tostring(var1216)
			elseif var1203 == 4 then
				local _ = nil
				local var1218, var1219 = protoModule.readBuffer(p39, var1198)
				var1198 = var1219
				var1197.sort_id = buffer.tostring(var1218)
			elseif var1203 == 6 then
				local _ = nil
				local var1220, var1221 = protoModule.readBuffer(p39, var1198)
				var1198 = var1221
				var1197.subtitle = buffer.tostring(var1220)
			elseif var1203 == 7 then
				local _ = nil
				local var1222, var1223 = protoModule.readBuffer(p39, var1198)
				var1198 = var1223
				var1197.info_text = buffer.tostring(var1222)
			elseif var1203 == 8 then
				local _ = nil
				local var1224, var1225 = protoModule.readBuffer(p39, var1198)
				var1198 = var1225
				var1197.subtitle_link_path = buffer.tostring(var1224)
			elseif var1203 == 11 then
				local _ = nil
				local var1226, var1227 = protoModule.readBuffer(p39, var1198)
				var1198 = var1227
				var1197.applied_filters = buffer.tostring(var1226)
			else
				local _ = nil
				local var1228, var1229 = protoModule.readVarInt(p39, var1198)
				var1198 = var1229 + var1228
			end
		elseif var1199 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1230, var1231 = protoModule.readFixed32(p39, var1198)
			local _ = var1230
			var1198 = var1231
		elseif var1199 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1232, var1233 = protoModule.readFixed64(p39, var1198)
			local _ = var1232
			var1198 = var1233
		else
			error("Unsupported wire type: " .. var1917)
		end
	end
	return var1197
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
	local var1234 = t_39.new()
	
	if self.title ~= nil then
		var1234.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1234.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1234.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1234.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1234.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1234.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1234.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1234.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1234.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1234.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1234.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1234.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1234.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1234.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1234.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1234.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1234.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1234.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1234.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1234.applied_filters = self.appliedFilters
	end
	return var1234
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
	local var1235 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1236, var1237 = protoModule.writeTag(buff, var1235, 1, protoModule.wireTypes.lengthDelimited)
		var1236, var1960 = protoModule.writeString(var1236, var1237, self.song_id)
		buff = var1236
		var1235 = var1237
	end
	local buff_1 = buffer.create(var1235)
	buffer.copy(buff_1, 0, buff, 0, var1235)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1235 = t_40.new()
	local var1236 = 0
	while var1236 < buffer.len(p40) do
		local _ = nil
		local var1237 = nil
		local var1238, var1239, var1240 = protoModule.readTag(p40, var1236)
		local var1241 = var1238
		var1237 = var1239
		var1236 = var1240
		
		if var1237 == protoModule.wireTypes.varint then
			local _ = nil
			local var1242, var1243 = protoModule.readVarInt(p40, var1236)
			local _ = var1242
			var1236 = var1243
			continue
		end
		if var1237 == protoModule.wireTypes.lengthDelimited then
			if var1241 == 1 then
				local _ = nil
				local var1244, var1245 = protoModule.readBuffer(p40, var1236)
				var1236 = var1245
				var1235.song_id = buffer.tostring(var1244)
			else
				local _ = nil
				local var1246, var1247 = protoModule.readVarInt(p40, var1236)
				var1236 = var1247 + var1246
			end
		elseif var1237 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1248, var1249 = protoModule.readFixed32(p40, var1236)
			local _ = var1248
			var1236 = var1249
		elseif var1237 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1250, var1251 = protoModule.readFixed64(p40, var1236)
			local _ = var1250
			var1236 = var1251
		else
			error("Unsupported wire type: " .. var1964)
		end
	end
	return var1235
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
	local var1252 = t_40.new()
	
	if self.song_id ~= nil then
		var1252.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1252.song_id = self.songId
	end
	return var1252
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
	local var1252 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1253, var1254 = protoModule.writeTag(buff, var1252, 1, protoModule.wireTypes.lengthDelimited)
		var1253, var1984 = protoModule.writeString(var1253, var1254, self.title)
		buff = var1253
		var1252 = var1254
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1255 = v:encode()
			local var1256, var1257 = protoModule.writeTag(buff, var1252, 2, protoModule.wireTypes.lengthDelimited)
			var1256, var1987 = protoModule.writeBuffer(var1256, var1257, var1255, buffer.len(var1255))
			buff = var1256
			var1252 = var1257
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1258, var1259 = protoModule.writeTag(buff, var1252, 3, protoModule.wireTypes.lengthDelimited)
		var1258, var1989 = protoModule.writeString(var1258, var1259, self.universe_id)
		buff = var1258
		var1252 = var1259
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1260, var1261 = protoModule.writeTag(buff, var1252, 4, protoModule.wireTypes.lengthDelimited)
		var1260, var1991 = protoModule.writeString(var1260, var1261, self.sort_id)
		buff = var1260
		var1252 = var1261
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1262, var1263 = protoModule.writeTag(buff, var1252, 5, protoModule.wireTypes.lengthDelimited)
		var1262, var1993 = protoModule.writeString(var1262, var1263, self.subtitle)
		buff = var1262
		var1252 = var1263
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1264, var1265 = protoModule.writeTag(buff, var1252, 6, protoModule.wireTypes.lengthDelimited)
		var1264, var1995 = protoModule.writeString(var1264, var1265, self.info_text)
		buff = var1264
		var1252 = var1265
	end
	local buff_1 = buffer.create(var1252)
	buffer.copy(buff_1, 0, buff, 0, var1252)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1266 = t_41.new()
	local var1267 = 0
	while var1267 < buffer.len(p41) do
		local _ = nil
		local var1268 = nil
		local var1269, var1270, var1271 = protoModule.readTag(p41, var1267)
		local var1272 = var1269
		var1268 = var1270
		var1267 = var1271
		
		if var1268 == protoModule.wireTypes.varint then
			local _ = nil
			local var1273, var1274 = protoModule.readVarInt(p41, var1267)
			local _ = var1273
			var1267 = var1274
			continue
		end
		if var1268 == protoModule.wireTypes.lengthDelimited then
			if var1272 == 1 then
				local _ = nil
				local var1275, var1276 = protoModule.readBuffer(p41, var1267)
				var1267 = var1276
				var1266.title = buffer.tostring(var1275)
			elseif var1272 == 2 then
				local _ = nil
				local var1277, var1278 = protoModule.readBuffer(p41, var1267)
				var1267 = var1278
				table.insert(var1266.event_items, t.EventsCarouselInputData_EventItem.decode(var1277))
			elseif var1272 == 3 then
				local _ = nil
				local var1279, var1280 = protoModule.readBuffer(p41, var1267)
				var1267 = var1280
				var1266.universe_id = buffer.tostring(var1279)
			elseif var1272 == 4 then
				local _ = nil
				local var1281, var1282 = protoModule.readBuffer(p41, var1267)
				var1267 = var1282
				var1266.sort_id = buffer.tostring(var1281)
			elseif var1272 == 5 then
				local _ = nil
				local var1283, var1284 = protoModule.readBuffer(p41, var1267)
				var1267 = var1284
				var1266.subtitle = buffer.tostring(var1283)
			elseif var1272 == 6 then
				local _ = nil
				local var1285, var1286 = protoModule.readBuffer(p41, var1267)
				var1267 = var1286
				var1266.info_text = buffer.tostring(var1285)
			else
				local _ = nil
				local var1287, var1288 = protoModule.readVarInt(p41, var1267)
				var1267 = var1288 + var1287
			end
		elseif var1268 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1289, var1290 = protoModule.readFixed32(p41, var1267)
			local _ = var1289
			var1267 = var1290
		elseif var1268 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1291, var1292 = protoModule.readFixed64(p41, var1267)
			local _ = var1291
			var1267 = var1292
		else
			error("Unsupported wire type: " .. var1999)
		end
	end
	return var1266
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
	local var1293 = t_41.new()
	
	if self.title ~= nil then
		var1293.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1293.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1293.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1293.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1293.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1293.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1293.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1293.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1293.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1293.info_text = self.infoText
	end
	return var1293
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
	local var1294 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1295, var1296 = protoModule.writeTag(buff, var1294, 1, protoModule.wireTypes.lengthDelimited)
		var1295, var2032 = protoModule.writeString(var1295, var1296, self.event_id)
		buff = var1295
		var1294 = var1296
	end
	local buff_1 = buffer.create(var1294)
	buffer.copy(buff_1, 0, buff, 0, var1294)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref)
	local var1294 = t_42.new()
	local var1295 = 0
	while var1295 < buffer.len(p42) do
		local _ = nil
		local var1296 = nil
		local var1297, var1298, var1299 = protoModule.readTag(p42, var1295)
		local var1300 = var1297
		var1296 = var1298
		var1295 = var1299
		
		if var1296 == protoModule.wireTypes.varint then
			local _ = nil
			local var1301, var1302 = protoModule.readVarInt(p42, var1295)
			local _ = var1301
			var1295 = var1302
			continue
		end
		if var1296 == protoModule.wireTypes.lengthDelimited then
			if var1300 == 1 then
				local _ = nil
				local var1303, var1304 = protoModule.readBuffer(p42, var1295)
				var1295 = var1304
				var1294.event_id = buffer.tostring(var1303)
			else
				local _ = nil
				local var1305, var1306 = protoModule.readVarInt(p42, var1295)
				var1295 = var1306 + var1305
			end
		elseif var1296 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1307, var1308 = protoModule.readFixed32(p42, var1295)
			local _ = var1307
			var1295 = var1308
		elseif var1296 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1309, var1310 = protoModule.readFixed64(p42, var1295)
			local _ = var1309
			var1295 = var1310
		else
			error("Unsupported wire type: " .. var2036)
		end
	end
	return var1294
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
	local var1311 = t_42.new()
	
	if self.event_id ~= nil then
		var1311.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1311.event_id = self.eventId
	end
	return var1311
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
	local var1311 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1312, var1313 = protoModule.writeTag(buff, var1311, 1, protoModule.wireTypes.lengthDelimited)
		var1312, var2056 = protoModule.writeString(var1312, var1313, self.universe_id)
		buff = var1312
		var1311 = var1313
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1314, var1315 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1314, var2058 = protoModule.writeString(var1314, var1315, i)
			local var1316 = v:encode()
			var1315, var2060 = protoModule.writeTag(var1314, var1315, 2, protoModule.wireTypes.lengthDelimited)
			var1315, var2060 = protoModule.writeBuffer(var1315, var2060, var1316, buffer.len(var1316))
			local var1317 = var1315
			local var1318 = var2060
			local var1319, var1320 = protoModule.writeTag(buff, var1311, 2, protoModule.wireTypes.lengthDelimited)
			var1319, var2064 = protoModule.writeBuffer(var1319, var1320, var1317, var1318)
			buff = var1319
			var1311 = var1320
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1321, var1322 = protoModule.writeTag(buff, var1311, 3, protoModule.wireTypes.lengthDelimited)
			var1321, var2066 = protoModule.writeString(var1321, var1322, v)
			buff = var1321
			var1311 = var1322
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1323, var1324 = protoModule.writeTag(buff, var1311, 4, protoModule.wireTypes.lengthDelimited)
		var1323, var2068 = protoModule.writeString(var1323, var1324, self.creator_key)
		buff = var1323
		var1311 = var1324
	end
	if self.pill_tabs ~= nil then
		local var1325 = self.pill_tabs:encode()
		local var1326, var1327 = protoModule.writeTag(buff, var1311, 5, protoModule.wireTypes.lengthDelimited)
		var1326, var2071 = protoModule.writeBuffer(var1326, var1327, var1325, buffer.len(var1325))
		buff = var1326
		var1311 = var1327
	end
	local buff_1 = buffer.create(var1311)
	buffer.copy(buff_1, 0, buff, 0, var1311)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1328 = t_43.new()
	local var1329 = 0
	while var1329 < buffer.len(p43) do
		local _ = nil
		local var1330 = nil
		local var1331, var1332, var1333 = protoModule.readTag(p43, var1329)
		local var1334 = var1331
		var1330 = var1332
		var1329 = var1333
		
		if var1330 == protoModule.wireTypes.varint then
			local _ = nil
			local var1335, var1336 = protoModule.readVarInt(p43, var1329)
			local _ = var1335
			var1329 = var1336
			continue
		end
		if var1330 == protoModule.wireTypes.lengthDelimited then
			if var1334 == 1 then
				local _ = nil
				local var1337, var1338 = protoModule.readBuffer(p43, var1329)
				var1329 = var1338
				var1328.universe_id = buffer.tostring(var1337)
			elseif var1334 == 2 then
				local _ = nil
				local var1339, var1340 = protoModule.readBuffer(p43, var1329)
				var1329 = var1340
				var1339 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1339)
				var1328.entry_map[var1339.key or ""] = var1339.value or t.FeedEntry.new()
			elseif var1334 == 3 then
				local _ = nil
				local var1341, var1342 = protoModule.readBuffer(p43, var1329)
				var1329 = var1342
				table.insert(var1328.entry_order, buffer.tostring(var1341))
			elseif var1334 == 4 then
				local _ = nil
				local var1343, var1344 = protoModule.readBuffer(p43, var1329)
				var1329 = var1344
				var1328.creator_key = buffer.tostring(var1343)
			elseif var1334 == 5 then
				local _ = nil
				local var1345, var1346 = protoModule.readBuffer(p43, var1329)
				var1329 = var1346
				var1328.pill_tabs = t.PillTabsInputData.decode(var1345)
			else
				local _ = nil
				local var1347, var1348 = protoModule.readVarInt(p43, var1329)
				var1329 = var1348 + var1347
			end
		elseif var1330 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1349, var1350 = protoModule.readFixed32(p43, var1329)
			local _ = var1349
			var1329 = var1350
		elseif var1330 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1351, var1352 = protoModule.readFixed64(p43, var1329)
			local _ = var1351
			var1329 = var1352
		else
			error("Unsupported wire type: " .. var2075)
		end
	end
	return var1328
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
	local var1353 = t_43.new()
	
	if self.universe_id ~= nil then
		var1353.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1353.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1353.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1353.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1353.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1353.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1353.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1353.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1353.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1353.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1353
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
	local var1354 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1355, var1356 = protoModule.writeTag(buff, var1354, 1, protoModule.wireTypes.lengthDelimited)
		var1355, var2109 = protoModule.writeString(var1355, var1356, self.key)
		buff = var1355
		var1354 = var1356
	end
	if self.value ~= nil then
		local var1357 = self.value:encode()
		local var1358, var1359 = protoModule.writeTag(buff, var1354, 2, protoModule.wireTypes.lengthDelimited)
		var1358, var2112 = protoModule.writeBuffer(var1358, var1359, var1357, buffer.len(var1357))
		buff = var1358
		var1354 = var1359
	end
	local buff_1 = buffer.create(var1354)
	buffer.copy(buff_1, 0, buff, 0, var1354)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1354 = t_44.new()
	local var1355 = 0
	while var1355 < buffer.len(p44) do
		local _ = nil
		local var1356 = nil
		local var1357, var1358, var1359 = protoModule.readTag(p44, var1355)
		local var1360 = var1357
		var1356 = var1358
		var1355 = var1359
		
		if var1356 == protoModule.wireTypes.varint then
			local _ = nil
			local var1361, var1362 = protoModule.readVarInt(p44, var1355)
			local _ = var1361
			var1355 = var1362
			continue
		end
		if var1356 == protoModule.wireTypes.lengthDelimited then
			if var1360 == 1 then
				local _ = nil
				local var1363, var1364 = protoModule.readBuffer(p44, var1355)
				var1355 = var1364
				var1354.key = buffer.tostring(var1363)
			elseif var1360 == 2 then
				local _ = nil
				local var1365, var1366 = protoModule.readBuffer(p44, var1355)
				var1355 = var1366
				var1354.value = t.FeedEntry.decode(var1365)
			else
				local _ = nil
				local var1367, var1368 = protoModule.readVarInt(p44, var1355)
				var1355 = var1368 + var1367
			end
		elseif var1356 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1369, var1370 = protoModule.readFixed32(p44, var1355)
			local _ = var1369
			var1355 = var1370
		elseif var1356 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1371, var1372 = protoModule.readFixed64(p44, var1355)
			local _ = var1371
			var1355 = var1372
		else
			error("Unsupported wire type: " .. var2116)
		end
	end
	return var1354
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
	local var1373 = t_44.new()
	
	if self.key ~= nil then
		var1373.key = self.key
	end
	if self.value ~= nil then
		var1373.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1373
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
	local var1373 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1374 = v:encode()
			local var1375, var1376 = protoModule.writeTag(buff, var1373, 1, protoModule.wireTypes.lengthDelimited)
			var1375, var2139 = protoModule.writeBuffer(var1375, var1376, var1374, buffer.len(var1374))
			buff = var1375
			var1373 = var1376
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1377, var1378 = protoModule.writeTag(buff, var1373, 2, protoModule.wireTypes.lengthDelimited)
		var1377, var2141 = protoModule.writeString(var1377, var1378, self.default_option_id)
		buff = var1377
		var1373 = var1378
	end
	local buff_1 = buffer.create(var1373)
	buffer.copy(buff_1, 0, buff, 0, var1373)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1379 = t_45.new()
	local var1380 = 0
	while var1380 < buffer.len(p45) do
		local _ = nil
		local var1381 = nil
		local var1382, var1383, var1384 = protoModule.readTag(p45, var1380)
		local var1385 = var1382
		var1381 = var1383
		var1380 = var1384
		
		if var1381 == protoModule.wireTypes.varint then
			local _ = nil
			local var1386, var1387 = protoModule.readVarInt(p45, var1380)
			local _ = var1386
			var1380 = var1387
			continue
		end
		if var1381 == protoModule.wireTypes.lengthDelimited then
			if var1385 == 1 then
				local _ = nil
				local var1388, var1389 = protoModule.readBuffer(p45, var1380)
				var1380 = var1389
				table.insert(var1379.options, t.PillTabsInputData_PillTabOption.decode(var1388))
			elseif var1385 == 2 then
				local _ = nil
				local var1390, var1391 = protoModule.readBuffer(p45, var1380)
				var1380 = var1391
				var1379.default_option_id = buffer.tostring(var1390)
			else
				local _ = nil
				local var1392, var1393 = protoModule.readVarInt(p45, var1380)
				var1380 = var1393 + var1392
			end
		elseif var1381 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1394, var1395 = protoModule.readFixed32(p45, var1380)
			local _ = var1394
			var1380 = var1395
		elseif var1381 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1396, var1397 = protoModule.readFixed64(p45, var1380)
			local _ = var1396
			var1380 = var1397
		else
			error("Unsupported wire type: " .. var2145)
		end
	end
	return var1379
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
	local var1398 = t_45.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1398.options = t_1
	end
	if self.default_option_id ~= nil then
		var1398.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1398.default_option_id = self.defaultOptionId
	end
	return var1398
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
	local var1399 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1400, var1401 = protoModule.writeTag(buff, var1399, 1, protoModule.wireTypes.lengthDelimited)
		var1400, var2169 = protoModule.writeString(var1400, var1401, self.option_id)
		buff = var1400
		var1399 = var1401
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1402, var1403 = protoModule.writeTag(buff, var1399, 2, protoModule.wireTypes.lengthDelimited)
		var1402, var2171 = protoModule.writeString(var1402, var1403, self.display_name)
		buff = var1402
		var1399 = var1403
	end
	local buff_1 = buffer.create(var1399)
	buffer.copy(buff_1, 0, buff, 0, var1399)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
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
				var1399.option_id = buffer.tostring(var1408)
			elseif var1405 == 2 then
				local _ = nil
				local var1410, var1411 = protoModule.readBuffer(p46, var1400)
				var1400 = var1411
				var1399.display_name = buffer.tostring(var1410)
			else
				local _ = nil
				local var1412, var1413 = protoModule.readVarInt(p46, var1400)
				var1400 = var1413 + var1412
			end
		elseif var1401 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1414, var1415 = protoModule.readFixed32(p46, var1400)
			local _ = var1414
			var1400 = var1415
		elseif var1401 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1416, var1417 = protoModule.readFixed64(p46, var1400)
			local _ = var1416
			var1400 = var1417
		else
			error("Unsupported wire type: " .. var2175)
		end
	end
	return var1399
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
	local var1418 = t_46.new()
	
	if self.option_id ~= nil then
		var1418.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1418.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1418.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1418.display_name = self.displayName
	end
	return var1418
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
	local var1418 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1419 = v:encode()
			local var1420, var1421 = protoModule.writeTag(buff, var1418, 1, protoModule.wireTypes.lengthDelimited)
			var1420, var2198 = protoModule.writeBuffer(var1420, var1421, var1419, buffer.len(var1419))
			buff = var1420
			var1418 = var1421
		end
	end
	local buff_1 = buffer.create(var1418)
	buffer.copy(buff_1, 0, buff, 0, var1418)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1422 = t_47.new()
	local var1423 = 0
	while var1423 < buffer.len(p47) do
		local _ = nil
		local var1424 = nil
		local var1425, var1426, var1427 = protoModule.readTag(p47, var1423)
		local var1428 = var1425
		var1424 = var1426
		var1423 = var1427
		
		if var1424 == protoModule.wireTypes.varint then
			local _ = nil
			local var1429, var1430 = protoModule.readVarInt(p47, var1423)
			local _ = var1429
			var1423 = var1430
			continue
		end
		if var1424 == protoModule.wireTypes.lengthDelimited then
			if var1428 == 1 then
				local _ = nil
				local var1431, var1432 = protoModule.readBuffer(p47, var1423)
				var1423 = var1432
				table.insert(var1422.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1431))
			else
				local _ = nil
				local var1433, var1434 = protoModule.readVarInt(p47, var1423)
				var1423 = var1434 + var1433
			end
		elseif var1424 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1435, var1436 = protoModule.readFixed32(p47, var1423)
			local _ = var1435
			var1423 = var1436
		elseif var1424 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1437, var1438 = protoModule.readFixed64(p47, var1423)
			local _ = var1437
			var1423 = var1438
		else
			error("Unsupported wire type: " .. var2202)
		end
	end
	return var1422
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
	local var1439 = t_47.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1439.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1439.game_passes = t_1
	end
	return var1439
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
	local var1440 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1441, var1442 = protoModule.writeTag(buff, var1440, 1, protoModule.wireTypes.lengthDelimited)
		var1441, var2225 = protoModule.writeString(var1441, var1442, self.game_pass_id)
		buff = var1441
		var1440 = var1442
	end
	local buff_1 = buffer.create(var1440)
	buffer.copy(buff_1, 0, buff, 0, var1440)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1440 = t_48.new()
	local var1441 = 0
	while var1441 < buffer.len(p48) do
		local _ = nil
		local var1442 = nil
		local var1443, var1444, var1445 = protoModule.readTag(p48, var1441)
		local var1446 = var1443
		var1442 = var1444
		var1441 = var1445
		
		if var1442 == protoModule.wireTypes.varint then
			local _ = nil
			local var1447, var1448 = protoModule.readVarInt(p48, var1441)
			local _ = var1447
			var1441 = var1448
			continue
		end
		if var1442 == protoModule.wireTypes.lengthDelimited then
			if var1446 == 1 then
				local _ = nil
				local var1449, var1450 = protoModule.readBuffer(p48, var1441)
				var1441 = var1450
				var1440.game_pass_id = buffer.tostring(var1449)
			else
				local _ = nil
				local var1451, var1452 = protoModule.readVarInt(p48, var1441)
				var1441 = var1452 + var1451
			end
		elseif var1442 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1453, var1454 = protoModule.readFixed32(p48, var1441)
			local _ = var1453
			var1441 = var1454
		elseif var1442 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1455, var1456 = protoModule.readFixed64(p48, var1441)
			local _ = var1455
			var1441 = var1456
		else
			error("Unsupported wire type: " .. var2229)
		end
	end
	return var1440
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
	local var1457 = t_48.new()
	
	if self.game_pass_id ~= nil then
		var1457.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1457.game_pass_id = self.gamePassId
	end
	return var1457
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
	local var1457 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1458 = v:encode()
			local var1459, var1460 = protoModule.writeTag(buff, var1457, 1, protoModule.wireTypes.lengthDelimited)
			var1459, var2250 = protoModule.writeBuffer(var1459, var1460, var1458, buffer.len(var1458))
			buff = var1459
			var1457 = var1460
		end
	end
	local buff_1 = buffer.create(var1457)
	buffer.copy(buff_1, 0, buff, 0, var1457)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1461 = t_49.new()
	local var1462 = 0
	while var1462 < buffer.len(p49) do
		local _ = nil
		local var1463 = nil
		local var1464, var1465, var1466 = protoModule.readTag(p49, var1462)
		local var1467 = var1464
		var1463 = var1465
		var1462 = var1466
		
		if var1463 == protoModule.wireTypes.varint then
			local _ = nil
			local var1468, var1469 = protoModule.readVarInt(p49, var1462)
			local _ = var1468
			var1462 = var1469
			continue
		end
		if var1463 == protoModule.wireTypes.lengthDelimited then
			if var1467 == 1 then
				local _ = nil
				local var1470, var1471 = protoModule.readBuffer(p49, var1462)
				var1462 = var1471
				table.insert(var1461.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1470))
			else
				local _ = nil
				local var1472, var1473 = protoModule.readVarInt(p49, var1462)
				var1462 = var1473 + var1472
			end
		elseif var1463 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1474, var1475 = protoModule.readFixed32(p49, var1462)
			local _ = var1474
			var1462 = var1475
		elseif var1463 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1476, var1477 = protoModule.readFixed64(p49, var1462)
			local _ = var1476
			var1462 = var1477
		else
			error("Unsupported wire type: " .. var2254)
		end
	end
	return var1461
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
	local var1478 = t_49.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1478.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1478.developer_products = t_1
	end
	return var1478
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
	local var1479 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1480, var1481 = protoModule.writeTag(buff, var1479, 1, protoModule.wireTypes.lengthDelimited)
		var1480, var2277 = protoModule.writeString(var1480, var1481, self.developer_product_id)
		buff = var1480
		var1479 = var1481
	end
	local buff_1 = buffer.create(var1479)
	buffer.copy(buff_1, 0, buff, 0, var1479)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref)
	local var1479 = t_50.new()
	local var1480 = 0
	while var1480 < buffer.len(p50) do
		local _ = nil
		local var1481 = nil
		local var1482, var1483, var1484 = protoModule.readTag(p50, var1480)
		local var1485 = var1482
		var1481 = var1483
		var1480 = var1484
		
		if var1481 == protoModule.wireTypes.varint then
			local _ = nil
			local var1486, var1487 = protoModule.readVarInt(p50, var1480)
			local _ = var1486
			var1480 = var1487
			continue
		end
		if var1481 == protoModule.wireTypes.lengthDelimited then
			if var1485 == 1 then
				local _ = nil
				local var1488, var1489 = protoModule.readBuffer(p50, var1480)
				var1480 = var1489
				var1479.developer_product_id = buffer.tostring(var1488)
			else
				local _ = nil
				local var1490, var1491 = protoModule.readVarInt(p50, var1480)
				var1480 = var1491 + var1490
			end
		elseif var1481 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1492, var1493 = protoModule.readFixed32(p50, var1480)
			local _ = var1492
			var1480 = var1493
		elseif var1481 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1494, var1495 = protoModule.readFixed64(p50, var1480)
			local _ = var1494
			var1480 = var1495
		else
			error("Unsupported wire type: " .. var2281)
		end
	end
	return var1479
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
	local var1496 = t_50.new()
	
	if self.developer_product_id ~= nil then
		var1496.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1496.developer_product_id = self.developerProductId
	end
	return var1496
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
	local var1496 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1497 = v:encode()
			local var1498, var1499 = protoModule.writeTag(buff, var1496, 1, protoModule.wireTypes.lengthDelimited)
			var1498, var2302 = protoModule.writeBuffer(var1498, var1499, var1497, buffer.len(var1497))
			buff = var1498
			var1496 = var1499
		end
	end
	local buff_1 = buffer.create(var1496)
	buffer.copy(buff_1, 0, buff, 0, var1496)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1500 = t_51.new()
	local var1501 = 0
	while var1501 < buffer.len(p51) do
		local _ = nil
		local var1502 = nil
		local var1503, var1504, var1505 = protoModule.readTag(p51, var1501)
		local var1506 = var1503
		var1502 = var1504
		var1501 = var1505
		
		if var1502 == protoModule.wireTypes.varint then
			local _ = nil
			local var1507, var1508 = protoModule.readVarInt(p51, var1501)
			local _ = var1507
			var1501 = var1508
			continue
		end
		if var1502 == protoModule.wireTypes.lengthDelimited then
			if var1506 == 1 then
				local _ = nil
				local var1509, var1510 = protoModule.readBuffer(p51, var1501)
				var1501 = var1510
				table.insert(var1500.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1509))
			else
				local _ = nil
				local var1511, var1512 = protoModule.readVarInt(p51, var1501)
				var1501 = var1512 + var1511
			end
		elseif var1502 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1513, var1514 = protoModule.readFixed32(p51, var1501)
			local _ = var1513
			var1501 = var1514
		elseif var1502 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1515, var1516 = protoModule.readFixed64(p51, var1501)
			local _ = var1515
			var1501 = var1516
		else
			error("Unsupported wire type: " .. var2306)
		end
	end
	return var1500
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
	local var1517 = t_51.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1517.subscriptions = t_1
	end
	return var1517
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
	local var1518 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1519, var1520 = protoModule.writeTag(buff, var1518, 1, protoModule.wireTypes.lengthDelimited)
		var1519, var2328 = protoModule.writeString(var1519, var1520, self.subscription_id)
		buff = var1519
		var1518 = var1520
	end
	local buff_1 = buffer.create(var1518)
	buffer.copy(buff_1, 0, buff, 0, var1518)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref)
	local var1518 = t_52.new()
	local var1519 = 0
	while var1519 < buffer.len(p52) do
		local _ = nil
		local var1520 = nil
		local var1521, var1522, var1523 = protoModule.readTag(p52, var1519)
		local var1524 = var1521
		var1520 = var1522
		var1519 = var1523
		
		if var1520 == protoModule.wireTypes.varint then
			local _ = nil
			local var1525, var1526 = protoModule.readVarInt(p52, var1519)
			local _ = var1525
			var1519 = var1526
			continue
		end
		if var1520 == protoModule.wireTypes.lengthDelimited then
			if var1524 == 1 then
				local _ = nil
				local var1527, var1528 = protoModule.readBuffer(p52, var1519)
				var1519 = var1528
				var1518.subscription_id = buffer.tostring(var1527)
			else
				local _ = nil
				local var1529, var1530 = protoModule.readVarInt(p52, var1519)
				var1519 = var1530 + var1529
			end
		elseif var1520 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1531, var1532 = protoModule.readFixed32(p52, var1519)
			local _ = var1531
			var1519 = var1532
		elseif var1520 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1533, var1534 = protoModule.readFixed64(p52, var1519)
			local _ = var1533
			var1519 = var1534
		else
			error("Unsupported wire type: " .. var2332)
		end
	end
	return var1518
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
	local var1535 = t_52.new()
	
	if self.subscription_id ~= nil then
		var1535.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1535.subscription_id = self.subscriptionId
	end
	return var1535
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
	local var1535 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1536 = v:encode()
			local var1537, var1538 = protoModule.writeTag(buff, var1535, 1, protoModule.wireTypes.lengthDelimited)
			var1537, var2353 = protoModule.writeBuffer(var1537, var1538, var1536, buffer.len(var1536))
			buff = var1537
			var1535 = var1538
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1539, var1540 = protoModule.writeTag(buff, var1535, 2, protoModule.wireTypes.lengthDelimited)
		var1539, var2355 = protoModule.writeString(var1539, var1540, self.universe_id)
		buff = var1539
		var1535 = var1540
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1541, var1542 = protoModule.writeTag(buff, var1535, 3, protoModule.wireTypes.lengthDelimited)
		var1541, var2357 = protoModule.writeString(var1541, var1542, self.section_title)
		buff = var1541
		var1535 = var1542
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1543, var1544 = protoModule.writeTag(buff, var1535, 4, protoModule.wireTypes.lengthDelimited)
		var1543, var2359 = protoModule.writeString(var1543, var1544, self.creator_key)
		buff = var1543
		var1535 = var1544
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1545, var1546 = protoModule.writeTag(buff, var1535, 5, protoModule.wireTypes.lengthDelimited)
		var1545, var2361 = protoModule.writeString(var1545, var1546, self.collection_item_size)
		buff = var1545
		var1535 = var1546
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1547, var1548 = protoModule.writeTag(buff, var1535, 6, protoModule.wireTypes.lengthDelimited)
		var1547, var2363 = protoModule.writeString(var1547, var1548, self.item_height_mode)
		buff = var1547
		var1535 = var1548
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1549, var1550 = protoModule.writeTag(buff, var1535, 7, protoModule.wireTypes.lengthDelimited)
		var1549, var2365 = protoModule.writeString(var1549, var1550, self.experience_store_product_type)
		buff = var1549
		var1535 = var1550
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1551, var1552 = protoModule.writeTag(buff, var1535, 8, protoModule.wireTypes.lengthDelimited)
		var1551, var2367 = protoModule.writeString(var1551, var1552, self.content_type)
		buff = var1551
		var1535 = var1552
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1553, var1554 = protoModule.writeTag(buff, var1535, 9, protoModule.wireTypes.lengthDelimited)
		var1553, var2369 = protoModule.writeString(var1553, var1554, self.item_type)
		buff = var1553
		var1535 = var1554
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1555, var1556 = protoModule.writeTag(buff, var1535, 10, protoModule.wireTypes.lengthDelimited)
		var1555, var2371 = protoModule.writeString(var1555, var1556, self.filter_category_id)
		buff = var1555
		var1535 = var1556
	end
	local buff_1 = buffer.create(var1535)
	buffer.copy(buff_1, 0, buff, 0, var1535)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1557 = t_53.new()
	local var1558 = 0
	while var1558 < buffer.len(p53) do
		local _ = nil
		local var1559 = nil
		local var1560, var1561, var1562 = protoModule.readTag(p53, var1558)
		local var1563 = var1560
		var1559 = var1561
		var1558 = var1562
		
		if var1559 == protoModule.wireTypes.varint then
			local _ = nil
			local var1564, var1565 = protoModule.readVarInt(p53, var1558)
			local _ = var1564
			var1558 = var1565
			continue
		end
		if var1559 == protoModule.wireTypes.lengthDelimited then
			if var1563 == 1 then
				local _ = nil
				local var1566, var1567 = protoModule.readBuffer(p53, var1558)
				var1558 = var1567
				table.insert(var1557.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1566))
			elseif var1563 == 2 then
				local _ = nil
				local var1568, var1569 = protoModule.readBuffer(p53, var1558)
				var1558 = var1569
				var1557.universe_id = buffer.tostring(var1568)
			elseif var1563 == 3 then
				local _ = nil
				local var1570, var1571 = protoModule.readBuffer(p53, var1558)
				var1558 = var1571
				var1557.section_title = buffer.tostring(var1570)
			elseif var1563 == 4 then
				local _ = nil
				local var1572, var1573 = protoModule.readBuffer(p53, var1558)
				var1558 = var1573
				var1557.creator_key = buffer.tostring(var1572)
			elseif var1563 == 5 then
				local _ = nil
				local var1574, var1575 = protoModule.readBuffer(p53, var1558)
				var1558 = var1575
				var1557.collection_item_size = buffer.tostring(var1574)
			elseif var1563 == 6 then
				local _ = nil
				local var1576, var1577 = protoModule.readBuffer(p53, var1558)
				var1558 = var1577
				var1557.item_height_mode = buffer.tostring(var1576)
			elseif var1563 == 7 then
				local _ = nil
				local var1578, var1579 = protoModule.readBuffer(p53, var1558)
				var1558 = var1579
				var1557.experience_store_product_type = buffer.tostring(var1578)
			elseif var1563 == 8 then
				local _ = nil
				local var1580, var1581 = protoModule.readBuffer(p53, var1558)
				var1558 = var1581
				var1557.content_type = buffer.tostring(var1580)
			elseif var1563 == 9 then
				local _ = nil
				local var1582, var1583 = protoModule.readBuffer(p53, var1558)
				var1558 = var1583
				var1557.item_type = buffer.tostring(var1582)
			elseif var1563 == 10 then
				local _ = nil
				local var1584, var1585 = protoModule.readBuffer(p53, var1558)
				var1558 = var1585
				var1557.filter_category_id = buffer.tostring(var1584)
			else
				local _ = nil
				local var1586, var1587 = protoModule.readVarInt(p53, var1558)
				var1558 = var1587 + var1586
			end
		elseif var1559 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1588, var1589 = protoModule.readFixed32(p53, var1558)
			local _ = var1588
			var1558 = var1589
		elseif var1559 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1590, var1591 = protoModule.readFixed64(p53, var1558)
			local _ = var1590
			var1558 = var1591
		else
			error("Unsupported wire type: " .. var2375)
		end
	end
	return var1557
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
	local var1592 = t_53.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1592.items = t_1
	end
	if self.universe_id ~= nil then
		var1592.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1592.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1592.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1592.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1592.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1592.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1592.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1592.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1592.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1592.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1592.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1592.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1592.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1592.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1592.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1592.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1592.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1592.filter_category_id = self.filterCategoryId
	end
	return var1592
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
	local var1593 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1594, var1595 = protoModule.writeTag(buff, var1593, 1, protoModule.wireTypes.lengthDelimited)
		var1594, var2415 = protoModule.writeString(var1594, var1595, self.item_id)
		buff = var1594
		var1593 = var1595
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1596, var1597 = protoModule.writeTag(buff, var1593, 2, protoModule.wireTypes.varint)
		var1596, var2417 = protoModule.writeVarInt(var1596, var1597, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1596
		var1593 = var1597
	end
	local buff_1 = buffer.create(var1593)
	buffer.copy(buff_1, 0, buff, 0, var1593)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1593 = t_54.new()
	local var1594 = 0
	while var1594 < buffer.len(p54) do
		local _ = nil
		local var1595 = nil
		local var1596, var1597, var1598 = protoModule.readTag(p54, var1594)
		local var1599 = var1596
		var1595 = var1597
		var1594 = var1598
		
		if var1595 == protoModule.wireTypes.varint then
			if var1599 == 2 then
				local _ = nil
				local var1600, var1601 = protoModule.readVarIntI32(p54, var1594)
				local var1602 = var1600
				var1594 = var1601
				var1593.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1602) or var1602
			else
				local _ = nil
				local var1603, var1604 = protoModule.readVarInt(p54, var1594)
				local _ = var1603
				var1594 = var1604
			end
		end
		if var1595 == protoModule.wireTypes.lengthDelimited then
			if var1599 == 1 then
				local _ = nil
				local var1605, var1606 = protoModule.readBuffer(p54, var1594)
				var1594 = var1606
				var1593.item_id = buffer.tostring(var1605)
			else
				local _ = nil
				local var1607, var1608 = protoModule.readVarInt(p54, var1594)
				var1594 = var1608 + var1607
			end
		elseif var1595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1609, var1610 = protoModule.readFixed32(p54, var1594)
			local _ = var1609
			var1594 = var1610
		elseif var1595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1611, var1612 = protoModule.readFixed64(p54, var1594)
			local _ = var1611
			var1594 = var1612
		else
			error("Unsupported wire type: " .. var2421)
		end
	end
	return var1593
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
	local var1613 = t_54.new()
	
	if self.item_id ~= nil then
		var1613.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1613.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1613.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1613
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
	local var1613 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1614, var1615 = protoModule.writeTag(buff, var1613, 1, protoModule.wireTypes.lengthDelimited)
		var1614, var2444 = protoModule.writeString(var1614, var1615, self.roblox_component)
		buff = var1614
		var1613 = var1615
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1616, var1617 = protoModule.writeTag(buff, var1613, 2, protoModule.wireTypes.lengthDelimited)
		var1616, var2446 = protoModule.writeString(var1616, var1617, self.identifier)
		buff = var1616
		var1613 = var1617
	end
	if self.title ~= nil and self.title ~= "" then
		local var1618, var1619 = protoModule.writeTag(buff, var1613, 3, protoModule.wireTypes.lengthDelimited)
		var1618, var2448 = protoModule.writeString(var1618, var1619, self.title)
		buff = var1618
		var1613 = var1619
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1620, var1621 = protoModule.writeTag(buff, var1613, 4, protoModule.wireTypes.lengthDelimited)
		var1620, var2450 = protoModule.writeString(var1620, var1621, self.user_id)
		buff = var1620
		var1613 = var1621
	end
	if self.description ~= nil and self.description ~= "" then
		local var1622, var1623 = protoModule.writeTag(buff, var1613, 5, protoModule.wireTypes.lengthDelimited)
		var1622, var2452 = protoModule.writeString(var1622, var1623, self.description)
		buff = var1622
		var1613 = var1623
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1624, var1625 = protoModule.writeTag(buff, var1613, 6, protoModule.wireTypes.lengthDelimited)
		var1624, var2454 = protoModule.writeString(var1624, var1625, self.cta_text)
		buff = var1624
		var1613 = var1625
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1626, var1627 = protoModule.writeTag(buff, var1613, 7, protoModule.wireTypes.lengthDelimited)
		var1626, var2456 = protoModule.writeString(var1626, var1627, self.prompt_id)
		buff = var1626
		var1613 = var1627
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1628, var1629 = protoModule.writeTag(buff, var1613, 8, protoModule.wireTypes.lengthDelimited)
		var1628, var2458 = protoModule.writeString(var1628, var1629, self.prompt_type)
		buff = var1628
		var1613 = var1629
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1630, var1631 = protoModule.writeTag(buff, var1613, 9, protoModule.wireTypes.lengthDelimited)
		var1630, var2460 = protoModule.writeString(var1630, var1631, self.entity_id)
		buff = var1630
		var1613 = var1631
	end
	local buff_1 = buffer.create(var1613)
	buffer.copy(buff_1, 0, buff, 0, var1613)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1613 = t_55.new()
	local var1614 = 0
	while var1614 < buffer.len(p55) do
		local _ = nil
		local var1615 = nil
		local var1616, var1617, var1618 = protoModule.readTag(p55, var1614)
		local var1619 = var1616
		var1615 = var1617
		var1614 = var1618
		
		if var1615 == protoModule.wireTypes.varint then
			local _ = nil
			local var1620, var1621 = protoModule.readVarInt(p55, var1614)
			local _ = var1620
			var1614 = var1621
			continue
		end
		if var1615 == protoModule.wireTypes.lengthDelimited then
			if var1619 == 1 then
				local _ = nil
				local var1622, var1623 = protoModule.readBuffer(p55, var1614)
				var1614 = var1623
				var1613.roblox_component = buffer.tostring(var1622)
			elseif var1619 == 2 then
				local _ = nil
				local var1624, var1625 = protoModule.readBuffer(p55, var1614)
				var1614 = var1625
				var1613.identifier = buffer.tostring(var1624)
			elseif var1619 == 3 then
				local _ = nil
				local var1626, var1627 = protoModule.readBuffer(p55, var1614)
				var1614 = var1627
				var1613.title = buffer.tostring(var1626)
			elseif var1619 == 4 then
				local _ = nil
				local var1628, var1629 = protoModule.readBuffer(p55, var1614)
				var1614 = var1629
				var1613.user_id = buffer.tostring(var1628)
			elseif var1619 == 5 then
				local _ = nil
				local var1630, var1631 = protoModule.readBuffer(p55, var1614)
				var1614 = var1631
				var1613.description = buffer.tostring(var1630)
			elseif var1619 == 6 then
				local _ = nil
				local var1632, var1633 = protoModule.readBuffer(p55, var1614)
				var1614 = var1633
				var1613.cta_text = buffer.tostring(var1632)
			elseif var1619 == 7 then
				local _ = nil
				local var1634, var1635 = protoModule.readBuffer(p55, var1614)
				var1614 = var1635
				var1613.prompt_id = buffer.tostring(var1634)
			elseif var1619 == 8 then
				local _ = nil
				local var1636, var1637 = protoModule.readBuffer(p55, var1614)
				var1614 = var1637
				var1613.prompt_type = buffer.tostring(var1636)
			elseif var1619 == 9 then
				local _ = nil
				local var1638, var1639 = protoModule.readBuffer(p55, var1614)
				var1614 = var1639
				var1613.entity_id = buffer.tostring(var1638)
			else
				local _ = nil
				local var1640, var1641 = protoModule.readVarInt(p55, var1614)
				var1614 = var1641 + var1640
			end
		elseif var1615 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1642, var1643 = protoModule.readFixed32(p55, var1614)
			local _ = var1642
			var1614 = var1643
		elseif var1615 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1644, var1645 = protoModule.readFixed64(p55, var1614)
			local _ = var1644
			var1614 = var1645
		else
			error("Unsupported wire type: " .. var2464)
		end
	end
	return var1613
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
	local var1646 = t_55.new()
	
	if self.roblox_component ~= nil then
		var1646.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1646.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1646.identifier = self.identifier
	end
	if self.title ~= nil then
		var1646.title = self.title
	end
	if self.user_id ~= nil then
		var1646.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1646.user_id = self.userId
	end
	if self.description ~= nil then
		var1646.description = self.description
	end
	if self.cta_text ~= nil then
		var1646.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1646.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1646.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1646.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1646.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1646.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1646.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1646.entity_id = self.entityId
	end
	return var1646
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
	local var1646 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1647, var1648 = protoModule.writeTag(buff, var1646, 1, protoModule.wireTypes.lengthDelimited)
		var1647, var2500 = protoModule.writeString(var1647, var1648, self.group_id)
		buff = var1647
		var1646 = var1648
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1649, var1650 = protoModule.writeTag(buff, var1646, 2, protoModule.wireTypes.lengthDelimited)
		var1649, var2502 = protoModule.writeString(var1649, var1650, self.experience_id)
		buff = var1649
		var1646 = var1650
	end
	local buff_1 = buffer.create(var1646)
	buffer.copy(buff_1, 0, buff, 0, var1646)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1646 = t_56.new()
	local var1647 = 0
	while var1647 < buffer.len(p56) do
		local _ = nil
		local var1648 = nil
		local var1649, var1650, var1651 = protoModule.readTag(p56, var1647)
		local var1652 = var1649
		var1648 = var1650
		var1647 = var1651
		
		if var1648 == protoModule.wireTypes.varint then
			local _ = nil
			local var1653, var1654 = protoModule.readVarInt(p56, var1647)
			local _ = var1653
			var1647 = var1654
			continue
		end
		if var1648 == protoModule.wireTypes.lengthDelimited then
			if var1652 == 1 then
				local _ = nil
				local var1655, var1656 = protoModule.readBuffer(p56, var1647)
				var1647 = var1656
				var1646.group_id = buffer.tostring(var1655)
			elseif var1652 == 2 then
				local _ = nil
				local var1657, var1658 = protoModule.readBuffer(p56, var1647)
				var1647 = var1658
				var1646.experience_id = buffer.tostring(var1657)
			else
				local _ = nil
				local var1659, var1660 = protoModule.readVarInt(p56, var1647)
				var1647 = var1660 + var1659
			end
		elseif var1648 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1661, var1662 = protoModule.readFixed32(p56, var1647)
			local _ = var1661
			var1647 = var1662
		elseif var1648 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1663, var1664 = protoModule.readFixed64(p56, var1647)
			local _ = var1663
			var1647 = var1664
		else
			error("Unsupported wire type: " .. var2506)
		end
	end
	return var1646
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
	local var1665 = t_56.new()
	
	if self.group_id ~= nil then
		var1665.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1665.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1665.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1665.experience_id = self.experienceId
	end
	return var1665
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
	local var1665 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1666, var1667 = protoModule.writeTag(buff, var1665, 1, protoModule.wireTypes.lengthDelimited)
		var1666, var2528 = protoModule.writeString(var1666, var1667, self.title)
		buff = var1666
		var1665 = var1667
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1668, var1669 = protoModule.writeTag(buff, var1665, 2, protoModule.wireTypes.lengthDelimited)
		var1668, var2530 = protoModule.writeString(var1668, var1669, self.dismiss_text)
		buff = var1668
		var1665 = var1669
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1670, var1671 = protoModule.writeTag(buff, var1665, 3, protoModule.wireTypes.lengthDelimited)
		var1670, var2532 = protoModule.writeString(var1670, var1671, self.user_id)
		buff = var1670
		var1665 = var1671
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1672 = v:encode()
			local var1673, var1674 = protoModule.writeTag(buff, var1665, 4, protoModule.wireTypes.lengthDelimited)
			var1673, var2535 = protoModule.writeBuffer(var1673, var1674, var1672, buffer.len(var1672))
			buff = var1673
			var1665 = var1674
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1675, var1676 = protoModule.writeTag(buff, var1665, 5, protoModule.wireTypes.lengthDelimited)
		var1675, var2537 = protoModule.writeString(var1675, var1676, self.prompt_id)
		buff = var1675
		var1665 = var1676
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1677, var1678 = protoModule.writeTag(buff, var1665, 6, protoModule.wireTypes.lengthDelimited)
		var1677, var2539 = protoModule.writeString(var1677, var1678, self.prompt_type)
		buff = var1677
		var1665 = var1678
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1679, var1680 = protoModule.writeTag(buff, var1665, 7, protoModule.wireTypes.lengthDelimited)
		var1679, var2541 = protoModule.writeString(var1679, var1680, self.sort_id)
		buff = var1679
		var1665 = var1680
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1681, var1682 = protoModule.writeTag(buff, var1665, 8, protoModule.wireTypes.lengthDelimited)
		var1681, var2543 = protoModule.writeString(var1681, var1682, self.feed_item_key)
		buff = var1681
		var1665 = var1682
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1683 = self.client_attributes.value:encode()
		local var1684, var1685 = protoModule.writeTag(buff, var1665, 9, protoModule.wireTypes.lengthDelimited)
		var1684, var2546 = protoModule.writeBuffer(var1684, var1685, var1683, buffer.len(var1683))
		buff = var1684
		var1665 = var1685
	end
	local buff_1 = buffer.create(var1665)
	buffer.copy(buff_1, 0, buff, 0, var1665)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1686 = t_57.new()
	local var1687 = 0
	while var1687 < buffer.len(p57) do
		local _ = nil
		local var1688 = nil
		local var1689, var1690, var1691 = protoModule.readTag(p57, var1687)
		local var1692 = var1689
		var1688 = var1690
		var1687 = var1691
		
		if var1688 == protoModule.wireTypes.varint then
			local _ = nil
			local var1693, var1694 = protoModule.readVarInt(p57, var1687)
			local _ = var1693
			var1687 = var1694
			continue
		end
		if var1688 == protoModule.wireTypes.lengthDelimited then
			if var1692 == 1 then
				local _ = nil
				local var1695, var1696 = protoModule.readBuffer(p57, var1687)
				var1687 = var1696
				var1686.title = buffer.tostring(var1695)
			elseif var1692 == 2 then
				local _ = nil
				local var1697, var1698 = protoModule.readBuffer(p57, var1687)
				var1687 = var1698
				var1686.dismiss_text = buffer.tostring(var1697)
			elseif var1692 == 3 then
				local _ = nil
				local var1699, var1700 = protoModule.readBuffer(p57, var1687)
				var1687 = var1700
				var1686.user_id = buffer.tostring(var1699)
			elseif var1692 == 4 then
				local _ = nil
				local var1701, var1702 = protoModule.readBuffer(p57, var1687)
				var1687 = var1702
				table.insert(var1686.cards, t.CardContainerCardInputData.decode(var1701))
			elseif var1692 == 5 then
				local _ = nil
				local var1703, var1704 = protoModule.readBuffer(p57, var1687)
				var1687 = var1704
				var1686.prompt_id = buffer.tostring(var1703)
			elseif var1692 == 6 then
				local _ = nil
				local var1705, var1706 = protoModule.readBuffer(p57, var1687)
				var1687 = var1706
				var1686.prompt_type = buffer.tostring(var1705)
			elseif var1692 == 7 then
				local _ = nil
				local var1707, var1708 = protoModule.readBuffer(p57, var1687)
				var1687 = var1708
				var1686.sort_id = buffer.tostring(var1707)
			elseif var1692 == 8 then
				local _ = nil
				local var1709, var1710 = protoModule.readBuffer(p57, var1687)
				var1687 = var1710
				var1686.feed_item_key = buffer.tostring(var1709)
			elseif var1692 == 9 then
				local _ = nil
				local var1711, var1712 = protoModule.readBuffer(p57, var1687)
				var1687 = var1712
				var1686.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1711)
				}
			else
				local _ = nil
				local var1713, var1714 = protoModule.readVarInt(p57, var1687)
				var1687 = var1714 + var1713
			end
		elseif var1688 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1715, var1716 = protoModule.readFixed32(p57, var1687)
			local _ = var1715
			var1687 = var1716
		elseif var1688 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1717, var1718 = protoModule.readFixed64(p57, var1687)
			local _ = var1717
			var1687 = var1718
		else
			error("Unsupported wire type: " .. var2550)
		end
	end
	return var1686
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
	local var1719 = t_57.new()
	
	if self.title ~= nil then
		var1719.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1719.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1719.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1719.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1719.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1719.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1719.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1719.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1719.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1719.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1719.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1719.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1719.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1719.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1719.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1719.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1719
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
	local var1720 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1721, var1722 = protoModule.writeTag(buff, var1720, 1, protoModule.wireTypes.lengthDelimited)
		var1721, var2588 = protoModule.writeString(var1721, var1722, self.title)
		buff = var1721
		var1720 = var1722
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1723, var1724 = protoModule.writeTag(buff, var1720, 2, protoModule.wireTypes.lengthDelimited)
		var1723, var2590 = protoModule.writeString(var1723, var1724, self.user_id)
		buff = var1723
		var1720 = var1724
	end
	if self.description ~= nil and self.description ~= "" then
		local var1725, var1726 = protoModule.writeTag(buff, var1720, 3, protoModule.wireTypes.lengthDelimited)
		var1725, var2592 = protoModule.writeString(var1725, var1726, self.description)
		buff = var1725
		var1720 = var1726
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1727, var1728 = protoModule.writeTag(buff, var1720, 4, protoModule.wireTypes.lengthDelimited)
		var1727, var2594 = protoModule.writeString(var1727, var1728, self.cta_text)
		buff = var1727
		var1720 = var1728
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1729, var1730 = protoModule.writeTag(buff, var1720, 5, protoModule.wireTypes.lengthDelimited)
		var1729, var2596 = protoModule.writeString(var1729, var1730, self.prompt_id)
		buff = var1729
		var1720 = var1730
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1731, var1732 = protoModule.writeTag(buff, var1720, 6, protoModule.wireTypes.lengthDelimited)
		var1731, var2598 = protoModule.writeString(var1731, var1732, self.prompt_type)
		buff = var1731
		var1720 = var1732
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1733, var1734 = protoModule.writeTag(buff, var1720, 7, protoModule.wireTypes.lengthDelimited)
		var1733, var2600 = protoModule.writeString(var1733, var1734, self.entity_id)
		buff = var1733
		var1720 = var1734
	end
	local buff_1 = buffer.create(var1720)
	buffer.copy(buff_1, 0, buff, 0, var1720)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1720 = t_58.new()
	local var1721 = 0
	while var1721 < buffer.len(p58) do
		local _ = nil
		local var1722 = nil
		local var1723, var1724, var1725 = protoModule.readTag(p58, var1721)
		local var1726 = var1723
		var1722 = var1724
		var1721 = var1725
		
		if var1722 == protoModule.wireTypes.varint then
			local _ = nil
			local var1727, var1728 = protoModule.readVarInt(p58, var1721)
			local _ = var1727
			var1721 = var1728
			continue
		end
		if var1722 == protoModule.wireTypes.lengthDelimited then
			if var1726 == 1 then
				local _ = nil
				local var1729, var1730 = protoModule.readBuffer(p58, var1721)
				var1721 = var1730
				var1720.title = buffer.tostring(var1729)
			elseif var1726 == 2 then
				local _ = nil
				local var1731, var1732 = protoModule.readBuffer(p58, var1721)
				var1721 = var1732
				var1720.user_id = buffer.tostring(var1731)
			elseif var1726 == 3 then
				local _ = nil
				local var1733, var1734 = protoModule.readBuffer(p58, var1721)
				var1721 = var1734
				var1720.description = buffer.tostring(var1733)
			elseif var1726 == 4 then
				local _ = nil
				local var1735, var1736 = protoModule.readBuffer(p58, var1721)
				var1721 = var1736
				var1720.cta_text = buffer.tostring(var1735)
			elseif var1726 == 5 then
				local _ = nil
				local var1737, var1738 = protoModule.readBuffer(p58, var1721)
				var1721 = var1738
				var1720.prompt_id = buffer.tostring(var1737)
			elseif var1726 == 6 then
				local _ = nil
				local var1739, var1740 = protoModule.readBuffer(p58, var1721)
				var1721 = var1740
				var1720.prompt_type = buffer.tostring(var1739)
			elseif var1726 == 7 then
				local _ = nil
				local var1741, var1742 = protoModule.readBuffer(p58, var1721)
				var1721 = var1742
				var1720.entity_id = buffer.tostring(var1741)
			else
				local _ = nil
				local var1743, var1744 = protoModule.readVarInt(p58, var1721)
				var1721 = var1744 + var1743
			end
		elseif var1722 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1745, var1746 = protoModule.readFixed32(p58, var1721)
			local _ = var1745
			var1721 = var1746
		elseif var1722 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1747, var1748 = protoModule.readFixed64(p58, var1721)
			local _ = var1747
			var1721 = var1748
		else
			error("Unsupported wire type: " .. var2604)
		end
	end
	return var1720
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
	local var1749 = t_58.new()
	
	if self.title ~= nil then
		var1749.title = self.title
	end
	if self.user_id ~= nil then
		var1749.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1749.user_id = self.userId
	end
	if self.description ~= nil then
		var1749.description = self.description
	end
	if self.cta_text ~= nil then
		var1749.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1749.cta_text = self.ctaText
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
	if self.entity_id ~= nil then
		var1749.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1749.entity_id = self.entityId
	end
	return var1749
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
	local var1749 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1750, var1751 = protoModule.writeTag(buff, var1749, 1, protoModule.wireTypes.lengthDelimited)
		var1750, var2636 = protoModule.writeString(var1750, var1751, self.prompt_id)
		buff = var1750
		var1749 = var1751
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1752, var1753 = protoModule.writeTag(buff, var1749, 2, protoModule.wireTypes.lengthDelimited)
		var1752, var2638 = protoModule.writeString(var1752, var1753, self.prompt_type)
		buff = var1752
		var1749 = var1753
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1754, var1755 = protoModule.writeTag(buff, var1749, 3, protoModule.wireTypes.lengthDelimited)
		var1754, var2640 = protoModule.writeString(var1754, var1755, self.user_id)
		buff = var1754
		var1749 = var1755
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1756, var1757 = protoModule.writeTag(buff, var1749, 4, protoModule.wireTypes.lengthDelimited)
		var1756, var2642 = protoModule.writeString(var1756, var1757, self.audit_data)
		buff = var1756
		var1749 = var1757
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
		local var1751 = nil
		local var1752, var1753, var1754 = protoModule.readTag(p59, var1750)
		local var1755 = var1752
		var1751 = var1753
		var1750 = var1754
		
		if var1751 == protoModule.wireTypes.varint then
			local _ = nil
			local var1756, var1757 = protoModule.readVarInt(p59, var1750)
			local _ = var1756
			var1750 = var1757
			continue
		end
		if var1751 == protoModule.wireTypes.lengthDelimited then
			if var1755 == 1 then
				local _ = nil
				local var1758, var1759 = protoModule.readBuffer(p59, var1750)
				var1750 = var1759
				var1749.prompt_id = buffer.tostring(var1758)
			elseif var1755 == 2 then
				local _ = nil
				local var1760, var1761 = protoModule.readBuffer(p59, var1750)
				var1750 = var1761
				var1749.prompt_type = buffer.tostring(var1760)
			elseif var1755 == 3 then
				local _ = nil
				local var1762, var1763 = protoModule.readBuffer(p59, var1750)
				var1750 = var1763
				var1749.user_id = buffer.tostring(var1762)
			elseif var1755 == 4 then
				local _ = nil
				local var1764, var1765 = protoModule.readBuffer(p59, var1750)
				var1750 = var1765
				var1749.audit_data = buffer.tostring(var1764)
			else
				local _ = nil
				local var1766, var1767 = protoModule.readVarInt(p59, var1750)
				var1750 = var1767 + var1766
			end
		elseif var1751 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1768, var1769 = protoModule.readFixed32(p59, var1750)
			local _ = var1768
			var1750 = var1769
		elseif var1751 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1770, var1771 = protoModule.readFixed64(p59, var1750)
			local _ = var1770
			var1750 = var1771
		else
			error("Unsupported wire type: " .. var2646)
		end
	end
	return var1749
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
	local var1772 = t_59.new()
	
	if self.prompt_id ~= nil then
		var1772.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1772.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1772.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1772.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1772.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1772.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1772.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1772.audit_data = self.auditData
	end
	return var1772
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
	local var1772 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1773, var1774 = protoModule.writeTag(buff, var1772, 1, protoModule.wireTypes.varint)
		var1773, var2672 = protoModule.writeVarInt(var1773, var1774, self.sender_count)
		buff = var1773
		var1772 = var1774
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1775, var1776 = protoModule.writeTag(buff, var1772, 2, protoModule.wireTypes.varint)
		var1775, var2674 = protoModule.writeVarInt(var1775, var1776, self.total_robux_amount)
		buff = var1775
		var1772 = var1776
	end
	local buff_1 = buffer.create(var1772)
	buffer.copy(buff_1, 0, buff, 0, var1772)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1772 = t_60.new()
	local var1773 = 0
	while var1773 < buffer.len(p60) do
		local _ = nil
		local _ = nil
		local var1774, var1775, var1776 = protoModule.readTag(p60, var1773)
		local var1777 = var1774
		local var1778 = var1775
		var1773 = var1776
		
		if var1778 == protoModule.wireTypes.varint then
			if var1777 == 1 then
				local _ = nil
				local var1779, var1780 = protoModule.readVarIntI32(p60, var1773)
				var1773 = var1780
				var1772.sender_count = var1779
			elseif var1777 == 2 then
				local _ = nil
				local var1781, var1782 = protoModule.readVarIntI64(p60, var1773)
				var1773 = var1782
				var1772.total_robux_amount = var1781
			else
				local _ = nil
				local var1783, var1784 = protoModule.readVarInt(p60, var1773)
				local _ = var1783
				var1773 = var1784
			end
		elseif var1778 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1785, var1786 = protoModule.readVarInt(p60, var1773)
			var1773 = var1786 + var1785
		elseif var1778 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1787, var1788 = protoModule.readFixed32(p60, var1773)
			local _ = var1787
			var1773 = var1788
		elseif var1778 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1789, var1790 = protoModule.readFixed64(p60, var1773)
			local _ = var1789
			var1773 = var1790
		else
			error("Unsupported wire type: " .. var2682)
		end
	end
	return var1772
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
	local var1791 = t_60.new()
	
	if self.sender_count ~= nil then
		var1791.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1791.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1791.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1791.total_robux_amount = self.totalRobuxAmount
	end
	return var1791
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
	local var1791 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1792, var1793 = protoModule.writeTag(buff, var1791, 1, protoModule.wireTypes.lengthDelimited)
		var1792, var2700 = protoModule.writeString(var1792, var1793, self.title)
		buff = var1792
		var1791 = var1793
	end
	if self.description ~= nil and self.description ~= "" then
		local var1794, var1795 = protoModule.writeTag(buff, var1791, 2, protoModule.wireTypes.lengthDelimited)
		var1794, var2702 = protoModule.writeString(var1794, var1795, self.description)
		buff = var1794
		var1791 = var1795
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1796, var1797 = protoModule.writeTag(buff, var1791, 3, protoModule.wireTypes.lengthDelimited)
		var1796, var2704 = protoModule.writeString(var1796, var1797, self.primary_text)
		buff = var1796
		var1791 = var1797
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1798, var1799 = protoModule.writeTag(buff, var1791, 4, protoModule.wireTypes.lengthDelimited)
		var1798, var2706 = protoModule.writeString(var1798, var1799, self.secondary_text)
		buff = var1798
		var1791 = var1799
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1800, var1801 = protoModule.writeTag(buff, var1791, 5, protoModule.wireTypes.lengthDelimited)
		var1800, var2708 = protoModule.writeString(var1800, var1801, self.prompt_id)
		buff = var1800
		var1791 = var1801
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1802, var1803 = protoModule.writeTag(buff, var1791, 6, protoModule.wireTypes.lengthDelimited)
		var1802, var2710 = protoModule.writeString(var1802, var1803, self.prompt_type)
		buff = var1802
		var1791 = var1803
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1804, var1805 = protoModule.writeTag(buff, var1791, 7, protoModule.wireTypes.varint)
		var1804, var2712 = protoModule.writeVarInt(var1804, var1805, self.times_seen)
		buff = var1804
		var1791 = var1805
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1806 = self.content.value:encode()
		local var1807, var1808 = protoModule.writeTag(buff, var1791, 8, protoModule.wireTypes.lengthDelimited)
		var1807, var2715 = protoModule.writeBuffer(var1807, var1808, var1806, buffer.len(var1806))
		buff = var1807
		var1791 = var1808
	end
	if self.sort_id ~= nil then
		local var1809, var1810 = protoModule.writeTag(buff, var1791, 9, protoModule.wireTypes.lengthDelimited)
		var1809, var2717 = protoModule.writeString(var1809, var1810, self.sort_id)
		buff = var1809
		var1791 = var1810
	end
	local buff_1 = buffer.create(var1791)
	buffer.copy(buff_1, 0, buff, 0, var1791)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref), t (ref)
	local var1791 = t_61.new()
	local var1792 = 0
	while var1792 < buffer.len(p61) do
		local _ = nil
		local var1793 = nil
		local var1794, var1795, var1796 = protoModule.readTag(p61, var1792)
		local var1797 = var1794
		var1793 = var1795
		var1792 = var1796
		
		if var1793 == protoModule.wireTypes.varint then
			if var1797 == 7 then
				local _ = nil
				local var1798, var1799 = protoModule.readVarIntI32(p61, var1792)
				var1792 = var1799
				var1791.times_seen = var1798
			else
				local _ = nil
				local var1800, var1801 = protoModule.readVarInt(p61, var1792)
				local _ = var1800
				var1792 = var1801
			end
		end
		if var1793 == protoModule.wireTypes.lengthDelimited then
			if var1797 == 1 then
				local _ = nil
				local var1802, var1803 = protoModule.readBuffer(p61, var1792)
				var1792 = var1803
				var1791.title = buffer.tostring(var1802)
			elseif var1797 == 2 then
				local _ = nil
				local var1804, var1805 = protoModule.readBuffer(p61, var1792)
				var1792 = var1805
				var1791.description = buffer.tostring(var1804)
			elseif var1797 == 3 then
				local _ = nil
				local var1806, var1807 = protoModule.readBuffer(p61, var1792)
				var1792 = var1807
				var1791.primary_text = buffer.tostring(var1806)
			elseif var1797 == 4 then
				local _ = nil
				local var1808, var1809 = protoModule.readBuffer(p61, var1792)
				var1792 = var1809
				var1791.secondary_text = buffer.tostring(var1808)
			elseif var1797 == 5 then
				local _ = nil
				local var1810, var1811 = protoModule.readBuffer(p61, var1792)
				var1792 = var1811
				var1791.prompt_id = buffer.tostring(var1810)
			elseif var1797 == 6 then
				local _ = nil
				local var1812, var1813 = protoModule.readBuffer(p61, var1792)
				var1792 = var1813
				var1791.prompt_type = buffer.tostring(var1812)
			elseif var1797 == 8 then
				local _ = nil
				local var1814, var1815 = protoModule.readBuffer(p61, var1792)
				var1792 = var1815
				var1791.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1814)
				}
			elseif var1797 == 9 then
				local _ = nil
				local var1816, var1817 = protoModule.readBuffer(p61, var1792)
				var1792 = var1817
				var1791.sort_id = buffer.tostring(var1816)
			else
				local _ = nil
				local var1818, var1819 = protoModule.readVarInt(p61, var1792)
				var1792 = var1819 + var1818
			end
		elseif var1793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1820, var1821 = protoModule.readFixed32(p61, var1792)
			local _ = var1820
			var1792 = var1821
		elseif var1793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1822, var1823 = protoModule.readFixed64(p61, var1792)
			local _ = var1822
			var1792 = var1823
		else
			error("Unsupported wire type: " .. var2721)
		end
	end
	return var1791
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
	local var1824 = t_61.new()
	
	if self.title ~= nil then
		var1824.title = self.title
	end
	if self.description ~= nil then
		var1824.description = self.description
	end
	if self.primary_text ~= nil then
		var1824.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1824.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1824.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1824.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1824.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1824.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1824.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1824.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1824.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1824.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1824.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1824.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1824.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1824.sort_id = self.sortId
	end
	return var1824
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
	local var1824 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1825, var1826 = protoModule.writeTag(buff, var1824, 1, protoModule.wireTypes.lengthDelimited)
		var1825, var2757 = protoModule.writeString(var1825, var1826, self.tooltip_text)
		buff = var1825
		var1824 = var1826
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1827, var1828 = protoModule.writeTag(buff, var1824, 2, protoModule.wireTypes.lengthDelimited)
		var1827, var2759 = protoModule.writeString(var1827, var1828, self.prompt_id)
		buff = var1827
		var1824 = var1828
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1829, var1830 = protoModule.writeTag(buff, var1824, 3, protoModule.wireTypes.lengthDelimited)
		var1829, var2761 = protoModule.writeString(var1829, var1830, self.prompt_type)
		buff = var1829
		var1824 = var1830
	end
	local buff_1 = buffer.create(var1824)
	buffer.copy(buff_1, 0, buff, 0, var1824)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1824 = t_62.new()
	local var1825 = 0
	while var1825 < buffer.len(p62) do
		local _ = nil
		local var1826 = nil
		local var1827, var1828, var1829 = protoModule.readTag(p62, var1825)
		local var1830 = var1827
		var1826 = var1828
		var1825 = var1829
		
		if var1826 == protoModule.wireTypes.varint then
			local _ = nil
			local var1831, var1832 = protoModule.readVarInt(p62, var1825)
			local _ = var1831
			var1825 = var1832
			continue
		end
		if var1826 == protoModule.wireTypes.lengthDelimited then
			if var1830 == 1 then
				local _ = nil
				local var1833, var1834 = protoModule.readBuffer(p62, var1825)
				var1825 = var1834
				var1824.tooltip_text = buffer.tostring(var1833)
			elseif var1830 == 2 then
				local _ = nil
				local var1835, var1836 = protoModule.readBuffer(p62, var1825)
				var1825 = var1836
				var1824.prompt_id = buffer.tostring(var1835)
			elseif var1830 == 3 then
				local _ = nil
				local var1837, var1838 = protoModule.readBuffer(p62, var1825)
				var1825 = var1838
				var1824.prompt_type = buffer.tostring(var1837)
			else
				local _ = nil
				local var1839, var1840 = protoModule.readVarInt(p62, var1825)
				var1825 = var1840 + var1839
			end
		elseif var1826 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1841, var1842 = protoModule.readFixed32(p62, var1825)
			local _ = var1841
			var1825 = var1842
		elseif var1826 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1843, var1844 = protoModule.readFixed64(p62, var1825)
			local _ = var1843
			var1825 = var1844
		else
			error("Unsupported wire type: " .. var2765)
		end
	end
	return var1824
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
	local var1845 = t_62.new()
	
	if self.tooltip_text ~= nil then
		var1845.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1845.tooltip_text = self.tooltipText
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
	return var1845
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
	local var1845 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1846, var1847 = protoModule.writeTag(buff, var1845, 1, protoModule.wireTypes.lengthDelimited)
		var1846, var2789 = protoModule.writeString(var1846, var1847, self.media_id)
		buff = var1846
		var1845 = var1847
	end
	if self.title ~= nil and self.title ~= "" then
		local var1848, var1849 = protoModule.writeTag(buff, var1845, 2, protoModule.wireTypes.lengthDelimited)
		var1848, var2791 = protoModule.writeString(var1848, var1849, self.title)
		buff = var1848
		var1845 = var1849
	end
	if self.description ~= nil and self.description ~= "" then
		local var1850, var1851 = protoModule.writeTag(buff, var1845, 3, protoModule.wireTypes.lengthDelimited)
		var1850, var2793 = protoModule.writeString(var1850, var1851, self.description)
		buff = var1850
		var1845 = var1851
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1852, var1853 = protoModule.writeTag(buff, var1845, 4, protoModule.wireTypes.lengthDelimited)
		var1852, var2795 = protoModule.writeString(var1852, var1853, self.prompt_id)
		buff = var1852
		var1845 = var1853
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1854, var1855 = protoModule.writeTag(buff, var1845, 5, protoModule.wireTypes.lengthDelimited)
		var1854, var2797 = protoModule.writeString(var1854, var1855, self.prompt_type)
		buff = var1854
		var1845 = var1855
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1856, var1857 = protoModule.writeTag(buff, var1845, 6, protoModule.wireTypes.lengthDelimited)
		var1856, var2799 = protoModule.writeString(var1856, var1857, self.anchor_tag)
		buff = var1856
		var1845 = var1857
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
				var1845.media_id = buffer.tostring(var1854)
			elseif var1851 == 2 then
				local _ = nil
				local var1856, var1857 = protoModule.readBuffer(p63, var1846)
				var1846 = var1857
				var1845.title = buffer.tostring(var1856)
			elseif var1851 == 3 then
				local _ = nil
				local var1858, var1859 = protoModule.readBuffer(p63, var1846)
				var1846 = var1859
				var1845.description = buffer.tostring(var1858)
			elseif var1851 == 4 then
				local _ = nil
				local var1860, var1861 = protoModule.readBuffer(p63, var1846)
				var1846 = var1861
				var1845.prompt_id = buffer.tostring(var1860)
			elseif var1851 == 5 then
				local _ = nil
				local var1862, var1863 = protoModule.readBuffer(p63, var1846)
				var1846 = var1863
				var1845.prompt_type = buffer.tostring(var1862)
			elseif var1851 == 6 then
				local _ = nil
				local var1864, var1865 = protoModule.readBuffer(p63, var1846)
				var1846 = var1865
				var1845.anchor_tag = buffer.tostring(var1864)
			else
				local _ = nil
				local var1866, var1867 = protoModule.readVarInt(p63, var1846)
				var1846 = var1867 + var1866
			end
		elseif var1847 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1868, var1869 = protoModule.readFixed32(p63, var1846)
			local _ = var1868
			var1846 = var1869
		elseif var1847 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1870, var1871 = protoModule.readFixed64(p63, var1846)
			local _ = var1870
			var1846 = var1871
		else
			error("Unsupported wire type: " .. var2803)
		end
	end
	return var1845
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
	local var1872 = t_63.new()
	
	if self.media_id ~= nil then
		var1872.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1872.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1872.title = self.title
	end
	if self.description ~= nil then
		var1872.description = self.description
	end
	if self.prompt_id ~= nil then
		var1872.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1872.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1872.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1872.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1872.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1872.anchor_tag = self.anchorTag
	end
	return var1872
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
	local var1872 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1873, var1874 = protoModule.writeTag(buff, var1872, 1, protoModule.wireTypes.lengthDelimited)
		var1873, var2833 = protoModule.writeString(var1873, var1874, self.prompt_id)
		buff = var1873
		var1872 = var1874
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1875, var1876 = protoModule.writeTag(buff, var1872, 2, protoModule.wireTypes.lengthDelimited)
		var1875, var2835 = protoModule.writeString(var1875, var1876, self.prompt_type)
		buff = var1875
		var1872 = var1876
	end
	local buff_1 = buffer.create(var1872)
	buffer.copy(buff_1, 0, buff, 0, var1872)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref)
	local var1872 = t_64.new()
	local var1873 = 0
	while var1873 < buffer.len(p64) do
		local _ = nil
		local var1874 = nil
		local var1875, var1876, var1877 = protoModule.readTag(p64, var1873)
		local var1878 = var1875
		var1874 = var1876
		var1873 = var1877
		
		if var1874 == protoModule.wireTypes.varint then
			local _ = nil
			local var1879, var1880 = protoModule.readVarInt(p64, var1873)
			local _ = var1879
			var1873 = var1880
			continue
		end
		if var1874 == protoModule.wireTypes.lengthDelimited then
			if var1878 == 1 then
				local _ = nil
				local var1881, var1882 = protoModule.readBuffer(p64, var1873)
				var1873 = var1882
				var1872.prompt_id = buffer.tostring(var1881)
			elseif var1878 == 2 then
				local _ = nil
				local var1883, var1884 = protoModule.readBuffer(p64, var1873)
				var1873 = var1884
				var1872.prompt_type = buffer.tostring(var1883)
			else
				local _ = nil
				local var1885, var1886 = protoModule.readVarInt(p64, var1873)
				var1873 = var1886 + var1885
			end
		elseif var1874 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1887, var1888 = protoModule.readFixed32(p64, var1873)
			local _ = var1887
			var1873 = var1888
		elseif var1874 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1889, var1890 = protoModule.readFixed64(p64, var1873)
			local _ = var1889
			var1873 = var1890
		else
			error("Unsupported wire type: " .. var2839)
		end
	end
	return var1872
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
	local var1891 = t_64.new()
	
	if self.prompt_id ~= nil then
		var1891.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1891.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1891.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1891.prompt_type = self.promptType
	end
	return var1891
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
	local var1891 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1892, var1893 = protoModule.writeTag(buff, var1891, 1, protoModule.wireTypes.lengthDelimited)
		var1892, var2861 = protoModule.writeString(var1892, var1893, self.upsell_prompt)
		buff = var1892
		var1891 = var1893
	end
	local buff_1 = buffer.create(var1891)
	buffer.copy(buff_1, 0, buff, 0, var1891)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1891 = t_65.new()
	local var1892 = 0
	while var1892 < buffer.len(p65) do
		local _ = nil
		local var1893 = nil
		local var1894, var1895, var1896 = protoModule.readTag(p65, var1892)
		local var1897 = var1894
		var1893 = var1895
		var1892 = var1896
		
		if var1893 == protoModule.wireTypes.varint then
			local _ = nil
			local var1898, var1899 = protoModule.readVarInt(p65, var1892)
			local _ = var1898
			var1892 = var1899
			continue
		end
		if var1893 == protoModule.wireTypes.lengthDelimited then
			if var1897 == 1 then
				local _ = nil
				local var1900, var1901 = protoModule.readBuffer(p65, var1892)
				var1892 = var1901
				var1891.upsell_prompt = buffer.tostring(var1900)
			else
				local _ = nil
				local var1902, var1903 = protoModule.readVarInt(p65, var1892)
				var1892 = var1903 + var1902
			end
		elseif var1893 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1904, var1905 = protoModule.readFixed32(p65, var1892)
			local _ = var1904
			var1892 = var1905
		elseif var1893 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1906, var1907 = protoModule.readFixed64(p65, var1892)
			local _ = var1906
			var1892 = var1907
		else
			error("Unsupported wire type: " .. var2865)
		end
	end
	return var1891
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
	local var1908 = t_65.new()
	
	if self.upsell_prompt ~= nil then
		var1908.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1908.upsell_prompt = self.upsellPrompt
	end
	return var1908
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
	local var1908 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1909, var1910 = protoModule.writeTag(buff, var1908, 1, protoModule.wireTypes.lengthDelimited)
		var1909, var2885 = protoModule.writeString(var1909, var1910, self.modal_variant)
		buff = var1909
		var1908 = var1910
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1911, var1912 = protoModule.writeTag(buff, var1908, 2, protoModule.wireTypes.lengthDelimited)
		var1911, var2887 = protoModule.writeString(var1911, var1912, self.modal_sequence)
		buff = var1911
		var1908 = var1912
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1913, var1914 = protoModule.writeTag(buff, var1908, 3, protoModule.wireTypes.lengthDelimited)
		var1913, var2889 = protoModule.writeString(var1913, var1914, self.conversation_id)
		buff = var1913
		var1908 = var1914
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1915, var1916 = protoModule.writeTag(buff, var1908, 4, protoModule.wireTypes.lengthDelimited)
		var1915, var2891 = protoModule.writeString(var1915, var1916, self.friend_id)
		buff = var1915
		var1908 = var1916
	end
	local buff_1 = buffer.create(var1908)
	buffer.copy(buff_1, 0, buff, 0, var1908)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref)
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
				var1908.modal_variant = buffer.tostring(var1917)
			elseif var1914 == 2 then
				local _ = nil
				local var1919, var1920 = protoModule.readBuffer(p66, var1909)
				var1909 = var1920
				var1908.modal_sequence = buffer.tostring(var1919)
			elseif var1914 == 3 then
				local _ = nil
				local var1921, var1922 = protoModule.readBuffer(p66, var1909)
				var1909 = var1922
				var1908.conversation_id = buffer.tostring(var1921)
			elseif var1914 == 4 then
				local _ = nil
				local var1923, var1924 = protoModule.readBuffer(p66, var1909)
				var1909 = var1924
				var1908.friend_id = buffer.tostring(var1923)
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
			error("Unsupported wire type: " .. var2895)
		end
	end
	return var1908
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
	local var1931 = t_66.new()
	
	if self.modal_variant ~= nil then
		var1931.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1931.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1931.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1931.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1931.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1931.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1931.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1931.friend_id = self.friendId
	end
	return var1931
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
	local var1931 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1932, var1933 = protoModule.writeTag(buff, var1931, 1, protoModule.wireTypes.lengthDelimited)
		var1932, var2921 = protoModule.writeString(var1932, var1933, self.event_id)
		buff = var1932
		var1931 = var1933
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1934, var1935 = protoModule.writeTag(buff, var1931, 2, protoModule.wireTypes.lengthDelimited)
		var1934, var2923 = protoModule.writeString(var1934, var1935, self.universe_id)
		buff = var1934
		var1931 = var1935
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1936, var1937 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1936, var2925 = protoModule.writeString(var1936, var1937, i)
			local var1938 = v:encode()
			var1937, var2927 = protoModule.writeTag(var1936, var1937, 2, protoModule.wireTypes.lengthDelimited)
			var1937, var2927 = protoModule.writeBuffer(var1937, var2927, var1938, buffer.len(var1938))
			local var1939 = var1937
			local var1940 = var2927
			local var1941, var1942 = protoModule.writeTag(buff, var1931, 3, protoModule.wireTypes.lengthDelimited)
			var1941, var2931 = protoModule.writeBuffer(var1941, var1942, var1939, var1940)
			buff = var1941
			var1931 = var1942
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1943, var1944 = protoModule.writeTag(buff, var1931, 4, protoModule.wireTypes.lengthDelimited)
			var1943, var2933 = protoModule.writeString(var1943, var1944, v)
			buff = var1943
			var1931 = var1944
		end
	end
	local buff_1 = buffer.create(var1931)
	buffer.copy(buff_1, 0, buff, 0, var1931)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1945 = t_67.new()
	local var1946 = 0
	while var1946 < buffer.len(p67) do
		local _ = nil
		local var1947 = nil
		local var1948, var1949, var1950 = protoModule.readTag(p67, var1946)
		local var1951 = var1948
		var1947 = var1949
		var1946 = var1950
		
		if var1947 == protoModule.wireTypes.varint then
			local _ = nil
			local var1952, var1953 = protoModule.readVarInt(p67, var1946)
			local _ = var1952
			var1946 = var1953
			continue
		end
		if var1947 == protoModule.wireTypes.lengthDelimited then
			if var1951 == 1 then
				local _ = nil
				local var1954, var1955 = protoModule.readBuffer(p67, var1946)
				var1946 = var1955
				var1945.event_id = buffer.tostring(var1954)
			elseif var1951 == 2 then
				local _ = nil
				local var1956, var1957 = protoModule.readBuffer(p67, var1946)
				var1946 = var1957
				var1945.universe_id = buffer.tostring(var1956)
			elseif var1951 == 3 then
				local _ = nil
				local var1958, var1959 = protoModule.readBuffer(p67, var1946)
				var1946 = var1959
				var1958 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1958)
				var1945.entry_map[var1958.key or ""] = var1958.value or t.FeedEntry.new()
			elseif var1951 == 4 then
				local _ = nil
				local var1960, var1961 = protoModule.readBuffer(p67, var1946)
				var1946 = var1961
				table.insert(var1945.entry_order, buffer.tostring(var1960))
			else
				local _ = nil
				local var1962, var1963 = protoModule.readVarInt(p67, var1946)
				var1946 = var1963 + var1962
			end
		elseif var1947 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1964, var1965 = protoModule.readFixed32(p67, var1946)
			local _ = var1964
			var1946 = var1965
		elseif var1947 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1966, var1967 = protoModule.readFixed64(p67, var1946)
			local _ = var1966
			var1946 = var1967
		else
			error("Unsupported wire type: " .. var2937)
		end
	end
	return var1945
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
	local var1968 = t_67.new()
	
	if self.event_id ~= nil then
		var1968.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1968.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1968.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1968.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1968.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1968.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1968.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1968.entry_order = t_1
	end
	return var1968
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
	local var1969 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1970, var1971 = protoModule.writeTag(buff, var1969, 1, protoModule.wireTypes.lengthDelimited)
		var1970, var2969 = protoModule.writeString(var1970, var1971, self.key)
		buff = var1970
		var1969 = var1971
	end
	if self.value ~= nil then
		local var1972 = self.value:encode()
		local var1973, var1974 = protoModule.writeTag(buff, var1969, 2, protoModule.wireTypes.lengthDelimited)
		var1973, var2972 = protoModule.writeBuffer(var1973, var1974, var1972, buffer.len(var1972))
		buff = var1973
		var1969 = var1974
	end
	local buff_1 = buffer.create(var1969)
	buffer.copy(buff_1, 0, buff, 0, var1969)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var1969 = t_68.new()
	local var1970 = 0
	while var1970 < buffer.len(p68) do
		local _ = nil
		local var1971 = nil
		local var1972, var1973, var1974 = protoModule.readTag(p68, var1970)
		local var1975 = var1972
		var1971 = var1973
		var1970 = var1974
		
		if var1971 == protoModule.wireTypes.varint then
			local _ = nil
			local var1976, var1977 = protoModule.readVarInt(p68, var1970)
			local _ = var1976
			var1970 = var1977
			continue
		end
		if var1971 == protoModule.wireTypes.lengthDelimited then
			if var1975 == 1 then
				local _ = nil
				local var1978, var1979 = protoModule.readBuffer(p68, var1970)
				var1970 = var1979
				var1969.key = buffer.tostring(var1978)
			elseif var1975 == 2 then
				local _ = nil
				local var1980, var1981 = protoModule.readBuffer(p68, var1970)
				var1970 = var1981
				var1969.value = t.FeedEntry.decode(var1980)
			else
				local _ = nil
				local var1982, var1983 = protoModule.readVarInt(p68, var1970)
				var1970 = var1983 + var1982
			end
		elseif var1971 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1984, var1985 = protoModule.readFixed32(p68, var1970)
			local _ = var1984
			var1970 = var1985
		elseif var1971 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1986, var1987 = protoModule.readFixed64(p68, var1970)
			local _ = var1986
			var1970 = var1987
		else
			error("Unsupported wire type: " .. var2976)
		end
	end
	return var1969
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
	local var1988 = t_68.new()
	
	if self.key ~= nil then
		var1988.key = self.key
	end
	if self.value ~= nil then
		var1988.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1988
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
	local var1988 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1989, var1990 = protoModule.writeTag(buff, var1988, 1, protoModule.wireTypes.lengthDelimited)
		var1989, var2998 = protoModule.writeString(var1989, var1990, self.event_id)
		buff = var1989
		var1988 = var1990
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1991, var1992 = protoModule.writeTag(buff, var1988, 2, protoModule.wireTypes.lengthDelimited)
		var1991, var3000 = protoModule.writeString(var1991, var1992, self.universe_id)
		buff = var1991
		var1988 = var1992
	end
	local buff_1 = buffer.create(var1988)
	buffer.copy(buff_1, 0, buff, 0, var1988)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1988 = t_69.new()
	local var1989 = 0
	while var1989 < buffer.len(p69) do
		local _ = nil
		local var1990 = nil
		local var1991, var1992, var1993 = protoModule.readTag(p69, var1989)
		local var1994 = var1991
		var1990 = var1992
		var1989 = var1993
		
		if var1990 == protoModule.wireTypes.varint then
			local _ = nil
			local var1995, var1996 = protoModule.readVarInt(p69, var1989)
			local _ = var1995
			var1989 = var1996
			continue
		end
		if var1990 == protoModule.wireTypes.lengthDelimited then
			if var1994 == 1 then
				local _ = nil
				local var1997, var1998 = protoModule.readBuffer(p69, var1989)
				var1989 = var1998
				var1988.event_id = buffer.tostring(var1997)
			elseif var1994 == 2 then
				local _ = nil
				local var1999, var2000 = protoModule.readBuffer(p69, var1989)
				var1989 = var2000
				var1988.universe_id = buffer.tostring(var1999)
			else
				local _ = nil
				local var2001, var2002 = protoModule.readVarInt(p69, var1989)
				var1989 = var2002 + var2001
			end
		elseif var1990 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2003, var2004 = protoModule.readFixed32(p69, var1989)
			local _ = var2003
			var1989 = var2004
		elseif var1990 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2005, var2006 = protoModule.readFixed64(p69, var1989)
			local _ = var2005
			var1989 = var2006
		else
			error("Unsupported wire type: " .. var3004)
		end
	end
	return var1988
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
	local var2007 = t_69.new()
	
	if self.event_id ~= nil then
		var2007.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2007.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2007.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2007.universe_id = self.universeId
	end
	return var2007
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
	local var2007 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2008, var2009 = protoModule.writeTag(buff, var2007, 1, protoModule.wireTypes.lengthDelimited)
		var2008, var3026 = protoModule.writeString(var2008, var2009, self.event_id)
		buff = var2008
		var2007 = var2009
	end
	local buff_1 = buffer.create(var2007)
	buffer.copy(buff_1, 0, buff, 0, var2007)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var2007 = t_70.new()
	local var2008 = 0
	while var2008 < buffer.len(p70) do
		local _ = nil
		local var2009 = nil
		local var2010, var2011, var2012 = protoModule.readTag(p70, var2008)
		local var2013 = var2010
		var2009 = var2011
		var2008 = var2012
		
		if var2009 == protoModule.wireTypes.varint then
			local _ = nil
			local var2014, var2015 = protoModule.readVarInt(p70, var2008)
			local _ = var2014
			var2008 = var2015
			continue
		end
		if var2009 == protoModule.wireTypes.lengthDelimited then
			if var2013 == 1 then
				local _ = nil
				local var2016, var2017 = protoModule.readBuffer(p70, var2008)
				var2008 = var2017
				var2007.event_id = buffer.tostring(var2016)
			else
				local _ = nil
				local var2018, var2019 = protoModule.readVarInt(p70, var2008)
				var2008 = var2019 + var2018
			end
		elseif var2009 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2020, var2021 = protoModule.readFixed32(p70, var2008)
			local _ = var2020
			var2008 = var2021
		elseif var2009 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2022, var2023 = protoModule.readFixed64(p70, var2008)
			local _ = var2022
			var2008 = var2023
		else
			error("Unsupported wire type: " .. var3030)
		end
	end
	return var2007
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
	local var2024 = t_70.new()
	
	if self.event_id ~= nil then
		var2024.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2024.event_id = self.eventId
	end
	return var2024
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
	local var2024 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2025, var2026 = protoModule.writeTag(buff, var2024, 1, protoModule.wireTypes.lengthDelimited)
		var2025, var3050 = protoModule.writeString(var2025, var2026, self.event_id)
		buff = var2025
		var2024 = var2026
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2027, var2028 = protoModule.writeTag(buff, var2024, 2, protoModule.wireTypes.lengthDelimited)
		var2027, var3052 = protoModule.writeString(var2027, var2028, self.universe_id)
		buff = var2027
		var2024 = var2028
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var2029 = v:encode()
			local var2030, var2031 = protoModule.writeTag(buff, var2024, 3, protoModule.wireTypes.lengthDelimited)
			var2030, var3055 = protoModule.writeBuffer(var2030, var2031, var2029, buffer.len(var2029))
			buff = var2030
			var2024 = var2031
		end
	end
	local buff_1 = buffer.create(var2024)
	buffer.copy(buff_1, 0, buff, 0, var2024)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var2032 = t_71.new()
	local var2033 = 0
	while var2033 < buffer.len(p71) do
		local _ = nil
		local var2034 = nil
		local var2035, var2036, var2037 = protoModule.readTag(p71, var2033)
		local var2038 = var2035
		var2034 = var2036
		var2033 = var2037
		
		if var2034 == protoModule.wireTypes.varint then
			local _ = nil
			local var2039, var2040 = protoModule.readVarInt(p71, var2033)
			local _ = var2039
			var2033 = var2040
			continue
		end
		if var2034 == protoModule.wireTypes.lengthDelimited then
			if var2038 == 1 then
				local _ = nil
				local var2041, var2042 = protoModule.readBuffer(p71, var2033)
				var2033 = var2042
				var2032.event_id = buffer.tostring(var2041)
			elseif var2038 == 2 then
				local _ = nil
				local var2043, var2044 = protoModule.readBuffer(p71, var2033)
				var2033 = var2044
				var2032.universe_id = buffer.tostring(var2043)
			elseif var2038 == 3 then
				local _ = nil
				local var2045, var2046 = protoModule.readBuffer(p71, var2033)
				var2033 = var2046
				table.insert(var2032.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var2045))
			else
				local _ = nil
				local var2047, var2048 = protoModule.readVarInt(p71, var2033)
				var2033 = var2048 + var2047
			end
		elseif var2034 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2049, var2050 = protoModule.readFixed32(p71, var2033)
			local _ = var2049
			var2033 = var2050
		elseif var2034 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2051, var2052 = protoModule.readFixed64(p71, var2033)
			local _ = var2051
			var2033 = var2052
		else
			error("Unsupported wire type: " .. var3059)
		end
	end
	return var2032
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
	local var2053 = t_71.new()
	
	if self.event_id ~= nil then
		var2053.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2053.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2053.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2053.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2053.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2053.rsvp_users = t_1
	end
	return var2053
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
	local var2054 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2055, var2056 = protoModule.writeTag(buff, var2054, 1, protoModule.wireTypes.varint)
		var2055, var3086 = protoModule.writeVarInt(var2055, var2056, self.user_id)
		buff = var2055
		var2054 = var2056
	end
	local buff_1 = buffer.create(var2054)
	buffer.copy(buff_1, 0, buff, 0, var2054)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2054 = t_72.new()
	local var2055 = 0
	while var2055 < buffer.len(p72) do
		local _ = nil
		local _ = nil
		local var2056, var2057, var2058 = protoModule.readTag(p72, var2055)
		local var2059 = var2056
		local var2060 = var2057
		var2055 = var2058
		
		if var2060 == protoModule.wireTypes.varint then
			if var2059 == 1 then
				local _ = nil
				local var2061, var2062 = protoModule.readVarIntI64(p72, var2055)
				var2055 = var2062
				var2054.user_id = var2061
			else
				local _ = nil
				local var2063, var2064 = protoModule.readVarInt(p72, var2055)
				local _ = var2063
				var2055 = var2064
			end
		elseif var2060 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2065, var2066 = protoModule.readVarInt(p72, var2055)
			var2055 = var2066 + var2065
		elseif var2060 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2067, var2068 = protoModule.readFixed32(p72, var2055)
			local _ = var2067
			var2055 = var2068
		elseif var2060 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2069, var2070 = protoModule.readFixed64(p72, var2055)
			local _ = var2069
			var2055 = var2070
		else
			error("Unsupported wire type: " .. var3094)
		end
	end
	return var2054
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
	local var2071 = t_72.new()
	
	if self.user_id ~= nil then
		var2071.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2071.user_id = self.userId
	end
	return var2071
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
	local var2071 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2072, var2073 = protoModule.writeTag(buff, var2071, 1, protoModule.wireTypes.lengthDelimited)
		var2072, var3110 = protoModule.writeString(var2072, var2073, self.event_id)
		buff = var2072
		var2071 = var2073
	end
	local buff_1 = buffer.create(var2071)
	buffer.copy(buff_1, 0, buff, 0, var2071)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2071 = t_73.new()
	local var2072 = 0
	while var2072 < buffer.len(p73) do
		local _ = nil
		local var2073 = nil
		local var2074, var2075, var2076 = protoModule.readTag(p73, var2072)
		local var2077 = var2074
		var2073 = var2075
		var2072 = var2076
		
		if var2073 == protoModule.wireTypes.varint then
			local _ = nil
			local var2078, var2079 = protoModule.readVarInt(p73, var2072)
			local _ = var2078
			var2072 = var2079
			continue
		end
		if var2073 == protoModule.wireTypes.lengthDelimited then
			if var2077 == 1 then
				local _ = nil
				local var2080, var2081 = protoModule.readBuffer(p73, var2072)
				var2072 = var2081
				var2071.event_id = buffer.tostring(var2080)
			else
				local _ = nil
				local var2082, var2083 = protoModule.readVarInt(p73, var2072)
				var2072 = var2083 + var2082
			end
		elseif var2073 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2084, var2085 = protoModule.readFixed32(p73, var2072)
			local _ = var2084
			var2072 = var2085
		elseif var2073 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2086, var2087 = protoModule.readFixed64(p73, var2072)
			local _ = var2086
			var2072 = var2087
		else
			error("Unsupported wire type: " .. var3114)
		end
	end
	return var2071
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
	local var2088 = t_73.new()
	
	if self.event_id ~= nil then
		var2088.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2088.event_id = self.eventId
	end
	return var2088
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
	local var2088 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2089, var2090 = protoModule.writeTag(buff, var2088, 1, protoModule.wireTypes.lengthDelimited)
		var2089, var3134 = protoModule.writeString(var2089, var2090, self.event_id)
		buff = var2089
		var2088 = var2090
	end
	local buff_1 = buffer.create(var2088)
	buffer.copy(buff_1, 0, buff, 0, var2088)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref)
	local var2088 = t_74.new()
	local var2089 = 0
	while var2089 < buffer.len(p74) do
		local _ = nil
		local var2090 = nil
		local var2091, var2092, var2093 = protoModule.readTag(p74, var2089)
		local var2094 = var2091
		var2090 = var2092
		var2089 = var2093
		
		if var2090 == protoModule.wireTypes.varint then
			local _ = nil
			local var2095, var2096 = protoModule.readVarInt(p74, var2089)
			local _ = var2095
			var2089 = var2096
			continue
		end
		if var2090 == protoModule.wireTypes.lengthDelimited then
			if var2094 == 1 then
				local _ = nil
				local var2097, var2098 = protoModule.readBuffer(p74, var2089)
				var2089 = var2098
				var2088.event_id = buffer.tostring(var2097)
			else
				local _ = nil
				local var2099, var2100 = protoModule.readVarInt(p74, var2089)
				var2089 = var2100 + var2099
			end
		elseif var2090 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2101, var2102 = protoModule.readFixed32(p74, var2089)
			local _ = var2101
			var2089 = var2102
		elseif var2090 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2103, var2104 = protoModule.readFixed64(p74, var2089)
			local _ = var2103
			var2089 = var2104
		else
			error("Unsupported wire type: " .. var3138)
		end
	end
	return var2088
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
	local var2105 = t_74.new()
	
	if self.event_id ~= nil then
		var2105.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2105.event_id = self.eventId
	end
	return var2105
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
	local var2105 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2106, var2107 = protoModule.writeTag(buff, var2105, 1, protoModule.wireTypes.lengthDelimited)
		var2106, var3158 = protoModule.writeString(var2106, var2107, self.event_id)
		buff = var2106
		var2105 = var2107
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2108, var2109 = protoModule.writeTag(buff, var2105, 2, protoModule.wireTypes.lengthDelimited)
		var2108, var3160 = protoModule.writeString(var2108, var2109, self.universe_id)
		buff = var2108
		var2105 = var2109
	end
	local buff_1 = buffer.create(var2105)
	buffer.copy(buff_1, 0, buff, 0, var2105)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref)
	local var2105 = t_75.new()
	local var2106 = 0
	while var2106 < buffer.len(p75) do
		local _ = nil
		local var2107 = nil
		local var2108, var2109, var2110 = protoModule.readTag(p75, var2106)
		local var2111 = var2108
		var2107 = var2109
		var2106 = var2110
		
		if var2107 == protoModule.wireTypes.varint then
			local _ = nil
			local var2112, var2113 = protoModule.readVarInt(p75, var2106)
			local _ = var2112
			var2106 = var2113
			continue
		end
		if var2107 == protoModule.wireTypes.lengthDelimited then
			if var2111 == 1 then
				local _ = nil
				local var2114, var2115 = protoModule.readBuffer(p75, var2106)
				var2106 = var2115
				var2105.event_id = buffer.tostring(var2114)
			elseif var2111 == 2 then
				local _ = nil
				local var2116, var2117 = protoModule.readBuffer(p75, var2106)
				var2106 = var2117
				var2105.universe_id = buffer.tostring(var2116)
			else
				local _ = nil
				local var2118, var2119 = protoModule.readVarInt(p75, var2106)
				var2106 = var2119 + var2118
			end
		elseif var2107 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2120, var2121 = protoModule.readFixed32(p75, var2106)
			local _ = var2120
			var2106 = var2121
		elseif var2107 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2122, var2123 = protoModule.readFixed64(p75, var2106)
			local _ = var2122
			var2106 = var2123
		else
			error("Unsupported wire type: " .. var3164)
		end
	end
	return var2105
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
	local var2124 = t_75.new()
	
	if self.event_id ~= nil then
		var2124.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2124.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2124.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2124.universe_id = self.universeId
	end
	return var2124
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
	local var2124 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2125, var2126 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2125, var3186 = protoModule.writeString(var2125, var2126, i)
			local var2127 = v:encode()
			var2126, var3188 = protoModule.writeTag(var2125, var2126, 2, protoModule.wireTypes.lengthDelimited)
			var2126, var3188 = protoModule.writeBuffer(var2126, var3188, var2127, buffer.len(var2127))
			local var2128 = var2126
			local var2129 = var3188
			local var2130, var2131 = protoModule.writeTag(buff, var2124, 1, protoModule.wireTypes.lengthDelimited)
			var2130, var3192 = protoModule.writeBuffer(var2130, var2131, var2128, var2129)
			buff = var2130
			var2124 = var2131
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2132, var2133 = protoModule.writeTag(buff, var2124, 2, protoModule.wireTypes.lengthDelimited)
			var2132, var3194 = protoModule.writeString(var2132, var2133, v)
			buff = var2132
			var2124 = var2133
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2134, var2135 = protoModule.writeTag(buff, var2124, 3, protoModule.wireTypes.lengthDelimited)
		var2134, var3196 = protoModule.writeString(var2134, var2135, self.next_page_token)
		buff = var2134
		var2124 = var2135
	end
	if self.sticky_filter_pills ~= nil then
		local var2136 = self.sticky_filter_pills:encode()
		local var2137, var2138 = protoModule.writeTag(buff, var2124, 4, protoModule.wireTypes.lengthDelimited)
		var2137, var3199 = protoModule.writeBuffer(var2137, var2138, var2136, buffer.len(var2136))
		buff = var2137
		var2124 = var2138
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2139, var2140 = protoModule.writeTag(buff, var2124, 5, protoModule.wireTypes.lengthDelimited)
		var2139, var3201 = protoModule.writeString(var2139, var2140, self.applied_filters)
		buff = var2139
		var2124 = var2140
	end
	local buff_1 = buffer.create(var2124)
	buffer.copy(buff_1, 0, buff, 0, var2124)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2141 = t_76.new()
	local var2142 = 0
	while var2142 < buffer.len(p76) do
		local _ = nil
		local var2143 = nil
		local var2144, var2145, var2146 = protoModule.readTag(p76, var2142)
		local var2147 = var2144
		var2143 = var2145
		var2142 = var2146
		
		if var2143 == protoModule.wireTypes.varint then
			local _ = nil
			local var2148, var2149 = protoModule.readVarInt(p76, var2142)
			local _ = var2148
			var2142 = var2149
			continue
		end
		if var2143 == protoModule.wireTypes.lengthDelimited then
			if var2147 == 1 then
				local _ = nil
				local var2150, var2151 = protoModule.readBuffer(p76, var2142)
				var2142 = var2151
				var2150 = t.ChartsFeedInputData_EntryMapEntry.decode(var2150)
				var2141.entry_map[var2150.key or ""] = var2150.value or t.FeedEntry.new()
			elseif var2147 == 2 then
				local _ = nil
				local var2152, var2153 = protoModule.readBuffer(p76, var2142)
				var2142 = var2153
				table.insert(var2141.entry_order, buffer.tostring(var2152))
			elseif var2147 == 3 then
				local _ = nil
				local var2154, var2155 = protoModule.readBuffer(p76, var2142)
				var2142 = var2155
				var2141.next_page_token = buffer.tostring(var2154)
			elseif var2147 == 4 then
				local _ = nil
				local var2156, var2157 = protoModule.readBuffer(p76, var2142)
				var2142 = var2157
				var2141.sticky_filter_pills = t.FilterPillsInputData.decode(var2156)
			elseif var2147 == 5 then
				local _ = nil
				local var2158, var2159 = protoModule.readBuffer(p76, var2142)
				var2142 = var2159
				var2141.applied_filters = buffer.tostring(var2158)
			else
				local _ = nil
				local var2160, var2161 = protoModule.readVarInt(p76, var2142)
				var2142 = var2161 + var2160
			end
		elseif var2143 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2162, var2163 = protoModule.readFixed32(p76, var2142)
			local _ = var2162
			var2142 = var2163
		elseif var2143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2164, var2165 = protoModule.readFixed64(p76, var2142)
			local _ = var2164
			var2142 = var2165
		else
			error("Unsupported wire type: " .. var3205)
		end
	end
	return var2141
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
	local var2166 = t_76.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2166.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2166.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2166.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2166.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2166.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2166.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2166.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2166.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2166.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2166.applied_filters = self.appliedFilters
	end
	return var2166
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
	local var2167 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2168, var2169 = protoModule.writeTag(buff, var2167, 1, protoModule.wireTypes.lengthDelimited)
		var2168, var3239 = protoModule.writeString(var2168, var2169, self.key)
		buff = var2168
		var2167 = var2169
	end
	if self.value ~= nil then
		local var2170 = self.value:encode()
		local var2171, var2172 = protoModule.writeTag(buff, var2167, 2, protoModule.wireTypes.lengthDelimited)
		var2171, var3242 = protoModule.writeBuffer(var2171, var2172, var2170, buffer.len(var2170))
		buff = var2171
		var2167 = var2172
	end
	local buff_1 = buffer.create(var2167)
	buffer.copy(buff_1, 0, buff, 0, var2167)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2167 = t_77.new()
	local var2168 = 0
	while var2168 < buffer.len(p77) do
		local _ = nil
		local var2169 = nil
		local var2170, var2171, var2172 = protoModule.readTag(p77, var2168)
		local var2173 = var2170
		var2169 = var2171
		var2168 = var2172
		
		if var2169 == protoModule.wireTypes.varint then
			local _ = nil
			local var2174, var2175 = protoModule.readVarInt(p77, var2168)
			local _ = var2174
			var2168 = var2175
			continue
		end
		if var2169 == protoModule.wireTypes.lengthDelimited then
			if var2173 == 1 then
				local _ = nil
				local var2176, var2177 = protoModule.readBuffer(p77, var2168)
				var2168 = var2177
				var2167.key = buffer.tostring(var2176)
			elseif var2173 == 2 then
				local _ = nil
				local var2178, var2179 = protoModule.readBuffer(p77, var2168)
				var2168 = var2179
				var2167.value = t.FeedEntry.decode(var2178)
			else
				local _ = nil
				local var2180, var2181 = protoModule.readVarInt(p77, var2168)
				var2168 = var2181 + var2180
			end
		elseif var2169 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2182, var2183 = protoModule.readFixed32(p77, var2168)
			local _ = var2182
			var2168 = var2183
		elseif var2169 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2184, var2185 = protoModule.readFixed64(p77, var2168)
			local _ = var2184
			var2168 = var2185
		else
			error("Unsupported wire type: " .. var3246)
		end
	end
	return var2167
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
	local var2186 = t_77.new()
	
	if self.key ~= nil then
		var2186.key = self.key
	end
	if self.value ~= nil then
		var2186.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2186
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
	local var2186 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2187 = v:encode()
			local var2188, var2189 = protoModule.writeTag(buff, var2186, 1, protoModule.wireTypes.lengthDelimited)
			var2188, var3269 = protoModule.writeBuffer(var2188, var2189, var2187, buffer.len(var2187))
			buff = var2188
			var2186 = var2189
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2190, var2191 = protoModule.writeTag(buff, var2186, 2, protoModule.wireTypes.lengthDelimited)
		var2190, var3271 = protoModule.writeString(var2190, var2191, self.sort_id)
		buff = var2190
		var2186 = var2191
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2192, var2193 = protoModule.writeTag(buff, var2186, 3, protoModule.wireTypes.varint)
		var2192, var3273 = protoModule.writeVarInt(var2192, var2193, self.secondary_sort_id)
		buff = var2192
		var2186 = var2193
	end
	if self.title ~= nil and self.title ~= "" then
		local var2194, var2195 = protoModule.writeTag(buff, var2186, 4, protoModule.wireTypes.lengthDelimited)
		var2194, var3275 = protoModule.writeString(var2194, var2195, self.title)
		buff = var2194
		var2186 = var2195
	end
	if self.primary_sort_id ~= nil then
		local var2196, var2197 = protoModule.writeTag(buff, var2186, 5, protoModule.wireTypes.varint)
		var2196, var3277 = protoModule.writeVarInt(var2196, var2197, self.primary_sort_id)
		buff = var2196
		var2186 = var2197
	end
	if self.applied_filters ~= nil then
		local var2198, var2199 = protoModule.writeTag(buff, var2186, 6, protoModule.wireTypes.lengthDelimited)
		var2198, var3279 = protoModule.writeString(var2198, var2199, self.applied_filters)
		buff = var2198
		var2186 = var2199
	end
	local buff_1 = buffer.create(var2186)
	buffer.copy(buff_1, 0, buff, 0, var2186)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var2200 = t_78.new()
	local var2201 = 0
	while var2201 < buffer.len(p78) do
		local _ = nil
		local var2202 = nil
		local var2203, var2204, var2205 = protoModule.readTag(p78, var2201)
		local var2206 = var2203
		var2202 = var2204
		var2201 = var2205
		
		if var2202 == protoModule.wireTypes.varint then
			if var2206 == 3 then
				local _ = nil
				local var2207, var2208 = protoModule.readVarIntI32(p78, var2201)
				var2201 = var2208
				var2200.secondary_sort_id = var2207
			elseif var2206 == 5 then
				local _ = nil
				local var2209, var2210 = protoModule.readVarIntI32(p78, var2201)
				var2201 = var2210
				var2200.primary_sort_id = var2209
			else
				local _ = nil
				local var2211, var2212 = protoModule.readVarInt(p78, var2201)
				local _ = var2211
				var2201 = var2212
			end
		end
		if var2202 == protoModule.wireTypes.lengthDelimited then
			if var2206 == 1 then
				local _ = nil
				local var2213, var2214 = protoModule.readBuffer(p78, var2201)
				var2201 = var2214
				table.insert(var2200.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2213))
			elseif var2206 == 2 then
				local _ = nil
				local var2215, var2216 = protoModule.readBuffer(p78, var2201)
				var2201 = var2216
				var2200.sort_id = buffer.tostring(var2215)
			elseif var2206 == 4 then
				local _ = nil
				local var2217, var2218 = protoModule.readBuffer(p78, var2201)
				var2201 = var2218
				var2200.title = buffer.tostring(var2217)
			elseif var2206 == 6 then
				local _ = nil
				local var2219, var2220 = protoModule.readBuffer(p78, var2201)
				var2201 = var2220
				var2200.applied_filters = buffer.tostring(var2219)
			else
				local _ = nil
				local var2221, var2222 = protoModule.readVarInt(p78, var2201)
				var2201 = var2222 + var2221
			end
		elseif var2202 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2223, var2224 = protoModule.readFixed32(p78, var2201)
			local _ = var2223
			var2201 = var2224
		elseif var2202 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2225, var2226 = protoModule.readFixed64(p78, var2201)
			local _ = var2225
			var2201 = var2226
		else
			error("Unsupported wire type: " .. var3283)
		end
	end
	return var2200
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
	local var2227 = t_78.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2227.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2227.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2227.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2227.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2227.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2227.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2227.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2227.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2227.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2227.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2227.applied_filters = self.appliedFilters
	end
	return var2227
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
	local var2228 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2229, var2230 = protoModule.writeTag(buff, var2228, 1, protoModule.wireTypes.lengthDelimited)
		var2229, var3316 = protoModule.writeString(var2229, var2230, self.filter_id)
		buff = var2229
		var2228 = var2230
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2231, var2232 = protoModule.writeTag(buff, var2228, 2, protoModule.wireTypes.lengthDelimited)
		var2231, var3318 = protoModule.writeString(var2231, var2232, self.display_name)
		buff = var2231
		var2228 = var2232
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2233 = v:encode()
			local var2234, var2235 = protoModule.writeTag(buff, var2228, 3, protoModule.wireTypes.lengthDelimited)
			var2234, var3321 = protoModule.writeBuffer(var2234, var2235, var2233, buffer.len(var2233))
			buff = var2234
			var2228 = var2235
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2236, var2237 = protoModule.writeTag(buff, var2228, 4, protoModule.wireTypes.lengthDelimited)
		var2236, var3323 = protoModule.writeString(var2236, var2237, self.default_option_id)
		buff = var2236
		var2228 = var2237
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2238, var2239 = protoModule.writeTag(buff, var2228, 5, protoModule.wireTypes.lengthDelimited)
		var2238, var3325 = protoModule.writeString(var2238, var2239, self.selected_option_id)
		buff = var2238
		var2228 = var2239
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2240, var2241 = protoModule.writeTag(buff, var2228, 6, protoModule.wireTypes.lengthDelimited)
		var2240, var3327 = protoModule.writeString(var2240, var2241, self.filter_type)
		buff = var2240
		var2228 = var2241
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2242, var2243 = protoModule.writeTag(buff, var2228, 7, protoModule.wireTypes.lengthDelimited)
			var2242, var3329 = protoModule.writeString(var2242, var2243, v)
			buff = var2242
			var2228 = var2243
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2244, var2245 = protoModule.writeTag(buff, var2228, 8, protoModule.wireTypes.lengthDelimited)
		var2244, var3331 = protoModule.writeString(var2244, var2245, self.info_text)
		buff = var2244
		var2228 = var2245
	end
	local buff_1 = buffer.create(var2228)
	buffer.copy(buff_1, 0, buff, 0, var2228)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2246 = t_79.new()
	local var2247 = 0
	while var2247 < buffer.len(p79) do
		local _ = nil
		local var2248 = nil
		local var2249, var2250, var2251 = protoModule.readTag(p79, var2247)
		local var2252 = var2249
		var2248 = var2250
		var2247 = var2251
		
		if var2248 == protoModule.wireTypes.varint then
			local _ = nil
			local var2253, var2254 = protoModule.readVarInt(p79, var2247)
			local _ = var2253
			var2247 = var2254
			continue
		end
		if var2248 == protoModule.wireTypes.lengthDelimited then
			if var2252 == 1 then
				local _ = nil
				local var2255, var2256 = protoModule.readBuffer(p79, var2247)
				var2247 = var2256
				var2246.filter_id = buffer.tostring(var2255)
			elseif var2252 == 2 then
				local _ = nil
				local var2257, var2258 = protoModule.readBuffer(p79, var2247)
				var2247 = var2258
				var2246.display_name = buffer.tostring(var2257)
			elseif var2252 == 3 then
				local _ = nil
				local var2259, var2260 = protoModule.readBuffer(p79, var2247)
				var2247 = var2260
				table.insert(var2246.options, t.FilterPillsInputData_FilterOption.decode(var2259))
			elseif var2252 == 4 then
				local _ = nil
				local var2261, var2262 = protoModule.readBuffer(p79, var2247)
				var2247 = var2262
				var2246.default_option_id = buffer.tostring(var2261)
			elseif var2252 == 5 then
				local _ = nil
				local var2263, var2264 = protoModule.readBuffer(p79, var2247)
				var2247 = var2264
				var2246.selected_option_id = buffer.tostring(var2263)
			elseif var2252 == 6 then
				local _ = nil
				local var2265, var2266 = protoModule.readBuffer(p79, var2247)
				var2247 = var2266
				var2246.filter_type = buffer.tostring(var2265)
			elseif var2252 == 7 then
				local _ = nil
				local var2267, var2268 = protoModule.readBuffer(p79, var2247)
				var2247 = var2268
				table.insert(var2246.inactive_option_ids, buffer.tostring(var2267))
			elseif var2252 == 8 then
				local _ = nil
				local var2269, var2270 = protoModule.readBuffer(p79, var2247)
				var2247 = var2270
				var2246.info_text = buffer.tostring(var2269)
			else
				local _ = nil
				local var2271, var2272 = protoModule.readVarInt(p79, var2247)
				var2247 = var2272 + var2271
			end
		elseif var2248 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2273, var2274 = protoModule.readFixed32(p79, var2247)
			local _ = var2273
			var2247 = var2274
		elseif var2248 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2275, var2276 = protoModule.readFixed64(p79, var2247)
			local _ = var2275
			var2247 = var2276
		else
			error("Unsupported wire type: " .. var3335)
		end
	end
	return var2246
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
	local var2277 = t_79.new()
	
	if self.filter_id ~= nil then
		var2277.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2277.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2277.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2277.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2277.options = t_1
	end
	if self.default_option_id ~= nil then
		var2277.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2277.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2277.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2277.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2277.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2277.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2277.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2277.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2277.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2277.info_text = self.infoText
	end
	return var2277
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
	local var2278 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2279, var2280 = protoModule.writeTag(buff, var2278, 1, protoModule.wireTypes.lengthDelimited)
		var2279, var3374 = protoModule.writeString(var2279, var2280, self.option_id)
		buff = var2279
		var2278 = var2280
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2281, var2282 = protoModule.writeTag(buff, var2278, 2, protoModule.wireTypes.lengthDelimited)
		var2281, var3376 = protoModule.writeString(var2281, var2282, self.display_name)
		buff = var2281
		var2278 = var2282
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2283, var2284 = protoModule.writeTag(buff, var2278, 3, protoModule.wireTypes.lengthDelimited)
		var2283, var3378 = protoModule.writeString(var2283, var2284, self.option_context_tag)
		buff = var2283
		var2278 = var2284
	end
	local buff_1 = buffer.create(var2278)
	buffer.copy(buff_1, 0, buff, 0, var2278)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref)
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
				var2278.option_id = buffer.tostring(var2287)
			elseif var2284 == 2 then
				local _ = nil
				local var2289, var2290 = protoModule.readBuffer(p80, var2279)
				var2279 = var2290
				var2278.display_name = buffer.tostring(var2289)
			elseif var2284 == 3 then
				local _ = nil
				local var2291, var2292 = protoModule.readBuffer(p80, var2279)
				var2279 = var2292
				var2278.option_context_tag = buffer.tostring(var2291)
			else
				local _ = nil
				local var2293, var2294 = protoModule.readVarInt(p80, var2279)
				var2279 = var2294 + var2293
			end
		elseif var2280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2295, var2296 = protoModule.readFixed32(p80, var2279)
			local _ = var2295
			var2279 = var2296
		elseif var2280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2297, var2298 = protoModule.readFixed64(p80, var2279)
			local _ = var2297
			var2279 = var2298
		else
			error("Unsupported wire type: " .. var3382)
		end
	end
	return var2278
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
	local var2299 = t_80.new()
	
	if self.option_id ~= nil then
		var2299.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2299.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2299.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2299.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2299.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2299.option_context_tag = self.optionContextTag
	end
	return var2299
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
	local var2299 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2300 = v:encode()
			local var2301, var2302 = protoModule.writeTag(buff, var2299, 1, protoModule.wireTypes.lengthDelimited)
			var2301, var3407 = protoModule.writeBuffer(var2301, var2302, var2300, buffer.len(var2300))
			buff = var2301
			var2299 = var2302
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2303, var2304 = protoModule.writeTag(buff, var2299, 2, protoModule.wireTypes.lengthDelimited)
		var2303, var3409 = protoModule.writeString(var2303, var2304, self.selected_sort_id)
		buff = var2303
		var2299 = var2304
	end
	local buff_1 = buffer.create(var2299)
	buffer.copy(buff_1, 0, buff, 0, var2299)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2305 = t_81.new()
	local var2306 = 0
	while var2306 < buffer.len(p81) do
		local _ = nil
		local var2307 = nil
		local var2308, var2309, var2310 = protoModule.readTag(p81, var2306)
		local var2311 = var2308
		var2307 = var2309
		var2306 = var2310
		
		if var2307 == protoModule.wireTypes.varint then
			local _ = nil
			local var2312, var2313 = protoModule.readVarInt(p81, var2306)
			local _ = var2312
			var2306 = var2313
			continue
		end
		if var2307 == protoModule.wireTypes.lengthDelimited then
			if var2311 == 1 then
				local _ = nil
				local var2314, var2315 = protoModule.readBuffer(p81, var2306)
				var2306 = var2315
				table.insert(var2305.sort_options, t.SortSelectorInputData_SortOption.decode(var2314))
			elseif var2311 == 2 then
				local _ = nil
				local var2316, var2317 = protoModule.readBuffer(p81, var2306)
				var2306 = var2317
				var2305.selected_sort_id = buffer.tostring(var2316)
			else
				local _ = nil
				local var2318, var2319 = protoModule.readVarInt(p81, var2306)
				var2306 = var2319 + var2318
			end
		elseif var2307 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2320, var2321 = protoModule.readFixed32(p81, var2306)
			local _ = var2320
			var2306 = var2321
		elseif var2307 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2322, var2323 = protoModule.readFixed64(p81, var2306)
			local _ = var2322
			var2306 = var2323
		else
			error("Unsupported wire type: " .. var3413)
		end
	end
	return var2305
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
	local var2324 = t_81.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2324.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2324.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2324.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2324.selected_sort_id = self.selectedSortId
	end
	return var2324
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
	local var2325 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2326, var2327 = protoModule.writeTag(buff, var2325, 1, protoModule.wireTypes.lengthDelimited)
		var2326, var3438 = protoModule.writeString(var2326, var2327, self.sort_id)
		buff = var2326
		var2325 = var2327
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2328, var2329 = protoModule.writeTag(buff, var2325, 2, protoModule.wireTypes.lengthDelimited)
		var2328, var3440 = protoModule.writeString(var2328, var2329, self.display_name)
		buff = var2328
		var2325 = var2329
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2330, var2331 = protoModule.writeTag(buff, var2325, 3, protoModule.wireTypes.lengthDelimited)
		var2330, var3442 = protoModule.writeString(var2330, var2331, self.content_type)
		buff = var2330
		var2325 = var2331
	end
	local buff_1 = buffer.create(var2325)
	buffer.copy(buff_1, 0, buff, 0, var2325)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref)
	local var2325 = t_82.new()
	local var2326 = 0
	while var2326 < buffer.len(p82) do
		local _ = nil
		local var2327 = nil
		local var2328, var2329, var2330 = protoModule.readTag(p82, var2326)
		local var2331 = var2328
		var2327 = var2329
		var2326 = var2330
		
		if var2327 == protoModule.wireTypes.varint then
			local _ = nil
			local var2332, var2333 = protoModule.readVarInt(p82, var2326)
			local _ = var2332
			var2326 = var2333
			continue
		end
		if var2327 == protoModule.wireTypes.lengthDelimited then
			if var2331 == 1 then
				local _ = nil
				local var2334, var2335 = protoModule.readBuffer(p82, var2326)
				var2326 = var2335
				var2325.sort_id = buffer.tostring(var2334)
			elseif var2331 == 2 then
				local _ = nil
				local var2336, var2337 = protoModule.readBuffer(p82, var2326)
				var2326 = var2337
				var2325.display_name = buffer.tostring(var2336)
			elseif var2331 == 3 then
				local _ = nil
				local var2338, var2339 = protoModule.readBuffer(p82, var2326)
				var2326 = var2339
				var2325.content_type = buffer.tostring(var2338)
			else
				local _ = nil
				local var2340, var2341 = protoModule.readVarInt(p82, var2326)
				var2326 = var2341 + var2340
			end
		elseif var2327 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2342, var2343 = protoModule.readFixed32(p82, var2326)
			local _ = var2342
			var2326 = var2343
		elseif var2327 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2344, var2345 = protoModule.readFixed64(p82, var2326)
			local _ = var2344
			var2326 = var2345
		else
			error("Unsupported wire type: " .. var3446)
		end
	end
	return var2325
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
	local var2346 = t_82.new()
	
	if self.sort_id ~= nil then
		var2346.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2346.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2346.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2346.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2346.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2346.content_type = self.contentType
	end
	return var2346
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
	local var2346 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2347, var2348 = protoModule.writeTag(buff, var2346, 1, protoModule.wireTypes.lengthDelimited)
		var2347, var3470 = protoModule.writeString(var2347, var2348, self.selected_option)
		buff = var2347
		var2346 = var2348
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2349 = v:encode()
			local var2350, var2351 = protoModule.writeTag(buff, var2346, 2, protoModule.wireTypes.lengthDelimited)
			var2350, var3473 = protoModule.writeBuffer(var2350, var2351, var2349, buffer.len(var2349))
			buff = var2350
			var2346 = var2351
		end
	end
	if self.experience_carousel ~= nil then
		local var2352 = self.experience_carousel:encode()
		local var2353, var2354 = protoModule.writeTag(buff, var2346, 3, protoModule.wireTypes.lengthDelimited)
		var2353, var3476 = protoModule.writeBuffer(var2353, var2354, var2352, buffer.len(var2352))
		buff = var2353
		var2346 = var2354
	end
	local buff_1 = buffer.create(var2346)
	buffer.copy(buff_1, 0, buff, 0, var2346)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2355 = t_83.new()
	local var2356 = 0
	while var2356 < buffer.len(p83) do
		local _ = nil
		local var2357 = nil
		local var2358, var2359, var2360 = protoModule.readTag(p83, var2356)
		local var2361 = var2358
		var2357 = var2359
		var2356 = var2360
		
		if var2357 == protoModule.wireTypes.varint then
			local _ = nil
			local var2362, var2363 = protoModule.readVarInt(p83, var2356)
			local _ = var2362
			var2356 = var2363
			continue
		end
		if var2357 == protoModule.wireTypes.lengthDelimited then
			if var2361 == 1 then
				local _ = nil
				local var2364, var2365 = protoModule.readBuffer(p83, var2356)
				var2356 = var2365
				var2355.selected_option = buffer.tostring(var2364)
			elseif var2361 == 2 then
				local _ = nil
				local var2366, var2367 = protoModule.readBuffer(p83, var2356)
				var2356 = var2367
				table.insert(var2355.options, t.SelectorOption.decode(var2366))
			elseif var2361 == 3 then
				local _ = nil
				local var2368, var2369 = protoModule.readBuffer(p83, var2356)
				var2356 = var2369
				var2355.experience_carousel = t.ExperienceCarouselInputData.decode(var2368)
			else
				local _ = nil
				local var2370, var2371 = protoModule.readVarInt(p83, var2356)
				var2356 = var2371 + var2370
			end
		elseif var2357 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2372, var2373 = protoModule.readFixed32(p83, var2356)
			local _ = var2372
			var2356 = var2373
		elseif var2357 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2374, var2375 = protoModule.readFixed64(p83, var2356)
			local _ = var2374
			var2356 = var2375
		else
			error("Unsupported wire type: " .. var3480)
		end
	end
	return var2355
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
	local var2376 = t_83.new()
	
	if self.selected_option ~= nil then
		var2376.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2376.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2376.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2376.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2376.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2376
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
	local var2377 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2378, var2379 = protoModule.writeTag(buff, var2377, 1, protoModule.wireTypes.lengthDelimited)
		var2378, var3506 = protoModule.writeString(var2378, var2379, self.id)
		buff = var2378
		var2377 = var2379
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2380, var2381 = protoModule.writeTag(buff, var2377, 4, protoModule.wireTypes.varint)
		var2380, var3508 = protoModule.writeVarInt(var2380, var2381, self.preview_rows)
		buff = var2380
		var2377 = var2381
	end
	if self.widget_style ~= nil then
		local var2382 = self.widget_style:encode()
		local var2383, var2384 = protoModule.writeTag(buff, var2377, 3, protoModule.wireTypes.lengthDelimited)
		var2383, var3511 = protoModule.writeBuffer(var2383, var2384, var2382, buffer.len(var2382))
		buff = var2383
		var2377 = var2384
	end
	if self.see_all_button then
		local var2385, var2386 = protoModule.writeTag(buff, var2377, 5, protoModule.wireTypes.varint)
		var2385, var3513 = protoModule.writeVarInt(var2385, var2386, if self.see_all_button then 1 else 0)
		buff = var2385
		var2377 = var2386
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2387, var2388 = protoModule.writeTag(buff, var2377, 6, protoModule.wireTypes.lengthDelimited)
		var2387, var3515 = protoModule.writeString(var2387, var2388, self.information_popover_text)
		buff = var2387
		var2377 = var2388
	end
	local buff_1 = buffer.create(var2377)
	buffer.copy(buff_1, 0, buff, 0, var2377)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2377 = t_84.new()
	local var2378 = 0
	while var2378 < buffer.len(p84) do
		local _ = nil
		local var2379 = nil
		local var2380, var2381, var2382 = protoModule.readTag(p84, var2378)
		local var2383 = var2380
		var2379 = var2381
		var2378 = var2382
		
		if var2379 == protoModule.wireTypes.varint then
			if var2383 == 4 then
				local _ = nil
				local var2384, var2385 = protoModule.readVarIntI64(p84, var2378)
				var2378 = var2385
				var2377.preview_rows = var2384
			elseif var2383 == 5 then
				local _ = nil
				local var2386, var2387 = protoModule.readVarInt(p84, var2378)
				var2378 = var2387
				var2377.see_all_button = var2386 ~= 0
			else
				local _ = nil
				local var2388, var2389 = protoModule.readVarInt(p84, var2378)
				local _ = var2388
				var2378 = var2389
			end
		end
		if var2379 == protoModule.wireTypes.lengthDelimited then
			if var2383 == 1 then
				local _ = nil
				local var2390, var2391 = protoModule.readBuffer(p84, var2378)
				var2378 = var2391
				var2377.id = buffer.tostring(var2390)
			elseif var2383 == 3 then
				local _ = nil
				local var2392, var2393 = protoModule.readBuffer(p84, var2378)
				var2378 = var2393
				var2377.widget_style = t.WidgetStyleData.decode(var2392)
			elseif var2383 == 6 then
				local _ = nil
				local var2394, var2395 = protoModule.readBuffer(p84, var2378)
				var2378 = var2395
				var2377.information_popover_text = buffer.tostring(var2394)
			else
				local _ = nil
				local var2396, var2397 = protoModule.readVarInt(p84, var2378)
				var2378 = var2397 + var2396
			end
		elseif var2379 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2398, var2399 = protoModule.readFixed32(p84, var2378)
			local _ = var2398
			var2378 = var2399
		elseif var2379 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2400, var2401 = protoModule.readFixed64(p84, var2378)
			local _ = var2400
			var2378 = var2401
		else
			error("Unsupported wire type: " .. var3519)
		end
	end
	return var2377
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
	local var2402 = t_84.new()
	
	if self.id ~= nil then
		var2402.id = self.id
	end
	if self.preview_rows ~= nil then
		var2402.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2402.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2402.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2402.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2402.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2402.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2402.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2402.information_popover_text = self.informationPopoverText
	end
	return var2402
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
	local var2402 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2403, var2404 = protoModule.writeTag(buff, var2402, 1, protoModule.wireTypes.lengthDelimited)
		var2403, var3547 = protoModule.writeString(var2403, var2404, self.id)
		buff = var2403
		var2402 = var2404
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2405, var2406 = protoModule.writeTag(buff, var2402, 5, protoModule.wireTypes.varint)
		var2405, var3549 = protoModule.writeVarInt(var2405, var2406, self.num_items_to_show)
		buff = var2405
		var2402 = var2406
	end
	if self.widget_style ~= nil then
		local var2407 = self.widget_style:encode()
		local var2408, var2409 = protoModule.writeTag(buff, var2402, 3, protoModule.wireTypes.lengthDelimited)
		var2408, var3552 = protoModule.writeBuffer(var2408, var2409, var2407, buffer.len(var2407))
		buff = var2408
		var2402 = var2409
	end
	if self.see_all_button then
		local var2410, var2411 = protoModule.writeTag(buff, var2402, 6, protoModule.wireTypes.varint)
		var2410, var3554 = protoModule.writeVarInt(var2410, var2411, if self.see_all_button then 1 else 0)
		buff = var2410
		var2402 = var2411
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2412, var2413 = protoModule.writeTag(buff, var2402, 7, protoModule.wireTypes.lengthDelimited)
		var2412, var3556 = protoModule.writeString(var2412, var2413, self.information_popover_text)
		buff = var2412
		var2402 = var2413
	end
	local buff_1 = buffer.create(var2402)
	buffer.copy(buff_1, 0, buff, 0, var2402)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2402 = t_85.new()
	local var2403 = 0
	while var2403 < buffer.len(p85) do
		local _ = nil
		local var2404 = nil
		local var2405, var2406, var2407 = protoModule.readTag(p85, var2403)
		local var2408 = var2405
		var2404 = var2406
		var2403 = var2407
		
		if var2404 == protoModule.wireTypes.varint then
			if var2408 == 5 then
				local _ = nil
				local var2409, var2410 = protoModule.readVarIntI64(p85, var2403)
				var2403 = var2410
				var2402.num_items_to_show = var2409
			elseif var2408 == 6 then
				local _ = nil
				local var2411, var2412 = protoModule.readVarInt(p85, var2403)
				var2403 = var2412
				var2402.see_all_button = var2411 ~= 0
			else
				local _ = nil
				local var2413, var2414 = protoModule.readVarInt(p85, var2403)
				local _ = var2413
				var2403 = var2414
			end
		end
		if var2404 == protoModule.wireTypes.lengthDelimited then
			if var2408 == 1 then
				local _ = nil
				local var2415, var2416 = protoModule.readBuffer(p85, var2403)
				var2403 = var2416
				var2402.id = buffer.tostring(var2415)
			elseif var2408 == 3 then
				local _ = nil
				local var2417, var2418 = protoModule.readBuffer(p85, var2403)
				var2403 = var2418
				var2402.widget_style = t.WidgetStyleData.decode(var2417)
			elseif var2408 == 7 then
				local _ = nil
				local var2419, var2420 = protoModule.readBuffer(p85, var2403)
				var2403 = var2420
				var2402.information_popover_text = buffer.tostring(var2419)
			else
				local _ = nil
				local var2421, var2422 = protoModule.readVarInt(p85, var2403)
				var2403 = var2422 + var2421
			end
		elseif var2404 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2423, var2424 = protoModule.readFixed32(p85, var2403)
			local _ = var2423
			var2403 = var2424
		elseif var2404 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2425, var2426 = protoModule.readFixed64(p85, var2403)
			local _ = var2425
			var2403 = var2426
		else
			error("Unsupported wire type: " .. var3560)
		end
	end
	return var2402
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
	local var2427 = t_85.new()
	
	if self.id ~= nil then
		var2427.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2427.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2427.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2427.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2427.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2427.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2427.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2427.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2427.information_popover_text = self.informationPopoverText
	end
	return var2427
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
	local var2427 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2428 = v:encode()
			local var2429, var2430 = protoModule.writeTag(buff, var2427, 1, protoModule.wireTypes.lengthDelimited)
			var2429, var3589 = protoModule.writeBuffer(var2429, var2430, var2428, buffer.len(var2428))
			buff = var2429
			var2427 = var2430
		end
	end
	local buff_1 = buffer.create(var2427)
	buffer.copy(buff_1, 0, buff, 0, var2427)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2431 = t_86.new()
	local var2432 = 0
	while var2432 < buffer.len(p86) do
		local _ = nil
		local var2433 = nil
		local var2434, var2435, var2436 = protoModule.readTag(p86, var2432)
		local var2437 = var2434
		var2433 = var2435
		var2432 = var2436
		
		if var2433 == protoModule.wireTypes.varint then
			local _ = nil
			local var2438, var2439 = protoModule.readVarInt(p86, var2432)
			local _ = var2438
			var2432 = var2439
			continue
		end
		if var2433 == protoModule.wireTypes.lengthDelimited then
			if var2437 == 1 then
				local _ = nil
				local var2440, var2441 = protoModule.readBuffer(p86, var2432)
				var2432 = var2441
				table.insert(var2431.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2440))
			else
				local _ = nil
				local var2442, var2443 = protoModule.readVarInt(p86, var2432)
				var2432 = var2443 + var2442
			end
		elseif var2433 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2444, var2445 = protoModule.readFixed32(p86, var2432)
			local _ = var2444
			var2432 = var2445
		elseif var2433 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2446, var2447 = protoModule.readFixed64(p86, var2432)
			local _ = var2446
			var2432 = var2447
		else
			error("Unsupported wire type: " .. var3593)
		end
	end
	return var2431
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
	local var2448 = t_86.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2448.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2448.background_layers = t
	end
	return var2448
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
	local var2449 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2450, var2451 = protoModule.writeTag(buff, var2449, 1, protoModule.wireTypes.lengthDelimited)
		var2450, var3616 = protoModule.writeString(var2450, var2451, self.id)
		buff = var2450
		var2449 = var2451
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2452, var2453 = protoModule.writeTag(buff, var2449, 2, protoModule.wireTypes.lengthDelimited)
		var2452, var3618 = protoModule.writeString(var2452, var2453, self.available_until)
		buff = var2452
		var2449 = var2453
	end
	if self.widget_style ~= nil then
		local var2454 = self.widget_style:encode()
		local var2455, var2456 = protoModule.writeTag(buff, var2449, 3, protoModule.wireTypes.lengthDelimited)
		var2455, var3621 = protoModule.writeBuffer(var2455, var2456, var2454, buffer.len(var2454))
		buff = var2455
		var2449 = var2456
	end
	local buff_1 = buffer.create(var2449)
	buffer.copy(buff_1, 0, buff, 0, var2449)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2449 = t_87.new()
	local var2450 = 0
	while var2450 < buffer.len(p87) do
		local _ = nil
		local var2451 = nil
		local var2452, var2453, var2454 = protoModule.readTag(p87, var2450)
		local var2455 = var2452
		var2451 = var2453
		var2450 = var2454
		
		if var2451 == protoModule.wireTypes.varint then
			local _ = nil
			local var2456, var2457 = protoModule.readVarInt(p87, var2450)
			local _ = var2456
			var2450 = var2457
			continue
		end
		if var2451 == protoModule.wireTypes.lengthDelimited then
			if var2455 == 1 then
				local _ = nil
				local var2458, var2459 = protoModule.readBuffer(p87, var2450)
				var2450 = var2459
				var2449.id = buffer.tostring(var2458)
			elseif var2455 == 2 then
				local _ = nil
				local var2460, var2461 = protoModule.readBuffer(p87, var2450)
				var2450 = var2461
				var2449.available_until = buffer.tostring(var2460)
			elseif var2455 == 3 then
				local _ = nil
				local var2462, var2463 = protoModule.readBuffer(p87, var2450)
				var2450 = var2463
				var2449.widget_style = t.WidgetStyleData.decode(var2462)
			else
				local _ = nil
				local var2464, var2465 = protoModule.readVarInt(p87, var2450)
				var2450 = var2465 + var2464
			end
		elseif var2451 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2466, var2467 = protoModule.readFixed32(p87, var2450)
			local _ = var2466
			var2450 = var2467
		elseif var2451 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2468, var2469 = protoModule.readFixed64(p87, var2450)
			local _ = var2468
			var2450 = var2469
		else
			error("Unsupported wire type: " .. var3625)
		end
	end
	return var2449
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
	local var2470 = t_87.new()
	
	if self.id ~= nil then
		var2470.id = self.id
	end
	if self.available_until ~= nil then
		var2470.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2470.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2470.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2470.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2470
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
	local var2470 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2471, var2472 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2471, var3649 = protoModule.writeString(var2471, var2472, i)
			local var2473 = v:encode()
			var2472, var3651 = protoModule.writeTag(var2471, var2472, 2, protoModule.wireTypes.lengthDelimited)
			var2472, var3651 = protoModule.writeBuffer(var2472, var3651, var2473, buffer.len(var2473))
			local var2474 = var2472
			local var2475 = var3651
			local var2476, var2477 = protoModule.writeTag(buff, var2470, 1, protoModule.wireTypes.lengthDelimited)
			var2476, var3655 = protoModule.writeBuffer(var2476, var2477, var2474, var2475)
			buff = var2476
			var2470 = var2477
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2478, var2479 = protoModule.writeTag(buff, var2470, 2, protoModule.wireTypes.lengthDelimited)
			var2478, var3657 = protoModule.writeString(var2478, var2479, v)
			buff = var2478
			var2470 = var2479
		end
	end
	local buff_1 = buffer.create(var2470)
	buffer.copy(buff_1, 0, buff, 0, var2470)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2480 = t_88.new()
	local var2481 = 0
	while var2481 < buffer.len(p88) do
		local _ = nil
		local var2482 = nil
		local var2483, var2484, var2485 = protoModule.readTag(p88, var2481)
		local var2486 = var2483
		var2482 = var2484
		var2481 = var2485
		
		if var2482 == protoModule.wireTypes.varint then
			local _ = nil
			local var2487, var2488 = protoModule.readVarInt(p88, var2481)
			local _ = var2487
			var2481 = var2488
			continue
		end
		if var2482 == protoModule.wireTypes.lengthDelimited then
			if var2486 == 1 then
				local _ = nil
				local var2489, var2490 = protoModule.readBuffer(p88, var2481)
				var2481 = var2490
				var2489 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2489)
				var2480.entry_map[var2489.key or ""] = var2489.value or t.FeedEntry.new()
			elseif var2486 == 2 then
				local _ = nil
				local var2491, var2492 = protoModule.readBuffer(p88, var2481)
				var2481 = var2492
				table.insert(var2480.entry_order, buffer.tostring(var2491))
			else
				local _ = nil
				local var2493, var2494 = protoModule.readVarInt(p88, var2481)
				var2481 = var2494 + var2493
			end
		elseif var2482 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2495, var2496 = protoModule.readFixed32(p88, var2481)
			local _ = var2495
			var2481 = var2496
		elseif var2482 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2497, var2498 = protoModule.readFixed64(p88, var2481)
			local _ = var2497
			var2481 = var2498
		else
			error("Unsupported wire type: " .. var3661)
		end
	end
	return var2480
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
	local var2499 = t_88.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2499.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2499.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2499.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2499.entry_order = t_1
	end
	return var2499
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
	local var2500 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2501, var2502 = protoModule.writeTag(buff, var2500, 1, protoModule.wireTypes.lengthDelimited)
		var2501, var3689 = protoModule.writeString(var2501, var2502, self.key)
		buff = var2501
		var2500 = var2502
	end
	if self.value ~= nil then
		local var2503 = self.value:encode()
		local var2504, var2505 = protoModule.writeTag(buff, var2500, 2, protoModule.wireTypes.lengthDelimited)
		var2504, var3692 = protoModule.writeBuffer(var2504, var2505, var2503, buffer.len(var2503))
		buff = var2504
		var2500 = var2505
	end
	local buff_1 = buffer.create(var2500)
	buffer.copy(buff_1, 0, buff, 0, var2500)
	
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
			local _ = nil
			local var2507, var2508 = protoModule.readVarInt(p89, var2501)
			local _ = var2507
			var2501 = var2508
			continue
		end
		if var2502 == protoModule.wireTypes.lengthDelimited then
			if var2506 == 1 then
				local _ = nil
				local var2509, var2510 = protoModule.readBuffer(p89, var2501)
				var2501 = var2510
				var2500.key = buffer.tostring(var2509)
			elseif var2506 == 2 then
				local _ = nil
				local var2511, var2512 = protoModule.readBuffer(p89, var2501)
				var2501 = var2512
				var2500.value = t.FeedEntry.decode(var2511)
			else
				local _ = nil
				local var2513, var2514 = protoModule.readVarInt(p89, var2501)
				var2501 = var2514 + var2513
			end
		elseif var2502 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2515, var2516 = protoModule.readFixed32(p89, var2501)
			local _ = var2515
			var2501 = var2516
		elseif var2502 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2517, var2518 = protoModule.readFixed64(p89, var2501)
			local _ = var2517
			var2501 = var2518
		else
			error("Unsupported wire type: " .. var3696)
		end
	end
	return var2500
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
	local var2519 = t_89.new()
	
	if self.key ~= nil then
		var2519.key = self.key
	end
	if self.value ~= nil then
		var2519.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2519
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
	local var2519 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2520 = v:encode()
			local var2521, var2522 = protoModule.writeTag(buff, var2519, 1, protoModule.wireTypes.lengthDelimited)
			var2521, var3719 = protoModule.writeBuffer(var2521, var2522, var2520, buffer.len(var2520))
			buff = var2521
			var2519 = var2522
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2523, var2524 = protoModule.writeTag(buff, var2519, 2, protoModule.wireTypes.lengthDelimited)
		var2523, var3721 = protoModule.writeString(var2523, var2524, self.active_category_id)
		buff = var2523
		var2519 = var2524
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2525, var2526 = protoModule.writeTag(buff, var2519, 3, protoModule.wireTypes.varint)
		var2525, var3723 = protoModule.writeVarInt(var2525, var2526, self.active_tooltip_idx)
		buff = var2525
		var2519 = var2526
	end
	local buff_1 = buffer.create(var2519)
	buffer.copy(buff_1, 0, buff, 0, var2519)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var2527 = t_90.new()
	local var2528 = 0
	while var2528 < buffer.len(p90) do
		local _ = nil
		local var2529 = nil
		local var2530, var2531, var2532 = protoModule.readTag(p90, var2528)
		local var2533 = var2530
		var2529 = var2531
		var2528 = var2532
		
		if var2529 == protoModule.wireTypes.varint then
			if var2533 == 3 then
				local _ = nil
				local var2534, var2535 = protoModule.readVarIntI64(p90, var2528)
				var2528 = var2535
				var2527.active_tooltip_idx = var2534
			else
				local _ = nil
				local var2536, var2537 = protoModule.readVarInt(p90, var2528)
				local _ = var2536
				var2528 = var2537
			end
		end
		if var2529 == protoModule.wireTypes.lengthDelimited then
			if var2533 == 1 then
				local _ = nil
				local var2538, var2539 = protoModule.readBuffer(p90, var2528)
				var2528 = var2539
				table.insert(var2527.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2538))
			elseif var2533 == 2 then
				local _ = nil
				local var2540, var2541 = protoModule.readBuffer(p90, var2528)
				var2528 = var2541
				var2527.active_category_id = buffer.tostring(var2540)
			else
				local _ = nil
				local var2542, var2543 = protoModule.readVarInt(p90, var2528)
				var2528 = var2543 + var2542
			end
		elseif var2529 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2544, var2545 = protoModule.readFixed32(p90, var2528)
			local _ = var2544
			var2528 = var2545
		elseif var2529 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2546, var2547 = protoModule.readFixed64(p90, var2528)
			local _ = var2546
			var2528 = var2547
		else
			error("Unsupported wire type: " .. var3727)
		end
	end
	return var2527
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
	local var2548 = t_90.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2548.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2548.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2548.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2548.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2548.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2548.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2548
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
	local var2549 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2550, var2551 = protoModule.writeTag(buff, var2549, 1, protoModule.wireTypes.lengthDelimited)
		var2550, var3754 = protoModule.writeString(var2550, var2551, self.marketplace_catalog_category_item_id)
		buff = var2550
		var2549 = var2551
	end
	local buff_1 = buffer.create(var2549)
	buffer.copy(buff_1, 0, buff, 0, var2549)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref)
	local var2549 = t_91.new()
	local var2550 = 0
	while var2550 < buffer.len(p91) do
		local _ = nil
		local var2551 = nil
		local var2552, var2553, var2554 = protoModule.readTag(p91, var2550)
		local var2555 = var2552
		var2551 = var2553
		var2550 = var2554
		
		if var2551 == protoModule.wireTypes.varint then
			local _ = nil
			local var2556, var2557 = protoModule.readVarInt(p91, var2550)
			local _ = var2556
			var2550 = var2557
			continue
		end
		if var2551 == protoModule.wireTypes.lengthDelimited then
			if var2555 == 1 then
				local _ = nil
				local var2558, var2559 = protoModule.readBuffer(p91, var2550)
				var2550 = var2559
				var2549.marketplace_catalog_category_item_id = buffer.tostring(var2558)
			else
				local _ = nil
				local var2560, var2561 = protoModule.readVarInt(p91, var2550)
				var2550 = var2561 + var2560
			end
		elseif var2551 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2562, var2563 = protoModule.readFixed32(p91, var2550)
			local _ = var2562
			var2550 = var2563
		elseif var2551 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2564, var2565 = protoModule.readFixed64(p91, var2550)
			local _ = var2564
			var2550 = var2565
		else
			error("Unsupported wire type: " .. var3758)
		end
	end
	return var2549
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
	local var2566 = t_91.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2566.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2566.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2566
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
	local var2566 = 0
	
	if self.hero_icon ~= nil then
		local var2567, var2568 = protoModule.writeTag(buff, var2566, 1, protoModule.wireTypes.lengthDelimited)
		var2567, var3778 = protoModule.writeString(var2567, var2568, self.hero_icon)
		buff = var2567
		var2566 = var2568
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2569, var2570 = protoModule.writeTag(buff, var2566, 2, protoModule.wireTypes.lengthDelimited)
		var2569, var3780 = protoModule.writeString(var2569, var2570, self.body_dismiss_button_text)
		buff = var2569
		var2566 = var2570
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2571, var2572 = protoModule.writeTag(buff, var2566, 3, protoModule.wireTypes.lengthDelimited)
		var2571, var3782 = protoModule.writeString(var2571, var2572, self.body_title)
		buff = var2571
		var2566 = var2572
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2573, var2574 = protoModule.writeTag(buff, var2566, 4, protoModule.wireTypes.lengthDelimited)
		var2573, var3784 = protoModule.writeString(var2573, var2574, self.body_rich_text)
		buff = var2573
		var2566 = var2574
	end
	if self.terms_link_text ~= nil then
		local var2575, var2576 = protoModule.writeTag(buff, var2566, 5, protoModule.wireTypes.lengthDelimited)
		var2575, var3786 = protoModule.writeString(var2575, var2576, self.terms_link_text)
		buff = var2575
		var2566 = var2576
	end
	if self.terms_title ~= nil then
		local var2577, var2578 = protoModule.writeTag(buff, var2566, 6, protoModule.wireTypes.lengthDelimited)
		var2577, var3788 = protoModule.writeString(var2577, var2578, self.terms_title)
		buff = var2577
		var2566 = var2578
	end
	if self.terms_body_rich_text ~= nil then
		local var2579, var2580 = protoModule.writeTag(buff, var2566, 7, protoModule.wireTypes.lengthDelimited)
		var2579, var3790 = protoModule.writeString(var2579, var2580, self.terms_body_rich_text)
		buff = var2579
		var2566 = var2580
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2581, var2582 = protoModule.writeTag(buff, var2566, 8, protoModule.wireTypes.lengthDelimited)
		var2581, var3792 = protoModule.writeString(var2581, var2582, self.terms_dismiss_button_text)
		buff = var2581
		var2566 = var2582
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2583, var2584 = protoModule.writeTag(buff, var2566, 9, protoModule.wireTypes.lengthDelimited)
		var2583, var3794 = protoModule.writeString(var2583, var2584, self.offer_id)
		buff = var2583
		var2566 = var2584
	end
	local buff_1 = buffer.create(var2566)
	buffer.copy(buff_1, 0, buff, 0, var2566)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref)
	local var2566 = t_92.new()
	local var2567 = 0
	while var2567 < buffer.len(p92) do
		local _ = nil
		local var2568 = nil
		local var2569, var2570, var2571 = protoModule.readTag(p92, var2567)
		local var2572 = var2569
		var2568 = var2570
		var2567 = var2571
		
		if var2568 == protoModule.wireTypes.varint then
			local _ = nil
			local var2573, var2574 = protoModule.readVarInt(p92, var2567)
			local _ = var2573
			var2567 = var2574
			continue
		end
		if var2568 == protoModule.wireTypes.lengthDelimited then
			if var2572 == 1 then
				local _ = nil
				local var2575, var2576 = protoModule.readBuffer(p92, var2567)
				var2567 = var2576
				var2566.hero_icon = buffer.tostring(var2575)
			elseif var2572 == 2 then
				local _ = nil
				local var2577, var2578 = protoModule.readBuffer(p92, var2567)
				var2567 = var2578
				var2566.body_dismiss_button_text = buffer.tostring(var2577)
			elseif var2572 == 3 then
				local _ = nil
				local var2579, var2580 = protoModule.readBuffer(p92, var2567)
				var2567 = var2580
				var2566.body_title = buffer.tostring(var2579)
			elseif var2572 == 4 then
				local _ = nil
				local var2581, var2582 = protoModule.readBuffer(p92, var2567)
				var2567 = var2582
				var2566.body_rich_text = buffer.tostring(var2581)
			elseif var2572 == 5 then
				local _ = nil
				local var2583, var2584 = protoModule.readBuffer(p92, var2567)
				var2567 = var2584
				var2566.terms_link_text = buffer.tostring(var2583)
			elseif var2572 == 6 then
				local _ = nil
				local var2585, var2586 = protoModule.readBuffer(p92, var2567)
				var2567 = var2586
				var2566.terms_title = buffer.tostring(var2585)
			elseif var2572 == 7 then
				local _ = nil
				local var2587, var2588 = protoModule.readBuffer(p92, var2567)
				var2567 = var2588
				var2566.terms_body_rich_text = buffer.tostring(var2587)
			elseif var2572 == 8 then
				local _ = nil
				local var2589, var2590 = protoModule.readBuffer(p92, var2567)
				var2567 = var2590
				var2566.terms_dismiss_button_text = buffer.tostring(var2589)
			elseif var2572 == 9 then
				local _ = nil
				local var2591, var2592 = protoModule.readBuffer(p92, var2567)
				var2567 = var2592
				var2566.offer_id = buffer.tostring(var2591)
			else
				local _ = nil
				local var2593, var2594 = protoModule.readVarInt(p92, var2567)
				var2567 = var2594 + var2593
			end
		elseif var2568 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2595, var2596 = protoModule.readFixed32(p92, var2567)
			local _ = var2595
			var2567 = var2596
		elseif var2568 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2597, var2598 = protoModule.readFixed64(p92, var2567)
			local _ = var2597
			var2567 = var2598
		else
			error("Unsupported wire type: " .. var3798)
		end
	end
	return var2566
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
	local var2599 = t_92.new()
	
	if self.hero_icon ~= nil then
		var2599.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2599.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2599.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2599.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2599.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2599.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2599.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2599.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2599.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2599.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2599.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2599.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2599.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2599.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2599.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2599.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2599.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2599.offer_id = self.offerId
	end
	return var2599
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
	local var2599 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2600, var2601 = protoModule.writeTag(buff, var2599, 1, protoModule.wireTypes.lengthDelimited)
		var2600, var3834 = protoModule.writeString(var2600, var2601, self.item_id)
		buff = var2600
		var2599 = var2601
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2602, var2603 = protoModule.writeTag(buff, var2599, 2, protoModule.wireTypes.lengthDelimited)
		var2602, var3836 = protoModule.writeString(var2602, var2603, self.item_type)
		buff = var2602
		var2599 = var2603
	end
	if self.prefer_three_dimensional then
		local var2604, var2605 = protoModule.writeTag(buff, var2599, 3, protoModule.wireTypes.varint)
		var2604, var3838 = protoModule.writeVarInt(var2604, var2605, if self.prefer_three_dimensional then 1 else 0)
		buff = var2604
		var2599 = var2605
	end
	if self.bundle_type ~= nil then
		local var2606, var2607 = protoModule.writeTag(buff, var2599, 4, protoModule.wireTypes.lengthDelimited)
		var2606, var3840 = protoModule.writeString(var2606, var2607, self.bundle_type)
		buff = var2606
		var2599 = var2607
	end
	if self.bundle_items ~= nil and #self.bundle_items > 0 then
		for i, v in self.bundle_items do
			local var2608 = v:encode()
			local var2609, var2610 = protoModule.writeTag(buff, var2599, 5, protoModule.wireTypes.lengthDelimited)
			var2609, var3843 = protoModule.writeBuffer(var2609, var2610, var2608, buffer.len(var2608))
			buff = var2609
			var2599 = var2610
		end
	end
	local buff_1 = buffer.create(var2599)
	buffer.copy(buff_1, 0, buff, 0, var2599)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2611 = t_93.new()
	local var2612 = 0
	while var2612 < buffer.len(p93) do
		local _ = nil
		local var2613 = nil
		local var2614, var2615, var2616 = protoModule.readTag(p93, var2612)
		local var2617 = var2614
		var2613 = var2615
		var2612 = var2616
		
		if var2613 == protoModule.wireTypes.varint then
			if var2617 == 3 then
				local _ = nil
				local var2618, var2619 = protoModule.readVarInt(p93, var2612)
				var2612 = var2619
				var2611.prefer_three_dimensional = var2618 ~= 0
			else
				local _ = nil
				local var2620, var2621 = protoModule.readVarInt(p93, var2612)
				local _ = var2620
				var2612 = var2621
			end
		end
		if var2613 == protoModule.wireTypes.lengthDelimited then
			if var2617 == 1 then
				local _ = nil
				local var2622, var2623 = protoModule.readBuffer(p93, var2612)
				var2612 = var2623
				var2611.item_id = buffer.tostring(var2622)
			elseif var2617 == 2 then
				local _ = nil
				local var2624, var2625 = protoModule.readBuffer(p93, var2612)
				var2612 = var2625
				var2611.item_type = buffer.tostring(var2624)
			elseif var2617 == 4 then
				local _ = nil
				local var2626, var2627 = protoModule.readBuffer(p93, var2612)
				var2612 = var2627
				var2611.bundle_type = buffer.tostring(var2626)
			elseif var2617 == 5 then
				local _ = nil
				local var2628, var2629 = protoModule.readBuffer(p93, var2612)
				var2612 = var2629
				table.insert(var2611.bundle_items, t.MarketplaceItemMediaHeaderInputData_BundleItem.decode(var2628))
			else
				local _ = nil
				local var2630, var2631 = protoModule.readVarInt(p93, var2612)
				var2612 = var2631 + var2630
			end
		elseif var2613 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2632, var2633 = protoModule.readFixed32(p93, var2612)
			local _ = var2632
			var2612 = var2633
		elseif var2613 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2634, var2635 = protoModule.readFixed64(p93, var2612)
			local _ = var2634
			var2612 = var2635
		else
			error("Unsupported wire type: " .. var3847)
		end
	end
	return var2611
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
	local var2636 = t_93.new()
	
	if self.item_id ~= nil then
		var2636.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2636.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2636.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2636.item_type = self.itemType
	end
	if self.prefer_three_dimensional ~= nil then
		var2636.prefer_three_dimensional = self.prefer_three_dimensional
	end
	if self.preferThreeDimensional ~= nil then
		var2636.prefer_three_dimensional = self.preferThreeDimensional
	end
	if self.bundle_type ~= nil then
		var2636.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		var2636.bundle_type = self.bundleType
	end
	if self.bundle_items ~= nil then
		local t_1 = {}
		
		for i, v in self.bundle_items do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2636.bundle_items = t_1
	end
	if self.bundleItems ~= nil then
		local t_1 = {}
		
		for i, v in self.bundleItems do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2636.bundle_items = t_1
	end
	return var2636
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
	local var2637 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2638, var2639 = protoModule.writeTag(buff, var2637, 1, protoModule.wireTypes.lengthDelimited)
		var2638, var3878 = protoModule.writeString(var2638, var2639, self.id)
		buff = var2638
		var2637 = var2639
	end
	if self.type ~= nil and self.type ~= "" then
		local var2640, var2641 = protoModule.writeTag(buff, var2637, 2, protoModule.wireTypes.lengthDelimited)
		var2640, var3880 = protoModule.writeString(var2640, var2641, self.type)
		buff = var2640
		var2637 = var2641
	end
	local buff_1 = buffer.create(var2637)
	buffer.copy(buff_1, 0, buff, 0, var2637)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref)
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
			local _ = nil
			local var2644, var2645 = protoModule.readVarInt(p94, var2638)
			local _ = var2644
			var2638 = var2645
			continue
		end
		if var2639 == protoModule.wireTypes.lengthDelimited then
			if var2643 == 1 then
				local _ = nil
				local var2646, var2647 = protoModule.readBuffer(p94, var2638)
				var2638 = var2647
				var2637.id = buffer.tostring(var2646)
			elseif var2643 == 2 then
				local _ = nil
				local var2648, var2649 = protoModule.readBuffer(p94, var2638)
				var2638 = var2649
				var2637.type = buffer.tostring(var2648)
			else
				local _ = nil
				local var2650, var2651 = protoModule.readVarInt(p94, var2638)
				var2638 = var2651 + var2650
			end
		elseif var2639 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2652, var2653 = protoModule.readFixed32(p94, var2638)
			local _ = var2652
			var2638 = var2653
		elseif var2639 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2654, var2655 = protoModule.readFixed64(p94, var2638)
			local _ = var2654
			var2638 = var2655
		else
			error("Unsupported wire type: " .. var3884)
		end
	end
	return var2637
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
	local var2656 = t_94.new()
	
	if self.id ~= nil then
		var2656.id = self.id
	end
	if self.type ~= nil then
		var2656.type = self.type
	end
	return var2656
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
	local var2656 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2657 = v:encode()
			local var2658, var2659 = protoModule.writeTag(buff, var2656, 1, protoModule.wireTypes.lengthDelimited)
			var2658, var3907 = protoModule.writeBuffer(var2658, var2659, var2657, buffer.len(var2657))
			buff = var2658
			var2656 = var2659
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2660, var2661 = protoModule.writeTag(buff, var2656, 2, protoModule.wireTypes.varint)
		var2660, var3909 = protoModule.writeVarInt(var2660, var2661, self.preview_columns)
		buff = var2660
		var2656 = var2661
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2662, var2663 = protoModule.writeTag(buff, var2656, 3, protoModule.wireTypes.lengthDelimited)
		var2662, var3911 = protoModule.writeString(var2662, var2663, self.impression_id)
		buff = var2662
		var2656 = var2663
	end
	local buff_1 = buffer.create(var2656)
	buffer.copy(buff_1, 0, buff, 0, var2656)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2664 = t_95.new()
	local var2665 = 0
	while var2665 < buffer.len(p95) do
		local _ = nil
		local var2666 = nil
		local var2667, var2668, var2669 = protoModule.readTag(p95, var2665)
		local var2670 = var2667
		var2666 = var2668
		var2665 = var2669
		
		if var2666 == protoModule.wireTypes.varint then
			if var2670 == 2 then
				local _ = nil
				local var2671, var2672 = protoModule.readVarIntI32(p95, var2665)
				var2665 = var2672
				var2664.preview_columns = var2671
			else
				local _ = nil
				local var2673, var2674 = protoModule.readVarInt(p95, var2665)
				local _ = var2673
				var2665 = var2674
			end
		end
		if var2666 == protoModule.wireTypes.lengthDelimited then
			if var2670 == 1 then
				local _ = nil
				local var2675, var2676 = protoModule.readBuffer(p95, var2665)
				var2665 = var2676
				table.insert(var2664.items, t.CatalogItemGridInputData_CatalogItem.decode(var2675))
			elseif var2670 == 3 then
				local _ = nil
				local var2677, var2678 = protoModule.readBuffer(p95, var2665)
				var2665 = var2678
				var2664.impression_id = buffer.tostring(var2677)
			else
				local _ = nil
				local var2679, var2680 = protoModule.readVarInt(p95, var2665)
				var2665 = var2680 + var2679
			end
		elseif var2666 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2681, var2682 = protoModule.readFixed32(p95, var2665)
			local _ = var2681
			var2665 = var2682
		elseif var2666 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2683, var2684 = protoModule.readFixed64(p95, var2665)
			local _ = var2683
			var2665 = var2684
		else
			error("Unsupported wire type: " .. var3915)
		end
	end
	return var2664
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
	local var2685 = t_95.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2685.items = t_1
	end
	if self.preview_columns ~= nil then
		var2685.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2685.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2685.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2685.impression_id = self.impressionId
	end
	return var2685
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
	local var2686 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2687, var2688 = protoModule.writeTag(buff, var2686, 1, protoModule.wireTypes.lengthDelimited)
		var2687, var3941 = protoModule.writeString(var2687, var2688, self.id)
		buff = var2687
		var2686 = var2688
	end
	if self.type ~= nil and self.type ~= "" then
		local var2689, var2690 = protoModule.writeTag(buff, var2686, 2, protoModule.wireTypes.lengthDelimited)
		var2689, var3943 = protoModule.writeString(var2689, var2690, self.type)
		buff = var2689
		var2686 = var2690
	end
	local buff_1 = buffer.create(var2686)
	buffer.copy(buff_1, 0, buff, 0, var2686)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref)
	local var2686 = t_96.new()
	local var2687 = 0
	while var2687 < buffer.len(p96) do
		local _ = nil
		local var2688 = nil
		local var2689, var2690, var2691 = protoModule.readTag(p96, var2687)
		local var2692 = var2689
		var2688 = var2690
		var2687 = var2691
		
		if var2688 == protoModule.wireTypes.varint then
			local _ = nil
			local var2693, var2694 = protoModule.readVarInt(p96, var2687)
			local _ = var2693
			var2687 = var2694
			continue
		end
		if var2688 == protoModule.wireTypes.lengthDelimited then
			if var2692 == 1 then
				local _ = nil
				local var2695, var2696 = protoModule.readBuffer(p96, var2687)
				var2687 = var2696
				var2686.id = buffer.tostring(var2695)
			elseif var2692 == 2 then
				local _ = nil
				local var2697, var2698 = protoModule.readBuffer(p96, var2687)
				var2687 = var2698
				var2686.type = buffer.tostring(var2697)
			else
				local _ = nil
				local var2699, var2700 = protoModule.readVarInt(p96, var2687)
				var2687 = var2700 + var2699
			end
		elseif var2688 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2701, var2702 = protoModule.readFixed32(p96, var2687)
			local _ = var2701
			var2687 = var2702
		elseif var2688 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2703, var2704 = protoModule.readFixed64(p96, var2687)
			local _ = var2703
			var2687 = var2704
		else
			error("Unsupported wire type: " .. var3947)
		end
	end
	return var2686
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
	local var2705 = t_96.new()
	
	if self.id ~= nil then
		var2705.id = self.id
	end
	if self.type ~= nil then
		var2705.type = self.type
	end
	return var2705
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
	local var2705 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2706, var2707 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2706, var3969 = protoModule.writeString(var2706, var2707, i)
			local var2708 = v:encode()
			var2707, var3971 = protoModule.writeTag(var2706, var2707, 2, protoModule.wireTypes.lengthDelimited)
			var2707, var3971 = protoModule.writeBuffer(var2707, var3971, var2708, buffer.len(var2708))
			local var2709 = var2707
			local var2710 = var3971
			local var2711, var2712 = protoModule.writeTag(buff, var2705, 1, protoModule.wireTypes.lengthDelimited)
			var2711, var3975 = protoModule.writeBuffer(var2711, var2712, var2709, var2710)
			buff = var2711
			var2705 = var2712
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2713, var2714 = protoModule.writeTag(buff, var2705, 2, protoModule.wireTypes.lengthDelimited)
			var2713, var3977 = protoModule.writeString(var2713, var2714, v)
			buff = var2713
			var2705 = var2714
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2715, var2716 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2715, var3979 = protoModule.writeString(var2715, var2716, i)
			local var2717 = v:encode()
			var2716, var3981 = protoModule.writeTag(var2715, var2716, 2, protoModule.wireTypes.lengthDelimited)
			var2716, var3981 = protoModule.writeBuffer(var2716, var3981, var2717, buffer.len(var2717))
			local var2718 = var2716
			local var2719 = var3981
			local var2720, var2721 = protoModule.writeTag(buff, var2705, 3, protoModule.wireTypes.lengthDelimited)
			var2720, var3985 = protoModule.writeBuffer(var2720, var2721, var2718, var2719)
			buff = var2720
			var2705 = var2721
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2722, var2723 = protoModule.writeTag(buff, var2705, 4, protoModule.wireTypes.lengthDelimited)
		var2722, var3987 = protoModule.writeString(var2722, var2723, self.search_session_id)
		buff = var2722
		var2705 = var2723
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2724, var2725 = protoModule.writeTag(buff, var2705, 5, protoModule.wireTypes.lengthDelimited)
		var2724, var3989 = protoModule.writeString(var2724, var2725, self.search_query)
		buff = var2724
		var2705 = var2725
	end
	local buff_1 = buffer.create(var2705)
	buffer.copy(buff_1, 0, buff, 0, var2705)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var2726 = t_97.new()
	local var2727 = 0
	while var2727 < buffer.len(p97) do
		local _ = nil
		local var2728 = nil
		local var2729, var2730, var2731 = protoModule.readTag(p97, var2727)
		local var2732 = var2729
		var2728 = var2730
		var2727 = var2731
		
		if var2728 == protoModule.wireTypes.varint then
			local _ = nil
			local var2733, var2734 = protoModule.readVarInt(p97, var2727)
			local _ = var2733
			var2727 = var2734
			continue
		end
		if var2728 == protoModule.wireTypes.lengthDelimited then
			if var2732 == 1 then
				local _ = nil
				local var2735, var2736 = protoModule.readBuffer(p97, var2727)
				var2727 = var2736
				var2735 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2735)
				var2726.entry_map[var2735.key or ""] = var2735.value or t.FeedEntry.new()
			elseif var2732 == 2 then
				local _ = nil
				local var2737, var2738 = protoModule.readBuffer(p97, var2727)
				var2727 = var2738
				table.insert(var2726.entry_order, buffer.tostring(var2737))
			elseif var2732 == 3 then
				local _ = nil
				local var2739, var2740 = protoModule.readBuffer(p97, var2727)
				var2727 = var2740
				var2739 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2739)
				var2726.content_pools[var2739.key or ""] = var2739.value or t.ContentPool.new()
			elseif var2732 == 4 then
				local _ = nil
				local var2741, var2742 = protoModule.readBuffer(p97, var2727)
				var2727 = var2742
				var2726.search_session_id = buffer.tostring(var2741)
			elseif var2732 == 5 then
				local _ = nil
				local var2743, var2744 = protoModule.readBuffer(p97, var2727)
				var2727 = var2744
				var2726.search_query = buffer.tostring(var2743)
			else
				local _ = nil
				local var2745, var2746 = protoModule.readVarInt(p97, var2727)
				var2727 = var2746 + var2745
			end
		elseif var2728 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2747, var2748 = protoModule.readFixed32(p97, var2727)
			local _ = var2747
			var2727 = var2748
		elseif var2728 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2749, var2750 = protoModule.readFixed64(p97, var2727)
			local _ = var2749
			var2727 = var2750
		else
			error("Unsupported wire type: " .. var3993)
		end
	end
	return var2726
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
	local var2751 = t_97.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2751.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2751.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2751.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2751.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2751.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2751.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2751.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2751.search_session_id = self.searchSessionId
	end
	if self.search_query ~= nil then
		var2751.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2751.search_query = self.searchQuery
	end
	return var2751
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
	local var2752 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2753, var2754 = protoModule.writeTag(buff, var2752, 1, protoModule.wireTypes.lengthDelimited)
		var2753, var4030 = protoModule.writeString(var2753, var2754, self.key)
		buff = var2753
		var2752 = var2754
	end
	if self.value ~= nil then
		local var2755 = self.value:encode()
		local var2756, var2757 = protoModule.writeTag(buff, var2752, 2, protoModule.wireTypes.lengthDelimited)
		var2756, var4033 = protoModule.writeBuffer(var2756, var2757, var2755, buffer.len(var2755))
		buff = var2756
		var2752 = var2757
	end
	local buff_1 = buffer.create(var2752)
	buffer.copy(buff_1, 0, buff, 0, var2752)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2752 = t_98.new()
	local var2753 = 0
	while var2753 < buffer.len(p98) do
		local _ = nil
		local var2754 = nil
		local var2755, var2756, var2757 = protoModule.readTag(p98, var2753)
		local var2758 = var2755
		var2754 = var2756
		var2753 = var2757
		
		if var2754 == protoModule.wireTypes.varint then
			local _ = nil
			local var2759, var2760 = protoModule.readVarInt(p98, var2753)
			local _ = var2759
			var2753 = var2760
			continue
		end
		if var2754 == protoModule.wireTypes.lengthDelimited then
			if var2758 == 1 then
				local _ = nil
				local var2761, var2762 = protoModule.readBuffer(p98, var2753)
				var2753 = var2762
				var2752.key = buffer.tostring(var2761)
			elseif var2758 == 2 then
				local _ = nil
				local var2763, var2764 = protoModule.readBuffer(p98, var2753)
				var2753 = var2764
				var2752.value = t.FeedEntry.decode(var2763)
			else
				local _ = nil
				local var2765, var2766 = protoModule.readVarInt(p98, var2753)
				var2753 = var2766 + var2765
			end
		elseif var2754 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2767, var2768 = protoModule.readFixed32(p98, var2753)
			local _ = var2767
			var2753 = var2768
		elseif var2754 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2769, var2770 = protoModule.readFixed64(p98, var2753)
			local _ = var2769
			var2753 = var2770
		else
			error("Unsupported wire type: " .. var4037)
		end
	end
	return var2752
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
	local var2771 = t_98.new()
	
	if self.key ~= nil then
		var2771.key = self.key
	end
	if self.value ~= nil then
		var2771.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2771
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
	local var2771 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2772, var2773 = protoModule.writeTag(buff, var2771, 1, protoModule.wireTypes.lengthDelimited)
		var2772, var4059 = protoModule.writeString(var2772, var2773, self.key)
		buff = var2772
		var2771 = var2773
	end
	if self.value ~= nil then
		local var2774 = self.value:encode()
		local var2775, var2776 = protoModule.writeTag(buff, var2771, 2, protoModule.wireTypes.lengthDelimited)
		var2775, var4062 = protoModule.writeBuffer(var2775, var2776, var2774, buffer.len(var2774))
		buff = var2775
		var2771 = var2776
	end
	local buff_1 = buffer.create(var2771)
	buffer.copy(buff_1, 0, buff, 0, var2771)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref), t (ref)
	local var2771 = t_99.new()
	local var2772 = 0
	while var2772 < buffer.len(p99) do
		local _ = nil
		local var2773 = nil
		local var2774, var2775, var2776 = protoModule.readTag(p99, var2772)
		local var2777 = var2774
		var2773 = var2775
		var2772 = var2776
		
		if var2773 == protoModule.wireTypes.varint then
			local _ = nil
			local var2778, var2779 = protoModule.readVarInt(p99, var2772)
			local _ = var2778
			var2772 = var2779
			continue
		end
		if var2773 == protoModule.wireTypes.lengthDelimited then
			if var2777 == 1 then
				local _ = nil
				local var2780, var2781 = protoModule.readBuffer(p99, var2772)
				var2772 = var2781
				var2771.key = buffer.tostring(var2780)
			elseif var2777 == 2 then
				local _ = nil
				local var2782, var2783 = protoModule.readBuffer(p99, var2772)
				var2772 = var2783
				var2771.value = t.ContentPool.decode(var2782)
			else
				local _ = nil
				local var2784, var2785 = protoModule.readVarInt(p99, var2772)
				var2772 = var2785 + var2784
			end
		elseif var2773 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2786, var2787 = protoModule.readFixed32(p99, var2772)
			local _ = var2786
			var2772 = var2787
		elseif var2773 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2788, var2789 = protoModule.readFixed64(p99, var2772)
			local _ = var2788
			var2772 = var2789
		else
			error("Unsupported wire type: " .. var4066)
		end
	end
	return var2771
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
	local var2790 = t_99.new()
	
	if self.key ~= nil then
		var2790.key = self.key
	end
	if self.value ~= nil then
		var2790.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2790
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
		universe_id = if p100 == nil or p100.universe_id == nil then "" else p100.universe_id,
		is_content_locked = if p100 == nil or p100.is_content_locked == nil then false else p100.is_content_locked
	}, t_100)
end

function t_100:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2790 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2791, var2792 = protoModule.writeTag(buff, var2790, 1, protoModule.wireTypes.lengthDelimited)
		var2791, var4088 = protoModule.writeString(var2791, var2792, self.universe_id)
		buff = var2791
		var2790 = var2792
	end
	if self.is_content_locked then
		local var2793, var2794 = protoModule.writeTag(buff, var2790, 2, protoModule.wireTypes.varint)
		var2793, var4090 = protoModule.writeVarInt(var2793, var2794, if self.is_content_locked then 1 else 0)
		buff = var2793
		var2790 = var2794
	end
	local buff_1 = buffer.create(var2790)
	buffer.copy(buff_1, 0, buff, 0, var2790)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref)
	local var2790 = t_100.new()
	local var2791 = 0
	while var2791 < buffer.len(p100) do
		local _ = nil
		local var2792 = nil
		local var2793, var2794, var2795 = protoModule.readTag(p100, var2791)
		local var2796 = var2793
		var2792 = var2794
		var2791 = var2795
		
		if var2792 == protoModule.wireTypes.varint then
			if var2796 == 2 then
				local _ = nil
				local var2797, var2798 = protoModule.readVarInt(p100, var2791)
				var2791 = var2798
				var2790.is_content_locked = var2797 ~= 0
			else
				local _ = nil
				local var2799, var2800 = protoModule.readVarInt(p100, var2791)
				local _ = var2799
				var2791 = var2800
			end
		end
		if var2792 == protoModule.wireTypes.lengthDelimited then
			if var2796 == 1 then
				local _ = nil
				local var2801, var2802 = protoModule.readBuffer(p100, var2791)
				var2791 = var2802
				var2790.universe_id = buffer.tostring(var2801)
			else
				local _ = nil
				local var2803, var2804 = protoModule.readVarInt(p100, var2791)
				var2791 = var2804 + var2803
			end
		elseif var2792 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2805, var2806 = protoModule.readFixed32(p100, var2791)
			local _ = var2805
			var2791 = var2806
		elseif var2792 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2807, var2808 = protoModule.readFixed64(p100, var2791)
			local _ = var2807
			var2791 = var2808
		else
			error("Unsupported wire type: " .. var4094)
		end
	end
	return var2790
end

function t_100:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_100:jsonDecode()
	-- upvalues: t_100 (ref)
	local var2809 = t_100.new()
	
	if self.universe_id ~= nil then
		var2809.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2809.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2809.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2809.is_content_locked = self.isContentLocked
	end
	return var2809
end

t_100.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_100
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p101)
	-- upvalues: t_101 (ref)
	return setmetatable({
		overview_rich_text = if p101 == nil or p101.overview_rich_text == nil then "" else p101.overview_rich_text,
		result_entry = if p101 == nil or p101.result_entry == nil then nil else p101.result_entry,
		follow_up_queries = if p101 == nil or p101.follow_up_queries == nil then {} else p101.follow_up_queries,
		show_loading = if p101 == nil or p101.show_loading == nil then false else p101.show_loading,
		title = if p101 == nil or p101.title == nil then "" else p101.title,
		search_query = if p101 == nil or p101.search_query == nil then "" else p101.search_query,
		universe_ids = if p101 == nil or p101.universe_ids == nil then "" else p101.universe_ids
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2809 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2810, var2811 = protoModule.writeTag(buff, var2809, 1, protoModule.wireTypes.lengthDelimited)
		var2810, var4116 = protoModule.writeString(var2810, var2811, self.overview_rich_text)
		buff = var2810
		var2809 = var2811
	end
	if self.result_entry ~= nil then
		local var2812 = self.result_entry:encode()
		local var2813, var2814 = protoModule.writeTag(buff, var2809, 2, protoModule.wireTypes.lengthDelimited)
		var2813, var4119 = protoModule.writeBuffer(var2813, var2814, var2812, buffer.len(var2812))
		buff = var2813
		var2809 = var2814
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2815, var2816 = protoModule.writeTag(buff, var2809, 3, protoModule.wireTypes.lengthDelimited)
			var2815, var4121 = protoModule.writeString(var2815, var2816, v)
			buff = var2815
			var2809 = var2816
		end
	end
	if self.show_loading then
		local var2817, var2818 = protoModule.writeTag(buff, var2809, 4, protoModule.wireTypes.varint)
		var2817, var4123 = protoModule.writeVarInt(var2817, var2818, if self.show_loading then 1 else 0)
		buff = var2817
		var2809 = var2818
	end
	if self.title ~= nil and self.title ~= "" then
		local var2819, var2820 = protoModule.writeTag(buff, var2809, 5, protoModule.wireTypes.lengthDelimited)
		var2819, var4125 = protoModule.writeString(var2819, var2820, self.title)
		buff = var2819
		var2809 = var2820
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2821, var2822 = protoModule.writeTag(buff, var2809, 6, protoModule.wireTypes.lengthDelimited)
		var2821, var4127 = protoModule.writeString(var2821, var2822, self.search_query)
		buff = var2821
		var2809 = var2822
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2823, var2824 = protoModule.writeTag(buff, var2809, 8, protoModule.wireTypes.lengthDelimited)
		var2823, var4129 = protoModule.writeString(var2823, var2824, self.universe_ids)
		buff = var2823
		var2809 = var2824
	end
	local buff_1 = buffer.create(var2809)
	buffer.copy(buff_1, 0, buff, 0, var2809)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2825 = t_101.new()
	local var2826 = 0
	while var2826 < buffer.len(p101) do
		local _ = nil
		local var2827 = nil
		local var2828, var2829, var2830 = protoModule.readTag(p101, var2826)
		local var2831 = var2828
		var2827 = var2829
		var2826 = var2830
		
		if var2827 == protoModule.wireTypes.varint then
			if var2831 == 4 then
				local _ = nil
				local var2832, var2833 = protoModule.readVarInt(p101, var2826)
				var2826 = var2833
				var2825.show_loading = var2832 ~= 0
			else
				local _ = nil
				local var2834, var2835 = protoModule.readVarInt(p101, var2826)
				local _ = var2834
				var2826 = var2835
			end
		end
		if var2827 == protoModule.wireTypes.lengthDelimited then
			if var2831 == 1 then
				local _ = nil
				local var2836, var2837 = protoModule.readBuffer(p101, var2826)
				var2826 = var2837
				var2825.overview_rich_text = buffer.tostring(var2836)
			elseif var2831 == 2 then
				local _ = nil
				local var2838, var2839 = protoModule.readBuffer(p101, var2826)
				var2826 = var2839
				var2825.result_entry = t.FeedEntry.decode(var2838)
			elseif var2831 == 3 then
				local _ = nil
				local var2840, var2841 = protoModule.readBuffer(p101, var2826)
				var2826 = var2841
				table.insert(var2825.follow_up_queries, buffer.tostring(var2840))
			elseif var2831 == 5 then
				local _ = nil
				local var2842, var2843 = protoModule.readBuffer(p101, var2826)
				var2826 = var2843
				var2825.title = buffer.tostring(var2842)
			elseif var2831 == 6 then
				local _ = nil
				local var2844, var2845 = protoModule.readBuffer(p101, var2826)
				var2826 = var2845
				var2825.search_query = buffer.tostring(var2844)
			elseif var2831 == 8 then
				local _ = nil
				local var2846, var2847 = protoModule.readBuffer(p101, var2826)
				var2826 = var2847
				var2825.universe_ids = buffer.tostring(var2846)
			else
				local _ = nil
				local var2848, var2849 = protoModule.readVarInt(p101, var2826)
				var2826 = var2849 + var2848
			end
		elseif var2827 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2850, var2851 = protoModule.readFixed32(p101, var2826)
			local _ = var2850
			var2826 = var2851
		elseif var2827 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2852, var2853 = protoModule.readFixed64(p101, var2826)
			local _ = var2852
			var2826 = var2853
		else
			error("Unsupported wire type: " .. var4133)
		end
	end
	return var2825
end

function t_101:jsonEncode()
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

function t_101:jsonDecode()
	-- upvalues: t_101 (ref), t (ref)
	local var2854 = t_101.new()
	
	if self.overview_rich_text ~= nil then
		var2854.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2854.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2854.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2854.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2854.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2854.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2854.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2854.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2854.title = self.title
	end
	if self.search_query ~= nil then
		var2854.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2854.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2854.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2854.universe_ids = self.universeIds
	end
	return var2854
end

t_101.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_101
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p102)
	-- upvalues: t_102 (ref)
	return setmetatable({
		title = if p102 == nil or p102.title == nil then "" else p102.title,
		user_items = if p102 == nil or p102.user_items == nil then {} else p102.user_items,
		max_visible_rows = if p102 == nil or p102.max_visible_rows == nil then 0 else p102.max_visible_rows,
		sort_id = if p102 == nil or p102.sort_id == nil then nil else p102.sort_id
	}, t_102)
end

function t_102:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2855 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2856, var2857 = protoModule.writeTag(buff, var2855, 1, protoModule.wireTypes.lengthDelimited)
		var2856, var4168 = protoModule.writeString(var2856, var2857, self.title)
		buff = var2856
		var2855 = var2857
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2858 = v:encode()
			local var2859, var2860 = protoModule.writeTag(buff, var2855, 2, protoModule.wireTypes.lengthDelimited)
			var2859, var4171 = protoModule.writeBuffer(var2859, var2860, var2858, buffer.len(var2858))
			buff = var2859
			var2855 = var2860
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2861, var2862 = protoModule.writeTag(buff, var2855, 3, protoModule.wireTypes.varint)
		var2861, var4173 = protoModule.writeVarInt(var2861, var2862, self.max_visible_rows)
		buff = var2861
		var2855 = var2862
	end
	if self.sort_id ~= nil then
		local var2863, var2864 = protoModule.writeTag(buff, var2855, 4, protoModule.wireTypes.lengthDelimited)
		var2863, var4175 = protoModule.writeString(var2863, var2864, self.sort_id)
		buff = var2863
		var2855 = var2864
	end
	local buff_1 = buffer.create(var2855)
	buffer.copy(buff_1, 0, buff, 0, var2855)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref), t (ref)
	local var2865 = t_102.new()
	local var2866 = 0
	while var2866 < buffer.len(p102) do
		local _ = nil
		local var2867 = nil
		local var2868, var2869, var2870 = protoModule.readTag(p102, var2866)
		local var2871 = var2868
		var2867 = var2869
		var2866 = var2870
		
		if var2867 == protoModule.wireTypes.varint then
			if var2871 == 3 then
				local _ = nil
				local var2872, var2873 = protoModule.readVarIntI32(p102, var2866)
				var2866 = var2873
				var2865.max_visible_rows = var2872
			else
				local _ = nil
				local var2874, var2875 = protoModule.readVarInt(p102, var2866)
				local _ = var2874
				var2866 = var2875
			end
		end
		if var2867 == protoModule.wireTypes.lengthDelimited then
			if var2871 == 1 then
				local _ = nil
				local var2876, var2877 = protoModule.readBuffer(p102, var2866)
				var2866 = var2877
				var2865.title = buffer.tostring(var2876)
			elseif var2871 == 2 then
				local _ = nil
				local var2878, var2879 = protoModule.readBuffer(p102, var2866)
				var2866 = var2879
				table.insert(var2865.user_items, t.UserListInputData_UserItem.decode(var2878))
			elseif var2871 == 4 then
				local _ = nil
				local var2880, var2881 = protoModule.readBuffer(p102, var2866)
				var2866 = var2881
				var2865.sort_id = buffer.tostring(var2880)
			else
				local _ = nil
				local var2882, var2883 = protoModule.readVarInt(p102, var2866)
				var2866 = var2883 + var2882
			end
		elseif var2867 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2884, var2885 = protoModule.readFixed32(p102, var2866)
			local _ = var2884
			var2866 = var2885
		elseif var2867 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2886, var2887 = protoModule.readFixed64(p102, var2866)
			local _ = var2886
			var2866 = var2887
		else
			error("Unsupported wire type: " .. var4179)
		end
	end
	return var2865
end

function t_102:jsonEncode()
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

function t_102:jsonDecode()
	-- upvalues: t_102 (ref), t (ref)
	local var2888 = t_102.new()
	
	if self.title ~= nil then
		var2888.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2888.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2888.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2888.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2888.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2888.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2888.sort_id = self.sortId
	end
	return var2888
end

t_102.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_102
typeRegistryModule.default:register(t.UserListInputData)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p103)
	-- upvalues: t_103 (ref)
	return setmetatable({
		user_id = if p103 == nil or p103.user_id == nil then "" else p103.user_id,
		previous_usernames = if p103 == nil or p103.previous_usernames == nil then {} else p103.previous_usernames
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2889 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2890, var2891 = protoModule.writeTag(buff, var2889, 1, protoModule.wireTypes.lengthDelimited)
		var2890, var4208 = protoModule.writeString(var2890, var2891, self.user_id)
		buff = var2890
		var2889 = var2891
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		for i, v in self.previous_usernames do
			local var2892, var2893 = protoModule.writeTag(buff, var2889, 2, protoModule.wireTypes.lengthDelimited)
			var2892, var4210 = protoModule.writeString(var2892, var2893, v)
			buff = var2892
			var2889 = var2893
		end
	end
	local buff_1 = buffer.create(var2889)
	buffer.copy(buff_1, 0, buff, 0, var2889)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref)
	local var2894 = t_103.new()
	local var2895 = 0
	while var2895 < buffer.len(p103) do
		local _ = nil
		local var2896 = nil
		local var2897, var2898, var2899 = protoModule.readTag(p103, var2895)
		local var2900 = var2897
		var2896 = var2898
		var2895 = var2899
		
		if var2896 == protoModule.wireTypes.varint then
			local _ = nil
			local var2901, var2902 = protoModule.readVarInt(p103, var2895)
			local _ = var2901
			var2895 = var2902
			continue
		end
		if var2896 == protoModule.wireTypes.lengthDelimited then
			if var2900 == 1 then
				local _ = nil
				local var2903, var2904 = protoModule.readBuffer(p103, var2895)
				var2895 = var2904
				var2894.user_id = buffer.tostring(var2903)
			elseif var2900 == 2 then
				local _ = nil
				local var2905, var2906 = protoModule.readBuffer(p103, var2895)
				var2895 = var2906
				table.insert(var2894.previous_usernames, buffer.tostring(var2905))
			else
				local _ = nil
				local var2907, var2908 = protoModule.readVarInt(p103, var2895)
				var2895 = var2908 + var2907
			end
		elseif var2896 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2909, var2910 = protoModule.readFixed32(p103, var2895)
			local _ = var2909
			var2895 = var2910
		elseif var2896 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2911, var2912 = protoModule.readFixed64(p103, var2895)
			local _ = var2911
			var2895 = var2912
		else
			error("Unsupported wire type: " .. var4214)
		end
	end
	return var2894
end

function t_103:jsonEncode()
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

function t_103:jsonDecode()
	-- upvalues: t_103 (ref)
	local var2913 = t_103.new()
	
	if self.user_id ~= nil then
		var2913.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2913.user_id = self.userId
	end
	if self.previous_usernames ~= nil then
		local t = {}
		
		for i, v in self.previous_usernames do
			table.insert(t, v)
		end
		var2913.previous_usernames = t
	end
	if self.previousUsernames ~= nil then
		local t = {}
		
		for i, v in self.previousUsernames do
			table.insert(t, v)
		end
		var2913.previous_usernames = t
	end
	return var2913
end

t_103.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_103
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p104)
	-- upvalues: t_104 (ref)
	return setmetatable({
		title = if p104 == nil or p104.title == nil then "" else p104.title,
		items = if p104 == nil or p104.items == nil then {} else p104.items,
		max_visible_rows = if p104 == nil or p104.max_visible_rows == nil then 0 else p104.max_visible_rows,
		sort_id = if p104 == nil or p104.sort_id == nil then nil else p104.sort_id
	}, t_104)
end

function t_104:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2914 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2915, var2916 = protoModule.writeTag(buff, var2914, 1, protoModule.wireTypes.lengthDelimited)
		var2915, var4239 = protoModule.writeString(var2915, var2916, self.title)
		buff = var2915
		var2914 = var2916
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2917 = v:encode()
			local var2918, var2919 = protoModule.writeTag(buff, var2914, 2, protoModule.wireTypes.lengthDelimited)
			var2918, var4242 = protoModule.writeBuffer(var2918, var2919, var2917, buffer.len(var2917))
			buff = var2918
			var2914 = var2919
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2920, var2921 = protoModule.writeTag(buff, var2914, 3, protoModule.wireTypes.varint)
		var2920, var4244 = protoModule.writeVarInt(var2920, var2921, self.max_visible_rows)
		buff = var2920
		var2914 = var2921
	end
	if self.sort_id ~= nil then
		local var2922, var2923 = protoModule.writeTag(buff, var2914, 4, protoModule.wireTypes.lengthDelimited)
		var2922, var4246 = protoModule.writeString(var2922, var2923, self.sort_id)
		buff = var2922
		var2914 = var2923
	end
	local buff_1 = buffer.create(var2914)
	buffer.copy(buff_1, 0, buff, 0, var2914)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var2924 = t_104.new()
	local var2925 = 0
	while var2925 < buffer.len(p104) do
		local _ = nil
		local var2926 = nil
		local var2927, var2928, var2929 = protoModule.readTag(p104, var2925)
		local var2930 = var2927
		var2926 = var2928
		var2925 = var2929
		
		if var2926 == protoModule.wireTypes.varint then
			if var2930 == 3 then
				local _ = nil
				local var2931, var2932 = protoModule.readVarIntI32(p104, var2925)
				var2925 = var2932
				var2924.max_visible_rows = var2931
			else
				local _ = nil
				local var2933, var2934 = protoModule.readVarInt(p104, var2925)
				local _ = var2933
				var2925 = var2934
			end
		end
		if var2926 == protoModule.wireTypes.lengthDelimited then
			if var2930 == 1 then
				local _ = nil
				local var2935, var2936 = protoModule.readBuffer(p104, var2925)
				var2925 = var2936
				var2924.title = buffer.tostring(var2935)
			elseif var2930 == 2 then
				local _ = nil
				local var2937, var2938 = protoModule.readBuffer(p104, var2925)
				var2925 = var2938
				table.insert(var2924.items, t.CatalogItemListInputData_CatalogItem.decode(var2937))
			elseif var2930 == 4 then
				local _ = nil
				local var2939, var2940 = protoModule.readBuffer(p104, var2925)
				var2925 = var2940
				var2924.sort_id = buffer.tostring(var2939)
			else
				local _ = nil
				local var2941, var2942 = protoModule.readVarInt(p104, var2925)
				var2925 = var2942 + var2941
			end
		elseif var2926 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2943, var2944 = protoModule.readFixed32(p104, var2925)
			local _ = var2943
			var2925 = var2944
		elseif var2926 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2945, var2946 = protoModule.readFixed64(p104, var2925)
			local _ = var2945
			var2925 = var2946
		else
			error("Unsupported wire type: " .. var4250)
		end
	end
	return var2924
end

function t_104:jsonEncode()
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

function t_104:jsonDecode()
	-- upvalues: t_104 (ref), t (ref)
	local var2947 = t_104.new()
	
	if self.title ~= nil then
		var2947.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2947.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2947.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2947.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2947.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2947.sort_id = self.sortId
	end
	return var2947
end

t_104.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_104
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p105)
	-- upvalues: t_105 (ref)
	return setmetatable({
		item_id = if p105 == nil or p105.item_id == nil then "" else p105.item_id,
		item_type = if p105 == nil or p105.item_type == nil then "" else p105.item_type
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2948 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2949, var2950 = protoModule.writeTag(buff, var2948, 1, protoModule.wireTypes.lengthDelimited)
		var2949, var4278 = protoModule.writeString(var2949, var2950, self.item_id)
		buff = var2949
		var2948 = var2950
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2951, var2952 = protoModule.writeTag(buff, var2948, 2, protoModule.wireTypes.lengthDelimited)
		var2951, var4280 = protoModule.writeString(var2951, var2952, self.item_type)
		buff = var2951
		var2948 = var2952
	end
	local buff_1 = buffer.create(var2948)
	buffer.copy(buff_1, 0, buff, 0, var2948)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2948 = t_105.new()
	local var2949 = 0
	while var2949 < buffer.len(p105) do
		local _ = nil
		local var2950 = nil
		local var2951, var2952, var2953 = protoModule.readTag(p105, var2949)
		local var2954 = var2951
		var2950 = var2952
		var2949 = var2953
		
		if var2950 == protoModule.wireTypes.varint then
			local _ = nil
			local var2955, var2956 = protoModule.readVarInt(p105, var2949)
			local _ = var2955
			var2949 = var2956
			continue
		end
		if var2950 == protoModule.wireTypes.lengthDelimited then
			if var2954 == 1 then
				local _ = nil
				local var2957, var2958 = protoModule.readBuffer(p105, var2949)
				var2949 = var2958
				var2948.item_id = buffer.tostring(var2957)
			elseif var2954 == 2 then
				local _ = nil
				local var2959, var2960 = protoModule.readBuffer(p105, var2949)
				var2949 = var2960
				var2948.item_type = buffer.tostring(var2959)
			else
				local _ = nil
				local var2961, var2962 = protoModule.readVarInt(p105, var2949)
				var2949 = var2962 + var2961
			end
		elseif var2950 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2963, var2964 = protoModule.readFixed32(p105, var2949)
			local _ = var2963
			var2949 = var2964
		elseif var2950 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2965, var2966 = protoModule.readFixed64(p105, var2949)
			local _ = var2965
			var2949 = var2966
		else
			error("Unsupported wire type: " .. var4284)
		end
	end
	return var2948
end

function t_105:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_105:jsonDecode()
	-- upvalues: t_105 (ref)
	local var2967 = t_105.new()
	
	if self.item_id ~= nil then
		var2967.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2967.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2967.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2967.item_type = self.itemType
	end
	return var2967
end

t_105.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_105
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p106)
	-- upvalues: t_106 (ref)
	return setmetatable({
		universe_id = if p106 == nil or p106.universe_id == nil then "" else p106.universe_id
	}, t_106)
end

function t_106:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2967 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2968, var2969 = protoModule.writeTag(buff, var2967, 1, protoModule.wireTypes.lengthDelimited)
		var2968, var4306 = protoModule.writeString(var2968, var2969, self.universe_id)
		buff = var2968
		var2967 = var2969
	end
	local buff_1 = buffer.create(var2967)
	buffer.copy(buff_1, 0, buff, 0, var2967)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var2967 = t_106.new()
	local var2968 = 0
	while var2968 < buffer.len(p106) do
		local _ = nil
		local var2969 = nil
		local var2970, var2971, var2972 = protoModule.readTag(p106, var2968)
		local var2973 = var2970
		var2969 = var2971
		var2968 = var2972
		
		if var2969 == protoModule.wireTypes.varint then
			local _ = nil
			local var2974, var2975 = protoModule.readVarInt(p106, var2968)
			local _ = var2974
			var2968 = var2975
			continue
		end
		if var2969 == protoModule.wireTypes.lengthDelimited then
			if var2973 == 1 then
				local _ = nil
				local var2976, var2977 = protoModule.readBuffer(p106, var2968)
				var2968 = var2977
				var2967.universe_id = buffer.tostring(var2976)
			else
				local _ = nil
				local var2978, var2979 = protoModule.readVarInt(p106, var2968)
				var2968 = var2979 + var2978
			end
		elseif var2969 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2980, var2981 = protoModule.readFixed32(p106, var2968)
			local _ = var2980
			var2968 = var2981
		elseif var2969 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2982, var2983 = protoModule.readFixed64(p106, var2968)
			local _ = var2982
			var2968 = var2983
		else
			error("Unsupported wire type: " .. var4310)
		end
	end
	return var2967
end

function t_106:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_106:jsonDecode()
	-- upvalues: t_106 (ref)
	local var2984 = t_106.new()
	
	if self.universe_id ~= nil then
		var2984.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2984.universe_id = self.universeId
	end
	return var2984
end

t_106.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_106
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p107)
	-- upvalues: t_107 (ref)
	return setmetatable({
		title = if p107 == nil or p107.title == nil then "" else p107.title,
		subtitle = if p107 == nil or p107.subtitle == nil then "" else p107.subtitle,
		moment_items = if p107 == nil or p107.moment_items == nil then {} else p107.moment_items
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2984 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2985, var2986 = protoModule.writeTag(buff, var2984, 1, protoModule.wireTypes.lengthDelimited)
		var2985, var4330 = protoModule.writeString(var2985, var2986, self.title)
		buff = var2985
		var2984 = var2986
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2987, var2988 = protoModule.writeTag(buff, var2984, 2, protoModule.wireTypes.lengthDelimited)
		var2987, var4332 = protoModule.writeString(var2987, var2988, self.subtitle)
		buff = var2987
		var2984 = var2988
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2989 = v:encode()
			local var2990, var2991 = protoModule.writeTag(buff, var2984, 3, protoModule.wireTypes.lengthDelimited)
			var2990, var4335 = protoModule.writeBuffer(var2990, var2991, var2989, buffer.len(var2989))
			buff = var2990
			var2984 = var2991
		end
	end
	local buff_1 = buffer.create(var2984)
	buffer.copy(buff_1, 0, buff, 0, var2984)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref), t (ref)
	local var2992 = t_107.new()
	local var2993 = 0
	while var2993 < buffer.len(p107) do
		local _ = nil
		local var2994 = nil
		local var2995, var2996, var2997 = protoModule.readTag(p107, var2993)
		local var2998 = var2995
		var2994 = var2996
		var2993 = var2997
		
		if var2994 == protoModule.wireTypes.varint then
			local _ = nil
			local var2999, var3000 = protoModule.readVarInt(p107, var2993)
			local _ = var2999
			var2993 = var3000
			continue
		end
		if var2994 == protoModule.wireTypes.lengthDelimited then
			if var2998 == 1 then
				local _ = nil
				local var3001, var3002 = protoModule.readBuffer(p107, var2993)
				var2993 = var3002
				var2992.title = buffer.tostring(var3001)
			elseif var2998 == 2 then
				local _ = nil
				local var3003, var3004 = protoModule.readBuffer(p107, var2993)
				var2993 = var3004
				var2992.subtitle = buffer.tostring(var3003)
			elseif var2998 == 3 then
				local _ = nil
				local var3005, var3006 = protoModule.readBuffer(p107, var2993)
				var2993 = var3006
				table.insert(var2992.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var3005))
			else
				local _ = nil
				local var3007, var3008 = protoModule.readVarInt(p107, var2993)
				var2993 = var3008 + var3007
			end
		elseif var2994 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3009, var3010 = protoModule.readFixed32(p107, var2993)
			local _ = var3009
			var2993 = var3010
		elseif var2994 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3011, var3012 = protoModule.readFixed64(p107, var2993)
			local _ = var3011
			var2993 = var3012
		else
			error("Unsupported wire type: " .. var4339)
		end
	end
	return var2992
end

function t_107:jsonEncode()
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

function t_107:jsonDecode()
	-- upvalues: t_107 (ref), t (ref)
	local var3013 = t_107.new()
	
	if self.title ~= nil then
		var3013.title = self.title
	end
	if self.subtitle ~= nil then
		var3013.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3013.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3013.moment_items = t_1
	end
	return var3013
end

t_107.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_107
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p108)
	-- upvalues: t_108 (ref)
	return setmetatable({
		moment_id = if p108 == nil or p108.moment_id == nil then "" else p108.moment_id,
		video_asset_id = if p108 == nil or p108.video_asset_id == nil then "" else p108.video_asset_id,
		target_universe_id = if p108 == nil or p108.target_universe_id == nil then "" else p108.target_universe_id,
		target_place_id = if p108 == nil or p108.target_place_id == nil then "" else p108.target_place_id,
		feed_item_id = if p108 == nil or p108.feed_item_id == nil then "" else p108.feed_item_id,
		capture_universe_id = if p108 == nil or p108.capture_universe_id == nil then "" else p108.capture_universe_id
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3014 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var3015, var3016 = protoModule.writeTag(buff, var3014, 1, protoModule.wireTypes.lengthDelimited)
		var3015, var4366 = protoModule.writeString(var3015, var3016, self.moment_id)
		buff = var3015
		var3014 = var3016
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3017, var3018 = protoModule.writeTag(buff, var3014, 2, protoModule.wireTypes.lengthDelimited)
		var3017, var4368 = protoModule.writeString(var3017, var3018, self.video_asset_id)
		buff = var3017
		var3014 = var3018
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var3019, var3020 = protoModule.writeTag(buff, var3014, 3, protoModule.wireTypes.lengthDelimited)
		var3019, var4370 = protoModule.writeString(var3019, var3020, self.target_universe_id)
		buff = var3019
		var3014 = var3020
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var3021, var3022 = protoModule.writeTag(buff, var3014, 4, protoModule.wireTypes.lengthDelimited)
		var3021, var4372 = protoModule.writeString(var3021, var3022, self.target_place_id)
		buff = var3021
		var3014 = var3022
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var3023, var3024 = protoModule.writeTag(buff, var3014, 5, protoModule.wireTypes.lengthDelimited)
		var3023, var4374 = protoModule.writeString(var3023, var3024, self.feed_item_id)
		buff = var3023
		var3014 = var3024
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var3025, var3026 = protoModule.writeTag(buff, var3014, 6, protoModule.wireTypes.lengthDelimited)
		var3025, var4376 = protoModule.writeString(var3025, var3026, self.capture_universe_id)
		buff = var3025
		var3014 = var3026
	end
	local buff_1 = buffer.create(var3014)
	buffer.copy(buff_1, 0, buff, 0, var3014)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var3014 = t_108.new()
	local var3015 = 0
	while var3015 < buffer.len(p108) do
		local _ = nil
		local var3016 = nil
		local var3017, var3018, var3019 = protoModule.readTag(p108, var3015)
		local var3020 = var3017
		var3016 = var3018
		var3015 = var3019
		
		if var3016 == protoModule.wireTypes.varint then
			local _ = nil
			local var3021, var3022 = protoModule.readVarInt(p108, var3015)
			local _ = var3021
			var3015 = var3022
			continue
		end
		if var3016 == protoModule.wireTypes.lengthDelimited then
			if var3020 == 1 then
				local _ = nil
				local var3023, var3024 = protoModule.readBuffer(p108, var3015)
				var3015 = var3024
				var3014.moment_id = buffer.tostring(var3023)
			elseif var3020 == 2 then
				local _ = nil
				local var3025, var3026 = protoModule.readBuffer(p108, var3015)
				var3015 = var3026
				var3014.video_asset_id = buffer.tostring(var3025)
			elseif var3020 == 3 then
				local _ = nil
				local var3027, var3028 = protoModule.readBuffer(p108, var3015)
				var3015 = var3028
				var3014.target_universe_id = buffer.tostring(var3027)
			elseif var3020 == 4 then
				local _ = nil
				local var3029, var3030 = protoModule.readBuffer(p108, var3015)
				var3015 = var3030
				var3014.target_place_id = buffer.tostring(var3029)
			elseif var3020 == 5 then
				local _ = nil
				local var3031, var3032 = protoModule.readBuffer(p108, var3015)
				var3015 = var3032
				var3014.feed_item_id = buffer.tostring(var3031)
			elseif var3020 == 6 then
				local _ = nil
				local var3033, var3034 = protoModule.readBuffer(p108, var3015)
				var3015 = var3034
				var3014.capture_universe_id = buffer.tostring(var3033)
			else
				local _ = nil
				local var3035, var3036 = protoModule.readVarInt(p108, var3015)
				var3015 = var3036 + var3035
			end
		elseif var3016 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3037, var3038 = protoModule.readFixed32(p108, var3015)
			local _ = var3037
			var3015 = var3038
		elseif var3016 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3039, var3040 = protoModule.readFixed64(p108, var3015)
			local _ = var3039
			var3015 = var3040
		else
			error("Unsupported wire type: " .. var4380)
		end
	end
	return var3014
end

function t_108:jsonEncode()
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

function t_108:jsonDecode()
	-- upvalues: t_108 (ref)
	local var3041 = t_108.new()
	
	if self.moment_id ~= nil then
		var3041.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var3041.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var3041.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3041.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var3041.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var3041.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var3041.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var3041.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var3041.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var3041.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var3041.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var3041.capture_universe_id = self.captureUniverseId
	end
	return var3041
end

t_108.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_108
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p109)
	-- upvalues: t_109 (ref)
	return setmetatable({
		title = if p109 == nil or p109.title == nil then "" else p109.title,
		subtitle = if p109 == nil or p109.subtitle == nil then "" else p109.subtitle
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3041 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3042, var3043 = protoModule.writeTag(buff, var3041, 1, protoModule.wireTypes.lengthDelimited)
		var3042, var4410 = protoModule.writeString(var3042, var3043, self.title)
		buff = var3042
		var3041 = var3043
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3044, var3045 = protoModule.writeTag(buff, var3041, 2, protoModule.wireTypes.lengthDelimited)
		var3044, var4412 = protoModule.writeString(var3044, var3045, self.subtitle)
		buff = var3044
		var3041 = var3045
	end
	local buff_1 = buffer.create(var3041)
	buffer.copy(buff_1, 0, buff, 0, var3041)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref)
	local var3041 = t_109.new()
	local var3042 = 0
	while var3042 < buffer.len(p109) do
		local _ = nil
		local var3043 = nil
		local var3044, var3045, var3046 = protoModule.readTag(p109, var3042)
		local var3047 = var3044
		var3043 = var3045
		var3042 = var3046
		
		if var3043 == protoModule.wireTypes.varint then
			local _ = nil
			local var3048, var3049 = protoModule.readVarInt(p109, var3042)
			local _ = var3048
			var3042 = var3049
			continue
		end
		if var3043 == protoModule.wireTypes.lengthDelimited then
			if var3047 == 1 then
				local _ = nil
				local var3050, var3051 = protoModule.readBuffer(p109, var3042)
				var3042 = var3051
				var3041.title = buffer.tostring(var3050)
			elseif var3047 == 2 then
				local _ = nil
				local var3052, var3053 = protoModule.readBuffer(p109, var3042)
				var3042 = var3053
				var3041.subtitle = buffer.tostring(var3052)
			else
				local _ = nil
				local var3054, var3055 = protoModule.readVarInt(p109, var3042)
				var3042 = var3055 + var3054
			end
		elseif var3043 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3056, var3057 = protoModule.readFixed32(p109, var3042)
			local _ = var3056
			var3042 = var3057
		elseif var3043 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3058, var3059 = protoModule.readFixed64(p109, var3042)
			local _ = var3058
			var3042 = var3059
		else
			error("Unsupported wire type: " .. var4416)
		end
	end
	return var3041
end

function t_109:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_109:jsonDecode()
	-- upvalues: t_109 (ref)
	local var3060 = t_109.new()
	
	if self.title ~= nil then
		var3060.title = self.title
	end
	if self.subtitle ~= nil then
		var3060.subtitle = self.subtitle
	end
	return var3060
end

t_109.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_109
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p110)
	-- upvalues: t_110 (ref)
	return setmetatable({
		primary_cta_button_text = if p110 == nil or p110.primary_cta_button_text == nil then "" else p110.primary_cta_button_text,
		secondary_cta_button_text = if p110 == nil or p110.secondary_cta_button_text == nil then "" else p110.secondary_cta_button_text,
		primary_cta_type = if p110 == nil or p110.primary_cta_type == nil then "" else p110.primary_cta_type,
		secondary_cta_type = if p110 == nil or p110.secondary_cta_type == nil then "" else p110.secondary_cta_type
	}, t_110)
end

function t_110:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3060 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var3061, var3062 = protoModule.writeTag(buff, var3060, 1, protoModule.wireTypes.lengthDelimited)
		var3061, var4438 = protoModule.writeString(var3061, var3062, self.primary_cta_button_text)
		buff = var3061
		var3060 = var3062
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var3063, var3064 = protoModule.writeTag(buff, var3060, 2, protoModule.wireTypes.lengthDelimited)
		var3063, var4440 = protoModule.writeString(var3063, var3064, self.secondary_cta_button_text)
		buff = var3063
		var3060 = var3064
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var3065, var3066 = protoModule.writeTag(buff, var3060, 3, protoModule.wireTypes.lengthDelimited)
		var3065, var4442 = protoModule.writeString(var3065, var3066, self.primary_cta_type)
		buff = var3065
		var3060 = var3066
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var3067, var3068 = protoModule.writeTag(buff, var3060, 4, protoModule.wireTypes.lengthDelimited)
		var3067, var4444 = protoModule.writeString(var3067, var3068, self.secondary_cta_type)
		buff = var3067
		var3060 = var3068
	end
	local buff_1 = buffer.create(var3060)
	buffer.copy(buff_1, 0, buff, 0, var3060)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref)
	local var3060 = t_110.new()
	local var3061 = 0
	while var3061 < buffer.len(p110) do
		local _ = nil
		local var3062 = nil
		local var3063, var3064, var3065 = protoModule.readTag(p110, var3061)
		local var3066 = var3063
		var3062 = var3064
		var3061 = var3065
		
		if var3062 == protoModule.wireTypes.varint then
			local _ = nil
			local var3067, var3068 = protoModule.readVarInt(p110, var3061)
			local _ = var3067
			var3061 = var3068
			continue
		end
		if var3062 == protoModule.wireTypes.lengthDelimited then
			if var3066 == 1 then
				local _ = nil
				local var3069, var3070 = protoModule.readBuffer(p110, var3061)
				var3061 = var3070
				var3060.primary_cta_button_text = buffer.tostring(var3069)
			elseif var3066 == 2 then
				local _ = nil
				local var3071, var3072 = protoModule.readBuffer(p110, var3061)
				var3061 = var3072
				var3060.secondary_cta_button_text = buffer.tostring(var3071)
			elseif var3066 == 3 then
				local _ = nil
				local var3073, var3074 = protoModule.readBuffer(p110, var3061)
				var3061 = var3074
				var3060.primary_cta_type = buffer.tostring(var3073)
			elseif var3066 == 4 then
				local _ = nil
				local var3075, var3076 = protoModule.readBuffer(p110, var3061)
				var3061 = var3076
				var3060.secondary_cta_type = buffer.tostring(var3075)
			else
				local _ = nil
				local var3077, var3078 = protoModule.readVarInt(p110, var3061)
				var3061 = var3078 + var3077
			end
		elseif var3062 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3079, var3080 = protoModule.readFixed32(p110, var3061)
			local _ = var3079
			var3061 = var3080
		elseif var3062 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3081, var3082 = protoModule.readFixed64(p110, var3061)
			local _ = var3081
			var3061 = var3082
		else
			error("Unsupported wire type: " .. var4448)
		end
	end
	return var3060
end

function t_110:jsonEncode()
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

function t_110:jsonDecode()
	-- upvalues: t_110 (ref)
	local var3083 = t_110.new()
	
	if self.primary_cta_button_text ~= nil then
		var3083.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var3083.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var3083.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var3083.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var3083.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var3083.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var3083.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var3083.secondary_cta_type = self.secondaryCtaType
	end
	return var3083
end

t_110.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_110
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p111)
	-- upvalues: t_111 (ref)
	return setmetatable({
		image_asset_id = if p111 == nil or p111.image_asset_id == nil then "" else p111.image_asset_id
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3083 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3084, var3085 = protoModule.writeTag(buff, var3083, 1, protoModule.wireTypes.lengthDelimited)
		var3084, var4474 = protoModule.writeString(var3084, var3085, self.image_asset_id)
		buff = var3084
		var3083 = var3085
	end
	local buff_1 = buffer.create(var3083)
	buffer.copy(buff_1, 0, buff, 0, var3083)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref)
	local var3083 = t_111.new()
	local var3084 = 0
	while var3084 < buffer.len(p111) do
		local _ = nil
		local var3085 = nil
		local var3086, var3087, var3088 = protoModule.readTag(p111, var3084)
		local var3089 = var3086
		var3085 = var3087
		var3084 = var3088
		
		if var3085 == protoModule.wireTypes.varint then
			local _ = nil
			local var3090, var3091 = protoModule.readVarInt(p111, var3084)
			local _ = var3090
			var3084 = var3091
			continue
		end
		if var3085 == protoModule.wireTypes.lengthDelimited then
			if var3089 == 1 then
				local _ = nil
				local var3092, var3093 = protoModule.readBuffer(p111, var3084)
				var3084 = var3093
				var3083.image_asset_id = buffer.tostring(var3092)
			else
				local _ = nil
				local var3094, var3095 = protoModule.readVarInt(p111, var3084)
				var3084 = var3095 + var3094
			end
		elseif var3085 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3096, var3097 = protoModule.readFixed32(p111, var3084)
			local _ = var3096
			var3084 = var3097
		elseif var3085 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3098, var3099 = protoModule.readFixed64(p111, var3084)
			local _ = var3098
			var3084 = var3099
		else
			error("Unsupported wire type: " .. var4478)
		end
	end
	return var3083
end

function t_111:jsonEncode()
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_111:jsonDecode()
	-- upvalues: t_111 (ref)
	local var3100 = t_111.new()
	
	if self.image_asset_id ~= nil then
		var3100.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3100.image_asset_id = self.imageAssetId
	end
	return var3100
end

t_111.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_111
typeRegistryModule.default:register(t.ImageInputData)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p112)
	-- upvalues: t_112 (ref)
	return setmetatable({
		video_asset_id = if p112 == nil or p112.video_asset_id == nil then "" else p112.video_asset_id,
		loading_image_asset_id = if p112 == nil or p112.loading_image_asset_id == nil then "" else p112.loading_image_asset_id,
		max_quality = if p112 == nil or p112.max_quality == nil then "" else p112.max_quality,
		adaptive_resolution = if p112 == nil or p112.adaptive_resolution == nil then false else p112.adaptive_resolution
	}, t_112)
end

function t_112:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3100 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3101, var3102 = protoModule.writeTag(buff, var3100, 1, protoModule.wireTypes.lengthDelimited)
		var3101, var4498 = protoModule.writeString(var3101, var3102, self.video_asset_id)
		buff = var3101
		var3100 = var3102
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var3103, var3104 = protoModule.writeTag(buff, var3100, 2, protoModule.wireTypes.lengthDelimited)
		var3103, var4500 = protoModule.writeString(var3103, var3104, self.loading_image_asset_id)
		buff = var3103
		var3100 = var3104
	end
	if self.max_quality ~= nil and self.max_quality ~= "" then
		local var3105, var3106 = protoModule.writeTag(buff, var3100, 3, protoModule.wireTypes.lengthDelimited)
		var3105, var4502 = protoModule.writeString(var3105, var3106, self.max_quality)
		buff = var3105
		var3100 = var3106
	end
	if self.adaptive_resolution then
		local var3107, var3108 = protoModule.writeTag(buff, var3100, 4, protoModule.wireTypes.varint)
		var3107, var4504 = protoModule.writeVarInt(var3107, var3108, if self.adaptive_resolution then 1 else 0)
		buff = var3107
		var3100 = var3108
	end
	local buff_1 = buffer.create(var3100)
	buffer.copy(buff_1, 0, buff, 0, var3100)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref)
	local var3100 = t_112.new()
	local var3101 = 0
	while var3101 < buffer.len(p112) do
		local _ = nil
		local var3102 = nil
		local var3103, var3104, var3105 = protoModule.readTag(p112, var3101)
		local var3106 = var3103
		var3102 = var3104
		var3101 = var3105
		
		if var3102 == protoModule.wireTypes.varint then
			if var3106 == 4 then
				local _ = nil
				local var3107, var3108 = protoModule.readVarInt(p112, var3101)
				var3101 = var3108
				var3100.adaptive_resolution = var3107 ~= 0
			else
				local _ = nil
				local var3109, var3110 = protoModule.readVarInt(p112, var3101)
				local _ = var3109
				var3101 = var3110
			end
		end
		if var3102 == protoModule.wireTypes.lengthDelimited then
			if var3106 == 1 then
				local _ = nil
				local var3111, var3112 = protoModule.readBuffer(p112, var3101)
				var3101 = var3112
				var3100.video_asset_id = buffer.tostring(var3111)
			elseif var3106 == 2 then
				local _ = nil
				local var3113, var3114 = protoModule.readBuffer(p112, var3101)
				var3101 = var3114
				var3100.loading_image_asset_id = buffer.tostring(var3113)
			elseif var3106 == 3 then
				local _ = nil
				local var3115, var3116 = protoModule.readBuffer(p112, var3101)
				var3101 = var3116
				var3100.max_quality = buffer.tostring(var3115)
			else
				local _ = nil
				local var3117, var3118 = protoModule.readVarInt(p112, var3101)
				var3101 = var3118 + var3117
			end
		elseif var3102 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3119, var3120 = protoModule.readFixed32(p112, var3101)
			local _ = var3119
			var3101 = var3120
		elseif var3102 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3121, var3122 = protoModule.readFixed64(p112, var3101)
			local _ = var3121
			var3101 = var3122
		else
			error("Unsupported wire type: " .. var4508)
		end
	end
	return var3100
end

function t_112:jsonEncode()
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

function t_112:jsonDecode()
	-- upvalues: t_112 (ref)
	local var3123 = t_112.new()
	
	if self.video_asset_id ~= nil then
		var3123.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3123.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var3123.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var3123.loading_image_asset_id = self.loadingImageAssetId
	end
	if self.max_quality ~= nil then
		var3123.max_quality = self.max_quality
	end
	if self.maxQuality ~= nil then
		var3123.max_quality = self.maxQuality
	end
	if self.adaptive_resolution ~= nil then
		var3123.adaptive_resolution = self.adaptive_resolution
	end
	if self.adaptiveResolution ~= nil then
		var3123.adaptive_resolution = self.adaptiveResolution
	end
	return var3123
end

t_112.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_112
typeRegistryModule.default:register(t.VideoInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p113)
	-- upvalues: t_113 (ref)
	return setmetatable({
		text = if p113 == nil or p113.text == nil then "" else p113.text,
		is_rendered_text = if p113 == nil or p113.is_rendered_text == nil then false else p113.is_rendered_text,
		url = if p113 == nil or p113.url == nil then "" else p113.url
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3123 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var3124, var3125 = protoModule.writeTag(buff, var3123, 1, protoModule.wireTypes.lengthDelimited)
		var3124, var4534 = protoModule.writeString(var3124, var3125, self.text)
		buff = var3124
		var3123 = var3125
	end
	if self.is_rendered_text then
		local var3126, var3127 = protoModule.writeTag(buff, var3123, 2, protoModule.wireTypes.varint)
		var3126, var4536 = protoModule.writeVarInt(var3126, var3127, if self.is_rendered_text then 1 else 0)
		buff = var3126
		var3123 = var3127
	end
	if self.url ~= nil and self.url ~= "" then
		local var3128, var3129 = protoModule.writeTag(buff, var3123, 3, protoModule.wireTypes.lengthDelimited)
		var3128, var4538 = protoModule.writeString(var3128, var3129, self.url)
		buff = var3128
		var3123 = var3129
	end
	local buff_1 = buffer.create(var3123)
	buffer.copy(buff_1, 0, buff, 0, var3123)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref)
	local var3123 = t_113.new()
	local var3124 = 0
	while var3124 < buffer.len(p113) do
		local _ = nil
		local var3125 = nil
		local var3126, var3127, var3128 = protoModule.readTag(p113, var3124)
		local var3129 = var3126
		var3125 = var3127
		var3124 = var3128
		
		if var3125 == protoModule.wireTypes.varint then
			if var3129 == 2 then
				local _ = nil
				local var3130, var3131 = protoModule.readVarInt(p113, var3124)
				var3124 = var3131
				var3123.is_rendered_text = var3130 ~= 0
			else
				local _ = nil
				local var3132, var3133 = protoModule.readVarInt(p113, var3124)
				local _ = var3132
				var3124 = var3133
			end
		end
		if var3125 == protoModule.wireTypes.lengthDelimited then
			if var3129 == 1 then
				local _ = nil
				local var3134, var3135 = protoModule.readBuffer(p113, var3124)
				var3124 = var3135
				var3123.text = buffer.tostring(var3134)
			elseif var3129 == 3 then
				local _ = nil
				local var3136, var3137 = protoModule.readBuffer(p113, var3124)
				var3124 = var3137
				var3123.url = buffer.tostring(var3136)
			else
				local _ = nil
				local var3138, var3139 = protoModule.readVarInt(p113, var3124)
				var3124 = var3139 + var3138
			end
		elseif var3125 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3140, var3141 = protoModule.readFixed32(p113, var3124)
			local _ = var3140
			var3124 = var3141
		elseif var3125 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3142, var3143 = protoModule.readFixed64(p113, var3124)
			local _ = var3142
			var3124 = var3143
		else
			error("Unsupported wire type: " .. var4542)
		end
	end
	return var3123
end

function t_113:jsonEncode()
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

function t_113:jsonDecode()
	-- upvalues: t_113 (ref)
	local var3144 = t_113.new()
	
	if self.text ~= nil then
		var3144.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var3144.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var3144.is_rendered_text = self.isRenderedText
	end
	if self.url ~= nil then
		var3144.url = self.url
	end
	return var3144
end

t_113.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_113
typeRegistryModule.default:register(t.TextInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p114)
	-- upvalues: t_114 (ref)
	return setmetatable({
		entry_map = if p114 == nil or p114.entry_map == nil then {} else p114.entry_map,
		entry_order = if p114 == nil or p114.entry_order == nil then {} else p114.entry_order,
		entry_order_map = if p114 == nil or p114.entry_order_map == nil then {} else p114.entry_order_map,
		content_pools = if p114 == nil or p114.content_pools == nil then {} else p114.content_pools
	}, t_114)
end

function t_114:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3144 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3145, var3146 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3145, var4566 = protoModule.writeString(var3145, var3146, i)
			local var3147 = v:encode()
			var3146, var4568 = protoModule.writeTag(var3145, var3146, 2, protoModule.wireTypes.lengthDelimited)
			var3146, var4568 = protoModule.writeBuffer(var3146, var4568, var3147, buffer.len(var3147))
			local var3148 = var3146
			local var3149 = var4568
			local var3150, var3151 = protoModule.writeTag(buff, var3144, 1, protoModule.wireTypes.lengthDelimited)
			var3150, var4572 = protoModule.writeBuffer(var3150, var3151, var3148, var3149)
			buff = var3150
			var3144 = var3151
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3152, var3153 = protoModule.writeTag(buff, var3144, 2, protoModule.wireTypes.lengthDelimited)
			var3152, var4574 = protoModule.writeString(var3152, var3153, v)
			buff = var3152
			var3144 = var3153
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var3154, var3155 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3154, var4576 = protoModule.writeString(var3154, var3155, i)
			local var3156 = v:encode()
			var3155, var4578 = protoModule.writeTag(var3154, var3155, 2, protoModule.wireTypes.lengthDelimited)
			var3155, var4578 = protoModule.writeBuffer(var3155, var4578, var3156, buffer.len(var3156))
			local var3157 = var3155
			local var3158 = var4578
			local var3159, var3160 = protoModule.writeTag(buff, var3144, 3, protoModule.wireTypes.lengthDelimited)
			var3159, var4582 = protoModule.writeBuffer(var3159, var3160, var3157, var3158)
			buff = var3159
			var3144 = var3160
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3161, var3162 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3161, var4584 = protoModule.writeString(var3161, var3162, i)
			local var3163 = v:encode()
			var3162, var4586 = protoModule.writeTag(var3161, var3162, 2, protoModule.wireTypes.lengthDelimited)
			var3162, var4586 = protoModule.writeBuffer(var3162, var4586, var3163, buffer.len(var3163))
			local var3164 = var3162
			local var3165 = var4586
			local var3166, var3167 = protoModule.writeTag(buff, var3144, 4, protoModule.wireTypes.lengthDelimited)
			var3166, var4590 = protoModule.writeBuffer(var3166, var3167, var3164, var3165)
			buff = var3166
			var3144 = var3167
		end
	end
	local buff_1 = buffer.create(var3144)
	buffer.copy(buff_1, 0, buff, 0, var3144)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3168 = t_114.new()
	local var3169 = 0
	while var3169 < buffer.len(p114) do
		local _ = nil
		local var3170 = nil
		local var3171, var3172, var3173 = protoModule.readTag(p114, var3169)
		local var3174 = var3171
		var3170 = var3172
		var3169 = var3173
		
		if var3170 == protoModule.wireTypes.varint then
			local _ = nil
			local var3175, var3176 = protoModule.readVarInt(p114, var3169)
			local _ = var3175
			var3169 = var3176
			continue
		end
		if var3170 == protoModule.wireTypes.lengthDelimited then
			if var3174 == 1 then
				local _ = nil
				local var3177, var3178 = protoModule.readBuffer(p114, var3169)
				var3169 = var3178
				var3177 = t.VerticalFeedInputData_EntryMapEntry.decode(var3177)
				var3168.entry_map[var3177.key or ""] = var3177.value or t.FeedEntry.new()
			elseif var3174 == 2 then
				local _ = nil
				local var3179, var3180 = protoModule.readBuffer(p114, var3169)
				var3169 = var3180
				table.insert(var3168.entry_order, buffer.tostring(var3179))
			elseif var3174 == 3 then
				local _ = nil
				local var3181, var3182 = protoModule.readBuffer(p114, var3169)
				var3169 = var3182
				var3181 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3181)
				var3168.entry_order_map[var3181.key or ""] = var3181.value or t.EntryOrder.new()
			elseif var3174 == 4 then
				local _ = nil
				local var3183, var3184 = protoModule.readBuffer(p114, var3169)
				var3169 = var3184
				var3183 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3183)
				var3168.content_pools[var3183.key or ""] = var3183.value or t.ContentPool.new()
			else
				local _ = nil
				local var3185, var3186 = protoModule.readVarInt(p114, var3169)
				var3169 = var3186 + var3185
			end
		elseif var3170 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3187, var3188 = protoModule.readFixed32(p114, var3169)
			local _ = var3187
			var3169 = var3188
		elseif var3170 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3189, var3190 = protoModule.readFixed64(p114, var3169)
			local _ = var3189
			var3169 = var3190
		else
			error("Unsupported wire type: " .. var4594)
		end
	end
	return var3168
end

function t_114:jsonEncode()
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

function t_114:jsonDecode()
	-- upvalues: t_114 (ref), t (ref)
	local var3191 = t_114.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3191.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3191.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3191.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3191.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3191.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3191.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3191.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3191.content_pools = t_1
	end
	return var3191
end

t_114.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_114
typeRegistryModule.default:register(t.VerticalFeedInputData)
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
	local var3192 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3193, var3194 = protoModule.writeTag(buff, var3192, 1, protoModule.wireTypes.lengthDelimited)
		var3193, var4632 = protoModule.writeString(var3193, var3194, self.key)
		buff = var3193
		var3192 = var3194
	end
	if self.value ~= nil then
		local var3195 = self.value:encode()
		local var3196, var3197 = protoModule.writeTag(buff, var3192, 2, protoModule.wireTypes.lengthDelimited)
		var3196, var4635 = protoModule.writeBuffer(var3196, var3197, var3195, buffer.len(var3195))
		buff = var3196
		var3192 = var3197
	end
	local buff_1 = buffer.create(var3192)
	buffer.copy(buff_1, 0, buff, 0, var3192)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var3192 = t_115.new()
	local var3193 = 0
	while var3193 < buffer.len(p115) do
		local _ = nil
		local var3194 = nil
		local var3195, var3196, var3197 = protoModule.readTag(p115, var3193)
		local var3198 = var3195
		var3194 = var3196
		var3193 = var3197
		
		if var3194 == protoModule.wireTypes.varint then
			local _ = nil
			local var3199, var3200 = protoModule.readVarInt(p115, var3193)
			local _ = var3199
			var3193 = var3200
			continue
		end
		if var3194 == protoModule.wireTypes.lengthDelimited then
			if var3198 == 1 then
				local _ = nil
				local var3201, var3202 = protoModule.readBuffer(p115, var3193)
				var3193 = var3202
				var3192.key = buffer.tostring(var3201)
			elseif var3198 == 2 then
				local _ = nil
				local var3203, var3204 = protoModule.readBuffer(p115, var3193)
				var3193 = var3204
				var3192.value = t.FeedEntry.decode(var3203)
			else
				local _ = nil
				local var3205, var3206 = protoModule.readVarInt(p115, var3193)
				var3193 = var3206 + var3205
			end
		elseif var3194 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3207, var3208 = protoModule.readFixed32(p115, var3193)
			local _ = var3207
			var3193 = var3208
		elseif var3194 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3209, var3210 = protoModule.readFixed64(p115, var3193)
			local _ = var3209
			var3193 = var3210
		else
			error("Unsupported wire type: " .. var4639)
		end
	end
	return var3192
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
	local var3211 = t_115.new()
	
	if self.key ~= nil then
		var3211.key = self.key
	end
	if self.value ~= nil then
		var3211.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3211
end

t_115.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_115
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
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
	local var3211 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3212, var3213 = protoModule.writeTag(buff, var3211, 1, protoModule.wireTypes.lengthDelimited)
		var3212, var4661 = protoModule.writeString(var3212, var3213, self.key)
		buff = var3212
		var3211 = var3213
	end
	if self.value ~= nil then
		local var3214 = self.value:encode()
		local var3215, var3216 = protoModule.writeTag(buff, var3211, 2, protoModule.wireTypes.lengthDelimited)
		var3215, var4664 = protoModule.writeBuffer(var3215, var3216, var3214, buffer.len(var3214))
		buff = var3215
		var3211 = var3216
	end
	local buff_1 = buffer.create(var3211)
	buffer.copy(buff_1, 0, buff, 0, var3211)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var3211 = t_116.new()
	local var3212 = 0
	while var3212 < buffer.len(p116) do
		local _ = nil
		local var3213 = nil
		local var3214, var3215, var3216 = protoModule.readTag(p116, var3212)
		local var3217 = var3214
		var3213 = var3215
		var3212 = var3216
		
		if var3213 == protoModule.wireTypes.varint then
			local _ = nil
			local var3218, var3219 = protoModule.readVarInt(p116, var3212)
			local _ = var3218
			var3212 = var3219
			continue
		end
		if var3213 == protoModule.wireTypes.lengthDelimited then
			if var3217 == 1 then
				local _ = nil
				local var3220, var3221 = protoModule.readBuffer(p116, var3212)
				var3212 = var3221
				var3211.key = buffer.tostring(var3220)
			elseif var3217 == 2 then
				local _ = nil
				local var3222, var3223 = protoModule.readBuffer(p116, var3212)
				var3212 = var3223
				var3211.value = t.EntryOrder.decode(var3222)
			else
				local _ = nil
				local var3224, var3225 = protoModule.readVarInt(p116, var3212)
				var3212 = var3225 + var3224
			end
		elseif var3213 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3226, var3227 = protoModule.readFixed32(p116, var3212)
			local _ = var3226
			var3212 = var3227
		elseif var3213 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3228, var3229 = protoModule.readFixed64(p116, var3212)
			local _ = var3228
			var3212 = var3229
		else
			error("Unsupported wire type: " .. var4668)
		end
	end
	return var3211
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
	local var3230 = t_116.new()
	
	if self.key ~= nil then
		var3230.key = self.key
	end
	if self.value ~= nil then
		var3230.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3230
end

t_116.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_116
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
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
	local var3230 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3231, var3232 = protoModule.writeTag(buff, var3230, 1, protoModule.wireTypes.lengthDelimited)
		var3231, var4690 = protoModule.writeString(var3231, var3232, self.key)
		buff = var3231
		var3230 = var3232
	end
	if self.value ~= nil then
		local var3233 = self.value:encode()
		local var3234, var3235 = protoModule.writeTag(buff, var3230, 2, protoModule.wireTypes.lengthDelimited)
		var3234, var4693 = protoModule.writeBuffer(var3234, var3235, var3233, buffer.len(var3233))
		buff = var3234
		var3230 = var3235
	end
	local buff_1 = buffer.create(var3230)
	buffer.copy(buff_1, 0, buff, 0, var3230)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var3230 = t_117.new()
	local var3231 = 0
	while var3231 < buffer.len(p117) do
		local _ = nil
		local var3232 = nil
		local var3233, var3234, var3235 = protoModule.readTag(p117, var3231)
		local var3236 = var3233
		var3232 = var3234
		var3231 = var3235
		
		if var3232 == protoModule.wireTypes.varint then
			local _ = nil
			local var3237, var3238 = protoModule.readVarInt(p117, var3231)
			local _ = var3237
			var3231 = var3238
			continue
		end
		if var3232 == protoModule.wireTypes.lengthDelimited then
			if var3236 == 1 then
				local _ = nil
				local var3239, var3240 = protoModule.readBuffer(p117, var3231)
				var3231 = var3240
				var3230.key = buffer.tostring(var3239)
			elseif var3236 == 2 then
				local _ = nil
				local var3241, var3242 = protoModule.readBuffer(p117, var3231)
				var3231 = var3242
				var3230.value = t.ContentPool.decode(var3241)
			else
				local _ = nil
				local var3243, var3244 = protoModule.readVarInt(p117, var3231)
				var3231 = var3244 + var3243
			end
		elseif var3232 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3245, var3246 = protoModule.readFixed32(p117, var3231)
			local _ = var3245
			var3231 = var3246
		elseif var3232 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3247, var3248 = protoModule.readFixed64(p117, var3231)
			local _ = var3247
			var3231 = var3248
		else
			error("Unsupported wire type: " .. var4697)
		end
	end
	return var3230
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
	local var3249 = t_117.new()
	
	if self.key ~= nil then
		var3249.key = self.key
	end
	if self.value ~= nil then
		var3249.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3249
end

t_117.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_117
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p118)
	-- upvalues: t_118 (ref)
	return setmetatable({
		foreground_header_entry = if p118 == nil or p118.foreground_header_entry == nil then nil else p118.foreground_header_entry,
		background_header_entry = if p118 == nil or p118.background_header_entry == nil then nil else p118.background_header_entry,
		layout_variant = if p118 == nil or p118.layout_variant == nil then "" else p118.layout_variant
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3249 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3250 = self.foreground_header_entry:encode()
		local var3251, var3252 = protoModule.writeTag(buff, var3249, 1, protoModule.wireTypes.lengthDelimited)
		var3251, var4720 = protoModule.writeBuffer(var3251, var3252, var3250, buffer.len(var3250))
		buff = var3251
		var3249 = var3252
	end
	if self.background_header_entry ~= nil then
		local var3253 = self.background_header_entry:encode()
		local var3254, var3255 = protoModule.writeTag(buff, var3249, 2, protoModule.wireTypes.lengthDelimited)
		var3254, var4723 = protoModule.writeBuffer(var3254, var3255, var3253, buffer.len(var3253))
		buff = var3254
		var3249 = var3255
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3256, var3257 = protoModule.writeTag(buff, var3249, 3, protoModule.wireTypes.lengthDelimited)
		var3256, var4725 = protoModule.writeString(var3256, var3257, self.layout_variant)
		buff = var3256
		var3249 = var3257
	end
	local buff_1 = buffer.create(var3249)
	buffer.copy(buff_1, 0, buff, 0, var3249)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var3249 = t_118.new()
	local var3250 = 0
	while var3250 < buffer.len(p118) do
		local _ = nil
		local var3251 = nil
		local var3252, var3253, var3254 = protoModule.readTag(p118, var3250)
		local var3255 = var3252
		var3251 = var3253
		var3250 = var3254
		
		if var3251 == protoModule.wireTypes.varint then
			local _ = nil
			local var3256, var3257 = protoModule.readVarInt(p118, var3250)
			local _ = var3256
			var3250 = var3257
			continue
		end
		if var3251 == protoModule.wireTypes.lengthDelimited then
			if var3255 == 1 then
				local _ = nil
				local var3258, var3259 = protoModule.readBuffer(p118, var3250)
				var3250 = var3259
				var3249.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3258)
			elseif var3255 == 2 then
				local _ = nil
				local var3260, var3261 = protoModule.readBuffer(p118, var3250)
				var3250 = var3261
				var3249.background_header_entry = t.BackgroundHeaderEntry.decode(var3260)
			elseif var3255 == 3 then
				local _ = nil
				local var3262, var3263 = protoModule.readBuffer(p118, var3250)
				var3250 = var3263
				var3249.layout_variant = buffer.tostring(var3262)
			else
				local _ = nil
				local var3264, var3265 = protoModule.readVarInt(p118, var3250)
				var3250 = var3265 + var3264
			end
		elseif var3251 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3266, var3267 = protoModule.readFixed32(p118, var3250)
			local _ = var3266
			var3250 = var3267
		elseif var3251 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3268, var3269 = protoModule.readFixed64(p118, var3250)
			local _ = var3268
			var3250 = var3269
		else
			error("Unsupported wire type: " .. var4729)
		end
	end
	return var3249
end

function t_118:jsonEncode()
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

function t_118:jsonDecode()
	-- upvalues: t_118 (ref), t (ref)
	local var3270 = t_118.new()
	
	if self.foreground_header_entry ~= nil then
		var3270.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3270.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3270.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3270.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3270.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3270.layout_variant = self.layoutVariant
	end
	return var3270
end

t_118.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_118
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p119)
	-- upvalues: t_119 (ref)
	return setmetatable({
		cta_button_text = if p119 == nil or p119.cta_button_text == nil then "" else p119.cta_button_text,
		cta_type = if p119 == nil or p119.cta_type == nil then "" else p119.cta_type
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3270 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3271, var3272 = protoModule.writeTag(buff, var3270, 1, protoModule.wireTypes.lengthDelimited)
		var3271, var4753 = protoModule.writeString(var3271, var3272, self.cta_button_text)
		buff = var3271
		var3270 = var3272
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3273, var3274 = protoModule.writeTag(buff, var3270, 2, protoModule.wireTypes.lengthDelimited)
		var3273, var4755 = protoModule.writeString(var3273, var3274, self.cta_type)
		buff = var3273
		var3270 = var3274
	end
	local buff_1 = buffer.create(var3270)
	buffer.copy(buff_1, 0, buff, 0, var3270)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3270 = t_119.new()
	local var3271 = 0
	while var3271 < buffer.len(p119) do
		local _ = nil
		local var3272 = nil
		local var3273, var3274, var3275 = protoModule.readTag(p119, var3271)
		local var3276 = var3273
		var3272 = var3274
		var3271 = var3275
		
		if var3272 == protoModule.wireTypes.varint then
			local _ = nil
			local var3277, var3278 = protoModule.readVarInt(p119, var3271)
			local _ = var3277
			var3271 = var3278
			continue
		end
		if var3272 == protoModule.wireTypes.lengthDelimited then
			if var3276 == 1 then
				local _ = nil
				local var3279, var3280 = protoModule.readBuffer(p119, var3271)
				var3271 = var3280
				var3270.cta_button_text = buffer.tostring(var3279)
			elseif var3276 == 2 then
				local _ = nil
				local var3281, var3282 = protoModule.readBuffer(p119, var3271)
				var3271 = var3282
				var3270.cta_type = buffer.tostring(var3281)
			else
				local _ = nil
				local var3283, var3284 = protoModule.readVarInt(p119, var3271)
				var3271 = var3284 + var3283
			end
		elseif var3272 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3285, var3286 = protoModule.readFixed32(p119, var3271)
			local _ = var3285
			var3271 = var3286
		elseif var3272 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3287, var3288 = protoModule.readFixed64(p119, var3271)
			local _ = var3287
			var3271 = var3288
		else
			error("Unsupported wire type: " .. var4759)
		end
	end
	return var3270
end

function t_119:jsonEncode()
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_119:jsonDecode()
	-- upvalues: t_119 (ref)
	local var3289 = t_119.new()
	
	if self.cta_button_text ~= nil then
		var3289.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3289.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3289.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3289.cta_type = self.ctaType
	end
	return var3289
end

t_119.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_119
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		title = if p120 == nil or p120.title == nil then "" else p120.title,
		cta_button_text = if p120 == nil or p120.cta_button_text == nil then "" else p120.cta_button_text,
		image_asset_id = if p120 == nil or p120.image_asset_id == nil then "" else p120.image_asset_id,
		cta_type = if p120 == nil or p120.cta_type == nil then "" else p120.cta_type
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3289 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3290, var3291 = protoModule.writeTag(buff, var3289, 1, protoModule.wireTypes.lengthDelimited)
		var3290, var4781 = protoModule.writeString(var3290, var3291, self.title)
		buff = var3290
		var3289 = var3291
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3292, var3293 = protoModule.writeTag(buff, var3289, 2, protoModule.wireTypes.lengthDelimited)
		var3292, var4783 = protoModule.writeString(var3292, var3293, self.cta_button_text)
		buff = var3292
		var3289 = var3293
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3294, var3295 = protoModule.writeTag(buff, var3289, 3, protoModule.wireTypes.lengthDelimited)
		var3294, var4785 = protoModule.writeString(var3294, var3295, self.image_asset_id)
		buff = var3294
		var3289 = var3295
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3296, var3297 = protoModule.writeTag(buff, var3289, 4, protoModule.wireTypes.lengthDelimited)
		var3296, var4787 = protoModule.writeString(var3296, var3297, self.cta_type)
		buff = var3296
		var3289 = var3297
	end
	local buff_1 = buffer.create(var3289)
	buffer.copy(buff_1, 0, buff, 0, var3289)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3289 = t_120.new()
	local var3290 = 0
	while var3290 < buffer.len(p120) do
		local _ = nil
		local var3291 = nil
		local var3292, var3293, var3294 = protoModule.readTag(p120, var3290)
		local var3295 = var3292
		var3291 = var3293
		var3290 = var3294
		
		if var3291 == protoModule.wireTypes.varint then
			local _ = nil
			local var3296, var3297 = protoModule.readVarInt(p120, var3290)
			local _ = var3296
			var3290 = var3297
			continue
		end
		if var3291 == protoModule.wireTypes.lengthDelimited then
			if var3295 == 1 then
				local _ = nil
				local var3298, var3299 = protoModule.readBuffer(p120, var3290)
				var3290 = var3299
				var3289.title = buffer.tostring(var3298)
			elseif var3295 == 2 then
				local _ = nil
				local var3300, var3301 = protoModule.readBuffer(p120, var3290)
				var3290 = var3301
				var3289.cta_button_text = buffer.tostring(var3300)
			elseif var3295 == 3 then
				local _ = nil
				local var3302, var3303 = protoModule.readBuffer(p120, var3290)
				var3290 = var3303
				var3289.image_asset_id = buffer.tostring(var3302)
			elseif var3295 == 4 then
				local _ = nil
				local var3304, var3305 = protoModule.readBuffer(p120, var3290)
				var3290 = var3305
				var3289.cta_type = buffer.tostring(var3304)
			else
				local _ = nil
				local var3306, var3307 = protoModule.readVarInt(p120, var3290)
				var3290 = var3307 + var3306
			end
		elseif var3291 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3308, var3309 = protoModule.readFixed32(p120, var3290)
			local _ = var3308
			var3290 = var3309
		elseif var3291 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3310, var3311 = protoModule.readFixed64(p120, var3290)
			local _ = var3310
			var3290 = var3311
		else
			error("Unsupported wire type: " .. var4791)
		end
	end
	return var3289
end

function t_120:jsonEncode()
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

function t_120:jsonDecode()
	-- upvalues: t_120 (ref)
	local var3312 = t_120.new()
	
	if self.title ~= nil then
		var3312.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3312.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3312.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3312.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3312.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3312.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3312.cta_type = self.ctaType
	end
	return var3312
end

t_120.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_120
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p121)
	-- upvalues: t_121 (ref)
	return setmetatable({
		title = if p121 == nil or p121.title == nil then "" else p121.title,
		url = if p121 == nil or p121.url == nil then nil else p121.url,
		destination = if p121 == nil or p121.destination == nil then nil else p121.destination,
		row_id = if p121 == nil or p121.row_id == nil then "" else p121.row_id
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3312 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3313, var3314 = protoModule.writeTag(buff, var3312, 1, protoModule.wireTypes.lengthDelimited)
		var3313, var4817 = protoModule.writeString(var3313, var3314, self.title)
		buff = var3313
		var3312 = var3314
	end
	if self.url ~= nil then
		local var3315, var3316 = protoModule.writeTag(buff, var3312, 2, protoModule.wireTypes.lengthDelimited)
		var3315, var4819 = protoModule.writeString(var3315, var3316, self.url)
		buff = var3315
		var3312 = var3316
	end
	if self.destination ~= nil then
		local var3317, var3318 = protoModule.writeTag(buff, var3312, 3, protoModule.wireTypes.lengthDelimited)
		var3317, var4821 = protoModule.writeString(var3317, var3318, self.destination)
		buff = var3317
		var3312 = var3318
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local var3319, var3320 = protoModule.writeTag(buff, var3312, 4, protoModule.wireTypes.lengthDelimited)
		var3319, var4823 = protoModule.writeString(var3319, var3320, self.row_id)
		buff = var3319
		var3312 = var3320
	end
	local buff_1 = buffer.create(var3312)
	buffer.copy(buff_1, 0, buff, 0, var3312)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref)
	local var3312 = t_121.new()
	local var3313 = 0
	while var3313 < buffer.len(p121) do
		local _ = nil
		local var3314 = nil
		local var3315, var3316, var3317 = protoModule.readTag(p121, var3313)
		local var3318 = var3315
		var3314 = var3316
		var3313 = var3317
		
		if var3314 == protoModule.wireTypes.varint then
			local _ = nil
			local var3319, var3320 = protoModule.readVarInt(p121, var3313)
			local _ = var3319
			var3313 = var3320
			continue
		end
		if var3314 == protoModule.wireTypes.lengthDelimited then
			if var3318 == 1 then
				local _ = nil
				local var3321, var3322 = protoModule.readBuffer(p121, var3313)
				var3313 = var3322
				var3312.title = buffer.tostring(var3321)
			elseif var3318 == 2 then
				local _ = nil
				local var3323, var3324 = protoModule.readBuffer(p121, var3313)
				var3313 = var3324
				var3312.url = buffer.tostring(var3323)
			elseif var3318 == 3 then
				local _ = nil
				local var3325, var3326 = protoModule.readBuffer(p121, var3313)
				var3313 = var3326
				var3312.destination = buffer.tostring(var3325)
			elseif var3318 == 4 then
				local _ = nil
				local var3327, var3328 = protoModule.readBuffer(p121, var3313)
				var3313 = var3328
				var3312.row_id = buffer.tostring(var3327)
			else
				local _ = nil
				local var3329, var3330 = protoModule.readVarInt(p121, var3313)
				var3313 = var3330 + var3329
			end
		elseif var3314 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3331, var3332 = protoModule.readFixed32(p121, var3313)
			local _ = var3331
			var3313 = var3332
		elseif var3314 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3333, var3334 = protoModule.readFixed64(p121, var3313)
			local _ = var3333
			var3313 = var3334
		else
			error("Unsupported wire type: " .. var4827)
		end
	end
	return var3312
end

function t_121:jsonEncode()
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

function t_121:jsonDecode()
	-- upvalues: t_121 (ref)
	local var3335 = t_121.new()
	
	if self.title ~= nil then
		var3335.title = self.title
	end
	if self.url ~= nil then
		var3335.url = self.url
	end
	if self.destination ~= nil then
		var3335.destination = self.destination
	end
	if self.row_id ~= nil then
		var3335.row_id = self.row_id
	end
	if self.rowId ~= nil then
		var3335.row_id = self.rowId
	end
	return var3335
end

t_121.descriptor = {
	name = "SettingsRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsRowInputData"
}
t.SettingsRowInputData = t_121
typeRegistryModule.default:register(t.SettingsRowInputData)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p122)
	-- upvalues: t_122 (ref)
	return setmetatable({
		setting_key = if p122 == nil or p122.setting_key == nil then "" else p122.setting_key,
		label = if p122 == nil or p122.label == nil then "" else p122.label,
		description = if p122 == nil or p122.description == nil then "" else p122.description,
		is_checked = if p122 == nil or p122.is_checked == nil then false else p122.is_checked,
		is_disabled = if p122 == nil or p122.is_disabled == nil then false else p122.is_disabled,
		audit_data = if p122 == nil or p122.audit_data == nil then "" else p122.audit_data
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3335 = 0
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		local var3336, var3337 = protoModule.writeTag(buff, var3335, 1, protoModule.wireTypes.lengthDelimited)
		var3336, var4853 = protoModule.writeString(var3336, var3337, self.setting_key)
		buff = var3336
		var3335 = var3337
	end
	if self.label ~= nil and self.label ~= "" then
		local var3338, var3339 = protoModule.writeTag(buff, var3335, 2, protoModule.wireTypes.lengthDelimited)
		var3338, var4855 = protoModule.writeString(var3338, var3339, self.label)
		buff = var3338
		var3335 = var3339
	end
	if self.description ~= nil and self.description ~= "" then
		local var3340, var3341 = protoModule.writeTag(buff, var3335, 3, protoModule.wireTypes.lengthDelimited)
		var3340, var4857 = protoModule.writeString(var3340, var3341, self.description)
		buff = var3340
		var3335 = var3341
	end
	if self.is_checked then
		local var3342, var3343 = protoModule.writeTag(buff, var3335, 4, protoModule.wireTypes.varint)
		var3342, var4859 = protoModule.writeVarInt(var3342, var3343, if self.is_checked then 1 else 0)
		buff = var3342
		var3335 = var3343
	end
	if self.is_disabled then
		local var3344, var3345 = protoModule.writeTag(buff, var3335, 5, protoModule.wireTypes.varint)
		var3344, var4861 = protoModule.writeVarInt(var3344, var3345, if self.is_disabled then 1 else 0)
		buff = var3344
		var3335 = var3345
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var3346, var3347 = protoModule.writeTag(buff, var3335, 6, protoModule.wireTypes.lengthDelimited)
		var3346, var4863 = protoModule.writeString(var3346, var3347, self.audit_data)
		buff = var3346
		var3335 = var3347
	end
	local buff_1 = buffer.create(var3335)
	buffer.copy(buff_1, 0, buff, 0, var3335)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref)
	local var3335 = t_122.new()
	local var3336 = 0
	while var3336 < buffer.len(p122) do
		local _ = nil
		local var3337 = nil
		local var3338, var3339, var3340 = protoModule.readTag(p122, var3336)
		local var3341 = var3338
		var3337 = var3339
		var3336 = var3340
		
		if var3337 == protoModule.wireTypes.varint then
			if var3341 == 4 then
				local _ = nil
				local var3342, var3343 = protoModule.readVarInt(p122, var3336)
				var3336 = var3343
				var3335.is_checked = var3342 ~= 0
			elseif var3341 == 5 then
				local _ = nil
				local var3344, var3345 = protoModule.readVarInt(p122, var3336)
				var3336 = var3345
				var3335.is_disabled = var3344 ~= 0
			else
				local _ = nil
				local var3346, var3347 = protoModule.readVarInt(p122, var3336)
				local _ = var3346
				var3336 = var3347
			end
		end
		if var3337 == protoModule.wireTypes.lengthDelimited then
			if var3341 == 1 then
				local _ = nil
				local var3348, var3349 = protoModule.readBuffer(p122, var3336)
				var3336 = var3349
				var3335.setting_key = buffer.tostring(var3348)
			elseif var3341 == 2 then
				local _ = nil
				local var3350, var3351 = protoModule.readBuffer(p122, var3336)
				var3336 = var3351
				var3335.label = buffer.tostring(var3350)
			elseif var3341 == 3 then
				local _ = nil
				local var3352, var3353 = protoModule.readBuffer(p122, var3336)
				var3336 = var3353
				var3335.description = buffer.tostring(var3352)
			elseif var3341 == 6 then
				local _ = nil
				local var3354, var3355 = protoModule.readBuffer(p122, var3336)
				var3336 = var3355
				var3335.audit_data = buffer.tostring(var3354)
			else
				local _ = nil
				local var3356, var3357 = protoModule.readVarInt(p122, var3336)
				var3336 = var3357 + var3356
			end
		elseif var3337 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3358, var3359 = protoModule.readFixed32(p122, var3336)
			local _ = var3358
			var3336 = var3359
		elseif var3337 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3360, var3361 = protoModule.readFixed64(p122, var3336)
			local _ = var3360
			var3336 = var3361
		else
			error("Unsupported wire type: " .. var4867)
		end
	end
	return var3335
end

function t_122:jsonEncode()
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

function t_122:jsonDecode()
	-- upvalues: t_122 (ref)
	local var3362 = t_122.new()
	
	if self.setting_key ~= nil then
		var3362.setting_key = self.setting_key
	end
	if self.settingKey ~= nil then
		var3362.setting_key = self.settingKey
	end
	if self.label ~= nil then
		var3362.label = self.label
	end
	if self.description ~= nil then
		var3362.description = self.description
	end
	if self.is_checked ~= nil then
		var3362.is_checked = self.is_checked
	end
	if self.isChecked ~= nil then
		var3362.is_checked = self.isChecked
	end
	if self.is_disabled ~= nil then
		var3362.is_disabled = self.is_disabled
	end
	if self.isDisabled ~= nil then
		var3362.is_disabled = self.isDisabled
	end
	if self.audit_data ~= nil then
		var3362.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var3362.audit_data = self.auditData
	end
	return var3362
end

t_122.descriptor = {
	name = "SettingsToggleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsToggleInputData"
}
t.SettingsToggleInputData = t_122
typeRegistryModule.default:register(t.SettingsToggleInputData)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p123)
	-- upvalues: t_123 (ref)
	return setmetatable({
		universe_id = if p123 == nil or p123.universe_id == nil then nil else p123.universe_id,
		title = if p123 == nil or p123.title == nil then nil else p123.title,
		subtitle = if p123 == nil or p123.subtitle == nil then nil else p123.subtitle,
		badge_text = if p123 == nil or p123.badge_text == nil then nil else p123.badge_text,
		foreground = if p123 == nil or p123.foreground == nil then nil else p123.foreground,
		background = if p123 == nil or p123.background == nil then nil else p123.background,
		title_image = if p123 == nil or p123.title_image == nil then nil else p123.title_image,
		asset_title = if p123 == nil or p123.asset_title == nil then nil else p123.asset_title,
		asset_subtitle = if p123 == nil or p123.asset_subtitle == nil then nil else p123.asset_subtitle,
		gradient = if p123 == nil or p123.gradient == nil then nil else p123.gradient,
		playable_text = if p123 == nil or p123.playable_text == nil then nil else p123.playable_text,
		collection_id = if p123 == nil or p123.collection_id == nil then nil else p123.collection_id,
		campaign_id = if p123 == nil or p123.campaign_id == nil then nil else p123.campaign_id,
		cohort_id = if p123 == nil or p123.cohort_id == nil then nil else p123.cohort_id,
		sort_id = if p123 == nil or p123.sort_id == nil then nil else p123.sort_id,
		hero_unit_id = if p123 == nil or p123.hero_unit_id == nil then nil else p123.hero_unit_id,
		analytics_id = if p123 == nil or p123.analytics_id == nil then nil else p123.analytics_id,
		is_sponsored = if p123 == nil or p123.is_sponsored == nil then nil else p123.is_sponsored
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3362 = 0
	
	if self.universe_id ~= nil then
		local var3363, var3364 = protoModule.writeTag(buff, var3362, 1, protoModule.wireTypes.lengthDelimited)
		var3363, var4897 = protoModule.writeString(var3363, var3364, self.universe_id)
		buff = var3363
		var3362 = var3364
	end
	if self.title ~= nil then
		local var3365, var3366 = protoModule.writeTag(buff, var3362, 2, protoModule.wireTypes.lengthDelimited)
		var3365, var4899 = protoModule.writeString(var3365, var3366, self.title)
		buff = var3365
		var3362 = var3366
	end
	if self.subtitle ~= nil then
		local var3367, var3368 = protoModule.writeTag(buff, var3362, 3, protoModule.wireTypes.lengthDelimited)
		var3367, var4901 = protoModule.writeString(var3367, var3368, self.subtitle)
		buff = var3367
		var3362 = var3368
	end
	if self.badge_text ~= nil then
		local var3369, var3370 = protoModule.writeTag(buff, var3362, 4, protoModule.wireTypes.lengthDelimited)
		var3369, var4903 = protoModule.writeString(var3369, var3370, self.badge_text)
		buff = var3369
		var3362 = var3370
	end
	if self.foreground ~= nil then
		local var3371 = self.foreground:encode()
		local var3372, var3373 = protoModule.writeTag(buff, var3362, 5, protoModule.wireTypes.lengthDelimited)
		var3372, var4906 = protoModule.writeBuffer(var3372, var3373, var3371, buffer.len(var3371))
		buff = var3372
		var3362 = var3373
	end
	if self.background ~= nil then
		local var3374 = self.background:encode()
		local var3375, var3376 = protoModule.writeTag(buff, var3362, 6, protoModule.wireTypes.lengthDelimited)
		var3375, var4909 = protoModule.writeBuffer(var3375, var3376, var3374, buffer.len(var3374))
		buff = var3375
		var3362 = var3376
	end
	if self.title_image ~= nil then
		local var3377 = self.title_image:encode()
		local var3378, var3379 = protoModule.writeTag(buff, var3362, 7, protoModule.wireTypes.lengthDelimited)
		var3378, var4912 = protoModule.writeBuffer(var3378, var3379, var3377, buffer.len(var3377))
		buff = var3378
		var3362 = var3379
	end
	if self.asset_title ~= nil then
		local var3380, var3381 = protoModule.writeTag(buff, var3362, 8, protoModule.wireTypes.lengthDelimited)
		var3380, var4914 = protoModule.writeString(var3380, var3381, self.asset_title)
		buff = var3380
		var3362 = var3381
	end
	if self.asset_subtitle ~= nil then
		local var3382, var3383 = protoModule.writeTag(buff, var3362, 9, protoModule.wireTypes.lengthDelimited)
		var3382, var4916 = protoModule.writeString(var3382, var3383, self.asset_subtitle)
		buff = var3382
		var3362 = var3383
	end
	if self.gradient ~= nil then
		local var3384 = self.gradient:encode()
		local var3385, var3386 = protoModule.writeTag(buff, var3362, 10, protoModule.wireTypes.lengthDelimited)
		var3385, var4919 = protoModule.writeBuffer(var3385, var3386, var3384, buffer.len(var3384))
		buff = var3385
		var3362 = var3386
	end
	if self.playable_text ~= nil then
		local var3387, var3388 = protoModule.writeTag(buff, var3362, 11, protoModule.wireTypes.lengthDelimited)
		var3387, var4921 = protoModule.writeString(var3387, var3388, self.playable_text)
		buff = var3387
		var3362 = var3388
	end
	if self.collection_id ~= nil then
		local var3389, var3390 = protoModule.writeTag(buff, var3362, 12, protoModule.wireTypes.lengthDelimited)
		var3389, var4923 = protoModule.writeString(var3389, var3390, self.collection_id)
		buff = var3389
		var3362 = var3390
	end
	if self.campaign_id ~= nil then
		local var3391, var3392 = protoModule.writeTag(buff, var3362, 13, protoModule.wireTypes.lengthDelimited)
		var3391, var4925 = protoModule.writeString(var3391, var3392, self.campaign_id)
		buff = var3391
		var3362 = var3392
	end
	if self.cohort_id ~= nil then
		local var3393, var3394 = protoModule.writeTag(buff, var3362, 14, protoModule.wireTypes.lengthDelimited)
		var3393, var4927 = protoModule.writeString(var3393, var3394, self.cohort_id)
		buff = var3393
		var3362 = var3394
	end
	if self.sort_id ~= nil then
		local var3395, var3396 = protoModule.writeTag(buff, var3362, 15, protoModule.wireTypes.lengthDelimited)
		var3395, var4929 = protoModule.writeString(var3395, var3396, self.sort_id)
		buff = var3395
		var3362 = var3396
	end
	if self.hero_unit_id ~= nil then
		local var3397, var3398 = protoModule.writeTag(buff, var3362, 16, protoModule.wireTypes.lengthDelimited)
		var3397, var4931 = protoModule.writeString(var3397, var3398, self.hero_unit_id)
		buff = var3397
		var3362 = var3398
	end
	if self.analytics_id ~= nil then
		local var3399, var3400 = protoModule.writeTag(buff, var3362, 17, protoModule.wireTypes.lengthDelimited)
		var3399, var4933 = protoModule.writeString(var3399, var3400, self.analytics_id)
		buff = var3399
		var3362 = var3400
	end
	if self.is_sponsored ~= nil then
		local var3401, var3402 = protoModule.writeTag(buff, var3362, 18, protoModule.wireTypes.varint)
		var3401, var4935 = protoModule.writeVarInt(var3401, var3402, if self.is_sponsored then 1 else 0)
		buff = var3401
		var3362 = var3402
	end
	local buff_1 = buffer.create(var3362)
	buffer.copy(buff_1, 0, buff, 0, var3362)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var3362 = t_123.new()
	local var3363 = 0
	while var3363 < buffer.len(p123) do
		local _ = nil
		local var3364 = nil
		local var3365, var3366, var3367 = protoModule.readTag(p123, var3363)
		local var3368 = var3365
		var3364 = var3366
		var3363 = var3367
		
		if var3364 == protoModule.wireTypes.varint then
			if var3368 == 18 then
				local _ = nil
				local var3369, var3370 = protoModule.readVarInt(p123, var3363)
				var3363 = var3370
				var3362.is_sponsored = var3369 ~= 0
			else
				local _ = nil
				local var3371, var3372 = protoModule.readVarInt(p123, var3363)
				local _ = var3371
				var3363 = var3372
			end
		end
		if var3364 == protoModule.wireTypes.lengthDelimited then
			if var3368 == 1 then
				local _ = nil
				local var3373, var3374 = protoModule.readBuffer(p123, var3363)
				var3363 = var3374
				var3362.universe_id = buffer.tostring(var3373)
			elseif var3368 == 2 then
				local _ = nil
				local var3375, var3376 = protoModule.readBuffer(p123, var3363)
				var3363 = var3376
				var3362.title = buffer.tostring(var3375)
			elseif var3368 == 3 then
				local _ = nil
				local var3377, var3378 = protoModule.readBuffer(p123, var3363)
				var3363 = var3378
				var3362.subtitle = buffer.tostring(var3377)
			elseif var3368 == 4 then
				local _ = nil
				local var3379, var3380 = protoModule.readBuffer(p123, var3363)
				var3363 = var3380
				var3362.badge_text = buffer.tostring(var3379)
			elseif var3368 == 5 then
				local _ = nil
				local var3381, var3382 = protoModule.readBuffer(p123, var3363)
				var3363 = var3382
				var3362.foreground = t.HeroUnitInputData_VisualAsset.decode(var3381)
			elseif var3368 == 6 then
				local _ = nil
				local var3383, var3384 = protoModule.readBuffer(p123, var3363)
				var3363 = var3384
				var3362.background = t.HeroUnitInputData_VisualAsset.decode(var3383)
			elseif var3368 == 7 then
				local _ = nil
				local var3385, var3386 = protoModule.readBuffer(p123, var3363)
				var3363 = var3386
				var3362.title_image = t.HeroUnitInputData_VisualAsset.decode(var3385)
			elseif var3368 == 8 then
				local _ = nil
				local var3387, var3388 = protoModule.readBuffer(p123, var3363)
				var3363 = var3388
				var3362.asset_title = buffer.tostring(var3387)
			elseif var3368 == 9 then
				local _ = nil
				local var3389, var3390 = protoModule.readBuffer(p123, var3363)
				var3363 = var3390
				var3362.asset_subtitle = buffer.tostring(var3389)
			elseif var3368 == 10 then
				local _ = nil
				local var3391, var3392 = protoModule.readBuffer(p123, var3363)
				var3363 = var3392
				var3362.gradient = t.HeroUnitInputData_Gradient.decode(var3391)
			elseif var3368 == 11 then
				local _ = nil
				local var3393, var3394 = protoModule.readBuffer(p123, var3363)
				var3363 = var3394
				var3362.playable_text = buffer.tostring(var3393)
			elseif var3368 == 12 then
				local _ = nil
				local var3395, var3396 = protoModule.readBuffer(p123, var3363)
				var3363 = var3396
				var3362.collection_id = buffer.tostring(var3395)
			elseif var3368 == 13 then
				local _ = nil
				local var3397, var3398 = protoModule.readBuffer(p123, var3363)
				var3363 = var3398
				var3362.campaign_id = buffer.tostring(var3397)
			elseif var3368 == 14 then
				local _ = nil
				local var3399, var3400 = protoModule.readBuffer(p123, var3363)
				var3363 = var3400
				var3362.cohort_id = buffer.tostring(var3399)
			elseif var3368 == 15 then
				local _ = nil
				local var3401, var3402 = protoModule.readBuffer(p123, var3363)
				var3363 = var3402
				var3362.sort_id = buffer.tostring(var3401)
			elseif var3368 == 16 then
				local _ = nil
				local var3403, var3404 = protoModule.readBuffer(p123, var3363)
				var3363 = var3404
				var3362.hero_unit_id = buffer.tostring(var3403)
			elseif var3368 == 17 then
				local _ = nil
				local var3405, var3406 = protoModule.readBuffer(p123, var3363)
				var3363 = var3406
				var3362.analytics_id = buffer.tostring(var3405)
			else
				local _ = nil
				local var3407, var3408 = protoModule.readVarInt(p123, var3363)
				var3363 = var3408 + var3407
			end
		elseif var3364 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3409, var3410 = protoModule.readFixed32(p123, var3363)
			local _ = var3409
			var3363 = var3410
		elseif var3364 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3411, var3412 = protoModule.readFixed64(p123, var3363)
			local _ = var3411
			var3363 = var3412
		else
			error("Unsupported wire type: " .. var4939)
		end
	end
	return var3362
end

function t_123:jsonEncode()
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

function t_123:jsonDecode()
	-- upvalues: t_123 (ref), t (ref)
	local var3413 = t_123.new()
	
	if self.universe_id ~= nil then
		var3413.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3413.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3413.title = self.title
	end
	if self.subtitle ~= nil then
		var3413.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3413.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3413.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3413.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3413.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3413.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3413.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3413.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3413.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3413.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3413.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3413.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3413.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3413.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3413.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3413.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3413.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3413.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3413.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3413.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3413.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3413.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3413.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3413.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3413.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3413.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3413.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3413.is_sponsored = self.isSponsored
	end
	return var3413
end

t_123.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_123
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p124)
	-- upvalues: t_124 (ref)
	return setmetatable({
		asset_id = if p124 == nil or p124.asset_id == nil then "" else p124.asset_id,
		aspect_ratio = if p124 == nil or p124.aspect_ratio == nil then nil else p124.aspect_ratio,
		enable_animation = if p124 == nil or p124.enable_animation == nil then nil else p124.enable_animation
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3413 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3414, var3415 = protoModule.writeTag(buff, var3413, 1, protoModule.wireTypes.lengthDelimited)
		var3414, var4993 = protoModule.writeString(var3414, var3415, self.asset_id)
		buff = var3414
		var3413 = var3415
	end
	if self.aspect_ratio ~= nil then
		local var3416, var3417 = protoModule.writeTag(buff, var3413, 2, protoModule.wireTypes.i64)
		var3416, var4995 = protoModule.writeDouble(var3416, var3417, self.aspect_ratio)
		buff = var3416
		var3413 = var3417
	end
	if self.enable_animation ~= nil then
		local var3418, var3419 = protoModule.writeTag(buff, var3413, 3, protoModule.wireTypes.varint)
		var3418, var4997 = protoModule.writeVarInt(var3418, var3419, if self.enable_animation then 1 else 0)
		buff = var3418
		var3413 = var3419
	end
	local buff_1 = buffer.create(var3413)
	buffer.copy(buff_1, 0, buff, 0, var3413)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3413 = t_124.new()
	local var3414 = 0
	while var3414 < buffer.len(p124) do
		local _ = nil
		local var3415 = nil
		local var3416, var3417, var3418 = protoModule.readTag(p124, var3414)
		local var3419 = var3416
		var3415 = var3417
		var3414 = var3418
		
		if var3415 == protoModule.wireTypes.varint then
			if var3419 == 3 then
				local _ = nil
				local var3420, var3421 = protoModule.readVarInt(p124, var3414)
				var3414 = var3421
				var3413.enable_animation = var3420 ~= 0
			else
				local _ = nil
				local var3422, var3423 = protoModule.readVarInt(p124, var3414)
				local _ = var3422
				var3414 = var3423
			end
		end
		if var3415 == protoModule.wireTypes.lengthDelimited then
			if var3419 == 1 then
				local _ = nil
				local var3424, var3425 = protoModule.readBuffer(p124, var3414)
				var3414 = var3425
				var3413.asset_id = buffer.tostring(var3424)
			else
				local _ = nil
				local var3426, var3427 = protoModule.readVarInt(p124, var3414)
				var3414 = var3427 + var3426
			end
		elseif var3415 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3428, var3429 = protoModule.readFixed32(p124, var3414)
			local _ = var3428
			var3414 = var3429
		elseif var3415 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5001)
		elseif var3419 == 2 then
			local _ = nil
			local var3430, var3431 = protoModule.readDouble(p124, var3414)
			var3414 = var3431
			var3413.aspect_ratio = var3430
		else
			local _ = nil
			local var3432, var3433 = protoModule.readFixed64(p124, var3414)
			local _ = var3432
			var3414 = var3433
		end
	end
	return var3413
end

function t_124:jsonEncode()
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

function t_124:jsonDecode()
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3434 = t_124.new()
	
	if self.asset_id ~= nil then
		var3434.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3434.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3434.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3434.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3434.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3434.enable_animation = self.enableAnimation
	end
	return var3434
end

t_124.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_124
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p125)
	-- upvalues: t_125 (ref)
	return setmetatable({
		start_color = if p125 == nil or p125.start_color == nil then nil else p125.start_color,
		end_color = if p125 == nil or p125.end_color == nil then nil else p125.end_color,
		start_opacity = if p125 == nil or p125.start_opacity == nil then nil else p125.start_opacity,
		end_opacity = if p125 == nil or p125.end_opacity == nil then nil else p125.end_opacity,
		degree = if p125 == nil or p125.degree == nil then nil else p125.degree
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3434 = 0
	
	if self.start_color ~= nil then
		local var3435, var3436 = protoModule.writeTag(buff, var3434, 1, protoModule.wireTypes.lengthDelimited)
		var3435, var5025 = protoModule.writeString(var3435, var3436, self.start_color)
		buff = var3435
		var3434 = var3436
	end
	if self.end_color ~= nil then
		local var3437, var3438 = protoModule.writeTag(buff, var3434, 2, protoModule.wireTypes.lengthDelimited)
		var3437, var5027 = protoModule.writeString(var3437, var3438, self.end_color)
		buff = var3437
		var3434 = var3438
	end
	if self.start_opacity ~= nil then
		local var3439, var3440 = protoModule.writeTag(buff, var3434, 3, protoModule.wireTypes.i64)
		var3439, var5029 = protoModule.writeDouble(var3439, var3440, self.start_opacity)
		buff = var3439
		var3434 = var3440
	end
	if self.end_opacity ~= nil then
		local var3441, var3442 = protoModule.writeTag(buff, var3434, 4, protoModule.wireTypes.i64)
		var3441, var5031 = protoModule.writeDouble(var3441, var3442, self.end_opacity)
		buff = var3441
		var3434 = var3442
	end
	if self.degree ~= nil then
		local var3443, var3444 = protoModule.writeTag(buff, var3434, 5, protoModule.wireTypes.i64)
		var3443, var5033 = protoModule.writeDouble(var3443, var3444, self.degree)
		buff = var3443
		var3434 = var3444
	end
	local buff_1 = buffer.create(var3434)
	buffer.copy(buff_1, 0, buff, 0, var3434)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref)
	local var3434 = t_125.new()
	local var3435 = 0
	while var3435 < buffer.len(p125) do
		local _ = nil
		local var3436 = nil
		local var3437, var3438, var3439 = protoModule.readTag(p125, var3435)
		local var3440 = var3437
		var3436 = var3438
		var3435 = var3439
		
		if var3436 == protoModule.wireTypes.varint then
			local _ = nil
			local var3441, var3442 = protoModule.readVarInt(p125, var3435)
			local _ = var3441
			var3435 = var3442
			continue
		end
		if var3436 == protoModule.wireTypes.lengthDelimited then
			if var3440 == 1 then
				local _ = nil
				local var3443, var3444 = protoModule.readBuffer(p125, var3435)
				var3435 = var3444
				var3434.start_color = buffer.tostring(var3443)
			elseif var3440 == 2 then
				local _ = nil
				local var3445, var3446 = protoModule.readBuffer(p125, var3435)
				var3435 = var3446
				var3434.end_color = buffer.tostring(var3445)
			else
				local _ = nil
				local var3447, var3448 = protoModule.readVarInt(p125, var3435)
				var3435 = var3448 + var3447
			end
		elseif var3436 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3449, var3450 = protoModule.readFixed32(p125, var3435)
			local _ = var3449
			var3435 = var3450
		elseif var3436 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5037)
		elseif var3440 == 3 then
			local _ = nil
			local var3451, var3452 = protoModule.readDouble(p125, var3435)
			var3435 = var3452
			var3434.start_opacity = var3451
		elseif var3440 == 4 then
			local _ = nil
			local var3453, var3454 = protoModule.readDouble(p125, var3435)
			var3435 = var3454
			var3434.end_opacity = var3453
		elseif var3440 == 5 then
			local _ = nil
			local var3455, var3456 = protoModule.readDouble(p125, var3435)
			var3435 = var3456
			var3434.degree = var3455
		else
			local _ = nil
			local var3457, var3458 = protoModule.readFixed64(p125, var3435)
			local _ = var3457
			var3435 = var3458
		end
	end
	return var3434
end

function t_125:jsonEncode()
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

function t_125:jsonDecode()
	-- upvalues: t_125 (ref), protoModule (ref)
	local var3459 = t_125.new()
	
	if self.start_color ~= nil then
		var3459.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3459.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3459.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3459.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3459.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3459.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3459.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3459.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3459.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3459
end

t_125.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_125
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p126)
	-- upvalues: t_126 (ref)
	return setmetatable({
		items = if p126 == nil or p126.items == nil then {} else p126.items,
		sort_id = if p126 == nil or p126.sort_id == nil then "" else p126.sort_id,
		recommendation_request_id = if p126 == nil or p126.recommendation_request_id == nil then "" else p126.recommendation_request_id
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3459 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3460 = v:encode()
			local var3461, var3462 = protoModule.writeTag(buff, var3459, 1, protoModule.wireTypes.lengthDelimited)
			var3461, var5066 = protoModule.writeBuffer(var3461, var3462, var3460, buffer.len(var3460))
			buff = var3461
			var3459 = var3462
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3463, var3464 = protoModule.writeTag(buff, var3459, 2, protoModule.wireTypes.lengthDelimited)
		var3463, var5068 = protoModule.writeString(var3463, var3464, self.sort_id)
		buff = var3463
		var3459 = var3464
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3465, var3466 = protoModule.writeTag(buff, var3459, 3, protoModule.wireTypes.lengthDelimited)
		var3465, var5070 = protoModule.writeString(var3465, var3466, self.recommendation_request_id)
		buff = var3465
		var3459 = var3466
	end
	local buff_1 = buffer.create(var3459)
	buffer.copy(buff_1, 0, buff, 0, var3459)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref), t (ref)
	local var3467 = t_126.new()
	local var3468 = 0
	while var3468 < buffer.len(p126) do
		local _ = nil
		local var3469 = nil
		local var3470, var3471, var3472 = protoModule.readTag(p126, var3468)
		local var3473 = var3470
		var3469 = var3471
		var3468 = var3472
		
		if var3469 == protoModule.wireTypes.varint then
			local _ = nil
			local var3474, var3475 = protoModule.readVarInt(p126, var3468)
			local _ = var3474
			var3468 = var3475
			continue
		end
		if var3469 == protoModule.wireTypes.lengthDelimited then
			if var3473 == 1 then
				local _ = nil
				local var3476, var3477 = protoModule.readBuffer(p126, var3468)
				var3468 = var3477
				table.insert(var3467.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3476))
			elseif var3473 == 2 then
				local _ = nil
				local var3478, var3479 = protoModule.readBuffer(p126, var3468)
				var3468 = var3479
				var3467.sort_id = buffer.tostring(var3478)
			elseif var3473 == 3 then
				local _ = nil
				local var3480, var3481 = protoModule.readBuffer(p126, var3468)
				var3468 = var3481
				var3467.recommendation_request_id = buffer.tostring(var3480)
			else
				local _ = nil
				local var3482, var3483 = protoModule.readVarInt(p126, var3468)
				var3468 = var3483 + var3482
			end
		elseif var3469 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3484, var3485 = protoModule.readFixed32(p126, var3468)
			local _ = var3484
			var3468 = var3485
		elseif var3469 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3486, var3487 = protoModule.readFixed64(p126, var3468)
			local _ = var3486
			var3468 = var3487
		else
			error("Unsupported wire type: " .. var5074)
		end
	end
	return var3467
end

function t_126:jsonEncode()
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

function t_126:jsonDecode()
	-- upvalues: t_126 (ref), t (ref)
	local var3488 = t_126.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3488.items = t_1
	end
	if self.sort_id ~= nil then
		var3488.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3488.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3488.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3488.recommendation_request_id = self.recommendationRequestId
	end
	return var3488
end

t_126.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_126
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p127)
	-- upvalues: t_127 (ref)
	return setmetatable({
		item_id = if p127 == nil or p127.item_id == nil then "" else p127.item_id,
		has_pending_friend_request = if p127 == nil or p127.has_pending_friend_request == nil then false else p127.has_pending_friend_request
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3489 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3490, var3491 = protoModule.writeTag(buff, var3489, 1, protoModule.wireTypes.lengthDelimited)
		var3490, var5100 = protoModule.writeString(var3490, var3491, self.item_id)
		buff = var3490
		var3489 = var3491
	end
	if self.has_pending_friend_request then
		local var3492, var3493 = protoModule.writeTag(buff, var3489, 2, protoModule.wireTypes.varint)
		var3492, var5102 = protoModule.writeVarInt(var3492, var3493, if self.has_pending_friend_request then 1 else 0)
		buff = var3492
		var3489 = var3493
	end
	local buff_1 = buffer.create(var3489)
	buffer.copy(buff_1, 0, buff, 0, var3489)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3489 = t_127.new()
	local var3490 = 0
	while var3490 < buffer.len(p127) do
		local _ = nil
		local var3491 = nil
		local var3492, var3493, var3494 = protoModule.readTag(p127, var3490)
		local var3495 = var3492
		var3491 = var3493
		var3490 = var3494
		
		if var3491 == protoModule.wireTypes.varint then
			if var3495 == 2 then
				local _ = nil
				local var3496, var3497 = protoModule.readVarInt(p127, var3490)
				var3490 = var3497
				var3489.has_pending_friend_request = var3496 ~= 0
			else
				local _ = nil
				local var3498, var3499 = protoModule.readVarInt(p127, var3490)
				local _ = var3498
				var3490 = var3499
			end
		end
		if var3491 == protoModule.wireTypes.lengthDelimited then
			if var3495 == 1 then
				local _ = nil
				local var3500, var3501 = protoModule.readBuffer(p127, var3490)
				var3490 = var3501
				var3489.item_id = buffer.tostring(var3500)
			else
				local _ = nil
				local var3502, var3503 = protoModule.readVarInt(p127, var3490)
				var3490 = var3503 + var3502
			end
		elseif var3491 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3504, var3505 = protoModule.readFixed32(p127, var3490)
			local _ = var3504
			var3490 = var3505
		elseif var3491 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3506, var3507 = protoModule.readFixed64(p127, var3490)
			local _ = var3506
			var3490 = var3507
		else
			error("Unsupported wire type: " .. var5106)
		end
	end
	return var3489
end

function t_127:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function t_127:jsonDecode()
	-- upvalues: t_127 (ref)
	local var3508 = t_127.new()
	
	if self.item_id ~= nil then
		var3508.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3508.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3508.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3508.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3508
end

t_127.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_127
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p128)
	-- upvalues: t_128 (ref)
	return setmetatable({
		selected_option = if p128 == nil or p128.selected_option == nil then "" else p128.selected_option,
		sort_id = if p128 == nil or p128.sort_id == nil then "" else p128.sort_id,
		options = if p128 == nil or p128.options == nil then {} else p128.options,
		experience_carousel = if p128 == nil or p128.experience_carousel == nil then nil else p128.experience_carousel,
		feed_item_key = if p128 == nil or p128.feed_item_key == nil then "" else p128.feed_item_key
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3508 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3509, var3510 = protoModule.writeTag(buff, var3508, 1, protoModule.wireTypes.lengthDelimited)
		var3509, var5128 = protoModule.writeString(var3509, var3510, self.selected_option)
		buff = var3509
		var3508 = var3510
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3511, var3512 = protoModule.writeTag(buff, var3508, 2, protoModule.wireTypes.lengthDelimited)
		var3511, var5130 = protoModule.writeString(var3511, var3512, self.sort_id)
		buff = var3511
		var3508 = var3512
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3513 = v:encode()
			local var3514, var3515 = protoModule.writeTag(buff, var3508, 3, protoModule.wireTypes.lengthDelimited)
			var3514, var5133 = protoModule.writeBuffer(var3514, var3515, var3513, buffer.len(var3513))
			buff = var3514
			var3508 = var3515
		end
	end
	if self.experience_carousel ~= nil then
		local var3516 = self.experience_carousel:encode()
		local var3517, var3518 = protoModule.writeTag(buff, var3508, 4, protoModule.wireTypes.lengthDelimited)
		var3517, var5136 = protoModule.writeBuffer(var3517, var3518, var3516, buffer.len(var3516))
		buff = var3517
		var3508 = var3518
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3519, var3520 = protoModule.writeTag(buff, var3508, 5, protoModule.wireTypes.lengthDelimited)
		var3519, var5138 = protoModule.writeString(var3519, var3520, self.feed_item_key)
		buff = var3519
		var3508 = var3520
	end
	local buff_1 = buffer.create(var3508)
	buffer.copy(buff_1, 0, buff, 0, var3508)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var3521 = t_128.new()
	local var3522 = 0
	while var3522 < buffer.len(p128) do
		local _ = nil
		local var3523 = nil
		local var3524, var3525, var3526 = protoModule.readTag(p128, var3522)
		local var3527 = var3524
		var3523 = var3525
		var3522 = var3526
		
		if var3523 == protoModule.wireTypes.varint then
			local _ = nil
			local var3528, var3529 = protoModule.readVarInt(p128, var3522)
			local _ = var3528
			var3522 = var3529
			continue
		end
		if var3523 == protoModule.wireTypes.lengthDelimited then
			if var3527 == 1 then
				local _ = nil
				local var3530, var3531 = protoModule.readBuffer(p128, var3522)
				var3522 = var3531
				var3521.selected_option = buffer.tostring(var3530)
			elseif var3527 == 2 then
				local _ = nil
				local var3532, var3533 = protoModule.readBuffer(p128, var3522)
				var3522 = var3533
				var3521.sort_id = buffer.tostring(var3532)
			elseif var3527 == 3 then
				local _ = nil
				local var3534, var3535 = protoModule.readBuffer(p128, var3522)
				var3522 = var3535
				table.insert(var3521.options, t.SelectorOption.decode(var3534))
			elseif var3527 == 4 then
				local _ = nil
				local var3536, var3537 = protoModule.readBuffer(p128, var3522)
				var3522 = var3537
				var3521.experience_carousel = t.ExperienceCarouselInputData.decode(var3536)
			elseif var3527 == 5 then
				local _ = nil
				local var3538, var3539 = protoModule.readBuffer(p128, var3522)
				var3522 = var3539
				var3521.feed_item_key = buffer.tostring(var3538)
			else
				local _ = nil
				local var3540, var3541 = protoModule.readVarInt(p128, var3522)
				var3522 = var3541 + var3540
			end
		elseif var3523 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3542, var3543 = protoModule.readFixed32(p128, var3522)
			local _ = var3542
			var3522 = var3543
		elseif var3523 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3544, var3545 = protoModule.readFixed64(p128, var3522)
			local _ = var3544
			var3522 = var3545
		else
			error("Unsupported wire type: " .. var5142)
		end
	end
	return var3521
end

function t_128:jsonEncode()
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

function t_128:jsonDecode()
	-- upvalues: t_128 (ref), t (ref)
	local var3546 = t_128.new()
	
	if self.selected_option ~= nil then
		var3546.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3546.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3546.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3546.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3546.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3546.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3546.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3546.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3546.feed_item_key = self.feedItemKey
	end
	return var3546
end

t_128.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_128
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p129)
	-- upvalues: t_129 (ref)
	return setmetatable({
		id = if p129 == nil or p129.id == nil then "" else p129.id,
		display_name = if p129 == nil or p129.display_name == nil then "" else p129.display_name,
		is_selected = if p129 == nil or p129.is_selected == nil then false else p129.is_selected
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3547 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3548, var3549 = protoModule.writeTag(buff, var3547, 1, protoModule.wireTypes.lengthDelimited)
		var3548, var5172 = protoModule.writeString(var3548, var3549, self.id)
		buff = var3548
		var3547 = var3549
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3550, var3551 = protoModule.writeTag(buff, var3547, 2, protoModule.wireTypes.lengthDelimited)
		var3550, var5174 = protoModule.writeString(var3550, var3551, self.display_name)
		buff = var3550
		var3547 = var3551
	end
	if self.is_selected then
		local var3552, var3553 = protoModule.writeTag(buff, var3547, 3, protoModule.wireTypes.varint)
		var3552, var5176 = protoModule.writeVarInt(var3552, var3553, if self.is_selected then 1 else 0)
		buff = var3552
		var3547 = var3553
	end
	local buff_1 = buffer.create(var3547)
	buffer.copy(buff_1, 0, buff, 0, var3547)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref)
	local var3547 = t_129.new()
	local var3548 = 0
	while var3548 < buffer.len(p129) do
		local _ = nil
		local var3549 = nil
		local var3550, var3551, var3552 = protoModule.readTag(p129, var3548)
		local var3553 = var3550
		var3549 = var3551
		var3548 = var3552
		
		if var3549 == protoModule.wireTypes.varint then
			if var3553 == 3 then
				local _ = nil
				local var3554, var3555 = protoModule.readVarInt(p129, var3548)
				var3548 = var3555
				var3547.is_selected = var3554 ~= 0
			else
				local _ = nil
				local var3556, var3557 = protoModule.readVarInt(p129, var3548)
				local _ = var3556
				var3548 = var3557
			end
		end
		if var3549 == protoModule.wireTypes.lengthDelimited then
			if var3553 == 1 then
				local _ = nil
				local var3558, var3559 = protoModule.readBuffer(p129, var3548)
				var3548 = var3559
				var3547.id = buffer.tostring(var3558)
			elseif var3553 == 2 then
				local _ = nil
				local var3560, var3561 = protoModule.readBuffer(p129, var3548)
				var3548 = var3561
				var3547.display_name = buffer.tostring(var3560)
			else
				local _ = nil
				local var3562, var3563 = protoModule.readVarInt(p129, var3548)
				var3548 = var3563 + var3562
			end
		elseif var3549 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3564, var3565 = protoModule.readFixed32(p129, var3548)
			local _ = var3564
			var3548 = var3565
		elseif var3549 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3566, var3567 = protoModule.readFixed64(p129, var3548)
			local _ = var3566
			var3548 = var3567
		else
			error("Unsupported wire type: " .. var5180)
		end
	end
	return var3547
end

function t_129:jsonEncode()
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

function t_129:jsonDecode()
	-- upvalues: t_129 (ref)
	local var3568 = t_129.new()
	
	if self.id ~= nil then
		var3568.id = self.id
	end
	if self.display_name ~= nil then
		var3568.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3568.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3568.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3568.is_selected = self.isSelected
	end
	return var3568
end

t_129.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_129
typeRegistryModule.default:register(t.SelectorOption)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p130)
	-- upvalues: t_130 (ref)
	return setmetatable({
		cards = if p130 == nil or p130.cards == nil then {} else p130.cards,
		title = if p130 == nil or p130.title == nil then "" else p130.title,
		sort_id = if p130 == nil or p130.sort_id == nil then nil else p130.sort_id
	}, t_130)
end

function t_130:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3568 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3569 = v:encode()
			local var3570, var3571 = protoModule.writeTag(buff, var3568, 1, protoModule.wireTypes.lengthDelimited)
			var3570, var5205 = protoModule.writeBuffer(var3570, var3571, var3569, buffer.len(var3569))
			buff = var3570
			var3568 = var3571
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3572, var3573 = protoModule.writeTag(buff, var3568, 2, protoModule.wireTypes.lengthDelimited)
		var3572, var5207 = protoModule.writeString(var3572, var3573, self.title)
		buff = var3572
		var3568 = var3573
	end
	if self.sort_id ~= nil then
		local var3574, var3575 = protoModule.writeTag(buff, var3568, 3, protoModule.wireTypes.lengthDelimited)
		var3574, var5209 = protoModule.writeString(var3574, var3575, self.sort_id)
		buff = var3574
		var3568 = var3575
	end
	local buff_1 = buffer.create(var3568)
	buffer.copy(buff_1, 0, buff, 0, var3568)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref), t (ref)
	local var3576 = t_130.new()
	local var3577 = 0
	while var3577 < buffer.len(p130) do
		local _ = nil
		local var3578 = nil
		local var3579, var3580, var3581 = protoModule.readTag(p130, var3577)
		local var3582 = var3579
		var3578 = var3580
		var3577 = var3581
		
		if var3578 == protoModule.wireTypes.varint then
			local _ = nil
			local var3583, var3584 = protoModule.readVarInt(p130, var3577)
			local _ = var3583
			var3577 = var3584
			continue
		end
		if var3578 == protoModule.wireTypes.lengthDelimited then
			if var3582 == 1 then
				local _ = nil
				local var3585, var3586 = protoModule.readBuffer(p130, var3577)
				var3577 = var3586
				table.insert(var3576.cards, t.GameItemsCardInputData.decode(var3585))
			elseif var3582 == 2 then
				local _ = nil
				local var3587, var3588 = protoModule.readBuffer(p130, var3577)
				var3577 = var3588
				var3576.title = buffer.tostring(var3587)
			elseif var3582 == 3 then
				local _ = nil
				local var3589, var3590 = protoModule.readBuffer(p130, var3577)
				var3577 = var3590
				var3576.sort_id = buffer.tostring(var3589)
			else
				local _ = nil
				local var3591, var3592 = protoModule.readVarInt(p130, var3577)
				var3577 = var3592 + var3591
			end
		elseif var3578 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3593, var3594 = protoModule.readFixed32(p130, var3577)
			local _ = var3593
			var3577 = var3594
		elseif var3578 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3595, var3596 = protoModule.readFixed64(p130, var3577)
			local _ = var3595
			var3577 = var3596
		else
			error("Unsupported wire type: " .. var5213)
		end
	end
	return var3576
end

function t_130:jsonEncode()
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

function t_130:jsonDecode()
	-- upvalues: t_130 (ref), t (ref)
	local var3597 = t_130.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3597.cards = t_1
	end
	if self.title ~= nil then
		var3597.title = self.title
	end
	if self.sort_id ~= nil then
		var3597.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3597.sort_id = self.sortId
	end
	return var3597
end

t_130.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_130
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p131)
	-- upvalues: t_131 (ref)
	return setmetatable({
		universe_id = if p131 == nil or p131.universe_id == nil then "" else p131.universe_id,
		items = if p131 == nil or p131.items == nil then {} else p131.items
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3598 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3599, var3600 = protoModule.writeTag(buff, var3598, 1, protoModule.wireTypes.lengthDelimited)
		var3599, var5239 = protoModule.writeString(var3599, var3600, self.universe_id)
		buff = var3599
		var3598 = var3600
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3601 = v:encode()
			local var3602, var3603 = protoModule.writeTag(buff, var3598, 2, protoModule.wireTypes.lengthDelimited)
			var3602, var5242 = protoModule.writeBuffer(var3602, var3603, var3601, buffer.len(var3601))
			buff = var3602
			var3598 = var3603
		end
	end
	local buff_1 = buffer.create(var3598)
	buffer.copy(buff_1, 0, buff, 0, var3598)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref), t (ref)
	local var3604 = t_131.new()
	local var3605 = 0
	while var3605 < buffer.len(p131) do
		local _ = nil
		local var3606 = nil
		local var3607, var3608, var3609 = protoModule.readTag(p131, var3605)
		local var3610 = var3607
		var3606 = var3608
		var3605 = var3609
		
		if var3606 == protoModule.wireTypes.varint then
			local _ = nil
			local var3611, var3612 = protoModule.readVarInt(p131, var3605)
			local _ = var3611
			var3605 = var3612
			continue
		end
		if var3606 == protoModule.wireTypes.lengthDelimited then
			if var3610 == 1 then
				local _ = nil
				local var3613, var3614 = protoModule.readBuffer(p131, var3605)
				var3605 = var3614
				var3604.universe_id = buffer.tostring(var3613)
			elseif var3610 == 2 then
				local _ = nil
				local var3615, var3616 = protoModule.readBuffer(p131, var3605)
				var3605 = var3616
				table.insert(var3604.items, t.GameItemInputData.decode(var3615))
			else
				local _ = nil
				local var3617, var3618 = protoModule.readVarInt(p131, var3605)
				var3605 = var3618 + var3617
			end
		elseif var3606 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3619, var3620 = protoModule.readFixed32(p131, var3605)
			local _ = var3619
			var3605 = var3620
		elseif var3606 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3621, var3622 = protoModule.readFixed64(p131, var3605)
			local _ = var3621
			var3605 = var3622
		else
			error("Unsupported wire type: " .. var5246)
		end
	end
	return var3604
end

function t_131:jsonEncode()
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

function t_131:jsonDecode()
	-- upvalues: t_131 (ref), t (ref)
	local var3623 = t_131.new()
	
	if self.universe_id ~= nil then
		var3623.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3623.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3623.items = t_1
	end
	return var3623
end

t_131.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_131
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p132)
	-- upvalues: t_132 (ref)
	return setmetatable({
		item_id = if p132 == nil or p132.item_id == nil then "" else p132.item_id,
		item_type = if p132 == nil or p132.item_type == nil then "" else p132.item_type
	}, t_132)
end

function t_132:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3624 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3625, var3626 = protoModule.writeTag(buff, var3624, 1, protoModule.wireTypes.lengthDelimited)
		var3625, var5270 = protoModule.writeString(var3625, var3626, self.item_id)
		buff = var3625
		var3624 = var3626
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3627, var3628 = protoModule.writeTag(buff, var3624, 2, protoModule.wireTypes.lengthDelimited)
		var3627, var5272 = protoModule.writeString(var3627, var3628, self.item_type)
		buff = var3627
		var3624 = var3628
	end
	local buff_1 = buffer.create(var3624)
	buffer.copy(buff_1, 0, buff, 0, var3624)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref)
	local var3624 = t_132.new()
	local var3625 = 0
	while var3625 < buffer.len(p132) do
		local _ = nil
		local var3626 = nil
		local var3627, var3628, var3629 = protoModule.readTag(p132, var3625)
		local var3630 = var3627
		var3626 = var3628
		var3625 = var3629
		
		if var3626 == protoModule.wireTypes.varint then
			local _ = nil
			local var3631, var3632 = protoModule.readVarInt(p132, var3625)
			local _ = var3631
			var3625 = var3632
			continue
		end
		if var3626 == protoModule.wireTypes.lengthDelimited then
			if var3630 == 1 then
				local _ = nil
				local var3633, var3634 = protoModule.readBuffer(p132, var3625)
				var3625 = var3634
				var3624.item_id = buffer.tostring(var3633)
			elseif var3630 == 2 then
				local _ = nil
				local var3635, var3636 = protoModule.readBuffer(p132, var3625)
				var3625 = var3636
				var3624.item_type = buffer.tostring(var3635)
			else
				local _ = nil
				local var3637, var3638 = protoModule.readVarInt(p132, var3625)
				var3625 = var3638 + var3637
			end
		elseif var3626 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3639, var3640 = protoModule.readFixed32(p132, var3625)
			local _ = var3639
			var3625 = var3640
		elseif var3626 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3641, var3642 = protoModule.readFixed64(p132, var3625)
			local _ = var3641
			var3625 = var3642
		else
			error("Unsupported wire type: " .. var5276)
		end
	end
	return var3624
end

function t_132:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_132:jsonDecode()
	-- upvalues: t_132 (ref)
	local var3643 = t_132.new()
	
	if self.item_id ~= nil then
		var3643.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3643.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3643.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3643.item_type = self.itemType
	end
	return var3643
end

t_132.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_132
typeRegistryModule.default:register(t.GameItemInputData)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p133)
	-- upvalues: t_133 (ref)
	return setmetatable({
		clickout_url = if p133 == nil or p133.clickout_url == nil then "" else p133.clickout_url,
		native_ad_data = if p133 == nil or p133.native_ad_data == nil then "" else p133.native_ad_data,
		payer_name = if p133 == nil or p133.payer_name == nil then nil else p133.payer_name,
		logo_asset_id = if p133 == nil or p133.logo_asset_id == nil then nil else p133.logo_asset_id,
		logo_aspect_ratio = if p133 == nil or p133.logo_aspect_ratio == nil then nil else p133.logo_aspect_ratio,
		cta_text = if p133 == nil or p133.cta_text == nil then nil else p133.cta_text,
		title = if p133 == nil or p133.title == nil then nil else p133.title,
		subtitle = if p133 == nil or p133.subtitle == nil then nil else p133.subtitle,
		image_asset_id = if p133 == nil or p133.image_asset_id == nil then nil else p133.image_asset_id,
		video_asset_id = if p133 == nil or p133.video_asset_id == nil then nil else p133.video_asset_id,
		badge_text = if p133 == nil or p133.badge_text == nil then nil else p133.badge_text,
		badge_analytics_id = if p133 == nil or p133.badge_analytics_id == nil then nil else p133.badge_analytics_id,
		roblox_component = if p133 == nil or p133.roblox_component == nil then nil else p133.roblox_component,
		attribution_thumbnail_asset_id = if p133 == nil or p133.attribution_thumbnail_asset_id == nil then nil else p133.attribution_thumbnail_asset_id
	}, t_133)
end

function t_133:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3643 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3644, var3645 = protoModule.writeTag(buff, var3643, 1, protoModule.wireTypes.lengthDelimited)
		var3644, var5298 = protoModule.writeString(var3644, var3645, self.clickout_url)
		buff = var3644
		var3643 = var3645
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3646, var3647 = protoModule.writeTag(buff, var3643, 2, protoModule.wireTypes.lengthDelimited)
		var3646, var5300 = protoModule.writeString(var3646, var3647, self.native_ad_data)
		buff = var3646
		var3643 = var3647
	end
	if self.payer_name ~= nil then
		local var3648, var3649 = protoModule.writeTag(buff, var3643, 3, protoModule.wireTypes.lengthDelimited)
		var3648, var5302 = protoModule.writeString(var3648, var3649, self.payer_name)
		buff = var3648
		var3643 = var3649
	end
	if self.logo_asset_id ~= nil then
		local var3650, var3651 = protoModule.writeTag(buff, var3643, 4, protoModule.wireTypes.lengthDelimited)
		var3650, var5304 = protoModule.writeString(var3650, var3651, self.logo_asset_id)
		buff = var3650
		var3643 = var3651
	end
	if self.logo_aspect_ratio ~= nil then
		local var3652, var3653 = protoModule.writeTag(buff, var3643, 5, protoModule.wireTypes.i64)
		var3652, var5306 = protoModule.writeDouble(var3652, var3653, self.logo_aspect_ratio)
		buff = var3652
		var3643 = var3653
	end
	if self.cta_text ~= nil then
		local var3654, var3655 = protoModule.writeTag(buff, var3643, 6, protoModule.wireTypes.lengthDelimited)
		var3654, var5308 = protoModule.writeString(var3654, var3655, self.cta_text)
		buff = var3654
		var3643 = var3655
	end
	if self.title ~= nil then
		local var3656, var3657 = protoModule.writeTag(buff, var3643, 7, protoModule.wireTypes.lengthDelimited)
		var3656, var5310 = protoModule.writeString(var3656, var3657, self.title)
		buff = var3656
		var3643 = var3657
	end
	if self.subtitle ~= nil then
		local var3658, var3659 = protoModule.writeTag(buff, var3643, 8, protoModule.wireTypes.lengthDelimited)
		var3658, var5312 = protoModule.writeString(var3658, var3659, self.subtitle)
		buff = var3658
		var3643 = var3659
	end
	if self.image_asset_id ~= nil then
		local var3660, var3661 = protoModule.writeTag(buff, var3643, 9, protoModule.wireTypes.lengthDelimited)
		var3660, var5314 = protoModule.writeString(var3660, var3661, self.image_asset_id)
		buff = var3660
		var3643 = var3661
	end
	if self.video_asset_id ~= nil then
		local var3662, var3663 = protoModule.writeTag(buff, var3643, 10, protoModule.wireTypes.lengthDelimited)
		var3662, var5316 = protoModule.writeString(var3662, var3663, self.video_asset_id)
		buff = var3662
		var3643 = var3663
	end
	if self.badge_text ~= nil then
		local var3664, var3665 = protoModule.writeTag(buff, var3643, 11, protoModule.wireTypes.lengthDelimited)
		var3664, var5318 = protoModule.writeString(var3664, var3665, self.badge_text)
		buff = var3664
		var3643 = var3665
	end
	if self.badge_analytics_id ~= nil then
		local var3666, var3667 = protoModule.writeTag(buff, var3643, 12, protoModule.wireTypes.lengthDelimited)
		var3666, var5320 = protoModule.writeString(var3666, var3667, self.badge_analytics_id)
		buff = var3666
		var3643 = var3667
	end
	if self.roblox_component ~= nil then
		local var3668, var3669 = protoModule.writeTag(buff, var3643, 13, protoModule.wireTypes.lengthDelimited)
		var3668, var5322 = protoModule.writeString(var3668, var3669, self.roblox_component)
		buff = var3668
		var3643 = var3669
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var3670, var3671 = protoModule.writeTag(buff, var3643, 14, protoModule.wireTypes.lengthDelimited)
		var3670, var5324 = protoModule.writeString(var3670, var3671, self.attribution_thumbnail_asset_id)
		buff = var3670
		var3643 = var3671
	end
	local buff_1 = buffer.create(var3643)
	buffer.copy(buff_1, 0, buff, 0, var3643)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref)
	local var3643 = t_133.new()
	local var3644 = 0
	while var3644 < buffer.len(p133) do
		local _ = nil
		local var3645 = nil
		local var3646, var3647, var3648 = protoModule.readTag(p133, var3644)
		local var3649 = var3646
		var3645 = var3647
		var3644 = var3648
		
		if var3645 == protoModule.wireTypes.varint then
			local _ = nil
			local var3650, var3651 = protoModule.readVarInt(p133, var3644)
			local _ = var3650
			var3644 = var3651
			continue
		end
		if var3645 == protoModule.wireTypes.lengthDelimited then
			if var3649 == 1 then
				local _ = nil
				local var3652, var3653 = protoModule.readBuffer(p133, var3644)
				var3644 = var3653
				var3643.clickout_url = buffer.tostring(var3652)
			elseif var3649 == 2 then
				local _ = nil
				local var3654, var3655 = protoModule.readBuffer(p133, var3644)
				var3644 = var3655
				var3643.native_ad_data = buffer.tostring(var3654)
			elseif var3649 == 3 then
				local _ = nil
				local var3656, var3657 = protoModule.readBuffer(p133, var3644)
				var3644 = var3657
				var3643.payer_name = buffer.tostring(var3656)
			elseif var3649 == 4 then
				local _ = nil
				local var3658, var3659 = protoModule.readBuffer(p133, var3644)
				var3644 = var3659
				var3643.logo_asset_id = buffer.tostring(var3658)
			elseif var3649 == 6 then
				local _ = nil
				local var3660, var3661 = protoModule.readBuffer(p133, var3644)
				var3644 = var3661
				var3643.cta_text = buffer.tostring(var3660)
			elseif var3649 == 7 then
				local _ = nil
				local var3662, var3663 = protoModule.readBuffer(p133, var3644)
				var3644 = var3663
				var3643.title = buffer.tostring(var3662)
			elseif var3649 == 8 then
				local _ = nil
				local var3664, var3665 = protoModule.readBuffer(p133, var3644)
				var3644 = var3665
				var3643.subtitle = buffer.tostring(var3664)
			elseif var3649 == 9 then
				local _ = nil
				local var3666, var3667 = protoModule.readBuffer(p133, var3644)
				var3644 = var3667
				var3643.image_asset_id = buffer.tostring(var3666)
			elseif var3649 == 10 then
				local _ = nil
				local var3668, var3669 = protoModule.readBuffer(p133, var3644)
				var3644 = var3669
				var3643.video_asset_id = buffer.tostring(var3668)
			elseif var3649 == 11 then
				local _ = nil
				local var3670, var3671 = protoModule.readBuffer(p133, var3644)
				var3644 = var3671
				var3643.badge_text = buffer.tostring(var3670)
			elseif var3649 == 12 then
				local _ = nil
				local var3672, var3673 = protoModule.readBuffer(p133, var3644)
				var3644 = var3673
				var3643.badge_analytics_id = buffer.tostring(var3672)
			elseif var3649 == 13 then
				local _ = nil
				local var3674, var3675 = protoModule.readBuffer(p133, var3644)
				var3644 = var3675
				var3643.roblox_component = buffer.tostring(var3674)
			elseif var3649 == 14 then
				local _ = nil
				local var3676, var3677 = protoModule.readBuffer(p133, var3644)
				var3644 = var3677
				var3643.attribution_thumbnail_asset_id = buffer.tostring(var3676)
			else
				local _ = nil
				local var3678, var3679 = protoModule.readVarInt(p133, var3644)
				var3644 = var3679 + var3678
			end
		elseif var3645 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3680, var3681 = protoModule.readFixed32(p133, var3644)
			local _ = var3680
			var3644 = var3681
		elseif var3645 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5328)
		elseif var3649 == 5 then
			local _ = nil
			local var3682, var3683 = protoModule.readDouble(p133, var3644)
			var3644 = var3683
			var3643.logo_aspect_ratio = var3682
		else
			local _ = nil
			local var3684, var3685 = protoModule.readFixed64(p133, var3644)
			local _ = var3684
			var3644 = var3685
		end
	end
	return var3643
end

function t_133:jsonEncode()
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

function t_133:jsonDecode()
	-- upvalues: t_133 (ref), protoModule (ref)
	local var3686 = t_133.new()
	
	if self.clickout_url ~= nil then
		var3686.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3686.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3686.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3686.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3686.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3686.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3686.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3686.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3686.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3686.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3686.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3686.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3686.title = self.title
	end
	if self.subtitle ~= nil then
		var3686.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3686.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3686.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3686.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3686.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3686.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3686.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3686.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3686.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3686.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3686.roblox_component = self.robloxComponent
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var3686.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var3686.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	return var3686
end

t_133.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = t_133
typeRegistryModule.default:register(t.AdLinkItem)
local t_134 = {}
t_134.__index = t_134

function t_134.new(p134)
	-- upvalues: t_134 (ref)
	return setmetatable({
		layout = if p134 == nil or p134.layout == nil then nil else p134.layout,
		kind = if p134 == nil or p134.kind == nil then nil else p134.kind
	}, t_134)
end

function t_134:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3686 = 0
	
	if self.layout ~= nil then
		local var3687 = self.layout:encode()
		local var3688, var3689 = protoModule.writeTag(buff, var3686, 1, protoModule.wireTypes.lengthDelimited)
		var3688, var5375 = protoModule.writeBuffer(var3688, var3689, var3687, buffer.len(var3687))
		buff = var3688
		var3686 = var3689
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3690 = self.kind.value:encode()
			local var3691, var3692 = protoModule.writeTag(buff, var3686, 2, protoModule.wireTypes.lengthDelimited)
			var3691, var5378 = protoModule.writeBuffer(var3691, var3692, var3690, buffer.len(var3690))
			buff = var3691
			var3686 = var3692
		elseif self.kind.type == "ad_link" then
			local var3693 = self.kind.value:encode()
			local var3694, var3695 = protoModule.writeTag(buff, var3686, 3, protoModule.wireTypes.lengthDelimited)
			var3694, var5381 = protoModule.writeBuffer(var3694, var3695, var3693, buffer.len(var3693))
			buff = var3694
			var3686 = var3695
		end
	end
	local buff_1 = buffer.create(var3686)
	buffer.copy(buff_1, 0, buff, 0, var3686)
	
	return buff_1
end

function t_134.decode(p134)
	-- upvalues: t_134 (ref), protoModule (ref), t (ref)
	local var3686 = t_134.new()
	local var3687 = 0
	while var3687 < buffer.len(p134) do
		local _ = nil
		local var3688 = nil
		local var3689, var3690, var3691 = protoModule.readTag(p134, var3687)
		local var3692 = var3689
		var3688 = var3690
		var3687 = var3691
		
		if var3688 == protoModule.wireTypes.varint then
			local _ = nil
			local var3693, var3694 = protoModule.readVarInt(p134, var3687)
			local _ = var3693
			var3687 = var3694
			continue
		end
		if var3688 == protoModule.wireTypes.lengthDelimited then
			if var3692 == 1 then
				local _ = nil
				local var3695, var3696 = protoModule.readBuffer(p134, var3687)
				var3687 = var3696
				var3686.layout = t.ItemLayout.decode(var3695)
			elseif var3692 == 2 then
				local _ = nil
				local var3697, var3698 = protoModule.readBuffer(p134, var3687)
				var3687 = var3698
				var3686.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3697)
				}
			elseif var3692 == 3 then
				local _ = nil
				local var3699, var3700 = protoModule.readBuffer(p134, var3687)
				var3687 = var3700
				var3686.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3699) }
			else
				local _ = nil
				local var3701, var3702 = protoModule.readVarInt(p134, var3687)
				var3687 = var3702 + var3701
			end
		elseif var3688 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3703, var3704 = protoModule.readFixed32(p134, var3687)
			local _ = var3703
			var3687 = var3704
		elseif var3688 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3705, var3706 = protoModule.readFixed64(p134, var3687)
			local _ = var3705
			var3687 = var3706
		else
			error("Unsupported wire type: " .. var5385)
		end
	end
	return var3686
end

function t_134:jsonEncode()
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

function t_134:jsonDecode()
	-- upvalues: t_134 (ref), t (ref)
	local var3707 = t_134.new()
	
	if self.layout ~= nil then
		var3707.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3707.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3707.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3707.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3707
end

t_134.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_134
typeRegistryModule.default:register(t.ItemWithLayout)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p135)
	-- upvalues: t_135 (ref)
	return setmetatable({
		items = if p135 == nil or p135.items == nil then {} else p135.items,
		collection_item_size = if p135 == nil or p135.collection_item_size == nil then nil else p135.collection_item_size
	}, t_135)
end

function t_135:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3707 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3708 = v:encode()
			local var3709, var3710 = protoModule.writeTag(buff, var3707, 1, protoModule.wireTypes.lengthDelimited)
			var3709, var5410 = protoModule.writeBuffer(var3709, var3710, var3708, buffer.len(var3708))
			buff = var3709
			var3707 = var3710
		end
	end
	if self.collection_item_size ~= nil then
		local var3711, var3712 = protoModule.writeTag(buff, var3707, 2, protoModule.wireTypes.lengthDelimited)
		var3711, var5412 = protoModule.writeString(var3711, var3712, self.collection_item_size)
		buff = var3711
		var3707 = var3712
	end
	local buff_1 = buffer.create(var3707)
	buffer.copy(buff_1, 0, buff, 0, var3707)
	
	return buff_1
end

function t_135.decode(p135)
	-- upvalues: t_135 (ref), protoModule (ref), t (ref)
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
				table.insert(var3713.items, t.ItemWithLayout.decode(var3722))
			elseif var3719 == 2 then
				local _ = nil
				local var3724, var3725 = protoModule.readBuffer(p135, var3714)
				var3714 = var3725
				var3713.collection_item_size = buffer.tostring(var3724)
			else
				local _ = nil
				local var3726, var3727 = protoModule.readVarInt(p135, var3714)
				var3714 = var3727 + var3726
			end
		elseif var3715 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3728, var3729 = protoModule.readFixed32(p135, var3714)
			local _ = var3728
			var3714 = var3729
		elseif var3715 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3730, var3731 = protoModule.readFixed64(p135, var3714)
			local _ = var3730
			var3714 = var3731
		else
			error("Unsupported wire type: " .. var5416)
		end
	end
	return var3713
end

function t_135:jsonEncode()
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

function t_135:jsonDecode()
	-- upvalues: t_135 (ref), t (ref)
	local var3732 = t_135.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3732.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3732.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3732.collection_item_size = self.collectionItemSize
	end
	return var3732
end

t_135.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_135
typeRegistryModule.default:register(t.ContentPool)
local t_136 = {}
t_136.__index = t_136

function t_136.new(p136)
	-- upvalues: t_136 (ref)
	return setmetatable({
		col_span = if p136 == nil or p136.col_span == nil then 0 else p136.col_span,
		row_span = if p136 == nil or p136.row_span == nil then 0 else p136.row_span,
		alignment_type = if p136 == nil or p136.alignment_type == nil then "" else p136.alignment_type,
		min_row_padding = if p136 == nil or p136.min_row_padding == nil then 0 else p136.min_row_padding
	}, t_136)
end

function t_136:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3733 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3734, var3735 = protoModule.writeTag(buff, var3733, 1, protoModule.wireTypes.varint)
		var3734, var5440 = protoModule.writeVarInt(var3734, var3735, self.col_span)
		buff = var3734
		var3733 = var3735
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3736, var3737 = protoModule.writeTag(buff, var3733, 2, protoModule.wireTypes.varint)
		var3736, var5442 = protoModule.writeVarInt(var3736, var3737, self.row_span)
		buff = var3736
		var3733 = var3737
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3738, var3739 = protoModule.writeTag(buff, var3733, 3, protoModule.wireTypes.lengthDelimited)
		var3738, var5444 = protoModule.writeString(var3738, var3739, self.alignment_type)
		buff = var3738
		var3733 = var3739
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3740, var3741 = protoModule.writeTag(buff, var3733, 4, protoModule.wireTypes.varint)
		var3740, var5446 = protoModule.writeVarInt(var3740, var3741, self.min_row_padding)
		buff = var3740
		var3733 = var3741
	end
	local buff_1 = buffer.create(var3733)
	buffer.copy(buff_1, 0, buff, 0, var3733)
	
	return buff_1
end

function t_136.decode(p136)
	-- upvalues: t_136 (ref), protoModule (ref)
	local var3733 = t_136.new()
	local var3734 = 0
	while var3734 < buffer.len(p136) do
		local _ = nil
		local var3735 = nil
		local var3736, var3737, var3738 = protoModule.readTag(p136, var3734)
		local var3739 = var3736
		var3735 = var3737
		var3734 = var3738
		
		if var3735 == protoModule.wireTypes.varint then
			if var3739 == 1 then
				local _ = nil
				local var3740, var3741 = protoModule.readVarIntI32(p136, var3734)
				var3734 = var3741
				var3733.col_span = var3740
			elseif var3739 == 2 then
				local _ = nil
				local var3742, var3743 = protoModule.readVarIntI32(p136, var3734)
				var3734 = var3743
				var3733.row_span = var3742
			elseif var3739 == 4 then
				local _ = nil
				local var3744, var3745 = protoModule.readVarIntI32(p136, var3734)
				var3734 = var3745
				var3733.min_row_padding = var3744
			else
				local _ = nil
				local var3746, var3747 = protoModule.readVarInt(p136, var3734)
				local _ = var3746
				var3734 = var3747
			end
		end
		if var3735 == protoModule.wireTypes.lengthDelimited then
			if var3739 == 3 then
				local _ = nil
				local var3748, var3749 = protoModule.readBuffer(p136, var3734)
				var3734 = var3749
				var3733.alignment_type = buffer.tostring(var3748)
			else
				local _ = nil
				local var3750, var3751 = protoModule.readVarInt(p136, var3734)
				var3734 = var3751 + var3750
			end
		elseif var3735 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3752, var3753 = protoModule.readFixed32(p136, var3734)
			local _ = var3752
			var3734 = var3753
		elseif var3735 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3754, var3755 = protoModule.readFixed64(p136, var3734)
			local _ = var3754
			var3734 = var3755
		else
			error("Unsupported wire type: " .. var5450)
		end
	end
	return var3733
end

function t_136:jsonEncode()
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

function t_136:jsonDecode()
	-- upvalues: t_136 (ref)
	local var3756 = t_136.new()
	
	if self.col_span ~= nil then
		var3756.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3756.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3756.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3756.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3756.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3756.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3756.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3756.min_row_padding = self.minRowPadding
	end
	return var3756
end

t_136.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_136
typeRegistryModule.default:register(t.ItemLayout)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p137)
	-- upvalues: t_137 (ref)
	return setmetatable({
		community_id = if p137 == nil or p137.community_id == nil then "" else p137.community_id,
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
	local var3756 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3757, var3758 = protoModule.writeTag(buff, var3756, 1, protoModule.wireTypes.lengthDelimited)
		var3757, var5476 = protoModule.writeString(var3757, var3758, self.community_id)
		buff = var3757
		var3756 = var3758
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3759, var3760 = protoModule.writeTag(buff, var3756, 2, protoModule.wireTypes.lengthDelimited)
		var3759, var5478 = protoModule.writeString(var3759, var3760, self.announcement_id)
		buff = var3759
		var3756 = var3760
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3761, var3762 = protoModule.writeTag(buff, var3756, 3, protoModule.wireTypes.lengthDelimited)
		var3761, var5480 = protoModule.writeString(var3761, var3762, self.message_id)
		buff = var3761
		var3756 = var3762
	end
	if self.title ~= nil and self.title ~= "" then
		local var3763, var3764 = protoModule.writeTag(buff, var3756, 4, protoModule.wireTypes.lengthDelimited)
		var3763, var5482 = protoModule.writeString(var3763, var3764, self.title)
		buff = var3763
		var3756 = var3764
	end
	if self.body ~= nil and self.body ~= "" then
		local var3765, var3766 = protoModule.writeTag(buff, var3756, 5, protoModule.wireTypes.lengthDelimited)
		var3765, var5484 = protoModule.writeString(var3765, var3766, self.body)
		buff = var3765
		var3756 = var3766
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3767, var3768 = protoModule.writeTag(buff, var3756, 6, protoModule.wireTypes.lengthDelimited)
		var3767, var5486 = protoModule.writeString(var3767, var3768, self.creator_key)
		buff = var3767
		var3756 = var3768
	end
	if self.creator_role_name ~= nil then
		local var3769, var3770 = protoModule.writeTag(buff, var3756, 7, protoModule.wireTypes.lengthDelimited)
		var3769, var5488 = protoModule.writeString(var3769, var3770, self.creator_role_name)
		buff = var3769
		var3756 = var3770
	end
	if self.media_asset_id ~= nil then
		local var3771, var3772 = protoModule.writeTag(buff, var3756, 8, protoModule.wireTypes.lengthDelimited)
		var3771, var5490 = protoModule.writeString(var3771, var3772, self.media_asset_id)
		buff = var3771
		var3756 = var3772
	end
	if self.created_time ~= nil then
		local var3773 = self.created_time:encode()
		local var3774, var3775 = protoModule.writeTag(buff, var3756, 9, protoModule.wireTypes.lengthDelimited)
		var3774, var5493 = protoModule.writeBuffer(var3774, var3775, var3773, buffer.len(var3773))
		buff = var3774
		var3756 = var3775
	end
	local buff_1 = buffer.create(var3756)
	buffer.copy(buff_1, 0, buff, 0, var3756)
	
	return buff_1
end

function t_137.decode(p137)
	-- upvalues: t_137 (ref), protoModule (ref), timestampModule (ref)
	local var3756 = t_137.new()
	local var3757 = 0
	while var3757 < buffer.len(p137) do
		local _ = nil
		local var3758 = nil
		local var3759, var3760, var3761 = protoModule.readTag(p137, var3757)
		local var3762 = var3759
		var3758 = var3760
		var3757 = var3761
		
		if var3758 == protoModule.wireTypes.varint then
			local _ = nil
			local var3763, var3764 = protoModule.readVarInt(p137, var3757)
			local _ = var3763
			var3757 = var3764
			continue
		end
		if var3758 == protoModule.wireTypes.lengthDelimited then
			if var3762 == 1 then
				local _ = nil
				local var3765, var3766 = protoModule.readBuffer(p137, var3757)
				var3757 = var3766
				var3756.community_id = buffer.tostring(var3765)
			elseif var3762 == 2 then
				local _ = nil
				local var3767, var3768 = protoModule.readBuffer(p137, var3757)
				var3757 = var3768
				var3756.announcement_id = buffer.tostring(var3767)
			elseif var3762 == 3 then
				local _ = nil
				local var3769, var3770 = protoModule.readBuffer(p137, var3757)
				var3757 = var3770
				var3756.message_id = buffer.tostring(var3769)
			elseif var3762 == 4 then
				local _ = nil
				local var3771, var3772 = protoModule.readBuffer(p137, var3757)
				var3757 = var3772
				var3756.title = buffer.tostring(var3771)
			elseif var3762 == 5 then
				local _ = nil
				local var3773, var3774 = protoModule.readBuffer(p137, var3757)
				var3757 = var3774
				var3756.body = buffer.tostring(var3773)
			elseif var3762 == 6 then
				local _ = nil
				local var3775, var3776 = protoModule.readBuffer(p137, var3757)
				var3757 = var3776
				var3756.creator_key = buffer.tostring(var3775)
			elseif var3762 == 7 then
				local _ = nil
				local var3777, var3778 = protoModule.readBuffer(p137, var3757)
				var3757 = var3778
				var3756.creator_role_name = buffer.tostring(var3777)
			elseif var3762 == 8 then
				local _ = nil
				local var3779, var3780 = protoModule.readBuffer(p137, var3757)
				var3757 = var3780
				var3756.media_asset_id = buffer.tostring(var3779)
			elseif var3762 == 9 then
				local _ = nil
				local var3781, var3782 = protoModule.readBuffer(p137, var3757)
				var3757 = var3782
				var3756.created_time = timestampModule.Timestamp.decode(var3781)
			else
				local _ = nil
				local var3783, var3784 = protoModule.readVarInt(p137, var3757)
				var3757 = var3784 + var3783
			end
		elseif var3758 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3785, var3786 = protoModule.readFixed32(p137, var3757)
			local _ = var3785
			var3757 = var3786
		elseif var3758 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3787, var3788 = protoModule.readFixed64(p137, var3757)
			local _ = var3787
			var3757 = var3788
		else
			error("Unsupported wire type: " .. var5497)
		end
	end
	return var3756
end

function t_137:jsonEncode()
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

function t_137:jsonDecode()
	-- upvalues: t_137 (ref), timestampModule (ref)
	local var3789 = t_137.new()
	
	if self.community_id ~= nil then
		var3789.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3789.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3789.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3789.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3789.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3789.message_id = self.messageId
	end
	if self.title ~= nil then
		var3789.title = self.title
	end
	if self.body ~= nil then
		var3789.body = self.body
	end
	if self.creator_key ~= nil then
		var3789.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3789.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3789.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3789.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3789.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3789.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3789.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3789.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3789
end

t_137.descriptor = {
	name = "CommunityAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityAnnouncementInputData"
}
t.CommunityAnnouncementInputData = t_137
typeRegistryModule.default:register(t.CommunityAnnouncementInputData)
local t_138 = {}
t_138.__index = t_138

function t_138.new(p138)
	-- upvalues: t_138 (ref)
	return setmetatable({
		group_id = if p138 == nil or p138.group_id == nil then "" else p138.group_id,
		announcement_id = if p138 == nil or p138.announcement_id == nil then "" else p138.announcement_id,
		message_id = if p138 == nil or p138.message_id == nil then "" else p138.message_id,
		title = if p138 == nil or p138.title == nil then "" else p138.title,
		body = if p138 == nil or p138.body == nil then "" else p138.body,
		creator_key = if p138 == nil or p138.creator_key == nil then "" else p138.creator_key,
		creator_role_name = if p138 == nil or p138.creator_role_name == nil then nil else p138.creator_role_name,
		media_asset_id = if p138 == nil or p138.media_asset_id == nil then nil else p138.media_asset_id,
		created_time = if p138 == nil or p138.created_time == nil then nil else p138.created_time
	}, t_138)
end

function t_138:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3789 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var3790, var3791 = protoModule.writeTag(buff, var3789, 1, protoModule.wireTypes.lengthDelimited)
		var3790, var5533 = protoModule.writeString(var3790, var3791, self.group_id)
		buff = var3790
		var3789 = var3791
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3792, var3793 = protoModule.writeTag(buff, var3789, 2, protoModule.wireTypes.lengthDelimited)
		var3792, var5535 = protoModule.writeString(var3792, var3793, self.announcement_id)
		buff = var3792
		var3789 = var3793
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3794, var3795 = protoModule.writeTag(buff, var3789, 3, protoModule.wireTypes.lengthDelimited)
		var3794, var5537 = protoModule.writeString(var3794, var3795, self.message_id)
		buff = var3794
		var3789 = var3795
	end
	if self.title ~= nil and self.title ~= "" then
		local var3796, var3797 = protoModule.writeTag(buff, var3789, 4, protoModule.wireTypes.lengthDelimited)
		var3796, var5539 = protoModule.writeString(var3796, var3797, self.title)
		buff = var3796
		var3789 = var3797
	end
	if self.body ~= nil and self.body ~= "" then
		local var3798, var3799 = protoModule.writeTag(buff, var3789, 5, protoModule.wireTypes.lengthDelimited)
		var3798, var5541 = protoModule.writeString(var3798, var3799, self.body)
		buff = var3798
		var3789 = var3799
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3800, var3801 = protoModule.writeTag(buff, var3789, 6, protoModule.wireTypes.lengthDelimited)
		var3800, var5543 = protoModule.writeString(var3800, var3801, self.creator_key)
		buff = var3800
		var3789 = var3801
	end
	if self.creator_role_name ~= nil then
		local var3802, var3803 = protoModule.writeTag(buff, var3789, 7, protoModule.wireTypes.lengthDelimited)
		var3802, var5545 = protoModule.writeString(var3802, var3803, self.creator_role_name)
		buff = var3802
		var3789 = var3803
	end
	if self.media_asset_id ~= nil then
		local var3804, var3805 = protoModule.writeTag(buff, var3789, 8, protoModule.wireTypes.lengthDelimited)
		var3804, var5547 = protoModule.writeString(var3804, var3805, self.media_asset_id)
		buff = var3804
		var3789 = var3805
	end
	if self.created_time ~= nil then
		local var3806 = self.created_time:encode()
		local var3807, var3808 = protoModule.writeTag(buff, var3789, 9, protoModule.wireTypes.lengthDelimited)
		var3807, var5550 = protoModule.writeBuffer(var3807, var3808, var3806, buffer.len(var3806))
		buff = var3807
		var3789 = var3808
	end
	local buff_1 = buffer.create(var3789)
	buffer.copy(buff_1, 0, buff, 0, var3789)
	
	return buff_1
end

function t_138.decode(p138)
	-- upvalues: t_138 (ref), protoModule (ref), timestampModule (ref)
	local var3789 = t_138.new()
	local var3790 = 0
	while var3790 < buffer.len(p138) do
		local _ = nil
		local var3791 = nil
		local var3792, var3793, var3794 = protoModule.readTag(p138, var3790)
		local var3795 = var3792
		var3791 = var3793
		var3790 = var3794
		
		if var3791 == protoModule.wireTypes.varint then
			local _ = nil
			local var3796, var3797 = protoModule.readVarInt(p138, var3790)
			local _ = var3796
			var3790 = var3797
			continue
		end
		if var3791 == protoModule.wireTypes.lengthDelimited then
			if var3795 == 1 then
				local _ = nil
				local var3798, var3799 = protoModule.readBuffer(p138, var3790)
				var3790 = var3799
				var3789.group_id = buffer.tostring(var3798)
			elseif var3795 == 2 then
				local _ = nil
				local var3800, var3801 = protoModule.readBuffer(p138, var3790)
				var3790 = var3801
				var3789.announcement_id = buffer.tostring(var3800)
			elseif var3795 == 3 then
				local _ = nil
				local var3802, var3803 = protoModule.readBuffer(p138, var3790)
				var3790 = var3803
				var3789.message_id = buffer.tostring(var3802)
			elseif var3795 == 4 then
				local _ = nil
				local var3804, var3805 = protoModule.readBuffer(p138, var3790)
				var3790 = var3805
				var3789.title = buffer.tostring(var3804)
			elseif var3795 == 5 then
				local _ = nil
				local var3806, var3807 = protoModule.readBuffer(p138, var3790)
				var3790 = var3807
				var3789.body = buffer.tostring(var3806)
			elseif var3795 == 6 then
				local _ = nil
				local var3808, var3809 = protoModule.readBuffer(p138, var3790)
				var3790 = var3809
				var3789.creator_key = buffer.tostring(var3808)
			elseif var3795 == 7 then
				local _ = nil
				local var3810, var3811 = protoModule.readBuffer(p138, var3790)
				var3790 = var3811
				var3789.creator_role_name = buffer.tostring(var3810)
			elseif var3795 == 8 then
				local _ = nil
				local var3812, var3813 = protoModule.readBuffer(p138, var3790)
				var3790 = var3813
				var3789.media_asset_id = buffer.tostring(var3812)
			elseif var3795 == 9 then
				local _ = nil
				local var3814, var3815 = protoModule.readBuffer(p138, var3790)
				var3790 = var3815
				var3789.created_time = timestampModule.Timestamp.decode(var3814)
			else
				local _ = nil
				local var3816, var3817 = protoModule.readVarInt(p138, var3790)
				var3790 = var3817 + var3816
			end
		elseif var3791 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3818, var3819 = protoModule.readFixed32(p138, var3790)
			local _ = var3818
			var3790 = var3819
		elseif var3791 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3820, var3821 = protoModule.readFixed64(p138, var3790)
			local _ = var3820
			var3790 = var3821
		else
			error("Unsupported wire type: " .. var5554)
		end
	end
	return var3789
end

function t_138:jsonEncode()
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

function t_138:jsonDecode()
	-- upvalues: t_138 (ref), timestampModule (ref)
	local var3822 = t_138.new()
	
	if self.group_id ~= nil then
		var3822.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var3822.group_id = self.groupId
	end
	if self.announcement_id ~= nil then
		var3822.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3822.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3822.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3822.message_id = self.messageId
	end
	if self.title ~= nil then
		var3822.title = self.title
	end
	if self.body ~= nil then
		var3822.body = self.body
	end
	if self.creator_key ~= nil then
		var3822.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3822.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3822.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3822.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3822.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3822.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3822.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3822.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3822
end

t_138.descriptor = {
	name = "GroupAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GroupAnnouncementInputData"
}
t.GroupAnnouncementInputData = t_138
typeRegistryModule.default:register(t.GroupAnnouncementInputData)
t.PageEntryFormat = {
	fromNumber = function(p139)
		return if p139 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p139 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p139)
		return if p139 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p139 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p139
	end,
	fromName = function(p139)
		return if p139 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p139 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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