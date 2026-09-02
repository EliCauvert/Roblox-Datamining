local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
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
		var3, var139 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.input_data ~= nil then
		local var5 = self.input_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var142 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
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
			error("Unsupported wire type: " .. var146)
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
		var22, var169 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var20 = var23
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var24, var171 = protoModule.writeString(var24, var25, self.roblox_component)
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
			error("Unsupported wire type: " .. var175)
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
		var40, var197 = protoModule.writeString(var40, var41, self.roblox_component)
		buff = var40
		var39 = var41
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var42 = self.input_data.value:encode()
		local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var43, var200 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var39 = var44
	end
	if self.cta_buttons ~= nil then
		local var45 = self.cta_buttons:encode()
		local var46, var47 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
		var46, var203 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
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
			error("Unsupported wire type: " .. var207)
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
		var61, var231 = protoModule.writeString(var61, var62, self.roblox_component)
		buff = var61
		var60 = var62
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var63 = self.input_data.value:encode()
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var234 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var60 = var65
		elseif self.input_data.type == "video" then
			local var66 = self.input_data.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var237 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
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
			error("Unsupported wire type: " .. var241)
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
			var83, var266 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var81 = var84
		elseif self.kind.type == "badge_details" then
			local var85 = self.kind.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
			var86, var269 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var81 = var87
		elseif self.kind.type == "static_content" then
			local var88 = self.kind.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var81, 3, protoModule.wireTypes.lengthDelimited)
			var89, var272 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var81 = var90
		elseif self.kind.type == "experience_attribution_row" then
			local var91 = self.kind.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var81, 4, protoModule.wireTypes.lengthDelimited)
			var92, var275 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var81 = var93
		elseif self.kind.type == "experience_action_module" then
			local var94 = self.kind.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var81, 5, protoModule.wireTypes.lengthDelimited)
			var95, var278 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var81 = var96
		elseif self.kind.type == "experience_media_gallery" then
			local var97 = self.kind.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var81, 6, protoModule.wireTypes.lengthDelimited)
			var98, var281 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var81 = var99
		elseif self.kind.type == "experience_description" then
			local var100 = self.kind.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var81, 7, protoModule.wireTypes.lengthDelimited)
			var101, var284 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var81 = var102
		elseif self.kind.type == "experience_stat_row" then
			local var103 = self.kind.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var81, 8, protoModule.wireTypes.lengthDelimited)
			var104, var287 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var81 = var105
		elseif self.kind.type == "experience_info_table" then
			local var106 = self.kind.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var81, 9, protoModule.wireTypes.lengthDelimited)
			var107, var290 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var81 = var108
		elseif self.kind.type == "social_link_row" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var81, 10, protoModule.wireTypes.lengthDelimited)
			var110, var293 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var81 = var111
		elseif self.kind.type == "experience_carousel" then
			local var112 = self.kind.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var81, 11, protoModule.wireTypes.lengthDelimited)
			var113, var296 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var81 = var114
		elseif self.kind.type == "song_carousel" then
			local var115 = self.kind.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var81, 12, protoModule.wireTypes.lengthDelimited)
			var116, var299 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var81 = var117
		elseif self.kind.type == "events_carousel" then
			local var118 = self.kind.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var81, 13, protoModule.wireTypes.lengthDelimited)
			var119, var302 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var81 = var120
		elseif self.kind.type == "game_pass_collection" then
			local var121 = self.kind.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var81, 14, protoModule.wireTypes.lengthDelimited)
			var122, var305 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var81 = var123
		elseif self.kind.type == "developer_product_collection" then
			local var124 = self.kind.value:encode()
			local var125, var126 = protoModule.writeTag(buff, var81, 15, protoModule.wireTypes.lengthDelimited)
			var125, var308 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
			buff = var125
			var81 = var126
		elseif self.kind.type == "subscription_collection" then
			local var127 = self.kind.value:encode()
			local var128, var129 = protoModule.writeTag(buff, var81, 16, protoModule.wireTypes.lengthDelimited)
			var128, var311 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var81 = var129
		elseif self.kind.type == "dynamic_store_category" then
			local var130 = self.kind.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var81, 17, protoModule.wireTypes.lengthDelimited)
			var131, var314 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var81 = var132
		elseif self.kind.type == "card_container" then
			local var133 = self.kind.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var81, 20, protoModule.wireTypes.lengthDelimited)
			var134, var317 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var81 = var135
		elseif self.kind.type == "card" then
			local var136 = self.kind.value:encode()
			local var137, var138 = protoModule.writeTag(buff, var81, 21, protoModule.wireTypes.lengthDelimited)
			var137, var320 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
			buff = var137
			var81 = var138
		elseif self.kind.type == "dialog" then
			local var139 = self.kind.value:encode()
			local var140, var141 = protoModule.writeTag(buff, var81, 22, protoModule.wireTypes.lengthDelimited)
			var140, var323 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var81 = var141
		elseif self.kind.type == "banner" then
			local var142 = self.kind.value:encode()
			local var143, var144 = protoModule.writeTag(buff, var81, 23, protoModule.wireTypes.lengthDelimited)
			var143, var326 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
			buff = var143
			var81 = var144
		elseif self.kind.type == "tooltip" then
			local var145 = self.kind.value:encode()
			local var146, var147 = protoModule.writeTag(buff, var81, 24, protoModule.wireTypes.lengthDelimited)
			var146, var329 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var81 = var147
		elseif self.kind.type == "coachmark" then
			local var148 = self.kind.value:encode()
			local var149, var150 = protoModule.writeTag(buff, var81, 25, protoModule.wireTypes.lengthDelimited)
			var149, var332 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
			buff = var149
			var81 = var150
		elseif self.kind.type == "system_banner_prompt" then
			local var151 = self.kind.value:encode()
			local var152, var153 = protoModule.writeTag(buff, var81, 28, protoModule.wireTypes.lengthDelimited)
			var152, var335 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
			buff = var152
			var81 = var153
		elseif self.kind.type == "age_check_upsell" then
			local var154 = self.kind.value:encode()
			local var155, var156 = protoModule.writeTag(buff, var81, 29, protoModule.wireTypes.lengthDelimited)
			var155, var338 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
			buff = var155
			var81 = var156
		elseif self.kind.type == "catalog_item_list" then
			local var157 = self.kind.value:encode()
			local var158, var159 = protoModule.writeTag(buff, var81, 26, protoModule.wireTypes.lengthDelimited)
			var158, var341 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var81 = var159
		elseif self.kind.type == "user_list" then
			local var160 = self.kind.value:encode()
			local var161, var162 = protoModule.writeTag(buff, var81, 27, protoModule.wireTypes.lengthDelimited)
			var161, var344 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
			buff = var161
			var81 = var162
		elseif self.kind.type == "experience_content_rating_label" then
			local var163 = self.kind.value:encode()
			local var164, var165 = protoModule.writeTag(buff, var81, 30, protoModule.wireTypes.lengthDelimited)
			var164, var347 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
			buff = var164
			var81 = var165
		elseif self.kind.type == "experience_refund_policy" then
			local var166 = self.kind.value:encode()
			local var167, var168 = protoModule.writeTag(buff, var81, 31, protoModule.wireTypes.lengthDelimited)
			var167, var350 = protoModule.writeBuffer(var167, var168, var166, buffer.len(var166))
			buff = var167
			var81 = var168
		elseif self.kind.type == "experience_play_with_reward" then
			local var169 = self.kind.value:encode()
			local var170, var171 = protoModule.writeTag(buff, var81, 32, protoModule.wireTypes.lengthDelimited)
			var170, var353 = protoModule.writeBuffer(var170, var171, var169, buffer.len(var169))
			buff = var170
			var81 = var171
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var172 = self.kind.value:encode()
			local var173, var174 = protoModule.writeTag(buff, var81, 33, protoModule.wireTypes.lengthDelimited)
			var173, var356 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
			buff = var173
			var81 = var174
		elseif self.kind.type == "community_section" then
			local var175 = self.kind.value:encode()
			local var176, var177 = protoModule.writeTag(buff, var81, 35, protoModule.wireTypes.lengthDelimited)
			var176, var359 = protoModule.writeBuffer(var176, var177, var175, buffer.len(var175))
			buff = var176
			var81 = var177
		elseif self.kind.type == "moments_carousel" then
			local var178 = self.kind.value:encode()
			local var179, var180 = protoModule.writeTag(buff, var81, 34, protoModule.wireTypes.lengthDelimited)
			var179, var362 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var81 = var180
		elseif self.kind.type == "text" then
			local var181 = self.kind.value:encode()
			local var182, var183 = protoModule.writeTag(buff, var81, 40, protoModule.wireTypes.lengthDelimited)
			var182, var365 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
			buff = var182
			var81 = var183
		elseif self.kind.type == "vertical_feed" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var81, 41, protoModule.wireTypes.lengthDelimited)
			var185, var368 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var81 = var186
		elseif self.kind.type == "page_header" then
			local var187 = self.kind.value:encode()
			local var188, var189 = protoModule.writeTag(buff, var81, 42, protoModule.wireTypes.lengthDelimited)
			var188, var371 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var81 = var189
		elseif self.kind.type == "image_cta_section" then
			local var190 = self.kind.value:encode()
			local var191, var192 = protoModule.writeTag(buff, var81, 43, protoModule.wireTypes.lengthDelimited)
			var191, var374 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
			buff = var191
			var81 = var192
		elseif self.kind.type == "experience_details_feed" then
			local var193 = self.kind.value:encode()
			local var194, var195 = protoModule.writeTag(buff, var81, 500, protoModule.wireTypes.lengthDelimited)
			var194, var377 = protoModule.writeBuffer(var194, var195, var193, buffer.len(var193))
			buff = var194
			var81 = var195
		elseif self.kind.type == "experience_details_action_bar" then
			local var196 = self.kind.value:encode()
			local var197, var198 = protoModule.writeTag(buff, var81, 501, protoModule.wireTypes.lengthDelimited)
			var197, var380 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
			buff = var197
			var81 = var198
		elseif self.kind.type == "experience_details_banner_image" then
			local var199 = self.kind.value:encode()
			local var200, var201 = protoModule.writeTag(buff, var81, 502, protoModule.wireTypes.lengthDelimited)
			var200, var383 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
			buff = var200
			var81 = var201
		elseif self.kind.type == "experience_details_sticky_header" then
			local var202 = self.kind.value:encode()
			local var203, var204 = protoModule.writeTag(buff, var81, 503, protoModule.wireTypes.lengthDelimited)
			var203, var386 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
			buff = var203
			var81 = var204
		elseif self.kind.type == "event_details_feed" then
			local var205 = self.kind.value:encode()
			local var206, var207 = protoModule.writeTag(buff, var81, 600, protoModule.wireTypes.lengthDelimited)
			var206, var389 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var81 = var207
		elseif self.kind.type == "event_details_action_bar" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var81, 601, protoModule.wireTypes.lengthDelimited)
			var209, var392 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var81 = var210
		elseif self.kind.type == "event_attribution_row" then
			local var211 = self.kind.value:encode()
			local var212, var213 = protoModule.writeTag(buff, var81, 602, protoModule.wireTypes.lengthDelimited)
			var212, var395 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
			buff = var212
			var81 = var213
		elseif self.kind.type == "event_description" then
			local var214 = self.kind.value:encode()
			local var215, var216 = protoModule.writeTag(buff, var81, 603, protoModule.wireTypes.lengthDelimited)
			var215, var398 = protoModule.writeBuffer(var215, var216, var214, buffer.len(var214))
			buff = var215
			var81 = var216
		elseif self.kind.type == "event_info_table" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var81, 604, protoModule.wireTypes.lengthDelimited)
			var218, var401 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var81 = var219
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var220 = self.kind.value:encode()
			local var221, var222 = protoModule.writeTag(buff, var81, 605, protoModule.wireTypes.lengthDelimited)
			var221, var404 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var81 = var222
		elseif self.kind.type == "event_notifications_modal" then
			local var223 = self.kind.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var81, 606, protoModule.wireTypes.lengthDelimited)
			var224, var407 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var81 = var225
		elseif self.kind.type == "dev_store_feed" then
			local var226 = self.kind.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var81, 700, protoModule.wireTypes.lengthDelimited)
			var227, var410 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var81 = var228
		elseif self.kind.type == "charts_feed" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var81, 800, protoModule.wireTypes.lengthDelimited)
			var230, var413 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var81 = var231
		elseif self.kind.type == "filter_pills" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var81, 801, protoModule.wireTypes.lengthDelimited)
			var233, var416 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var81 = var234
		elseif self.kind.type == "sort_selector" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var81, 802, protoModule.wireTypes.lengthDelimited)
			var236, var419 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var81 = var237
		elseif self.kind.type == "genre_selector" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var81, 803, protoModule.wireTypes.lengthDelimited)
			var239, var422 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var81 = var240
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var81, 900, protoModule.wireTypes.lengthDelimited)
			var242, var425 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var81 = var243
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var81, 901, protoModule.wireTypes.lengthDelimited)
			var245, var428 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var81 = var246
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var81, 902, protoModule.wireTypes.lengthDelimited)
			var248, var431 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var81 = var249
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var81, 903, protoModule.wireTypes.lengthDelimited)
			var251, var434 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var81 = var252
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var81, 904, protoModule.wireTypes.lengthDelimited)
			var254, var437 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var81 = var255
		elseif self.kind.type == "catalog_item_grid" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var81, 905, protoModule.wireTypes.lengthDelimited)
			var257, var440 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var81 = var258
		elseif self.kind.type == "marketplace_offer_modal" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var81, 906, protoModule.wireTypes.lengthDelimited)
			var260, var443 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var81 = var261
		elseif self.kind.type == "search_results_feed" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var81, 1000, protoModule.wireTypes.lengthDelimited)
			var263, var446 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var81 = var264
		elseif self.kind.type == "power_search_ai_overview" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var81, 1001, protoModule.wireTypes.lengthDelimited)
			var266, var449 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var81 = var267
		elseif self.kind.type == "experience_emphasis_tile" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var81, 1002, protoModule.wireTypes.lengthDelimited)
			var269, var452 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var81 = var270
		elseif self.kind.type == "option_selector_carousel" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var81, 1100, protoModule.wireTypes.lengthDelimited)
			var272, var455 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var81 = var273
		elseif self.kind.type == "game_items_carousel" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var81, 1101, protoModule.wireTypes.lengthDelimited)
			var275, var458 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var81 = var276
		elseif self.kind.type == "hero_unit" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var81, 1102, protoModule.wireTypes.lengthDelimited)
			var278, var461 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var81 = var279
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var81, 1103, protoModule.wireTypes.lengthDelimited)
			var281, var464 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var81 = var282
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var81, 1200, protoModule.wireTypes.lengthDelimited)
			var284, var467 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var81 = var285
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var81, 1300, protoModule.wireTypes.lengthDelimited)
			var287, var470 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var81 = var288
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
			else
				local _ = nil
				local var228, var229 = protoModule.readVarInt(p5, var82)
				var82 = var229 + var228
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var230, var231 = protoModule.readFixed32(p5, var82)
			local _ = var230
			var82 = var231
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var232, var233 = protoModule.readFixed64(p5, var82)
			local _ = var232
			var82 = var233
		else
			error("Unsupported wire type: " .. var474)
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
		end
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var234 = t_5.new()
	
	if self.badges_grid ~= nil then
		var234.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var234.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var234.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var234.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var234.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var234.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var234.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var234.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var234.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var234.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var234.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var234.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var234.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var234.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var234.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var234.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var234.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var234.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var234.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var234.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var234.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var234.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var234.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var234.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var234.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var234.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var234.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var234.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var234.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var234.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var234.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var234.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var234.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var234.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var234.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var234.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var234.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var234.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var234.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var234.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var234.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var234.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var234.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var234.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var234.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var234.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var234.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var234.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var234.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var234.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var234.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var234.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var234.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var234.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var234.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var234.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var234.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var234.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var234.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var234.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var234.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var234.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var234.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var234.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var234.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var234.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var234.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var234.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.experience_details_feed ~= nil then
		var234.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var234.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var234.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var234.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var234.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var234.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var234.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var234.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var234.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var234.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var234.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var234.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var234.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var234.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var234.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var234.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var234.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var234.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var234.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var234.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var234.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var234.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var234.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var234.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var234.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var234.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var234.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var234.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var234.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var234.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var234.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var234.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var234.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var234.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var234.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var234.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var234.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var234.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var234.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var234.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var234.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var234.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var234.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var234.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var234.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var234.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var234.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var234.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var234.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var234.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var234.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var234.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var234.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var234.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var234.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var234.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var234.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var234.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var234.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var234.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var234.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var234.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var234.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var234.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	return var234
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
	local var234 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var235, var236 = protoModule.writeTag(buff, var234, 1, protoModule.wireTypes.lengthDelimited)
		var235, var630 = protoModule.writeString(var235, var236, self.section_title)
		buff = var235
		var234 = var236
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var237 = v:encode()
			local var238, var239 = protoModule.writeTag(buff, var234, 2, protoModule.wireTypes.lengthDelimited)
			var238, var633 = protoModule.writeBuffer(var238, var239, var237, buffer.len(var237))
			buff = var238
			var234 = var239
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var240, var241 = protoModule.writeTag(buff, var234, 3, protoModule.wireTypes.lengthDelimited)
		var240, var635 = protoModule.writeString(var240, var241, self.collection_id)
		buff = var240
		var234 = var241
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var242, var243 = protoModule.writeTag(buff, var234, 4, protoModule.wireTypes.lengthDelimited)
		var242, var637 = protoModule.writeString(var242, var243, self.collection_position)
		buff = var242
		var234 = var243
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var244, var245 = protoModule.writeTag(buff, var234, 5, protoModule.wireTypes.lengthDelimited)
		var244, var639 = protoModule.writeString(var244, var245, self.universe_id)
		buff = var244
		var234 = var245
	end
	local buff_1 = buffer.create(var234)
	buffer.copy(buff_1, 0, buff, 0, var234)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var246 = t_6.new()
	local var247 = 0
	while var247 < buffer.len(p6) do
		local _ = nil
		local var248 = nil
		local var249, var250, var251 = protoModule.readTag(p6, var247)
		local var252 = var249
		var248 = var250
		var247 = var251
		
		if var248 == protoModule.wireTypes.varint then
			local _ = nil
			local var253, var254 = protoModule.readVarInt(p6, var247)
			local _ = var253
			var247 = var254
			continue
		end
		if var248 == protoModule.wireTypes.lengthDelimited then
			if var252 == 1 then
				local _ = nil
				local var255, var256 = protoModule.readBuffer(p6, var247)
				var247 = var256
				var246.section_title = buffer.tostring(var255)
			elseif var252 == 2 then
				local _ = nil
				local var257, var258 = protoModule.readBuffer(p6, var247)
				var247 = var258
				table.insert(var246.badges, t.BadgesGridInputData_BadgeInputData.decode(var257))
			elseif var252 == 3 then
				local _ = nil
				local var259, var260 = protoModule.readBuffer(p6, var247)
				var247 = var260
				var246.collection_id = buffer.tostring(var259)
			elseif var252 == 4 then
				local _ = nil
				local var261, var262 = protoModule.readBuffer(p6, var247)
				var247 = var262
				var246.collection_position = buffer.tostring(var261)
			elseif var252 == 5 then
				local _ = nil
				local var263, var264 = protoModule.readBuffer(p6, var247)
				var247 = var264
				var246.universe_id = buffer.tostring(var263)
			else
				local _ = nil
				local var265, var266 = protoModule.readVarInt(p6, var247)
				var247 = var266 + var265
			end
		elseif var248 == protoModule.wireTypes.i32 then
			local _ = nil
			local var267, var268 = protoModule.readFixed32(p6, var247)
			local _ = var267
			var247 = var268
		elseif var248 == protoModule.wireTypes.i64 then
			local _ = nil
			local var269, var270 = protoModule.readFixed64(p6, var247)
			local _ = var269
			var247 = var270
		else
			error("Unsupported wire type: " .. var643)
		end
	end
	return var246
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
	local var271 = t_6.new()
	
	if self.section_title ~= nil then
		var271.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var271.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var271.badges = t_1
	end
	if self.collection_id ~= nil then
		var271.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var271.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var271.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var271.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var271.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var271.universe_id = self.universeId
	end
	return var271
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
	local var272 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var273, var274 = protoModule.writeTag(buff, var272, 1, protoModule.wireTypes.lengthDelimited)
		var273, var673 = protoModule.writeString(var273, var274, self.badge_id)
		buff = var273
		var272 = var274
	end
	local buff_1 = buffer.create(var272)
	buffer.copy(buff_1, 0, buff, 0, var272)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var272 = t_7.new()
	local var273 = 0
	while var273 < buffer.len(p7) do
		local _ = nil
		local var274 = nil
		local var275, var276, var277 = protoModule.readTag(p7, var273)
		local var278 = var275
		var274 = var276
		var273 = var277
		
		if var274 == protoModule.wireTypes.varint then
			local _ = nil
			local var279, var280 = protoModule.readVarInt(p7, var273)
			local _ = var279
			var273 = var280
			continue
		end
		if var274 == protoModule.wireTypes.lengthDelimited then
			if var278 == 1 then
				local _ = nil
				local var281, var282 = protoModule.readBuffer(p7, var273)
				var273 = var282
				var272.badge_id = buffer.tostring(var281)
			else
				local _ = nil
				local var283, var284 = protoModule.readVarInt(p7, var273)
				var273 = var284 + var283
			end
		elseif var274 == protoModule.wireTypes.i32 then
			local _ = nil
			local var285, var286 = protoModule.readFixed32(p7, var273)
			local _ = var285
			var273 = var286
		elseif var274 == protoModule.wireTypes.i64 then
			local _ = nil
			local var287, var288 = protoModule.readFixed64(p7, var273)
			local _ = var287
			var273 = var288
		else
			error("Unsupported wire type: " .. var677)
		end
	end
	return var272
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
	local var289 = t_7.new()
	
	if self.badge_id ~= nil then
		var289.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var289.badge_id = self.badgeId
	end
	return var289
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
	local var289 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var290, var291 = protoModule.writeTag(buff, var289, 1, protoModule.wireTypes.lengthDelimited)
		var290, var697 = protoModule.writeString(var290, var291, self.badge_id)
		buff = var290
		var289 = var291
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var292, var293 = protoModule.writeTag(buff, var289, 2, protoModule.wireTypes.lengthDelimited)
		var292, var699 = protoModule.writeString(var292, var293, self.universe_id)
		buff = var292
		var289 = var293
	end
	if self.localized_literals ~= nil then
		local var294 = self.localized_literals:encode()
		local var295, var296 = protoModule.writeTag(buff, var289, 3, protoModule.wireTypes.lengthDelimited)
		var295, var702 = protoModule.writeBuffer(var295, var296, var294, buffer.len(var294))
		buff = var295
		var289 = var296
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var297, var298 = protoModule.writeTag(buff, var289, 4, protoModule.wireTypes.lengthDelimited)
		var297, var704 = protoModule.writeString(var297, var298, self.creator_key)
		buff = var297
		var289 = var298
	end
	local buff_1 = buffer.create(var289)
	buffer.copy(buff_1, 0, buff, 0, var289)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var289 = t_8.new()
	local var290 = 0
	while var290 < buffer.len(p8) do
		local _ = nil
		local var291 = nil
		local var292, var293, var294 = protoModule.readTag(p8, var290)
		local var295 = var292
		var291 = var293
		var290 = var294
		
		if var291 == protoModule.wireTypes.varint then
			local _ = nil
			local var296, var297 = protoModule.readVarInt(p8, var290)
			local _ = var296
			var290 = var297
			continue
		end
		if var291 == protoModule.wireTypes.lengthDelimited then
			if var295 == 1 then
				local _ = nil
				local var298, var299 = protoModule.readBuffer(p8, var290)
				var290 = var299
				var289.badge_id = buffer.tostring(var298)
			elseif var295 == 2 then
				local _ = nil
				local var300, var301 = protoModule.readBuffer(p8, var290)
				var290 = var301
				var289.universe_id = buffer.tostring(var300)
			elseif var295 == 3 then
				local _ = nil
				local var302, var303 = protoModule.readBuffer(p8, var290)
				var290 = var303
				var289.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var302)
			elseif var295 == 4 then
				local _ = nil
				local var304, var305 = protoModule.readBuffer(p8, var290)
				var290 = var305
				var289.creator_key = buffer.tostring(var304)
			else
				local _ = nil
				local var306, var307 = protoModule.readVarInt(p8, var290)
				var290 = var307 + var306
			end
		elseif var291 == protoModule.wireTypes.i32 then
			local _ = nil
			local var308, var309 = protoModule.readFixed32(p8, var290)
			local _ = var308
			var290 = var309
		elseif var291 == protoModule.wireTypes.i64 then
			local _ = nil
			local var310, var311 = protoModule.readFixed64(p8, var290)
			local _ = var310
			var290 = var311
		else
			error("Unsupported wire type: " .. var708)
		end
	end
	return var289
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
	local var312 = t_8.new()
	
	if self.badge_id ~= nil then
		var312.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var312.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var312.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var312.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var312.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var312.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var312.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var312.creator_key = self.creatorKey
	end
	return var312
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
	local var312 = 0
	
	if self.info_table ~= nil then
		local var313 = self.info_table:encode()
		local var314, var315 = protoModule.writeTag(buff, var312, 1, protoModule.wireTypes.lengthDelimited)
		var314, var735 = protoModule.writeBuffer(var314, var315, var313, buffer.len(var313))
		buff = var314
		var312 = var315
	end
	if self.action_module ~= nil then
		local var316 = self.action_module:encode()
		local var317, var318 = protoModule.writeTag(buff, var312, 2, protoModule.wireTypes.lengthDelimited)
		var317, var738 = protoModule.writeBuffer(var317, var318, var316, buffer.len(var316))
		buff = var317
		var312 = var318
	end
	if self.overflow_menu ~= nil then
		local var319 = self.overflow_menu:encode()
		local var320, var321 = protoModule.writeTag(buff, var312, 3, protoModule.wireTypes.lengthDelimited)
		var320, var741 = protoModule.writeBuffer(var320, var321, var319, buffer.len(var319))
		buff = var320
		var312 = var321
	end
	local buff_1 = buffer.create(var312)
	buffer.copy(buff_1, 0, buff, 0, var312)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var312 = t_9.new()
	local var313 = 0
	while var313 < buffer.len(p9) do
		local _ = nil
		local var314 = nil
		local var315, var316, var317 = protoModule.readTag(p9, var313)
		local var318 = var315
		var314 = var316
		var313 = var317
		
		if var314 == protoModule.wireTypes.varint then
			local _ = nil
			local var319, var320 = protoModule.readVarInt(p9, var313)
			local _ = var319
			var313 = var320
			continue
		end
		if var314 == protoModule.wireTypes.lengthDelimited then
			if var318 == 1 then
				local _ = nil
				local var321, var322 = protoModule.readBuffer(p9, var313)
				var313 = var322
				var312.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var321)
			elseif var318 == 2 then
				local _ = nil
				local var323, var324 = protoModule.readBuffer(p9, var313)
				var313 = var324
				var312.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var323)
			elseif var318 == 3 then
				local _ = nil
				local var325, var326 = protoModule.readBuffer(p9, var313)
				var313 = var326
				var312.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var325)
			else
				local _ = nil
				local var327, var328 = protoModule.readVarInt(p9, var313)
				var313 = var328 + var327
			end
		elseif var314 == protoModule.wireTypes.i32 then
			local _ = nil
			local var329, var330 = protoModule.readFixed32(p9, var313)
			local _ = var329
			var313 = var330
		elseif var314 == protoModule.wireTypes.i64 then
			local _ = nil
			local var331, var332 = protoModule.readFixed64(p9, var313)
			local _ = var331
			var313 = var332
		else
			error("Unsupported wire type: " .. var745)
		end
	end
	return var312
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
	local var333 = t_9.new()
	
	if self.info_table ~= nil then
		var333.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var333.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var333.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var333.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var333.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var333.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var333
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
	local var333 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var334, var335 = protoModule.writeTag(buff, var333, 1, protoModule.wireTypes.lengthDelimited)
		var334, var769 = protoModule.writeString(var334, var335, self.type_label)
		buff = var334
		var333 = var335
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var336, var337 = protoModule.writeTag(buff, var333, 2, protoModule.wireTypes.lengthDelimited)
		var336, var771 = protoModule.writeString(var336, var337, self.earned_label)
		buff = var336
		var333 = var337
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var338, var339 = protoModule.writeTag(buff, var333, 3, protoModule.wireTypes.lengthDelimited)
		var338, var773 = protoModule.writeString(var338, var339, self.updated_label)
		buff = var338
		var333 = var339
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var340, var341 = protoModule.writeTag(buff, var333, 4, protoModule.wireTypes.lengthDelimited)
		var340, var775 = protoModule.writeString(var340, var341, self.experience_label)
		buff = var340
		var333 = var341
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var342, var343 = protoModule.writeTag(buff, var333, 5, protoModule.wireTypes.lengthDelimited)
		var342, var777 = protoModule.writeString(var342, var343, self.rarity_label)
		buff = var342
		var333 = var343
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var344, var345 = protoModule.writeTag(buff, var333, 6, protoModule.wireTypes.lengthDelimited)
		var344, var779 = protoModule.writeString(var344, var345, self.won_yesterday_label)
		buff = var344
		var333 = var345
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var346, var347 = protoModule.writeTag(buff, var333, 7, protoModule.wireTypes.lengthDelimited)
		var346, var781 = protoModule.writeString(var346, var347, self.won_ever_label)
		buff = var346
		var333 = var347
	end
	local buff_1 = buffer.create(var333)
	buffer.copy(buff_1, 0, buff, 0, var333)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var333 = t_10.new()
	local var334 = 0
	while var334 < buffer.len(p10) do
		local _ = nil
		local var335 = nil
		local var336, var337, var338 = protoModule.readTag(p10, var334)
		local var339 = var336
		var335 = var337
		var334 = var338
		
		if var335 == protoModule.wireTypes.varint then
			local _ = nil
			local var340, var341 = protoModule.readVarInt(p10, var334)
			local _ = var340
			var334 = var341
			continue
		end
		if var335 == protoModule.wireTypes.lengthDelimited then
			if var339 == 1 then
				local _ = nil
				local var342, var343 = protoModule.readBuffer(p10, var334)
				var334 = var343
				var333.type_label = buffer.tostring(var342)
			elseif var339 == 2 then
				local _ = nil
				local var344, var345 = protoModule.readBuffer(p10, var334)
				var334 = var345
				var333.earned_label = buffer.tostring(var344)
			elseif var339 == 3 then
				local _ = nil
				local var346, var347 = protoModule.readBuffer(p10, var334)
				var334 = var347
				var333.updated_label = buffer.tostring(var346)
			elseif var339 == 4 then
				local _ = nil
				local var348, var349 = protoModule.readBuffer(p10, var334)
				var334 = var349
				var333.experience_label = buffer.tostring(var348)
			elseif var339 == 5 then
				local _ = nil
				local var350, var351 = protoModule.readBuffer(p10, var334)
				var334 = var351
				var333.rarity_label = buffer.tostring(var350)
			elseif var339 == 6 then
				local _ = nil
				local var352, var353 = protoModule.readBuffer(p10, var334)
				var334 = var353
				var333.won_yesterday_label = buffer.tostring(var352)
			elseif var339 == 7 then
				local _ = nil
				local var354, var355 = protoModule.readBuffer(p10, var334)
				var334 = var355
				var333.won_ever_label = buffer.tostring(var354)
			else
				local _ = nil
				local var356, var357 = protoModule.readVarInt(p10, var334)
				var334 = var357 + var356
			end
		elseif var335 == protoModule.wireTypes.i32 then
			local _ = nil
			local var358, var359 = protoModule.readFixed32(p10, var334)
			local _ = var358
			var334 = var359
		elseif var335 == protoModule.wireTypes.i64 then
			local _ = nil
			local var360, var361 = protoModule.readFixed64(p10, var334)
			local _ = var360
			var334 = var361
		else
			error("Unsupported wire type: " .. var785)
		end
	end
	return var333
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
	local var362 = t_10.new()
	
	if self.type_label ~= nil then
		var362.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var362.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var362.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var362.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var362.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var362.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var362.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var362.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var362.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var362.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var362.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var362.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var362.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var362.won_ever_label = self.wonEverLabel
	end
	return var362
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
	local var362 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var363, var364 = protoModule.writeTag(buff, var362, 1, protoModule.wireTypes.lengthDelimited)
		var363, var817 = protoModule.writeString(var363, var364, self.share)
		buff = var363
		var362 = var364
	end
	if self.report ~= nil and self.report ~= "" then
		local var365, var366 = protoModule.writeTag(buff, var362, 2, protoModule.wireTypes.lengthDelimited)
		var365, var819 = protoModule.writeString(var365, var366, self.report)
		buff = var365
		var362 = var366
	end
	local buff_1 = buffer.create(var362)
	buffer.copy(buff_1, 0, buff, 0, var362)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var362 = t_11.new()
	local var363 = 0
	while var363 < buffer.len(p11) do
		local _ = nil
		local var364 = nil
		local var365, var366, var367 = protoModule.readTag(p11, var363)
		local var368 = var365
		var364 = var366
		var363 = var367
		
		if var364 == protoModule.wireTypes.varint then
			local _ = nil
			local var369, var370 = protoModule.readVarInt(p11, var363)
			local _ = var369
			var363 = var370
			continue
		end
		if var364 == protoModule.wireTypes.lengthDelimited then
			if var368 == 1 then
				local _ = nil
				local var371, var372 = protoModule.readBuffer(p11, var363)
				var363 = var372
				var362.share = buffer.tostring(var371)
			elseif var368 == 2 then
				local _ = nil
				local var373, var374 = protoModule.readBuffer(p11, var363)
				var363 = var374
				var362.report = buffer.tostring(var373)
			else
				local _ = nil
				local var375, var376 = protoModule.readVarInt(p11, var363)
				var363 = var376 + var375
			end
		elseif var364 == protoModule.wireTypes.i32 then
			local _ = nil
			local var377, var378 = protoModule.readFixed32(p11, var363)
			local _ = var377
			var363 = var378
		elseif var364 == protoModule.wireTypes.i64 then
			local _ = nil
			local var379, var380 = protoModule.readFixed64(p11, var363)
			local _ = var379
			var363 = var380
		else
			error("Unsupported wire type: " .. var823)
		end
	end
	return var362
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
	local var381 = t_11.new()
	
	if self.share ~= nil then
		var381.share = self.share
	end
	if self.report ~= nil then
		var381.report = self.report
	end
	return var381
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
	local var381 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var382, var383 = protoModule.writeTag(buff, var381, 1, protoModule.wireTypes.lengthDelimited)
		var382, var845 = protoModule.writeString(var382, var383, self.report)
		buff = var382
		var381 = var383
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var384, var385 = protoModule.writeTag(buff, var381, 2, protoModule.wireTypes.lengthDelimited)
		var384, var847 = protoModule.writeString(var384, var385, self.remove)
		buff = var384
		var381 = var385
	end
	local buff_1 = buffer.create(var381)
	buffer.copy(buff_1, 0, buff, 0, var381)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var381 = t_12.new()
	local var382 = 0
	while var382 < buffer.len(p12) do
		local _ = nil
		local var383 = nil
		local var384, var385, var386 = protoModule.readTag(p12, var382)
		local var387 = var384
		var383 = var385
		var382 = var386
		
		if var383 == protoModule.wireTypes.varint then
			local _ = nil
			local var388, var389 = protoModule.readVarInt(p12, var382)
			local _ = var388
			var382 = var389
			continue
		end
		if var383 == protoModule.wireTypes.lengthDelimited then
			if var387 == 1 then
				local _ = nil
				local var390, var391 = protoModule.readBuffer(p12, var382)
				var382 = var391
				var381.report = buffer.tostring(var390)
			elseif var387 == 2 then
				local _ = nil
				local var392, var393 = protoModule.readBuffer(p12, var382)
				var382 = var393
				var381.remove = buffer.tostring(var392)
			else
				local _ = nil
				local var394, var395 = protoModule.readVarInt(p12, var382)
				var382 = var395 + var394
			end
		elseif var383 == protoModule.wireTypes.i32 then
			local _ = nil
			local var396, var397 = protoModule.readFixed32(p12, var382)
			local _ = var396
			var382 = var397
		elseif var383 == protoModule.wireTypes.i64 then
			local _ = nil
			local var398, var399 = protoModule.readFixed64(p12, var382)
			local _ = var398
			var382 = var399
		else
			error("Unsupported wire type: " .. var851)
		end
	end
	return var381
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
	local var400 = t_12.new()
	
	if self.report ~= nil then
		var400.report = self.report
	end
	if self.remove ~= nil then
		var400.remove = self.remove
	end
	return var400
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
	local var400 = t_13.new()
	local var401 = 0
	while var401 < buffer.len(p13) do
		local var402 = nil
		local _ = nil
		local var403, var404, var405 = protoModule.readTag(p13, var401)
		var402 = var403
		local var406 = var404
		var401 = var405
		
		if var406 == protoModule.wireTypes.varint then
			local _ = nil
			local var407, var408 = protoModule.readVarInt(p13, var401)
			local _ = var407
			var401 = var408
		elseif var406 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var409, var410 = protoModule.readVarInt(p13, var401)
			var401 = var410 + var409
		elseif var406 == protoModule.wireTypes.i32 then
			local _ = nil
			local var411, var412 = protoModule.readFixed32(p13, var401)
			local _ = var411
			var401 = var412
		elseif var406 == protoModule.wireTypes.i64 then
			local _ = nil
			local var413, var414 = protoModule.readFixed64(p13, var401)
			local _ = var413
			var401 = var414
		else
			error("Unsupported wire type: " .. var877)
		end
	end
	return var400
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
	local var415 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var416, var417 = protoModule.writeTag(buff, var415, 1, protoModule.wireTypes.lengthDelimited)
		var416, var889 = protoModule.writeString(var416, var417, self.universe_id)
		buff = var416
		var415 = var417
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var418, var419 = protoModule.writeTag(buff, var415, 2, protoModule.wireTypes.lengthDelimited)
		var418, var891 = protoModule.writeString(var418, var419, self.creator_key)
		buff = var418
		var415 = var419
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var420, var421 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var420, var893 = protoModule.writeString(var420, var421, i)
			local var422 = v:encode()
			var421, var895 = protoModule.writeTag(var420, var421, 2, protoModule.wireTypes.lengthDelimited)
			var421, var895 = protoModule.writeBuffer(var421, var895, var422, buffer.len(var422))
			local var423 = var421
			local var424 = var895
			local var425, var426 = protoModule.writeTag(buff, var415, 3, protoModule.wireTypes.lengthDelimited)
			var425, var899 = protoModule.writeBuffer(var425, var426, var423, var424)
			buff = var425
			var415 = var426
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var427, var428 = protoModule.writeTag(buff, var415, 4, protoModule.wireTypes.lengthDelimited)
			var427, var901 = protoModule.writeString(var427, var428, v)
			buff = var427
			var415 = var428
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var429, var430 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var429, var903 = protoModule.writeString(var429, var430, i)
			local var431 = v:encode()
			var430, var905 = protoModule.writeTag(var429, var430, 2, protoModule.wireTypes.lengthDelimited)
			var430, var905 = protoModule.writeBuffer(var430, var905, var431, buffer.len(var431))
			local var432 = var430
			local var433 = var905
			local var434, var435 = protoModule.writeTag(buff, var415, 5, protoModule.wireTypes.lengthDelimited)
			var434, var909 = protoModule.writeBuffer(var434, var435, var432, var433)
			buff = var434
			var415 = var435
		end
	end
	local buff_1 = buffer.create(var415)
	buffer.copy(buff_1, 0, buff, 0, var415)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var436 = t_14.new()
	local var437 = 0
	while var437 < buffer.len(p14) do
		local _ = nil
		local var438 = nil
		local var439, var440, var441 = protoModule.readTag(p14, var437)
		local var442 = var439
		var438 = var440
		var437 = var441
		
		if var438 == protoModule.wireTypes.varint then
			local _ = nil
			local var443, var444 = protoModule.readVarInt(p14, var437)
			local _ = var443
			var437 = var444
			continue
		end
		if var438 == protoModule.wireTypes.lengthDelimited then
			if var442 == 1 then
				local _ = nil
				local var445, var446 = protoModule.readBuffer(p14, var437)
				var437 = var446
				var436.universe_id = buffer.tostring(var445)
			elseif var442 == 2 then
				local _ = nil
				local var447, var448 = protoModule.readBuffer(p14, var437)
				var437 = var448
				var436.creator_key = buffer.tostring(var447)
			elseif var442 == 3 then
				local _ = nil
				local var449, var450 = protoModule.readBuffer(p14, var437)
				var437 = var450
				var449 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var449)
				var436.entry_map[var449.key or ""] = var449.value or t.FeedEntry.new()
			elseif var442 == 4 then
				local _ = nil
				local var451, var452 = protoModule.readBuffer(p14, var437)
				var437 = var452
				table.insert(var436.entry_order, buffer.tostring(var451))
			elseif var442 == 5 then
				local _ = nil
				local var453, var454 = protoModule.readBuffer(p14, var437)
				var437 = var454
				var453 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var453)
				var436.entry_order_map[var453.key or ""] = var453.value or t.EntryOrder.new()
			else
				local _ = nil
				local var455, var456 = protoModule.readVarInt(p14, var437)
				var437 = var456 + var455
			end
		elseif var438 == protoModule.wireTypes.i32 then
			local _ = nil
			local var457, var458 = protoModule.readFixed32(p14, var437)
			local _ = var457
			var437 = var458
		elseif var438 == protoModule.wireTypes.i64 then
			local _ = nil
			local var459, var460 = protoModule.readFixed64(p14, var437)
			local _ = var459
			var437 = var460
		else
			error("Unsupported wire type: " .. var913)
		end
	end
	return var436
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
	local var461 = t_14.new()
	
	if self.universe_id ~= nil then
		var461.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var461.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var461.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var461.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var461.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var461.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var461.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var461.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var461.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var461.entry_order_map = t_1
	end
	return var461
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
	local var462 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var463, var464 = protoModule.writeTag(buff, var462, 1, protoModule.wireTypes.lengthDelimited)
		var463, var950 = protoModule.writeString(var463, var464, self.key)
		buff = var463
		var462 = var464
	end
	if self.value ~= nil then
		local var465 = self.value:encode()
		local var466, var467 = protoModule.writeTag(buff, var462, 2, protoModule.wireTypes.lengthDelimited)
		var466, var953 = protoModule.writeBuffer(var466, var467, var465, buffer.len(var465))
		buff = var466
		var462 = var467
	end
	local buff_1 = buffer.create(var462)
	buffer.copy(buff_1, 0, buff, 0, var462)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var462 = t_15.new()
	local var463 = 0
	while var463 < buffer.len(p15) do
		local _ = nil
		local var464 = nil
		local var465, var466, var467 = protoModule.readTag(p15, var463)
		local var468 = var465
		var464 = var466
		var463 = var467
		
		if var464 == protoModule.wireTypes.varint then
			local _ = nil
			local var469, var470 = protoModule.readVarInt(p15, var463)
			local _ = var469
			var463 = var470
			continue
		end
		if var464 == protoModule.wireTypes.lengthDelimited then
			if var468 == 1 then
				local _ = nil
				local var471, var472 = protoModule.readBuffer(p15, var463)
				var463 = var472
				var462.key = buffer.tostring(var471)
			elseif var468 == 2 then
				local _ = nil
				local var473, var474 = protoModule.readBuffer(p15, var463)
				var463 = var474
				var462.value = t.FeedEntry.decode(var473)
			else
				local _ = nil
				local var475, var476 = protoModule.readVarInt(p15, var463)
				var463 = var476 + var475
			end
		elseif var464 == protoModule.wireTypes.i32 then
			local _ = nil
			local var477, var478 = protoModule.readFixed32(p15, var463)
			local _ = var477
			var463 = var478
		elseif var464 == protoModule.wireTypes.i64 then
			local _ = nil
			local var479, var480 = protoModule.readFixed64(p15, var463)
			local _ = var479
			var463 = var480
		else
			error("Unsupported wire type: " .. var957)
		end
	end
	return var462
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
	local var481 = t_15.new()
	
	if self.key ~= nil then
		var481.key = self.key
	end
	if self.value ~= nil then
		var481.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var481
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
	local var481 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var482, var483 = protoModule.writeTag(buff, var481, 1, protoModule.wireTypes.lengthDelimited)
		var482, var979 = protoModule.writeString(var482, var483, self.key)
		buff = var482
		var481 = var483
	end
	if self.value ~= nil then
		local var484 = self.value:encode()
		local var485, var486 = protoModule.writeTag(buff, var481, 2, protoModule.wireTypes.lengthDelimited)
		var485, var982 = protoModule.writeBuffer(var485, var486, var484, buffer.len(var484))
		buff = var485
		var481 = var486
	end
	local buff_1 = buffer.create(var481)
	buffer.copy(buff_1, 0, buff, 0, var481)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var481 = t_16.new()
	local var482 = 0
	while var482 < buffer.len(p16) do
		local _ = nil
		local var483 = nil
		local var484, var485, var486 = protoModule.readTag(p16, var482)
		local var487 = var484
		var483 = var485
		var482 = var486
		
		if var483 == protoModule.wireTypes.varint then
			local _ = nil
			local var488, var489 = protoModule.readVarInt(p16, var482)
			local _ = var488
			var482 = var489
			continue
		end
		if var483 == protoModule.wireTypes.lengthDelimited then
			if var487 == 1 then
				local _ = nil
				local var490, var491 = protoModule.readBuffer(p16, var482)
				var482 = var491
				var481.key = buffer.tostring(var490)
			elseif var487 == 2 then
				local _ = nil
				local var492, var493 = protoModule.readBuffer(p16, var482)
				var482 = var493
				var481.value = t.EntryOrder.decode(var492)
			else
				local _ = nil
				local var494, var495 = protoModule.readVarInt(p16, var482)
				var482 = var495 + var494
			end
		elseif var483 == protoModule.wireTypes.i32 then
			local _ = nil
			local var496, var497 = protoModule.readFixed32(p16, var482)
			local _ = var496
			var482 = var497
		elseif var483 == protoModule.wireTypes.i64 then
			local _ = nil
			local var498, var499 = protoModule.readFixed64(p16, var482)
			local _ = var498
			var482 = var499
		else
			error("Unsupported wire type: " .. var986)
		end
	end
	return var481
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
	local var500 = t_16.new()
	
	if self.key ~= nil then
		var500.key = self.key
	end
	if self.value ~= nil then
		var500.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var500
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
	local var500 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var501, var502 = protoModule.writeTag(buff, var500, 1, protoModule.wireTypes.lengthDelimited)
			var501, var1008 = protoModule.writeString(var501, var502, v)
			buff = var501
			var500 = var502
		end
	end
	local buff_1 = buffer.create(var500)
	buffer.copy(buff_1, 0, buff, 0, var500)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var503 = t_17.new()
	local var504 = 0
	while var504 < buffer.len(p17) do
		local _ = nil
		local var505 = nil
		local var506, var507, var508 = protoModule.readTag(p17, var504)
		local var509 = var506
		var505 = var507
		var504 = var508
		
		if var505 == protoModule.wireTypes.varint then
			local _ = nil
			local var510, var511 = protoModule.readVarInt(p17, var504)
			local _ = var510
			var504 = var511
			continue
		end
		if var505 == protoModule.wireTypes.lengthDelimited then
			if var509 == 1 then
				local _ = nil
				local var512, var513 = protoModule.readBuffer(p17, var504)
				var504 = var513
				table.insert(var503.items, buffer.tostring(var512))
			else
				local _ = nil
				local var514, var515 = protoModule.readVarInt(p17, var504)
				var504 = var515 + var514
			end
		elseif var505 == protoModule.wireTypes.i32 then
			local _ = nil
			local var516, var517 = protoModule.readFixed32(p17, var504)
			local _ = var516
			var504 = var517
		elseif var505 == protoModule.wireTypes.i64 then
			local _ = nil
			local var518, var519 = protoModule.readFixed64(p17, var504)
			local _ = var518
			var504 = var519
		else
			error("Unsupported wire type: " .. var1012)
		end
	end
	return var503
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
	local var520 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var520.items = t
	end
	return var520
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
	local var521 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var522, var523 = protoModule.writeTag(buff, var521, 1, protoModule.wireTypes.lengthDelimited)
		var522, var1034 = protoModule.writeString(var522, var523, self.universe_id)
		buff = var522
		var521 = var523
	end
	if self.user_owns_experience then
		local var524, var525 = protoModule.writeTag(buff, var521, 2, protoModule.wireTypes.varint)
		var524, var1036 = protoModule.writeVarInt(var524, var525, if self.user_owns_experience then 1 else 0)
		buff = var524
		var521 = var525
	end
	local buff_1 = buffer.create(var521)
	buffer.copy(buff_1, 0, buff, 0, var521)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var521 = t_18.new()
	local var522 = 0
	while var522 < buffer.len(p18) do
		local _ = nil
		local var523 = nil
		local var524, var525, var526 = protoModule.readTag(p18, var522)
		local var527 = var524
		var523 = var525
		var522 = var526
		
		if var523 == protoModule.wireTypes.varint then
			if var527 == 2 then
				local _ = nil
				local var528, var529 = protoModule.readVarInt(p18, var522)
				var522 = var529
				var521.user_owns_experience = var528 ~= 0
			else
				local _ = nil
				local var530, var531 = protoModule.readVarInt(p18, var522)
				local _ = var530
				var522 = var531
			end
		end
		if var523 == protoModule.wireTypes.lengthDelimited then
			if var527 == 1 then
				local _ = nil
				local var532, var533 = protoModule.readBuffer(p18, var522)
				var522 = var533
				var521.universe_id = buffer.tostring(var532)
			else
				local _ = nil
				local var534, var535 = protoModule.readVarInt(p18, var522)
				var522 = var535 + var534
			end
		elseif var523 == protoModule.wireTypes.i32 then
			local _ = nil
			local var536, var537 = protoModule.readFixed32(p18, var522)
			local _ = var536
			var522 = var537
		elseif var523 == protoModule.wireTypes.i64 then
			local _ = nil
			local var538, var539 = protoModule.readFixed64(p18, var522)
			local _ = var538
			var522 = var539
		else
			error("Unsupported wire type: " .. var1040)
		end
	end
	return var521
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
	local var540 = t_18.new()
	
	if self.universe_id ~= nil then
		var540.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var540.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var540.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var540.user_owns_experience = self.userOwnsExperience
	end
	return var540
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
	local var540 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var541, var542 = protoModule.writeTag(buff, var540, 1, protoModule.wireTypes.lengthDelimited)
		var541, var1062 = protoModule.writeString(var541, var542, self.media_asset_id)
		buff = var541
		var540 = var542
	end
	local buff_1 = buffer.create(var540)
	buffer.copy(buff_1, 0, buff, 0, var540)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var540 = t_19.new()
	local var541 = 0
	while var541 < buffer.len(p19) do
		local _ = nil
		local var542 = nil
		local var543, var544, var545 = protoModule.readTag(p19, var541)
		local var546 = var543
		var542 = var544
		var541 = var545
		
		if var542 == protoModule.wireTypes.varint then
			local _ = nil
			local var547, var548 = protoModule.readVarInt(p19, var541)
			local _ = var547
			var541 = var548
			continue
		end
		if var542 == protoModule.wireTypes.lengthDelimited then
			if var546 == 1 then
				local _ = nil
				local var549, var550 = protoModule.readBuffer(p19, var541)
				var541 = var550
				var540.media_asset_id = buffer.tostring(var549)
			else
				local _ = nil
				local var551, var552 = protoModule.readVarInt(p19, var541)
				var541 = var552 + var551
			end
		elseif var542 == protoModule.wireTypes.i32 then
			local _ = nil
			local var553, var554 = protoModule.readFixed32(p19, var541)
			local _ = var553
			var541 = var554
		elseif var542 == protoModule.wireTypes.i64 then
			local _ = nil
			local var555, var556 = protoModule.readFixed64(p19, var541)
			local _ = var555
			var541 = var556
		else
			error("Unsupported wire type: " .. var1066)
		end
	end
	return var540
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
	local var557 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var557.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var557.media_asset_id = self.mediaAssetId
	end
	return var557
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
	local var557 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var558, var559 = protoModule.writeTag(buff, var557, 1, protoModule.wireTypes.lengthDelimited)
		var558, var1086 = protoModule.writeString(var558, var559, self.universe_id)
		buff = var558
		var557 = var559
	end
	local buff_1 = buffer.create(var557)
	buffer.copy(buff_1, 0, buff, 0, var557)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var557 = t_20.new()
	local var558 = 0
	while var558 < buffer.len(p20) do
		local _ = nil
		local var559 = nil
		local var560, var561, var562 = protoModule.readTag(p20, var558)
		local var563 = var560
		var559 = var561
		var558 = var562
		
		if var559 == protoModule.wireTypes.varint then
			local _ = nil
			local var564, var565 = protoModule.readVarInt(p20, var558)
			local _ = var564
			var558 = var565
			continue
		end
		if var559 == protoModule.wireTypes.lengthDelimited then
			if var563 == 1 then
				local _ = nil
				local var566, var567 = protoModule.readBuffer(p20, var558)
				var558 = var567
				var557.universe_id = buffer.tostring(var566)
			else
				local _ = nil
				local var568, var569 = protoModule.readVarInt(p20, var558)
				var558 = var569 + var568
			end
		elseif var559 == protoModule.wireTypes.i32 then
			local _ = nil
			local var570, var571 = protoModule.readFixed32(p20, var558)
			local _ = var570
			var558 = var571
		elseif var559 == protoModule.wireTypes.i64 then
			local _ = nil
			local var572, var573 = protoModule.readFixed64(p20, var558)
			local _ = var572
			var558 = var573
		else
			error("Unsupported wire type: " .. var1090)
		end
	end
	return var557
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
	local var574 = t_20.new()
	
	if self.universe_id ~= nil then
		var574.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var574.universe_id = self.universeId
	end
	return var574
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
	local var574 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var575, var576 = protoModule.writeTag(buff, var574, 1, protoModule.wireTypes.lengthDelimited)
		var575, var1110 = protoModule.writeString(var575, var576, self.universe_id)
		buff = var575
		var574 = var576
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var577, var578 = protoModule.writeTag(buff, var574, 2, protoModule.wireTypes.lengthDelimited)
		var577, var1112 = protoModule.writeString(var577, var578, self.creator_key)
		buff = var577
		var574 = var578
	end
	local buff_1 = buffer.create(var574)
	buffer.copy(buff_1, 0, buff, 0, var574)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var574 = t_21.new()
	local var575 = 0
	while var575 < buffer.len(p21) do
		local _ = nil
		local var576 = nil
		local var577, var578, var579 = protoModule.readTag(p21, var575)
		local var580 = var577
		var576 = var578
		var575 = var579
		
		if var576 == protoModule.wireTypes.varint then
			local _ = nil
			local var581, var582 = protoModule.readVarInt(p21, var575)
			local _ = var581
			var575 = var582
			continue
		end
		if var576 == protoModule.wireTypes.lengthDelimited then
			if var580 == 1 then
				local _ = nil
				local var583, var584 = protoModule.readBuffer(p21, var575)
				var575 = var584
				var574.universe_id = buffer.tostring(var583)
			elseif var580 == 2 then
				local _ = nil
				local var585, var586 = protoModule.readBuffer(p21, var575)
				var575 = var586
				var574.creator_key = buffer.tostring(var585)
			else
				local _ = nil
				local var587, var588 = protoModule.readVarInt(p21, var575)
				var575 = var588 + var587
			end
		elseif var576 == protoModule.wireTypes.i32 then
			local _ = nil
			local var589, var590 = protoModule.readFixed32(p21, var575)
			local _ = var589
			var575 = var590
		elseif var576 == protoModule.wireTypes.i64 then
			local _ = nil
			local var591, var592 = protoModule.readFixed64(p21, var575)
			local _ = var591
			var575 = var592
		else
			error("Unsupported wire type: " .. var1116)
		end
	end
	return var574
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
	local var593 = t_21.new()
	
	if self.universe_id ~= nil then
		var593.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var593.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var593.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var593.creator_key = self.creatorKey
	end
	return var593
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
	local var593 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var594, var595 = protoModule.writeTag(buff, var593, 1, protoModule.wireTypes.lengthDelimited)
		var594, var1138 = protoModule.writeString(var594, var595, self.universe_id)
		buff = var594
		var593 = var595
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var596, var597 = protoModule.writeTag(buff, var593, 2, protoModule.wireTypes.lengthDelimited)
		var596, var1140 = protoModule.writeString(var596, var597, self.root_place_id)
		buff = var596
		var593 = var597
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var598, var599 = protoModule.writeTag(buff, var593, 3, protoModule.wireTypes.lengthDelimited)
		var598, var1142 = protoModule.writeString(var598, var599, self.connection_played_display_name)
		buff = var598
		var593 = var599
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var600, var601 = protoModule.writeTag(buff, var593, 4, protoModule.wireTypes.lengthDelimited)
		var600, var1144 = protoModule.writeString(var600, var601, self.upsell_prompt)
		buff = var600
		var593 = var601
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var602 = v:encode()
			local var603, var604 = protoModule.writeTag(buff, var593, 5, protoModule.wireTypes.lengthDelimited)
			var603, var1147 = protoModule.writeBuffer(var603, var604, var602, buffer.len(var602))
			buff = var603
			var593 = var604
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var605, var606 = protoModule.writeTag(buff, var593, 6, protoModule.wireTypes.varint)
		var605, var1149 = protoModule.writeVarInt(var605, var606, self.connection_played_num_others)
		buff = var605
		var593 = var606
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var607, var608 = protoModule.writeTag(buff, var593, 7, protoModule.wireTypes.varint)
		var607, var1151 = protoModule.writeVarInt(var607, var608, self.connection_played_total_count)
		buff = var607
		var593 = var608
	end
	local buff_1 = buffer.create(var593)
	buffer.copy(buff_1, 0, buff, 0, var593)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var609 = t_22.new()
	local var610 = 0
	while var610 < buffer.len(p22) do
		local _ = nil
		local var611 = nil
		local var612, var613, var614 = protoModule.readTag(p22, var610)
		local var615 = var612
		var611 = var613
		var610 = var614
		
		if var611 == protoModule.wireTypes.varint then
			if var615 == 6 then
				local _ = nil
				local var616, var617 = protoModule.readVarIntI32(p22, var610)
				var610 = var617
				var609.connection_played_num_others = var616
			elseif var615 == 7 then
				local _ = nil
				local var618, var619 = protoModule.readVarIntI32(p22, var610)
				var610 = var619
				var609.connection_played_total_count = var618
			else
				local _ = nil
				local var620, var621 = protoModule.readVarInt(p22, var610)
				local _ = var620
				var610 = var621
			end
		end
		if var611 == protoModule.wireTypes.lengthDelimited then
			if var615 == 1 then
				local _ = nil
				local var622, var623 = protoModule.readBuffer(p22, var610)
				var610 = var623
				var609.universe_id = buffer.tostring(var622)
			elseif var615 == 2 then
				local _ = nil
				local var624, var625 = protoModule.readBuffer(p22, var610)
				var610 = var625
				var609.root_place_id = buffer.tostring(var624)
			elseif var615 == 3 then
				local _ = nil
				local var626, var627 = protoModule.readBuffer(p22, var610)
				var610 = var627
				var609.connection_played_display_name = buffer.tostring(var626)
			elseif var615 == 4 then
				local _ = nil
				local var628, var629 = protoModule.readBuffer(p22, var610)
				var610 = var629
				var609.upsell_prompt = buffer.tostring(var628)
			elseif var615 == 5 then
				local _ = nil
				local var630, var631 = protoModule.readBuffer(p22, var610)
				var610 = var631
				table.insert(var609.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var630))
			else
				local _ = nil
				local var632, var633 = protoModule.readVarInt(p22, var610)
				var610 = var633 + var632
			end
		elseif var611 == protoModule.wireTypes.i32 then
			local _ = nil
			local var634, var635 = protoModule.readFixed32(p22, var610)
			local _ = var634
			var610 = var635
		elseif var611 == protoModule.wireTypes.i64 then
			local _ = nil
			local var636, var637 = protoModule.readFixed64(p22, var610)
			local _ = var636
			var610 = var637
		else
			error("Unsupported wire type: " .. var1155)
		end
	end
	return var609
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
	local var638 = t_22.new()
	
	if self.universe_id ~= nil then
		var638.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var638.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var638.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var638.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var638.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var638.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var638.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var638.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var638.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var638.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var638.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var638.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var638.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var638.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var638
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
	local var639 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var640, var641 = protoModule.writeTag(buff, var639, 1, protoModule.wireTypes.lengthDelimited)
		var640, var1190 = protoModule.writeString(var640, var641, self.user_id)
		buff = var640
		var639 = var641
	end
	local buff_1 = buffer.create(var639)
	buffer.copy(buff_1, 0, buff, 0, var639)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var639 = t_23.new()
	local var640 = 0
	while var640 < buffer.len(p23) do
		local _ = nil
		local var641 = nil
		local var642, var643, var644 = protoModule.readTag(p23, var640)
		local var645 = var642
		var641 = var643
		var640 = var644
		
		if var641 == protoModule.wireTypes.varint then
			local _ = nil
			local var646, var647 = protoModule.readVarInt(p23, var640)
			local _ = var646
			var640 = var647
			continue
		end
		if var641 == protoModule.wireTypes.lengthDelimited then
			if var645 == 1 then
				local _ = nil
				local var648, var649 = protoModule.readBuffer(p23, var640)
				var640 = var649
				var639.user_id = buffer.tostring(var648)
			else
				local _ = nil
				local var650, var651 = protoModule.readVarInt(p23, var640)
				var640 = var651 + var650
			end
		elseif var641 == protoModule.wireTypes.i32 then
			local _ = nil
			local var652, var653 = protoModule.readFixed32(p23, var640)
			local _ = var652
			var640 = var653
		elseif var641 == protoModule.wireTypes.i64 then
			local _ = nil
			local var654, var655 = protoModule.readFixed64(p23, var640)
			local _ = var654
			var640 = var655
		else
			error("Unsupported wire type: " .. var1194)
		end
	end
	return var639
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
	local var656 = t_23.new()
	
	if self.user_id ~= nil then
		var656.user_id = self.user_id
	end
	if self.userId ~= nil then
		var656.user_id = self.userId
	end
	return var656
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
	local var656 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var657 = v:encode()
			local var658, var659 = protoModule.writeTag(buff, var656, 1, protoModule.wireTypes.lengthDelimited)
			var658, var1215 = protoModule.writeBuffer(var658, var659, var657, buffer.len(var657))
			buff = var658
			var656 = var659
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var660, var661 = protoModule.writeTag(buff, var656, 2, protoModule.wireTypes.lengthDelimited)
		var660, var1217 = protoModule.writeString(var660, var661, self.universe_id)
		buff = var660
		var656 = var661
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var662, var663 = protoModule.writeTag(buff, var656, 3, protoModule.wireTypes.lengthDelimited)
		var662, var1219 = protoModule.writeString(var662, var663, self.place_id)
		buff = var662
		var656 = var663
	end
	local buff_1 = buffer.create(var656)
	buffer.copy(buff_1, 0, buff, 0, var656)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var664 = t_24.new()
	local var665 = 0
	while var665 < buffer.len(p24) do
		local _ = nil
		local var666 = nil
		local var667, var668, var669 = protoModule.readTag(p24, var665)
		local var670 = var667
		var666 = var668
		var665 = var669
		
		if var666 == protoModule.wireTypes.varint then
			local _ = nil
			local var671, var672 = protoModule.readVarInt(p24, var665)
			local _ = var671
			var665 = var672
			continue
		end
		if var666 == protoModule.wireTypes.lengthDelimited then
			if var670 == 1 then
				local _ = nil
				local var673, var674 = protoModule.readBuffer(p24, var665)
				var665 = var674
				table.insert(var664.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var673))
			elseif var670 == 2 then
				local _ = nil
				local var675, var676 = protoModule.readBuffer(p24, var665)
				var665 = var676
				var664.universe_id = buffer.tostring(var675)
			elseif var670 == 3 then
				local _ = nil
				local var677, var678 = protoModule.readBuffer(p24, var665)
				var665 = var678
				var664.place_id = buffer.tostring(var677)
			else
				local _ = nil
				local var679, var680 = protoModule.readVarInt(p24, var665)
				var665 = var680 + var679
			end
		elseif var666 == protoModule.wireTypes.i32 then
			local _ = nil
			local var681, var682 = protoModule.readFixed32(p24, var665)
			local _ = var681
			var665 = var682
		elseif var666 == protoModule.wireTypes.i64 then
			local _ = nil
			local var683, var684 = protoModule.readFixed64(p24, var665)
			local _ = var683
			var665 = var684
		else
			error("Unsupported wire type: " .. var1223)
		end
	end
	return var664
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
	local var685 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var685.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var685.media_items = t_1
	end
	if self.universe_id ~= nil then
		var685.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var685.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var685.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var685.place_id = self.placeId
	end
	return var685
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
	local var686 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var687, var688 = protoModule.writeTag(buff, var686, 1, protoModule.wireTypes.lengthDelimited)
		var687, var1250 = protoModule.writeString(var687, var688, self.media_asset_id)
		buff = var687
		var686 = var688
	end
	local buff_1 = buffer.create(var686)
	buffer.copy(buff_1, 0, buff, 0, var686)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref)
	local var686 = t_25.new()
	local var687 = 0
	while var687 < buffer.len(p25) do
		local _ = nil
		local var688 = nil
		local var689, var690, var691 = protoModule.readTag(p25, var687)
		local var692 = var689
		var688 = var690
		var687 = var691
		
		if var688 == protoModule.wireTypes.varint then
			local _ = nil
			local var693, var694 = protoModule.readVarInt(p25, var687)
			local _ = var693
			var687 = var694
			continue
		end
		if var688 == protoModule.wireTypes.lengthDelimited then
			if var692 == 1 then
				local _ = nil
				local var695, var696 = protoModule.readBuffer(p25, var687)
				var687 = var696
				var686.media_asset_id = buffer.tostring(var695)
			else
				local _ = nil
				local var697, var698 = protoModule.readVarInt(p25, var687)
				var687 = var698 + var697
			end
		elseif var688 == protoModule.wireTypes.i32 then
			local _ = nil
			local var699, var700 = protoModule.readFixed32(p25, var687)
			local _ = var699
			var687 = var700
		elseif var688 == protoModule.wireTypes.i64 then
			local _ = nil
			local var701, var702 = protoModule.readFixed64(p25, var687)
			local _ = var701
			var687 = var702
		else
			error("Unsupported wire type: " .. var1254)
		end
	end
	return var686
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
	local var703 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var703.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var703.media_asset_id = self.mediaAssetId
	end
	return var703
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
	local var703 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var704, var705 = protoModule.writeTag(buff, var703, 1, protoModule.wireTypes.lengthDelimited)
		var704, var1274 = protoModule.writeString(var704, var705, self.universe_id)
		buff = var704
		var703 = var705
	end
	local buff_1 = buffer.create(var703)
	buffer.copy(buff_1, 0, buff, 0, var703)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var703 = t_26.new()
	local var704 = 0
	while var704 < buffer.len(p26) do
		local _ = nil
		local var705 = nil
		local var706, var707, var708 = protoModule.readTag(p26, var704)
		local var709 = var706
		var705 = var707
		var704 = var708
		
		if var705 == protoModule.wireTypes.varint then
			local _ = nil
			local var710, var711 = protoModule.readVarInt(p26, var704)
			local _ = var710
			var704 = var711
			continue
		end
		if var705 == protoModule.wireTypes.lengthDelimited then
			if var709 == 1 then
				local _ = nil
				local var712, var713 = protoModule.readBuffer(p26, var704)
				var704 = var713
				var703.universe_id = buffer.tostring(var712)
			else
				local _ = nil
				local var714, var715 = protoModule.readVarInt(p26, var704)
				var704 = var715 + var714
			end
		elseif var705 == protoModule.wireTypes.i32 then
			local _ = nil
			local var716, var717 = protoModule.readFixed32(p26, var704)
			local _ = var716
			var704 = var717
		elseif var705 == protoModule.wireTypes.i64 then
			local _ = nil
			local var718, var719 = protoModule.readFixed64(p26, var704)
			local _ = var718
			var704 = var719
		else
			error("Unsupported wire type: " .. var1278)
		end
	end
	return var703
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
	local var720 = t_26.new()
	
	if self.universe_id ~= nil then
		var720.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var720.universe_id = self.universeId
	end
	return var720
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
	local var720 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var721, var722 = protoModule.writeTag(buff, var720, 1, protoModule.wireTypes.lengthDelimited)
		var721, var1298 = protoModule.writeString(var721, var722, self.universe_id)
		buff = var721
		var720 = var722
	end
	local buff_1 = buffer.create(var720)
	buffer.copy(buff_1, 0, buff, 0, var720)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var720 = t_27.new()
	local var721 = 0
	while var721 < buffer.len(p27) do
		local _ = nil
		local var722 = nil
		local var723, var724, var725 = protoModule.readTag(p27, var721)
		local var726 = var723
		var722 = var724
		var721 = var725
		
		if var722 == protoModule.wireTypes.varint then
			local _ = nil
			local var727, var728 = protoModule.readVarInt(p27, var721)
			local _ = var727
			var721 = var728
			continue
		end
		if var722 == protoModule.wireTypes.lengthDelimited then
			if var726 == 1 then
				local _ = nil
				local var729, var730 = protoModule.readBuffer(p27, var721)
				var721 = var730
				var720.universe_id = buffer.tostring(var729)
			else
				local _ = nil
				local var731, var732 = protoModule.readVarInt(p27, var721)
				var721 = var732 + var731
			end
		elseif var722 == protoModule.wireTypes.i32 then
			local _ = nil
			local var733, var734 = protoModule.readFixed32(p27, var721)
			local _ = var733
			var721 = var734
		elseif var722 == protoModule.wireTypes.i64 then
			local _ = nil
			local var735, var736 = protoModule.readFixed64(p27, var721)
			local _ = var735
			var721 = var736
		else
			error("Unsupported wire type: " .. var1302)
		end
	end
	return var720
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
	local var737 = t_27.new()
	
	if self.universe_id ~= nil then
		var737.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var737.universe_id = self.universeId
	end
	return var737
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
	local var737 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var738, var739 = protoModule.writeTag(buff, var737, 1, protoModule.wireTypes.lengthDelimited)
		var738, var1322 = protoModule.writeString(var738, var739, self.universe_id)
		buff = var738
		var737 = var739
	end
	if self.has_store_items then
		local var740, var741 = protoModule.writeTag(buff, var737, 2, protoModule.wireTypes.varint)
		var740, var1324 = protoModule.writeVarInt(var740, var741, if self.has_store_items then 1 else 0)
		buff = var740
		var737 = var741
	end
	if self.has_badges then
		local var742, var743 = protoModule.writeTag(buff, var737, 3, protoModule.wireTypes.varint)
		var742, var1326 = protoModule.writeVarInt(var742, var743, if self.has_badges then 1 else 0)
		buff = var742
		var737 = var743
	end
	if self.has_game_passes then
		local var744, var745 = protoModule.writeTag(buff, var737, 4, protoModule.wireTypes.varint)
		var744, var1328 = protoModule.writeVarInt(var744, var745, if self.has_game_passes then 1 else 0)
		buff = var744
		var737 = var745
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var746, var747 = protoModule.writeTag(buff, var737, 5, protoModule.wireTypes.lengthDelimited)
		var746, var1330 = protoModule.writeString(var746, var747, self.community_id)
		buff = var746
		var737 = var747
	end
	local buff_1 = buffer.create(var737)
	buffer.copy(buff_1, 0, buff, 0, var737)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var737 = t_28.new()
	local var738 = 0
	while var738 < buffer.len(p28) do
		local _ = nil
		local var739 = nil
		local var740, var741, var742 = protoModule.readTag(p28, var738)
		local var743 = var740
		var739 = var741
		var738 = var742
		
		if var739 == protoModule.wireTypes.varint then
			if var743 == 2 then
				local _ = nil
				local var744, var745 = protoModule.readVarInt(p28, var738)
				var738 = var745
				var737.has_store_items = var744 ~= 0
			elseif var743 == 3 then
				local _ = nil
				local var746, var747 = protoModule.readVarInt(p28, var738)
				var738 = var747
				var737.has_badges = var746 ~= 0
			elseif var743 == 4 then
				local _ = nil
				local var748, var749 = protoModule.readVarInt(p28, var738)
				var738 = var749
				var737.has_game_passes = var748 ~= 0
			else
				local _ = nil
				local var750, var751 = protoModule.readVarInt(p28, var738)
				local _ = var750
				var738 = var751
			end
		end
		if var739 == protoModule.wireTypes.lengthDelimited then
			if var743 == 1 then
				local _ = nil
				local var752, var753 = protoModule.readBuffer(p28, var738)
				var738 = var753
				var737.universe_id = buffer.tostring(var752)
			elseif var743 == 5 then
				local _ = nil
				local var754, var755 = protoModule.readBuffer(p28, var738)
				var738 = var755
				var737.community_id = buffer.tostring(var754)
			else
				local _ = nil
				local var756, var757 = protoModule.readVarInt(p28, var738)
				var738 = var757 + var756
			end
		elseif var739 == protoModule.wireTypes.i32 then
			local _ = nil
			local var758, var759 = protoModule.readFixed32(p28, var738)
			local _ = var758
			var738 = var759
		elseif var739 == protoModule.wireTypes.i64 then
			local _ = nil
			local var760, var761 = protoModule.readFixed64(p28, var738)
			local _ = var760
			var738 = var761
		else
			error("Unsupported wire type: " .. var1334)
		end
	end
	return var737
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
	local var762 = t_28.new()
	
	if self.universe_id ~= nil then
		var762.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var762.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var762.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var762.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var762.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var762.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var762.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var762.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var762.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var762.community_id = self.communityId
	end
	return var762
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
	local var762 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var763, var764 = protoModule.writeTag(buff, var762, 1, protoModule.wireTypes.lengthDelimited)
		var763, var1362 = protoModule.writeString(var763, var764, self.universe_id)
		buff = var763
		var762 = var764
	end
	local buff_1 = buffer.create(var762)
	buffer.copy(buff_1, 0, buff, 0, var762)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var762 = t_29.new()
	local var763 = 0
	while var763 < buffer.len(p29) do
		local _ = nil
		local var764 = nil
		local var765, var766, var767 = protoModule.readTag(p29, var763)
		local var768 = var765
		var764 = var766
		var763 = var767
		
		if var764 == protoModule.wireTypes.varint then
			local _ = nil
			local var769, var770 = protoModule.readVarInt(p29, var763)
			local _ = var769
			var763 = var770
			continue
		end
		if var764 == protoModule.wireTypes.lengthDelimited then
			if var768 == 1 then
				local _ = nil
				local var771, var772 = protoModule.readBuffer(p29, var763)
				var763 = var772
				var762.universe_id = buffer.tostring(var771)
			else
				local _ = nil
				local var773, var774 = protoModule.readVarInt(p29, var763)
				var763 = var774 + var773
			end
		elseif var764 == protoModule.wireTypes.i32 then
			local _ = nil
			local var775, var776 = protoModule.readFixed32(p29, var763)
			local _ = var775
			var763 = var776
		elseif var764 == protoModule.wireTypes.i64 then
			local _ = nil
			local var777, var778 = protoModule.readFixed64(p29, var763)
			local _ = var777
			var763 = var778
		else
			error("Unsupported wire type: " .. var1366)
		end
	end
	return var762
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
	local var779 = t_29.new()
	
	if self.universe_id ~= nil then
		var779.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var779.universe_id = self.universeId
	end
	return var779
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
	local var779 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var780, var781 = protoModule.writeTag(buff, var779, 1, protoModule.wireTypes.lengthDelimited)
		var780, var1386 = protoModule.writeString(var780, var781, self.universe_id)
		buff = var780
		var779 = var781
	end
	if self.user_owns_experience then
		local var782, var783 = protoModule.writeTag(buff, var779, 2, protoModule.wireTypes.varint)
		var782, var1388 = protoModule.writeVarInt(var782, var783, if self.user_owns_experience then 1 else 0)
		buff = var782
		var779 = var783
	end
	local buff_1 = buffer.create(var779)
	buffer.copy(buff_1, 0, buff, 0, var779)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var779 = t_30.new()
	local var780 = 0
	while var780 < buffer.len(p30) do
		local _ = nil
		local var781 = nil
		local var782, var783, var784 = protoModule.readTag(p30, var780)
		local var785 = var782
		var781 = var783
		var780 = var784
		
		if var781 == protoModule.wireTypes.varint then
			if var785 == 2 then
				local _ = nil
				local var786, var787 = protoModule.readVarInt(p30, var780)
				var780 = var787
				var779.user_owns_experience = var786 ~= 0
			else
				local _ = nil
				local var788, var789 = protoModule.readVarInt(p30, var780)
				local _ = var788
				var780 = var789
			end
		end
		if var781 == protoModule.wireTypes.lengthDelimited then
			if var785 == 1 then
				local _ = nil
				local var790, var791 = protoModule.readBuffer(p30, var780)
				var780 = var791
				var779.universe_id = buffer.tostring(var790)
			else
				local _ = nil
				local var792, var793 = protoModule.readVarInt(p30, var780)
				var780 = var793 + var792
			end
		elseif var781 == protoModule.wireTypes.i32 then
			local _ = nil
			local var794, var795 = protoModule.readFixed32(p30, var780)
			local _ = var794
			var780 = var795
		elseif var781 == protoModule.wireTypes.i64 then
			local _ = nil
			local var796, var797 = protoModule.readFixed64(p30, var780)
			local _ = var796
			var780 = var797
		else
			error("Unsupported wire type: " .. var1392)
		end
	end
	return var779
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
	local var798 = t_30.new()
	
	if self.universe_id ~= nil then
		var798.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var798.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var798.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var798.user_owns_experience = self.userOwnsExperience
	end
	return var798
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
	local var798 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var799, var800 = protoModule.writeTag(buff, var798, 1, protoModule.wireTypes.lengthDelimited)
		var799, var1414 = protoModule.writeString(var799, var800, self.universe_id)
		buff = var799
		var798 = var800
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var801, var802 = protoModule.writeTag(buff, var798, 2, protoModule.wireTypes.lengthDelimited)
		var801, var1416 = protoModule.writeString(var801, var802, self.place_id)
		buff = var801
		var798 = var802
	end
	local buff_1 = buffer.create(var798)
	buffer.copy(buff_1, 0, buff, 0, var798)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var798 = t_31.new()
	local var799 = 0
	while var799 < buffer.len(p31) do
		local _ = nil
		local var800 = nil
		local var801, var802, var803 = protoModule.readTag(p31, var799)
		local var804 = var801
		var800 = var802
		var799 = var803
		
		if var800 == protoModule.wireTypes.varint then
			local _ = nil
			local var805, var806 = protoModule.readVarInt(p31, var799)
			local _ = var805
			var799 = var806
			continue
		end
		if var800 == protoModule.wireTypes.lengthDelimited then
			if var804 == 1 then
				local _ = nil
				local var807, var808 = protoModule.readBuffer(p31, var799)
				var799 = var808
				var798.universe_id = buffer.tostring(var807)
			elseif var804 == 2 then
				local _ = nil
				local var809, var810 = protoModule.readBuffer(p31, var799)
				var799 = var810
				var798.place_id = buffer.tostring(var809)
			else
				local _ = nil
				local var811, var812 = protoModule.readVarInt(p31, var799)
				var799 = var812 + var811
			end
		elseif var800 == protoModule.wireTypes.i32 then
			local _ = nil
			local var813, var814 = protoModule.readFixed32(p31, var799)
			local _ = var813
			var799 = var814
		elseif var800 == protoModule.wireTypes.i64 then
			local _ = nil
			local var815, var816 = protoModule.readFixed64(p31, var799)
			local _ = var815
			var799 = var816
		else
			error("Unsupported wire type: " .. var1420)
		end
	end
	return var798
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
	local var817 = t_31.new()
	
	if self.universe_id ~= nil then
		var817.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var817.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var817.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var817.place_id = self.placeId
	end
	return var817
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
	local var817 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var818, var819 = protoModule.writeTag(buff, var817, 1, protoModule.wireTypes.lengthDelimited)
		var818, var1442 = protoModule.writeString(var818, var819, self.community_id)
		buff = var818
		var817 = var819
	end
	local buff_1 = buffer.create(var817)
	buffer.copy(buff_1, 0, buff, 0, var817)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var817 = t_32.new()
	local var818 = 0
	while var818 < buffer.len(p32) do
		local _ = nil
		local var819 = nil
		local var820, var821, var822 = protoModule.readTag(p32, var818)
		local var823 = var820
		var819 = var821
		var818 = var822
		
		if var819 == protoModule.wireTypes.varint then
			local _ = nil
			local var824, var825 = protoModule.readVarInt(p32, var818)
			local _ = var824
			var818 = var825
			continue
		end
		if var819 == protoModule.wireTypes.lengthDelimited then
			if var823 == 1 then
				local _ = nil
				local var826, var827 = protoModule.readBuffer(p32, var818)
				var818 = var827
				var817.community_id = buffer.tostring(var826)
			else
				local _ = nil
				local var828, var829 = protoModule.readVarInt(p32, var818)
				var818 = var829 + var828
			end
		elseif var819 == protoModule.wireTypes.i32 then
			local _ = nil
			local var830, var831 = protoModule.readFixed32(p32, var818)
			local _ = var830
			var818 = var831
		elseif var819 == protoModule.wireTypes.i64 then
			local _ = nil
			local var832, var833 = protoModule.readFixed64(p32, var818)
			local _ = var832
			var818 = var833
		else
			error("Unsupported wire type: " .. var1446)
		end
	end
	return var817
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
	local var834 = t_32.new()
	
	if self.community_id ~= nil then
		var834.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var834.community_id = self.communityId
	end
	return var834
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
	local var834 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var835 = v:encode()
			local var836, var837 = protoModule.writeTag(buff, var834, 1, protoModule.wireTypes.lengthDelimited)
			var836, var1467 = protoModule.writeBuffer(var836, var837, var835, buffer.len(var835))
			buff = var836
			var834 = var837
		end
	end
	local buff_1 = buffer.create(var834)
	buffer.copy(buff_1, 0, buff, 0, var834)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var838 = t_33.new()
	local var839 = 0
	while var839 < buffer.len(p33) do
		local _ = nil
		local var840 = nil
		local var841, var842, var843 = protoModule.readTag(p33, var839)
		local var844 = var841
		var840 = var842
		var839 = var843
		
		if var840 == protoModule.wireTypes.varint then
			local _ = nil
			local var845, var846 = protoModule.readVarInt(p33, var839)
			local _ = var845
			var839 = var846
			continue
		end
		if var840 == protoModule.wireTypes.lengthDelimited then
			if var844 == 1 then
				local _ = nil
				local var847, var848 = protoModule.readBuffer(p33, var839)
				var839 = var848
				table.insert(var838.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var847))
			else
				local _ = nil
				local var849, var850 = protoModule.readVarInt(p33, var839)
				var839 = var850 + var849
			end
		elseif var840 == protoModule.wireTypes.i32 then
			local _ = nil
			local var851, var852 = protoModule.readFixed32(p33, var839)
			local _ = var851
			var839 = var852
		elseif var840 == protoModule.wireTypes.i64 then
			local _ = nil
			local var853, var854 = protoModule.readFixed64(p33, var839)
			local _ = var853
			var839 = var854
		else
			error("Unsupported wire type: " .. var1471)
		end
	end
	return var838
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
	local var855 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var855.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var855.social_link_items = t_1
	end
	return var855
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
	local var856 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var857, var858 = protoModule.writeTag(buff, var856, 1, protoModule.wireTypes.lengthDelimited)
		var857, var1494 = protoModule.writeString(var857, var858, self.social_link_id)
		buff = var857
		var856 = var858
	end
	local buff_1 = buffer.create(var856)
	buffer.copy(buff_1, 0, buff, 0, var856)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref)
	local var856 = t_34.new()
	local var857 = 0
	while var857 < buffer.len(p34) do
		local _ = nil
		local var858 = nil
		local var859, var860, var861 = protoModule.readTag(p34, var857)
		local var862 = var859
		var858 = var860
		var857 = var861
		
		if var858 == protoModule.wireTypes.varint then
			local _ = nil
			local var863, var864 = protoModule.readVarInt(p34, var857)
			local _ = var863
			var857 = var864
			continue
		end
		if var858 == protoModule.wireTypes.lengthDelimited then
			if var862 == 1 then
				local _ = nil
				local var865, var866 = protoModule.readBuffer(p34, var857)
				var857 = var866
				var856.social_link_id = buffer.tostring(var865)
			else
				local _ = nil
				local var867, var868 = protoModule.readVarInt(p34, var857)
				var857 = var868 + var867
			end
		elseif var858 == protoModule.wireTypes.i32 then
			local _ = nil
			local var869, var870 = protoModule.readFixed32(p34, var857)
			local _ = var869
			var857 = var870
		elseif var858 == protoModule.wireTypes.i64 then
			local _ = nil
			local var871, var872 = protoModule.readFixed64(p34, var857)
			local _ = var871
			var857 = var872
		else
			error("Unsupported wire type: " .. var1498)
		end
	end
	return var856
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
	local var873 = t_34.new()
	
	if self.social_link_id ~= nil then
		var873.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var873.social_link_id = self.socialLinkId
	end
	return var873
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
		sponsored_user_cohort = if p35 == nil or p35.sponsored_user_cohort == nil then nil else p35.sponsored_user_cohort
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var873 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var874, var875 = protoModule.writeTag(buff, var873, 1, protoModule.wireTypes.lengthDelimited)
		var874, var1518 = protoModule.writeString(var874, var875, self.title)
		buff = var874
		var873 = var875
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var876 = v:encode()
			local var877, var878 = protoModule.writeTag(buff, var873, 2, protoModule.wireTypes.lengthDelimited)
			var877, var1521 = protoModule.writeBuffer(var877, var878, var876, buffer.len(var876))
			buff = var877
			var873 = var878
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var879, var880 = protoModule.writeTag(buff, var873, 3, protoModule.wireTypes.lengthDelimited)
		var879, var1523 = protoModule.writeString(var879, var880, self.next_page_token)
		buff = var879
		var873 = var880
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var881, var882 = protoModule.writeTag(buff, var873, 4, protoModule.wireTypes.lengthDelimited)
		var881, var1525 = protoModule.writeString(var881, var882, self.sort_id)
		buff = var881
		var873 = var882
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var883, var884 = protoModule.writeTag(buff, var873, 5, protoModule.wireTypes.varint)
		var883, var1527 = protoModule.writeVarInt(var883, var884, self.secondary_sort_id)
		buff = var883
		var873 = var884
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var885, var886 = protoModule.writeTag(buff, var873, 6, protoModule.wireTypes.varint)
		var885, var1529 = protoModule.writeVarInt(var885, var886, self.max_visible_rows)
		buff = var885
		var873 = var886
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var887, var888 = protoModule.writeTag(buff, var873, 7, protoModule.wireTypes.lengthDelimited)
		var887, var1531 = protoModule.writeString(var887, var888, self.subtitle)
		buff = var887
		var873 = var888
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var889, var890 = protoModule.writeTag(buff, var873, 8, protoModule.wireTypes.lengthDelimited)
		var889, var1533 = protoModule.writeString(var889, var890, self.info_text)
		buff = var889
		var873 = var890
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var891, var892 = protoModule.writeTag(buff, var873, 9, protoModule.wireTypes.lengthDelimited)
		var891, var1535 = protoModule.writeString(var891, var892, self.subtitle_link_path)
		buff = var891
		var873 = var892
	end
	if self.is_placeholder ~= nil then
		local var893, var894 = protoModule.writeTag(buff, var873, 10, protoModule.wireTypes.varint)
		var893, var1537 = protoModule.writeVarInt(var893, var894, if self.is_placeholder then 1 else 0)
		buff = var893
		var873 = var894
	end
	if self.primary_sort_id ~= nil then
		local var895, var896 = protoModule.writeTag(buff, var873, 11, protoModule.wireTypes.varint)
		var895, var1539 = protoModule.writeVarInt(var895, var896, self.primary_sort_id)
		buff = var895
		var873 = var896
	end
	if self.applied_filters ~= nil then
		local var897, var898 = protoModule.writeTag(buff, var873, 12, protoModule.wireTypes.lengthDelimited)
		var897, var1541 = protoModule.writeString(var897, var898, self.applied_filters)
		buff = var897
		var873 = var898
	end
	if self.pool_id ~= nil then
		local var899, var900 = protoModule.writeTag(buff, var873, 13, protoModule.wireTypes.lengthDelimited)
		var899, var1543 = protoModule.writeString(var899, var900, self.pool_id)
		buff = var899
		var873 = var900
	end
	if self.has_emphasized_tile then
		local var901, var902 = protoModule.writeTag(buff, var873, 14, protoModule.wireTypes.varint)
		var901, var1545 = protoModule.writeVarInt(var901, var902, if self.has_emphasized_tile then 1 else 0)
		buff = var901
		var873 = var902
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var903, var904 = protoModule.writeTag(buff, var873, 15, protoModule.wireTypes.lengthDelimited)
		var903, var1547 = protoModule.writeString(var903, var904, self.tile_activation_mode)
		buff = var903
		var873 = var904
	end
	if self.initial_feed_visible_rows ~= nil then
		local var905, var906 = protoModule.writeTag(buff, var873, 16, protoModule.wireTypes.varint)
		var905, var1549 = protoModule.writeVarInt(var905, var906, self.initial_feed_visible_rows)
		buff = var905
		var873 = var906
	end
	if self.visible_rows_per_reveal ~= nil then
		local var907, var908 = protoModule.writeTag(buff, var873, 17, protoModule.wireTypes.varint)
		var907, var1551 = protoModule.writeVarInt(var907, var908, self.visible_rows_per_reveal)
		buff = var907
		var873 = var908
	end
	if self.sponsored_user_cohort ~= nil then
		local var909, var910 = protoModule.writeTag(buff, var873, 18, protoModule.wireTypes.lengthDelimited)
		var909, var1553 = protoModule.writeString(var909, var910, self.sponsored_user_cohort)
		buff = var909
		var873 = var910
	end
	local buff_1 = buffer.create(var873)
	buffer.copy(buff_1, 0, buff, 0, var873)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var911 = t_35.new()
	local var912 = 0
	while var912 < buffer.len(p35) do
		local _ = nil
		local var913 = nil
		local var914, var915, var916 = protoModule.readTag(p35, var912)
		local var917 = var914
		var913 = var915
		var912 = var916
		
		if var913 == protoModule.wireTypes.varint then
			if var917 == 5 then
				local _ = nil
				local var918, var919 = protoModule.readVarIntI32(p35, var912)
				var912 = var919
				var911.secondary_sort_id = var918
			elseif var917 == 6 then
				local _ = nil
				local var920, var921 = protoModule.readVarIntI32(p35, var912)
				var912 = var921
				var911.max_visible_rows = var920
			elseif var917 == 10 then
				local _ = nil
				local var922, var923 = protoModule.readVarInt(p35, var912)
				var912 = var923
				var911.is_placeholder = var922 ~= 0
			elseif var917 == 11 then
				local _ = nil
				local var924, var925 = protoModule.readVarIntI32(p35, var912)
				var912 = var925
				var911.primary_sort_id = var924
			elseif var917 == 14 then
				local _ = nil
				local var926, var927 = protoModule.readVarInt(p35, var912)
				var912 = var927
				var911.has_emphasized_tile = var926 ~= 0
			elseif var917 == 16 then
				local _ = nil
				local var928, var929 = protoModule.readVarIntI32(p35, var912)
				var912 = var929
				var911.initial_feed_visible_rows = var928
			elseif var917 == 17 then
				local _ = nil
				local var930, var931 = protoModule.readVarIntI32(p35, var912)
				var912 = var931
				var911.visible_rows_per_reveal = var930
			else
				local _ = nil
				local var932, var933 = protoModule.readVarInt(p35, var912)
				local _ = var932
				var912 = var933
			end
		end
		if var913 == protoModule.wireTypes.lengthDelimited then
			if var917 == 1 then
				local _ = nil
				local var934, var935 = protoModule.readBuffer(p35, var912)
				var912 = var935
				var911.title = buffer.tostring(var934)
			elseif var917 == 2 then
				local _ = nil
				local var936, var937 = protoModule.readBuffer(p35, var912)
				var912 = var937
				table.insert(var911.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var936))
			elseif var917 == 3 then
				local _ = nil
				local var938, var939 = protoModule.readBuffer(p35, var912)
				var912 = var939
				var911.next_page_token = buffer.tostring(var938)
			elseif var917 == 4 then
				local _ = nil
				local var940, var941 = protoModule.readBuffer(p35, var912)
				var912 = var941
				var911.sort_id = buffer.tostring(var940)
			elseif var917 == 7 then
				local _ = nil
				local var942, var943 = protoModule.readBuffer(p35, var912)
				var912 = var943
				var911.subtitle = buffer.tostring(var942)
			elseif var917 == 8 then
				local _ = nil
				local var944, var945 = protoModule.readBuffer(p35, var912)
				var912 = var945
				var911.info_text = buffer.tostring(var944)
			elseif var917 == 9 then
				local _ = nil
				local var946, var947 = protoModule.readBuffer(p35, var912)
				var912 = var947
				var911.subtitle_link_path = buffer.tostring(var946)
			elseif var917 == 12 then
				local _ = nil
				local var948, var949 = protoModule.readBuffer(p35, var912)
				var912 = var949
				var911.applied_filters = buffer.tostring(var948)
			elseif var917 == 13 then
				local _ = nil
				local var950, var951 = protoModule.readBuffer(p35, var912)
				var912 = var951
				var911.pool_id = buffer.tostring(var950)
			elseif var917 == 15 then
				local _ = nil
				local var952, var953 = protoModule.readBuffer(p35, var912)
				var912 = var953
				var911.tile_activation_mode = buffer.tostring(var952)
			elseif var917 == 18 then
				local _ = nil
				local var954, var955 = protoModule.readBuffer(p35, var912)
				var912 = var955
				var911.sponsored_user_cohort = buffer.tostring(var954)
			else
				local _ = nil
				local var956, var957 = protoModule.readVarInt(p35, var912)
				var912 = var957 + var956
			end
		elseif var913 == protoModule.wireTypes.i32 then
			local _ = nil
			local var958, var959 = protoModule.readFixed32(p35, var912)
			local _ = var958
			var912 = var959
		elseif var913 == protoModule.wireTypes.i64 then
			local _ = nil
			local var960, var961 = protoModule.readFixed64(p35, var912)
			local _ = var960
			var912 = var961
		else
			error("Unsupported wire type: " .. var1557)
		end
	end
	return var911
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
	return t
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), t (ref)
	local var962 = t_35.new()
	
	if self.title ~= nil then
		var962.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var962.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var962.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var962.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var962.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var962.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var962.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var962.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var962.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var962.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var962.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var962.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var962.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var962.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var962.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var962.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var962.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var962.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var962.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var962.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var962.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var962.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var962.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var962.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var962.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var962.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var962.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var962.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var962.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var962.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var962.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var962.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var962.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var962.sponsored_user_cohort = self.sponsoredUserCohort
	end
	return var962
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
		cta_text = if p36 == nil or p36.cta_text == nil then nil else p36.cta_text,
		badge_analytics_id = if p36 == nil or p36.badge_analytics_id == nil then nil else p36.badge_analytics_id
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var963 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var964, var965 = protoModule.writeTag(buff, var963, 1, protoModule.wireTypes.lengthDelimited)
		var964, var1614 = protoModule.writeString(var964, var965, self.universe_id)
		buff = var964
		var963 = var965
	end
	if self.is_sponsored then
		local var966, var967 = protoModule.writeTag(buff, var963, 2, protoModule.wireTypes.varint)
		var966, var1616 = protoModule.writeVarInt(var966, var967, if self.is_sponsored then 1 else 0)
		buff = var966
		var963 = var967
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var968, var969 = protoModule.writeTag(buff, var963, 3, protoModule.wireTypes.lengthDelimited)
		var968, var1618 = protoModule.writeString(var968, var969, self.roblox_component)
		buff = var968
		var963 = var969
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var970, var971 = protoModule.writeTag(buff, var963, 4, protoModule.wireTypes.lengthDelimited)
		var970, var1620 = protoModule.writeString(var970, var971, self.native_ad_data)
		buff = var970
		var963 = var971
	end
	if self.is_content_locked then
		local var972, var973 = protoModule.writeTag(buff, var963, 5, protoModule.wireTypes.varint)
		var972, var1622 = protoModule.writeVarInt(var972, var973, if self.is_content_locked then 1 else 0)
		buff = var972
		var963 = var973
	end
	if self.title ~= nil and self.title ~= "" then
		local var974, var975 = protoModule.writeTag(buff, var963, 6, protoModule.wireTypes.lengthDelimited)
		var974, var1624 = protoModule.writeString(var974, var975, self.title)
		buff = var974
		var963 = var975
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var976, var977 = protoModule.writeTag(buff, var963, 7, protoModule.wireTypes.lengthDelimited)
		var976, var1626 = protoModule.writeString(var976, var977, self.subtitle)
		buff = var976
		var963 = var977
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var978, var979 = protoModule.writeTag(buff, var963, 8, protoModule.wireTypes.lengthDelimited)
		var978, var1628 = protoModule.writeString(var978, var979, self.image_asset_id)
		buff = var978
		var963 = var979
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var980, var981 = protoModule.writeTag(buff, var963, 9, protoModule.wireTypes.lengthDelimited)
		var980, var1630 = protoModule.writeString(var980, var981, self.video_asset_id)
		buff = var980
		var963 = var981
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var982, var983 = protoModule.writeTag(buff, var963, 10, protoModule.wireTypes.lengthDelimited)
		var982, var1632 = protoModule.writeString(var982, var983, self.badge_text)
		buff = var982
		var963 = var983
	end
	if self.player_count ~= nil then
		local var984, var985 = protoModule.writeTag(buff, var963, 11, protoModule.wireTypes.varint)
		var984, var1634 = protoModule.writeVarInt(var984, var985, self.player_count)
		buff = var984
		var963 = var985
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var986, var987 = protoModule.writeTag(buff, var963, 12, protoModule.wireTypes.lengthDelimited)
		var986, var1636 = protoModule.writeString(var986, var987, self.creator_key)
		buff = var986
		var963 = var987
	end
	if self.rank ~= nil then
		local var988, var989 = protoModule.writeTag(buff, var963, 13, protoModule.wireTypes.varint)
		var988, var1638 = protoModule.writeVarInt(var988, var989, self.rank)
		buff = var988
		var963 = var989
	end
	if self.payer_name ~= nil then
		local var990, var991 = protoModule.writeTag(buff, var963, 14, protoModule.wireTypes.lengthDelimited)
		var990, var1640 = protoModule.writeString(var990, var991, self.payer_name)
		buff = var990
		var963 = var991
	end
	if self.logo_asset_id ~= nil then
		local var992, var993 = protoModule.writeTag(buff, var963, 15, protoModule.wireTypes.lengthDelimited)
		var992, var1642 = protoModule.writeString(var992, var993, self.logo_asset_id)
		buff = var992
		var963 = var993
	end
	if self.logo_aspect_ratio ~= nil then
		local var994, var995 = protoModule.writeTag(buff, var963, 16, protoModule.wireTypes.i64)
		var994, var1644 = protoModule.writeDouble(var994, var995, self.logo_aspect_ratio)
		buff = var994
		var963 = var995
	end
	if self.place_id ~= nil then
		local var996, var997 = protoModule.writeTag(buff, var963, 17, protoModule.wireTypes.lengthDelimited)
		var996, var1646 = protoModule.writeString(var996, var997, self.place_id)
		buff = var996
		var963 = var997
	end
	if self.launch_data ~= nil then
		local var998, var999 = protoModule.writeTag(buff, var963, 18, protoModule.wireTypes.lengthDelimited)
		var998, var1648 = protoModule.writeString(var998, var999, self.launch_data)
		buff = var998
		var963 = var999
	end
	if self.cta_text ~= nil then
		local var1000, var1001 = protoModule.writeTag(buff, var963, 20, protoModule.wireTypes.lengthDelimited)
		var1000, var1650 = protoModule.writeString(var1000, var1001, self.cta_text)
		buff = var1000
		var963 = var1001
	end
	if self.badge_analytics_id ~= nil then
		local var1002, var1003 = protoModule.writeTag(buff, var963, 21, protoModule.wireTypes.lengthDelimited)
		var1002, var1652 = protoModule.writeString(var1002, var1003, self.badge_analytics_id)
		buff = var1002
		var963 = var1003
	end
	local buff_1 = buffer.create(var963)
	buffer.copy(buff_1, 0, buff, 0, var963)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref)
	local var963 = t_36.new()
	local var964 = 0
	while var964 < buffer.len(p36) do
		local _ = nil
		local var965 = nil
		local var966, var967, var968 = protoModule.readTag(p36, var964)
		local var969 = var966
		var965 = var967
		var964 = var968
		
		if var965 == protoModule.wireTypes.varint then
			if var969 == 2 then
				local _ = nil
				local var970, var971 = protoModule.readVarInt(p36, var964)
				var964 = var971
				var963.is_sponsored = var970 ~= 0
			elseif var969 == 5 then
				local _ = nil
				local var972, var973 = protoModule.readVarInt(p36, var964)
				var964 = var973
				var963.is_content_locked = var972 ~= 0
			elseif var969 == 11 then
				local _ = nil
				local var974, var975 = protoModule.readVarIntI64(p36, var964)
				var964 = var975
				var963.player_count = var974
			elseif var969 == 13 then
				local _ = nil
				local var976, var977 = protoModule.readVarIntI32(p36, var964)
				var964 = var977
				var963.rank = var976
			else
				local _ = nil
				local var978, var979 = protoModule.readVarInt(p36, var964)
				local _ = var978
				var964 = var979
			end
		end
		if var965 == protoModule.wireTypes.lengthDelimited then
			if var969 == 1 then
				local _ = nil
				local var980, var981 = protoModule.readBuffer(p36, var964)
				var964 = var981
				var963.universe_id = buffer.tostring(var980)
			elseif var969 == 3 then
				local _ = nil
				local var982, var983 = protoModule.readBuffer(p36, var964)
				var964 = var983
				var963.roblox_component = buffer.tostring(var982)
			elseif var969 == 4 then
				local _ = nil
				local var984, var985 = protoModule.readBuffer(p36, var964)
				var964 = var985
				var963.native_ad_data = buffer.tostring(var984)
			elseif var969 == 6 then
				local _ = nil
				local var986, var987 = protoModule.readBuffer(p36, var964)
				var964 = var987
				var963.title = buffer.tostring(var986)
			elseif var969 == 7 then
				local _ = nil
				local var988, var989 = protoModule.readBuffer(p36, var964)
				var964 = var989
				var963.subtitle = buffer.tostring(var988)
			elseif var969 == 8 then
				local _ = nil
				local var990, var991 = protoModule.readBuffer(p36, var964)
				var964 = var991
				var963.image_asset_id = buffer.tostring(var990)
			elseif var969 == 9 then
				local _ = nil
				local var992, var993 = protoModule.readBuffer(p36, var964)
				var964 = var993
				var963.video_asset_id = buffer.tostring(var992)
			elseif var969 == 10 then
				local _ = nil
				local var994, var995 = protoModule.readBuffer(p36, var964)
				var964 = var995
				var963.badge_text = buffer.tostring(var994)
			elseif var969 == 12 then
				local _ = nil
				local var996, var997 = protoModule.readBuffer(p36, var964)
				var964 = var997
				var963.creator_key = buffer.tostring(var996)
			elseif var969 == 14 then
				local _ = nil
				local var998, var999 = protoModule.readBuffer(p36, var964)
				var964 = var999
				var963.payer_name = buffer.tostring(var998)
			elseif var969 == 15 then
				local _ = nil
				local var1000, var1001 = protoModule.readBuffer(p36, var964)
				var964 = var1001
				var963.logo_asset_id = buffer.tostring(var1000)
			elseif var969 == 17 then
				local _ = nil
				local var1002, var1003 = protoModule.readBuffer(p36, var964)
				var964 = var1003
				var963.place_id = buffer.tostring(var1002)
			elseif var969 == 18 then
				local _ = nil
				local var1004, var1005 = protoModule.readBuffer(p36, var964)
				var964 = var1005
				var963.launch_data = buffer.tostring(var1004)
			elseif var969 == 20 then
				local _ = nil
				local var1006, var1007 = protoModule.readBuffer(p36, var964)
				var964 = var1007
				var963.cta_text = buffer.tostring(var1006)
			elseif var969 == 21 then
				local _ = nil
				local var1008, var1009 = protoModule.readBuffer(p36, var964)
				var964 = var1009
				var963.badge_analytics_id = buffer.tostring(var1008)
			else
				local _ = nil
				local var1010, var1011 = protoModule.readVarInt(p36, var964)
				var964 = var1011 + var1010
			end
		elseif var965 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1012, var1013 = protoModule.readFixed32(p36, var964)
			local _ = var1012
			var964 = var1013
		elseif var965 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1656)
		elseif var969 == 16 then
			local _ = nil
			local var1014, var1015 = protoModule.readDouble(p36, var964)
			var964 = var1015
			var963.logo_aspect_ratio = var1014
		else
			local _ = nil
			local var1016, var1017 = protoModule.readFixed64(p36, var964)
			local _ = var1016
			var964 = var1017
		end
	end
	return var963
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
	if self.cta_text ~= nil then
		t.ctaText = self.cta_text
	end
	if self.badge_analytics_id ~= nil then
		t.badgeAnalyticsId = self.badge_analytics_id
	end
	return t
end

function t_36:jsonDecode()
	-- upvalues: t_36 (ref), protoModule (ref)
	local var1018 = t_36.new()
	
	if self.universe_id ~= nil then
		var1018.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1018.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1018.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1018.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1018.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1018.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1018.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1018.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1018.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1018.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1018.title = self.title
	end
	if self.subtitle ~= nil then
		var1018.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1018.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1018.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1018.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1018.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1018.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1018.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1018.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1018.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1018.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1018.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1018.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1018.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1018.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1018.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1018.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1018.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1018.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1018.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1018.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1018.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1018.launch_data = self.launchData
	end
	if self.cta_text ~= nil then
		var1018.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1018.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1018.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1018.badge_analytics_id = self.badgeAnalyticsId
	end
	return var1018
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
	local var1018 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1019, var1020 = protoModule.writeTag(buff, var1018, 1, protoModule.wireTypes.lengthDelimited)
		var1019, var1714 = protoModule.writeString(var1019, var1020, self.title)
		buff = var1019
		var1018 = var1020
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1021 = v:encode()
			local var1022, var1023 = protoModule.writeTag(buff, var1018, 2, protoModule.wireTypes.lengthDelimited)
			var1022, var1717 = protoModule.writeBuffer(var1022, var1023, var1021, buffer.len(var1021))
			buff = var1022
			var1018 = var1023
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1024, var1025 = protoModule.writeTag(buff, var1018, 3, protoModule.wireTypes.lengthDelimited)
		var1024, var1719 = protoModule.writeString(var1024, var1025, self.next_page_token)
		buff = var1024
		var1018 = var1025
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1026, var1027 = protoModule.writeTag(buff, var1018, 4, protoModule.wireTypes.lengthDelimited)
		var1026, var1721 = protoModule.writeString(var1026, var1027, self.sort_id)
		buff = var1026
		var1018 = var1027
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1028, var1029 = protoModule.writeTag(buff, var1018, 5, protoModule.wireTypes.varint)
		var1028, var1723 = protoModule.writeVarInt(var1028, var1029, self.secondary_sort_id)
		buff = var1028
		var1018 = var1029
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1030, var1031 = protoModule.writeTag(buff, var1018, 6, protoModule.wireTypes.lengthDelimited)
		var1030, var1725 = protoModule.writeString(var1030, var1031, self.subtitle)
		buff = var1030
		var1018 = var1031
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1032, var1033 = protoModule.writeTag(buff, var1018, 7, protoModule.wireTypes.lengthDelimited)
		var1032, var1727 = protoModule.writeString(var1032, var1033, self.info_text)
		buff = var1032
		var1018 = var1033
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1034, var1035 = protoModule.writeTag(buff, var1018, 8, protoModule.wireTypes.lengthDelimited)
		var1034, var1729 = protoModule.writeString(var1034, var1035, self.subtitle_link_path)
		buff = var1034
		var1018 = var1035
	end
	if self.is_placeholder ~= nil then
		local var1036, var1037 = protoModule.writeTag(buff, var1018, 9, protoModule.wireTypes.varint)
		var1036, var1731 = protoModule.writeVarInt(var1036, var1037, if self.is_placeholder then 1 else 0)
		buff = var1036
		var1018 = var1037
	end
	if self.primary_sort_id ~= nil then
		local var1038, var1039 = protoModule.writeTag(buff, var1018, 10, protoModule.wireTypes.varint)
		var1038, var1733 = protoModule.writeVarInt(var1038, var1039, self.primary_sort_id)
		buff = var1038
		var1018 = var1039
	end
	if self.applied_filters ~= nil then
		local var1040, var1041 = protoModule.writeTag(buff, var1018, 11, protoModule.wireTypes.lengthDelimited)
		var1040, var1735 = protoModule.writeString(var1040, var1041, self.applied_filters)
		buff = var1040
		var1018 = var1041
	end
	local buff_1 = buffer.create(var1018)
	buffer.copy(buff_1, 0, buff, 0, var1018)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1042 = t_37.new()
	local var1043 = 0
	while var1043 < buffer.len(p37) do
		local _ = nil
		local var1044 = nil
		local var1045, var1046, var1047 = protoModule.readTag(p37, var1043)
		local var1048 = var1045
		var1044 = var1046
		var1043 = var1047
		
		if var1044 == protoModule.wireTypes.varint then
			if var1048 == 5 then
				local _ = nil
				local var1049, var1050 = protoModule.readVarIntI32(p37, var1043)
				var1043 = var1050
				var1042.secondary_sort_id = var1049
			elseif var1048 == 9 then
				local _ = nil
				local var1051, var1052 = protoModule.readVarInt(p37, var1043)
				var1043 = var1052
				var1042.is_placeholder = var1051 ~= 0
			elseif var1048 == 10 then
				local _ = nil
				local var1053, var1054 = protoModule.readVarIntI32(p37, var1043)
				var1043 = var1054
				var1042.primary_sort_id = var1053
			else
				local _ = nil
				local var1055, var1056 = protoModule.readVarInt(p37, var1043)
				local _ = var1055
				var1043 = var1056
			end
		end
		if var1044 == protoModule.wireTypes.lengthDelimited then
			if var1048 == 1 then
				local _ = nil
				local var1057, var1058 = protoModule.readBuffer(p37, var1043)
				var1043 = var1058
				var1042.title = buffer.tostring(var1057)
			elseif var1048 == 2 then
				local _ = nil
				local var1059, var1060 = protoModule.readBuffer(p37, var1043)
				var1043 = var1060
				table.insert(var1042.song_items, t.SongCarouselInputData_SongItem.decode(var1059))
			elseif var1048 == 3 then
				local _ = nil
				local var1061, var1062 = protoModule.readBuffer(p37, var1043)
				var1043 = var1062
				var1042.next_page_token = buffer.tostring(var1061)
			elseif var1048 == 4 then
				local _ = nil
				local var1063, var1064 = protoModule.readBuffer(p37, var1043)
				var1043 = var1064
				var1042.sort_id = buffer.tostring(var1063)
			elseif var1048 == 6 then
				local _ = nil
				local var1065, var1066 = protoModule.readBuffer(p37, var1043)
				var1043 = var1066
				var1042.subtitle = buffer.tostring(var1065)
			elseif var1048 == 7 then
				local _ = nil
				local var1067, var1068 = protoModule.readBuffer(p37, var1043)
				var1043 = var1068
				var1042.info_text = buffer.tostring(var1067)
			elseif var1048 == 8 then
				local _ = nil
				local var1069, var1070 = protoModule.readBuffer(p37, var1043)
				var1043 = var1070
				var1042.subtitle_link_path = buffer.tostring(var1069)
			elseif var1048 == 11 then
				local _ = nil
				local var1071, var1072 = protoModule.readBuffer(p37, var1043)
				var1043 = var1072
				var1042.applied_filters = buffer.tostring(var1071)
			else
				local _ = nil
				local var1073, var1074 = protoModule.readVarInt(p37, var1043)
				var1043 = var1074 + var1073
			end
		elseif var1044 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1075, var1076 = protoModule.readFixed32(p37, var1043)
			local _ = var1075
			var1043 = var1076
		elseif var1044 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1077, var1078 = protoModule.readFixed64(p37, var1043)
			local _ = var1077
			var1043 = var1078
		else
			error("Unsupported wire type: " .. var1739)
		end
	end
	return var1042
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
	local var1079 = t_37.new()
	
	if self.title ~= nil then
		var1079.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1079.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1079.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1079.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1079.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1079.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1079.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1079.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1079.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1079.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1079.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1079.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1079.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1079.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1079.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1079.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1079.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1079.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1079.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1079.applied_filters = self.appliedFilters
	end
	return var1079
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
	local var1080 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1081, var1082 = protoModule.writeTag(buff, var1080, 1, protoModule.wireTypes.lengthDelimited)
		var1081, var1782 = protoModule.writeString(var1081, var1082, self.song_id)
		buff = var1081
		var1080 = var1082
	end
	local buff_1 = buffer.create(var1080)
	buffer.copy(buff_1, 0, buff, 0, var1080)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1080 = t_38.new()
	local var1081 = 0
	while var1081 < buffer.len(p38) do
		local _ = nil
		local var1082 = nil
		local var1083, var1084, var1085 = protoModule.readTag(p38, var1081)
		local var1086 = var1083
		var1082 = var1084
		var1081 = var1085
		
		if var1082 == protoModule.wireTypes.varint then
			local _ = nil
			local var1087, var1088 = protoModule.readVarInt(p38, var1081)
			local _ = var1087
			var1081 = var1088
			continue
		end
		if var1082 == protoModule.wireTypes.lengthDelimited then
			if var1086 == 1 then
				local _ = nil
				local var1089, var1090 = protoModule.readBuffer(p38, var1081)
				var1081 = var1090
				var1080.song_id = buffer.tostring(var1089)
			else
				local _ = nil
				local var1091, var1092 = protoModule.readVarInt(p38, var1081)
				var1081 = var1092 + var1091
			end
		elseif var1082 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1093, var1094 = protoModule.readFixed32(p38, var1081)
			local _ = var1093
			var1081 = var1094
		elseif var1082 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1095, var1096 = protoModule.readFixed64(p38, var1081)
			local _ = var1095
			var1081 = var1096
		else
			error("Unsupported wire type: " .. var1786)
		end
	end
	return var1080
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
	local var1097 = t_38.new()
	
	if self.song_id ~= nil then
		var1097.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1097.song_id = self.songId
	end
	return var1097
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
	local var1097 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1098, var1099 = protoModule.writeTag(buff, var1097, 1, protoModule.wireTypes.lengthDelimited)
		var1098, var1806 = protoModule.writeString(var1098, var1099, self.title)
		buff = var1098
		var1097 = var1099
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1100 = v:encode()
			local var1101, var1102 = protoModule.writeTag(buff, var1097, 2, protoModule.wireTypes.lengthDelimited)
			var1101, var1809 = protoModule.writeBuffer(var1101, var1102, var1100, buffer.len(var1100))
			buff = var1101
			var1097 = var1102
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1103, var1104 = protoModule.writeTag(buff, var1097, 3, protoModule.wireTypes.lengthDelimited)
		var1103, var1811 = protoModule.writeString(var1103, var1104, self.universe_id)
		buff = var1103
		var1097 = var1104
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1105, var1106 = protoModule.writeTag(buff, var1097, 4, protoModule.wireTypes.lengthDelimited)
		var1105, var1813 = protoModule.writeString(var1105, var1106, self.sort_id)
		buff = var1105
		var1097 = var1106
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1107, var1108 = protoModule.writeTag(buff, var1097, 5, protoModule.wireTypes.lengthDelimited)
		var1107, var1815 = protoModule.writeString(var1107, var1108, self.subtitle)
		buff = var1107
		var1097 = var1108
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1109, var1110 = protoModule.writeTag(buff, var1097, 6, protoModule.wireTypes.lengthDelimited)
		var1109, var1817 = protoModule.writeString(var1109, var1110, self.info_text)
		buff = var1109
		var1097 = var1110
	end
	local buff_1 = buffer.create(var1097)
	buffer.copy(buff_1, 0, buff, 0, var1097)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1111 = t_39.new()
	local var1112 = 0
	while var1112 < buffer.len(p39) do
		local _ = nil
		local var1113 = nil
		local var1114, var1115, var1116 = protoModule.readTag(p39, var1112)
		local var1117 = var1114
		var1113 = var1115
		var1112 = var1116
		
		if var1113 == protoModule.wireTypes.varint then
			local _ = nil
			local var1118, var1119 = protoModule.readVarInt(p39, var1112)
			local _ = var1118
			var1112 = var1119
			continue
		end
		if var1113 == protoModule.wireTypes.lengthDelimited then
			if var1117 == 1 then
				local _ = nil
				local var1120, var1121 = protoModule.readBuffer(p39, var1112)
				var1112 = var1121
				var1111.title = buffer.tostring(var1120)
			elseif var1117 == 2 then
				local _ = nil
				local var1122, var1123 = protoModule.readBuffer(p39, var1112)
				var1112 = var1123
				table.insert(var1111.event_items, t.EventsCarouselInputData_EventItem.decode(var1122))
			elseif var1117 == 3 then
				local _ = nil
				local var1124, var1125 = protoModule.readBuffer(p39, var1112)
				var1112 = var1125
				var1111.universe_id = buffer.tostring(var1124)
			elseif var1117 == 4 then
				local _ = nil
				local var1126, var1127 = protoModule.readBuffer(p39, var1112)
				var1112 = var1127
				var1111.sort_id = buffer.tostring(var1126)
			elseif var1117 == 5 then
				local _ = nil
				local var1128, var1129 = protoModule.readBuffer(p39, var1112)
				var1112 = var1129
				var1111.subtitle = buffer.tostring(var1128)
			elseif var1117 == 6 then
				local _ = nil
				local var1130, var1131 = protoModule.readBuffer(p39, var1112)
				var1112 = var1131
				var1111.info_text = buffer.tostring(var1130)
			else
				local _ = nil
				local var1132, var1133 = protoModule.readVarInt(p39, var1112)
				var1112 = var1133 + var1132
			end
		elseif var1113 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1134, var1135 = protoModule.readFixed32(p39, var1112)
			local _ = var1134
			var1112 = var1135
		elseif var1113 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1136, var1137 = protoModule.readFixed64(p39, var1112)
			local _ = var1136
			var1112 = var1137
		else
			error("Unsupported wire type: " .. var1821)
		end
	end
	return var1111
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
	local var1138 = t_39.new()
	
	if self.title ~= nil then
		var1138.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1138.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1138.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1138.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1138.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1138.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1138.sort_id = self.sortId
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
	return var1138
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
	local var1139 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1140, var1141 = protoModule.writeTag(buff, var1139, 1, protoModule.wireTypes.lengthDelimited)
		var1140, var1854 = protoModule.writeString(var1140, var1141, self.event_id)
		buff = var1140
		var1139 = var1141
	end
	local buff_1 = buffer.create(var1139)
	buffer.copy(buff_1, 0, buff, 0, var1139)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1139 = t_40.new()
	local var1140 = 0
	while var1140 < buffer.len(p40) do
		local _ = nil
		local var1141 = nil
		local var1142, var1143, var1144 = protoModule.readTag(p40, var1140)
		local var1145 = var1142
		var1141 = var1143
		var1140 = var1144
		
		if var1141 == protoModule.wireTypes.varint then
			local _ = nil
			local var1146, var1147 = protoModule.readVarInt(p40, var1140)
			local _ = var1146
			var1140 = var1147
			continue
		end
		if var1141 == protoModule.wireTypes.lengthDelimited then
			if var1145 == 1 then
				local _ = nil
				local var1148, var1149 = protoModule.readBuffer(p40, var1140)
				var1140 = var1149
				var1139.event_id = buffer.tostring(var1148)
			else
				local _ = nil
				local var1150, var1151 = protoModule.readVarInt(p40, var1140)
				var1140 = var1151 + var1150
			end
		elseif var1141 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1152, var1153 = protoModule.readFixed32(p40, var1140)
			local _ = var1152
			var1140 = var1153
		elseif var1141 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1154, var1155 = protoModule.readFixed64(p40, var1140)
			local _ = var1154
			var1140 = var1155
		else
			error("Unsupported wire type: " .. var1858)
		end
	end
	return var1139
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
	local var1156 = t_40.new()
	
	if self.event_id ~= nil then
		var1156.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1156.event_id = self.eventId
	end
	return var1156
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
		creator_key = if p41 == nil or p41.creator_key == nil then "" else p41.creator_key
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1156 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1157, var1158 = protoModule.writeTag(buff, var1156, 1, protoModule.wireTypes.lengthDelimited)
		var1157, var1878 = protoModule.writeString(var1157, var1158, self.universe_id)
		buff = var1157
		var1156 = var1158
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1159, var1160 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1159, var1880 = protoModule.writeString(var1159, var1160, i)
			local var1161 = v:encode()
			var1160, var1882 = protoModule.writeTag(var1159, var1160, 2, protoModule.wireTypes.lengthDelimited)
			var1160, var1882 = protoModule.writeBuffer(var1160, var1882, var1161, buffer.len(var1161))
			local var1162 = var1160
			local var1163 = var1882
			local var1164, var1165 = protoModule.writeTag(buff, var1156, 2, protoModule.wireTypes.lengthDelimited)
			var1164, var1886 = protoModule.writeBuffer(var1164, var1165, var1162, var1163)
			buff = var1164
			var1156 = var1165
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1166, var1167 = protoModule.writeTag(buff, var1156, 3, protoModule.wireTypes.lengthDelimited)
			var1166, var1888 = protoModule.writeString(var1166, var1167, v)
			buff = var1166
			var1156 = var1167
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1168, var1169 = protoModule.writeTag(buff, var1156, 4, protoModule.wireTypes.lengthDelimited)
		var1168, var1890 = protoModule.writeString(var1168, var1169, self.creator_key)
		buff = var1168
		var1156 = var1169
	end
	local buff_1 = buffer.create(var1156)
	buffer.copy(buff_1, 0, buff, 0, var1156)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1170 = t_41.new()
	local var1171 = 0
	while var1171 < buffer.len(p41) do
		local _ = nil
		local var1172 = nil
		local var1173, var1174, var1175 = protoModule.readTag(p41, var1171)
		local var1176 = var1173
		var1172 = var1174
		var1171 = var1175
		
		if var1172 == protoModule.wireTypes.varint then
			local _ = nil
			local var1177, var1178 = protoModule.readVarInt(p41, var1171)
			local _ = var1177
			var1171 = var1178
			continue
		end
		if var1172 == protoModule.wireTypes.lengthDelimited then
			if var1176 == 1 then
				local _ = nil
				local var1179, var1180 = protoModule.readBuffer(p41, var1171)
				var1171 = var1180
				var1170.universe_id = buffer.tostring(var1179)
			elseif var1176 == 2 then
				local _ = nil
				local var1181, var1182 = protoModule.readBuffer(p41, var1171)
				var1171 = var1182
				var1181 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1181)
				var1170.entry_map[var1181.key or ""] = var1181.value or t.FeedEntry.new()
			elseif var1176 == 3 then
				local _ = nil
				local var1183, var1184 = protoModule.readBuffer(p41, var1171)
				var1171 = var1184
				table.insert(var1170.entry_order, buffer.tostring(var1183))
			elseif var1176 == 4 then
				local _ = nil
				local var1185, var1186 = protoModule.readBuffer(p41, var1171)
				var1171 = var1186
				var1170.creator_key = buffer.tostring(var1185)
			else
				local _ = nil
				local var1187, var1188 = protoModule.readVarInt(p41, var1171)
				var1171 = var1188 + var1187
			end
		elseif var1172 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1189, var1190 = protoModule.readFixed32(p41, var1171)
			local _ = var1189
			var1171 = var1190
		elseif var1172 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1191, var1192 = protoModule.readFixed64(p41, var1171)
			local _ = var1191
			var1171 = var1192
		else
			error("Unsupported wire type: " .. var1894)
		end
	end
	return var1170
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
	return t
end

function t_41:jsonDecode()
	-- upvalues: t_41 (ref), t (ref)
	local var1193 = t_41.new()
	
	if self.universe_id ~= nil then
		var1193.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1193.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1193.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1193.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1193.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1193.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1193.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1193.creator_key = self.creatorKey
	end
	return var1193
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
	local var1194 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1195, var1196 = protoModule.writeTag(buff, var1194, 1, protoModule.wireTypes.lengthDelimited)
		var1195, var1926 = protoModule.writeString(var1195, var1196, self.key)
		buff = var1195
		var1194 = var1196
	end
	if self.value ~= nil then
		local var1197 = self.value:encode()
		local var1198, var1199 = protoModule.writeTag(buff, var1194, 2, protoModule.wireTypes.lengthDelimited)
		var1198, var1929 = protoModule.writeBuffer(var1198, var1199, var1197, buffer.len(var1197))
		buff = var1198
		var1194 = var1199
	end
	local buff_1 = buffer.create(var1194)
	buffer.copy(buff_1, 0, buff, 0, var1194)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1194 = t_42.new()
	local var1195 = 0
	while var1195 < buffer.len(p42) do
		local _ = nil
		local var1196 = nil
		local var1197, var1198, var1199 = protoModule.readTag(p42, var1195)
		local var1200 = var1197
		var1196 = var1198
		var1195 = var1199
		
		if var1196 == protoModule.wireTypes.varint then
			local _ = nil
			local var1201, var1202 = protoModule.readVarInt(p42, var1195)
			local _ = var1201
			var1195 = var1202
			continue
		end
		if var1196 == protoModule.wireTypes.lengthDelimited then
			if var1200 == 1 then
				local _ = nil
				local var1203, var1204 = protoModule.readBuffer(p42, var1195)
				var1195 = var1204
				var1194.key = buffer.tostring(var1203)
			elseif var1200 == 2 then
				local _ = nil
				local var1205, var1206 = protoModule.readBuffer(p42, var1195)
				var1195 = var1206
				var1194.value = t.FeedEntry.decode(var1205)
			else
				local _ = nil
				local var1207, var1208 = protoModule.readVarInt(p42, var1195)
				var1195 = var1208 + var1207
			end
		elseif var1196 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1209, var1210 = protoModule.readFixed32(p42, var1195)
			local _ = var1209
			var1195 = var1210
		elseif var1196 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1211, var1212 = protoModule.readFixed64(p42, var1195)
			local _ = var1211
			var1195 = var1212
		else
			error("Unsupported wire type: " .. var1933)
		end
	end
	return var1194
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
	local var1213 = t_42.new()
	
	if self.key ~= nil then
		var1213.key = self.key
	end
	if self.value ~= nil then
		var1213.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1213
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
		game_passes = if p43 == nil or p43.game_passes == nil then {} else p43.game_passes
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1213 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1214 = v:encode()
			local var1215, var1216 = protoModule.writeTag(buff, var1213, 1, protoModule.wireTypes.lengthDelimited)
			var1215, var1956 = protoModule.writeBuffer(var1215, var1216, var1214, buffer.len(var1214))
			buff = var1215
			var1213 = var1216
		end
	end
	local buff_1 = buffer.create(var1213)
	buffer.copy(buff_1, 0, buff, 0, var1213)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1217 = t_43.new()
	local var1218 = 0
	while var1218 < buffer.len(p43) do
		local _ = nil
		local var1219 = nil
		local var1220, var1221, var1222 = protoModule.readTag(p43, var1218)
		local var1223 = var1220
		var1219 = var1221
		var1218 = var1222
		
		if var1219 == protoModule.wireTypes.varint then
			local _ = nil
			local var1224, var1225 = protoModule.readVarInt(p43, var1218)
			local _ = var1224
			var1218 = var1225
			continue
		end
		if var1219 == protoModule.wireTypes.lengthDelimited then
			if var1223 == 1 then
				local _ = nil
				local var1226, var1227 = protoModule.readBuffer(p43, var1218)
				var1218 = var1227
				table.insert(var1217.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1226))
			else
				local _ = nil
				local var1228, var1229 = protoModule.readVarInt(p43, var1218)
				var1218 = var1229 + var1228
			end
		elseif var1219 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1230, var1231 = protoModule.readFixed32(p43, var1218)
			local _ = var1230
			var1218 = var1231
		elseif var1219 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1232, var1233 = protoModule.readFixed64(p43, var1218)
			local _ = var1232
			var1218 = var1233
		else
			error("Unsupported wire type: " .. var1960)
		end
	end
	return var1217
end

function t_43:jsonEncode()
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

function t_43:jsonDecode()
	-- upvalues: t_43 (ref), t (ref)
	local var1234 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1234.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1234.game_passes = t_1
	end
	return var1234
end

t_43.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_43
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p44)
	-- upvalues: t_44 (ref)
	return setmetatable({
		game_pass_id = if p44 == nil or p44.game_pass_id == nil then "" else p44.game_pass_id
	}, t_44)
end

function t_44:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1235 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1236, var1237 = protoModule.writeTag(buff, var1235, 1, protoModule.wireTypes.lengthDelimited)
		var1236, var1983 = protoModule.writeString(var1236, var1237, self.game_pass_id)
		buff = var1236
		var1235 = var1237
	end
	local buff_1 = buffer.create(var1235)
	buffer.copy(buff_1, 0, buff, 0, var1235)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1235 = t_44.new()
	local var1236 = 0
	while var1236 < buffer.len(p44) do
		local _ = nil
		local var1237 = nil
		local var1238, var1239, var1240 = protoModule.readTag(p44, var1236)
		local var1241 = var1238
		var1237 = var1239
		var1236 = var1240
		
		if var1237 == protoModule.wireTypes.varint then
			local _ = nil
			local var1242, var1243 = protoModule.readVarInt(p44, var1236)
			local _ = var1242
			var1236 = var1243
			continue
		end
		if var1237 == protoModule.wireTypes.lengthDelimited then
			if var1241 == 1 then
				local _ = nil
				local var1244, var1245 = protoModule.readBuffer(p44, var1236)
				var1236 = var1245
				var1235.game_pass_id = buffer.tostring(var1244)
			else
				local _ = nil
				local var1246, var1247 = protoModule.readVarInt(p44, var1236)
				var1236 = var1247 + var1246
			end
		elseif var1237 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1248, var1249 = protoModule.readFixed32(p44, var1236)
			local _ = var1248
			var1236 = var1249
		elseif var1237 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1250, var1251 = protoModule.readFixed64(p44, var1236)
			local _ = var1250
			var1236 = var1251
		else
			error("Unsupported wire type: " .. var1987)
		end
	end
	return var1235
end

function t_44:jsonEncode()
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_44:jsonDecode()
	-- upvalues: t_44 (ref)
	local var1252 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1252.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1252.game_pass_id = self.gamePassId
	end
	return var1252
end

t_44.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_44
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p45)
	-- upvalues: t_45 (ref)
	return setmetatable({
		developer_products = if p45 == nil or p45.developer_products == nil then {} else p45.developer_products
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1252 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1253 = v:encode()
			local var1254, var1255 = protoModule.writeTag(buff, var1252, 1, protoModule.wireTypes.lengthDelimited)
			var1254, var2008 = protoModule.writeBuffer(var1254, var1255, var1253, buffer.len(var1253))
			buff = var1254
			var1252 = var1255
		end
	end
	local buff_1 = buffer.create(var1252)
	buffer.copy(buff_1, 0, buff, 0, var1252)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1256 = t_45.new()
	local var1257 = 0
	while var1257 < buffer.len(p45) do
		local _ = nil
		local var1258 = nil
		local var1259, var1260, var1261 = protoModule.readTag(p45, var1257)
		local var1262 = var1259
		var1258 = var1260
		var1257 = var1261
		
		if var1258 == protoModule.wireTypes.varint then
			local _ = nil
			local var1263, var1264 = protoModule.readVarInt(p45, var1257)
			local _ = var1263
			var1257 = var1264
			continue
		end
		if var1258 == protoModule.wireTypes.lengthDelimited then
			if var1262 == 1 then
				local _ = nil
				local var1265, var1266 = protoModule.readBuffer(p45, var1257)
				var1257 = var1266
				table.insert(var1256.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1265))
			else
				local _ = nil
				local var1267, var1268 = protoModule.readVarInt(p45, var1257)
				var1257 = var1268 + var1267
			end
		elseif var1258 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1269, var1270 = protoModule.readFixed32(p45, var1257)
			local _ = var1269
			var1257 = var1270
		elseif var1258 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1271, var1272 = protoModule.readFixed64(p45, var1257)
			local _ = var1271
			var1257 = var1272
		else
			error("Unsupported wire type: " .. var2012)
		end
	end
	return var1256
end

function t_45:jsonEncode()
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

function t_45:jsonDecode()
	-- upvalues: t_45 (ref), t (ref)
	local var1273 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1273.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1273.developer_products = t_1
	end
	return var1273
end

t_45.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_45
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p46)
	-- upvalues: t_46 (ref)
	return setmetatable({
		developer_product_id = if p46 == nil or p46.developer_product_id == nil then "" else p46.developer_product_id
	}, t_46)
end

function t_46:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1274 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1275, var1276 = protoModule.writeTag(buff, var1274, 1, protoModule.wireTypes.lengthDelimited)
		var1275, var2035 = protoModule.writeString(var1275, var1276, self.developer_product_id)
		buff = var1275
		var1274 = var1276
	end
	local buff_1 = buffer.create(var1274)
	buffer.copy(buff_1, 0, buff, 0, var1274)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1274 = t_46.new()
	local var1275 = 0
	while var1275 < buffer.len(p46) do
		local _ = nil
		local var1276 = nil
		local var1277, var1278, var1279 = protoModule.readTag(p46, var1275)
		local var1280 = var1277
		var1276 = var1278
		var1275 = var1279
		
		if var1276 == protoModule.wireTypes.varint then
			local _ = nil
			local var1281, var1282 = protoModule.readVarInt(p46, var1275)
			local _ = var1281
			var1275 = var1282
			continue
		end
		if var1276 == protoModule.wireTypes.lengthDelimited then
			if var1280 == 1 then
				local _ = nil
				local var1283, var1284 = protoModule.readBuffer(p46, var1275)
				var1275 = var1284
				var1274.developer_product_id = buffer.tostring(var1283)
			else
				local _ = nil
				local var1285, var1286 = protoModule.readVarInt(p46, var1275)
				var1275 = var1286 + var1285
			end
		elseif var1276 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1287, var1288 = protoModule.readFixed32(p46, var1275)
			local _ = var1287
			var1275 = var1288
		elseif var1276 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1289, var1290 = protoModule.readFixed64(p46, var1275)
			local _ = var1289
			var1275 = var1290
		else
			error("Unsupported wire type: " .. var2039)
		end
	end
	return var1274
end

function t_46:jsonEncode()
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_46:jsonDecode()
	-- upvalues: t_46 (ref)
	local var1291 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var1291.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1291.developer_product_id = self.developerProductId
	end
	return var1291
end

t_46.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_46
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p47)
	-- upvalues: t_47 (ref)
	return setmetatable({
		subscriptions = if p47 == nil or p47.subscriptions == nil then {} else p47.subscriptions
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1291 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1292 = v:encode()
			local var1293, var1294 = protoModule.writeTag(buff, var1291, 1, protoModule.wireTypes.lengthDelimited)
			var1293, var2060 = protoModule.writeBuffer(var1293, var1294, var1292, buffer.len(var1292))
			buff = var1293
			var1291 = var1294
		end
	end
	local buff_1 = buffer.create(var1291)
	buffer.copy(buff_1, 0, buff, 0, var1291)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1295 = t_47.new()
	local var1296 = 0
	while var1296 < buffer.len(p47) do
		local _ = nil
		local var1297 = nil
		local var1298, var1299, var1300 = protoModule.readTag(p47, var1296)
		local var1301 = var1298
		var1297 = var1299
		var1296 = var1300
		
		if var1297 == protoModule.wireTypes.varint then
			local _ = nil
			local var1302, var1303 = protoModule.readVarInt(p47, var1296)
			local _ = var1302
			var1296 = var1303
			continue
		end
		if var1297 == protoModule.wireTypes.lengthDelimited then
			if var1301 == 1 then
				local _ = nil
				local var1304, var1305 = protoModule.readBuffer(p47, var1296)
				var1296 = var1305
				table.insert(var1295.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1304))
			else
				local _ = nil
				local var1306, var1307 = protoModule.readVarInt(p47, var1296)
				var1296 = var1307 + var1306
			end
		elseif var1297 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1308, var1309 = protoModule.readFixed32(p47, var1296)
			local _ = var1308
			var1296 = var1309
		elseif var1297 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1310, var1311 = protoModule.readFixed64(p47, var1296)
			local _ = var1310
			var1296 = var1311
		else
			error("Unsupported wire type: " .. var2064)
		end
	end
	return var1295
end

function t_47:jsonEncode()
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

function t_47:jsonDecode()
	-- upvalues: t_47 (ref), t (ref)
	local var1312 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1312.subscriptions = t_1
	end
	return var1312
end

t_47.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_47
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p48)
	-- upvalues: t_48 (ref)
	return setmetatable({
		subscription_id = if p48 == nil or p48.subscription_id == nil then "" else p48.subscription_id
	}, t_48)
end

function t_48:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1313 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1314, var1315 = protoModule.writeTag(buff, var1313, 1, protoModule.wireTypes.lengthDelimited)
		var1314, var2086 = protoModule.writeString(var1314, var1315, self.subscription_id)
		buff = var1314
		var1313 = var1315
	end
	local buff_1 = buffer.create(var1313)
	buffer.copy(buff_1, 0, buff, 0, var1313)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1313 = t_48.new()
	local var1314 = 0
	while var1314 < buffer.len(p48) do
		local _ = nil
		local var1315 = nil
		local var1316, var1317, var1318 = protoModule.readTag(p48, var1314)
		local var1319 = var1316
		var1315 = var1317
		var1314 = var1318
		
		if var1315 == protoModule.wireTypes.varint then
			local _ = nil
			local var1320, var1321 = protoModule.readVarInt(p48, var1314)
			local _ = var1320
			var1314 = var1321
			continue
		end
		if var1315 == protoModule.wireTypes.lengthDelimited then
			if var1319 == 1 then
				local _ = nil
				local var1322, var1323 = protoModule.readBuffer(p48, var1314)
				var1314 = var1323
				var1313.subscription_id = buffer.tostring(var1322)
			else
				local _ = nil
				local var1324, var1325 = protoModule.readVarInt(p48, var1314)
				var1314 = var1325 + var1324
			end
		elseif var1315 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1326, var1327 = protoModule.readFixed32(p48, var1314)
			local _ = var1326
			var1314 = var1327
		elseif var1315 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1328, var1329 = protoModule.readFixed64(p48, var1314)
			local _ = var1328
			var1314 = var1329
		else
			error("Unsupported wire type: " .. var2090)
		end
	end
	return var1313
end

function t_48:jsonEncode()
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_48:jsonDecode()
	-- upvalues: t_48 (ref)
	local var1330 = t_48.new()
	
	if self.subscription_id ~= nil then
		var1330.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1330.subscription_id = self.subscriptionId
	end
	return var1330
end

t_48.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_48
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p49)
	-- upvalues: t_49 (ref)
	return setmetatable({
		items = if p49 == nil or p49.items == nil then {} else p49.items,
		universe_id = if p49 == nil or p49.universe_id == nil then "" else p49.universe_id,
		section_title = if p49 == nil or p49.section_title == nil then "" else p49.section_title,
		creator_key = if p49 == nil or p49.creator_key == nil then "" else p49.creator_key,
		collection_item_size = if p49 == nil or p49.collection_item_size == nil then "" else p49.collection_item_size,
		item_height_mode = if p49 == nil or p49.item_height_mode == nil then "" else p49.item_height_mode,
		experience_store_product_type = if p49 == nil or p49.experience_store_product_type == nil then "" else p49.experience_store_product_type,
		content_type = if p49 == nil or p49.content_type == nil then "" else p49.content_type,
		item_type = if p49 == nil or p49.item_type == nil then "" else p49.item_type
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1330 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1331 = v:encode()
			local var1332, var1333 = protoModule.writeTag(buff, var1330, 1, protoModule.wireTypes.lengthDelimited)
			var1332, var2111 = protoModule.writeBuffer(var1332, var1333, var1331, buffer.len(var1331))
			buff = var1332
			var1330 = var1333
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1334, var1335 = protoModule.writeTag(buff, var1330, 2, protoModule.wireTypes.lengthDelimited)
		var1334, var2113 = protoModule.writeString(var1334, var1335, self.universe_id)
		buff = var1334
		var1330 = var1335
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1336, var1337 = protoModule.writeTag(buff, var1330, 3, protoModule.wireTypes.lengthDelimited)
		var1336, var2115 = protoModule.writeString(var1336, var1337, self.section_title)
		buff = var1336
		var1330 = var1337
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1338, var1339 = protoModule.writeTag(buff, var1330, 4, protoModule.wireTypes.lengthDelimited)
		var1338, var2117 = protoModule.writeString(var1338, var1339, self.creator_key)
		buff = var1338
		var1330 = var1339
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1340, var1341 = protoModule.writeTag(buff, var1330, 5, protoModule.wireTypes.lengthDelimited)
		var1340, var2119 = protoModule.writeString(var1340, var1341, self.collection_item_size)
		buff = var1340
		var1330 = var1341
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1342, var1343 = protoModule.writeTag(buff, var1330, 6, protoModule.wireTypes.lengthDelimited)
		var1342, var2121 = protoModule.writeString(var1342, var1343, self.item_height_mode)
		buff = var1342
		var1330 = var1343
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1344, var1345 = protoModule.writeTag(buff, var1330, 7, protoModule.wireTypes.lengthDelimited)
		var1344, var2123 = protoModule.writeString(var1344, var1345, self.experience_store_product_type)
		buff = var1344
		var1330 = var1345
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1346, var1347 = protoModule.writeTag(buff, var1330, 8, protoModule.wireTypes.lengthDelimited)
		var1346, var2125 = protoModule.writeString(var1346, var1347, self.content_type)
		buff = var1346
		var1330 = var1347
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1348, var1349 = protoModule.writeTag(buff, var1330, 9, protoModule.wireTypes.lengthDelimited)
		var1348, var2127 = protoModule.writeString(var1348, var1349, self.item_type)
		buff = var1348
		var1330 = var1349
	end
	local buff_1 = buffer.create(var1330)
	buffer.copy(buff_1, 0, buff, 0, var1330)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1350 = t_49.new()
	local var1351 = 0
	while var1351 < buffer.len(p49) do
		local _ = nil
		local var1352 = nil
		local var1353, var1354, var1355 = protoModule.readTag(p49, var1351)
		local var1356 = var1353
		var1352 = var1354
		var1351 = var1355
		
		if var1352 == protoModule.wireTypes.varint then
			local _ = nil
			local var1357, var1358 = protoModule.readVarInt(p49, var1351)
			local _ = var1357
			var1351 = var1358
			continue
		end
		if var1352 == protoModule.wireTypes.lengthDelimited then
			if var1356 == 1 then
				local _ = nil
				local var1359, var1360 = protoModule.readBuffer(p49, var1351)
				var1351 = var1360
				table.insert(var1350.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1359))
			elseif var1356 == 2 then
				local _ = nil
				local var1361, var1362 = protoModule.readBuffer(p49, var1351)
				var1351 = var1362
				var1350.universe_id = buffer.tostring(var1361)
			elseif var1356 == 3 then
				local _ = nil
				local var1363, var1364 = protoModule.readBuffer(p49, var1351)
				var1351 = var1364
				var1350.section_title = buffer.tostring(var1363)
			elseif var1356 == 4 then
				local _ = nil
				local var1365, var1366 = protoModule.readBuffer(p49, var1351)
				var1351 = var1366
				var1350.creator_key = buffer.tostring(var1365)
			elseif var1356 == 5 then
				local _ = nil
				local var1367, var1368 = protoModule.readBuffer(p49, var1351)
				var1351 = var1368
				var1350.collection_item_size = buffer.tostring(var1367)
			elseif var1356 == 6 then
				local _ = nil
				local var1369, var1370 = protoModule.readBuffer(p49, var1351)
				var1351 = var1370
				var1350.item_height_mode = buffer.tostring(var1369)
			elseif var1356 == 7 then
				local _ = nil
				local var1371, var1372 = protoModule.readBuffer(p49, var1351)
				var1351 = var1372
				var1350.experience_store_product_type = buffer.tostring(var1371)
			elseif var1356 == 8 then
				local _ = nil
				local var1373, var1374 = protoModule.readBuffer(p49, var1351)
				var1351 = var1374
				var1350.content_type = buffer.tostring(var1373)
			elseif var1356 == 9 then
				local _ = nil
				local var1375, var1376 = protoModule.readBuffer(p49, var1351)
				var1351 = var1376
				var1350.item_type = buffer.tostring(var1375)
			else
				local _ = nil
				local var1377, var1378 = protoModule.readVarInt(p49, var1351)
				var1351 = var1378 + var1377
			end
		elseif var1352 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1379, var1380 = protoModule.readFixed32(p49, var1351)
			local _ = var1379
			var1351 = var1380
		elseif var1352 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1381, var1382 = protoModule.readFixed64(p49, var1351)
			local _ = var1381
			var1351 = var1382
		else
			error("Unsupported wire type: " .. var2131)
		end
	end
	return var1350
end

function t_49:jsonEncode()
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
	return t
end

function t_49:jsonDecode()
	-- upvalues: t_49 (ref), t (ref)
	local var1383 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1383.items = t_1
	end
	if self.universe_id ~= nil then
		var1383.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1383.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1383.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1383.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1383.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1383.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1383.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1383.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1383.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1383.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1383.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1383.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1383.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1383.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1383.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1383.item_type = self.itemType
	end
	return var1383
end

t_49.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_49
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p50)
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		item_id = if p50 == nil or p50.item_id == nil then "" else p50.item_id,
		identifier = if p50 == nil or p50.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p50.identifier
	}, t_50)
end

function t_50:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1384 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1385, var1386 = protoModule.writeTag(buff, var1384, 1, protoModule.wireTypes.lengthDelimited)
		var1385, var2169 = protoModule.writeString(var1385, var1386, self.item_id)
		buff = var1385
		var1384 = var1386
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1387, var1388 = protoModule.writeTag(buff, var1384, 2, protoModule.wireTypes.varint)
		var1387, var2171 = protoModule.writeVarInt(var1387, var1388, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1387
		var1384 = var1388
	end
	local buff_1 = buffer.create(var1384)
	buffer.copy(buff_1, 0, buff, 0, var1384)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1384 = t_50.new()
	local var1385 = 0
	while var1385 < buffer.len(p50) do
		local _ = nil
		local var1386 = nil
		local var1387, var1388, var1389 = protoModule.readTag(p50, var1385)
		local var1390 = var1387
		var1386 = var1388
		var1385 = var1389
		
		if var1386 == protoModule.wireTypes.varint then
			if var1390 == 2 then
				local _ = nil
				local var1391, var1392 = protoModule.readVarIntI32(p50, var1385)
				local var1393 = var1391
				var1385 = var1392
				var1384.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1393) or var1393
			else
				local _ = nil
				local var1394, var1395 = protoModule.readVarInt(p50, var1385)
				local _ = var1394
				var1385 = var1395
			end
		end
		if var1386 == protoModule.wireTypes.lengthDelimited then
			if var1390 == 1 then
				local _ = nil
				local var1396, var1397 = protoModule.readBuffer(p50, var1385)
				var1385 = var1397
				var1384.item_id = buffer.tostring(var1396)
			else
				local _ = nil
				local var1398, var1399 = protoModule.readVarInt(p50, var1385)
				var1385 = var1399 + var1398
			end
		elseif var1386 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1400, var1401 = protoModule.readFixed32(p50, var1385)
			local _ = var1400
			var1385 = var1401
		elseif var1386 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1402, var1403 = protoModule.readFixed64(p50, var1385)
			local _ = var1402
			var1385 = var1403
		else
			error("Unsupported wire type: " .. var2175)
		end
	end
	return var1384
end

function t_50:jsonEncode()
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

function t_50:jsonDecode()
	-- upvalues: t_50 (ref), t (ref)
	local var1404 = t_50.new()
	
	if self.item_id ~= nil then
		var1404.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1404.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1404.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1404
end

t_50.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_50
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p51)
		return if p51 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p51 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p51 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p51 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p51)
		return if p51 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p51 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p51 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p51 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p51
	end,
	fromName = function(p51)
		return if p51 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p51 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p51 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p51 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_51 = {}
t_51.__index = t_51

function t_51.new(p51)
	-- upvalues: t_51 (ref)
	return setmetatable({
		roblox_component = if p51 == nil or p51.roblox_component == nil then "" else p51.roblox_component,
		identifier = if p51 == nil or p51.identifier == nil then "" else p51.identifier,
		title = if p51 == nil or p51.title == nil then "" else p51.title,
		user_id = if p51 == nil or p51.user_id == nil then "" else p51.user_id,
		description = if p51 == nil or p51.description == nil then "" else p51.description,
		cta_text = if p51 == nil or p51.cta_text == nil then "" else p51.cta_text,
		prompt_id = if p51 == nil or p51.prompt_id == nil then "" else p51.prompt_id,
		prompt_type = if p51 == nil or p51.prompt_type == nil then "" else p51.prompt_type,
		entity_id = if p51 == nil or p51.entity_id == nil then "" else p51.entity_id
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1404 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1405, var1406 = protoModule.writeTag(buff, var1404, 1, protoModule.wireTypes.lengthDelimited)
		var1405, var2198 = protoModule.writeString(var1405, var1406, self.roblox_component)
		buff = var1405
		var1404 = var1406
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1407, var1408 = protoModule.writeTag(buff, var1404, 2, protoModule.wireTypes.lengthDelimited)
		var1407, var2200 = protoModule.writeString(var1407, var1408, self.identifier)
		buff = var1407
		var1404 = var1408
	end
	if self.title ~= nil and self.title ~= "" then
		local var1409, var1410 = protoModule.writeTag(buff, var1404, 3, protoModule.wireTypes.lengthDelimited)
		var1409, var2202 = protoModule.writeString(var1409, var1410, self.title)
		buff = var1409
		var1404 = var1410
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1411, var1412 = protoModule.writeTag(buff, var1404, 4, protoModule.wireTypes.lengthDelimited)
		var1411, var2204 = protoModule.writeString(var1411, var1412, self.user_id)
		buff = var1411
		var1404 = var1412
	end
	if self.description ~= nil and self.description ~= "" then
		local var1413, var1414 = protoModule.writeTag(buff, var1404, 5, protoModule.wireTypes.lengthDelimited)
		var1413, var2206 = protoModule.writeString(var1413, var1414, self.description)
		buff = var1413
		var1404 = var1414
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1415, var1416 = protoModule.writeTag(buff, var1404, 6, protoModule.wireTypes.lengthDelimited)
		var1415, var2208 = protoModule.writeString(var1415, var1416, self.cta_text)
		buff = var1415
		var1404 = var1416
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1417, var1418 = protoModule.writeTag(buff, var1404, 7, protoModule.wireTypes.lengthDelimited)
		var1417, var2210 = protoModule.writeString(var1417, var1418, self.prompt_id)
		buff = var1417
		var1404 = var1418
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1419, var1420 = protoModule.writeTag(buff, var1404, 8, protoModule.wireTypes.lengthDelimited)
		var1419, var2212 = protoModule.writeString(var1419, var1420, self.prompt_type)
		buff = var1419
		var1404 = var1420
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1421, var1422 = protoModule.writeTag(buff, var1404, 9, protoModule.wireTypes.lengthDelimited)
		var1421, var2214 = protoModule.writeString(var1421, var1422, self.entity_id)
		buff = var1421
		var1404 = var1422
	end
	local buff_1 = buffer.create(var1404)
	buffer.copy(buff_1, 0, buff, 0, var1404)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref)
	local var1404 = t_51.new()
	local var1405 = 0
	while var1405 < buffer.len(p51) do
		local _ = nil
		local var1406 = nil
		local var1407, var1408, var1409 = protoModule.readTag(p51, var1405)
		local var1410 = var1407
		var1406 = var1408
		var1405 = var1409
		
		if var1406 == protoModule.wireTypes.varint then
			local _ = nil
			local var1411, var1412 = protoModule.readVarInt(p51, var1405)
			local _ = var1411
			var1405 = var1412
			continue
		end
		if var1406 == protoModule.wireTypes.lengthDelimited then
			if var1410 == 1 then
				local _ = nil
				local var1413, var1414 = protoModule.readBuffer(p51, var1405)
				var1405 = var1414
				var1404.roblox_component = buffer.tostring(var1413)
			elseif var1410 == 2 then
				local _ = nil
				local var1415, var1416 = protoModule.readBuffer(p51, var1405)
				var1405 = var1416
				var1404.identifier = buffer.tostring(var1415)
			elseif var1410 == 3 then
				local _ = nil
				local var1417, var1418 = protoModule.readBuffer(p51, var1405)
				var1405 = var1418
				var1404.title = buffer.tostring(var1417)
			elseif var1410 == 4 then
				local _ = nil
				local var1419, var1420 = protoModule.readBuffer(p51, var1405)
				var1405 = var1420
				var1404.user_id = buffer.tostring(var1419)
			elseif var1410 == 5 then
				local _ = nil
				local var1421, var1422 = protoModule.readBuffer(p51, var1405)
				var1405 = var1422
				var1404.description = buffer.tostring(var1421)
			elseif var1410 == 6 then
				local _ = nil
				local var1423, var1424 = protoModule.readBuffer(p51, var1405)
				var1405 = var1424
				var1404.cta_text = buffer.tostring(var1423)
			elseif var1410 == 7 then
				local _ = nil
				local var1425, var1426 = protoModule.readBuffer(p51, var1405)
				var1405 = var1426
				var1404.prompt_id = buffer.tostring(var1425)
			elseif var1410 == 8 then
				local _ = nil
				local var1427, var1428 = protoModule.readBuffer(p51, var1405)
				var1405 = var1428
				var1404.prompt_type = buffer.tostring(var1427)
			elseif var1410 == 9 then
				local _ = nil
				local var1429, var1430 = protoModule.readBuffer(p51, var1405)
				var1405 = var1430
				var1404.entity_id = buffer.tostring(var1429)
			else
				local _ = nil
				local var1431, var1432 = protoModule.readVarInt(p51, var1405)
				var1405 = var1432 + var1431
			end
		elseif var1406 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1433, var1434 = protoModule.readFixed32(p51, var1405)
			local _ = var1433
			var1405 = var1434
		elseif var1406 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1435, var1436 = protoModule.readFixed64(p51, var1405)
			local _ = var1435
			var1405 = var1436
		else
			error("Unsupported wire type: " .. var2218)
		end
	end
	return var1404
end

function t_51:jsonEncode()
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

function t_51:jsonDecode()
	-- upvalues: t_51 (ref)
	local var1437 = t_51.new()
	
	if self.roblox_component ~= nil then
		var1437.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1437.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1437.identifier = self.identifier
	end
	if self.title ~= nil then
		var1437.title = self.title
	end
	if self.user_id ~= nil then
		var1437.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1437.user_id = self.userId
	end
	if self.description ~= nil then
		var1437.description = self.description
	end
	if self.cta_text ~= nil then
		var1437.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1437.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1437.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1437.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1437.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1437.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1437.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1437.entity_id = self.entityId
	end
	return var1437
end

t_51.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_51
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p52)
	-- upvalues: t_52 (ref)
	return setmetatable({
		group_id = if p52 == nil or p52.group_id == nil then "" else p52.group_id,
		experience_id = if p52 == nil or p52.experience_id == nil then "" else p52.experience_id
	}, t_52)
end

function t_52:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1437 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1438, var1439 = protoModule.writeTag(buff, var1437, 1, protoModule.wireTypes.lengthDelimited)
		var1438, var2254 = protoModule.writeString(var1438, var1439, self.group_id)
		buff = var1438
		var1437 = var1439
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1440, var1441 = protoModule.writeTag(buff, var1437, 2, protoModule.wireTypes.lengthDelimited)
		var1440, var2256 = protoModule.writeString(var1440, var1441, self.experience_id)
		buff = var1440
		var1437 = var1441
	end
	local buff_1 = buffer.create(var1437)
	buffer.copy(buff_1, 0, buff, 0, var1437)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref)
	local var1437 = t_52.new()
	local var1438 = 0
	while var1438 < buffer.len(p52) do
		local _ = nil
		local var1439 = nil
		local var1440, var1441, var1442 = protoModule.readTag(p52, var1438)
		local var1443 = var1440
		var1439 = var1441
		var1438 = var1442
		
		if var1439 == protoModule.wireTypes.varint then
			local _ = nil
			local var1444, var1445 = protoModule.readVarInt(p52, var1438)
			local _ = var1444
			var1438 = var1445
			continue
		end
		if var1439 == protoModule.wireTypes.lengthDelimited then
			if var1443 == 1 then
				local _ = nil
				local var1446, var1447 = protoModule.readBuffer(p52, var1438)
				var1438 = var1447
				var1437.group_id = buffer.tostring(var1446)
			elseif var1443 == 2 then
				local _ = nil
				local var1448, var1449 = protoModule.readBuffer(p52, var1438)
				var1438 = var1449
				var1437.experience_id = buffer.tostring(var1448)
			else
				local _ = nil
				local var1450, var1451 = protoModule.readVarInt(p52, var1438)
				var1438 = var1451 + var1450
			end
		elseif var1439 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1452, var1453 = protoModule.readFixed32(p52, var1438)
			local _ = var1452
			var1438 = var1453
		elseif var1439 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1454, var1455 = protoModule.readFixed64(p52, var1438)
			local _ = var1454
			var1438 = var1455
		else
			error("Unsupported wire type: " .. var2260)
		end
	end
	return var1437
end

function t_52:jsonEncode()
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_52:jsonDecode()
	-- upvalues: t_52 (ref)
	local var1456 = t_52.new()
	
	if self.group_id ~= nil then
		var1456.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1456.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1456.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1456.experience_id = self.experienceId
	end
	return var1456
end

t_52.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_52
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p53)
	-- upvalues: t_53 (ref)
	return setmetatable({
		title = if p53 == nil or p53.title == nil then "" else p53.title,
		dismiss_text = if p53 == nil or p53.dismiss_text == nil then "" else p53.dismiss_text,
		user_id = if p53 == nil or p53.user_id == nil then "" else p53.user_id,
		cards = if p53 == nil or p53.cards == nil then {} else p53.cards,
		prompt_id = if p53 == nil or p53.prompt_id == nil then "" else p53.prompt_id,
		prompt_type = if p53 == nil or p53.prompt_type == nil then "" else p53.prompt_type,
		sort_id = if p53 == nil or p53.sort_id == nil then "" else p53.sort_id,
		feed_item_key = if p53 == nil or p53.feed_item_key == nil then "" else p53.feed_item_key,
		client_attributes = if p53 == nil or p53.client_attributes == nil then nil else p53.client_attributes
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1456 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1457, var1458 = protoModule.writeTag(buff, var1456, 1, protoModule.wireTypes.lengthDelimited)
		var1457, var2282 = protoModule.writeString(var1457, var1458, self.title)
		buff = var1457
		var1456 = var1458
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1459, var1460 = protoModule.writeTag(buff, var1456, 2, protoModule.wireTypes.lengthDelimited)
		var1459, var2284 = protoModule.writeString(var1459, var1460, self.dismiss_text)
		buff = var1459
		var1456 = var1460
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1461, var1462 = protoModule.writeTag(buff, var1456, 3, protoModule.wireTypes.lengthDelimited)
		var1461, var2286 = protoModule.writeString(var1461, var1462, self.user_id)
		buff = var1461
		var1456 = var1462
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1463 = v:encode()
			local var1464, var1465 = protoModule.writeTag(buff, var1456, 4, protoModule.wireTypes.lengthDelimited)
			var1464, var2289 = protoModule.writeBuffer(var1464, var1465, var1463, buffer.len(var1463))
			buff = var1464
			var1456 = var1465
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1466, var1467 = protoModule.writeTag(buff, var1456, 5, protoModule.wireTypes.lengthDelimited)
		var1466, var2291 = protoModule.writeString(var1466, var1467, self.prompt_id)
		buff = var1466
		var1456 = var1467
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1468, var1469 = protoModule.writeTag(buff, var1456, 6, protoModule.wireTypes.lengthDelimited)
		var1468, var2293 = protoModule.writeString(var1468, var1469, self.prompt_type)
		buff = var1468
		var1456 = var1469
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1470, var1471 = protoModule.writeTag(buff, var1456, 7, protoModule.wireTypes.lengthDelimited)
		var1470, var2295 = protoModule.writeString(var1470, var1471, self.sort_id)
		buff = var1470
		var1456 = var1471
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1472, var1473 = protoModule.writeTag(buff, var1456, 8, protoModule.wireTypes.lengthDelimited)
		var1472, var2297 = protoModule.writeString(var1472, var1473, self.feed_item_key)
		buff = var1472
		var1456 = var1473
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1474 = self.client_attributes.value:encode()
		local var1475, var1476 = protoModule.writeTag(buff, var1456, 9, protoModule.wireTypes.lengthDelimited)
		var1475, var2300 = protoModule.writeBuffer(var1475, var1476, var1474, buffer.len(var1474))
		buff = var1475
		var1456 = var1476
	end
	local buff_1 = buffer.create(var1456)
	buffer.copy(buff_1, 0, buff, 0, var1456)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1477 = t_53.new()
	local var1478 = 0
	while var1478 < buffer.len(p53) do
		local _ = nil
		local var1479 = nil
		local var1480, var1481, var1482 = protoModule.readTag(p53, var1478)
		local var1483 = var1480
		var1479 = var1481
		var1478 = var1482
		
		if var1479 == protoModule.wireTypes.varint then
			local _ = nil
			local var1484, var1485 = protoModule.readVarInt(p53, var1478)
			local _ = var1484
			var1478 = var1485
			continue
		end
		if var1479 == protoModule.wireTypes.lengthDelimited then
			if var1483 == 1 then
				local _ = nil
				local var1486, var1487 = protoModule.readBuffer(p53, var1478)
				var1478 = var1487
				var1477.title = buffer.tostring(var1486)
			elseif var1483 == 2 then
				local _ = nil
				local var1488, var1489 = protoModule.readBuffer(p53, var1478)
				var1478 = var1489
				var1477.dismiss_text = buffer.tostring(var1488)
			elseif var1483 == 3 then
				local _ = nil
				local var1490, var1491 = protoModule.readBuffer(p53, var1478)
				var1478 = var1491
				var1477.user_id = buffer.tostring(var1490)
			elseif var1483 == 4 then
				local _ = nil
				local var1492, var1493 = protoModule.readBuffer(p53, var1478)
				var1478 = var1493
				table.insert(var1477.cards, t.CardContainerCardInputData.decode(var1492))
			elseif var1483 == 5 then
				local _ = nil
				local var1494, var1495 = protoModule.readBuffer(p53, var1478)
				var1478 = var1495
				var1477.prompt_id = buffer.tostring(var1494)
			elseif var1483 == 6 then
				local _ = nil
				local var1496, var1497 = protoModule.readBuffer(p53, var1478)
				var1478 = var1497
				var1477.prompt_type = buffer.tostring(var1496)
			elseif var1483 == 7 then
				local _ = nil
				local var1498, var1499 = protoModule.readBuffer(p53, var1478)
				var1478 = var1499
				var1477.sort_id = buffer.tostring(var1498)
			elseif var1483 == 8 then
				local _ = nil
				local var1500, var1501 = protoModule.readBuffer(p53, var1478)
				var1478 = var1501
				var1477.feed_item_key = buffer.tostring(var1500)
			elseif var1483 == 9 then
				local _ = nil
				local var1502, var1503 = protoModule.readBuffer(p53, var1478)
				var1478 = var1503
				var1477.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1502)
				}
			else
				local _ = nil
				local var1504, var1505 = protoModule.readVarInt(p53, var1478)
				var1478 = var1505 + var1504
			end
		elseif var1479 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1506, var1507 = protoModule.readFixed32(p53, var1478)
			local _ = var1506
			var1478 = var1507
		elseif var1479 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1508, var1509 = protoModule.readFixed64(p53, var1478)
			local _ = var1508
			var1478 = var1509
		else
			error("Unsupported wire type: " .. var2304)
		end
	end
	return var1477
end

function t_53:jsonEncode()
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

function t_53:jsonDecode()
	-- upvalues: t_53 (ref), t (ref)
	local var1510 = t_53.new()
	
	if self.title ~= nil then
		var1510.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1510.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1510.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1510.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1510.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1510.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1510.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1510.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1510.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1510.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1510.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1510.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1510.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1510.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1510.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1510.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1510
end

t_53.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_53
typeRegistryModule.default:register(t.CardContainerInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p54)
	-- upvalues: t_54 (ref)
	return setmetatable({
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
	local var1511 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1512, var1513 = protoModule.writeTag(buff, var1511, 1, protoModule.wireTypes.lengthDelimited)
		var1512, var2342 = protoModule.writeString(var1512, var1513, self.title)
		buff = var1512
		var1511 = var1513
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1514, var1515 = protoModule.writeTag(buff, var1511, 2, protoModule.wireTypes.lengthDelimited)
		var1514, var2344 = protoModule.writeString(var1514, var1515, self.user_id)
		buff = var1514
		var1511 = var1515
	end
	if self.description ~= nil and self.description ~= "" then
		local var1516, var1517 = protoModule.writeTag(buff, var1511, 3, protoModule.wireTypes.lengthDelimited)
		var1516, var2346 = protoModule.writeString(var1516, var1517, self.description)
		buff = var1516
		var1511 = var1517
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1518, var1519 = protoModule.writeTag(buff, var1511, 4, protoModule.wireTypes.lengthDelimited)
		var1518, var2348 = protoModule.writeString(var1518, var1519, self.cta_text)
		buff = var1518
		var1511 = var1519
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1520, var1521 = protoModule.writeTag(buff, var1511, 5, protoModule.wireTypes.lengthDelimited)
		var1520, var2350 = protoModule.writeString(var1520, var1521, self.prompt_id)
		buff = var1520
		var1511 = var1521
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1522, var1523 = protoModule.writeTag(buff, var1511, 6, protoModule.wireTypes.lengthDelimited)
		var1522, var2352 = protoModule.writeString(var1522, var1523, self.prompt_type)
		buff = var1522
		var1511 = var1523
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1524, var1525 = protoModule.writeTag(buff, var1511, 7, protoModule.wireTypes.lengthDelimited)
		var1524, var2354 = protoModule.writeString(var1524, var1525, self.entity_id)
		buff = var1524
		var1511 = var1525
	end
	local buff_1 = buffer.create(var1511)
	buffer.copy(buff_1, 0, buff, 0, var1511)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1511 = t_54.new()
	local var1512 = 0
	while var1512 < buffer.len(p54) do
		local _ = nil
		local var1513 = nil
		local var1514, var1515, var1516 = protoModule.readTag(p54, var1512)
		local var1517 = var1514
		var1513 = var1515
		var1512 = var1516
		
		if var1513 == protoModule.wireTypes.varint then
			local _ = nil
			local var1518, var1519 = protoModule.readVarInt(p54, var1512)
			local _ = var1518
			var1512 = var1519
			continue
		end
		if var1513 == protoModule.wireTypes.lengthDelimited then
			if var1517 == 1 then
				local _ = nil
				local var1520, var1521 = protoModule.readBuffer(p54, var1512)
				var1512 = var1521
				var1511.title = buffer.tostring(var1520)
			elseif var1517 == 2 then
				local _ = nil
				local var1522, var1523 = protoModule.readBuffer(p54, var1512)
				var1512 = var1523
				var1511.user_id = buffer.tostring(var1522)
			elseif var1517 == 3 then
				local _ = nil
				local var1524, var1525 = protoModule.readBuffer(p54, var1512)
				var1512 = var1525
				var1511.description = buffer.tostring(var1524)
			elseif var1517 == 4 then
				local _ = nil
				local var1526, var1527 = protoModule.readBuffer(p54, var1512)
				var1512 = var1527
				var1511.cta_text = buffer.tostring(var1526)
			elseif var1517 == 5 then
				local _ = nil
				local var1528, var1529 = protoModule.readBuffer(p54, var1512)
				var1512 = var1529
				var1511.prompt_id = buffer.tostring(var1528)
			elseif var1517 == 6 then
				local _ = nil
				local var1530, var1531 = protoModule.readBuffer(p54, var1512)
				var1512 = var1531
				var1511.prompt_type = buffer.tostring(var1530)
			elseif var1517 == 7 then
				local _ = nil
				local var1532, var1533 = protoModule.readBuffer(p54, var1512)
				var1512 = var1533
				var1511.entity_id = buffer.tostring(var1532)
			else
				local _ = nil
				local var1534, var1535 = protoModule.readVarInt(p54, var1512)
				var1512 = var1535 + var1534
			end
		elseif var1513 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1536, var1537 = protoModule.readFixed32(p54, var1512)
			local _ = var1536
			var1512 = var1537
		elseif var1513 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1538, var1539 = protoModule.readFixed64(p54, var1512)
			local _ = var1538
			var1512 = var1539
		else
			error("Unsupported wire type: " .. var2358)
		end
	end
	return var1511
end

function t_54:jsonEncode()
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

function t_54:jsonDecode()
	-- upvalues: t_54 (ref)
	local var1540 = t_54.new()
	
	if self.title ~= nil then
		var1540.title = self.title
	end
	if self.user_id ~= nil then
		var1540.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1540.user_id = self.userId
	end
	if self.description ~= nil then
		var1540.description = self.description
	end
	if self.cta_text ~= nil then
		var1540.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1540.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1540.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1540.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1540.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1540.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1540.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1540.entity_id = self.entityId
	end
	return var1540
end

t_54.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_54
typeRegistryModule.default:register(t.CardInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p55)
	-- upvalues: t_55 (ref)
	return setmetatable({
		prompt_id = if p55 == nil or p55.prompt_id == nil then "" else p55.prompt_id,
		prompt_type = if p55 == nil or p55.prompt_type == nil then "" else p55.prompt_type,
		user_id = if p55 == nil or p55.user_id == nil then "" else p55.user_id,
		audit_data = if p55 == nil or p55.audit_data == nil then "" else p55.audit_data
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1540 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1541, var1542 = protoModule.writeTag(buff, var1540, 1, protoModule.wireTypes.lengthDelimited)
		var1541, var2390 = protoModule.writeString(var1541, var1542, self.prompt_id)
		buff = var1541
		var1540 = var1542
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1543, var1544 = protoModule.writeTag(buff, var1540, 2, protoModule.wireTypes.lengthDelimited)
		var1543, var2392 = protoModule.writeString(var1543, var1544, self.prompt_type)
		buff = var1543
		var1540 = var1544
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1545, var1546 = protoModule.writeTag(buff, var1540, 3, protoModule.wireTypes.lengthDelimited)
		var1545, var2394 = protoModule.writeString(var1545, var1546, self.user_id)
		buff = var1545
		var1540 = var1546
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1547, var1548 = protoModule.writeTag(buff, var1540, 4, protoModule.wireTypes.lengthDelimited)
		var1547, var2396 = protoModule.writeString(var1547, var1548, self.audit_data)
		buff = var1547
		var1540 = var1548
	end
	local buff_1 = buffer.create(var1540)
	buffer.copy(buff_1, 0, buff, 0, var1540)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1540 = t_55.new()
	local var1541 = 0
	while var1541 < buffer.len(p55) do
		local _ = nil
		local var1542 = nil
		local var1543, var1544, var1545 = protoModule.readTag(p55, var1541)
		local var1546 = var1543
		var1542 = var1544
		var1541 = var1545
		
		if var1542 == protoModule.wireTypes.varint then
			local _ = nil
			local var1547, var1548 = protoModule.readVarInt(p55, var1541)
			local _ = var1547
			var1541 = var1548
			continue
		end
		if var1542 == protoModule.wireTypes.lengthDelimited then
			if var1546 == 1 then
				local _ = nil
				local var1549, var1550 = protoModule.readBuffer(p55, var1541)
				var1541 = var1550
				var1540.prompt_id = buffer.tostring(var1549)
			elseif var1546 == 2 then
				local _ = nil
				local var1551, var1552 = protoModule.readBuffer(p55, var1541)
				var1541 = var1552
				var1540.prompt_type = buffer.tostring(var1551)
			elseif var1546 == 3 then
				local _ = nil
				local var1553, var1554 = protoModule.readBuffer(p55, var1541)
				var1541 = var1554
				var1540.user_id = buffer.tostring(var1553)
			elseif var1546 == 4 then
				local _ = nil
				local var1555, var1556 = protoModule.readBuffer(p55, var1541)
				var1541 = var1556
				var1540.audit_data = buffer.tostring(var1555)
			else
				local _ = nil
				local var1557, var1558 = protoModule.readVarInt(p55, var1541)
				var1541 = var1558 + var1557
			end
		elseif var1542 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1559, var1560 = protoModule.readFixed32(p55, var1541)
			local _ = var1559
			var1541 = var1560
		elseif var1542 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1561, var1562 = protoModule.readFixed64(p55, var1541)
			local _ = var1561
			var1541 = var1562
		else
			error("Unsupported wire type: " .. var2400)
		end
	end
	return var1540
end

function t_55:jsonEncode()
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

function t_55:jsonDecode()
	-- upvalues: t_55 (ref)
	local var1563 = t_55.new()
	
	if self.prompt_id ~= nil then
		var1563.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1563.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1563.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1563.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1563.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1563.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1563.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1563.audit_data = self.auditData
	end
	return var1563
end

t_55.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_55
typeRegistryModule.default:register(t.DialogInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p56)
	-- upvalues: t_56 (ref)
	return setmetatable({
		sender_count = if p56 == nil or p56.sender_count == nil then 0 else p56.sender_count,
		total_robux_amount = if p56 == nil or p56.total_robux_amount == nil then 0 else p56.total_robux_amount
	}, t_56)
end

function t_56:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1563 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1564, var1565 = protoModule.writeTag(buff, var1563, 1, protoModule.wireTypes.varint)
		var1564, var2426 = protoModule.writeVarInt(var1564, var1565, self.sender_count)
		buff = var1564
		var1563 = var1565
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1566, var1567 = protoModule.writeTag(buff, var1563, 2, protoModule.wireTypes.varint)
		var1566, var2428 = protoModule.writeVarInt(var1566, var1567, self.total_robux_amount)
		buff = var1566
		var1563 = var1567
	end
	local buff_1 = buffer.create(var1563)
	buffer.copy(buff_1, 0, buff, 0, var1563)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1563 = t_56.new()
	local var1564 = 0
	while var1564 < buffer.len(p56) do
		local _ = nil
		local _ = nil
		local var1565, var1566, var1567 = protoModule.readTag(p56, var1564)
		local var1568 = var1565
		local var1569 = var1566
		var1564 = var1567
		
		if var1569 == protoModule.wireTypes.varint then
			if var1568 == 1 then
				local _ = nil
				local var1570, var1571 = protoModule.readVarIntI32(p56, var1564)
				var1564 = var1571
				var1563.sender_count = var1570
			elseif var1568 == 2 then
				local _ = nil
				local var1572, var1573 = protoModule.readVarIntI64(p56, var1564)
				var1564 = var1573
				var1563.total_robux_amount = var1572
			else
				local _ = nil
				local var1574, var1575 = protoModule.readVarInt(p56, var1564)
				local _ = var1574
				var1564 = var1575
			end
		elseif var1569 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1576, var1577 = protoModule.readVarInt(p56, var1564)
			var1564 = var1577 + var1576
		elseif var1569 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1578, var1579 = protoModule.readFixed32(p56, var1564)
			local _ = var1578
			var1564 = var1579
		elseif var1569 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1580, var1581 = protoModule.readFixed64(p56, var1564)
			local _ = var1580
			var1564 = var1581
		else
			error("Unsupported wire type: " .. var2436)
		end
	end
	return var1563
end

function t_56:jsonEncode()
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_56:jsonDecode()
	-- upvalues: t_56 (ref)
	local var1582 = t_56.new()
	
	if self.sender_count ~= nil then
		var1582.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1582.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1582.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1582.total_robux_amount = self.totalRobuxAmount
	end
	return var1582
end

t_56.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_56
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p57)
	-- upvalues: t_57 (ref)
	return setmetatable({
		title = if p57 == nil or p57.title == nil then "" else p57.title,
		description = if p57 == nil or p57.description == nil then "" else p57.description,
		primary_text = if p57 == nil or p57.primary_text == nil then "" else p57.primary_text,
		secondary_text = if p57 == nil or p57.secondary_text == nil then "" else p57.secondary_text,
		prompt_id = if p57 == nil or p57.prompt_id == nil then "" else p57.prompt_id,
		prompt_type = if p57 == nil or p57.prompt_type == nil then "" else p57.prompt_type,
		times_seen = if p57 == nil or p57.times_seen == nil then 0 else p57.times_seen,
		content = if p57 == nil or p57.content == nil then nil else p57.content
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1582 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1583, var1584 = protoModule.writeTag(buff, var1582, 1, protoModule.wireTypes.lengthDelimited)
		var1583, var2454 = protoModule.writeString(var1583, var1584, self.title)
		buff = var1583
		var1582 = var1584
	end
	if self.description ~= nil and self.description ~= "" then
		local var1585, var1586 = protoModule.writeTag(buff, var1582, 2, protoModule.wireTypes.lengthDelimited)
		var1585, var2456 = protoModule.writeString(var1585, var1586, self.description)
		buff = var1585
		var1582 = var1586
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1587, var1588 = protoModule.writeTag(buff, var1582, 3, protoModule.wireTypes.lengthDelimited)
		var1587, var2458 = protoModule.writeString(var1587, var1588, self.primary_text)
		buff = var1587
		var1582 = var1588
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1589, var1590 = protoModule.writeTag(buff, var1582, 4, protoModule.wireTypes.lengthDelimited)
		var1589, var2460 = protoModule.writeString(var1589, var1590, self.secondary_text)
		buff = var1589
		var1582 = var1590
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1591, var1592 = protoModule.writeTag(buff, var1582, 5, protoModule.wireTypes.lengthDelimited)
		var1591, var2462 = protoModule.writeString(var1591, var1592, self.prompt_id)
		buff = var1591
		var1582 = var1592
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1593, var1594 = protoModule.writeTag(buff, var1582, 6, protoModule.wireTypes.lengthDelimited)
		var1593, var2464 = protoModule.writeString(var1593, var1594, self.prompt_type)
		buff = var1593
		var1582 = var1594
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1595, var1596 = protoModule.writeTag(buff, var1582, 7, protoModule.wireTypes.varint)
		var1595, var2466 = protoModule.writeVarInt(var1595, var1596, self.times_seen)
		buff = var1595
		var1582 = var1596
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1597 = self.content.value:encode()
		local var1598, var1599 = protoModule.writeTag(buff, var1582, 8, protoModule.wireTypes.lengthDelimited)
		var1598, var2469 = protoModule.writeBuffer(var1598, var1599, var1597, buffer.len(var1597))
		buff = var1598
		var1582 = var1599
	end
	local buff_1 = buffer.create(var1582)
	buffer.copy(buff_1, 0, buff, 0, var1582)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1582 = t_57.new()
	local var1583 = 0
	while var1583 < buffer.len(p57) do
		local _ = nil
		local var1584 = nil
		local var1585, var1586, var1587 = protoModule.readTag(p57, var1583)
		local var1588 = var1585
		var1584 = var1586
		var1583 = var1587
		
		if var1584 == protoModule.wireTypes.varint then
			if var1588 == 7 then
				local _ = nil
				local var1589, var1590 = protoModule.readVarIntI32(p57, var1583)
				var1583 = var1590
				var1582.times_seen = var1589
			else
				local _ = nil
				local var1591, var1592 = protoModule.readVarInt(p57, var1583)
				local _ = var1591
				var1583 = var1592
			end
		end
		if var1584 == protoModule.wireTypes.lengthDelimited then
			if var1588 == 1 then
				local _ = nil
				local var1593, var1594 = protoModule.readBuffer(p57, var1583)
				var1583 = var1594
				var1582.title = buffer.tostring(var1593)
			elseif var1588 == 2 then
				local _ = nil
				local var1595, var1596 = protoModule.readBuffer(p57, var1583)
				var1583 = var1596
				var1582.description = buffer.tostring(var1595)
			elseif var1588 == 3 then
				local _ = nil
				local var1597, var1598 = protoModule.readBuffer(p57, var1583)
				var1583 = var1598
				var1582.primary_text = buffer.tostring(var1597)
			elseif var1588 == 4 then
				local _ = nil
				local var1599, var1600 = protoModule.readBuffer(p57, var1583)
				var1583 = var1600
				var1582.secondary_text = buffer.tostring(var1599)
			elseif var1588 == 5 then
				local _ = nil
				local var1601, var1602 = protoModule.readBuffer(p57, var1583)
				var1583 = var1602
				var1582.prompt_id = buffer.tostring(var1601)
			elseif var1588 == 6 then
				local _ = nil
				local var1603, var1604 = protoModule.readBuffer(p57, var1583)
				var1583 = var1604
				var1582.prompt_type = buffer.tostring(var1603)
			elseif var1588 == 8 then
				local _ = nil
				local var1605, var1606 = protoModule.readBuffer(p57, var1583)
				var1583 = var1606
				var1582.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1605)
				}
			else
				local _ = nil
				local var1607, var1608 = protoModule.readVarInt(p57, var1583)
				var1583 = var1608 + var1607
			end
		elseif var1584 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1609, var1610 = protoModule.readFixed32(p57, var1583)
			local _ = var1609
			var1583 = var1610
		elseif var1584 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1611, var1612 = protoModule.readFixed64(p57, var1583)
			local _ = var1611
			var1583 = var1612
		else
			error("Unsupported wire type: " .. var2473)
		end
	end
	return var1582
end

function t_57:jsonEncode()
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
	return t
end

function t_57:jsonDecode()
	-- upvalues: t_57 (ref), t (ref)
	local var1613 = t_57.new()
	
	if self.title ~= nil then
		var1613.title = self.title
	end
	if self.description ~= nil then
		var1613.description = self.description
	end
	if self.primary_text ~= nil then
		var1613.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1613.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1613.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1613.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1613.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1613.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1613.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1613.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1613.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1613.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1613.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1613.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var1613
end

t_57.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_57
typeRegistryModule.default:register(t.BannerInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p58)
	-- upvalues: t_58 (ref)
	return setmetatable({
		tooltip_text = if p58 == nil or p58.tooltip_text == nil then "" else p58.tooltip_text,
		prompt_id = if p58 == nil or p58.prompt_id == nil then "" else p58.prompt_id,
		prompt_type = if p58 == nil or p58.prompt_type == nil then "" else p58.prompt_type
	}, t_58)
end

function t_58:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1613 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1614, var1615 = protoModule.writeTag(buff, var1613, 1, protoModule.wireTypes.lengthDelimited)
		var1614, var2507 = protoModule.writeString(var1614, var1615, self.tooltip_text)
		buff = var1614
		var1613 = var1615
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1616, var1617 = protoModule.writeTag(buff, var1613, 2, protoModule.wireTypes.lengthDelimited)
		var1616, var2509 = protoModule.writeString(var1616, var1617, self.prompt_id)
		buff = var1616
		var1613 = var1617
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1618, var1619 = protoModule.writeTag(buff, var1613, 3, protoModule.wireTypes.lengthDelimited)
		var1618, var2511 = protoModule.writeString(var1618, var1619, self.prompt_type)
		buff = var1618
		var1613 = var1619
	end
	local buff_1 = buffer.create(var1613)
	buffer.copy(buff_1, 0, buff, 0, var1613)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1613 = t_58.new()
	local var1614 = 0
	while var1614 < buffer.len(p58) do
		local _ = nil
		local var1615 = nil
		local var1616, var1617, var1618 = protoModule.readTag(p58, var1614)
		local var1619 = var1616
		var1615 = var1617
		var1614 = var1618
		
		if var1615 == protoModule.wireTypes.varint then
			local _ = nil
			local var1620, var1621 = protoModule.readVarInt(p58, var1614)
			local _ = var1620
			var1614 = var1621
			continue
		end
		if var1615 == protoModule.wireTypes.lengthDelimited then
			if var1619 == 1 then
				local _ = nil
				local var1622, var1623 = protoModule.readBuffer(p58, var1614)
				var1614 = var1623
				var1613.tooltip_text = buffer.tostring(var1622)
			elseif var1619 == 2 then
				local _ = nil
				local var1624, var1625 = protoModule.readBuffer(p58, var1614)
				var1614 = var1625
				var1613.prompt_id = buffer.tostring(var1624)
			elseif var1619 == 3 then
				local _ = nil
				local var1626, var1627 = protoModule.readBuffer(p58, var1614)
				var1614 = var1627
				var1613.prompt_type = buffer.tostring(var1626)
			else
				local _ = nil
				local var1628, var1629 = protoModule.readVarInt(p58, var1614)
				var1614 = var1629 + var1628
			end
		elseif var1615 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1630, var1631 = protoModule.readFixed32(p58, var1614)
			local _ = var1630
			var1614 = var1631
		elseif var1615 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1632, var1633 = protoModule.readFixed64(p58, var1614)
			local _ = var1632
			var1614 = var1633
		else
			error("Unsupported wire type: " .. var2515)
		end
	end
	return var1613
end

function t_58:jsonEncode()
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

function t_58:jsonDecode()
	-- upvalues: t_58 (ref)
	local var1634 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var1634.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1634.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1634.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1634.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1634.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1634.prompt_type = self.promptType
	end
	return var1634
end

t_58.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_58
typeRegistryModule.default:register(t.TooltipInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p59)
	-- upvalues: t_59 (ref)
	return setmetatable({
		media_id = if p59 == nil or p59.media_id == nil then "" else p59.media_id,
		title = if p59 == nil or p59.title == nil then "" else p59.title,
		description = if p59 == nil or p59.description == nil then "" else p59.description,
		prompt_id = if p59 == nil or p59.prompt_id == nil then "" else p59.prompt_id,
		prompt_type = if p59 == nil or p59.prompt_type == nil then "" else p59.prompt_type,
		anchor_tag = if p59 == nil or p59.anchor_tag == nil then "" else p59.anchor_tag
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1634 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1635, var1636 = protoModule.writeTag(buff, var1634, 1, protoModule.wireTypes.lengthDelimited)
		var1635, var2539 = protoModule.writeString(var1635, var1636, self.media_id)
		buff = var1635
		var1634 = var1636
	end
	if self.title ~= nil and self.title ~= "" then
		local var1637, var1638 = protoModule.writeTag(buff, var1634, 2, protoModule.wireTypes.lengthDelimited)
		var1637, var2541 = protoModule.writeString(var1637, var1638, self.title)
		buff = var1637
		var1634 = var1638
	end
	if self.description ~= nil and self.description ~= "" then
		local var1639, var1640 = protoModule.writeTag(buff, var1634, 3, protoModule.wireTypes.lengthDelimited)
		var1639, var2543 = protoModule.writeString(var1639, var1640, self.description)
		buff = var1639
		var1634 = var1640
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1641, var1642 = protoModule.writeTag(buff, var1634, 4, protoModule.wireTypes.lengthDelimited)
		var1641, var2545 = protoModule.writeString(var1641, var1642, self.prompt_id)
		buff = var1641
		var1634 = var1642
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1643, var1644 = protoModule.writeTag(buff, var1634, 5, protoModule.wireTypes.lengthDelimited)
		var1643, var2547 = protoModule.writeString(var1643, var1644, self.prompt_type)
		buff = var1643
		var1634 = var1644
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1645, var1646 = protoModule.writeTag(buff, var1634, 6, protoModule.wireTypes.lengthDelimited)
		var1645, var2549 = protoModule.writeString(var1645, var1646, self.anchor_tag)
		buff = var1645
		var1634 = var1646
	end
	local buff_1 = buffer.create(var1634)
	buffer.copy(buff_1, 0, buff, 0, var1634)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1634 = t_59.new()
	local var1635 = 0
	while var1635 < buffer.len(p59) do
		local _ = nil
		local var1636 = nil
		local var1637, var1638, var1639 = protoModule.readTag(p59, var1635)
		local var1640 = var1637
		var1636 = var1638
		var1635 = var1639
		
		if var1636 == protoModule.wireTypes.varint then
			local _ = nil
			local var1641, var1642 = protoModule.readVarInt(p59, var1635)
			local _ = var1641
			var1635 = var1642
			continue
		end
		if var1636 == protoModule.wireTypes.lengthDelimited then
			if var1640 == 1 then
				local _ = nil
				local var1643, var1644 = protoModule.readBuffer(p59, var1635)
				var1635 = var1644
				var1634.media_id = buffer.tostring(var1643)
			elseif var1640 == 2 then
				local _ = nil
				local var1645, var1646 = protoModule.readBuffer(p59, var1635)
				var1635 = var1646
				var1634.title = buffer.tostring(var1645)
			elseif var1640 == 3 then
				local _ = nil
				local var1647, var1648 = protoModule.readBuffer(p59, var1635)
				var1635 = var1648
				var1634.description = buffer.tostring(var1647)
			elseif var1640 == 4 then
				local _ = nil
				local var1649, var1650 = protoModule.readBuffer(p59, var1635)
				var1635 = var1650
				var1634.prompt_id = buffer.tostring(var1649)
			elseif var1640 == 5 then
				local _ = nil
				local var1651, var1652 = protoModule.readBuffer(p59, var1635)
				var1635 = var1652
				var1634.prompt_type = buffer.tostring(var1651)
			elseif var1640 == 6 then
				local _ = nil
				local var1653, var1654 = protoModule.readBuffer(p59, var1635)
				var1635 = var1654
				var1634.anchor_tag = buffer.tostring(var1653)
			else
				local _ = nil
				local var1655, var1656 = protoModule.readVarInt(p59, var1635)
				var1635 = var1656 + var1655
			end
		elseif var1636 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1657, var1658 = protoModule.readFixed32(p59, var1635)
			local _ = var1657
			var1635 = var1658
		elseif var1636 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1659, var1660 = protoModule.readFixed64(p59, var1635)
			local _ = var1659
			var1635 = var1660
		else
			error("Unsupported wire type: " .. var2553)
		end
	end
	return var1634
end

function t_59:jsonEncode()
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

function t_59:jsonDecode()
	-- upvalues: t_59 (ref)
	local var1661 = t_59.new()
	
	if self.media_id ~= nil then
		var1661.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1661.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1661.title = self.title
	end
	if self.description ~= nil then
		var1661.description = self.description
	end
	if self.prompt_id ~= nil then
		var1661.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1661.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1661.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1661.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1661.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1661.anchor_tag = self.anchorTag
	end
	return var1661
end

t_59.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_59
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p60)
	-- upvalues: t_60 (ref)
	return setmetatable({
		prompt_id = if p60 == nil or p60.prompt_id == nil then "" else p60.prompt_id,
		prompt_type = if p60 == nil or p60.prompt_type == nil then "" else p60.prompt_type
	}, t_60)
end

function t_60:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1661 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1662, var1663 = protoModule.writeTag(buff, var1661, 1, protoModule.wireTypes.lengthDelimited)
		var1662, var2583 = protoModule.writeString(var1662, var1663, self.prompt_id)
		buff = var1662
		var1661 = var1663
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1664, var1665 = protoModule.writeTag(buff, var1661, 2, protoModule.wireTypes.lengthDelimited)
		var1664, var2585 = protoModule.writeString(var1664, var1665, self.prompt_type)
		buff = var1664
		var1661 = var1665
	end
	local buff_1 = buffer.create(var1661)
	buffer.copy(buff_1, 0, buff, 0, var1661)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1661 = t_60.new()
	local var1662 = 0
	while var1662 < buffer.len(p60) do
		local _ = nil
		local var1663 = nil
		local var1664, var1665, var1666 = protoModule.readTag(p60, var1662)
		local var1667 = var1664
		var1663 = var1665
		var1662 = var1666
		
		if var1663 == protoModule.wireTypes.varint then
			local _ = nil
			local var1668, var1669 = protoModule.readVarInt(p60, var1662)
			local _ = var1668
			var1662 = var1669
			continue
		end
		if var1663 == protoModule.wireTypes.lengthDelimited then
			if var1667 == 1 then
				local _ = nil
				local var1670, var1671 = protoModule.readBuffer(p60, var1662)
				var1662 = var1671
				var1661.prompt_id = buffer.tostring(var1670)
			elseif var1667 == 2 then
				local _ = nil
				local var1672, var1673 = protoModule.readBuffer(p60, var1662)
				var1662 = var1673
				var1661.prompt_type = buffer.tostring(var1672)
			else
				local _ = nil
				local var1674, var1675 = protoModule.readVarInt(p60, var1662)
				var1662 = var1675 + var1674
			end
		elseif var1663 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1676, var1677 = protoModule.readFixed32(p60, var1662)
			local _ = var1676
			var1662 = var1677
		elseif var1663 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1678, var1679 = protoModule.readFixed64(p60, var1662)
			local _ = var1678
			var1662 = var1679
		else
			error("Unsupported wire type: " .. var2589)
		end
	end
	return var1661
end

function t_60:jsonEncode()
	local t = {}
	
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
	local var1680 = t_60.new()
	
	if self.prompt_id ~= nil then
		var1680.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1680.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1680.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1680.prompt_type = self.promptType
	end
	return var1680
end

t_60.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_60
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p61)
	-- upvalues: t_61 (ref)
	return setmetatable({
		upsell_prompt = if p61 == nil or p61.upsell_prompt == nil then "" else p61.upsell_prompt
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1680 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1681, var1682 = protoModule.writeTag(buff, var1680, 1, protoModule.wireTypes.lengthDelimited)
		var1681, var2611 = protoModule.writeString(var1681, var1682, self.upsell_prompt)
		buff = var1681
		var1680 = var1682
	end
	local buff_1 = buffer.create(var1680)
	buffer.copy(buff_1, 0, buff, 0, var1680)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1680 = t_61.new()
	local var1681 = 0
	while var1681 < buffer.len(p61) do
		local _ = nil
		local var1682 = nil
		local var1683, var1684, var1685 = protoModule.readTag(p61, var1681)
		local var1686 = var1683
		var1682 = var1684
		var1681 = var1685
		
		if var1682 == protoModule.wireTypes.varint then
			local _ = nil
			local var1687, var1688 = protoModule.readVarInt(p61, var1681)
			local _ = var1687
			var1681 = var1688
			continue
		end
		if var1682 == protoModule.wireTypes.lengthDelimited then
			if var1686 == 1 then
				local _ = nil
				local var1689, var1690 = protoModule.readBuffer(p61, var1681)
				var1681 = var1690
				var1680.upsell_prompt = buffer.tostring(var1689)
			else
				local _ = nil
				local var1691, var1692 = protoModule.readVarInt(p61, var1681)
				var1681 = var1692 + var1691
			end
		elseif var1682 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1693, var1694 = protoModule.readFixed32(p61, var1681)
			local _ = var1693
			var1681 = var1694
		elseif var1682 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1695, var1696 = protoModule.readFixed64(p61, var1681)
			local _ = var1695
			var1681 = var1696
		else
			error("Unsupported wire type: " .. var2615)
		end
	end
	return var1680
end

function t_61:jsonEncode()
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_61:jsonDecode()
	-- upvalues: t_61 (ref)
	local var1697 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var1697.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1697.upsell_prompt = self.upsellPrompt
	end
	return var1697
end

t_61.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_61
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p62)
	-- upvalues: t_62 (ref)
	return setmetatable({
		modal_variant = if p62 == nil or p62.modal_variant == nil then "" else p62.modal_variant,
		modal_sequence = if p62 == nil or p62.modal_sequence == nil then "" else p62.modal_sequence,
		conversation_id = if p62 == nil or p62.conversation_id == nil then "" else p62.conversation_id,
		friend_id = if p62 == nil or p62.friend_id == nil then "" else p62.friend_id
	}, t_62)
end

function t_62:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1697 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1698, var1699 = protoModule.writeTag(buff, var1697, 1, protoModule.wireTypes.lengthDelimited)
		var1698, var2635 = protoModule.writeString(var1698, var1699, self.modal_variant)
		buff = var1698
		var1697 = var1699
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1700, var1701 = protoModule.writeTag(buff, var1697, 2, protoModule.wireTypes.lengthDelimited)
		var1700, var2637 = protoModule.writeString(var1700, var1701, self.modal_sequence)
		buff = var1700
		var1697 = var1701
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1702, var1703 = protoModule.writeTag(buff, var1697, 3, protoModule.wireTypes.lengthDelimited)
		var1702, var2639 = protoModule.writeString(var1702, var1703, self.conversation_id)
		buff = var1702
		var1697 = var1703
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1704, var1705 = protoModule.writeTag(buff, var1697, 4, protoModule.wireTypes.lengthDelimited)
		var1704, var2641 = protoModule.writeString(var1704, var1705, self.friend_id)
		buff = var1704
		var1697 = var1705
	end
	local buff_1 = buffer.create(var1697)
	buffer.copy(buff_1, 0, buff, 0, var1697)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1697 = t_62.new()
	local var1698 = 0
	while var1698 < buffer.len(p62) do
		local _ = nil
		local var1699 = nil
		local var1700, var1701, var1702 = protoModule.readTag(p62, var1698)
		local var1703 = var1700
		var1699 = var1701
		var1698 = var1702
		
		if var1699 == protoModule.wireTypes.varint then
			local _ = nil
			local var1704, var1705 = protoModule.readVarInt(p62, var1698)
			local _ = var1704
			var1698 = var1705
			continue
		end
		if var1699 == protoModule.wireTypes.lengthDelimited then
			if var1703 == 1 then
				local _ = nil
				local var1706, var1707 = protoModule.readBuffer(p62, var1698)
				var1698 = var1707
				var1697.modal_variant = buffer.tostring(var1706)
			elseif var1703 == 2 then
				local _ = nil
				local var1708, var1709 = protoModule.readBuffer(p62, var1698)
				var1698 = var1709
				var1697.modal_sequence = buffer.tostring(var1708)
			elseif var1703 == 3 then
				local _ = nil
				local var1710, var1711 = protoModule.readBuffer(p62, var1698)
				var1698 = var1711
				var1697.conversation_id = buffer.tostring(var1710)
			elseif var1703 == 4 then
				local _ = nil
				local var1712, var1713 = protoModule.readBuffer(p62, var1698)
				var1698 = var1713
				var1697.friend_id = buffer.tostring(var1712)
			else
				local _ = nil
				local var1714, var1715 = protoModule.readVarInt(p62, var1698)
				var1698 = var1715 + var1714
			end
		elseif var1699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1716, var1717 = protoModule.readFixed32(p62, var1698)
			local _ = var1716
			var1698 = var1717
		elseif var1699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1718, var1719 = protoModule.readFixed64(p62, var1698)
			local _ = var1718
			var1698 = var1719
		else
			error("Unsupported wire type: " .. var2645)
		end
	end
	return var1697
end

function t_62:jsonEncode()
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

function t_62:jsonDecode()
	-- upvalues: t_62 (ref)
	local var1720 = t_62.new()
	
	if self.modal_variant ~= nil then
		var1720.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1720.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1720.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1720.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1720.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1720.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1720.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1720.friend_id = self.friendId
	end
	return var1720
end

t_62.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_62
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p63)
	-- upvalues: t_63 (ref)
	return setmetatable({
		event_id = if p63 == nil or p63.event_id == nil then "" else p63.event_id,
		universe_id = if p63 == nil or p63.universe_id == nil then "" else p63.universe_id,
		entry_map = if p63 == nil or p63.entry_map == nil then {} else p63.entry_map,
		entry_order = if p63 == nil or p63.entry_order == nil then {} else p63.entry_order
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1720 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1721, var1722 = protoModule.writeTag(buff, var1720, 1, protoModule.wireTypes.lengthDelimited)
		var1721, var2671 = protoModule.writeString(var1721, var1722, self.event_id)
		buff = var1721
		var1720 = var1722
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1723, var1724 = protoModule.writeTag(buff, var1720, 2, protoModule.wireTypes.lengthDelimited)
		var1723, var2673 = protoModule.writeString(var1723, var1724, self.universe_id)
		buff = var1723
		var1720 = var1724
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1725, var1726 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1725, var2675 = protoModule.writeString(var1725, var1726, i)
			local var1727 = v:encode()
			var1726, var2677 = protoModule.writeTag(var1725, var1726, 2, protoModule.wireTypes.lengthDelimited)
			var1726, var2677 = protoModule.writeBuffer(var1726, var2677, var1727, buffer.len(var1727))
			local var1728 = var1726
			local var1729 = var2677
			local var1730, var1731 = protoModule.writeTag(buff, var1720, 3, protoModule.wireTypes.lengthDelimited)
			var1730, var2681 = protoModule.writeBuffer(var1730, var1731, var1728, var1729)
			buff = var1730
			var1720 = var1731
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1732, var1733 = protoModule.writeTag(buff, var1720, 4, protoModule.wireTypes.lengthDelimited)
			var1732, var2683 = protoModule.writeString(var1732, var1733, v)
			buff = var1732
			var1720 = var1733
		end
	end
	local buff_1 = buffer.create(var1720)
	buffer.copy(buff_1, 0, buff, 0, var1720)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var1734 = t_63.new()
	local var1735 = 0
	while var1735 < buffer.len(p63) do
		local _ = nil
		local var1736 = nil
		local var1737, var1738, var1739 = protoModule.readTag(p63, var1735)
		local var1740 = var1737
		var1736 = var1738
		var1735 = var1739
		
		if var1736 == protoModule.wireTypes.varint then
			local _ = nil
			local var1741, var1742 = protoModule.readVarInt(p63, var1735)
			local _ = var1741
			var1735 = var1742
			continue
		end
		if var1736 == protoModule.wireTypes.lengthDelimited then
			if var1740 == 1 then
				local _ = nil
				local var1743, var1744 = protoModule.readBuffer(p63, var1735)
				var1735 = var1744
				var1734.event_id = buffer.tostring(var1743)
			elseif var1740 == 2 then
				local _ = nil
				local var1745, var1746 = protoModule.readBuffer(p63, var1735)
				var1735 = var1746
				var1734.universe_id = buffer.tostring(var1745)
			elseif var1740 == 3 then
				local _ = nil
				local var1747, var1748 = protoModule.readBuffer(p63, var1735)
				var1735 = var1748
				var1747 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1747)
				var1734.entry_map[var1747.key or ""] = var1747.value or t.FeedEntry.new()
			elseif var1740 == 4 then
				local _ = nil
				local var1749, var1750 = protoModule.readBuffer(p63, var1735)
				var1735 = var1750
				table.insert(var1734.entry_order, buffer.tostring(var1749))
			else
				local _ = nil
				local var1751, var1752 = protoModule.readVarInt(p63, var1735)
				var1735 = var1752 + var1751
			end
		elseif var1736 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1753, var1754 = protoModule.readFixed32(p63, var1735)
			local _ = var1753
			var1735 = var1754
		elseif var1736 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1755, var1756 = protoModule.readFixed64(p63, var1735)
			local _ = var1755
			var1735 = var1756
		else
			error("Unsupported wire type: " .. var2687)
		end
	end
	return var1734
end

function t_63:jsonEncode()
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

function t_63:jsonDecode()
	-- upvalues: t_63 (ref), t (ref)
	local var1757 = t_63.new()
	
	if self.event_id ~= nil then
		var1757.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1757.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1757.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1757.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1757.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1757.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1757.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1757.entry_order = t_1
	end
	return var1757
end

t_63.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_63
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p64)
	-- upvalues: t_64 (ref)
	return setmetatable({
		key = if p64 == nil or p64.key == nil then "" else p64.key,
		value = if p64 == nil or p64.value == nil then nil else p64.value
	}, t_64)
end

function t_64:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1758 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1759, var1760 = protoModule.writeTag(buff, var1758, 1, protoModule.wireTypes.lengthDelimited)
		var1759, var2719 = protoModule.writeString(var1759, var1760, self.key)
		buff = var1759
		var1758 = var1760
	end
	if self.value ~= nil then
		local var1761 = self.value:encode()
		local var1762, var1763 = protoModule.writeTag(buff, var1758, 2, protoModule.wireTypes.lengthDelimited)
		var1762, var2722 = protoModule.writeBuffer(var1762, var1763, var1761, buffer.len(var1761))
		buff = var1762
		var1758 = var1763
	end
	local buff_1 = buffer.create(var1758)
	buffer.copy(buff_1, 0, buff, 0, var1758)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1758 = t_64.new()
	local var1759 = 0
	while var1759 < buffer.len(p64) do
		local _ = nil
		local var1760 = nil
		local var1761, var1762, var1763 = protoModule.readTag(p64, var1759)
		local var1764 = var1761
		var1760 = var1762
		var1759 = var1763
		
		if var1760 == protoModule.wireTypes.varint then
			local _ = nil
			local var1765, var1766 = protoModule.readVarInt(p64, var1759)
			local _ = var1765
			var1759 = var1766
			continue
		end
		if var1760 == protoModule.wireTypes.lengthDelimited then
			if var1764 == 1 then
				local _ = nil
				local var1767, var1768 = protoModule.readBuffer(p64, var1759)
				var1759 = var1768
				var1758.key = buffer.tostring(var1767)
			elseif var1764 == 2 then
				local _ = nil
				local var1769, var1770 = protoModule.readBuffer(p64, var1759)
				var1759 = var1770
				var1758.value = t.FeedEntry.decode(var1769)
			else
				local _ = nil
				local var1771, var1772 = protoModule.readVarInt(p64, var1759)
				var1759 = var1772 + var1771
			end
		elseif var1760 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1773, var1774 = protoModule.readFixed32(p64, var1759)
			local _ = var1773
			var1759 = var1774
		elseif var1760 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1775, var1776 = protoModule.readFixed64(p64, var1759)
			local _ = var1775
			var1759 = var1776
		else
			error("Unsupported wire type: " .. var2726)
		end
	end
	return var1758
end

function t_64:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_64:jsonDecode()
	-- upvalues: t_64 (ref), t (ref)
	local var1777 = t_64.new()
	
	if self.key ~= nil then
		var1777.key = self.key
	end
	if self.value ~= nil then
		var1777.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1777
end

t_64.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_64
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p65)
	-- upvalues: t_65 (ref)
	return setmetatable({
		event_id = if p65 == nil or p65.event_id == nil then "" else p65.event_id,
		universe_id = if p65 == nil or p65.universe_id == nil then "" else p65.universe_id
	}, t_65)
end

function t_65:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1777 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1778, var1779 = protoModule.writeTag(buff, var1777, 1, protoModule.wireTypes.lengthDelimited)
		var1778, var2748 = protoModule.writeString(var1778, var1779, self.event_id)
		buff = var1778
		var1777 = var1779
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1780, var1781 = protoModule.writeTag(buff, var1777, 2, protoModule.wireTypes.lengthDelimited)
		var1780, var2750 = protoModule.writeString(var1780, var1781, self.universe_id)
		buff = var1780
		var1777 = var1781
	end
	local buff_1 = buffer.create(var1777)
	buffer.copy(buff_1, 0, buff, 0, var1777)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1777 = t_65.new()
	local var1778 = 0
	while var1778 < buffer.len(p65) do
		local _ = nil
		local var1779 = nil
		local var1780, var1781, var1782 = protoModule.readTag(p65, var1778)
		local var1783 = var1780
		var1779 = var1781
		var1778 = var1782
		
		if var1779 == protoModule.wireTypes.varint then
			local _ = nil
			local var1784, var1785 = protoModule.readVarInt(p65, var1778)
			local _ = var1784
			var1778 = var1785
			continue
		end
		if var1779 == protoModule.wireTypes.lengthDelimited then
			if var1783 == 1 then
				local _ = nil
				local var1786, var1787 = protoModule.readBuffer(p65, var1778)
				var1778 = var1787
				var1777.event_id = buffer.tostring(var1786)
			elseif var1783 == 2 then
				local _ = nil
				local var1788, var1789 = protoModule.readBuffer(p65, var1778)
				var1778 = var1789
				var1777.universe_id = buffer.tostring(var1788)
			else
				local _ = nil
				local var1790, var1791 = protoModule.readVarInt(p65, var1778)
				var1778 = var1791 + var1790
			end
		elseif var1779 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1792, var1793 = protoModule.readFixed32(p65, var1778)
			local _ = var1792
			var1778 = var1793
		elseif var1779 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1794, var1795 = protoModule.readFixed64(p65, var1778)
			local _ = var1794
			var1778 = var1795
		else
			error("Unsupported wire type: " .. var2754)
		end
	end
	return var1777
end

function t_65:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_65:jsonDecode()
	-- upvalues: t_65 (ref)
	local var1796 = t_65.new()
	
	if self.event_id ~= nil then
		var1796.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1796.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1796.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1796.universe_id = self.universeId
	end
	return var1796
end

t_65.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_65
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p66)
	-- upvalues: t_66 (ref)
	return setmetatable({
		event_id = if p66 == nil or p66.event_id == nil then "" else p66.event_id
	}, t_66)
end

function t_66:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1796 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1797, var1798 = protoModule.writeTag(buff, var1796, 1, protoModule.wireTypes.lengthDelimited)
		var1797, var2776 = protoModule.writeString(var1797, var1798, self.event_id)
		buff = var1797
		var1796 = var1798
	end
	local buff_1 = buffer.create(var1796)
	buffer.copy(buff_1, 0, buff, 0, var1796)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref)
	local var1796 = t_66.new()
	local var1797 = 0
	while var1797 < buffer.len(p66) do
		local _ = nil
		local var1798 = nil
		local var1799, var1800, var1801 = protoModule.readTag(p66, var1797)
		local var1802 = var1799
		var1798 = var1800
		var1797 = var1801
		
		if var1798 == protoModule.wireTypes.varint then
			local _ = nil
			local var1803, var1804 = protoModule.readVarInt(p66, var1797)
			local _ = var1803
			var1797 = var1804
			continue
		end
		if var1798 == protoModule.wireTypes.lengthDelimited then
			if var1802 == 1 then
				local _ = nil
				local var1805, var1806 = protoModule.readBuffer(p66, var1797)
				var1797 = var1806
				var1796.event_id = buffer.tostring(var1805)
			else
				local _ = nil
				local var1807, var1808 = protoModule.readVarInt(p66, var1797)
				var1797 = var1808 + var1807
			end
		elseif var1798 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1809, var1810 = protoModule.readFixed32(p66, var1797)
			local _ = var1809
			var1797 = var1810
		elseif var1798 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1811, var1812 = protoModule.readFixed64(p66, var1797)
			local _ = var1811
			var1797 = var1812
		else
			error("Unsupported wire type: " .. var2780)
		end
	end
	return var1796
end

function t_66:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_66:jsonDecode()
	-- upvalues: t_66 (ref)
	local var1813 = t_66.new()
	
	if self.event_id ~= nil then
		var1813.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1813.event_id = self.eventId
	end
	return var1813
end

t_66.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_66
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p67)
	-- upvalues: t_67 (ref)
	return setmetatable({
		event_id = if p67 == nil or p67.event_id == nil then "" else p67.event_id,
		universe_id = if p67 == nil or p67.universe_id == nil then "" else p67.universe_id,
		rsvp_users = if p67 == nil or p67.rsvp_users == nil then {} else p67.rsvp_users
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1813 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1814, var1815 = protoModule.writeTag(buff, var1813, 1, protoModule.wireTypes.lengthDelimited)
		var1814, var2800 = protoModule.writeString(var1814, var1815, self.event_id)
		buff = var1814
		var1813 = var1815
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1816, var1817 = protoModule.writeTag(buff, var1813, 2, protoModule.wireTypes.lengthDelimited)
		var1816, var2802 = protoModule.writeString(var1816, var1817, self.universe_id)
		buff = var1816
		var1813 = var1817
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var1818 = v:encode()
			local var1819, var1820 = protoModule.writeTag(buff, var1813, 3, protoModule.wireTypes.lengthDelimited)
			var1819, var2805 = protoModule.writeBuffer(var1819, var1820, var1818, buffer.len(var1818))
			buff = var1819
			var1813 = var1820
		end
	end
	local buff_1 = buffer.create(var1813)
	buffer.copy(buff_1, 0, buff, 0, var1813)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1821 = t_67.new()
	local var1822 = 0
	while var1822 < buffer.len(p67) do
		local _ = nil
		local var1823 = nil
		local var1824, var1825, var1826 = protoModule.readTag(p67, var1822)
		local var1827 = var1824
		var1823 = var1825
		var1822 = var1826
		
		if var1823 == protoModule.wireTypes.varint then
			local _ = nil
			local var1828, var1829 = protoModule.readVarInt(p67, var1822)
			local _ = var1828
			var1822 = var1829
			continue
		end
		if var1823 == protoModule.wireTypes.lengthDelimited then
			if var1827 == 1 then
				local _ = nil
				local var1830, var1831 = protoModule.readBuffer(p67, var1822)
				var1822 = var1831
				var1821.event_id = buffer.tostring(var1830)
			elseif var1827 == 2 then
				local _ = nil
				local var1832, var1833 = protoModule.readBuffer(p67, var1822)
				var1822 = var1833
				var1821.universe_id = buffer.tostring(var1832)
			elseif var1827 == 3 then
				local _ = nil
				local var1834, var1835 = protoModule.readBuffer(p67, var1822)
				var1822 = var1835
				table.insert(var1821.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var1834))
			else
				local _ = nil
				local var1836, var1837 = protoModule.readVarInt(p67, var1822)
				var1822 = var1837 + var1836
			end
		elseif var1823 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1838, var1839 = protoModule.readFixed32(p67, var1822)
			local _ = var1838
			var1822 = var1839
		elseif var1823 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1840, var1841 = protoModule.readFixed64(p67, var1822)
			local _ = var1840
			var1822 = var1841
		else
			error("Unsupported wire type: " .. var2809)
		end
	end
	return var1821
end

function t_67:jsonEncode()
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

function t_67:jsonDecode()
	-- upvalues: t_67 (ref), t (ref)
	local var1842 = t_67.new()
	
	if self.event_id ~= nil then
		var1842.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1842.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1842.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1842.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1842.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1842.rsvp_users = t_1
	end
	return var1842
end

t_67.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_67
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p68)
	-- upvalues: t_68 (ref)
	return setmetatable({
		user_id = if p68 == nil or p68.user_id == nil then 0 else p68.user_id
	}, t_68)
end

function t_68:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1843 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var1844, var1845 = protoModule.writeTag(buff, var1843, 1, protoModule.wireTypes.varint)
		var1844, var2836 = protoModule.writeVarInt(var1844, var1845, self.user_id)
		buff = var1844
		var1843 = var1845
	end
	local buff_1 = buffer.create(var1843)
	buffer.copy(buff_1, 0, buff, 0, var1843)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1843 = t_68.new()
	local var1844 = 0
	while var1844 < buffer.len(p68) do
		local _ = nil
		local _ = nil
		local var1845, var1846, var1847 = protoModule.readTag(p68, var1844)
		local var1848 = var1845
		local var1849 = var1846
		var1844 = var1847
		
		if var1849 == protoModule.wireTypes.varint then
			if var1848 == 1 then
				local _ = nil
				local var1850, var1851 = protoModule.readVarIntI64(p68, var1844)
				var1844 = var1851
				var1843.user_id = var1850
			else
				local _ = nil
				local var1852, var1853 = protoModule.readVarInt(p68, var1844)
				local _ = var1852
				var1844 = var1853
			end
		elseif var1849 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1854, var1855 = protoModule.readVarInt(p68, var1844)
			var1844 = var1855 + var1854
		elseif var1849 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1856, var1857 = protoModule.readFixed32(p68, var1844)
			local _ = var1856
			var1844 = var1857
		elseif var1849 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1858, var1859 = protoModule.readFixed64(p68, var1844)
			local _ = var1858
			var1844 = var1859
		else
			error("Unsupported wire type: " .. var2844)
		end
	end
	return var1843
end

function t_68:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_68:jsonDecode()
	-- upvalues: t_68 (ref)
	local var1860 = t_68.new()
	
	if self.user_id ~= nil then
		var1860.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1860.user_id = self.userId
	end
	return var1860
end

t_68.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = t_68
typeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
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
	local var1860 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1861, var1862 = protoModule.writeTag(buff, var1860, 1, protoModule.wireTypes.lengthDelimited)
		var1861, var2860 = protoModule.writeString(var1861, var1862, self.event_id)
		buff = var1861
		var1860 = var1862
	end
	local buff_1 = buffer.create(var1860)
	buffer.copy(buff_1, 0, buff, 0, var1860)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1860 = t_69.new()
	local var1861 = 0
	while var1861 < buffer.len(p69) do
		local _ = nil
		local var1862 = nil
		local var1863, var1864, var1865 = protoModule.readTag(p69, var1861)
		local var1866 = var1863
		var1862 = var1864
		var1861 = var1865
		
		if var1862 == protoModule.wireTypes.varint then
			local _ = nil
			local var1867, var1868 = protoModule.readVarInt(p69, var1861)
			local _ = var1867
			var1861 = var1868
			continue
		end
		if var1862 == protoModule.wireTypes.lengthDelimited then
			if var1866 == 1 then
				local _ = nil
				local var1869, var1870 = protoModule.readBuffer(p69, var1861)
				var1861 = var1870
				var1860.event_id = buffer.tostring(var1869)
			else
				local _ = nil
				local var1871, var1872 = protoModule.readVarInt(p69, var1861)
				var1861 = var1872 + var1871
			end
		elseif var1862 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1873, var1874 = protoModule.readFixed32(p69, var1861)
			local _ = var1873
			var1861 = var1874
		elseif var1862 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1875, var1876 = protoModule.readFixed64(p69, var1861)
			local _ = var1875
			var1861 = var1876
		else
			error("Unsupported wire type: " .. var2864)
		end
	end
	return var1860
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
	local var1877 = t_69.new()
	
	if self.event_id ~= nil then
		var1877.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1877.event_id = self.eventId
	end
	return var1877
end

t_69.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_69
typeRegistryModule.default:register(t.EventInfoTableInputData)
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
	local var1877 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1878, var1879 = protoModule.writeTag(buff, var1877, 1, protoModule.wireTypes.lengthDelimited)
		var1878, var2884 = protoModule.writeString(var1878, var1879, self.event_id)
		buff = var1878
		var1877 = var1879
	end
	local buff_1 = buffer.create(var1877)
	buffer.copy(buff_1, 0, buff, 0, var1877)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var1877 = t_70.new()
	local var1878 = 0
	while var1878 < buffer.len(p70) do
		local _ = nil
		local var1879 = nil
		local var1880, var1881, var1882 = protoModule.readTag(p70, var1878)
		local var1883 = var1880
		var1879 = var1881
		var1878 = var1882
		
		if var1879 == protoModule.wireTypes.varint then
			local _ = nil
			local var1884, var1885 = protoModule.readVarInt(p70, var1878)
			local _ = var1884
			var1878 = var1885
			continue
		end
		if var1879 == protoModule.wireTypes.lengthDelimited then
			if var1883 == 1 then
				local _ = nil
				local var1886, var1887 = protoModule.readBuffer(p70, var1878)
				var1878 = var1887
				var1877.event_id = buffer.tostring(var1886)
			else
				local _ = nil
				local var1888, var1889 = protoModule.readVarInt(p70, var1878)
				var1878 = var1889 + var1888
			end
		elseif var1879 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1890, var1891 = protoModule.readFixed32(p70, var1878)
			local _ = var1890
			var1878 = var1891
		elseif var1879 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1892, var1893 = protoModule.readFixed64(p70, var1878)
			local _ = var1892
			var1878 = var1893
		else
			error("Unsupported wire type: " .. var2888)
		end
	end
	return var1877
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
	local var1894 = t_70.new()
	
	if self.event_id ~= nil then
		var1894.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1894.event_id = self.eventId
	end
	return var1894
end

t_70.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_70
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p71)
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p71 == nil or p71.event_id == nil then "" else p71.event_id,
		universe_id = if p71 == nil or p71.universe_id == nil then "" else p71.universe_id
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1894 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1895, var1896 = protoModule.writeTag(buff, var1894, 1, protoModule.wireTypes.lengthDelimited)
		var1895, var2908 = protoModule.writeString(var1895, var1896, self.event_id)
		buff = var1895
		var1894 = var1896
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1897, var1898 = protoModule.writeTag(buff, var1894, 2, protoModule.wireTypes.lengthDelimited)
		var1897, var2910 = protoModule.writeString(var1897, var1898, self.universe_id)
		buff = var1897
		var1894 = var1898
	end
	local buff_1 = buffer.create(var1894)
	buffer.copy(buff_1, 0, buff, 0, var1894)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var1894 = t_71.new()
	local var1895 = 0
	while var1895 < buffer.len(p71) do
		local _ = nil
		local var1896 = nil
		local var1897, var1898, var1899 = protoModule.readTag(p71, var1895)
		local var1900 = var1897
		var1896 = var1898
		var1895 = var1899
		
		if var1896 == protoModule.wireTypes.varint then
			local _ = nil
			local var1901, var1902 = protoModule.readVarInt(p71, var1895)
			local _ = var1901
			var1895 = var1902
			continue
		end
		if var1896 == protoModule.wireTypes.lengthDelimited then
			if var1900 == 1 then
				local _ = nil
				local var1903, var1904 = protoModule.readBuffer(p71, var1895)
				var1895 = var1904
				var1894.event_id = buffer.tostring(var1903)
			elseif var1900 == 2 then
				local _ = nil
				local var1905, var1906 = protoModule.readBuffer(p71, var1895)
				var1895 = var1906
				var1894.universe_id = buffer.tostring(var1905)
			else
				local _ = nil
				local var1907, var1908 = protoModule.readVarInt(p71, var1895)
				var1895 = var1908 + var1907
			end
		elseif var1896 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1909, var1910 = protoModule.readFixed32(p71, var1895)
			local _ = var1909
			var1895 = var1910
		elseif var1896 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1911, var1912 = protoModule.readFixed64(p71, var1895)
			local _ = var1911
			var1895 = var1912
		else
			error("Unsupported wire type: " .. var2914)
		end
	end
	return var1894
end

function t_71:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_71:jsonDecode()
	-- upvalues: t_71 (ref)
	local var1913 = t_71.new()
	
	if self.event_id ~= nil then
		var1913.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1913.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1913.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1913.universe_id = self.universeId
	end
	return var1913
end

t_71.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_71
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p72)
	-- upvalues: t_72 (ref)
	return setmetatable({
		entry_map = if p72 == nil or p72.entry_map == nil then {} else p72.entry_map,
		entry_order = if p72 == nil or p72.entry_order == nil then {} else p72.entry_order,
		next_page_token = if p72 == nil or p72.next_page_token == nil then "" else p72.next_page_token,
		sticky_filter_pills = if p72 == nil or p72.sticky_filter_pills == nil then nil else p72.sticky_filter_pills,
		applied_filters = if p72 == nil or p72.applied_filters == nil then "" else p72.applied_filters
	}, t_72)
end

function t_72:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1913 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1914, var1915 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1914, var2936 = protoModule.writeString(var1914, var1915, i)
			local var1916 = v:encode()
			var1915, var2938 = protoModule.writeTag(var1914, var1915, 2, protoModule.wireTypes.lengthDelimited)
			var1915, var2938 = protoModule.writeBuffer(var1915, var2938, var1916, buffer.len(var1916))
			local var1917 = var1915
			local var1918 = var2938
			local var1919, var1920 = protoModule.writeTag(buff, var1913, 1, protoModule.wireTypes.lengthDelimited)
			var1919, var2942 = protoModule.writeBuffer(var1919, var1920, var1917, var1918)
			buff = var1919
			var1913 = var1920
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1921, var1922 = protoModule.writeTag(buff, var1913, 2, protoModule.wireTypes.lengthDelimited)
			var1921, var2944 = protoModule.writeString(var1921, var1922, v)
			buff = var1921
			var1913 = var1922
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1923, var1924 = protoModule.writeTag(buff, var1913, 3, protoModule.wireTypes.lengthDelimited)
		var1923, var2946 = protoModule.writeString(var1923, var1924, self.next_page_token)
		buff = var1923
		var1913 = var1924
	end
	if self.sticky_filter_pills ~= nil then
		local var1925 = self.sticky_filter_pills:encode()
		local var1926, var1927 = protoModule.writeTag(buff, var1913, 4, protoModule.wireTypes.lengthDelimited)
		var1926, var2949 = protoModule.writeBuffer(var1926, var1927, var1925, buffer.len(var1925))
		buff = var1926
		var1913 = var1927
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var1928, var1929 = protoModule.writeTag(buff, var1913, 5, protoModule.wireTypes.lengthDelimited)
		var1928, var2951 = protoModule.writeString(var1928, var1929, self.applied_filters)
		buff = var1928
		var1913 = var1929
	end
	local buff_1 = buffer.create(var1913)
	buffer.copy(buff_1, 0, buff, 0, var1913)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var1930 = t_72.new()
	local var1931 = 0
	while var1931 < buffer.len(p72) do
		local _ = nil
		local var1932 = nil
		local var1933, var1934, var1935 = protoModule.readTag(p72, var1931)
		local var1936 = var1933
		var1932 = var1934
		var1931 = var1935
		
		if var1932 == protoModule.wireTypes.varint then
			local _ = nil
			local var1937, var1938 = protoModule.readVarInt(p72, var1931)
			local _ = var1937
			var1931 = var1938
			continue
		end
		if var1932 == protoModule.wireTypes.lengthDelimited then
			if var1936 == 1 then
				local _ = nil
				local var1939, var1940 = protoModule.readBuffer(p72, var1931)
				var1931 = var1940
				var1939 = t.ChartsFeedInputData_EntryMapEntry.decode(var1939)
				var1930.entry_map[var1939.key or ""] = var1939.value or t.FeedEntry.new()
			elseif var1936 == 2 then
				local _ = nil
				local var1941, var1942 = protoModule.readBuffer(p72, var1931)
				var1931 = var1942
				table.insert(var1930.entry_order, buffer.tostring(var1941))
			elseif var1936 == 3 then
				local _ = nil
				local var1943, var1944 = protoModule.readBuffer(p72, var1931)
				var1931 = var1944
				var1930.next_page_token = buffer.tostring(var1943)
			elseif var1936 == 4 then
				local _ = nil
				local var1945, var1946 = protoModule.readBuffer(p72, var1931)
				var1931 = var1946
				var1930.sticky_filter_pills = t.FilterPillsInputData.decode(var1945)
			elseif var1936 == 5 then
				local _ = nil
				local var1947, var1948 = protoModule.readBuffer(p72, var1931)
				var1931 = var1948
				var1930.applied_filters = buffer.tostring(var1947)
			else
				local _ = nil
				local var1949, var1950 = protoModule.readVarInt(p72, var1931)
				var1931 = var1950 + var1949
			end
		elseif var1932 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1951, var1952 = protoModule.readFixed32(p72, var1931)
			local _ = var1951
			var1931 = var1952
		elseif var1932 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1953, var1954 = protoModule.readFixed64(p72, var1931)
			local _ = var1953
			var1931 = var1954
		else
			error("Unsupported wire type: " .. var2955)
		end
	end
	return var1930
end

function t_72:jsonEncode()
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

function t_72:jsonDecode()
	-- upvalues: t_72 (ref), t (ref)
	local var1955 = t_72.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1955.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1955.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1955.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1955.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var1955.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1955.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var1955.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var1955.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var1955.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1955.applied_filters = self.appliedFilters
	end
	return var1955
end

t_72.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_72
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p73)
	-- upvalues: t_73 (ref)
	return setmetatable({
		key = if p73 == nil or p73.key == nil then "" else p73.key,
		value = if p73 == nil or p73.value == nil then nil else p73.value
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1956 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1957, var1958 = protoModule.writeTag(buff, var1956, 1, protoModule.wireTypes.lengthDelimited)
		var1957, var2989 = protoModule.writeString(var1957, var1958, self.key)
		buff = var1957
		var1956 = var1958
	end
	if self.value ~= nil then
		local var1959 = self.value:encode()
		local var1960, var1961 = protoModule.writeTag(buff, var1956, 2, protoModule.wireTypes.lengthDelimited)
		var1960, var2992 = protoModule.writeBuffer(var1960, var1961, var1959, buffer.len(var1959))
		buff = var1960
		var1956 = var1961
	end
	local buff_1 = buffer.create(var1956)
	buffer.copy(buff_1, 0, buff, 0, var1956)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var1956 = t_73.new()
	local var1957 = 0
	while var1957 < buffer.len(p73) do
		local _ = nil
		local var1958 = nil
		local var1959, var1960, var1961 = protoModule.readTag(p73, var1957)
		local var1962 = var1959
		var1958 = var1960
		var1957 = var1961
		
		if var1958 == protoModule.wireTypes.varint then
			local _ = nil
			local var1963, var1964 = protoModule.readVarInt(p73, var1957)
			local _ = var1963
			var1957 = var1964
			continue
		end
		if var1958 == protoModule.wireTypes.lengthDelimited then
			if var1962 == 1 then
				local _ = nil
				local var1965, var1966 = protoModule.readBuffer(p73, var1957)
				var1957 = var1966
				var1956.key = buffer.tostring(var1965)
			elseif var1962 == 2 then
				local _ = nil
				local var1967, var1968 = protoModule.readBuffer(p73, var1957)
				var1957 = var1968
				var1956.value = t.FeedEntry.decode(var1967)
			else
				local _ = nil
				local var1969, var1970 = protoModule.readVarInt(p73, var1957)
				var1957 = var1970 + var1969
			end
		elseif var1958 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1971, var1972 = protoModule.readFixed32(p73, var1957)
			local _ = var1971
			var1957 = var1972
		elseif var1958 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1973, var1974 = protoModule.readFixed64(p73, var1957)
			local _ = var1973
			var1957 = var1974
		else
			error("Unsupported wire type: " .. var2996)
		end
	end
	return var1956
end

function t_73:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_73:jsonDecode()
	-- upvalues: t_73 (ref), t (ref)
	local var1975 = t_73.new()
	
	if self.key ~= nil then
		var1975.key = self.key
	end
	if self.value ~= nil then
		var1975.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1975
end

t_73.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_73
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p74)
	-- upvalues: t_74 (ref)
	return setmetatable({
		filter_groups = if p74 == nil or p74.filter_groups == nil then {} else p74.filter_groups,
		sort_id = if p74 == nil or p74.sort_id == nil then "" else p74.sort_id,
		secondary_sort_id = if p74 == nil or p74.secondary_sort_id == nil then 0 else p74.secondary_sort_id,
		title = if p74 == nil or p74.title == nil then "" else p74.title,
		primary_sort_id = if p74 == nil or p74.primary_sort_id == nil then nil else p74.primary_sort_id,
		applied_filters = if p74 == nil or p74.applied_filters == nil then nil else p74.applied_filters
	}, t_74)
end

function t_74:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1975 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var1976 = v:encode()
			local var1977, var1978 = protoModule.writeTag(buff, var1975, 1, protoModule.wireTypes.lengthDelimited)
			var1977, var3019 = protoModule.writeBuffer(var1977, var1978, var1976, buffer.len(var1976))
			buff = var1977
			var1975 = var1978
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1979, var1980 = protoModule.writeTag(buff, var1975, 2, protoModule.wireTypes.lengthDelimited)
		var1979, var3021 = protoModule.writeString(var1979, var1980, self.sort_id)
		buff = var1979
		var1975 = var1980
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1981, var1982 = protoModule.writeTag(buff, var1975, 3, protoModule.wireTypes.varint)
		var1981, var3023 = protoModule.writeVarInt(var1981, var1982, self.secondary_sort_id)
		buff = var1981
		var1975 = var1982
	end
	if self.title ~= nil and self.title ~= "" then
		local var1983, var1984 = protoModule.writeTag(buff, var1975, 4, protoModule.wireTypes.lengthDelimited)
		var1983, var3025 = protoModule.writeString(var1983, var1984, self.title)
		buff = var1983
		var1975 = var1984
	end
	if self.primary_sort_id ~= nil then
		local var1985, var1986 = protoModule.writeTag(buff, var1975, 5, protoModule.wireTypes.varint)
		var1985, var3027 = protoModule.writeVarInt(var1985, var1986, self.primary_sort_id)
		buff = var1985
		var1975 = var1986
	end
	if self.applied_filters ~= nil then
		local var1987, var1988 = protoModule.writeTag(buff, var1975, 6, protoModule.wireTypes.lengthDelimited)
		var1987, var3029 = protoModule.writeString(var1987, var1988, self.applied_filters)
		buff = var1987
		var1975 = var1988
	end
	local buff_1 = buffer.create(var1975)
	buffer.copy(buff_1, 0, buff, 0, var1975)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var1989 = t_74.new()
	local var1990 = 0
	while var1990 < buffer.len(p74) do
		local _ = nil
		local var1991 = nil
		local var1992, var1993, var1994 = protoModule.readTag(p74, var1990)
		local var1995 = var1992
		var1991 = var1993
		var1990 = var1994
		
		if var1991 == protoModule.wireTypes.varint then
			if var1995 == 3 then
				local _ = nil
				local var1996, var1997 = protoModule.readVarIntI32(p74, var1990)
				var1990 = var1997
				var1989.secondary_sort_id = var1996
			elseif var1995 == 5 then
				local _ = nil
				local var1998, var1999 = protoModule.readVarIntI32(p74, var1990)
				var1990 = var1999
				var1989.primary_sort_id = var1998
			else
				local _ = nil
				local var2000, var2001 = protoModule.readVarInt(p74, var1990)
				local _ = var2000
				var1990 = var2001
			end
		end
		if var1991 == protoModule.wireTypes.lengthDelimited then
			if var1995 == 1 then
				local _ = nil
				local var2002, var2003 = protoModule.readBuffer(p74, var1990)
				var1990 = var2003
				table.insert(var1989.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2002))
			elseif var1995 == 2 then
				local _ = nil
				local var2004, var2005 = protoModule.readBuffer(p74, var1990)
				var1990 = var2005
				var1989.sort_id = buffer.tostring(var2004)
			elseif var1995 == 4 then
				local _ = nil
				local var2006, var2007 = protoModule.readBuffer(p74, var1990)
				var1990 = var2007
				var1989.title = buffer.tostring(var2006)
			elseif var1995 == 6 then
				local _ = nil
				local var2008, var2009 = protoModule.readBuffer(p74, var1990)
				var1990 = var2009
				var1989.applied_filters = buffer.tostring(var2008)
			else
				local _ = nil
				local var2010, var2011 = protoModule.readVarInt(p74, var1990)
				var1990 = var2011 + var2010
			end
		elseif var1991 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2012, var2013 = protoModule.readFixed32(p74, var1990)
			local _ = var2012
			var1990 = var2013
		elseif var1991 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2014, var2015 = protoModule.readFixed64(p74, var1990)
			local _ = var2014
			var1990 = var2015
		else
			error("Unsupported wire type: " .. var3033)
		end
	end
	return var1989
end

function t_74:jsonEncode()
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

function t_74:jsonDecode()
	-- upvalues: t_74 (ref), t (ref)
	local var2016 = t_74.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2016.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2016.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2016.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2016.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2016.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2016.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2016.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2016.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2016.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2016.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2016.applied_filters = self.appliedFilters
	end
	return var2016
end

t_74.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_74
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p75)
	-- upvalues: t_75 (ref)
	return setmetatable({
		filter_id = if p75 == nil or p75.filter_id == nil then "" else p75.filter_id,
		display_name = if p75 == nil or p75.display_name == nil then "" else p75.display_name,
		options = if p75 == nil or p75.options == nil then {} else p75.options,
		default_option_id = if p75 == nil or p75.default_option_id == nil then "" else p75.default_option_id,
		selected_option_id = if p75 == nil or p75.selected_option_id == nil then "" else p75.selected_option_id,
		filter_type = if p75 == nil or p75.filter_type == nil then "" else p75.filter_type,
		inactive_option_ids = if p75 == nil or p75.inactive_option_ids == nil then {} else p75.inactive_option_ids,
		info_text = if p75 == nil or p75.info_text == nil then "" else p75.info_text
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2017 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2018, var2019 = protoModule.writeTag(buff, var2017, 1, protoModule.wireTypes.lengthDelimited)
		var2018, var3066 = protoModule.writeString(var2018, var2019, self.filter_id)
		buff = var2018
		var2017 = var2019
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2020, var2021 = protoModule.writeTag(buff, var2017, 2, protoModule.wireTypes.lengthDelimited)
		var2020, var3068 = protoModule.writeString(var2020, var2021, self.display_name)
		buff = var2020
		var2017 = var2021
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2022 = v:encode()
			local var2023, var2024 = protoModule.writeTag(buff, var2017, 3, protoModule.wireTypes.lengthDelimited)
			var2023, var3071 = protoModule.writeBuffer(var2023, var2024, var2022, buffer.len(var2022))
			buff = var2023
			var2017 = var2024
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2025, var2026 = protoModule.writeTag(buff, var2017, 4, protoModule.wireTypes.lengthDelimited)
		var2025, var3073 = protoModule.writeString(var2025, var2026, self.default_option_id)
		buff = var2025
		var2017 = var2026
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2027, var2028 = protoModule.writeTag(buff, var2017, 5, protoModule.wireTypes.lengthDelimited)
		var2027, var3075 = protoModule.writeString(var2027, var2028, self.selected_option_id)
		buff = var2027
		var2017 = var2028
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2029, var2030 = protoModule.writeTag(buff, var2017, 6, protoModule.wireTypes.lengthDelimited)
		var2029, var3077 = protoModule.writeString(var2029, var2030, self.filter_type)
		buff = var2029
		var2017 = var2030
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2031, var2032 = protoModule.writeTag(buff, var2017, 7, protoModule.wireTypes.lengthDelimited)
			var2031, var3079 = protoModule.writeString(var2031, var2032, v)
			buff = var2031
			var2017 = var2032
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2033, var2034 = protoModule.writeTag(buff, var2017, 8, protoModule.wireTypes.lengthDelimited)
		var2033, var3081 = protoModule.writeString(var2033, var2034, self.info_text)
		buff = var2033
		var2017 = var2034
	end
	local buff_1 = buffer.create(var2017)
	buffer.copy(buff_1, 0, buff, 0, var2017)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2035 = t_75.new()
	local var2036 = 0
	while var2036 < buffer.len(p75) do
		local _ = nil
		local var2037 = nil
		local var2038, var2039, var2040 = protoModule.readTag(p75, var2036)
		local var2041 = var2038
		var2037 = var2039
		var2036 = var2040
		
		if var2037 == protoModule.wireTypes.varint then
			local _ = nil
			local var2042, var2043 = protoModule.readVarInt(p75, var2036)
			local _ = var2042
			var2036 = var2043
			continue
		end
		if var2037 == protoModule.wireTypes.lengthDelimited then
			if var2041 == 1 then
				local _ = nil
				local var2044, var2045 = protoModule.readBuffer(p75, var2036)
				var2036 = var2045
				var2035.filter_id = buffer.tostring(var2044)
			elseif var2041 == 2 then
				local _ = nil
				local var2046, var2047 = protoModule.readBuffer(p75, var2036)
				var2036 = var2047
				var2035.display_name = buffer.tostring(var2046)
			elseif var2041 == 3 then
				local _ = nil
				local var2048, var2049 = protoModule.readBuffer(p75, var2036)
				var2036 = var2049
				table.insert(var2035.options, t.FilterPillsInputData_FilterOption.decode(var2048))
			elseif var2041 == 4 then
				local _ = nil
				local var2050, var2051 = protoModule.readBuffer(p75, var2036)
				var2036 = var2051
				var2035.default_option_id = buffer.tostring(var2050)
			elseif var2041 == 5 then
				local _ = nil
				local var2052, var2053 = protoModule.readBuffer(p75, var2036)
				var2036 = var2053
				var2035.selected_option_id = buffer.tostring(var2052)
			elseif var2041 == 6 then
				local _ = nil
				local var2054, var2055 = protoModule.readBuffer(p75, var2036)
				var2036 = var2055
				var2035.filter_type = buffer.tostring(var2054)
			elseif var2041 == 7 then
				local _ = nil
				local var2056, var2057 = protoModule.readBuffer(p75, var2036)
				var2036 = var2057
				table.insert(var2035.inactive_option_ids, buffer.tostring(var2056))
			elseif var2041 == 8 then
				local _ = nil
				local var2058, var2059 = protoModule.readBuffer(p75, var2036)
				var2036 = var2059
				var2035.info_text = buffer.tostring(var2058)
			else
				local _ = nil
				local var2060, var2061 = protoModule.readVarInt(p75, var2036)
				var2036 = var2061 + var2060
			end
		elseif var2037 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2062, var2063 = protoModule.readFixed32(p75, var2036)
			local _ = var2062
			var2036 = var2063
		elseif var2037 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2064, var2065 = protoModule.readFixed64(p75, var2036)
			local _ = var2064
			var2036 = var2065
		else
			error("Unsupported wire type: " .. var3085)
		end
	end
	return var2035
end

function t_75:jsonEncode()
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

function t_75:jsonDecode()
	-- upvalues: t_75 (ref), t (ref)
	local var2066 = t_75.new()
	
	if self.filter_id ~= nil then
		var2066.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2066.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2066.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2066.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2066.options = t_1
	end
	if self.default_option_id ~= nil then
		var2066.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2066.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2066.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2066.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2066.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2066.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2066.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2066.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2066.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2066.info_text = self.infoText
	end
	return var2066
end

t_75.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_75
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p76)
	-- upvalues: t_76 (ref)
	return setmetatable({
		option_id = if p76 == nil or p76.option_id == nil then "" else p76.option_id,
		display_name = if p76 == nil or p76.display_name == nil then "" else p76.display_name,
		option_context_tag = if p76 == nil or p76.option_context_tag == nil then "" else p76.option_context_tag
	}, t_76)
end

function t_76:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2067 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2068, var2069 = protoModule.writeTag(buff, var2067, 1, protoModule.wireTypes.lengthDelimited)
		var2068, var3124 = protoModule.writeString(var2068, var2069, self.option_id)
		buff = var2068
		var2067 = var2069
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2070, var2071 = protoModule.writeTag(buff, var2067, 2, protoModule.wireTypes.lengthDelimited)
		var2070, var3126 = protoModule.writeString(var2070, var2071, self.display_name)
		buff = var2070
		var2067 = var2071
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2072, var2073 = protoModule.writeTag(buff, var2067, 3, protoModule.wireTypes.lengthDelimited)
		var2072, var3128 = protoModule.writeString(var2072, var2073, self.option_context_tag)
		buff = var2072
		var2067 = var2073
	end
	local buff_1 = buffer.create(var2067)
	buffer.copy(buff_1, 0, buff, 0, var2067)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref)
	local var2067 = t_76.new()
	local var2068 = 0
	while var2068 < buffer.len(p76) do
		local _ = nil
		local var2069 = nil
		local var2070, var2071, var2072 = protoModule.readTag(p76, var2068)
		local var2073 = var2070
		var2069 = var2071
		var2068 = var2072
		
		if var2069 == protoModule.wireTypes.varint then
			local _ = nil
			local var2074, var2075 = protoModule.readVarInt(p76, var2068)
			local _ = var2074
			var2068 = var2075
			continue
		end
		if var2069 == protoModule.wireTypes.lengthDelimited then
			if var2073 == 1 then
				local _ = nil
				local var2076, var2077 = protoModule.readBuffer(p76, var2068)
				var2068 = var2077
				var2067.option_id = buffer.tostring(var2076)
			elseif var2073 == 2 then
				local _ = nil
				local var2078, var2079 = protoModule.readBuffer(p76, var2068)
				var2068 = var2079
				var2067.display_name = buffer.tostring(var2078)
			elseif var2073 == 3 then
				local _ = nil
				local var2080, var2081 = protoModule.readBuffer(p76, var2068)
				var2068 = var2081
				var2067.option_context_tag = buffer.tostring(var2080)
			else
				local _ = nil
				local var2082, var2083 = protoModule.readVarInt(p76, var2068)
				var2068 = var2083 + var2082
			end
		elseif var2069 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2084, var2085 = protoModule.readFixed32(p76, var2068)
			local _ = var2084
			var2068 = var2085
		elseif var2069 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2086, var2087 = protoModule.readFixed64(p76, var2068)
			local _ = var2086
			var2068 = var2087
		else
			error("Unsupported wire type: " .. var3132)
		end
	end
	return var2067
end

function t_76:jsonEncode()
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

function t_76:jsonDecode()
	-- upvalues: t_76 (ref)
	local var2088 = t_76.new()
	
	if self.option_id ~= nil then
		var2088.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2088.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2088.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2088.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2088.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2088.option_context_tag = self.optionContextTag
	end
	return var2088
end

t_76.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_76
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p77)
	-- upvalues: t_77 (ref)
	return setmetatable({
		sort_options = if p77 == nil or p77.sort_options == nil then {} else p77.sort_options,
		selected_sort_id = if p77 == nil or p77.selected_sort_id == nil then "" else p77.selected_sort_id
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2088 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2089 = v:encode()
			local var2090, var2091 = protoModule.writeTag(buff, var2088, 1, protoModule.wireTypes.lengthDelimited)
			var2090, var3157 = protoModule.writeBuffer(var2090, var2091, var2089, buffer.len(var2089))
			buff = var2090
			var2088 = var2091
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2092, var2093 = protoModule.writeTag(buff, var2088, 2, protoModule.wireTypes.lengthDelimited)
		var2092, var3159 = protoModule.writeString(var2092, var2093, self.selected_sort_id)
		buff = var2092
		var2088 = var2093
	end
	local buff_1 = buffer.create(var2088)
	buffer.copy(buff_1, 0, buff, 0, var2088)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2094 = t_77.new()
	local var2095 = 0
	while var2095 < buffer.len(p77) do
		local _ = nil
		local var2096 = nil
		local var2097, var2098, var2099 = protoModule.readTag(p77, var2095)
		local var2100 = var2097
		var2096 = var2098
		var2095 = var2099
		
		if var2096 == protoModule.wireTypes.varint then
			local _ = nil
			local var2101, var2102 = protoModule.readVarInt(p77, var2095)
			local _ = var2101
			var2095 = var2102
			continue
		end
		if var2096 == protoModule.wireTypes.lengthDelimited then
			if var2100 == 1 then
				local _ = nil
				local var2103, var2104 = protoModule.readBuffer(p77, var2095)
				var2095 = var2104
				table.insert(var2094.sort_options, t.SortSelectorInputData_SortOption.decode(var2103))
			elseif var2100 == 2 then
				local _ = nil
				local var2105, var2106 = protoModule.readBuffer(p77, var2095)
				var2095 = var2106
				var2094.selected_sort_id = buffer.tostring(var2105)
			else
				local _ = nil
				local var2107, var2108 = protoModule.readVarInt(p77, var2095)
				var2095 = var2108 + var2107
			end
		elseif var2096 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2109, var2110 = protoModule.readFixed32(p77, var2095)
			local _ = var2109
			var2095 = var2110
		elseif var2096 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2111, var2112 = protoModule.readFixed64(p77, var2095)
			local _ = var2111
			var2095 = var2112
		else
			error("Unsupported wire type: " .. var3163)
		end
	end
	return var2094
end

function t_77:jsonEncode()
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

function t_77:jsonDecode()
	-- upvalues: t_77 (ref), t (ref)
	local var2113 = t_77.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2113.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2113.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2113.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2113.selected_sort_id = self.selectedSortId
	end
	return var2113
end

t_77.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_77
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p78)
	-- upvalues: t_78 (ref)
	return setmetatable({
		sort_id = if p78 == nil or p78.sort_id == nil then "" else p78.sort_id,
		display_name = if p78 == nil or p78.display_name == nil then "" else p78.display_name,
		content_type = if p78 == nil or p78.content_type == nil then "" else p78.content_type
	}, t_78)
end

function t_78:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2114 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2115, var2116 = protoModule.writeTag(buff, var2114, 1, protoModule.wireTypes.lengthDelimited)
		var2115, var3188 = protoModule.writeString(var2115, var2116, self.sort_id)
		buff = var2115
		var2114 = var2116
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2117, var2118 = protoModule.writeTag(buff, var2114, 2, protoModule.wireTypes.lengthDelimited)
		var2117, var3190 = protoModule.writeString(var2117, var2118, self.display_name)
		buff = var2117
		var2114 = var2118
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2119, var2120 = protoModule.writeTag(buff, var2114, 3, protoModule.wireTypes.lengthDelimited)
		var2119, var3192 = protoModule.writeString(var2119, var2120, self.content_type)
		buff = var2119
		var2114 = var2120
	end
	local buff_1 = buffer.create(var2114)
	buffer.copy(buff_1, 0, buff, 0, var2114)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var2114 = t_78.new()
	local var2115 = 0
	while var2115 < buffer.len(p78) do
		local _ = nil
		local var2116 = nil
		local var2117, var2118, var2119 = protoModule.readTag(p78, var2115)
		local var2120 = var2117
		var2116 = var2118
		var2115 = var2119
		
		if var2116 == protoModule.wireTypes.varint then
			local _ = nil
			local var2121, var2122 = protoModule.readVarInt(p78, var2115)
			local _ = var2121
			var2115 = var2122
			continue
		end
		if var2116 == protoModule.wireTypes.lengthDelimited then
			if var2120 == 1 then
				local _ = nil
				local var2123, var2124 = protoModule.readBuffer(p78, var2115)
				var2115 = var2124
				var2114.sort_id = buffer.tostring(var2123)
			elseif var2120 == 2 then
				local _ = nil
				local var2125, var2126 = protoModule.readBuffer(p78, var2115)
				var2115 = var2126
				var2114.display_name = buffer.tostring(var2125)
			elseif var2120 == 3 then
				local _ = nil
				local var2127, var2128 = protoModule.readBuffer(p78, var2115)
				var2115 = var2128
				var2114.content_type = buffer.tostring(var2127)
			else
				local _ = nil
				local var2129, var2130 = protoModule.readVarInt(p78, var2115)
				var2115 = var2130 + var2129
			end
		elseif var2116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2131, var2132 = protoModule.readFixed32(p78, var2115)
			local _ = var2131
			var2115 = var2132
		elseif var2116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2133, var2134 = protoModule.readFixed64(p78, var2115)
			local _ = var2133
			var2115 = var2134
		else
			error("Unsupported wire type: " .. var3196)
		end
	end
	return var2114
end

function t_78:jsonEncode()
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

function t_78:jsonDecode()
	-- upvalues: t_78 (ref)
	local var2135 = t_78.new()
	
	if self.sort_id ~= nil then
		var2135.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2135.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2135.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2135.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2135.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2135.content_type = self.contentType
	end
	return var2135
end

t_78.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_78
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p79)
	-- upvalues: t_79 (ref)
	return setmetatable({
		selected_option = if p79 == nil or p79.selected_option == nil then "" else p79.selected_option,
		options = if p79 == nil or p79.options == nil then {} else p79.options,
		experience_carousel = if p79 == nil or p79.experience_carousel == nil then nil else p79.experience_carousel
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2135 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2136, var2137 = protoModule.writeTag(buff, var2135, 1, protoModule.wireTypes.lengthDelimited)
		var2136, var3220 = protoModule.writeString(var2136, var2137, self.selected_option)
		buff = var2136
		var2135 = var2137
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2138 = v:encode()
			local var2139, var2140 = protoModule.writeTag(buff, var2135, 2, protoModule.wireTypes.lengthDelimited)
			var2139, var3223 = protoModule.writeBuffer(var2139, var2140, var2138, buffer.len(var2138))
			buff = var2139
			var2135 = var2140
		end
	end
	if self.experience_carousel ~= nil then
		local var2141 = self.experience_carousel:encode()
		local var2142, var2143 = protoModule.writeTag(buff, var2135, 3, protoModule.wireTypes.lengthDelimited)
		var2142, var3226 = protoModule.writeBuffer(var2142, var2143, var2141, buffer.len(var2141))
		buff = var2142
		var2135 = var2143
	end
	local buff_1 = buffer.create(var2135)
	buffer.copy(buff_1, 0, buff, 0, var2135)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2144 = t_79.new()
	local var2145 = 0
	while var2145 < buffer.len(p79) do
		local _ = nil
		local var2146 = nil
		local var2147, var2148, var2149 = protoModule.readTag(p79, var2145)
		local var2150 = var2147
		var2146 = var2148
		var2145 = var2149
		
		if var2146 == protoModule.wireTypes.varint then
			local _ = nil
			local var2151, var2152 = protoModule.readVarInt(p79, var2145)
			local _ = var2151
			var2145 = var2152
			continue
		end
		if var2146 == protoModule.wireTypes.lengthDelimited then
			if var2150 == 1 then
				local _ = nil
				local var2153, var2154 = protoModule.readBuffer(p79, var2145)
				var2145 = var2154
				var2144.selected_option = buffer.tostring(var2153)
			elseif var2150 == 2 then
				local _ = nil
				local var2155, var2156 = protoModule.readBuffer(p79, var2145)
				var2145 = var2156
				table.insert(var2144.options, t.SelectorOption.decode(var2155))
			elseif var2150 == 3 then
				local _ = nil
				local var2157, var2158 = protoModule.readBuffer(p79, var2145)
				var2145 = var2158
				var2144.experience_carousel = t.ExperienceCarouselInputData.decode(var2157)
			else
				local _ = nil
				local var2159, var2160 = protoModule.readVarInt(p79, var2145)
				var2145 = var2160 + var2159
			end
		elseif var2146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2161, var2162 = protoModule.readFixed32(p79, var2145)
			local _ = var2161
			var2145 = var2162
		elseif var2146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2163, var2164 = protoModule.readFixed64(p79, var2145)
			local _ = var2163
			var2145 = var2164
		else
			error("Unsupported wire type: " .. var3230)
		end
	end
	return var2144
end

function t_79:jsonEncode()
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

function t_79:jsonDecode()
	-- upvalues: t_79 (ref), t (ref)
	local var2165 = t_79.new()
	
	if self.selected_option ~= nil then
		var2165.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2165.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2165.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2165.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2165.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2165
end

t_79.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_79
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p80)
	-- upvalues: t_80 (ref)
	return setmetatable({
		id = if p80 == nil or p80.id == nil then "" else p80.id,
		preview_rows = if p80 == nil or p80.preview_rows == nil then 0 else p80.preview_rows,
		widget_style = if p80 == nil or p80.widget_style == nil then nil else p80.widget_style,
		see_all_button = if p80 == nil or p80.see_all_button == nil then false else p80.see_all_button,
		information_popover_text = if p80 == nil or p80.information_popover_text == nil then "" else p80.information_popover_text
	}, t_80)
end

function t_80:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2166 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2167, var2168 = protoModule.writeTag(buff, var2166, 1, protoModule.wireTypes.lengthDelimited)
		var2167, var3256 = protoModule.writeString(var2167, var2168, self.id)
		buff = var2167
		var2166 = var2168
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2169, var2170 = protoModule.writeTag(buff, var2166, 4, protoModule.wireTypes.varint)
		var2169, var3258 = protoModule.writeVarInt(var2169, var2170, self.preview_rows)
		buff = var2169
		var2166 = var2170
	end
	if self.widget_style ~= nil then
		local var2171 = self.widget_style:encode()
		local var2172, var2173 = protoModule.writeTag(buff, var2166, 3, protoModule.wireTypes.lengthDelimited)
		var2172, var3261 = protoModule.writeBuffer(var2172, var2173, var2171, buffer.len(var2171))
		buff = var2172
		var2166 = var2173
	end
	if self.see_all_button then
		local var2174, var2175 = protoModule.writeTag(buff, var2166, 5, protoModule.wireTypes.varint)
		var2174, var3263 = protoModule.writeVarInt(var2174, var2175, if self.see_all_button then 1 else 0)
		buff = var2174
		var2166 = var2175
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2176, var2177 = protoModule.writeTag(buff, var2166, 6, protoModule.wireTypes.lengthDelimited)
		var2176, var3265 = protoModule.writeString(var2176, var2177, self.information_popover_text)
		buff = var2176
		var2166 = var2177
	end
	local buff_1 = buffer.create(var2166)
	buffer.copy(buff_1, 0, buff, 0, var2166)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2166 = t_80.new()
	local var2167 = 0
	while var2167 < buffer.len(p80) do
		local _ = nil
		local var2168 = nil
		local var2169, var2170, var2171 = protoModule.readTag(p80, var2167)
		local var2172 = var2169
		var2168 = var2170
		var2167 = var2171
		
		if var2168 == protoModule.wireTypes.varint then
			if var2172 == 4 then
				local _ = nil
				local var2173, var2174 = protoModule.readVarIntI64(p80, var2167)
				var2167 = var2174
				var2166.preview_rows = var2173
			elseif var2172 == 5 then
				local _ = nil
				local var2175, var2176 = protoModule.readVarInt(p80, var2167)
				var2167 = var2176
				var2166.see_all_button = var2175 ~= 0
			else
				local _ = nil
				local var2177, var2178 = protoModule.readVarInt(p80, var2167)
				local _ = var2177
				var2167 = var2178
			end
		end
		if var2168 == protoModule.wireTypes.lengthDelimited then
			if var2172 == 1 then
				local _ = nil
				local var2179, var2180 = protoModule.readBuffer(p80, var2167)
				var2167 = var2180
				var2166.id = buffer.tostring(var2179)
			elseif var2172 == 3 then
				local _ = nil
				local var2181, var2182 = protoModule.readBuffer(p80, var2167)
				var2167 = var2182
				var2166.widget_style = t.WidgetStyleData.decode(var2181)
			elseif var2172 == 6 then
				local _ = nil
				local var2183, var2184 = protoModule.readBuffer(p80, var2167)
				var2167 = var2184
				var2166.information_popover_text = buffer.tostring(var2183)
			else
				local _ = nil
				local var2185, var2186 = protoModule.readVarInt(p80, var2167)
				var2167 = var2186 + var2185
			end
		elseif var2168 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2187, var2188 = protoModule.readFixed32(p80, var2167)
			local _ = var2187
			var2167 = var2188
		elseif var2168 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2189, var2190 = protoModule.readFixed64(p80, var2167)
			local _ = var2189
			var2167 = var2190
		else
			error("Unsupported wire type: " .. var3269)
		end
	end
	return var2166
end

function t_80:jsonEncode()
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

function t_80:jsonDecode()
	-- upvalues: t_80 (ref), t (ref)
	local var2191 = t_80.new()
	
	if self.id ~= nil then
		var2191.id = self.id
	end
	if self.preview_rows ~= nil then
		var2191.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2191.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2191.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2191.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2191.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2191.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2191.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2191.information_popover_text = self.informationPopoverText
	end
	return var2191
end

t_80.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_80
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p81)
	-- upvalues: t_81 (ref)
	return setmetatable({
		id = if p81 == nil or p81.id == nil then "" else p81.id,
		num_items_to_show = if p81 == nil or p81.num_items_to_show == nil then 0 else p81.num_items_to_show,
		widget_style = if p81 == nil or p81.widget_style == nil then nil else p81.widget_style,
		see_all_button = if p81 == nil or p81.see_all_button == nil then false else p81.see_all_button,
		information_popover_text = if p81 == nil or p81.information_popover_text == nil then "" else p81.information_popover_text
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2191 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2192, var2193 = protoModule.writeTag(buff, var2191, 1, protoModule.wireTypes.lengthDelimited)
		var2192, var3297 = protoModule.writeString(var2192, var2193, self.id)
		buff = var2192
		var2191 = var2193
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2194, var2195 = protoModule.writeTag(buff, var2191, 5, protoModule.wireTypes.varint)
		var2194, var3299 = protoModule.writeVarInt(var2194, var2195, self.num_items_to_show)
		buff = var2194
		var2191 = var2195
	end
	if self.widget_style ~= nil then
		local var2196 = self.widget_style:encode()
		local var2197, var2198 = protoModule.writeTag(buff, var2191, 3, protoModule.wireTypes.lengthDelimited)
		var2197, var3302 = protoModule.writeBuffer(var2197, var2198, var2196, buffer.len(var2196))
		buff = var2197
		var2191 = var2198
	end
	if self.see_all_button then
		local var2199, var2200 = protoModule.writeTag(buff, var2191, 6, protoModule.wireTypes.varint)
		var2199, var3304 = protoModule.writeVarInt(var2199, var2200, if self.see_all_button then 1 else 0)
		buff = var2199
		var2191 = var2200
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2201, var2202 = protoModule.writeTag(buff, var2191, 7, protoModule.wireTypes.lengthDelimited)
		var2201, var3306 = protoModule.writeString(var2201, var2202, self.information_popover_text)
		buff = var2201
		var2191 = var2202
	end
	local buff_1 = buffer.create(var2191)
	buffer.copy(buff_1, 0, buff, 0, var2191)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2191 = t_81.new()
	local var2192 = 0
	while var2192 < buffer.len(p81) do
		local _ = nil
		local var2193 = nil
		local var2194, var2195, var2196 = protoModule.readTag(p81, var2192)
		local var2197 = var2194
		var2193 = var2195
		var2192 = var2196
		
		if var2193 == protoModule.wireTypes.varint then
			if var2197 == 5 then
				local _ = nil
				local var2198, var2199 = protoModule.readVarIntI64(p81, var2192)
				var2192 = var2199
				var2191.num_items_to_show = var2198
			elseif var2197 == 6 then
				local _ = nil
				local var2200, var2201 = protoModule.readVarInt(p81, var2192)
				var2192 = var2201
				var2191.see_all_button = var2200 ~= 0
			else
				local _ = nil
				local var2202, var2203 = protoModule.readVarInt(p81, var2192)
				local _ = var2202
				var2192 = var2203
			end
		end
		if var2193 == protoModule.wireTypes.lengthDelimited then
			if var2197 == 1 then
				local _ = nil
				local var2204, var2205 = protoModule.readBuffer(p81, var2192)
				var2192 = var2205
				var2191.id = buffer.tostring(var2204)
			elseif var2197 == 3 then
				local _ = nil
				local var2206, var2207 = protoModule.readBuffer(p81, var2192)
				var2192 = var2207
				var2191.widget_style = t.WidgetStyleData.decode(var2206)
			elseif var2197 == 7 then
				local _ = nil
				local var2208, var2209 = protoModule.readBuffer(p81, var2192)
				var2192 = var2209
				var2191.information_popover_text = buffer.tostring(var2208)
			else
				local _ = nil
				local var2210, var2211 = protoModule.readVarInt(p81, var2192)
				var2192 = var2211 + var2210
			end
		elseif var2193 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2212, var2213 = protoModule.readFixed32(p81, var2192)
			local _ = var2212
			var2192 = var2213
		elseif var2193 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2214, var2215 = protoModule.readFixed64(p81, var2192)
			local _ = var2214
			var2192 = var2215
		else
			error("Unsupported wire type: " .. var3310)
		end
	end
	return var2191
end

function t_81:jsonEncode()
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

function t_81:jsonDecode()
	-- upvalues: t_81 (ref), t (ref)
	local var2216 = t_81.new()
	
	if self.id ~= nil then
		var2216.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2216.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2216.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2216.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2216.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2216.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2216.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2216.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2216.information_popover_text = self.informationPopoverText
	end
	return var2216
end

t_81.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_81
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p82)
	-- upvalues: t_82 (ref)
	return setmetatable({
		background_layers = if p82 == nil or p82.background_layers == nil then {} else p82.background_layers
	}, t_82)
end

function t_82:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2216 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2217 = v:encode()
			local var2218, var2219 = protoModule.writeTag(buff, var2216, 1, protoModule.wireTypes.lengthDelimited)
			var2218, var3339 = protoModule.writeBuffer(var2218, var2219, var2217, buffer.len(var2217))
			buff = var2218
			var2216 = var2219
		end
	end
	local buff_1 = buffer.create(var2216)
	buffer.copy(buff_1, 0, buff, 0, var2216)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2220 = t_82.new()
	local var2221 = 0
	while var2221 < buffer.len(p82) do
		local _ = nil
		local var2222 = nil
		local var2223, var2224, var2225 = protoModule.readTag(p82, var2221)
		local var2226 = var2223
		var2222 = var2224
		var2221 = var2225
		
		if var2222 == protoModule.wireTypes.varint then
			local _ = nil
			local var2227, var2228 = protoModule.readVarInt(p82, var2221)
			local _ = var2227
			var2221 = var2228
			continue
		end
		if var2222 == protoModule.wireTypes.lengthDelimited then
			if var2226 == 1 then
				local _ = nil
				local var2229, var2230 = protoModule.readBuffer(p82, var2221)
				var2221 = var2230
				table.insert(var2220.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2229))
			else
				local _ = nil
				local var2231, var2232 = protoModule.readVarInt(p82, var2221)
				var2221 = var2232 + var2231
			end
		elseif var2222 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2233, var2234 = protoModule.readFixed32(p82, var2221)
			local _ = var2233
			var2221 = var2234
		elseif var2222 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2235, var2236 = protoModule.readFixed64(p82, var2221)
			local _ = var2235
			var2221 = var2236
		else
			error("Unsupported wire type: " .. var3343)
		end
	end
	return var2220
end

function t_82:jsonEncode()
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

function t_82:jsonDecode()
	-- upvalues: t_82 (ref), backgroundLayerModule (ref)
	local var2237 = t_82.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2237.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2237.background_layers = t
	end
	return var2237
end

t_82.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_82
typeRegistryModule.default:register(t.WidgetStyleData)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p83)
	-- upvalues: t_83 (ref)
	return setmetatable({
		id = if p83 == nil or p83.id == nil then "" else p83.id,
		available_until = if p83 == nil or p83.available_until == nil then "" else p83.available_until,
		widget_style = if p83 == nil or p83.widget_style == nil then nil else p83.widget_style
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2238 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2239, var2240 = protoModule.writeTag(buff, var2238, 1, protoModule.wireTypes.lengthDelimited)
		var2239, var3366 = protoModule.writeString(var2239, var2240, self.id)
		buff = var2239
		var2238 = var2240
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2241, var2242 = protoModule.writeTag(buff, var2238, 2, protoModule.wireTypes.lengthDelimited)
		var2241, var3368 = protoModule.writeString(var2241, var2242, self.available_until)
		buff = var2241
		var2238 = var2242
	end
	if self.widget_style ~= nil then
		local var2243 = self.widget_style:encode()
		local var2244, var2245 = protoModule.writeTag(buff, var2238, 3, protoModule.wireTypes.lengthDelimited)
		var2244, var3371 = protoModule.writeBuffer(var2244, var2245, var2243, buffer.len(var2243))
		buff = var2244
		var2238 = var2245
	end
	local buff_1 = buffer.create(var2238)
	buffer.copy(buff_1, 0, buff, 0, var2238)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2238 = t_83.new()
	local var2239 = 0
	while var2239 < buffer.len(p83) do
		local _ = nil
		local var2240 = nil
		local var2241, var2242, var2243 = protoModule.readTag(p83, var2239)
		local var2244 = var2241
		var2240 = var2242
		var2239 = var2243
		
		if var2240 == protoModule.wireTypes.varint then
			local _ = nil
			local var2245, var2246 = protoModule.readVarInt(p83, var2239)
			local _ = var2245
			var2239 = var2246
			continue
		end
		if var2240 == protoModule.wireTypes.lengthDelimited then
			if var2244 == 1 then
				local _ = nil
				local var2247, var2248 = protoModule.readBuffer(p83, var2239)
				var2239 = var2248
				var2238.id = buffer.tostring(var2247)
			elseif var2244 == 2 then
				local _ = nil
				local var2249, var2250 = protoModule.readBuffer(p83, var2239)
				var2239 = var2250
				var2238.available_until = buffer.tostring(var2249)
			elseif var2244 == 3 then
				local _ = nil
				local var2251, var2252 = protoModule.readBuffer(p83, var2239)
				var2239 = var2252
				var2238.widget_style = t.WidgetStyleData.decode(var2251)
			else
				local _ = nil
				local var2253, var2254 = protoModule.readVarInt(p83, var2239)
				var2239 = var2254 + var2253
			end
		elseif var2240 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2255, var2256 = protoModule.readFixed32(p83, var2239)
			local _ = var2255
			var2239 = var2256
		elseif var2240 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2257, var2258 = protoModule.readFixed64(p83, var2239)
			local _ = var2257
			var2239 = var2258
		else
			error("Unsupported wire type: " .. var3375)
		end
	end
	return var2238
end

function t_83:jsonEncode()
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

function t_83:jsonDecode()
	-- upvalues: t_83 (ref), t (ref)
	local var2259 = t_83.new()
	
	if self.id ~= nil then
		var2259.id = self.id
	end
	if self.available_until ~= nil then
		var2259.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2259.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2259.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2259.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2259
end

t_83.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_83
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p84)
	-- upvalues: t_84 (ref)
	return setmetatable({
		entry_map = if p84 == nil or p84.entry_map == nil then {} else p84.entry_map,
		entry_order = if p84 == nil or p84.entry_order == nil then {} else p84.entry_order
	}, t_84)
end

function t_84:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2259 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2260, var2261 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2260, var3399 = protoModule.writeString(var2260, var2261, i)
			local var2262 = v:encode()
			var2261, var3401 = protoModule.writeTag(var2260, var2261, 2, protoModule.wireTypes.lengthDelimited)
			var2261, var3401 = protoModule.writeBuffer(var2261, var3401, var2262, buffer.len(var2262))
			local var2263 = var2261
			local var2264 = var3401
			local var2265, var2266 = protoModule.writeTag(buff, var2259, 1, protoModule.wireTypes.lengthDelimited)
			var2265, var3405 = protoModule.writeBuffer(var2265, var2266, var2263, var2264)
			buff = var2265
			var2259 = var2266
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2267, var2268 = protoModule.writeTag(buff, var2259, 2, protoModule.wireTypes.lengthDelimited)
			var2267, var3407 = protoModule.writeString(var2267, var2268, v)
			buff = var2267
			var2259 = var2268
		end
	end
	local buff_1 = buffer.create(var2259)
	buffer.copy(buff_1, 0, buff, 0, var2259)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2269 = t_84.new()
	local var2270 = 0
	while var2270 < buffer.len(p84) do
		local _ = nil
		local var2271 = nil
		local var2272, var2273, var2274 = protoModule.readTag(p84, var2270)
		local var2275 = var2272
		var2271 = var2273
		var2270 = var2274
		
		if var2271 == protoModule.wireTypes.varint then
			local _ = nil
			local var2276, var2277 = protoModule.readVarInt(p84, var2270)
			local _ = var2276
			var2270 = var2277
			continue
		end
		if var2271 == protoModule.wireTypes.lengthDelimited then
			if var2275 == 1 then
				local _ = nil
				local var2278, var2279 = protoModule.readBuffer(p84, var2270)
				var2270 = var2279
				var2278 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2278)
				var2269.entry_map[var2278.key or ""] = var2278.value or t.FeedEntry.new()
			elseif var2275 == 2 then
				local _ = nil
				local var2280, var2281 = protoModule.readBuffer(p84, var2270)
				var2270 = var2281
				table.insert(var2269.entry_order, buffer.tostring(var2280))
			else
				local _ = nil
				local var2282, var2283 = protoModule.readVarInt(p84, var2270)
				var2270 = var2283 + var2282
			end
		elseif var2271 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2284, var2285 = protoModule.readFixed32(p84, var2270)
			local _ = var2284
			var2270 = var2285
		elseif var2271 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2286, var2287 = protoModule.readFixed64(p84, var2270)
			local _ = var2286
			var2270 = var2287
		else
			error("Unsupported wire type: " .. var3411)
		end
	end
	return var2269
end

function t_84:jsonEncode()
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

function t_84:jsonDecode()
	-- upvalues: t_84 (ref), t (ref)
	local var2288 = t_84.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2288.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2288.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2288.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2288.entry_order = t_1
	end
	return var2288
end

t_84.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_84
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p85)
	-- upvalues: t_85 (ref)
	return setmetatable({
		key = if p85 == nil or p85.key == nil then "" else p85.key,
		value = if p85 == nil or p85.value == nil then nil else p85.value
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2289 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2290, var2291 = protoModule.writeTag(buff, var2289, 1, protoModule.wireTypes.lengthDelimited)
		var2290, var3439 = protoModule.writeString(var2290, var2291, self.key)
		buff = var2290
		var2289 = var2291
	end
	if self.value ~= nil then
		local var2292 = self.value:encode()
		local var2293, var2294 = protoModule.writeTag(buff, var2289, 2, protoModule.wireTypes.lengthDelimited)
		var2293, var3442 = protoModule.writeBuffer(var2293, var2294, var2292, buffer.len(var2292))
		buff = var2293
		var2289 = var2294
	end
	local buff_1 = buffer.create(var2289)
	buffer.copy(buff_1, 0, buff, 0, var2289)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2289 = t_85.new()
	local var2290 = 0
	while var2290 < buffer.len(p85) do
		local _ = nil
		local var2291 = nil
		local var2292, var2293, var2294 = protoModule.readTag(p85, var2290)
		local var2295 = var2292
		var2291 = var2293
		var2290 = var2294
		
		if var2291 == protoModule.wireTypes.varint then
			local _ = nil
			local var2296, var2297 = protoModule.readVarInt(p85, var2290)
			local _ = var2296
			var2290 = var2297
			continue
		end
		if var2291 == protoModule.wireTypes.lengthDelimited then
			if var2295 == 1 then
				local _ = nil
				local var2298, var2299 = protoModule.readBuffer(p85, var2290)
				var2290 = var2299
				var2289.key = buffer.tostring(var2298)
			elseif var2295 == 2 then
				local _ = nil
				local var2300, var2301 = protoModule.readBuffer(p85, var2290)
				var2290 = var2301
				var2289.value = t.FeedEntry.decode(var2300)
			else
				local _ = nil
				local var2302, var2303 = protoModule.readVarInt(p85, var2290)
				var2290 = var2303 + var2302
			end
		elseif var2291 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2304, var2305 = protoModule.readFixed32(p85, var2290)
			local _ = var2304
			var2290 = var2305
		elseif var2291 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2306, var2307 = protoModule.readFixed64(p85, var2290)
			local _ = var2306
			var2290 = var2307
		else
			error("Unsupported wire type: " .. var3446)
		end
	end
	return var2289
end

function t_85:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_85:jsonDecode()
	-- upvalues: t_85 (ref), t (ref)
	local var2308 = t_85.new()
	
	if self.key ~= nil then
		var2308.key = self.key
	end
	if self.value ~= nil then
		var2308.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2308
end

t_85.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_85
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p86)
	-- upvalues: t_86 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p86 == nil or p86.marketplace_catalog_category_items == nil then {} else p86.marketplace_catalog_category_items,
		active_category_id = if p86 == nil or p86.active_category_id == nil then "" else p86.active_category_id,
		active_tooltip_idx = if p86 == nil or p86.active_tooltip_idx == nil then 0 else p86.active_tooltip_idx
	}, t_86)
end

function t_86:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2308 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2309 = v:encode()
			local var2310, var2311 = protoModule.writeTag(buff, var2308, 1, protoModule.wireTypes.lengthDelimited)
			var2310, var3469 = protoModule.writeBuffer(var2310, var2311, var2309, buffer.len(var2309))
			buff = var2310
			var2308 = var2311
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2312, var2313 = protoModule.writeTag(buff, var2308, 2, protoModule.wireTypes.lengthDelimited)
		var2312, var3471 = protoModule.writeString(var2312, var2313, self.active_category_id)
		buff = var2312
		var2308 = var2313
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2314, var2315 = protoModule.writeTag(buff, var2308, 3, protoModule.wireTypes.varint)
		var2314, var3473 = protoModule.writeVarInt(var2314, var2315, self.active_tooltip_idx)
		buff = var2314
		var2308 = var2315
	end
	local buff_1 = buffer.create(var2308)
	buffer.copy(buff_1, 0, buff, 0, var2308)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2316 = t_86.new()
	local var2317 = 0
	while var2317 < buffer.len(p86) do
		local _ = nil
		local var2318 = nil
		local var2319, var2320, var2321 = protoModule.readTag(p86, var2317)
		local var2322 = var2319
		var2318 = var2320
		var2317 = var2321
		
		if var2318 == protoModule.wireTypes.varint then
			if var2322 == 3 then
				local _ = nil
				local var2323, var2324 = protoModule.readVarIntI64(p86, var2317)
				var2317 = var2324
				var2316.active_tooltip_idx = var2323
			else
				local _ = nil
				local var2325, var2326 = protoModule.readVarInt(p86, var2317)
				local _ = var2325
				var2317 = var2326
			end
		end
		if var2318 == protoModule.wireTypes.lengthDelimited then
			if var2322 == 1 then
				local _ = nil
				local var2327, var2328 = protoModule.readBuffer(p86, var2317)
				var2317 = var2328
				table.insert(var2316.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2327))
			elseif var2322 == 2 then
				local _ = nil
				local var2329, var2330 = protoModule.readBuffer(p86, var2317)
				var2317 = var2330
				var2316.active_category_id = buffer.tostring(var2329)
			else
				local _ = nil
				local var2331, var2332 = protoModule.readVarInt(p86, var2317)
				var2317 = var2332 + var2331
			end
		elseif var2318 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2333, var2334 = protoModule.readFixed32(p86, var2317)
			local _ = var2333
			var2317 = var2334
		elseif var2318 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2335, var2336 = protoModule.readFixed64(p86, var2317)
			local _ = var2335
			var2317 = var2336
		else
			error("Unsupported wire type: " .. var3477)
		end
	end
	return var2316
end

function t_86:jsonEncode()
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

function t_86:jsonDecode()
	-- upvalues: t_86 (ref), t (ref)
	local var2337 = t_86.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2337.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2337.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2337.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2337.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2337.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2337.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2337
end

t_86.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_86
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p87)
	-- upvalues: t_87 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p87 == nil or p87.marketplace_catalog_category_item_id == nil then "" else p87.marketplace_catalog_category_item_id
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2338 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2339, var2340 = protoModule.writeTag(buff, var2338, 1, protoModule.wireTypes.lengthDelimited)
		var2339, var3504 = protoModule.writeString(var2339, var2340, self.marketplace_catalog_category_item_id)
		buff = var2339
		var2338 = var2340
	end
	local buff_1 = buffer.create(var2338)
	buffer.copy(buff_1, 0, buff, 0, var2338)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref)
	local var2338 = t_87.new()
	local var2339 = 0
	while var2339 < buffer.len(p87) do
		local _ = nil
		local var2340 = nil
		local var2341, var2342, var2343 = protoModule.readTag(p87, var2339)
		local var2344 = var2341
		var2340 = var2342
		var2339 = var2343
		
		if var2340 == protoModule.wireTypes.varint then
			local _ = nil
			local var2345, var2346 = protoModule.readVarInt(p87, var2339)
			local _ = var2345
			var2339 = var2346
			continue
		end
		if var2340 == protoModule.wireTypes.lengthDelimited then
			if var2344 == 1 then
				local _ = nil
				local var2347, var2348 = protoModule.readBuffer(p87, var2339)
				var2339 = var2348
				var2338.marketplace_catalog_category_item_id = buffer.tostring(var2347)
			else
				local _ = nil
				local var2349, var2350 = protoModule.readVarInt(p87, var2339)
				var2339 = var2350 + var2349
			end
		elseif var2340 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2351, var2352 = protoModule.readFixed32(p87, var2339)
			local _ = var2351
			var2339 = var2352
		elseif var2340 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2353, var2354 = protoModule.readFixed64(p87, var2339)
			local _ = var2353
			var2339 = var2354
		else
			error("Unsupported wire type: " .. var3508)
		end
	end
	return var2338
end

function t_87:jsonEncode()
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_87:jsonDecode()
	-- upvalues: t_87 (ref)
	local var2355 = t_87.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2355.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2355.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2355
end

t_87.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_87
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p88)
	-- upvalues: t_88 (ref)
	return setmetatable({
		hero_icon = if p88 == nil or p88.hero_icon == nil then nil else p88.hero_icon,
		body_dismiss_button_text = if p88 == nil or p88.body_dismiss_button_text == nil then "" else p88.body_dismiss_button_text,
		body_title = if p88 == nil or p88.body_title == nil then "" else p88.body_title,
		body_rich_text = if p88 == nil or p88.body_rich_text == nil then "" else p88.body_rich_text,
		terms_link_text = if p88 == nil or p88.terms_link_text == nil then nil else p88.terms_link_text,
		terms_title = if p88 == nil or p88.terms_title == nil then nil else p88.terms_title,
		terms_body_rich_text = if p88 == nil or p88.terms_body_rich_text == nil then nil else p88.terms_body_rich_text,
		terms_dismiss_button_text = if p88 == nil or p88.terms_dismiss_button_text == nil then nil else p88.terms_dismiss_button_text,
		offer_id = if p88 == nil or p88.offer_id == nil then "" else p88.offer_id
	}, t_88)
end

function t_88:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2355 = 0
	
	if self.hero_icon ~= nil then
		local var2356, var2357 = protoModule.writeTag(buff, var2355, 1, protoModule.wireTypes.lengthDelimited)
		var2356, var3528 = protoModule.writeString(var2356, var2357, self.hero_icon)
		buff = var2356
		var2355 = var2357
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2358, var2359 = protoModule.writeTag(buff, var2355, 2, protoModule.wireTypes.lengthDelimited)
		var2358, var3530 = protoModule.writeString(var2358, var2359, self.body_dismiss_button_text)
		buff = var2358
		var2355 = var2359
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2360, var2361 = protoModule.writeTag(buff, var2355, 3, protoModule.wireTypes.lengthDelimited)
		var2360, var3532 = protoModule.writeString(var2360, var2361, self.body_title)
		buff = var2360
		var2355 = var2361
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2362, var2363 = protoModule.writeTag(buff, var2355, 4, protoModule.wireTypes.lengthDelimited)
		var2362, var3534 = protoModule.writeString(var2362, var2363, self.body_rich_text)
		buff = var2362
		var2355 = var2363
	end
	if self.terms_link_text ~= nil then
		local var2364, var2365 = protoModule.writeTag(buff, var2355, 5, protoModule.wireTypes.lengthDelimited)
		var2364, var3536 = protoModule.writeString(var2364, var2365, self.terms_link_text)
		buff = var2364
		var2355 = var2365
	end
	if self.terms_title ~= nil then
		local var2366, var2367 = protoModule.writeTag(buff, var2355, 6, protoModule.wireTypes.lengthDelimited)
		var2366, var3538 = protoModule.writeString(var2366, var2367, self.terms_title)
		buff = var2366
		var2355 = var2367
	end
	if self.terms_body_rich_text ~= nil then
		local var2368, var2369 = protoModule.writeTag(buff, var2355, 7, protoModule.wireTypes.lengthDelimited)
		var2368, var3540 = protoModule.writeString(var2368, var2369, self.terms_body_rich_text)
		buff = var2368
		var2355 = var2369
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2370, var2371 = protoModule.writeTag(buff, var2355, 8, protoModule.wireTypes.lengthDelimited)
		var2370, var3542 = protoModule.writeString(var2370, var2371, self.terms_dismiss_button_text)
		buff = var2370
		var2355 = var2371
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2372, var2373 = protoModule.writeTag(buff, var2355, 9, protoModule.wireTypes.lengthDelimited)
		var2372, var3544 = protoModule.writeString(var2372, var2373, self.offer_id)
		buff = var2372
		var2355 = var2373
	end
	local buff_1 = buffer.create(var2355)
	buffer.copy(buff_1, 0, buff, 0, var2355)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref)
	local var2355 = t_88.new()
	local var2356 = 0
	while var2356 < buffer.len(p88) do
		local _ = nil
		local var2357 = nil
		local var2358, var2359, var2360 = protoModule.readTag(p88, var2356)
		local var2361 = var2358
		var2357 = var2359
		var2356 = var2360
		
		if var2357 == protoModule.wireTypes.varint then
			local _ = nil
			local var2362, var2363 = protoModule.readVarInt(p88, var2356)
			local _ = var2362
			var2356 = var2363
			continue
		end
		if var2357 == protoModule.wireTypes.lengthDelimited then
			if var2361 == 1 then
				local _ = nil
				local var2364, var2365 = protoModule.readBuffer(p88, var2356)
				var2356 = var2365
				var2355.hero_icon = buffer.tostring(var2364)
			elseif var2361 == 2 then
				local _ = nil
				local var2366, var2367 = protoModule.readBuffer(p88, var2356)
				var2356 = var2367
				var2355.body_dismiss_button_text = buffer.tostring(var2366)
			elseif var2361 == 3 then
				local _ = nil
				local var2368, var2369 = protoModule.readBuffer(p88, var2356)
				var2356 = var2369
				var2355.body_title = buffer.tostring(var2368)
			elseif var2361 == 4 then
				local _ = nil
				local var2370, var2371 = protoModule.readBuffer(p88, var2356)
				var2356 = var2371
				var2355.body_rich_text = buffer.tostring(var2370)
			elseif var2361 == 5 then
				local _ = nil
				local var2372, var2373 = protoModule.readBuffer(p88, var2356)
				var2356 = var2373
				var2355.terms_link_text = buffer.tostring(var2372)
			elseif var2361 == 6 then
				local _ = nil
				local var2374, var2375 = protoModule.readBuffer(p88, var2356)
				var2356 = var2375
				var2355.terms_title = buffer.tostring(var2374)
			elseif var2361 == 7 then
				local _ = nil
				local var2376, var2377 = protoModule.readBuffer(p88, var2356)
				var2356 = var2377
				var2355.terms_body_rich_text = buffer.tostring(var2376)
			elseif var2361 == 8 then
				local _ = nil
				local var2378, var2379 = protoModule.readBuffer(p88, var2356)
				var2356 = var2379
				var2355.terms_dismiss_button_text = buffer.tostring(var2378)
			elseif var2361 == 9 then
				local _ = nil
				local var2380, var2381 = protoModule.readBuffer(p88, var2356)
				var2356 = var2381
				var2355.offer_id = buffer.tostring(var2380)
			else
				local _ = nil
				local var2382, var2383 = protoModule.readVarInt(p88, var2356)
				var2356 = var2383 + var2382
			end
		elseif var2357 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2384, var2385 = protoModule.readFixed32(p88, var2356)
			local _ = var2384
			var2356 = var2385
		elseif var2357 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2386, var2387 = protoModule.readFixed64(p88, var2356)
			local _ = var2386
			var2356 = var2387
		else
			error("Unsupported wire type: " .. var3548)
		end
	end
	return var2355
end

function t_88:jsonEncode()
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

function t_88:jsonDecode()
	-- upvalues: t_88 (ref)
	local var2388 = t_88.new()
	
	if self.hero_icon ~= nil then
		var2388.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2388.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2388.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2388.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2388.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2388.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2388.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2388.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2388.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2388.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2388.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2388.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2388.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2388.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2388.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2388.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2388.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2388.offer_id = self.offerId
	end
	return var2388
end

t_88.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_88
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p89)
	-- upvalues: t_89 (ref)
	return setmetatable({
		items = if p89 == nil or p89.items == nil then {} else p89.items,
		preview_columns = if p89 == nil or p89.preview_columns == nil then 0 else p89.preview_columns,
		impression_id = if p89 == nil or p89.impression_id == nil then "" else p89.impression_id
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2388 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2389 = v:encode()
			local var2390, var2391 = protoModule.writeTag(buff, var2388, 1, protoModule.wireTypes.lengthDelimited)
			var2390, var3585 = protoModule.writeBuffer(var2390, var2391, var2389, buffer.len(var2389))
			buff = var2390
			var2388 = var2391
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2392, var2393 = protoModule.writeTag(buff, var2388, 2, protoModule.wireTypes.varint)
		var2392, var3587 = protoModule.writeVarInt(var2392, var2393, self.preview_columns)
		buff = var2392
		var2388 = var2393
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2394, var2395 = protoModule.writeTag(buff, var2388, 3, protoModule.wireTypes.lengthDelimited)
		var2394, var3589 = protoModule.writeString(var2394, var2395, self.impression_id)
		buff = var2394
		var2388 = var2395
	end
	local buff_1 = buffer.create(var2388)
	buffer.copy(buff_1, 0, buff, 0, var2388)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var2396 = t_89.new()
	local var2397 = 0
	while var2397 < buffer.len(p89) do
		local _ = nil
		local var2398 = nil
		local var2399, var2400, var2401 = protoModule.readTag(p89, var2397)
		local var2402 = var2399
		var2398 = var2400
		var2397 = var2401
		
		if var2398 == protoModule.wireTypes.varint then
			if var2402 == 2 then
				local _ = nil
				local var2403, var2404 = protoModule.readVarIntI32(p89, var2397)
				var2397 = var2404
				var2396.preview_columns = var2403
			else
				local _ = nil
				local var2405, var2406 = protoModule.readVarInt(p89, var2397)
				local _ = var2405
				var2397 = var2406
			end
		end
		if var2398 == protoModule.wireTypes.lengthDelimited then
			if var2402 == 1 then
				local _ = nil
				local var2407, var2408 = protoModule.readBuffer(p89, var2397)
				var2397 = var2408
				table.insert(var2396.items, t.CatalogItemGridInputData_CatalogItem.decode(var2407))
			elseif var2402 == 3 then
				local _ = nil
				local var2409, var2410 = protoModule.readBuffer(p89, var2397)
				var2397 = var2410
				var2396.impression_id = buffer.tostring(var2409)
			else
				local _ = nil
				local var2411, var2412 = protoModule.readVarInt(p89, var2397)
				var2397 = var2412 + var2411
			end
		elseif var2398 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2413, var2414 = protoModule.readFixed32(p89, var2397)
			local _ = var2413
			var2397 = var2414
		elseif var2398 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2415, var2416 = protoModule.readFixed64(p89, var2397)
			local _ = var2415
			var2397 = var2416
		else
			error("Unsupported wire type: " .. var3593)
		end
	end
	return var2396
end

function t_89:jsonEncode()
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

function t_89:jsonDecode()
	-- upvalues: t_89 (ref), t (ref)
	local var2417 = t_89.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2417.items = t_1
	end
	if self.preview_columns ~= nil then
		var2417.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2417.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2417.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2417.impression_id = self.impressionId
	end
	return var2417
end

t_89.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_89
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p90)
	-- upvalues: t_90 (ref)
	return setmetatable({
		id = if p90 == nil or p90.id == nil then "" else p90.id,
		type = if p90 == nil or p90.type == nil then "" else p90.type
	}, t_90)
end

function t_90:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2418 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2419, var2420 = protoModule.writeTag(buff, var2418, 1, protoModule.wireTypes.lengthDelimited)
		var2419, var3619 = protoModule.writeString(var2419, var2420, self.id)
		buff = var2419
		var2418 = var2420
	end
	if self.type ~= nil and self.type ~= "" then
		local var2421, var2422 = protoModule.writeTag(buff, var2418, 2, protoModule.wireTypes.lengthDelimited)
		var2421, var3621 = protoModule.writeString(var2421, var2422, self.type)
		buff = var2421
		var2418 = var2422
	end
	local buff_1 = buffer.create(var2418)
	buffer.copy(buff_1, 0, buff, 0, var2418)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2418 = t_90.new()
	local var2419 = 0
	while var2419 < buffer.len(p90) do
		local _ = nil
		local var2420 = nil
		local var2421, var2422, var2423 = protoModule.readTag(p90, var2419)
		local var2424 = var2421
		var2420 = var2422
		var2419 = var2423
		
		if var2420 == protoModule.wireTypes.varint then
			local _ = nil
			local var2425, var2426 = protoModule.readVarInt(p90, var2419)
			local _ = var2425
			var2419 = var2426
			continue
		end
		if var2420 == protoModule.wireTypes.lengthDelimited then
			if var2424 == 1 then
				local _ = nil
				local var2427, var2428 = protoModule.readBuffer(p90, var2419)
				var2419 = var2428
				var2418.id = buffer.tostring(var2427)
			elseif var2424 == 2 then
				local _ = nil
				local var2429, var2430 = protoModule.readBuffer(p90, var2419)
				var2419 = var2430
				var2418.type = buffer.tostring(var2429)
			else
				local _ = nil
				local var2431, var2432 = protoModule.readVarInt(p90, var2419)
				var2419 = var2432 + var2431
			end
		elseif var2420 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2433, var2434 = protoModule.readFixed32(p90, var2419)
			local _ = var2433
			var2419 = var2434
		elseif var2420 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2435, var2436 = protoModule.readFixed64(p90, var2419)
			local _ = var2435
			var2419 = var2436
		else
			error("Unsupported wire type: " .. var3625)
		end
	end
	return var2418
end

function t_90:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_90:jsonDecode()
	-- upvalues: t_90 (ref)
	local var2437 = t_90.new()
	
	if self.id ~= nil then
		var2437.id = self.id
	end
	if self.type ~= nil then
		var2437.type = self.type
	end
	return var2437
end

t_90.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_90
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p91)
	-- upvalues: t_91 (ref)
	return setmetatable({
		entry_map = if p91 == nil or p91.entry_map == nil then {} else p91.entry_map,
		entry_order = if p91 == nil or p91.entry_order == nil then {} else p91.entry_order,
		content_pools = if p91 == nil or p91.content_pools == nil then {} else p91.content_pools,
		search_session_id = if p91 == nil or p91.search_session_id == nil then "" else p91.search_session_id
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2437 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2438, var2439 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2438, var3647 = protoModule.writeString(var2438, var2439, i)
			local var2440 = v:encode()
			var2439, var3649 = protoModule.writeTag(var2438, var2439, 2, protoModule.wireTypes.lengthDelimited)
			var2439, var3649 = protoModule.writeBuffer(var2439, var3649, var2440, buffer.len(var2440))
			local var2441 = var2439
			local var2442 = var3649
			local var2443, var2444 = protoModule.writeTag(buff, var2437, 1, protoModule.wireTypes.lengthDelimited)
			var2443, var3653 = protoModule.writeBuffer(var2443, var2444, var2441, var2442)
			buff = var2443
			var2437 = var2444
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2445, var2446 = protoModule.writeTag(buff, var2437, 2, protoModule.wireTypes.lengthDelimited)
			var2445, var3655 = protoModule.writeString(var2445, var2446, v)
			buff = var2445
			var2437 = var2446
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2447, var2448 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2447, var3657 = protoModule.writeString(var2447, var2448, i)
			local var2449 = v:encode()
			var2448, var3659 = protoModule.writeTag(var2447, var2448, 2, protoModule.wireTypes.lengthDelimited)
			var2448, var3659 = protoModule.writeBuffer(var2448, var3659, var2449, buffer.len(var2449))
			local var2450 = var2448
			local var2451 = var3659
			local var2452, var2453 = protoModule.writeTag(buff, var2437, 3, protoModule.wireTypes.lengthDelimited)
			var2452, var3663 = protoModule.writeBuffer(var2452, var2453, var2450, var2451)
			buff = var2452
			var2437 = var2453
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2454, var2455 = protoModule.writeTag(buff, var2437, 4, protoModule.wireTypes.lengthDelimited)
		var2454, var3665 = protoModule.writeString(var2454, var2455, self.search_session_id)
		buff = var2454
		var2437 = var2455
	end
	local buff_1 = buffer.create(var2437)
	buffer.copy(buff_1, 0, buff, 0, var2437)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var2456 = t_91.new()
	local var2457 = 0
	while var2457 < buffer.len(p91) do
		local _ = nil
		local var2458 = nil
		local var2459, var2460, var2461 = protoModule.readTag(p91, var2457)
		local var2462 = var2459
		var2458 = var2460
		var2457 = var2461
		
		if var2458 == protoModule.wireTypes.varint then
			local _ = nil
			local var2463, var2464 = protoModule.readVarInt(p91, var2457)
			local _ = var2463
			var2457 = var2464
			continue
		end
		if var2458 == protoModule.wireTypes.lengthDelimited then
			if var2462 == 1 then
				local _ = nil
				local var2465, var2466 = protoModule.readBuffer(p91, var2457)
				var2457 = var2466
				var2465 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2465)
				var2456.entry_map[var2465.key or ""] = var2465.value or t.FeedEntry.new()
			elseif var2462 == 2 then
				local _ = nil
				local var2467, var2468 = protoModule.readBuffer(p91, var2457)
				var2457 = var2468
				table.insert(var2456.entry_order, buffer.tostring(var2467))
			elseif var2462 == 3 then
				local _ = nil
				local var2469, var2470 = protoModule.readBuffer(p91, var2457)
				var2457 = var2470
				var2469 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2469)
				var2456.content_pools[var2469.key or ""] = var2469.value or t.ContentPool.new()
			elseif var2462 == 4 then
				local _ = nil
				local var2471, var2472 = protoModule.readBuffer(p91, var2457)
				var2457 = var2472
				var2456.search_session_id = buffer.tostring(var2471)
			else
				local _ = nil
				local var2473, var2474 = protoModule.readVarInt(p91, var2457)
				var2457 = var2474 + var2473
			end
		elseif var2458 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2475, var2476 = protoModule.readFixed32(p91, var2457)
			local _ = var2475
			var2457 = var2476
		elseif var2458 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2477, var2478 = protoModule.readFixed64(p91, var2457)
			local _ = var2477
			var2457 = var2478
		else
			error("Unsupported wire type: " .. var3669)
		end
	end
	return var2456
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

function t_91:jsonDecode()
	-- upvalues: t_91 (ref), t (ref)
	local var2479 = t_91.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2479.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2479.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2479.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2479.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2479.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2479.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2479.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2479.search_session_id = self.searchSessionId
	end
	return var2479
end

t_91.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_91
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
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
	local var2480 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2481, var2482 = protoModule.writeTag(buff, var2480, 1, protoModule.wireTypes.lengthDelimited)
		var2481, var3704 = protoModule.writeString(var2481, var2482, self.key)
		buff = var2481
		var2480 = var2482
	end
	if self.value ~= nil then
		local var2483 = self.value:encode()
		local var2484, var2485 = protoModule.writeTag(buff, var2480, 2, protoModule.wireTypes.lengthDelimited)
		var2484, var3707 = protoModule.writeBuffer(var2484, var2485, var2483, buffer.len(var2483))
		buff = var2484
		var2480 = var2485
	end
	local buff_1 = buffer.create(var2480)
	buffer.copy(buff_1, 0, buff, 0, var2480)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var2480 = t_92.new()
	local var2481 = 0
	while var2481 < buffer.len(p92) do
		local _ = nil
		local var2482 = nil
		local var2483, var2484, var2485 = protoModule.readTag(p92, var2481)
		local var2486 = var2483
		var2482 = var2484
		var2481 = var2485
		
		if var2482 == protoModule.wireTypes.varint then
			local _ = nil
			local var2487, var2488 = protoModule.readVarInt(p92, var2481)
			local _ = var2487
			var2481 = var2488
			continue
		end
		if var2482 == protoModule.wireTypes.lengthDelimited then
			if var2486 == 1 then
				local _ = nil
				local var2489, var2490 = protoModule.readBuffer(p92, var2481)
				var2481 = var2490
				var2480.key = buffer.tostring(var2489)
			elseif var2486 == 2 then
				local _ = nil
				local var2491, var2492 = protoModule.readBuffer(p92, var2481)
				var2481 = var2492
				var2480.value = t.FeedEntry.decode(var2491)
			else
				local _ = nil
				local var2493, var2494 = protoModule.readVarInt(p92, var2481)
				var2481 = var2494 + var2493
			end
		elseif var2482 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2495, var2496 = protoModule.readFixed32(p92, var2481)
			local _ = var2495
			var2481 = var2496
		elseif var2482 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2497, var2498 = protoModule.readFixed64(p92, var2481)
			local _ = var2497
			var2481 = var2498
		else
			error("Unsupported wire type: " .. var3711)
		end
	end
	return var2480
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
	local var2499 = t_92.new()
	
	if self.key ~= nil then
		var2499.key = self.key
	end
	if self.value ~= nil then
		var2499.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2499
end

t_92.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_92
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p93)
	-- upvalues: t_93 (ref)
	return setmetatable({
		key = if p93 == nil or p93.key == nil then "" else p93.key,
		value = if p93 == nil or p93.value == nil then nil else p93.value
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2499 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2500, var2501 = protoModule.writeTag(buff, var2499, 1, protoModule.wireTypes.lengthDelimited)
		var2500, var3733 = protoModule.writeString(var2500, var2501, self.key)
		buff = var2500
		var2499 = var2501
	end
	if self.value ~= nil then
		local var2502 = self.value:encode()
		local var2503, var2504 = protoModule.writeTag(buff, var2499, 2, protoModule.wireTypes.lengthDelimited)
		var2503, var3736 = protoModule.writeBuffer(var2503, var2504, var2502, buffer.len(var2502))
		buff = var2503
		var2499 = var2504
	end
	local buff_1 = buffer.create(var2499)
	buffer.copy(buff_1, 0, buff, 0, var2499)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2499 = t_93.new()
	local var2500 = 0
	while var2500 < buffer.len(p93) do
		local _ = nil
		local var2501 = nil
		local var2502, var2503, var2504 = protoModule.readTag(p93, var2500)
		local var2505 = var2502
		var2501 = var2503
		var2500 = var2504
		
		if var2501 == protoModule.wireTypes.varint then
			local _ = nil
			local var2506, var2507 = protoModule.readVarInt(p93, var2500)
			local _ = var2506
			var2500 = var2507
			continue
		end
		if var2501 == protoModule.wireTypes.lengthDelimited then
			if var2505 == 1 then
				local _ = nil
				local var2508, var2509 = protoModule.readBuffer(p93, var2500)
				var2500 = var2509
				var2499.key = buffer.tostring(var2508)
			elseif var2505 == 2 then
				local _ = nil
				local var2510, var2511 = protoModule.readBuffer(p93, var2500)
				var2500 = var2511
				var2499.value = t.ContentPool.decode(var2510)
			else
				local _ = nil
				local var2512, var2513 = protoModule.readVarInt(p93, var2500)
				var2500 = var2513 + var2512
			end
		elseif var2501 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2514, var2515 = protoModule.readFixed32(p93, var2500)
			local _ = var2514
			var2500 = var2515
		elseif var2501 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2516, var2517 = protoModule.readFixed64(p93, var2500)
			local _ = var2516
			var2500 = var2517
		else
			error("Unsupported wire type: " .. var3740)
		end
	end
	return var2499
end

function t_93:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_93:jsonDecode()
	-- upvalues: t_93 (ref), t (ref)
	local var2518 = t_93.new()
	
	if self.key ~= nil then
		var2518.key = self.key
	end
	if self.value ~= nil then
		var2518.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2518
end

t_93.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_93
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p94)
	-- upvalues: t_94 (ref)
	return setmetatable({
		universe_id = if p94 == nil or p94.universe_id == nil then "" else p94.universe_id,
		is_content_locked = if p94 == nil or p94.is_content_locked == nil then false else p94.is_content_locked
	}, t_94)
end

function t_94:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2518 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2519, var2520 = protoModule.writeTag(buff, var2518, 1, protoModule.wireTypes.lengthDelimited)
		var2519, var3762 = protoModule.writeString(var2519, var2520, self.universe_id)
		buff = var2519
		var2518 = var2520
	end
	if self.is_content_locked then
		local var2521, var2522 = protoModule.writeTag(buff, var2518, 2, protoModule.wireTypes.varint)
		var2521, var3764 = protoModule.writeVarInt(var2521, var2522, if self.is_content_locked then 1 else 0)
		buff = var2521
		var2518 = var2522
	end
	local buff_1 = buffer.create(var2518)
	buffer.copy(buff_1, 0, buff, 0, var2518)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref)
	local var2518 = t_94.new()
	local var2519 = 0
	while var2519 < buffer.len(p94) do
		local _ = nil
		local var2520 = nil
		local var2521, var2522, var2523 = protoModule.readTag(p94, var2519)
		local var2524 = var2521
		var2520 = var2522
		var2519 = var2523
		
		if var2520 == protoModule.wireTypes.varint then
			if var2524 == 2 then
				local _ = nil
				local var2525, var2526 = protoModule.readVarInt(p94, var2519)
				var2519 = var2526
				var2518.is_content_locked = var2525 ~= 0
			else
				local _ = nil
				local var2527, var2528 = protoModule.readVarInt(p94, var2519)
				local _ = var2527
				var2519 = var2528
			end
		end
		if var2520 == protoModule.wireTypes.lengthDelimited then
			if var2524 == 1 then
				local _ = nil
				local var2529, var2530 = protoModule.readBuffer(p94, var2519)
				var2519 = var2530
				var2518.universe_id = buffer.tostring(var2529)
			else
				local _ = nil
				local var2531, var2532 = protoModule.readVarInt(p94, var2519)
				var2519 = var2532 + var2531
			end
		elseif var2520 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2533, var2534 = protoModule.readFixed32(p94, var2519)
			local _ = var2533
			var2519 = var2534
		elseif var2520 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2535, var2536 = protoModule.readFixed64(p94, var2519)
			local _ = var2535
			var2519 = var2536
		else
			error("Unsupported wire type: " .. var3768)
		end
	end
	return var2518
end

function t_94:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_94:jsonDecode()
	-- upvalues: t_94 (ref)
	local var2537 = t_94.new()
	
	if self.universe_id ~= nil then
		var2537.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2537.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2537.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2537.is_content_locked = self.isContentLocked
	end
	return var2537
end

t_94.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_94
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p95)
	-- upvalues: t_95 (ref)
	return setmetatable({
		overview_rich_text = if p95 == nil or p95.overview_rich_text == nil then "" else p95.overview_rich_text,
		result_entry = if p95 == nil or p95.result_entry == nil then nil else p95.result_entry,
		follow_up_queries = if p95 == nil or p95.follow_up_queries == nil then {} else p95.follow_up_queries,
		show_loading = if p95 == nil or p95.show_loading == nil then false else p95.show_loading,
		title = if p95 == nil or p95.title == nil then "" else p95.title,
		search_query = if p95 == nil or p95.search_query == nil then "" else p95.search_query,
		universe_ids = if p95 == nil or p95.universe_ids == nil then "" else p95.universe_ids
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2537 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2538, var2539 = protoModule.writeTag(buff, var2537, 1, protoModule.wireTypes.lengthDelimited)
		var2538, var3790 = protoModule.writeString(var2538, var2539, self.overview_rich_text)
		buff = var2538
		var2537 = var2539
	end
	if self.result_entry ~= nil then
		local var2540 = self.result_entry:encode()
		local var2541, var2542 = protoModule.writeTag(buff, var2537, 2, protoModule.wireTypes.lengthDelimited)
		var2541, var3793 = protoModule.writeBuffer(var2541, var2542, var2540, buffer.len(var2540))
		buff = var2541
		var2537 = var2542
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2543, var2544 = protoModule.writeTag(buff, var2537, 3, protoModule.wireTypes.lengthDelimited)
			var2543, var3795 = protoModule.writeString(var2543, var2544, v)
			buff = var2543
			var2537 = var2544
		end
	end
	if self.show_loading then
		local var2545, var2546 = protoModule.writeTag(buff, var2537, 4, protoModule.wireTypes.varint)
		var2545, var3797 = protoModule.writeVarInt(var2545, var2546, if self.show_loading then 1 else 0)
		buff = var2545
		var2537 = var2546
	end
	if self.title ~= nil and self.title ~= "" then
		local var2547, var2548 = protoModule.writeTag(buff, var2537, 5, protoModule.wireTypes.lengthDelimited)
		var2547, var3799 = protoModule.writeString(var2547, var2548, self.title)
		buff = var2547
		var2537 = var2548
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2549, var2550 = protoModule.writeTag(buff, var2537, 6, protoModule.wireTypes.lengthDelimited)
		var2549, var3801 = protoModule.writeString(var2549, var2550, self.search_query)
		buff = var2549
		var2537 = var2550
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2551, var2552 = protoModule.writeTag(buff, var2537, 8, protoModule.wireTypes.lengthDelimited)
		var2551, var3803 = protoModule.writeString(var2551, var2552, self.universe_ids)
		buff = var2551
		var2537 = var2552
	end
	local buff_1 = buffer.create(var2537)
	buffer.copy(buff_1, 0, buff, 0, var2537)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2553 = t_95.new()
	local var2554 = 0
	while var2554 < buffer.len(p95) do
		local _ = nil
		local var2555 = nil
		local var2556, var2557, var2558 = protoModule.readTag(p95, var2554)
		local var2559 = var2556
		var2555 = var2557
		var2554 = var2558
		
		if var2555 == protoModule.wireTypes.varint then
			if var2559 == 4 then
				local _ = nil
				local var2560, var2561 = protoModule.readVarInt(p95, var2554)
				var2554 = var2561
				var2553.show_loading = var2560 ~= 0
			else
				local _ = nil
				local var2562, var2563 = protoModule.readVarInt(p95, var2554)
				local _ = var2562
				var2554 = var2563
			end
		end
		if var2555 == protoModule.wireTypes.lengthDelimited then
			if var2559 == 1 then
				local _ = nil
				local var2564, var2565 = protoModule.readBuffer(p95, var2554)
				var2554 = var2565
				var2553.overview_rich_text = buffer.tostring(var2564)
			elseif var2559 == 2 then
				local _ = nil
				local var2566, var2567 = protoModule.readBuffer(p95, var2554)
				var2554 = var2567
				var2553.result_entry = t.FeedEntry.decode(var2566)
			elseif var2559 == 3 then
				local _ = nil
				local var2568, var2569 = protoModule.readBuffer(p95, var2554)
				var2554 = var2569
				table.insert(var2553.follow_up_queries, buffer.tostring(var2568))
			elseif var2559 == 5 then
				local _ = nil
				local var2570, var2571 = protoModule.readBuffer(p95, var2554)
				var2554 = var2571
				var2553.title = buffer.tostring(var2570)
			elseif var2559 == 6 then
				local _ = nil
				local var2572, var2573 = protoModule.readBuffer(p95, var2554)
				var2554 = var2573
				var2553.search_query = buffer.tostring(var2572)
			elseif var2559 == 8 then
				local _ = nil
				local var2574, var2575 = protoModule.readBuffer(p95, var2554)
				var2554 = var2575
				var2553.universe_ids = buffer.tostring(var2574)
			else
				local _ = nil
				local var2576, var2577 = protoModule.readVarInt(p95, var2554)
				var2554 = var2577 + var2576
			end
		elseif var2555 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2578, var2579 = protoModule.readFixed32(p95, var2554)
			local _ = var2578
			var2554 = var2579
		elseif var2555 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2580, var2581 = protoModule.readFixed64(p95, var2554)
			local _ = var2580
			var2554 = var2581
		else
			error("Unsupported wire type: " .. var3807)
		end
	end
	return var2553
end

function t_95:jsonEncode()
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

function t_95:jsonDecode()
	-- upvalues: t_95 (ref), t (ref)
	local var2582 = t_95.new()
	
	if self.overview_rich_text ~= nil then
		var2582.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2582.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2582.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2582.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2582.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2582.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2582.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2582.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2582.title = self.title
	end
	if self.search_query ~= nil then
		var2582.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2582.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2582.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2582.universe_ids = self.universeIds
	end
	return var2582
end

t_95.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_95
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p96)
	-- upvalues: t_96 (ref)
	return setmetatable({
		title = if p96 == nil or p96.title == nil then "" else p96.title,
		user_items = if p96 == nil or p96.user_items == nil then {} else p96.user_items,
		max_visible_rows = if p96 == nil or p96.max_visible_rows == nil then 0 else p96.max_visible_rows,
		sort_id = if p96 == nil or p96.sort_id == nil then nil else p96.sort_id
	}, t_96)
end

function t_96:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2583 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2584, var2585 = protoModule.writeTag(buff, var2583, 1, protoModule.wireTypes.lengthDelimited)
		var2584, var3842 = protoModule.writeString(var2584, var2585, self.title)
		buff = var2584
		var2583 = var2585
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2586 = v:encode()
			local var2587, var2588 = protoModule.writeTag(buff, var2583, 2, protoModule.wireTypes.lengthDelimited)
			var2587, var3845 = protoModule.writeBuffer(var2587, var2588, var2586, buffer.len(var2586))
			buff = var2587
			var2583 = var2588
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2589, var2590 = protoModule.writeTag(buff, var2583, 3, protoModule.wireTypes.varint)
		var2589, var3847 = protoModule.writeVarInt(var2589, var2590, self.max_visible_rows)
		buff = var2589
		var2583 = var2590
	end
	if self.sort_id ~= nil then
		local var2591, var2592 = protoModule.writeTag(buff, var2583, 4, protoModule.wireTypes.lengthDelimited)
		var2591, var3849 = protoModule.writeString(var2591, var2592, self.sort_id)
		buff = var2591
		var2583 = var2592
	end
	local buff_1 = buffer.create(var2583)
	buffer.copy(buff_1, 0, buff, 0, var2583)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var2593 = t_96.new()
	local var2594 = 0
	while var2594 < buffer.len(p96) do
		local _ = nil
		local var2595 = nil
		local var2596, var2597, var2598 = protoModule.readTag(p96, var2594)
		local var2599 = var2596
		var2595 = var2597
		var2594 = var2598
		
		if var2595 == protoModule.wireTypes.varint then
			if var2599 == 3 then
				local _ = nil
				local var2600, var2601 = protoModule.readVarIntI32(p96, var2594)
				var2594 = var2601
				var2593.max_visible_rows = var2600
			else
				local _ = nil
				local var2602, var2603 = protoModule.readVarInt(p96, var2594)
				local _ = var2602
				var2594 = var2603
			end
		end
		if var2595 == protoModule.wireTypes.lengthDelimited then
			if var2599 == 1 then
				local _ = nil
				local var2604, var2605 = protoModule.readBuffer(p96, var2594)
				var2594 = var2605
				var2593.title = buffer.tostring(var2604)
			elseif var2599 == 2 then
				local _ = nil
				local var2606, var2607 = protoModule.readBuffer(p96, var2594)
				var2594 = var2607
				table.insert(var2593.user_items, t.UserListInputData_UserItem.decode(var2606))
			elseif var2599 == 4 then
				local _ = nil
				local var2608, var2609 = protoModule.readBuffer(p96, var2594)
				var2594 = var2609
				var2593.sort_id = buffer.tostring(var2608)
			else
				local _ = nil
				local var2610, var2611 = protoModule.readVarInt(p96, var2594)
				var2594 = var2611 + var2610
			end
		elseif var2595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2612, var2613 = protoModule.readFixed32(p96, var2594)
			local _ = var2612
			var2594 = var2613
		elseif var2595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2614, var2615 = protoModule.readFixed64(p96, var2594)
			local _ = var2614
			var2594 = var2615
		else
			error("Unsupported wire type: " .. var3853)
		end
	end
	return var2593
end

function t_96:jsonEncode()
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

function t_96:jsonDecode()
	-- upvalues: t_96 (ref), t (ref)
	local var2616 = t_96.new()
	
	if self.title ~= nil then
		var2616.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2616.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2616.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2616.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2616.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2616.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2616.sort_id = self.sortId
	end
	return var2616
end

t_96.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_96
typeRegistryModule.default:register(t.UserListInputData)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p97)
	-- upvalues: t_97 (ref)
	return setmetatable({
		user_id = if p97 == nil or p97.user_id == nil then "" else p97.user_id
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2617 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2618, var2619 = protoModule.writeTag(buff, var2617, 1, protoModule.wireTypes.lengthDelimited)
		var2618, var3882 = protoModule.writeString(var2618, var2619, self.user_id)
		buff = var2618
		var2617 = var2619
	end
	local buff_1 = buffer.create(var2617)
	buffer.copy(buff_1, 0, buff, 0, var2617)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref)
	local var2617 = t_97.new()
	local var2618 = 0
	while var2618 < buffer.len(p97) do
		local _ = nil
		local var2619 = nil
		local var2620, var2621, var2622 = protoModule.readTag(p97, var2618)
		local var2623 = var2620
		var2619 = var2621
		var2618 = var2622
		
		if var2619 == protoModule.wireTypes.varint then
			local _ = nil
			local var2624, var2625 = protoModule.readVarInt(p97, var2618)
			local _ = var2624
			var2618 = var2625
			continue
		end
		if var2619 == protoModule.wireTypes.lengthDelimited then
			if var2623 == 1 then
				local _ = nil
				local var2626, var2627 = protoModule.readBuffer(p97, var2618)
				var2618 = var2627
				var2617.user_id = buffer.tostring(var2626)
			else
				local _ = nil
				local var2628, var2629 = protoModule.readVarInt(p97, var2618)
				var2618 = var2629 + var2628
			end
		elseif var2619 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2630, var2631 = protoModule.readFixed32(p97, var2618)
			local _ = var2630
			var2618 = var2631
		elseif var2619 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2632, var2633 = protoModule.readFixed64(p97, var2618)
			local _ = var2632
			var2618 = var2633
		else
			error("Unsupported wire type: " .. var3886)
		end
	end
	return var2617
end

function t_97:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_97:jsonDecode()
	-- upvalues: t_97 (ref)
	local var2634 = t_97.new()
	
	if self.user_id ~= nil then
		var2634.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2634.user_id = self.userId
	end
	return var2634
end

t_97.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_97
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p98)
	-- upvalues: t_98 (ref)
	return setmetatable({
		title = if p98 == nil or p98.title == nil then "" else p98.title,
		items = if p98 == nil or p98.items == nil then {} else p98.items,
		max_visible_rows = if p98 == nil or p98.max_visible_rows == nil then 0 else p98.max_visible_rows,
		sort_id = if p98 == nil or p98.sort_id == nil then nil else p98.sort_id
	}, t_98)
end

function t_98:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2634 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2635, var2636 = protoModule.writeTag(buff, var2634, 1, protoModule.wireTypes.lengthDelimited)
		var2635, var3906 = protoModule.writeString(var2635, var2636, self.title)
		buff = var2635
		var2634 = var2636
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2637 = v:encode()
			local var2638, var2639 = protoModule.writeTag(buff, var2634, 2, protoModule.wireTypes.lengthDelimited)
			var2638, var3909 = protoModule.writeBuffer(var2638, var2639, var2637, buffer.len(var2637))
			buff = var2638
			var2634 = var2639
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2640, var2641 = protoModule.writeTag(buff, var2634, 3, protoModule.wireTypes.varint)
		var2640, var3911 = protoModule.writeVarInt(var2640, var2641, self.max_visible_rows)
		buff = var2640
		var2634 = var2641
	end
	if self.sort_id ~= nil then
		local var2642, var2643 = protoModule.writeTag(buff, var2634, 4, protoModule.wireTypes.lengthDelimited)
		var2642, var3913 = protoModule.writeString(var2642, var2643, self.sort_id)
		buff = var2642
		var2634 = var2643
	end
	local buff_1 = buffer.create(var2634)
	buffer.copy(buff_1, 0, buff, 0, var2634)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2644 = t_98.new()
	local var2645 = 0
	while var2645 < buffer.len(p98) do
		local _ = nil
		local var2646 = nil
		local var2647, var2648, var2649 = protoModule.readTag(p98, var2645)
		local var2650 = var2647
		var2646 = var2648
		var2645 = var2649
		
		if var2646 == protoModule.wireTypes.varint then
			if var2650 == 3 then
				local _ = nil
				local var2651, var2652 = protoModule.readVarIntI32(p98, var2645)
				var2645 = var2652
				var2644.max_visible_rows = var2651
			else
				local _ = nil
				local var2653, var2654 = protoModule.readVarInt(p98, var2645)
				local _ = var2653
				var2645 = var2654
			end
		end
		if var2646 == protoModule.wireTypes.lengthDelimited then
			if var2650 == 1 then
				local _ = nil
				local var2655, var2656 = protoModule.readBuffer(p98, var2645)
				var2645 = var2656
				var2644.title = buffer.tostring(var2655)
			elseif var2650 == 2 then
				local _ = nil
				local var2657, var2658 = protoModule.readBuffer(p98, var2645)
				var2645 = var2658
				table.insert(var2644.items, t.CatalogItemListInputData_CatalogItem.decode(var2657))
			elseif var2650 == 4 then
				local _ = nil
				local var2659, var2660 = protoModule.readBuffer(p98, var2645)
				var2645 = var2660
				var2644.sort_id = buffer.tostring(var2659)
			else
				local _ = nil
				local var2661, var2662 = protoModule.readVarInt(p98, var2645)
				var2645 = var2662 + var2661
			end
		elseif var2646 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2663, var2664 = protoModule.readFixed32(p98, var2645)
			local _ = var2663
			var2645 = var2664
		elseif var2646 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2665, var2666 = protoModule.readFixed64(p98, var2645)
			local _ = var2665
			var2645 = var2666
		else
			error("Unsupported wire type: " .. var3917)
		end
	end
	return var2644
end

function t_98:jsonEncode()
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

function t_98:jsonDecode()
	-- upvalues: t_98 (ref), t (ref)
	local var2667 = t_98.new()
	
	if self.title ~= nil then
		var2667.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2667.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2667.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2667.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2667.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2667.sort_id = self.sortId
	end
	return var2667
end

t_98.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_98
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p99)
	-- upvalues: t_99 (ref)
	return setmetatable({
		item_id = if p99 == nil or p99.item_id == nil then "" else p99.item_id,
		item_type = if p99 == nil or p99.item_type == nil then "" else p99.item_type
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2668 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2669, var2670 = protoModule.writeTag(buff, var2668, 1, protoModule.wireTypes.lengthDelimited)
		var2669, var3945 = protoModule.writeString(var2669, var2670, self.item_id)
		buff = var2669
		var2668 = var2670
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2671, var2672 = protoModule.writeTag(buff, var2668, 2, protoModule.wireTypes.lengthDelimited)
		var2671, var3947 = protoModule.writeString(var2671, var2672, self.item_type)
		buff = var2671
		var2668 = var2672
	end
	local buff_1 = buffer.create(var2668)
	buffer.copy(buff_1, 0, buff, 0, var2668)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2668 = t_99.new()
	local var2669 = 0
	while var2669 < buffer.len(p99) do
		local _ = nil
		local var2670 = nil
		local var2671, var2672, var2673 = protoModule.readTag(p99, var2669)
		local var2674 = var2671
		var2670 = var2672
		var2669 = var2673
		
		if var2670 == protoModule.wireTypes.varint then
			local _ = nil
			local var2675, var2676 = protoModule.readVarInt(p99, var2669)
			local _ = var2675
			var2669 = var2676
			continue
		end
		if var2670 == protoModule.wireTypes.lengthDelimited then
			if var2674 == 1 then
				local _ = nil
				local var2677, var2678 = protoModule.readBuffer(p99, var2669)
				var2669 = var2678
				var2668.item_id = buffer.tostring(var2677)
			elseif var2674 == 2 then
				local _ = nil
				local var2679, var2680 = protoModule.readBuffer(p99, var2669)
				var2669 = var2680
				var2668.item_type = buffer.tostring(var2679)
			else
				local _ = nil
				local var2681, var2682 = protoModule.readVarInt(p99, var2669)
				var2669 = var2682 + var2681
			end
		elseif var2670 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2683, var2684 = protoModule.readFixed32(p99, var2669)
			local _ = var2683
			var2669 = var2684
		elseif var2670 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2685, var2686 = protoModule.readFixed64(p99, var2669)
			local _ = var2685
			var2669 = var2686
		else
			error("Unsupported wire type: " .. var3951)
		end
	end
	return var2668
end

function t_99:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_99:jsonDecode()
	-- upvalues: t_99 (ref)
	local var2687 = t_99.new()
	
	if self.item_id ~= nil then
		var2687.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2687.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2687.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2687.item_type = self.itemType
	end
	return var2687
end

t_99.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_99
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p100)
	-- upvalues: t_100 (ref)
	return setmetatable({
		universe_id = if p100 == nil or p100.universe_id == nil then "" else p100.universe_id
	}, t_100)
end

function t_100:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2687 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2688, var2689 = protoModule.writeTag(buff, var2687, 1, protoModule.wireTypes.lengthDelimited)
		var2688, var3973 = protoModule.writeString(var2688, var2689, self.universe_id)
		buff = var2688
		var2687 = var2689
	end
	local buff_1 = buffer.create(var2687)
	buffer.copy(buff_1, 0, buff, 0, var2687)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref)
	local var2687 = t_100.new()
	local var2688 = 0
	while var2688 < buffer.len(p100) do
		local _ = nil
		local var2689 = nil
		local var2690, var2691, var2692 = protoModule.readTag(p100, var2688)
		local var2693 = var2690
		var2689 = var2691
		var2688 = var2692
		
		if var2689 == protoModule.wireTypes.varint then
			local _ = nil
			local var2694, var2695 = protoModule.readVarInt(p100, var2688)
			local _ = var2694
			var2688 = var2695
			continue
		end
		if var2689 == protoModule.wireTypes.lengthDelimited then
			if var2693 == 1 then
				local _ = nil
				local var2696, var2697 = protoModule.readBuffer(p100, var2688)
				var2688 = var2697
				var2687.universe_id = buffer.tostring(var2696)
			else
				local _ = nil
				local var2698, var2699 = protoModule.readVarInt(p100, var2688)
				var2688 = var2699 + var2698
			end
		elseif var2689 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2700, var2701 = protoModule.readFixed32(p100, var2688)
			local _ = var2700
			var2688 = var2701
		elseif var2689 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2702, var2703 = protoModule.readFixed64(p100, var2688)
			local _ = var2702
			var2688 = var2703
		else
			error("Unsupported wire type: " .. var3977)
		end
	end
	return var2687
end

function t_100:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_100:jsonDecode()
	-- upvalues: t_100 (ref)
	local var2704 = t_100.new()
	
	if self.universe_id ~= nil then
		var2704.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2704.universe_id = self.universeId
	end
	return var2704
end

t_100.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_100
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p101)
	-- upvalues: t_101 (ref)
	return setmetatable({
		title = if p101 == nil or p101.title == nil then "" else p101.title,
		subtitle = if p101 == nil or p101.subtitle == nil then "" else p101.subtitle,
		moment_items = if p101 == nil or p101.moment_items == nil then {} else p101.moment_items
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2704 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2705, var2706 = protoModule.writeTag(buff, var2704, 1, protoModule.wireTypes.lengthDelimited)
		var2705, var3997 = protoModule.writeString(var2705, var2706, self.title)
		buff = var2705
		var2704 = var2706
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2707, var2708 = protoModule.writeTag(buff, var2704, 2, protoModule.wireTypes.lengthDelimited)
		var2707, var3999 = protoModule.writeString(var2707, var2708, self.subtitle)
		buff = var2707
		var2704 = var2708
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2709 = v:encode()
			local var2710, var2711 = protoModule.writeTag(buff, var2704, 3, protoModule.wireTypes.lengthDelimited)
			var2710, var4002 = protoModule.writeBuffer(var2710, var2711, var2709, buffer.len(var2709))
			buff = var2710
			var2704 = var2711
		end
	end
	local buff_1 = buffer.create(var2704)
	buffer.copy(buff_1, 0, buff, 0, var2704)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2712 = t_101.new()
	local var2713 = 0
	while var2713 < buffer.len(p101) do
		local _ = nil
		local var2714 = nil
		local var2715, var2716, var2717 = protoModule.readTag(p101, var2713)
		local var2718 = var2715
		var2714 = var2716
		var2713 = var2717
		
		if var2714 == protoModule.wireTypes.varint then
			local _ = nil
			local var2719, var2720 = protoModule.readVarInt(p101, var2713)
			local _ = var2719
			var2713 = var2720
			continue
		end
		if var2714 == protoModule.wireTypes.lengthDelimited then
			if var2718 == 1 then
				local _ = nil
				local var2721, var2722 = protoModule.readBuffer(p101, var2713)
				var2713 = var2722
				var2712.title = buffer.tostring(var2721)
			elseif var2718 == 2 then
				local _ = nil
				local var2723, var2724 = protoModule.readBuffer(p101, var2713)
				var2713 = var2724
				var2712.subtitle = buffer.tostring(var2723)
			elseif var2718 == 3 then
				local _ = nil
				local var2725, var2726 = protoModule.readBuffer(p101, var2713)
				var2713 = var2726
				table.insert(var2712.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2725))
			else
				local _ = nil
				local var2727, var2728 = protoModule.readVarInt(p101, var2713)
				var2713 = var2728 + var2727
			end
		elseif var2714 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2729, var2730 = protoModule.readFixed32(p101, var2713)
			local _ = var2729
			var2713 = var2730
		elseif var2714 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2731, var2732 = protoModule.readFixed64(p101, var2713)
			local _ = var2731
			var2713 = var2732
		else
			error("Unsupported wire type: " .. var4006)
		end
	end
	return var2712
end

function t_101:jsonEncode()
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

function t_101:jsonDecode()
	-- upvalues: t_101 (ref), t (ref)
	local var2733 = t_101.new()
	
	if self.title ~= nil then
		var2733.title = self.title
	end
	if self.subtitle ~= nil then
		var2733.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2733.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2733.moment_items = t_1
	end
	return var2733
end

t_101.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_101
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p102)
	-- upvalues: t_102 (ref)
	return setmetatable({
		moment_id = if p102 == nil or p102.moment_id == nil then "" else p102.moment_id,
		video_asset_id = if p102 == nil or p102.video_asset_id == nil then "" else p102.video_asset_id,
		target_universe_id = if p102 == nil or p102.target_universe_id == nil then "" else p102.target_universe_id,
		target_place_id = if p102 == nil or p102.target_place_id == nil then "" else p102.target_place_id,
		feed_item_id = if p102 == nil or p102.feed_item_id == nil then "" else p102.feed_item_id,
		capture_universe_id = if p102 == nil or p102.capture_universe_id == nil then "" else p102.capture_universe_id
	}, t_102)
end

function t_102:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2734 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2735, var2736 = protoModule.writeTag(buff, var2734, 1, protoModule.wireTypes.lengthDelimited)
		var2735, var4033 = protoModule.writeString(var2735, var2736, self.moment_id)
		buff = var2735
		var2734 = var2736
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2737, var2738 = protoModule.writeTag(buff, var2734, 2, protoModule.wireTypes.lengthDelimited)
		var2737, var4035 = protoModule.writeString(var2737, var2738, self.video_asset_id)
		buff = var2737
		var2734 = var2738
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2739, var2740 = protoModule.writeTag(buff, var2734, 3, protoModule.wireTypes.lengthDelimited)
		var2739, var4037 = protoModule.writeString(var2739, var2740, self.target_universe_id)
		buff = var2739
		var2734 = var2740
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2741, var2742 = protoModule.writeTag(buff, var2734, 4, protoModule.wireTypes.lengthDelimited)
		var2741, var4039 = protoModule.writeString(var2741, var2742, self.target_place_id)
		buff = var2741
		var2734 = var2742
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2743, var2744 = protoModule.writeTag(buff, var2734, 5, protoModule.wireTypes.lengthDelimited)
		var2743, var4041 = protoModule.writeString(var2743, var2744, self.feed_item_id)
		buff = var2743
		var2734 = var2744
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2745, var2746 = protoModule.writeTag(buff, var2734, 6, protoModule.wireTypes.lengthDelimited)
		var2745, var4043 = protoModule.writeString(var2745, var2746, self.capture_universe_id)
		buff = var2745
		var2734 = var2746
	end
	local buff_1 = buffer.create(var2734)
	buffer.copy(buff_1, 0, buff, 0, var2734)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2734 = t_102.new()
	local var2735 = 0
	while var2735 < buffer.len(p102) do
		local _ = nil
		local var2736 = nil
		local var2737, var2738, var2739 = protoModule.readTag(p102, var2735)
		local var2740 = var2737
		var2736 = var2738
		var2735 = var2739
		
		if var2736 == protoModule.wireTypes.varint then
			local _ = nil
			local var2741, var2742 = protoModule.readVarInt(p102, var2735)
			local _ = var2741
			var2735 = var2742
			continue
		end
		if var2736 == protoModule.wireTypes.lengthDelimited then
			if var2740 == 1 then
				local _ = nil
				local var2743, var2744 = protoModule.readBuffer(p102, var2735)
				var2735 = var2744
				var2734.moment_id = buffer.tostring(var2743)
			elseif var2740 == 2 then
				local _ = nil
				local var2745, var2746 = protoModule.readBuffer(p102, var2735)
				var2735 = var2746
				var2734.video_asset_id = buffer.tostring(var2745)
			elseif var2740 == 3 then
				local _ = nil
				local var2747, var2748 = protoModule.readBuffer(p102, var2735)
				var2735 = var2748
				var2734.target_universe_id = buffer.tostring(var2747)
			elseif var2740 == 4 then
				local _ = nil
				local var2749, var2750 = protoModule.readBuffer(p102, var2735)
				var2735 = var2750
				var2734.target_place_id = buffer.tostring(var2749)
			elseif var2740 == 5 then
				local _ = nil
				local var2751, var2752 = protoModule.readBuffer(p102, var2735)
				var2735 = var2752
				var2734.feed_item_id = buffer.tostring(var2751)
			elseif var2740 == 6 then
				local _ = nil
				local var2753, var2754 = protoModule.readBuffer(p102, var2735)
				var2735 = var2754
				var2734.capture_universe_id = buffer.tostring(var2753)
			else
				local _ = nil
				local var2755, var2756 = protoModule.readVarInt(p102, var2735)
				var2735 = var2756 + var2755
			end
		elseif var2736 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2757, var2758 = protoModule.readFixed32(p102, var2735)
			local _ = var2757
			var2735 = var2758
		elseif var2736 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2759, var2760 = protoModule.readFixed64(p102, var2735)
			local _ = var2759
			var2735 = var2760
		else
			error("Unsupported wire type: " .. var4047)
		end
	end
	return var2734
end

function t_102:jsonEncode()
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

function t_102:jsonDecode()
	-- upvalues: t_102 (ref)
	local var2761 = t_102.new()
	
	if self.moment_id ~= nil then
		var2761.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var2761.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var2761.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2761.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var2761.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var2761.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var2761.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var2761.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var2761.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var2761.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var2761.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var2761.capture_universe_id = self.captureUniverseId
	end
	return var2761
end

t_102.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_102
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p103)
	-- upvalues: t_103 (ref)
	return setmetatable({
		title = if p103 == nil or p103.title == nil then "" else p103.title,
		subtitle = if p103 == nil or p103.subtitle == nil then "" else p103.subtitle
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2761 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2762, var2763 = protoModule.writeTag(buff, var2761, 1, protoModule.wireTypes.lengthDelimited)
		var2762, var4077 = protoModule.writeString(var2762, var2763, self.title)
		buff = var2762
		var2761 = var2763
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2764, var2765 = protoModule.writeTag(buff, var2761, 2, protoModule.wireTypes.lengthDelimited)
		var2764, var4079 = protoModule.writeString(var2764, var2765, self.subtitle)
		buff = var2764
		var2761 = var2765
	end
	local buff_1 = buffer.create(var2761)
	buffer.copy(buff_1, 0, buff, 0, var2761)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref)
	local var2761 = t_103.new()
	local var2762 = 0
	while var2762 < buffer.len(p103) do
		local _ = nil
		local var2763 = nil
		local var2764, var2765, var2766 = protoModule.readTag(p103, var2762)
		local var2767 = var2764
		var2763 = var2765
		var2762 = var2766
		
		if var2763 == protoModule.wireTypes.varint then
			local _ = nil
			local var2768, var2769 = protoModule.readVarInt(p103, var2762)
			local _ = var2768
			var2762 = var2769
			continue
		end
		if var2763 == protoModule.wireTypes.lengthDelimited then
			if var2767 == 1 then
				local _ = nil
				local var2770, var2771 = protoModule.readBuffer(p103, var2762)
				var2762 = var2771
				var2761.title = buffer.tostring(var2770)
			elseif var2767 == 2 then
				local _ = nil
				local var2772, var2773 = protoModule.readBuffer(p103, var2762)
				var2762 = var2773
				var2761.subtitle = buffer.tostring(var2772)
			else
				local _ = nil
				local var2774, var2775 = protoModule.readVarInt(p103, var2762)
				var2762 = var2775 + var2774
			end
		elseif var2763 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2776, var2777 = protoModule.readFixed32(p103, var2762)
			local _ = var2776
			var2762 = var2777
		elseif var2763 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2778, var2779 = protoModule.readFixed64(p103, var2762)
			local _ = var2778
			var2762 = var2779
		else
			error("Unsupported wire type: " .. var4083)
		end
	end
	return var2761
end

function t_103:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_103:jsonDecode()
	-- upvalues: t_103 (ref)
	local var2780 = t_103.new()
	
	if self.title ~= nil then
		var2780.title = self.title
	end
	if self.subtitle ~= nil then
		var2780.subtitle = self.subtitle
	end
	return var2780
end

t_103.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_103
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p104)
	-- upvalues: t_104 (ref)
	return setmetatable({
		primary_cta_button_text = if p104 == nil or p104.primary_cta_button_text == nil then "" else p104.primary_cta_button_text,
		secondary_cta_button_text = if p104 == nil or p104.secondary_cta_button_text == nil then "" else p104.secondary_cta_button_text,
		primary_cta_type = if p104 == nil or p104.primary_cta_type == nil then "" else p104.primary_cta_type,
		secondary_cta_type = if p104 == nil or p104.secondary_cta_type == nil then "" else p104.secondary_cta_type
	}, t_104)
end

function t_104:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2780 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var2781, var2782 = protoModule.writeTag(buff, var2780, 1, protoModule.wireTypes.lengthDelimited)
		var2781, var4105 = protoModule.writeString(var2781, var2782, self.primary_cta_button_text)
		buff = var2781
		var2780 = var2782
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var2783, var2784 = protoModule.writeTag(buff, var2780, 2, protoModule.wireTypes.lengthDelimited)
		var2783, var4107 = protoModule.writeString(var2783, var2784, self.secondary_cta_button_text)
		buff = var2783
		var2780 = var2784
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var2785, var2786 = protoModule.writeTag(buff, var2780, 3, protoModule.wireTypes.lengthDelimited)
		var2785, var4109 = protoModule.writeString(var2785, var2786, self.primary_cta_type)
		buff = var2785
		var2780 = var2786
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var2787, var2788 = protoModule.writeTag(buff, var2780, 4, protoModule.wireTypes.lengthDelimited)
		var2787, var4111 = protoModule.writeString(var2787, var2788, self.secondary_cta_type)
		buff = var2787
		var2780 = var2788
	end
	local buff_1 = buffer.create(var2780)
	buffer.copy(buff_1, 0, buff, 0, var2780)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2780 = t_104.new()
	local var2781 = 0
	while var2781 < buffer.len(p104) do
		local _ = nil
		local var2782 = nil
		local var2783, var2784, var2785 = protoModule.readTag(p104, var2781)
		local var2786 = var2783
		var2782 = var2784
		var2781 = var2785
		
		if var2782 == protoModule.wireTypes.varint then
			local _ = nil
			local var2787, var2788 = protoModule.readVarInt(p104, var2781)
			local _ = var2787
			var2781 = var2788
			continue
		end
		if var2782 == protoModule.wireTypes.lengthDelimited then
			if var2786 == 1 then
				local _ = nil
				local var2789, var2790 = protoModule.readBuffer(p104, var2781)
				var2781 = var2790
				var2780.primary_cta_button_text = buffer.tostring(var2789)
			elseif var2786 == 2 then
				local _ = nil
				local var2791, var2792 = protoModule.readBuffer(p104, var2781)
				var2781 = var2792
				var2780.secondary_cta_button_text = buffer.tostring(var2791)
			elseif var2786 == 3 then
				local _ = nil
				local var2793, var2794 = protoModule.readBuffer(p104, var2781)
				var2781 = var2794
				var2780.primary_cta_type = buffer.tostring(var2793)
			elseif var2786 == 4 then
				local _ = nil
				local var2795, var2796 = protoModule.readBuffer(p104, var2781)
				var2781 = var2796
				var2780.secondary_cta_type = buffer.tostring(var2795)
			else
				local _ = nil
				local var2797, var2798 = protoModule.readVarInt(p104, var2781)
				var2781 = var2798 + var2797
			end
		elseif var2782 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2799, var2800 = protoModule.readFixed32(p104, var2781)
			local _ = var2799
			var2781 = var2800
		elseif var2782 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2801, var2802 = protoModule.readFixed64(p104, var2781)
			local _ = var2801
			var2781 = var2802
		else
			error("Unsupported wire type: " .. var4115)
		end
	end
	return var2780
end

function t_104:jsonEncode()
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

function t_104:jsonDecode()
	-- upvalues: t_104 (ref)
	local var2803 = t_104.new()
	
	if self.primary_cta_button_text ~= nil then
		var2803.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var2803.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var2803.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var2803.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var2803.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var2803.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var2803.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var2803.secondary_cta_type = self.secondaryCtaType
	end
	return var2803
end

t_104.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_104
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p105)
	-- upvalues: t_105 (ref)
	return setmetatable({
		image_asset_id = if p105 == nil or p105.image_asset_id == nil then "" else p105.image_asset_id
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2803 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2804, var2805 = protoModule.writeTag(buff, var2803, 1, protoModule.wireTypes.lengthDelimited)
		var2804, var4141 = protoModule.writeString(var2804, var2805, self.image_asset_id)
		buff = var2804
		var2803 = var2805
	end
	local buff_1 = buffer.create(var2803)
	buffer.copy(buff_1, 0, buff, 0, var2803)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2803 = t_105.new()
	local var2804 = 0
	while var2804 < buffer.len(p105) do
		local _ = nil
		local var2805 = nil
		local var2806, var2807, var2808 = protoModule.readTag(p105, var2804)
		local var2809 = var2806
		var2805 = var2807
		var2804 = var2808
		
		if var2805 == protoModule.wireTypes.varint then
			local _ = nil
			local var2810, var2811 = protoModule.readVarInt(p105, var2804)
			local _ = var2810
			var2804 = var2811
			continue
		end
		if var2805 == protoModule.wireTypes.lengthDelimited then
			if var2809 == 1 then
				local _ = nil
				local var2812, var2813 = protoModule.readBuffer(p105, var2804)
				var2804 = var2813
				var2803.image_asset_id = buffer.tostring(var2812)
			else
				local _ = nil
				local var2814, var2815 = protoModule.readVarInt(p105, var2804)
				var2804 = var2815 + var2814
			end
		elseif var2805 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2816, var2817 = protoModule.readFixed32(p105, var2804)
			local _ = var2816
			var2804 = var2817
		elseif var2805 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2818, var2819 = protoModule.readFixed64(p105, var2804)
			local _ = var2818
			var2804 = var2819
		else
			error("Unsupported wire type: " .. var4145)
		end
	end
	return var2803
end

function t_105:jsonEncode()
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_105:jsonDecode()
	-- upvalues: t_105 (ref)
	local var2820 = t_105.new()
	
	if self.image_asset_id ~= nil then
		var2820.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var2820.image_asset_id = self.imageAssetId
	end
	return var2820
end

t_105.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_105
typeRegistryModule.default:register(t.ImageInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p106)
	-- upvalues: t_106 (ref)
	return setmetatable({
		video_asset_id = if p106 == nil or p106.video_asset_id == nil then "" else p106.video_asset_id,
		loading_image_asset_id = if p106 == nil or p106.loading_image_asset_id == nil then "" else p106.loading_image_asset_id
	}, t_106)
end

function t_106:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2820 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2821, var2822 = protoModule.writeTag(buff, var2820, 1, protoModule.wireTypes.lengthDelimited)
		var2821, var4165 = protoModule.writeString(var2821, var2822, self.video_asset_id)
		buff = var2821
		var2820 = var2822
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var2823, var2824 = protoModule.writeTag(buff, var2820, 2, protoModule.wireTypes.lengthDelimited)
		var2823, var4167 = protoModule.writeString(var2823, var2824, self.loading_image_asset_id)
		buff = var2823
		var2820 = var2824
	end
	local buff_1 = buffer.create(var2820)
	buffer.copy(buff_1, 0, buff, 0, var2820)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var2820 = t_106.new()
	local var2821 = 0
	while var2821 < buffer.len(p106) do
		local _ = nil
		local var2822 = nil
		local var2823, var2824, var2825 = protoModule.readTag(p106, var2821)
		local var2826 = var2823
		var2822 = var2824
		var2821 = var2825
		
		if var2822 == protoModule.wireTypes.varint then
			local _ = nil
			local var2827, var2828 = protoModule.readVarInt(p106, var2821)
			local _ = var2827
			var2821 = var2828
			continue
		end
		if var2822 == protoModule.wireTypes.lengthDelimited then
			if var2826 == 1 then
				local _ = nil
				local var2829, var2830 = protoModule.readBuffer(p106, var2821)
				var2821 = var2830
				var2820.video_asset_id = buffer.tostring(var2829)
			elseif var2826 == 2 then
				local _ = nil
				local var2831, var2832 = protoModule.readBuffer(p106, var2821)
				var2821 = var2832
				var2820.loading_image_asset_id = buffer.tostring(var2831)
			else
				local _ = nil
				local var2833, var2834 = protoModule.readVarInt(p106, var2821)
				var2821 = var2834 + var2833
			end
		elseif var2822 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2835, var2836 = protoModule.readFixed32(p106, var2821)
			local _ = var2835
			var2821 = var2836
		elseif var2822 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2837, var2838 = protoModule.readFixed64(p106, var2821)
			local _ = var2837
			var2821 = var2838
		else
			error("Unsupported wire type: " .. var4171)
		end
	end
	return var2820
end

function t_106:jsonEncode()
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		t.loadingImageAssetId = self.loading_image_asset_id
	end
	return t
end

function t_106:jsonDecode()
	-- upvalues: t_106 (ref)
	local var2839 = t_106.new()
	
	if self.video_asset_id ~= nil then
		var2839.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2839.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var2839.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var2839.loading_image_asset_id = self.loadingImageAssetId
	end
	return var2839
end

t_106.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_106
typeRegistryModule.default:register(t.VideoInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p107)
	-- upvalues: t_107 (ref)
	return setmetatable({
		text = if p107 == nil or p107.text == nil then "" else p107.text,
		is_rendered_text = if p107 == nil or p107.is_rendered_text == nil then false else p107.is_rendered_text
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2839 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var2840, var2841 = protoModule.writeTag(buff, var2839, 1, protoModule.wireTypes.lengthDelimited)
		var2840, var4193 = protoModule.writeString(var2840, var2841, self.text)
		buff = var2840
		var2839 = var2841
	end
	if self.is_rendered_text then
		local var2842, var2843 = protoModule.writeTag(buff, var2839, 2, protoModule.wireTypes.varint)
		var2842, var4195 = protoModule.writeVarInt(var2842, var2843, if self.is_rendered_text then 1 else 0)
		buff = var2842
		var2839 = var2843
	end
	local buff_1 = buffer.create(var2839)
	buffer.copy(buff_1, 0, buff, 0, var2839)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2839 = t_107.new()
	local var2840 = 0
	while var2840 < buffer.len(p107) do
		local _ = nil
		local var2841 = nil
		local var2842, var2843, var2844 = protoModule.readTag(p107, var2840)
		local var2845 = var2842
		var2841 = var2843
		var2840 = var2844
		
		if var2841 == protoModule.wireTypes.varint then
			if var2845 == 2 then
				local _ = nil
				local var2846, var2847 = protoModule.readVarInt(p107, var2840)
				var2840 = var2847
				var2839.is_rendered_text = var2846 ~= 0
			else
				local _ = nil
				local var2848, var2849 = protoModule.readVarInt(p107, var2840)
				local _ = var2848
				var2840 = var2849
			end
		end
		if var2841 == protoModule.wireTypes.lengthDelimited then
			if var2845 == 1 then
				local _ = nil
				local var2850, var2851 = protoModule.readBuffer(p107, var2840)
				var2840 = var2851
				var2839.text = buffer.tostring(var2850)
			else
				local _ = nil
				local var2852, var2853 = protoModule.readVarInt(p107, var2840)
				var2840 = var2853 + var2852
			end
		elseif var2841 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2854, var2855 = protoModule.readFixed32(p107, var2840)
			local _ = var2854
			var2840 = var2855
		elseif var2841 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2856, var2857 = protoModule.readFixed64(p107, var2840)
			local _ = var2856
			var2840 = var2857
		else
			error("Unsupported wire type: " .. var4199)
		end
	end
	return var2839
end

function t_107:jsonEncode()
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function t_107:jsonDecode()
	-- upvalues: t_107 (ref)
	local var2858 = t_107.new()
	
	if self.text ~= nil then
		var2858.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var2858.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var2858.is_rendered_text = self.isRenderedText
	end
	return var2858
end

t_107.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_107
typeRegistryModule.default:register(t.TextInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p108)
	-- upvalues: t_108 (ref)
	return setmetatable({
		entry_map = if p108 == nil or p108.entry_map == nil then {} else p108.entry_map,
		entry_order = if p108 == nil or p108.entry_order == nil then {} else p108.entry_order,
		entry_order_map = if p108 == nil or p108.entry_order_map == nil then {} else p108.entry_order_map,
		content_pools = if p108 == nil or p108.content_pools == nil then {} else p108.content_pools
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2858 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2859, var2860 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2859, var4221 = protoModule.writeString(var2859, var2860, i)
			local var2861 = v:encode()
			var2860, var4223 = protoModule.writeTag(var2859, var2860, 2, protoModule.wireTypes.lengthDelimited)
			var2860, var4223 = protoModule.writeBuffer(var2860, var4223, var2861, buffer.len(var2861))
			local var2862 = var2860
			local var2863 = var4223
			local var2864, var2865 = protoModule.writeTag(buff, var2858, 1, protoModule.wireTypes.lengthDelimited)
			var2864, var4227 = protoModule.writeBuffer(var2864, var2865, var2862, var2863)
			buff = var2864
			var2858 = var2865
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2866, var2867 = protoModule.writeTag(buff, var2858, 2, protoModule.wireTypes.lengthDelimited)
			var2866, var4229 = protoModule.writeString(var2866, var2867, v)
			buff = var2866
			var2858 = var2867
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var2868, var2869 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2868, var4231 = protoModule.writeString(var2868, var2869, i)
			local var2870 = v:encode()
			var2869, var4233 = protoModule.writeTag(var2868, var2869, 2, protoModule.wireTypes.lengthDelimited)
			var2869, var4233 = protoModule.writeBuffer(var2869, var4233, var2870, buffer.len(var2870))
			local var2871 = var2869
			local var2872 = var4233
			local var2873, var2874 = protoModule.writeTag(buff, var2858, 3, protoModule.wireTypes.lengthDelimited)
			var2873, var4237 = protoModule.writeBuffer(var2873, var2874, var2871, var2872)
			buff = var2873
			var2858 = var2874
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2875, var2876 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2875, var4239 = protoModule.writeString(var2875, var2876, i)
			local var2877 = v:encode()
			var2876, var4241 = protoModule.writeTag(var2875, var2876, 2, protoModule.wireTypes.lengthDelimited)
			var2876, var4241 = protoModule.writeBuffer(var2876, var4241, var2877, buffer.len(var2877))
			local var2878 = var2876
			local var2879 = var4241
			local var2880, var2881 = protoModule.writeTag(buff, var2858, 4, protoModule.wireTypes.lengthDelimited)
			var2880, var4245 = protoModule.writeBuffer(var2880, var2881, var2878, var2879)
			buff = var2880
			var2858 = var2881
		end
	end
	local buff_1 = buffer.create(var2858)
	buffer.copy(buff_1, 0, buff, 0, var2858)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var2882 = t_108.new()
	local var2883 = 0
	while var2883 < buffer.len(p108) do
		local _ = nil
		local var2884 = nil
		local var2885, var2886, var2887 = protoModule.readTag(p108, var2883)
		local var2888 = var2885
		var2884 = var2886
		var2883 = var2887
		
		if var2884 == protoModule.wireTypes.varint then
			local _ = nil
			local var2889, var2890 = protoModule.readVarInt(p108, var2883)
			local _ = var2889
			var2883 = var2890
			continue
		end
		if var2884 == protoModule.wireTypes.lengthDelimited then
			if var2888 == 1 then
				local _ = nil
				local var2891, var2892 = protoModule.readBuffer(p108, var2883)
				var2883 = var2892
				var2891 = t.VerticalFeedInputData_EntryMapEntry.decode(var2891)
				var2882.entry_map[var2891.key or ""] = var2891.value or t.FeedEntry.new()
			elseif var2888 == 2 then
				local _ = nil
				local var2893, var2894 = protoModule.readBuffer(p108, var2883)
				var2883 = var2894
				table.insert(var2882.entry_order, buffer.tostring(var2893))
			elseif var2888 == 3 then
				local _ = nil
				local var2895, var2896 = protoModule.readBuffer(p108, var2883)
				var2883 = var2896
				var2895 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var2895)
				var2882.entry_order_map[var2895.key or ""] = var2895.value or t.EntryOrder.new()
			elseif var2888 == 4 then
				local _ = nil
				local var2897, var2898 = protoModule.readBuffer(p108, var2883)
				var2883 = var2898
				var2897 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var2897)
				var2882.content_pools[var2897.key or ""] = var2897.value or t.ContentPool.new()
			else
				local _ = nil
				local var2899, var2900 = protoModule.readVarInt(p108, var2883)
				var2883 = var2900 + var2899
			end
		elseif var2884 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2901, var2902 = protoModule.readFixed32(p108, var2883)
			local _ = var2901
			var2883 = var2902
		elseif var2884 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2903, var2904 = protoModule.readFixed64(p108, var2883)
			local _ = var2903
			var2883 = var2904
		else
			error("Unsupported wire type: " .. var4249)
		end
	end
	return var2882
end

function t_108:jsonEncode()
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

function t_108:jsonDecode()
	-- upvalues: t_108 (ref), t (ref)
	local var2905 = t_108.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2905.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2905.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2905.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2905.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var2905.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var2905.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2905.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2905.content_pools = t_1
	end
	return var2905
end

t_108.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_108
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p109)
	-- upvalues: t_109 (ref)
	return setmetatable({
		key = if p109 == nil or p109.key == nil then "" else p109.key,
		value = if p109 == nil or p109.value == nil then nil else p109.value
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2906 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2907, var2908 = protoModule.writeTag(buff, var2906, 1, protoModule.wireTypes.lengthDelimited)
		var2907, var4287 = protoModule.writeString(var2907, var2908, self.key)
		buff = var2907
		var2906 = var2908
	end
	if self.value ~= nil then
		local var2909 = self.value:encode()
		local var2910, var2911 = protoModule.writeTag(buff, var2906, 2, protoModule.wireTypes.lengthDelimited)
		var2910, var4290 = protoModule.writeBuffer(var2910, var2911, var2909, buffer.len(var2909))
		buff = var2910
		var2906 = var2911
	end
	local buff_1 = buffer.create(var2906)
	buffer.copy(buff_1, 0, buff, 0, var2906)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var2906 = t_109.new()
	local var2907 = 0
	while var2907 < buffer.len(p109) do
		local _ = nil
		local var2908 = nil
		local var2909, var2910, var2911 = protoModule.readTag(p109, var2907)
		local var2912 = var2909
		var2908 = var2910
		var2907 = var2911
		
		if var2908 == protoModule.wireTypes.varint then
			local _ = nil
			local var2913, var2914 = protoModule.readVarInt(p109, var2907)
			local _ = var2913
			var2907 = var2914
			continue
		end
		if var2908 == protoModule.wireTypes.lengthDelimited then
			if var2912 == 1 then
				local _ = nil
				local var2915, var2916 = protoModule.readBuffer(p109, var2907)
				var2907 = var2916
				var2906.key = buffer.tostring(var2915)
			elseif var2912 == 2 then
				local _ = nil
				local var2917, var2918 = protoModule.readBuffer(p109, var2907)
				var2907 = var2918
				var2906.value = t.FeedEntry.decode(var2917)
			else
				local _ = nil
				local var2919, var2920 = protoModule.readVarInt(p109, var2907)
				var2907 = var2920 + var2919
			end
		elseif var2908 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2921, var2922 = protoModule.readFixed32(p109, var2907)
			local _ = var2921
			var2907 = var2922
		elseif var2908 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2923, var2924 = protoModule.readFixed64(p109, var2907)
			local _ = var2923
			var2907 = var2924
		else
			error("Unsupported wire type: " .. var4294)
		end
	end
	return var2906
end

function t_109:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_109:jsonDecode()
	-- upvalues: t_109 (ref), t (ref)
	local var2925 = t_109.new()
	
	if self.key ~= nil then
		var2925.key = self.key
	end
	if self.value ~= nil then
		var2925.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2925
end

t_109.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_109
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p110)
	-- upvalues: t_110 (ref)
	return setmetatable({
		key = if p110 == nil or p110.key == nil then "" else p110.key,
		value = if p110 == nil or p110.value == nil then nil else p110.value
	}, t_110)
end

function t_110:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2925 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2926, var2927 = protoModule.writeTag(buff, var2925, 1, protoModule.wireTypes.lengthDelimited)
		var2926, var4316 = protoModule.writeString(var2926, var2927, self.key)
		buff = var2926
		var2925 = var2927
	end
	if self.value ~= nil then
		local var2928 = self.value:encode()
		local var2929, var2930 = protoModule.writeTag(buff, var2925, 2, protoModule.wireTypes.lengthDelimited)
		var2929, var4319 = protoModule.writeBuffer(var2929, var2930, var2928, buffer.len(var2928))
		buff = var2929
		var2925 = var2930
	end
	local buff_1 = buffer.create(var2925)
	buffer.copy(buff_1, 0, buff, 0, var2925)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var2925 = t_110.new()
	local var2926 = 0
	while var2926 < buffer.len(p110) do
		local _ = nil
		local var2927 = nil
		local var2928, var2929, var2930 = protoModule.readTag(p110, var2926)
		local var2931 = var2928
		var2927 = var2929
		var2926 = var2930
		
		if var2927 == protoModule.wireTypes.varint then
			local _ = nil
			local var2932, var2933 = protoModule.readVarInt(p110, var2926)
			local _ = var2932
			var2926 = var2933
			continue
		end
		if var2927 == protoModule.wireTypes.lengthDelimited then
			if var2931 == 1 then
				local _ = nil
				local var2934, var2935 = protoModule.readBuffer(p110, var2926)
				var2926 = var2935
				var2925.key = buffer.tostring(var2934)
			elseif var2931 == 2 then
				local _ = nil
				local var2936, var2937 = protoModule.readBuffer(p110, var2926)
				var2926 = var2937
				var2925.value = t.EntryOrder.decode(var2936)
			else
				local _ = nil
				local var2938, var2939 = protoModule.readVarInt(p110, var2926)
				var2926 = var2939 + var2938
			end
		elseif var2927 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2940, var2941 = protoModule.readFixed32(p110, var2926)
			local _ = var2940
			var2926 = var2941
		elseif var2927 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2942, var2943 = protoModule.readFixed64(p110, var2926)
			local _ = var2942
			var2926 = var2943
		else
			error("Unsupported wire type: " .. var4323)
		end
	end
	return var2925
end

function t_110:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_110:jsonDecode()
	-- upvalues: t_110 (ref), t (ref)
	local var2944 = t_110.new()
	
	if self.key ~= nil then
		var2944.key = self.key
	end
	if self.value ~= nil then
		var2944.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var2944
end

t_110.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_110
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
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
	local var2944 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2945, var2946 = protoModule.writeTag(buff, var2944, 1, protoModule.wireTypes.lengthDelimited)
		var2945, var4345 = protoModule.writeString(var2945, var2946, self.key)
		buff = var2945
		var2944 = var2946
	end
	if self.value ~= nil then
		local var2947 = self.value:encode()
		local var2948, var2949 = protoModule.writeTag(buff, var2944, 2, protoModule.wireTypes.lengthDelimited)
		var2948, var4348 = protoModule.writeBuffer(var2948, var2949, var2947, buffer.len(var2947))
		buff = var2948
		var2944 = var2949
	end
	local buff_1 = buffer.create(var2944)
	buffer.copy(buff_1, 0, buff, 0, var2944)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var2944 = t_111.new()
	local var2945 = 0
	while var2945 < buffer.len(p111) do
		local _ = nil
		local var2946 = nil
		local var2947, var2948, var2949 = protoModule.readTag(p111, var2945)
		local var2950 = var2947
		var2946 = var2948
		var2945 = var2949
		
		if var2946 == protoModule.wireTypes.varint then
			local _ = nil
			local var2951, var2952 = protoModule.readVarInt(p111, var2945)
			local _ = var2951
			var2945 = var2952
			continue
		end
		if var2946 == protoModule.wireTypes.lengthDelimited then
			if var2950 == 1 then
				local _ = nil
				local var2953, var2954 = protoModule.readBuffer(p111, var2945)
				var2945 = var2954
				var2944.key = buffer.tostring(var2953)
			elseif var2950 == 2 then
				local _ = nil
				local var2955, var2956 = protoModule.readBuffer(p111, var2945)
				var2945 = var2956
				var2944.value = t.ContentPool.decode(var2955)
			else
				local _ = nil
				local var2957, var2958 = protoModule.readVarInt(p111, var2945)
				var2945 = var2958 + var2957
			end
		elseif var2946 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2959, var2960 = protoModule.readFixed32(p111, var2945)
			local _ = var2959
			var2945 = var2960
		elseif var2946 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2961, var2962 = protoModule.readFixed64(p111, var2945)
			local _ = var2961
			var2945 = var2962
		else
			error("Unsupported wire type: " .. var4352)
		end
	end
	return var2944
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
	local var2963 = t_111.new()
	
	if self.key ~= nil then
		var2963.key = self.key
	end
	if self.value ~= nil then
		var2963.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2963
end

t_111.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_111
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p112)
	-- upvalues: t_112 (ref)
	return setmetatable({
		foreground_header_entry = if p112 == nil or p112.foreground_header_entry == nil then nil else p112.foreground_header_entry,
		background_header_entry = if p112 == nil or p112.background_header_entry == nil then nil else p112.background_header_entry,
		layout_variant = if p112 == nil or p112.layout_variant == nil then "" else p112.layout_variant
	}, t_112)
end

function t_112:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2963 = 0
	
	if self.foreground_header_entry ~= nil then
		local var2964 = self.foreground_header_entry:encode()
		local var2965, var2966 = protoModule.writeTag(buff, var2963, 1, protoModule.wireTypes.lengthDelimited)
		var2965, var4375 = protoModule.writeBuffer(var2965, var2966, var2964, buffer.len(var2964))
		buff = var2965
		var2963 = var2966
	end
	if self.background_header_entry ~= nil then
		local var2967 = self.background_header_entry:encode()
		local var2968, var2969 = protoModule.writeTag(buff, var2963, 2, protoModule.wireTypes.lengthDelimited)
		var2968, var4378 = protoModule.writeBuffer(var2968, var2969, var2967, buffer.len(var2967))
		buff = var2968
		var2963 = var2969
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var2970, var2971 = protoModule.writeTag(buff, var2963, 3, protoModule.wireTypes.lengthDelimited)
		var2970, var4380 = protoModule.writeString(var2970, var2971, self.layout_variant)
		buff = var2970
		var2963 = var2971
	end
	local buff_1 = buffer.create(var2963)
	buffer.copy(buff_1, 0, buff, 0, var2963)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var2963 = t_112.new()
	local var2964 = 0
	while var2964 < buffer.len(p112) do
		local _ = nil
		local var2965 = nil
		local var2966, var2967, var2968 = protoModule.readTag(p112, var2964)
		local var2969 = var2966
		var2965 = var2967
		var2964 = var2968
		
		if var2965 == protoModule.wireTypes.varint then
			local _ = nil
			local var2970, var2971 = protoModule.readVarInt(p112, var2964)
			local _ = var2970
			var2964 = var2971
			continue
		end
		if var2965 == protoModule.wireTypes.lengthDelimited then
			if var2969 == 1 then
				local _ = nil
				local var2972, var2973 = protoModule.readBuffer(p112, var2964)
				var2964 = var2973
				var2963.foreground_header_entry = t.ForegroundHeaderEntry.decode(var2972)
			elseif var2969 == 2 then
				local _ = nil
				local var2974, var2975 = protoModule.readBuffer(p112, var2964)
				var2964 = var2975
				var2963.background_header_entry = t.BackgroundHeaderEntry.decode(var2974)
			elseif var2969 == 3 then
				local _ = nil
				local var2976, var2977 = protoModule.readBuffer(p112, var2964)
				var2964 = var2977
				var2963.layout_variant = buffer.tostring(var2976)
			else
				local _ = nil
				local var2978, var2979 = protoModule.readVarInt(p112, var2964)
				var2964 = var2979 + var2978
			end
		elseif var2965 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2980, var2981 = protoModule.readFixed32(p112, var2964)
			local _ = var2980
			var2964 = var2981
		elseif var2965 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2982, var2983 = protoModule.readFixed64(p112, var2964)
			local _ = var2982
			var2964 = var2983
		else
			error("Unsupported wire type: " .. var4384)
		end
	end
	return var2963
end

function t_112:jsonEncode()
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

function t_112:jsonDecode()
	-- upvalues: t_112 (ref), t (ref)
	local var2984 = t_112.new()
	
	if self.foreground_header_entry ~= nil then
		var2984.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var2984.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var2984.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var2984.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var2984.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var2984.layout_variant = self.layoutVariant
	end
	return var2984
end

t_112.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_112
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p113)
	-- upvalues: t_113 (ref)
	return setmetatable({
		cta_button_text = if p113 == nil or p113.cta_button_text == nil then "" else p113.cta_button_text,
		cta_type = if p113 == nil or p113.cta_type == nil then "" else p113.cta_type
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2984 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var2985, var2986 = protoModule.writeTag(buff, var2984, 1, protoModule.wireTypes.lengthDelimited)
		var2985, var4408 = protoModule.writeString(var2985, var2986, self.cta_button_text)
		buff = var2985
		var2984 = var2986
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var2987, var2988 = protoModule.writeTag(buff, var2984, 2, protoModule.wireTypes.lengthDelimited)
		var2987, var4410 = protoModule.writeString(var2987, var2988, self.cta_type)
		buff = var2987
		var2984 = var2988
	end
	local buff_1 = buffer.create(var2984)
	buffer.copy(buff_1, 0, buff, 0, var2984)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref)
	local var2984 = t_113.new()
	local var2985 = 0
	while var2985 < buffer.len(p113) do
		local _ = nil
		local var2986 = nil
		local var2987, var2988, var2989 = protoModule.readTag(p113, var2985)
		local var2990 = var2987
		var2986 = var2988
		var2985 = var2989
		
		if var2986 == protoModule.wireTypes.varint then
			local _ = nil
			local var2991, var2992 = protoModule.readVarInt(p113, var2985)
			local _ = var2991
			var2985 = var2992
			continue
		end
		if var2986 == protoModule.wireTypes.lengthDelimited then
			if var2990 == 1 then
				local _ = nil
				local var2993, var2994 = protoModule.readBuffer(p113, var2985)
				var2985 = var2994
				var2984.cta_button_text = buffer.tostring(var2993)
			elseif var2990 == 2 then
				local _ = nil
				local var2995, var2996 = protoModule.readBuffer(p113, var2985)
				var2985 = var2996
				var2984.cta_type = buffer.tostring(var2995)
			else
				local _ = nil
				local var2997, var2998 = protoModule.readVarInt(p113, var2985)
				var2985 = var2998 + var2997
			end
		elseif var2986 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2999, var3000 = protoModule.readFixed32(p113, var2985)
			local _ = var2999
			var2985 = var3000
		elseif var2986 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3001, var3002 = protoModule.readFixed64(p113, var2985)
			local _ = var3001
			var2985 = var3002
		else
			error("Unsupported wire type: " .. var4414)
		end
	end
	return var2984
end

function t_113:jsonEncode()
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_113:jsonDecode()
	-- upvalues: t_113 (ref)
	local var3003 = t_113.new()
	
	if self.cta_button_text ~= nil then
		var3003.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3003.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3003.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3003.cta_type = self.ctaType
	end
	return var3003
end

t_113.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_113
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p114)
	-- upvalues: t_114 (ref)
	return setmetatable({
		title = if p114 == nil or p114.title == nil then "" else p114.title,
		cta_button_text = if p114 == nil or p114.cta_button_text == nil then "" else p114.cta_button_text,
		image_asset_id = if p114 == nil or p114.image_asset_id == nil then "" else p114.image_asset_id,
		cta_type = if p114 == nil or p114.cta_type == nil then "" else p114.cta_type
	}, t_114)
end

function t_114:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3003 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3004, var3005 = protoModule.writeTag(buff, var3003, 1, protoModule.wireTypes.lengthDelimited)
		var3004, var4436 = protoModule.writeString(var3004, var3005, self.title)
		buff = var3004
		var3003 = var3005
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3006, var3007 = protoModule.writeTag(buff, var3003, 2, protoModule.wireTypes.lengthDelimited)
		var3006, var4438 = protoModule.writeString(var3006, var3007, self.cta_button_text)
		buff = var3006
		var3003 = var3007
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3008, var3009 = protoModule.writeTag(buff, var3003, 3, protoModule.wireTypes.lengthDelimited)
		var3008, var4440 = protoModule.writeString(var3008, var3009, self.image_asset_id)
		buff = var3008
		var3003 = var3009
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3010, var3011 = protoModule.writeTag(buff, var3003, 4, protoModule.wireTypes.lengthDelimited)
		var3010, var4442 = protoModule.writeString(var3010, var3011, self.cta_type)
		buff = var3010
		var3003 = var3011
	end
	local buff_1 = buffer.create(var3003)
	buffer.copy(buff_1, 0, buff, 0, var3003)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref)
	local var3003 = t_114.new()
	local var3004 = 0
	while var3004 < buffer.len(p114) do
		local _ = nil
		local var3005 = nil
		local var3006, var3007, var3008 = protoModule.readTag(p114, var3004)
		local var3009 = var3006
		var3005 = var3007
		var3004 = var3008
		
		if var3005 == protoModule.wireTypes.varint then
			local _ = nil
			local var3010, var3011 = protoModule.readVarInt(p114, var3004)
			local _ = var3010
			var3004 = var3011
			continue
		end
		if var3005 == protoModule.wireTypes.lengthDelimited then
			if var3009 == 1 then
				local _ = nil
				local var3012, var3013 = protoModule.readBuffer(p114, var3004)
				var3004 = var3013
				var3003.title = buffer.tostring(var3012)
			elseif var3009 == 2 then
				local _ = nil
				local var3014, var3015 = protoModule.readBuffer(p114, var3004)
				var3004 = var3015
				var3003.cta_button_text = buffer.tostring(var3014)
			elseif var3009 == 3 then
				local _ = nil
				local var3016, var3017 = protoModule.readBuffer(p114, var3004)
				var3004 = var3017
				var3003.image_asset_id = buffer.tostring(var3016)
			elseif var3009 == 4 then
				local _ = nil
				local var3018, var3019 = protoModule.readBuffer(p114, var3004)
				var3004 = var3019
				var3003.cta_type = buffer.tostring(var3018)
			else
				local _ = nil
				local var3020, var3021 = protoModule.readVarInt(p114, var3004)
				var3004 = var3021 + var3020
			end
		elseif var3005 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3022, var3023 = protoModule.readFixed32(p114, var3004)
			local _ = var3022
			var3004 = var3023
		elseif var3005 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3024, var3025 = protoModule.readFixed64(p114, var3004)
			local _ = var3024
			var3004 = var3025
		else
			error("Unsupported wire type: " .. var4446)
		end
	end
	return var3003
end

function t_114:jsonEncode()
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

function t_114:jsonDecode()
	-- upvalues: t_114 (ref)
	local var3026 = t_114.new()
	
	if self.title ~= nil then
		var3026.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3026.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3026.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3026.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3026.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3026.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3026.cta_type = self.ctaType
	end
	return var3026
end

t_114.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_114
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p115)
	-- upvalues: t_115 (ref)
	return setmetatable({
		universe_id = if p115 == nil or p115.universe_id == nil then nil else p115.universe_id,
		title = if p115 == nil or p115.title == nil then nil else p115.title,
		subtitle = if p115 == nil or p115.subtitle == nil then nil else p115.subtitle,
		badge_text = if p115 == nil or p115.badge_text == nil then nil else p115.badge_text,
		foreground = if p115 == nil or p115.foreground == nil then nil else p115.foreground,
		background = if p115 == nil or p115.background == nil then nil else p115.background,
		title_image = if p115 == nil or p115.title_image == nil then nil else p115.title_image,
		asset_title = if p115 == nil or p115.asset_title == nil then nil else p115.asset_title,
		asset_subtitle = if p115 == nil or p115.asset_subtitle == nil then nil else p115.asset_subtitle,
		gradient = if p115 == nil or p115.gradient == nil then nil else p115.gradient,
		playable_text = if p115 == nil or p115.playable_text == nil then nil else p115.playable_text
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3026 = 0
	
	if self.universe_id ~= nil then
		local var3027, var3028 = protoModule.writeTag(buff, var3026, 1, protoModule.wireTypes.lengthDelimited)
		var3027, var4472 = protoModule.writeString(var3027, var3028, self.universe_id)
		buff = var3027
		var3026 = var3028
	end
	if self.title ~= nil then
		local var3029, var3030 = protoModule.writeTag(buff, var3026, 2, protoModule.wireTypes.lengthDelimited)
		var3029, var4474 = protoModule.writeString(var3029, var3030, self.title)
		buff = var3029
		var3026 = var3030
	end
	if self.subtitle ~= nil then
		local var3031, var3032 = protoModule.writeTag(buff, var3026, 3, protoModule.wireTypes.lengthDelimited)
		var3031, var4476 = protoModule.writeString(var3031, var3032, self.subtitle)
		buff = var3031
		var3026 = var3032
	end
	if self.badge_text ~= nil then
		local var3033, var3034 = protoModule.writeTag(buff, var3026, 4, protoModule.wireTypes.lengthDelimited)
		var3033, var4478 = protoModule.writeString(var3033, var3034, self.badge_text)
		buff = var3033
		var3026 = var3034
	end
	if self.foreground ~= nil then
		local var3035 = self.foreground:encode()
		local var3036, var3037 = protoModule.writeTag(buff, var3026, 5, protoModule.wireTypes.lengthDelimited)
		var3036, var4481 = protoModule.writeBuffer(var3036, var3037, var3035, buffer.len(var3035))
		buff = var3036
		var3026 = var3037
	end
	if self.background ~= nil then
		local var3038 = self.background:encode()
		local var3039, var3040 = protoModule.writeTag(buff, var3026, 6, protoModule.wireTypes.lengthDelimited)
		var3039, var4484 = protoModule.writeBuffer(var3039, var3040, var3038, buffer.len(var3038))
		buff = var3039
		var3026 = var3040
	end
	if self.title_image ~= nil then
		local var3041 = self.title_image:encode()
		local var3042, var3043 = protoModule.writeTag(buff, var3026, 7, protoModule.wireTypes.lengthDelimited)
		var3042, var4487 = protoModule.writeBuffer(var3042, var3043, var3041, buffer.len(var3041))
		buff = var3042
		var3026 = var3043
	end
	if self.asset_title ~= nil then
		local var3044, var3045 = protoModule.writeTag(buff, var3026, 8, protoModule.wireTypes.lengthDelimited)
		var3044, var4489 = protoModule.writeString(var3044, var3045, self.asset_title)
		buff = var3044
		var3026 = var3045
	end
	if self.asset_subtitle ~= nil then
		local var3046, var3047 = protoModule.writeTag(buff, var3026, 9, protoModule.wireTypes.lengthDelimited)
		var3046, var4491 = protoModule.writeString(var3046, var3047, self.asset_subtitle)
		buff = var3046
		var3026 = var3047
	end
	if self.gradient ~= nil then
		local var3048 = self.gradient:encode()
		local var3049, var3050 = protoModule.writeTag(buff, var3026, 10, protoModule.wireTypes.lengthDelimited)
		var3049, var4494 = protoModule.writeBuffer(var3049, var3050, var3048, buffer.len(var3048))
		buff = var3049
		var3026 = var3050
	end
	if self.playable_text ~= nil then
		local var3051, var3052 = protoModule.writeTag(buff, var3026, 11, protoModule.wireTypes.lengthDelimited)
		var3051, var4496 = protoModule.writeString(var3051, var3052, self.playable_text)
		buff = var3051
		var3026 = var3052
	end
	local buff_1 = buffer.create(var3026)
	buffer.copy(buff_1, 0, buff, 0, var3026)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var3026 = t_115.new()
	local var3027 = 0
	while var3027 < buffer.len(p115) do
		local _ = nil
		local var3028 = nil
		local var3029, var3030, var3031 = protoModule.readTag(p115, var3027)
		local var3032 = var3029
		var3028 = var3030
		var3027 = var3031
		
		if var3028 == protoModule.wireTypes.varint then
			local _ = nil
			local var3033, var3034 = protoModule.readVarInt(p115, var3027)
			local _ = var3033
			var3027 = var3034
			continue
		end
		if var3028 == protoModule.wireTypes.lengthDelimited then
			if var3032 == 1 then
				local _ = nil
				local var3035, var3036 = protoModule.readBuffer(p115, var3027)
				var3027 = var3036
				var3026.universe_id = buffer.tostring(var3035)
			elseif var3032 == 2 then
				local _ = nil
				local var3037, var3038 = protoModule.readBuffer(p115, var3027)
				var3027 = var3038
				var3026.title = buffer.tostring(var3037)
			elseif var3032 == 3 then
				local _ = nil
				local var3039, var3040 = protoModule.readBuffer(p115, var3027)
				var3027 = var3040
				var3026.subtitle = buffer.tostring(var3039)
			elseif var3032 == 4 then
				local _ = nil
				local var3041, var3042 = protoModule.readBuffer(p115, var3027)
				var3027 = var3042
				var3026.badge_text = buffer.tostring(var3041)
			elseif var3032 == 5 then
				local _ = nil
				local var3043, var3044 = protoModule.readBuffer(p115, var3027)
				var3027 = var3044
				var3026.foreground = t.HeroUnitInputData_VisualAsset.decode(var3043)
			elseif var3032 == 6 then
				local _ = nil
				local var3045, var3046 = protoModule.readBuffer(p115, var3027)
				var3027 = var3046
				var3026.background = t.HeroUnitInputData_VisualAsset.decode(var3045)
			elseif var3032 == 7 then
				local _ = nil
				local var3047, var3048 = protoModule.readBuffer(p115, var3027)
				var3027 = var3048
				var3026.title_image = t.HeroUnitInputData_VisualAsset.decode(var3047)
			elseif var3032 == 8 then
				local _ = nil
				local var3049, var3050 = protoModule.readBuffer(p115, var3027)
				var3027 = var3050
				var3026.asset_title = buffer.tostring(var3049)
			elseif var3032 == 9 then
				local _ = nil
				local var3051, var3052 = protoModule.readBuffer(p115, var3027)
				var3027 = var3052
				var3026.asset_subtitle = buffer.tostring(var3051)
			elseif var3032 == 10 then
				local _ = nil
				local var3053, var3054 = protoModule.readBuffer(p115, var3027)
				var3027 = var3054
				var3026.gradient = t.HeroUnitInputData_Gradient.decode(var3053)
			elseif var3032 == 11 then
				local _ = nil
				local var3055, var3056 = protoModule.readBuffer(p115, var3027)
				var3027 = var3056
				var3026.playable_text = buffer.tostring(var3055)
			else
				local _ = nil
				local var3057, var3058 = protoModule.readVarInt(p115, var3027)
				var3027 = var3058 + var3057
			end
		elseif var3028 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3059, var3060 = protoModule.readFixed32(p115, var3027)
			local _ = var3059
			var3027 = var3060
		elseif var3028 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3061, var3062 = protoModule.readFixed64(p115, var3027)
			local _ = var3061
			var3027 = var3062
		else
			error("Unsupported wire type: " .. var4500)
		end
	end
	return var3026
end

function t_115:jsonEncode()
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
	return t
end

function t_115:jsonDecode()
	-- upvalues: t_115 (ref), t (ref)
	local var3063 = t_115.new()
	
	if self.universe_id ~= nil then
		var3063.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3063.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3063.title = self.title
	end
	if self.subtitle ~= nil then
		var3063.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3063.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3063.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3063.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3063.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3063.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3063.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3063.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3063.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3063.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3063.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3063.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3063.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3063.playable_text = self.playableText
	end
	return var3063
end

t_115.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_115
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p116)
	-- upvalues: t_116 (ref)
	return setmetatable({
		asset_id = if p116 == nil or p116.asset_id == nil then "" else p116.asset_id,
		aspect_ratio = if p116 == nil or p116.aspect_ratio == nil then nil else p116.aspect_ratio,
		enable_animation = if p116 == nil or p116.enable_animation == nil then nil else p116.enable_animation
	}, t_116)
end

function t_116:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3063 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3064, var3065 = protoModule.writeTag(buff, var3063, 1, protoModule.wireTypes.lengthDelimited)
		var3064, var4540 = protoModule.writeString(var3064, var3065, self.asset_id)
		buff = var3064
		var3063 = var3065
	end
	if self.aspect_ratio ~= nil then
		local var3066, var3067 = protoModule.writeTag(buff, var3063, 2, protoModule.wireTypes.i64)
		var3066, var4542 = protoModule.writeDouble(var3066, var3067, self.aspect_ratio)
		buff = var3066
		var3063 = var3067
	end
	if self.enable_animation ~= nil then
		local var3068, var3069 = protoModule.writeTag(buff, var3063, 3, protoModule.wireTypes.varint)
		var3068, var4544 = protoModule.writeVarInt(var3068, var3069, if self.enable_animation then 1 else 0)
		buff = var3068
		var3063 = var3069
	end
	local buff_1 = buffer.create(var3063)
	buffer.copy(buff_1, 0, buff, 0, var3063)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3063 = t_116.new()
	local var3064 = 0
	while var3064 < buffer.len(p116) do
		local _ = nil
		local var3065 = nil
		local var3066, var3067, var3068 = protoModule.readTag(p116, var3064)
		local var3069 = var3066
		var3065 = var3067
		var3064 = var3068
		
		if var3065 == protoModule.wireTypes.varint then
			if var3069 == 3 then
				local _ = nil
				local var3070, var3071 = protoModule.readVarInt(p116, var3064)
				var3064 = var3071
				var3063.enable_animation = var3070 ~= 0
			else
				local _ = nil
				local var3072, var3073 = protoModule.readVarInt(p116, var3064)
				local _ = var3072
				var3064 = var3073
			end
		end
		if var3065 == protoModule.wireTypes.lengthDelimited then
			if var3069 == 1 then
				local _ = nil
				local var3074, var3075 = protoModule.readBuffer(p116, var3064)
				var3064 = var3075
				var3063.asset_id = buffer.tostring(var3074)
			else
				local _ = nil
				local var3076, var3077 = protoModule.readVarInt(p116, var3064)
				var3064 = var3077 + var3076
			end
		elseif var3065 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3078, var3079 = protoModule.readFixed32(p116, var3064)
			local _ = var3078
			var3064 = var3079
		elseif var3065 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4548)
		elseif var3069 == 2 then
			local _ = nil
			local var3080, var3081 = protoModule.readDouble(p116, var3064)
			var3064 = var3081
			var3063.aspect_ratio = var3080
		else
			local _ = nil
			local var3082, var3083 = protoModule.readFixed64(p116, var3064)
			local _ = var3082
			var3064 = var3083
		end
	end
	return var3063
end

function t_116:jsonEncode()
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

function t_116:jsonDecode()
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3084 = t_116.new()
	
	if self.asset_id ~= nil then
		var3084.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3084.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3084.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3084.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3084.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3084.enable_animation = self.enableAnimation
	end
	return var3084
end

t_116.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_116
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p117)
	-- upvalues: t_117 (ref)
	return setmetatable({
		start_color = if p117 == nil or p117.start_color == nil then nil else p117.start_color,
		end_color = if p117 == nil or p117.end_color == nil then nil else p117.end_color,
		start_opacity = if p117 == nil or p117.start_opacity == nil then nil else p117.start_opacity,
		end_opacity = if p117 == nil or p117.end_opacity == nil then nil else p117.end_opacity,
		degree = if p117 == nil or p117.degree == nil then nil else p117.degree
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3084 = 0
	
	if self.start_color ~= nil then
		local var3085, var3086 = protoModule.writeTag(buff, var3084, 1, protoModule.wireTypes.lengthDelimited)
		var3085, var4572 = protoModule.writeString(var3085, var3086, self.start_color)
		buff = var3085
		var3084 = var3086
	end
	if self.end_color ~= nil then
		local var3087, var3088 = protoModule.writeTag(buff, var3084, 2, protoModule.wireTypes.lengthDelimited)
		var3087, var4574 = protoModule.writeString(var3087, var3088, self.end_color)
		buff = var3087
		var3084 = var3088
	end
	if self.start_opacity ~= nil then
		local var3089, var3090 = protoModule.writeTag(buff, var3084, 3, protoModule.wireTypes.i64)
		var3089, var4576 = protoModule.writeDouble(var3089, var3090, self.start_opacity)
		buff = var3089
		var3084 = var3090
	end
	if self.end_opacity ~= nil then
		local var3091, var3092 = protoModule.writeTag(buff, var3084, 4, protoModule.wireTypes.i64)
		var3091, var4578 = protoModule.writeDouble(var3091, var3092, self.end_opacity)
		buff = var3091
		var3084 = var3092
	end
	if self.degree ~= nil then
		local var3093, var3094 = protoModule.writeTag(buff, var3084, 5, protoModule.wireTypes.i64)
		var3093, var4580 = protoModule.writeDouble(var3093, var3094, self.degree)
		buff = var3093
		var3084 = var3094
	end
	local buff_1 = buffer.create(var3084)
	buffer.copy(buff_1, 0, buff, 0, var3084)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var3084 = t_117.new()
	local var3085 = 0
	while var3085 < buffer.len(p117) do
		local _ = nil
		local var3086 = nil
		local var3087, var3088, var3089 = protoModule.readTag(p117, var3085)
		local var3090 = var3087
		var3086 = var3088
		var3085 = var3089
		
		if var3086 == protoModule.wireTypes.varint then
			local _ = nil
			local var3091, var3092 = protoModule.readVarInt(p117, var3085)
			local _ = var3091
			var3085 = var3092
			continue
		end
		if var3086 == protoModule.wireTypes.lengthDelimited then
			if var3090 == 1 then
				local _ = nil
				local var3093, var3094 = protoModule.readBuffer(p117, var3085)
				var3085 = var3094
				var3084.start_color = buffer.tostring(var3093)
			elseif var3090 == 2 then
				local _ = nil
				local var3095, var3096 = protoModule.readBuffer(p117, var3085)
				var3085 = var3096
				var3084.end_color = buffer.tostring(var3095)
			else
				local _ = nil
				local var3097, var3098 = protoModule.readVarInt(p117, var3085)
				var3085 = var3098 + var3097
			end
		elseif var3086 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3099, var3100 = protoModule.readFixed32(p117, var3085)
			local _ = var3099
			var3085 = var3100
		elseif var3086 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4584)
		elseif var3090 == 3 then
			local _ = nil
			local var3101, var3102 = protoModule.readDouble(p117, var3085)
			var3085 = var3102
			var3084.start_opacity = var3101
		elseif var3090 == 4 then
			local _ = nil
			local var3103, var3104 = protoModule.readDouble(p117, var3085)
			var3085 = var3104
			var3084.end_opacity = var3103
		elseif var3090 == 5 then
			local _ = nil
			local var3105, var3106 = protoModule.readDouble(p117, var3085)
			var3085 = var3106
			var3084.degree = var3105
		else
			local _ = nil
			local var3107, var3108 = protoModule.readFixed64(p117, var3085)
			local _ = var3107
			var3085 = var3108
		end
	end
	return var3084
end

function t_117:jsonEncode()
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

function t_117:jsonDecode()
	-- upvalues: t_117 (ref), protoModule (ref)
	local var3109 = t_117.new()
	
	if self.start_color ~= nil then
		var3109.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3109.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3109.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3109.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3109.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3109.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3109.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3109.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3109.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3109
end

t_117.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_117
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p118)
	-- upvalues: t_118 (ref)
	return setmetatable({
		items = if p118 == nil or p118.items == nil then {} else p118.items,
		sort_id = if p118 == nil or p118.sort_id == nil then "" else p118.sort_id,
		recommendation_request_id = if p118 == nil or p118.recommendation_request_id == nil then "" else p118.recommendation_request_id
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3109 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3110 = v:encode()
			local var3111, var3112 = protoModule.writeTag(buff, var3109, 1, protoModule.wireTypes.lengthDelimited)
			var3111, var4613 = protoModule.writeBuffer(var3111, var3112, var3110, buffer.len(var3110))
			buff = var3111
			var3109 = var3112
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3113, var3114 = protoModule.writeTag(buff, var3109, 2, protoModule.wireTypes.lengthDelimited)
		var3113, var4615 = protoModule.writeString(var3113, var3114, self.sort_id)
		buff = var3113
		var3109 = var3114
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3115, var3116 = protoModule.writeTag(buff, var3109, 3, protoModule.wireTypes.lengthDelimited)
		var3115, var4617 = protoModule.writeString(var3115, var3116, self.recommendation_request_id)
		buff = var3115
		var3109 = var3116
	end
	local buff_1 = buffer.create(var3109)
	buffer.copy(buff_1, 0, buff, 0, var3109)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var3117 = t_118.new()
	local var3118 = 0
	while var3118 < buffer.len(p118) do
		local _ = nil
		local var3119 = nil
		local var3120, var3121, var3122 = protoModule.readTag(p118, var3118)
		local var3123 = var3120
		var3119 = var3121
		var3118 = var3122
		
		if var3119 == protoModule.wireTypes.varint then
			local _ = nil
			local var3124, var3125 = protoModule.readVarInt(p118, var3118)
			local _ = var3124
			var3118 = var3125
			continue
		end
		if var3119 == protoModule.wireTypes.lengthDelimited then
			if var3123 == 1 then
				local _ = nil
				local var3126, var3127 = protoModule.readBuffer(p118, var3118)
				var3118 = var3127
				table.insert(var3117.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3126))
			elseif var3123 == 2 then
				local _ = nil
				local var3128, var3129 = protoModule.readBuffer(p118, var3118)
				var3118 = var3129
				var3117.sort_id = buffer.tostring(var3128)
			elseif var3123 == 3 then
				local _ = nil
				local var3130, var3131 = protoModule.readBuffer(p118, var3118)
				var3118 = var3131
				var3117.recommendation_request_id = buffer.tostring(var3130)
			else
				local _ = nil
				local var3132, var3133 = protoModule.readVarInt(p118, var3118)
				var3118 = var3133 + var3132
			end
		elseif var3119 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3134, var3135 = protoModule.readFixed32(p118, var3118)
			local _ = var3134
			var3118 = var3135
		elseif var3119 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3136, var3137 = protoModule.readFixed64(p118, var3118)
			local _ = var3136
			var3118 = var3137
		else
			error("Unsupported wire type: " .. var4621)
		end
	end
	return var3117
end

function t_118:jsonEncode()
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

function t_118:jsonDecode()
	-- upvalues: t_118 (ref), t (ref)
	local var3138 = t_118.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3138.items = t_1
	end
	if self.sort_id ~= nil then
		var3138.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3138.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3138.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3138.recommendation_request_id = self.recommendationRequestId
	end
	return var3138
end

t_118.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_118
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p119)
	-- upvalues: t_119 (ref)
	return setmetatable({
		user_id = if p119 == nil or p119.user_id == nil then "" else p119.user_id
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3139 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3140, var3141 = protoModule.writeTag(buff, var3139, 1, protoModule.wireTypes.lengthDelimited)
		var3140, var4647 = protoModule.writeString(var3140, var3141, self.user_id)
		buff = var3140
		var3139 = var3141
	end
	local buff_1 = buffer.create(var3139)
	buffer.copy(buff_1, 0, buff, 0, var3139)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3139 = t_119.new()
	local var3140 = 0
	while var3140 < buffer.len(p119) do
		local _ = nil
		local var3141 = nil
		local var3142, var3143, var3144 = protoModule.readTag(p119, var3140)
		local var3145 = var3142
		var3141 = var3143
		var3140 = var3144
		
		if var3141 == protoModule.wireTypes.varint then
			local _ = nil
			local var3146, var3147 = protoModule.readVarInt(p119, var3140)
			local _ = var3146
			var3140 = var3147
			continue
		end
		if var3141 == protoModule.wireTypes.lengthDelimited then
			if var3145 == 1 then
				local _ = nil
				local var3148, var3149 = protoModule.readBuffer(p119, var3140)
				var3140 = var3149
				var3139.user_id = buffer.tostring(var3148)
			else
				local _ = nil
				local var3150, var3151 = protoModule.readVarInt(p119, var3140)
				var3140 = var3151 + var3150
			end
		elseif var3141 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3152, var3153 = protoModule.readFixed32(p119, var3140)
			local _ = var3152
			var3140 = var3153
		elseif var3141 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3154, var3155 = protoModule.readFixed64(p119, var3140)
			local _ = var3154
			var3140 = var3155
		else
			error("Unsupported wire type: " .. var4651)
		end
	end
	return var3139
end

function t_119:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_119:jsonDecode()
	-- upvalues: t_119 (ref)
	local var3156 = t_119.new()
	
	if self.user_id ~= nil then
		var3156.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3156.user_id = self.userId
	end
	return var3156
end

t_119.descriptor = {
	name = "FriendRecommendationCarouselInputData_UserRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserRecommendation"
}
t.FriendRecommendationCarouselInputData_UserRecommendation = t_119
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_UserRecommendation)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		contact_id = if p120 == nil or p120.contact_id == nil then "" else p120.contact_id
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3156 = 0
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		local var3157, var3158 = protoModule.writeTag(buff, var3156, 1, protoModule.wireTypes.lengthDelimited)
		var3157, var4671 = protoModule.writeString(var3157, var3158, self.contact_id)
		buff = var3157
		var3156 = var3158
	end
	local buff_1 = buffer.create(var3156)
	buffer.copy(buff_1, 0, buff, 0, var3156)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3156 = t_120.new()
	local var3157 = 0
	while var3157 < buffer.len(p120) do
		local _ = nil
		local var3158 = nil
		local var3159, var3160, var3161 = protoModule.readTag(p120, var3157)
		local var3162 = var3159
		var3158 = var3160
		var3157 = var3161
		
		if var3158 == protoModule.wireTypes.varint then
			local _ = nil
			local var3163, var3164 = protoModule.readVarInt(p120, var3157)
			local _ = var3163
			var3157 = var3164
			continue
		end
		if var3158 == protoModule.wireTypes.lengthDelimited then
			if var3162 == 1 then
				local _ = nil
				local var3165, var3166 = protoModule.readBuffer(p120, var3157)
				var3157 = var3166
				var3156.contact_id = buffer.tostring(var3165)
			else
				local _ = nil
				local var3167, var3168 = protoModule.readVarInt(p120, var3157)
				var3157 = var3168 + var3167
			end
		elseif var3158 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3169, var3170 = protoModule.readFixed32(p120, var3157)
			local _ = var3169
			var3157 = var3170
		elseif var3158 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3171, var3172 = protoModule.readFixed64(p120, var3157)
			local _ = var3171
			var3157 = var3172
		else
			error("Unsupported wire type: " .. var4675)
		end
	end
	return var3156
end

function t_120:jsonEncode()
	local t = {}
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		t.contactId = self.contact_id
	end
	return t
end

function t_120:jsonDecode()
	-- upvalues: t_120 (ref)
	local var3173 = t_120.new()
	
	if self.contact_id ~= nil then
		var3173.contact_id = self.contact_id
	end
	if self.contactId ~= nil then
		var3173.contact_id = self.contactId
	end
	return var3173
end

t_120.descriptor = {
	name = "FriendRecommendationCarouselInputData_ContactRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContactRecommendation"
}
t.FriendRecommendationCarouselInputData_ContactRecommendation = t_120
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_ContactRecommendation)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p121)
	-- upvalues: t_121 (ref)
	return setmetatable({
		kind = if p121 == nil or p121.kind == nil then nil else p121.kind,
		has_pending_friend_request = if p121 == nil or p121.has_pending_friend_request == nil then false else p121.has_pending_friend_request
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3173 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "user" then
			local var3174 = self.kind.value:encode()
			local var3175, var3176 = protoModule.writeTag(buff, var3173, 1, protoModule.wireTypes.lengthDelimited)
			var3175, var4696 = protoModule.writeBuffer(var3175, var3176, var3174, buffer.len(var3174))
			buff = var3175
			var3173 = var3176
		elseif self.kind.type == "contact" then
			local var3177 = self.kind.value:encode()
			local var3178, var3179 = protoModule.writeTag(buff, var3173, 2, protoModule.wireTypes.lengthDelimited)
			var3178, var4699 = protoModule.writeBuffer(var3178, var3179, var3177, buffer.len(var3177))
			buff = var3178
			var3173 = var3179
		end
	end
	if self.has_pending_friend_request then
		local var3180, var3181 = protoModule.writeTag(buff, var3173, 3, protoModule.wireTypes.varint)
		var3180, var4701 = protoModule.writeVarInt(var3180, var3181, if self.has_pending_friend_request then 1 else 0)
		buff = var3180
		var3173 = var3181
	end
	local buff_1 = buffer.create(var3173)
	buffer.copy(buff_1, 0, buff, 0, var3173)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var3173 = t_121.new()
	local var3174 = 0
	while var3174 < buffer.len(p121) do
		local _ = nil
		local var3175 = nil
		local var3176, var3177, var3178 = protoModule.readTag(p121, var3174)
		local var3179 = var3176
		var3175 = var3177
		var3174 = var3178
		
		if var3175 == protoModule.wireTypes.varint then
			if var3179 == 3 then
				local _ = nil
				local var3180, var3181 = protoModule.readVarInt(p121, var3174)
				var3174 = var3181
				var3173.has_pending_friend_request = var3180 ~= 0
			else
				local _ = nil
				local var3182, var3183 = protoModule.readVarInt(p121, var3174)
				local _ = var3182
				var3174 = var3183
			end
		end
		if var3175 == protoModule.wireTypes.lengthDelimited then
			if var3179 == 1 then
				local _ = nil
				local var3184, var3185 = protoModule.readBuffer(p121, var3174)
				var3174 = var3185
				var3173.kind = {
					type = "user",
					value = t.FriendRecommendationCarouselInputData_UserRecommendation.decode(var3184)
				}
			elseif var3179 == 2 then
				local _ = nil
				local var3186, var3187 = protoModule.readBuffer(p121, var3174)
				var3174 = var3187
				var3173.kind = {
					type = "contact",
					value = t.FriendRecommendationCarouselInputData_ContactRecommendation.decode(var3186)
				}
			else
				local _ = nil
				local var3188, var3189 = protoModule.readVarInt(p121, var3174)
				var3174 = var3189 + var3188
			end
		elseif var3175 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3190, var3191 = protoModule.readFixed32(p121, var3174)
			local _ = var3190
			var3174 = var3191
		elseif var3175 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3192, var3193 = protoModule.readFixed64(p121, var3174)
			local _ = var3192
			var3174 = var3193
		else
			error("Unsupported wire type: " .. var4705)
		end
	end
	return var3173
end

function t_121:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "user" then
			t.user = self.kind.value:jsonEncode()
		elseif self.kind.type == "contact" then
			t.contact = self.kind.value:jsonEncode()
		end
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function t_121:jsonDecode()
	-- upvalues: t_121 (ref), t (ref)
	local var3194 = t_121.new()
	
	if self.user ~= nil then
		var3194.kind = {
			type = "user",
			value = t.FriendRecommendationCarouselInputData_UserRecommendation.jsonDecode(self.user)
		}
	end
	if self.contact ~= nil then
		var3194.kind = {
			type = "contact",
			value = t.FriendRecommendationCarouselInputData_ContactRecommendation.jsonDecode(self.contact)
		}
	end
	if self.has_pending_friend_request ~= nil then
		var3194.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3194.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3194
end

t_121.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_121
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p122)
	-- upvalues: t_122 (ref)
	return setmetatable({
		selected_option = if p122 == nil or p122.selected_option == nil then "" else p122.selected_option,
		sort_id = if p122 == nil or p122.sort_id == nil then "" else p122.sort_id,
		options = if p122 == nil or p122.options == nil then {} else p122.options,
		experience_carousel = if p122 == nil or p122.experience_carousel == nil then nil else p122.experience_carousel,
		feed_item_key = if p122 == nil or p122.feed_item_key == nil then "" else p122.feed_item_key
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3194 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3195, var3196 = protoModule.writeTag(buff, var3194, 1, protoModule.wireTypes.lengthDelimited)
		var3195, var4729 = protoModule.writeString(var3195, var3196, self.selected_option)
		buff = var3195
		var3194 = var3196
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3197, var3198 = protoModule.writeTag(buff, var3194, 2, protoModule.wireTypes.lengthDelimited)
		var3197, var4731 = protoModule.writeString(var3197, var3198, self.sort_id)
		buff = var3197
		var3194 = var3198
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3199 = v:encode()
			local var3200, var3201 = protoModule.writeTag(buff, var3194, 3, protoModule.wireTypes.lengthDelimited)
			var3200, var4734 = protoModule.writeBuffer(var3200, var3201, var3199, buffer.len(var3199))
			buff = var3200
			var3194 = var3201
		end
	end
	if self.experience_carousel ~= nil then
		local var3202 = self.experience_carousel:encode()
		local var3203, var3204 = protoModule.writeTag(buff, var3194, 4, protoModule.wireTypes.lengthDelimited)
		var3203, var4737 = protoModule.writeBuffer(var3203, var3204, var3202, buffer.len(var3202))
		buff = var3203
		var3194 = var3204
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3205, var3206 = protoModule.writeTag(buff, var3194, 5, protoModule.wireTypes.lengthDelimited)
		var3205, var4739 = protoModule.writeString(var3205, var3206, self.feed_item_key)
		buff = var3205
		var3194 = var3206
	end
	local buff_1 = buffer.create(var3194)
	buffer.copy(buff_1, 0, buff, 0, var3194)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3207 = t_122.new()
	local var3208 = 0
	while var3208 < buffer.len(p122) do
		local _ = nil
		local var3209 = nil
		local var3210, var3211, var3212 = protoModule.readTag(p122, var3208)
		local var3213 = var3210
		var3209 = var3211
		var3208 = var3212
		
		if var3209 == protoModule.wireTypes.varint then
			local _ = nil
			local var3214, var3215 = protoModule.readVarInt(p122, var3208)
			local _ = var3214
			var3208 = var3215
			continue
		end
		if var3209 == protoModule.wireTypes.lengthDelimited then
			if var3213 == 1 then
				local _ = nil
				local var3216, var3217 = protoModule.readBuffer(p122, var3208)
				var3208 = var3217
				var3207.selected_option = buffer.tostring(var3216)
			elseif var3213 == 2 then
				local _ = nil
				local var3218, var3219 = protoModule.readBuffer(p122, var3208)
				var3208 = var3219
				var3207.sort_id = buffer.tostring(var3218)
			elseif var3213 == 3 then
				local _ = nil
				local var3220, var3221 = protoModule.readBuffer(p122, var3208)
				var3208 = var3221
				table.insert(var3207.options, t.SelectorOption.decode(var3220))
			elseif var3213 == 4 then
				local _ = nil
				local var3222, var3223 = protoModule.readBuffer(p122, var3208)
				var3208 = var3223
				var3207.experience_carousel = t.ExperienceCarouselInputData.decode(var3222)
			elseif var3213 == 5 then
				local _ = nil
				local var3224, var3225 = protoModule.readBuffer(p122, var3208)
				var3208 = var3225
				var3207.feed_item_key = buffer.tostring(var3224)
			else
				local _ = nil
				local var3226, var3227 = protoModule.readVarInt(p122, var3208)
				var3208 = var3227 + var3226
			end
		elseif var3209 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3228, var3229 = protoModule.readFixed32(p122, var3208)
			local _ = var3228
			var3208 = var3229
		elseif var3209 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3230, var3231 = protoModule.readFixed64(p122, var3208)
			local _ = var3230
			var3208 = var3231
		else
			error("Unsupported wire type: " .. var4743)
		end
	end
	return var3207
end

function t_122:jsonEncode()
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

function t_122:jsonDecode()
	-- upvalues: t_122 (ref), t (ref)
	local var3232 = t_122.new()
	
	if self.selected_option ~= nil then
		var3232.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3232.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3232.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3232.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3232.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3232.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3232.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3232.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3232.feed_item_key = self.feedItemKey
	end
	return var3232
end

t_122.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_122
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p123)
	-- upvalues: t_123 (ref)
	return setmetatable({
		id = if p123 == nil or p123.id == nil then "" else p123.id,
		display_name = if p123 == nil or p123.display_name == nil then "" else p123.display_name,
		is_selected = if p123 == nil or p123.is_selected == nil then false else p123.is_selected
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3233 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3234, var3235 = protoModule.writeTag(buff, var3233, 1, protoModule.wireTypes.lengthDelimited)
		var3234, var4773 = protoModule.writeString(var3234, var3235, self.id)
		buff = var3234
		var3233 = var3235
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3236, var3237 = protoModule.writeTag(buff, var3233, 2, protoModule.wireTypes.lengthDelimited)
		var3236, var4775 = protoModule.writeString(var3236, var3237, self.display_name)
		buff = var3236
		var3233 = var3237
	end
	if self.is_selected then
		local var3238, var3239 = protoModule.writeTag(buff, var3233, 3, protoModule.wireTypes.varint)
		var3238, var4777 = protoModule.writeVarInt(var3238, var3239, if self.is_selected then 1 else 0)
		buff = var3238
		var3233 = var3239
	end
	local buff_1 = buffer.create(var3233)
	buffer.copy(buff_1, 0, buff, 0, var3233)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3233 = t_123.new()
	local var3234 = 0
	while var3234 < buffer.len(p123) do
		local _ = nil
		local var3235 = nil
		local var3236, var3237, var3238 = protoModule.readTag(p123, var3234)
		local var3239 = var3236
		var3235 = var3237
		var3234 = var3238
		
		if var3235 == protoModule.wireTypes.varint then
			if var3239 == 3 then
				local _ = nil
				local var3240, var3241 = protoModule.readVarInt(p123, var3234)
				var3234 = var3241
				var3233.is_selected = var3240 ~= 0
			else
				local _ = nil
				local var3242, var3243 = protoModule.readVarInt(p123, var3234)
				local _ = var3242
				var3234 = var3243
			end
		end
		if var3235 == protoModule.wireTypes.lengthDelimited then
			if var3239 == 1 then
				local _ = nil
				local var3244, var3245 = protoModule.readBuffer(p123, var3234)
				var3234 = var3245
				var3233.id = buffer.tostring(var3244)
			elseif var3239 == 2 then
				local _ = nil
				local var3246, var3247 = protoModule.readBuffer(p123, var3234)
				var3234 = var3247
				var3233.display_name = buffer.tostring(var3246)
			else
				local _ = nil
				local var3248, var3249 = protoModule.readVarInt(p123, var3234)
				var3234 = var3249 + var3248
			end
		elseif var3235 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3250, var3251 = protoModule.readFixed32(p123, var3234)
			local _ = var3250
			var3234 = var3251
		elseif var3235 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3252, var3253 = protoModule.readFixed64(p123, var3234)
			local _ = var3252
			var3234 = var3253
		else
			error("Unsupported wire type: " .. var4781)
		end
	end
	return var3233
end

function t_123:jsonEncode()
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

function t_123:jsonDecode()
	-- upvalues: t_123 (ref)
	local var3254 = t_123.new()
	
	if self.id ~= nil then
		var3254.id = self.id
	end
	if self.display_name ~= nil then
		var3254.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3254.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3254.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3254.is_selected = self.isSelected
	end
	return var3254
end

t_123.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_123
typeRegistryModule.default:register(t.SelectorOption)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p124)
	-- upvalues: t_124 (ref)
	return setmetatable({
		cards = if p124 == nil or p124.cards == nil then {} else p124.cards,
		title = if p124 == nil or p124.title == nil then "" else p124.title
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3254 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3255 = v:encode()
			local var3256, var3257 = protoModule.writeTag(buff, var3254, 1, protoModule.wireTypes.lengthDelimited)
			var3256, var4806 = protoModule.writeBuffer(var3256, var3257, var3255, buffer.len(var3255))
			buff = var3256
			var3254 = var3257
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3258, var3259 = protoModule.writeTag(buff, var3254, 2, protoModule.wireTypes.lengthDelimited)
		var3258, var4808 = protoModule.writeString(var3258, var3259, self.title)
		buff = var3258
		var3254 = var3259
	end
	local buff_1 = buffer.create(var3254)
	buffer.copy(buff_1, 0, buff, 0, var3254)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var3260 = t_124.new()
	local var3261 = 0
	while var3261 < buffer.len(p124) do
		local _ = nil
		local var3262 = nil
		local var3263, var3264, var3265 = protoModule.readTag(p124, var3261)
		local var3266 = var3263
		var3262 = var3264
		var3261 = var3265
		
		if var3262 == protoModule.wireTypes.varint then
			local _ = nil
			local var3267, var3268 = protoModule.readVarInt(p124, var3261)
			local _ = var3267
			var3261 = var3268
			continue
		end
		if var3262 == protoModule.wireTypes.lengthDelimited then
			if var3266 == 1 then
				local _ = nil
				local var3269, var3270 = protoModule.readBuffer(p124, var3261)
				var3261 = var3270
				table.insert(var3260.cards, t.GameItemsCardInputData.decode(var3269))
			elseif var3266 == 2 then
				local _ = nil
				local var3271, var3272 = protoModule.readBuffer(p124, var3261)
				var3261 = var3272
				var3260.title = buffer.tostring(var3271)
			else
				local _ = nil
				local var3273, var3274 = protoModule.readVarInt(p124, var3261)
				var3261 = var3274 + var3273
			end
		elseif var3262 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3275, var3276 = protoModule.readFixed32(p124, var3261)
			local _ = var3275
			var3261 = var3276
		elseif var3262 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3277, var3278 = protoModule.readFixed64(p124, var3261)
			local _ = var3277
			var3261 = var3278
		else
			error("Unsupported wire type: " .. var4812)
		end
	end
	return var3260
end

function t_124:jsonEncode()
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
	return t
end

function t_124:jsonDecode()
	-- upvalues: t_124 (ref), t (ref)
	local var3279 = t_124.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3279.cards = t_1
	end
	if self.title ~= nil then
		var3279.title = self.title
	end
	return var3279
end

t_124.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_124
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p125)
	-- upvalues: t_125 (ref)
	return setmetatable({
		universe_id = if p125 == nil or p125.universe_id == nil then "" else p125.universe_id,
		items = if p125 == nil or p125.items == nil then {} else p125.items
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3280 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3281, var3282 = protoModule.writeTag(buff, var3280, 1, protoModule.wireTypes.lengthDelimited)
		var3281, var4836 = protoModule.writeString(var3281, var3282, self.universe_id)
		buff = var3281
		var3280 = var3282
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3283 = v:encode()
			local var3284, var3285 = protoModule.writeTag(buff, var3280, 2, protoModule.wireTypes.lengthDelimited)
			var3284, var4839 = protoModule.writeBuffer(var3284, var3285, var3283, buffer.len(var3283))
			buff = var3284
			var3280 = var3285
		end
	end
	local buff_1 = buffer.create(var3280)
	buffer.copy(buff_1, 0, buff, 0, var3280)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3286 = t_125.new()
	local var3287 = 0
	while var3287 < buffer.len(p125) do
		local _ = nil
		local var3288 = nil
		local var3289, var3290, var3291 = protoModule.readTag(p125, var3287)
		local var3292 = var3289
		var3288 = var3290
		var3287 = var3291
		
		if var3288 == protoModule.wireTypes.varint then
			local _ = nil
			local var3293, var3294 = protoModule.readVarInt(p125, var3287)
			local _ = var3293
			var3287 = var3294
			continue
		end
		if var3288 == protoModule.wireTypes.lengthDelimited then
			if var3292 == 1 then
				local _ = nil
				local var3295, var3296 = protoModule.readBuffer(p125, var3287)
				var3287 = var3296
				var3286.universe_id = buffer.tostring(var3295)
			elseif var3292 == 2 then
				local _ = nil
				local var3297, var3298 = protoModule.readBuffer(p125, var3287)
				var3287 = var3298
				table.insert(var3286.items, t.GameItemInputData.decode(var3297))
			else
				local _ = nil
				local var3299, var3300 = protoModule.readVarInt(p125, var3287)
				var3287 = var3300 + var3299
			end
		elseif var3288 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3301, var3302 = protoModule.readFixed32(p125, var3287)
			local _ = var3301
			var3287 = var3302
		elseif var3288 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3303, var3304 = protoModule.readFixed64(p125, var3287)
			local _ = var3303
			var3287 = var3304
		else
			error("Unsupported wire type: " .. var4843)
		end
	end
	return var3286
end

function t_125:jsonEncode()
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

function t_125:jsonDecode()
	-- upvalues: t_125 (ref), t (ref)
	local var3305 = t_125.new()
	
	if self.universe_id ~= nil then
		var3305.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3305.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3305.items = t_1
	end
	return var3305
end

t_125.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_125
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p126)
	-- upvalues: t_126 (ref)
	return setmetatable({
		item_id = if p126 == nil or p126.item_id == nil then "" else p126.item_id,
		item_type = if p126 == nil or p126.item_type == nil then "" else p126.item_type
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3306 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3307, var3308 = protoModule.writeTag(buff, var3306, 1, protoModule.wireTypes.lengthDelimited)
		var3307, var4867 = protoModule.writeString(var3307, var3308, self.item_id)
		buff = var3307
		var3306 = var3308
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3309, var3310 = protoModule.writeTag(buff, var3306, 2, protoModule.wireTypes.lengthDelimited)
		var3309, var4869 = protoModule.writeString(var3309, var3310, self.item_type)
		buff = var3309
		var3306 = var3310
	end
	local buff_1 = buffer.create(var3306)
	buffer.copy(buff_1, 0, buff, 0, var3306)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3306 = t_126.new()
	local var3307 = 0
	while var3307 < buffer.len(p126) do
		local _ = nil
		local var3308 = nil
		local var3309, var3310, var3311 = protoModule.readTag(p126, var3307)
		local var3312 = var3309
		var3308 = var3310
		var3307 = var3311
		
		if var3308 == protoModule.wireTypes.varint then
			local _ = nil
			local var3313, var3314 = protoModule.readVarInt(p126, var3307)
			local _ = var3313
			var3307 = var3314
			continue
		end
		if var3308 == protoModule.wireTypes.lengthDelimited then
			if var3312 == 1 then
				local _ = nil
				local var3315, var3316 = protoModule.readBuffer(p126, var3307)
				var3307 = var3316
				var3306.item_id = buffer.tostring(var3315)
			elseif var3312 == 2 then
				local _ = nil
				local var3317, var3318 = protoModule.readBuffer(p126, var3307)
				var3307 = var3318
				var3306.item_type = buffer.tostring(var3317)
			else
				local _ = nil
				local var3319, var3320 = protoModule.readVarInt(p126, var3307)
				var3307 = var3320 + var3319
			end
		elseif var3308 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3321, var3322 = protoModule.readFixed32(p126, var3307)
			local _ = var3321
			var3307 = var3322
		elseif var3308 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3323, var3324 = protoModule.readFixed64(p126, var3307)
			local _ = var3323
			var3307 = var3324
		else
			error("Unsupported wire type: " .. var4873)
		end
	end
	return var3306
end

function t_126:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_126:jsonDecode()
	-- upvalues: t_126 (ref)
	local var3325 = t_126.new()
	
	if self.item_id ~= nil then
		var3325.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3325.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3325.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3325.item_type = self.itemType
	end
	return var3325
end

t_126.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_126
typeRegistryModule.default:register(t.GameItemInputData)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p127)
	-- upvalues: t_127 (ref)
	return setmetatable({
		clickout_url = if p127 == nil or p127.clickout_url == nil then "" else p127.clickout_url,
		native_ad_data = if p127 == nil or p127.native_ad_data == nil then "" else p127.native_ad_data,
		payer_name = if p127 == nil or p127.payer_name == nil then nil else p127.payer_name,
		logo_asset_id = if p127 == nil or p127.logo_asset_id == nil then nil else p127.logo_asset_id,
		logo_aspect_ratio = if p127 == nil or p127.logo_aspect_ratio == nil then nil else p127.logo_aspect_ratio,
		cta_text = if p127 == nil or p127.cta_text == nil then nil else p127.cta_text,
		title = if p127 == nil or p127.title == nil then nil else p127.title,
		subtitle = if p127 == nil or p127.subtitle == nil then nil else p127.subtitle,
		image_asset_id = if p127 == nil or p127.image_asset_id == nil then nil else p127.image_asset_id,
		video_asset_id = if p127 == nil or p127.video_asset_id == nil then nil else p127.video_asset_id,
		badge_text = if p127 == nil or p127.badge_text == nil then nil else p127.badge_text,
		badge_analytics_id = if p127 == nil or p127.badge_analytics_id == nil then nil else p127.badge_analytics_id,
		roblox_component = if p127 == nil or p127.roblox_component == nil then nil else p127.roblox_component
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3325 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3326, var3327 = protoModule.writeTag(buff, var3325, 1, protoModule.wireTypes.lengthDelimited)
		var3326, var4895 = protoModule.writeString(var3326, var3327, self.clickout_url)
		buff = var3326
		var3325 = var3327
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3328, var3329 = protoModule.writeTag(buff, var3325, 2, protoModule.wireTypes.lengthDelimited)
		var3328, var4897 = protoModule.writeString(var3328, var3329, self.native_ad_data)
		buff = var3328
		var3325 = var3329
	end
	if self.payer_name ~= nil then
		local var3330, var3331 = protoModule.writeTag(buff, var3325, 3, protoModule.wireTypes.lengthDelimited)
		var3330, var4899 = protoModule.writeString(var3330, var3331, self.payer_name)
		buff = var3330
		var3325 = var3331
	end
	if self.logo_asset_id ~= nil then
		local var3332, var3333 = protoModule.writeTag(buff, var3325, 4, protoModule.wireTypes.lengthDelimited)
		var3332, var4901 = protoModule.writeString(var3332, var3333, self.logo_asset_id)
		buff = var3332
		var3325 = var3333
	end
	if self.logo_aspect_ratio ~= nil then
		local var3334, var3335 = protoModule.writeTag(buff, var3325, 5, protoModule.wireTypes.i64)
		var3334, var4903 = protoModule.writeDouble(var3334, var3335, self.logo_aspect_ratio)
		buff = var3334
		var3325 = var3335
	end
	if self.cta_text ~= nil then
		local var3336, var3337 = protoModule.writeTag(buff, var3325, 6, protoModule.wireTypes.lengthDelimited)
		var3336, var4905 = protoModule.writeString(var3336, var3337, self.cta_text)
		buff = var3336
		var3325 = var3337
	end
	if self.title ~= nil then
		local var3338, var3339 = protoModule.writeTag(buff, var3325, 7, protoModule.wireTypes.lengthDelimited)
		var3338, var4907 = protoModule.writeString(var3338, var3339, self.title)
		buff = var3338
		var3325 = var3339
	end
	if self.subtitle ~= nil then
		local var3340, var3341 = protoModule.writeTag(buff, var3325, 8, protoModule.wireTypes.lengthDelimited)
		var3340, var4909 = protoModule.writeString(var3340, var3341, self.subtitle)
		buff = var3340
		var3325 = var3341
	end
	if self.image_asset_id ~= nil then
		local var3342, var3343 = protoModule.writeTag(buff, var3325, 9, protoModule.wireTypes.lengthDelimited)
		var3342, var4911 = protoModule.writeString(var3342, var3343, self.image_asset_id)
		buff = var3342
		var3325 = var3343
	end
	if self.video_asset_id ~= nil then
		local var3344, var3345 = protoModule.writeTag(buff, var3325, 10, protoModule.wireTypes.lengthDelimited)
		var3344, var4913 = protoModule.writeString(var3344, var3345, self.video_asset_id)
		buff = var3344
		var3325 = var3345
	end
	if self.badge_text ~= nil then
		local var3346, var3347 = protoModule.writeTag(buff, var3325, 11, protoModule.wireTypes.lengthDelimited)
		var3346, var4915 = protoModule.writeString(var3346, var3347, self.badge_text)
		buff = var3346
		var3325 = var3347
	end
	if self.badge_analytics_id ~= nil then
		local var3348, var3349 = protoModule.writeTag(buff, var3325, 12, protoModule.wireTypes.lengthDelimited)
		var3348, var4917 = protoModule.writeString(var3348, var3349, self.badge_analytics_id)
		buff = var3348
		var3325 = var3349
	end
	if self.roblox_component ~= nil then
		local var3350, var3351 = protoModule.writeTag(buff, var3325, 13, protoModule.wireTypes.lengthDelimited)
		var3350, var4919 = protoModule.writeString(var3350, var3351, self.roblox_component)
		buff = var3350
		var3325 = var3351
	end
	local buff_1 = buffer.create(var3325)
	buffer.copy(buff_1, 0, buff, 0, var3325)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3325 = t_127.new()
	local var3326 = 0
	while var3326 < buffer.len(p127) do
		local _ = nil
		local var3327 = nil
		local var3328, var3329, var3330 = protoModule.readTag(p127, var3326)
		local var3331 = var3328
		var3327 = var3329
		var3326 = var3330
		
		if var3327 == protoModule.wireTypes.varint then
			local _ = nil
			local var3332, var3333 = protoModule.readVarInt(p127, var3326)
			local _ = var3332
			var3326 = var3333
			continue
		end
		if var3327 == protoModule.wireTypes.lengthDelimited then
			if var3331 == 1 then
				local _ = nil
				local var3334, var3335 = protoModule.readBuffer(p127, var3326)
				var3326 = var3335
				var3325.clickout_url = buffer.tostring(var3334)
			elseif var3331 == 2 then
				local _ = nil
				local var3336, var3337 = protoModule.readBuffer(p127, var3326)
				var3326 = var3337
				var3325.native_ad_data = buffer.tostring(var3336)
			elseif var3331 == 3 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p127, var3326)
				var3326 = var3339
				var3325.payer_name = buffer.tostring(var3338)
			elseif var3331 == 4 then
				local _ = nil
				local var3340, var3341 = protoModule.readBuffer(p127, var3326)
				var3326 = var3341
				var3325.logo_asset_id = buffer.tostring(var3340)
			elseif var3331 == 6 then
				local _ = nil
				local var3342, var3343 = protoModule.readBuffer(p127, var3326)
				var3326 = var3343
				var3325.cta_text = buffer.tostring(var3342)
			elseif var3331 == 7 then
				local _ = nil
				local var3344, var3345 = protoModule.readBuffer(p127, var3326)
				var3326 = var3345
				var3325.title = buffer.tostring(var3344)
			elseif var3331 == 8 then
				local _ = nil
				local var3346, var3347 = protoModule.readBuffer(p127, var3326)
				var3326 = var3347
				var3325.subtitle = buffer.tostring(var3346)
			elseif var3331 == 9 then
				local _ = nil
				local var3348, var3349 = protoModule.readBuffer(p127, var3326)
				var3326 = var3349
				var3325.image_asset_id = buffer.tostring(var3348)
			elseif var3331 == 10 then
				local _ = nil
				local var3350, var3351 = protoModule.readBuffer(p127, var3326)
				var3326 = var3351
				var3325.video_asset_id = buffer.tostring(var3350)
			elseif var3331 == 11 then
				local _ = nil
				local var3352, var3353 = protoModule.readBuffer(p127, var3326)
				var3326 = var3353
				var3325.badge_text = buffer.tostring(var3352)
			elseif var3331 == 12 then
				local _ = nil
				local var3354, var3355 = protoModule.readBuffer(p127, var3326)
				var3326 = var3355
				var3325.badge_analytics_id = buffer.tostring(var3354)
			elseif var3331 == 13 then
				local _ = nil
				local var3356, var3357 = protoModule.readBuffer(p127, var3326)
				var3326 = var3357
				var3325.roblox_component = buffer.tostring(var3356)
			else
				local _ = nil
				local var3358, var3359 = protoModule.readVarInt(p127, var3326)
				var3326 = var3359 + var3358
			end
		elseif var3327 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3360, var3361 = protoModule.readFixed32(p127, var3326)
			local _ = var3360
			var3326 = var3361
		elseif var3327 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4923)
		elseif var3331 == 5 then
			local _ = nil
			local var3362, var3363 = protoModule.readDouble(p127, var3326)
			var3326 = var3363
			var3325.logo_aspect_ratio = var3362
		else
			local _ = nil
			local var3364, var3365 = protoModule.readFixed64(p127, var3326)
			local _ = var3364
			var3326 = var3365
		end
	end
	return var3325
end

function t_127:jsonEncode()
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

function t_127:jsonDecode()
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3366 = t_127.new()
	
	if self.clickout_url ~= nil then
		var3366.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3366.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3366.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3366.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3366.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3366.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3366.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3366.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3366.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3366.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3366.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3366.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3366.title = self.title
	end
	if self.subtitle ~= nil then
		var3366.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3366.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3366.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3366.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3366.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3366.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3366.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3366.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3366.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3366.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3366.roblox_component = self.robloxComponent
	end
	return var3366
end

t_127.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = t_127
typeRegistryModule.default:register(t.AdLinkItem)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p128)
	-- upvalues: t_128 (ref)
	return setmetatable({
		layout = if p128 == nil or p128.layout == nil then nil else p128.layout,
		kind = if p128 == nil or p128.kind == nil then nil else p128.kind
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3366 = 0
	
	if self.layout ~= nil then
		local var3367 = self.layout:encode()
		local var3368, var3369 = protoModule.writeTag(buff, var3366, 1, protoModule.wireTypes.lengthDelimited)
		var3368, var4968 = protoModule.writeBuffer(var3368, var3369, var3367, buffer.len(var3367))
		buff = var3368
		var3366 = var3369
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3370 = self.kind.value:encode()
			local var3371, var3372 = protoModule.writeTag(buff, var3366, 2, protoModule.wireTypes.lengthDelimited)
			var3371, var4971 = protoModule.writeBuffer(var3371, var3372, var3370, buffer.len(var3370))
			buff = var3371
			var3366 = var3372
		elseif self.kind.type == "ad_link" then
			local var3373 = self.kind.value:encode()
			local var3374, var3375 = protoModule.writeTag(buff, var3366, 3, protoModule.wireTypes.lengthDelimited)
			var3374, var4974 = protoModule.writeBuffer(var3374, var3375, var3373, buffer.len(var3373))
			buff = var3374
			var3366 = var3375
		end
	end
	local buff_1 = buffer.create(var3366)
	buffer.copy(buff_1, 0, buff, 0, var3366)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var3366 = t_128.new()
	local var3367 = 0
	while var3367 < buffer.len(p128) do
		local _ = nil
		local var3368 = nil
		local var3369, var3370, var3371 = protoModule.readTag(p128, var3367)
		local var3372 = var3369
		var3368 = var3370
		var3367 = var3371
		
		if var3368 == protoModule.wireTypes.varint then
			local _ = nil
			local var3373, var3374 = protoModule.readVarInt(p128, var3367)
			local _ = var3373
			var3367 = var3374
			continue
		end
		if var3368 == protoModule.wireTypes.lengthDelimited then
			if var3372 == 1 then
				local _ = nil
				local var3375, var3376 = protoModule.readBuffer(p128, var3367)
				var3367 = var3376
				var3366.layout = t.ItemLayout.decode(var3375)
			elseif var3372 == 2 then
				local _ = nil
				local var3377, var3378 = protoModule.readBuffer(p128, var3367)
				var3367 = var3378
				var3366.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3377)
				}
			elseif var3372 == 3 then
				local _ = nil
				local var3379, var3380 = protoModule.readBuffer(p128, var3367)
				var3367 = var3380
				var3366.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3379) }
			else
				local _ = nil
				local var3381, var3382 = protoModule.readVarInt(p128, var3367)
				var3367 = var3382 + var3381
			end
		elseif var3368 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3383, var3384 = protoModule.readFixed32(p128, var3367)
			local _ = var3383
			var3367 = var3384
		elseif var3368 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3385, var3386 = protoModule.readFixed64(p128, var3367)
			local _ = var3385
			var3367 = var3386
		else
			error("Unsupported wire type: " .. var4978)
		end
	end
	return var3366
end

function t_128:jsonEncode()
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

function t_128:jsonDecode()
	-- upvalues: t_128 (ref), t (ref)
	local var3387 = t_128.new()
	
	if self.layout ~= nil then
		var3387.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3387.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3387.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3387.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3387
end

t_128.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_128
typeRegistryModule.default:register(t.ItemWithLayout)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p129)
	-- upvalues: t_129 (ref)
	return setmetatable({
		items = if p129 == nil or p129.items == nil then {} else p129.items,
		collection_item_size = if p129 == nil or p129.collection_item_size == nil then nil else p129.collection_item_size
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3387 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3388 = v:encode()
			local var3389, var3390 = protoModule.writeTag(buff, var3387, 1, protoModule.wireTypes.lengthDelimited)
			var3389, var5003 = protoModule.writeBuffer(var3389, var3390, var3388, buffer.len(var3388))
			buff = var3389
			var3387 = var3390
		end
	end
	if self.collection_item_size ~= nil then
		local var3391, var3392 = protoModule.writeTag(buff, var3387, 2, protoModule.wireTypes.lengthDelimited)
		var3391, var5005 = protoModule.writeString(var3391, var3392, self.collection_item_size)
		buff = var3391
		var3387 = var3392
	end
	local buff_1 = buffer.create(var3387)
	buffer.copy(buff_1, 0, buff, 0, var3387)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3393 = t_129.new()
	local var3394 = 0
	while var3394 < buffer.len(p129) do
		local _ = nil
		local var3395 = nil
		local var3396, var3397, var3398 = protoModule.readTag(p129, var3394)
		local var3399 = var3396
		var3395 = var3397
		var3394 = var3398
		
		if var3395 == protoModule.wireTypes.varint then
			local _ = nil
			local var3400, var3401 = protoModule.readVarInt(p129, var3394)
			local _ = var3400
			var3394 = var3401
			continue
		end
		if var3395 == protoModule.wireTypes.lengthDelimited then
			if var3399 == 1 then
				local _ = nil
				local var3402, var3403 = protoModule.readBuffer(p129, var3394)
				var3394 = var3403
				table.insert(var3393.items, t.ItemWithLayout.decode(var3402))
			elseif var3399 == 2 then
				local _ = nil
				local var3404, var3405 = protoModule.readBuffer(p129, var3394)
				var3394 = var3405
				var3393.collection_item_size = buffer.tostring(var3404)
			else
				local _ = nil
				local var3406, var3407 = protoModule.readVarInt(p129, var3394)
				var3394 = var3407 + var3406
			end
		elseif var3395 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3408, var3409 = protoModule.readFixed32(p129, var3394)
			local _ = var3408
			var3394 = var3409
		elseif var3395 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3410, var3411 = protoModule.readFixed64(p129, var3394)
			local _ = var3410
			var3394 = var3411
		else
			error("Unsupported wire type: " .. var5009)
		end
	end
	return var3393
end

function t_129:jsonEncode()
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

function t_129:jsonDecode()
	-- upvalues: t_129 (ref), t (ref)
	local var3412 = t_129.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3412.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3412.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3412.collection_item_size = self.collectionItemSize
	end
	return var3412
end

t_129.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_129
typeRegistryModule.default:register(t.ContentPool)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p130)
	-- upvalues: t_130 (ref)
	return setmetatable({
		col_span = if p130 == nil or p130.col_span == nil then 0 else p130.col_span,
		row_span = if p130 == nil or p130.row_span == nil then 0 else p130.row_span,
		alignment_type = if p130 == nil or p130.alignment_type == nil then "" else p130.alignment_type,
		min_row_padding = if p130 == nil or p130.min_row_padding == nil then 0 else p130.min_row_padding
	}, t_130)
end

function t_130:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3413 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3414, var3415 = protoModule.writeTag(buff, var3413, 1, protoModule.wireTypes.varint)
		var3414, var5033 = protoModule.writeVarInt(var3414, var3415, self.col_span)
		buff = var3414
		var3413 = var3415
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3416, var3417 = protoModule.writeTag(buff, var3413, 2, protoModule.wireTypes.varint)
		var3416, var5035 = protoModule.writeVarInt(var3416, var3417, self.row_span)
		buff = var3416
		var3413 = var3417
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3418, var3419 = protoModule.writeTag(buff, var3413, 3, protoModule.wireTypes.lengthDelimited)
		var3418, var5037 = protoModule.writeString(var3418, var3419, self.alignment_type)
		buff = var3418
		var3413 = var3419
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3420, var3421 = protoModule.writeTag(buff, var3413, 4, protoModule.wireTypes.varint)
		var3420, var5039 = protoModule.writeVarInt(var3420, var3421, self.min_row_padding)
		buff = var3420
		var3413 = var3421
	end
	local buff_1 = buffer.create(var3413)
	buffer.copy(buff_1, 0, buff, 0, var3413)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref)
	local var3413 = t_130.new()
	local var3414 = 0
	while var3414 < buffer.len(p130) do
		local _ = nil
		local var3415 = nil
		local var3416, var3417, var3418 = protoModule.readTag(p130, var3414)
		local var3419 = var3416
		var3415 = var3417
		var3414 = var3418
		
		if var3415 == protoModule.wireTypes.varint then
			if var3419 == 1 then
				local _ = nil
				local var3420, var3421 = protoModule.readVarIntI32(p130, var3414)
				var3414 = var3421
				var3413.col_span = var3420
			elseif var3419 == 2 then
				local _ = nil
				local var3422, var3423 = protoModule.readVarIntI32(p130, var3414)
				var3414 = var3423
				var3413.row_span = var3422
			elseif var3419 == 4 then
				local _ = nil
				local var3424, var3425 = protoModule.readVarIntI32(p130, var3414)
				var3414 = var3425
				var3413.min_row_padding = var3424
			else
				local _ = nil
				local var3426, var3427 = protoModule.readVarInt(p130, var3414)
				local _ = var3426
				var3414 = var3427
			end
		end
		if var3415 == protoModule.wireTypes.lengthDelimited then
			if var3419 == 3 then
				local _ = nil
				local var3428, var3429 = protoModule.readBuffer(p130, var3414)
				var3414 = var3429
				var3413.alignment_type = buffer.tostring(var3428)
			else
				local _ = nil
				local var3430, var3431 = protoModule.readVarInt(p130, var3414)
				var3414 = var3431 + var3430
			end
		elseif var3415 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3432, var3433 = protoModule.readFixed32(p130, var3414)
			local _ = var3432
			var3414 = var3433
		elseif var3415 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3434, var3435 = protoModule.readFixed64(p130, var3414)
			local _ = var3434
			var3414 = var3435
		else
			error("Unsupported wire type: " .. var5043)
		end
	end
	return var3413
end

function t_130:jsonEncode()
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

function t_130:jsonDecode()
	-- upvalues: t_130 (ref)
	local var3436 = t_130.new()
	
	if self.col_span ~= nil then
		var3436.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3436.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3436.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3436.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3436.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3436.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3436.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3436.min_row_padding = self.minRowPadding
	end
	return var3436
end

t_130.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_130
typeRegistryModule.default:register(t.ItemLayout)
t.PageEntryFormat = {
	fromNumber = function(p131)
		return if p131 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p131 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p131)
		return if p131 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p131 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p131
	end,
	fromName = function(p131)
		return if p131 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p131 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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
	HeroUnitInputData = t.HeroUnitInputData,
	HeroUnitInputData_VisualAsset = t.HeroUnitInputData_VisualAsset,
	HeroUnitInputData_Gradient = t.HeroUnitInputData_Gradient,
	FriendRecommendationCarouselInputData = t.FriendRecommendationCarouselInputData,
	FriendRecommendationCarouselInputData_UserRecommendation = t.FriendRecommendationCarouselInputData_UserRecommendation,
	FriendRecommendationCarouselInputData_ContactRecommendation = t.FriendRecommendationCarouselInputData_ContactRecommendation,
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
	PageEntryFormat = t.PageEntryFormat
}