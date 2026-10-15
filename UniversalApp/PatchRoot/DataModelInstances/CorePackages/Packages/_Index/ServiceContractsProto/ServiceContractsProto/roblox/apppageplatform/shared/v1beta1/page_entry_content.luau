local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local structModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local timestampModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.timestamp)
local backgroundLayerModule = require(script.Parent.background_layer)
local configDrivenFormDataModule = require(script.Parent.config_driven_form_data)
local customFormDataModule = require(script.Parent.custom_form_data)
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
		var3, var157 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.input_data ~= nil then
		local var5 = self.input_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var160 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
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
			error("Unsupported wire type: " .. var164)
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
		var22, var187 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var20 = var23
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var24, var189 = protoModule.writeString(var24, var25, self.roblox_component)
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
			error("Unsupported wire type: " .. var193)
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
		var40, var215 = protoModule.writeString(var40, var41, self.roblox_component)
		buff = var40
		var39 = var41
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var42 = self.input_data.value:encode()
		local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var43, var218 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var39 = var44
	end
	if self.cta_buttons ~= nil then
		local var45 = self.cta_buttons:encode()
		local var46, var47 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
		var46, var221 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
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
			error("Unsupported wire type: " .. var225)
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
		var61, var249 = protoModule.writeString(var61, var62, self.roblox_component)
		buff = var61
		var60 = var62
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var63 = self.input_data.value:encode()
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var252 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var60 = var65
		elseif self.input_data.type == "video" then
			local var66 = self.input_data.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var255 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
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
			error("Unsupported wire type: " .. var259)
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
			var83, var284 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var81 = var84
		elseif self.kind.type == "badge_details" then
			local var85 = self.kind.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
			var86, var287 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var81 = var87
		elseif self.kind.type == "static_content" then
			local var88 = self.kind.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var81, 3, protoModule.wireTypes.lengthDelimited)
			var89, var290 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var81 = var90
		elseif self.kind.type == "experience_attribution_row" then
			local var91 = self.kind.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var81, 4, protoModule.wireTypes.lengthDelimited)
			var92, var293 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var81 = var93
		elseif self.kind.type == "experience_action_module" then
			local var94 = self.kind.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var81, 5, protoModule.wireTypes.lengthDelimited)
			var95, var296 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var81 = var96
		elseif self.kind.type == "experience_media_gallery" then
			local var97 = self.kind.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var81, 6, protoModule.wireTypes.lengthDelimited)
			var98, var299 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var81 = var99
		elseif self.kind.type == "experience_description" then
			local var100 = self.kind.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var81, 7, protoModule.wireTypes.lengthDelimited)
			var101, var302 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var81 = var102
		elseif self.kind.type == "experience_stat_row" then
			local var103 = self.kind.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var81, 8, protoModule.wireTypes.lengthDelimited)
			var104, var305 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var81 = var105
		elseif self.kind.type == "experience_info_table" then
			local var106 = self.kind.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var81, 9, protoModule.wireTypes.lengthDelimited)
			var107, var308 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var81 = var108
		elseif self.kind.type == "social_link_row" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var81, 10, protoModule.wireTypes.lengthDelimited)
			var110, var311 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var81 = var111
		elseif self.kind.type == "experience_carousel" then
			local var112 = self.kind.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var81, 11, protoModule.wireTypes.lengthDelimited)
			var113, var314 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var81 = var114
		elseif self.kind.type == "song_carousel" then
			local var115 = self.kind.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var81, 12, protoModule.wireTypes.lengthDelimited)
			var116, var317 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var81 = var117
		elseif self.kind.type == "events_carousel" then
			local var118 = self.kind.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var81, 13, protoModule.wireTypes.lengthDelimited)
			var119, var320 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var81 = var120
		elseif self.kind.type == "game_pass_collection" then
			local var121 = self.kind.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var81, 14, protoModule.wireTypes.lengthDelimited)
			var122, var323 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var81 = var123
		elseif self.kind.type == "developer_product_collection" then
			local var124 = self.kind.value:encode()
			local var125, var126 = protoModule.writeTag(buff, var81, 15, protoModule.wireTypes.lengthDelimited)
			var125, var326 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
			buff = var125
			var81 = var126
		elseif self.kind.type == "subscription_collection" then
			local var127 = self.kind.value:encode()
			local var128, var129 = protoModule.writeTag(buff, var81, 16, protoModule.wireTypes.lengthDelimited)
			var128, var329 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var81 = var129
		elseif self.kind.type == "dynamic_store_category" then
			local var130 = self.kind.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var81, 17, protoModule.wireTypes.lengthDelimited)
			var131, var332 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var81 = var132
		elseif self.kind.type == "card_container" then
			local var133 = self.kind.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var81, 20, protoModule.wireTypes.lengthDelimited)
			var134, var335 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var81 = var135
		elseif self.kind.type == "card" then
			local var136 = self.kind.value:encode()
			local var137, var138 = protoModule.writeTag(buff, var81, 21, protoModule.wireTypes.lengthDelimited)
			var137, var338 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
			buff = var137
			var81 = var138
		elseif self.kind.type == "dialog" then
			local var139 = self.kind.value:encode()
			local var140, var141 = protoModule.writeTag(buff, var81, 22, protoModule.wireTypes.lengthDelimited)
			var140, var341 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var81 = var141
		elseif self.kind.type == "banner" then
			local var142 = self.kind.value:encode()
			local var143, var144 = protoModule.writeTag(buff, var81, 23, protoModule.wireTypes.lengthDelimited)
			var143, var344 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
			buff = var143
			var81 = var144
		elseif self.kind.type == "tooltip" then
			local var145 = self.kind.value:encode()
			local var146, var147 = protoModule.writeTag(buff, var81, 24, protoModule.wireTypes.lengthDelimited)
			var146, var347 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var81 = var147
		elseif self.kind.type == "coachmark" then
			local var148 = self.kind.value:encode()
			local var149, var150 = protoModule.writeTag(buff, var81, 25, protoModule.wireTypes.lengthDelimited)
			var149, var350 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
			buff = var149
			var81 = var150
		elseif self.kind.type == "system_banner_prompt" then
			local var151 = self.kind.value:encode()
			local var152, var153 = protoModule.writeTag(buff, var81, 28, protoModule.wireTypes.lengthDelimited)
			var152, var353 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
			buff = var152
			var81 = var153
		elseif self.kind.type == "age_check_upsell" then
			local var154 = self.kind.value:encode()
			local var155, var156 = protoModule.writeTag(buff, var81, 29, protoModule.wireTypes.lengthDelimited)
			var155, var356 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
			buff = var155
			var81 = var156
		elseif self.kind.type == "catalog_item_list" then
			local var157 = self.kind.value:encode()
			local var158, var159 = protoModule.writeTag(buff, var81, 26, protoModule.wireTypes.lengthDelimited)
			var158, var359 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var81 = var159
		elseif self.kind.type == "user_list" then
			local var160 = self.kind.value:encode()
			local var161, var162 = protoModule.writeTag(buff, var81, 27, protoModule.wireTypes.lengthDelimited)
			var161, var362 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
			buff = var161
			var81 = var162
		elseif self.kind.type == "experience_content_rating_label" then
			local var163 = self.kind.value:encode()
			local var164, var165 = protoModule.writeTag(buff, var81, 30, protoModule.wireTypes.lengthDelimited)
			var164, var365 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
			buff = var164
			var81 = var165
		elseif self.kind.type == "experience_refund_policy" then
			local var166 = self.kind.value:encode()
			local var167, var168 = protoModule.writeTag(buff, var81, 31, protoModule.wireTypes.lengthDelimited)
			var167, var368 = protoModule.writeBuffer(var167, var168, var166, buffer.len(var166))
			buff = var167
			var81 = var168
		elseif self.kind.type == "experience_play_with_reward" then
			local var169 = self.kind.value:encode()
			local var170, var171 = protoModule.writeTag(buff, var81, 32, protoModule.wireTypes.lengthDelimited)
			var170, var371 = protoModule.writeBuffer(var170, var171, var169, buffer.len(var169))
			buff = var170
			var81 = var171
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var172 = self.kind.value:encode()
			local var173, var174 = protoModule.writeTag(buff, var81, 33, protoModule.wireTypes.lengthDelimited)
			var173, var374 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
			buff = var173
			var81 = var174
		elseif self.kind.type == "community_section" then
			local var175 = self.kind.value:encode()
			local var176, var177 = protoModule.writeTag(buff, var81, 35, protoModule.wireTypes.lengthDelimited)
			var176, var377 = protoModule.writeBuffer(var176, var177, var175, buffer.len(var175))
			buff = var176
			var81 = var177
		elseif self.kind.type == "experience_leaderboard" then
			local var178 = self.kind.value:encode()
			local var179, var180 = protoModule.writeTag(buff, var81, 36, protoModule.wireTypes.lengthDelimited)
			var179, var380 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var81 = var180
		elseif self.kind.type == "moments_carousel" then
			local var181 = self.kind.value:encode()
			local var182, var183 = protoModule.writeTag(buff, var81, 34, protoModule.wireTypes.lengthDelimited)
			var182, var383 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
			buff = var182
			var81 = var183
		elseif self.kind.type == "text" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var81, 40, protoModule.wireTypes.lengthDelimited)
			var185, var386 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var81 = var186
		elseif self.kind.type == "vertical_feed" then
			local var187 = self.kind.value:encode()
			local var188, var189 = protoModule.writeTag(buff, var81, 41, protoModule.wireTypes.lengthDelimited)
			var188, var389 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var81 = var189
		elseif self.kind.type == "page_header" then
			local var190 = self.kind.value:encode()
			local var191, var192 = protoModule.writeTag(buff, var81, 42, protoModule.wireTypes.lengthDelimited)
			var191, var392 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
			buff = var191
			var81 = var192
		elseif self.kind.type == "image_cta_section" then
			local var193 = self.kind.value:encode()
			local var194, var195 = protoModule.writeTag(buff, var81, 43, protoModule.wireTypes.lengthDelimited)
			var194, var395 = protoModule.writeBuffer(var194, var195, var193, buffer.len(var193))
			buff = var194
			var81 = var195
		elseif self.kind.type == "config_driven_form" then
			local var196 = self.kind.value:encode()
			local var197, var198 = protoModule.writeTag(buff, var81, 44, protoModule.wireTypes.lengthDelimited)
			var197, var398 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
			buff = var197
			var81 = var198
		elseif self.kind.type == "sandbox_content" then
			local var199 = self.kind.value:encode()
			local var200, var201 = protoModule.writeTag(buff, var81, 50, protoModule.wireTypes.lengthDelimited)
			var200, var401 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
			buff = var200
			var81 = var201
		elseif self.kind.type == "experience_details_feed" then
			local var202 = self.kind.value:encode()
			local var203, var204 = protoModule.writeTag(buff, var81, 500, protoModule.wireTypes.lengthDelimited)
			var203, var404 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
			buff = var203
			var81 = var204
		elseif self.kind.type == "experience_details_action_bar" then
			local var205 = self.kind.value:encode()
			local var206, var207 = protoModule.writeTag(buff, var81, 501, protoModule.wireTypes.lengthDelimited)
			var206, var407 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var81 = var207
		elseif self.kind.type == "experience_details_banner_image" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var81, 502, protoModule.wireTypes.lengthDelimited)
			var209, var410 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var81 = var210
		elseif self.kind.type == "experience_details_sticky_header" then
			local var211 = self.kind.value:encode()
			local var212, var213 = protoModule.writeTag(buff, var81, 503, protoModule.wireTypes.lengthDelimited)
			var212, var413 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
			buff = var212
			var81 = var213
		elseif self.kind.type == "event_details_feed" then
			local var214 = self.kind.value:encode()
			local var215, var216 = protoModule.writeTag(buff, var81, 600, protoModule.wireTypes.lengthDelimited)
			var215, var416 = protoModule.writeBuffer(var215, var216, var214, buffer.len(var214))
			buff = var215
			var81 = var216
		elseif self.kind.type == "event_details_action_bar" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var81, 601, protoModule.wireTypes.lengthDelimited)
			var218, var419 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var81 = var219
		elseif self.kind.type == "event_attribution_row" then
			local var220 = self.kind.value:encode()
			local var221, var222 = protoModule.writeTag(buff, var81, 602, protoModule.wireTypes.lengthDelimited)
			var221, var422 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var81 = var222
		elseif self.kind.type == "event_description" then
			local var223 = self.kind.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var81, 603, protoModule.wireTypes.lengthDelimited)
			var224, var425 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var81 = var225
		elseif self.kind.type == "event_info_table" then
			local var226 = self.kind.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var81, 604, protoModule.wireTypes.lengthDelimited)
			var227, var428 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var81 = var228
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var81, 605, protoModule.wireTypes.lengthDelimited)
			var230, var431 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var81 = var231
		elseif self.kind.type == "event_notifications_modal" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var81, 606, protoModule.wireTypes.lengthDelimited)
			var233, var434 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var81 = var234
		elseif self.kind.type == "dev_store_feed" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var81, 700, protoModule.wireTypes.lengthDelimited)
			var236, var437 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var81 = var237
		elseif self.kind.type == "charts_feed" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var81, 800, protoModule.wireTypes.lengthDelimited)
			var239, var440 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var81 = var240
		elseif self.kind.type == "filter_pills" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var81, 801, protoModule.wireTypes.lengthDelimited)
			var242, var443 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var81 = var243
		elseif self.kind.type == "sort_selector" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var81, 802, protoModule.wireTypes.lengthDelimited)
			var245, var446 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var81 = var246
		elseif self.kind.type == "genre_selector" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var81, 803, protoModule.wireTypes.lengthDelimited)
			var248, var449 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var81 = var249
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var81, 900, protoModule.wireTypes.lengthDelimited)
			var251, var452 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var81 = var252
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var81, 901, protoModule.wireTypes.lengthDelimited)
			var254, var455 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var81 = var255
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var81, 902, protoModule.wireTypes.lengthDelimited)
			var257, var458 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var81 = var258
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var81, 903, protoModule.wireTypes.lengthDelimited)
			var260, var461 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var81 = var261
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var81, 904, protoModule.wireTypes.lengthDelimited)
			var263, var464 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var81 = var264
		elseif self.kind.type == "catalog_item_grid" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var81, 905, protoModule.wireTypes.lengthDelimited)
			var266, var467 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var81 = var267
		elseif self.kind.type == "marketplace_offer_modal" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var81, 906, protoModule.wireTypes.lengthDelimited)
			var269, var470 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var81 = var270
		elseif self.kind.type == "marketplace_item_media_header" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var81, 907, protoModule.wireTypes.lengthDelimited)
			var272, var473 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var81 = var273
		elseif self.kind.type == "search_results_feed" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var81, 1000, protoModule.wireTypes.lengthDelimited)
			var275, var476 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var81 = var276
		elseif self.kind.type == "power_search_ai_overview" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var81, 1001, protoModule.wireTypes.lengthDelimited)
			var278, var479 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var81 = var279
		elseif self.kind.type == "experience_emphasis_tile" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var81, 1002, protoModule.wireTypes.lengthDelimited)
			var281, var482 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var81 = var282
		elseif self.kind.type == "search_autocomplete" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var81, 1003, protoModule.wireTypes.lengthDelimited)
			var284, var485 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var81 = var285
		elseif self.kind.type == "option_selector_carousel" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var81, 1100, protoModule.wireTypes.lengthDelimited)
			var287, var488 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var81 = var288
		elseif self.kind.type == "game_items_carousel" then
			local var289 = self.kind.value:encode()
			local var290, var291 = protoModule.writeTag(buff, var81, 1101, protoModule.wireTypes.lengthDelimited)
			var290, var491 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
			buff = var290
			var81 = var291
		elseif self.kind.type == "hero_unit" then
			local var292 = self.kind.value:encode()
			local var293, var294 = protoModule.writeTag(buff, var81, 1102, protoModule.wireTypes.lengthDelimited)
			var293, var494 = protoModule.writeBuffer(var293, var294, var292, buffer.len(var292))
			buff = var293
			var81 = var294
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var295 = self.kind.value:encode()
			local var296, var297 = protoModule.writeTag(buff, var81, 1103, protoModule.wireTypes.lengthDelimited)
			var296, var497 = protoModule.writeBuffer(var296, var297, var295, buffer.len(var295))
			buff = var296
			var81 = var297
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var298 = self.kind.value:encode()
			local var299, var300 = protoModule.writeTag(buff, var81, 1200, protoModule.wireTypes.lengthDelimited)
			var299, var500 = protoModule.writeBuffer(var299, var300, var298, buffer.len(var298))
			buff = var299
			var81 = var300
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var301 = self.kind.value:encode()
			local var302, var303 = protoModule.writeTag(buff, var81, 1300, protoModule.wireTypes.lengthDelimited)
			var302, var503 = protoModule.writeBuffer(var302, var303, var301, buffer.len(var301))
			buff = var302
			var81 = var303
		elseif self.kind.type == "community_announcement" then
			local var304 = self.kind.value:encode()
			local var305, var306 = protoModule.writeTag(buff, var81, 1400, protoModule.wireTypes.lengthDelimited)
			var305, var506 = protoModule.writeBuffer(var305, var306, var304, buffer.len(var304))
			buff = var305
			var81 = var306
		elseif self.kind.type == "group_announcement" then
			local var307 = self.kind.value:encode()
			local var308, var309 = protoModule.writeTag(buff, var81, 1401, protoModule.wireTypes.lengthDelimited)
			var308, var509 = protoModule.writeBuffer(var308, var309, var307, buffer.len(var307))
			buff = var308
			var81 = var309
		elseif self.kind.type == "settings_row" then
			local var310 = self.kind.value:encode()
			local var311, var312 = protoModule.writeTag(buff, var81, 1500, protoModule.wireTypes.lengthDelimited)
			var311, var512 = protoModule.writeBuffer(var311, var312, var310, buffer.len(var310))
			buff = var311
			var81 = var312
		elseif self.kind.type == "settings_toggle" then
			local var313 = self.kind.value:encode()
			local var314, var315 = protoModule.writeTag(buff, var81, 1501, protoModule.wireTypes.lengthDelimited)
			var314, var515 = protoModule.writeBuffer(var314, var315, var313, buffer.len(var313))
			buff = var314
			var81 = var315
		end
	end
	local buff_1 = buffer.create(var81)
	buffer.copy(buff_1, 0, buff, 0, var81)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref), configDrivenFormDataModule (ref), structModule (ref)
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
			elseif var87 == 36 then
				local _ = nil
				local var156, var157 = protoModule.readBuffer(p5, var82)
				var82 = var157
				var81.kind = {
					type = "experience_leaderboard",
					value = t.ExperienceLeaderboardInputData.decode(var156)
				}
			elseif var87 == 40 then
				local _ = nil
				local var158, var159 = protoModule.readBuffer(p5, var82)
				var82 = var159
				var81.kind = { type = "text", value = t.TextInputData.decode(var158) }
			elseif var87 == 41 then
				local _ = nil
				local var160, var161 = protoModule.readBuffer(p5, var82)
				var82 = var161
				var81.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(var160)
				}
			elseif var87 == 42 then
				local _ = nil
				local var162, var163 = protoModule.readBuffer(p5, var82)
				var82 = var163
				var81.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(var162)
				}
			elseif var87 == 43 then
				local _ = nil
				local var164, var165 = protoModule.readBuffer(p5, var82)
				var82 = var165
				var81.kind = {
					type = "image_cta_section",
					value = t.ImageCtaSectionInputData.decode(var164)
				}
			elseif var87 == 44 then
				local _ = nil
				local var166, var167 = protoModule.readBuffer(p5, var82)
				var82 = var167
				var81.kind = {
					type = "config_driven_form",
					value = configDrivenFormDataModule.ConfigDrivenFormInputData.decode(var166)
				}
			elseif var87 == 50 then
				local _ = nil
				local var168, var169 = protoModule.readBuffer(p5, var82)
				var82 = var169
				var81.kind = {
					type = "sandbox_content",
					value = structModule.Struct.decode(var168)
				}
			elseif var87 == 500 then
				local _ = nil
				local var170, var171 = protoModule.readBuffer(p5, var82)
				var82 = var171
				var81.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var170)
				}
			elseif var87 == 501 then
				local _ = nil
				local var172, var173 = protoModule.readBuffer(p5, var82)
				var82 = var173
				var81.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var172)
				}
			elseif var87 == 502 then
				local _ = nil
				local var174, var175 = protoModule.readBuffer(p5, var82)
				var82 = var175
				var81.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var174)
				}
			elseif var87 == 503 then
				local _ = nil
				local var176, var177 = protoModule.readBuffer(p5, var82)
				var82 = var177
				var81.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var176)
				}
			elseif var87 == 600 then
				local _ = nil
				local var178, var179 = protoModule.readBuffer(p5, var82)
				var82 = var179
				var81.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var178)
				}
			elseif var87 == 601 then
				local _ = nil
				local var180, var181 = protoModule.readBuffer(p5, var82)
				var82 = var181
				var81.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var180)
				}
			elseif var87 == 602 then
				local _ = nil
				local var182, var183 = protoModule.readBuffer(p5, var82)
				var82 = var183
				var81.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var182)
				}
			elseif var87 == 603 then
				local _ = nil
				local var184, var185 = protoModule.readBuffer(p5, var82)
				var82 = var185
				var81.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var184)
				}
			elseif var87 == 604 then
				local _ = nil
				local var186, var187 = protoModule.readBuffer(p5, var82)
				var82 = var187
				var81.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var186)
				}
			elseif var87 == 605 then
				local _ = nil
				local var188, var189 = protoModule.readBuffer(p5, var82)
				var82 = var189
				var81.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var188)
				}
			elseif var87 == 606 then
				local _ = nil
				local var190, var191 = protoModule.readBuffer(p5, var82)
				var82 = var191
				var81.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var190)
				}
			elseif var87 == 700 then
				local _ = nil
				local var192, var193 = protoModule.readBuffer(p5, var82)
				var82 = var193
				var81.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var192)
				}
			elseif var87 == 800 then
				local _ = nil
				local var194, var195 = protoModule.readBuffer(p5, var82)
				var82 = var195
				var81.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var194)
				}
			elseif var87 == 801 then
				local _ = nil
				local var196, var197 = protoModule.readBuffer(p5, var82)
				var82 = var197
				var81.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var196)
				}
			elseif var87 == 802 then
				local _ = nil
				local var198, var199 = protoModule.readBuffer(p5, var82)
				var82 = var199
				var81.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var198)
				}
			elseif var87 == 803 then
				local _ = nil
				local var200, var201 = protoModule.readBuffer(p5, var82)
				var82 = var201
				var81.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(var200)
				}
			elseif var87 == 900 then
				local _ = nil
				local var202, var203 = protoModule.readBuffer(p5, var82)
				var82 = var203
				var81.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var202)
				}
			elseif var87 == 901 then
				local _ = nil
				local var204, var205 = protoModule.readBuffer(p5, var82)
				var82 = var205
				var81.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var204)
				}
			elseif var87 == 902 then
				local _ = nil
				local var206, var207 = protoModule.readBuffer(p5, var82)
				var82 = var207
				var81.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var206)
				}
			elseif var87 == 903 then
				local _ = nil
				local var208, var209 = protoModule.readBuffer(p5, var82)
				var82 = var209
				var81.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var208)
				}
			elseif var87 == 904 then
				local _ = nil
				local var210, var211 = protoModule.readBuffer(p5, var82)
				var82 = var211
				var81.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var210)
				}
			elseif var87 == 905 then
				local _ = nil
				local var212, var213 = protoModule.readBuffer(p5, var82)
				var82 = var213
				var81.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(var212)
				}
			elseif var87 == 906 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p5, var82)
				var82 = var215
				var81.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(var214)
				}
			elseif var87 == 907 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p5, var82)
				var82 = var217
				var81.kind = {
					type = "marketplace_item_media_header",
					value = t.MarketplaceItemMediaHeaderInputData.decode(var216)
				}
			elseif var87 == 1000 then
				local _ = nil
				local var218, var219 = protoModule.readBuffer(p5, var82)
				var82 = var219
				var81.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var218)
				}
			elseif var87 == 1001 then
				local _ = nil
				local var220, var221 = protoModule.readBuffer(p5, var82)
				var82 = var221
				var81.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var220)
				}
			elseif var87 == 1002 then
				local _ = nil
				local var222, var223 = protoModule.readBuffer(p5, var82)
				var82 = var223
				var81.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var222)
				}
			elseif var87 == 1003 then
				local _ = nil
				local var224, var225 = protoModule.readBuffer(p5, var82)
				var82 = var225
				var81.kind = {
					type = "search_autocomplete",
					value = t.SearchAutocompleteInputData.decode(var224)
				}
			elseif var87 == 1100 then
				local _ = nil
				local var226, var227 = protoModule.readBuffer(p5, var82)
				var82 = var227
				var81.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var226)
				}
			elseif var87 == 1101 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p5, var82)
				var82 = var229
				var81.kind = {
					type = "game_items_carousel",
					value = t.GameItemsCarouselInputData.decode(var228)
				}
			elseif var87 == 1102 then
				local _ = nil
				local var230, var231 = protoModule.readBuffer(p5, var82)
				var82 = var231
				var81.kind = {
					type = "hero_unit",
					value = t.HeroUnitInputData.decode(var230)
				}
			elseif var87 == 1103 then
				local _ = nil
				local var232, var233 = protoModule.readBuffer(p5, var82)
				var82 = var233
				var81.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(var232)
				}
			elseif var87 == 1200 then
				local _ = nil
				local var234, var235 = protoModule.readBuffer(p5, var82)
				var82 = var235
				var81.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var234)
				}
			elseif var87 == 1300 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p5, var82)
				var82 = var237
				var81.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var236)
				}
			elseif var87 == 1400 then
				local _ = nil
				local var238, var239 = protoModule.readBuffer(p5, var82)
				var82 = var239
				var81.kind = {
					type = "community_announcement",
					value = t.CommunityAnnouncementInputData.decode(var238)
				}
			elseif var87 == 1401 then
				local _ = nil
				local var240, var241 = protoModule.readBuffer(p5, var82)
				var82 = var241
				var81.kind = {
					type = "group_announcement",
					value = t.GroupAnnouncementInputData.decode(var240)
				}
			elseif var87 == 1500 then
				local _ = nil
				local var242, var243 = protoModule.readBuffer(p5, var82)
				var82 = var243
				var81.kind = {
					type = "settings_row",
					value = t.SettingsRowInputData.decode(var242)
				}
			elseif var87 == 1501 then
				local _ = nil
				local var244, var245 = protoModule.readBuffer(p5, var82)
				var82 = var245
				var81.kind = {
					type = "settings_toggle",
					value = t.SettingsToggleInputData.decode(var244)
				}
			else
				local _ = nil
				local var246, var247 = protoModule.readVarInt(p5, var82)
				var82 = var247 + var246
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var248, var249 = protoModule.readFixed32(p5, var82)
			local _ = var248
			var82 = var249
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var250, var251 = protoModule.readFixed64(p5, var82)
			local _ = var250
			var82 = var251
		else
			error("Unsupported wire type: " .. var519)
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
		elseif self.kind.type == "experience_leaderboard" then
			t.experienceLeaderboard = self.kind.value:jsonEncode()
			
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
		elseif self.kind.type == "config_driven_form" then
			t.configDrivenForm = self.kind.value:jsonEncode()
			
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
	-- upvalues: t_5 (ref), t (ref), configDrivenFormDataModule (ref), structModule (ref)
	local var252 = t_5.new()
	
	if self.badges_grid ~= nil then
		var252.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var252.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var252.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var252.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var252.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var252.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var252.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var252.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var252.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var252.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var252.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var252.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var252.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var252.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var252.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var252.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var252.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var252.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var252.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var252.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var252.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var252.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var252.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var252.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var252.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var252.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var252.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var252.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var252.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var252.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var252.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var252.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var252.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var252.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var252.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var252.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var252.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var252.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var252.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var252.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var252.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var252.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var252.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var252.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var252.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var252.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var252.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var252.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var252.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var252.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var252.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var252.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var252.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var252.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var252.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var252.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var252.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var252.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var252.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.experience_leaderboard ~= nil then
		var252.kind = {
			type = "experience_leaderboard",
			value = t.ExperienceLeaderboardInputData.jsonDecode(self.experience_leaderboard)
		}
	end
	if self.experienceLeaderboard ~= nil then
		var252.kind = {
			type = "experience_leaderboard",
			value = t.ExperienceLeaderboardInputData.jsonDecode(self.experienceLeaderboard)
		}
	end
	if self.moments_carousel ~= nil then
		var252.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var252.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var252.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var252.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var252.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var252.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var252.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var252.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var252.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.config_driven_form ~= nil then
		var252.kind = {
			type = "config_driven_form",
			value = configDrivenFormDataModule.ConfigDrivenFormInputData.jsonDecode(self.config_driven_form)
		}
	end
	if self.configDrivenForm ~= nil then
		var252.kind = {
			type = "config_driven_form",
			value = configDrivenFormDataModule.ConfigDrivenFormInputData.jsonDecode(self.configDrivenForm)
		}
	end
	if self.sandbox_content ~= nil then
		var252.kind = {
			type = "sandbox_content",
			value = structModule.Struct.jsonDecode(self.sandbox_content)
		}
	end
	if self.sandboxContent ~= nil then
		var252.kind = {
			type = "sandbox_content",
			value = structModule.Struct.jsonDecode(self.sandboxContent)
		}
	end
	if self.experience_details_feed ~= nil then
		var252.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var252.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var252.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var252.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var252.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var252.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var252.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var252.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var252.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var252.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var252.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var252.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var252.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var252.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var252.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var252.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var252.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var252.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var252.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var252.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var252.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var252.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var252.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var252.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var252.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var252.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var252.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var252.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var252.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var252.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var252.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var252.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var252.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var252.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var252.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var252.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var252.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var252.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var252.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var252.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var252.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var252.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var252.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var252.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var252.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var252.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.marketplace_item_media_header ~= nil then
		var252.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplace_item_media_header)
		}
	end
	if self.marketplaceItemMediaHeader ~= nil then
		var252.kind = {
			type = "marketplace_item_media_header",
			value = t.MarketplaceItemMediaHeaderInputData.jsonDecode(self.marketplaceItemMediaHeader)
		}
	end
	if self.search_results_feed ~= nil then
		var252.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var252.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var252.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var252.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var252.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var252.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.search_autocomplete ~= nil then
		var252.kind = {
			type = "search_autocomplete",
			value = t.SearchAutocompleteInputData.jsonDecode(self.search_autocomplete)
		}
	end
	if self.searchAutocomplete ~= nil then
		var252.kind = {
			type = "search_autocomplete",
			value = t.SearchAutocompleteInputData.jsonDecode(self.searchAutocomplete)
		}
	end
	if self.option_selector_carousel ~= nil then
		var252.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var252.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var252.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var252.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var252.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var252.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var252.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var252.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var252.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var252.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var252.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var252.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	if self.community_announcement ~= nil then
		var252.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.community_announcement)
		}
	end
	if self.communityAnnouncement ~= nil then
		var252.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.communityAnnouncement)
		}
	end
	if self.group_announcement ~= nil then
		var252.kind = {
			type = "group_announcement",
			value = t.GroupAnnouncementInputData.jsonDecode(self.group_announcement)
		}
	end
	if self.groupAnnouncement ~= nil then
		var252.kind = {
			type = "group_announcement",
			value = t.GroupAnnouncementInputData.jsonDecode(self.groupAnnouncement)
		}
	end
	if self.settings_row ~= nil then
		var252.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settings_row)
		}
	end
	if self.settingsRow ~= nil then
		var252.kind = {
			type = "settings_row",
			value = t.SettingsRowInputData.jsonDecode(self.settingsRow)
		}
	end
	if self.settings_toggle ~= nil then
		var252.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settings_toggle)
		}
	end
	if self.settingsToggle ~= nil then
		var252.kind = {
			type = "settings_toggle",
			value = t.SettingsToggleInputData.jsonDecode(self.settingsToggle)
		}
	end
	return var252
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
	local var252 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var253, var254 = protoModule.writeTag(buff, var252, 1, protoModule.wireTypes.lengthDelimited)
		var253, var693 = protoModule.writeString(var253, var254, self.section_title)
		buff = var253
		var252 = var254
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var255 = v:encode()
			local var256, var257 = protoModule.writeTag(buff, var252, 2, protoModule.wireTypes.lengthDelimited)
			var256, var696 = protoModule.writeBuffer(var256, var257, var255, buffer.len(var255))
			buff = var256
			var252 = var257
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var258, var259 = protoModule.writeTag(buff, var252, 3, protoModule.wireTypes.lengthDelimited)
		var258, var698 = protoModule.writeString(var258, var259, self.collection_id)
		buff = var258
		var252 = var259
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var260, var261 = protoModule.writeTag(buff, var252, 4, protoModule.wireTypes.lengthDelimited)
		var260, var700 = protoModule.writeString(var260, var261, self.collection_position)
		buff = var260
		var252 = var261
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var262, var263 = protoModule.writeTag(buff, var252, 5, protoModule.wireTypes.lengthDelimited)
		var262, var702 = protoModule.writeString(var262, var263, self.universe_id)
		buff = var262
		var252 = var263
	end
	local buff_1 = buffer.create(var252)
	buffer.copy(buff_1, 0, buff, 0, var252)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var264 = t_6.new()
	local var265 = 0
	while var265 < buffer.len(p6) do
		local _ = nil
		local var266 = nil
		local var267, var268, var269 = protoModule.readTag(p6, var265)
		local var270 = var267
		var266 = var268
		var265 = var269
		
		if var266 == protoModule.wireTypes.varint then
			local _ = nil
			local var271, var272 = protoModule.readVarInt(p6, var265)
			local _ = var271
			var265 = var272
			continue
		end
		if var266 == protoModule.wireTypes.lengthDelimited then
			if var270 == 1 then
				local _ = nil
				local var273, var274 = protoModule.readBuffer(p6, var265)
				var265 = var274
				var264.section_title = buffer.tostring(var273)
			elseif var270 == 2 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p6, var265)
				var265 = var276
				table.insert(var264.badges, t.BadgesGridInputData_BadgeInputData.decode(var275))
			elseif var270 == 3 then
				local _ = nil
				local var277, var278 = protoModule.readBuffer(p6, var265)
				var265 = var278
				var264.collection_id = buffer.tostring(var277)
			elseif var270 == 4 then
				local _ = nil
				local var279, var280 = protoModule.readBuffer(p6, var265)
				var265 = var280
				var264.collection_position = buffer.tostring(var279)
			elseif var270 == 5 then
				local _ = nil
				local var281, var282 = protoModule.readBuffer(p6, var265)
				var265 = var282
				var264.universe_id = buffer.tostring(var281)
			else
				local _ = nil
				local var283, var284 = protoModule.readVarInt(p6, var265)
				var265 = var284 + var283
			end
		elseif var266 == protoModule.wireTypes.i32 then
			local _ = nil
			local var285, var286 = protoModule.readFixed32(p6, var265)
			local _ = var285
			var265 = var286
		elseif var266 == protoModule.wireTypes.i64 then
			local _ = nil
			local var287, var288 = protoModule.readFixed64(p6, var265)
			local _ = var287
			var265 = var288
		else
			error("Unsupported wire type: " .. var706)
		end
	end
	return var264
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
	local var289 = t_6.new()
	
	if self.section_title ~= nil then
		var289.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var289.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var289.badges = t_1
	end
	if self.collection_id ~= nil then
		var289.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var289.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var289.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var289.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var289.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var289.universe_id = self.universeId
	end
	return var289
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
	local var290 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var291, var292 = protoModule.writeTag(buff, var290, 1, protoModule.wireTypes.lengthDelimited)
		var291, var736 = protoModule.writeString(var291, var292, self.badge_id)
		buff = var291
		var290 = var292
	end
	local buff_1 = buffer.create(var290)
	buffer.copy(buff_1, 0, buff, 0, var290)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var290 = t_7.new()
	local var291 = 0
	while var291 < buffer.len(p7) do
		local _ = nil
		local var292 = nil
		local var293, var294, var295 = protoModule.readTag(p7, var291)
		local var296 = var293
		var292 = var294
		var291 = var295
		
		if var292 == protoModule.wireTypes.varint then
			local _ = nil
			local var297, var298 = protoModule.readVarInt(p7, var291)
			local _ = var297
			var291 = var298
			continue
		end
		if var292 == protoModule.wireTypes.lengthDelimited then
			if var296 == 1 then
				local _ = nil
				local var299, var300 = protoModule.readBuffer(p7, var291)
				var291 = var300
				var290.badge_id = buffer.tostring(var299)
			else
				local _ = nil
				local var301, var302 = protoModule.readVarInt(p7, var291)
				var291 = var302 + var301
			end
		elseif var292 == protoModule.wireTypes.i32 then
			local _ = nil
			local var303, var304 = protoModule.readFixed32(p7, var291)
			local _ = var303
			var291 = var304
		elseif var292 == protoModule.wireTypes.i64 then
			local _ = nil
			local var305, var306 = protoModule.readFixed64(p7, var291)
			local _ = var305
			var291 = var306
		else
			error("Unsupported wire type: " .. var740)
		end
	end
	return var290
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
	local var307 = t_7.new()
	
	if self.badge_id ~= nil then
		var307.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var307.badge_id = self.badgeId
	end
	return var307
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
	local var307 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var308, var309 = protoModule.writeTag(buff, var307, 1, protoModule.wireTypes.lengthDelimited)
		var308, var760 = protoModule.writeString(var308, var309, self.badge_id)
		buff = var308
		var307 = var309
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var310, var311 = protoModule.writeTag(buff, var307, 2, protoModule.wireTypes.lengthDelimited)
		var310, var762 = protoModule.writeString(var310, var311, self.universe_id)
		buff = var310
		var307 = var311
	end
	if self.localized_literals ~= nil then
		local var312 = self.localized_literals:encode()
		local var313, var314 = protoModule.writeTag(buff, var307, 3, protoModule.wireTypes.lengthDelimited)
		var313, var765 = protoModule.writeBuffer(var313, var314, var312, buffer.len(var312))
		buff = var313
		var307 = var314
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var315, var316 = protoModule.writeTag(buff, var307, 4, protoModule.wireTypes.lengthDelimited)
		var315, var767 = protoModule.writeString(var315, var316, self.creator_key)
		buff = var315
		var307 = var316
	end
	local buff_1 = buffer.create(var307)
	buffer.copy(buff_1, 0, buff, 0, var307)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var307 = t_8.new()
	local var308 = 0
	while var308 < buffer.len(p8) do
		local _ = nil
		local var309 = nil
		local var310, var311, var312 = protoModule.readTag(p8, var308)
		local var313 = var310
		var309 = var311
		var308 = var312
		
		if var309 == protoModule.wireTypes.varint then
			local _ = nil
			local var314, var315 = protoModule.readVarInt(p8, var308)
			local _ = var314
			var308 = var315
			continue
		end
		if var309 == protoModule.wireTypes.lengthDelimited then
			if var313 == 1 then
				local _ = nil
				local var316, var317 = protoModule.readBuffer(p8, var308)
				var308 = var317
				var307.badge_id = buffer.tostring(var316)
			elseif var313 == 2 then
				local _ = nil
				local var318, var319 = protoModule.readBuffer(p8, var308)
				var308 = var319
				var307.universe_id = buffer.tostring(var318)
			elseif var313 == 3 then
				local _ = nil
				local var320, var321 = protoModule.readBuffer(p8, var308)
				var308 = var321
				var307.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var320)
			elseif var313 == 4 then
				local _ = nil
				local var322, var323 = protoModule.readBuffer(p8, var308)
				var308 = var323
				var307.creator_key = buffer.tostring(var322)
			else
				local _ = nil
				local var324, var325 = protoModule.readVarInt(p8, var308)
				var308 = var325 + var324
			end
		elseif var309 == protoModule.wireTypes.i32 then
			local _ = nil
			local var326, var327 = protoModule.readFixed32(p8, var308)
			local _ = var326
			var308 = var327
		elseif var309 == protoModule.wireTypes.i64 then
			local _ = nil
			local var328, var329 = protoModule.readFixed64(p8, var308)
			local _ = var328
			var308 = var329
		else
			error("Unsupported wire type: " .. var771)
		end
	end
	return var307
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
	local var330 = t_8.new()
	
	if self.badge_id ~= nil then
		var330.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var330.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var330.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var330.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var330.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var330.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var330.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var330.creator_key = self.creatorKey
	end
	return var330
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
	local var330 = 0
	
	if self.info_table ~= nil then
		local var331 = self.info_table:encode()
		local var332, var333 = protoModule.writeTag(buff, var330, 1, protoModule.wireTypes.lengthDelimited)
		var332, var798 = protoModule.writeBuffer(var332, var333, var331, buffer.len(var331))
		buff = var332
		var330 = var333
	end
	if self.action_module ~= nil then
		local var334 = self.action_module:encode()
		local var335, var336 = protoModule.writeTag(buff, var330, 2, protoModule.wireTypes.lengthDelimited)
		var335, var801 = protoModule.writeBuffer(var335, var336, var334, buffer.len(var334))
		buff = var335
		var330 = var336
	end
	if self.overflow_menu ~= nil then
		local var337 = self.overflow_menu:encode()
		local var338, var339 = protoModule.writeTag(buff, var330, 3, protoModule.wireTypes.lengthDelimited)
		var338, var804 = protoModule.writeBuffer(var338, var339, var337, buffer.len(var337))
		buff = var338
		var330 = var339
	end
	local buff_1 = buffer.create(var330)
	buffer.copy(buff_1, 0, buff, 0, var330)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var330 = t_9.new()
	local var331 = 0
	while var331 < buffer.len(p9) do
		local _ = nil
		local var332 = nil
		local var333, var334, var335 = protoModule.readTag(p9, var331)
		local var336 = var333
		var332 = var334
		var331 = var335
		
		if var332 == protoModule.wireTypes.varint then
			local _ = nil
			local var337, var338 = protoModule.readVarInt(p9, var331)
			local _ = var337
			var331 = var338
			continue
		end
		if var332 == protoModule.wireTypes.lengthDelimited then
			if var336 == 1 then
				local _ = nil
				local var339, var340 = protoModule.readBuffer(p9, var331)
				var331 = var340
				var330.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var339)
			elseif var336 == 2 then
				local _ = nil
				local var341, var342 = protoModule.readBuffer(p9, var331)
				var331 = var342
				var330.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var341)
			elseif var336 == 3 then
				local _ = nil
				local var343, var344 = protoModule.readBuffer(p9, var331)
				var331 = var344
				var330.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var343)
			else
				local _ = nil
				local var345, var346 = protoModule.readVarInt(p9, var331)
				var331 = var346 + var345
			end
		elseif var332 == protoModule.wireTypes.i32 then
			local _ = nil
			local var347, var348 = protoModule.readFixed32(p9, var331)
			local _ = var347
			var331 = var348
		elseif var332 == protoModule.wireTypes.i64 then
			local _ = nil
			local var349, var350 = protoModule.readFixed64(p9, var331)
			local _ = var349
			var331 = var350
		else
			error("Unsupported wire type: " .. var808)
		end
	end
	return var330
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
	local var351 = t_9.new()
	
	if self.info_table ~= nil then
		var351.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var351.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var351.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var351.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var351.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var351.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var351
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
	local var351 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var352, var353 = protoModule.writeTag(buff, var351, 1, protoModule.wireTypes.lengthDelimited)
		var352, var832 = protoModule.writeString(var352, var353, self.type_label)
		buff = var352
		var351 = var353
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var354, var355 = protoModule.writeTag(buff, var351, 2, protoModule.wireTypes.lengthDelimited)
		var354, var834 = protoModule.writeString(var354, var355, self.earned_label)
		buff = var354
		var351 = var355
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var356, var357 = protoModule.writeTag(buff, var351, 3, protoModule.wireTypes.lengthDelimited)
		var356, var836 = protoModule.writeString(var356, var357, self.updated_label)
		buff = var356
		var351 = var357
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var358, var359 = protoModule.writeTag(buff, var351, 4, protoModule.wireTypes.lengthDelimited)
		var358, var838 = protoModule.writeString(var358, var359, self.experience_label)
		buff = var358
		var351 = var359
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var360, var361 = protoModule.writeTag(buff, var351, 5, protoModule.wireTypes.lengthDelimited)
		var360, var840 = protoModule.writeString(var360, var361, self.rarity_label)
		buff = var360
		var351 = var361
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var362, var363 = protoModule.writeTag(buff, var351, 6, protoModule.wireTypes.lengthDelimited)
		var362, var842 = protoModule.writeString(var362, var363, self.won_yesterday_label)
		buff = var362
		var351 = var363
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var364, var365 = protoModule.writeTag(buff, var351, 7, protoModule.wireTypes.lengthDelimited)
		var364, var844 = protoModule.writeString(var364, var365, self.won_ever_label)
		buff = var364
		var351 = var365
	end
	local buff_1 = buffer.create(var351)
	buffer.copy(buff_1, 0, buff, 0, var351)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var351 = t_10.new()
	local var352 = 0
	while var352 < buffer.len(p10) do
		local _ = nil
		local var353 = nil
		local var354, var355, var356 = protoModule.readTag(p10, var352)
		local var357 = var354
		var353 = var355
		var352 = var356
		
		if var353 == protoModule.wireTypes.varint then
			local _ = nil
			local var358, var359 = protoModule.readVarInt(p10, var352)
			local _ = var358
			var352 = var359
			continue
		end
		if var353 == protoModule.wireTypes.lengthDelimited then
			if var357 == 1 then
				local _ = nil
				local var360, var361 = protoModule.readBuffer(p10, var352)
				var352 = var361
				var351.type_label = buffer.tostring(var360)
			elseif var357 == 2 then
				local _ = nil
				local var362, var363 = protoModule.readBuffer(p10, var352)
				var352 = var363
				var351.earned_label = buffer.tostring(var362)
			elseif var357 == 3 then
				local _ = nil
				local var364, var365 = protoModule.readBuffer(p10, var352)
				var352 = var365
				var351.updated_label = buffer.tostring(var364)
			elseif var357 == 4 then
				local _ = nil
				local var366, var367 = protoModule.readBuffer(p10, var352)
				var352 = var367
				var351.experience_label = buffer.tostring(var366)
			elseif var357 == 5 then
				local _ = nil
				local var368, var369 = protoModule.readBuffer(p10, var352)
				var352 = var369
				var351.rarity_label = buffer.tostring(var368)
			elseif var357 == 6 then
				local _ = nil
				local var370, var371 = protoModule.readBuffer(p10, var352)
				var352 = var371
				var351.won_yesterday_label = buffer.tostring(var370)
			elseif var357 == 7 then
				local _ = nil
				local var372, var373 = protoModule.readBuffer(p10, var352)
				var352 = var373
				var351.won_ever_label = buffer.tostring(var372)
			else
				local _ = nil
				local var374, var375 = protoModule.readVarInt(p10, var352)
				var352 = var375 + var374
			end
		elseif var353 == protoModule.wireTypes.i32 then
			local _ = nil
			local var376, var377 = protoModule.readFixed32(p10, var352)
			local _ = var376
			var352 = var377
		elseif var353 == protoModule.wireTypes.i64 then
			local _ = nil
			local var378, var379 = protoModule.readFixed64(p10, var352)
			local _ = var378
			var352 = var379
		else
			error("Unsupported wire type: " .. var848)
		end
	end
	return var351
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
	local var380 = t_10.new()
	
	if self.type_label ~= nil then
		var380.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var380.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var380.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var380.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var380.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var380.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var380.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var380.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var380.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var380.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var380.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var380.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var380.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var380.won_ever_label = self.wonEverLabel
	end
	return var380
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
	local var380 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var381, var382 = protoModule.writeTag(buff, var380, 1, protoModule.wireTypes.lengthDelimited)
		var381, var880 = protoModule.writeString(var381, var382, self.share)
		buff = var381
		var380 = var382
	end
	if self.report ~= nil and self.report ~= "" then
		local var383, var384 = protoModule.writeTag(buff, var380, 2, protoModule.wireTypes.lengthDelimited)
		var383, var882 = protoModule.writeString(var383, var384, self.report)
		buff = var383
		var380 = var384
	end
	local buff_1 = buffer.create(var380)
	buffer.copy(buff_1, 0, buff, 0, var380)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var380 = t_11.new()
	local var381 = 0
	while var381 < buffer.len(p11) do
		local _ = nil
		local var382 = nil
		local var383, var384, var385 = protoModule.readTag(p11, var381)
		local var386 = var383
		var382 = var384
		var381 = var385
		
		if var382 == protoModule.wireTypes.varint then
			local _ = nil
			local var387, var388 = protoModule.readVarInt(p11, var381)
			local _ = var387
			var381 = var388
			continue
		end
		if var382 == protoModule.wireTypes.lengthDelimited then
			if var386 == 1 then
				local _ = nil
				local var389, var390 = protoModule.readBuffer(p11, var381)
				var381 = var390
				var380.share = buffer.tostring(var389)
			elseif var386 == 2 then
				local _ = nil
				local var391, var392 = protoModule.readBuffer(p11, var381)
				var381 = var392
				var380.report = buffer.tostring(var391)
			else
				local _ = nil
				local var393, var394 = protoModule.readVarInt(p11, var381)
				var381 = var394 + var393
			end
		elseif var382 == protoModule.wireTypes.i32 then
			local _ = nil
			local var395, var396 = protoModule.readFixed32(p11, var381)
			local _ = var395
			var381 = var396
		elseif var382 == protoModule.wireTypes.i64 then
			local _ = nil
			local var397, var398 = protoModule.readFixed64(p11, var381)
			local _ = var397
			var381 = var398
		else
			error("Unsupported wire type: " .. var886)
		end
	end
	return var380
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
	local var399 = t_11.new()
	
	if self.share ~= nil then
		var399.share = self.share
	end
	if self.report ~= nil then
		var399.report = self.report
	end
	return var399
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
	local var399 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var400, var401 = protoModule.writeTag(buff, var399, 1, protoModule.wireTypes.lengthDelimited)
		var400, var908 = protoModule.writeString(var400, var401, self.report)
		buff = var400
		var399 = var401
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var402, var403 = protoModule.writeTag(buff, var399, 2, protoModule.wireTypes.lengthDelimited)
		var402, var910 = protoModule.writeString(var402, var403, self.remove)
		buff = var402
		var399 = var403
	end
	local buff_1 = buffer.create(var399)
	buffer.copy(buff_1, 0, buff, 0, var399)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var399 = t_12.new()
	local var400 = 0
	while var400 < buffer.len(p12) do
		local _ = nil
		local var401 = nil
		local var402, var403, var404 = protoModule.readTag(p12, var400)
		local var405 = var402
		var401 = var403
		var400 = var404
		
		if var401 == protoModule.wireTypes.varint then
			local _ = nil
			local var406, var407 = protoModule.readVarInt(p12, var400)
			local _ = var406
			var400 = var407
			continue
		end
		if var401 == protoModule.wireTypes.lengthDelimited then
			if var405 == 1 then
				local _ = nil
				local var408, var409 = protoModule.readBuffer(p12, var400)
				var400 = var409
				var399.report = buffer.tostring(var408)
			elseif var405 == 2 then
				local _ = nil
				local var410, var411 = protoModule.readBuffer(p12, var400)
				var400 = var411
				var399.remove = buffer.tostring(var410)
			else
				local _ = nil
				local var412, var413 = protoModule.readVarInt(p12, var400)
				var400 = var413 + var412
			end
		elseif var401 == protoModule.wireTypes.i32 then
			local _ = nil
			local var414, var415 = protoModule.readFixed32(p12, var400)
			local _ = var414
			var400 = var415
		elseif var401 == protoModule.wireTypes.i64 then
			local _ = nil
			local var416, var417 = protoModule.readFixed64(p12, var400)
			local _ = var416
			var400 = var417
		else
			error("Unsupported wire type: " .. var914)
		end
	end
	return var399
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
	local var418 = t_12.new()
	
	if self.report ~= nil then
		var418.report = self.report
	end
	if self.remove ~= nil then
		var418.remove = self.remove
	end
	return var418
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
	local var418 = t_13.new()
	local var419 = 0
	while var419 < buffer.len(p13) do
		local var420 = nil
		local _ = nil
		local var421, var422, var423 = protoModule.readTag(p13, var419)
		var420 = var421
		local var424 = var422
		var419 = var423
		
		if var424 == protoModule.wireTypes.varint then
			local _ = nil
			local var425, var426 = protoModule.readVarInt(p13, var419)
			local _ = var425
			var419 = var426
		elseif var424 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var427, var428 = protoModule.readVarInt(p13, var419)
			var419 = var428 + var427
		elseif var424 == protoModule.wireTypes.i32 then
			local _ = nil
			local var429, var430 = protoModule.readFixed32(p13, var419)
			local _ = var429
			var419 = var430
		elseif var424 == protoModule.wireTypes.i64 then
			local _ = nil
			local var431, var432 = protoModule.readFixed64(p13, var419)
			local _ = var431
			var419 = var432
		else
			error("Unsupported wire type: " .. var940)
		end
	end
	return var418
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
	local var433 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var434, var435 = protoModule.writeTag(buff, var433, 1, protoModule.wireTypes.lengthDelimited)
		var434, var952 = protoModule.writeString(var434, var435, self.universe_id)
		buff = var434
		var433 = var435
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var436, var437 = protoModule.writeTag(buff, var433, 2, protoModule.wireTypes.lengthDelimited)
		var436, var954 = protoModule.writeString(var436, var437, self.creator_key)
		buff = var436
		var433 = var437
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var438, var439 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var438, var956 = protoModule.writeString(var438, var439, i)
			local var440 = v:encode()
			var439, var958 = protoModule.writeTag(var438, var439, 2, protoModule.wireTypes.lengthDelimited)
			var439, var958 = protoModule.writeBuffer(var439, var958, var440, buffer.len(var440))
			local var441 = var439
			local var442 = var958
			local var443, var444 = protoModule.writeTag(buff, var433, 3, protoModule.wireTypes.lengthDelimited)
			var443, var962 = protoModule.writeBuffer(var443, var444, var441, var442)
			buff = var443
			var433 = var444
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var445, var446 = protoModule.writeTag(buff, var433, 4, protoModule.wireTypes.lengthDelimited)
			var445, var964 = protoModule.writeString(var445, var446, v)
			buff = var445
			var433 = var446
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var447, var448 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var447, var966 = protoModule.writeString(var447, var448, i)
			local var449 = v:encode()
			var448, var968 = protoModule.writeTag(var447, var448, 2, protoModule.wireTypes.lengthDelimited)
			var448, var968 = protoModule.writeBuffer(var448, var968, var449, buffer.len(var449))
			local var450 = var448
			local var451 = var968
			local var452, var453 = protoModule.writeTag(buff, var433, 5, protoModule.wireTypes.lengthDelimited)
			var452, var972 = protoModule.writeBuffer(var452, var453, var450, var451)
			buff = var452
			var433 = var453
		end
	end
	local buff_1 = buffer.create(var433)
	buffer.copy(buff_1, 0, buff, 0, var433)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var454 = t_14.new()
	local var455 = 0
	while var455 < buffer.len(p14) do
		local _ = nil
		local var456 = nil
		local var457, var458, var459 = protoModule.readTag(p14, var455)
		local var460 = var457
		var456 = var458
		var455 = var459
		
		if var456 == protoModule.wireTypes.varint then
			local _ = nil
			local var461, var462 = protoModule.readVarInt(p14, var455)
			local _ = var461
			var455 = var462
			continue
		end
		if var456 == protoModule.wireTypes.lengthDelimited then
			if var460 == 1 then
				local _ = nil
				local var463, var464 = protoModule.readBuffer(p14, var455)
				var455 = var464
				var454.universe_id = buffer.tostring(var463)
			elseif var460 == 2 then
				local _ = nil
				local var465, var466 = protoModule.readBuffer(p14, var455)
				var455 = var466
				var454.creator_key = buffer.tostring(var465)
			elseif var460 == 3 then
				local _ = nil
				local var467, var468 = protoModule.readBuffer(p14, var455)
				var455 = var468
				var467 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var467)
				var454.entry_map[var467.key or ""] = var467.value or t.FeedEntry.new()
			elseif var460 == 4 then
				local _ = nil
				local var469, var470 = protoModule.readBuffer(p14, var455)
				var455 = var470
				table.insert(var454.entry_order, buffer.tostring(var469))
			elseif var460 == 5 then
				local _ = nil
				local var471, var472 = protoModule.readBuffer(p14, var455)
				var455 = var472
				var471 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var471)
				var454.entry_order_map[var471.key or ""] = var471.value or t.EntryOrder.new()
			else
				local _ = nil
				local var473, var474 = protoModule.readVarInt(p14, var455)
				var455 = var474 + var473
			end
		elseif var456 == protoModule.wireTypes.i32 then
			local _ = nil
			local var475, var476 = protoModule.readFixed32(p14, var455)
			local _ = var475
			var455 = var476
		elseif var456 == protoModule.wireTypes.i64 then
			local _ = nil
			local var477, var478 = protoModule.readFixed64(p14, var455)
			local _ = var477
			var455 = var478
		else
			error("Unsupported wire type: " .. var976)
		end
	end
	return var454
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
	local var479 = t_14.new()
	
	if self.universe_id ~= nil then
		var479.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var479.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var479.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var479.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var479.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var479.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var479.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var479.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var479.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var479.entry_order_map = t_1
	end
	return var479
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
	local var480 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var481, var482 = protoModule.writeTag(buff, var480, 1, protoModule.wireTypes.lengthDelimited)
		var481, var1013 = protoModule.writeString(var481, var482, self.key)
		buff = var481
		var480 = var482
	end
	if self.value ~= nil then
		local var483 = self.value:encode()
		local var484, var485 = protoModule.writeTag(buff, var480, 2, protoModule.wireTypes.lengthDelimited)
		var484, var1016 = protoModule.writeBuffer(var484, var485, var483, buffer.len(var483))
		buff = var484
		var480 = var485
	end
	local buff_1 = buffer.create(var480)
	buffer.copy(buff_1, 0, buff, 0, var480)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var480 = t_15.new()
	local var481 = 0
	while var481 < buffer.len(p15) do
		local _ = nil
		local var482 = nil
		local var483, var484, var485 = protoModule.readTag(p15, var481)
		local var486 = var483
		var482 = var484
		var481 = var485
		
		if var482 == protoModule.wireTypes.varint then
			local _ = nil
			local var487, var488 = protoModule.readVarInt(p15, var481)
			local _ = var487
			var481 = var488
			continue
		end
		if var482 == protoModule.wireTypes.lengthDelimited then
			if var486 == 1 then
				local _ = nil
				local var489, var490 = protoModule.readBuffer(p15, var481)
				var481 = var490
				var480.key = buffer.tostring(var489)
			elseif var486 == 2 then
				local _ = nil
				local var491, var492 = protoModule.readBuffer(p15, var481)
				var481 = var492
				var480.value = t.FeedEntry.decode(var491)
			else
				local _ = nil
				local var493, var494 = protoModule.readVarInt(p15, var481)
				var481 = var494 + var493
			end
		elseif var482 == protoModule.wireTypes.i32 then
			local _ = nil
			local var495, var496 = protoModule.readFixed32(p15, var481)
			local _ = var495
			var481 = var496
		elseif var482 == protoModule.wireTypes.i64 then
			local _ = nil
			local var497, var498 = protoModule.readFixed64(p15, var481)
			local _ = var497
			var481 = var498
		else
			error("Unsupported wire type: " .. var1020)
		end
	end
	return var480
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
	local var499 = t_15.new()
	
	if self.key ~= nil then
		var499.key = self.key
	end
	if self.value ~= nil then
		var499.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var499
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
	local var499 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var500, var501 = protoModule.writeTag(buff, var499, 1, protoModule.wireTypes.lengthDelimited)
		var500, var1042 = protoModule.writeString(var500, var501, self.key)
		buff = var500
		var499 = var501
	end
	if self.value ~= nil then
		local var502 = self.value:encode()
		local var503, var504 = protoModule.writeTag(buff, var499, 2, protoModule.wireTypes.lengthDelimited)
		var503, var1045 = protoModule.writeBuffer(var503, var504, var502, buffer.len(var502))
		buff = var503
		var499 = var504
	end
	local buff_1 = buffer.create(var499)
	buffer.copy(buff_1, 0, buff, 0, var499)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var499 = t_16.new()
	local var500 = 0
	while var500 < buffer.len(p16) do
		local _ = nil
		local var501 = nil
		local var502, var503, var504 = protoModule.readTag(p16, var500)
		local var505 = var502
		var501 = var503
		var500 = var504
		
		if var501 == protoModule.wireTypes.varint then
			local _ = nil
			local var506, var507 = protoModule.readVarInt(p16, var500)
			local _ = var506
			var500 = var507
			continue
		end
		if var501 == protoModule.wireTypes.lengthDelimited then
			if var505 == 1 then
				local _ = nil
				local var508, var509 = protoModule.readBuffer(p16, var500)
				var500 = var509
				var499.key = buffer.tostring(var508)
			elseif var505 == 2 then
				local _ = nil
				local var510, var511 = protoModule.readBuffer(p16, var500)
				var500 = var511
				var499.value = t.EntryOrder.decode(var510)
			else
				local _ = nil
				local var512, var513 = protoModule.readVarInt(p16, var500)
				var500 = var513 + var512
			end
		elseif var501 == protoModule.wireTypes.i32 then
			local _ = nil
			local var514, var515 = protoModule.readFixed32(p16, var500)
			local _ = var514
			var500 = var515
		elseif var501 == protoModule.wireTypes.i64 then
			local _ = nil
			local var516, var517 = protoModule.readFixed64(p16, var500)
			local _ = var516
			var500 = var517
		else
			error("Unsupported wire type: " .. var1049)
		end
	end
	return var499
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
	local var518 = t_16.new()
	
	if self.key ~= nil then
		var518.key = self.key
	end
	if self.value ~= nil then
		var518.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var518
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
	local var518 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var519, var520 = protoModule.writeTag(buff, var518, 1, protoModule.wireTypes.lengthDelimited)
			var519, var1071 = protoModule.writeString(var519, var520, v)
			buff = var519
			var518 = var520
		end
	end
	local buff_1 = buffer.create(var518)
	buffer.copy(buff_1, 0, buff, 0, var518)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var521 = t_17.new()
	local var522 = 0
	while var522 < buffer.len(p17) do
		local _ = nil
		local var523 = nil
		local var524, var525, var526 = protoModule.readTag(p17, var522)
		local var527 = var524
		var523 = var525
		var522 = var526
		
		if var523 == protoModule.wireTypes.varint then
			local _ = nil
			local var528, var529 = protoModule.readVarInt(p17, var522)
			local _ = var528
			var522 = var529
			continue
		end
		if var523 == protoModule.wireTypes.lengthDelimited then
			if var527 == 1 then
				local _ = nil
				local var530, var531 = protoModule.readBuffer(p17, var522)
				var522 = var531
				table.insert(var521.items, buffer.tostring(var530))
			else
				local _ = nil
				local var532, var533 = protoModule.readVarInt(p17, var522)
				var522 = var533 + var532
			end
		elseif var523 == protoModule.wireTypes.i32 then
			local _ = nil
			local var534, var535 = protoModule.readFixed32(p17, var522)
			local _ = var534
			var522 = var535
		elseif var523 == protoModule.wireTypes.i64 then
			local _ = nil
			local var536, var537 = protoModule.readFixed64(p17, var522)
			local _ = var536
			var522 = var537
		else
			error("Unsupported wire type: " .. var1075)
		end
	end
	return var521
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
	local var538 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var538.items = t
	end
	return var538
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
	local var539 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var540, var541 = protoModule.writeTag(buff, var539, 1, protoModule.wireTypes.lengthDelimited)
		var540, var1097 = protoModule.writeString(var540, var541, self.universe_id)
		buff = var540
		var539 = var541
	end
	if self.user_owns_experience then
		local var542, var543 = protoModule.writeTag(buff, var539, 2, protoModule.wireTypes.varint)
		var542, var1099 = protoModule.writeVarInt(var542, var543, if self.user_owns_experience then 1 else 0)
		buff = var542
		var539 = var543
	end
	local buff_1 = buffer.create(var539)
	buffer.copy(buff_1, 0, buff, 0, var539)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var539 = t_18.new()
	local var540 = 0
	while var540 < buffer.len(p18) do
		local _ = nil
		local var541 = nil
		local var542, var543, var544 = protoModule.readTag(p18, var540)
		local var545 = var542
		var541 = var543
		var540 = var544
		
		if var541 == protoModule.wireTypes.varint then
			if var545 == 2 then
				local _ = nil
				local var546, var547 = protoModule.readVarInt(p18, var540)
				var540 = var547
				var539.user_owns_experience = var546 ~= 0
			else
				local _ = nil
				local var548, var549 = protoModule.readVarInt(p18, var540)
				local _ = var548
				var540 = var549
			end
		end
		if var541 == protoModule.wireTypes.lengthDelimited then
			if var545 == 1 then
				local _ = nil
				local var550, var551 = protoModule.readBuffer(p18, var540)
				var540 = var551
				var539.universe_id = buffer.tostring(var550)
			else
				local _ = nil
				local var552, var553 = protoModule.readVarInt(p18, var540)
				var540 = var553 + var552
			end
		elseif var541 == protoModule.wireTypes.i32 then
			local _ = nil
			local var554, var555 = protoModule.readFixed32(p18, var540)
			local _ = var554
			var540 = var555
		elseif var541 == protoModule.wireTypes.i64 then
			local _ = nil
			local var556, var557 = protoModule.readFixed64(p18, var540)
			local _ = var556
			var540 = var557
		else
			error("Unsupported wire type: " .. var1103)
		end
	end
	return var539
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
	local var558 = t_18.new()
	
	if self.universe_id ~= nil then
		var558.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var558.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var558.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var558.user_owns_experience = self.userOwnsExperience
	end
	return var558
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
	local var558 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var559, var560 = protoModule.writeTag(buff, var558, 1, protoModule.wireTypes.lengthDelimited)
		var559, var1125 = protoModule.writeString(var559, var560, self.media_asset_id)
		buff = var559
		var558 = var560
	end
	local buff_1 = buffer.create(var558)
	buffer.copy(buff_1, 0, buff, 0, var558)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var558 = t_19.new()
	local var559 = 0
	while var559 < buffer.len(p19) do
		local _ = nil
		local var560 = nil
		local var561, var562, var563 = protoModule.readTag(p19, var559)
		local var564 = var561
		var560 = var562
		var559 = var563
		
		if var560 == protoModule.wireTypes.varint then
			local _ = nil
			local var565, var566 = protoModule.readVarInt(p19, var559)
			local _ = var565
			var559 = var566
			continue
		end
		if var560 == protoModule.wireTypes.lengthDelimited then
			if var564 == 1 then
				local _ = nil
				local var567, var568 = protoModule.readBuffer(p19, var559)
				var559 = var568
				var558.media_asset_id = buffer.tostring(var567)
			else
				local _ = nil
				local var569, var570 = protoModule.readVarInt(p19, var559)
				var559 = var570 + var569
			end
		elseif var560 == protoModule.wireTypes.i32 then
			local _ = nil
			local var571, var572 = protoModule.readFixed32(p19, var559)
			local _ = var571
			var559 = var572
		elseif var560 == protoModule.wireTypes.i64 then
			local _ = nil
			local var573, var574 = protoModule.readFixed64(p19, var559)
			local _ = var573
			var559 = var574
		else
			error("Unsupported wire type: " .. var1129)
		end
	end
	return var558
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
	local var575 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var575.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var575.media_asset_id = self.mediaAssetId
	end
	return var575
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
	local var575 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var576, var577 = protoModule.writeTag(buff, var575, 1, protoModule.wireTypes.lengthDelimited)
		var576, var1149 = protoModule.writeString(var576, var577, self.universe_id)
		buff = var576
		var575 = var577
	end
	local buff_1 = buffer.create(var575)
	buffer.copy(buff_1, 0, buff, 0, var575)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var575 = t_20.new()
	local var576 = 0
	while var576 < buffer.len(p20) do
		local _ = nil
		local var577 = nil
		local var578, var579, var580 = protoModule.readTag(p20, var576)
		local var581 = var578
		var577 = var579
		var576 = var580
		
		if var577 == protoModule.wireTypes.varint then
			local _ = nil
			local var582, var583 = protoModule.readVarInt(p20, var576)
			local _ = var582
			var576 = var583
			continue
		end
		if var577 == protoModule.wireTypes.lengthDelimited then
			if var581 == 1 then
				local _ = nil
				local var584, var585 = protoModule.readBuffer(p20, var576)
				var576 = var585
				var575.universe_id = buffer.tostring(var584)
			else
				local _ = nil
				local var586, var587 = protoModule.readVarInt(p20, var576)
				var576 = var587 + var586
			end
		elseif var577 == protoModule.wireTypes.i32 then
			local _ = nil
			local var588, var589 = protoModule.readFixed32(p20, var576)
			local _ = var588
			var576 = var589
		elseif var577 == protoModule.wireTypes.i64 then
			local _ = nil
			local var590, var591 = protoModule.readFixed64(p20, var576)
			local _ = var590
			var576 = var591
		else
			error("Unsupported wire type: " .. var1153)
		end
	end
	return var575
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
	local var592 = t_20.new()
	
	if self.universe_id ~= nil then
		var592.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var592.universe_id = self.universeId
	end
	return var592
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
	local var592 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var593, var594 = protoModule.writeTag(buff, var592, 1, protoModule.wireTypes.lengthDelimited)
		var593, var1173 = protoModule.writeString(var593, var594, self.universe_id)
		buff = var593
		var592 = var594
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var595, var596 = protoModule.writeTag(buff, var592, 2, protoModule.wireTypes.lengthDelimited)
		var595, var1175 = protoModule.writeString(var595, var596, self.creator_key)
		buff = var595
		var592 = var596
	end
	local buff_1 = buffer.create(var592)
	buffer.copy(buff_1, 0, buff, 0, var592)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var592 = t_21.new()
	local var593 = 0
	while var593 < buffer.len(p21) do
		local _ = nil
		local var594 = nil
		local var595, var596, var597 = protoModule.readTag(p21, var593)
		local var598 = var595
		var594 = var596
		var593 = var597
		
		if var594 == protoModule.wireTypes.varint then
			local _ = nil
			local var599, var600 = protoModule.readVarInt(p21, var593)
			local _ = var599
			var593 = var600
			continue
		end
		if var594 == protoModule.wireTypes.lengthDelimited then
			if var598 == 1 then
				local _ = nil
				local var601, var602 = protoModule.readBuffer(p21, var593)
				var593 = var602
				var592.universe_id = buffer.tostring(var601)
			elseif var598 == 2 then
				local _ = nil
				local var603, var604 = protoModule.readBuffer(p21, var593)
				var593 = var604
				var592.creator_key = buffer.tostring(var603)
			else
				local _ = nil
				local var605, var606 = protoModule.readVarInt(p21, var593)
				var593 = var606 + var605
			end
		elseif var594 == protoModule.wireTypes.i32 then
			local _ = nil
			local var607, var608 = protoModule.readFixed32(p21, var593)
			local _ = var607
			var593 = var608
		elseif var594 == protoModule.wireTypes.i64 then
			local _ = nil
			local var609, var610 = protoModule.readFixed64(p21, var593)
			local _ = var609
			var593 = var610
		else
			error("Unsupported wire type: " .. var1179)
		end
	end
	return var592
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
	local var611 = t_21.new()
	
	if self.universe_id ~= nil then
		var611.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var611.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var611.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var611.creator_key = self.creatorKey
	end
	return var611
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
	local var611 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var612, var613 = protoModule.writeTag(buff, var611, 1, protoModule.wireTypes.lengthDelimited)
		var612, var1201 = protoModule.writeString(var612, var613, self.universe_id)
		buff = var612
		var611 = var613
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var614, var615 = protoModule.writeTag(buff, var611, 2, protoModule.wireTypes.lengthDelimited)
		var614, var1203 = protoModule.writeString(var614, var615, self.root_place_id)
		buff = var614
		var611 = var615
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var616, var617 = protoModule.writeTag(buff, var611, 3, protoModule.wireTypes.lengthDelimited)
		var616, var1205 = protoModule.writeString(var616, var617, self.connection_played_display_name)
		buff = var616
		var611 = var617
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var618, var619 = protoModule.writeTag(buff, var611, 4, protoModule.wireTypes.lengthDelimited)
		var618, var1207 = protoModule.writeString(var618, var619, self.upsell_prompt)
		buff = var618
		var611 = var619
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var620 = v:encode()
			local var621, var622 = protoModule.writeTag(buff, var611, 5, protoModule.wireTypes.lengthDelimited)
			var621, var1210 = protoModule.writeBuffer(var621, var622, var620, buffer.len(var620))
			buff = var621
			var611 = var622
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var623, var624 = protoModule.writeTag(buff, var611, 6, protoModule.wireTypes.varint)
		var623, var1212 = protoModule.writeVarInt(var623, var624, self.connection_played_num_others)
		buff = var623
		var611 = var624
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var625, var626 = protoModule.writeTag(buff, var611, 7, protoModule.wireTypes.varint)
		var625, var1214 = protoModule.writeVarInt(var625, var626, self.connection_played_total_count)
		buff = var625
		var611 = var626
	end
	local buff_1 = buffer.create(var611)
	buffer.copy(buff_1, 0, buff, 0, var611)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var627 = t_22.new()
	local var628 = 0
	while var628 < buffer.len(p22) do
		local _ = nil
		local var629 = nil
		local var630, var631, var632 = protoModule.readTag(p22, var628)
		local var633 = var630
		var629 = var631
		var628 = var632
		
		if var629 == protoModule.wireTypes.varint then
			if var633 == 6 then
				local _ = nil
				local var634, var635 = protoModule.readVarIntI32(p22, var628)
				var628 = var635
				var627.connection_played_num_others = var634
			elseif var633 == 7 then
				local _ = nil
				local var636, var637 = protoModule.readVarIntI32(p22, var628)
				var628 = var637
				var627.connection_played_total_count = var636
			else
				local _ = nil
				local var638, var639 = protoModule.readVarInt(p22, var628)
				local _ = var638
				var628 = var639
			end
		end
		if var629 == protoModule.wireTypes.lengthDelimited then
			if var633 == 1 then
				local _ = nil
				local var640, var641 = protoModule.readBuffer(p22, var628)
				var628 = var641
				var627.universe_id = buffer.tostring(var640)
			elseif var633 == 2 then
				local _ = nil
				local var642, var643 = protoModule.readBuffer(p22, var628)
				var628 = var643
				var627.root_place_id = buffer.tostring(var642)
			elseif var633 == 3 then
				local _ = nil
				local var644, var645 = protoModule.readBuffer(p22, var628)
				var628 = var645
				var627.connection_played_display_name = buffer.tostring(var644)
			elseif var633 == 4 then
				local _ = nil
				local var646, var647 = protoModule.readBuffer(p22, var628)
				var628 = var647
				var627.upsell_prompt = buffer.tostring(var646)
			elseif var633 == 5 then
				local _ = nil
				local var648, var649 = protoModule.readBuffer(p22, var628)
				var628 = var649
				table.insert(var627.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var648))
			else
				local _ = nil
				local var650, var651 = protoModule.readVarInt(p22, var628)
				var628 = var651 + var650
			end
		elseif var629 == protoModule.wireTypes.i32 then
			local _ = nil
			local var652, var653 = protoModule.readFixed32(p22, var628)
			local _ = var652
			var628 = var653
		elseif var629 == protoModule.wireTypes.i64 then
			local _ = nil
			local var654, var655 = protoModule.readFixed64(p22, var628)
			local _ = var654
			var628 = var655
		else
			error("Unsupported wire type: " .. var1218)
		end
	end
	return var627
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
	local var656 = t_22.new()
	
	if self.universe_id ~= nil then
		var656.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var656.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var656.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var656.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var656.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var656.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var656.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var656.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var656.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var656.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var656.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var656.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var656.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var656.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var656
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
	local var657 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var658, var659 = protoModule.writeTag(buff, var657, 1, protoModule.wireTypes.lengthDelimited)
		var658, var1253 = protoModule.writeString(var658, var659, self.user_id)
		buff = var658
		var657 = var659
	end
	local buff_1 = buffer.create(var657)
	buffer.copy(buff_1, 0, buff, 0, var657)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var657 = t_23.new()
	local var658 = 0
	while var658 < buffer.len(p23) do
		local _ = nil
		local var659 = nil
		local var660, var661, var662 = protoModule.readTag(p23, var658)
		local var663 = var660
		var659 = var661
		var658 = var662
		
		if var659 == protoModule.wireTypes.varint then
			local _ = nil
			local var664, var665 = protoModule.readVarInt(p23, var658)
			local _ = var664
			var658 = var665
			continue
		end
		if var659 == protoModule.wireTypes.lengthDelimited then
			if var663 == 1 then
				local _ = nil
				local var666, var667 = protoModule.readBuffer(p23, var658)
				var658 = var667
				var657.user_id = buffer.tostring(var666)
			else
				local _ = nil
				local var668, var669 = protoModule.readVarInt(p23, var658)
				var658 = var669 + var668
			end
		elseif var659 == protoModule.wireTypes.i32 then
			local _ = nil
			local var670, var671 = protoModule.readFixed32(p23, var658)
			local _ = var670
			var658 = var671
		elseif var659 == protoModule.wireTypes.i64 then
			local _ = nil
			local var672, var673 = protoModule.readFixed64(p23, var658)
			local _ = var672
			var658 = var673
		else
			error("Unsupported wire type: " .. var1257)
		end
	end
	return var657
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
	local var674 = t_23.new()
	
	if self.user_id ~= nil then
		var674.user_id = self.user_id
	end
	if self.userId ~= nil then
		var674.user_id = self.userId
	end
	return var674
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
	local var674 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var675 = v:encode()
			local var676, var677 = protoModule.writeTag(buff, var674, 1, protoModule.wireTypes.lengthDelimited)
			var676, var1278 = protoModule.writeBuffer(var676, var677, var675, buffer.len(var675))
			buff = var676
			var674 = var677
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var678, var679 = protoModule.writeTag(buff, var674, 2, protoModule.wireTypes.lengthDelimited)
		var678, var1280 = protoModule.writeString(var678, var679, self.universe_id)
		buff = var678
		var674 = var679
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var680, var681 = protoModule.writeTag(buff, var674, 3, protoModule.wireTypes.lengthDelimited)
		var680, var1282 = protoModule.writeString(var680, var681, self.place_id)
		buff = var680
		var674 = var681
	end
	local buff_1 = buffer.create(var674)
	buffer.copy(buff_1, 0, buff, 0, var674)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var682 = t_24.new()
	local var683 = 0
	while var683 < buffer.len(p24) do
		local _ = nil
		local var684 = nil
		local var685, var686, var687 = protoModule.readTag(p24, var683)
		local var688 = var685
		var684 = var686
		var683 = var687
		
		if var684 == protoModule.wireTypes.varint then
			local _ = nil
			local var689, var690 = protoModule.readVarInt(p24, var683)
			local _ = var689
			var683 = var690
			continue
		end
		if var684 == protoModule.wireTypes.lengthDelimited then
			if var688 == 1 then
				local _ = nil
				local var691, var692 = protoModule.readBuffer(p24, var683)
				var683 = var692
				table.insert(var682.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var691))
			elseif var688 == 2 then
				local _ = nil
				local var693, var694 = protoModule.readBuffer(p24, var683)
				var683 = var694
				var682.universe_id = buffer.tostring(var693)
			elseif var688 == 3 then
				local _ = nil
				local var695, var696 = protoModule.readBuffer(p24, var683)
				var683 = var696
				var682.place_id = buffer.tostring(var695)
			else
				local _ = nil
				local var697, var698 = protoModule.readVarInt(p24, var683)
				var683 = var698 + var697
			end
		elseif var684 == protoModule.wireTypes.i32 then
			local _ = nil
			local var699, var700 = protoModule.readFixed32(p24, var683)
			local _ = var699
			var683 = var700
		elseif var684 == protoModule.wireTypes.i64 then
			local _ = nil
			local var701, var702 = protoModule.readFixed64(p24, var683)
			local _ = var701
			var683 = var702
		else
			error("Unsupported wire type: " .. var1286)
		end
	end
	return var682
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
	local var703 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var703.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var703.media_items = t_1
	end
	if self.universe_id ~= nil then
		var703.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var703.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var703.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var703.place_id = self.placeId
	end
	return var703
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
	local var704 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var705, var706 = protoModule.writeTag(buff, var704, 1, protoModule.wireTypes.lengthDelimited)
		var705, var1313 = protoModule.writeString(var705, var706, self.media_asset_id)
		buff = var705
		var704 = var706
	end
	if self.moment_video_playback ~= nil then
		local var707 = self.moment_video_playback:encode()
		local var708, var709 = protoModule.writeTag(buff, var704, 2, protoModule.wireTypes.lengthDelimited)
		var708, var1316 = protoModule.writeBuffer(var708, var709, var707, buffer.len(var707))
		buff = var708
		var704 = var709
	end
	if self.attribution_user_id ~= nil and self.attribution_user_id ~= "" then
		local var710, var711 = protoModule.writeTag(buff, var704, 3, protoModule.wireTypes.lengthDelimited)
		var710, var1318 = protoModule.writeString(var710, var711, self.attribution_user_id)
		buff = var710
		var704 = var711
	end
	local buff_1 = buffer.create(var704)
	buffer.copy(buff_1, 0, buff, 0, var704)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), t (ref)
	local var704 = t_25.new()
	local var705 = 0
	while var705 < buffer.len(p25) do
		local _ = nil
		local var706 = nil
		local var707, var708, var709 = protoModule.readTag(p25, var705)
		local var710 = var707
		var706 = var708
		var705 = var709
		
		if var706 == protoModule.wireTypes.varint then
			local _ = nil
			local var711, var712 = protoModule.readVarInt(p25, var705)
			local _ = var711
			var705 = var712
			continue
		end
		if var706 == protoModule.wireTypes.lengthDelimited then
			if var710 == 1 then
				local _ = nil
				local var713, var714 = protoModule.readBuffer(p25, var705)
				var705 = var714
				var704.media_asset_id = buffer.tostring(var713)
			elseif var710 == 2 then
				local _ = nil
				local var715, var716 = protoModule.readBuffer(p25, var705)
				var705 = var716
				var704.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.decode(var715)
			elseif var710 == 3 then
				local _ = nil
				local var717, var718 = protoModule.readBuffer(p25, var705)
				var705 = var718
				var704.attribution_user_id = buffer.tostring(var717)
			else
				local _ = nil
				local var719, var720 = protoModule.readVarInt(p25, var705)
				var705 = var720 + var719
			end
		elseif var706 == protoModule.wireTypes.i32 then
			local _ = nil
			local var721, var722 = protoModule.readFixed32(p25, var705)
			local _ = var721
			var705 = var722
		elseif var706 == protoModule.wireTypes.i64 then
			local _ = nil
			local var723, var724 = protoModule.readFixed64(p25, var705)
			local _ = var723
			var705 = var724
		else
			error("Unsupported wire type: " .. var1322)
		end
	end
	return var704
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
	local var725 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var725.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var725.media_asset_id = self.mediaAssetId
	end
	if self.moment_video_playback ~= nil then
		var725.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		var725.moment_video_playback = t.ExperienceMediaGalleryInputData_MediaItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	if self.attribution_user_id ~= nil then
		var725.attribution_user_id = self.attribution_user_id
	end
	if self.attributionUserId ~= nil then
		var725.attribution_user_id = self.attributionUserId
	end
	return var725
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
	local var725 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var726, var727 = protoModule.writeTag(buff, var725, 1, protoModule.wireTypes.lengthDelimited)
		var726, var1346 = protoModule.writeString(var726, var727, self.asset_id)
		buff = var726
		var725 = var727
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local var728, var729 = protoModule.writeTag(buff, var725, 2, protoModule.wireTypes.lengthDelimited)
		var728, var1348 = protoModule.writeString(var728, var729, self.asset_access_context)
		buff = var728
		var725 = var729
	end
	local buff_1 = buffer.create(var725)
	buffer.copy(buff_1, 0, buff, 0, var725)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var725 = t_26.new()
	local var726 = 0
	while var726 < buffer.len(p26) do
		local _ = nil
		local var727 = nil
		local var728, var729, var730 = protoModule.readTag(p26, var726)
		local var731 = var728
		var727 = var729
		var726 = var730
		
		if var727 == protoModule.wireTypes.varint then
			local _ = nil
			local var732, var733 = protoModule.readVarInt(p26, var726)
			local _ = var732
			var726 = var733
			continue
		end
		if var727 == protoModule.wireTypes.lengthDelimited then
			if var731 == 1 then
				local _ = nil
				local var734, var735 = protoModule.readBuffer(p26, var726)
				var726 = var735
				var725.asset_id = buffer.tostring(var734)
			elseif var731 == 2 then
				local _ = nil
				local var736, var737 = protoModule.readBuffer(p26, var726)
				var726 = var737
				var725.asset_access_context = buffer.tostring(var736)
			else
				local _ = nil
				local var738, var739 = protoModule.readVarInt(p26, var726)
				var726 = var739 + var738
			end
		elseif var727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var740, var741 = protoModule.readFixed32(p26, var726)
			local _ = var740
			var726 = var741
		elseif var727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var742, var743 = protoModule.readFixed64(p26, var726)
			local _ = var742
			var726 = var743
		else
			error("Unsupported wire type: " .. var1352)
		end
	end
	return var725
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
	local var744 = t_26.new()
	
	if self.asset_id ~= nil then
		var744.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var744.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		var744.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		var744.asset_access_context = self.assetAccessContext
	end
	return var744
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
	local var744 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var745, var746 = protoModule.writeTag(buff, var744, 1, protoModule.wireTypes.lengthDelimited)
		var745, var1374 = protoModule.writeString(var745, var746, self.universe_id)
		buff = var745
		var744 = var746
	end
	local buff_1 = buffer.create(var744)
	buffer.copy(buff_1, 0, buff, 0, var744)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var744 = t_27.new()
	local var745 = 0
	while var745 < buffer.len(p27) do
		local _ = nil
		local var746 = nil
		local var747, var748, var749 = protoModule.readTag(p27, var745)
		local var750 = var747
		var746 = var748
		var745 = var749
		
		if var746 == protoModule.wireTypes.varint then
			local _ = nil
			local var751, var752 = protoModule.readVarInt(p27, var745)
			local _ = var751
			var745 = var752
			continue
		end
		if var746 == protoModule.wireTypes.lengthDelimited then
			if var750 == 1 then
				local _ = nil
				local var753, var754 = protoModule.readBuffer(p27, var745)
				var745 = var754
				var744.universe_id = buffer.tostring(var753)
			else
				local _ = nil
				local var755, var756 = protoModule.readVarInt(p27, var745)
				var745 = var756 + var755
			end
		elseif var746 == protoModule.wireTypes.i32 then
			local _ = nil
			local var757, var758 = protoModule.readFixed32(p27, var745)
			local _ = var757
			var745 = var758
		elseif var746 == protoModule.wireTypes.i64 then
			local _ = nil
			local var759, var760 = protoModule.readFixed64(p27, var745)
			local _ = var759
			var745 = var760
		else
			error("Unsupported wire type: " .. var1378)
		end
	end
	return var744
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
	local var761 = t_27.new()
	
	if self.universe_id ~= nil then
		var761.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var761.universe_id = self.universeId
	end
	return var761
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
	local var761 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var762, var763 = protoModule.writeTag(buff, var761, 1, protoModule.wireTypes.lengthDelimited)
		var762, var1398 = protoModule.writeString(var762, var763, self.universe_id)
		buff = var762
		var761 = var763
	end
	local buff_1 = buffer.create(var761)
	buffer.copy(buff_1, 0, buff, 0, var761)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var761 = t_28.new()
	local var762 = 0
	while var762 < buffer.len(p28) do
		local _ = nil
		local var763 = nil
		local var764, var765, var766 = protoModule.readTag(p28, var762)
		local var767 = var764
		var763 = var765
		var762 = var766
		
		if var763 == protoModule.wireTypes.varint then
			local _ = nil
			local var768, var769 = protoModule.readVarInt(p28, var762)
			local _ = var768
			var762 = var769
			continue
		end
		if var763 == protoModule.wireTypes.lengthDelimited then
			if var767 == 1 then
				local _ = nil
				local var770, var771 = protoModule.readBuffer(p28, var762)
				var762 = var771
				var761.universe_id = buffer.tostring(var770)
			else
				local _ = nil
				local var772, var773 = protoModule.readVarInt(p28, var762)
				var762 = var773 + var772
			end
		elseif var763 == protoModule.wireTypes.i32 then
			local _ = nil
			local var774, var775 = protoModule.readFixed32(p28, var762)
			local _ = var774
			var762 = var775
		elseif var763 == protoModule.wireTypes.i64 then
			local _ = nil
			local var776, var777 = protoModule.readFixed64(p28, var762)
			local _ = var776
			var762 = var777
		else
			error("Unsupported wire type: " .. var1402)
		end
	end
	return var761
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
	local var778 = t_28.new()
	
	if self.universe_id ~= nil then
		var778.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var778.universe_id = self.universeId
	end
	return var778
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
	local var778 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var779, var780 = protoModule.writeTag(buff, var778, 1, protoModule.wireTypes.lengthDelimited)
		var779, var1422 = protoModule.writeString(var779, var780, self.universe_id)
		buff = var779
		var778 = var780
	end
	if self.has_store_items then
		local var781, var782 = protoModule.writeTag(buff, var778, 2, protoModule.wireTypes.varint)
		var781, var1424 = protoModule.writeVarInt(var781, var782, if self.has_store_items then 1 else 0)
		buff = var781
		var778 = var782
	end
	if self.has_badges then
		local var783, var784 = protoModule.writeTag(buff, var778, 3, protoModule.wireTypes.varint)
		var783, var1426 = protoModule.writeVarInt(var783, var784, if self.has_badges then 1 else 0)
		buff = var783
		var778 = var784
	end
	if self.has_game_passes then
		local var785, var786 = protoModule.writeTag(buff, var778, 4, protoModule.wireTypes.varint)
		var785, var1428 = protoModule.writeVarInt(var785, var786, if self.has_game_passes then 1 else 0)
		buff = var785
		var778 = var786
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var787, var788 = protoModule.writeTag(buff, var778, 5, protoModule.wireTypes.lengthDelimited)
		var787, var1430 = protoModule.writeString(var787, var788, self.community_id)
		buff = var787
		var778 = var788
	end
	local buff_1 = buffer.create(var778)
	buffer.copy(buff_1, 0, buff, 0, var778)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var778 = t_29.new()
	local var779 = 0
	while var779 < buffer.len(p29) do
		local _ = nil
		local var780 = nil
		local var781, var782, var783 = protoModule.readTag(p29, var779)
		local var784 = var781
		var780 = var782
		var779 = var783
		
		if var780 == protoModule.wireTypes.varint then
			if var784 == 2 then
				local _ = nil
				local var785, var786 = protoModule.readVarInt(p29, var779)
				var779 = var786
				var778.has_store_items = var785 ~= 0
			elseif var784 == 3 then
				local _ = nil
				local var787, var788 = protoModule.readVarInt(p29, var779)
				var779 = var788
				var778.has_badges = var787 ~= 0
			elseif var784 == 4 then
				local _ = nil
				local var789, var790 = protoModule.readVarInt(p29, var779)
				var779 = var790
				var778.has_game_passes = var789 ~= 0
			else
				local _ = nil
				local var791, var792 = protoModule.readVarInt(p29, var779)
				local _ = var791
				var779 = var792
			end
		end
		if var780 == protoModule.wireTypes.lengthDelimited then
			if var784 == 1 then
				local _ = nil
				local var793, var794 = protoModule.readBuffer(p29, var779)
				var779 = var794
				var778.universe_id = buffer.tostring(var793)
			elseif var784 == 5 then
				local _ = nil
				local var795, var796 = protoModule.readBuffer(p29, var779)
				var779 = var796
				var778.community_id = buffer.tostring(var795)
			else
				local _ = nil
				local var797, var798 = protoModule.readVarInt(p29, var779)
				var779 = var798 + var797
			end
		elseif var780 == protoModule.wireTypes.i32 then
			local _ = nil
			local var799, var800 = protoModule.readFixed32(p29, var779)
			local _ = var799
			var779 = var800
		elseif var780 == protoModule.wireTypes.i64 then
			local _ = nil
			local var801, var802 = protoModule.readFixed64(p29, var779)
			local _ = var801
			var779 = var802
		else
			error("Unsupported wire type: " .. var1434)
		end
	end
	return var778
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
	local var803 = t_29.new()
	
	if self.universe_id ~= nil then
		var803.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var803.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var803.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var803.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var803.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var803.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var803.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var803.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var803.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var803.community_id = self.communityId
	end
	return var803
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
	local var803 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var804, var805 = protoModule.writeTag(buff, var803, 1, protoModule.wireTypes.lengthDelimited)
		var804, var1462 = protoModule.writeString(var804, var805, self.universe_id)
		buff = var804
		var803 = var805
	end
	local buff_1 = buffer.create(var803)
	buffer.copy(buff_1, 0, buff, 0, var803)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var803 = t_30.new()
	local var804 = 0
	while var804 < buffer.len(p30) do
		local _ = nil
		local var805 = nil
		local var806, var807, var808 = protoModule.readTag(p30, var804)
		local var809 = var806
		var805 = var807
		var804 = var808
		
		if var805 == protoModule.wireTypes.varint then
			local _ = nil
			local var810, var811 = protoModule.readVarInt(p30, var804)
			local _ = var810
			var804 = var811
			continue
		end
		if var805 == protoModule.wireTypes.lengthDelimited then
			if var809 == 1 then
				local _ = nil
				local var812, var813 = protoModule.readBuffer(p30, var804)
				var804 = var813
				var803.universe_id = buffer.tostring(var812)
			else
				local _ = nil
				local var814, var815 = protoModule.readVarInt(p30, var804)
				var804 = var815 + var814
			end
		elseif var805 == protoModule.wireTypes.i32 then
			local _ = nil
			local var816, var817 = protoModule.readFixed32(p30, var804)
			local _ = var816
			var804 = var817
		elseif var805 == protoModule.wireTypes.i64 then
			local _ = nil
			local var818, var819 = protoModule.readFixed64(p30, var804)
			local _ = var818
			var804 = var819
		else
			error("Unsupported wire type: " .. var1466)
		end
	end
	return var803
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
	local var820 = t_30.new()
	
	if self.universe_id ~= nil then
		var820.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var820.universe_id = self.universeId
	end
	return var820
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
	local var820 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var821, var822 = protoModule.writeTag(buff, var820, 1, protoModule.wireTypes.lengthDelimited)
		var821, var1486 = protoModule.writeString(var821, var822, self.universe_id)
		buff = var821
		var820 = var822
	end
	if self.user_owns_experience then
		local var823, var824 = protoModule.writeTag(buff, var820, 2, protoModule.wireTypes.varint)
		var823, var1488 = protoModule.writeVarInt(var823, var824, if self.user_owns_experience then 1 else 0)
		buff = var823
		var820 = var824
	end
	local buff_1 = buffer.create(var820)
	buffer.copy(buff_1, 0, buff, 0, var820)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var820 = t_31.new()
	local var821 = 0
	while var821 < buffer.len(p31) do
		local _ = nil
		local var822 = nil
		local var823, var824, var825 = protoModule.readTag(p31, var821)
		local var826 = var823
		var822 = var824
		var821 = var825
		
		if var822 == protoModule.wireTypes.varint then
			if var826 == 2 then
				local _ = nil
				local var827, var828 = protoModule.readVarInt(p31, var821)
				var821 = var828
				var820.user_owns_experience = var827 ~= 0
			else
				local _ = nil
				local var829, var830 = protoModule.readVarInt(p31, var821)
				local _ = var829
				var821 = var830
			end
		end
		if var822 == protoModule.wireTypes.lengthDelimited then
			if var826 == 1 then
				local _ = nil
				local var831, var832 = protoModule.readBuffer(p31, var821)
				var821 = var832
				var820.universe_id = buffer.tostring(var831)
			else
				local _ = nil
				local var833, var834 = protoModule.readVarInt(p31, var821)
				var821 = var834 + var833
			end
		elseif var822 == protoModule.wireTypes.i32 then
			local _ = nil
			local var835, var836 = protoModule.readFixed32(p31, var821)
			local _ = var835
			var821 = var836
		elseif var822 == protoModule.wireTypes.i64 then
			local _ = nil
			local var837, var838 = protoModule.readFixed64(p31, var821)
			local _ = var837
			var821 = var838
		else
			error("Unsupported wire type: " .. var1492)
		end
	end
	return var820
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
	local var839 = t_31.new()
	
	if self.universe_id ~= nil then
		var839.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var839.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var839.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var839.user_owns_experience = self.userOwnsExperience
	end
	return var839
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
	local var839 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var840, var841 = protoModule.writeTag(buff, var839, 1, protoModule.wireTypes.lengthDelimited)
		var840, var1514 = protoModule.writeString(var840, var841, self.universe_id)
		buff = var840
		var839 = var841
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var842, var843 = protoModule.writeTag(buff, var839, 2, protoModule.wireTypes.lengthDelimited)
		var842, var1516 = protoModule.writeString(var842, var843, self.place_id)
		buff = var842
		var839 = var843
	end
	if self.product_id ~= nil and self.product_id ~= "" then
		local var844, var845 = protoModule.writeTag(buff, var839, 3, protoModule.wireTypes.lengthDelimited)
		var844, var1518 = protoModule.writeString(var844, var845, self.product_id)
		buff = var844
		var839 = var845
	end
	if self.product_image_asset_id ~= nil and self.product_image_asset_id ~= "" then
		local var846, var847 = protoModule.writeTag(buff, var839, 4, protoModule.wireTypes.lengthDelimited)
		var846, var1520 = protoModule.writeString(var846, var847, self.product_image_asset_id)
		buff = var846
		var839 = var847
	end
	if self.product_name ~= nil and self.product_name ~= "" then
		local var848, var849 = protoModule.writeTag(buff, var839, 5, protoModule.wireTypes.lengthDelimited)
		var848, var1522 = protoModule.writeString(var848, var849, self.product_name)
		buff = var848
		var839 = var849
	end
	if self.variant_id ~= nil and self.variant_id ~= "" then
		local var850, var851 = protoModule.writeTag(buff, var839, 6, protoModule.wireTypes.lengthDelimited)
		var850, var1524 = protoModule.writeString(var850, var851, self.variant_id)
		buff = var850
		var839 = var851
	end
	local buff_1 = buffer.create(var839)
	buffer.copy(buff_1, 0, buff, 0, var839)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var839 = t_32.new()
	local var840 = 0
	while var840 < buffer.len(p32) do
		local _ = nil
		local var841 = nil
		local var842, var843, var844 = protoModule.readTag(p32, var840)
		local var845 = var842
		var841 = var843
		var840 = var844
		
		if var841 == protoModule.wireTypes.varint then
			local _ = nil
			local var846, var847 = protoModule.readVarInt(p32, var840)
			local _ = var846
			var840 = var847
			continue
		end
		if var841 == protoModule.wireTypes.lengthDelimited then
			if var845 == 1 then
				local _ = nil
				local var848, var849 = protoModule.readBuffer(p32, var840)
				var840 = var849
				var839.universe_id = buffer.tostring(var848)
			elseif var845 == 2 then
				local _ = nil
				local var850, var851 = protoModule.readBuffer(p32, var840)
				var840 = var851
				var839.place_id = buffer.tostring(var850)
			elseif var845 == 3 then
				local _ = nil
				local var852, var853 = protoModule.readBuffer(p32, var840)
				var840 = var853
				var839.product_id = buffer.tostring(var852)
			elseif var845 == 4 then
				local _ = nil
				local var854, var855 = protoModule.readBuffer(p32, var840)
				var840 = var855
				var839.product_image_asset_id = buffer.tostring(var854)
			elseif var845 == 5 then
				local _ = nil
				local var856, var857 = protoModule.readBuffer(p32, var840)
				var840 = var857
				var839.product_name = buffer.tostring(var856)
			elseif var845 == 6 then
				local _ = nil
				local var858, var859 = protoModule.readBuffer(p32, var840)
				var840 = var859
				var839.variant_id = buffer.tostring(var858)
			else
				local _ = nil
				local var860, var861 = protoModule.readVarInt(p32, var840)
				var840 = var861 + var860
			end
		elseif var841 == protoModule.wireTypes.i32 then
			local _ = nil
			local var862, var863 = protoModule.readFixed32(p32, var840)
			local _ = var862
			var840 = var863
		elseif var841 == protoModule.wireTypes.i64 then
			local _ = nil
			local var864, var865 = protoModule.readFixed64(p32, var840)
			local _ = var864
			var840 = var865
		else
			error("Unsupported wire type: " .. var1528)
		end
	end
	return var839
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
	local var866 = t_32.new()
	
	if self.universe_id ~= nil then
		var866.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var866.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var866.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var866.place_id = self.placeId
	end
	if self.product_id ~= nil then
		var866.product_id = self.product_id
	end
	if self.productId ~= nil then
		var866.product_id = self.productId
	end
	if self.product_image_asset_id ~= nil then
		var866.product_image_asset_id = self.product_image_asset_id
	end
	if self.productImageAssetId ~= nil then
		var866.product_image_asset_id = self.productImageAssetId
	end
	if self.product_name ~= nil then
		var866.product_name = self.product_name
	end
	if self.productName ~= nil then
		var866.product_name = self.productName
	end
	if self.variant_id ~= nil then
		var866.variant_id = self.variant_id
	end
	if self.variantId ~= nil then
		var866.variant_id = self.variantId
	end
	return var866
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
	local var866 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var867, var868 = protoModule.writeTag(buff, var866, 1, protoModule.wireTypes.lengthDelimited)
		var867, var1558 = protoModule.writeString(var867, var868, self.community_id)
		buff = var867
		var866 = var868
	end
	local buff_1 = buffer.create(var866)
	buffer.copy(buff_1, 0, buff, 0, var866)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref)
	local var866 = t_33.new()
	local var867 = 0
	while var867 < buffer.len(p33) do
		local _ = nil
		local var868 = nil
		local var869, var870, var871 = protoModule.readTag(p33, var867)
		local var872 = var869
		var868 = var870
		var867 = var871
		
		if var868 == protoModule.wireTypes.varint then
			local _ = nil
			local var873, var874 = protoModule.readVarInt(p33, var867)
			local _ = var873
			var867 = var874
			continue
		end
		if var868 == protoModule.wireTypes.lengthDelimited then
			if var872 == 1 then
				local _ = nil
				local var875, var876 = protoModule.readBuffer(p33, var867)
				var867 = var876
				var866.community_id = buffer.tostring(var875)
			else
				local _ = nil
				local var877, var878 = protoModule.readVarInt(p33, var867)
				var867 = var878 + var877
			end
		elseif var868 == protoModule.wireTypes.i32 then
			local _ = nil
			local var879, var880 = protoModule.readFixed32(p33, var867)
			local _ = var879
			var867 = var880
		elseif var868 == protoModule.wireTypes.i64 then
			local _ = nil
			local var881, var882 = protoModule.readFixed64(p33, var867)
			local _ = var881
			var867 = var882
		else
			error("Unsupported wire type: " .. var1562)
		end
	end
	return var866
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
	local var883 = t_33.new()
	
	if self.community_id ~= nil then
		var883.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var883.community_id = self.communityId
	end
	return var883
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
		universe_id = if p34 == nil or p34.universe_id == nil then "" else p34.universe_id,
		friend_users = if p34 == nil or p34.friend_users == nil then {} else p34.friend_users,
		global_users = if p34 == nil or p34.global_users == nil then {} else p34.global_users,
		show_invite_view = if p34 == nil or p34.show_invite_view == nil then false else p34.show_invite_view,
		num_friends = if p34 == nil or p34.num_friends == nil then 0 else p34.num_friends,
		global_next_cursor = if p34 == nil or p34.global_next_cursor == nil then "" else p34.global_next_cursor,
		friends_next_cursor = if p34 == nil or p34.friends_next_cursor == nil then "" else p34.friends_next_cursor,
		initial_tab = if p34 == nil or p34.initial_tab == nil then "" else p34.initial_tab,
		current_user = if p34 == nil or p34.current_user == nil then nil else p34.current_user,
		score_unit = if p34 == nil or p34.score_unit == nil then "" else p34.score_unit
	}, t_34)
end

function t_34:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var883 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var884, var885 = protoModule.writeTag(buff, var883, 1, protoModule.wireTypes.lengthDelimited)
		var884, var1582 = protoModule.writeString(var884, var885, self.universe_id)
		buff = var884
		var883 = var885
	end
	if self.friend_users ~= nil and #self.friend_users > 0 then
		for i, v in self.friend_users do
			local var886 = v:encode()
			local var887, var888 = protoModule.writeTag(buff, var883, 2, protoModule.wireTypes.lengthDelimited)
			var887, var1585 = protoModule.writeBuffer(var887, var888, var886, buffer.len(var886))
			buff = var887
			var883 = var888
		end
	end
	if self.global_users ~= nil and #self.global_users > 0 then
		for i, v in self.global_users do
			local var889 = v:encode()
			local var890, var891 = protoModule.writeTag(buff, var883, 3, protoModule.wireTypes.lengthDelimited)
			var890, var1588 = protoModule.writeBuffer(var890, var891, var889, buffer.len(var889))
			buff = var890
			var883 = var891
		end
	end
	if self.show_invite_view then
		local var892, var893 = protoModule.writeTag(buff, var883, 4, protoModule.wireTypes.varint)
		var892, var1590 = protoModule.writeVarInt(var892, var893, if self.show_invite_view then 1 else 0)
		buff = var892
		var883 = var893
	end
	if self.num_friends ~= nil and self.num_friends ~= 0 then
		local var894, var895 = protoModule.writeTag(buff, var883, 6, protoModule.wireTypes.varint)
		var894, var1592 = protoModule.writeVarInt(var894, var895, self.num_friends)
		buff = var894
		var883 = var895
	end
	if self.global_next_cursor ~= nil and self.global_next_cursor ~= "" then
		local var896, var897 = protoModule.writeTag(buff, var883, 7, protoModule.wireTypes.lengthDelimited)
		var896, var1594 = protoModule.writeString(var896, var897, self.global_next_cursor)
		buff = var896
		var883 = var897
	end
	if self.friends_next_cursor ~= nil and self.friends_next_cursor ~= "" then
		local var898, var899 = protoModule.writeTag(buff, var883, 8, protoModule.wireTypes.lengthDelimited)
		var898, var1596 = protoModule.writeString(var898, var899, self.friends_next_cursor)
		buff = var898
		var883 = var899
	end
	if self.initial_tab ~= nil and self.initial_tab ~= "" then
		local var900, var901 = protoModule.writeTag(buff, var883, 9, protoModule.wireTypes.lengthDelimited)
		var900, var1598 = protoModule.writeString(var900, var901, self.initial_tab)
		buff = var900
		var883 = var901
	end
	if self.current_user ~= nil then
		local var902 = self.current_user:encode()
		local var903, var904 = protoModule.writeTag(buff, var883, 10, protoModule.wireTypes.lengthDelimited)
		var903, var1601 = protoModule.writeBuffer(var903, var904, var902, buffer.len(var902))
		buff = var903
		var883 = var904
	end
	if self.score_unit ~= nil and self.score_unit ~= "" then
		local var905, var906 = protoModule.writeTag(buff, var883, 11, protoModule.wireTypes.lengthDelimited)
		var905, var1603 = protoModule.writeString(var905, var906, self.score_unit)
		buff = var905
		var883 = var906
	end
	local buff_1 = buffer.create(var883)
	buffer.copy(buff_1, 0, buff, 0, var883)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var907 = t_34.new()
	local var908 = 0
	while var908 < buffer.len(p34) do
		local _ = nil
		local var909 = nil
		local var910, var911, var912 = protoModule.readTag(p34, var908)
		local var913 = var910
		var909 = var911
		var908 = var912
		
		if var909 == protoModule.wireTypes.varint then
			if var913 == 4 then
				local _ = nil
				local var914, var915 = protoModule.readVarInt(p34, var908)
				var908 = var915
				var907.show_invite_view = var914 ~= 0
			elseif var913 == 6 then
				local _ = nil
				local var916, var917 = protoModule.readVarIntI32(p34, var908)
				var908 = var917
				var907.num_friends = var916
			else
				local _ = nil
				local var918, var919 = protoModule.readVarInt(p34, var908)
				local _ = var918
				var908 = var919
			end
		end
		if var909 == protoModule.wireTypes.lengthDelimited then
			if var913 == 1 then
				local _ = nil
				local var920, var921 = protoModule.readBuffer(p34, var908)
				var908 = var921
				var907.universe_id = buffer.tostring(var920)
			elseif var913 == 2 then
				local _ = nil
				local var922, var923 = protoModule.readBuffer(p34, var908)
				var908 = var923
				table.insert(var907.friend_users, t.ExperienceLeaderboardInputData_UserItem.decode(var922))
			elseif var913 == 3 then
				local _ = nil
				local var924, var925 = protoModule.readBuffer(p34, var908)
				var908 = var925
				table.insert(var907.global_users, t.ExperienceLeaderboardInputData_UserItem.decode(var924))
			elseif var913 == 7 then
				local _ = nil
				local var926, var927 = protoModule.readBuffer(p34, var908)
				var908 = var927
				var907.global_next_cursor = buffer.tostring(var926)
			elseif var913 == 8 then
				local _ = nil
				local var928, var929 = protoModule.readBuffer(p34, var908)
				var908 = var929
				var907.friends_next_cursor = buffer.tostring(var928)
			elseif var913 == 9 then
				local _ = nil
				local var930, var931 = protoModule.readBuffer(p34, var908)
				var908 = var931
				var907.initial_tab = buffer.tostring(var930)
			elseif var913 == 10 then
				local _ = nil
				local var932, var933 = protoModule.readBuffer(p34, var908)
				var908 = var933
				var907.current_user = t.ExperienceLeaderboardInputData_CurrentUserItem.decode(var932)
			elseif var913 == 11 then
				local _ = nil
				local var934, var935 = protoModule.readBuffer(p34, var908)
				var908 = var935
				var907.score_unit = buffer.tostring(var934)
			else
				local _ = nil
				local var936, var937 = protoModule.readVarInt(p34, var908)
				var908 = var937 + var936
			end
		elseif var909 == protoModule.wireTypes.i32 then
			local _ = nil
			local var938, var939 = protoModule.readFixed32(p34, var908)
			local _ = var938
			var908 = var939
		elseif var909 == protoModule.wireTypes.i64 then
			local _ = nil
			local var940, var941 = protoModule.readFixed64(p34, var908)
			local _ = var940
			var908 = var941
		else
			error("Unsupported wire type: " .. var1607)
		end
	end
	return var907
end

function t_34:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.friend_users ~= nil and #self.friend_users > 0 then
		local t_1 = {}
		
		for i, v in self.friend_users do
			table.insert(t_1, v:jsonEncode())
		end
		t.friendUsers = t_1
	end
	if self.global_users ~= nil and #self.global_users > 0 then
		local t_1 = {}
		
		for i, v in self.global_users do
			table.insert(t_1, v:jsonEncode())
		end
		t.globalUsers = t_1
	end
	if self.show_invite_view then
		t.showInviteView = self.show_invite_view
	end
	if self.num_friends ~= nil and self.num_friends ~= 0 then
		t.numFriends = self.num_friends
	end
	if self.global_next_cursor ~= nil and self.global_next_cursor ~= "" then
		t.globalNextCursor = self.global_next_cursor
	end
	if self.friends_next_cursor ~= nil and self.friends_next_cursor ~= "" then
		t.friendsNextCursor = self.friends_next_cursor
	end
	if self.initial_tab ~= nil and self.initial_tab ~= "" then
		t.initialTab = self.initial_tab
	end
	if self.current_user ~= nil then
		t.currentUser = self.current_user:jsonEncode()
	end
	if self.score_unit ~= nil and self.score_unit ~= "" then
		t.scoreUnit = self.score_unit
	end
	return t
end

function t_34:jsonDecode()
	-- upvalues: t_34 (ref), t (ref)
	local var942 = t_34.new()
	
	if self.universe_id ~= nil then
		var942.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var942.universe_id = self.universeId
	end
	if self.friend_users ~= nil then
		local t_1 = {}
		
		for i, v in self.friend_users do
			table.insert(t_1, t.ExperienceLeaderboardInputData_UserItem.jsonDecode(v))
		end
		var942.friend_users = t_1
	end
	if self.friendUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.friendUsers do
			table.insert(t_1, t.ExperienceLeaderboardInputData_UserItem.jsonDecode(v))
		end
		var942.friend_users = t_1
	end
	if self.global_users ~= nil then
		local t_1 = {}
		
		for i, v in self.global_users do
			table.insert(t_1, t.ExperienceLeaderboardInputData_UserItem.jsonDecode(v))
		end
		var942.global_users = t_1
	end
	if self.globalUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.globalUsers do
			table.insert(t_1, t.ExperienceLeaderboardInputData_UserItem.jsonDecode(v))
		end
		var942.global_users = t_1
	end
	if self.show_invite_view ~= nil then
		var942.show_invite_view = self.show_invite_view
	end
	if self.showInviteView ~= nil then
		var942.show_invite_view = self.showInviteView
	end
	if self.num_friends ~= nil then
		var942.num_friends = self.num_friends
	end
	if self.numFriends ~= nil then
		var942.num_friends = self.numFriends
	end
	if self.global_next_cursor ~= nil then
		var942.global_next_cursor = self.global_next_cursor
	end
	if self.globalNextCursor ~= nil then
		var942.global_next_cursor = self.globalNextCursor
	end
	if self.friends_next_cursor ~= nil then
		var942.friends_next_cursor = self.friends_next_cursor
	end
	if self.friendsNextCursor ~= nil then
		var942.friends_next_cursor = self.friendsNextCursor
	end
	if self.initial_tab ~= nil then
		var942.initial_tab = self.initial_tab
	end
	if self.initialTab ~= nil then
		var942.initial_tab = self.initialTab
	end
	if self.current_user ~= nil then
		var942.current_user = t.ExperienceLeaderboardInputData_CurrentUserItem.jsonDecode(self.current_user)
	end
	if self.currentUser ~= nil then
		var942.current_user = t.ExperienceLeaderboardInputData_CurrentUserItem.jsonDecode(self.currentUser)
	end
	if self.score_unit ~= nil then
		var942.score_unit = self.score_unit
	end
	if self.scoreUnit ~= nil then
		var942.score_unit = self.scoreUnit
	end
	return var942
end

t_34.descriptor = {
	name = "ExperienceLeaderboardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceLeaderboardInputData"
}
t.ExperienceLeaderboardInputData = t_34
typeRegistryModule.default:register(t.ExperienceLeaderboardInputData)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p35)
	-- upvalues: t_35 (ref)
	return setmetatable({
		user_id = if p35 == nil or p35.user_id == nil then "" else p35.user_id,
		stats_id = if p35 == nil or p35.stats_id == nil then "" else p35.stats_id
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var943 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var944, var945 = protoModule.writeTag(buff, var943, 1, protoModule.wireTypes.lengthDelimited)
		var944, var1651 = protoModule.writeString(var944, var945, self.user_id)
		buff = var944
		var943 = var945
	end
	if self.stats_id ~= nil and self.stats_id ~= "" then
		local var946, var947 = protoModule.writeTag(buff, var943, 2, protoModule.wireTypes.lengthDelimited)
		var946, var1653 = protoModule.writeString(var946, var947, self.stats_id)
		buff = var946
		var943 = var947
	end
	local buff_1 = buffer.create(var943)
	buffer.copy(buff_1, 0, buff, 0, var943)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref)
	local var943 = t_35.new()
	local var944 = 0
	while var944 < buffer.len(p35) do
		local _ = nil
		local var945 = nil
		local var946, var947, var948 = protoModule.readTag(p35, var944)
		local var949 = var946
		var945 = var947
		var944 = var948
		
		if var945 == protoModule.wireTypes.varint then
			local _ = nil
			local var950, var951 = protoModule.readVarInt(p35, var944)
			local _ = var950
			var944 = var951
			continue
		end
		if var945 == protoModule.wireTypes.lengthDelimited then
			if var949 == 1 then
				local _ = nil
				local var952, var953 = protoModule.readBuffer(p35, var944)
				var944 = var953
				var943.user_id = buffer.tostring(var952)
			elseif var949 == 2 then
				local _ = nil
				local var954, var955 = protoModule.readBuffer(p35, var944)
				var944 = var955
				var943.stats_id = buffer.tostring(var954)
			else
				local _ = nil
				local var956, var957 = protoModule.readVarInt(p35, var944)
				var944 = var957 + var956
			end
		elseif var945 == protoModule.wireTypes.i32 then
			local _ = nil
			local var958, var959 = protoModule.readFixed32(p35, var944)
			local _ = var958
			var944 = var959
		elseif var945 == protoModule.wireTypes.i64 then
			local _ = nil
			local var960, var961 = protoModule.readFixed64(p35, var944)
			local _ = var960
			var944 = var961
		else
			error("Unsupported wire type: " .. var1657)
		end
	end
	return var943
end

function t_35:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.stats_id ~= nil and self.stats_id ~= "" then
		t.statsId = self.stats_id
	end
	return t
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref)
	local var962 = t_35.new()
	
	if self.user_id ~= nil then
		var962.user_id = self.user_id
	end
	if self.userId ~= nil then
		var962.user_id = self.userId
	end
	if self.stats_id ~= nil then
		var962.stats_id = self.stats_id
	end
	if self.statsId ~= nil then
		var962.stats_id = self.statsId
	end
	return var962
end

t_35.descriptor = {
	name = "ExperienceLeaderboardInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.ExperienceLeaderboardInputData_UserItem = t_35
typeRegistryModule.default:register(t.ExperienceLeaderboardInputData_UserItem)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p36)
	-- upvalues: t_36 (ref)
	return setmetatable({
		user_id = if p36 == nil or p36.user_id == nil then "" else p36.user_id,
		friends_stats_id = if p36 == nil or p36.friends_stats_id == nil then "" else p36.friends_stats_id,
		global_stats_id = if p36 == nil or p36.global_stats_id == nil then "" else p36.global_stats_id
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var962 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var963, var964 = protoModule.writeTag(buff, var962, 1, protoModule.wireTypes.lengthDelimited)
		var963, var1679 = protoModule.writeString(var963, var964, self.user_id)
		buff = var963
		var962 = var964
	end
	if self.friends_stats_id ~= nil and self.friends_stats_id ~= "" then
		local var965, var966 = protoModule.writeTag(buff, var962, 2, protoModule.wireTypes.lengthDelimited)
		var965, var1681 = protoModule.writeString(var965, var966, self.friends_stats_id)
		buff = var965
		var962 = var966
	end
	if self.global_stats_id ~= nil and self.global_stats_id ~= "" then
		local var967, var968 = protoModule.writeTag(buff, var962, 3, protoModule.wireTypes.lengthDelimited)
		var967, var1683 = protoModule.writeString(var967, var968, self.global_stats_id)
		buff = var967
		var962 = var968
	end
	local buff_1 = buffer.create(var962)
	buffer.copy(buff_1, 0, buff, 0, var962)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref)
	local var962 = t_36.new()
	local var963 = 0
	while var963 < buffer.len(p36) do
		local _ = nil
		local var964 = nil
		local var965, var966, var967 = protoModule.readTag(p36, var963)
		local var968 = var965
		var964 = var966
		var963 = var967
		
		if var964 == protoModule.wireTypes.varint then
			local _ = nil
			local var969, var970 = protoModule.readVarInt(p36, var963)
			local _ = var969
			var963 = var970
			continue
		end
		if var964 == protoModule.wireTypes.lengthDelimited then
			if var968 == 1 then
				local _ = nil
				local var971, var972 = protoModule.readBuffer(p36, var963)
				var963 = var972
				var962.user_id = buffer.tostring(var971)
			elseif var968 == 2 then
				local _ = nil
				local var973, var974 = protoModule.readBuffer(p36, var963)
				var963 = var974
				var962.friends_stats_id = buffer.tostring(var973)
			elseif var968 == 3 then
				local _ = nil
				local var975, var976 = protoModule.readBuffer(p36, var963)
				var963 = var976
				var962.global_stats_id = buffer.tostring(var975)
			else
				local _ = nil
				local var977, var978 = protoModule.readVarInt(p36, var963)
				var963 = var978 + var977
			end
		elseif var964 == protoModule.wireTypes.i32 then
			local _ = nil
			local var979, var980 = protoModule.readFixed32(p36, var963)
			local _ = var979
			var963 = var980
		elseif var964 == protoModule.wireTypes.i64 then
			local _ = nil
			local var981, var982 = protoModule.readFixed64(p36, var963)
			local _ = var981
			var963 = var982
		else
			error("Unsupported wire type: " .. var1687)
		end
	end
	return var962
end

function t_36:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.friends_stats_id ~= nil and self.friends_stats_id ~= "" then
		t.friendsStatsId = self.friends_stats_id
	end
	if self.global_stats_id ~= nil and self.global_stats_id ~= "" then
		t.globalStatsId = self.global_stats_id
	end
	return t
end

function t_36:jsonDecode()
	-- upvalues: t_36 (ref)
	local var983 = t_36.new()
	
	if self.user_id ~= nil then
		var983.user_id = self.user_id
	end
	if self.userId ~= nil then
		var983.user_id = self.userId
	end
	if self.friends_stats_id ~= nil then
		var983.friends_stats_id = self.friends_stats_id
	end
	if self.friendsStatsId ~= nil then
		var983.friends_stats_id = self.friendsStatsId
	end
	if self.global_stats_id ~= nil then
		var983.global_stats_id = self.global_stats_id
	end
	if self.globalStatsId ~= nil then
		var983.global_stats_id = self.globalStatsId
	end
	return var983
end

t_36.descriptor = {
	name = "ExperienceLeaderboardInputData_CurrentUserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CurrentUserItem"
}
t.ExperienceLeaderboardInputData_CurrentUserItem = t_36
typeRegistryModule.default:register(t.ExperienceLeaderboardInputData_CurrentUserItem)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p37)
	-- upvalues: t_37 (ref)
	return setmetatable({
		social_link_items = if p37 == nil or p37.social_link_items == nil then {} else p37.social_link_items
	}, t_37)
end

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var983 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var984 = v:encode()
			local var985, var986 = protoModule.writeTag(buff, var983, 1, protoModule.wireTypes.lengthDelimited)
			var985, var1712 = protoModule.writeBuffer(var985, var986, var984, buffer.len(var984))
			buff = var985
			var983 = var986
		end
	end
	local buff_1 = buffer.create(var983)
	buffer.copy(buff_1, 0, buff, 0, var983)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var987 = t_37.new()
	local var988 = 0
	while var988 < buffer.len(p37) do
		local _ = nil
		local var989 = nil
		local var990, var991, var992 = protoModule.readTag(p37, var988)
		local var993 = var990
		var989 = var991
		var988 = var992
		
		if var989 == protoModule.wireTypes.varint then
			local _ = nil
			local var994, var995 = protoModule.readVarInt(p37, var988)
			local _ = var994
			var988 = var995
			continue
		end
		if var989 == protoModule.wireTypes.lengthDelimited then
			if var993 == 1 then
				local _ = nil
				local var996, var997 = protoModule.readBuffer(p37, var988)
				var988 = var997
				table.insert(var987.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var996))
			else
				local _ = nil
				local var998, var999 = protoModule.readVarInt(p37, var988)
				var988 = var999 + var998
			end
		elseif var989 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1000, var1001 = protoModule.readFixed32(p37, var988)
			local _ = var1000
			var988 = var1001
		elseif var989 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1002, var1003 = protoModule.readFixed64(p37, var988)
			local _ = var1002
			var988 = var1003
		else
			error("Unsupported wire type: " .. var1716)
		end
	end
	return var987
end

function t_37:jsonEncode()
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

function t_37:jsonDecode()
	-- upvalues: t_37 (ref), t (ref)
	local var1004 = t_37.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1004.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1004.social_link_items = t_1
	end
	return var1004
end

t_37.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_37
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p38)
	-- upvalues: t_38 (ref)
	return setmetatable({
		social_link_id = if p38 == nil or p38.social_link_id == nil then "" else p38.social_link_id
	}, t_38)
end

function t_38:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1005 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var1006, var1007 = protoModule.writeTag(buff, var1005, 1, protoModule.wireTypes.lengthDelimited)
		var1006, var1739 = protoModule.writeString(var1006, var1007, self.social_link_id)
		buff = var1006
		var1005 = var1007
	end
	local buff_1 = buffer.create(var1005)
	buffer.copy(buff_1, 0, buff, 0, var1005)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1005 = t_38.new()
	local var1006 = 0
	while var1006 < buffer.len(p38) do
		local _ = nil
		local var1007 = nil
		local var1008, var1009, var1010 = protoModule.readTag(p38, var1006)
		local var1011 = var1008
		var1007 = var1009
		var1006 = var1010
		
		if var1007 == protoModule.wireTypes.varint then
			local _ = nil
			local var1012, var1013 = protoModule.readVarInt(p38, var1006)
			local _ = var1012
			var1006 = var1013
			continue
		end
		if var1007 == protoModule.wireTypes.lengthDelimited then
			if var1011 == 1 then
				local _ = nil
				local var1014, var1015 = protoModule.readBuffer(p38, var1006)
				var1006 = var1015
				var1005.social_link_id = buffer.tostring(var1014)
			else
				local _ = nil
				local var1016, var1017 = protoModule.readVarInt(p38, var1006)
				var1006 = var1017 + var1016
			end
		elseif var1007 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1018, var1019 = protoModule.readFixed32(p38, var1006)
			local _ = var1018
			var1006 = var1019
		elseif var1007 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1020, var1021 = protoModule.readFixed64(p38, var1006)
			local _ = var1020
			var1006 = var1021
		else
			error("Unsupported wire type: " .. var1743)
		end
	end
	return var1005
end

function t_38:jsonEncode()
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function t_38:jsonDecode()
	-- upvalues: t_38 (ref)
	local var1022 = t_38.new()
	
	if self.social_link_id ~= nil then
		var1022.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var1022.social_link_id = self.socialLinkId
	end
	return var1022
end

t_38.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_38
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p39)
	-- upvalues: t_39 (ref)
	return setmetatable({
		title = if p39 == nil or p39.title == nil then "" else p39.title,
		universe_items = if p39 == nil or p39.universe_items == nil then {} else p39.universe_items,
		next_page_token = if p39 == nil or p39.next_page_token == nil then "" else p39.next_page_token,
		sort_id = if p39 == nil or p39.sort_id == nil then "" else p39.sort_id,
		secondary_sort_id = if p39 == nil or p39.secondary_sort_id == nil then 0 else p39.secondary_sort_id,
		max_visible_rows = if p39 == nil or p39.max_visible_rows == nil then 0 else p39.max_visible_rows,
		subtitle = if p39 == nil or p39.subtitle == nil then "" else p39.subtitle,
		info_text = if p39 == nil or p39.info_text == nil then "" else p39.info_text,
		subtitle_link_path = if p39 == nil or p39.subtitle_link_path == nil then "" else p39.subtitle_link_path,
		is_placeholder = if p39 == nil or p39.is_placeholder == nil then nil else p39.is_placeholder,
		primary_sort_id = if p39 == nil or p39.primary_sort_id == nil then nil else p39.primary_sort_id,
		applied_filters = if p39 == nil or p39.applied_filters == nil then nil else p39.applied_filters,
		pool_id = if p39 == nil or p39.pool_id == nil then nil else p39.pool_id,
		has_emphasized_tile = if p39 == nil or p39.has_emphasized_tile == nil then false else p39.has_emphasized_tile,
		tile_activation_mode = if p39 == nil or p39.tile_activation_mode == nil then "" else p39.tile_activation_mode,
		initial_feed_visible_rows = if p39 == nil or p39.initial_feed_visible_rows == nil then nil else p39.initial_feed_visible_rows,
		visible_rows_per_reveal = if p39 == nil or p39.visible_rows_per_reveal == nil then nil else p39.visible_rows_per_reveal,
		sponsored_user_cohort = if p39 == nil or p39.sponsored_user_cohort == nil then nil else p39.sponsored_user_cohort,
		anchor_tag = if p39 == nil or p39.anchor_tag == nil then nil else p39.anchor_tag,
		collection_item_size = if p39 == nil or p39.collection_item_size == nil then nil else p39.collection_item_size,
		sort_sub_id = if p39 == nil or p39.sort_sub_id == nil then nil else p39.sort_sub_id,
		enable_game_tile_videos = if p39 == nil or p39.enable_game_tile_videos == nil then false else p39.enable_game_tile_videos,
		continues_previous_section = if p39 == nil or p39.continues_previous_section == nil then nil else p39.continues_previous_section
	}, t_39)
end

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1022 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1023, var1024 = protoModule.writeTag(buff, var1022, 1, protoModule.wireTypes.lengthDelimited)
		var1023, var1763 = protoModule.writeString(var1023, var1024, self.title)
		buff = var1023
		var1022 = var1024
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var1025 = v:encode()
			local var1026, var1027 = protoModule.writeTag(buff, var1022, 2, protoModule.wireTypes.lengthDelimited)
			var1026, var1766 = protoModule.writeBuffer(var1026, var1027, var1025, buffer.len(var1025))
			buff = var1026
			var1022 = var1027
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1028, var1029 = protoModule.writeTag(buff, var1022, 3, protoModule.wireTypes.lengthDelimited)
		var1028, var1768 = protoModule.writeString(var1028, var1029, self.next_page_token)
		buff = var1028
		var1022 = var1029
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1030, var1031 = protoModule.writeTag(buff, var1022, 4, protoModule.wireTypes.lengthDelimited)
		var1030, var1770 = protoModule.writeString(var1030, var1031, self.sort_id)
		buff = var1030
		var1022 = var1031
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1032, var1033 = protoModule.writeTag(buff, var1022, 5, protoModule.wireTypes.varint)
		var1032, var1772 = protoModule.writeVarInt(var1032, var1033, self.secondary_sort_id)
		buff = var1032
		var1022 = var1033
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var1034, var1035 = protoModule.writeTag(buff, var1022, 6, protoModule.wireTypes.varint)
		var1034, var1774 = protoModule.writeVarInt(var1034, var1035, self.max_visible_rows)
		buff = var1034
		var1022 = var1035
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1036, var1037 = protoModule.writeTag(buff, var1022, 7, protoModule.wireTypes.lengthDelimited)
		var1036, var1776 = protoModule.writeString(var1036, var1037, self.subtitle)
		buff = var1036
		var1022 = var1037
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1038, var1039 = protoModule.writeTag(buff, var1022, 8, protoModule.wireTypes.lengthDelimited)
		var1038, var1778 = protoModule.writeString(var1038, var1039, self.info_text)
		buff = var1038
		var1022 = var1039
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1040, var1041 = protoModule.writeTag(buff, var1022, 9, protoModule.wireTypes.lengthDelimited)
		var1040, var1780 = protoModule.writeString(var1040, var1041, self.subtitle_link_path)
		buff = var1040
		var1022 = var1041
	end
	if self.is_placeholder ~= nil then
		local var1042, var1043 = protoModule.writeTag(buff, var1022, 10, protoModule.wireTypes.varint)
		var1042, var1782 = protoModule.writeVarInt(var1042, var1043, if self.is_placeholder then 1 else 0)
		buff = var1042
		var1022 = var1043
	end
	if self.primary_sort_id ~= nil then
		local var1044, var1045 = protoModule.writeTag(buff, var1022, 11, protoModule.wireTypes.varint)
		var1044, var1784 = protoModule.writeVarInt(var1044, var1045, self.primary_sort_id)
		buff = var1044
		var1022 = var1045
	end
	if self.applied_filters ~= nil then
		local var1046, var1047 = protoModule.writeTag(buff, var1022, 12, protoModule.wireTypes.lengthDelimited)
		var1046, var1786 = protoModule.writeString(var1046, var1047, self.applied_filters)
		buff = var1046
		var1022 = var1047
	end
	if self.pool_id ~= nil then
		local var1048, var1049 = protoModule.writeTag(buff, var1022, 13, protoModule.wireTypes.lengthDelimited)
		var1048, var1788 = protoModule.writeString(var1048, var1049, self.pool_id)
		buff = var1048
		var1022 = var1049
	end
	if self.has_emphasized_tile then
		local var1050, var1051 = protoModule.writeTag(buff, var1022, 14, protoModule.wireTypes.varint)
		var1050, var1790 = protoModule.writeVarInt(var1050, var1051, if self.has_emphasized_tile then 1 else 0)
		buff = var1050
		var1022 = var1051
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var1052, var1053 = protoModule.writeTag(buff, var1022, 15, protoModule.wireTypes.lengthDelimited)
		var1052, var1792 = protoModule.writeString(var1052, var1053, self.tile_activation_mode)
		buff = var1052
		var1022 = var1053
	end
	if self.initial_feed_visible_rows ~= nil then
		local var1054, var1055 = protoModule.writeTag(buff, var1022, 16, protoModule.wireTypes.varint)
		var1054, var1794 = protoModule.writeVarInt(var1054, var1055, self.initial_feed_visible_rows)
		buff = var1054
		var1022 = var1055
	end
	if self.visible_rows_per_reveal ~= nil then
		local var1056, var1057 = protoModule.writeTag(buff, var1022, 17, protoModule.wireTypes.varint)
		var1056, var1796 = protoModule.writeVarInt(var1056, var1057, self.visible_rows_per_reveal)
		buff = var1056
		var1022 = var1057
	end
	if self.sponsored_user_cohort ~= nil then
		local var1058, var1059 = protoModule.writeTag(buff, var1022, 18, protoModule.wireTypes.lengthDelimited)
		var1058, var1798 = protoModule.writeString(var1058, var1059, self.sponsored_user_cohort)
		buff = var1058
		var1022 = var1059
	end
	if self.anchor_tag ~= nil then
		local var1060, var1061 = protoModule.writeTag(buff, var1022, 19, protoModule.wireTypes.lengthDelimited)
		var1060, var1800 = protoModule.writeString(var1060, var1061, self.anchor_tag)
		buff = var1060
		var1022 = var1061
	end
	if self.collection_item_size ~= nil then
		local var1062, var1063 = protoModule.writeTag(buff, var1022, 20, protoModule.wireTypes.lengthDelimited)
		var1062, var1802 = protoModule.writeString(var1062, var1063, self.collection_item_size)
		buff = var1062
		var1022 = var1063
	end
	if self.sort_sub_id ~= nil then
		local var1064, var1065 = protoModule.writeTag(buff, var1022, 21, protoModule.wireTypes.lengthDelimited)
		var1064, var1804 = protoModule.writeString(var1064, var1065, self.sort_sub_id)
		buff = var1064
		var1022 = var1065
	end
	if self.enable_game_tile_videos then
		local var1066, var1067 = protoModule.writeTag(buff, var1022, 22, protoModule.wireTypes.varint)
		var1066, var1806 = protoModule.writeVarInt(var1066, var1067, if self.enable_game_tile_videos then 1 else 0)
		buff = var1066
		var1022 = var1067
	end
	if self.continues_previous_section ~= nil then
		local var1068, var1069 = protoModule.writeTag(buff, var1022, 23, protoModule.wireTypes.varint)
		var1068, var1808 = protoModule.writeVarInt(var1068, var1069, if self.continues_previous_section then 1 else 0)
		buff = var1068
		var1022 = var1069
	end
	local buff_1 = buffer.create(var1022)
	buffer.copy(buff_1, 0, buff, 0, var1022)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1070 = t_39.new()
	local var1071 = 0
	while var1071 < buffer.len(p39) do
		local _ = nil
		local var1072 = nil
		local var1073, var1074, var1075 = protoModule.readTag(p39, var1071)
		local var1076 = var1073
		var1072 = var1074
		var1071 = var1075
		
		if var1072 == protoModule.wireTypes.varint then
			if var1076 == 5 then
				local _ = nil
				local var1077, var1078 = protoModule.readVarIntI32(p39, var1071)
				var1071 = var1078
				var1070.secondary_sort_id = var1077
			elseif var1076 == 6 then
				local _ = nil
				local var1079, var1080 = protoModule.readVarIntI32(p39, var1071)
				var1071 = var1080
				var1070.max_visible_rows = var1079
			elseif var1076 == 10 then
				local _ = nil
				local var1081, var1082 = protoModule.readVarInt(p39, var1071)
				var1071 = var1082
				var1070.is_placeholder = var1081 ~= 0
			elseif var1076 == 11 then
				local _ = nil
				local var1083, var1084 = protoModule.readVarIntI32(p39, var1071)
				var1071 = var1084
				var1070.primary_sort_id = var1083
			elseif var1076 == 14 then
				local _ = nil
				local var1085, var1086 = protoModule.readVarInt(p39, var1071)
				var1071 = var1086
				var1070.has_emphasized_tile = var1085 ~= 0
			elseif var1076 == 16 then
				local _ = nil
				local var1087, var1088 = protoModule.readVarIntI32(p39, var1071)
				var1071 = var1088
				var1070.initial_feed_visible_rows = var1087
			elseif var1076 == 17 then
				local _ = nil
				local var1089, var1090 = protoModule.readVarIntI32(p39, var1071)
				var1071 = var1090
				var1070.visible_rows_per_reveal = var1089
			elseif var1076 == 22 then
				local _ = nil
				local var1091, var1092 = protoModule.readVarInt(p39, var1071)
				var1071 = var1092
				var1070.enable_game_tile_videos = var1091 ~= 0
			elseif var1076 == 23 then
				local _ = nil
				local var1093, var1094 = protoModule.readVarInt(p39, var1071)
				var1071 = var1094
				var1070.continues_previous_section = var1093 ~= 0
			else
				local _ = nil
				local var1095, var1096 = protoModule.readVarInt(p39, var1071)
				local _ = var1095
				var1071 = var1096
			end
		end
		if var1072 == protoModule.wireTypes.lengthDelimited then
			if var1076 == 1 then
				local _ = nil
				local var1097, var1098 = protoModule.readBuffer(p39, var1071)
				var1071 = var1098
				var1070.title = buffer.tostring(var1097)
			elseif var1076 == 2 then
				local _ = nil
				local var1099, var1100 = protoModule.readBuffer(p39, var1071)
				var1071 = var1100
				table.insert(var1070.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var1099))
			elseif var1076 == 3 then
				local _ = nil
				local var1101, var1102 = protoModule.readBuffer(p39, var1071)
				var1071 = var1102
				var1070.next_page_token = buffer.tostring(var1101)
			elseif var1076 == 4 then
				local _ = nil
				local var1103, var1104 = protoModule.readBuffer(p39, var1071)
				var1071 = var1104
				var1070.sort_id = buffer.tostring(var1103)
			elseif var1076 == 7 then
				local _ = nil
				local var1105, var1106 = protoModule.readBuffer(p39, var1071)
				var1071 = var1106
				var1070.subtitle = buffer.tostring(var1105)
			elseif var1076 == 8 then
				local _ = nil
				local var1107, var1108 = protoModule.readBuffer(p39, var1071)
				var1071 = var1108
				var1070.info_text = buffer.tostring(var1107)
			elseif var1076 == 9 then
				local _ = nil
				local var1109, var1110 = protoModule.readBuffer(p39, var1071)
				var1071 = var1110
				var1070.subtitle_link_path = buffer.tostring(var1109)
			elseif var1076 == 12 then
				local _ = nil
				local var1111, var1112 = protoModule.readBuffer(p39, var1071)
				var1071 = var1112
				var1070.applied_filters = buffer.tostring(var1111)
			elseif var1076 == 13 then
				local _ = nil
				local var1113, var1114 = protoModule.readBuffer(p39, var1071)
				var1071 = var1114
				var1070.pool_id = buffer.tostring(var1113)
			elseif var1076 == 15 then
				local _ = nil
				local var1115, var1116 = protoModule.readBuffer(p39, var1071)
				var1071 = var1116
				var1070.tile_activation_mode = buffer.tostring(var1115)
			elseif var1076 == 18 then
				local _ = nil
				local var1117, var1118 = protoModule.readBuffer(p39, var1071)
				var1071 = var1118
				var1070.sponsored_user_cohort = buffer.tostring(var1117)
			elseif var1076 == 19 then
				local _ = nil
				local var1119, var1120 = protoModule.readBuffer(p39, var1071)
				var1071 = var1120
				var1070.anchor_tag = buffer.tostring(var1119)
			elseif var1076 == 20 then
				local _ = nil
				local var1121, var1122 = protoModule.readBuffer(p39, var1071)
				var1071 = var1122
				var1070.collection_item_size = buffer.tostring(var1121)
			elseif var1076 == 21 then
				local _ = nil
				local var1123, var1124 = protoModule.readBuffer(p39, var1071)
				var1071 = var1124
				var1070.sort_sub_id = buffer.tostring(var1123)
			else
				local _ = nil
				local var1125, var1126 = protoModule.readVarInt(p39, var1071)
				var1071 = var1126 + var1125
			end
		elseif var1072 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1127, var1128 = protoModule.readFixed32(p39, var1071)
			local _ = var1127
			var1071 = var1128
		elseif var1072 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1129, var1130 = protoModule.readFixed64(p39, var1071)
			local _ = var1129
			var1071 = var1130
		else
			error("Unsupported wire type: " .. var1812)
		end
	end
	return var1070
end

function t_39:jsonEncode()
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

function t_39:jsonDecode()
	-- upvalues: t_39 (ref), t (ref)
	local var1131 = t_39.new()
	
	if self.title ~= nil then
		var1131.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1131.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1131.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1131.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1131.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1131.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1131.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1131.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1131.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1131.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1131.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1131.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1131.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1131.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1131.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1131.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1131.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1131.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1131.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1131.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1131.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1131.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1131.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1131.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1131.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1131.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var1131.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var1131.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var1131.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var1131.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var1131.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var1131.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var1131.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var1131.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		var1131.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1131.anchor_tag = self.anchorTag
	end
	if self.collection_item_size ~= nil then
		var1131.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1131.collection_item_size = self.collectionItemSize
	end
	if self.sort_sub_id ~= nil then
		var1131.sort_sub_id = self.sort_sub_id
	end
	if self.sortSubId ~= nil then
		var1131.sort_sub_id = self.sortSubId
	end
	if self.enable_game_tile_videos ~= nil then
		var1131.enable_game_tile_videos = self.enable_game_tile_videos
	end
	if self.enableGameTileVideos ~= nil then
		var1131.enable_game_tile_videos = self.enableGameTileVideos
	end
	if self.continues_previous_section ~= nil then
		var1131.continues_previous_section = self.continues_previous_section
	end
	if self.continuesPreviousSection ~= nil then
		var1131.continues_previous_section = self.continuesPreviousSection
	end
	return var1131
end

t_39.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_39
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p40)
	-- upvalues: t_40 (ref)
	return setmetatable({
		universe_id = if p40 == nil or p40.universe_id == nil then "" else p40.universe_id,
		is_sponsored = if p40 == nil or p40.is_sponsored == nil then false else p40.is_sponsored,
		roblox_component = if p40 == nil or p40.roblox_component == nil then "" else p40.roblox_component,
		native_ad_data = if p40 == nil or p40.native_ad_data == nil then "" else p40.native_ad_data,
		is_content_locked = if p40 == nil or p40.is_content_locked == nil then false else p40.is_content_locked,
		title = if p40 == nil or p40.title == nil then "" else p40.title,
		subtitle = if p40 == nil or p40.subtitle == nil then "" else p40.subtitle,
		image_asset_id = if p40 == nil or p40.image_asset_id == nil then "" else p40.image_asset_id,
		video_asset_id = if p40 == nil or p40.video_asset_id == nil then "" else p40.video_asset_id,
		badge_text = if p40 == nil or p40.badge_text == nil then "" else p40.badge_text,
		player_count = if p40 == nil or p40.player_count == nil then nil else p40.player_count,
		creator_key = if p40 == nil or p40.creator_key == nil then "" else p40.creator_key,
		rank = if p40 == nil or p40.rank == nil then nil else p40.rank,
		payer_name = if p40 == nil or p40.payer_name == nil then nil else p40.payer_name,
		logo_asset_id = if p40 == nil or p40.logo_asset_id == nil then nil else p40.logo_asset_id,
		logo_aspect_ratio = if p40 == nil or p40.logo_aspect_ratio == nil then nil else p40.logo_aspect_ratio,
		place_id = if p40 == nil or p40.place_id == nil then nil else p40.place_id,
		launch_data = if p40 == nil or p40.launch_data == nil then nil else p40.launch_data,
		tile_variant = if p40 == nil or p40.tile_variant == nil then nil else p40.tile_variant,
		cta_text = if p40 == nil or p40.cta_text == nil then nil else p40.cta_text,
		badge_analytics_id = if p40 == nil or p40.badge_analytics_id == nil then nil else p40.badge_analytics_id,
		game_items = if p40 == nil or p40.game_items == nil then {} else p40.game_items,
		attribution_thumbnail_asset_id = if p40 == nil or p40.attribution_thumbnail_asset_id == nil then nil else p40.attribution_thumbnail_asset_id,
		game_items_compact = if p40 == nil or p40.game_items_compact == nil then {} else p40.game_items_compact,
		source_sort_id = if p40 == nil or p40.source_sort_id == nil then nil else p40.source_sort_id,
		new_game_enum = if p40 == nil or p40.new_game_enum == nil then nil else p40.new_game_enum,
		moment_video_playback = if p40 == nil or p40.moment_video_playback == nil then nil else p40.moment_video_playback,
		thumbnail_list_id = if p40 == nil or p40.thumbnail_list_id == nil then nil else p40.thumbnail_list_id,
		sponsored_game_preview_video_eligible = if p40 == nil or p40.sponsored_game_preview_video_eligible == nil then nil else p40.sponsored_game_preview_video_eligible
	}, t_40)
end

function t_40:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1132 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1133, var1134 = protoModule.writeTag(buff, var1132, 1, protoModule.wireTypes.lengthDelimited)
		var1133, var1879 = protoModule.writeString(var1133, var1134, self.universe_id)
		buff = var1133
		var1132 = var1134
	end
	if self.is_sponsored then
		local var1135, var1136 = protoModule.writeTag(buff, var1132, 2, protoModule.wireTypes.varint)
		var1135, var1881 = protoModule.writeVarInt(var1135, var1136, if self.is_sponsored then 1 else 0)
		buff = var1135
		var1132 = var1136
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1137, var1138 = protoModule.writeTag(buff, var1132, 3, protoModule.wireTypes.lengthDelimited)
		var1137, var1883 = protoModule.writeString(var1137, var1138, self.roblox_component)
		buff = var1137
		var1132 = var1138
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1139, var1140 = protoModule.writeTag(buff, var1132, 4, protoModule.wireTypes.lengthDelimited)
		var1139, var1885 = protoModule.writeString(var1139, var1140, self.native_ad_data)
		buff = var1139
		var1132 = var1140
	end
	if self.is_content_locked then
		local var1141, var1142 = protoModule.writeTag(buff, var1132, 5, protoModule.wireTypes.varint)
		var1141, var1887 = protoModule.writeVarInt(var1141, var1142, if self.is_content_locked then 1 else 0)
		buff = var1141
		var1132 = var1142
	end
	if self.title ~= nil and self.title ~= "" then
		local var1143, var1144 = protoModule.writeTag(buff, var1132, 6, protoModule.wireTypes.lengthDelimited)
		var1143, var1889 = protoModule.writeString(var1143, var1144, self.title)
		buff = var1143
		var1132 = var1144
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1145, var1146 = protoModule.writeTag(buff, var1132, 7, protoModule.wireTypes.lengthDelimited)
		var1145, var1891 = protoModule.writeString(var1145, var1146, self.subtitle)
		buff = var1145
		var1132 = var1146
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1147, var1148 = protoModule.writeTag(buff, var1132, 8, protoModule.wireTypes.lengthDelimited)
		var1147, var1893 = protoModule.writeString(var1147, var1148, self.image_asset_id)
		buff = var1147
		var1132 = var1148
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1149, var1150 = protoModule.writeTag(buff, var1132, 9, protoModule.wireTypes.lengthDelimited)
		var1149, var1895 = protoModule.writeString(var1149, var1150, self.video_asset_id)
		buff = var1149
		var1132 = var1150
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1151, var1152 = protoModule.writeTag(buff, var1132, 10, protoModule.wireTypes.lengthDelimited)
		var1151, var1897 = protoModule.writeString(var1151, var1152, self.badge_text)
		buff = var1151
		var1132 = var1152
	end
	if self.player_count ~= nil then
		local var1153, var1154 = protoModule.writeTag(buff, var1132, 11, protoModule.wireTypes.varint)
		var1153, var1899 = protoModule.writeVarInt(var1153, var1154, self.player_count)
		buff = var1153
		var1132 = var1154
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1155, var1156 = protoModule.writeTag(buff, var1132, 12, protoModule.wireTypes.lengthDelimited)
		var1155, var1901 = protoModule.writeString(var1155, var1156, self.creator_key)
		buff = var1155
		var1132 = var1156
	end
	if self.rank ~= nil then
		local var1157, var1158 = protoModule.writeTag(buff, var1132, 13, protoModule.wireTypes.varint)
		var1157, var1903 = protoModule.writeVarInt(var1157, var1158, self.rank)
		buff = var1157
		var1132 = var1158
	end
	if self.payer_name ~= nil then
		local var1159, var1160 = protoModule.writeTag(buff, var1132, 14, protoModule.wireTypes.lengthDelimited)
		var1159, var1905 = protoModule.writeString(var1159, var1160, self.payer_name)
		buff = var1159
		var1132 = var1160
	end
	if self.logo_asset_id ~= nil then
		local var1161, var1162 = protoModule.writeTag(buff, var1132, 15, protoModule.wireTypes.lengthDelimited)
		var1161, var1907 = protoModule.writeString(var1161, var1162, self.logo_asset_id)
		buff = var1161
		var1132 = var1162
	end
	if self.logo_aspect_ratio ~= nil then
		local var1163, var1164 = protoModule.writeTag(buff, var1132, 16, protoModule.wireTypes.i64)
		var1163, var1909 = protoModule.writeDouble(var1163, var1164, self.logo_aspect_ratio)
		buff = var1163
		var1132 = var1164
	end
	if self.place_id ~= nil then
		local var1165, var1166 = protoModule.writeTag(buff, var1132, 17, protoModule.wireTypes.lengthDelimited)
		var1165, var1911 = protoModule.writeString(var1165, var1166, self.place_id)
		buff = var1165
		var1132 = var1166
	end
	if self.launch_data ~= nil then
		local var1167, var1168 = protoModule.writeTag(buff, var1132, 18, protoModule.wireTypes.lengthDelimited)
		var1167, var1913 = protoModule.writeString(var1167, var1168, self.launch_data)
		buff = var1167
		var1132 = var1168
	end
	if self.tile_variant ~= nil then
		local var1169, var1170 = protoModule.writeTag(buff, var1132, 19, protoModule.wireTypes.lengthDelimited)
		var1169, var1915 = protoModule.writeString(var1169, var1170, self.tile_variant)
		buff = var1169
		var1132 = var1170
	end
	if self.cta_text ~= nil then
		local var1171, var1172 = protoModule.writeTag(buff, var1132, 20, protoModule.wireTypes.lengthDelimited)
		var1171, var1917 = protoModule.writeString(var1171, var1172, self.cta_text)
		buff = var1171
		var1132 = var1172
	end
	if self.badge_analytics_id ~= nil then
		local var1173, var1174 = protoModule.writeTag(buff, var1132, 21, protoModule.wireTypes.lengthDelimited)
		var1173, var1919 = protoModule.writeString(var1173, var1174, self.badge_analytics_id)
		buff = var1173
		var1132 = var1174
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1175 = v:encode()
			local var1176, var1177 = protoModule.writeTag(buff, var1132, 22, protoModule.wireTypes.lengthDelimited)
			var1176, var1922 = protoModule.writeBuffer(var1176, var1177, var1175, buffer.len(var1175))
			buff = var1176
			var1132 = var1177
		end
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var1178, var1179 = protoModule.writeTag(buff, var1132, 23, protoModule.wireTypes.lengthDelimited)
		var1178, var1924 = protoModule.writeString(var1178, var1179, self.attribution_thumbnail_asset_id)
		buff = var1178
		var1132 = var1179
	end
	if self.game_items_compact ~= nil and #self.game_items_compact > 0 then
		for i, v in self.game_items_compact do
			local var1180 = v:encode()
			local var1181, var1182 = protoModule.writeTag(buff, var1132, 24, protoModule.wireTypes.lengthDelimited)
			var1181, var1927 = protoModule.writeBuffer(var1181, var1182, var1180, buffer.len(var1180))
			buff = var1181
			var1132 = var1182
		end
	end
	if self.source_sort_id ~= nil then
		local var1183, var1184 = protoModule.writeTag(buff, var1132, 25, protoModule.wireTypes.lengthDelimited)
		var1183, var1929 = protoModule.writeString(var1183, var1184, self.source_sort_id)
		buff = var1183
		var1132 = var1184
	end
	if self.new_game_enum ~= nil then
		local var1185, var1186 = protoModule.writeTag(buff, var1132, 26, protoModule.wireTypes.varint)
		var1185, var1931 = protoModule.writeVarInt(var1185, var1186, self.new_game_enum)
		buff = var1185
		var1132 = var1186
	end
	if self.moment_video_playback ~= nil then
		local var1187 = self.moment_video_playback:encode()
		local var1188, var1189 = protoModule.writeTag(buff, var1132, 27, protoModule.wireTypes.lengthDelimited)
		var1188, var1934 = protoModule.writeBuffer(var1188, var1189, var1187, buffer.len(var1187))
		buff = var1188
		var1132 = var1189
	end
	if self.thumbnail_list_id ~= nil then
		local var1190, var1191 = protoModule.writeTag(buff, var1132, 28, protoModule.wireTypes.lengthDelimited)
		var1190, var1936 = protoModule.writeString(var1190, var1191, self.thumbnail_list_id)
		buff = var1190
		var1132 = var1191
	end
	if self.sponsored_game_preview_video_eligible ~= nil then
		local var1192, var1193 = protoModule.writeTag(buff, var1132, 29, protoModule.wireTypes.varint)
		var1192, var1938 = protoModule.writeVarInt(var1192, var1193, if self.sponsored_game_preview_video_eligible then 1 else 0)
		buff = var1192
		var1132 = var1193
	end
	local buff_1 = buffer.create(var1132)
	buffer.copy(buff_1, 0, buff, 0, var1132)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1194 = t_40.new()
	local var1195 = 0
	while var1195 < buffer.len(p40) do
		local _ = nil
		local var1196 = nil
		local var1197, var1198, var1199 = protoModule.readTag(p40, var1195)
		local var1200 = var1197
		var1196 = var1198
		var1195 = var1199
		
		if var1196 == protoModule.wireTypes.varint then
			if var1200 == 2 then
				local _ = nil
				local var1201, var1202 = protoModule.readVarInt(p40, var1195)
				var1195 = var1202
				var1194.is_sponsored = var1201 ~= 0
			elseif var1200 == 5 then
				local _ = nil
				local var1203, var1204 = protoModule.readVarInt(p40, var1195)
				var1195 = var1204
				var1194.is_content_locked = var1203 ~= 0
			elseif var1200 == 11 then
				local _ = nil
				local var1205, var1206 = protoModule.readVarIntI64(p40, var1195)
				var1195 = var1206
				var1194.player_count = var1205
			elseif var1200 == 13 then
				local _ = nil
				local var1207, var1208 = protoModule.readVarIntI32(p40, var1195)
				var1195 = var1208
				var1194.rank = var1207
			elseif var1200 == 26 then
				local _ = nil
				local var1209, var1210 = protoModule.readVarIntI32(p40, var1195)
				var1195 = var1210
				var1194.new_game_enum = var1209
			elseif var1200 == 29 then
				local _ = nil
				local var1211, var1212 = protoModule.readVarInt(p40, var1195)
				var1195 = var1212
				var1194.sponsored_game_preview_video_eligible = var1211 ~= 0
			else
				local _ = nil
				local var1213, var1214 = protoModule.readVarInt(p40, var1195)
				local _ = var1213
				var1195 = var1214
			end
		end
		if var1196 == protoModule.wireTypes.lengthDelimited then
			if var1200 == 1 then
				local _ = nil
				local var1215, var1216 = protoModule.readBuffer(p40, var1195)
				var1195 = var1216
				var1194.universe_id = buffer.tostring(var1215)
			elseif var1200 == 3 then
				local _ = nil
				local var1217, var1218 = protoModule.readBuffer(p40, var1195)
				var1195 = var1218
				var1194.roblox_component = buffer.tostring(var1217)
			elseif var1200 == 4 then
				local _ = nil
				local var1219, var1220 = protoModule.readBuffer(p40, var1195)
				var1195 = var1220
				var1194.native_ad_data = buffer.tostring(var1219)
			elseif var1200 == 6 then
				local _ = nil
				local var1221, var1222 = protoModule.readBuffer(p40, var1195)
				var1195 = var1222
				var1194.title = buffer.tostring(var1221)
			elseif var1200 == 7 then
				local _ = nil
				local var1223, var1224 = protoModule.readBuffer(p40, var1195)
				var1195 = var1224
				var1194.subtitle = buffer.tostring(var1223)
			elseif var1200 == 8 then
				local _ = nil
				local var1225, var1226 = protoModule.readBuffer(p40, var1195)
				var1195 = var1226
				var1194.image_asset_id = buffer.tostring(var1225)
			elseif var1200 == 9 then
				local _ = nil
				local var1227, var1228 = protoModule.readBuffer(p40, var1195)
				var1195 = var1228
				var1194.video_asset_id = buffer.tostring(var1227)
			elseif var1200 == 10 then
				local _ = nil
				local var1229, var1230 = protoModule.readBuffer(p40, var1195)
				var1195 = var1230
				var1194.badge_text = buffer.tostring(var1229)
			elseif var1200 == 12 then
				local _ = nil
				local var1231, var1232 = protoModule.readBuffer(p40, var1195)
				var1195 = var1232
				var1194.creator_key = buffer.tostring(var1231)
			elseif var1200 == 14 then
				local _ = nil
				local var1233, var1234 = protoModule.readBuffer(p40, var1195)
				var1195 = var1234
				var1194.payer_name = buffer.tostring(var1233)
			elseif var1200 == 15 then
				local _ = nil
				local var1235, var1236 = protoModule.readBuffer(p40, var1195)
				var1195 = var1236
				var1194.logo_asset_id = buffer.tostring(var1235)
			elseif var1200 == 17 then
				local _ = nil
				local var1237, var1238 = protoModule.readBuffer(p40, var1195)
				var1195 = var1238
				var1194.place_id = buffer.tostring(var1237)
			elseif var1200 == 18 then
				local _ = nil
				local var1239, var1240 = protoModule.readBuffer(p40, var1195)
				var1195 = var1240
				var1194.launch_data = buffer.tostring(var1239)
			elseif var1200 == 19 then
				local _ = nil
				local var1241, var1242 = protoModule.readBuffer(p40, var1195)
				var1195 = var1242
				var1194.tile_variant = buffer.tostring(var1241)
			elseif var1200 == 20 then
				local _ = nil
				local var1243, var1244 = protoModule.readBuffer(p40, var1195)
				var1195 = var1244
				var1194.cta_text = buffer.tostring(var1243)
			elseif var1200 == 21 then
				local _ = nil
				local var1245, var1246 = protoModule.readBuffer(p40, var1195)
				var1195 = var1246
				var1194.badge_analytics_id = buffer.tostring(var1245)
			elseif var1200 == 22 then
				local _ = nil
				local var1247, var1248 = protoModule.readBuffer(p40, var1195)
				var1195 = var1248
				table.insert(var1194.game_items, t.GameItemInputData.decode(var1247))
			elseif var1200 == 23 then
				local _ = nil
				local var1249, var1250 = protoModule.readBuffer(p40, var1195)
				var1195 = var1250
				var1194.attribution_thumbnail_asset_id = buffer.tostring(var1249)
			elseif var1200 == 24 then
				local _ = nil
				local var1251, var1252 = protoModule.readBuffer(p40, var1195)
				var1195 = var1252
				table.insert(var1194.game_items_compact, t.GameItemInputData.decode(var1251))
			elseif var1200 == 25 then
				local _ = nil
				local var1253, var1254 = protoModule.readBuffer(p40, var1195)
				var1195 = var1254
				var1194.source_sort_id = buffer.tostring(var1253)
			elseif var1200 == 27 then
				local _ = nil
				local var1255, var1256 = protoModule.readBuffer(p40, var1195)
				var1195 = var1256
				var1194.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.decode(var1255)
			elseif var1200 == 28 then
				local _ = nil
				local var1257, var1258 = protoModule.readBuffer(p40, var1195)
				var1195 = var1258
				var1194.thumbnail_list_id = buffer.tostring(var1257)
			else
				local _ = nil
				local var1259, var1260 = protoModule.readVarInt(p40, var1195)
				var1195 = var1260 + var1259
			end
		elseif var1196 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1261, var1262 = protoModule.readFixed32(p40, var1195)
			local _ = var1261
			var1195 = var1262
		elseif var1196 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1942)
		elseif var1200 == 16 then
			local _ = nil
			local var1263, var1264 = protoModule.readDouble(p40, var1195)
			var1195 = var1264
			var1194.logo_aspect_ratio = var1263
		else
			local _ = nil
			local var1265, var1266 = protoModule.readFixed64(p40, var1195)
			local _ = var1265
			var1195 = var1266
		end
	end
	return var1194
end

function t_40:jsonEncode()
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
	if self.thumbnail_list_id ~= nil then
		t.thumbnailListId = self.thumbnail_list_id
	end
	if self.sponsored_game_preview_video_eligible ~= nil then
		t.sponsoredGamePreviewVideoEligible = self.sponsored_game_preview_video_eligible
	end
	return t
end

function t_40:jsonDecode()
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1267 = t_40.new()
	
	if self.universe_id ~= nil then
		var1267.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1267.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1267.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1267.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1267.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1267.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1267.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1267.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1267.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1267.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1267.title = self.title
	end
	if self.subtitle ~= nil then
		var1267.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1267.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1267.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1267.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1267.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1267.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1267.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1267.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1267.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1267.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1267.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1267.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1267.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1267.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1267.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1267.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1267.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1267.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1267.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1267.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1267.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1267.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1267.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1267.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1267.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1267.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1267.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1267.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1267.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1267.game_items = t_1
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var1267.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var1267.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	if self.game_items_compact ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items_compact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1267.game_items_compact = t_1
	end
	if self.gameItemsCompact ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItemsCompact do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1267.game_items_compact = t_1
	end
	if self.source_sort_id ~= nil then
		var1267.source_sort_id = self.source_sort_id
	end
	if self.sourceSortId ~= nil then
		var1267.source_sort_id = self.sourceSortId
	end
	if self.new_game_enum ~= nil then
		var1267.new_game_enum = self.new_game_enum
	end
	if self.newGameEnum ~= nil then
		var1267.new_game_enum = self.newGameEnum
	end
	if self.moment_video_playback ~= nil then
		var1267.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.moment_video_playback)
	end
	if self.momentVideoPlayback ~= nil then
		var1267.moment_video_playback = t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback.jsonDecode(self.momentVideoPlayback)
	end
	if self.thumbnail_list_id ~= nil then
		var1267.thumbnail_list_id = self.thumbnail_list_id
	end
	if self.thumbnailListId ~= nil then
		var1267.thumbnail_list_id = self.thumbnailListId
	end
	if self.sponsored_game_preview_video_eligible ~= nil then
		var1267.sponsored_game_preview_video_eligible = self.sponsored_game_preview_video_eligible
	end
	if self.sponsoredGamePreviewVideoEligible ~= nil then
		var1267.sponsored_game_preview_video_eligible = self.sponsoredGamePreviewVideoEligible
	end
	return var1267
end

t_40.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_40
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p41)
	-- upvalues: t_41 (ref)
	return setmetatable({
		asset_id = if p41 == nil or p41.asset_id == nil then "" else p41.asset_id,
		asset_access_context = if p41 == nil or p41.asset_access_context == nil then "" else p41.asset_access_context
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1268 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var1269, var1270 = protoModule.writeTag(buff, var1268, 1, protoModule.wireTypes.lengthDelimited)
		var1269, var2024 = protoModule.writeString(var1269, var1270, self.asset_id)
		buff = var1269
		var1268 = var1270
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		local var1271, var1272 = protoModule.writeTag(buff, var1268, 2, protoModule.wireTypes.lengthDelimited)
		var1271, var2026 = protoModule.writeString(var1271, var1272, self.asset_access_context)
		buff = var1271
		var1268 = var1272
	end
	local buff_1 = buffer.create(var1268)
	buffer.copy(buff_1, 0, buff, 0, var1268)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref)
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
				var1268.asset_id = buffer.tostring(var1277)
			elseif var1274 == 2 then
				local _ = nil
				local var1279, var1280 = protoModule.readBuffer(p41, var1269)
				var1269 = var1280
				var1268.asset_access_context = buffer.tostring(var1279)
			else
				local _ = nil
				local var1281, var1282 = protoModule.readVarInt(p41, var1269)
				var1269 = var1282 + var1281
			end
		elseif var1270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1283, var1284 = protoModule.readFixed32(p41, var1269)
			local _ = var1283
			var1269 = var1284
		elseif var1270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1285, var1286 = protoModule.readFixed64(p41, var1269)
			local _ = var1285
			var1269 = var1286
		else
			error("Unsupported wire type: " .. var2030)
		end
	end
	return var1268
end

function t_41:jsonEncode()
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		t.assetId = self.asset_id
	end
	if self.asset_access_context ~= nil and self.asset_access_context ~= "" then
		t.assetAccessContext = self.asset_access_context
	end
	return t
end

function t_41:jsonDecode()
	-- upvalues: t_41 (ref)
	local var1287 = t_41.new()
	
	if self.asset_id ~= nil then
		var1287.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var1287.asset_id = self.assetId
	end
	if self.asset_access_context ~= nil then
		var1287.asset_access_context = self.asset_access_context
	end
	if self.assetAccessContext ~= nil then
		var1287.asset_access_context = self.assetAccessContext
	end
	return var1287
end

t_41.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentVideoPlayback"
}
t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback = t_41
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem_MomentVideoPlayback)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p42)
	-- upvalues: t_42 (ref)
	return setmetatable({
		title = if p42 == nil or p42.title == nil then "" else p42.title,
		song_items = if p42 == nil or p42.song_items == nil then {} else p42.song_items,
		next_page_token = if p42 == nil or p42.next_page_token == nil then "" else p42.next_page_token,
		sort_id = if p42 == nil or p42.sort_id == nil then "" else p42.sort_id,
		secondary_sort_id = if p42 == nil or p42.secondary_sort_id == nil then 0 else p42.secondary_sort_id,
		subtitle = if p42 == nil or p42.subtitle == nil then "" else p42.subtitle,
		info_text = if p42 == nil or p42.info_text == nil then "" else p42.info_text,
		subtitle_link_path = if p42 == nil or p42.subtitle_link_path == nil then "" else p42.subtitle_link_path,
		is_placeholder = if p42 == nil or p42.is_placeholder == nil then nil else p42.is_placeholder,
		primary_sort_id = if p42 == nil or p42.primary_sort_id == nil then nil else p42.primary_sort_id,
		applied_filters = if p42 == nil or p42.applied_filters == nil then nil else p42.applied_filters
	}, t_42)
end

function t_42:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1287 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1288, var1289 = protoModule.writeTag(buff, var1287, 1, protoModule.wireTypes.lengthDelimited)
		var1288, var2052 = protoModule.writeString(var1288, var1289, self.title)
		buff = var1288
		var1287 = var1289
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1290 = v:encode()
			local var1291, var1292 = protoModule.writeTag(buff, var1287, 2, protoModule.wireTypes.lengthDelimited)
			var1291, var2055 = protoModule.writeBuffer(var1291, var1292, var1290, buffer.len(var1290))
			buff = var1291
			var1287 = var1292
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1293, var1294 = protoModule.writeTag(buff, var1287, 3, protoModule.wireTypes.lengthDelimited)
		var1293, var2057 = protoModule.writeString(var1293, var1294, self.next_page_token)
		buff = var1293
		var1287 = var1294
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1295, var1296 = protoModule.writeTag(buff, var1287, 4, protoModule.wireTypes.lengthDelimited)
		var1295, var2059 = protoModule.writeString(var1295, var1296, self.sort_id)
		buff = var1295
		var1287 = var1296
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1297, var1298 = protoModule.writeTag(buff, var1287, 5, protoModule.wireTypes.varint)
		var1297, var2061 = protoModule.writeVarInt(var1297, var1298, self.secondary_sort_id)
		buff = var1297
		var1287 = var1298
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1299, var1300 = protoModule.writeTag(buff, var1287, 6, protoModule.wireTypes.lengthDelimited)
		var1299, var2063 = protoModule.writeString(var1299, var1300, self.subtitle)
		buff = var1299
		var1287 = var1300
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1301, var1302 = protoModule.writeTag(buff, var1287, 7, protoModule.wireTypes.lengthDelimited)
		var1301, var2065 = protoModule.writeString(var1301, var1302, self.info_text)
		buff = var1301
		var1287 = var1302
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1303, var1304 = protoModule.writeTag(buff, var1287, 8, protoModule.wireTypes.lengthDelimited)
		var1303, var2067 = protoModule.writeString(var1303, var1304, self.subtitle_link_path)
		buff = var1303
		var1287 = var1304
	end
	if self.is_placeholder ~= nil then
		local var1305, var1306 = protoModule.writeTag(buff, var1287, 9, protoModule.wireTypes.varint)
		var1305, var2069 = protoModule.writeVarInt(var1305, var1306, if self.is_placeholder then 1 else 0)
		buff = var1305
		var1287 = var1306
	end
	if self.primary_sort_id ~= nil then
		local var1307, var1308 = protoModule.writeTag(buff, var1287, 10, protoModule.wireTypes.varint)
		var1307, var2071 = protoModule.writeVarInt(var1307, var1308, self.primary_sort_id)
		buff = var1307
		var1287 = var1308
	end
	if self.applied_filters ~= nil then
		local var1309, var1310 = protoModule.writeTag(buff, var1287, 11, protoModule.wireTypes.lengthDelimited)
		var1309, var2073 = protoModule.writeString(var1309, var1310, self.applied_filters)
		buff = var1309
		var1287 = var1310
	end
	local buff_1 = buffer.create(var1287)
	buffer.copy(buff_1, 0, buff, 0, var1287)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1311 = t_42.new()
	local var1312 = 0
	while var1312 < buffer.len(p42) do
		local _ = nil
		local var1313 = nil
		local var1314, var1315, var1316 = protoModule.readTag(p42, var1312)
		local var1317 = var1314
		var1313 = var1315
		var1312 = var1316
		
		if var1313 == protoModule.wireTypes.varint then
			if var1317 == 5 then
				local _ = nil
				local var1318, var1319 = protoModule.readVarIntI32(p42, var1312)
				var1312 = var1319
				var1311.secondary_sort_id = var1318
			elseif var1317 == 9 then
				local _ = nil
				local var1320, var1321 = protoModule.readVarInt(p42, var1312)
				var1312 = var1321
				var1311.is_placeholder = var1320 ~= 0
			elseif var1317 == 10 then
				local _ = nil
				local var1322, var1323 = protoModule.readVarIntI32(p42, var1312)
				var1312 = var1323
				var1311.primary_sort_id = var1322
			else
				local _ = nil
				local var1324, var1325 = protoModule.readVarInt(p42, var1312)
				local _ = var1324
				var1312 = var1325
			end
		end
		if var1313 == protoModule.wireTypes.lengthDelimited then
			if var1317 == 1 then
				local _ = nil
				local var1326, var1327 = protoModule.readBuffer(p42, var1312)
				var1312 = var1327
				var1311.title = buffer.tostring(var1326)
			elseif var1317 == 2 then
				local _ = nil
				local var1328, var1329 = protoModule.readBuffer(p42, var1312)
				var1312 = var1329
				table.insert(var1311.song_items, t.SongCarouselInputData_SongItem.decode(var1328))
			elseif var1317 == 3 then
				local _ = nil
				local var1330, var1331 = protoModule.readBuffer(p42, var1312)
				var1312 = var1331
				var1311.next_page_token = buffer.tostring(var1330)
			elseif var1317 == 4 then
				local _ = nil
				local var1332, var1333 = protoModule.readBuffer(p42, var1312)
				var1312 = var1333
				var1311.sort_id = buffer.tostring(var1332)
			elseif var1317 == 6 then
				local _ = nil
				local var1334, var1335 = protoModule.readBuffer(p42, var1312)
				var1312 = var1335
				var1311.subtitle = buffer.tostring(var1334)
			elseif var1317 == 7 then
				local _ = nil
				local var1336, var1337 = protoModule.readBuffer(p42, var1312)
				var1312 = var1337
				var1311.info_text = buffer.tostring(var1336)
			elseif var1317 == 8 then
				local _ = nil
				local var1338, var1339 = protoModule.readBuffer(p42, var1312)
				var1312 = var1339
				var1311.subtitle_link_path = buffer.tostring(var1338)
			elseif var1317 == 11 then
				local _ = nil
				local var1340, var1341 = protoModule.readBuffer(p42, var1312)
				var1312 = var1341
				var1311.applied_filters = buffer.tostring(var1340)
			else
				local _ = nil
				local var1342, var1343 = protoModule.readVarInt(p42, var1312)
				var1312 = var1343 + var1342
			end
		elseif var1313 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1344, var1345 = protoModule.readFixed32(p42, var1312)
			local _ = var1344
			var1312 = var1345
		elseif var1313 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1346, var1347 = protoModule.readFixed64(p42, var1312)
			local _ = var1346
			var1312 = var1347
		else
			error("Unsupported wire type: " .. var2077)
		end
	end
	return var1311
end

function t_42:jsonEncode()
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

function t_42:jsonDecode()
	-- upvalues: t_42 (ref), t (ref)
	local var1348 = t_42.new()
	
	if self.title ~= nil then
		var1348.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1348.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1348.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1348.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1348.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1348.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1348.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1348.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1348.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1348.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1348.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1348.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1348.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1348.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1348.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1348.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1348.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1348.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1348.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1348.applied_filters = self.appliedFilters
	end
	return var1348
end

t_42.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_42
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p43)
	-- upvalues: t_43 (ref)
	return setmetatable({
		song_id = if p43 == nil or p43.song_id == nil then "" else p43.song_id
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1349 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1350, var1351 = protoModule.writeTag(buff, var1349, 1, protoModule.wireTypes.lengthDelimited)
		var1350, var2120 = protoModule.writeString(var1350, var1351, self.song_id)
		buff = var1350
		var1349 = var1351
	end
	local buff_1 = buffer.create(var1349)
	buffer.copy(buff_1, 0, buff, 0, var1349)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref)
	local var1349 = t_43.new()
	local var1350 = 0
	while var1350 < buffer.len(p43) do
		local _ = nil
		local var1351 = nil
		local var1352, var1353, var1354 = protoModule.readTag(p43, var1350)
		local var1355 = var1352
		var1351 = var1353
		var1350 = var1354
		
		if var1351 == protoModule.wireTypes.varint then
			local _ = nil
			local var1356, var1357 = protoModule.readVarInt(p43, var1350)
			local _ = var1356
			var1350 = var1357
			continue
		end
		if var1351 == protoModule.wireTypes.lengthDelimited then
			if var1355 == 1 then
				local _ = nil
				local var1358, var1359 = protoModule.readBuffer(p43, var1350)
				var1350 = var1359
				var1349.song_id = buffer.tostring(var1358)
			else
				local _ = nil
				local var1360, var1361 = protoModule.readVarInt(p43, var1350)
				var1350 = var1361 + var1360
			end
		elseif var1351 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1362, var1363 = protoModule.readFixed32(p43, var1350)
			local _ = var1362
			var1350 = var1363
		elseif var1351 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1364, var1365 = protoModule.readFixed64(p43, var1350)
			local _ = var1364
			var1350 = var1365
		else
			error("Unsupported wire type: " .. var2124)
		end
	end
	return var1349
end

function t_43:jsonEncode()
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_43:jsonDecode()
	-- upvalues: t_43 (ref)
	local var1366 = t_43.new()
	
	if self.song_id ~= nil then
		var1366.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1366.song_id = self.songId
	end
	return var1366
end

t_43.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_43
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p44)
	-- upvalues: t_44 (ref)
	return setmetatable({
		title = if p44 == nil or p44.title == nil then "" else p44.title,
		event_items = if p44 == nil or p44.event_items == nil then {} else p44.event_items,
		universe_id = if p44 == nil or p44.universe_id == nil then "" else p44.universe_id,
		sort_id = if p44 == nil or p44.sort_id == nil then "" else p44.sort_id,
		subtitle = if p44 == nil or p44.subtitle == nil then "" else p44.subtitle,
		info_text = if p44 == nil or p44.info_text == nil then "" else p44.info_text
	}, t_44)
end

function t_44:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1366 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1367, var1368 = protoModule.writeTag(buff, var1366, 1, protoModule.wireTypes.lengthDelimited)
		var1367, var2144 = protoModule.writeString(var1367, var1368, self.title)
		buff = var1367
		var1366 = var1368
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1369 = v:encode()
			local var1370, var1371 = protoModule.writeTag(buff, var1366, 2, protoModule.wireTypes.lengthDelimited)
			var1370, var2147 = protoModule.writeBuffer(var1370, var1371, var1369, buffer.len(var1369))
			buff = var1370
			var1366 = var1371
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1372, var1373 = protoModule.writeTag(buff, var1366, 3, protoModule.wireTypes.lengthDelimited)
		var1372, var2149 = protoModule.writeString(var1372, var1373, self.universe_id)
		buff = var1372
		var1366 = var1373
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1374, var1375 = protoModule.writeTag(buff, var1366, 4, protoModule.wireTypes.lengthDelimited)
		var1374, var2151 = protoModule.writeString(var1374, var1375, self.sort_id)
		buff = var1374
		var1366 = var1375
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1376, var1377 = protoModule.writeTag(buff, var1366, 5, protoModule.wireTypes.lengthDelimited)
		var1376, var2153 = protoModule.writeString(var1376, var1377, self.subtitle)
		buff = var1376
		var1366 = var1377
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1378, var1379 = protoModule.writeTag(buff, var1366, 6, protoModule.wireTypes.lengthDelimited)
		var1378, var2155 = protoModule.writeString(var1378, var1379, self.info_text)
		buff = var1378
		var1366 = var1379
	end
	local buff_1 = buffer.create(var1366)
	buffer.copy(buff_1, 0, buff, 0, var1366)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref), t (ref)
	local var1380 = t_44.new()
	local var1381 = 0
	while var1381 < buffer.len(p44) do
		local _ = nil
		local var1382 = nil
		local var1383, var1384, var1385 = protoModule.readTag(p44, var1381)
		local var1386 = var1383
		var1382 = var1384
		var1381 = var1385
		
		if var1382 == protoModule.wireTypes.varint then
			local _ = nil
			local var1387, var1388 = protoModule.readVarInt(p44, var1381)
			local _ = var1387
			var1381 = var1388
			continue
		end
		if var1382 == protoModule.wireTypes.lengthDelimited then
			if var1386 == 1 then
				local _ = nil
				local var1389, var1390 = protoModule.readBuffer(p44, var1381)
				var1381 = var1390
				var1380.title = buffer.tostring(var1389)
			elseif var1386 == 2 then
				local _ = nil
				local var1391, var1392 = protoModule.readBuffer(p44, var1381)
				var1381 = var1392
				table.insert(var1380.event_items, t.EventsCarouselInputData_EventItem.decode(var1391))
			elseif var1386 == 3 then
				local _ = nil
				local var1393, var1394 = protoModule.readBuffer(p44, var1381)
				var1381 = var1394
				var1380.universe_id = buffer.tostring(var1393)
			elseif var1386 == 4 then
				local _ = nil
				local var1395, var1396 = protoModule.readBuffer(p44, var1381)
				var1381 = var1396
				var1380.sort_id = buffer.tostring(var1395)
			elseif var1386 == 5 then
				local _ = nil
				local var1397, var1398 = protoModule.readBuffer(p44, var1381)
				var1381 = var1398
				var1380.subtitle = buffer.tostring(var1397)
			elseif var1386 == 6 then
				local _ = nil
				local var1399, var1400 = protoModule.readBuffer(p44, var1381)
				var1381 = var1400
				var1380.info_text = buffer.tostring(var1399)
			else
				local _ = nil
				local var1401, var1402 = protoModule.readVarInt(p44, var1381)
				var1381 = var1402 + var1401
			end
		elseif var1382 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1403, var1404 = protoModule.readFixed32(p44, var1381)
			local _ = var1403
			var1381 = var1404
		elseif var1382 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1405, var1406 = protoModule.readFixed64(p44, var1381)
			local _ = var1405
			var1381 = var1406
		else
			error("Unsupported wire type: " .. var2159)
		end
	end
	return var1380
end

function t_44:jsonEncode()
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

function t_44:jsonDecode()
	-- upvalues: t_44 (ref), t (ref)
	local var1407 = t_44.new()
	
	if self.title ~= nil then
		var1407.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1407.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1407.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1407.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1407.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1407.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1407.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1407.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1407.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1407.info_text = self.infoText
	end
	return var1407
end

t_44.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_44
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p45)
	-- upvalues: t_45 (ref)
	return setmetatable({
		event_id = if p45 == nil or p45.event_id == nil then "" else p45.event_id
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1408 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1409, var1410 = protoModule.writeTag(buff, var1408, 1, protoModule.wireTypes.lengthDelimited)
		var1409, var2192 = protoModule.writeString(var1409, var1410, self.event_id)
		buff = var1409
		var1408 = var1410
	end
	local buff_1 = buffer.create(var1408)
	buffer.copy(buff_1, 0, buff, 0, var1408)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref)
	local var1408 = t_45.new()
	local var1409 = 0
	while var1409 < buffer.len(p45) do
		local _ = nil
		local var1410 = nil
		local var1411, var1412, var1413 = protoModule.readTag(p45, var1409)
		local var1414 = var1411
		var1410 = var1412
		var1409 = var1413
		
		if var1410 == protoModule.wireTypes.varint then
			local _ = nil
			local var1415, var1416 = protoModule.readVarInt(p45, var1409)
			local _ = var1415
			var1409 = var1416
			continue
		end
		if var1410 == protoModule.wireTypes.lengthDelimited then
			if var1414 == 1 then
				local _ = nil
				local var1417, var1418 = protoModule.readBuffer(p45, var1409)
				var1409 = var1418
				var1408.event_id = buffer.tostring(var1417)
			else
				local _ = nil
				local var1419, var1420 = protoModule.readVarInt(p45, var1409)
				var1409 = var1420 + var1419
			end
		elseif var1410 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1421, var1422 = protoModule.readFixed32(p45, var1409)
			local _ = var1421
			var1409 = var1422
		elseif var1410 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1423, var1424 = protoModule.readFixed64(p45, var1409)
			local _ = var1423
			var1409 = var1424
		else
			error("Unsupported wire type: " .. var2196)
		end
	end
	return var1408
end

function t_45:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_45:jsonDecode()
	-- upvalues: t_45 (ref)
	local var1425 = t_45.new()
	
	if self.event_id ~= nil then
		var1425.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1425.event_id = self.eventId
	end
	return var1425
end

t_45.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_45
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p46)
	-- upvalues: t_46 (ref)
	return setmetatable({
		universe_id = if p46 == nil or p46.universe_id == nil then "" else p46.universe_id,
		entry_map = if p46 == nil or p46.entry_map == nil then {} else p46.entry_map,
		entry_order = if p46 == nil or p46.entry_order == nil then {} else p46.entry_order,
		creator_key = if p46 == nil or p46.creator_key == nil then "" else p46.creator_key,
		pill_tabs = if p46 == nil or p46.pill_tabs == nil then nil else p46.pill_tabs
	}, t_46)
end

function t_46:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1425 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1426, var1427 = protoModule.writeTag(buff, var1425, 1, protoModule.wireTypes.lengthDelimited)
		var1426, var2216 = protoModule.writeString(var1426, var1427, self.universe_id)
		buff = var1426
		var1425 = var1427
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1428, var1429 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1428, var2218 = protoModule.writeString(var1428, var1429, i)
			local var1430 = v:encode()
			var1429, var2220 = protoModule.writeTag(var1428, var1429, 2, protoModule.wireTypes.lengthDelimited)
			var1429, var2220 = protoModule.writeBuffer(var1429, var2220, var1430, buffer.len(var1430))
			local var1431 = var1429
			local var1432 = var2220
			local var1433, var1434 = protoModule.writeTag(buff, var1425, 2, protoModule.wireTypes.lengthDelimited)
			var1433, var2224 = protoModule.writeBuffer(var1433, var1434, var1431, var1432)
			buff = var1433
			var1425 = var1434
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1435, var1436 = protoModule.writeTag(buff, var1425, 3, protoModule.wireTypes.lengthDelimited)
			var1435, var2226 = protoModule.writeString(var1435, var1436, v)
			buff = var1435
			var1425 = var1436
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1437, var1438 = protoModule.writeTag(buff, var1425, 4, protoModule.wireTypes.lengthDelimited)
		var1437, var2228 = protoModule.writeString(var1437, var1438, self.creator_key)
		buff = var1437
		var1425 = var1438
	end
	if self.pill_tabs ~= nil then
		local var1439 = self.pill_tabs:encode()
		local var1440, var1441 = protoModule.writeTag(buff, var1425, 5, protoModule.wireTypes.lengthDelimited)
		var1440, var2231 = protoModule.writeBuffer(var1440, var1441, var1439, buffer.len(var1439))
		buff = var1440
		var1425 = var1441
	end
	local buff_1 = buffer.create(var1425)
	buffer.copy(buff_1, 0, buff, 0, var1425)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1442 = t_46.new()
	local var1443 = 0
	while var1443 < buffer.len(p46) do
		local _ = nil
		local var1444 = nil
		local var1445, var1446, var1447 = protoModule.readTag(p46, var1443)
		local var1448 = var1445
		var1444 = var1446
		var1443 = var1447
		
		if var1444 == protoModule.wireTypes.varint then
			local _ = nil
			local var1449, var1450 = protoModule.readVarInt(p46, var1443)
			local _ = var1449
			var1443 = var1450
			continue
		end
		if var1444 == protoModule.wireTypes.lengthDelimited then
			if var1448 == 1 then
				local _ = nil
				local var1451, var1452 = protoModule.readBuffer(p46, var1443)
				var1443 = var1452
				var1442.universe_id = buffer.tostring(var1451)
			elseif var1448 == 2 then
				local _ = nil
				local var1453, var1454 = protoModule.readBuffer(p46, var1443)
				var1443 = var1454
				var1453 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1453)
				var1442.entry_map[var1453.key or ""] = var1453.value or t.FeedEntry.new()
			elseif var1448 == 3 then
				local _ = nil
				local var1455, var1456 = protoModule.readBuffer(p46, var1443)
				var1443 = var1456
				table.insert(var1442.entry_order, buffer.tostring(var1455))
			elseif var1448 == 4 then
				local _ = nil
				local var1457, var1458 = protoModule.readBuffer(p46, var1443)
				var1443 = var1458
				var1442.creator_key = buffer.tostring(var1457)
			elseif var1448 == 5 then
				local _ = nil
				local var1459, var1460 = protoModule.readBuffer(p46, var1443)
				var1443 = var1460
				var1442.pill_tabs = t.PillTabsInputData.decode(var1459)
			else
				local _ = nil
				local var1461, var1462 = protoModule.readVarInt(p46, var1443)
				var1443 = var1462 + var1461
			end
		elseif var1444 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1463, var1464 = protoModule.readFixed32(p46, var1443)
			local _ = var1463
			var1443 = var1464
		elseif var1444 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1465, var1466 = protoModule.readFixed64(p46, var1443)
			local _ = var1465
			var1443 = var1466
		else
			error("Unsupported wire type: " .. var2235)
		end
	end
	return var1442
end

function t_46:jsonEncode()
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

function t_46:jsonDecode()
	-- upvalues: t_46 (ref), t (ref)
	local var1467 = t_46.new()
	
	if self.universe_id ~= nil then
		var1467.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1467.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1467.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1467.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1467.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1467.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1467.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1467.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1467.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1467.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1467
end

t_46.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_46
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p47)
	-- upvalues: t_47 (ref)
	return setmetatable({
		key = if p47 == nil or p47.key == nil then "" else p47.key,
		value = if p47 == nil or p47.value == nil then nil else p47.value
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1468 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1469, var1470 = protoModule.writeTag(buff, var1468, 1, protoModule.wireTypes.lengthDelimited)
		var1469, var2269 = protoModule.writeString(var1469, var1470, self.key)
		buff = var1469
		var1468 = var1470
	end
	if self.value ~= nil then
		local var1471 = self.value:encode()
		local var1472, var1473 = protoModule.writeTag(buff, var1468, 2, protoModule.wireTypes.lengthDelimited)
		var1472, var2272 = protoModule.writeBuffer(var1472, var1473, var1471, buffer.len(var1471))
		buff = var1472
		var1468 = var1473
	end
	local buff_1 = buffer.create(var1468)
	buffer.copy(buff_1, 0, buff, 0, var1468)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1468 = t_47.new()
	local var1469 = 0
	while var1469 < buffer.len(p47) do
		local _ = nil
		local var1470 = nil
		local var1471, var1472, var1473 = protoModule.readTag(p47, var1469)
		local var1474 = var1471
		var1470 = var1472
		var1469 = var1473
		
		if var1470 == protoModule.wireTypes.varint then
			local _ = nil
			local var1475, var1476 = protoModule.readVarInt(p47, var1469)
			local _ = var1475
			var1469 = var1476
			continue
		end
		if var1470 == protoModule.wireTypes.lengthDelimited then
			if var1474 == 1 then
				local _ = nil
				local var1477, var1478 = protoModule.readBuffer(p47, var1469)
				var1469 = var1478
				var1468.key = buffer.tostring(var1477)
			elseif var1474 == 2 then
				local _ = nil
				local var1479, var1480 = protoModule.readBuffer(p47, var1469)
				var1469 = var1480
				var1468.value = t.FeedEntry.decode(var1479)
			else
				local _ = nil
				local var1481, var1482 = protoModule.readVarInt(p47, var1469)
				var1469 = var1482 + var1481
			end
		elseif var1470 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1483, var1484 = protoModule.readFixed32(p47, var1469)
			local _ = var1483
			var1469 = var1484
		elseif var1470 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1485, var1486 = protoModule.readFixed64(p47, var1469)
			local _ = var1485
			var1469 = var1486
		else
			error("Unsupported wire type: " .. var2276)
		end
	end
	return var1468
end

function t_47:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_47:jsonDecode()
	-- upvalues: t_47 (ref), t (ref)
	local var1487 = t_47.new()
	
	if self.key ~= nil then
		var1487.key = self.key
	end
	if self.value ~= nil then
		var1487.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1487
end

t_47.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_47
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p48)
	-- upvalues: t_48 (ref)
	return setmetatable({
		options = if p48 == nil or p48.options == nil then {} else p48.options,
		default_option_id = if p48 == nil or p48.default_option_id == nil then "" else p48.default_option_id
	}, t_48)
end

function t_48:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1487 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1488 = v:encode()
			local var1489, var1490 = protoModule.writeTag(buff, var1487, 1, protoModule.wireTypes.lengthDelimited)
			var1489, var2299 = protoModule.writeBuffer(var1489, var1490, var1488, buffer.len(var1488))
			buff = var1489
			var1487 = var1490
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1491, var1492 = protoModule.writeTag(buff, var1487, 2, protoModule.wireTypes.lengthDelimited)
		var1491, var2301 = protoModule.writeString(var1491, var1492, self.default_option_id)
		buff = var1491
		var1487 = var1492
	end
	local buff_1 = buffer.create(var1487)
	buffer.copy(buff_1, 0, buff, 0, var1487)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1493 = t_48.new()
	local var1494 = 0
	while var1494 < buffer.len(p48) do
		local _ = nil
		local var1495 = nil
		local var1496, var1497, var1498 = protoModule.readTag(p48, var1494)
		local var1499 = var1496
		var1495 = var1497
		var1494 = var1498
		
		if var1495 == protoModule.wireTypes.varint then
			local _ = nil
			local var1500, var1501 = protoModule.readVarInt(p48, var1494)
			local _ = var1500
			var1494 = var1501
			continue
		end
		if var1495 == protoModule.wireTypes.lengthDelimited then
			if var1499 == 1 then
				local _ = nil
				local var1502, var1503 = protoModule.readBuffer(p48, var1494)
				var1494 = var1503
				table.insert(var1493.options, t.PillTabsInputData_PillTabOption.decode(var1502))
			elseif var1499 == 2 then
				local _ = nil
				local var1504, var1505 = protoModule.readBuffer(p48, var1494)
				var1494 = var1505
				var1493.default_option_id = buffer.tostring(var1504)
			else
				local _ = nil
				local var1506, var1507 = protoModule.readVarInt(p48, var1494)
				var1494 = var1507 + var1506
			end
		elseif var1495 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1508, var1509 = protoModule.readFixed32(p48, var1494)
			local _ = var1508
			var1494 = var1509
		elseif var1495 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1510, var1511 = protoModule.readFixed64(p48, var1494)
			local _ = var1510
			var1494 = var1511
		else
			error("Unsupported wire type: " .. var2305)
		end
	end
	return var1493
end

function t_48:jsonEncode()
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

function t_48:jsonDecode()
	-- upvalues: t_48 (ref), t (ref)
	local var1512 = t_48.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1512.options = t_1
	end
	if self.default_option_id ~= nil then
		var1512.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1512.default_option_id = self.defaultOptionId
	end
	return var1512
end

t_48.descriptor = {
	name = "PillTabsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabsInputData"
}
t.PillTabsInputData = t_48
typeRegistryModule.default:register(t.PillTabsInputData)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p49)
	-- upvalues: t_49 (ref)
	return setmetatable({
		option_id = if p49 == nil or p49.option_id == nil then "" else p49.option_id,
		display_name = if p49 == nil or p49.display_name == nil then "" else p49.display_name
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1513 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1514, var1515 = protoModule.writeTag(buff, var1513, 1, protoModule.wireTypes.lengthDelimited)
		var1514, var2329 = protoModule.writeString(var1514, var1515, self.option_id)
		buff = var1514
		var1513 = var1515
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1516, var1517 = protoModule.writeTag(buff, var1513, 2, protoModule.wireTypes.lengthDelimited)
		var1516, var2331 = protoModule.writeString(var1516, var1517, self.display_name)
		buff = var1516
		var1513 = var1517
	end
	local buff_1 = buffer.create(var1513)
	buffer.copy(buff_1, 0, buff, 0, var1513)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref)
	local var1513 = t_49.new()
	local var1514 = 0
	while var1514 < buffer.len(p49) do
		local _ = nil
		local var1515 = nil
		local var1516, var1517, var1518 = protoModule.readTag(p49, var1514)
		local var1519 = var1516
		var1515 = var1517
		var1514 = var1518
		
		if var1515 == protoModule.wireTypes.varint then
			local _ = nil
			local var1520, var1521 = protoModule.readVarInt(p49, var1514)
			local _ = var1520
			var1514 = var1521
			continue
		end
		if var1515 == protoModule.wireTypes.lengthDelimited then
			if var1519 == 1 then
				local _ = nil
				local var1522, var1523 = protoModule.readBuffer(p49, var1514)
				var1514 = var1523
				var1513.option_id = buffer.tostring(var1522)
			elseif var1519 == 2 then
				local _ = nil
				local var1524, var1525 = protoModule.readBuffer(p49, var1514)
				var1514 = var1525
				var1513.display_name = buffer.tostring(var1524)
			else
				local _ = nil
				local var1526, var1527 = protoModule.readVarInt(p49, var1514)
				var1514 = var1527 + var1526
			end
		elseif var1515 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1528, var1529 = protoModule.readFixed32(p49, var1514)
			local _ = var1528
			var1514 = var1529
		elseif var1515 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1530, var1531 = protoModule.readFixed64(p49, var1514)
			local _ = var1530
			var1514 = var1531
		else
			error("Unsupported wire type: " .. var2335)
		end
	end
	return var1513
end

function t_49:jsonEncode()
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	return t
end

function t_49:jsonDecode()
	-- upvalues: t_49 (ref)
	local var1532 = t_49.new()
	
	if self.option_id ~= nil then
		var1532.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1532.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1532.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1532.display_name = self.displayName
	end
	return var1532
end

t_49.descriptor = {
	name = "PillTabsInputData_PillTabOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.PillTabOption"
}
t.PillTabsInputData_PillTabOption = t_49
typeRegistryModule.default:register(t.PillTabsInputData_PillTabOption)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p50)
	-- upvalues: t_50 (ref)
	return setmetatable({
		game_passes = if p50 == nil or p50.game_passes == nil then {} else p50.game_passes
	}, t_50)
end

function t_50:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1532 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1533 = v:encode()
			local var1534, var1535 = protoModule.writeTag(buff, var1532, 1, protoModule.wireTypes.lengthDelimited)
			var1534, var2358 = protoModule.writeBuffer(var1534, var1535, var1533, buffer.len(var1533))
			buff = var1534
			var1532 = var1535
		end
	end
	local buff_1 = buffer.create(var1532)
	buffer.copy(buff_1, 0, buff, 0, var1532)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1536 = t_50.new()
	local var1537 = 0
	while var1537 < buffer.len(p50) do
		local _ = nil
		local var1538 = nil
		local var1539, var1540, var1541 = protoModule.readTag(p50, var1537)
		local var1542 = var1539
		var1538 = var1540
		var1537 = var1541
		
		if var1538 == protoModule.wireTypes.varint then
			local _ = nil
			local var1543, var1544 = protoModule.readVarInt(p50, var1537)
			local _ = var1543
			var1537 = var1544
			continue
		end
		if var1538 == protoModule.wireTypes.lengthDelimited then
			if var1542 == 1 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p50, var1537)
				var1537 = var1546
				table.insert(var1536.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1545))
			else
				local _ = nil
				local var1547, var1548 = protoModule.readVarInt(p50, var1537)
				var1537 = var1548 + var1547
			end
		elseif var1538 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1549, var1550 = protoModule.readFixed32(p50, var1537)
			local _ = var1549
			var1537 = var1550
		elseif var1538 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1551, var1552 = protoModule.readFixed64(p50, var1537)
			local _ = var1551
			var1537 = var1552
		else
			error("Unsupported wire type: " .. var2362)
		end
	end
	return var1536
end

function t_50:jsonEncode()
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

function t_50:jsonDecode()
	-- upvalues: t_50 (ref), t (ref)
	local var1553 = t_50.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1553.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1553.game_passes = t_1
	end
	return var1553
end

t_50.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_50
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p51)
	-- upvalues: t_51 (ref)
	return setmetatable({
		game_pass_id = if p51 == nil or p51.game_pass_id == nil then "" else p51.game_pass_id
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1554 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1555, var1556 = protoModule.writeTag(buff, var1554, 1, protoModule.wireTypes.lengthDelimited)
		var1555, var2385 = protoModule.writeString(var1555, var1556, self.game_pass_id)
		buff = var1555
		var1554 = var1556
	end
	local buff_1 = buffer.create(var1554)
	buffer.copy(buff_1, 0, buff, 0, var1554)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref)
	local var1554 = t_51.new()
	local var1555 = 0
	while var1555 < buffer.len(p51) do
		local _ = nil
		local var1556 = nil
		local var1557, var1558, var1559 = protoModule.readTag(p51, var1555)
		local var1560 = var1557
		var1556 = var1558
		var1555 = var1559
		
		if var1556 == protoModule.wireTypes.varint then
			local _ = nil
			local var1561, var1562 = protoModule.readVarInt(p51, var1555)
			local _ = var1561
			var1555 = var1562
			continue
		end
		if var1556 == protoModule.wireTypes.lengthDelimited then
			if var1560 == 1 then
				local _ = nil
				local var1563, var1564 = protoModule.readBuffer(p51, var1555)
				var1555 = var1564
				var1554.game_pass_id = buffer.tostring(var1563)
			else
				local _ = nil
				local var1565, var1566 = protoModule.readVarInt(p51, var1555)
				var1555 = var1566 + var1565
			end
		elseif var1556 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1567, var1568 = protoModule.readFixed32(p51, var1555)
			local _ = var1567
			var1555 = var1568
		elseif var1556 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1569, var1570 = protoModule.readFixed64(p51, var1555)
			local _ = var1569
			var1555 = var1570
		else
			error("Unsupported wire type: " .. var2389)
		end
	end
	return var1554
end

function t_51:jsonEncode()
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_51:jsonDecode()
	-- upvalues: t_51 (ref)
	local var1571 = t_51.new()
	
	if self.game_pass_id ~= nil then
		var1571.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1571.game_pass_id = self.gamePassId
	end
	return var1571
end

t_51.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_51
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p52)
	-- upvalues: t_52 (ref)
	return setmetatable({
		developer_products = if p52 == nil or p52.developer_products == nil then {} else p52.developer_products
	}, t_52)
end

function t_52:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1571 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1572 = v:encode()
			local var1573, var1574 = protoModule.writeTag(buff, var1571, 1, protoModule.wireTypes.lengthDelimited)
			var1573, var2410 = protoModule.writeBuffer(var1573, var1574, var1572, buffer.len(var1572))
			buff = var1573
			var1571 = var1574
		end
	end
	local buff_1 = buffer.create(var1571)
	buffer.copy(buff_1, 0, buff, 0, var1571)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1575 = t_52.new()
	local var1576 = 0
	while var1576 < buffer.len(p52) do
		local _ = nil
		local var1577 = nil
		local var1578, var1579, var1580 = protoModule.readTag(p52, var1576)
		local var1581 = var1578
		var1577 = var1579
		var1576 = var1580
		
		if var1577 == protoModule.wireTypes.varint then
			local _ = nil
			local var1582, var1583 = protoModule.readVarInt(p52, var1576)
			local _ = var1582
			var1576 = var1583
			continue
		end
		if var1577 == protoModule.wireTypes.lengthDelimited then
			if var1581 == 1 then
				local _ = nil
				local var1584, var1585 = protoModule.readBuffer(p52, var1576)
				var1576 = var1585
				table.insert(var1575.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1584))
			else
				local _ = nil
				local var1586, var1587 = protoModule.readVarInt(p52, var1576)
				var1576 = var1587 + var1586
			end
		elseif var1577 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1588, var1589 = protoModule.readFixed32(p52, var1576)
			local _ = var1588
			var1576 = var1589
		elseif var1577 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1590, var1591 = protoModule.readFixed64(p52, var1576)
			local _ = var1590
			var1576 = var1591
		else
			error("Unsupported wire type: " .. var2414)
		end
	end
	return var1575
end

function t_52:jsonEncode()
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

function t_52:jsonDecode()
	-- upvalues: t_52 (ref), t (ref)
	local var1592 = t_52.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1592.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1592.developer_products = t_1
	end
	return var1592
end

t_52.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_52
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p53)
	-- upvalues: t_53 (ref)
	return setmetatable({
		developer_product_id = if p53 == nil or p53.developer_product_id == nil then "" else p53.developer_product_id
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1593 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1594, var1595 = protoModule.writeTag(buff, var1593, 1, protoModule.wireTypes.lengthDelimited)
		var1594, var2437 = protoModule.writeString(var1594, var1595, self.developer_product_id)
		buff = var1594
		var1593 = var1595
	end
	local buff_1 = buffer.create(var1593)
	buffer.copy(buff_1, 0, buff, 0, var1593)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref)
	local var1593 = t_53.new()
	local var1594 = 0
	while var1594 < buffer.len(p53) do
		local _ = nil
		local var1595 = nil
		local var1596, var1597, var1598 = protoModule.readTag(p53, var1594)
		local var1599 = var1596
		var1595 = var1597
		var1594 = var1598
		
		if var1595 == protoModule.wireTypes.varint then
			local _ = nil
			local var1600, var1601 = protoModule.readVarInt(p53, var1594)
			local _ = var1600
			var1594 = var1601
			continue
		end
		if var1595 == protoModule.wireTypes.lengthDelimited then
			if var1599 == 1 then
				local _ = nil
				local var1602, var1603 = protoModule.readBuffer(p53, var1594)
				var1594 = var1603
				var1593.developer_product_id = buffer.tostring(var1602)
			else
				local _ = nil
				local var1604, var1605 = protoModule.readVarInt(p53, var1594)
				var1594 = var1605 + var1604
			end
		elseif var1595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1606, var1607 = protoModule.readFixed32(p53, var1594)
			local _ = var1606
			var1594 = var1607
		elseif var1595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1608, var1609 = protoModule.readFixed64(p53, var1594)
			local _ = var1608
			var1594 = var1609
		else
			error("Unsupported wire type: " .. var2441)
		end
	end
	return var1593
end

function t_53:jsonEncode()
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_53:jsonDecode()
	-- upvalues: t_53 (ref)
	local var1610 = t_53.new()
	
	if self.developer_product_id ~= nil then
		var1610.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1610.developer_product_id = self.developerProductId
	end
	return var1610
end

t_53.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_53
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p54)
	-- upvalues: t_54 (ref)
	return setmetatable({
		subscriptions = if p54 == nil or p54.subscriptions == nil then {} else p54.subscriptions
	}, t_54)
end

function t_54:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1610 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1611 = v:encode()
			local var1612, var1613 = protoModule.writeTag(buff, var1610, 1, protoModule.wireTypes.lengthDelimited)
			var1612, var2462 = protoModule.writeBuffer(var1612, var1613, var1611, buffer.len(var1611))
			buff = var1612
			var1610 = var1613
		end
	end
	local buff_1 = buffer.create(var1610)
	buffer.copy(buff_1, 0, buff, 0, var1610)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1614 = t_54.new()
	local var1615 = 0
	while var1615 < buffer.len(p54) do
		local _ = nil
		local var1616 = nil
		local var1617, var1618, var1619 = protoModule.readTag(p54, var1615)
		local var1620 = var1617
		var1616 = var1618
		var1615 = var1619
		
		if var1616 == protoModule.wireTypes.varint then
			local _ = nil
			local var1621, var1622 = protoModule.readVarInt(p54, var1615)
			local _ = var1621
			var1615 = var1622
			continue
		end
		if var1616 == protoModule.wireTypes.lengthDelimited then
			if var1620 == 1 then
				local _ = nil
				local var1623, var1624 = protoModule.readBuffer(p54, var1615)
				var1615 = var1624
				table.insert(var1614.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1623))
			else
				local _ = nil
				local var1625, var1626 = protoModule.readVarInt(p54, var1615)
				var1615 = var1626 + var1625
			end
		elseif var1616 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1627, var1628 = protoModule.readFixed32(p54, var1615)
			local _ = var1627
			var1615 = var1628
		elseif var1616 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1629, var1630 = protoModule.readFixed64(p54, var1615)
			local _ = var1629
			var1615 = var1630
		else
			error("Unsupported wire type: " .. var2466)
		end
	end
	return var1614
end

function t_54:jsonEncode()
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

function t_54:jsonDecode()
	-- upvalues: t_54 (ref), t (ref)
	local var1631 = t_54.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1631.subscriptions = t_1
	end
	return var1631
end

t_54.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_54
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p55)
	-- upvalues: t_55 (ref)
	return setmetatable({
		subscription_id = if p55 == nil or p55.subscription_id == nil then "" else p55.subscription_id
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1632 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1633, var1634 = protoModule.writeTag(buff, var1632, 1, protoModule.wireTypes.lengthDelimited)
		var1633, var2488 = protoModule.writeString(var1633, var1634, self.subscription_id)
		buff = var1633
		var1632 = var1634
	end
	local buff_1 = buffer.create(var1632)
	buffer.copy(buff_1, 0, buff, 0, var1632)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1632 = t_55.new()
	local var1633 = 0
	while var1633 < buffer.len(p55) do
		local _ = nil
		local var1634 = nil
		local var1635, var1636, var1637 = protoModule.readTag(p55, var1633)
		local var1638 = var1635
		var1634 = var1636
		var1633 = var1637
		
		if var1634 == protoModule.wireTypes.varint then
			local _ = nil
			local var1639, var1640 = protoModule.readVarInt(p55, var1633)
			local _ = var1639
			var1633 = var1640
			continue
		end
		if var1634 == protoModule.wireTypes.lengthDelimited then
			if var1638 == 1 then
				local _ = nil
				local var1641, var1642 = protoModule.readBuffer(p55, var1633)
				var1633 = var1642
				var1632.subscription_id = buffer.tostring(var1641)
			else
				local _ = nil
				local var1643, var1644 = protoModule.readVarInt(p55, var1633)
				var1633 = var1644 + var1643
			end
		elseif var1634 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1645, var1646 = protoModule.readFixed32(p55, var1633)
			local _ = var1645
			var1633 = var1646
		elseif var1634 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1647, var1648 = protoModule.readFixed64(p55, var1633)
			local _ = var1647
			var1633 = var1648
		else
			error("Unsupported wire type: " .. var2492)
		end
	end
	return var1632
end

function t_55:jsonEncode()
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_55:jsonDecode()
	-- upvalues: t_55 (ref)
	local var1649 = t_55.new()
	
	if self.subscription_id ~= nil then
		var1649.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1649.subscription_id = self.subscriptionId
	end
	return var1649
end

t_55.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_55
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p56)
	-- upvalues: t_56 (ref)
	return setmetatable({
		items = if p56 == nil or p56.items == nil then {} else p56.items,
		universe_id = if p56 == nil or p56.universe_id == nil then "" else p56.universe_id,
		section_title = if p56 == nil or p56.section_title == nil then "" else p56.section_title,
		creator_key = if p56 == nil or p56.creator_key == nil then "" else p56.creator_key,
		collection_item_size = if p56 == nil or p56.collection_item_size == nil then "" else p56.collection_item_size,
		item_height_mode = if p56 == nil or p56.item_height_mode == nil then "" else p56.item_height_mode,
		experience_store_product_type = if p56 == nil or p56.experience_store_product_type == nil then "" else p56.experience_store_product_type,
		content_type = if p56 == nil or p56.content_type == nil then "" else p56.content_type,
		item_type = if p56 == nil or p56.item_type == nil then "" else p56.item_type,
		filter_category_id = if p56 == nil or p56.filter_category_id == nil then "" else p56.filter_category_id
	}, t_56)
end

function t_56:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1649 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1650 = v:encode()
			local var1651, var1652 = protoModule.writeTag(buff, var1649, 1, protoModule.wireTypes.lengthDelimited)
			var1651, var2513 = protoModule.writeBuffer(var1651, var1652, var1650, buffer.len(var1650))
			buff = var1651
			var1649 = var1652
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1653, var1654 = protoModule.writeTag(buff, var1649, 2, protoModule.wireTypes.lengthDelimited)
		var1653, var2515 = protoModule.writeString(var1653, var1654, self.universe_id)
		buff = var1653
		var1649 = var1654
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1655, var1656 = protoModule.writeTag(buff, var1649, 3, protoModule.wireTypes.lengthDelimited)
		var1655, var2517 = protoModule.writeString(var1655, var1656, self.section_title)
		buff = var1655
		var1649 = var1656
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1657, var1658 = protoModule.writeTag(buff, var1649, 4, protoModule.wireTypes.lengthDelimited)
		var1657, var2519 = protoModule.writeString(var1657, var1658, self.creator_key)
		buff = var1657
		var1649 = var1658
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1659, var1660 = protoModule.writeTag(buff, var1649, 5, protoModule.wireTypes.lengthDelimited)
		var1659, var2521 = protoModule.writeString(var1659, var1660, self.collection_item_size)
		buff = var1659
		var1649 = var1660
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1661, var1662 = protoModule.writeTag(buff, var1649, 6, protoModule.wireTypes.lengthDelimited)
		var1661, var2523 = protoModule.writeString(var1661, var1662, self.item_height_mode)
		buff = var1661
		var1649 = var1662
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1663, var1664 = protoModule.writeTag(buff, var1649, 7, protoModule.wireTypes.lengthDelimited)
		var1663, var2525 = protoModule.writeString(var1663, var1664, self.experience_store_product_type)
		buff = var1663
		var1649 = var1664
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1665, var1666 = protoModule.writeTag(buff, var1649, 8, protoModule.wireTypes.lengthDelimited)
		var1665, var2527 = protoModule.writeString(var1665, var1666, self.content_type)
		buff = var1665
		var1649 = var1666
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1667, var1668 = protoModule.writeTag(buff, var1649, 9, protoModule.wireTypes.lengthDelimited)
		var1667, var2529 = protoModule.writeString(var1667, var1668, self.item_type)
		buff = var1667
		var1649 = var1668
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1669, var1670 = protoModule.writeTag(buff, var1649, 10, protoModule.wireTypes.lengthDelimited)
		var1669, var2531 = protoModule.writeString(var1669, var1670, self.filter_category_id)
		buff = var1669
		var1649 = var1670
	end
	local buff_1 = buffer.create(var1649)
	buffer.copy(buff_1, 0, buff, 0, var1649)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref), t (ref)
	local var1671 = t_56.new()
	local var1672 = 0
	while var1672 < buffer.len(p56) do
		local _ = nil
		local var1673 = nil
		local var1674, var1675, var1676 = protoModule.readTag(p56, var1672)
		local var1677 = var1674
		var1673 = var1675
		var1672 = var1676
		
		if var1673 == protoModule.wireTypes.varint then
			local _ = nil
			local var1678, var1679 = protoModule.readVarInt(p56, var1672)
			local _ = var1678
			var1672 = var1679
			continue
		end
		if var1673 == protoModule.wireTypes.lengthDelimited then
			if var1677 == 1 then
				local _ = nil
				local var1680, var1681 = protoModule.readBuffer(p56, var1672)
				var1672 = var1681
				table.insert(var1671.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1680))
			elseif var1677 == 2 then
				local _ = nil
				local var1682, var1683 = protoModule.readBuffer(p56, var1672)
				var1672 = var1683
				var1671.universe_id = buffer.tostring(var1682)
			elseif var1677 == 3 then
				local _ = nil
				local var1684, var1685 = protoModule.readBuffer(p56, var1672)
				var1672 = var1685
				var1671.section_title = buffer.tostring(var1684)
			elseif var1677 == 4 then
				local _ = nil
				local var1686, var1687 = protoModule.readBuffer(p56, var1672)
				var1672 = var1687
				var1671.creator_key = buffer.tostring(var1686)
			elseif var1677 == 5 then
				local _ = nil
				local var1688, var1689 = protoModule.readBuffer(p56, var1672)
				var1672 = var1689
				var1671.collection_item_size = buffer.tostring(var1688)
			elseif var1677 == 6 then
				local _ = nil
				local var1690, var1691 = protoModule.readBuffer(p56, var1672)
				var1672 = var1691
				var1671.item_height_mode = buffer.tostring(var1690)
			elseif var1677 == 7 then
				local _ = nil
				local var1692, var1693 = protoModule.readBuffer(p56, var1672)
				var1672 = var1693
				var1671.experience_store_product_type = buffer.tostring(var1692)
			elseif var1677 == 8 then
				local _ = nil
				local var1694, var1695 = protoModule.readBuffer(p56, var1672)
				var1672 = var1695
				var1671.content_type = buffer.tostring(var1694)
			elseif var1677 == 9 then
				local _ = nil
				local var1696, var1697 = protoModule.readBuffer(p56, var1672)
				var1672 = var1697
				var1671.item_type = buffer.tostring(var1696)
			elseif var1677 == 10 then
				local _ = nil
				local var1698, var1699 = protoModule.readBuffer(p56, var1672)
				var1672 = var1699
				var1671.filter_category_id = buffer.tostring(var1698)
			else
				local _ = nil
				local var1700, var1701 = protoModule.readVarInt(p56, var1672)
				var1672 = var1701 + var1700
			end
		elseif var1673 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1702, var1703 = protoModule.readFixed32(p56, var1672)
			local _ = var1702
			var1672 = var1703
		elseif var1673 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1704, var1705 = protoModule.readFixed64(p56, var1672)
			local _ = var1704
			var1672 = var1705
		else
			error("Unsupported wire type: " .. var2535)
		end
	end
	return var1671
end

function t_56:jsonEncode()
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

function t_56:jsonDecode()
	-- upvalues: t_56 (ref), t (ref)
	local var1706 = t_56.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1706.items = t_1
	end
	if self.universe_id ~= nil then
		var1706.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1706.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1706.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1706.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1706.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1706.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1706.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1706.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1706.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1706.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1706.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1706.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1706.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1706.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1706.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1706.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1706.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1706.filter_category_id = self.filterCategoryId
	end
	return var1706
end

t_56.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_56
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p57)
	-- upvalues: t (ref), t_57 (ref)
	return setmetatable({
		item_id = if p57 == nil or p57.item_id == nil then "" else p57.item_id,
		identifier = if p57 == nil or p57.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p57.identifier
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1707 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1708, var1709 = protoModule.writeTag(buff, var1707, 1, protoModule.wireTypes.lengthDelimited)
		var1708, var2575 = protoModule.writeString(var1708, var1709, self.item_id)
		buff = var1708
		var1707 = var1709
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1710, var1711 = protoModule.writeTag(buff, var1707, 2, protoModule.wireTypes.varint)
		var1710, var2577 = protoModule.writeVarInt(var1710, var1711, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1710
		var1707 = var1711
	end
	local buff_1 = buffer.create(var1707)
	buffer.copy(buff_1, 0, buff, 0, var1707)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1707 = t_57.new()
	local var1708 = 0
	while var1708 < buffer.len(p57) do
		local _ = nil
		local var1709 = nil
		local var1710, var1711, var1712 = protoModule.readTag(p57, var1708)
		local var1713 = var1710
		var1709 = var1711
		var1708 = var1712
		
		if var1709 == protoModule.wireTypes.varint then
			if var1713 == 2 then
				local _ = nil
				local var1714, var1715 = protoModule.readVarIntI32(p57, var1708)
				local var1716 = var1714
				var1708 = var1715
				var1707.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1716) or var1716
			else
				local _ = nil
				local var1717, var1718 = protoModule.readVarInt(p57, var1708)
				local _ = var1717
				var1708 = var1718
			end
		end
		if var1709 == protoModule.wireTypes.lengthDelimited then
			if var1713 == 1 then
				local _ = nil
				local var1719, var1720 = protoModule.readBuffer(p57, var1708)
				var1708 = var1720
				var1707.item_id = buffer.tostring(var1719)
			else
				local _ = nil
				local var1721, var1722 = protoModule.readVarInt(p57, var1708)
				var1708 = var1722 + var1721
			end
		elseif var1709 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1723, var1724 = protoModule.readFixed32(p57, var1708)
			local _ = var1723
			var1708 = var1724
		elseif var1709 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1725, var1726 = protoModule.readFixed64(p57, var1708)
			local _ = var1725
			var1708 = var1726
		else
			error("Unsupported wire type: " .. var2581)
		end
	end
	return var1707
end

function t_57:jsonEncode()
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

function t_57:jsonDecode()
	-- upvalues: t_57 (ref), t (ref)
	local var1727 = t_57.new()
	
	if self.item_id ~= nil then
		var1727.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1727.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1727.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1727
end

t_57.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_57
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p58)
		return if p58 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p58 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p58 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p58 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p58)
		return if p58 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p58 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p58 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p58 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p58
	end,
	fromName = function(p58)
		return if p58 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p58 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p58 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p58 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_58 = {}
t_58.__index = t_58

function t_58.new(p58)
	-- upvalues: t_58 (ref)
	return setmetatable({
		roblox_component = if p58 == nil or p58.roblox_component == nil then "" else p58.roblox_component,
		identifier = if p58 == nil or p58.identifier == nil then "" else p58.identifier,
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
	local var1727 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1728, var1729 = protoModule.writeTag(buff, var1727, 1, protoModule.wireTypes.lengthDelimited)
		var1728, var2604 = protoModule.writeString(var1728, var1729, self.roblox_component)
		buff = var1728
		var1727 = var1729
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1730, var1731 = protoModule.writeTag(buff, var1727, 2, protoModule.wireTypes.lengthDelimited)
		var1730, var2606 = protoModule.writeString(var1730, var1731, self.identifier)
		buff = var1730
		var1727 = var1731
	end
	if self.title ~= nil and self.title ~= "" then
		local var1732, var1733 = protoModule.writeTag(buff, var1727, 3, protoModule.wireTypes.lengthDelimited)
		var1732, var2608 = protoModule.writeString(var1732, var1733, self.title)
		buff = var1732
		var1727 = var1733
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1734, var1735 = protoModule.writeTag(buff, var1727, 4, protoModule.wireTypes.lengthDelimited)
		var1734, var2610 = protoModule.writeString(var1734, var1735, self.user_id)
		buff = var1734
		var1727 = var1735
	end
	if self.description ~= nil and self.description ~= "" then
		local var1736, var1737 = protoModule.writeTag(buff, var1727, 5, protoModule.wireTypes.lengthDelimited)
		var1736, var2612 = protoModule.writeString(var1736, var1737, self.description)
		buff = var1736
		var1727 = var1737
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1738, var1739 = protoModule.writeTag(buff, var1727, 6, protoModule.wireTypes.lengthDelimited)
		var1738, var2614 = protoModule.writeString(var1738, var1739, self.cta_text)
		buff = var1738
		var1727 = var1739
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1740, var1741 = protoModule.writeTag(buff, var1727, 7, protoModule.wireTypes.lengthDelimited)
		var1740, var2616 = protoModule.writeString(var1740, var1741, self.prompt_id)
		buff = var1740
		var1727 = var1741
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1742, var1743 = protoModule.writeTag(buff, var1727, 8, protoModule.wireTypes.lengthDelimited)
		var1742, var2618 = protoModule.writeString(var1742, var1743, self.prompt_type)
		buff = var1742
		var1727 = var1743
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1744, var1745 = protoModule.writeTag(buff, var1727, 9, protoModule.wireTypes.lengthDelimited)
		var1744, var2620 = protoModule.writeString(var1744, var1745, self.entity_id)
		buff = var1744
		var1727 = var1745
	end
	local buff_1 = buffer.create(var1727)
	buffer.copy(buff_1, 0, buff, 0, var1727)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1727 = t_58.new()
	local var1728 = 0
	while var1728 < buffer.len(p58) do
		local _ = nil
		local var1729 = nil
		local var1730, var1731, var1732 = protoModule.readTag(p58, var1728)
		local var1733 = var1730
		var1729 = var1731
		var1728 = var1732
		
		if var1729 == protoModule.wireTypes.varint then
			local _ = nil
			local var1734, var1735 = protoModule.readVarInt(p58, var1728)
			local _ = var1734
			var1728 = var1735
			continue
		end
		if var1729 == protoModule.wireTypes.lengthDelimited then
			if var1733 == 1 then
				local _ = nil
				local var1736, var1737 = protoModule.readBuffer(p58, var1728)
				var1728 = var1737
				var1727.roblox_component = buffer.tostring(var1736)
			elseif var1733 == 2 then
				local _ = nil
				local var1738, var1739 = protoModule.readBuffer(p58, var1728)
				var1728 = var1739
				var1727.identifier = buffer.tostring(var1738)
			elseif var1733 == 3 then
				local _ = nil
				local var1740, var1741 = protoModule.readBuffer(p58, var1728)
				var1728 = var1741
				var1727.title = buffer.tostring(var1740)
			elseif var1733 == 4 then
				local _ = nil
				local var1742, var1743 = protoModule.readBuffer(p58, var1728)
				var1728 = var1743
				var1727.user_id = buffer.tostring(var1742)
			elseif var1733 == 5 then
				local _ = nil
				local var1744, var1745 = protoModule.readBuffer(p58, var1728)
				var1728 = var1745
				var1727.description = buffer.tostring(var1744)
			elseif var1733 == 6 then
				local _ = nil
				local var1746, var1747 = protoModule.readBuffer(p58, var1728)
				var1728 = var1747
				var1727.cta_text = buffer.tostring(var1746)
			elseif var1733 == 7 then
				local _ = nil
				local var1748, var1749 = protoModule.readBuffer(p58, var1728)
				var1728 = var1749
				var1727.prompt_id = buffer.tostring(var1748)
			elseif var1733 == 8 then
				local _ = nil
				local var1750, var1751 = protoModule.readBuffer(p58, var1728)
				var1728 = var1751
				var1727.prompt_type = buffer.tostring(var1750)
			elseif var1733 == 9 then
				local _ = nil
				local var1752, var1753 = protoModule.readBuffer(p58, var1728)
				var1728 = var1753
				var1727.entity_id = buffer.tostring(var1752)
			else
				local _ = nil
				local var1754, var1755 = protoModule.readVarInt(p58, var1728)
				var1728 = var1755 + var1754
			end
		elseif var1729 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1756, var1757 = protoModule.readFixed32(p58, var1728)
			local _ = var1756
			var1728 = var1757
		elseif var1729 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1758, var1759 = protoModule.readFixed64(p58, var1728)
			local _ = var1758
			var1728 = var1759
		else
			error("Unsupported wire type: " .. var2624)
		end
	end
	return var1727
end

function t_58:jsonEncode()
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

function t_58:jsonDecode()
	-- upvalues: t_58 (ref)
	local var1760 = t_58.new()
	
	if self.roblox_component ~= nil then
		var1760.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1760.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1760.identifier = self.identifier
	end
	if self.title ~= nil then
		var1760.title = self.title
	end
	if self.user_id ~= nil then
		var1760.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1760.user_id = self.userId
	end
	if self.description ~= nil then
		var1760.description = self.description
	end
	if self.cta_text ~= nil then
		var1760.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1760.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1760.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1760.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1760.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1760.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1760.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1760.entity_id = self.entityId
	end
	return var1760
end

t_58.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_58
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p59)
	-- upvalues: t_59 (ref)
	return setmetatable({
		group_id = if p59 == nil or p59.group_id == nil then "" else p59.group_id,
		experience_id = if p59 == nil or p59.experience_id == nil then "" else p59.experience_id
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1760 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1761, var1762 = protoModule.writeTag(buff, var1760, 1, protoModule.wireTypes.lengthDelimited)
		var1761, var2660 = protoModule.writeString(var1761, var1762, self.group_id)
		buff = var1761
		var1760 = var1762
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1763, var1764 = protoModule.writeTag(buff, var1760, 2, protoModule.wireTypes.lengthDelimited)
		var1763, var2662 = protoModule.writeString(var1763, var1764, self.experience_id)
		buff = var1763
		var1760 = var1764
	end
	local buff_1 = buffer.create(var1760)
	buffer.copy(buff_1, 0, buff, 0, var1760)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1760 = t_59.new()
	local var1761 = 0
	while var1761 < buffer.len(p59) do
		local _ = nil
		local var1762 = nil
		local var1763, var1764, var1765 = protoModule.readTag(p59, var1761)
		local var1766 = var1763
		var1762 = var1764
		var1761 = var1765
		
		if var1762 == protoModule.wireTypes.varint then
			local _ = nil
			local var1767, var1768 = protoModule.readVarInt(p59, var1761)
			local _ = var1767
			var1761 = var1768
			continue
		end
		if var1762 == protoModule.wireTypes.lengthDelimited then
			if var1766 == 1 then
				local _ = nil
				local var1769, var1770 = protoModule.readBuffer(p59, var1761)
				var1761 = var1770
				var1760.group_id = buffer.tostring(var1769)
			elseif var1766 == 2 then
				local _ = nil
				local var1771, var1772 = protoModule.readBuffer(p59, var1761)
				var1761 = var1772
				var1760.experience_id = buffer.tostring(var1771)
			else
				local _ = nil
				local var1773, var1774 = protoModule.readVarInt(p59, var1761)
				var1761 = var1774 + var1773
			end
		elseif var1762 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1775, var1776 = protoModule.readFixed32(p59, var1761)
			local _ = var1775
			var1761 = var1776
		elseif var1762 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1777, var1778 = protoModule.readFixed64(p59, var1761)
			local _ = var1777
			var1761 = var1778
		else
			error("Unsupported wire type: " .. var2666)
		end
	end
	return var1760
end

function t_59:jsonEncode()
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_59:jsonDecode()
	-- upvalues: t_59 (ref)
	local var1779 = t_59.new()
	
	if self.group_id ~= nil then
		var1779.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1779.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1779.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1779.experience_id = self.experienceId
	end
	return var1779
end

t_59.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_59
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p60)
	-- upvalues: t_60 (ref)
	return setmetatable({
		title = if p60 == nil or p60.title == nil then "" else p60.title,
		dismiss_text = if p60 == nil or p60.dismiss_text == nil then "" else p60.dismiss_text,
		user_id = if p60 == nil or p60.user_id == nil then "" else p60.user_id,
		cards = if p60 == nil or p60.cards == nil then {} else p60.cards,
		prompt_id = if p60 == nil or p60.prompt_id == nil then "" else p60.prompt_id,
		prompt_type = if p60 == nil or p60.prompt_type == nil then "" else p60.prompt_type,
		sort_id = if p60 == nil or p60.sort_id == nil then "" else p60.sort_id,
		feed_item_key = if p60 == nil or p60.feed_item_key == nil then "" else p60.feed_item_key,
		client_attributes = if p60 == nil or p60.client_attributes == nil then nil else p60.client_attributes
	}, t_60)
end

function t_60:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1779 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1780, var1781 = protoModule.writeTag(buff, var1779, 1, protoModule.wireTypes.lengthDelimited)
		var1780, var2688 = protoModule.writeString(var1780, var1781, self.title)
		buff = var1780
		var1779 = var1781
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1782, var1783 = protoModule.writeTag(buff, var1779, 2, protoModule.wireTypes.lengthDelimited)
		var1782, var2690 = protoModule.writeString(var1782, var1783, self.dismiss_text)
		buff = var1782
		var1779 = var1783
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1784, var1785 = protoModule.writeTag(buff, var1779, 3, protoModule.wireTypes.lengthDelimited)
		var1784, var2692 = protoModule.writeString(var1784, var1785, self.user_id)
		buff = var1784
		var1779 = var1785
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1786 = v:encode()
			local var1787, var1788 = protoModule.writeTag(buff, var1779, 4, protoModule.wireTypes.lengthDelimited)
			var1787, var2695 = protoModule.writeBuffer(var1787, var1788, var1786, buffer.len(var1786))
			buff = var1787
			var1779 = var1788
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1789, var1790 = protoModule.writeTag(buff, var1779, 5, protoModule.wireTypes.lengthDelimited)
		var1789, var2697 = protoModule.writeString(var1789, var1790, self.prompt_id)
		buff = var1789
		var1779 = var1790
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1791, var1792 = protoModule.writeTag(buff, var1779, 6, protoModule.wireTypes.lengthDelimited)
		var1791, var2699 = protoModule.writeString(var1791, var1792, self.prompt_type)
		buff = var1791
		var1779 = var1792
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1793, var1794 = protoModule.writeTag(buff, var1779, 7, protoModule.wireTypes.lengthDelimited)
		var1793, var2701 = protoModule.writeString(var1793, var1794, self.sort_id)
		buff = var1793
		var1779 = var1794
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1795, var1796 = protoModule.writeTag(buff, var1779, 8, protoModule.wireTypes.lengthDelimited)
		var1795, var2703 = protoModule.writeString(var1795, var1796, self.feed_item_key)
		buff = var1795
		var1779 = var1796
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1797 = self.client_attributes.value:encode()
		local var1798, var1799 = protoModule.writeTag(buff, var1779, 9, protoModule.wireTypes.lengthDelimited)
		var1798, var2706 = protoModule.writeBuffer(var1798, var1799, var1797, buffer.len(var1797))
		buff = var1798
		var1779 = var1799
	end
	local buff_1 = buffer.create(var1779)
	buffer.copy(buff_1, 0, buff, 0, var1779)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var1800 = t_60.new()
	local var1801 = 0
	while var1801 < buffer.len(p60) do
		local _ = nil
		local var1802 = nil
		local var1803, var1804, var1805 = protoModule.readTag(p60, var1801)
		local var1806 = var1803
		var1802 = var1804
		var1801 = var1805
		
		if var1802 == protoModule.wireTypes.varint then
			local _ = nil
			local var1807, var1808 = protoModule.readVarInt(p60, var1801)
			local _ = var1807
			var1801 = var1808
			continue
		end
		if var1802 == protoModule.wireTypes.lengthDelimited then
			if var1806 == 1 then
				local _ = nil
				local var1809, var1810 = protoModule.readBuffer(p60, var1801)
				var1801 = var1810
				var1800.title = buffer.tostring(var1809)
			elseif var1806 == 2 then
				local _ = nil
				local var1811, var1812 = protoModule.readBuffer(p60, var1801)
				var1801 = var1812
				var1800.dismiss_text = buffer.tostring(var1811)
			elseif var1806 == 3 then
				local _ = nil
				local var1813, var1814 = protoModule.readBuffer(p60, var1801)
				var1801 = var1814
				var1800.user_id = buffer.tostring(var1813)
			elseif var1806 == 4 then
				local _ = nil
				local var1815, var1816 = protoModule.readBuffer(p60, var1801)
				var1801 = var1816
				table.insert(var1800.cards, t.CardContainerCardInputData.decode(var1815))
			elseif var1806 == 5 then
				local _ = nil
				local var1817, var1818 = protoModule.readBuffer(p60, var1801)
				var1801 = var1818
				var1800.prompt_id = buffer.tostring(var1817)
			elseif var1806 == 6 then
				local _ = nil
				local var1819, var1820 = protoModule.readBuffer(p60, var1801)
				var1801 = var1820
				var1800.prompt_type = buffer.tostring(var1819)
			elseif var1806 == 7 then
				local _ = nil
				local var1821, var1822 = protoModule.readBuffer(p60, var1801)
				var1801 = var1822
				var1800.sort_id = buffer.tostring(var1821)
			elseif var1806 == 8 then
				local _ = nil
				local var1823, var1824 = protoModule.readBuffer(p60, var1801)
				var1801 = var1824
				var1800.feed_item_key = buffer.tostring(var1823)
			elseif var1806 == 9 then
				local _ = nil
				local var1825, var1826 = protoModule.readBuffer(p60, var1801)
				var1801 = var1826
				var1800.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1825)
				}
			else
				local _ = nil
				local var1827, var1828 = protoModule.readVarInt(p60, var1801)
				var1801 = var1828 + var1827
			end
		elseif var1802 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1829, var1830 = protoModule.readFixed32(p60, var1801)
			local _ = var1829
			var1801 = var1830
		elseif var1802 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1831, var1832 = protoModule.readFixed64(p60, var1801)
			local _ = var1831
			var1801 = var1832
		else
			error("Unsupported wire type: " .. var2710)
		end
	end
	return var1800
end

function t_60:jsonEncode()
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

function t_60:jsonDecode()
	-- upvalues: t_60 (ref), t (ref)
	local var1833 = t_60.new()
	
	if self.title ~= nil then
		var1833.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1833.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1833.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1833.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1833.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1833.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1833.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1833.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1833.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1833.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1833.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1833.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1833.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1833.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1833.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1833.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1833
end

t_60.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_60
typeRegistryModule.default:register(t.CardContainerInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p61)
	-- upvalues: t_61 (ref)
	return setmetatable({
		title = if p61 == nil or p61.title == nil then "" else p61.title,
		user_id = if p61 == nil or p61.user_id == nil then "" else p61.user_id,
		description = if p61 == nil or p61.description == nil then "" else p61.description,
		cta_text = if p61 == nil or p61.cta_text == nil then "" else p61.cta_text,
		prompt_id = if p61 == nil or p61.prompt_id == nil then "" else p61.prompt_id,
		prompt_type = if p61 == nil or p61.prompt_type == nil then "" else p61.prompt_type,
		entity_id = if p61 == nil or p61.entity_id == nil then "" else p61.entity_id
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1834 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1835, var1836 = protoModule.writeTag(buff, var1834, 1, protoModule.wireTypes.lengthDelimited)
		var1835, var2748 = protoModule.writeString(var1835, var1836, self.title)
		buff = var1835
		var1834 = var1836
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1837, var1838 = protoModule.writeTag(buff, var1834, 2, protoModule.wireTypes.lengthDelimited)
		var1837, var2750 = protoModule.writeString(var1837, var1838, self.user_id)
		buff = var1837
		var1834 = var1838
	end
	if self.description ~= nil and self.description ~= "" then
		local var1839, var1840 = protoModule.writeTag(buff, var1834, 3, protoModule.wireTypes.lengthDelimited)
		var1839, var2752 = protoModule.writeString(var1839, var1840, self.description)
		buff = var1839
		var1834 = var1840
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1841, var1842 = protoModule.writeTag(buff, var1834, 4, protoModule.wireTypes.lengthDelimited)
		var1841, var2754 = protoModule.writeString(var1841, var1842, self.cta_text)
		buff = var1841
		var1834 = var1842
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1843, var1844 = protoModule.writeTag(buff, var1834, 5, protoModule.wireTypes.lengthDelimited)
		var1843, var2756 = protoModule.writeString(var1843, var1844, self.prompt_id)
		buff = var1843
		var1834 = var1844
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1845, var1846 = protoModule.writeTag(buff, var1834, 6, protoModule.wireTypes.lengthDelimited)
		var1845, var2758 = protoModule.writeString(var1845, var1846, self.prompt_type)
		buff = var1845
		var1834 = var1846
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1847, var1848 = protoModule.writeTag(buff, var1834, 7, protoModule.wireTypes.lengthDelimited)
		var1847, var2760 = protoModule.writeString(var1847, var1848, self.entity_id)
		buff = var1847
		var1834 = var1848
	end
	local buff_1 = buffer.create(var1834)
	buffer.copy(buff_1, 0, buff, 0, var1834)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1834 = t_61.new()
	local var1835 = 0
	while var1835 < buffer.len(p61) do
		local _ = nil
		local var1836 = nil
		local var1837, var1838, var1839 = protoModule.readTag(p61, var1835)
		local var1840 = var1837
		var1836 = var1838
		var1835 = var1839
		
		if var1836 == protoModule.wireTypes.varint then
			local _ = nil
			local var1841, var1842 = protoModule.readVarInt(p61, var1835)
			local _ = var1841
			var1835 = var1842
			continue
		end
		if var1836 == protoModule.wireTypes.lengthDelimited then
			if var1840 == 1 then
				local _ = nil
				local var1843, var1844 = protoModule.readBuffer(p61, var1835)
				var1835 = var1844
				var1834.title = buffer.tostring(var1843)
			elseif var1840 == 2 then
				local _ = nil
				local var1845, var1846 = protoModule.readBuffer(p61, var1835)
				var1835 = var1846
				var1834.user_id = buffer.tostring(var1845)
			elseif var1840 == 3 then
				local _ = nil
				local var1847, var1848 = protoModule.readBuffer(p61, var1835)
				var1835 = var1848
				var1834.description = buffer.tostring(var1847)
			elseif var1840 == 4 then
				local _ = nil
				local var1849, var1850 = protoModule.readBuffer(p61, var1835)
				var1835 = var1850
				var1834.cta_text = buffer.tostring(var1849)
			elseif var1840 == 5 then
				local _ = nil
				local var1851, var1852 = protoModule.readBuffer(p61, var1835)
				var1835 = var1852
				var1834.prompt_id = buffer.tostring(var1851)
			elseif var1840 == 6 then
				local _ = nil
				local var1853, var1854 = protoModule.readBuffer(p61, var1835)
				var1835 = var1854
				var1834.prompt_type = buffer.tostring(var1853)
			elseif var1840 == 7 then
				local _ = nil
				local var1855, var1856 = protoModule.readBuffer(p61, var1835)
				var1835 = var1856
				var1834.entity_id = buffer.tostring(var1855)
			else
				local _ = nil
				local var1857, var1858 = protoModule.readVarInt(p61, var1835)
				var1835 = var1858 + var1857
			end
		elseif var1836 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1859, var1860 = protoModule.readFixed32(p61, var1835)
			local _ = var1859
			var1835 = var1860
		elseif var1836 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1861, var1862 = protoModule.readFixed64(p61, var1835)
			local _ = var1861
			var1835 = var1862
		else
			error("Unsupported wire type: " .. var2764)
		end
	end
	return var1834
end

function t_61:jsonEncode()
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

function t_61:jsonDecode()
	-- upvalues: t_61 (ref)
	local var1863 = t_61.new()
	
	if self.title ~= nil then
		var1863.title = self.title
	end
	if self.user_id ~= nil then
		var1863.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1863.user_id = self.userId
	end
	if self.description ~= nil then
		var1863.description = self.description
	end
	if self.cta_text ~= nil then
		var1863.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1863.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1863.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1863.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1863.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1863.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1863.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1863.entity_id = self.entityId
	end
	return var1863
end

t_61.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_61
typeRegistryModule.default:register(t.CardInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p62)
	-- upvalues: t_62 (ref)
	return setmetatable({
		prompt_id = if p62 == nil or p62.prompt_id == nil then "" else p62.prompt_id,
		prompt_type = if p62 == nil or p62.prompt_type == nil then "" else p62.prompt_type,
		user_id = if p62 == nil or p62.user_id == nil then "" else p62.user_id,
		audit_data = if p62 == nil or p62.audit_data == nil then "" else p62.audit_data
	}, t_62)
end

function t_62:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1863 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1864, var1865 = protoModule.writeTag(buff, var1863, 1, protoModule.wireTypes.lengthDelimited)
		var1864, var2796 = protoModule.writeString(var1864, var1865, self.prompt_id)
		buff = var1864
		var1863 = var1865
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1866, var1867 = protoModule.writeTag(buff, var1863, 2, protoModule.wireTypes.lengthDelimited)
		var1866, var2798 = protoModule.writeString(var1866, var1867, self.prompt_type)
		buff = var1866
		var1863 = var1867
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1868, var1869 = protoModule.writeTag(buff, var1863, 3, protoModule.wireTypes.lengthDelimited)
		var1868, var2800 = protoModule.writeString(var1868, var1869, self.user_id)
		buff = var1868
		var1863 = var1869
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1870, var1871 = protoModule.writeTag(buff, var1863, 4, protoModule.wireTypes.lengthDelimited)
		var1870, var2802 = protoModule.writeString(var1870, var1871, self.audit_data)
		buff = var1870
		var1863 = var1871
	end
	local buff_1 = buffer.create(var1863)
	buffer.copy(buff_1, 0, buff, 0, var1863)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1863 = t_62.new()
	local var1864 = 0
	while var1864 < buffer.len(p62) do
		local _ = nil
		local var1865 = nil
		local var1866, var1867, var1868 = protoModule.readTag(p62, var1864)
		local var1869 = var1866
		var1865 = var1867
		var1864 = var1868
		
		if var1865 == protoModule.wireTypes.varint then
			local _ = nil
			local var1870, var1871 = protoModule.readVarInt(p62, var1864)
			local _ = var1870
			var1864 = var1871
			continue
		end
		if var1865 == protoModule.wireTypes.lengthDelimited then
			if var1869 == 1 then
				local _ = nil
				local var1872, var1873 = protoModule.readBuffer(p62, var1864)
				var1864 = var1873
				var1863.prompt_id = buffer.tostring(var1872)
			elseif var1869 == 2 then
				local _ = nil
				local var1874, var1875 = protoModule.readBuffer(p62, var1864)
				var1864 = var1875
				var1863.prompt_type = buffer.tostring(var1874)
			elseif var1869 == 3 then
				local _ = nil
				local var1876, var1877 = protoModule.readBuffer(p62, var1864)
				var1864 = var1877
				var1863.user_id = buffer.tostring(var1876)
			elseif var1869 == 4 then
				local _ = nil
				local var1878, var1879 = protoModule.readBuffer(p62, var1864)
				var1864 = var1879
				var1863.audit_data = buffer.tostring(var1878)
			else
				local _ = nil
				local var1880, var1881 = protoModule.readVarInt(p62, var1864)
				var1864 = var1881 + var1880
			end
		elseif var1865 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1882, var1883 = protoModule.readFixed32(p62, var1864)
			local _ = var1882
			var1864 = var1883
		elseif var1865 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1884, var1885 = protoModule.readFixed64(p62, var1864)
			local _ = var1884
			var1864 = var1885
		else
			error("Unsupported wire type: " .. var2806)
		end
	end
	return var1863
end

function t_62:jsonEncode()
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

function t_62:jsonDecode()
	-- upvalues: t_62 (ref)
	local var1886 = t_62.new()
	
	if self.prompt_id ~= nil then
		var1886.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1886.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1886.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1886.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1886.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1886.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1886.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1886.audit_data = self.auditData
	end
	return var1886
end

t_62.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_62
typeRegistryModule.default:register(t.DialogInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p63)
	-- upvalues: t_63 (ref)
	return setmetatable({
		sender_count = if p63 == nil or p63.sender_count == nil then 0 else p63.sender_count,
		total_robux_amount = if p63 == nil or p63.total_robux_amount == nil then 0 else p63.total_robux_amount
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1886 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1887, var1888 = protoModule.writeTag(buff, var1886, 1, protoModule.wireTypes.varint)
		var1887, var2832 = protoModule.writeVarInt(var1887, var1888, self.sender_count)
		buff = var1887
		var1886 = var1888
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1889, var1890 = protoModule.writeTag(buff, var1886, 2, protoModule.wireTypes.varint)
		var1889, var2834 = protoModule.writeVarInt(var1889, var1890, self.total_robux_amount)
		buff = var1889
		var1886 = var1890
	end
	local buff_1 = buffer.create(var1886)
	buffer.copy(buff_1, 0, buff, 0, var1886)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref)
	local var1886 = t_63.new()
	local var1887 = 0
	while var1887 < buffer.len(p63) do
		local _ = nil
		local _ = nil
		local var1888, var1889, var1890 = protoModule.readTag(p63, var1887)
		local var1891 = var1888
		local var1892 = var1889
		var1887 = var1890
		
		if var1892 == protoModule.wireTypes.varint then
			if var1891 == 1 then
				local _ = nil
				local var1893, var1894 = protoModule.readVarIntI32(p63, var1887)
				var1887 = var1894
				var1886.sender_count = var1893
			elseif var1891 == 2 then
				local _ = nil
				local var1895, var1896 = protoModule.readVarIntI64(p63, var1887)
				var1887 = var1896
				var1886.total_robux_amount = var1895
			else
				local _ = nil
				local var1897, var1898 = protoModule.readVarInt(p63, var1887)
				local _ = var1897
				var1887 = var1898
			end
		elseif var1892 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1899, var1900 = protoModule.readVarInt(p63, var1887)
			var1887 = var1900 + var1899
		elseif var1892 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1901, var1902 = protoModule.readFixed32(p63, var1887)
			local _ = var1901
			var1887 = var1902
		elseif var1892 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1903, var1904 = protoModule.readFixed64(p63, var1887)
			local _ = var1903
			var1887 = var1904
		else
			error("Unsupported wire type: " .. var2842)
		end
	end
	return var1886
end

function t_63:jsonEncode()
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_63:jsonDecode()
	-- upvalues: t_63 (ref)
	local var1905 = t_63.new()
	
	if self.sender_count ~= nil then
		var1905.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1905.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1905.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1905.total_robux_amount = self.totalRobuxAmount
	end
	return var1905
end

t_63.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_63
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p64)
	-- upvalues: t_64 (ref)
	return setmetatable({
		title = if p64 == nil or p64.title == nil then "" else p64.title,
		description = if p64 == nil or p64.description == nil then "" else p64.description,
		primary_text = if p64 == nil or p64.primary_text == nil then "" else p64.primary_text,
		secondary_text = if p64 == nil or p64.secondary_text == nil then "" else p64.secondary_text,
		prompt_id = if p64 == nil or p64.prompt_id == nil then "" else p64.prompt_id,
		prompt_type = if p64 == nil or p64.prompt_type == nil then "" else p64.prompt_type,
		times_seen = if p64 == nil or p64.times_seen == nil then 0 else p64.times_seen,
		content = if p64 == nil or p64.content == nil then nil else p64.content,
		sort_id = if p64 == nil or p64.sort_id == nil then nil else p64.sort_id
	}, t_64)
end

function t_64:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1905 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1906, var1907 = protoModule.writeTag(buff, var1905, 1, protoModule.wireTypes.lengthDelimited)
		var1906, var2860 = protoModule.writeString(var1906, var1907, self.title)
		buff = var1906
		var1905 = var1907
	end
	if self.description ~= nil and self.description ~= "" then
		local var1908, var1909 = protoModule.writeTag(buff, var1905, 2, protoModule.wireTypes.lengthDelimited)
		var1908, var2862 = protoModule.writeString(var1908, var1909, self.description)
		buff = var1908
		var1905 = var1909
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1910, var1911 = protoModule.writeTag(buff, var1905, 3, protoModule.wireTypes.lengthDelimited)
		var1910, var2864 = protoModule.writeString(var1910, var1911, self.primary_text)
		buff = var1910
		var1905 = var1911
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1912, var1913 = protoModule.writeTag(buff, var1905, 4, protoModule.wireTypes.lengthDelimited)
		var1912, var2866 = protoModule.writeString(var1912, var1913, self.secondary_text)
		buff = var1912
		var1905 = var1913
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1914, var1915 = protoModule.writeTag(buff, var1905, 5, protoModule.wireTypes.lengthDelimited)
		var1914, var2868 = protoModule.writeString(var1914, var1915, self.prompt_id)
		buff = var1914
		var1905 = var1915
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1916, var1917 = protoModule.writeTag(buff, var1905, 6, protoModule.wireTypes.lengthDelimited)
		var1916, var2870 = protoModule.writeString(var1916, var1917, self.prompt_type)
		buff = var1916
		var1905 = var1917
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1918, var1919 = protoModule.writeTag(buff, var1905, 7, protoModule.wireTypes.varint)
		var1918, var2872 = protoModule.writeVarInt(var1918, var1919, self.times_seen)
		buff = var1918
		var1905 = var1919
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1920 = self.content.value:encode()
		local var1921, var1922 = protoModule.writeTag(buff, var1905, 8, protoModule.wireTypes.lengthDelimited)
		var1921, var2875 = protoModule.writeBuffer(var1921, var1922, var1920, buffer.len(var1920))
		buff = var1921
		var1905 = var1922
	end
	if self.sort_id ~= nil then
		local var1923, var1924 = protoModule.writeTag(buff, var1905, 9, protoModule.wireTypes.lengthDelimited)
		var1923, var2877 = protoModule.writeString(var1923, var1924, self.sort_id)
		buff = var1923
		var1905 = var1924
	end
	local buff_1 = buffer.create(var1905)
	buffer.copy(buff_1, 0, buff, 0, var1905)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1905 = t_64.new()
	local var1906 = 0
	while var1906 < buffer.len(p64) do
		local _ = nil
		local var1907 = nil
		local var1908, var1909, var1910 = protoModule.readTag(p64, var1906)
		local var1911 = var1908
		var1907 = var1909
		var1906 = var1910
		
		if var1907 == protoModule.wireTypes.varint then
			if var1911 == 7 then
				local _ = nil
				local var1912, var1913 = protoModule.readVarIntI32(p64, var1906)
				var1906 = var1913
				var1905.times_seen = var1912
			else
				local _ = nil
				local var1914, var1915 = protoModule.readVarInt(p64, var1906)
				local _ = var1914
				var1906 = var1915
			end
		end
		if var1907 == protoModule.wireTypes.lengthDelimited then
			if var1911 == 1 then
				local _ = nil
				local var1916, var1917 = protoModule.readBuffer(p64, var1906)
				var1906 = var1917
				var1905.title = buffer.tostring(var1916)
			elseif var1911 == 2 then
				local _ = nil
				local var1918, var1919 = protoModule.readBuffer(p64, var1906)
				var1906 = var1919
				var1905.description = buffer.tostring(var1918)
			elseif var1911 == 3 then
				local _ = nil
				local var1920, var1921 = protoModule.readBuffer(p64, var1906)
				var1906 = var1921
				var1905.primary_text = buffer.tostring(var1920)
			elseif var1911 == 4 then
				local _ = nil
				local var1922, var1923 = protoModule.readBuffer(p64, var1906)
				var1906 = var1923
				var1905.secondary_text = buffer.tostring(var1922)
			elseif var1911 == 5 then
				local _ = nil
				local var1924, var1925 = protoModule.readBuffer(p64, var1906)
				var1906 = var1925
				var1905.prompt_id = buffer.tostring(var1924)
			elseif var1911 == 6 then
				local _ = nil
				local var1926, var1927 = protoModule.readBuffer(p64, var1906)
				var1906 = var1927
				var1905.prompt_type = buffer.tostring(var1926)
			elseif var1911 == 8 then
				local _ = nil
				local var1928, var1929 = protoModule.readBuffer(p64, var1906)
				var1906 = var1929
				var1905.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1928)
				}
			elseif var1911 == 9 then
				local _ = nil
				local var1930, var1931 = protoModule.readBuffer(p64, var1906)
				var1906 = var1931
				var1905.sort_id = buffer.tostring(var1930)
			else
				local _ = nil
				local var1932, var1933 = protoModule.readVarInt(p64, var1906)
				var1906 = var1933 + var1932
			end
		elseif var1907 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1934, var1935 = protoModule.readFixed32(p64, var1906)
			local _ = var1934
			var1906 = var1935
		elseif var1907 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1936, var1937 = protoModule.readFixed64(p64, var1906)
			local _ = var1936
			var1906 = var1937
		else
			error("Unsupported wire type: " .. var2881)
		end
	end
	return var1905
end

function t_64:jsonEncode()
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

function t_64:jsonDecode()
	-- upvalues: t_64 (ref), t (ref)
	local var1938 = t_64.new()
	
	if self.title ~= nil then
		var1938.title = self.title
	end
	if self.description ~= nil then
		var1938.description = self.description
	end
	if self.primary_text ~= nil then
		var1938.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1938.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1938.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1938.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1938.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1938.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1938.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1938.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1938.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1938.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1938.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1938.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1938.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1938.sort_id = self.sortId
	end
	return var1938
end

t_64.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_64
typeRegistryModule.default:register(t.BannerInputData)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p65)
	-- upvalues: t_65 (ref)
	return setmetatable({
		tooltip_text = if p65 == nil or p65.tooltip_text == nil then "" else p65.tooltip_text,
		prompt_id = if p65 == nil or p65.prompt_id == nil then "" else p65.prompt_id,
		prompt_type = if p65 == nil or p65.prompt_type == nil then "" else p65.prompt_type
	}, t_65)
end

function t_65:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1938 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1939, var1940 = protoModule.writeTag(buff, var1938, 1, protoModule.wireTypes.lengthDelimited)
		var1939, var2917 = protoModule.writeString(var1939, var1940, self.tooltip_text)
		buff = var1939
		var1938 = var1940
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1941, var1942 = protoModule.writeTag(buff, var1938, 2, protoModule.wireTypes.lengthDelimited)
		var1941, var2919 = protoModule.writeString(var1941, var1942, self.prompt_id)
		buff = var1941
		var1938 = var1942
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1943, var1944 = protoModule.writeTag(buff, var1938, 3, protoModule.wireTypes.lengthDelimited)
		var1943, var2921 = protoModule.writeString(var1943, var1944, self.prompt_type)
		buff = var1943
		var1938 = var1944
	end
	local buff_1 = buffer.create(var1938)
	buffer.copy(buff_1, 0, buff, 0, var1938)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1938 = t_65.new()
	local var1939 = 0
	while var1939 < buffer.len(p65) do
		local _ = nil
		local var1940 = nil
		local var1941, var1942, var1943 = protoModule.readTag(p65, var1939)
		local var1944 = var1941
		var1940 = var1942
		var1939 = var1943
		
		if var1940 == protoModule.wireTypes.varint then
			local _ = nil
			local var1945, var1946 = protoModule.readVarInt(p65, var1939)
			local _ = var1945
			var1939 = var1946
			continue
		end
		if var1940 == protoModule.wireTypes.lengthDelimited then
			if var1944 == 1 then
				local _ = nil
				local var1947, var1948 = protoModule.readBuffer(p65, var1939)
				var1939 = var1948
				var1938.tooltip_text = buffer.tostring(var1947)
			elseif var1944 == 2 then
				local _ = nil
				local var1949, var1950 = protoModule.readBuffer(p65, var1939)
				var1939 = var1950
				var1938.prompt_id = buffer.tostring(var1949)
			elseif var1944 == 3 then
				local _ = nil
				local var1951, var1952 = protoModule.readBuffer(p65, var1939)
				var1939 = var1952
				var1938.prompt_type = buffer.tostring(var1951)
			else
				local _ = nil
				local var1953, var1954 = protoModule.readVarInt(p65, var1939)
				var1939 = var1954 + var1953
			end
		elseif var1940 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1955, var1956 = protoModule.readFixed32(p65, var1939)
			local _ = var1955
			var1939 = var1956
		elseif var1940 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1957, var1958 = protoModule.readFixed64(p65, var1939)
			local _ = var1957
			var1939 = var1958
		else
			error("Unsupported wire type: " .. var2925)
		end
	end
	return var1938
end

function t_65:jsonEncode()
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

function t_65:jsonDecode()
	-- upvalues: t_65 (ref)
	local var1959 = t_65.new()
	
	if self.tooltip_text ~= nil then
		var1959.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1959.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1959.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1959.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1959.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1959.prompt_type = self.promptType
	end
	return var1959
end

t_65.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_65
typeRegistryModule.default:register(t.TooltipInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p66)
	-- upvalues: t_66 (ref)
	return setmetatable({
		media_id = if p66 == nil or p66.media_id == nil then "" else p66.media_id,
		title = if p66 == nil or p66.title == nil then "" else p66.title,
		description = if p66 == nil or p66.description == nil then "" else p66.description,
		prompt_id = if p66 == nil or p66.prompt_id == nil then "" else p66.prompt_id,
		prompt_type = if p66 == nil or p66.prompt_type == nil then "" else p66.prompt_type,
		anchor_tag = if p66 == nil or p66.anchor_tag == nil then "" else p66.anchor_tag
	}, t_66)
end

function t_66:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1959 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1960, var1961 = protoModule.writeTag(buff, var1959, 1, protoModule.wireTypes.lengthDelimited)
		var1960, var2949 = protoModule.writeString(var1960, var1961, self.media_id)
		buff = var1960
		var1959 = var1961
	end
	if self.title ~= nil and self.title ~= "" then
		local var1962, var1963 = protoModule.writeTag(buff, var1959, 2, protoModule.wireTypes.lengthDelimited)
		var1962, var2951 = protoModule.writeString(var1962, var1963, self.title)
		buff = var1962
		var1959 = var1963
	end
	if self.description ~= nil and self.description ~= "" then
		local var1964, var1965 = protoModule.writeTag(buff, var1959, 3, protoModule.wireTypes.lengthDelimited)
		var1964, var2953 = protoModule.writeString(var1964, var1965, self.description)
		buff = var1964
		var1959 = var1965
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1966, var1967 = protoModule.writeTag(buff, var1959, 4, protoModule.wireTypes.lengthDelimited)
		var1966, var2955 = protoModule.writeString(var1966, var1967, self.prompt_id)
		buff = var1966
		var1959 = var1967
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1968, var1969 = protoModule.writeTag(buff, var1959, 5, protoModule.wireTypes.lengthDelimited)
		var1968, var2957 = protoModule.writeString(var1968, var1969, self.prompt_type)
		buff = var1968
		var1959 = var1969
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1970, var1971 = protoModule.writeTag(buff, var1959, 6, protoModule.wireTypes.lengthDelimited)
		var1970, var2959 = protoModule.writeString(var1970, var1971, self.anchor_tag)
		buff = var1970
		var1959 = var1971
	end
	local buff_1 = buffer.create(var1959)
	buffer.copy(buff_1, 0, buff, 0, var1959)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref)
	local var1959 = t_66.new()
	local var1960 = 0
	while var1960 < buffer.len(p66) do
		local _ = nil
		local var1961 = nil
		local var1962, var1963, var1964 = protoModule.readTag(p66, var1960)
		local var1965 = var1962
		var1961 = var1963
		var1960 = var1964
		
		if var1961 == protoModule.wireTypes.varint then
			local _ = nil
			local var1966, var1967 = protoModule.readVarInt(p66, var1960)
			local _ = var1966
			var1960 = var1967
			continue
		end
		if var1961 == protoModule.wireTypes.lengthDelimited then
			if var1965 == 1 then
				local _ = nil
				local var1968, var1969 = protoModule.readBuffer(p66, var1960)
				var1960 = var1969
				var1959.media_id = buffer.tostring(var1968)
			elseif var1965 == 2 then
				local _ = nil
				local var1970, var1971 = protoModule.readBuffer(p66, var1960)
				var1960 = var1971
				var1959.title = buffer.tostring(var1970)
			elseif var1965 == 3 then
				local _ = nil
				local var1972, var1973 = protoModule.readBuffer(p66, var1960)
				var1960 = var1973
				var1959.description = buffer.tostring(var1972)
			elseif var1965 == 4 then
				local _ = nil
				local var1974, var1975 = protoModule.readBuffer(p66, var1960)
				var1960 = var1975
				var1959.prompt_id = buffer.tostring(var1974)
			elseif var1965 == 5 then
				local _ = nil
				local var1976, var1977 = protoModule.readBuffer(p66, var1960)
				var1960 = var1977
				var1959.prompt_type = buffer.tostring(var1976)
			elseif var1965 == 6 then
				local _ = nil
				local var1978, var1979 = protoModule.readBuffer(p66, var1960)
				var1960 = var1979
				var1959.anchor_tag = buffer.tostring(var1978)
			else
				local _ = nil
				local var1980, var1981 = protoModule.readVarInt(p66, var1960)
				var1960 = var1981 + var1980
			end
		elseif var1961 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1982, var1983 = protoModule.readFixed32(p66, var1960)
			local _ = var1982
			var1960 = var1983
		elseif var1961 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1984, var1985 = protoModule.readFixed64(p66, var1960)
			local _ = var1984
			var1960 = var1985
		else
			error("Unsupported wire type: " .. var2963)
		end
	end
	return var1959
end

function t_66:jsonEncode()
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

function t_66:jsonDecode()
	-- upvalues: t_66 (ref)
	local var1986 = t_66.new()
	
	if self.media_id ~= nil then
		var1986.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1986.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1986.title = self.title
	end
	if self.description ~= nil then
		var1986.description = self.description
	end
	if self.prompt_id ~= nil then
		var1986.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1986.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1986.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1986.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1986.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1986.anchor_tag = self.anchorTag
	end
	return var1986
end

t_66.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_66
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p67)
	-- upvalues: t_67 (ref)
	return setmetatable({
		prompt_id = if p67 == nil or p67.prompt_id == nil then "" else p67.prompt_id,
		prompt_type = if p67 == nil or p67.prompt_type == nil then "" else p67.prompt_type
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1986 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1987, var1988 = protoModule.writeTag(buff, var1986, 1, protoModule.wireTypes.lengthDelimited)
		var1987, var2993 = protoModule.writeString(var1987, var1988, self.prompt_id)
		buff = var1987
		var1986 = var1988
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1989, var1990 = protoModule.writeTag(buff, var1986, 2, protoModule.wireTypes.lengthDelimited)
		var1989, var2995 = protoModule.writeString(var1989, var1990, self.prompt_type)
		buff = var1989
		var1986 = var1990
	end
	local buff_1 = buffer.create(var1986)
	buffer.copy(buff_1, 0, buff, 0, var1986)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref)
	local var1986 = t_67.new()
	local var1987 = 0
	while var1987 < buffer.len(p67) do
		local _ = nil
		local var1988 = nil
		local var1989, var1990, var1991 = protoModule.readTag(p67, var1987)
		local var1992 = var1989
		var1988 = var1990
		var1987 = var1991
		
		if var1988 == protoModule.wireTypes.varint then
			local _ = nil
			local var1993, var1994 = protoModule.readVarInt(p67, var1987)
			local _ = var1993
			var1987 = var1994
			continue
		end
		if var1988 == protoModule.wireTypes.lengthDelimited then
			if var1992 == 1 then
				local _ = nil
				local var1995, var1996 = protoModule.readBuffer(p67, var1987)
				var1987 = var1996
				var1986.prompt_id = buffer.tostring(var1995)
			elseif var1992 == 2 then
				local _ = nil
				local var1997, var1998 = protoModule.readBuffer(p67, var1987)
				var1987 = var1998
				var1986.prompt_type = buffer.tostring(var1997)
			else
				local _ = nil
				local var1999, var2000 = protoModule.readVarInt(p67, var1987)
				var1987 = var2000 + var1999
			end
		elseif var1988 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2001, var2002 = protoModule.readFixed32(p67, var1987)
			local _ = var2001
			var1987 = var2002
		elseif var1988 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2003, var2004 = protoModule.readFixed64(p67, var1987)
			local _ = var2003
			var1987 = var2004
		else
			error("Unsupported wire type: " .. var2999)
		end
	end
	return var1986
end

function t_67:jsonEncode()
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_67:jsonDecode()
	-- upvalues: t_67 (ref)
	local var2005 = t_67.new()
	
	if self.prompt_id ~= nil then
		var2005.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2005.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2005.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2005.prompt_type = self.promptType
	end
	return var2005
end

t_67.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_67
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p68)
	-- upvalues: t_68 (ref)
	return setmetatable({
		upsell_prompt = if p68 == nil or p68.upsell_prompt == nil then "" else p68.upsell_prompt
	}, t_68)
end

function t_68:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2005 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var2006, var2007 = protoModule.writeTag(buff, var2005, 1, protoModule.wireTypes.lengthDelimited)
		var2006, var3021 = protoModule.writeString(var2006, var2007, self.upsell_prompt)
		buff = var2006
		var2005 = var2007
	end
	local buff_1 = buffer.create(var2005)
	buffer.copy(buff_1, 0, buff, 0, var2005)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var2005 = t_68.new()
	local var2006 = 0
	while var2006 < buffer.len(p68) do
		local _ = nil
		local var2007 = nil
		local var2008, var2009, var2010 = protoModule.readTag(p68, var2006)
		local var2011 = var2008
		var2007 = var2009
		var2006 = var2010
		
		if var2007 == protoModule.wireTypes.varint then
			local _ = nil
			local var2012, var2013 = protoModule.readVarInt(p68, var2006)
			local _ = var2012
			var2006 = var2013
			continue
		end
		if var2007 == protoModule.wireTypes.lengthDelimited then
			if var2011 == 1 then
				local _ = nil
				local var2014, var2015 = protoModule.readBuffer(p68, var2006)
				var2006 = var2015
				var2005.upsell_prompt = buffer.tostring(var2014)
			else
				local _ = nil
				local var2016, var2017 = protoModule.readVarInt(p68, var2006)
				var2006 = var2017 + var2016
			end
		elseif var2007 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2018, var2019 = protoModule.readFixed32(p68, var2006)
			local _ = var2018
			var2006 = var2019
		elseif var2007 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2020, var2021 = protoModule.readFixed64(p68, var2006)
			local _ = var2020
			var2006 = var2021
		else
			error("Unsupported wire type: " .. var3025)
		end
	end
	return var2005
end

function t_68:jsonEncode()
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_68:jsonDecode()
	-- upvalues: t_68 (ref)
	local var2022 = t_68.new()
	
	if self.upsell_prompt ~= nil then
		var2022.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var2022.upsell_prompt = self.upsellPrompt
	end
	return var2022
end

t_68.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_68
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p69)
	-- upvalues: t_69 (ref)
	return setmetatable({
		modal_variant = if p69 == nil or p69.modal_variant == nil then "" else p69.modal_variant,
		modal_sequence = if p69 == nil or p69.modal_sequence == nil then "" else p69.modal_sequence,
		conversation_id = if p69 == nil or p69.conversation_id == nil then "" else p69.conversation_id,
		friend_id = if p69 == nil or p69.friend_id == nil then "" else p69.friend_id
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2022 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var2023, var2024 = protoModule.writeTag(buff, var2022, 1, protoModule.wireTypes.lengthDelimited)
		var2023, var3045 = protoModule.writeString(var2023, var2024, self.modal_variant)
		buff = var2023
		var2022 = var2024
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var2025, var2026 = protoModule.writeTag(buff, var2022, 2, protoModule.wireTypes.lengthDelimited)
		var2025, var3047 = protoModule.writeString(var2025, var2026, self.modal_sequence)
		buff = var2025
		var2022 = var2026
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var2027, var2028 = protoModule.writeTag(buff, var2022, 3, protoModule.wireTypes.lengthDelimited)
		var2027, var3049 = protoModule.writeString(var2027, var2028, self.conversation_id)
		buff = var2027
		var2022 = var2028
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var2029, var2030 = protoModule.writeTag(buff, var2022, 4, protoModule.wireTypes.lengthDelimited)
		var2029, var3051 = protoModule.writeString(var2029, var2030, self.friend_id)
		buff = var2029
		var2022 = var2030
	end
	local buff_1 = buffer.create(var2022)
	buffer.copy(buff_1, 0, buff, 0, var2022)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var2022 = t_69.new()
	local var2023 = 0
	while var2023 < buffer.len(p69) do
		local _ = nil
		local var2024 = nil
		local var2025, var2026, var2027 = protoModule.readTag(p69, var2023)
		local var2028 = var2025
		var2024 = var2026
		var2023 = var2027
		
		if var2024 == protoModule.wireTypes.varint then
			local _ = nil
			local var2029, var2030 = protoModule.readVarInt(p69, var2023)
			local _ = var2029
			var2023 = var2030
			continue
		end
		if var2024 == protoModule.wireTypes.lengthDelimited then
			if var2028 == 1 then
				local _ = nil
				local var2031, var2032 = protoModule.readBuffer(p69, var2023)
				var2023 = var2032
				var2022.modal_variant = buffer.tostring(var2031)
			elseif var2028 == 2 then
				local _ = nil
				local var2033, var2034 = protoModule.readBuffer(p69, var2023)
				var2023 = var2034
				var2022.modal_sequence = buffer.tostring(var2033)
			elseif var2028 == 3 then
				local _ = nil
				local var2035, var2036 = protoModule.readBuffer(p69, var2023)
				var2023 = var2036
				var2022.conversation_id = buffer.tostring(var2035)
			elseif var2028 == 4 then
				local _ = nil
				local var2037, var2038 = protoModule.readBuffer(p69, var2023)
				var2023 = var2038
				var2022.friend_id = buffer.tostring(var2037)
			else
				local _ = nil
				local var2039, var2040 = protoModule.readVarInt(p69, var2023)
				var2023 = var2040 + var2039
			end
		elseif var2024 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2041, var2042 = protoModule.readFixed32(p69, var2023)
			local _ = var2041
			var2023 = var2042
		elseif var2024 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2043, var2044 = protoModule.readFixed64(p69, var2023)
			local _ = var2043
			var2023 = var2044
		else
			error("Unsupported wire type: " .. var3055)
		end
	end
	return var2022
end

function t_69:jsonEncode()
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

function t_69:jsonDecode()
	-- upvalues: t_69 (ref)
	local var2045 = t_69.new()
	
	if self.modal_variant ~= nil then
		var2045.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var2045.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var2045.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var2045.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var2045.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var2045.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var2045.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var2045.friend_id = self.friendId
	end
	return var2045
end

t_69.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_69
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p70)
	-- upvalues: t_70 (ref)
	return setmetatable({
		event_id = if p70 == nil or p70.event_id == nil then "" else p70.event_id,
		universe_id = if p70 == nil or p70.universe_id == nil then "" else p70.universe_id,
		entry_map = if p70 == nil or p70.entry_map == nil then {} else p70.entry_map,
		entry_order = if p70 == nil or p70.entry_order == nil then {} else p70.entry_order
	}, t_70)
end

function t_70:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2045 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2046, var2047 = protoModule.writeTag(buff, var2045, 1, protoModule.wireTypes.lengthDelimited)
		var2046, var3081 = protoModule.writeString(var2046, var2047, self.event_id)
		buff = var2046
		var2045 = var2047
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2048, var2049 = protoModule.writeTag(buff, var2045, 2, protoModule.wireTypes.lengthDelimited)
		var2048, var3083 = protoModule.writeString(var2048, var2049, self.universe_id)
		buff = var2048
		var2045 = var2049
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2050, var2051 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2050, var3085 = protoModule.writeString(var2050, var2051, i)
			local var2052 = v:encode()
			var2051, var3087 = protoModule.writeTag(var2050, var2051, 2, protoModule.wireTypes.lengthDelimited)
			var2051, var3087 = protoModule.writeBuffer(var2051, var3087, var2052, buffer.len(var2052))
			local var2053 = var2051
			local var2054 = var3087
			local var2055, var2056 = protoModule.writeTag(buff, var2045, 3, protoModule.wireTypes.lengthDelimited)
			var2055, var3091 = protoModule.writeBuffer(var2055, var2056, var2053, var2054)
			buff = var2055
			var2045 = var2056
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2057, var2058 = protoModule.writeTag(buff, var2045, 4, protoModule.wireTypes.lengthDelimited)
			var2057, var3093 = protoModule.writeString(var2057, var2058, v)
			buff = var2057
			var2045 = var2058
		end
	end
	local buff_1 = buffer.create(var2045)
	buffer.copy(buff_1, 0, buff, 0, var2045)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref), t (ref)
	local var2059 = t_70.new()
	local var2060 = 0
	while var2060 < buffer.len(p70) do
		local _ = nil
		local var2061 = nil
		local var2062, var2063, var2064 = protoModule.readTag(p70, var2060)
		local var2065 = var2062
		var2061 = var2063
		var2060 = var2064
		
		if var2061 == protoModule.wireTypes.varint then
			local _ = nil
			local var2066, var2067 = protoModule.readVarInt(p70, var2060)
			local _ = var2066
			var2060 = var2067
			continue
		end
		if var2061 == protoModule.wireTypes.lengthDelimited then
			if var2065 == 1 then
				local _ = nil
				local var2068, var2069 = protoModule.readBuffer(p70, var2060)
				var2060 = var2069
				var2059.event_id = buffer.tostring(var2068)
			elseif var2065 == 2 then
				local _ = nil
				local var2070, var2071 = protoModule.readBuffer(p70, var2060)
				var2060 = var2071
				var2059.universe_id = buffer.tostring(var2070)
			elseif var2065 == 3 then
				local _ = nil
				local var2072, var2073 = protoModule.readBuffer(p70, var2060)
				var2060 = var2073
				var2072 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var2072)
				var2059.entry_map[var2072.key or ""] = var2072.value or t.FeedEntry.new()
			elseif var2065 == 4 then
				local _ = nil
				local var2074, var2075 = protoModule.readBuffer(p70, var2060)
				var2060 = var2075
				table.insert(var2059.entry_order, buffer.tostring(var2074))
			else
				local _ = nil
				local var2076, var2077 = protoModule.readVarInt(p70, var2060)
				var2060 = var2077 + var2076
			end
		elseif var2061 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2078, var2079 = protoModule.readFixed32(p70, var2060)
			local _ = var2078
			var2060 = var2079
		elseif var2061 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2080, var2081 = protoModule.readFixed64(p70, var2060)
			local _ = var2080
			var2060 = var2081
		else
			error("Unsupported wire type: " .. var3097)
		end
	end
	return var2059
end

function t_70:jsonEncode()
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

function t_70:jsonDecode()
	-- upvalues: t_70 (ref), t (ref)
	local var2082 = t_70.new()
	
	if self.event_id ~= nil then
		var2082.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2082.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2082.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2082.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2082.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2082.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2082.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2082.entry_order = t_1
	end
	return var2082
end

t_70.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_70
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p71)
	-- upvalues: t_71 (ref)
	return setmetatable({
		key = if p71 == nil or p71.key == nil then "" else p71.key,
		value = if p71 == nil or p71.value == nil then nil else p71.value
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2083 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2084, var2085 = protoModule.writeTag(buff, var2083, 1, protoModule.wireTypes.lengthDelimited)
		var2084, var3129 = protoModule.writeString(var2084, var2085, self.key)
		buff = var2084
		var2083 = var2085
	end
	if self.value ~= nil then
		local var2086 = self.value:encode()
		local var2087, var2088 = protoModule.writeTag(buff, var2083, 2, protoModule.wireTypes.lengthDelimited)
		var2087, var3132 = protoModule.writeBuffer(var2087, var2088, var2086, buffer.len(var2086))
		buff = var2087
		var2083 = var2088
	end
	local buff_1 = buffer.create(var2083)
	buffer.copy(buff_1, 0, buff, 0, var2083)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var2083 = t_71.new()
	local var2084 = 0
	while var2084 < buffer.len(p71) do
		local _ = nil
		local var2085 = nil
		local var2086, var2087, var2088 = protoModule.readTag(p71, var2084)
		local var2089 = var2086
		var2085 = var2087
		var2084 = var2088
		
		if var2085 == protoModule.wireTypes.varint then
			local _ = nil
			local var2090, var2091 = protoModule.readVarInt(p71, var2084)
			local _ = var2090
			var2084 = var2091
			continue
		end
		if var2085 == protoModule.wireTypes.lengthDelimited then
			if var2089 == 1 then
				local _ = nil
				local var2092, var2093 = protoModule.readBuffer(p71, var2084)
				var2084 = var2093
				var2083.key = buffer.tostring(var2092)
			elseif var2089 == 2 then
				local _ = nil
				local var2094, var2095 = protoModule.readBuffer(p71, var2084)
				var2084 = var2095
				var2083.value = t.FeedEntry.decode(var2094)
			else
				local _ = nil
				local var2096, var2097 = protoModule.readVarInt(p71, var2084)
				var2084 = var2097 + var2096
			end
		elseif var2085 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2098, var2099 = protoModule.readFixed32(p71, var2084)
			local _ = var2098
			var2084 = var2099
		elseif var2085 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2100, var2101 = protoModule.readFixed64(p71, var2084)
			local _ = var2100
			var2084 = var2101
		else
			error("Unsupported wire type: " .. var3136)
		end
	end
	return var2083
end

function t_71:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_71:jsonDecode()
	-- upvalues: t_71 (ref), t (ref)
	local var2102 = t_71.new()
	
	if self.key ~= nil then
		var2102.key = self.key
	end
	if self.value ~= nil then
		var2102.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2102
end

t_71.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_71
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p72)
	-- upvalues: t_72 (ref)
	return setmetatable({
		event_id = if p72 == nil or p72.event_id == nil then "" else p72.event_id,
		universe_id = if p72 == nil or p72.universe_id == nil then "" else p72.universe_id
	}, t_72)
end

function t_72:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2102 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2103, var2104 = protoModule.writeTag(buff, var2102, 1, protoModule.wireTypes.lengthDelimited)
		var2103, var3158 = protoModule.writeString(var2103, var2104, self.event_id)
		buff = var2103
		var2102 = var2104
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2105, var2106 = protoModule.writeTag(buff, var2102, 2, protoModule.wireTypes.lengthDelimited)
		var2105, var3160 = protoModule.writeString(var2105, var2106, self.universe_id)
		buff = var2105
		var2102 = var2106
	end
	local buff_1 = buffer.create(var2102)
	buffer.copy(buff_1, 0, buff, 0, var2102)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2102 = t_72.new()
	local var2103 = 0
	while var2103 < buffer.len(p72) do
		local _ = nil
		local var2104 = nil
		local var2105, var2106, var2107 = protoModule.readTag(p72, var2103)
		local var2108 = var2105
		var2104 = var2106
		var2103 = var2107
		
		if var2104 == protoModule.wireTypes.varint then
			local _ = nil
			local var2109, var2110 = protoModule.readVarInt(p72, var2103)
			local _ = var2109
			var2103 = var2110
			continue
		end
		if var2104 == protoModule.wireTypes.lengthDelimited then
			if var2108 == 1 then
				local _ = nil
				local var2111, var2112 = protoModule.readBuffer(p72, var2103)
				var2103 = var2112
				var2102.event_id = buffer.tostring(var2111)
			elseif var2108 == 2 then
				local _ = nil
				local var2113, var2114 = protoModule.readBuffer(p72, var2103)
				var2103 = var2114
				var2102.universe_id = buffer.tostring(var2113)
			else
				local _ = nil
				local var2115, var2116 = protoModule.readVarInt(p72, var2103)
				var2103 = var2116 + var2115
			end
		elseif var2104 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2117, var2118 = protoModule.readFixed32(p72, var2103)
			local _ = var2117
			var2103 = var2118
		elseif var2104 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2119, var2120 = protoModule.readFixed64(p72, var2103)
			local _ = var2119
			var2103 = var2120
		else
			error("Unsupported wire type: " .. var3164)
		end
	end
	return var2102
end

function t_72:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_72:jsonDecode()
	-- upvalues: t_72 (ref)
	local var2121 = t_72.new()
	
	if self.event_id ~= nil then
		var2121.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2121.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2121.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2121.universe_id = self.universeId
	end
	return var2121
end

t_72.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_72
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
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
	local var2121 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2122, var2123 = protoModule.writeTag(buff, var2121, 1, protoModule.wireTypes.lengthDelimited)
		var2122, var3186 = protoModule.writeString(var2122, var2123, self.event_id)
		buff = var2122
		var2121 = var2123
	end
	local buff_1 = buffer.create(var2121)
	buffer.copy(buff_1, 0, buff, 0, var2121)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2121 = t_73.new()
	local var2122 = 0
	while var2122 < buffer.len(p73) do
		local _ = nil
		local var2123 = nil
		local var2124, var2125, var2126 = protoModule.readTag(p73, var2122)
		local var2127 = var2124
		var2123 = var2125
		var2122 = var2126
		
		if var2123 == protoModule.wireTypes.varint then
			local _ = nil
			local var2128, var2129 = protoModule.readVarInt(p73, var2122)
			local _ = var2128
			var2122 = var2129
			continue
		end
		if var2123 == protoModule.wireTypes.lengthDelimited then
			if var2127 == 1 then
				local _ = nil
				local var2130, var2131 = protoModule.readBuffer(p73, var2122)
				var2122 = var2131
				var2121.event_id = buffer.tostring(var2130)
			else
				local _ = nil
				local var2132, var2133 = protoModule.readVarInt(p73, var2122)
				var2122 = var2133 + var2132
			end
		elseif var2123 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2134, var2135 = protoModule.readFixed32(p73, var2122)
			local _ = var2134
			var2122 = var2135
		elseif var2123 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2136, var2137 = protoModule.readFixed64(p73, var2122)
			local _ = var2136
			var2122 = var2137
		else
			error("Unsupported wire type: " .. var3190)
		end
	end
	return var2121
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
	local var2138 = t_73.new()
	
	if self.event_id ~= nil then
		var2138.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2138.event_id = self.eventId
	end
	return var2138
end

t_73.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_73
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p74)
	-- upvalues: t_74 (ref)
	return setmetatable({
		event_id = if p74 == nil or p74.event_id == nil then "" else p74.event_id,
		universe_id = if p74 == nil or p74.universe_id == nil then "" else p74.universe_id,
		rsvp_users = if p74 == nil or p74.rsvp_users == nil then {} else p74.rsvp_users
	}, t_74)
end

function t_74:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2138 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2139, var2140 = protoModule.writeTag(buff, var2138, 1, protoModule.wireTypes.lengthDelimited)
		var2139, var3210 = protoModule.writeString(var2139, var2140, self.event_id)
		buff = var2139
		var2138 = var2140
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2141, var2142 = protoModule.writeTag(buff, var2138, 2, protoModule.wireTypes.lengthDelimited)
		var2141, var3212 = protoModule.writeString(var2141, var2142, self.universe_id)
		buff = var2141
		var2138 = var2142
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var2143 = v:encode()
			local var2144, var2145 = protoModule.writeTag(buff, var2138, 3, protoModule.wireTypes.lengthDelimited)
			var2144, var3215 = protoModule.writeBuffer(var2144, var2145, var2143, buffer.len(var2143))
			buff = var2144
			var2138 = var2145
		end
	end
	local buff_1 = buffer.create(var2138)
	buffer.copy(buff_1, 0, buff, 0, var2138)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2146 = t_74.new()
	local var2147 = 0
	while var2147 < buffer.len(p74) do
		local _ = nil
		local var2148 = nil
		local var2149, var2150, var2151 = protoModule.readTag(p74, var2147)
		local var2152 = var2149
		var2148 = var2150
		var2147 = var2151
		
		if var2148 == protoModule.wireTypes.varint then
			local _ = nil
			local var2153, var2154 = protoModule.readVarInt(p74, var2147)
			local _ = var2153
			var2147 = var2154
			continue
		end
		if var2148 == protoModule.wireTypes.lengthDelimited then
			if var2152 == 1 then
				local _ = nil
				local var2155, var2156 = protoModule.readBuffer(p74, var2147)
				var2147 = var2156
				var2146.event_id = buffer.tostring(var2155)
			elseif var2152 == 2 then
				local _ = nil
				local var2157, var2158 = protoModule.readBuffer(p74, var2147)
				var2147 = var2158
				var2146.universe_id = buffer.tostring(var2157)
			elseif var2152 == 3 then
				local _ = nil
				local var2159, var2160 = protoModule.readBuffer(p74, var2147)
				var2147 = var2160
				table.insert(var2146.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var2159))
			else
				local _ = nil
				local var2161, var2162 = protoModule.readVarInt(p74, var2147)
				var2147 = var2162 + var2161
			end
		elseif var2148 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2163, var2164 = protoModule.readFixed32(p74, var2147)
			local _ = var2163
			var2147 = var2164
		elseif var2148 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2165, var2166 = protoModule.readFixed64(p74, var2147)
			local _ = var2165
			var2147 = var2166
		else
			error("Unsupported wire type: " .. var3219)
		end
	end
	return var2146
end

function t_74:jsonEncode()
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

function t_74:jsonDecode()
	-- upvalues: t_74 (ref), t (ref)
	local var2167 = t_74.new()
	
	if self.event_id ~= nil then
		var2167.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2167.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2167.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2167.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2167.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2167.rsvp_users = t_1
	end
	return var2167
end

t_74.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_74
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p75)
	-- upvalues: t_75 (ref)
	return setmetatable({
		user_id = if p75 == nil or p75.user_id == nil then 0 else p75.user_id
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2168 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2169, var2170 = protoModule.writeTag(buff, var2168, 1, protoModule.wireTypes.varint)
		var2169, var3246 = protoModule.writeVarInt(var2169, var2170, self.user_id)
		buff = var2169
		var2168 = var2170
	end
	local buff_1 = buffer.create(var2168)
	buffer.copy(buff_1, 0, buff, 0, var2168)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref)
	local var2168 = t_75.new()
	local var2169 = 0
	while var2169 < buffer.len(p75) do
		local _ = nil
		local _ = nil
		local var2170, var2171, var2172 = protoModule.readTag(p75, var2169)
		local var2173 = var2170
		local var2174 = var2171
		var2169 = var2172
		
		if var2174 == protoModule.wireTypes.varint then
			if var2173 == 1 then
				local _ = nil
				local var2175, var2176 = protoModule.readVarIntI64(p75, var2169)
				var2169 = var2176
				var2168.user_id = var2175
			else
				local _ = nil
				local var2177, var2178 = protoModule.readVarInt(p75, var2169)
				local _ = var2177
				var2169 = var2178
			end
		elseif var2174 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2179, var2180 = protoModule.readVarInt(p75, var2169)
			var2169 = var2180 + var2179
		elseif var2174 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2181, var2182 = protoModule.readFixed32(p75, var2169)
			local _ = var2181
			var2169 = var2182
		elseif var2174 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2183, var2184 = protoModule.readFixed64(p75, var2169)
			local _ = var2183
			var2169 = var2184
		else
			error("Unsupported wire type: " .. var3254)
		end
	end
	return var2168
end

function t_75:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_75:jsonDecode()
	-- upvalues: t_75 (ref)
	local var2185 = t_75.new()
	
	if self.user_id ~= nil then
		var2185.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2185.user_id = self.userId
	end
	return var2185
end

t_75.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = t_75
typeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p76)
	-- upvalues: t_76 (ref)
	return setmetatable({
		event_id = if p76 == nil or p76.event_id == nil then "" else p76.event_id
	}, t_76)
end

function t_76:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2185 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2186, var2187 = protoModule.writeTag(buff, var2185, 1, protoModule.wireTypes.lengthDelimited)
		var2186, var3270 = protoModule.writeString(var2186, var2187, self.event_id)
		buff = var2186
		var2185 = var2187
	end
	local buff_1 = buffer.create(var2185)
	buffer.copy(buff_1, 0, buff, 0, var2185)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref)
	local var2185 = t_76.new()
	local var2186 = 0
	while var2186 < buffer.len(p76) do
		local _ = nil
		local var2187 = nil
		local var2188, var2189, var2190 = protoModule.readTag(p76, var2186)
		local var2191 = var2188
		var2187 = var2189
		var2186 = var2190
		
		if var2187 == protoModule.wireTypes.varint then
			local _ = nil
			local var2192, var2193 = protoModule.readVarInt(p76, var2186)
			local _ = var2192
			var2186 = var2193
			continue
		end
		if var2187 == protoModule.wireTypes.lengthDelimited then
			if var2191 == 1 then
				local _ = nil
				local var2194, var2195 = protoModule.readBuffer(p76, var2186)
				var2186 = var2195
				var2185.event_id = buffer.tostring(var2194)
			else
				local _ = nil
				local var2196, var2197 = protoModule.readVarInt(p76, var2186)
				var2186 = var2197 + var2196
			end
		elseif var2187 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2198, var2199 = protoModule.readFixed32(p76, var2186)
			local _ = var2198
			var2186 = var2199
		elseif var2187 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2200, var2201 = protoModule.readFixed64(p76, var2186)
			local _ = var2200
			var2186 = var2201
		else
			error("Unsupported wire type: " .. var3274)
		end
	end
	return var2185
end

function t_76:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_76:jsonDecode()
	-- upvalues: t_76 (ref)
	local var2202 = t_76.new()
	
	if self.event_id ~= nil then
		var2202.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2202.event_id = self.eventId
	end
	return var2202
end

t_76.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_76
typeRegistryModule.default:register(t.EventInfoTableInputData)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p77)
	-- upvalues: t_77 (ref)
	return setmetatable({
		event_id = if p77 == nil or p77.event_id == nil then "" else p77.event_id
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2202 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2203, var2204 = protoModule.writeTag(buff, var2202, 1, protoModule.wireTypes.lengthDelimited)
		var2203, var3294 = protoModule.writeString(var2203, var2204, self.event_id)
		buff = var2203
		var2202 = var2204
	end
	local buff_1 = buffer.create(var2202)
	buffer.copy(buff_1, 0, buff, 0, var2202)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref)
	local var2202 = t_77.new()
	local var2203 = 0
	while var2203 < buffer.len(p77) do
		local _ = nil
		local var2204 = nil
		local var2205, var2206, var2207 = protoModule.readTag(p77, var2203)
		local var2208 = var2205
		var2204 = var2206
		var2203 = var2207
		
		if var2204 == protoModule.wireTypes.varint then
			local _ = nil
			local var2209, var2210 = protoModule.readVarInt(p77, var2203)
			local _ = var2209
			var2203 = var2210
			continue
		end
		if var2204 == protoModule.wireTypes.lengthDelimited then
			if var2208 == 1 then
				local _ = nil
				local var2211, var2212 = protoModule.readBuffer(p77, var2203)
				var2203 = var2212
				var2202.event_id = buffer.tostring(var2211)
			else
				local _ = nil
				local var2213, var2214 = protoModule.readVarInt(p77, var2203)
				var2203 = var2214 + var2213
			end
		elseif var2204 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2215, var2216 = protoModule.readFixed32(p77, var2203)
			local _ = var2215
			var2203 = var2216
		elseif var2204 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2217, var2218 = protoModule.readFixed64(p77, var2203)
			local _ = var2217
			var2203 = var2218
		else
			error("Unsupported wire type: " .. var3298)
		end
	end
	return var2202
end

function t_77:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_77:jsonDecode()
	-- upvalues: t_77 (ref)
	local var2219 = t_77.new()
	
	if self.event_id ~= nil then
		var2219.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2219.event_id = self.eventId
	end
	return var2219
end

t_77.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_77
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p78)
	-- upvalues: t_78 (ref)
	return setmetatable({
		event_id = if p78 == nil or p78.event_id == nil then "" else p78.event_id,
		universe_id = if p78 == nil or p78.universe_id == nil then "" else p78.universe_id
	}, t_78)
end

function t_78:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2219 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2220, var2221 = protoModule.writeTag(buff, var2219, 1, protoModule.wireTypes.lengthDelimited)
		var2220, var3318 = protoModule.writeString(var2220, var2221, self.event_id)
		buff = var2220
		var2219 = var2221
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2222, var2223 = protoModule.writeTag(buff, var2219, 2, protoModule.wireTypes.lengthDelimited)
		var2222, var3320 = protoModule.writeString(var2222, var2223, self.universe_id)
		buff = var2222
		var2219 = var2223
	end
	local buff_1 = buffer.create(var2219)
	buffer.copy(buff_1, 0, buff, 0, var2219)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref)
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
				var2219.event_id = buffer.tostring(var2228)
			elseif var2225 == 2 then
				local _ = nil
				local var2230, var2231 = protoModule.readBuffer(p78, var2220)
				var2220 = var2231
				var2219.universe_id = buffer.tostring(var2230)
			else
				local _ = nil
				local var2232, var2233 = protoModule.readVarInt(p78, var2220)
				var2220 = var2233 + var2232
			end
		elseif var2221 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2234, var2235 = protoModule.readFixed32(p78, var2220)
			local _ = var2234
			var2220 = var2235
		elseif var2221 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2236, var2237 = protoModule.readFixed64(p78, var2220)
			local _ = var2236
			var2220 = var2237
		else
			error("Unsupported wire type: " .. var3324)
		end
	end
	return var2219
end

function t_78:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_78:jsonDecode()
	-- upvalues: t_78 (ref)
	local var2238 = t_78.new()
	
	if self.event_id ~= nil then
		var2238.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2238.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2238.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2238.universe_id = self.universeId
	end
	return var2238
end

t_78.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_78
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p79)
	-- upvalues: t_79 (ref)
	return setmetatable({
		entry_map = if p79 == nil or p79.entry_map == nil then {} else p79.entry_map,
		entry_order = if p79 == nil or p79.entry_order == nil then {} else p79.entry_order,
		next_page_token = if p79 == nil or p79.next_page_token == nil then "" else p79.next_page_token,
		sticky_filter_pills = if p79 == nil or p79.sticky_filter_pills == nil then nil else p79.sticky_filter_pills,
		applied_filters = if p79 == nil or p79.applied_filters == nil then "" else p79.applied_filters
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2238 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2239, var2240 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2239, var3346 = protoModule.writeString(var2239, var2240, i)
			local var2241 = v:encode()
			var2240, var3348 = protoModule.writeTag(var2239, var2240, 2, protoModule.wireTypes.lengthDelimited)
			var2240, var3348 = protoModule.writeBuffer(var2240, var3348, var2241, buffer.len(var2241))
			local var2242 = var2240
			local var2243 = var3348
			local var2244, var2245 = protoModule.writeTag(buff, var2238, 1, protoModule.wireTypes.lengthDelimited)
			var2244, var3352 = protoModule.writeBuffer(var2244, var2245, var2242, var2243)
			buff = var2244
			var2238 = var2245
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2246, var2247 = protoModule.writeTag(buff, var2238, 2, protoModule.wireTypes.lengthDelimited)
			var2246, var3354 = protoModule.writeString(var2246, var2247, v)
			buff = var2246
			var2238 = var2247
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2248, var2249 = protoModule.writeTag(buff, var2238, 3, protoModule.wireTypes.lengthDelimited)
		var2248, var3356 = protoModule.writeString(var2248, var2249, self.next_page_token)
		buff = var2248
		var2238 = var2249
	end
	if self.sticky_filter_pills ~= nil then
		local var2250 = self.sticky_filter_pills:encode()
		local var2251, var2252 = protoModule.writeTag(buff, var2238, 4, protoModule.wireTypes.lengthDelimited)
		var2251, var3359 = protoModule.writeBuffer(var2251, var2252, var2250, buffer.len(var2250))
		buff = var2251
		var2238 = var2252
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2253, var2254 = protoModule.writeTag(buff, var2238, 5, protoModule.wireTypes.lengthDelimited)
		var2253, var3361 = protoModule.writeString(var2253, var2254, self.applied_filters)
		buff = var2253
		var2238 = var2254
	end
	local buff_1 = buffer.create(var2238)
	buffer.copy(buff_1, 0, buff, 0, var2238)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
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
				var2264 = t.ChartsFeedInputData_EntryMapEntry.decode(var2264)
				var2255.entry_map[var2264.key or ""] = var2264.value or t.FeedEntry.new()
			elseif var2261 == 2 then
				local _ = nil
				local var2266, var2267 = protoModule.readBuffer(p79, var2256)
				var2256 = var2267
				table.insert(var2255.entry_order, buffer.tostring(var2266))
			elseif var2261 == 3 then
				local _ = nil
				local var2268, var2269 = protoModule.readBuffer(p79, var2256)
				var2256 = var2269
				var2255.next_page_token = buffer.tostring(var2268)
			elseif var2261 == 4 then
				local _ = nil
				local var2270, var2271 = protoModule.readBuffer(p79, var2256)
				var2256 = var2271
				var2255.sticky_filter_pills = t.FilterPillsInputData.decode(var2270)
			elseif var2261 == 5 then
				local _ = nil
				local var2272, var2273 = protoModule.readBuffer(p79, var2256)
				var2256 = var2273
				var2255.applied_filters = buffer.tostring(var2272)
			else
				local _ = nil
				local var2274, var2275 = protoModule.readVarInt(p79, var2256)
				var2256 = var2275 + var2274
			end
		elseif var2257 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2276, var2277 = protoModule.readFixed32(p79, var2256)
			local _ = var2276
			var2256 = var2277
		elseif var2257 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2278, var2279 = protoModule.readFixed64(p79, var2256)
			local _ = var2278
			var2256 = var2279
		else
			error("Unsupported wire type: " .. var3365)
		end
	end
	return var2255
end

function t_79:jsonEncode()
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

function t_79:jsonDecode()
	-- upvalues: t_79 (ref), t (ref)
	local var2280 = t_79.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2280.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2280.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2280.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2280.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2280.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2280.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2280.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2280.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2280.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2280.applied_filters = self.appliedFilters
	end
	return var2280
end

t_79.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_79
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p80)
	-- upvalues: t_80 (ref)
	return setmetatable({
		key = if p80 == nil or p80.key == nil then "" else p80.key,
		value = if p80 == nil or p80.value == nil then nil else p80.value
	}, t_80)
end

function t_80:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2281 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2282, var2283 = protoModule.writeTag(buff, var2281, 1, protoModule.wireTypes.lengthDelimited)
		var2282, var3399 = protoModule.writeString(var2282, var2283, self.key)
		buff = var2282
		var2281 = var2283
	end
	if self.value ~= nil then
		local var2284 = self.value:encode()
		local var2285, var2286 = protoModule.writeTag(buff, var2281, 2, protoModule.wireTypes.lengthDelimited)
		var2285, var3402 = protoModule.writeBuffer(var2285, var2286, var2284, buffer.len(var2284))
		buff = var2285
		var2281 = var2286
	end
	local buff_1 = buffer.create(var2281)
	buffer.copy(buff_1, 0, buff, 0, var2281)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2281 = t_80.new()
	local var2282 = 0
	while var2282 < buffer.len(p80) do
		local _ = nil
		local var2283 = nil
		local var2284, var2285, var2286 = protoModule.readTag(p80, var2282)
		local var2287 = var2284
		var2283 = var2285
		var2282 = var2286
		
		if var2283 == protoModule.wireTypes.varint then
			local _ = nil
			local var2288, var2289 = protoModule.readVarInt(p80, var2282)
			local _ = var2288
			var2282 = var2289
			continue
		end
		if var2283 == protoModule.wireTypes.lengthDelimited then
			if var2287 == 1 then
				local _ = nil
				local var2290, var2291 = protoModule.readBuffer(p80, var2282)
				var2282 = var2291
				var2281.key = buffer.tostring(var2290)
			elseif var2287 == 2 then
				local _ = nil
				local var2292, var2293 = protoModule.readBuffer(p80, var2282)
				var2282 = var2293
				var2281.value = t.FeedEntry.decode(var2292)
			else
				local _ = nil
				local var2294, var2295 = protoModule.readVarInt(p80, var2282)
				var2282 = var2295 + var2294
			end
		elseif var2283 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2296, var2297 = protoModule.readFixed32(p80, var2282)
			local _ = var2296
			var2282 = var2297
		elseif var2283 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2298, var2299 = protoModule.readFixed64(p80, var2282)
			local _ = var2298
			var2282 = var2299
		else
			error("Unsupported wire type: " .. var3406)
		end
	end
	return var2281
end

function t_80:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_80:jsonDecode()
	-- upvalues: t_80 (ref), t (ref)
	local var2300 = t_80.new()
	
	if self.key ~= nil then
		var2300.key = self.key
	end
	if self.value ~= nil then
		var2300.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2300
end

t_80.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_80
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p81)
	-- upvalues: t_81 (ref)
	return setmetatable({
		filter_groups = if p81 == nil or p81.filter_groups == nil then {} else p81.filter_groups,
		sort_id = if p81 == nil or p81.sort_id == nil then "" else p81.sort_id,
		secondary_sort_id = if p81 == nil or p81.secondary_sort_id == nil then 0 else p81.secondary_sort_id,
		title = if p81 == nil or p81.title == nil then "" else p81.title,
		primary_sort_id = if p81 == nil or p81.primary_sort_id == nil then nil else p81.primary_sort_id,
		applied_filters = if p81 == nil or p81.applied_filters == nil then nil else p81.applied_filters
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2300 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2301 = v:encode()
			local var2302, var2303 = protoModule.writeTag(buff, var2300, 1, protoModule.wireTypes.lengthDelimited)
			var2302, var3429 = protoModule.writeBuffer(var2302, var2303, var2301, buffer.len(var2301))
			buff = var2302
			var2300 = var2303
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2304, var2305 = protoModule.writeTag(buff, var2300, 2, protoModule.wireTypes.lengthDelimited)
		var2304, var3431 = protoModule.writeString(var2304, var2305, self.sort_id)
		buff = var2304
		var2300 = var2305
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2306, var2307 = protoModule.writeTag(buff, var2300, 3, protoModule.wireTypes.varint)
		var2306, var3433 = protoModule.writeVarInt(var2306, var2307, self.secondary_sort_id)
		buff = var2306
		var2300 = var2307
	end
	if self.title ~= nil and self.title ~= "" then
		local var2308, var2309 = protoModule.writeTag(buff, var2300, 4, protoModule.wireTypes.lengthDelimited)
		var2308, var3435 = protoModule.writeString(var2308, var2309, self.title)
		buff = var2308
		var2300 = var2309
	end
	if self.primary_sort_id ~= nil then
		local var2310, var2311 = protoModule.writeTag(buff, var2300, 5, protoModule.wireTypes.varint)
		var2310, var3437 = protoModule.writeVarInt(var2310, var2311, self.primary_sort_id)
		buff = var2310
		var2300 = var2311
	end
	if self.applied_filters ~= nil then
		local var2312, var2313 = protoModule.writeTag(buff, var2300, 6, protoModule.wireTypes.lengthDelimited)
		var2312, var3439 = protoModule.writeString(var2312, var2313, self.applied_filters)
		buff = var2312
		var2300 = var2313
	end
	local buff_1 = buffer.create(var2300)
	buffer.copy(buff_1, 0, buff, 0, var2300)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2314 = t_81.new()
	local var2315 = 0
	while var2315 < buffer.len(p81) do
		local _ = nil
		local var2316 = nil
		local var2317, var2318, var2319 = protoModule.readTag(p81, var2315)
		local var2320 = var2317
		var2316 = var2318
		var2315 = var2319
		
		if var2316 == protoModule.wireTypes.varint then
			if var2320 == 3 then
				local _ = nil
				local var2321, var2322 = protoModule.readVarIntI32(p81, var2315)
				var2315 = var2322
				var2314.secondary_sort_id = var2321
			elseif var2320 == 5 then
				local _ = nil
				local var2323, var2324 = protoModule.readVarIntI32(p81, var2315)
				var2315 = var2324
				var2314.primary_sort_id = var2323
			else
				local _ = nil
				local var2325, var2326 = protoModule.readVarInt(p81, var2315)
				local _ = var2325
				var2315 = var2326
			end
		end
		if var2316 == protoModule.wireTypes.lengthDelimited then
			if var2320 == 1 then
				local _ = nil
				local var2327, var2328 = protoModule.readBuffer(p81, var2315)
				var2315 = var2328
				table.insert(var2314.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2327))
			elseif var2320 == 2 then
				local _ = nil
				local var2329, var2330 = protoModule.readBuffer(p81, var2315)
				var2315 = var2330
				var2314.sort_id = buffer.tostring(var2329)
			elseif var2320 == 4 then
				local _ = nil
				local var2331, var2332 = protoModule.readBuffer(p81, var2315)
				var2315 = var2332
				var2314.title = buffer.tostring(var2331)
			elseif var2320 == 6 then
				local _ = nil
				local var2333, var2334 = protoModule.readBuffer(p81, var2315)
				var2315 = var2334
				var2314.applied_filters = buffer.tostring(var2333)
			else
				local _ = nil
				local var2335, var2336 = protoModule.readVarInt(p81, var2315)
				var2315 = var2336 + var2335
			end
		elseif var2316 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2337, var2338 = protoModule.readFixed32(p81, var2315)
			local _ = var2337
			var2315 = var2338
		elseif var2316 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2339, var2340 = protoModule.readFixed64(p81, var2315)
			local _ = var2339
			var2315 = var2340
		else
			error("Unsupported wire type: " .. var3443)
		end
	end
	return var2314
end

function t_81:jsonEncode()
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

function t_81:jsonDecode()
	-- upvalues: t_81 (ref), t (ref)
	local var2341 = t_81.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2341.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2341.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2341.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2341.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2341.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2341.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2341.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2341.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2341.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2341.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2341.applied_filters = self.appliedFilters
	end
	return var2341
end

t_81.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_81
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p82)
	-- upvalues: t_82 (ref)
	return setmetatable({
		filter_id = if p82 == nil or p82.filter_id == nil then "" else p82.filter_id,
		display_name = if p82 == nil or p82.display_name == nil then "" else p82.display_name,
		options = if p82 == nil or p82.options == nil then {} else p82.options,
		default_option_id = if p82 == nil or p82.default_option_id == nil then "" else p82.default_option_id,
		selected_option_id = if p82 == nil or p82.selected_option_id == nil then "" else p82.selected_option_id,
		filter_type = if p82 == nil or p82.filter_type == nil then "" else p82.filter_type,
		inactive_option_ids = if p82 == nil or p82.inactive_option_ids == nil then {} else p82.inactive_option_ids,
		info_text = if p82 == nil or p82.info_text == nil then "" else p82.info_text
	}, t_82)
end

function t_82:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2342 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2343, var2344 = protoModule.writeTag(buff, var2342, 1, protoModule.wireTypes.lengthDelimited)
		var2343, var3476 = protoModule.writeString(var2343, var2344, self.filter_id)
		buff = var2343
		var2342 = var2344
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2345, var2346 = protoModule.writeTag(buff, var2342, 2, protoModule.wireTypes.lengthDelimited)
		var2345, var3478 = protoModule.writeString(var2345, var2346, self.display_name)
		buff = var2345
		var2342 = var2346
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2347 = v:encode()
			local var2348, var2349 = protoModule.writeTag(buff, var2342, 3, protoModule.wireTypes.lengthDelimited)
			var2348, var3481 = protoModule.writeBuffer(var2348, var2349, var2347, buffer.len(var2347))
			buff = var2348
			var2342 = var2349
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2350, var2351 = protoModule.writeTag(buff, var2342, 4, protoModule.wireTypes.lengthDelimited)
		var2350, var3483 = protoModule.writeString(var2350, var2351, self.default_option_id)
		buff = var2350
		var2342 = var2351
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2352, var2353 = protoModule.writeTag(buff, var2342, 5, protoModule.wireTypes.lengthDelimited)
		var2352, var3485 = protoModule.writeString(var2352, var2353, self.selected_option_id)
		buff = var2352
		var2342 = var2353
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2354, var2355 = protoModule.writeTag(buff, var2342, 6, protoModule.wireTypes.lengthDelimited)
		var2354, var3487 = protoModule.writeString(var2354, var2355, self.filter_type)
		buff = var2354
		var2342 = var2355
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2356, var2357 = protoModule.writeTag(buff, var2342, 7, protoModule.wireTypes.lengthDelimited)
			var2356, var3489 = protoModule.writeString(var2356, var2357, v)
			buff = var2356
			var2342 = var2357
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2358, var2359 = protoModule.writeTag(buff, var2342, 8, protoModule.wireTypes.lengthDelimited)
		var2358, var3491 = protoModule.writeString(var2358, var2359, self.info_text)
		buff = var2358
		var2342 = var2359
	end
	local buff_1 = buffer.create(var2342)
	buffer.copy(buff_1, 0, buff, 0, var2342)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2360 = t_82.new()
	local var2361 = 0
	while var2361 < buffer.len(p82) do
		local _ = nil
		local var2362 = nil
		local var2363, var2364, var2365 = protoModule.readTag(p82, var2361)
		local var2366 = var2363
		var2362 = var2364
		var2361 = var2365
		
		if var2362 == protoModule.wireTypes.varint then
			local _ = nil
			local var2367, var2368 = protoModule.readVarInt(p82, var2361)
			local _ = var2367
			var2361 = var2368
			continue
		end
		if var2362 == protoModule.wireTypes.lengthDelimited then
			if var2366 == 1 then
				local _ = nil
				local var2369, var2370 = protoModule.readBuffer(p82, var2361)
				var2361 = var2370
				var2360.filter_id = buffer.tostring(var2369)
			elseif var2366 == 2 then
				local _ = nil
				local var2371, var2372 = protoModule.readBuffer(p82, var2361)
				var2361 = var2372
				var2360.display_name = buffer.tostring(var2371)
			elseif var2366 == 3 then
				local _ = nil
				local var2373, var2374 = protoModule.readBuffer(p82, var2361)
				var2361 = var2374
				table.insert(var2360.options, t.FilterPillsInputData_FilterOption.decode(var2373))
			elseif var2366 == 4 then
				local _ = nil
				local var2375, var2376 = protoModule.readBuffer(p82, var2361)
				var2361 = var2376
				var2360.default_option_id = buffer.tostring(var2375)
			elseif var2366 == 5 then
				local _ = nil
				local var2377, var2378 = protoModule.readBuffer(p82, var2361)
				var2361 = var2378
				var2360.selected_option_id = buffer.tostring(var2377)
			elseif var2366 == 6 then
				local _ = nil
				local var2379, var2380 = protoModule.readBuffer(p82, var2361)
				var2361 = var2380
				var2360.filter_type = buffer.tostring(var2379)
			elseif var2366 == 7 then
				local _ = nil
				local var2381, var2382 = protoModule.readBuffer(p82, var2361)
				var2361 = var2382
				table.insert(var2360.inactive_option_ids, buffer.tostring(var2381))
			elseif var2366 == 8 then
				local _ = nil
				local var2383, var2384 = protoModule.readBuffer(p82, var2361)
				var2361 = var2384
				var2360.info_text = buffer.tostring(var2383)
			else
				local _ = nil
				local var2385, var2386 = protoModule.readVarInt(p82, var2361)
				var2361 = var2386 + var2385
			end
		elseif var2362 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2387, var2388 = protoModule.readFixed32(p82, var2361)
			local _ = var2387
			var2361 = var2388
		elseif var2362 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2389, var2390 = protoModule.readFixed64(p82, var2361)
			local _ = var2389
			var2361 = var2390
		else
			error("Unsupported wire type: " .. var3495)
		end
	end
	return var2360
end

function t_82:jsonEncode()
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

function t_82:jsonDecode()
	-- upvalues: t_82 (ref), t (ref)
	local var2391 = t_82.new()
	
	if self.filter_id ~= nil then
		var2391.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2391.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2391.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2391.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2391.options = t_1
	end
	if self.default_option_id ~= nil then
		var2391.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2391.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2391.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2391.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2391.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2391.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2391.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2391.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2391.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2391.info_text = self.infoText
	end
	return var2391
end

t_82.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_82
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p83)
	-- upvalues: t_83 (ref)
	return setmetatable({
		option_id = if p83 == nil or p83.option_id == nil then "" else p83.option_id,
		display_name = if p83 == nil or p83.display_name == nil then "" else p83.display_name,
		option_context_tag = if p83 == nil or p83.option_context_tag == nil then "" else p83.option_context_tag
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2392 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2393, var2394 = protoModule.writeTag(buff, var2392, 1, protoModule.wireTypes.lengthDelimited)
		var2393, var3534 = protoModule.writeString(var2393, var2394, self.option_id)
		buff = var2393
		var2392 = var2394
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2395, var2396 = protoModule.writeTag(buff, var2392, 2, protoModule.wireTypes.lengthDelimited)
		var2395, var3536 = protoModule.writeString(var2395, var2396, self.display_name)
		buff = var2395
		var2392 = var2396
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2397, var2398 = protoModule.writeTag(buff, var2392, 3, protoModule.wireTypes.lengthDelimited)
		var2397, var3538 = protoModule.writeString(var2397, var2398, self.option_context_tag)
		buff = var2397
		var2392 = var2398
	end
	local buff_1 = buffer.create(var2392)
	buffer.copy(buff_1, 0, buff, 0, var2392)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref)
	local var2392 = t_83.new()
	local var2393 = 0
	while var2393 < buffer.len(p83) do
		local _ = nil
		local var2394 = nil
		local var2395, var2396, var2397 = protoModule.readTag(p83, var2393)
		local var2398 = var2395
		var2394 = var2396
		var2393 = var2397
		
		if var2394 == protoModule.wireTypes.varint then
			local _ = nil
			local var2399, var2400 = protoModule.readVarInt(p83, var2393)
			local _ = var2399
			var2393 = var2400
			continue
		end
		if var2394 == protoModule.wireTypes.lengthDelimited then
			if var2398 == 1 then
				local _ = nil
				local var2401, var2402 = protoModule.readBuffer(p83, var2393)
				var2393 = var2402
				var2392.option_id = buffer.tostring(var2401)
			elseif var2398 == 2 then
				local _ = nil
				local var2403, var2404 = protoModule.readBuffer(p83, var2393)
				var2393 = var2404
				var2392.display_name = buffer.tostring(var2403)
			elseif var2398 == 3 then
				local _ = nil
				local var2405, var2406 = protoModule.readBuffer(p83, var2393)
				var2393 = var2406
				var2392.option_context_tag = buffer.tostring(var2405)
			else
				local _ = nil
				local var2407, var2408 = protoModule.readVarInt(p83, var2393)
				var2393 = var2408 + var2407
			end
		elseif var2394 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2409, var2410 = protoModule.readFixed32(p83, var2393)
			local _ = var2409
			var2393 = var2410
		elseif var2394 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2411, var2412 = protoModule.readFixed64(p83, var2393)
			local _ = var2411
			var2393 = var2412
		else
			error("Unsupported wire type: " .. var3542)
		end
	end
	return var2392
end

function t_83:jsonEncode()
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

function t_83:jsonDecode()
	-- upvalues: t_83 (ref)
	local var2413 = t_83.new()
	
	if self.option_id ~= nil then
		var2413.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2413.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2413.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2413.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2413.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2413.option_context_tag = self.optionContextTag
	end
	return var2413
end

t_83.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_83
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p84)
	-- upvalues: t_84 (ref)
	return setmetatable({
		sort_options = if p84 == nil or p84.sort_options == nil then {} else p84.sort_options,
		selected_sort_id = if p84 == nil or p84.selected_sort_id == nil then "" else p84.selected_sort_id
	}, t_84)
end

function t_84:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2413 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2414 = v:encode()
			local var2415, var2416 = protoModule.writeTag(buff, var2413, 1, protoModule.wireTypes.lengthDelimited)
			var2415, var3567 = protoModule.writeBuffer(var2415, var2416, var2414, buffer.len(var2414))
			buff = var2415
			var2413 = var2416
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2417, var2418 = protoModule.writeTag(buff, var2413, 2, protoModule.wireTypes.lengthDelimited)
		var2417, var3569 = protoModule.writeString(var2417, var2418, self.selected_sort_id)
		buff = var2417
		var2413 = var2418
	end
	local buff_1 = buffer.create(var2413)
	buffer.copy(buff_1, 0, buff, 0, var2413)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2419 = t_84.new()
	local var2420 = 0
	while var2420 < buffer.len(p84) do
		local _ = nil
		local var2421 = nil
		local var2422, var2423, var2424 = protoModule.readTag(p84, var2420)
		local var2425 = var2422
		var2421 = var2423
		var2420 = var2424
		
		if var2421 == protoModule.wireTypes.varint then
			local _ = nil
			local var2426, var2427 = protoModule.readVarInt(p84, var2420)
			local _ = var2426
			var2420 = var2427
			continue
		end
		if var2421 == protoModule.wireTypes.lengthDelimited then
			if var2425 == 1 then
				local _ = nil
				local var2428, var2429 = protoModule.readBuffer(p84, var2420)
				var2420 = var2429
				table.insert(var2419.sort_options, t.SortSelectorInputData_SortOption.decode(var2428))
			elseif var2425 == 2 then
				local _ = nil
				local var2430, var2431 = protoModule.readBuffer(p84, var2420)
				var2420 = var2431
				var2419.selected_sort_id = buffer.tostring(var2430)
			else
				local _ = nil
				local var2432, var2433 = protoModule.readVarInt(p84, var2420)
				var2420 = var2433 + var2432
			end
		elseif var2421 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2434, var2435 = protoModule.readFixed32(p84, var2420)
			local _ = var2434
			var2420 = var2435
		elseif var2421 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2436, var2437 = protoModule.readFixed64(p84, var2420)
			local _ = var2436
			var2420 = var2437
		else
			error("Unsupported wire type: " .. var3573)
		end
	end
	return var2419
end

function t_84:jsonEncode()
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

function t_84:jsonDecode()
	-- upvalues: t_84 (ref), t (ref)
	local var2438 = t_84.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2438.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2438.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2438.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2438.selected_sort_id = self.selectedSortId
	end
	return var2438
end

t_84.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_84
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p85)
	-- upvalues: t_85 (ref)
	return setmetatable({
		sort_id = if p85 == nil or p85.sort_id == nil then "" else p85.sort_id,
		display_name = if p85 == nil or p85.display_name == nil then "" else p85.display_name,
		content_type = if p85 == nil or p85.content_type == nil then "" else p85.content_type
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2439 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2440, var2441 = protoModule.writeTag(buff, var2439, 1, protoModule.wireTypes.lengthDelimited)
		var2440, var3598 = protoModule.writeString(var2440, var2441, self.sort_id)
		buff = var2440
		var2439 = var2441
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2442, var2443 = protoModule.writeTag(buff, var2439, 2, protoModule.wireTypes.lengthDelimited)
		var2442, var3600 = protoModule.writeString(var2442, var2443, self.display_name)
		buff = var2442
		var2439 = var2443
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2444, var2445 = protoModule.writeTag(buff, var2439, 3, protoModule.wireTypes.lengthDelimited)
		var2444, var3602 = protoModule.writeString(var2444, var2445, self.content_type)
		buff = var2444
		var2439 = var2445
	end
	local buff_1 = buffer.create(var2439)
	buffer.copy(buff_1, 0, buff, 0, var2439)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref)
	local var2439 = t_85.new()
	local var2440 = 0
	while var2440 < buffer.len(p85) do
		local _ = nil
		local var2441 = nil
		local var2442, var2443, var2444 = protoModule.readTag(p85, var2440)
		local var2445 = var2442
		var2441 = var2443
		var2440 = var2444
		
		if var2441 == protoModule.wireTypes.varint then
			local _ = nil
			local var2446, var2447 = protoModule.readVarInt(p85, var2440)
			local _ = var2446
			var2440 = var2447
			continue
		end
		if var2441 == protoModule.wireTypes.lengthDelimited then
			if var2445 == 1 then
				local _ = nil
				local var2448, var2449 = protoModule.readBuffer(p85, var2440)
				var2440 = var2449
				var2439.sort_id = buffer.tostring(var2448)
			elseif var2445 == 2 then
				local _ = nil
				local var2450, var2451 = protoModule.readBuffer(p85, var2440)
				var2440 = var2451
				var2439.display_name = buffer.tostring(var2450)
			elseif var2445 == 3 then
				local _ = nil
				local var2452, var2453 = protoModule.readBuffer(p85, var2440)
				var2440 = var2453
				var2439.content_type = buffer.tostring(var2452)
			else
				local _ = nil
				local var2454, var2455 = protoModule.readVarInt(p85, var2440)
				var2440 = var2455 + var2454
			end
		elseif var2441 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2456, var2457 = protoModule.readFixed32(p85, var2440)
			local _ = var2456
			var2440 = var2457
		elseif var2441 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2458, var2459 = protoModule.readFixed64(p85, var2440)
			local _ = var2458
			var2440 = var2459
		else
			error("Unsupported wire type: " .. var3606)
		end
	end
	return var2439
end

function t_85:jsonEncode()
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

function t_85:jsonDecode()
	-- upvalues: t_85 (ref)
	local var2460 = t_85.new()
	
	if self.sort_id ~= nil then
		var2460.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2460.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2460.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2460.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2460.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2460.content_type = self.contentType
	end
	return var2460
end

t_85.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_85
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p86)
	-- upvalues: t_86 (ref)
	return setmetatable({
		selected_option = if p86 == nil or p86.selected_option == nil then "" else p86.selected_option,
		options = if p86 == nil or p86.options == nil then {} else p86.options,
		experience_carousel = if p86 == nil or p86.experience_carousel == nil then nil else p86.experience_carousel
	}, t_86)
end

function t_86:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2460 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2461, var2462 = protoModule.writeTag(buff, var2460, 1, protoModule.wireTypes.lengthDelimited)
		var2461, var3630 = protoModule.writeString(var2461, var2462, self.selected_option)
		buff = var2461
		var2460 = var2462
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2463 = v:encode()
			local var2464, var2465 = protoModule.writeTag(buff, var2460, 2, protoModule.wireTypes.lengthDelimited)
			var2464, var3633 = protoModule.writeBuffer(var2464, var2465, var2463, buffer.len(var2463))
			buff = var2464
			var2460 = var2465
		end
	end
	if self.experience_carousel ~= nil then
		local var2466 = self.experience_carousel:encode()
		local var2467, var2468 = protoModule.writeTag(buff, var2460, 3, protoModule.wireTypes.lengthDelimited)
		var2467, var3636 = protoModule.writeBuffer(var2467, var2468, var2466, buffer.len(var2466))
		buff = var2467
		var2460 = var2468
	end
	local buff_1 = buffer.create(var2460)
	buffer.copy(buff_1, 0, buff, 0, var2460)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2469 = t_86.new()
	local var2470 = 0
	while var2470 < buffer.len(p86) do
		local _ = nil
		local var2471 = nil
		local var2472, var2473, var2474 = protoModule.readTag(p86, var2470)
		local var2475 = var2472
		var2471 = var2473
		var2470 = var2474
		
		if var2471 == protoModule.wireTypes.varint then
			local _ = nil
			local var2476, var2477 = protoModule.readVarInt(p86, var2470)
			local _ = var2476
			var2470 = var2477
			continue
		end
		if var2471 == protoModule.wireTypes.lengthDelimited then
			if var2475 == 1 then
				local _ = nil
				local var2478, var2479 = protoModule.readBuffer(p86, var2470)
				var2470 = var2479
				var2469.selected_option = buffer.tostring(var2478)
			elseif var2475 == 2 then
				local _ = nil
				local var2480, var2481 = protoModule.readBuffer(p86, var2470)
				var2470 = var2481
				table.insert(var2469.options, t.SelectorOption.decode(var2480))
			elseif var2475 == 3 then
				local _ = nil
				local var2482, var2483 = protoModule.readBuffer(p86, var2470)
				var2470 = var2483
				var2469.experience_carousel = t.ExperienceCarouselInputData.decode(var2482)
			else
				local _ = nil
				local var2484, var2485 = protoModule.readVarInt(p86, var2470)
				var2470 = var2485 + var2484
			end
		elseif var2471 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2486, var2487 = protoModule.readFixed32(p86, var2470)
			local _ = var2486
			var2470 = var2487
		elseif var2471 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2488, var2489 = protoModule.readFixed64(p86, var2470)
			local _ = var2488
			var2470 = var2489
		else
			error("Unsupported wire type: " .. var3640)
		end
	end
	return var2469
end

function t_86:jsonEncode()
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

function t_86:jsonDecode()
	-- upvalues: t_86 (ref), t (ref)
	local var2490 = t_86.new()
	
	if self.selected_option ~= nil then
		var2490.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2490.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2490.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2490.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2490.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2490
end

t_86.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_86
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p87)
	-- upvalues: t_87 (ref)
	return setmetatable({
		id = if p87 == nil or p87.id == nil then "" else p87.id,
		preview_rows = if p87 == nil or p87.preview_rows == nil then 0 else p87.preview_rows,
		widget_style = if p87 == nil or p87.widget_style == nil then nil else p87.widget_style,
		see_all_button = if p87 == nil or p87.see_all_button == nil then false else p87.see_all_button,
		information_popover_text = if p87 == nil or p87.information_popover_text == nil then "" else p87.information_popover_text
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2491 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2492, var2493 = protoModule.writeTag(buff, var2491, 1, protoModule.wireTypes.lengthDelimited)
		var2492, var3666 = protoModule.writeString(var2492, var2493, self.id)
		buff = var2492
		var2491 = var2493
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2494, var2495 = protoModule.writeTag(buff, var2491, 4, protoModule.wireTypes.varint)
		var2494, var3668 = protoModule.writeVarInt(var2494, var2495, self.preview_rows)
		buff = var2494
		var2491 = var2495
	end
	if self.widget_style ~= nil then
		local var2496 = self.widget_style:encode()
		local var2497, var2498 = protoModule.writeTag(buff, var2491, 3, protoModule.wireTypes.lengthDelimited)
		var2497, var3671 = protoModule.writeBuffer(var2497, var2498, var2496, buffer.len(var2496))
		buff = var2497
		var2491 = var2498
	end
	if self.see_all_button then
		local var2499, var2500 = protoModule.writeTag(buff, var2491, 5, protoModule.wireTypes.varint)
		var2499, var3673 = protoModule.writeVarInt(var2499, var2500, if self.see_all_button then 1 else 0)
		buff = var2499
		var2491 = var2500
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2501, var2502 = protoModule.writeTag(buff, var2491, 6, protoModule.wireTypes.lengthDelimited)
		var2501, var3675 = protoModule.writeString(var2501, var2502, self.information_popover_text)
		buff = var2501
		var2491 = var2502
	end
	local buff_1 = buffer.create(var2491)
	buffer.copy(buff_1, 0, buff, 0, var2491)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2491 = t_87.new()
	local var2492 = 0
	while var2492 < buffer.len(p87) do
		local _ = nil
		local var2493 = nil
		local var2494, var2495, var2496 = protoModule.readTag(p87, var2492)
		local var2497 = var2494
		var2493 = var2495
		var2492 = var2496
		
		if var2493 == protoModule.wireTypes.varint then
			if var2497 == 4 then
				local _ = nil
				local var2498, var2499 = protoModule.readVarIntI64(p87, var2492)
				var2492 = var2499
				var2491.preview_rows = var2498
			elseif var2497 == 5 then
				local _ = nil
				local var2500, var2501 = protoModule.readVarInt(p87, var2492)
				var2492 = var2501
				var2491.see_all_button = var2500 ~= 0
			else
				local _ = nil
				local var2502, var2503 = protoModule.readVarInt(p87, var2492)
				local _ = var2502
				var2492 = var2503
			end
		end
		if var2493 == protoModule.wireTypes.lengthDelimited then
			if var2497 == 1 then
				local _ = nil
				local var2504, var2505 = protoModule.readBuffer(p87, var2492)
				var2492 = var2505
				var2491.id = buffer.tostring(var2504)
			elseif var2497 == 3 then
				local _ = nil
				local var2506, var2507 = protoModule.readBuffer(p87, var2492)
				var2492 = var2507
				var2491.widget_style = t.WidgetStyleData.decode(var2506)
			elseif var2497 == 6 then
				local _ = nil
				local var2508, var2509 = protoModule.readBuffer(p87, var2492)
				var2492 = var2509
				var2491.information_popover_text = buffer.tostring(var2508)
			else
				local _ = nil
				local var2510, var2511 = protoModule.readVarInt(p87, var2492)
				var2492 = var2511 + var2510
			end
		elseif var2493 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2512, var2513 = protoModule.readFixed32(p87, var2492)
			local _ = var2512
			var2492 = var2513
		elseif var2493 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2514, var2515 = protoModule.readFixed64(p87, var2492)
			local _ = var2514
			var2492 = var2515
		else
			error("Unsupported wire type: " .. var3679)
		end
	end
	return var2491
end

function t_87:jsonEncode()
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

function t_87:jsonDecode()
	-- upvalues: t_87 (ref), t (ref)
	local var2516 = t_87.new()
	
	if self.id ~= nil then
		var2516.id = self.id
	end
	if self.preview_rows ~= nil then
		var2516.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2516.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2516.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2516.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2516.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2516.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2516.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2516.information_popover_text = self.informationPopoverText
	end
	return var2516
end

t_87.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_87
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p88)
	-- upvalues: t_88 (ref)
	return setmetatable({
		id = if p88 == nil or p88.id == nil then "" else p88.id,
		num_items_to_show = if p88 == nil or p88.num_items_to_show == nil then 0 else p88.num_items_to_show,
		widget_style = if p88 == nil or p88.widget_style == nil then nil else p88.widget_style,
		see_all_button = if p88 == nil or p88.see_all_button == nil then false else p88.see_all_button,
		information_popover_text = if p88 == nil or p88.information_popover_text == nil then "" else p88.information_popover_text
	}, t_88)
end

function t_88:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2516 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2517, var2518 = protoModule.writeTag(buff, var2516, 1, protoModule.wireTypes.lengthDelimited)
		var2517, var3707 = protoModule.writeString(var2517, var2518, self.id)
		buff = var2517
		var2516 = var2518
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2519, var2520 = protoModule.writeTag(buff, var2516, 5, protoModule.wireTypes.varint)
		var2519, var3709 = protoModule.writeVarInt(var2519, var2520, self.num_items_to_show)
		buff = var2519
		var2516 = var2520
	end
	if self.widget_style ~= nil then
		local var2521 = self.widget_style:encode()
		local var2522, var2523 = protoModule.writeTag(buff, var2516, 3, protoModule.wireTypes.lengthDelimited)
		var2522, var3712 = protoModule.writeBuffer(var2522, var2523, var2521, buffer.len(var2521))
		buff = var2522
		var2516 = var2523
	end
	if self.see_all_button then
		local var2524, var2525 = protoModule.writeTag(buff, var2516, 6, protoModule.wireTypes.varint)
		var2524, var3714 = protoModule.writeVarInt(var2524, var2525, if self.see_all_button then 1 else 0)
		buff = var2524
		var2516 = var2525
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2526, var2527 = protoModule.writeTag(buff, var2516, 7, protoModule.wireTypes.lengthDelimited)
		var2526, var3716 = protoModule.writeString(var2526, var2527, self.information_popover_text)
		buff = var2526
		var2516 = var2527
	end
	local buff_1 = buffer.create(var2516)
	buffer.copy(buff_1, 0, buff, 0, var2516)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2516 = t_88.new()
	local var2517 = 0
	while var2517 < buffer.len(p88) do
		local _ = nil
		local var2518 = nil
		local var2519, var2520, var2521 = protoModule.readTag(p88, var2517)
		local var2522 = var2519
		var2518 = var2520
		var2517 = var2521
		
		if var2518 == protoModule.wireTypes.varint then
			if var2522 == 5 then
				local _ = nil
				local var2523, var2524 = protoModule.readVarIntI64(p88, var2517)
				var2517 = var2524
				var2516.num_items_to_show = var2523
			elseif var2522 == 6 then
				local _ = nil
				local var2525, var2526 = protoModule.readVarInt(p88, var2517)
				var2517 = var2526
				var2516.see_all_button = var2525 ~= 0
			else
				local _ = nil
				local var2527, var2528 = protoModule.readVarInt(p88, var2517)
				local _ = var2527
				var2517 = var2528
			end
		end
		if var2518 == protoModule.wireTypes.lengthDelimited then
			if var2522 == 1 then
				local _ = nil
				local var2529, var2530 = protoModule.readBuffer(p88, var2517)
				var2517 = var2530
				var2516.id = buffer.tostring(var2529)
			elseif var2522 == 3 then
				local _ = nil
				local var2531, var2532 = protoModule.readBuffer(p88, var2517)
				var2517 = var2532
				var2516.widget_style = t.WidgetStyleData.decode(var2531)
			elseif var2522 == 7 then
				local _ = nil
				local var2533, var2534 = protoModule.readBuffer(p88, var2517)
				var2517 = var2534
				var2516.information_popover_text = buffer.tostring(var2533)
			else
				local _ = nil
				local var2535, var2536 = protoModule.readVarInt(p88, var2517)
				var2517 = var2536 + var2535
			end
		elseif var2518 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2537, var2538 = protoModule.readFixed32(p88, var2517)
			local _ = var2537
			var2517 = var2538
		elseif var2518 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2539, var2540 = protoModule.readFixed64(p88, var2517)
			local _ = var2539
			var2517 = var2540
		else
			error("Unsupported wire type: " .. var3720)
		end
	end
	return var2516
end

function t_88:jsonEncode()
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

function t_88:jsonDecode()
	-- upvalues: t_88 (ref), t (ref)
	local var2541 = t_88.new()
	
	if self.id ~= nil then
		var2541.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2541.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2541.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2541.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2541.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2541.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2541.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2541.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2541.information_popover_text = self.informationPopoverText
	end
	return var2541
end

t_88.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_88
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p89)
	-- upvalues: t_89 (ref)
	return setmetatable({
		background_layers = if p89 == nil or p89.background_layers == nil then {} else p89.background_layers
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2541 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2542 = v:encode()
			local var2543, var2544 = protoModule.writeTag(buff, var2541, 1, protoModule.wireTypes.lengthDelimited)
			var2543, var3749 = protoModule.writeBuffer(var2543, var2544, var2542, buffer.len(var2542))
			buff = var2543
			var2541 = var2544
		end
	end
	local buff_1 = buffer.create(var2541)
	buffer.copy(buff_1, 0, buff, 0, var2541)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2545 = t_89.new()
	local var2546 = 0
	while var2546 < buffer.len(p89) do
		local _ = nil
		local var2547 = nil
		local var2548, var2549, var2550 = protoModule.readTag(p89, var2546)
		local var2551 = var2548
		var2547 = var2549
		var2546 = var2550
		
		if var2547 == protoModule.wireTypes.varint then
			local _ = nil
			local var2552, var2553 = protoModule.readVarInt(p89, var2546)
			local _ = var2552
			var2546 = var2553
			continue
		end
		if var2547 == protoModule.wireTypes.lengthDelimited then
			if var2551 == 1 then
				local _ = nil
				local var2554, var2555 = protoModule.readBuffer(p89, var2546)
				var2546 = var2555
				table.insert(var2545.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2554))
			else
				local _ = nil
				local var2556, var2557 = protoModule.readVarInt(p89, var2546)
				var2546 = var2557 + var2556
			end
		elseif var2547 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2558, var2559 = protoModule.readFixed32(p89, var2546)
			local _ = var2558
			var2546 = var2559
		elseif var2547 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2560, var2561 = protoModule.readFixed64(p89, var2546)
			local _ = var2560
			var2546 = var2561
		else
			error("Unsupported wire type: " .. var3753)
		end
	end
	return var2545
end

function t_89:jsonEncode()
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

function t_89:jsonDecode()
	-- upvalues: t_89 (ref), backgroundLayerModule (ref)
	local var2562 = t_89.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2562.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2562.background_layers = t
	end
	return var2562
end

t_89.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_89
typeRegistryModule.default:register(t.WidgetStyleData)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p90)
	-- upvalues: t_90 (ref)
	return setmetatable({
		id = if p90 == nil or p90.id == nil then "" else p90.id,
		available_until = if p90 == nil or p90.available_until == nil then "" else p90.available_until,
		widget_style = if p90 == nil or p90.widget_style == nil then nil else p90.widget_style
	}, t_90)
end

function t_90:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2563 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2564, var2565 = protoModule.writeTag(buff, var2563, 1, protoModule.wireTypes.lengthDelimited)
		var2564, var3776 = protoModule.writeString(var2564, var2565, self.id)
		buff = var2564
		var2563 = var2565
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2566, var2567 = protoModule.writeTag(buff, var2563, 2, protoModule.wireTypes.lengthDelimited)
		var2566, var3778 = protoModule.writeString(var2566, var2567, self.available_until)
		buff = var2566
		var2563 = var2567
	end
	if self.widget_style ~= nil then
		local var2568 = self.widget_style:encode()
		local var2569, var2570 = protoModule.writeTag(buff, var2563, 3, protoModule.wireTypes.lengthDelimited)
		var2569, var3781 = protoModule.writeBuffer(var2569, var2570, var2568, buffer.len(var2568))
		buff = var2569
		var2563 = var2570
	end
	local buff_1 = buffer.create(var2563)
	buffer.copy(buff_1, 0, buff, 0, var2563)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var2563 = t_90.new()
	local var2564 = 0
	while var2564 < buffer.len(p90) do
		local _ = nil
		local var2565 = nil
		local var2566, var2567, var2568 = protoModule.readTag(p90, var2564)
		local var2569 = var2566
		var2565 = var2567
		var2564 = var2568
		
		if var2565 == protoModule.wireTypes.varint then
			local _ = nil
			local var2570, var2571 = protoModule.readVarInt(p90, var2564)
			local _ = var2570
			var2564 = var2571
			continue
		end
		if var2565 == protoModule.wireTypes.lengthDelimited then
			if var2569 == 1 then
				local _ = nil
				local var2572, var2573 = protoModule.readBuffer(p90, var2564)
				var2564 = var2573
				var2563.id = buffer.tostring(var2572)
			elseif var2569 == 2 then
				local _ = nil
				local var2574, var2575 = protoModule.readBuffer(p90, var2564)
				var2564 = var2575
				var2563.available_until = buffer.tostring(var2574)
			elseif var2569 == 3 then
				local _ = nil
				local var2576, var2577 = protoModule.readBuffer(p90, var2564)
				var2564 = var2577
				var2563.widget_style = t.WidgetStyleData.decode(var2576)
			else
				local _ = nil
				local var2578, var2579 = protoModule.readVarInt(p90, var2564)
				var2564 = var2579 + var2578
			end
		elseif var2565 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2580, var2581 = protoModule.readFixed32(p90, var2564)
			local _ = var2580
			var2564 = var2581
		elseif var2565 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2582, var2583 = protoModule.readFixed64(p90, var2564)
			local _ = var2582
			var2564 = var2583
		else
			error("Unsupported wire type: " .. var3785)
		end
	end
	return var2563
end

function t_90:jsonEncode()
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

function t_90:jsonDecode()
	-- upvalues: t_90 (ref), t (ref)
	local var2584 = t_90.new()
	
	if self.id ~= nil then
		var2584.id = self.id
	end
	if self.available_until ~= nil then
		var2584.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2584.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2584.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2584.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2584
end

t_90.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_90
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p91)
	-- upvalues: t_91 (ref)
	return setmetatable({
		entry_map = if p91 == nil or p91.entry_map == nil then {} else p91.entry_map,
		entry_order = if p91 == nil or p91.entry_order == nil then {} else p91.entry_order
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2584 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2585, var2586 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2585, var3809 = protoModule.writeString(var2585, var2586, i)
			local var2587 = v:encode()
			var2586, var3811 = protoModule.writeTag(var2585, var2586, 2, protoModule.wireTypes.lengthDelimited)
			var2586, var3811 = protoModule.writeBuffer(var2586, var3811, var2587, buffer.len(var2587))
			local var2588 = var2586
			local var2589 = var3811
			local var2590, var2591 = protoModule.writeTag(buff, var2584, 1, protoModule.wireTypes.lengthDelimited)
			var2590, var3815 = protoModule.writeBuffer(var2590, var2591, var2588, var2589)
			buff = var2590
			var2584 = var2591
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2592, var2593 = protoModule.writeTag(buff, var2584, 2, protoModule.wireTypes.lengthDelimited)
			var2592, var3817 = protoModule.writeString(var2592, var2593, v)
			buff = var2592
			var2584 = var2593
		end
	end
	local buff_1 = buffer.create(var2584)
	buffer.copy(buff_1, 0, buff, 0, var2584)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var2594 = t_91.new()
	local var2595 = 0
	while var2595 < buffer.len(p91) do
		local _ = nil
		local var2596 = nil
		local var2597, var2598, var2599 = protoModule.readTag(p91, var2595)
		local var2600 = var2597
		var2596 = var2598
		var2595 = var2599
		
		if var2596 == protoModule.wireTypes.varint then
			local _ = nil
			local var2601, var2602 = protoModule.readVarInt(p91, var2595)
			local _ = var2601
			var2595 = var2602
			continue
		end
		if var2596 == protoModule.wireTypes.lengthDelimited then
			if var2600 == 1 then
				local _ = nil
				local var2603, var2604 = protoModule.readBuffer(p91, var2595)
				var2595 = var2604
				var2603 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2603)
				var2594.entry_map[var2603.key or ""] = var2603.value or t.FeedEntry.new()
			elseif var2600 == 2 then
				local _ = nil
				local var2605, var2606 = protoModule.readBuffer(p91, var2595)
				var2595 = var2606
				table.insert(var2594.entry_order, buffer.tostring(var2605))
			else
				local _ = nil
				local var2607, var2608 = protoModule.readVarInt(p91, var2595)
				var2595 = var2608 + var2607
			end
		elseif var2596 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2609, var2610 = protoModule.readFixed32(p91, var2595)
			local _ = var2609
			var2595 = var2610
		elseif var2596 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2611, var2612 = protoModule.readFixed64(p91, var2595)
			local _ = var2611
			var2595 = var2612
		else
			error("Unsupported wire type: " .. var3821)
		end
	end
	return var2594
end

function t_91:jsonEncode()
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

function t_91:jsonDecode()
	-- upvalues: t_91 (ref), t (ref)
	local var2613 = t_91.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2613.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2613.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2613.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2613.entry_order = t_1
	end
	return var2613
end

t_91.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_91
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p92)
	-- upvalues: t_92 (ref)
	return setmetatable({
		key = if p92 == nil or p92.key == nil then "" else p92.key,
		value = if p92 == nil or p92.value == nil then nil else p92.value
	}, t_92)
end

function t_92:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2614 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2615, var2616 = protoModule.writeTag(buff, var2614, 1, protoModule.wireTypes.lengthDelimited)
		var2615, var3849 = protoModule.writeString(var2615, var2616, self.key)
		buff = var2615
		var2614 = var2616
	end
	if self.value ~= nil then
		local var2617 = self.value:encode()
		local var2618, var2619 = protoModule.writeTag(buff, var2614, 2, protoModule.wireTypes.lengthDelimited)
		var2618, var3852 = protoModule.writeBuffer(var2618, var2619, var2617, buffer.len(var2617))
		buff = var2618
		var2614 = var2619
	end
	local buff_1 = buffer.create(var2614)
	buffer.copy(buff_1, 0, buff, 0, var2614)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var2614 = t_92.new()
	local var2615 = 0
	while var2615 < buffer.len(p92) do
		local _ = nil
		local var2616 = nil
		local var2617, var2618, var2619 = protoModule.readTag(p92, var2615)
		local var2620 = var2617
		var2616 = var2618
		var2615 = var2619
		
		if var2616 == protoModule.wireTypes.varint then
			local _ = nil
			local var2621, var2622 = protoModule.readVarInt(p92, var2615)
			local _ = var2621
			var2615 = var2622
			continue
		end
		if var2616 == protoModule.wireTypes.lengthDelimited then
			if var2620 == 1 then
				local _ = nil
				local var2623, var2624 = protoModule.readBuffer(p92, var2615)
				var2615 = var2624
				var2614.key = buffer.tostring(var2623)
			elseif var2620 == 2 then
				local _ = nil
				local var2625, var2626 = protoModule.readBuffer(p92, var2615)
				var2615 = var2626
				var2614.value = t.FeedEntry.decode(var2625)
			else
				local _ = nil
				local var2627, var2628 = protoModule.readVarInt(p92, var2615)
				var2615 = var2628 + var2627
			end
		elseif var2616 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2629, var2630 = protoModule.readFixed32(p92, var2615)
			local _ = var2629
			var2615 = var2630
		elseif var2616 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2631, var2632 = protoModule.readFixed64(p92, var2615)
			local _ = var2631
			var2615 = var2632
		else
			error("Unsupported wire type: " .. var3856)
		end
	end
	return var2614
end

function t_92:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_92:jsonDecode()
	-- upvalues: t_92 (ref), t (ref)
	local var2633 = t_92.new()
	
	if self.key ~= nil then
		var2633.key = self.key
	end
	if self.value ~= nil then
		var2633.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2633
end

t_92.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_92
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p93)
	-- upvalues: t_93 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p93 == nil or p93.marketplace_catalog_category_items == nil then {} else p93.marketplace_catalog_category_items,
		active_category_id = if p93 == nil or p93.active_category_id == nil then "" else p93.active_category_id,
		active_tooltip_idx = if p93 == nil or p93.active_tooltip_idx == nil then 0 else p93.active_tooltip_idx
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2633 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2634 = v:encode()
			local var2635, var2636 = protoModule.writeTag(buff, var2633, 1, protoModule.wireTypes.lengthDelimited)
			var2635, var3879 = protoModule.writeBuffer(var2635, var2636, var2634, buffer.len(var2634))
			buff = var2635
			var2633 = var2636
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2637, var2638 = protoModule.writeTag(buff, var2633, 2, protoModule.wireTypes.lengthDelimited)
		var2637, var3881 = protoModule.writeString(var2637, var2638, self.active_category_id)
		buff = var2637
		var2633 = var2638
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2639, var2640 = protoModule.writeTag(buff, var2633, 3, protoModule.wireTypes.varint)
		var2639, var3883 = protoModule.writeVarInt(var2639, var2640, self.active_tooltip_idx)
		buff = var2639
		var2633 = var2640
	end
	local buff_1 = buffer.create(var2633)
	buffer.copy(buff_1, 0, buff, 0, var2633)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2641 = t_93.new()
	local var2642 = 0
	while var2642 < buffer.len(p93) do
		local _ = nil
		local var2643 = nil
		local var2644, var2645, var2646 = protoModule.readTag(p93, var2642)
		local var2647 = var2644
		var2643 = var2645
		var2642 = var2646
		
		if var2643 == protoModule.wireTypes.varint then
			if var2647 == 3 then
				local _ = nil
				local var2648, var2649 = protoModule.readVarIntI64(p93, var2642)
				var2642 = var2649
				var2641.active_tooltip_idx = var2648
			else
				local _ = nil
				local var2650, var2651 = protoModule.readVarInt(p93, var2642)
				local _ = var2650
				var2642 = var2651
			end
		end
		if var2643 == protoModule.wireTypes.lengthDelimited then
			if var2647 == 1 then
				local _ = nil
				local var2652, var2653 = protoModule.readBuffer(p93, var2642)
				var2642 = var2653
				table.insert(var2641.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2652))
			elseif var2647 == 2 then
				local _ = nil
				local var2654, var2655 = protoModule.readBuffer(p93, var2642)
				var2642 = var2655
				var2641.active_category_id = buffer.tostring(var2654)
			else
				local _ = nil
				local var2656, var2657 = protoModule.readVarInt(p93, var2642)
				var2642 = var2657 + var2656
			end
		elseif var2643 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2658, var2659 = protoModule.readFixed32(p93, var2642)
			local _ = var2658
			var2642 = var2659
		elseif var2643 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2660, var2661 = protoModule.readFixed64(p93, var2642)
			local _ = var2660
			var2642 = var2661
		else
			error("Unsupported wire type: " .. var3887)
		end
	end
	return var2641
end

function t_93:jsonEncode()
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

function t_93:jsonDecode()
	-- upvalues: t_93 (ref), t (ref)
	local var2662 = t_93.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2662.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2662.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2662.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2662.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2662.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2662.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2662
end

t_93.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_93
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p94)
	-- upvalues: t_94 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p94 == nil or p94.marketplace_catalog_category_item_id == nil then "" else p94.marketplace_catalog_category_item_id
	}, t_94)
end

function t_94:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2663 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2664, var2665 = protoModule.writeTag(buff, var2663, 1, protoModule.wireTypes.lengthDelimited)
		var2664, var3914 = protoModule.writeString(var2664, var2665, self.marketplace_catalog_category_item_id)
		buff = var2664
		var2663 = var2665
	end
	local buff_1 = buffer.create(var2663)
	buffer.copy(buff_1, 0, buff, 0, var2663)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref)
	local var2663 = t_94.new()
	local var2664 = 0
	while var2664 < buffer.len(p94) do
		local _ = nil
		local var2665 = nil
		local var2666, var2667, var2668 = protoModule.readTag(p94, var2664)
		local var2669 = var2666
		var2665 = var2667
		var2664 = var2668
		
		if var2665 == protoModule.wireTypes.varint then
			local _ = nil
			local var2670, var2671 = protoModule.readVarInt(p94, var2664)
			local _ = var2670
			var2664 = var2671
			continue
		end
		if var2665 == protoModule.wireTypes.lengthDelimited then
			if var2669 == 1 then
				local _ = nil
				local var2672, var2673 = protoModule.readBuffer(p94, var2664)
				var2664 = var2673
				var2663.marketplace_catalog_category_item_id = buffer.tostring(var2672)
			else
				local _ = nil
				local var2674, var2675 = protoModule.readVarInt(p94, var2664)
				var2664 = var2675 + var2674
			end
		elseif var2665 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2676, var2677 = protoModule.readFixed32(p94, var2664)
			local _ = var2676
			var2664 = var2677
		elseif var2665 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2678, var2679 = protoModule.readFixed64(p94, var2664)
			local _ = var2678
			var2664 = var2679
		else
			error("Unsupported wire type: " .. var3918)
		end
	end
	return var2663
end

function t_94:jsonEncode()
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_94:jsonDecode()
	-- upvalues: t_94 (ref)
	local var2680 = t_94.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2680.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2680.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2680
end

t_94.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_94
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p95)
	-- upvalues: t_95 (ref)
	return setmetatable({
		hero_icon = if p95 == nil or p95.hero_icon == nil then nil else p95.hero_icon,
		body_dismiss_button_text = if p95 == nil or p95.body_dismiss_button_text == nil then "" else p95.body_dismiss_button_text,
		body_title = if p95 == nil or p95.body_title == nil then "" else p95.body_title,
		body_rich_text = if p95 == nil or p95.body_rich_text == nil then "" else p95.body_rich_text,
		terms_link_text = if p95 == nil or p95.terms_link_text == nil then nil else p95.terms_link_text,
		terms_title = if p95 == nil or p95.terms_title == nil then nil else p95.terms_title,
		terms_body_rich_text = if p95 == nil or p95.terms_body_rich_text == nil then nil else p95.terms_body_rich_text,
		terms_dismiss_button_text = if p95 == nil or p95.terms_dismiss_button_text == nil then nil else p95.terms_dismiss_button_text,
		offer_id = if p95 == nil or p95.offer_id == nil then "" else p95.offer_id
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2680 = 0
	
	if self.hero_icon ~= nil then
		local var2681, var2682 = protoModule.writeTag(buff, var2680, 1, protoModule.wireTypes.lengthDelimited)
		var2681, var3938 = protoModule.writeString(var2681, var2682, self.hero_icon)
		buff = var2681
		var2680 = var2682
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2683, var2684 = protoModule.writeTag(buff, var2680, 2, protoModule.wireTypes.lengthDelimited)
		var2683, var3940 = protoModule.writeString(var2683, var2684, self.body_dismiss_button_text)
		buff = var2683
		var2680 = var2684
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2685, var2686 = protoModule.writeTag(buff, var2680, 3, protoModule.wireTypes.lengthDelimited)
		var2685, var3942 = protoModule.writeString(var2685, var2686, self.body_title)
		buff = var2685
		var2680 = var2686
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2687, var2688 = protoModule.writeTag(buff, var2680, 4, protoModule.wireTypes.lengthDelimited)
		var2687, var3944 = protoModule.writeString(var2687, var2688, self.body_rich_text)
		buff = var2687
		var2680 = var2688
	end
	if self.terms_link_text ~= nil then
		local var2689, var2690 = protoModule.writeTag(buff, var2680, 5, protoModule.wireTypes.lengthDelimited)
		var2689, var3946 = protoModule.writeString(var2689, var2690, self.terms_link_text)
		buff = var2689
		var2680 = var2690
	end
	if self.terms_title ~= nil then
		local var2691, var2692 = protoModule.writeTag(buff, var2680, 6, protoModule.wireTypes.lengthDelimited)
		var2691, var3948 = protoModule.writeString(var2691, var2692, self.terms_title)
		buff = var2691
		var2680 = var2692
	end
	if self.terms_body_rich_text ~= nil then
		local var2693, var2694 = protoModule.writeTag(buff, var2680, 7, protoModule.wireTypes.lengthDelimited)
		var2693, var3950 = protoModule.writeString(var2693, var2694, self.terms_body_rich_text)
		buff = var2693
		var2680 = var2694
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2695, var2696 = protoModule.writeTag(buff, var2680, 8, protoModule.wireTypes.lengthDelimited)
		var2695, var3952 = protoModule.writeString(var2695, var2696, self.terms_dismiss_button_text)
		buff = var2695
		var2680 = var2696
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2697, var2698 = protoModule.writeTag(buff, var2680, 9, protoModule.wireTypes.lengthDelimited)
		var2697, var3954 = protoModule.writeString(var2697, var2698, self.offer_id)
		buff = var2697
		var2680 = var2698
	end
	local buff_1 = buffer.create(var2680)
	buffer.copy(buff_1, 0, buff, 0, var2680)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref)
	local var2680 = t_95.new()
	local var2681 = 0
	while var2681 < buffer.len(p95) do
		local _ = nil
		local var2682 = nil
		local var2683, var2684, var2685 = protoModule.readTag(p95, var2681)
		local var2686 = var2683
		var2682 = var2684
		var2681 = var2685
		
		if var2682 == protoModule.wireTypes.varint then
			local _ = nil
			local var2687, var2688 = protoModule.readVarInt(p95, var2681)
			local _ = var2687
			var2681 = var2688
			continue
		end
		if var2682 == protoModule.wireTypes.lengthDelimited then
			if var2686 == 1 then
				local _ = nil
				local var2689, var2690 = protoModule.readBuffer(p95, var2681)
				var2681 = var2690
				var2680.hero_icon = buffer.tostring(var2689)
			elseif var2686 == 2 then
				local _ = nil
				local var2691, var2692 = protoModule.readBuffer(p95, var2681)
				var2681 = var2692
				var2680.body_dismiss_button_text = buffer.tostring(var2691)
			elseif var2686 == 3 then
				local _ = nil
				local var2693, var2694 = protoModule.readBuffer(p95, var2681)
				var2681 = var2694
				var2680.body_title = buffer.tostring(var2693)
			elseif var2686 == 4 then
				local _ = nil
				local var2695, var2696 = protoModule.readBuffer(p95, var2681)
				var2681 = var2696
				var2680.body_rich_text = buffer.tostring(var2695)
			elseif var2686 == 5 then
				local _ = nil
				local var2697, var2698 = protoModule.readBuffer(p95, var2681)
				var2681 = var2698
				var2680.terms_link_text = buffer.tostring(var2697)
			elseif var2686 == 6 then
				local _ = nil
				local var2699, var2700 = protoModule.readBuffer(p95, var2681)
				var2681 = var2700
				var2680.terms_title = buffer.tostring(var2699)
			elseif var2686 == 7 then
				local _ = nil
				local var2701, var2702 = protoModule.readBuffer(p95, var2681)
				var2681 = var2702
				var2680.terms_body_rich_text = buffer.tostring(var2701)
			elseif var2686 == 8 then
				local _ = nil
				local var2703, var2704 = protoModule.readBuffer(p95, var2681)
				var2681 = var2704
				var2680.terms_dismiss_button_text = buffer.tostring(var2703)
			elseif var2686 == 9 then
				local _ = nil
				local var2705, var2706 = protoModule.readBuffer(p95, var2681)
				var2681 = var2706
				var2680.offer_id = buffer.tostring(var2705)
			else
				local _ = nil
				local var2707, var2708 = protoModule.readVarInt(p95, var2681)
				var2681 = var2708 + var2707
			end
		elseif var2682 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2709, var2710 = protoModule.readFixed32(p95, var2681)
			local _ = var2709
			var2681 = var2710
		elseif var2682 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2711, var2712 = protoModule.readFixed64(p95, var2681)
			local _ = var2711
			var2681 = var2712
		else
			error("Unsupported wire type: " .. var3958)
		end
	end
	return var2680
end

function t_95:jsonEncode()
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

function t_95:jsonDecode()
	-- upvalues: t_95 (ref)
	local var2713 = t_95.new()
	
	if self.hero_icon ~= nil then
		var2713.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2713.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2713.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2713.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2713.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2713.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2713.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2713.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2713.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2713.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2713.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2713.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2713.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2713.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2713.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2713.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2713.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2713.offer_id = self.offerId
	end
	return var2713
end

t_95.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_95
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p96)
	-- upvalues: t_96 (ref)
	return setmetatable({
		item_id = if p96 == nil or p96.item_id == nil then "" else p96.item_id,
		item_type = if p96 == nil or p96.item_type == nil then "" else p96.item_type,
		prefer_three_dimensional = if p96 == nil or p96.prefer_three_dimensional == nil then false else p96.prefer_three_dimensional,
		bundle_type = if p96 == nil or p96.bundle_type == nil then nil else p96.bundle_type,
		bundle_items = if p96 == nil or p96.bundle_items == nil then {} else p96.bundle_items
	}, t_96)
end

function t_96:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2713 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2714, var2715 = protoModule.writeTag(buff, var2713, 1, protoModule.wireTypes.lengthDelimited)
		var2714, var3994 = protoModule.writeString(var2714, var2715, self.item_id)
		buff = var2714
		var2713 = var2715
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2716, var2717 = protoModule.writeTag(buff, var2713, 2, protoModule.wireTypes.lengthDelimited)
		var2716, var3996 = protoModule.writeString(var2716, var2717, self.item_type)
		buff = var2716
		var2713 = var2717
	end
	if self.prefer_three_dimensional then
		local var2718, var2719 = protoModule.writeTag(buff, var2713, 3, protoModule.wireTypes.varint)
		var2718, var3998 = protoModule.writeVarInt(var2718, var2719, if self.prefer_three_dimensional then 1 else 0)
		buff = var2718
		var2713 = var2719
	end
	if self.bundle_type ~= nil then
		local var2720, var2721 = protoModule.writeTag(buff, var2713, 4, protoModule.wireTypes.lengthDelimited)
		var2720, var4000 = protoModule.writeString(var2720, var2721, self.bundle_type)
		buff = var2720
		var2713 = var2721
	end
	if self.bundle_items ~= nil and #self.bundle_items > 0 then
		for i, v in self.bundle_items do
			local var2722 = v:encode()
			local var2723, var2724 = protoModule.writeTag(buff, var2713, 5, protoModule.wireTypes.lengthDelimited)
			var2723, var4003 = protoModule.writeBuffer(var2723, var2724, var2722, buffer.len(var2722))
			buff = var2723
			var2713 = var2724
		end
	end
	local buff_1 = buffer.create(var2713)
	buffer.copy(buff_1, 0, buff, 0, var2713)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var2725 = t_96.new()
	local var2726 = 0
	while var2726 < buffer.len(p96) do
		local _ = nil
		local var2727 = nil
		local var2728, var2729, var2730 = protoModule.readTag(p96, var2726)
		local var2731 = var2728
		var2727 = var2729
		var2726 = var2730
		
		if var2727 == protoModule.wireTypes.varint then
			if var2731 == 3 then
				local _ = nil
				local var2732, var2733 = protoModule.readVarInt(p96, var2726)
				var2726 = var2733
				var2725.prefer_three_dimensional = var2732 ~= 0
			else
				local _ = nil
				local var2734, var2735 = protoModule.readVarInt(p96, var2726)
				local _ = var2734
				var2726 = var2735
			end
		end
		if var2727 == protoModule.wireTypes.lengthDelimited then
			if var2731 == 1 then
				local _ = nil
				local var2736, var2737 = protoModule.readBuffer(p96, var2726)
				var2726 = var2737
				var2725.item_id = buffer.tostring(var2736)
			elseif var2731 == 2 then
				local _ = nil
				local var2738, var2739 = protoModule.readBuffer(p96, var2726)
				var2726 = var2739
				var2725.item_type = buffer.tostring(var2738)
			elseif var2731 == 4 then
				local _ = nil
				local var2740, var2741 = protoModule.readBuffer(p96, var2726)
				var2726 = var2741
				var2725.bundle_type = buffer.tostring(var2740)
			elseif var2731 == 5 then
				local _ = nil
				local var2742, var2743 = protoModule.readBuffer(p96, var2726)
				var2726 = var2743
				table.insert(var2725.bundle_items, t.MarketplaceItemMediaHeaderInputData_BundleItem.decode(var2742))
			else
				local _ = nil
				local var2744, var2745 = protoModule.readVarInt(p96, var2726)
				var2726 = var2745 + var2744
			end
		elseif var2727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2746, var2747 = protoModule.readFixed32(p96, var2726)
			local _ = var2746
			var2726 = var2747
		elseif var2727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2748, var2749 = protoModule.readFixed64(p96, var2726)
			local _ = var2748
			var2726 = var2749
		else
			error("Unsupported wire type: " .. var4007)
		end
	end
	return var2725
end

function t_96:jsonEncode()
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

function t_96:jsonDecode()
	-- upvalues: t_96 (ref), t (ref)
	local var2750 = t_96.new()
	
	if self.item_id ~= nil then
		var2750.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2750.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2750.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2750.item_type = self.itemType
	end
	if self.prefer_three_dimensional ~= nil then
		var2750.prefer_three_dimensional = self.prefer_three_dimensional
	end
	if self.preferThreeDimensional ~= nil then
		var2750.prefer_three_dimensional = self.preferThreeDimensional
	end
	if self.bundle_type ~= nil then
		var2750.bundle_type = self.bundle_type
	end
	if self.bundleType ~= nil then
		var2750.bundle_type = self.bundleType
	end
	if self.bundle_items ~= nil then
		local t_1 = {}
		
		for i, v in self.bundle_items do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2750.bundle_items = t_1
	end
	if self.bundleItems ~= nil then
		local t_1 = {}
		
		for i, v in self.bundleItems do
			table.insert(t_1, t.MarketplaceItemMediaHeaderInputData_BundleItem.jsonDecode(v))
		end
		var2750.bundle_items = t_1
	end
	return var2750
end

t_96.descriptor = {
	name = "MarketplaceItemMediaHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceItemMediaHeaderInputData"
}
t.MarketplaceItemMediaHeaderInputData = t_96
typeRegistryModule.default:register(t.MarketplaceItemMediaHeaderInputData)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p97)
	-- upvalues: t_97 (ref)
	return setmetatable({
		id = if p97 == nil or p97.id == nil then "" else p97.id,
		type = if p97 == nil or p97.type == nil then "" else p97.type
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2751 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2752, var2753 = protoModule.writeTag(buff, var2751, 1, protoModule.wireTypes.lengthDelimited)
		var2752, var4038 = protoModule.writeString(var2752, var2753, self.id)
		buff = var2752
		var2751 = var2753
	end
	if self.type ~= nil and self.type ~= "" then
		local var2754, var2755 = protoModule.writeTag(buff, var2751, 2, protoModule.wireTypes.lengthDelimited)
		var2754, var4040 = protoModule.writeString(var2754, var2755, self.type)
		buff = var2754
		var2751 = var2755
	end
	local buff_1 = buffer.create(var2751)
	buffer.copy(buff_1, 0, buff, 0, var2751)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref)
	local var2751 = t_97.new()
	local var2752 = 0
	while var2752 < buffer.len(p97) do
		local _ = nil
		local var2753 = nil
		local var2754, var2755, var2756 = protoModule.readTag(p97, var2752)
		local var2757 = var2754
		var2753 = var2755
		var2752 = var2756
		
		if var2753 == protoModule.wireTypes.varint then
			local _ = nil
			local var2758, var2759 = protoModule.readVarInt(p97, var2752)
			local _ = var2758
			var2752 = var2759
			continue
		end
		if var2753 == protoModule.wireTypes.lengthDelimited then
			if var2757 == 1 then
				local _ = nil
				local var2760, var2761 = protoModule.readBuffer(p97, var2752)
				var2752 = var2761
				var2751.id = buffer.tostring(var2760)
			elseif var2757 == 2 then
				local _ = nil
				local var2762, var2763 = protoModule.readBuffer(p97, var2752)
				var2752 = var2763
				var2751.type = buffer.tostring(var2762)
			else
				local _ = nil
				local var2764, var2765 = protoModule.readVarInt(p97, var2752)
				var2752 = var2765 + var2764
			end
		elseif var2753 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2766, var2767 = protoModule.readFixed32(p97, var2752)
			local _ = var2766
			var2752 = var2767
		elseif var2753 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2768, var2769 = protoModule.readFixed64(p97, var2752)
			local _ = var2768
			var2752 = var2769
		else
			error("Unsupported wire type: " .. var4044)
		end
	end
	return var2751
end

function t_97:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_97:jsonDecode()
	-- upvalues: t_97 (ref)
	local var2770 = t_97.new()
	
	if self.id ~= nil then
		var2770.id = self.id
	end
	if self.type ~= nil then
		var2770.type = self.type
	end
	return var2770
end

t_97.descriptor = {
	name = "MarketplaceItemMediaHeaderInputData_BundleItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.BundleItem"
}
t.MarketplaceItemMediaHeaderInputData_BundleItem = t_97
typeRegistryModule.default:register(t.MarketplaceItemMediaHeaderInputData_BundleItem)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p98)
	-- upvalues: t_98 (ref)
	return setmetatable({
		items = if p98 == nil or p98.items == nil then {} else p98.items,
		preview_columns = if p98 == nil or p98.preview_columns == nil then 0 else p98.preview_columns,
		impression_id = if p98 == nil or p98.impression_id == nil then "" else p98.impression_id
	}, t_98)
end

function t_98:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2770 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2771 = v:encode()
			local var2772, var2773 = protoModule.writeTag(buff, var2770, 1, protoModule.wireTypes.lengthDelimited)
			var2772, var4067 = protoModule.writeBuffer(var2772, var2773, var2771, buffer.len(var2771))
			buff = var2772
			var2770 = var2773
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2774, var2775 = protoModule.writeTag(buff, var2770, 2, protoModule.wireTypes.varint)
		var2774, var4069 = protoModule.writeVarInt(var2774, var2775, self.preview_columns)
		buff = var2774
		var2770 = var2775
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2776, var2777 = protoModule.writeTag(buff, var2770, 3, protoModule.wireTypes.lengthDelimited)
		var2776, var4071 = protoModule.writeString(var2776, var2777, self.impression_id)
		buff = var2776
		var2770 = var2777
	end
	local buff_1 = buffer.create(var2770)
	buffer.copy(buff_1, 0, buff, 0, var2770)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2778 = t_98.new()
	local var2779 = 0
	while var2779 < buffer.len(p98) do
		local _ = nil
		local var2780 = nil
		local var2781, var2782, var2783 = protoModule.readTag(p98, var2779)
		local var2784 = var2781
		var2780 = var2782
		var2779 = var2783
		
		if var2780 == protoModule.wireTypes.varint then
			if var2784 == 2 then
				local _ = nil
				local var2785, var2786 = protoModule.readVarIntI32(p98, var2779)
				var2779 = var2786
				var2778.preview_columns = var2785
			else
				local _ = nil
				local var2787, var2788 = protoModule.readVarInt(p98, var2779)
				local _ = var2787
				var2779 = var2788
			end
		end
		if var2780 == protoModule.wireTypes.lengthDelimited then
			if var2784 == 1 then
				local _ = nil
				local var2789, var2790 = protoModule.readBuffer(p98, var2779)
				var2779 = var2790
				table.insert(var2778.items, t.CatalogItemGridInputData_CatalogItem.decode(var2789))
			elseif var2784 == 3 then
				local _ = nil
				local var2791, var2792 = protoModule.readBuffer(p98, var2779)
				var2779 = var2792
				var2778.impression_id = buffer.tostring(var2791)
			else
				local _ = nil
				local var2793, var2794 = protoModule.readVarInt(p98, var2779)
				var2779 = var2794 + var2793
			end
		elseif var2780 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2795, var2796 = protoModule.readFixed32(p98, var2779)
			local _ = var2795
			var2779 = var2796
		elseif var2780 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2797, var2798 = protoModule.readFixed64(p98, var2779)
			local _ = var2797
			var2779 = var2798
		else
			error("Unsupported wire type: " .. var4075)
		end
	end
	return var2778
end

function t_98:jsonEncode()
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

function t_98:jsonDecode()
	-- upvalues: t_98 (ref), t (ref)
	local var2799 = t_98.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2799.items = t_1
	end
	if self.preview_columns ~= nil then
		var2799.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2799.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2799.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2799.impression_id = self.impressionId
	end
	return var2799
end

t_98.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_98
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p99)
	-- upvalues: t_99 (ref)
	return setmetatable({
		id = if p99 == nil or p99.id == nil then "" else p99.id,
		type = if p99 == nil or p99.type == nil then "" else p99.type
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2800 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2801, var2802 = protoModule.writeTag(buff, var2800, 1, protoModule.wireTypes.lengthDelimited)
		var2801, var4101 = protoModule.writeString(var2801, var2802, self.id)
		buff = var2801
		var2800 = var2802
	end
	if self.type ~= nil and self.type ~= "" then
		local var2803, var2804 = protoModule.writeTag(buff, var2800, 2, protoModule.wireTypes.lengthDelimited)
		var2803, var4103 = protoModule.writeString(var2803, var2804, self.type)
		buff = var2803
		var2800 = var2804
	end
	local buff_1 = buffer.create(var2800)
	buffer.copy(buff_1, 0, buff, 0, var2800)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2800 = t_99.new()
	local var2801 = 0
	while var2801 < buffer.len(p99) do
		local _ = nil
		local var2802 = nil
		local var2803, var2804, var2805 = protoModule.readTag(p99, var2801)
		local var2806 = var2803
		var2802 = var2804
		var2801 = var2805
		
		if var2802 == protoModule.wireTypes.varint then
			local _ = nil
			local var2807, var2808 = protoModule.readVarInt(p99, var2801)
			local _ = var2807
			var2801 = var2808
			continue
		end
		if var2802 == protoModule.wireTypes.lengthDelimited then
			if var2806 == 1 then
				local _ = nil
				local var2809, var2810 = protoModule.readBuffer(p99, var2801)
				var2801 = var2810
				var2800.id = buffer.tostring(var2809)
			elseif var2806 == 2 then
				local _ = nil
				local var2811, var2812 = protoModule.readBuffer(p99, var2801)
				var2801 = var2812
				var2800.type = buffer.tostring(var2811)
			else
				local _ = nil
				local var2813, var2814 = protoModule.readVarInt(p99, var2801)
				var2801 = var2814 + var2813
			end
		elseif var2802 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2815, var2816 = protoModule.readFixed32(p99, var2801)
			local _ = var2815
			var2801 = var2816
		elseif var2802 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2817, var2818 = protoModule.readFixed64(p99, var2801)
			local _ = var2817
			var2801 = var2818
		else
			error("Unsupported wire type: " .. var4107)
		end
	end
	return var2800
end

function t_99:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_99:jsonDecode()
	-- upvalues: t_99 (ref)
	local var2819 = t_99.new()
	
	if self.id ~= nil then
		var2819.id = self.id
	end
	if self.type ~= nil then
		var2819.type = self.type
	end
	return var2819
end

t_99.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_99
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p100)
	-- upvalues: t_100 (ref)
	return setmetatable({
		entry_map = if p100 == nil or p100.entry_map == nil then {} else p100.entry_map,
		entry_order = if p100 == nil or p100.entry_order == nil then {} else p100.entry_order,
		content_pools = if p100 == nil or p100.content_pools == nil then {} else p100.content_pools,
		search_session_id = if p100 == nil or p100.search_session_id == nil then "" else p100.search_session_id,
		search_query = if p100 == nil or p100.search_query == nil then "" else p100.search_query
	}, t_100)
end

function t_100:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2819 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2820, var2821 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2820, var4129 = protoModule.writeString(var2820, var2821, i)
			local var2822 = v:encode()
			var2821, var4131 = protoModule.writeTag(var2820, var2821, 2, protoModule.wireTypes.lengthDelimited)
			var2821, var4131 = protoModule.writeBuffer(var2821, var4131, var2822, buffer.len(var2822))
			local var2823 = var2821
			local var2824 = var4131
			local var2825, var2826 = protoModule.writeTag(buff, var2819, 1, protoModule.wireTypes.lengthDelimited)
			var2825, var4135 = protoModule.writeBuffer(var2825, var2826, var2823, var2824)
			buff = var2825
			var2819 = var2826
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2827, var2828 = protoModule.writeTag(buff, var2819, 2, protoModule.wireTypes.lengthDelimited)
			var2827, var4137 = protoModule.writeString(var2827, var2828, v)
			buff = var2827
			var2819 = var2828
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2829, var2830 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2829, var4139 = protoModule.writeString(var2829, var2830, i)
			local var2831 = v:encode()
			var2830, var4141 = protoModule.writeTag(var2829, var2830, 2, protoModule.wireTypes.lengthDelimited)
			var2830, var4141 = protoModule.writeBuffer(var2830, var4141, var2831, buffer.len(var2831))
			local var2832 = var2830
			local var2833 = var4141
			local var2834, var2835 = protoModule.writeTag(buff, var2819, 3, protoModule.wireTypes.lengthDelimited)
			var2834, var4145 = protoModule.writeBuffer(var2834, var2835, var2832, var2833)
			buff = var2834
			var2819 = var2835
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2836, var2837 = protoModule.writeTag(buff, var2819, 4, protoModule.wireTypes.lengthDelimited)
		var2836, var4147 = protoModule.writeString(var2836, var2837, self.search_session_id)
		buff = var2836
		var2819 = var2837
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2838, var2839 = protoModule.writeTag(buff, var2819, 5, protoModule.wireTypes.lengthDelimited)
		var2838, var4149 = protoModule.writeString(var2838, var2839, self.search_query)
		buff = var2838
		var2819 = var2839
	end
	local buff_1 = buffer.create(var2819)
	buffer.copy(buff_1, 0, buff, 0, var2819)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2840 = t_100.new()
	local var2841 = 0
	while var2841 < buffer.len(p100) do
		local _ = nil
		local var2842 = nil
		local var2843, var2844, var2845 = protoModule.readTag(p100, var2841)
		local var2846 = var2843
		var2842 = var2844
		var2841 = var2845
		
		if var2842 == protoModule.wireTypes.varint then
			local _ = nil
			local var2847, var2848 = protoModule.readVarInt(p100, var2841)
			local _ = var2847
			var2841 = var2848
			continue
		end
		if var2842 == protoModule.wireTypes.lengthDelimited then
			if var2846 == 1 then
				local _ = nil
				local var2849, var2850 = protoModule.readBuffer(p100, var2841)
				var2841 = var2850
				var2849 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2849)
				var2840.entry_map[var2849.key or ""] = var2849.value or t.FeedEntry.new()
			elseif var2846 == 2 then
				local _ = nil
				local var2851, var2852 = protoModule.readBuffer(p100, var2841)
				var2841 = var2852
				table.insert(var2840.entry_order, buffer.tostring(var2851))
			elseif var2846 == 3 then
				local _ = nil
				local var2853, var2854 = protoModule.readBuffer(p100, var2841)
				var2841 = var2854
				var2853 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2853)
				var2840.content_pools[var2853.key or ""] = var2853.value or t.ContentPool.new()
			elseif var2846 == 4 then
				local _ = nil
				local var2855, var2856 = protoModule.readBuffer(p100, var2841)
				var2841 = var2856
				var2840.search_session_id = buffer.tostring(var2855)
			elseif var2846 == 5 then
				local _ = nil
				local var2857, var2858 = protoModule.readBuffer(p100, var2841)
				var2841 = var2858
				var2840.search_query = buffer.tostring(var2857)
			else
				local _ = nil
				local var2859, var2860 = protoModule.readVarInt(p100, var2841)
				var2841 = var2860 + var2859
			end
		elseif var2842 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2861, var2862 = protoModule.readFixed32(p100, var2841)
			local _ = var2861
			var2841 = var2862
		elseif var2842 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2863, var2864 = protoModule.readFixed64(p100, var2841)
			local _ = var2863
			var2841 = var2864
		else
			error("Unsupported wire type: " .. var4153)
		end
	end
	return var2840
end

function t_100:jsonEncode()
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

function t_100:jsonDecode()
	-- upvalues: t_100 (ref), t (ref)
	local var2865 = t_100.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2865.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2865.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2865.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2865.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2865.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2865.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2865.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2865.search_session_id = self.searchSessionId
	end
	if self.search_query ~= nil then
		var2865.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2865.search_query = self.searchQuery
	end
	return var2865
end

t_100.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_100
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p101)
	-- upvalues: t_101 (ref)
	return setmetatable({
		key = if p101 == nil or p101.key == nil then "" else p101.key,
		value = if p101 == nil or p101.value == nil then nil else p101.value
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2866 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2867, var2868 = protoModule.writeTag(buff, var2866, 1, protoModule.wireTypes.lengthDelimited)
		var2867, var4190 = protoModule.writeString(var2867, var2868, self.key)
		buff = var2867
		var2866 = var2868
	end
	if self.value ~= nil then
		local var2869 = self.value:encode()
		local var2870, var2871 = protoModule.writeTag(buff, var2866, 2, protoModule.wireTypes.lengthDelimited)
		var2870, var4193 = protoModule.writeBuffer(var2870, var2871, var2869, buffer.len(var2869))
		buff = var2870
		var2866 = var2871
	end
	local buff_1 = buffer.create(var2866)
	buffer.copy(buff_1, 0, buff, 0, var2866)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2866 = t_101.new()
	local var2867 = 0
	while var2867 < buffer.len(p101) do
		local _ = nil
		local var2868 = nil
		local var2869, var2870, var2871 = protoModule.readTag(p101, var2867)
		local var2872 = var2869
		var2868 = var2870
		var2867 = var2871
		
		if var2868 == protoModule.wireTypes.varint then
			local _ = nil
			local var2873, var2874 = protoModule.readVarInt(p101, var2867)
			local _ = var2873
			var2867 = var2874
			continue
		end
		if var2868 == protoModule.wireTypes.lengthDelimited then
			if var2872 == 1 then
				local _ = nil
				local var2875, var2876 = protoModule.readBuffer(p101, var2867)
				var2867 = var2876
				var2866.key = buffer.tostring(var2875)
			elseif var2872 == 2 then
				local _ = nil
				local var2877, var2878 = protoModule.readBuffer(p101, var2867)
				var2867 = var2878
				var2866.value = t.FeedEntry.decode(var2877)
			else
				local _ = nil
				local var2879, var2880 = protoModule.readVarInt(p101, var2867)
				var2867 = var2880 + var2879
			end
		elseif var2868 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2881, var2882 = protoModule.readFixed32(p101, var2867)
			local _ = var2881
			var2867 = var2882
		elseif var2868 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2883, var2884 = protoModule.readFixed64(p101, var2867)
			local _ = var2883
			var2867 = var2884
		else
			error("Unsupported wire type: " .. var4197)
		end
	end
	return var2866
end

function t_101:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_101:jsonDecode()
	-- upvalues: t_101 (ref), t (ref)
	local var2885 = t_101.new()
	
	if self.key ~= nil then
		var2885.key = self.key
	end
	if self.value ~= nil then
		var2885.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2885
end

t_101.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_101
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p102)
	-- upvalues: t_102 (ref)
	return setmetatable({
		key = if p102 == nil or p102.key == nil then "" else p102.key,
		value = if p102 == nil or p102.value == nil then nil else p102.value
	}, t_102)
end

function t_102:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2885 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2886, var2887 = protoModule.writeTag(buff, var2885, 1, protoModule.wireTypes.lengthDelimited)
		var2886, var4219 = protoModule.writeString(var2886, var2887, self.key)
		buff = var2886
		var2885 = var2887
	end
	if self.value ~= nil then
		local var2888 = self.value:encode()
		local var2889, var2890 = protoModule.writeTag(buff, var2885, 2, protoModule.wireTypes.lengthDelimited)
		var2889, var4222 = protoModule.writeBuffer(var2889, var2890, var2888, buffer.len(var2888))
		buff = var2889
		var2885 = var2890
	end
	local buff_1 = buffer.create(var2885)
	buffer.copy(buff_1, 0, buff, 0, var2885)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref), t (ref)
	local var2885 = t_102.new()
	local var2886 = 0
	while var2886 < buffer.len(p102) do
		local _ = nil
		local var2887 = nil
		local var2888, var2889, var2890 = protoModule.readTag(p102, var2886)
		local var2891 = var2888
		var2887 = var2889
		var2886 = var2890
		
		if var2887 == protoModule.wireTypes.varint then
			local _ = nil
			local var2892, var2893 = protoModule.readVarInt(p102, var2886)
			local _ = var2892
			var2886 = var2893
			continue
		end
		if var2887 == protoModule.wireTypes.lengthDelimited then
			if var2891 == 1 then
				local _ = nil
				local var2894, var2895 = protoModule.readBuffer(p102, var2886)
				var2886 = var2895
				var2885.key = buffer.tostring(var2894)
			elseif var2891 == 2 then
				local _ = nil
				local var2896, var2897 = protoModule.readBuffer(p102, var2886)
				var2886 = var2897
				var2885.value = t.ContentPool.decode(var2896)
			else
				local _ = nil
				local var2898, var2899 = protoModule.readVarInt(p102, var2886)
				var2886 = var2899 + var2898
			end
		elseif var2887 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2900, var2901 = protoModule.readFixed32(p102, var2886)
			local _ = var2900
			var2886 = var2901
		elseif var2887 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2902, var2903 = protoModule.readFixed64(p102, var2886)
			local _ = var2902
			var2886 = var2903
		else
			error("Unsupported wire type: " .. var4226)
		end
	end
	return var2885
end

function t_102:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_102:jsonDecode()
	-- upvalues: t_102 (ref), t (ref)
	local var2904 = t_102.new()
	
	if self.key ~= nil then
		var2904.key = self.key
	end
	if self.value ~= nil then
		var2904.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2904
end

t_102.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_102
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p103)
	-- upvalues: t_103 (ref)
	return setmetatable({
		prefix = if p103 == nil or p103.prefix == nil then "" else p103.prefix,
		algorithm_name = if p103 == nil or p103.algorithm_name == nil then "" else p103.algorithm_name,
		max_results = if p103 == nil or p103.max_results == nil then 0 else p103.max_results,
		suggestions = if p103 == nil or p103.suggestions == nil then {} else p103.suggestions
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2904 = 0
	
	if self.prefix ~= nil and self.prefix ~= "" then
		local var2905, var2906 = protoModule.writeTag(buff, var2904, 1, protoModule.wireTypes.lengthDelimited)
		var2905, var4248 = protoModule.writeString(var2905, var2906, self.prefix)
		buff = var2905
		var2904 = var2906
	end
	if self.algorithm_name ~= nil and self.algorithm_name ~= "" then
		local var2907, var2908 = protoModule.writeTag(buff, var2904, 2, protoModule.wireTypes.lengthDelimited)
		var2907, var4250 = protoModule.writeString(var2907, var2908, self.algorithm_name)
		buff = var2907
		var2904 = var2908
	end
	if self.max_results ~= nil and self.max_results ~= 0 then
		local var2909, var2910 = protoModule.writeTag(buff, var2904, 3, protoModule.wireTypes.varint)
		var2909, var4252 = protoModule.writeVarInt(var2909, var2910, self.max_results)
		buff = var2909
		var2904 = var2910
	end
	if self.suggestions ~= nil and #self.suggestions > 0 then
		for i, v in self.suggestions do
			local var2911 = v:encode()
			local var2912, var2913 = protoModule.writeTag(buff, var2904, 4, protoModule.wireTypes.lengthDelimited)
			var2912, var4255 = protoModule.writeBuffer(var2912, var2913, var2911, buffer.len(var2911))
			buff = var2912
			var2904 = var2913
		end
	end
	local buff_1 = buffer.create(var2904)
	buffer.copy(buff_1, 0, buff, 0, var2904)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), t (ref)
	local var2914 = t_103.new()
	local var2915 = 0
	while var2915 < buffer.len(p103) do
		local _ = nil
		local var2916 = nil
		local var2917, var2918, var2919 = protoModule.readTag(p103, var2915)
		local var2920 = var2917
		var2916 = var2918
		var2915 = var2919
		
		if var2916 == protoModule.wireTypes.varint then
			if var2920 == 3 then
				local _ = nil
				local var2921, var2922 = protoModule.readVarIntU32(p103, var2915)
				var2915 = var2922
				var2914.max_results = var2921
			else
				local _ = nil
				local var2923, var2924 = protoModule.readVarInt(p103, var2915)
				local _ = var2923
				var2915 = var2924
			end
		end
		if var2916 == protoModule.wireTypes.lengthDelimited then
			if var2920 == 1 then
				local _ = nil
				local var2925, var2926 = protoModule.readBuffer(p103, var2915)
				var2915 = var2926
				var2914.prefix = buffer.tostring(var2925)
			elseif var2920 == 2 then
				local _ = nil
				local var2927, var2928 = protoModule.readBuffer(p103, var2915)
				var2915 = var2928
				var2914.algorithm_name = buffer.tostring(var2927)
			elseif var2920 == 4 then
				local _ = nil
				local var2929, var2930 = protoModule.readBuffer(p103, var2915)
				var2915 = var2930
				table.insert(var2914.suggestions, t.SearchAutocompleteInputData_Suggestion.decode(var2929))
			else
				local _ = nil
				local var2931, var2932 = protoModule.readVarInt(p103, var2915)
				var2915 = var2932 + var2931
			end
		elseif var2916 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2933, var2934 = protoModule.readFixed32(p103, var2915)
			local _ = var2933
			var2915 = var2934
		elseif var2916 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2935, var2936 = protoModule.readFixed64(p103, var2915)
			local _ = var2935
			var2915 = var2936
		else
			error("Unsupported wire type: " .. var4259)
		end
	end
	return var2914
end

function t_103:jsonEncode()
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

function t_103:jsonDecode()
	-- upvalues: t_103 (ref), t (ref)
	local var2937 = t_103.new()
	
	if self.prefix ~= nil then
		var2937.prefix = self.prefix
	end
	if self.algorithm_name ~= nil then
		var2937.algorithm_name = self.algorithm_name
	end
	if self.algorithmName ~= nil then
		var2937.algorithm_name = self.algorithmName
	end
	if self.max_results ~= nil then
		var2937.max_results = self.max_results
	end
	if self.maxResults ~= nil then
		var2937.max_results = self.maxResults
	end
	if self.suggestions ~= nil then
		local t_1 = {}
		
		for i, v in self.suggestions do
			table.insert(t_1, t.SearchAutocompleteInputData_Suggestion.jsonDecode(v))
		end
		var2937.suggestions = t_1
	end
	return var2937
end

t_103.descriptor = {
	name = "SearchAutocompleteInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchAutocompleteInputData"
}
t.SearchAutocompleteInputData = t_103
typeRegistryModule.default:register(t.SearchAutocompleteInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p104)
	-- upvalues: t (ref), t_104 (ref)
	return setmetatable({
		search_query = if p104 == nil or p104.search_query == nil then "" else p104.search_query,
		suggestion_type = if p104 == nil or p104.suggestion_type == nil then assert(t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(0), "Enum has no 0 default") else p104.suggestion_type,
		score = if p104 == nil or p104.score == nil then 0 else p104.score,
		position = if p104 == nil or p104.position == nil then 0 else p104.position,
		canonical_title = if p104 == nil or p104.canonical_title == nil then "" else p104.canonical_title,
		universe_id = if p104 == nil or p104.universe_id == nil then "" else p104.universe_id
	}, t_104)
end

function t_104:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var2938 = 0
	
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2939, var2940 = protoModule.writeTag(buff, var2938, 1, protoModule.wireTypes.lengthDelimited)
		var2939, var4287 = protoModule.writeString(var2939, var2940, self.search_query)
		buff = var2939
		var2938 = var2940
	end
	if self.suggestion_type ~= nil and (self.suggestion_type ~= nil and self.suggestion_type ~= 0 or self.suggestion_type ~= t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(0)) then
		local var2941, var2942 = protoModule.writeTag(buff, var2938, 2, protoModule.wireTypes.varint)
		var2941, var4289 = protoModule.writeVarInt(var2941, var2942, t.SearchAutocompleteInputData_Suggestion_SuggestionType.toNumber(self.suggestion_type))
		buff = var2941
		var2938 = var2942
	end
	if self.score ~= nil and self.score ~= 0 then
		local var2943, var2944 = protoModule.writeTag(buff, var2938, 3, protoModule.wireTypes.i64)
		var2943, var4291 = protoModule.writeDouble(var2943, var2944, self.score)
		buff = var2943
		var2938 = var2944
	end
	if self.position ~= nil and self.position ~= 0 then
		local var2945, var2946 = protoModule.writeTag(buff, var2938, 4, protoModule.wireTypes.varint)
		var2945, var4293 = protoModule.writeVarInt(var2945, var2946, self.position)
		buff = var2945
		var2938 = var2946
	end
	if self.canonical_title ~= nil and self.canonical_title ~= "" then
		local var2947, var2948 = protoModule.writeTag(buff, var2938, 5, protoModule.wireTypes.lengthDelimited)
		var2947, var4295 = protoModule.writeString(var2947, var2948, self.canonical_title)
		buff = var2947
		var2938 = var2948
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2949, var2950 = protoModule.writeTag(buff, var2938, 6, protoModule.wireTypes.lengthDelimited)
		var2949, var4297 = protoModule.writeString(var2949, var2950, self.universe_id)
		buff = var2949
		var2938 = var2950
	end
	local buff_1 = buffer.create(var2938)
	buffer.copy(buff_1, 0, buff, 0, var2938)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref), t (ref)
	local var2938 = t_104.new()
	local var2939 = 0
	while var2939 < buffer.len(p104) do
		local _ = nil
		local var2940 = nil
		local var2941, var2942, var2943 = protoModule.readTag(p104, var2939)
		local var2944 = var2941
		var2940 = var2942
		var2939 = var2943
		
		if var2940 == protoModule.wireTypes.varint then
			if var2944 == 2 then
				local _ = nil
				local var2945, var2946 = protoModule.readVarIntI32(p104, var2939)
				local var2947 = var2945
				var2939 = var2946
				var2938.suggestion_type = t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(var2947) or var2947
			elseif var2944 == 4 then
				local _ = nil
				local var2948, var2949 = protoModule.readVarIntU32(p104, var2939)
				var2939 = var2949
				var2938.position = var2948
			else
				local _ = nil
				local var2950, var2951 = protoModule.readVarInt(p104, var2939)
				local _ = var2950
				var2939 = var2951
			end
		end
		if var2940 == protoModule.wireTypes.lengthDelimited then
			if var2944 == 1 then
				local _ = nil
				local var2952, var2953 = protoModule.readBuffer(p104, var2939)
				var2939 = var2953
				var2938.search_query = buffer.tostring(var2952)
			elseif var2944 == 5 then
				local _ = nil
				local var2954, var2955 = protoModule.readBuffer(p104, var2939)
				var2939 = var2955
				var2938.canonical_title = buffer.tostring(var2954)
			elseif var2944 == 6 then
				local _ = nil
				local var2956, var2957 = protoModule.readBuffer(p104, var2939)
				var2939 = var2957
				var2938.universe_id = buffer.tostring(var2956)
			else
				local _ = nil
				local var2958, var2959 = protoModule.readVarInt(p104, var2939)
				var2939 = var2959 + var2958
			end
		elseif var2940 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2960, var2961 = protoModule.readFixed32(p104, var2939)
			local _ = var2960
			var2939 = var2961
		elseif var2940 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4301)
		elseif var2944 == 3 then
			local _ = nil
			local var2962, var2963 = protoModule.readDouble(p104, var2939)
			var2939 = var2963
			var2938.score = var2962
		else
			local _ = nil
			local var2964, var2965 = protoModule.readFixed64(p104, var2939)
			local _ = var2964
			var2939 = var2965
		end
	end
	return var2938
end

function t_104:jsonEncode()
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

function t_104:jsonDecode()
	-- upvalues: t_104 (ref), t (ref), protoModule (ref)
	local var2966 = t_104.new()
	
	if self.search_query ~= nil then
		var2966.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2966.search_query = self.searchQuery
	end
	if self.suggestion_type ~= nil then
		var2966.suggestion_type = if typeof(self.suggestion_type) == "number" then t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(self.suggestion_type) or self.suggestion_type else t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromName(self.suggestion_type) or self.suggestion_type
	end
	if self.suggestionType ~= nil then
		var2966.suggestion_type = if typeof(self.suggestionType) == "number" then t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromNumber(self.suggestionType) or self.suggestionType else t.SearchAutocompleteInputData_Suggestion_SuggestionType.fromName(self.suggestionType) or self.suggestionType
	end
	if self.score ~= nil then
		var2966.score = protoModule.json.deserializeNumber(self.score)
	end
	if self.position ~= nil then
		var2966.position = self.position
	end
	if self.canonical_title ~= nil then
		var2966.canonical_title = self.canonical_title
	end
	if self.canonicalTitle ~= nil then
		var2966.canonical_title = self.canonicalTitle
	end
	if self.universe_id ~= nil then
		var2966.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2966.universe_id = self.universeId
	end
	return var2966
end

t_104.descriptor = {
	name = "SearchAutocompleteInputData_Suggestion",
	fullName = "roblox.apppageplatform.shared.v1beta1.Suggestion"
}
t.SearchAutocompleteInputData_Suggestion = t_104
typeRegistryModule.default:register(t.SearchAutocompleteInputData_Suggestion)
t.SearchAutocompleteInputData_Suggestion_SuggestionType = {
	fromNumber = function(p105)
		return if p105 == 0 then "SUGGESTION_TYPE_INVALID" elseif p105 == 1 then "SUGGESTION_TYPE_QUERY" elseif p105 == 2 then "SUGGESTION_TYPE_RICH" elseif p105 == 3 then "SUGGESTION_TYPE_TRENDING_QUERY" else nil
	end,
	toNumber = function(p105)
		return if p105 == "SUGGESTION_TYPE_INVALID" then 0 elseif p105 == "SUGGESTION_TYPE_QUERY" then 1 elseif p105 == "SUGGESTION_TYPE_RICH" then 2 elseif p105 == "SUGGESTION_TYPE_TRENDING_QUERY" then 3 else p105
	end,
	fromName = function(p105)
		return if p105 == "SUGGESTION_TYPE_INVALID" then "SUGGESTION_TYPE_INVALID" elseif p105 == "SUGGESTION_TYPE_QUERY" then "SUGGESTION_TYPE_QUERY" elseif p105 == "SUGGESTION_TYPE_RICH" then "SUGGESTION_TYPE_RICH" elseif p105 == "SUGGESTION_TYPE_TRENDING_QUERY" then "SUGGESTION_TYPE_TRENDING_QUERY" else nil
	end
}
local t_105 = {}
t_105.__index = t_105

function t_105.new(p105)
	-- upvalues: t_105 (ref)
	return setmetatable({
		universe_id = if p105 == nil or p105.universe_id == nil then "" else p105.universe_id,
		is_content_locked = if p105 == nil or p105.is_content_locked == nil then false else p105.is_content_locked
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2966 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2967, var2968 = protoModule.writeTag(buff, var2966, 1, protoModule.wireTypes.lengthDelimited)
		var2967, var4332 = protoModule.writeString(var2967, var2968, self.universe_id)
		buff = var2967
		var2966 = var2968
	end
	if self.is_content_locked then
		local var2969, var2970 = protoModule.writeTag(buff, var2966, 2, protoModule.wireTypes.varint)
		var2969, var4334 = protoModule.writeVarInt(var2969, var2970, if self.is_content_locked then 1 else 0)
		buff = var2969
		var2966 = var2970
	end
	local buff_1 = buffer.create(var2966)
	buffer.copy(buff_1, 0, buff, 0, var2966)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2966 = t_105.new()
	local var2967 = 0
	while var2967 < buffer.len(p105) do
		local _ = nil
		local var2968 = nil
		local var2969, var2970, var2971 = protoModule.readTag(p105, var2967)
		local var2972 = var2969
		var2968 = var2970
		var2967 = var2971
		
		if var2968 == protoModule.wireTypes.varint then
			if var2972 == 2 then
				local _ = nil
				local var2973, var2974 = protoModule.readVarInt(p105, var2967)
				var2967 = var2974
				var2966.is_content_locked = var2973 ~= 0
			else
				local _ = nil
				local var2975, var2976 = protoModule.readVarInt(p105, var2967)
				local _ = var2975
				var2967 = var2976
			end
		end
		if var2968 == protoModule.wireTypes.lengthDelimited then
			if var2972 == 1 then
				local _ = nil
				local var2977, var2978 = protoModule.readBuffer(p105, var2967)
				var2967 = var2978
				var2966.universe_id = buffer.tostring(var2977)
			else
				local _ = nil
				local var2979, var2980 = protoModule.readVarInt(p105, var2967)
				var2967 = var2980 + var2979
			end
		elseif var2968 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2981, var2982 = protoModule.readFixed32(p105, var2967)
			local _ = var2981
			var2967 = var2982
		elseif var2968 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2983, var2984 = protoModule.readFixed64(p105, var2967)
			local _ = var2983
			var2967 = var2984
		else
			error("Unsupported wire type: " .. var4338)
		end
	end
	return var2966
end

function t_105:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_105:jsonDecode()
	-- upvalues: t_105 (ref)
	local var2985 = t_105.new()
	
	if self.universe_id ~= nil then
		var2985.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2985.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2985.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2985.is_content_locked = self.isContentLocked
	end
	return var2985
end

t_105.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_105
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p106)
	-- upvalues: t_106 (ref)
	return setmetatable({
		overview_rich_text = if p106 == nil or p106.overview_rich_text == nil then "" else p106.overview_rich_text,
		result_entry = if p106 == nil or p106.result_entry == nil then nil else p106.result_entry,
		follow_up_queries = if p106 == nil or p106.follow_up_queries == nil then {} else p106.follow_up_queries,
		show_loading = if p106 == nil or p106.show_loading == nil then false else p106.show_loading,
		title = if p106 == nil or p106.title == nil then "" else p106.title,
		search_query = if p106 == nil or p106.search_query == nil then "" else p106.search_query,
		universe_ids = if p106 == nil or p106.universe_ids == nil then "" else p106.universe_ids
	}, t_106)
end

function t_106:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2985 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2986, var2987 = protoModule.writeTag(buff, var2985, 1, protoModule.wireTypes.lengthDelimited)
		var2986, var4360 = protoModule.writeString(var2986, var2987, self.overview_rich_text)
		buff = var2986
		var2985 = var2987
	end
	if self.result_entry ~= nil then
		local var2988 = self.result_entry:encode()
		local var2989, var2990 = protoModule.writeTag(buff, var2985, 2, protoModule.wireTypes.lengthDelimited)
		var2989, var4363 = protoModule.writeBuffer(var2989, var2990, var2988, buffer.len(var2988))
		buff = var2989
		var2985 = var2990
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2991, var2992 = protoModule.writeTag(buff, var2985, 3, protoModule.wireTypes.lengthDelimited)
			var2991, var4365 = protoModule.writeString(var2991, var2992, v)
			buff = var2991
			var2985 = var2992
		end
	end
	if self.show_loading then
		local var2993, var2994 = protoModule.writeTag(buff, var2985, 4, protoModule.wireTypes.varint)
		var2993, var4367 = protoModule.writeVarInt(var2993, var2994, if self.show_loading then 1 else 0)
		buff = var2993
		var2985 = var2994
	end
	if self.title ~= nil and self.title ~= "" then
		local var2995, var2996 = protoModule.writeTag(buff, var2985, 5, protoModule.wireTypes.lengthDelimited)
		var2995, var4369 = protoModule.writeString(var2995, var2996, self.title)
		buff = var2995
		var2985 = var2996
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2997, var2998 = protoModule.writeTag(buff, var2985, 6, protoModule.wireTypes.lengthDelimited)
		var2997, var4371 = protoModule.writeString(var2997, var2998, self.search_query)
		buff = var2997
		var2985 = var2998
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2999, var3000 = protoModule.writeTag(buff, var2985, 8, protoModule.wireTypes.lengthDelimited)
		var2999, var4373 = protoModule.writeString(var2999, var3000, self.universe_ids)
		buff = var2999
		var2985 = var3000
	end
	local buff_1 = buffer.create(var2985)
	buffer.copy(buff_1, 0, buff, 0, var2985)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref), t (ref)
	local var3001 = t_106.new()
	local var3002 = 0
	while var3002 < buffer.len(p106) do
		local _ = nil
		local var3003 = nil
		local var3004, var3005, var3006 = protoModule.readTag(p106, var3002)
		local var3007 = var3004
		var3003 = var3005
		var3002 = var3006
		
		if var3003 == protoModule.wireTypes.varint then
			if var3007 == 4 then
				local _ = nil
				local var3008, var3009 = protoModule.readVarInt(p106, var3002)
				var3002 = var3009
				var3001.show_loading = var3008 ~= 0
			else
				local _ = nil
				local var3010, var3011 = protoModule.readVarInt(p106, var3002)
				local _ = var3010
				var3002 = var3011
			end
		end
		if var3003 == protoModule.wireTypes.lengthDelimited then
			if var3007 == 1 then
				local _ = nil
				local var3012, var3013 = protoModule.readBuffer(p106, var3002)
				var3002 = var3013
				var3001.overview_rich_text = buffer.tostring(var3012)
			elseif var3007 == 2 then
				local _ = nil
				local var3014, var3015 = protoModule.readBuffer(p106, var3002)
				var3002 = var3015
				var3001.result_entry = t.FeedEntry.decode(var3014)
			elseif var3007 == 3 then
				local _ = nil
				local var3016, var3017 = protoModule.readBuffer(p106, var3002)
				var3002 = var3017
				table.insert(var3001.follow_up_queries, buffer.tostring(var3016))
			elseif var3007 == 5 then
				local _ = nil
				local var3018, var3019 = protoModule.readBuffer(p106, var3002)
				var3002 = var3019
				var3001.title = buffer.tostring(var3018)
			elseif var3007 == 6 then
				local _ = nil
				local var3020, var3021 = protoModule.readBuffer(p106, var3002)
				var3002 = var3021
				var3001.search_query = buffer.tostring(var3020)
			elseif var3007 == 8 then
				local _ = nil
				local var3022, var3023 = protoModule.readBuffer(p106, var3002)
				var3002 = var3023
				var3001.universe_ids = buffer.tostring(var3022)
			else
				local _ = nil
				local var3024, var3025 = protoModule.readVarInt(p106, var3002)
				var3002 = var3025 + var3024
			end
		elseif var3003 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3026, var3027 = protoModule.readFixed32(p106, var3002)
			local _ = var3026
			var3002 = var3027
		elseif var3003 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3028, var3029 = protoModule.readFixed64(p106, var3002)
			local _ = var3028
			var3002 = var3029
		else
			error("Unsupported wire type: " .. var4377)
		end
	end
	return var3001
end

function t_106:jsonEncode()
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

function t_106:jsonDecode()
	-- upvalues: t_106 (ref), t (ref)
	local var3030 = t_106.new()
	
	if self.overview_rich_text ~= nil then
		var3030.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var3030.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var3030.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var3030.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var3030.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var3030.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var3030.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var3030.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var3030.title = self.title
	end
	if self.search_query ~= nil then
		var3030.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var3030.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var3030.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var3030.universe_ids = self.universeIds
	end
	return var3030
end

t_106.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_106
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p107)
	-- upvalues: t_107 (ref)
	return setmetatable({
		title = if p107 == nil or p107.title == nil then "" else p107.title,
		user_items = if p107 == nil or p107.user_items == nil then {} else p107.user_items,
		max_visible_rows = if p107 == nil or p107.max_visible_rows == nil then 0 else p107.max_visible_rows,
		sort_id = if p107 == nil or p107.sort_id == nil then nil else p107.sort_id
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3031 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3032, var3033 = protoModule.writeTag(buff, var3031, 1, protoModule.wireTypes.lengthDelimited)
		var3032, var4412 = protoModule.writeString(var3032, var3033, self.title)
		buff = var3032
		var3031 = var3033
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var3034 = v:encode()
			local var3035, var3036 = protoModule.writeTag(buff, var3031, 2, protoModule.wireTypes.lengthDelimited)
			var3035, var4415 = protoModule.writeBuffer(var3035, var3036, var3034, buffer.len(var3034))
			buff = var3035
			var3031 = var3036
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3037, var3038 = protoModule.writeTag(buff, var3031, 3, protoModule.wireTypes.varint)
		var3037, var4417 = protoModule.writeVarInt(var3037, var3038, self.max_visible_rows)
		buff = var3037
		var3031 = var3038
	end
	if self.sort_id ~= nil then
		local var3039, var3040 = protoModule.writeTag(buff, var3031, 4, protoModule.wireTypes.lengthDelimited)
		var3039, var4419 = protoModule.writeString(var3039, var3040, self.sort_id)
		buff = var3039
		var3031 = var3040
	end
	local buff_1 = buffer.create(var3031)
	buffer.copy(buff_1, 0, buff, 0, var3031)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref), t (ref)
	local var3041 = t_107.new()
	local var3042 = 0
	while var3042 < buffer.len(p107) do
		local _ = nil
		local var3043 = nil
		local var3044, var3045, var3046 = protoModule.readTag(p107, var3042)
		local var3047 = var3044
		var3043 = var3045
		var3042 = var3046
		
		if var3043 == protoModule.wireTypes.varint then
			if var3047 == 3 then
				local _ = nil
				local var3048, var3049 = protoModule.readVarIntI32(p107, var3042)
				var3042 = var3049
				var3041.max_visible_rows = var3048
			else
				local _ = nil
				local var3050, var3051 = protoModule.readVarInt(p107, var3042)
				local _ = var3050
				var3042 = var3051
			end
		end
		if var3043 == protoModule.wireTypes.lengthDelimited then
			if var3047 == 1 then
				local _ = nil
				local var3052, var3053 = protoModule.readBuffer(p107, var3042)
				var3042 = var3053
				var3041.title = buffer.tostring(var3052)
			elseif var3047 == 2 then
				local _ = nil
				local var3054, var3055 = protoModule.readBuffer(p107, var3042)
				var3042 = var3055
				table.insert(var3041.user_items, t.UserListInputData_UserItem.decode(var3054))
			elseif var3047 == 4 then
				local _ = nil
				local var3056, var3057 = protoModule.readBuffer(p107, var3042)
				var3042 = var3057
				var3041.sort_id = buffer.tostring(var3056)
			else
				local _ = nil
				local var3058, var3059 = protoModule.readVarInt(p107, var3042)
				var3042 = var3059 + var3058
			end
		elseif var3043 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3060, var3061 = protoModule.readFixed32(p107, var3042)
			local _ = var3060
			var3042 = var3061
		elseif var3043 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3062, var3063 = protoModule.readFixed64(p107, var3042)
			local _ = var3062
			var3042 = var3063
		else
			error("Unsupported wire type: " .. var4423)
		end
	end
	return var3041
end

function t_107:jsonEncode()
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

function t_107:jsonDecode()
	-- upvalues: t_107 (ref), t (ref)
	local var3064 = t_107.new()
	
	if self.title ~= nil then
		var3064.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3064.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3064.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3064.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3064.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3064.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3064.sort_id = self.sortId
	end
	return var3064
end

t_107.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_107
typeRegistryModule.default:register(t.UserListInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p108)
	-- upvalues: t_108 (ref)
	return setmetatable({
		user_id = if p108 == nil or p108.user_id == nil then "" else p108.user_id,
		previous_usernames = if p108 == nil or p108.previous_usernames == nil then {} else p108.previous_usernames
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3065 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3066, var3067 = protoModule.writeTag(buff, var3065, 1, protoModule.wireTypes.lengthDelimited)
		var3066, var4452 = protoModule.writeString(var3066, var3067, self.user_id)
		buff = var3066
		var3065 = var3067
	end
	if self.previous_usernames ~= nil and #self.previous_usernames > 0 then
		for i, v in self.previous_usernames do
			local var3068, var3069 = protoModule.writeTag(buff, var3065, 2, protoModule.wireTypes.lengthDelimited)
			var3068, var4454 = protoModule.writeString(var3068, var3069, v)
			buff = var3068
			var3065 = var3069
		end
	end
	local buff_1 = buffer.create(var3065)
	buffer.copy(buff_1, 0, buff, 0, var3065)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var3070 = t_108.new()
	local var3071 = 0
	while var3071 < buffer.len(p108) do
		local _ = nil
		local var3072 = nil
		local var3073, var3074, var3075 = protoModule.readTag(p108, var3071)
		local var3076 = var3073
		var3072 = var3074
		var3071 = var3075
		
		if var3072 == protoModule.wireTypes.varint then
			local _ = nil
			local var3077, var3078 = protoModule.readVarInt(p108, var3071)
			local _ = var3077
			var3071 = var3078
			continue
		end
		if var3072 == protoModule.wireTypes.lengthDelimited then
			if var3076 == 1 then
				local _ = nil
				local var3079, var3080 = protoModule.readBuffer(p108, var3071)
				var3071 = var3080
				var3070.user_id = buffer.tostring(var3079)
			elseif var3076 == 2 then
				local _ = nil
				local var3081, var3082 = protoModule.readBuffer(p108, var3071)
				var3071 = var3082
				table.insert(var3070.previous_usernames, buffer.tostring(var3081))
			else
				local _ = nil
				local var3083, var3084 = protoModule.readVarInt(p108, var3071)
				var3071 = var3084 + var3083
			end
		elseif var3072 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3085, var3086 = protoModule.readFixed32(p108, var3071)
			local _ = var3085
			var3071 = var3086
		elseif var3072 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3087, var3088 = protoModule.readFixed64(p108, var3071)
			local _ = var3087
			var3071 = var3088
		else
			error("Unsupported wire type: " .. var4458)
		end
	end
	return var3070
end

function t_108:jsonEncode()
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

function t_108:jsonDecode()
	-- upvalues: t_108 (ref)
	local var3089 = t_108.new()
	
	if self.user_id ~= nil then
		var3089.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3089.user_id = self.userId
	end
	if self.previous_usernames ~= nil then
		local t = {}
		
		for i, v in self.previous_usernames do
			table.insert(t, v)
		end
		var3089.previous_usernames = t
	end
	if self.previousUsernames ~= nil then
		local t = {}
		
		for i, v in self.previousUsernames do
			table.insert(t, v)
		end
		var3089.previous_usernames = t
	end
	return var3089
end

t_108.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_108
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p109)
	-- upvalues: t_109 (ref)
	return setmetatable({
		title = if p109 == nil or p109.title == nil then "" else p109.title,
		items = if p109 == nil or p109.items == nil then {} else p109.items,
		max_visible_rows = if p109 == nil or p109.max_visible_rows == nil then 0 else p109.max_visible_rows,
		sort_id = if p109 == nil or p109.sort_id == nil then nil else p109.sort_id
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3090 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3091, var3092 = protoModule.writeTag(buff, var3090, 1, protoModule.wireTypes.lengthDelimited)
		var3091, var4483 = protoModule.writeString(var3091, var3092, self.title)
		buff = var3091
		var3090 = var3092
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3093 = v:encode()
			local var3094, var3095 = protoModule.writeTag(buff, var3090, 2, protoModule.wireTypes.lengthDelimited)
			var3094, var4486 = protoModule.writeBuffer(var3094, var3095, var3093, buffer.len(var3093))
			buff = var3094
			var3090 = var3095
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3096, var3097 = protoModule.writeTag(buff, var3090, 3, protoModule.wireTypes.varint)
		var3096, var4488 = protoModule.writeVarInt(var3096, var3097, self.max_visible_rows)
		buff = var3096
		var3090 = var3097
	end
	if self.sort_id ~= nil then
		local var3098, var3099 = protoModule.writeTag(buff, var3090, 4, protoModule.wireTypes.lengthDelimited)
		var3098, var4490 = protoModule.writeString(var3098, var3099, self.sort_id)
		buff = var3098
		var3090 = var3099
	end
	local buff_1 = buffer.create(var3090)
	buffer.copy(buff_1, 0, buff, 0, var3090)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var3100 = t_109.new()
	local var3101 = 0
	while var3101 < buffer.len(p109) do
		local _ = nil
		local var3102 = nil
		local var3103, var3104, var3105 = protoModule.readTag(p109, var3101)
		local var3106 = var3103
		var3102 = var3104
		var3101 = var3105
		
		if var3102 == protoModule.wireTypes.varint then
			if var3106 == 3 then
				local _ = nil
				local var3107, var3108 = protoModule.readVarIntI32(p109, var3101)
				var3101 = var3108
				var3100.max_visible_rows = var3107
			else
				local _ = nil
				local var3109, var3110 = protoModule.readVarInt(p109, var3101)
				local _ = var3109
				var3101 = var3110
			end
		end
		if var3102 == protoModule.wireTypes.lengthDelimited then
			if var3106 == 1 then
				local _ = nil
				local var3111, var3112 = protoModule.readBuffer(p109, var3101)
				var3101 = var3112
				var3100.title = buffer.tostring(var3111)
			elseif var3106 == 2 then
				local _ = nil
				local var3113, var3114 = protoModule.readBuffer(p109, var3101)
				var3101 = var3114
				table.insert(var3100.items, t.CatalogItemListInputData_CatalogItem.decode(var3113))
			elseif var3106 == 4 then
				local _ = nil
				local var3115, var3116 = protoModule.readBuffer(p109, var3101)
				var3101 = var3116
				var3100.sort_id = buffer.tostring(var3115)
			else
				local _ = nil
				local var3117, var3118 = protoModule.readVarInt(p109, var3101)
				var3101 = var3118 + var3117
			end
		elseif var3102 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3119, var3120 = protoModule.readFixed32(p109, var3101)
			local _ = var3119
			var3101 = var3120
		elseif var3102 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3121, var3122 = protoModule.readFixed64(p109, var3101)
			local _ = var3121
			var3101 = var3122
		else
			error("Unsupported wire type: " .. var4494)
		end
	end
	return var3100
end

function t_109:jsonEncode()
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

function t_109:jsonDecode()
	-- upvalues: t_109 (ref), t (ref)
	local var3123 = t_109.new()
	
	if self.title ~= nil then
		var3123.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var3123.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3123.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3123.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3123.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3123.sort_id = self.sortId
	end
	return var3123
end

t_109.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_109
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p110)
	-- upvalues: t_110 (ref)
	return setmetatable({
		item_id = if p110 == nil or p110.item_id == nil then "" else p110.item_id,
		item_type = if p110 == nil or p110.item_type == nil then "" else p110.item_type
	}, t_110)
end

function t_110:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3124 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3125, var3126 = protoModule.writeTag(buff, var3124, 1, protoModule.wireTypes.lengthDelimited)
		var3125, var4522 = protoModule.writeString(var3125, var3126, self.item_id)
		buff = var3125
		var3124 = var3126
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3127, var3128 = protoModule.writeTag(buff, var3124, 2, protoModule.wireTypes.lengthDelimited)
		var3127, var4524 = protoModule.writeString(var3127, var3128, self.item_type)
		buff = var3127
		var3124 = var3128
	end
	local buff_1 = buffer.create(var3124)
	buffer.copy(buff_1, 0, buff, 0, var3124)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref)
	local var3124 = t_110.new()
	local var3125 = 0
	while var3125 < buffer.len(p110) do
		local _ = nil
		local var3126 = nil
		local var3127, var3128, var3129 = protoModule.readTag(p110, var3125)
		local var3130 = var3127
		var3126 = var3128
		var3125 = var3129
		
		if var3126 == protoModule.wireTypes.varint then
			local _ = nil
			local var3131, var3132 = protoModule.readVarInt(p110, var3125)
			local _ = var3131
			var3125 = var3132
			continue
		end
		if var3126 == protoModule.wireTypes.lengthDelimited then
			if var3130 == 1 then
				local _ = nil
				local var3133, var3134 = protoModule.readBuffer(p110, var3125)
				var3125 = var3134
				var3124.item_id = buffer.tostring(var3133)
			elseif var3130 == 2 then
				local _ = nil
				local var3135, var3136 = protoModule.readBuffer(p110, var3125)
				var3125 = var3136
				var3124.item_type = buffer.tostring(var3135)
			else
				local _ = nil
				local var3137, var3138 = protoModule.readVarInt(p110, var3125)
				var3125 = var3138 + var3137
			end
		elseif var3126 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3139, var3140 = protoModule.readFixed32(p110, var3125)
			local _ = var3139
			var3125 = var3140
		elseif var3126 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3141, var3142 = protoModule.readFixed64(p110, var3125)
			local _ = var3141
			var3125 = var3142
		else
			error("Unsupported wire type: " .. var4528)
		end
	end
	return var3124
end

function t_110:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_110:jsonDecode()
	-- upvalues: t_110 (ref)
	local var3143 = t_110.new()
	
	if self.item_id ~= nil then
		var3143.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3143.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3143.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3143.item_type = self.itemType
	end
	return var3143
end

t_110.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_110
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p111)
	-- upvalues: t_111 (ref)
	return setmetatable({
		universe_id = if p111 == nil or p111.universe_id == nil then "" else p111.universe_id
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3143 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3144, var3145 = protoModule.writeTag(buff, var3143, 1, protoModule.wireTypes.lengthDelimited)
		var3144, var4550 = protoModule.writeString(var3144, var3145, self.universe_id)
		buff = var3144
		var3143 = var3145
	end
	local buff_1 = buffer.create(var3143)
	buffer.copy(buff_1, 0, buff, 0, var3143)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref)
	local var3143 = t_111.new()
	local var3144 = 0
	while var3144 < buffer.len(p111) do
		local _ = nil
		local var3145 = nil
		local var3146, var3147, var3148 = protoModule.readTag(p111, var3144)
		local var3149 = var3146
		var3145 = var3147
		var3144 = var3148
		
		if var3145 == protoModule.wireTypes.varint then
			local _ = nil
			local var3150, var3151 = protoModule.readVarInt(p111, var3144)
			local _ = var3150
			var3144 = var3151
			continue
		end
		if var3145 == protoModule.wireTypes.lengthDelimited then
			if var3149 == 1 then
				local _ = nil
				local var3152, var3153 = protoModule.readBuffer(p111, var3144)
				var3144 = var3153
				var3143.universe_id = buffer.tostring(var3152)
			else
				local _ = nil
				local var3154, var3155 = protoModule.readVarInt(p111, var3144)
				var3144 = var3155 + var3154
			end
		elseif var3145 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3156, var3157 = protoModule.readFixed32(p111, var3144)
			local _ = var3156
			var3144 = var3157
		elseif var3145 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3158, var3159 = protoModule.readFixed64(p111, var3144)
			local _ = var3158
			var3144 = var3159
		else
			error("Unsupported wire type: " .. var4554)
		end
	end
	return var3143
end

function t_111:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_111:jsonDecode()
	-- upvalues: t_111 (ref)
	local var3160 = t_111.new()
	
	if self.universe_id ~= nil then
		var3160.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3160.universe_id = self.universeId
	end
	return var3160
end

t_111.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_111
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p112)
	-- upvalues: t_112 (ref)
	return setmetatable({
		title = if p112 == nil or p112.title == nil then "" else p112.title,
		subtitle = if p112 == nil or p112.subtitle == nil then "" else p112.subtitle,
		moment_items = if p112 == nil or p112.moment_items == nil then {} else p112.moment_items
	}, t_112)
end

function t_112:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3160 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3161, var3162 = protoModule.writeTag(buff, var3160, 1, protoModule.wireTypes.lengthDelimited)
		var3161, var4574 = protoModule.writeString(var3161, var3162, self.title)
		buff = var3161
		var3160 = var3162
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3163, var3164 = protoModule.writeTag(buff, var3160, 2, protoModule.wireTypes.lengthDelimited)
		var3163, var4576 = protoModule.writeString(var3163, var3164, self.subtitle)
		buff = var3163
		var3160 = var3164
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var3165 = v:encode()
			local var3166, var3167 = protoModule.writeTag(buff, var3160, 3, protoModule.wireTypes.lengthDelimited)
			var3166, var4579 = protoModule.writeBuffer(var3166, var3167, var3165, buffer.len(var3165))
			buff = var3166
			var3160 = var3167
		end
	end
	local buff_1 = buffer.create(var3160)
	buffer.copy(buff_1, 0, buff, 0, var3160)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var3168 = t_112.new()
	local var3169 = 0
	while var3169 < buffer.len(p112) do
		local _ = nil
		local var3170 = nil
		local var3171, var3172, var3173 = protoModule.readTag(p112, var3169)
		local var3174 = var3171
		var3170 = var3172
		var3169 = var3173
		
		if var3170 == protoModule.wireTypes.varint then
			local _ = nil
			local var3175, var3176 = protoModule.readVarInt(p112, var3169)
			local _ = var3175
			var3169 = var3176
			continue
		end
		if var3170 == protoModule.wireTypes.lengthDelimited then
			if var3174 == 1 then
				local _ = nil
				local var3177, var3178 = protoModule.readBuffer(p112, var3169)
				var3169 = var3178
				var3168.title = buffer.tostring(var3177)
			elseif var3174 == 2 then
				local _ = nil
				local var3179, var3180 = protoModule.readBuffer(p112, var3169)
				var3169 = var3180
				var3168.subtitle = buffer.tostring(var3179)
			elseif var3174 == 3 then
				local _ = nil
				local var3181, var3182 = protoModule.readBuffer(p112, var3169)
				var3169 = var3182
				table.insert(var3168.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var3181))
			else
				local _ = nil
				local var3183, var3184 = protoModule.readVarInt(p112, var3169)
				var3169 = var3184 + var3183
			end
		elseif var3170 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3185, var3186 = protoModule.readFixed32(p112, var3169)
			local _ = var3185
			var3169 = var3186
		elseif var3170 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3187, var3188 = protoModule.readFixed64(p112, var3169)
			local _ = var3187
			var3169 = var3188
		else
			error("Unsupported wire type: " .. var4583)
		end
	end
	return var3168
end

function t_112:jsonEncode()
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

function t_112:jsonDecode()
	-- upvalues: t_112 (ref), t (ref)
	local var3189 = t_112.new()
	
	if self.title ~= nil then
		var3189.title = self.title
	end
	if self.subtitle ~= nil then
		var3189.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3189.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3189.moment_items = t_1
	end
	return var3189
end

t_112.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_112
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p113)
	-- upvalues: t_113 (ref)
	return setmetatable({
		moment_id = if p113 == nil or p113.moment_id == nil then "" else p113.moment_id,
		video_asset_id = if p113 == nil or p113.video_asset_id == nil then "" else p113.video_asset_id,
		target_universe_id = if p113 == nil or p113.target_universe_id == nil then "" else p113.target_universe_id,
		target_place_id = if p113 == nil or p113.target_place_id == nil then "" else p113.target_place_id,
		feed_item_id = if p113 == nil or p113.feed_item_id == nil then "" else p113.feed_item_id,
		capture_universe_id = if p113 == nil or p113.capture_universe_id == nil then "" else p113.capture_universe_id
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3190 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var3191, var3192 = protoModule.writeTag(buff, var3190, 1, protoModule.wireTypes.lengthDelimited)
		var3191, var4610 = protoModule.writeString(var3191, var3192, self.moment_id)
		buff = var3191
		var3190 = var3192
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3193, var3194 = protoModule.writeTag(buff, var3190, 2, protoModule.wireTypes.lengthDelimited)
		var3193, var4612 = protoModule.writeString(var3193, var3194, self.video_asset_id)
		buff = var3193
		var3190 = var3194
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var3195, var3196 = protoModule.writeTag(buff, var3190, 3, protoModule.wireTypes.lengthDelimited)
		var3195, var4614 = protoModule.writeString(var3195, var3196, self.target_universe_id)
		buff = var3195
		var3190 = var3196
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var3197, var3198 = protoModule.writeTag(buff, var3190, 4, protoModule.wireTypes.lengthDelimited)
		var3197, var4616 = protoModule.writeString(var3197, var3198, self.target_place_id)
		buff = var3197
		var3190 = var3198
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var3199, var3200 = protoModule.writeTag(buff, var3190, 5, protoModule.wireTypes.lengthDelimited)
		var3199, var4618 = protoModule.writeString(var3199, var3200, self.feed_item_id)
		buff = var3199
		var3190 = var3200
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var3201, var3202 = protoModule.writeTag(buff, var3190, 6, protoModule.wireTypes.lengthDelimited)
		var3201, var4620 = protoModule.writeString(var3201, var3202, self.capture_universe_id)
		buff = var3201
		var3190 = var3202
	end
	local buff_1 = buffer.create(var3190)
	buffer.copy(buff_1, 0, buff, 0, var3190)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref)
	local var3190 = t_113.new()
	local var3191 = 0
	while var3191 < buffer.len(p113) do
		local _ = nil
		local var3192 = nil
		local var3193, var3194, var3195 = protoModule.readTag(p113, var3191)
		local var3196 = var3193
		var3192 = var3194
		var3191 = var3195
		
		if var3192 == protoModule.wireTypes.varint then
			local _ = nil
			local var3197, var3198 = protoModule.readVarInt(p113, var3191)
			local _ = var3197
			var3191 = var3198
			continue
		end
		if var3192 == protoModule.wireTypes.lengthDelimited then
			if var3196 == 1 then
				local _ = nil
				local var3199, var3200 = protoModule.readBuffer(p113, var3191)
				var3191 = var3200
				var3190.moment_id = buffer.tostring(var3199)
			elseif var3196 == 2 then
				local _ = nil
				local var3201, var3202 = protoModule.readBuffer(p113, var3191)
				var3191 = var3202
				var3190.video_asset_id = buffer.tostring(var3201)
			elseif var3196 == 3 then
				local _ = nil
				local var3203, var3204 = protoModule.readBuffer(p113, var3191)
				var3191 = var3204
				var3190.target_universe_id = buffer.tostring(var3203)
			elseif var3196 == 4 then
				local _ = nil
				local var3205, var3206 = protoModule.readBuffer(p113, var3191)
				var3191 = var3206
				var3190.target_place_id = buffer.tostring(var3205)
			elseif var3196 == 5 then
				local _ = nil
				local var3207, var3208 = protoModule.readBuffer(p113, var3191)
				var3191 = var3208
				var3190.feed_item_id = buffer.tostring(var3207)
			elseif var3196 == 6 then
				local _ = nil
				local var3209, var3210 = protoModule.readBuffer(p113, var3191)
				var3191 = var3210
				var3190.capture_universe_id = buffer.tostring(var3209)
			else
				local _ = nil
				local var3211, var3212 = protoModule.readVarInt(p113, var3191)
				var3191 = var3212 + var3211
			end
		elseif var3192 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3213, var3214 = protoModule.readFixed32(p113, var3191)
			local _ = var3213
			var3191 = var3214
		elseif var3192 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3215, var3216 = protoModule.readFixed64(p113, var3191)
			local _ = var3215
			var3191 = var3216
		else
			error("Unsupported wire type: " .. var4624)
		end
	end
	return var3190
end

function t_113:jsonEncode()
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

function t_113:jsonDecode()
	-- upvalues: t_113 (ref)
	local var3217 = t_113.new()
	
	if self.moment_id ~= nil then
		var3217.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var3217.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var3217.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3217.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var3217.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var3217.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var3217.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var3217.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var3217.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var3217.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var3217.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var3217.capture_universe_id = self.captureUniverseId
	end
	return var3217
end

t_113.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_113
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p114)
	-- upvalues: t_114 (ref)
	return setmetatable({
		title = if p114 == nil or p114.title == nil then "" else p114.title,
		subtitle = if p114 == nil or p114.subtitle == nil then "" else p114.subtitle,
		show_download_button = if p114 == nil or p114.show_download_button == nil then false else p114.show_download_button
	}, t_114)
end

function t_114:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3217 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3218, var3219 = protoModule.writeTag(buff, var3217, 1, protoModule.wireTypes.lengthDelimited)
		var3218, var4654 = protoModule.writeString(var3218, var3219, self.title)
		buff = var3218
		var3217 = var3219
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3220, var3221 = protoModule.writeTag(buff, var3217, 2, protoModule.wireTypes.lengthDelimited)
		var3220, var4656 = protoModule.writeString(var3220, var3221, self.subtitle)
		buff = var3220
		var3217 = var3221
	end
	if self.show_download_button then
		local var3222, var3223 = protoModule.writeTag(buff, var3217, 3, protoModule.wireTypes.varint)
		var3222, var4658 = protoModule.writeVarInt(var3222, var3223, if self.show_download_button then 1 else 0)
		buff = var3222
		var3217 = var3223
	end
	local buff_1 = buffer.create(var3217)
	buffer.copy(buff_1, 0, buff, 0, var3217)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref)
	local var3217 = t_114.new()
	local var3218 = 0
	while var3218 < buffer.len(p114) do
		local _ = nil
		local var3219 = nil
		local var3220, var3221, var3222 = protoModule.readTag(p114, var3218)
		local var3223 = var3220
		var3219 = var3221
		var3218 = var3222
		
		if var3219 == protoModule.wireTypes.varint then
			if var3223 == 3 then
				local _ = nil
				local var3224, var3225 = protoModule.readVarInt(p114, var3218)
				var3218 = var3225
				var3217.show_download_button = var3224 ~= 0
			else
				local _ = nil
				local var3226, var3227 = protoModule.readVarInt(p114, var3218)
				local _ = var3226
				var3218 = var3227
			end
		end
		if var3219 == protoModule.wireTypes.lengthDelimited then
			if var3223 == 1 then
				local _ = nil
				local var3228, var3229 = protoModule.readBuffer(p114, var3218)
				var3218 = var3229
				var3217.title = buffer.tostring(var3228)
			elseif var3223 == 2 then
				local _ = nil
				local var3230, var3231 = protoModule.readBuffer(p114, var3218)
				var3218 = var3231
				var3217.subtitle = buffer.tostring(var3230)
			else
				local _ = nil
				local var3232, var3233 = protoModule.readVarInt(p114, var3218)
				var3218 = var3233 + var3232
			end
		elseif var3219 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3234, var3235 = protoModule.readFixed32(p114, var3218)
			local _ = var3234
			var3218 = var3235
		elseif var3219 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3236, var3237 = protoModule.readFixed64(p114, var3218)
			local _ = var3236
			var3218 = var3237
		else
			error("Unsupported wire type: " .. var4662)
		end
	end
	return var3217
end

function t_114:jsonEncode()
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

function t_114:jsonDecode()
	-- upvalues: t_114 (ref)
	local var3238 = t_114.new()
	
	if self.title ~= nil then
		var3238.title = self.title
	end
	if self.subtitle ~= nil then
		var3238.subtitle = self.subtitle
	end
	if self.show_download_button ~= nil then
		var3238.show_download_button = self.show_download_button
	end
	if self.showDownloadButton ~= nil then
		var3238.show_download_button = self.showDownloadButton
	end
	return var3238
end

t_114.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_114
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p115)
	-- upvalues: t_115 (ref)
	return setmetatable({
		primary_cta_button_text = if p115 == nil or p115.primary_cta_button_text == nil then "" else p115.primary_cta_button_text,
		secondary_cta_button_text = if p115 == nil or p115.secondary_cta_button_text == nil then "" else p115.secondary_cta_button_text,
		primary_cta_type = if p115 == nil or p115.primary_cta_type == nil then "" else p115.primary_cta_type,
		secondary_cta_type = if p115 == nil or p115.secondary_cta_type == nil then "" else p115.secondary_cta_type
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3238 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var3239, var3240 = protoModule.writeTag(buff, var3238, 1, protoModule.wireTypes.lengthDelimited)
		var3239, var4686 = protoModule.writeString(var3239, var3240, self.primary_cta_button_text)
		buff = var3239
		var3238 = var3240
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var3241, var3242 = protoModule.writeTag(buff, var3238, 2, protoModule.wireTypes.lengthDelimited)
		var3241, var4688 = protoModule.writeString(var3241, var3242, self.secondary_cta_button_text)
		buff = var3241
		var3238 = var3242
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var3243, var3244 = protoModule.writeTag(buff, var3238, 3, protoModule.wireTypes.lengthDelimited)
		var3243, var4690 = protoModule.writeString(var3243, var3244, self.primary_cta_type)
		buff = var3243
		var3238 = var3244
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var3245, var3246 = protoModule.writeTag(buff, var3238, 4, protoModule.wireTypes.lengthDelimited)
		var3245, var4692 = protoModule.writeString(var3245, var3246, self.secondary_cta_type)
		buff = var3245
		var3238 = var3246
	end
	local buff_1 = buffer.create(var3238)
	buffer.copy(buff_1, 0, buff, 0, var3238)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref)
	local var3238 = t_115.new()
	local var3239 = 0
	while var3239 < buffer.len(p115) do
		local _ = nil
		local var3240 = nil
		local var3241, var3242, var3243 = protoModule.readTag(p115, var3239)
		local var3244 = var3241
		var3240 = var3242
		var3239 = var3243
		
		if var3240 == protoModule.wireTypes.varint then
			local _ = nil
			local var3245, var3246 = protoModule.readVarInt(p115, var3239)
			local _ = var3245
			var3239 = var3246
			continue
		end
		if var3240 == protoModule.wireTypes.lengthDelimited then
			if var3244 == 1 then
				local _ = nil
				local var3247, var3248 = protoModule.readBuffer(p115, var3239)
				var3239 = var3248
				var3238.primary_cta_button_text = buffer.tostring(var3247)
			elseif var3244 == 2 then
				local _ = nil
				local var3249, var3250 = protoModule.readBuffer(p115, var3239)
				var3239 = var3250
				var3238.secondary_cta_button_text = buffer.tostring(var3249)
			elseif var3244 == 3 then
				local _ = nil
				local var3251, var3252 = protoModule.readBuffer(p115, var3239)
				var3239 = var3252
				var3238.primary_cta_type = buffer.tostring(var3251)
			elseif var3244 == 4 then
				local _ = nil
				local var3253, var3254 = protoModule.readBuffer(p115, var3239)
				var3239 = var3254
				var3238.secondary_cta_type = buffer.tostring(var3253)
			else
				local _ = nil
				local var3255, var3256 = protoModule.readVarInt(p115, var3239)
				var3239 = var3256 + var3255
			end
		elseif var3240 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3257, var3258 = protoModule.readFixed32(p115, var3239)
			local _ = var3257
			var3239 = var3258
		elseif var3240 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3259, var3260 = protoModule.readFixed64(p115, var3239)
			local _ = var3259
			var3239 = var3260
		else
			error("Unsupported wire type: " .. var4696)
		end
	end
	return var3238
end

function t_115:jsonEncode()
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

function t_115:jsonDecode()
	-- upvalues: t_115 (ref)
	local var3261 = t_115.new()
	
	if self.primary_cta_button_text ~= nil then
		var3261.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var3261.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var3261.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var3261.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var3261.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var3261.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var3261.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var3261.secondary_cta_type = self.secondaryCtaType
	end
	return var3261
end

t_115.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_115
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p116)
	-- upvalues: t_116 (ref)
	return setmetatable({
		image_asset_id = if p116 == nil or p116.image_asset_id == nil then "" else p116.image_asset_id
	}, t_116)
end

function t_116:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3261 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3262, var3263 = protoModule.writeTag(buff, var3261, 1, protoModule.wireTypes.lengthDelimited)
		var3262, var4722 = protoModule.writeString(var3262, var3263, self.image_asset_id)
		buff = var3262
		var3261 = var3263
	end
	local buff_1 = buffer.create(var3261)
	buffer.copy(buff_1, 0, buff, 0, var3261)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3261 = t_116.new()
	local var3262 = 0
	while var3262 < buffer.len(p116) do
		local _ = nil
		local var3263 = nil
		local var3264, var3265, var3266 = protoModule.readTag(p116, var3262)
		local var3267 = var3264
		var3263 = var3265
		var3262 = var3266
		
		if var3263 == protoModule.wireTypes.varint then
			local _ = nil
			local var3268, var3269 = protoModule.readVarInt(p116, var3262)
			local _ = var3268
			var3262 = var3269
			continue
		end
		if var3263 == protoModule.wireTypes.lengthDelimited then
			if var3267 == 1 then
				local _ = nil
				local var3270, var3271 = protoModule.readBuffer(p116, var3262)
				var3262 = var3271
				var3261.image_asset_id = buffer.tostring(var3270)
			else
				local _ = nil
				local var3272, var3273 = protoModule.readVarInt(p116, var3262)
				var3262 = var3273 + var3272
			end
		elseif var3263 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3274, var3275 = protoModule.readFixed32(p116, var3262)
			local _ = var3274
			var3262 = var3275
		elseif var3263 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3276, var3277 = protoModule.readFixed64(p116, var3262)
			local _ = var3276
			var3262 = var3277
		else
			error("Unsupported wire type: " .. var4726)
		end
	end
	return var3261
end

function t_116:jsonEncode()
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_116:jsonDecode()
	-- upvalues: t_116 (ref)
	local var3278 = t_116.new()
	
	if self.image_asset_id ~= nil then
		var3278.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3278.image_asset_id = self.imageAssetId
	end
	return var3278
end

t_116.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_116
typeRegistryModule.default:register(t.ImageInputData)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p117)
	-- upvalues: t_117 (ref)
	return setmetatable({
		video_asset_id = if p117 == nil or p117.video_asset_id == nil then "" else p117.video_asset_id,
		loading_image_asset_id = if p117 == nil or p117.loading_image_asset_id == nil then "" else p117.loading_image_asset_id,
		max_quality = if p117 == nil or p117.max_quality == nil then "" else p117.max_quality,
		adaptive_resolution = if p117 == nil or p117.adaptive_resolution == nil then false else p117.adaptive_resolution
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3278 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3279, var3280 = protoModule.writeTag(buff, var3278, 1, protoModule.wireTypes.lengthDelimited)
		var3279, var4746 = protoModule.writeString(var3279, var3280, self.video_asset_id)
		buff = var3279
		var3278 = var3280
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var3281, var3282 = protoModule.writeTag(buff, var3278, 2, protoModule.wireTypes.lengthDelimited)
		var3281, var4748 = protoModule.writeString(var3281, var3282, self.loading_image_asset_id)
		buff = var3281
		var3278 = var3282
	end
	if self.max_quality ~= nil and self.max_quality ~= "" then
		local var3283, var3284 = protoModule.writeTag(buff, var3278, 3, protoModule.wireTypes.lengthDelimited)
		var3283, var4750 = protoModule.writeString(var3283, var3284, self.max_quality)
		buff = var3283
		var3278 = var3284
	end
	if self.adaptive_resolution then
		local var3285, var3286 = protoModule.writeTag(buff, var3278, 4, protoModule.wireTypes.varint)
		var3285, var4752 = protoModule.writeVarInt(var3285, var3286, if self.adaptive_resolution then 1 else 0)
		buff = var3285
		var3278 = var3286
	end
	local buff_1 = buffer.create(var3278)
	buffer.copy(buff_1, 0, buff, 0, var3278)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var3278 = t_117.new()
	local var3279 = 0
	while var3279 < buffer.len(p117) do
		local _ = nil
		local var3280 = nil
		local var3281, var3282, var3283 = protoModule.readTag(p117, var3279)
		local var3284 = var3281
		var3280 = var3282
		var3279 = var3283
		
		if var3280 == protoModule.wireTypes.varint then
			if var3284 == 4 then
				local _ = nil
				local var3285, var3286 = protoModule.readVarInt(p117, var3279)
				var3279 = var3286
				var3278.adaptive_resolution = var3285 ~= 0
			else
				local _ = nil
				local var3287, var3288 = protoModule.readVarInt(p117, var3279)
				local _ = var3287
				var3279 = var3288
			end
		end
		if var3280 == protoModule.wireTypes.lengthDelimited then
			if var3284 == 1 then
				local _ = nil
				local var3289, var3290 = protoModule.readBuffer(p117, var3279)
				var3279 = var3290
				var3278.video_asset_id = buffer.tostring(var3289)
			elseif var3284 == 2 then
				local _ = nil
				local var3291, var3292 = protoModule.readBuffer(p117, var3279)
				var3279 = var3292
				var3278.loading_image_asset_id = buffer.tostring(var3291)
			elseif var3284 == 3 then
				local _ = nil
				local var3293, var3294 = protoModule.readBuffer(p117, var3279)
				var3279 = var3294
				var3278.max_quality = buffer.tostring(var3293)
			else
				local _ = nil
				local var3295, var3296 = protoModule.readVarInt(p117, var3279)
				var3279 = var3296 + var3295
			end
		elseif var3280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3297, var3298 = protoModule.readFixed32(p117, var3279)
			local _ = var3297
			var3279 = var3298
		elseif var3280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3299, var3300 = protoModule.readFixed64(p117, var3279)
			local _ = var3299
			var3279 = var3300
		else
			error("Unsupported wire type: " .. var4756)
		end
	end
	return var3278
end

function t_117:jsonEncode()
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

function t_117:jsonDecode()
	-- upvalues: t_117 (ref)
	local var3301 = t_117.new()
	
	if self.video_asset_id ~= nil then
		var3301.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3301.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var3301.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var3301.loading_image_asset_id = self.loadingImageAssetId
	end
	if self.max_quality ~= nil then
		var3301.max_quality = self.max_quality
	end
	if self.maxQuality ~= nil then
		var3301.max_quality = self.maxQuality
	end
	if self.adaptive_resolution ~= nil then
		var3301.adaptive_resolution = self.adaptive_resolution
	end
	if self.adaptiveResolution ~= nil then
		var3301.adaptive_resolution = self.adaptiveResolution
	end
	return var3301
end

t_117.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_117
typeRegistryModule.default:register(t.VideoInputData)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p118)
	-- upvalues: t_118 (ref)
	return setmetatable({
		text = if p118 == nil or p118.text == nil then "" else p118.text,
		is_rendered_text = if p118 == nil or p118.is_rendered_text == nil then false else p118.is_rendered_text,
		url = if p118 == nil or p118.url == nil then "" else p118.url
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3301 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var3302, var3303 = protoModule.writeTag(buff, var3301, 1, protoModule.wireTypes.lengthDelimited)
		var3302, var4782 = protoModule.writeString(var3302, var3303, self.text)
		buff = var3302
		var3301 = var3303
	end
	if self.is_rendered_text then
		local var3304, var3305 = protoModule.writeTag(buff, var3301, 2, protoModule.wireTypes.varint)
		var3304, var4784 = protoModule.writeVarInt(var3304, var3305, if self.is_rendered_text then 1 else 0)
		buff = var3304
		var3301 = var3305
	end
	if self.url ~= nil and self.url ~= "" then
		local var3306, var3307 = protoModule.writeTag(buff, var3301, 3, protoModule.wireTypes.lengthDelimited)
		var3306, var4786 = protoModule.writeString(var3306, var3307, self.url)
		buff = var3306
		var3301 = var3307
	end
	local buff_1 = buffer.create(var3301)
	buffer.copy(buff_1, 0, buff, 0, var3301)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref)
	local var3301 = t_118.new()
	local var3302 = 0
	while var3302 < buffer.len(p118) do
		local _ = nil
		local var3303 = nil
		local var3304, var3305, var3306 = protoModule.readTag(p118, var3302)
		local var3307 = var3304
		var3303 = var3305
		var3302 = var3306
		
		if var3303 == protoModule.wireTypes.varint then
			if var3307 == 2 then
				local _ = nil
				local var3308, var3309 = protoModule.readVarInt(p118, var3302)
				var3302 = var3309
				var3301.is_rendered_text = var3308 ~= 0
			else
				local _ = nil
				local var3310, var3311 = protoModule.readVarInt(p118, var3302)
				local _ = var3310
				var3302 = var3311
			end
		end
		if var3303 == protoModule.wireTypes.lengthDelimited then
			if var3307 == 1 then
				local _ = nil
				local var3312, var3313 = protoModule.readBuffer(p118, var3302)
				var3302 = var3313
				var3301.text = buffer.tostring(var3312)
			elseif var3307 == 3 then
				local _ = nil
				local var3314, var3315 = protoModule.readBuffer(p118, var3302)
				var3302 = var3315
				var3301.url = buffer.tostring(var3314)
			else
				local _ = nil
				local var3316, var3317 = protoModule.readVarInt(p118, var3302)
				var3302 = var3317 + var3316
			end
		elseif var3303 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3318, var3319 = protoModule.readFixed32(p118, var3302)
			local _ = var3318
			var3302 = var3319
		elseif var3303 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3320, var3321 = protoModule.readFixed64(p118, var3302)
			local _ = var3320
			var3302 = var3321
		else
			error("Unsupported wire type: " .. var4790)
		end
	end
	return var3301
end

function t_118:jsonEncode()
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

function t_118:jsonDecode()
	-- upvalues: t_118 (ref)
	local var3322 = t_118.new()
	
	if self.text ~= nil then
		var3322.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var3322.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var3322.is_rendered_text = self.isRenderedText
	end
	if self.url ~= nil then
		var3322.url = self.url
	end
	return var3322
end

t_118.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_118
typeRegistryModule.default:register(t.TextInputData)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p119)
	-- upvalues: t_119 (ref)
	return setmetatable({
		entry_map = if p119 == nil or p119.entry_map == nil then {} else p119.entry_map,
		entry_order = if p119 == nil or p119.entry_order == nil then {} else p119.entry_order,
		entry_order_map = if p119 == nil or p119.entry_order_map == nil then {} else p119.entry_order_map,
		content_pools = if p119 == nil or p119.content_pools == nil then {} else p119.content_pools
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3322 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3323, var3324 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3323, var4814 = protoModule.writeString(var3323, var3324, i)
			local var3325 = v:encode()
			var3324, var4816 = protoModule.writeTag(var3323, var3324, 2, protoModule.wireTypes.lengthDelimited)
			var3324, var4816 = protoModule.writeBuffer(var3324, var4816, var3325, buffer.len(var3325))
			local var3326 = var3324
			local var3327 = var4816
			local var3328, var3329 = protoModule.writeTag(buff, var3322, 1, protoModule.wireTypes.lengthDelimited)
			var3328, var4820 = protoModule.writeBuffer(var3328, var3329, var3326, var3327)
			buff = var3328
			var3322 = var3329
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3330, var3331 = protoModule.writeTag(buff, var3322, 2, protoModule.wireTypes.lengthDelimited)
			var3330, var4822 = protoModule.writeString(var3330, var3331, v)
			buff = var3330
			var3322 = var3331
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var3332, var3333 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3332, var4824 = protoModule.writeString(var3332, var3333, i)
			local var3334 = v:encode()
			var3333, var4826 = protoModule.writeTag(var3332, var3333, 2, protoModule.wireTypes.lengthDelimited)
			var3333, var4826 = protoModule.writeBuffer(var3333, var4826, var3334, buffer.len(var3334))
			local var3335 = var3333
			local var3336 = var4826
			local var3337, var3338 = protoModule.writeTag(buff, var3322, 3, protoModule.wireTypes.lengthDelimited)
			var3337, var4830 = protoModule.writeBuffer(var3337, var3338, var3335, var3336)
			buff = var3337
			var3322 = var3338
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3339, var3340 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3339, var4832 = protoModule.writeString(var3339, var3340, i)
			local var3341 = v:encode()
			var3340, var4834 = protoModule.writeTag(var3339, var3340, 2, protoModule.wireTypes.lengthDelimited)
			var3340, var4834 = protoModule.writeBuffer(var3340, var4834, var3341, buffer.len(var3341))
			local var3342 = var3340
			local var3343 = var4834
			local var3344, var3345 = protoModule.writeTag(buff, var3322, 4, protoModule.wireTypes.lengthDelimited)
			var3344, var4838 = protoModule.writeBuffer(var3344, var3345, var3342, var3343)
			buff = var3344
			var3322 = var3345
		end
	end
	local buff_1 = buffer.create(var3322)
	buffer.copy(buff_1, 0, buff, 0, var3322)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var3346 = t_119.new()
	local var3347 = 0
	while var3347 < buffer.len(p119) do
		local _ = nil
		local var3348 = nil
		local var3349, var3350, var3351 = protoModule.readTag(p119, var3347)
		local var3352 = var3349
		var3348 = var3350
		var3347 = var3351
		
		if var3348 == protoModule.wireTypes.varint then
			local _ = nil
			local var3353, var3354 = protoModule.readVarInt(p119, var3347)
			local _ = var3353
			var3347 = var3354
			continue
		end
		if var3348 == protoModule.wireTypes.lengthDelimited then
			if var3352 == 1 then
				local _ = nil
				local var3355, var3356 = protoModule.readBuffer(p119, var3347)
				var3347 = var3356
				var3355 = t.VerticalFeedInputData_EntryMapEntry.decode(var3355)
				var3346.entry_map[var3355.key or ""] = var3355.value or t.FeedEntry.new()
			elseif var3352 == 2 then
				local _ = nil
				local var3357, var3358 = protoModule.readBuffer(p119, var3347)
				var3347 = var3358
				table.insert(var3346.entry_order, buffer.tostring(var3357))
			elseif var3352 == 3 then
				local _ = nil
				local var3359, var3360 = protoModule.readBuffer(p119, var3347)
				var3347 = var3360
				var3359 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3359)
				var3346.entry_order_map[var3359.key or ""] = var3359.value or t.EntryOrder.new()
			elseif var3352 == 4 then
				local _ = nil
				local var3361, var3362 = protoModule.readBuffer(p119, var3347)
				var3347 = var3362
				var3361 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3361)
				var3346.content_pools[var3361.key or ""] = var3361.value or t.ContentPool.new()
			else
				local _ = nil
				local var3363, var3364 = protoModule.readVarInt(p119, var3347)
				var3347 = var3364 + var3363
			end
		elseif var3348 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3365, var3366 = protoModule.readFixed32(p119, var3347)
			local _ = var3365
			var3347 = var3366
		elseif var3348 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3367, var3368 = protoModule.readFixed64(p119, var3347)
			local _ = var3367
			var3347 = var3368
		else
			error("Unsupported wire type: " .. var4842)
		end
	end
	return var3346
end

function t_119:jsonEncode()
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

function t_119:jsonDecode()
	-- upvalues: t_119 (ref), t (ref)
	local var3369 = t_119.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3369.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3369.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3369.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3369.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3369.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3369.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3369.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3369.content_pools = t_1
	end
	return var3369
end

t_119.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_119
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		key = if p120 == nil or p120.key == nil then "" else p120.key,
		value = if p120 == nil or p120.value == nil then nil else p120.value
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3370 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3371, var3372 = protoModule.writeTag(buff, var3370, 1, protoModule.wireTypes.lengthDelimited)
		var3371, var4880 = protoModule.writeString(var3371, var3372, self.key)
		buff = var3371
		var3370 = var3372
	end
	if self.value ~= nil then
		local var3373 = self.value:encode()
		local var3374, var3375 = protoModule.writeTag(buff, var3370, 2, protoModule.wireTypes.lengthDelimited)
		var3374, var4883 = protoModule.writeBuffer(var3374, var3375, var3373, buffer.len(var3373))
		buff = var3374
		var3370 = var3375
	end
	local buff_1 = buffer.create(var3370)
	buffer.copy(buff_1, 0, buff, 0, var3370)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref), t (ref)
	local var3370 = t_120.new()
	local var3371 = 0
	while var3371 < buffer.len(p120) do
		local _ = nil
		local var3372 = nil
		local var3373, var3374, var3375 = protoModule.readTag(p120, var3371)
		local var3376 = var3373
		var3372 = var3374
		var3371 = var3375
		
		if var3372 == protoModule.wireTypes.varint then
			local _ = nil
			local var3377, var3378 = protoModule.readVarInt(p120, var3371)
			local _ = var3377
			var3371 = var3378
			continue
		end
		if var3372 == protoModule.wireTypes.lengthDelimited then
			if var3376 == 1 then
				local _ = nil
				local var3379, var3380 = protoModule.readBuffer(p120, var3371)
				var3371 = var3380
				var3370.key = buffer.tostring(var3379)
			elseif var3376 == 2 then
				local _ = nil
				local var3381, var3382 = protoModule.readBuffer(p120, var3371)
				var3371 = var3382
				var3370.value = t.FeedEntry.decode(var3381)
			else
				local _ = nil
				local var3383, var3384 = protoModule.readVarInt(p120, var3371)
				var3371 = var3384 + var3383
			end
		elseif var3372 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3385, var3386 = protoModule.readFixed32(p120, var3371)
			local _ = var3385
			var3371 = var3386
		elseif var3372 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3387, var3388 = protoModule.readFixed64(p120, var3371)
			local _ = var3387
			var3371 = var3388
		else
			error("Unsupported wire type: " .. var4887)
		end
	end
	return var3370
end

function t_120:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_120:jsonDecode()
	-- upvalues: t_120 (ref), t (ref)
	local var3389 = t_120.new()
	
	if self.key ~= nil then
		var3389.key = self.key
	end
	if self.value ~= nil then
		var3389.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3389
end

t_120.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_120
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p121)
	-- upvalues: t_121 (ref)
	return setmetatable({
		key = if p121 == nil or p121.key == nil then "" else p121.key,
		value = if p121 == nil or p121.value == nil then nil else p121.value
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3389 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3390, var3391 = protoModule.writeTag(buff, var3389, 1, protoModule.wireTypes.lengthDelimited)
		var3390, var4909 = protoModule.writeString(var3390, var3391, self.key)
		buff = var3390
		var3389 = var3391
	end
	if self.value ~= nil then
		local var3392 = self.value:encode()
		local var3393, var3394 = protoModule.writeTag(buff, var3389, 2, protoModule.wireTypes.lengthDelimited)
		var3393, var4912 = protoModule.writeBuffer(var3393, var3394, var3392, buffer.len(var3392))
		buff = var3393
		var3389 = var3394
	end
	local buff_1 = buffer.create(var3389)
	buffer.copy(buff_1, 0, buff, 0, var3389)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var3389 = t_121.new()
	local var3390 = 0
	while var3390 < buffer.len(p121) do
		local _ = nil
		local var3391 = nil
		local var3392, var3393, var3394 = protoModule.readTag(p121, var3390)
		local var3395 = var3392
		var3391 = var3393
		var3390 = var3394
		
		if var3391 == protoModule.wireTypes.varint then
			local _ = nil
			local var3396, var3397 = protoModule.readVarInt(p121, var3390)
			local _ = var3396
			var3390 = var3397
			continue
		end
		if var3391 == protoModule.wireTypes.lengthDelimited then
			if var3395 == 1 then
				local _ = nil
				local var3398, var3399 = protoModule.readBuffer(p121, var3390)
				var3390 = var3399
				var3389.key = buffer.tostring(var3398)
			elseif var3395 == 2 then
				local _ = nil
				local var3400, var3401 = protoModule.readBuffer(p121, var3390)
				var3390 = var3401
				var3389.value = t.EntryOrder.decode(var3400)
			else
				local _ = nil
				local var3402, var3403 = protoModule.readVarInt(p121, var3390)
				var3390 = var3403 + var3402
			end
		elseif var3391 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3404, var3405 = protoModule.readFixed32(p121, var3390)
			local _ = var3404
			var3390 = var3405
		elseif var3391 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3406, var3407 = protoModule.readFixed64(p121, var3390)
			local _ = var3406
			var3390 = var3407
		else
			error("Unsupported wire type: " .. var4916)
		end
	end
	return var3389
end

function t_121:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_121:jsonDecode()
	-- upvalues: t_121 (ref), t (ref)
	local var3408 = t_121.new()
	
	if self.key ~= nil then
		var3408.key = self.key
	end
	if self.value ~= nil then
		var3408.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3408
end

t_121.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_121
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p122)
	-- upvalues: t_122 (ref)
	return setmetatable({
		key = if p122 == nil or p122.key == nil then "" else p122.key,
		value = if p122 == nil or p122.value == nil then nil else p122.value
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3408 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3409, var3410 = protoModule.writeTag(buff, var3408, 1, protoModule.wireTypes.lengthDelimited)
		var3409, var4938 = protoModule.writeString(var3409, var3410, self.key)
		buff = var3409
		var3408 = var3410
	end
	if self.value ~= nil then
		local var3411 = self.value:encode()
		local var3412, var3413 = protoModule.writeTag(buff, var3408, 2, protoModule.wireTypes.lengthDelimited)
		var3412, var4941 = protoModule.writeBuffer(var3412, var3413, var3411, buffer.len(var3411))
		buff = var3412
		var3408 = var3413
	end
	local buff_1 = buffer.create(var3408)
	buffer.copy(buff_1, 0, buff, 0, var3408)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3408 = t_122.new()
	local var3409 = 0
	while var3409 < buffer.len(p122) do
		local _ = nil
		local var3410 = nil
		local var3411, var3412, var3413 = protoModule.readTag(p122, var3409)
		local var3414 = var3411
		var3410 = var3412
		var3409 = var3413
		
		if var3410 == protoModule.wireTypes.varint then
			local _ = nil
			local var3415, var3416 = protoModule.readVarInt(p122, var3409)
			local _ = var3415
			var3409 = var3416
			continue
		end
		if var3410 == protoModule.wireTypes.lengthDelimited then
			if var3414 == 1 then
				local _ = nil
				local var3417, var3418 = protoModule.readBuffer(p122, var3409)
				var3409 = var3418
				var3408.key = buffer.tostring(var3417)
			elseif var3414 == 2 then
				local _ = nil
				local var3419, var3420 = protoModule.readBuffer(p122, var3409)
				var3409 = var3420
				var3408.value = t.ContentPool.decode(var3419)
			else
				local _ = nil
				local var3421, var3422 = protoModule.readVarInt(p122, var3409)
				var3409 = var3422 + var3421
			end
		elseif var3410 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3423, var3424 = protoModule.readFixed32(p122, var3409)
			local _ = var3423
			var3409 = var3424
		elseif var3410 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3425, var3426 = protoModule.readFixed64(p122, var3409)
			local _ = var3425
			var3409 = var3426
		else
			error("Unsupported wire type: " .. var4945)
		end
	end
	return var3408
end

function t_122:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_122:jsonDecode()
	-- upvalues: t_122 (ref), t (ref)
	local var3427 = t_122.new()
	
	if self.key ~= nil then
		var3427.key = self.key
	end
	if self.value ~= nil then
		var3427.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3427
end

t_122.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_122
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p123)
	-- upvalues: t_123 (ref)
	return setmetatable({
		foreground_header_entry = if p123 == nil or p123.foreground_header_entry == nil then nil else p123.foreground_header_entry,
		background_header_entry = if p123 == nil or p123.background_header_entry == nil then nil else p123.background_header_entry,
		layout_variant = if p123 == nil or p123.layout_variant == nil then "" else p123.layout_variant
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3427 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3428 = self.foreground_header_entry:encode()
		local var3429, var3430 = protoModule.writeTag(buff, var3427, 1, protoModule.wireTypes.lengthDelimited)
		var3429, var4968 = protoModule.writeBuffer(var3429, var3430, var3428, buffer.len(var3428))
		buff = var3429
		var3427 = var3430
	end
	if self.background_header_entry ~= nil then
		local var3431 = self.background_header_entry:encode()
		local var3432, var3433 = protoModule.writeTag(buff, var3427, 2, protoModule.wireTypes.lengthDelimited)
		var3432, var4971 = protoModule.writeBuffer(var3432, var3433, var3431, buffer.len(var3431))
		buff = var3432
		var3427 = var3433
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3434, var3435 = protoModule.writeTag(buff, var3427, 3, protoModule.wireTypes.lengthDelimited)
		var3434, var4973 = protoModule.writeString(var3434, var3435, self.layout_variant)
		buff = var3434
		var3427 = var3435
	end
	local buff_1 = buffer.create(var3427)
	buffer.copy(buff_1, 0, buff, 0, var3427)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref), t (ref)
	local var3427 = t_123.new()
	local var3428 = 0
	while var3428 < buffer.len(p123) do
		local _ = nil
		local var3429 = nil
		local var3430, var3431, var3432 = protoModule.readTag(p123, var3428)
		local var3433 = var3430
		var3429 = var3431
		var3428 = var3432
		
		if var3429 == protoModule.wireTypes.varint then
			local _ = nil
			local var3434, var3435 = protoModule.readVarInt(p123, var3428)
			local _ = var3434
			var3428 = var3435
			continue
		end
		if var3429 == protoModule.wireTypes.lengthDelimited then
			if var3433 == 1 then
				local _ = nil
				local var3436, var3437 = protoModule.readBuffer(p123, var3428)
				var3428 = var3437
				var3427.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3436)
			elseif var3433 == 2 then
				local _ = nil
				local var3438, var3439 = protoModule.readBuffer(p123, var3428)
				var3428 = var3439
				var3427.background_header_entry = t.BackgroundHeaderEntry.decode(var3438)
			elseif var3433 == 3 then
				local _ = nil
				local var3440, var3441 = protoModule.readBuffer(p123, var3428)
				var3428 = var3441
				var3427.layout_variant = buffer.tostring(var3440)
			else
				local _ = nil
				local var3442, var3443 = protoModule.readVarInt(p123, var3428)
				var3428 = var3443 + var3442
			end
		elseif var3429 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3444, var3445 = protoModule.readFixed32(p123, var3428)
			local _ = var3444
			var3428 = var3445
		elseif var3429 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3446, var3447 = protoModule.readFixed64(p123, var3428)
			local _ = var3446
			var3428 = var3447
		else
			error("Unsupported wire type: " .. var4977)
		end
	end
	return var3427
end

function t_123:jsonEncode()
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

function t_123:jsonDecode()
	-- upvalues: t_123 (ref), t (ref)
	local var3448 = t_123.new()
	
	if self.foreground_header_entry ~= nil then
		var3448.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3448.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3448.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3448.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3448.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3448.layout_variant = self.layoutVariant
	end
	return var3448
end

t_123.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_123
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p124)
	-- upvalues: t_124 (ref)
	return setmetatable({
		cta_button_text = if p124 == nil or p124.cta_button_text == nil then "" else p124.cta_button_text,
		cta_type = if p124 == nil or p124.cta_type == nil then "" else p124.cta_type
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3448 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3449, var3450 = protoModule.writeTag(buff, var3448, 1, protoModule.wireTypes.lengthDelimited)
		var3449, var5001 = protoModule.writeString(var3449, var3450, self.cta_button_text)
		buff = var3449
		var3448 = var3450
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3451, var3452 = protoModule.writeTag(buff, var3448, 2, protoModule.wireTypes.lengthDelimited)
		var3451, var5003 = protoModule.writeString(var3451, var3452, self.cta_type)
		buff = var3451
		var3448 = var3452
	end
	local buff_1 = buffer.create(var3448)
	buffer.copy(buff_1, 0, buff, 0, var3448)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref)
	local var3448 = t_124.new()
	local var3449 = 0
	while var3449 < buffer.len(p124) do
		local _ = nil
		local var3450 = nil
		local var3451, var3452, var3453 = protoModule.readTag(p124, var3449)
		local var3454 = var3451
		var3450 = var3452
		var3449 = var3453
		
		if var3450 == protoModule.wireTypes.varint then
			local _ = nil
			local var3455, var3456 = protoModule.readVarInt(p124, var3449)
			local _ = var3455
			var3449 = var3456
			continue
		end
		if var3450 == protoModule.wireTypes.lengthDelimited then
			if var3454 == 1 then
				local _ = nil
				local var3457, var3458 = protoModule.readBuffer(p124, var3449)
				var3449 = var3458
				var3448.cta_button_text = buffer.tostring(var3457)
			elseif var3454 == 2 then
				local _ = nil
				local var3459, var3460 = protoModule.readBuffer(p124, var3449)
				var3449 = var3460
				var3448.cta_type = buffer.tostring(var3459)
			else
				local _ = nil
				local var3461, var3462 = protoModule.readVarInt(p124, var3449)
				var3449 = var3462 + var3461
			end
		elseif var3450 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3463, var3464 = protoModule.readFixed32(p124, var3449)
			local _ = var3463
			var3449 = var3464
		elseif var3450 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3465, var3466 = protoModule.readFixed64(p124, var3449)
			local _ = var3465
			var3449 = var3466
		else
			error("Unsupported wire type: " .. var5007)
		end
	end
	return var3448
end

function t_124:jsonEncode()
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_124:jsonDecode()
	-- upvalues: t_124 (ref)
	local var3467 = t_124.new()
	
	if self.cta_button_text ~= nil then
		var3467.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3467.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3467.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3467.cta_type = self.ctaType
	end
	return var3467
end

t_124.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_124
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p125)
	-- upvalues: t_125 (ref)
	return setmetatable({
		title = if p125 == nil or p125.title == nil then "" else p125.title,
		cta_button_text = if p125 == nil or p125.cta_button_text == nil then "" else p125.cta_button_text,
		image_asset_id = if p125 == nil or p125.image_asset_id == nil then "" else p125.image_asset_id,
		cta_type = if p125 == nil or p125.cta_type == nil then "" else p125.cta_type
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3467 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3468, var3469 = protoModule.writeTag(buff, var3467, 1, protoModule.wireTypes.lengthDelimited)
		var3468, var5029 = protoModule.writeString(var3468, var3469, self.title)
		buff = var3468
		var3467 = var3469
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3470, var3471 = protoModule.writeTag(buff, var3467, 2, protoModule.wireTypes.lengthDelimited)
		var3470, var5031 = protoModule.writeString(var3470, var3471, self.cta_button_text)
		buff = var3470
		var3467 = var3471
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3472, var3473 = protoModule.writeTag(buff, var3467, 3, protoModule.wireTypes.lengthDelimited)
		var3472, var5033 = protoModule.writeString(var3472, var3473, self.image_asset_id)
		buff = var3472
		var3467 = var3473
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3474, var3475 = protoModule.writeTag(buff, var3467, 4, protoModule.wireTypes.lengthDelimited)
		var3474, var5035 = protoModule.writeString(var3474, var3475, self.cta_type)
		buff = var3474
		var3467 = var3475
	end
	local buff_1 = buffer.create(var3467)
	buffer.copy(buff_1, 0, buff, 0, var3467)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref)
	local var3467 = t_125.new()
	local var3468 = 0
	while var3468 < buffer.len(p125) do
		local _ = nil
		local var3469 = nil
		local var3470, var3471, var3472 = protoModule.readTag(p125, var3468)
		local var3473 = var3470
		var3469 = var3471
		var3468 = var3472
		
		if var3469 == protoModule.wireTypes.varint then
			local _ = nil
			local var3474, var3475 = protoModule.readVarInt(p125, var3468)
			local _ = var3474
			var3468 = var3475
			continue
		end
		if var3469 == protoModule.wireTypes.lengthDelimited then
			if var3473 == 1 then
				local _ = nil
				local var3476, var3477 = protoModule.readBuffer(p125, var3468)
				var3468 = var3477
				var3467.title = buffer.tostring(var3476)
			elseif var3473 == 2 then
				local _ = nil
				local var3478, var3479 = protoModule.readBuffer(p125, var3468)
				var3468 = var3479
				var3467.cta_button_text = buffer.tostring(var3478)
			elseif var3473 == 3 then
				local _ = nil
				local var3480, var3481 = protoModule.readBuffer(p125, var3468)
				var3468 = var3481
				var3467.image_asset_id = buffer.tostring(var3480)
			elseif var3473 == 4 then
				local _ = nil
				local var3482, var3483 = protoModule.readBuffer(p125, var3468)
				var3468 = var3483
				var3467.cta_type = buffer.tostring(var3482)
			else
				local _ = nil
				local var3484, var3485 = protoModule.readVarInt(p125, var3468)
				var3468 = var3485 + var3484
			end
		elseif var3469 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3486, var3487 = protoModule.readFixed32(p125, var3468)
			local _ = var3486
			var3468 = var3487
		elseif var3469 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3488, var3489 = protoModule.readFixed64(p125, var3468)
			local _ = var3488
			var3468 = var3489
		else
			error("Unsupported wire type: " .. var5039)
		end
	end
	return var3467
end

function t_125:jsonEncode()
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

function t_125:jsonDecode()
	-- upvalues: t_125 (ref)
	local var3490 = t_125.new()
	
	if self.title ~= nil then
		var3490.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3490.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3490.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3490.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3490.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3490.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3490.cta_type = self.ctaType
	end
	return var3490
end

t_125.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_125
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p126)
	-- upvalues: t_126 (ref)
	return setmetatable({
		title = if p126 == nil or p126.title == nil then "" else p126.title,
		url = if p126 == nil or p126.url == nil then nil else p126.url,
		destination = if p126 == nil or p126.destination == nil then nil else p126.destination,
		row_id = if p126 == nil or p126.row_id == nil then "" else p126.row_id
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3490 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3491, var3492 = protoModule.writeTag(buff, var3490, 1, protoModule.wireTypes.lengthDelimited)
		var3491, var5065 = protoModule.writeString(var3491, var3492, self.title)
		buff = var3491
		var3490 = var3492
	end
	if self.url ~= nil then
		local var3493, var3494 = protoModule.writeTag(buff, var3490, 2, protoModule.wireTypes.lengthDelimited)
		var3493, var5067 = protoModule.writeString(var3493, var3494, self.url)
		buff = var3493
		var3490 = var3494
	end
	if self.destination ~= nil then
		local var3495, var3496 = protoModule.writeTag(buff, var3490, 3, protoModule.wireTypes.lengthDelimited)
		var3495, var5069 = protoModule.writeString(var3495, var3496, self.destination)
		buff = var3495
		var3490 = var3496
	end
	if self.row_id ~= nil and self.row_id ~= "" then
		local var3497, var3498 = protoModule.writeTag(buff, var3490, 4, protoModule.wireTypes.lengthDelimited)
		var3497, var5071 = protoModule.writeString(var3497, var3498, self.row_id)
		buff = var3497
		var3490 = var3498
	end
	local buff_1 = buffer.create(var3490)
	buffer.copy(buff_1, 0, buff, 0, var3490)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3490 = t_126.new()
	local var3491 = 0
	while var3491 < buffer.len(p126) do
		local _ = nil
		local var3492 = nil
		local var3493, var3494, var3495 = protoModule.readTag(p126, var3491)
		local var3496 = var3493
		var3492 = var3494
		var3491 = var3495
		
		if var3492 == protoModule.wireTypes.varint then
			local _ = nil
			local var3497, var3498 = protoModule.readVarInt(p126, var3491)
			local _ = var3497
			var3491 = var3498
			continue
		end
		if var3492 == protoModule.wireTypes.lengthDelimited then
			if var3496 == 1 then
				local _ = nil
				local var3499, var3500 = protoModule.readBuffer(p126, var3491)
				var3491 = var3500
				var3490.title = buffer.tostring(var3499)
			elseif var3496 == 2 then
				local _ = nil
				local var3501, var3502 = protoModule.readBuffer(p126, var3491)
				var3491 = var3502
				var3490.url = buffer.tostring(var3501)
			elseif var3496 == 3 then
				local _ = nil
				local var3503, var3504 = protoModule.readBuffer(p126, var3491)
				var3491 = var3504
				var3490.destination = buffer.tostring(var3503)
			elseif var3496 == 4 then
				local _ = nil
				local var3505, var3506 = protoModule.readBuffer(p126, var3491)
				var3491 = var3506
				var3490.row_id = buffer.tostring(var3505)
			else
				local _ = nil
				local var3507, var3508 = protoModule.readVarInt(p126, var3491)
				var3491 = var3508 + var3507
			end
		elseif var3492 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3509, var3510 = protoModule.readFixed32(p126, var3491)
			local _ = var3509
			var3491 = var3510
		elseif var3492 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3511, var3512 = protoModule.readFixed64(p126, var3491)
			local _ = var3511
			var3491 = var3512
		else
			error("Unsupported wire type: " .. var5075)
		end
	end
	return var3490
end

function t_126:jsonEncode()
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

function t_126:jsonDecode()
	-- upvalues: t_126 (ref)
	local var3513 = t_126.new()
	
	if self.title ~= nil then
		var3513.title = self.title
	end
	if self.url ~= nil then
		var3513.url = self.url
	end
	if self.destination ~= nil then
		var3513.destination = self.destination
	end
	if self.row_id ~= nil then
		var3513.row_id = self.row_id
	end
	if self.rowId ~= nil then
		var3513.row_id = self.rowId
	end
	return var3513
end

t_126.descriptor = {
	name = "SettingsRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsRowInputData"
}
t.SettingsRowInputData = t_126
typeRegistryModule.default:register(t.SettingsRowInputData)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p127)
	-- upvalues: t_127 (ref)
	return setmetatable({
		setting_key = if p127 == nil or p127.setting_key == nil then "" else p127.setting_key,
		label = if p127 == nil or p127.label == nil then "" else p127.label,
		description = if p127 == nil or p127.description == nil then "" else p127.description,
		is_checked = if p127 == nil or p127.is_checked == nil then false else p127.is_checked,
		is_disabled = if p127 == nil or p127.is_disabled == nil then false else p127.is_disabled,
		audit_data = if p127 == nil or p127.audit_data == nil then "" else p127.audit_data
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3513 = 0
	
	if self.setting_key ~= nil and self.setting_key ~= "" then
		local var3514, var3515 = protoModule.writeTag(buff, var3513, 1, protoModule.wireTypes.lengthDelimited)
		var3514, var5101 = protoModule.writeString(var3514, var3515, self.setting_key)
		buff = var3514
		var3513 = var3515
	end
	if self.label ~= nil and self.label ~= "" then
		local var3516, var3517 = protoModule.writeTag(buff, var3513, 2, protoModule.wireTypes.lengthDelimited)
		var3516, var5103 = protoModule.writeString(var3516, var3517, self.label)
		buff = var3516
		var3513 = var3517
	end
	if self.description ~= nil and self.description ~= "" then
		local var3518, var3519 = protoModule.writeTag(buff, var3513, 3, protoModule.wireTypes.lengthDelimited)
		var3518, var5105 = protoModule.writeString(var3518, var3519, self.description)
		buff = var3518
		var3513 = var3519
	end
	if self.is_checked then
		local var3520, var3521 = protoModule.writeTag(buff, var3513, 4, protoModule.wireTypes.varint)
		var3520, var5107 = protoModule.writeVarInt(var3520, var3521, if self.is_checked then 1 else 0)
		buff = var3520
		var3513 = var3521
	end
	if self.is_disabled then
		local var3522, var3523 = protoModule.writeTag(buff, var3513, 5, protoModule.wireTypes.varint)
		var3522, var5109 = protoModule.writeVarInt(var3522, var3523, if self.is_disabled then 1 else 0)
		buff = var3522
		var3513 = var3523
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var3524, var3525 = protoModule.writeTag(buff, var3513, 6, protoModule.wireTypes.lengthDelimited)
		var3524, var5111 = protoModule.writeString(var3524, var3525, self.audit_data)
		buff = var3524
		var3513 = var3525
	end
	local buff_1 = buffer.create(var3513)
	buffer.copy(buff_1, 0, buff, 0, var3513)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3513 = t_127.new()
	local var3514 = 0
	while var3514 < buffer.len(p127) do
		local _ = nil
		local var3515 = nil
		local var3516, var3517, var3518 = protoModule.readTag(p127, var3514)
		local var3519 = var3516
		var3515 = var3517
		var3514 = var3518
		
		if var3515 == protoModule.wireTypes.varint then
			if var3519 == 4 then
				local _ = nil
				local var3520, var3521 = protoModule.readVarInt(p127, var3514)
				var3514 = var3521
				var3513.is_checked = var3520 ~= 0
			elseif var3519 == 5 then
				local _ = nil
				local var3522, var3523 = protoModule.readVarInt(p127, var3514)
				var3514 = var3523
				var3513.is_disabled = var3522 ~= 0
			else
				local _ = nil
				local var3524, var3525 = protoModule.readVarInt(p127, var3514)
				local _ = var3524
				var3514 = var3525
			end
		end
		if var3515 == protoModule.wireTypes.lengthDelimited then
			if var3519 == 1 then
				local _ = nil
				local var3526, var3527 = protoModule.readBuffer(p127, var3514)
				var3514 = var3527
				var3513.setting_key = buffer.tostring(var3526)
			elseif var3519 == 2 then
				local _ = nil
				local var3528, var3529 = protoModule.readBuffer(p127, var3514)
				var3514 = var3529
				var3513.label = buffer.tostring(var3528)
			elseif var3519 == 3 then
				local _ = nil
				local var3530, var3531 = protoModule.readBuffer(p127, var3514)
				var3514 = var3531
				var3513.description = buffer.tostring(var3530)
			elseif var3519 == 6 then
				local _ = nil
				local var3532, var3533 = protoModule.readBuffer(p127, var3514)
				var3514 = var3533
				var3513.audit_data = buffer.tostring(var3532)
			else
				local _ = nil
				local var3534, var3535 = protoModule.readVarInt(p127, var3514)
				var3514 = var3535 + var3534
			end
		elseif var3515 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3536, var3537 = protoModule.readFixed32(p127, var3514)
			local _ = var3536
			var3514 = var3537
		elseif var3515 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3538, var3539 = protoModule.readFixed64(p127, var3514)
			local _ = var3538
			var3514 = var3539
		else
			error("Unsupported wire type: " .. var5115)
		end
	end
	return var3513
end

function t_127:jsonEncode()
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

function t_127:jsonDecode()
	-- upvalues: t_127 (ref)
	local var3540 = t_127.new()
	
	if self.setting_key ~= nil then
		var3540.setting_key = self.setting_key
	end
	if self.settingKey ~= nil then
		var3540.setting_key = self.settingKey
	end
	if self.label ~= nil then
		var3540.label = self.label
	end
	if self.description ~= nil then
		var3540.description = self.description
	end
	if self.is_checked ~= nil then
		var3540.is_checked = self.is_checked
	end
	if self.isChecked ~= nil then
		var3540.is_checked = self.isChecked
	end
	if self.is_disabled ~= nil then
		var3540.is_disabled = self.is_disabled
	end
	if self.isDisabled ~= nil then
		var3540.is_disabled = self.isDisabled
	end
	if self.audit_data ~= nil then
		var3540.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var3540.audit_data = self.auditData
	end
	return var3540
end

t_127.descriptor = {
	name = "SettingsToggleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SettingsToggleInputData"
}
t.SettingsToggleInputData = t_127
typeRegistryModule.default:register(t.SettingsToggleInputData)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p128)
	-- upvalues: t_128 (ref)
	return setmetatable({
		universe_id = if p128 == nil or p128.universe_id == nil then nil else p128.universe_id,
		title = if p128 == nil or p128.title == nil then nil else p128.title,
		subtitle = if p128 == nil or p128.subtitle == nil then nil else p128.subtitle,
		badge_text = if p128 == nil or p128.badge_text == nil then nil else p128.badge_text,
		foreground = if p128 == nil or p128.foreground == nil then nil else p128.foreground,
		background = if p128 == nil or p128.background == nil then nil else p128.background,
		title_image = if p128 == nil or p128.title_image == nil then nil else p128.title_image,
		asset_title = if p128 == nil or p128.asset_title == nil then nil else p128.asset_title,
		asset_subtitle = if p128 == nil or p128.asset_subtitle == nil then nil else p128.asset_subtitle,
		gradient = if p128 == nil or p128.gradient == nil then nil else p128.gradient,
		playable_text = if p128 == nil or p128.playable_text == nil then nil else p128.playable_text,
		collection_id = if p128 == nil or p128.collection_id == nil then nil else p128.collection_id,
		campaign_id = if p128 == nil or p128.campaign_id == nil then nil else p128.campaign_id,
		cohort_id = if p128 == nil or p128.cohort_id == nil then nil else p128.cohort_id,
		sort_id = if p128 == nil or p128.sort_id == nil then nil else p128.sort_id,
		hero_unit_id = if p128 == nil or p128.hero_unit_id == nil then nil else p128.hero_unit_id,
		analytics_id = if p128 == nil or p128.analytics_id == nil then nil else p128.analytics_id,
		is_sponsored = if p128 == nil or p128.is_sponsored == nil then nil else p128.is_sponsored
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3540 = 0
	
	if self.universe_id ~= nil then
		local var3541, var3542 = protoModule.writeTag(buff, var3540, 1, protoModule.wireTypes.lengthDelimited)
		var3541, var5145 = protoModule.writeString(var3541, var3542, self.universe_id)
		buff = var3541
		var3540 = var3542
	end
	if self.title ~= nil then
		local var3543, var3544 = protoModule.writeTag(buff, var3540, 2, protoModule.wireTypes.lengthDelimited)
		var3543, var5147 = protoModule.writeString(var3543, var3544, self.title)
		buff = var3543
		var3540 = var3544
	end
	if self.subtitle ~= nil then
		local var3545, var3546 = protoModule.writeTag(buff, var3540, 3, protoModule.wireTypes.lengthDelimited)
		var3545, var5149 = protoModule.writeString(var3545, var3546, self.subtitle)
		buff = var3545
		var3540 = var3546
	end
	if self.badge_text ~= nil then
		local var3547, var3548 = protoModule.writeTag(buff, var3540, 4, protoModule.wireTypes.lengthDelimited)
		var3547, var5151 = protoModule.writeString(var3547, var3548, self.badge_text)
		buff = var3547
		var3540 = var3548
	end
	if self.foreground ~= nil then
		local var3549 = self.foreground:encode()
		local var3550, var3551 = protoModule.writeTag(buff, var3540, 5, protoModule.wireTypes.lengthDelimited)
		var3550, var5154 = protoModule.writeBuffer(var3550, var3551, var3549, buffer.len(var3549))
		buff = var3550
		var3540 = var3551
	end
	if self.background ~= nil then
		local var3552 = self.background:encode()
		local var3553, var3554 = protoModule.writeTag(buff, var3540, 6, protoModule.wireTypes.lengthDelimited)
		var3553, var5157 = protoModule.writeBuffer(var3553, var3554, var3552, buffer.len(var3552))
		buff = var3553
		var3540 = var3554
	end
	if self.title_image ~= nil then
		local var3555 = self.title_image:encode()
		local var3556, var3557 = protoModule.writeTag(buff, var3540, 7, protoModule.wireTypes.lengthDelimited)
		var3556, var5160 = protoModule.writeBuffer(var3556, var3557, var3555, buffer.len(var3555))
		buff = var3556
		var3540 = var3557
	end
	if self.asset_title ~= nil then
		local var3558, var3559 = protoModule.writeTag(buff, var3540, 8, protoModule.wireTypes.lengthDelimited)
		var3558, var5162 = protoModule.writeString(var3558, var3559, self.asset_title)
		buff = var3558
		var3540 = var3559
	end
	if self.asset_subtitle ~= nil then
		local var3560, var3561 = protoModule.writeTag(buff, var3540, 9, protoModule.wireTypes.lengthDelimited)
		var3560, var5164 = protoModule.writeString(var3560, var3561, self.asset_subtitle)
		buff = var3560
		var3540 = var3561
	end
	if self.gradient ~= nil then
		local var3562 = self.gradient:encode()
		local var3563, var3564 = protoModule.writeTag(buff, var3540, 10, protoModule.wireTypes.lengthDelimited)
		var3563, var5167 = protoModule.writeBuffer(var3563, var3564, var3562, buffer.len(var3562))
		buff = var3563
		var3540 = var3564
	end
	if self.playable_text ~= nil then
		local var3565, var3566 = protoModule.writeTag(buff, var3540, 11, protoModule.wireTypes.lengthDelimited)
		var3565, var5169 = protoModule.writeString(var3565, var3566, self.playable_text)
		buff = var3565
		var3540 = var3566
	end
	if self.collection_id ~= nil then
		local var3567, var3568 = protoModule.writeTag(buff, var3540, 12, protoModule.wireTypes.lengthDelimited)
		var3567, var5171 = protoModule.writeString(var3567, var3568, self.collection_id)
		buff = var3567
		var3540 = var3568
	end
	if self.campaign_id ~= nil then
		local var3569, var3570 = protoModule.writeTag(buff, var3540, 13, protoModule.wireTypes.lengthDelimited)
		var3569, var5173 = protoModule.writeString(var3569, var3570, self.campaign_id)
		buff = var3569
		var3540 = var3570
	end
	if self.cohort_id ~= nil then
		local var3571, var3572 = protoModule.writeTag(buff, var3540, 14, protoModule.wireTypes.lengthDelimited)
		var3571, var5175 = protoModule.writeString(var3571, var3572, self.cohort_id)
		buff = var3571
		var3540 = var3572
	end
	if self.sort_id ~= nil then
		local var3573, var3574 = protoModule.writeTag(buff, var3540, 15, protoModule.wireTypes.lengthDelimited)
		var3573, var5177 = protoModule.writeString(var3573, var3574, self.sort_id)
		buff = var3573
		var3540 = var3574
	end
	if self.hero_unit_id ~= nil then
		local var3575, var3576 = protoModule.writeTag(buff, var3540, 16, protoModule.wireTypes.lengthDelimited)
		var3575, var5179 = protoModule.writeString(var3575, var3576, self.hero_unit_id)
		buff = var3575
		var3540 = var3576
	end
	if self.analytics_id ~= nil then
		local var3577, var3578 = protoModule.writeTag(buff, var3540, 17, protoModule.wireTypes.lengthDelimited)
		var3577, var5181 = protoModule.writeString(var3577, var3578, self.analytics_id)
		buff = var3577
		var3540 = var3578
	end
	if self.is_sponsored ~= nil then
		local var3579, var3580 = protoModule.writeTag(buff, var3540, 18, protoModule.wireTypes.varint)
		var3579, var5183 = protoModule.writeVarInt(var3579, var3580, if self.is_sponsored then 1 else 0)
		buff = var3579
		var3540 = var3580
	end
	local buff_1 = buffer.create(var3540)
	buffer.copy(buff_1, 0, buff, 0, var3540)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var3540 = t_128.new()
	local var3541 = 0
	while var3541 < buffer.len(p128) do
		local _ = nil
		local var3542 = nil
		local var3543, var3544, var3545 = protoModule.readTag(p128, var3541)
		local var3546 = var3543
		var3542 = var3544
		var3541 = var3545
		
		if var3542 == protoModule.wireTypes.varint then
			if var3546 == 18 then
				local _ = nil
				local var3547, var3548 = protoModule.readVarInt(p128, var3541)
				var3541 = var3548
				var3540.is_sponsored = var3547 ~= 0
			else
				local _ = nil
				local var3549, var3550 = protoModule.readVarInt(p128, var3541)
				local _ = var3549
				var3541 = var3550
			end
		end
		if var3542 == protoModule.wireTypes.lengthDelimited then
			if var3546 == 1 then
				local _ = nil
				local var3551, var3552 = protoModule.readBuffer(p128, var3541)
				var3541 = var3552
				var3540.universe_id = buffer.tostring(var3551)
			elseif var3546 == 2 then
				local _ = nil
				local var3553, var3554 = protoModule.readBuffer(p128, var3541)
				var3541 = var3554
				var3540.title = buffer.tostring(var3553)
			elseif var3546 == 3 then
				local _ = nil
				local var3555, var3556 = protoModule.readBuffer(p128, var3541)
				var3541 = var3556
				var3540.subtitle = buffer.tostring(var3555)
			elseif var3546 == 4 then
				local _ = nil
				local var3557, var3558 = protoModule.readBuffer(p128, var3541)
				var3541 = var3558
				var3540.badge_text = buffer.tostring(var3557)
			elseif var3546 == 5 then
				local _ = nil
				local var3559, var3560 = protoModule.readBuffer(p128, var3541)
				var3541 = var3560
				var3540.foreground = t.HeroUnitInputData_VisualAsset.decode(var3559)
			elseif var3546 == 6 then
				local _ = nil
				local var3561, var3562 = protoModule.readBuffer(p128, var3541)
				var3541 = var3562
				var3540.background = t.HeroUnitInputData_VisualAsset.decode(var3561)
			elseif var3546 == 7 then
				local _ = nil
				local var3563, var3564 = protoModule.readBuffer(p128, var3541)
				var3541 = var3564
				var3540.title_image = t.HeroUnitInputData_VisualAsset.decode(var3563)
			elseif var3546 == 8 then
				local _ = nil
				local var3565, var3566 = protoModule.readBuffer(p128, var3541)
				var3541 = var3566
				var3540.asset_title = buffer.tostring(var3565)
			elseif var3546 == 9 then
				local _ = nil
				local var3567, var3568 = protoModule.readBuffer(p128, var3541)
				var3541 = var3568
				var3540.asset_subtitle = buffer.tostring(var3567)
			elseif var3546 == 10 then
				local _ = nil
				local var3569, var3570 = protoModule.readBuffer(p128, var3541)
				var3541 = var3570
				var3540.gradient = t.HeroUnitInputData_Gradient.decode(var3569)
			elseif var3546 == 11 then
				local _ = nil
				local var3571, var3572 = protoModule.readBuffer(p128, var3541)
				var3541 = var3572
				var3540.playable_text = buffer.tostring(var3571)
			elseif var3546 == 12 then
				local _ = nil
				local var3573, var3574 = protoModule.readBuffer(p128, var3541)
				var3541 = var3574
				var3540.collection_id = buffer.tostring(var3573)
			elseif var3546 == 13 then
				local _ = nil
				local var3575, var3576 = protoModule.readBuffer(p128, var3541)
				var3541 = var3576
				var3540.campaign_id = buffer.tostring(var3575)
			elseif var3546 == 14 then
				local _ = nil
				local var3577, var3578 = protoModule.readBuffer(p128, var3541)
				var3541 = var3578
				var3540.cohort_id = buffer.tostring(var3577)
			elseif var3546 == 15 then
				local _ = nil
				local var3579, var3580 = protoModule.readBuffer(p128, var3541)
				var3541 = var3580
				var3540.sort_id = buffer.tostring(var3579)
			elseif var3546 == 16 then
				local _ = nil
				local var3581, var3582 = protoModule.readBuffer(p128, var3541)
				var3541 = var3582
				var3540.hero_unit_id = buffer.tostring(var3581)
			elseif var3546 == 17 then
				local _ = nil
				local var3583, var3584 = protoModule.readBuffer(p128, var3541)
				var3541 = var3584
				var3540.analytics_id = buffer.tostring(var3583)
			else
				local _ = nil
				local var3585, var3586 = protoModule.readVarInt(p128, var3541)
				var3541 = var3586 + var3585
			end
		elseif var3542 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3587, var3588 = protoModule.readFixed32(p128, var3541)
			local _ = var3587
			var3541 = var3588
		elseif var3542 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3589, var3590 = protoModule.readFixed64(p128, var3541)
			local _ = var3589
			var3541 = var3590
		else
			error("Unsupported wire type: " .. var5187)
		end
	end
	return var3540
end

function t_128:jsonEncode()
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

function t_128:jsonDecode()
	-- upvalues: t_128 (ref), t (ref)
	local var3591 = t_128.new()
	
	if self.universe_id ~= nil then
		var3591.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3591.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3591.title = self.title
	end
	if self.subtitle ~= nil then
		var3591.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3591.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3591.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3591.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3591.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3591.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3591.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3591.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3591.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3591.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3591.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3591.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3591.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3591.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3591.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3591.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3591.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3591.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3591.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3591.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3591.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3591.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3591.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3591.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3591.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3591.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3591.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3591.is_sponsored = self.isSponsored
	end
	return var3591
end

t_128.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_128
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p129)
	-- upvalues: t_129 (ref)
	return setmetatable({
		asset_id = if p129 == nil or p129.asset_id == nil then "" else p129.asset_id,
		aspect_ratio = if p129 == nil or p129.aspect_ratio == nil then nil else p129.aspect_ratio,
		enable_animation = if p129 == nil or p129.enable_animation == nil then nil else p129.enable_animation
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3591 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3592, var3593 = protoModule.writeTag(buff, var3591, 1, protoModule.wireTypes.lengthDelimited)
		var3592, var5241 = protoModule.writeString(var3592, var3593, self.asset_id)
		buff = var3592
		var3591 = var3593
	end
	if self.aspect_ratio ~= nil then
		local var3594, var3595 = protoModule.writeTag(buff, var3591, 2, protoModule.wireTypes.i64)
		var3594, var5243 = protoModule.writeDouble(var3594, var3595, self.aspect_ratio)
		buff = var3594
		var3591 = var3595
	end
	if self.enable_animation ~= nil then
		local var3596, var3597 = protoModule.writeTag(buff, var3591, 3, protoModule.wireTypes.varint)
		var3596, var5245 = protoModule.writeVarInt(var3596, var3597, if self.enable_animation then 1 else 0)
		buff = var3596
		var3591 = var3597
	end
	local buff_1 = buffer.create(var3591)
	buffer.copy(buff_1, 0, buff, 0, var3591)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref)
	local var3591 = t_129.new()
	local var3592 = 0
	while var3592 < buffer.len(p129) do
		local _ = nil
		local var3593 = nil
		local var3594, var3595, var3596 = protoModule.readTag(p129, var3592)
		local var3597 = var3594
		var3593 = var3595
		var3592 = var3596
		
		if var3593 == protoModule.wireTypes.varint then
			if var3597 == 3 then
				local _ = nil
				local var3598, var3599 = protoModule.readVarInt(p129, var3592)
				var3592 = var3599
				var3591.enable_animation = var3598 ~= 0
			else
				local _ = nil
				local var3600, var3601 = protoModule.readVarInt(p129, var3592)
				local _ = var3600
				var3592 = var3601
			end
		end
		if var3593 == protoModule.wireTypes.lengthDelimited then
			if var3597 == 1 then
				local _ = nil
				local var3602, var3603 = protoModule.readBuffer(p129, var3592)
				var3592 = var3603
				var3591.asset_id = buffer.tostring(var3602)
			else
				local _ = nil
				local var3604, var3605 = protoModule.readVarInt(p129, var3592)
				var3592 = var3605 + var3604
			end
		elseif var3593 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3606, var3607 = protoModule.readFixed32(p129, var3592)
			local _ = var3606
			var3592 = var3607
		elseif var3593 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5249)
		elseif var3597 == 2 then
			local _ = nil
			local var3608, var3609 = protoModule.readDouble(p129, var3592)
			var3592 = var3609
			var3591.aspect_ratio = var3608
		else
			local _ = nil
			local var3610, var3611 = protoModule.readFixed64(p129, var3592)
			local _ = var3610
			var3592 = var3611
		end
	end
	return var3591
end

function t_129:jsonEncode()
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

function t_129:jsonDecode()
	-- upvalues: t_129 (ref), protoModule (ref)
	local var3612 = t_129.new()
	
	if self.asset_id ~= nil then
		var3612.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3612.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3612.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3612.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3612.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3612.enable_animation = self.enableAnimation
	end
	return var3612
end

t_129.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_129
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p130)
	-- upvalues: t_130 (ref)
	return setmetatable({
		start_color = if p130 == nil or p130.start_color == nil then nil else p130.start_color,
		end_color = if p130 == nil or p130.end_color == nil then nil else p130.end_color,
		start_opacity = if p130 == nil or p130.start_opacity == nil then nil else p130.start_opacity,
		end_opacity = if p130 == nil or p130.end_opacity == nil then nil else p130.end_opacity,
		degree = if p130 == nil or p130.degree == nil then nil else p130.degree
	}, t_130)
end

function t_130:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3612 = 0
	
	if self.start_color ~= nil then
		local var3613, var3614 = protoModule.writeTag(buff, var3612, 1, protoModule.wireTypes.lengthDelimited)
		var3613, var5273 = protoModule.writeString(var3613, var3614, self.start_color)
		buff = var3613
		var3612 = var3614
	end
	if self.end_color ~= nil then
		local var3615, var3616 = protoModule.writeTag(buff, var3612, 2, protoModule.wireTypes.lengthDelimited)
		var3615, var5275 = protoModule.writeString(var3615, var3616, self.end_color)
		buff = var3615
		var3612 = var3616
	end
	if self.start_opacity ~= nil then
		local var3617, var3618 = protoModule.writeTag(buff, var3612, 3, protoModule.wireTypes.i64)
		var3617, var5277 = protoModule.writeDouble(var3617, var3618, self.start_opacity)
		buff = var3617
		var3612 = var3618
	end
	if self.end_opacity ~= nil then
		local var3619, var3620 = protoModule.writeTag(buff, var3612, 4, protoModule.wireTypes.i64)
		var3619, var5279 = protoModule.writeDouble(var3619, var3620, self.end_opacity)
		buff = var3619
		var3612 = var3620
	end
	if self.degree ~= nil then
		local var3621, var3622 = protoModule.writeTag(buff, var3612, 5, protoModule.wireTypes.i64)
		var3621, var5281 = protoModule.writeDouble(var3621, var3622, self.degree)
		buff = var3621
		var3612 = var3622
	end
	local buff_1 = buffer.create(var3612)
	buffer.copy(buff_1, 0, buff, 0, var3612)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref)
	local var3612 = t_130.new()
	local var3613 = 0
	while var3613 < buffer.len(p130) do
		local _ = nil
		local var3614 = nil
		local var3615, var3616, var3617 = protoModule.readTag(p130, var3613)
		local var3618 = var3615
		var3614 = var3616
		var3613 = var3617
		
		if var3614 == protoModule.wireTypes.varint then
			local _ = nil
			local var3619, var3620 = protoModule.readVarInt(p130, var3613)
			local _ = var3619
			var3613 = var3620
			continue
		end
		if var3614 == protoModule.wireTypes.lengthDelimited then
			if var3618 == 1 then
				local _ = nil
				local var3621, var3622 = protoModule.readBuffer(p130, var3613)
				var3613 = var3622
				var3612.start_color = buffer.tostring(var3621)
			elseif var3618 == 2 then
				local _ = nil
				local var3623, var3624 = protoModule.readBuffer(p130, var3613)
				var3613 = var3624
				var3612.end_color = buffer.tostring(var3623)
			else
				local _ = nil
				local var3625, var3626 = protoModule.readVarInt(p130, var3613)
				var3613 = var3626 + var3625
			end
		elseif var3614 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3627, var3628 = protoModule.readFixed32(p130, var3613)
			local _ = var3627
			var3613 = var3628
		elseif var3614 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5285)
		elseif var3618 == 3 then
			local _ = nil
			local var3629, var3630 = protoModule.readDouble(p130, var3613)
			var3613 = var3630
			var3612.start_opacity = var3629
		elseif var3618 == 4 then
			local _ = nil
			local var3631, var3632 = protoModule.readDouble(p130, var3613)
			var3613 = var3632
			var3612.end_opacity = var3631
		elseif var3618 == 5 then
			local _ = nil
			local var3633, var3634 = protoModule.readDouble(p130, var3613)
			var3613 = var3634
			var3612.degree = var3633
		else
			local _ = nil
			local var3635, var3636 = protoModule.readFixed64(p130, var3613)
			local _ = var3635
			var3613 = var3636
		end
	end
	return var3612
end

function t_130:jsonEncode()
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

function t_130:jsonDecode()
	-- upvalues: t_130 (ref), protoModule (ref)
	local var3637 = t_130.new()
	
	if self.start_color ~= nil then
		var3637.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3637.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3637.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3637.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3637.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3637.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3637.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3637.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3637.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3637
end

t_130.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_130
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p131)
	-- upvalues: t_131 (ref)
	return setmetatable({
		items = if p131 == nil or p131.items == nil then {} else p131.items,
		sort_id = if p131 == nil or p131.sort_id == nil then "" else p131.sort_id,
		recommendation_request_id = if p131 == nil or p131.recommendation_request_id == nil then "" else p131.recommendation_request_id
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3637 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3638 = v:encode()
			local var3639, var3640 = protoModule.writeTag(buff, var3637, 1, protoModule.wireTypes.lengthDelimited)
			var3639, var5314 = protoModule.writeBuffer(var3639, var3640, var3638, buffer.len(var3638))
			buff = var3639
			var3637 = var3640
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3641, var3642 = protoModule.writeTag(buff, var3637, 2, protoModule.wireTypes.lengthDelimited)
		var3641, var5316 = protoModule.writeString(var3641, var3642, self.sort_id)
		buff = var3641
		var3637 = var3642
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3643, var3644 = protoModule.writeTag(buff, var3637, 3, protoModule.wireTypes.lengthDelimited)
		var3643, var5318 = protoModule.writeString(var3643, var3644, self.recommendation_request_id)
		buff = var3643
		var3637 = var3644
	end
	local buff_1 = buffer.create(var3637)
	buffer.copy(buff_1, 0, buff, 0, var3637)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref), t (ref)
	local var3645 = t_131.new()
	local var3646 = 0
	while var3646 < buffer.len(p131) do
		local _ = nil
		local var3647 = nil
		local var3648, var3649, var3650 = protoModule.readTag(p131, var3646)
		local var3651 = var3648
		var3647 = var3649
		var3646 = var3650
		
		if var3647 == protoModule.wireTypes.varint then
			local _ = nil
			local var3652, var3653 = protoModule.readVarInt(p131, var3646)
			local _ = var3652
			var3646 = var3653
			continue
		end
		if var3647 == protoModule.wireTypes.lengthDelimited then
			if var3651 == 1 then
				local _ = nil
				local var3654, var3655 = protoModule.readBuffer(p131, var3646)
				var3646 = var3655
				table.insert(var3645.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3654))
			elseif var3651 == 2 then
				local _ = nil
				local var3656, var3657 = protoModule.readBuffer(p131, var3646)
				var3646 = var3657
				var3645.sort_id = buffer.tostring(var3656)
			elseif var3651 == 3 then
				local _ = nil
				local var3658, var3659 = protoModule.readBuffer(p131, var3646)
				var3646 = var3659
				var3645.recommendation_request_id = buffer.tostring(var3658)
			else
				local _ = nil
				local var3660, var3661 = protoModule.readVarInt(p131, var3646)
				var3646 = var3661 + var3660
			end
		elseif var3647 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3662, var3663 = protoModule.readFixed32(p131, var3646)
			local _ = var3662
			var3646 = var3663
		elseif var3647 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3664, var3665 = protoModule.readFixed64(p131, var3646)
			local _ = var3664
			var3646 = var3665
		else
			error("Unsupported wire type: " .. var5322)
		end
	end
	return var3645
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
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		t.recommendationRequestId = self.recommendation_request_id
	end
	return t
end

function t_131:jsonDecode()
	-- upvalues: t_131 (ref), t (ref)
	local var3666 = t_131.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3666.items = t_1
	end
	if self.sort_id ~= nil then
		var3666.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3666.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3666.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3666.recommendation_request_id = self.recommendationRequestId
	end
	return var3666
end

t_131.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_131
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_132 = {}
t_132.__index = t_132

function t_132.new(p132)
	-- upvalues: t_132 (ref)
	return setmetatable({
		item_id = if p132 == nil or p132.item_id == nil then "" else p132.item_id,
		has_pending_friend_request = if p132 == nil or p132.has_pending_friend_request == nil then false else p132.has_pending_friend_request
	}, t_132)
end

function t_132:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3667 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3668, var3669 = protoModule.writeTag(buff, var3667, 1, protoModule.wireTypes.lengthDelimited)
		var3668, var5348 = protoModule.writeString(var3668, var3669, self.item_id)
		buff = var3668
		var3667 = var3669
	end
	if self.has_pending_friend_request then
		local var3670, var3671 = protoModule.writeTag(buff, var3667, 2, protoModule.wireTypes.varint)
		var3670, var5350 = protoModule.writeVarInt(var3670, var3671, if self.has_pending_friend_request then 1 else 0)
		buff = var3670
		var3667 = var3671
	end
	local buff_1 = buffer.create(var3667)
	buffer.copy(buff_1, 0, buff, 0, var3667)
	
	return buff_1
end

function t_132.decode(p132)
	-- upvalues: t_132 (ref), protoModule (ref)
	local var3667 = t_132.new()
	local var3668 = 0
	while var3668 < buffer.len(p132) do
		local _ = nil
		local var3669 = nil
		local var3670, var3671, var3672 = protoModule.readTag(p132, var3668)
		local var3673 = var3670
		var3669 = var3671
		var3668 = var3672
		
		if var3669 == protoModule.wireTypes.varint then
			if var3673 == 2 then
				local _ = nil
				local var3674, var3675 = protoModule.readVarInt(p132, var3668)
				var3668 = var3675
				var3667.has_pending_friend_request = var3674 ~= 0
			else
				local _ = nil
				local var3676, var3677 = protoModule.readVarInt(p132, var3668)
				local _ = var3676
				var3668 = var3677
			end
		end
		if var3669 == protoModule.wireTypes.lengthDelimited then
			if var3673 == 1 then
				local _ = nil
				local var3678, var3679 = protoModule.readBuffer(p132, var3668)
				var3668 = var3679
				var3667.item_id = buffer.tostring(var3678)
			else
				local _ = nil
				local var3680, var3681 = protoModule.readVarInt(p132, var3668)
				var3668 = var3681 + var3680
			end
		elseif var3669 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3682, var3683 = protoModule.readFixed32(p132, var3668)
			local _ = var3682
			var3668 = var3683
		elseif var3669 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3684, var3685 = protoModule.readFixed64(p132, var3668)
			local _ = var3684
			var3668 = var3685
		else
			error("Unsupported wire type: " .. var5354)
		end
	end
	return var3667
end

function t_132:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function t_132:jsonDecode()
	-- upvalues: t_132 (ref)
	local var3686 = t_132.new()
	
	if self.item_id ~= nil then
		var3686.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3686.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3686.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3686.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3686
end

t_132.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_132
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_133 = {}
t_133.__index = t_133

function t_133.new(p133)
	-- upvalues: t_133 (ref)
	return setmetatable({
		selected_option = if p133 == nil or p133.selected_option == nil then "" else p133.selected_option,
		sort_id = if p133 == nil or p133.sort_id == nil then "" else p133.sort_id,
		options = if p133 == nil or p133.options == nil then {} else p133.options,
		experience_carousel = if p133 == nil or p133.experience_carousel == nil then nil else p133.experience_carousel,
		feed_item_key = if p133 == nil or p133.feed_item_key == nil then "" else p133.feed_item_key,
		title = if p133 == nil or p133.title == nil then "" else p133.title
	}, t_133)
end

function t_133:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3686 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3687, var3688 = protoModule.writeTag(buff, var3686, 1, protoModule.wireTypes.lengthDelimited)
		var3687, var5376 = protoModule.writeString(var3687, var3688, self.selected_option)
		buff = var3687
		var3686 = var3688
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3689, var3690 = protoModule.writeTag(buff, var3686, 2, protoModule.wireTypes.lengthDelimited)
		var3689, var5378 = protoModule.writeString(var3689, var3690, self.sort_id)
		buff = var3689
		var3686 = var3690
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3691 = v:encode()
			local var3692, var3693 = protoModule.writeTag(buff, var3686, 3, protoModule.wireTypes.lengthDelimited)
			var3692, var5381 = protoModule.writeBuffer(var3692, var3693, var3691, buffer.len(var3691))
			buff = var3692
			var3686 = var3693
		end
	end
	if self.experience_carousel ~= nil then
		local var3694 = self.experience_carousel:encode()
		local var3695, var3696 = protoModule.writeTag(buff, var3686, 4, protoModule.wireTypes.lengthDelimited)
		var3695, var5384 = protoModule.writeBuffer(var3695, var3696, var3694, buffer.len(var3694))
		buff = var3695
		var3686 = var3696
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3697, var3698 = protoModule.writeTag(buff, var3686, 5, protoModule.wireTypes.lengthDelimited)
		var3697, var5386 = protoModule.writeString(var3697, var3698, self.feed_item_key)
		buff = var3697
		var3686 = var3698
	end
	if self.title ~= nil and self.title ~= "" then
		local var3699, var3700 = protoModule.writeTag(buff, var3686, 6, protoModule.wireTypes.lengthDelimited)
		var3699, var5388 = protoModule.writeString(var3699, var3700, self.title)
		buff = var3699
		var3686 = var3700
	end
	local buff_1 = buffer.create(var3686)
	buffer.copy(buff_1, 0, buff, 0, var3686)
	
	return buff_1
end

function t_133.decode(p133)
	-- upvalues: t_133 (ref), protoModule (ref), t (ref)
	local var3701 = t_133.new()
	local var3702 = 0
	while var3702 < buffer.len(p133) do
		local _ = nil
		local var3703 = nil
		local var3704, var3705, var3706 = protoModule.readTag(p133, var3702)
		local var3707 = var3704
		var3703 = var3705
		var3702 = var3706
		
		if var3703 == protoModule.wireTypes.varint then
			local _ = nil
			local var3708, var3709 = protoModule.readVarInt(p133, var3702)
			local _ = var3708
			var3702 = var3709
			continue
		end
		if var3703 == protoModule.wireTypes.lengthDelimited then
			if var3707 == 1 then
				local _ = nil
				local var3710, var3711 = protoModule.readBuffer(p133, var3702)
				var3702 = var3711
				var3701.selected_option = buffer.tostring(var3710)
			elseif var3707 == 2 then
				local _ = nil
				local var3712, var3713 = protoModule.readBuffer(p133, var3702)
				var3702 = var3713
				var3701.sort_id = buffer.tostring(var3712)
			elseif var3707 == 3 then
				local _ = nil
				local var3714, var3715 = protoModule.readBuffer(p133, var3702)
				var3702 = var3715
				table.insert(var3701.options, t.SelectorOption.decode(var3714))
			elseif var3707 == 4 then
				local _ = nil
				local var3716, var3717 = protoModule.readBuffer(p133, var3702)
				var3702 = var3717
				var3701.experience_carousel = t.ExperienceCarouselInputData.decode(var3716)
			elseif var3707 == 5 then
				local _ = nil
				local var3718, var3719 = protoModule.readBuffer(p133, var3702)
				var3702 = var3719
				var3701.feed_item_key = buffer.tostring(var3718)
			elseif var3707 == 6 then
				local _ = nil
				local var3720, var3721 = protoModule.readBuffer(p133, var3702)
				var3702 = var3721
				var3701.title = buffer.tostring(var3720)
			else
				local _ = nil
				local var3722, var3723 = protoModule.readVarInt(p133, var3702)
				var3702 = var3723 + var3722
			end
		elseif var3703 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3724, var3725 = protoModule.readFixed32(p133, var3702)
			local _ = var3724
			var3702 = var3725
		elseif var3703 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3726, var3727 = protoModule.readFixed64(p133, var3702)
			local _ = var3726
			var3702 = var3727
		else
			error("Unsupported wire type: " .. var5392)
		end
	end
	return var3701
end

function t_133:jsonEncode()
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

function t_133:jsonDecode()
	-- upvalues: t_133 (ref), t (ref)
	local var3728 = t_133.new()
	
	if self.selected_option ~= nil then
		var3728.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3728.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3728.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3728.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3728.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3728.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3728.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3728.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3728.feed_item_key = self.feedItemKey
	end
	if self.title ~= nil then
		var3728.title = self.title
	end
	return var3728
end

t_133.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_133
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_134 = {}
t_134.__index = t_134

function t_134.new(p134)
	-- upvalues: t_134 (ref)
	return setmetatable({
		id = if p134 == nil or p134.id == nil then "" else p134.id,
		display_name = if p134 == nil or p134.display_name == nil then "" else p134.display_name,
		is_selected = if p134 == nil or p134.is_selected == nil then false else p134.is_selected,
		anchor_tag = if p134 == nil or p134.anchor_tag == nil then nil else p134.anchor_tag
	}, t_134)
end

function t_134:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3729 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3730, var3731 = protoModule.writeTag(buff, var3729, 1, protoModule.wireTypes.lengthDelimited)
		var3730, var5424 = protoModule.writeString(var3730, var3731, self.id)
		buff = var3730
		var3729 = var3731
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3732, var3733 = protoModule.writeTag(buff, var3729, 2, protoModule.wireTypes.lengthDelimited)
		var3732, var5426 = protoModule.writeString(var3732, var3733, self.display_name)
		buff = var3732
		var3729 = var3733
	end
	if self.is_selected then
		local var3734, var3735 = protoModule.writeTag(buff, var3729, 3, protoModule.wireTypes.varint)
		var3734, var5428 = protoModule.writeVarInt(var3734, var3735, if self.is_selected then 1 else 0)
		buff = var3734
		var3729 = var3735
	end
	if self.anchor_tag ~= nil then
		local var3736, var3737 = protoModule.writeTag(buff, var3729, 4, protoModule.wireTypes.lengthDelimited)
		var3736, var5430 = protoModule.writeString(var3736, var3737, self.anchor_tag)
		buff = var3736
		var3729 = var3737
	end
	local buff_1 = buffer.create(var3729)
	buffer.copy(buff_1, 0, buff, 0, var3729)
	
	return buff_1
end

function t_134.decode(p134)
	-- upvalues: t_134 (ref), protoModule (ref)
	local var3729 = t_134.new()
	local var3730 = 0
	while var3730 < buffer.len(p134) do
		local _ = nil
		local var3731 = nil
		local var3732, var3733, var3734 = protoModule.readTag(p134, var3730)
		local var3735 = var3732
		var3731 = var3733
		var3730 = var3734
		
		if var3731 == protoModule.wireTypes.varint then
			if var3735 == 3 then
				local _ = nil
				local var3736, var3737 = protoModule.readVarInt(p134, var3730)
				var3730 = var3737
				var3729.is_selected = var3736 ~= 0
			else
				local _ = nil
				local var3738, var3739 = protoModule.readVarInt(p134, var3730)
				local _ = var3738
				var3730 = var3739
			end
		end
		if var3731 == protoModule.wireTypes.lengthDelimited then
			if var3735 == 1 then
				local _ = nil
				local var3740, var3741 = protoModule.readBuffer(p134, var3730)
				var3730 = var3741
				var3729.id = buffer.tostring(var3740)
			elseif var3735 == 2 then
				local _ = nil
				local var3742, var3743 = protoModule.readBuffer(p134, var3730)
				var3730 = var3743
				var3729.display_name = buffer.tostring(var3742)
			elseif var3735 == 4 then
				local _ = nil
				local var3744, var3745 = protoModule.readBuffer(p134, var3730)
				var3730 = var3745
				var3729.anchor_tag = buffer.tostring(var3744)
			else
				local _ = nil
				local var3746, var3747 = protoModule.readVarInt(p134, var3730)
				var3730 = var3747 + var3746
			end
		elseif var3731 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3748, var3749 = protoModule.readFixed32(p134, var3730)
			local _ = var3748
			var3730 = var3749
		elseif var3731 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3750, var3751 = protoModule.readFixed64(p134, var3730)
			local _ = var3750
			var3730 = var3751
		else
			error("Unsupported wire type: " .. var5434)
		end
	end
	return var3729
end

function t_134:jsonEncode()
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
	if self.anchor_tag ~= nil then
		t.anchorTag = self.anchor_tag
	end
	return t
end

function t_134:jsonDecode()
	-- upvalues: t_134 (ref)
	local var3752 = t_134.new()
	
	if self.id ~= nil then
		var3752.id = self.id
	end
	if self.display_name ~= nil then
		var3752.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3752.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3752.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3752.is_selected = self.isSelected
	end
	if self.anchor_tag ~= nil then
		var3752.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var3752.anchor_tag = self.anchorTag
	end
	return var3752
end

t_134.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_134
typeRegistryModule.default:register(t.SelectorOption)
local t_135 = {}
t_135.__index = t_135

function t_135.new(p135)
	-- upvalues: t_135 (ref)
	return setmetatable({
		cards = if p135 == nil or p135.cards == nil then {} else p135.cards,
		title = if p135 == nil or p135.title == nil then "" else p135.title,
		sort_id = if p135 == nil or p135.sort_id == nil then nil else p135.sort_id
	}, t_135)
end

function t_135:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3752 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3753 = v:encode()
			local var3754, var3755 = protoModule.writeTag(buff, var3752, 1, protoModule.wireTypes.lengthDelimited)
			var3754, var5461 = protoModule.writeBuffer(var3754, var3755, var3753, buffer.len(var3753))
			buff = var3754
			var3752 = var3755
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3756, var3757 = protoModule.writeTag(buff, var3752, 2, protoModule.wireTypes.lengthDelimited)
		var3756, var5463 = protoModule.writeString(var3756, var3757, self.title)
		buff = var3756
		var3752 = var3757
	end
	if self.sort_id ~= nil then
		local var3758, var3759 = protoModule.writeTag(buff, var3752, 3, protoModule.wireTypes.lengthDelimited)
		var3758, var5465 = protoModule.writeString(var3758, var3759, self.sort_id)
		buff = var3758
		var3752 = var3759
	end
	local buff_1 = buffer.create(var3752)
	buffer.copy(buff_1, 0, buff, 0, var3752)
	
	return buff_1
end

function t_135.decode(p135)
	-- upvalues: t_135 (ref), protoModule (ref), t (ref)
	local var3760 = t_135.new()
	local var3761 = 0
	while var3761 < buffer.len(p135) do
		local _ = nil
		local var3762 = nil
		local var3763, var3764, var3765 = protoModule.readTag(p135, var3761)
		local var3766 = var3763
		var3762 = var3764
		var3761 = var3765
		
		if var3762 == protoModule.wireTypes.varint then
			local _ = nil
			local var3767, var3768 = protoModule.readVarInt(p135, var3761)
			local _ = var3767
			var3761 = var3768
			continue
		end
		if var3762 == protoModule.wireTypes.lengthDelimited then
			if var3766 == 1 then
				local _ = nil
				local var3769, var3770 = protoModule.readBuffer(p135, var3761)
				var3761 = var3770
				table.insert(var3760.cards, t.GameItemsCardInputData.decode(var3769))
			elseif var3766 == 2 then
				local _ = nil
				local var3771, var3772 = protoModule.readBuffer(p135, var3761)
				var3761 = var3772
				var3760.title = buffer.tostring(var3771)
			elseif var3766 == 3 then
				local _ = nil
				local var3773, var3774 = protoModule.readBuffer(p135, var3761)
				var3761 = var3774
				var3760.sort_id = buffer.tostring(var3773)
			else
				local _ = nil
				local var3775, var3776 = protoModule.readVarInt(p135, var3761)
				var3761 = var3776 + var3775
			end
		elseif var3762 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3777, var3778 = protoModule.readFixed32(p135, var3761)
			local _ = var3777
			var3761 = var3778
		elseif var3762 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3779, var3780 = protoModule.readFixed64(p135, var3761)
			local _ = var3779
			var3761 = var3780
		else
			error("Unsupported wire type: " .. var5469)
		end
	end
	return var3760
end

function t_135:jsonEncode()
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

function t_135:jsonDecode()
	-- upvalues: t_135 (ref), t (ref)
	local var3781 = t_135.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3781.cards = t_1
	end
	if self.title ~= nil then
		var3781.title = self.title
	end
	if self.sort_id ~= nil then
		var3781.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3781.sort_id = self.sortId
	end
	return var3781
end

t_135.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_135
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_136 = {}
t_136.__index = t_136

function t_136.new(p136)
	-- upvalues: t_136 (ref)
	return setmetatable({
		universe_id = if p136 == nil or p136.universe_id == nil then "" else p136.universe_id,
		items = if p136 == nil or p136.items == nil then {} else p136.items
	}, t_136)
end

function t_136:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3782 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3783, var3784 = protoModule.writeTag(buff, var3782, 1, protoModule.wireTypes.lengthDelimited)
		var3783, var5495 = protoModule.writeString(var3783, var3784, self.universe_id)
		buff = var3783
		var3782 = var3784
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3785 = v:encode()
			local var3786, var3787 = protoModule.writeTag(buff, var3782, 2, protoModule.wireTypes.lengthDelimited)
			var3786, var5498 = protoModule.writeBuffer(var3786, var3787, var3785, buffer.len(var3785))
			buff = var3786
			var3782 = var3787
		end
	end
	local buff_1 = buffer.create(var3782)
	buffer.copy(buff_1, 0, buff, 0, var3782)
	
	return buff_1
end

function t_136.decode(p136)
	-- upvalues: t_136 (ref), protoModule (ref), t (ref)
	local var3788 = t_136.new()
	local var3789 = 0
	while var3789 < buffer.len(p136) do
		local _ = nil
		local var3790 = nil
		local var3791, var3792, var3793 = protoModule.readTag(p136, var3789)
		local var3794 = var3791
		var3790 = var3792
		var3789 = var3793
		
		if var3790 == protoModule.wireTypes.varint then
			local _ = nil
			local var3795, var3796 = protoModule.readVarInt(p136, var3789)
			local _ = var3795
			var3789 = var3796
			continue
		end
		if var3790 == protoModule.wireTypes.lengthDelimited then
			if var3794 == 1 then
				local _ = nil
				local var3797, var3798 = protoModule.readBuffer(p136, var3789)
				var3789 = var3798
				var3788.universe_id = buffer.tostring(var3797)
			elseif var3794 == 2 then
				local _ = nil
				local var3799, var3800 = protoModule.readBuffer(p136, var3789)
				var3789 = var3800
				table.insert(var3788.items, t.GameItemInputData.decode(var3799))
			else
				local _ = nil
				local var3801, var3802 = protoModule.readVarInt(p136, var3789)
				var3789 = var3802 + var3801
			end
		elseif var3790 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3803, var3804 = protoModule.readFixed32(p136, var3789)
			local _ = var3803
			var3789 = var3804
		elseif var3790 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3805, var3806 = protoModule.readFixed64(p136, var3789)
			local _ = var3805
			var3789 = var3806
		else
			error("Unsupported wire type: " .. var5502)
		end
	end
	return var3788
end

function t_136:jsonEncode()
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

function t_136:jsonDecode()
	-- upvalues: t_136 (ref), t (ref)
	local var3807 = t_136.new()
	
	if self.universe_id ~= nil then
		var3807.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3807.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3807.items = t_1
	end
	return var3807
end

t_136.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_136
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_137 = {}
t_137.__index = t_137

function t_137.new(p137)
	-- upvalues: t_137 (ref)
	return setmetatable({
		item_id = if p137 == nil or p137.item_id == nil then "" else p137.item_id,
		item_type = if p137 == nil or p137.item_type == nil then "" else p137.item_type
	}, t_137)
end

function t_137:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3808 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3809, var3810 = protoModule.writeTag(buff, var3808, 1, protoModule.wireTypes.lengthDelimited)
		var3809, var5526 = protoModule.writeString(var3809, var3810, self.item_id)
		buff = var3809
		var3808 = var3810
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3811, var3812 = protoModule.writeTag(buff, var3808, 2, protoModule.wireTypes.lengthDelimited)
		var3811, var5528 = protoModule.writeString(var3811, var3812, self.item_type)
		buff = var3811
		var3808 = var3812
	end
	local buff_1 = buffer.create(var3808)
	buffer.copy(buff_1, 0, buff, 0, var3808)
	
	return buff_1
end

function t_137.decode(p137)
	-- upvalues: t_137 (ref), protoModule (ref)
	local var3808 = t_137.new()
	local var3809 = 0
	while var3809 < buffer.len(p137) do
		local _ = nil
		local var3810 = nil
		local var3811, var3812, var3813 = protoModule.readTag(p137, var3809)
		local var3814 = var3811
		var3810 = var3812
		var3809 = var3813
		
		if var3810 == protoModule.wireTypes.varint then
			local _ = nil
			local var3815, var3816 = protoModule.readVarInt(p137, var3809)
			local _ = var3815
			var3809 = var3816
			continue
		end
		if var3810 == protoModule.wireTypes.lengthDelimited then
			if var3814 == 1 then
				local _ = nil
				local var3817, var3818 = protoModule.readBuffer(p137, var3809)
				var3809 = var3818
				var3808.item_id = buffer.tostring(var3817)
			elseif var3814 == 2 then
				local _ = nil
				local var3819, var3820 = protoModule.readBuffer(p137, var3809)
				var3809 = var3820
				var3808.item_type = buffer.tostring(var3819)
			else
				local _ = nil
				local var3821, var3822 = protoModule.readVarInt(p137, var3809)
				var3809 = var3822 + var3821
			end
		elseif var3810 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3823, var3824 = protoModule.readFixed32(p137, var3809)
			local _ = var3823
			var3809 = var3824
		elseif var3810 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3825, var3826 = protoModule.readFixed64(p137, var3809)
			local _ = var3825
			var3809 = var3826
		else
			error("Unsupported wire type: " .. var5532)
		end
	end
	return var3808
end

function t_137:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_137:jsonDecode()
	-- upvalues: t_137 (ref)
	local var3827 = t_137.new()
	
	if self.item_id ~= nil then
		var3827.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3827.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3827.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3827.item_type = self.itemType
	end
	return var3827
end

t_137.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_137
typeRegistryModule.default:register(t.GameItemInputData)
local t_138 = {}
t_138.__index = t_138

function t_138.new(p138)
	-- upvalues: t_138 (ref)
	return setmetatable({
		clickout_url = if p138 == nil or p138.clickout_url == nil then "" else p138.clickout_url,
		native_ad_data = if p138 == nil or p138.native_ad_data == nil then "" else p138.native_ad_data,
		payer_name = if p138 == nil or p138.payer_name == nil then nil else p138.payer_name,
		logo_asset_id = if p138 == nil or p138.logo_asset_id == nil then nil else p138.logo_asset_id,
		logo_aspect_ratio = if p138 == nil or p138.logo_aspect_ratio == nil then nil else p138.logo_aspect_ratio,
		cta_text = if p138 == nil or p138.cta_text == nil then nil else p138.cta_text,
		title = if p138 == nil or p138.title == nil then nil else p138.title,
		subtitle = if p138 == nil or p138.subtitle == nil then nil else p138.subtitle,
		image_asset_id = if p138 == nil or p138.image_asset_id == nil then nil else p138.image_asset_id,
		video_asset_id = if p138 == nil or p138.video_asset_id == nil then nil else p138.video_asset_id,
		badge_text = if p138 == nil or p138.badge_text == nil then nil else p138.badge_text,
		badge_analytics_id = if p138 == nil or p138.badge_analytics_id == nil then nil else p138.badge_analytics_id,
		roblox_component = if p138 == nil or p138.roblox_component == nil then nil else p138.roblox_component,
		attribution_thumbnail_asset_id = if p138 == nil or p138.attribution_thumbnail_asset_id == nil then nil else p138.attribution_thumbnail_asset_id
	}, t_138)
end

function t_138:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3827 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3828, var3829 = protoModule.writeTag(buff, var3827, 1, protoModule.wireTypes.lengthDelimited)
		var3828, var5554 = protoModule.writeString(var3828, var3829, self.clickout_url)
		buff = var3828
		var3827 = var3829
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3830, var3831 = protoModule.writeTag(buff, var3827, 2, protoModule.wireTypes.lengthDelimited)
		var3830, var5556 = protoModule.writeString(var3830, var3831, self.native_ad_data)
		buff = var3830
		var3827 = var3831
	end
	if self.payer_name ~= nil then
		local var3832, var3833 = protoModule.writeTag(buff, var3827, 3, protoModule.wireTypes.lengthDelimited)
		var3832, var5558 = protoModule.writeString(var3832, var3833, self.payer_name)
		buff = var3832
		var3827 = var3833
	end
	if self.logo_asset_id ~= nil then
		local var3834, var3835 = protoModule.writeTag(buff, var3827, 4, protoModule.wireTypes.lengthDelimited)
		var3834, var5560 = protoModule.writeString(var3834, var3835, self.logo_asset_id)
		buff = var3834
		var3827 = var3835
	end
	if self.logo_aspect_ratio ~= nil then
		local var3836, var3837 = protoModule.writeTag(buff, var3827, 5, protoModule.wireTypes.i64)
		var3836, var5562 = protoModule.writeDouble(var3836, var3837, self.logo_aspect_ratio)
		buff = var3836
		var3827 = var3837
	end
	if self.cta_text ~= nil then
		local var3838, var3839 = protoModule.writeTag(buff, var3827, 6, protoModule.wireTypes.lengthDelimited)
		var3838, var5564 = protoModule.writeString(var3838, var3839, self.cta_text)
		buff = var3838
		var3827 = var3839
	end
	if self.title ~= nil then
		local var3840, var3841 = protoModule.writeTag(buff, var3827, 7, protoModule.wireTypes.lengthDelimited)
		var3840, var5566 = protoModule.writeString(var3840, var3841, self.title)
		buff = var3840
		var3827 = var3841
	end
	if self.subtitle ~= nil then
		local var3842, var3843 = protoModule.writeTag(buff, var3827, 8, protoModule.wireTypes.lengthDelimited)
		var3842, var5568 = protoModule.writeString(var3842, var3843, self.subtitle)
		buff = var3842
		var3827 = var3843
	end
	if self.image_asset_id ~= nil then
		local var3844, var3845 = protoModule.writeTag(buff, var3827, 9, protoModule.wireTypes.lengthDelimited)
		var3844, var5570 = protoModule.writeString(var3844, var3845, self.image_asset_id)
		buff = var3844
		var3827 = var3845
	end
	if self.video_asset_id ~= nil then
		local var3846, var3847 = protoModule.writeTag(buff, var3827, 10, protoModule.wireTypes.lengthDelimited)
		var3846, var5572 = protoModule.writeString(var3846, var3847, self.video_asset_id)
		buff = var3846
		var3827 = var3847
	end
	if self.badge_text ~= nil then
		local var3848, var3849 = protoModule.writeTag(buff, var3827, 11, protoModule.wireTypes.lengthDelimited)
		var3848, var5574 = protoModule.writeString(var3848, var3849, self.badge_text)
		buff = var3848
		var3827 = var3849
	end
	if self.badge_analytics_id ~= nil then
		local var3850, var3851 = protoModule.writeTag(buff, var3827, 12, protoModule.wireTypes.lengthDelimited)
		var3850, var5576 = protoModule.writeString(var3850, var3851, self.badge_analytics_id)
		buff = var3850
		var3827 = var3851
	end
	if self.roblox_component ~= nil then
		local var3852, var3853 = protoModule.writeTag(buff, var3827, 13, protoModule.wireTypes.lengthDelimited)
		var3852, var5578 = protoModule.writeString(var3852, var3853, self.roblox_component)
		buff = var3852
		var3827 = var3853
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		local var3854, var3855 = protoModule.writeTag(buff, var3827, 14, protoModule.wireTypes.lengthDelimited)
		var3854, var5580 = protoModule.writeString(var3854, var3855, self.attribution_thumbnail_asset_id)
		buff = var3854
		var3827 = var3855
	end
	local buff_1 = buffer.create(var3827)
	buffer.copy(buff_1, 0, buff, 0, var3827)
	
	return buff_1
end

function t_138.decode(p138)
	-- upvalues: t_138 (ref), protoModule (ref)
	local var3827 = t_138.new()
	local var3828 = 0
	while var3828 < buffer.len(p138) do
		local _ = nil
		local var3829 = nil
		local var3830, var3831, var3832 = protoModule.readTag(p138, var3828)
		local var3833 = var3830
		var3829 = var3831
		var3828 = var3832
		
		if var3829 == protoModule.wireTypes.varint then
			local _ = nil
			local var3834, var3835 = protoModule.readVarInt(p138, var3828)
			local _ = var3834
			var3828 = var3835
			continue
		end
		if var3829 == protoModule.wireTypes.lengthDelimited then
			if var3833 == 1 then
				local _ = nil
				local var3836, var3837 = protoModule.readBuffer(p138, var3828)
				var3828 = var3837
				var3827.clickout_url = buffer.tostring(var3836)
			elseif var3833 == 2 then
				local _ = nil
				local var3838, var3839 = protoModule.readBuffer(p138, var3828)
				var3828 = var3839
				var3827.native_ad_data = buffer.tostring(var3838)
			elseif var3833 == 3 then
				local _ = nil
				local var3840, var3841 = protoModule.readBuffer(p138, var3828)
				var3828 = var3841
				var3827.payer_name = buffer.tostring(var3840)
			elseif var3833 == 4 then
				local _ = nil
				local var3842, var3843 = protoModule.readBuffer(p138, var3828)
				var3828 = var3843
				var3827.logo_asset_id = buffer.tostring(var3842)
			elseif var3833 == 6 then
				local _ = nil
				local var3844, var3845 = protoModule.readBuffer(p138, var3828)
				var3828 = var3845
				var3827.cta_text = buffer.tostring(var3844)
			elseif var3833 == 7 then
				local _ = nil
				local var3846, var3847 = protoModule.readBuffer(p138, var3828)
				var3828 = var3847
				var3827.title = buffer.tostring(var3846)
			elseif var3833 == 8 then
				local _ = nil
				local var3848, var3849 = protoModule.readBuffer(p138, var3828)
				var3828 = var3849
				var3827.subtitle = buffer.tostring(var3848)
			elseif var3833 == 9 then
				local _ = nil
				local var3850, var3851 = protoModule.readBuffer(p138, var3828)
				var3828 = var3851
				var3827.image_asset_id = buffer.tostring(var3850)
			elseif var3833 == 10 then
				local _ = nil
				local var3852, var3853 = protoModule.readBuffer(p138, var3828)
				var3828 = var3853
				var3827.video_asset_id = buffer.tostring(var3852)
			elseif var3833 == 11 then
				local _ = nil
				local var3854, var3855 = protoModule.readBuffer(p138, var3828)
				var3828 = var3855
				var3827.badge_text = buffer.tostring(var3854)
			elseif var3833 == 12 then
				local _ = nil
				local var3856, var3857 = protoModule.readBuffer(p138, var3828)
				var3828 = var3857
				var3827.badge_analytics_id = buffer.tostring(var3856)
			elseif var3833 == 13 then
				local _ = nil
				local var3858, var3859 = protoModule.readBuffer(p138, var3828)
				var3828 = var3859
				var3827.roblox_component = buffer.tostring(var3858)
			elseif var3833 == 14 then
				local _ = nil
				local var3860, var3861 = protoModule.readBuffer(p138, var3828)
				var3828 = var3861
				var3827.attribution_thumbnail_asset_id = buffer.tostring(var3860)
			else
				local _ = nil
				local var3862, var3863 = protoModule.readVarInt(p138, var3828)
				var3828 = var3863 + var3862
			end
		elseif var3829 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3864, var3865 = protoModule.readFixed32(p138, var3828)
			local _ = var3864
			var3828 = var3865
		elseif var3829 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var5584)
		elseif var3833 == 5 then
			local _ = nil
			local var3866, var3867 = protoModule.readDouble(p138, var3828)
			var3828 = var3867
			var3827.logo_aspect_ratio = var3866
		else
			local _ = nil
			local var3868, var3869 = protoModule.readFixed64(p138, var3828)
			local _ = var3868
			var3828 = var3869
		end
	end
	return var3827
end

function t_138:jsonEncode()
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

function t_138:jsonDecode()
	-- upvalues: t_138 (ref), protoModule (ref)
	local var3870 = t_138.new()
	
	if self.clickout_url ~= nil then
		var3870.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3870.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3870.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3870.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3870.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3870.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3870.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3870.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3870.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3870.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3870.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3870.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3870.title = self.title
	end
	if self.subtitle ~= nil then
		var3870.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3870.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3870.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3870.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3870.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3870.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3870.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3870.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3870.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3870.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3870.roblox_component = self.robloxComponent
	end
	if self.attribution_thumbnail_asset_id ~= nil then
		var3870.attribution_thumbnail_asset_id = self.attribution_thumbnail_asset_id
	end
	if self.attributionThumbnailAssetId ~= nil then
		var3870.attribution_thumbnail_asset_id = self.attributionThumbnailAssetId
	end
	return var3870
end

t_138.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = t_138
typeRegistryModule.default:register(t.AdLinkItem)
local t_139 = {}
t_139.__index = t_139

function t_139.new(p139)
	-- upvalues: t_139 (ref)
	return setmetatable({
		layout = if p139 == nil or p139.layout == nil then nil else p139.layout,
		kind = if p139 == nil or p139.kind == nil then nil else p139.kind
	}, t_139)
end

function t_139:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3870 = 0
	
	if self.layout ~= nil then
		local var3871 = self.layout:encode()
		local var3872, var3873 = protoModule.writeTag(buff, var3870, 1, protoModule.wireTypes.lengthDelimited)
		var3872, var5631 = protoModule.writeBuffer(var3872, var3873, var3871, buffer.len(var3871))
		buff = var3872
		var3870 = var3873
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3874 = self.kind.value:encode()
			local var3875, var3876 = protoModule.writeTag(buff, var3870, 2, protoModule.wireTypes.lengthDelimited)
			var3875, var5634 = protoModule.writeBuffer(var3875, var3876, var3874, buffer.len(var3874))
			buff = var3875
			var3870 = var3876
		elseif self.kind.type == "ad_link" then
			local var3877 = self.kind.value:encode()
			local var3878, var3879 = protoModule.writeTag(buff, var3870, 3, protoModule.wireTypes.lengthDelimited)
			var3878, var5637 = protoModule.writeBuffer(var3878, var3879, var3877, buffer.len(var3877))
			buff = var3878
			var3870 = var3879
		end
	end
	local buff_1 = buffer.create(var3870)
	buffer.copy(buff_1, 0, buff, 0, var3870)
	
	return buff_1
end

function t_139.decode(p139)
	-- upvalues: t_139 (ref), protoModule (ref), t (ref)
	local var3870 = t_139.new()
	local var3871 = 0
	while var3871 < buffer.len(p139) do
		local _ = nil
		local var3872 = nil
		local var3873, var3874, var3875 = protoModule.readTag(p139, var3871)
		local var3876 = var3873
		var3872 = var3874
		var3871 = var3875
		
		if var3872 == protoModule.wireTypes.varint then
			local _ = nil
			local var3877, var3878 = protoModule.readVarInt(p139, var3871)
			local _ = var3877
			var3871 = var3878
			continue
		end
		if var3872 == protoModule.wireTypes.lengthDelimited then
			if var3876 == 1 then
				local _ = nil
				local var3879, var3880 = protoModule.readBuffer(p139, var3871)
				var3871 = var3880
				var3870.layout = t.ItemLayout.decode(var3879)
			elseif var3876 == 2 then
				local _ = nil
				local var3881, var3882 = protoModule.readBuffer(p139, var3871)
				var3871 = var3882
				var3870.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3881)
				}
			elseif var3876 == 3 then
				local _ = nil
				local var3883, var3884 = protoModule.readBuffer(p139, var3871)
				var3871 = var3884
				var3870.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3883) }
			else
				local _ = nil
				local var3885, var3886 = protoModule.readVarInt(p139, var3871)
				var3871 = var3886 + var3885
			end
		elseif var3872 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3887, var3888 = protoModule.readFixed32(p139, var3871)
			local _ = var3887
			var3871 = var3888
		elseif var3872 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3889, var3890 = protoModule.readFixed64(p139, var3871)
			local _ = var3889
			var3871 = var3890
		else
			error("Unsupported wire type: " .. var5641)
		end
	end
	return var3870
end

function t_139:jsonEncode()
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

function t_139:jsonDecode()
	-- upvalues: t_139 (ref), t (ref)
	local var3891 = t_139.new()
	
	if self.layout ~= nil then
		var3891.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3891.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3891.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3891.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3891
end

t_139.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_139
typeRegistryModule.default:register(t.ItemWithLayout)
local t_140 = {}
t_140.__index = t_140

function t_140.new(p140)
	-- upvalues: t_140 (ref)
	return setmetatable({
		items = if p140 == nil or p140.items == nil then {} else p140.items,
		collection_item_size = if p140 == nil or p140.collection_item_size == nil then nil else p140.collection_item_size
	}, t_140)
end

function t_140:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3891 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3892 = v:encode()
			local var3893, var3894 = protoModule.writeTag(buff, var3891, 1, protoModule.wireTypes.lengthDelimited)
			var3893, var5666 = protoModule.writeBuffer(var3893, var3894, var3892, buffer.len(var3892))
			buff = var3893
			var3891 = var3894
		end
	end
	if self.collection_item_size ~= nil then
		local var3895, var3896 = protoModule.writeTag(buff, var3891, 2, protoModule.wireTypes.lengthDelimited)
		var3895, var5668 = protoModule.writeString(var3895, var3896, self.collection_item_size)
		buff = var3895
		var3891 = var3896
	end
	local buff_1 = buffer.create(var3891)
	buffer.copy(buff_1, 0, buff, 0, var3891)
	
	return buff_1
end

function t_140.decode(p140)
	-- upvalues: t_140 (ref), protoModule (ref), t (ref)
	local var3897 = t_140.new()
	local var3898 = 0
	while var3898 < buffer.len(p140) do
		local _ = nil
		local var3899 = nil
		local var3900, var3901, var3902 = protoModule.readTag(p140, var3898)
		local var3903 = var3900
		var3899 = var3901
		var3898 = var3902
		
		if var3899 == protoModule.wireTypes.varint then
			local _ = nil
			local var3904, var3905 = protoModule.readVarInt(p140, var3898)
			local _ = var3904
			var3898 = var3905
			continue
		end
		if var3899 == protoModule.wireTypes.lengthDelimited then
			if var3903 == 1 then
				local _ = nil
				local var3906, var3907 = protoModule.readBuffer(p140, var3898)
				var3898 = var3907
				table.insert(var3897.items, t.ItemWithLayout.decode(var3906))
			elseif var3903 == 2 then
				local _ = nil
				local var3908, var3909 = protoModule.readBuffer(p140, var3898)
				var3898 = var3909
				var3897.collection_item_size = buffer.tostring(var3908)
			else
				local _ = nil
				local var3910, var3911 = protoModule.readVarInt(p140, var3898)
				var3898 = var3911 + var3910
			end
		elseif var3899 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3912, var3913 = protoModule.readFixed32(p140, var3898)
			local _ = var3912
			var3898 = var3913
		elseif var3899 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3914, var3915 = protoModule.readFixed64(p140, var3898)
			local _ = var3914
			var3898 = var3915
		else
			error("Unsupported wire type: " .. var5672)
		end
	end
	return var3897
end

function t_140:jsonEncode()
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

function t_140:jsonDecode()
	-- upvalues: t_140 (ref), t (ref)
	local var3916 = t_140.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3916.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3916.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3916.collection_item_size = self.collectionItemSize
	end
	return var3916
end

t_140.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_140
typeRegistryModule.default:register(t.ContentPool)
local t_141 = {}
t_141.__index = t_141

function t_141.new(p141)
	-- upvalues: t_141 (ref)
	return setmetatable({
		col_span = if p141 == nil or p141.col_span == nil then 0 else p141.col_span,
		row_span = if p141 == nil or p141.row_span == nil then 0 else p141.row_span,
		alignment_type = if p141 == nil or p141.alignment_type == nil then "" else p141.alignment_type,
		min_row_padding = if p141 == nil or p141.min_row_padding == nil then 0 else p141.min_row_padding
	}, t_141)
end

function t_141:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3917 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3918, var3919 = protoModule.writeTag(buff, var3917, 1, protoModule.wireTypes.varint)
		var3918, var5696 = protoModule.writeVarInt(var3918, var3919, self.col_span)
		buff = var3918
		var3917 = var3919
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3920, var3921 = protoModule.writeTag(buff, var3917, 2, protoModule.wireTypes.varint)
		var3920, var5698 = protoModule.writeVarInt(var3920, var3921, self.row_span)
		buff = var3920
		var3917 = var3921
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3922, var3923 = protoModule.writeTag(buff, var3917, 3, protoModule.wireTypes.lengthDelimited)
		var3922, var5700 = protoModule.writeString(var3922, var3923, self.alignment_type)
		buff = var3922
		var3917 = var3923
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3924, var3925 = protoModule.writeTag(buff, var3917, 4, protoModule.wireTypes.varint)
		var3924, var5702 = protoModule.writeVarInt(var3924, var3925, self.min_row_padding)
		buff = var3924
		var3917 = var3925
	end
	local buff_1 = buffer.create(var3917)
	buffer.copy(buff_1, 0, buff, 0, var3917)
	
	return buff_1
end

function t_141.decode(p141)
	-- upvalues: t_141 (ref), protoModule (ref)
	local var3917 = t_141.new()
	local var3918 = 0
	while var3918 < buffer.len(p141) do
		local _ = nil
		local var3919 = nil
		local var3920, var3921, var3922 = protoModule.readTag(p141, var3918)
		local var3923 = var3920
		var3919 = var3921
		var3918 = var3922
		
		if var3919 == protoModule.wireTypes.varint then
			if var3923 == 1 then
				local _ = nil
				local var3924, var3925 = protoModule.readVarIntI32(p141, var3918)
				var3918 = var3925
				var3917.col_span = var3924
			elseif var3923 == 2 then
				local _ = nil
				local var3926, var3927 = protoModule.readVarIntI32(p141, var3918)
				var3918 = var3927
				var3917.row_span = var3926
			elseif var3923 == 4 then
				local _ = nil
				local var3928, var3929 = protoModule.readVarIntI32(p141, var3918)
				var3918 = var3929
				var3917.min_row_padding = var3928
			else
				local _ = nil
				local var3930, var3931 = protoModule.readVarInt(p141, var3918)
				local _ = var3930
				var3918 = var3931
			end
		end
		if var3919 == protoModule.wireTypes.lengthDelimited then
			if var3923 == 3 then
				local _ = nil
				local var3932, var3933 = protoModule.readBuffer(p141, var3918)
				var3918 = var3933
				var3917.alignment_type = buffer.tostring(var3932)
			else
				local _ = nil
				local var3934, var3935 = protoModule.readVarInt(p141, var3918)
				var3918 = var3935 + var3934
			end
		elseif var3919 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3936, var3937 = protoModule.readFixed32(p141, var3918)
			local _ = var3936
			var3918 = var3937
		elseif var3919 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3938, var3939 = protoModule.readFixed64(p141, var3918)
			local _ = var3938
			var3918 = var3939
		else
			error("Unsupported wire type: " .. var5706)
		end
	end
	return var3917
end

function t_141:jsonEncode()
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

function t_141:jsonDecode()
	-- upvalues: t_141 (ref)
	local var3940 = t_141.new()
	
	if self.col_span ~= nil then
		var3940.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3940.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3940.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3940.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3940.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3940.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3940.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3940.min_row_padding = self.minRowPadding
	end
	return var3940
end

t_141.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_141
typeRegistryModule.default:register(t.ItemLayout)
local t_142 = {}
t_142.__index = t_142

function t_142.new(p142)
	-- upvalues: t_142 (ref)
	return setmetatable({
		community_id = if p142 == nil or p142.community_id == nil then "" else p142.community_id,
		announcement_id = if p142 == nil or p142.announcement_id == nil then "" else p142.announcement_id,
		message_id = if p142 == nil or p142.message_id == nil then "" else p142.message_id,
		title = if p142 == nil or p142.title == nil then "" else p142.title,
		body = if p142 == nil or p142.body == nil then "" else p142.body,
		creator_key = if p142 == nil or p142.creator_key == nil then "" else p142.creator_key,
		creator_role_name = if p142 == nil or p142.creator_role_name == nil then nil else p142.creator_role_name,
		media_asset_id = if p142 == nil or p142.media_asset_id == nil then nil else p142.media_asset_id,
		created_time = if p142 == nil or p142.created_time == nil then nil else p142.created_time
	}, t_142)
end

function t_142:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3940 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3941, var3942 = protoModule.writeTag(buff, var3940, 1, protoModule.wireTypes.lengthDelimited)
		var3941, var5732 = protoModule.writeString(var3941, var3942, self.community_id)
		buff = var3941
		var3940 = var3942
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3943, var3944 = protoModule.writeTag(buff, var3940, 2, protoModule.wireTypes.lengthDelimited)
		var3943, var5734 = protoModule.writeString(var3943, var3944, self.announcement_id)
		buff = var3943
		var3940 = var3944
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3945, var3946 = protoModule.writeTag(buff, var3940, 3, protoModule.wireTypes.lengthDelimited)
		var3945, var5736 = protoModule.writeString(var3945, var3946, self.message_id)
		buff = var3945
		var3940 = var3946
	end
	if self.title ~= nil and self.title ~= "" then
		local var3947, var3948 = protoModule.writeTag(buff, var3940, 4, protoModule.wireTypes.lengthDelimited)
		var3947, var5738 = protoModule.writeString(var3947, var3948, self.title)
		buff = var3947
		var3940 = var3948
	end
	if self.body ~= nil and self.body ~= "" then
		local var3949, var3950 = protoModule.writeTag(buff, var3940, 5, protoModule.wireTypes.lengthDelimited)
		var3949, var5740 = protoModule.writeString(var3949, var3950, self.body)
		buff = var3949
		var3940 = var3950
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3951, var3952 = protoModule.writeTag(buff, var3940, 6, protoModule.wireTypes.lengthDelimited)
		var3951, var5742 = protoModule.writeString(var3951, var3952, self.creator_key)
		buff = var3951
		var3940 = var3952
	end
	if self.creator_role_name ~= nil then
		local var3953, var3954 = protoModule.writeTag(buff, var3940, 7, protoModule.wireTypes.lengthDelimited)
		var3953, var5744 = protoModule.writeString(var3953, var3954, self.creator_role_name)
		buff = var3953
		var3940 = var3954
	end
	if self.media_asset_id ~= nil then
		local var3955, var3956 = protoModule.writeTag(buff, var3940, 8, protoModule.wireTypes.lengthDelimited)
		var3955, var5746 = protoModule.writeString(var3955, var3956, self.media_asset_id)
		buff = var3955
		var3940 = var3956
	end
	if self.created_time ~= nil then
		local var3957 = self.created_time:encode()
		local var3958, var3959 = protoModule.writeTag(buff, var3940, 9, protoModule.wireTypes.lengthDelimited)
		var3958, var5749 = protoModule.writeBuffer(var3958, var3959, var3957, buffer.len(var3957))
		buff = var3958
		var3940 = var3959
	end
	local buff_1 = buffer.create(var3940)
	buffer.copy(buff_1, 0, buff, 0, var3940)
	
	return buff_1
end

function t_142.decode(p142)
	-- upvalues: t_142 (ref), protoModule (ref), timestampModule (ref)
	local var3940 = t_142.new()
	local var3941 = 0
	while var3941 < buffer.len(p142) do
		local _ = nil
		local var3942 = nil
		local var3943, var3944, var3945 = protoModule.readTag(p142, var3941)
		local var3946 = var3943
		var3942 = var3944
		var3941 = var3945
		
		if var3942 == protoModule.wireTypes.varint then
			local _ = nil
			local var3947, var3948 = protoModule.readVarInt(p142, var3941)
			local _ = var3947
			var3941 = var3948
			continue
		end
		if var3942 == protoModule.wireTypes.lengthDelimited then
			if var3946 == 1 then
				local _ = nil
				local var3949, var3950 = protoModule.readBuffer(p142, var3941)
				var3941 = var3950
				var3940.community_id = buffer.tostring(var3949)
			elseif var3946 == 2 then
				local _ = nil
				local var3951, var3952 = protoModule.readBuffer(p142, var3941)
				var3941 = var3952
				var3940.announcement_id = buffer.tostring(var3951)
			elseif var3946 == 3 then
				local _ = nil
				local var3953, var3954 = protoModule.readBuffer(p142, var3941)
				var3941 = var3954
				var3940.message_id = buffer.tostring(var3953)
			elseif var3946 == 4 then
				local _ = nil
				local var3955, var3956 = protoModule.readBuffer(p142, var3941)
				var3941 = var3956
				var3940.title = buffer.tostring(var3955)
			elseif var3946 == 5 then
				local _ = nil
				local var3957, var3958 = protoModule.readBuffer(p142, var3941)
				var3941 = var3958
				var3940.body = buffer.tostring(var3957)
			elseif var3946 == 6 then
				local _ = nil
				local var3959, var3960 = protoModule.readBuffer(p142, var3941)
				var3941 = var3960
				var3940.creator_key = buffer.tostring(var3959)
			elseif var3946 == 7 then
				local _ = nil
				local var3961, var3962 = protoModule.readBuffer(p142, var3941)
				var3941 = var3962
				var3940.creator_role_name = buffer.tostring(var3961)
			elseif var3946 == 8 then
				local _ = nil
				local var3963, var3964 = protoModule.readBuffer(p142, var3941)
				var3941 = var3964
				var3940.media_asset_id = buffer.tostring(var3963)
			elseif var3946 == 9 then
				local _ = nil
				local var3965, var3966 = protoModule.readBuffer(p142, var3941)
				var3941 = var3966
				var3940.created_time = timestampModule.Timestamp.decode(var3965)
			else
				local _ = nil
				local var3967, var3968 = protoModule.readVarInt(p142, var3941)
				var3941 = var3968 + var3967
			end
		elseif var3942 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3969, var3970 = protoModule.readFixed32(p142, var3941)
			local _ = var3969
			var3941 = var3970
		elseif var3942 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3971, var3972 = protoModule.readFixed64(p142, var3941)
			local _ = var3971
			var3941 = var3972
		else
			error("Unsupported wire type: " .. var5753)
		end
	end
	return var3940
end

function t_142:jsonEncode()
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

function t_142:jsonDecode()
	-- upvalues: t_142 (ref), timestampModule (ref)
	local var3973 = t_142.new()
	
	if self.community_id ~= nil then
		var3973.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3973.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3973.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3973.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3973.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3973.message_id = self.messageId
	end
	if self.title ~= nil then
		var3973.title = self.title
	end
	if self.body ~= nil then
		var3973.body = self.body
	end
	if self.creator_key ~= nil then
		var3973.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3973.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3973.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3973.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3973.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3973.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3973.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3973.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3973
end

t_142.descriptor = {
	name = "CommunityAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityAnnouncementInputData"
}
t.CommunityAnnouncementInputData = t_142
typeRegistryModule.default:register(t.CommunityAnnouncementInputData)
local t_143 = {}
t_143.__index = t_143

function t_143.new(p143)
	-- upvalues: t_143 (ref)
	return setmetatable({
		reaction_type = if p143 == nil or p143.reaction_type == nil then "" else p143.reaction_type,
		reaction_count = if p143 == nil or p143.reaction_count == nil then nil else p143.reaction_count,
		emote_id = if p143 == nil or p143.emote_id == nil then "" else p143.emote_id,
		has_user_applied_reaction = if p143 == nil or p143.has_user_applied_reaction == nil then false else p143.has_user_applied_reaction
	}, t_143)
end

function t_143:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3973 = 0
	
	if self.reaction_type ~= nil and self.reaction_type ~= "" then
		local var3974, var3975 = protoModule.writeTag(buff, var3973, 1, protoModule.wireTypes.lengthDelimited)
		var3974, var5789 = protoModule.writeString(var3974, var3975, self.reaction_type)
		buff = var3974
		var3973 = var3975
	end
	if self.reaction_count ~= nil then
		local var3976, var3977 = protoModule.writeTag(buff, var3973, 2, protoModule.wireTypes.varint)
		var3976, var5791 = protoModule.writeVarInt(var3976, var3977, self.reaction_count)
		buff = var3976
		var3973 = var3977
	end
	if self.emote_id ~= nil and self.emote_id ~= "" then
		local var3978, var3979 = protoModule.writeTag(buff, var3973, 3, protoModule.wireTypes.lengthDelimited)
		var3978, var5793 = protoModule.writeString(var3978, var3979, self.emote_id)
		buff = var3978
		var3973 = var3979
	end
	if self.has_user_applied_reaction then
		local var3980, var3981 = protoModule.writeTag(buff, var3973, 4, protoModule.wireTypes.varint)
		var3980, var5795 = protoModule.writeVarInt(var3980, var3981, if self.has_user_applied_reaction then 1 else 0)
		buff = var3980
		var3973 = var3981
	end
	local buff_1 = buffer.create(var3973)
	buffer.copy(buff_1, 0, buff, 0, var3973)
	
	return buff_1
end

function t_143.decode(p143)
	-- upvalues: t_143 (ref), protoModule (ref)
	local var3973 = t_143.new()
	local var3974 = 0
	while var3974 < buffer.len(p143) do
		local _ = nil
		local var3975 = nil
		local var3976, var3977, var3978 = protoModule.readTag(p143, var3974)
		local var3979 = var3976
		var3975 = var3977
		var3974 = var3978
		
		if var3975 == protoModule.wireTypes.varint then
			if var3979 == 2 then
				local _ = nil
				local var3980, var3981 = protoModule.readVarIntI32(p143, var3974)
				var3974 = var3981
				var3973.reaction_count = var3980
			elseif var3979 == 4 then
				local _ = nil
				local var3982, var3983 = protoModule.readVarInt(p143, var3974)
				var3974 = var3983
				var3973.has_user_applied_reaction = var3982 ~= 0
			else
				local _ = nil
				local var3984, var3985 = protoModule.readVarInt(p143, var3974)
				local _ = var3984
				var3974 = var3985
			end
		end
		if var3975 == protoModule.wireTypes.lengthDelimited then
			if var3979 == 1 then
				local _ = nil
				local var3986, var3987 = protoModule.readBuffer(p143, var3974)
				var3974 = var3987
				var3973.reaction_type = buffer.tostring(var3986)
			elseif var3979 == 3 then
				local _ = nil
				local var3988, var3989 = protoModule.readBuffer(p143, var3974)
				var3974 = var3989
				var3973.emote_id = buffer.tostring(var3988)
			else
				local _ = nil
				local var3990, var3991 = protoModule.readVarInt(p143, var3974)
				var3974 = var3991 + var3990
			end
		elseif var3975 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3992, var3993 = protoModule.readFixed32(p143, var3974)
			local _ = var3992
			var3974 = var3993
		elseif var3975 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3994, var3995 = protoModule.readFixed64(p143, var3974)
			local _ = var3994
			var3974 = var3995
		else
			error("Unsupported wire type: " .. var5799)
		end
	end
	return var3973
end

function t_143:jsonEncode()
	local t = {}
	
	if self.reaction_type ~= nil and self.reaction_type ~= "" then
		t.reactionType = self.reaction_type
	end
	if self.reaction_count ~= nil then
		t.reactionCount = self.reaction_count
	end
	if self.emote_id ~= nil and self.emote_id ~= "" then
		t.emoteId = self.emote_id
	end
	if self.has_user_applied_reaction then
		t.hasUserAppliedReaction = self.has_user_applied_reaction
	end
	return t
end

function t_143:jsonDecode()
	-- upvalues: t_143 (ref)
	local var3996 = t_143.new()
	
	if self.reaction_type ~= nil then
		var3996.reaction_type = self.reaction_type
	end
	if self.reactionType ~= nil then
		var3996.reaction_type = self.reactionType
	end
	if self.reaction_count ~= nil then
		var3996.reaction_count = self.reaction_count
	end
	if self.reactionCount ~= nil then
		var3996.reaction_count = self.reactionCount
	end
	if self.emote_id ~= nil then
		var3996.emote_id = self.emote_id
	end
	if self.emoteId ~= nil then
		var3996.emote_id = self.emoteId
	end
	if self.has_user_applied_reaction ~= nil then
		var3996.has_user_applied_reaction = self.has_user_applied_reaction
	end
	if self.hasUserAppliedReaction ~= nil then
		var3996.has_user_applied_reaction = self.hasUserAppliedReaction
	end
	return var3996
end

t_143.descriptor = {
	name = "ReactionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ReactionInputData"
}
t.ReactionInputData = t_143
typeRegistryModule.default:register(t.ReactionInputData)
local t_144 = {}
t_144.__index = t_144

function t_144.new(p144)
	-- upvalues: t_144 (ref)
	return setmetatable({
		group_id = if p144 == nil or p144.group_id == nil then "" else p144.group_id,
		announcement_id = if p144 == nil or p144.announcement_id == nil then "" else p144.announcement_id,
		message_id = if p144 == nil or p144.message_id == nil then "" else p144.message_id,
		title = if p144 == nil or p144.title == nil then "" else p144.title,
		body = if p144 == nil or p144.body == nil then "" else p144.body,
		creator_key = if p144 == nil or p144.creator_key == nil then "" else p144.creator_key,
		creator_role_name = if p144 == nil or p144.creator_role_name == nil then nil else p144.creator_role_name,
		media_asset_id = if p144 == nil or p144.media_asset_id == nil then nil else p144.media_asset_id,
		created_time = if p144 == nil or p144.created_time == nil then nil else p144.created_time,
		custom_form = if p144 == nil or p144.custom_form == nil then nil else p144.custom_form,
		reactions = if p144 == nil or p144.reactions == nil then {} else p144.reactions,
		are_reaction_counts_visible = if p144 == nil or p144.are_reaction_counts_visible == nil then false else p144.are_reaction_counts_visible
	}, t_144)
end

function t_144:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3996 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var3997, var3998 = protoModule.writeTag(buff, var3996, 1, protoModule.wireTypes.lengthDelimited)
		var3997, var5825 = protoModule.writeString(var3997, var3998, self.group_id)
		buff = var3997
		var3996 = var3998
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3999, var4000 = protoModule.writeTag(buff, var3996, 2, protoModule.wireTypes.lengthDelimited)
		var3999, var5827 = protoModule.writeString(var3999, var4000, self.announcement_id)
		buff = var3999
		var3996 = var4000
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var4001, var4002 = protoModule.writeTag(buff, var3996, 3, protoModule.wireTypes.lengthDelimited)
		var4001, var5829 = protoModule.writeString(var4001, var4002, self.message_id)
		buff = var4001
		var3996 = var4002
	end
	if self.title ~= nil and self.title ~= "" then
		local var4003, var4004 = protoModule.writeTag(buff, var3996, 4, protoModule.wireTypes.lengthDelimited)
		var4003, var5831 = protoModule.writeString(var4003, var4004, self.title)
		buff = var4003
		var3996 = var4004
	end
	if self.body ~= nil and self.body ~= "" then
		local var4005, var4006 = protoModule.writeTag(buff, var3996, 5, protoModule.wireTypes.lengthDelimited)
		var4005, var5833 = protoModule.writeString(var4005, var4006, self.body)
		buff = var4005
		var3996 = var4006
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var4007, var4008 = protoModule.writeTag(buff, var3996, 6, protoModule.wireTypes.lengthDelimited)
		var4007, var5835 = protoModule.writeString(var4007, var4008, self.creator_key)
		buff = var4007
		var3996 = var4008
	end
	if self.creator_role_name ~= nil then
		local var4009, var4010 = protoModule.writeTag(buff, var3996, 7, protoModule.wireTypes.lengthDelimited)
		var4009, var5837 = protoModule.writeString(var4009, var4010, self.creator_role_name)
		buff = var4009
		var3996 = var4010
	end
	if self.media_asset_id ~= nil then
		local var4011, var4012 = protoModule.writeTag(buff, var3996, 8, protoModule.wireTypes.lengthDelimited)
		var4011, var5839 = protoModule.writeString(var4011, var4012, self.media_asset_id)
		buff = var4011
		var3996 = var4012
	end
	if self.created_time ~= nil then
		local var4013 = self.created_time:encode()
		local var4014, var4015 = protoModule.writeTag(buff, var3996, 9, protoModule.wireTypes.lengthDelimited)
		var4014, var5842 = protoModule.writeBuffer(var4014, var4015, var4013, buffer.len(var4013))
		buff = var4014
		var3996 = var4015
	end
	if self.custom_form ~= nil then
		local var4016 = self.custom_form:encode()
		local var4017, var4018 = protoModule.writeTag(buff, var3996, 10, protoModule.wireTypes.lengthDelimited)
		var4017, var5845 = protoModule.writeBuffer(var4017, var4018, var4016, buffer.len(var4016))
		buff = var4017
		var3996 = var4018
	end
	if self.reactions ~= nil and #self.reactions > 0 then
		for i, v in self.reactions do
			local var4019 = v:encode()
			local var4020, var4021 = protoModule.writeTag(buff, var3996, 11, protoModule.wireTypes.lengthDelimited)
			var4020, var5848 = protoModule.writeBuffer(var4020, var4021, var4019, buffer.len(var4019))
			buff = var4020
			var3996 = var4021
		end
	end
	if self.are_reaction_counts_visible then
		local var4022, var4023 = protoModule.writeTag(buff, var3996, 12, protoModule.wireTypes.varint)
		var4022, var5850 = protoModule.writeVarInt(var4022, var4023, if self.are_reaction_counts_visible then 1 else 0)
		buff = var4022
		var3996 = var4023
	end
	local buff_1 = buffer.create(var3996)
	buffer.copy(buff_1, 0, buff, 0, var3996)
	
	return buff_1
end

function t_144.decode(p144)
	-- upvalues: t_144 (ref), protoModule (ref), timestampModule (ref), customFormDataModule (ref), t (ref)
	local var4024 = t_144.new()
	local var4025 = 0
	while var4025 < buffer.len(p144) do
		local _ = nil
		local var4026 = nil
		local var4027, var4028, var4029 = protoModule.readTag(p144, var4025)
		local var4030 = var4027
		var4026 = var4028
		var4025 = var4029
		
		if var4026 == protoModule.wireTypes.varint then
			if var4030 == 12 then
				local _ = nil
				local var4031, var4032 = protoModule.readVarInt(p144, var4025)
				var4025 = var4032
				var4024.are_reaction_counts_visible = var4031 ~= 0
			else
				local _ = nil
				local var4033, var4034 = protoModule.readVarInt(p144, var4025)
				local _ = var4033
				var4025 = var4034
			end
		end
		if var4026 == protoModule.wireTypes.lengthDelimited then
			if var4030 == 1 then
				local _ = nil
				local var4035, var4036 = protoModule.readBuffer(p144, var4025)
				var4025 = var4036
				var4024.group_id = buffer.tostring(var4035)
			elseif var4030 == 2 then
				local _ = nil
				local var4037, var4038 = protoModule.readBuffer(p144, var4025)
				var4025 = var4038
				var4024.announcement_id = buffer.tostring(var4037)
			elseif var4030 == 3 then
				local _ = nil
				local var4039, var4040 = protoModule.readBuffer(p144, var4025)
				var4025 = var4040
				var4024.message_id = buffer.tostring(var4039)
			elseif var4030 == 4 then
				local _ = nil
				local var4041, var4042 = protoModule.readBuffer(p144, var4025)
				var4025 = var4042
				var4024.title = buffer.tostring(var4041)
			elseif var4030 == 5 then
				local _ = nil
				local var4043, var4044 = protoModule.readBuffer(p144, var4025)
				var4025 = var4044
				var4024.body = buffer.tostring(var4043)
			elseif var4030 == 6 then
				local _ = nil
				local var4045, var4046 = protoModule.readBuffer(p144, var4025)
				var4025 = var4046
				var4024.creator_key = buffer.tostring(var4045)
			elseif var4030 == 7 then
				local _ = nil
				local var4047, var4048 = protoModule.readBuffer(p144, var4025)
				var4025 = var4048
				var4024.creator_role_name = buffer.tostring(var4047)
			elseif var4030 == 8 then
				local _ = nil
				local var4049, var4050 = protoModule.readBuffer(p144, var4025)
				var4025 = var4050
				var4024.media_asset_id = buffer.tostring(var4049)
			elseif var4030 == 9 then
				local _ = nil
				local var4051, var4052 = protoModule.readBuffer(p144, var4025)
				var4025 = var4052
				var4024.created_time = timestampModule.Timestamp.decode(var4051)
			elseif var4030 == 10 then
				local _ = nil
				local var4053, var4054 = protoModule.readBuffer(p144, var4025)
				var4025 = var4054
				var4024.custom_form = customFormDataModule.CustomFormData.decode(var4053)
			elseif var4030 == 11 then
				local _ = nil
				local var4055, var4056 = protoModule.readBuffer(p144, var4025)
				var4025 = var4056
				table.insert(var4024.reactions, t.ReactionInputData.decode(var4055))
			else
				local _ = nil
				local var4057, var4058 = protoModule.readVarInt(p144, var4025)
				var4025 = var4058 + var4057
			end
		elseif var4026 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4059, var4060 = protoModule.readFixed32(p144, var4025)
			local _ = var4059
			var4025 = var4060
		elseif var4026 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4061, var4062 = protoModule.readFixed64(p144, var4025)
			local _ = var4061
			var4025 = var4062
		else
			error("Unsupported wire type: " .. var5854)
		end
	end
	return var4024
end

function t_144:jsonEncode()
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
	if self.custom_form ~= nil then
		t.customForm = self.custom_form:jsonEncode()
	end
	if self.reactions ~= nil and #self.reactions > 0 then
		local t_1 = {}
		
		for i, v in self.reactions do
			table.insert(t_1, v:jsonEncode())
		end
		t.reactions = t_1
	end
	if self.are_reaction_counts_visible then
		t.areReactionCountsVisible = self.are_reaction_counts_visible
	end
	return t
end

function t_144:jsonDecode()
	-- upvalues: t_144 (ref), timestampModule (ref), customFormDataModule (ref), t (ref)
	local var4063 = t_144.new()
	
	if self.group_id ~= nil then
		var4063.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var4063.group_id = self.groupId
	end
	if self.announcement_id ~= nil then
		var4063.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var4063.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var4063.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var4063.message_id = self.messageId
	end
	if self.title ~= nil then
		var4063.title = self.title
	end
	if self.body ~= nil then
		var4063.body = self.body
	end
	if self.creator_key ~= nil then
		var4063.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var4063.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var4063.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var4063.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var4063.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var4063.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var4063.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var4063.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	if self.custom_form ~= nil then
		var4063.custom_form = customFormDataModule.CustomFormData.jsonDecode(self.custom_form)
	end
	if self.customForm ~= nil then
		var4063.custom_form = customFormDataModule.CustomFormData.jsonDecode(self.customForm)
	end
	if self.reactions ~= nil then
		local t_1 = {}
		
		for i, v in self.reactions do
			table.insert(t_1, t.ReactionInputData.jsonDecode(v))
		end
		var4063.reactions = t_1
	end
	if self.are_reaction_counts_visible ~= nil then
		var4063.are_reaction_counts_visible = self.are_reaction_counts_visible
	end
	if self.areReactionCountsVisible ~= nil then
		var4063.are_reaction_counts_visible = self.areReactionCountsVisible
	end
	return var4063
end

t_144.descriptor = {
	name = "GroupAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GroupAnnouncementInputData"
}
t.GroupAnnouncementInputData = t_144
typeRegistryModule.default:register(t.GroupAnnouncementInputData)
t.PageEntryFormat = {
	fromNumber = function(p145)
		return if p145 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p145 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p145)
		return if p145 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p145 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p145
	end,
	fromName = function(p145)
		return if p145 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p145 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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
	ExperienceLeaderboardInputData = t.ExperienceLeaderboardInputData,
	ExperienceLeaderboardInputData_UserItem = t.ExperienceLeaderboardInputData_UserItem,
	ExperienceLeaderboardInputData_CurrentUserItem = t.ExperienceLeaderboardInputData_CurrentUserItem,
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
	ReactionInputData = t.ReactionInputData,
	GroupAnnouncementInputData = t.GroupAnnouncementInputData,
	PageEntryFormat = t.PageEntryFormat
}