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
		has_game_passes = if p28 == nil or p28.has_game_passes == nil then false else p28.has_game_passes
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
			else
				local _ = nil
				local var754, var755 = protoModule.readVarInt(p28, var738)
				var738 = var755 + var754
			end
		elseif var739 == protoModule.wireTypes.i32 then
			local _ = nil
			local var756, var757 = protoModule.readFixed32(p28, var738)
			local _ = var756
			var738 = var757
		elseif var739 == protoModule.wireTypes.i64 then
			local _ = nil
			local var758, var759 = protoModule.readFixed64(p28, var738)
			local _ = var758
			var738 = var759
		else
			error("Unsupported wire type: " .. var1332)
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
	return t
end

function t_28:jsonDecode()
	-- upvalues: t_28 (ref)
	local var760 = t_28.new()
	
	if self.universe_id ~= nil then
		var760.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var760.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var760.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var760.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var760.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var760.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var760.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var760.has_game_passes = self.hasGamePasses
	end
	return var760
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
	local var760 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var761, var762 = protoModule.writeTag(buff, var760, 1, protoModule.wireTypes.lengthDelimited)
		var761, var1358 = protoModule.writeString(var761, var762, self.universe_id)
		buff = var761
		var760 = var762
	end
	local buff_1 = buffer.create(var760)
	buffer.copy(buff_1, 0, buff, 0, var760)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var760 = t_29.new()
	local var761 = 0
	while var761 < buffer.len(p29) do
		local _ = nil
		local var762 = nil
		local var763, var764, var765 = protoModule.readTag(p29, var761)
		local var766 = var763
		var762 = var764
		var761 = var765
		
		if var762 == protoModule.wireTypes.varint then
			local _ = nil
			local var767, var768 = protoModule.readVarInt(p29, var761)
			local _ = var767
			var761 = var768
			continue
		end
		if var762 == protoModule.wireTypes.lengthDelimited then
			if var766 == 1 then
				local _ = nil
				local var769, var770 = protoModule.readBuffer(p29, var761)
				var761 = var770
				var760.universe_id = buffer.tostring(var769)
			else
				local _ = nil
				local var771, var772 = protoModule.readVarInt(p29, var761)
				var761 = var772 + var771
			end
		elseif var762 == protoModule.wireTypes.i32 then
			local _ = nil
			local var773, var774 = protoModule.readFixed32(p29, var761)
			local _ = var773
			var761 = var774
		elseif var762 == protoModule.wireTypes.i64 then
			local _ = nil
			local var775, var776 = protoModule.readFixed64(p29, var761)
			local _ = var775
			var761 = var776
		else
			error("Unsupported wire type: " .. var1362)
		end
	end
	return var760
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
	local var777 = t_29.new()
	
	if self.universe_id ~= nil then
		var777.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var777.universe_id = self.universeId
	end
	return var777
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
	local var777 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var778, var779 = protoModule.writeTag(buff, var777, 1, protoModule.wireTypes.lengthDelimited)
		var778, var1382 = protoModule.writeString(var778, var779, self.universe_id)
		buff = var778
		var777 = var779
	end
	if self.user_owns_experience then
		local var780, var781 = protoModule.writeTag(buff, var777, 2, protoModule.wireTypes.varint)
		var780, var1384 = protoModule.writeVarInt(var780, var781, if self.user_owns_experience then 1 else 0)
		buff = var780
		var777 = var781
	end
	local buff_1 = buffer.create(var777)
	buffer.copy(buff_1, 0, buff, 0, var777)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var777 = t_30.new()
	local var778 = 0
	while var778 < buffer.len(p30) do
		local _ = nil
		local var779 = nil
		local var780, var781, var782 = protoModule.readTag(p30, var778)
		local var783 = var780
		var779 = var781
		var778 = var782
		
		if var779 == protoModule.wireTypes.varint then
			if var783 == 2 then
				local _ = nil
				local var784, var785 = protoModule.readVarInt(p30, var778)
				var778 = var785
				var777.user_owns_experience = var784 ~= 0
			else
				local _ = nil
				local var786, var787 = protoModule.readVarInt(p30, var778)
				local _ = var786
				var778 = var787
			end
		end
		if var779 == protoModule.wireTypes.lengthDelimited then
			if var783 == 1 then
				local _ = nil
				local var788, var789 = protoModule.readBuffer(p30, var778)
				var778 = var789
				var777.universe_id = buffer.tostring(var788)
			else
				local _ = nil
				local var790, var791 = protoModule.readVarInt(p30, var778)
				var778 = var791 + var790
			end
		elseif var779 == protoModule.wireTypes.i32 then
			local _ = nil
			local var792, var793 = protoModule.readFixed32(p30, var778)
			local _ = var792
			var778 = var793
		elseif var779 == protoModule.wireTypes.i64 then
			local _ = nil
			local var794, var795 = protoModule.readFixed64(p30, var778)
			local _ = var794
			var778 = var795
		else
			error("Unsupported wire type: " .. var1388)
		end
	end
	return var777
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
	local var796 = t_30.new()
	
	if self.universe_id ~= nil then
		var796.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var796.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var796.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var796.user_owns_experience = self.userOwnsExperience
	end
	return var796
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
	local var796 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var797, var798 = protoModule.writeTag(buff, var796, 1, protoModule.wireTypes.lengthDelimited)
		var797, var1410 = protoModule.writeString(var797, var798, self.universe_id)
		buff = var797
		var796 = var798
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var799, var800 = protoModule.writeTag(buff, var796, 2, protoModule.wireTypes.lengthDelimited)
		var799, var1412 = protoModule.writeString(var799, var800, self.place_id)
		buff = var799
		var796 = var800
	end
	local buff_1 = buffer.create(var796)
	buffer.copy(buff_1, 0, buff, 0, var796)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var796 = t_31.new()
	local var797 = 0
	while var797 < buffer.len(p31) do
		local _ = nil
		local var798 = nil
		local var799, var800, var801 = protoModule.readTag(p31, var797)
		local var802 = var799
		var798 = var800
		var797 = var801
		
		if var798 == protoModule.wireTypes.varint then
			local _ = nil
			local var803, var804 = protoModule.readVarInt(p31, var797)
			local _ = var803
			var797 = var804
			continue
		end
		if var798 == protoModule.wireTypes.lengthDelimited then
			if var802 == 1 then
				local _ = nil
				local var805, var806 = protoModule.readBuffer(p31, var797)
				var797 = var806
				var796.universe_id = buffer.tostring(var805)
			elseif var802 == 2 then
				local _ = nil
				local var807, var808 = protoModule.readBuffer(p31, var797)
				var797 = var808
				var796.place_id = buffer.tostring(var807)
			else
				local _ = nil
				local var809, var810 = protoModule.readVarInt(p31, var797)
				var797 = var810 + var809
			end
		elseif var798 == protoModule.wireTypes.i32 then
			local _ = nil
			local var811, var812 = protoModule.readFixed32(p31, var797)
			local _ = var811
			var797 = var812
		elseif var798 == protoModule.wireTypes.i64 then
			local _ = nil
			local var813, var814 = protoModule.readFixed64(p31, var797)
			local _ = var813
			var797 = var814
		else
			error("Unsupported wire type: " .. var1416)
		end
	end
	return var796
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
	local var815 = t_31.new()
	
	if self.universe_id ~= nil then
		var815.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var815.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var815.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var815.place_id = self.placeId
	end
	return var815
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
	local var815 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var816, var817 = protoModule.writeTag(buff, var815, 1, protoModule.wireTypes.lengthDelimited)
		var816, var1438 = protoModule.writeString(var816, var817, self.community_id)
		buff = var816
		var815 = var817
	end
	local buff_1 = buffer.create(var815)
	buffer.copy(buff_1, 0, buff, 0, var815)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var815 = t_32.new()
	local var816 = 0
	while var816 < buffer.len(p32) do
		local _ = nil
		local var817 = nil
		local var818, var819, var820 = protoModule.readTag(p32, var816)
		local var821 = var818
		var817 = var819
		var816 = var820
		
		if var817 == protoModule.wireTypes.varint then
			local _ = nil
			local var822, var823 = protoModule.readVarInt(p32, var816)
			local _ = var822
			var816 = var823
			continue
		end
		if var817 == protoModule.wireTypes.lengthDelimited then
			if var821 == 1 then
				local _ = nil
				local var824, var825 = protoModule.readBuffer(p32, var816)
				var816 = var825
				var815.community_id = buffer.tostring(var824)
			else
				local _ = nil
				local var826, var827 = protoModule.readVarInt(p32, var816)
				var816 = var827 + var826
			end
		elseif var817 == protoModule.wireTypes.i32 then
			local _ = nil
			local var828, var829 = protoModule.readFixed32(p32, var816)
			local _ = var828
			var816 = var829
		elseif var817 == protoModule.wireTypes.i64 then
			local _ = nil
			local var830, var831 = protoModule.readFixed64(p32, var816)
			local _ = var830
			var816 = var831
		else
			error("Unsupported wire type: " .. var1442)
		end
	end
	return var815
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
	local var832 = t_32.new()
	
	if self.community_id ~= nil then
		var832.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var832.community_id = self.communityId
	end
	return var832
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
	local var832 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var833 = v:encode()
			local var834, var835 = protoModule.writeTag(buff, var832, 1, protoModule.wireTypes.lengthDelimited)
			var834, var1463 = protoModule.writeBuffer(var834, var835, var833, buffer.len(var833))
			buff = var834
			var832 = var835
		end
	end
	local buff_1 = buffer.create(var832)
	buffer.copy(buff_1, 0, buff, 0, var832)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var836 = t_33.new()
	local var837 = 0
	while var837 < buffer.len(p33) do
		local _ = nil
		local var838 = nil
		local var839, var840, var841 = protoModule.readTag(p33, var837)
		local var842 = var839
		var838 = var840
		var837 = var841
		
		if var838 == protoModule.wireTypes.varint then
			local _ = nil
			local var843, var844 = protoModule.readVarInt(p33, var837)
			local _ = var843
			var837 = var844
			continue
		end
		if var838 == protoModule.wireTypes.lengthDelimited then
			if var842 == 1 then
				local _ = nil
				local var845, var846 = protoModule.readBuffer(p33, var837)
				var837 = var846
				table.insert(var836.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var845))
			else
				local _ = nil
				local var847, var848 = protoModule.readVarInt(p33, var837)
				var837 = var848 + var847
			end
		elseif var838 == protoModule.wireTypes.i32 then
			local _ = nil
			local var849, var850 = protoModule.readFixed32(p33, var837)
			local _ = var849
			var837 = var850
		elseif var838 == protoModule.wireTypes.i64 then
			local _ = nil
			local var851, var852 = protoModule.readFixed64(p33, var837)
			local _ = var851
			var837 = var852
		else
			error("Unsupported wire type: " .. var1467)
		end
	end
	return var836
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
	local var853 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var853.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var853.social_link_items = t_1
	end
	return var853
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
	local var854 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var855, var856 = protoModule.writeTag(buff, var854, 1, protoModule.wireTypes.lengthDelimited)
		var855, var1490 = protoModule.writeString(var855, var856, self.social_link_id)
		buff = var855
		var854 = var856
	end
	local buff_1 = buffer.create(var854)
	buffer.copy(buff_1, 0, buff, 0, var854)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref)
	local var854 = t_34.new()
	local var855 = 0
	while var855 < buffer.len(p34) do
		local _ = nil
		local var856 = nil
		local var857, var858, var859 = protoModule.readTag(p34, var855)
		local var860 = var857
		var856 = var858
		var855 = var859
		
		if var856 == protoModule.wireTypes.varint then
			local _ = nil
			local var861, var862 = protoModule.readVarInt(p34, var855)
			local _ = var861
			var855 = var862
			continue
		end
		if var856 == protoModule.wireTypes.lengthDelimited then
			if var860 == 1 then
				local _ = nil
				local var863, var864 = protoModule.readBuffer(p34, var855)
				var855 = var864
				var854.social_link_id = buffer.tostring(var863)
			else
				local _ = nil
				local var865, var866 = protoModule.readVarInt(p34, var855)
				var855 = var866 + var865
			end
		elseif var856 == protoModule.wireTypes.i32 then
			local _ = nil
			local var867, var868 = protoModule.readFixed32(p34, var855)
			local _ = var867
			var855 = var868
		elseif var856 == protoModule.wireTypes.i64 then
			local _ = nil
			local var869, var870 = protoModule.readFixed64(p34, var855)
			local _ = var869
			var855 = var870
		else
			error("Unsupported wire type: " .. var1494)
		end
	end
	return var854
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
	local var871 = t_34.new()
	
	if self.social_link_id ~= nil then
		var871.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var871.social_link_id = self.socialLinkId
	end
	return var871
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
		sponsored_user_cohort = if p35 == nil or p35.sponsored_user_cohort == nil then nil else p35.sponsored_user_cohort
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var871 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var872, var873 = protoModule.writeTag(buff, var871, 1, protoModule.wireTypes.lengthDelimited)
		var872, var1514 = protoModule.writeString(var872, var873, self.title)
		buff = var872
		var871 = var873
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var874 = v:encode()
			local var875, var876 = protoModule.writeTag(buff, var871, 2, protoModule.wireTypes.lengthDelimited)
			var875, var1517 = protoModule.writeBuffer(var875, var876, var874, buffer.len(var874))
			buff = var875
			var871 = var876
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var877, var878 = protoModule.writeTag(buff, var871, 3, protoModule.wireTypes.lengthDelimited)
		var877, var1519 = protoModule.writeString(var877, var878, self.next_page_token)
		buff = var877
		var871 = var878
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var879, var880 = protoModule.writeTag(buff, var871, 4, protoModule.wireTypes.lengthDelimited)
		var879, var1521 = protoModule.writeString(var879, var880, self.sort_id)
		buff = var879
		var871 = var880
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var881, var882 = protoModule.writeTag(buff, var871, 5, protoModule.wireTypes.varint)
		var881, var1523 = protoModule.writeVarInt(var881, var882, self.secondary_sort_id)
		buff = var881
		var871 = var882
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var883, var884 = protoModule.writeTag(buff, var871, 6, protoModule.wireTypes.varint)
		var883, var1525 = protoModule.writeVarInt(var883, var884, self.max_visible_rows)
		buff = var883
		var871 = var884
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var885, var886 = protoModule.writeTag(buff, var871, 7, protoModule.wireTypes.lengthDelimited)
		var885, var1527 = protoModule.writeString(var885, var886, self.subtitle)
		buff = var885
		var871 = var886
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var887, var888 = protoModule.writeTag(buff, var871, 8, protoModule.wireTypes.lengthDelimited)
		var887, var1529 = protoModule.writeString(var887, var888, self.info_text)
		buff = var887
		var871 = var888
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var889, var890 = protoModule.writeTag(buff, var871, 9, protoModule.wireTypes.lengthDelimited)
		var889, var1531 = protoModule.writeString(var889, var890, self.subtitle_link_path)
		buff = var889
		var871 = var890
	end
	if self.is_placeholder ~= nil then
		local var891, var892 = protoModule.writeTag(buff, var871, 10, protoModule.wireTypes.varint)
		var891, var1533 = protoModule.writeVarInt(var891, var892, if self.is_placeholder then 1 else 0)
		buff = var891
		var871 = var892
	end
	if self.primary_sort_id ~= nil then
		local var893, var894 = protoModule.writeTag(buff, var871, 11, protoModule.wireTypes.varint)
		var893, var1535 = protoModule.writeVarInt(var893, var894, self.primary_sort_id)
		buff = var893
		var871 = var894
	end
	if self.applied_filters ~= nil then
		local var895, var896 = protoModule.writeTag(buff, var871, 12, protoModule.wireTypes.lengthDelimited)
		var895, var1537 = protoModule.writeString(var895, var896, self.applied_filters)
		buff = var895
		var871 = var896
	end
	if self.pool_id ~= nil then
		local var897, var898 = protoModule.writeTag(buff, var871, 13, protoModule.wireTypes.lengthDelimited)
		var897, var1539 = protoModule.writeString(var897, var898, self.pool_id)
		buff = var897
		var871 = var898
	end
	if self.has_emphasized_tile then
		local var899, var900 = protoModule.writeTag(buff, var871, 14, protoModule.wireTypes.varint)
		var899, var1541 = protoModule.writeVarInt(var899, var900, if self.has_emphasized_tile then 1 else 0)
		buff = var899
		var871 = var900
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var901, var902 = protoModule.writeTag(buff, var871, 15, protoModule.wireTypes.lengthDelimited)
		var901, var1543 = protoModule.writeString(var901, var902, self.tile_activation_mode)
		buff = var901
		var871 = var902
	end
	if self.sponsored_user_cohort ~= nil then
		local var903, var904 = protoModule.writeTag(buff, var871, 18, protoModule.wireTypes.lengthDelimited)
		var903, var1545 = protoModule.writeString(var903, var904, self.sponsored_user_cohort)
		buff = var903
		var871 = var904
	end
	local buff_1 = buffer.create(var871)
	buffer.copy(buff_1, 0, buff, 0, var871)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var905 = t_35.new()
	local var906 = 0
	while var906 < buffer.len(p35) do
		local _ = nil
		local var907 = nil
		local var908, var909, var910 = protoModule.readTag(p35, var906)
		local var911 = var908
		var907 = var909
		var906 = var910
		
		if var907 == protoModule.wireTypes.varint then
			if var911 == 5 then
				local _ = nil
				local var912, var913 = protoModule.readVarIntI32(p35, var906)
				var906 = var913
				var905.secondary_sort_id = var912
			elseif var911 == 6 then
				local _ = nil
				local var914, var915 = protoModule.readVarIntI32(p35, var906)
				var906 = var915
				var905.max_visible_rows = var914
			elseif var911 == 10 then
				local _ = nil
				local var916, var917 = protoModule.readVarInt(p35, var906)
				var906 = var917
				var905.is_placeholder = var916 ~= 0
			elseif var911 == 11 then
				local _ = nil
				local var918, var919 = protoModule.readVarIntI32(p35, var906)
				var906 = var919
				var905.primary_sort_id = var918
			elseif var911 == 14 then
				local _ = nil
				local var920, var921 = protoModule.readVarInt(p35, var906)
				var906 = var921
				var905.has_emphasized_tile = var920 ~= 0
			else
				local _ = nil
				local var922, var923 = protoModule.readVarInt(p35, var906)
				local _ = var922
				var906 = var923
			end
		end
		if var907 == protoModule.wireTypes.lengthDelimited then
			if var911 == 1 then
				local _ = nil
				local var924, var925 = protoModule.readBuffer(p35, var906)
				var906 = var925
				var905.title = buffer.tostring(var924)
			elseif var911 == 2 then
				local _ = nil
				local var926, var927 = protoModule.readBuffer(p35, var906)
				var906 = var927
				table.insert(var905.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var926))
			elseif var911 == 3 then
				local _ = nil
				local var928, var929 = protoModule.readBuffer(p35, var906)
				var906 = var929
				var905.next_page_token = buffer.tostring(var928)
			elseif var911 == 4 then
				local _ = nil
				local var930, var931 = protoModule.readBuffer(p35, var906)
				var906 = var931
				var905.sort_id = buffer.tostring(var930)
			elseif var911 == 7 then
				local _ = nil
				local var932, var933 = protoModule.readBuffer(p35, var906)
				var906 = var933
				var905.subtitle = buffer.tostring(var932)
			elseif var911 == 8 then
				local _ = nil
				local var934, var935 = protoModule.readBuffer(p35, var906)
				var906 = var935
				var905.info_text = buffer.tostring(var934)
			elseif var911 == 9 then
				local _ = nil
				local var936, var937 = protoModule.readBuffer(p35, var906)
				var906 = var937
				var905.subtitle_link_path = buffer.tostring(var936)
			elseif var911 == 12 then
				local _ = nil
				local var938, var939 = protoModule.readBuffer(p35, var906)
				var906 = var939
				var905.applied_filters = buffer.tostring(var938)
			elseif var911 == 13 then
				local _ = nil
				local var940, var941 = protoModule.readBuffer(p35, var906)
				var906 = var941
				var905.pool_id = buffer.tostring(var940)
			elseif var911 == 15 then
				local _ = nil
				local var942, var943 = protoModule.readBuffer(p35, var906)
				var906 = var943
				var905.tile_activation_mode = buffer.tostring(var942)
			elseif var911 == 18 then
				local _ = nil
				local var944, var945 = protoModule.readBuffer(p35, var906)
				var906 = var945
				var905.sponsored_user_cohort = buffer.tostring(var944)
			else
				local _ = nil
				local var946, var947 = protoModule.readVarInt(p35, var906)
				var906 = var947 + var946
			end
		elseif var907 == protoModule.wireTypes.i32 then
			local _ = nil
			local var948, var949 = protoModule.readFixed32(p35, var906)
			local _ = var948
			var906 = var949
		elseif var907 == protoModule.wireTypes.i64 then
			local _ = nil
			local var950, var951 = protoModule.readFixed64(p35, var906)
			local _ = var950
			var906 = var951
		else
			error("Unsupported wire type: " .. var1549)
		end
	end
	return var905
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
	if self.sponsored_user_cohort ~= nil then
		t.sponsoredUserCohort = self.sponsored_user_cohort
	end
	return t
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), t (ref)
	local var952 = t_35.new()
	
	if self.title ~= nil then
		var952.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var952.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var952.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var952.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var952.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var952.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var952.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var952.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var952.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var952.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var952.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var952.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var952.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var952.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var952.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var952.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var952.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var952.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var952.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var952.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var952.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var952.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var952.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var952.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var952.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var952.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var952.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var952.tile_activation_mode = self.tileActivationMode
	end
	if self.sponsored_user_cohort ~= nil then
		var952.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var952.sponsored_user_cohort = self.sponsoredUserCohort
	end
	return var952
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
	local var953 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var954, var955 = protoModule.writeTag(buff, var953, 1, protoModule.wireTypes.lengthDelimited)
		var954, var1602 = protoModule.writeString(var954, var955, self.universe_id)
		buff = var954
		var953 = var955
	end
	if self.is_sponsored then
		local var956, var957 = protoModule.writeTag(buff, var953, 2, protoModule.wireTypes.varint)
		var956, var1604 = protoModule.writeVarInt(var956, var957, if self.is_sponsored then 1 else 0)
		buff = var956
		var953 = var957
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var958, var959 = protoModule.writeTag(buff, var953, 3, protoModule.wireTypes.lengthDelimited)
		var958, var1606 = protoModule.writeString(var958, var959, self.roblox_component)
		buff = var958
		var953 = var959
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var960, var961 = protoModule.writeTag(buff, var953, 4, protoModule.wireTypes.lengthDelimited)
		var960, var1608 = protoModule.writeString(var960, var961, self.native_ad_data)
		buff = var960
		var953 = var961
	end
	if self.is_content_locked then
		local var962, var963 = protoModule.writeTag(buff, var953, 5, protoModule.wireTypes.varint)
		var962, var1610 = protoModule.writeVarInt(var962, var963, if self.is_content_locked then 1 else 0)
		buff = var962
		var953 = var963
	end
	if self.title ~= nil and self.title ~= "" then
		local var964, var965 = protoModule.writeTag(buff, var953, 6, protoModule.wireTypes.lengthDelimited)
		var964, var1612 = protoModule.writeString(var964, var965, self.title)
		buff = var964
		var953 = var965
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var966, var967 = protoModule.writeTag(buff, var953, 7, protoModule.wireTypes.lengthDelimited)
		var966, var1614 = protoModule.writeString(var966, var967, self.subtitle)
		buff = var966
		var953 = var967
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var968, var969 = protoModule.writeTag(buff, var953, 8, protoModule.wireTypes.lengthDelimited)
		var968, var1616 = protoModule.writeString(var968, var969, self.image_asset_id)
		buff = var968
		var953 = var969
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var970, var971 = protoModule.writeTag(buff, var953, 9, protoModule.wireTypes.lengthDelimited)
		var970, var1618 = protoModule.writeString(var970, var971, self.video_asset_id)
		buff = var970
		var953 = var971
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var972, var973 = protoModule.writeTag(buff, var953, 10, protoModule.wireTypes.lengthDelimited)
		var972, var1620 = protoModule.writeString(var972, var973, self.badge_text)
		buff = var972
		var953 = var973
	end
	if self.player_count ~= nil then
		local var974, var975 = protoModule.writeTag(buff, var953, 11, protoModule.wireTypes.varint)
		var974, var1622 = protoModule.writeVarInt(var974, var975, self.player_count)
		buff = var974
		var953 = var975
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var976, var977 = protoModule.writeTag(buff, var953, 12, protoModule.wireTypes.lengthDelimited)
		var976, var1624 = protoModule.writeString(var976, var977, self.creator_key)
		buff = var976
		var953 = var977
	end
	if self.rank ~= nil then
		local var978, var979 = protoModule.writeTag(buff, var953, 13, protoModule.wireTypes.varint)
		var978, var1626 = protoModule.writeVarInt(var978, var979, self.rank)
		buff = var978
		var953 = var979
	end
	if self.payer_name ~= nil then
		local var980, var981 = protoModule.writeTag(buff, var953, 14, protoModule.wireTypes.lengthDelimited)
		var980, var1628 = protoModule.writeString(var980, var981, self.payer_name)
		buff = var980
		var953 = var981
	end
	if self.logo_asset_id ~= nil then
		local var982, var983 = protoModule.writeTag(buff, var953, 15, protoModule.wireTypes.lengthDelimited)
		var982, var1630 = protoModule.writeString(var982, var983, self.logo_asset_id)
		buff = var982
		var953 = var983
	end
	if self.logo_aspect_ratio ~= nil then
		local var984, var985 = protoModule.writeTag(buff, var953, 16, protoModule.wireTypes.i64)
		var984, var1632 = protoModule.writeDouble(var984, var985, self.logo_aspect_ratio)
		buff = var984
		var953 = var985
	end
	if self.place_id ~= nil then
		local var986, var987 = protoModule.writeTag(buff, var953, 17, protoModule.wireTypes.lengthDelimited)
		var986, var1634 = protoModule.writeString(var986, var987, self.place_id)
		buff = var986
		var953 = var987
	end
	if self.launch_data ~= nil then
		local var988, var989 = protoModule.writeTag(buff, var953, 18, protoModule.wireTypes.lengthDelimited)
		var988, var1636 = protoModule.writeString(var988, var989, self.launch_data)
		buff = var988
		var953 = var989
	end
	if self.cta_text ~= nil then
		local var990, var991 = protoModule.writeTag(buff, var953, 20, protoModule.wireTypes.lengthDelimited)
		var990, var1638 = protoModule.writeString(var990, var991, self.cta_text)
		buff = var990
		var953 = var991
	end
	if self.badge_analytics_id ~= nil then
		local var992, var993 = protoModule.writeTag(buff, var953, 21, protoModule.wireTypes.lengthDelimited)
		var992, var1640 = protoModule.writeString(var992, var993, self.badge_analytics_id)
		buff = var992
		var953 = var993
	end
	local buff_1 = buffer.create(var953)
	buffer.copy(buff_1, 0, buff, 0, var953)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref)
	local var953 = t_36.new()
	local var954 = 0
	while var954 < buffer.len(p36) do
		local _ = nil
		local var955 = nil
		local var956, var957, var958 = protoModule.readTag(p36, var954)
		local var959 = var956
		var955 = var957
		var954 = var958
		
		if var955 == protoModule.wireTypes.varint then
			if var959 == 2 then
				local _ = nil
				local var960, var961 = protoModule.readVarInt(p36, var954)
				var954 = var961
				var953.is_sponsored = var960 ~= 0
			elseif var959 == 5 then
				local _ = nil
				local var962, var963 = protoModule.readVarInt(p36, var954)
				var954 = var963
				var953.is_content_locked = var962 ~= 0
			elseif var959 == 11 then
				local _ = nil
				local var964, var965 = protoModule.readVarIntI64(p36, var954)
				var954 = var965
				var953.player_count = var964
			elseif var959 == 13 then
				local _ = nil
				local var966, var967 = protoModule.readVarIntI32(p36, var954)
				var954 = var967
				var953.rank = var966
			else
				local _ = nil
				local var968, var969 = protoModule.readVarInt(p36, var954)
				local _ = var968
				var954 = var969
			end
		end
		if var955 == protoModule.wireTypes.lengthDelimited then
			if var959 == 1 then
				local _ = nil
				local var970, var971 = protoModule.readBuffer(p36, var954)
				var954 = var971
				var953.universe_id = buffer.tostring(var970)
			elseif var959 == 3 then
				local _ = nil
				local var972, var973 = protoModule.readBuffer(p36, var954)
				var954 = var973
				var953.roblox_component = buffer.tostring(var972)
			elseif var959 == 4 then
				local _ = nil
				local var974, var975 = protoModule.readBuffer(p36, var954)
				var954 = var975
				var953.native_ad_data = buffer.tostring(var974)
			elseif var959 == 6 then
				local _ = nil
				local var976, var977 = protoModule.readBuffer(p36, var954)
				var954 = var977
				var953.title = buffer.tostring(var976)
			elseif var959 == 7 then
				local _ = nil
				local var978, var979 = protoModule.readBuffer(p36, var954)
				var954 = var979
				var953.subtitle = buffer.tostring(var978)
			elseif var959 == 8 then
				local _ = nil
				local var980, var981 = protoModule.readBuffer(p36, var954)
				var954 = var981
				var953.image_asset_id = buffer.tostring(var980)
			elseif var959 == 9 then
				local _ = nil
				local var982, var983 = protoModule.readBuffer(p36, var954)
				var954 = var983
				var953.video_asset_id = buffer.tostring(var982)
			elseif var959 == 10 then
				local _ = nil
				local var984, var985 = protoModule.readBuffer(p36, var954)
				var954 = var985
				var953.badge_text = buffer.tostring(var984)
			elseif var959 == 12 then
				local _ = nil
				local var986, var987 = protoModule.readBuffer(p36, var954)
				var954 = var987
				var953.creator_key = buffer.tostring(var986)
			elseif var959 == 14 then
				local _ = nil
				local var988, var989 = protoModule.readBuffer(p36, var954)
				var954 = var989
				var953.payer_name = buffer.tostring(var988)
			elseif var959 == 15 then
				local _ = nil
				local var990, var991 = protoModule.readBuffer(p36, var954)
				var954 = var991
				var953.logo_asset_id = buffer.tostring(var990)
			elseif var959 == 17 then
				local _ = nil
				local var992, var993 = protoModule.readBuffer(p36, var954)
				var954 = var993
				var953.place_id = buffer.tostring(var992)
			elseif var959 == 18 then
				local _ = nil
				local var994, var995 = protoModule.readBuffer(p36, var954)
				var954 = var995
				var953.launch_data = buffer.tostring(var994)
			elseif var959 == 20 then
				local _ = nil
				local var996, var997 = protoModule.readBuffer(p36, var954)
				var954 = var997
				var953.cta_text = buffer.tostring(var996)
			elseif var959 == 21 then
				local _ = nil
				local var998, var999 = protoModule.readBuffer(p36, var954)
				var954 = var999
				var953.badge_analytics_id = buffer.tostring(var998)
			else
				local _ = nil
				local var1000, var1001 = protoModule.readVarInt(p36, var954)
				var954 = var1001 + var1000
			end
		elseif var955 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1002, var1003 = protoModule.readFixed32(p36, var954)
			local _ = var1002
			var954 = var1003
		elseif var955 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1644)
		elseif var959 == 16 then
			local _ = nil
			local var1004, var1005 = protoModule.readDouble(p36, var954)
			var954 = var1005
			var953.logo_aspect_ratio = var1004
		else
			local _ = nil
			local var1006, var1007 = protoModule.readFixed64(p36, var954)
			local _ = var1006
			var954 = var1007
		end
	end
	return var953
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
	local var1008 = t_36.new()
	
	if self.universe_id ~= nil then
		var1008.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1008.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1008.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1008.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1008.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1008.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1008.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1008.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1008.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1008.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1008.title = self.title
	end
	if self.subtitle ~= nil then
		var1008.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1008.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1008.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1008.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1008.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1008.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1008.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1008.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1008.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1008.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1008.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1008.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1008.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1008.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1008.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1008.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1008.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1008.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1008.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1008.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1008.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1008.launch_data = self.launchData
	end
	if self.cta_text ~= nil then
		var1008.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1008.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1008.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1008.badge_analytics_id = self.badgeAnalyticsId
	end
	return var1008
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
	local var1008 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1009, var1010 = protoModule.writeTag(buff, var1008, 1, protoModule.wireTypes.lengthDelimited)
		var1009, var1702 = protoModule.writeString(var1009, var1010, self.title)
		buff = var1009
		var1008 = var1010
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1011 = v:encode()
			local var1012, var1013 = protoModule.writeTag(buff, var1008, 2, protoModule.wireTypes.lengthDelimited)
			var1012, var1705 = protoModule.writeBuffer(var1012, var1013, var1011, buffer.len(var1011))
			buff = var1012
			var1008 = var1013
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1014, var1015 = protoModule.writeTag(buff, var1008, 3, protoModule.wireTypes.lengthDelimited)
		var1014, var1707 = protoModule.writeString(var1014, var1015, self.next_page_token)
		buff = var1014
		var1008 = var1015
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1016, var1017 = protoModule.writeTag(buff, var1008, 4, protoModule.wireTypes.lengthDelimited)
		var1016, var1709 = protoModule.writeString(var1016, var1017, self.sort_id)
		buff = var1016
		var1008 = var1017
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1018, var1019 = protoModule.writeTag(buff, var1008, 5, protoModule.wireTypes.varint)
		var1018, var1711 = protoModule.writeVarInt(var1018, var1019, self.secondary_sort_id)
		buff = var1018
		var1008 = var1019
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1020, var1021 = protoModule.writeTag(buff, var1008, 6, protoModule.wireTypes.lengthDelimited)
		var1020, var1713 = protoModule.writeString(var1020, var1021, self.subtitle)
		buff = var1020
		var1008 = var1021
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1022, var1023 = protoModule.writeTag(buff, var1008, 7, protoModule.wireTypes.lengthDelimited)
		var1022, var1715 = protoModule.writeString(var1022, var1023, self.info_text)
		buff = var1022
		var1008 = var1023
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1024, var1025 = protoModule.writeTag(buff, var1008, 8, protoModule.wireTypes.lengthDelimited)
		var1024, var1717 = protoModule.writeString(var1024, var1025, self.subtitle_link_path)
		buff = var1024
		var1008 = var1025
	end
	if self.is_placeholder ~= nil then
		local var1026, var1027 = protoModule.writeTag(buff, var1008, 9, protoModule.wireTypes.varint)
		var1026, var1719 = protoModule.writeVarInt(var1026, var1027, if self.is_placeholder then 1 else 0)
		buff = var1026
		var1008 = var1027
	end
	if self.primary_sort_id ~= nil then
		local var1028, var1029 = protoModule.writeTag(buff, var1008, 10, protoModule.wireTypes.varint)
		var1028, var1721 = protoModule.writeVarInt(var1028, var1029, self.primary_sort_id)
		buff = var1028
		var1008 = var1029
	end
	if self.applied_filters ~= nil then
		local var1030, var1031 = protoModule.writeTag(buff, var1008, 11, protoModule.wireTypes.lengthDelimited)
		var1030, var1723 = protoModule.writeString(var1030, var1031, self.applied_filters)
		buff = var1030
		var1008 = var1031
	end
	local buff_1 = buffer.create(var1008)
	buffer.copy(buff_1, 0, buff, 0, var1008)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1032 = t_37.new()
	local var1033 = 0
	while var1033 < buffer.len(p37) do
		local _ = nil
		local var1034 = nil
		local var1035, var1036, var1037 = protoModule.readTag(p37, var1033)
		local var1038 = var1035
		var1034 = var1036
		var1033 = var1037
		
		if var1034 == protoModule.wireTypes.varint then
			if var1038 == 5 then
				local _ = nil
				local var1039, var1040 = protoModule.readVarIntI32(p37, var1033)
				var1033 = var1040
				var1032.secondary_sort_id = var1039
			elseif var1038 == 9 then
				local _ = nil
				local var1041, var1042 = protoModule.readVarInt(p37, var1033)
				var1033 = var1042
				var1032.is_placeholder = var1041 ~= 0
			elseif var1038 == 10 then
				local _ = nil
				local var1043, var1044 = protoModule.readVarIntI32(p37, var1033)
				var1033 = var1044
				var1032.primary_sort_id = var1043
			else
				local _ = nil
				local var1045, var1046 = protoModule.readVarInt(p37, var1033)
				local _ = var1045
				var1033 = var1046
			end
		end
		if var1034 == protoModule.wireTypes.lengthDelimited then
			if var1038 == 1 then
				local _ = nil
				local var1047, var1048 = protoModule.readBuffer(p37, var1033)
				var1033 = var1048
				var1032.title = buffer.tostring(var1047)
			elseif var1038 == 2 then
				local _ = nil
				local var1049, var1050 = protoModule.readBuffer(p37, var1033)
				var1033 = var1050
				table.insert(var1032.song_items, t.SongCarouselInputData_SongItem.decode(var1049))
			elseif var1038 == 3 then
				local _ = nil
				local var1051, var1052 = protoModule.readBuffer(p37, var1033)
				var1033 = var1052
				var1032.next_page_token = buffer.tostring(var1051)
			elseif var1038 == 4 then
				local _ = nil
				local var1053, var1054 = protoModule.readBuffer(p37, var1033)
				var1033 = var1054
				var1032.sort_id = buffer.tostring(var1053)
			elseif var1038 == 6 then
				local _ = nil
				local var1055, var1056 = protoModule.readBuffer(p37, var1033)
				var1033 = var1056
				var1032.subtitle = buffer.tostring(var1055)
			elseif var1038 == 7 then
				local _ = nil
				local var1057, var1058 = protoModule.readBuffer(p37, var1033)
				var1033 = var1058
				var1032.info_text = buffer.tostring(var1057)
			elseif var1038 == 8 then
				local _ = nil
				local var1059, var1060 = protoModule.readBuffer(p37, var1033)
				var1033 = var1060
				var1032.subtitle_link_path = buffer.tostring(var1059)
			elseif var1038 == 11 then
				local _ = nil
				local var1061, var1062 = protoModule.readBuffer(p37, var1033)
				var1033 = var1062
				var1032.applied_filters = buffer.tostring(var1061)
			else
				local _ = nil
				local var1063, var1064 = protoModule.readVarInt(p37, var1033)
				var1033 = var1064 + var1063
			end
		elseif var1034 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1065, var1066 = protoModule.readFixed32(p37, var1033)
			local _ = var1065
			var1033 = var1066
		elseif var1034 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1067, var1068 = protoModule.readFixed64(p37, var1033)
			local _ = var1067
			var1033 = var1068
		else
			error("Unsupported wire type: " .. var1727)
		end
	end
	return var1032
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
	local var1069 = t_37.new()
	
	if self.title ~= nil then
		var1069.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1069.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1069.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1069.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1069.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1069.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1069.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1069.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1069.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1069.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1069.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1069.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1069.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1069.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1069.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1069.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1069.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1069.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1069.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1069.applied_filters = self.appliedFilters
	end
	return var1069
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
	local var1070 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1071, var1072 = protoModule.writeTag(buff, var1070, 1, protoModule.wireTypes.lengthDelimited)
		var1071, var1770 = protoModule.writeString(var1071, var1072, self.song_id)
		buff = var1071
		var1070 = var1072
	end
	local buff_1 = buffer.create(var1070)
	buffer.copy(buff_1, 0, buff, 0, var1070)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1070 = t_38.new()
	local var1071 = 0
	while var1071 < buffer.len(p38) do
		local _ = nil
		local var1072 = nil
		local var1073, var1074, var1075 = protoModule.readTag(p38, var1071)
		local var1076 = var1073
		var1072 = var1074
		var1071 = var1075
		
		if var1072 == protoModule.wireTypes.varint then
			local _ = nil
			local var1077, var1078 = protoModule.readVarInt(p38, var1071)
			local _ = var1077
			var1071 = var1078
			continue
		end
		if var1072 == protoModule.wireTypes.lengthDelimited then
			if var1076 == 1 then
				local _ = nil
				local var1079, var1080 = protoModule.readBuffer(p38, var1071)
				var1071 = var1080
				var1070.song_id = buffer.tostring(var1079)
			else
				local _ = nil
				local var1081, var1082 = protoModule.readVarInt(p38, var1071)
				var1071 = var1082 + var1081
			end
		elseif var1072 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1083, var1084 = protoModule.readFixed32(p38, var1071)
			local _ = var1083
			var1071 = var1084
		elseif var1072 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1085, var1086 = protoModule.readFixed64(p38, var1071)
			local _ = var1085
			var1071 = var1086
		else
			error("Unsupported wire type: " .. var1774)
		end
	end
	return var1070
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
	local var1087 = t_38.new()
	
	if self.song_id ~= nil then
		var1087.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1087.song_id = self.songId
	end
	return var1087
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
	local var1087 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1088, var1089 = protoModule.writeTag(buff, var1087, 1, protoModule.wireTypes.lengthDelimited)
		var1088, var1794 = protoModule.writeString(var1088, var1089, self.title)
		buff = var1088
		var1087 = var1089
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1090 = v:encode()
			local var1091, var1092 = protoModule.writeTag(buff, var1087, 2, protoModule.wireTypes.lengthDelimited)
			var1091, var1797 = protoModule.writeBuffer(var1091, var1092, var1090, buffer.len(var1090))
			buff = var1091
			var1087 = var1092
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1093, var1094 = protoModule.writeTag(buff, var1087, 3, protoModule.wireTypes.lengthDelimited)
		var1093, var1799 = protoModule.writeString(var1093, var1094, self.universe_id)
		buff = var1093
		var1087 = var1094
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1095, var1096 = protoModule.writeTag(buff, var1087, 4, protoModule.wireTypes.lengthDelimited)
		var1095, var1801 = protoModule.writeString(var1095, var1096, self.sort_id)
		buff = var1095
		var1087 = var1096
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1097, var1098 = protoModule.writeTag(buff, var1087, 5, protoModule.wireTypes.lengthDelimited)
		var1097, var1803 = protoModule.writeString(var1097, var1098, self.subtitle)
		buff = var1097
		var1087 = var1098
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1099, var1100 = protoModule.writeTag(buff, var1087, 6, protoModule.wireTypes.lengthDelimited)
		var1099, var1805 = protoModule.writeString(var1099, var1100, self.info_text)
		buff = var1099
		var1087 = var1100
	end
	local buff_1 = buffer.create(var1087)
	buffer.copy(buff_1, 0, buff, 0, var1087)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1101 = t_39.new()
	local var1102 = 0
	while var1102 < buffer.len(p39) do
		local _ = nil
		local var1103 = nil
		local var1104, var1105, var1106 = protoModule.readTag(p39, var1102)
		local var1107 = var1104
		var1103 = var1105
		var1102 = var1106
		
		if var1103 == protoModule.wireTypes.varint then
			local _ = nil
			local var1108, var1109 = protoModule.readVarInt(p39, var1102)
			local _ = var1108
			var1102 = var1109
			continue
		end
		if var1103 == protoModule.wireTypes.lengthDelimited then
			if var1107 == 1 then
				local _ = nil
				local var1110, var1111 = protoModule.readBuffer(p39, var1102)
				var1102 = var1111
				var1101.title = buffer.tostring(var1110)
			elseif var1107 == 2 then
				local _ = nil
				local var1112, var1113 = protoModule.readBuffer(p39, var1102)
				var1102 = var1113
				table.insert(var1101.event_items, t.EventsCarouselInputData_EventItem.decode(var1112))
			elseif var1107 == 3 then
				local _ = nil
				local var1114, var1115 = protoModule.readBuffer(p39, var1102)
				var1102 = var1115
				var1101.universe_id = buffer.tostring(var1114)
			elseif var1107 == 4 then
				local _ = nil
				local var1116, var1117 = protoModule.readBuffer(p39, var1102)
				var1102 = var1117
				var1101.sort_id = buffer.tostring(var1116)
			elseif var1107 == 5 then
				local _ = nil
				local var1118, var1119 = protoModule.readBuffer(p39, var1102)
				var1102 = var1119
				var1101.subtitle = buffer.tostring(var1118)
			elseif var1107 == 6 then
				local _ = nil
				local var1120, var1121 = protoModule.readBuffer(p39, var1102)
				var1102 = var1121
				var1101.info_text = buffer.tostring(var1120)
			else
				local _ = nil
				local var1122, var1123 = protoModule.readVarInt(p39, var1102)
				var1102 = var1123 + var1122
			end
		elseif var1103 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1124, var1125 = protoModule.readFixed32(p39, var1102)
			local _ = var1124
			var1102 = var1125
		elseif var1103 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1126, var1127 = protoModule.readFixed64(p39, var1102)
			local _ = var1126
			var1102 = var1127
		else
			error("Unsupported wire type: " .. var1809)
		end
	end
	return var1101
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
	local var1128 = t_39.new()
	
	if self.title ~= nil then
		var1128.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1128.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1128.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1128.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1128.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1128.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1128.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1128.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1128.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1128.info_text = self.infoText
	end
	return var1128
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
	local var1129 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1130, var1131 = protoModule.writeTag(buff, var1129, 1, protoModule.wireTypes.lengthDelimited)
		var1130, var1842 = protoModule.writeString(var1130, var1131, self.event_id)
		buff = var1130
		var1129 = var1131
	end
	local buff_1 = buffer.create(var1129)
	buffer.copy(buff_1, 0, buff, 0, var1129)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1129 = t_40.new()
	local var1130 = 0
	while var1130 < buffer.len(p40) do
		local _ = nil
		local var1131 = nil
		local var1132, var1133, var1134 = protoModule.readTag(p40, var1130)
		local var1135 = var1132
		var1131 = var1133
		var1130 = var1134
		
		if var1131 == protoModule.wireTypes.varint then
			local _ = nil
			local var1136, var1137 = protoModule.readVarInt(p40, var1130)
			local _ = var1136
			var1130 = var1137
			continue
		end
		if var1131 == protoModule.wireTypes.lengthDelimited then
			if var1135 == 1 then
				local _ = nil
				local var1138, var1139 = protoModule.readBuffer(p40, var1130)
				var1130 = var1139
				var1129.event_id = buffer.tostring(var1138)
			else
				local _ = nil
				local var1140, var1141 = protoModule.readVarInt(p40, var1130)
				var1130 = var1141 + var1140
			end
		elseif var1131 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1142, var1143 = protoModule.readFixed32(p40, var1130)
			local _ = var1142
			var1130 = var1143
		elseif var1131 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1144, var1145 = protoModule.readFixed64(p40, var1130)
			local _ = var1144
			var1130 = var1145
		else
			error("Unsupported wire type: " .. var1846)
		end
	end
	return var1129
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
	local var1146 = t_40.new()
	
	if self.event_id ~= nil then
		var1146.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1146.event_id = self.eventId
	end
	return var1146
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
	local var1146 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1147, var1148 = protoModule.writeTag(buff, var1146, 1, protoModule.wireTypes.lengthDelimited)
		var1147, var1866 = protoModule.writeString(var1147, var1148, self.universe_id)
		buff = var1147
		var1146 = var1148
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1149, var1150 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1149, var1868 = protoModule.writeString(var1149, var1150, i)
			local var1151 = v:encode()
			var1150, var1870 = protoModule.writeTag(var1149, var1150, 2, protoModule.wireTypes.lengthDelimited)
			var1150, var1870 = protoModule.writeBuffer(var1150, var1870, var1151, buffer.len(var1151))
			local var1152 = var1150
			local var1153 = var1870
			local var1154, var1155 = protoModule.writeTag(buff, var1146, 2, protoModule.wireTypes.lengthDelimited)
			var1154, var1874 = protoModule.writeBuffer(var1154, var1155, var1152, var1153)
			buff = var1154
			var1146 = var1155
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1156, var1157 = protoModule.writeTag(buff, var1146, 3, protoModule.wireTypes.lengthDelimited)
			var1156, var1876 = protoModule.writeString(var1156, var1157, v)
			buff = var1156
			var1146 = var1157
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1158, var1159 = protoModule.writeTag(buff, var1146, 4, protoModule.wireTypes.lengthDelimited)
		var1158, var1878 = protoModule.writeString(var1158, var1159, self.creator_key)
		buff = var1158
		var1146 = var1159
	end
	local buff_1 = buffer.create(var1146)
	buffer.copy(buff_1, 0, buff, 0, var1146)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1160 = t_41.new()
	local var1161 = 0
	while var1161 < buffer.len(p41) do
		local _ = nil
		local var1162 = nil
		local var1163, var1164, var1165 = protoModule.readTag(p41, var1161)
		local var1166 = var1163
		var1162 = var1164
		var1161 = var1165
		
		if var1162 == protoModule.wireTypes.varint then
			local _ = nil
			local var1167, var1168 = protoModule.readVarInt(p41, var1161)
			local _ = var1167
			var1161 = var1168
			continue
		end
		if var1162 == protoModule.wireTypes.lengthDelimited then
			if var1166 == 1 then
				local _ = nil
				local var1169, var1170 = protoModule.readBuffer(p41, var1161)
				var1161 = var1170
				var1160.universe_id = buffer.tostring(var1169)
			elseif var1166 == 2 then
				local _ = nil
				local var1171, var1172 = protoModule.readBuffer(p41, var1161)
				var1161 = var1172
				var1171 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1171)
				var1160.entry_map[var1171.key or ""] = var1171.value or t.FeedEntry.new()
			elseif var1166 == 3 then
				local _ = nil
				local var1173, var1174 = protoModule.readBuffer(p41, var1161)
				var1161 = var1174
				table.insert(var1160.entry_order, buffer.tostring(var1173))
			elseif var1166 == 4 then
				local _ = nil
				local var1175, var1176 = protoModule.readBuffer(p41, var1161)
				var1161 = var1176
				var1160.creator_key = buffer.tostring(var1175)
			else
				local _ = nil
				local var1177, var1178 = protoModule.readVarInt(p41, var1161)
				var1161 = var1178 + var1177
			end
		elseif var1162 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1179, var1180 = protoModule.readFixed32(p41, var1161)
			local _ = var1179
			var1161 = var1180
		elseif var1162 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1181, var1182 = protoModule.readFixed64(p41, var1161)
			local _ = var1181
			var1161 = var1182
		else
			error("Unsupported wire type: " .. var1882)
		end
	end
	return var1160
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
	local var1183 = t_41.new()
	
	if self.universe_id ~= nil then
		var1183.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1183.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1183.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1183.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1183.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1183.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1183.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1183.creator_key = self.creatorKey
	end
	return var1183
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
	local var1184 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1185, var1186 = protoModule.writeTag(buff, var1184, 1, protoModule.wireTypes.lengthDelimited)
		var1185, var1914 = protoModule.writeString(var1185, var1186, self.key)
		buff = var1185
		var1184 = var1186
	end
	if self.value ~= nil then
		local var1187 = self.value:encode()
		local var1188, var1189 = protoModule.writeTag(buff, var1184, 2, protoModule.wireTypes.lengthDelimited)
		var1188, var1917 = protoModule.writeBuffer(var1188, var1189, var1187, buffer.len(var1187))
		buff = var1188
		var1184 = var1189
	end
	local buff_1 = buffer.create(var1184)
	buffer.copy(buff_1, 0, buff, 0, var1184)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1184 = t_42.new()
	local var1185 = 0
	while var1185 < buffer.len(p42) do
		local _ = nil
		local var1186 = nil
		local var1187, var1188, var1189 = protoModule.readTag(p42, var1185)
		local var1190 = var1187
		var1186 = var1188
		var1185 = var1189
		
		if var1186 == protoModule.wireTypes.varint then
			local _ = nil
			local var1191, var1192 = protoModule.readVarInt(p42, var1185)
			local _ = var1191
			var1185 = var1192
			continue
		end
		if var1186 == protoModule.wireTypes.lengthDelimited then
			if var1190 == 1 then
				local _ = nil
				local var1193, var1194 = protoModule.readBuffer(p42, var1185)
				var1185 = var1194
				var1184.key = buffer.tostring(var1193)
			elseif var1190 == 2 then
				local _ = nil
				local var1195, var1196 = protoModule.readBuffer(p42, var1185)
				var1185 = var1196
				var1184.value = t.FeedEntry.decode(var1195)
			else
				local _ = nil
				local var1197, var1198 = protoModule.readVarInt(p42, var1185)
				var1185 = var1198 + var1197
			end
		elseif var1186 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1199, var1200 = protoModule.readFixed32(p42, var1185)
			local _ = var1199
			var1185 = var1200
		elseif var1186 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1201, var1202 = protoModule.readFixed64(p42, var1185)
			local _ = var1201
			var1185 = var1202
		else
			error("Unsupported wire type: " .. var1921)
		end
	end
	return var1184
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
	local var1203 = t_42.new()
	
	if self.key ~= nil then
		var1203.key = self.key
	end
	if self.value ~= nil then
		var1203.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1203
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
	local var1203 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1204 = v:encode()
			local var1205, var1206 = protoModule.writeTag(buff, var1203, 1, protoModule.wireTypes.lengthDelimited)
			var1205, var1944 = protoModule.writeBuffer(var1205, var1206, var1204, buffer.len(var1204))
			buff = var1205
			var1203 = var1206
		end
	end
	local buff_1 = buffer.create(var1203)
	buffer.copy(buff_1, 0, buff, 0, var1203)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1207 = t_43.new()
	local var1208 = 0
	while var1208 < buffer.len(p43) do
		local _ = nil
		local var1209 = nil
		local var1210, var1211, var1212 = protoModule.readTag(p43, var1208)
		local var1213 = var1210
		var1209 = var1211
		var1208 = var1212
		
		if var1209 == protoModule.wireTypes.varint then
			local _ = nil
			local var1214, var1215 = protoModule.readVarInt(p43, var1208)
			local _ = var1214
			var1208 = var1215
			continue
		end
		if var1209 == protoModule.wireTypes.lengthDelimited then
			if var1213 == 1 then
				local _ = nil
				local var1216, var1217 = protoModule.readBuffer(p43, var1208)
				var1208 = var1217
				table.insert(var1207.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1216))
			else
				local _ = nil
				local var1218, var1219 = protoModule.readVarInt(p43, var1208)
				var1208 = var1219 + var1218
			end
		elseif var1209 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1220, var1221 = protoModule.readFixed32(p43, var1208)
			local _ = var1220
			var1208 = var1221
		elseif var1209 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1222, var1223 = protoModule.readFixed64(p43, var1208)
			local _ = var1222
			var1208 = var1223
		else
			error("Unsupported wire type: " .. var1948)
		end
	end
	return var1207
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
	local var1224 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1224.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1224.game_passes = t_1
	end
	return var1224
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
	local var1225 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1226, var1227 = protoModule.writeTag(buff, var1225, 1, protoModule.wireTypes.lengthDelimited)
		var1226, var1971 = protoModule.writeString(var1226, var1227, self.game_pass_id)
		buff = var1226
		var1225 = var1227
	end
	local buff_1 = buffer.create(var1225)
	buffer.copy(buff_1, 0, buff, 0, var1225)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1225 = t_44.new()
	local var1226 = 0
	while var1226 < buffer.len(p44) do
		local _ = nil
		local var1227 = nil
		local var1228, var1229, var1230 = protoModule.readTag(p44, var1226)
		local var1231 = var1228
		var1227 = var1229
		var1226 = var1230
		
		if var1227 == protoModule.wireTypes.varint then
			local _ = nil
			local var1232, var1233 = protoModule.readVarInt(p44, var1226)
			local _ = var1232
			var1226 = var1233
			continue
		end
		if var1227 == protoModule.wireTypes.lengthDelimited then
			if var1231 == 1 then
				local _ = nil
				local var1234, var1235 = protoModule.readBuffer(p44, var1226)
				var1226 = var1235
				var1225.game_pass_id = buffer.tostring(var1234)
			else
				local _ = nil
				local var1236, var1237 = protoModule.readVarInt(p44, var1226)
				var1226 = var1237 + var1236
			end
		elseif var1227 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1238, var1239 = protoModule.readFixed32(p44, var1226)
			local _ = var1238
			var1226 = var1239
		elseif var1227 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1240, var1241 = protoModule.readFixed64(p44, var1226)
			local _ = var1240
			var1226 = var1241
		else
			error("Unsupported wire type: " .. var1975)
		end
	end
	return var1225
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
	local var1242 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1242.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1242.game_pass_id = self.gamePassId
	end
	return var1242
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
	local var1242 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1243 = v:encode()
			local var1244, var1245 = protoModule.writeTag(buff, var1242, 1, protoModule.wireTypes.lengthDelimited)
			var1244, var1996 = protoModule.writeBuffer(var1244, var1245, var1243, buffer.len(var1243))
			buff = var1244
			var1242 = var1245
		end
	end
	local buff_1 = buffer.create(var1242)
	buffer.copy(buff_1, 0, buff, 0, var1242)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1246 = t_45.new()
	local var1247 = 0
	while var1247 < buffer.len(p45) do
		local _ = nil
		local var1248 = nil
		local var1249, var1250, var1251 = protoModule.readTag(p45, var1247)
		local var1252 = var1249
		var1248 = var1250
		var1247 = var1251
		
		if var1248 == protoModule.wireTypes.varint then
			local _ = nil
			local var1253, var1254 = protoModule.readVarInt(p45, var1247)
			local _ = var1253
			var1247 = var1254
			continue
		end
		if var1248 == protoModule.wireTypes.lengthDelimited then
			if var1252 == 1 then
				local _ = nil
				local var1255, var1256 = protoModule.readBuffer(p45, var1247)
				var1247 = var1256
				table.insert(var1246.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1255))
			else
				local _ = nil
				local var1257, var1258 = protoModule.readVarInt(p45, var1247)
				var1247 = var1258 + var1257
			end
		elseif var1248 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1259, var1260 = protoModule.readFixed32(p45, var1247)
			local _ = var1259
			var1247 = var1260
		elseif var1248 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1261, var1262 = protoModule.readFixed64(p45, var1247)
			local _ = var1261
			var1247 = var1262
		else
			error("Unsupported wire type: " .. var2000)
		end
	end
	return var1246
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
	local var1263 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1263.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1263.developer_products = t_1
	end
	return var1263
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
	local var1264 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1265, var1266 = protoModule.writeTag(buff, var1264, 1, protoModule.wireTypes.lengthDelimited)
		var1265, var2023 = protoModule.writeString(var1265, var1266, self.developer_product_id)
		buff = var1265
		var1264 = var1266
	end
	local buff_1 = buffer.create(var1264)
	buffer.copy(buff_1, 0, buff, 0, var1264)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1264 = t_46.new()
	local var1265 = 0
	while var1265 < buffer.len(p46) do
		local _ = nil
		local var1266 = nil
		local var1267, var1268, var1269 = protoModule.readTag(p46, var1265)
		local var1270 = var1267
		var1266 = var1268
		var1265 = var1269
		
		if var1266 == protoModule.wireTypes.varint then
			local _ = nil
			local var1271, var1272 = protoModule.readVarInt(p46, var1265)
			local _ = var1271
			var1265 = var1272
			continue
		end
		if var1266 == protoModule.wireTypes.lengthDelimited then
			if var1270 == 1 then
				local _ = nil
				local var1273, var1274 = protoModule.readBuffer(p46, var1265)
				var1265 = var1274
				var1264.developer_product_id = buffer.tostring(var1273)
			else
				local _ = nil
				local var1275, var1276 = protoModule.readVarInt(p46, var1265)
				var1265 = var1276 + var1275
			end
		elseif var1266 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1277, var1278 = protoModule.readFixed32(p46, var1265)
			local _ = var1277
			var1265 = var1278
		elseif var1266 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1279, var1280 = protoModule.readFixed64(p46, var1265)
			local _ = var1279
			var1265 = var1280
		else
			error("Unsupported wire type: " .. var2027)
		end
	end
	return var1264
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
	local var1281 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var1281.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1281.developer_product_id = self.developerProductId
	end
	return var1281
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
	local var1281 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1282 = v:encode()
			local var1283, var1284 = protoModule.writeTag(buff, var1281, 1, protoModule.wireTypes.lengthDelimited)
			var1283, var2048 = protoModule.writeBuffer(var1283, var1284, var1282, buffer.len(var1282))
			buff = var1283
			var1281 = var1284
		end
	end
	local buff_1 = buffer.create(var1281)
	buffer.copy(buff_1, 0, buff, 0, var1281)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1285 = t_47.new()
	local var1286 = 0
	while var1286 < buffer.len(p47) do
		local _ = nil
		local var1287 = nil
		local var1288, var1289, var1290 = protoModule.readTag(p47, var1286)
		local var1291 = var1288
		var1287 = var1289
		var1286 = var1290
		
		if var1287 == protoModule.wireTypes.varint then
			local _ = nil
			local var1292, var1293 = protoModule.readVarInt(p47, var1286)
			local _ = var1292
			var1286 = var1293
			continue
		end
		if var1287 == protoModule.wireTypes.lengthDelimited then
			if var1291 == 1 then
				local _ = nil
				local var1294, var1295 = protoModule.readBuffer(p47, var1286)
				var1286 = var1295
				table.insert(var1285.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1294))
			else
				local _ = nil
				local var1296, var1297 = protoModule.readVarInt(p47, var1286)
				var1286 = var1297 + var1296
			end
		elseif var1287 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1298, var1299 = protoModule.readFixed32(p47, var1286)
			local _ = var1298
			var1286 = var1299
		elseif var1287 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1300, var1301 = protoModule.readFixed64(p47, var1286)
			local _ = var1300
			var1286 = var1301
		else
			error("Unsupported wire type: " .. var2052)
		end
	end
	return var1285
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
	local var1302 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1302.subscriptions = t_1
	end
	return var1302
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
	local var1303 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1304, var1305 = protoModule.writeTag(buff, var1303, 1, protoModule.wireTypes.lengthDelimited)
		var1304, var2074 = protoModule.writeString(var1304, var1305, self.subscription_id)
		buff = var1304
		var1303 = var1305
	end
	local buff_1 = buffer.create(var1303)
	buffer.copy(buff_1, 0, buff, 0, var1303)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1303 = t_48.new()
	local var1304 = 0
	while var1304 < buffer.len(p48) do
		local _ = nil
		local var1305 = nil
		local var1306, var1307, var1308 = protoModule.readTag(p48, var1304)
		local var1309 = var1306
		var1305 = var1307
		var1304 = var1308
		
		if var1305 == protoModule.wireTypes.varint then
			local _ = nil
			local var1310, var1311 = protoModule.readVarInt(p48, var1304)
			local _ = var1310
			var1304 = var1311
			continue
		end
		if var1305 == protoModule.wireTypes.lengthDelimited then
			if var1309 == 1 then
				local _ = nil
				local var1312, var1313 = protoModule.readBuffer(p48, var1304)
				var1304 = var1313
				var1303.subscription_id = buffer.tostring(var1312)
			else
				local _ = nil
				local var1314, var1315 = protoModule.readVarInt(p48, var1304)
				var1304 = var1315 + var1314
			end
		elseif var1305 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1316, var1317 = protoModule.readFixed32(p48, var1304)
			local _ = var1316
			var1304 = var1317
		elseif var1305 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1318, var1319 = protoModule.readFixed64(p48, var1304)
			local _ = var1318
			var1304 = var1319
		else
			error("Unsupported wire type: " .. var2078)
		end
	end
	return var1303
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
	local var1320 = t_48.new()
	
	if self.subscription_id ~= nil then
		var1320.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1320.subscription_id = self.subscriptionId
	end
	return var1320
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
	local var1320 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1321 = v:encode()
			local var1322, var1323 = protoModule.writeTag(buff, var1320, 1, protoModule.wireTypes.lengthDelimited)
			var1322, var2099 = protoModule.writeBuffer(var1322, var1323, var1321, buffer.len(var1321))
			buff = var1322
			var1320 = var1323
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1324, var1325 = protoModule.writeTag(buff, var1320, 2, protoModule.wireTypes.lengthDelimited)
		var1324, var2101 = protoModule.writeString(var1324, var1325, self.universe_id)
		buff = var1324
		var1320 = var1325
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1326, var1327 = protoModule.writeTag(buff, var1320, 3, protoModule.wireTypes.lengthDelimited)
		var1326, var2103 = protoModule.writeString(var1326, var1327, self.section_title)
		buff = var1326
		var1320 = var1327
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1328, var1329 = protoModule.writeTag(buff, var1320, 4, protoModule.wireTypes.lengthDelimited)
		var1328, var2105 = protoModule.writeString(var1328, var1329, self.creator_key)
		buff = var1328
		var1320 = var1329
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1330, var1331 = protoModule.writeTag(buff, var1320, 5, protoModule.wireTypes.lengthDelimited)
		var1330, var2107 = protoModule.writeString(var1330, var1331, self.collection_item_size)
		buff = var1330
		var1320 = var1331
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1332, var1333 = protoModule.writeTag(buff, var1320, 6, protoModule.wireTypes.lengthDelimited)
		var1332, var2109 = protoModule.writeString(var1332, var1333, self.item_height_mode)
		buff = var1332
		var1320 = var1333
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1334, var1335 = protoModule.writeTag(buff, var1320, 7, protoModule.wireTypes.lengthDelimited)
		var1334, var2111 = protoModule.writeString(var1334, var1335, self.experience_store_product_type)
		buff = var1334
		var1320 = var1335
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1336, var1337 = protoModule.writeTag(buff, var1320, 8, protoModule.wireTypes.lengthDelimited)
		var1336, var2113 = protoModule.writeString(var1336, var1337, self.content_type)
		buff = var1336
		var1320 = var1337
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1338, var1339 = protoModule.writeTag(buff, var1320, 9, protoModule.wireTypes.lengthDelimited)
		var1338, var2115 = protoModule.writeString(var1338, var1339, self.item_type)
		buff = var1338
		var1320 = var1339
	end
	local buff_1 = buffer.create(var1320)
	buffer.copy(buff_1, 0, buff, 0, var1320)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1340 = t_49.new()
	local var1341 = 0
	while var1341 < buffer.len(p49) do
		local _ = nil
		local var1342 = nil
		local var1343, var1344, var1345 = protoModule.readTag(p49, var1341)
		local var1346 = var1343
		var1342 = var1344
		var1341 = var1345
		
		if var1342 == protoModule.wireTypes.varint then
			local _ = nil
			local var1347, var1348 = protoModule.readVarInt(p49, var1341)
			local _ = var1347
			var1341 = var1348
			continue
		end
		if var1342 == protoModule.wireTypes.lengthDelimited then
			if var1346 == 1 then
				local _ = nil
				local var1349, var1350 = protoModule.readBuffer(p49, var1341)
				var1341 = var1350
				table.insert(var1340.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1349))
			elseif var1346 == 2 then
				local _ = nil
				local var1351, var1352 = protoModule.readBuffer(p49, var1341)
				var1341 = var1352
				var1340.universe_id = buffer.tostring(var1351)
			elseif var1346 == 3 then
				local _ = nil
				local var1353, var1354 = protoModule.readBuffer(p49, var1341)
				var1341 = var1354
				var1340.section_title = buffer.tostring(var1353)
			elseif var1346 == 4 then
				local _ = nil
				local var1355, var1356 = protoModule.readBuffer(p49, var1341)
				var1341 = var1356
				var1340.creator_key = buffer.tostring(var1355)
			elseif var1346 == 5 then
				local _ = nil
				local var1357, var1358 = protoModule.readBuffer(p49, var1341)
				var1341 = var1358
				var1340.collection_item_size = buffer.tostring(var1357)
			elseif var1346 == 6 then
				local _ = nil
				local var1359, var1360 = protoModule.readBuffer(p49, var1341)
				var1341 = var1360
				var1340.item_height_mode = buffer.tostring(var1359)
			elseif var1346 == 7 then
				local _ = nil
				local var1361, var1362 = protoModule.readBuffer(p49, var1341)
				var1341 = var1362
				var1340.experience_store_product_type = buffer.tostring(var1361)
			elseif var1346 == 8 then
				local _ = nil
				local var1363, var1364 = protoModule.readBuffer(p49, var1341)
				var1341 = var1364
				var1340.content_type = buffer.tostring(var1363)
			elseif var1346 == 9 then
				local _ = nil
				local var1365, var1366 = protoModule.readBuffer(p49, var1341)
				var1341 = var1366
				var1340.item_type = buffer.tostring(var1365)
			else
				local _ = nil
				local var1367, var1368 = protoModule.readVarInt(p49, var1341)
				var1341 = var1368 + var1367
			end
		elseif var1342 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1369, var1370 = protoModule.readFixed32(p49, var1341)
			local _ = var1369
			var1341 = var1370
		elseif var1342 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1371, var1372 = protoModule.readFixed64(p49, var1341)
			local _ = var1371
			var1341 = var1372
		else
			error("Unsupported wire type: " .. var2119)
		end
	end
	return var1340
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
	local var1373 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1373.items = t_1
	end
	if self.universe_id ~= nil then
		var1373.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1373.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1373.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1373.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1373.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1373.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1373.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1373.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1373.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1373.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1373.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1373.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1373.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1373.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1373.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1373.item_type = self.itemType
	end
	return var1373
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
	local var1374 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1375, var1376 = protoModule.writeTag(buff, var1374, 1, protoModule.wireTypes.lengthDelimited)
		var1375, var2157 = protoModule.writeString(var1375, var1376, self.item_id)
		buff = var1375
		var1374 = var1376
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1377, var1378 = protoModule.writeTag(buff, var1374, 2, protoModule.wireTypes.varint)
		var1377, var2159 = protoModule.writeVarInt(var1377, var1378, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1377
		var1374 = var1378
	end
	local buff_1 = buffer.create(var1374)
	buffer.copy(buff_1, 0, buff, 0, var1374)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1374 = t_50.new()
	local var1375 = 0
	while var1375 < buffer.len(p50) do
		local _ = nil
		local var1376 = nil
		local var1377, var1378, var1379 = protoModule.readTag(p50, var1375)
		local var1380 = var1377
		var1376 = var1378
		var1375 = var1379
		
		if var1376 == protoModule.wireTypes.varint then
			if var1380 == 2 then
				local _ = nil
				local var1381, var1382 = protoModule.readVarIntI32(p50, var1375)
				local var1383 = var1381
				var1375 = var1382
				var1374.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1383) or var1383
			else
				local _ = nil
				local var1384, var1385 = protoModule.readVarInt(p50, var1375)
				local _ = var1384
				var1375 = var1385
			end
		end
		if var1376 == protoModule.wireTypes.lengthDelimited then
			if var1380 == 1 then
				local _ = nil
				local var1386, var1387 = protoModule.readBuffer(p50, var1375)
				var1375 = var1387
				var1374.item_id = buffer.tostring(var1386)
			else
				local _ = nil
				local var1388, var1389 = protoModule.readVarInt(p50, var1375)
				var1375 = var1389 + var1388
			end
		elseif var1376 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1390, var1391 = protoModule.readFixed32(p50, var1375)
			local _ = var1390
			var1375 = var1391
		elseif var1376 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1392, var1393 = protoModule.readFixed64(p50, var1375)
			local _ = var1392
			var1375 = var1393
		else
			error("Unsupported wire type: " .. var2163)
		end
	end
	return var1374
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
	local var1394 = t_50.new()
	
	if self.item_id ~= nil then
		var1394.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1394.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1394.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1394
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
	local var1394 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1395, var1396 = protoModule.writeTag(buff, var1394, 1, protoModule.wireTypes.lengthDelimited)
		var1395, var2186 = protoModule.writeString(var1395, var1396, self.roblox_component)
		buff = var1395
		var1394 = var1396
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1397, var1398 = protoModule.writeTag(buff, var1394, 2, protoModule.wireTypes.lengthDelimited)
		var1397, var2188 = protoModule.writeString(var1397, var1398, self.identifier)
		buff = var1397
		var1394 = var1398
	end
	if self.title ~= nil and self.title ~= "" then
		local var1399, var1400 = protoModule.writeTag(buff, var1394, 3, protoModule.wireTypes.lengthDelimited)
		var1399, var2190 = protoModule.writeString(var1399, var1400, self.title)
		buff = var1399
		var1394 = var1400
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1401, var1402 = protoModule.writeTag(buff, var1394, 4, protoModule.wireTypes.lengthDelimited)
		var1401, var2192 = protoModule.writeString(var1401, var1402, self.user_id)
		buff = var1401
		var1394 = var1402
	end
	if self.description ~= nil and self.description ~= "" then
		local var1403, var1404 = protoModule.writeTag(buff, var1394, 5, protoModule.wireTypes.lengthDelimited)
		var1403, var2194 = protoModule.writeString(var1403, var1404, self.description)
		buff = var1403
		var1394 = var1404
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1405, var1406 = protoModule.writeTag(buff, var1394, 6, protoModule.wireTypes.lengthDelimited)
		var1405, var2196 = protoModule.writeString(var1405, var1406, self.cta_text)
		buff = var1405
		var1394 = var1406
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1407, var1408 = protoModule.writeTag(buff, var1394, 7, protoModule.wireTypes.lengthDelimited)
		var1407, var2198 = protoModule.writeString(var1407, var1408, self.prompt_id)
		buff = var1407
		var1394 = var1408
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1409, var1410 = protoModule.writeTag(buff, var1394, 8, protoModule.wireTypes.lengthDelimited)
		var1409, var2200 = protoModule.writeString(var1409, var1410, self.prompt_type)
		buff = var1409
		var1394 = var1410
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1411, var1412 = protoModule.writeTag(buff, var1394, 9, protoModule.wireTypes.lengthDelimited)
		var1411, var2202 = protoModule.writeString(var1411, var1412, self.entity_id)
		buff = var1411
		var1394 = var1412
	end
	local buff_1 = buffer.create(var1394)
	buffer.copy(buff_1, 0, buff, 0, var1394)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref)
	local var1394 = t_51.new()
	local var1395 = 0
	while var1395 < buffer.len(p51) do
		local _ = nil
		local var1396 = nil
		local var1397, var1398, var1399 = protoModule.readTag(p51, var1395)
		local var1400 = var1397
		var1396 = var1398
		var1395 = var1399
		
		if var1396 == protoModule.wireTypes.varint then
			local _ = nil
			local var1401, var1402 = protoModule.readVarInt(p51, var1395)
			local _ = var1401
			var1395 = var1402
			continue
		end
		if var1396 == protoModule.wireTypes.lengthDelimited then
			if var1400 == 1 then
				local _ = nil
				local var1403, var1404 = protoModule.readBuffer(p51, var1395)
				var1395 = var1404
				var1394.roblox_component = buffer.tostring(var1403)
			elseif var1400 == 2 then
				local _ = nil
				local var1405, var1406 = protoModule.readBuffer(p51, var1395)
				var1395 = var1406
				var1394.identifier = buffer.tostring(var1405)
			elseif var1400 == 3 then
				local _ = nil
				local var1407, var1408 = protoModule.readBuffer(p51, var1395)
				var1395 = var1408
				var1394.title = buffer.tostring(var1407)
			elseif var1400 == 4 then
				local _ = nil
				local var1409, var1410 = protoModule.readBuffer(p51, var1395)
				var1395 = var1410
				var1394.user_id = buffer.tostring(var1409)
			elseif var1400 == 5 then
				local _ = nil
				local var1411, var1412 = protoModule.readBuffer(p51, var1395)
				var1395 = var1412
				var1394.description = buffer.tostring(var1411)
			elseif var1400 == 6 then
				local _ = nil
				local var1413, var1414 = protoModule.readBuffer(p51, var1395)
				var1395 = var1414
				var1394.cta_text = buffer.tostring(var1413)
			elseif var1400 == 7 then
				local _ = nil
				local var1415, var1416 = protoModule.readBuffer(p51, var1395)
				var1395 = var1416
				var1394.prompt_id = buffer.tostring(var1415)
			elseif var1400 == 8 then
				local _ = nil
				local var1417, var1418 = protoModule.readBuffer(p51, var1395)
				var1395 = var1418
				var1394.prompt_type = buffer.tostring(var1417)
			elseif var1400 == 9 then
				local _ = nil
				local var1419, var1420 = protoModule.readBuffer(p51, var1395)
				var1395 = var1420
				var1394.entity_id = buffer.tostring(var1419)
			else
				local _ = nil
				local var1421, var1422 = protoModule.readVarInt(p51, var1395)
				var1395 = var1422 + var1421
			end
		elseif var1396 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1423, var1424 = protoModule.readFixed32(p51, var1395)
			local _ = var1423
			var1395 = var1424
		elseif var1396 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1425, var1426 = protoModule.readFixed64(p51, var1395)
			local _ = var1425
			var1395 = var1426
		else
			error("Unsupported wire type: " .. var2206)
		end
	end
	return var1394
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
	local var1427 = t_51.new()
	
	if self.roblox_component ~= nil then
		var1427.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1427.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1427.identifier = self.identifier
	end
	if self.title ~= nil then
		var1427.title = self.title
	end
	if self.user_id ~= nil then
		var1427.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1427.user_id = self.userId
	end
	if self.description ~= nil then
		var1427.description = self.description
	end
	if self.cta_text ~= nil then
		var1427.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1427.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1427.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1427.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1427.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1427.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1427.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1427.entity_id = self.entityId
	end
	return var1427
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
	local var1427 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1428, var1429 = protoModule.writeTag(buff, var1427, 1, protoModule.wireTypes.lengthDelimited)
		var1428, var2242 = protoModule.writeString(var1428, var1429, self.group_id)
		buff = var1428
		var1427 = var1429
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1430, var1431 = protoModule.writeTag(buff, var1427, 2, protoModule.wireTypes.lengthDelimited)
		var1430, var2244 = protoModule.writeString(var1430, var1431, self.experience_id)
		buff = var1430
		var1427 = var1431
	end
	local buff_1 = buffer.create(var1427)
	buffer.copy(buff_1, 0, buff, 0, var1427)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref)
	local var1427 = t_52.new()
	local var1428 = 0
	while var1428 < buffer.len(p52) do
		local _ = nil
		local var1429 = nil
		local var1430, var1431, var1432 = protoModule.readTag(p52, var1428)
		local var1433 = var1430
		var1429 = var1431
		var1428 = var1432
		
		if var1429 == protoModule.wireTypes.varint then
			local _ = nil
			local var1434, var1435 = protoModule.readVarInt(p52, var1428)
			local _ = var1434
			var1428 = var1435
			continue
		end
		if var1429 == protoModule.wireTypes.lengthDelimited then
			if var1433 == 1 then
				local _ = nil
				local var1436, var1437 = protoModule.readBuffer(p52, var1428)
				var1428 = var1437
				var1427.group_id = buffer.tostring(var1436)
			elseif var1433 == 2 then
				local _ = nil
				local var1438, var1439 = protoModule.readBuffer(p52, var1428)
				var1428 = var1439
				var1427.experience_id = buffer.tostring(var1438)
			else
				local _ = nil
				local var1440, var1441 = protoModule.readVarInt(p52, var1428)
				var1428 = var1441 + var1440
			end
		elseif var1429 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1442, var1443 = protoModule.readFixed32(p52, var1428)
			local _ = var1442
			var1428 = var1443
		elseif var1429 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1444, var1445 = protoModule.readFixed64(p52, var1428)
			local _ = var1444
			var1428 = var1445
		else
			error("Unsupported wire type: " .. var2248)
		end
	end
	return var1427
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
	local var1446 = t_52.new()
	
	if self.group_id ~= nil then
		var1446.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1446.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1446.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1446.experience_id = self.experienceId
	end
	return var1446
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
	local var1446 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1447, var1448 = protoModule.writeTag(buff, var1446, 1, protoModule.wireTypes.lengthDelimited)
		var1447, var2270 = protoModule.writeString(var1447, var1448, self.title)
		buff = var1447
		var1446 = var1448
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1449, var1450 = protoModule.writeTag(buff, var1446, 2, protoModule.wireTypes.lengthDelimited)
		var1449, var2272 = protoModule.writeString(var1449, var1450, self.dismiss_text)
		buff = var1449
		var1446 = var1450
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1451, var1452 = protoModule.writeTag(buff, var1446, 3, protoModule.wireTypes.lengthDelimited)
		var1451, var2274 = protoModule.writeString(var1451, var1452, self.user_id)
		buff = var1451
		var1446 = var1452
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1453 = v:encode()
			local var1454, var1455 = protoModule.writeTag(buff, var1446, 4, protoModule.wireTypes.lengthDelimited)
			var1454, var2277 = protoModule.writeBuffer(var1454, var1455, var1453, buffer.len(var1453))
			buff = var1454
			var1446 = var1455
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1456, var1457 = protoModule.writeTag(buff, var1446, 5, protoModule.wireTypes.lengthDelimited)
		var1456, var2279 = protoModule.writeString(var1456, var1457, self.prompt_id)
		buff = var1456
		var1446 = var1457
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1458, var1459 = protoModule.writeTag(buff, var1446, 6, protoModule.wireTypes.lengthDelimited)
		var1458, var2281 = protoModule.writeString(var1458, var1459, self.prompt_type)
		buff = var1458
		var1446 = var1459
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1460, var1461 = protoModule.writeTag(buff, var1446, 7, protoModule.wireTypes.lengthDelimited)
		var1460, var2283 = protoModule.writeString(var1460, var1461, self.sort_id)
		buff = var1460
		var1446 = var1461
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1462, var1463 = protoModule.writeTag(buff, var1446, 8, protoModule.wireTypes.lengthDelimited)
		var1462, var2285 = protoModule.writeString(var1462, var1463, self.feed_item_key)
		buff = var1462
		var1446 = var1463
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1464 = self.client_attributes.value:encode()
		local var1465, var1466 = protoModule.writeTag(buff, var1446, 9, protoModule.wireTypes.lengthDelimited)
		var1465, var2288 = protoModule.writeBuffer(var1465, var1466, var1464, buffer.len(var1464))
		buff = var1465
		var1446 = var1466
	end
	local buff_1 = buffer.create(var1446)
	buffer.copy(buff_1, 0, buff, 0, var1446)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1467 = t_53.new()
	local var1468 = 0
	while var1468 < buffer.len(p53) do
		local _ = nil
		local var1469 = nil
		local var1470, var1471, var1472 = protoModule.readTag(p53, var1468)
		local var1473 = var1470
		var1469 = var1471
		var1468 = var1472
		
		if var1469 == protoModule.wireTypes.varint then
			local _ = nil
			local var1474, var1475 = protoModule.readVarInt(p53, var1468)
			local _ = var1474
			var1468 = var1475
			continue
		end
		if var1469 == protoModule.wireTypes.lengthDelimited then
			if var1473 == 1 then
				local _ = nil
				local var1476, var1477 = protoModule.readBuffer(p53, var1468)
				var1468 = var1477
				var1467.title = buffer.tostring(var1476)
			elseif var1473 == 2 then
				local _ = nil
				local var1478, var1479 = protoModule.readBuffer(p53, var1468)
				var1468 = var1479
				var1467.dismiss_text = buffer.tostring(var1478)
			elseif var1473 == 3 then
				local _ = nil
				local var1480, var1481 = protoModule.readBuffer(p53, var1468)
				var1468 = var1481
				var1467.user_id = buffer.tostring(var1480)
			elseif var1473 == 4 then
				local _ = nil
				local var1482, var1483 = protoModule.readBuffer(p53, var1468)
				var1468 = var1483
				table.insert(var1467.cards, t.CardContainerCardInputData.decode(var1482))
			elseif var1473 == 5 then
				local _ = nil
				local var1484, var1485 = protoModule.readBuffer(p53, var1468)
				var1468 = var1485
				var1467.prompt_id = buffer.tostring(var1484)
			elseif var1473 == 6 then
				local _ = nil
				local var1486, var1487 = protoModule.readBuffer(p53, var1468)
				var1468 = var1487
				var1467.prompt_type = buffer.tostring(var1486)
			elseif var1473 == 7 then
				local _ = nil
				local var1488, var1489 = protoModule.readBuffer(p53, var1468)
				var1468 = var1489
				var1467.sort_id = buffer.tostring(var1488)
			elseif var1473 == 8 then
				local _ = nil
				local var1490, var1491 = protoModule.readBuffer(p53, var1468)
				var1468 = var1491
				var1467.feed_item_key = buffer.tostring(var1490)
			elseif var1473 == 9 then
				local _ = nil
				local var1492, var1493 = protoModule.readBuffer(p53, var1468)
				var1468 = var1493
				var1467.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1492)
				}
			else
				local _ = nil
				local var1494, var1495 = protoModule.readVarInt(p53, var1468)
				var1468 = var1495 + var1494
			end
		elseif var1469 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1496, var1497 = protoModule.readFixed32(p53, var1468)
			local _ = var1496
			var1468 = var1497
		elseif var1469 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1498, var1499 = protoModule.readFixed64(p53, var1468)
			local _ = var1498
			var1468 = var1499
		else
			error("Unsupported wire type: " .. var2292)
		end
	end
	return var1467
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
	local var1500 = t_53.new()
	
	if self.title ~= nil then
		var1500.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1500.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1500.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1500.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1500.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1500.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1500.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1500.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1500.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1500.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1500.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1500.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1500.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1500.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1500.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1500.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1500
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
	local var1501 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1502, var1503 = protoModule.writeTag(buff, var1501, 1, protoModule.wireTypes.lengthDelimited)
		var1502, var2330 = protoModule.writeString(var1502, var1503, self.title)
		buff = var1502
		var1501 = var1503
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1504, var1505 = protoModule.writeTag(buff, var1501, 2, protoModule.wireTypes.lengthDelimited)
		var1504, var2332 = protoModule.writeString(var1504, var1505, self.user_id)
		buff = var1504
		var1501 = var1505
	end
	if self.description ~= nil and self.description ~= "" then
		local var1506, var1507 = protoModule.writeTag(buff, var1501, 3, protoModule.wireTypes.lengthDelimited)
		var1506, var2334 = protoModule.writeString(var1506, var1507, self.description)
		buff = var1506
		var1501 = var1507
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1508, var1509 = protoModule.writeTag(buff, var1501, 4, protoModule.wireTypes.lengthDelimited)
		var1508, var2336 = protoModule.writeString(var1508, var1509, self.cta_text)
		buff = var1508
		var1501 = var1509
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1510, var1511 = protoModule.writeTag(buff, var1501, 5, protoModule.wireTypes.lengthDelimited)
		var1510, var2338 = protoModule.writeString(var1510, var1511, self.prompt_id)
		buff = var1510
		var1501 = var1511
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1512, var1513 = protoModule.writeTag(buff, var1501, 6, protoModule.wireTypes.lengthDelimited)
		var1512, var2340 = protoModule.writeString(var1512, var1513, self.prompt_type)
		buff = var1512
		var1501 = var1513
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1514, var1515 = protoModule.writeTag(buff, var1501, 7, protoModule.wireTypes.lengthDelimited)
		var1514, var2342 = protoModule.writeString(var1514, var1515, self.entity_id)
		buff = var1514
		var1501 = var1515
	end
	local buff_1 = buffer.create(var1501)
	buffer.copy(buff_1, 0, buff, 0, var1501)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1501 = t_54.new()
	local var1502 = 0
	while var1502 < buffer.len(p54) do
		local _ = nil
		local var1503 = nil
		local var1504, var1505, var1506 = protoModule.readTag(p54, var1502)
		local var1507 = var1504
		var1503 = var1505
		var1502 = var1506
		
		if var1503 == protoModule.wireTypes.varint then
			local _ = nil
			local var1508, var1509 = protoModule.readVarInt(p54, var1502)
			local _ = var1508
			var1502 = var1509
			continue
		end
		if var1503 == protoModule.wireTypes.lengthDelimited then
			if var1507 == 1 then
				local _ = nil
				local var1510, var1511 = protoModule.readBuffer(p54, var1502)
				var1502 = var1511
				var1501.title = buffer.tostring(var1510)
			elseif var1507 == 2 then
				local _ = nil
				local var1512, var1513 = protoModule.readBuffer(p54, var1502)
				var1502 = var1513
				var1501.user_id = buffer.tostring(var1512)
			elseif var1507 == 3 then
				local _ = nil
				local var1514, var1515 = protoModule.readBuffer(p54, var1502)
				var1502 = var1515
				var1501.description = buffer.tostring(var1514)
			elseif var1507 == 4 then
				local _ = nil
				local var1516, var1517 = protoModule.readBuffer(p54, var1502)
				var1502 = var1517
				var1501.cta_text = buffer.tostring(var1516)
			elseif var1507 == 5 then
				local _ = nil
				local var1518, var1519 = protoModule.readBuffer(p54, var1502)
				var1502 = var1519
				var1501.prompt_id = buffer.tostring(var1518)
			elseif var1507 == 6 then
				local _ = nil
				local var1520, var1521 = protoModule.readBuffer(p54, var1502)
				var1502 = var1521
				var1501.prompt_type = buffer.tostring(var1520)
			elseif var1507 == 7 then
				local _ = nil
				local var1522, var1523 = protoModule.readBuffer(p54, var1502)
				var1502 = var1523
				var1501.entity_id = buffer.tostring(var1522)
			else
				local _ = nil
				local var1524, var1525 = protoModule.readVarInt(p54, var1502)
				var1502 = var1525 + var1524
			end
		elseif var1503 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1526, var1527 = protoModule.readFixed32(p54, var1502)
			local _ = var1526
			var1502 = var1527
		elseif var1503 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1528, var1529 = protoModule.readFixed64(p54, var1502)
			local _ = var1528
			var1502 = var1529
		else
			error("Unsupported wire type: " .. var2346)
		end
	end
	return var1501
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
	local var1530 = t_54.new()
	
	if self.title ~= nil then
		var1530.title = self.title
	end
	if self.user_id ~= nil then
		var1530.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1530.user_id = self.userId
	end
	if self.description ~= nil then
		var1530.description = self.description
	end
	if self.cta_text ~= nil then
		var1530.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1530.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1530.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1530.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1530.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1530.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1530.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1530.entity_id = self.entityId
	end
	return var1530
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
	local var1530 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1531, var1532 = protoModule.writeTag(buff, var1530, 1, protoModule.wireTypes.lengthDelimited)
		var1531, var2378 = protoModule.writeString(var1531, var1532, self.prompt_id)
		buff = var1531
		var1530 = var1532
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1533, var1534 = protoModule.writeTag(buff, var1530, 2, protoModule.wireTypes.lengthDelimited)
		var1533, var2380 = protoModule.writeString(var1533, var1534, self.prompt_type)
		buff = var1533
		var1530 = var1534
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1535, var1536 = protoModule.writeTag(buff, var1530, 3, protoModule.wireTypes.lengthDelimited)
		var1535, var2382 = protoModule.writeString(var1535, var1536, self.user_id)
		buff = var1535
		var1530 = var1536
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1537, var1538 = protoModule.writeTag(buff, var1530, 4, protoModule.wireTypes.lengthDelimited)
		var1537, var2384 = protoModule.writeString(var1537, var1538, self.audit_data)
		buff = var1537
		var1530 = var1538
	end
	local buff_1 = buffer.create(var1530)
	buffer.copy(buff_1, 0, buff, 0, var1530)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1530 = t_55.new()
	local var1531 = 0
	while var1531 < buffer.len(p55) do
		local _ = nil
		local var1532 = nil
		local var1533, var1534, var1535 = protoModule.readTag(p55, var1531)
		local var1536 = var1533
		var1532 = var1534
		var1531 = var1535
		
		if var1532 == protoModule.wireTypes.varint then
			local _ = nil
			local var1537, var1538 = protoModule.readVarInt(p55, var1531)
			local _ = var1537
			var1531 = var1538
			continue
		end
		if var1532 == protoModule.wireTypes.lengthDelimited then
			if var1536 == 1 then
				local _ = nil
				local var1539, var1540 = protoModule.readBuffer(p55, var1531)
				var1531 = var1540
				var1530.prompt_id = buffer.tostring(var1539)
			elseif var1536 == 2 then
				local _ = nil
				local var1541, var1542 = protoModule.readBuffer(p55, var1531)
				var1531 = var1542
				var1530.prompt_type = buffer.tostring(var1541)
			elseif var1536 == 3 then
				local _ = nil
				local var1543, var1544 = protoModule.readBuffer(p55, var1531)
				var1531 = var1544
				var1530.user_id = buffer.tostring(var1543)
			elseif var1536 == 4 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p55, var1531)
				var1531 = var1546
				var1530.audit_data = buffer.tostring(var1545)
			else
				local _ = nil
				local var1547, var1548 = protoModule.readVarInt(p55, var1531)
				var1531 = var1548 + var1547
			end
		elseif var1532 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1549, var1550 = protoModule.readFixed32(p55, var1531)
			local _ = var1549
			var1531 = var1550
		elseif var1532 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1551, var1552 = protoModule.readFixed64(p55, var1531)
			local _ = var1551
			var1531 = var1552
		else
			error("Unsupported wire type: " .. var2388)
		end
	end
	return var1530
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
	local var1553 = t_55.new()
	
	if self.prompt_id ~= nil then
		var1553.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1553.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1553.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1553.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1553.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1553.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1553.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1553.audit_data = self.auditData
	end
	return var1553
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
	local var1553 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1554, var1555 = protoModule.writeTag(buff, var1553, 1, protoModule.wireTypes.varint)
		var1554, var2414 = protoModule.writeVarInt(var1554, var1555, self.sender_count)
		buff = var1554
		var1553 = var1555
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1556, var1557 = protoModule.writeTag(buff, var1553, 2, protoModule.wireTypes.varint)
		var1556, var2416 = protoModule.writeVarInt(var1556, var1557, self.total_robux_amount)
		buff = var1556
		var1553 = var1557
	end
	local buff_1 = buffer.create(var1553)
	buffer.copy(buff_1, 0, buff, 0, var1553)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1553 = t_56.new()
	local var1554 = 0
	while var1554 < buffer.len(p56) do
		local _ = nil
		local _ = nil
		local var1555, var1556, var1557 = protoModule.readTag(p56, var1554)
		local var1558 = var1555
		local var1559 = var1556
		var1554 = var1557
		
		if var1559 == protoModule.wireTypes.varint then
			if var1558 == 1 then
				local _ = nil
				local var1560, var1561 = protoModule.readVarIntI32(p56, var1554)
				var1554 = var1561
				var1553.sender_count = var1560
			elseif var1558 == 2 then
				local _ = nil
				local var1562, var1563 = protoModule.readVarIntI64(p56, var1554)
				var1554 = var1563
				var1553.total_robux_amount = var1562
			else
				local _ = nil
				local var1564, var1565 = protoModule.readVarInt(p56, var1554)
				local _ = var1564
				var1554 = var1565
			end
		elseif var1559 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1566, var1567 = protoModule.readVarInt(p56, var1554)
			var1554 = var1567 + var1566
		elseif var1559 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1568, var1569 = protoModule.readFixed32(p56, var1554)
			local _ = var1568
			var1554 = var1569
		elseif var1559 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1570, var1571 = protoModule.readFixed64(p56, var1554)
			local _ = var1570
			var1554 = var1571
		else
			error("Unsupported wire type: " .. var2424)
		end
	end
	return var1553
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
	local var1572 = t_56.new()
	
	if self.sender_count ~= nil then
		var1572.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1572.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1572.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1572.total_robux_amount = self.totalRobuxAmount
	end
	return var1572
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
	local var1572 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1573, var1574 = protoModule.writeTag(buff, var1572, 1, protoModule.wireTypes.lengthDelimited)
		var1573, var2442 = protoModule.writeString(var1573, var1574, self.title)
		buff = var1573
		var1572 = var1574
	end
	if self.description ~= nil and self.description ~= "" then
		local var1575, var1576 = protoModule.writeTag(buff, var1572, 2, protoModule.wireTypes.lengthDelimited)
		var1575, var2444 = protoModule.writeString(var1575, var1576, self.description)
		buff = var1575
		var1572 = var1576
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1577, var1578 = protoModule.writeTag(buff, var1572, 3, protoModule.wireTypes.lengthDelimited)
		var1577, var2446 = protoModule.writeString(var1577, var1578, self.primary_text)
		buff = var1577
		var1572 = var1578
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1579, var1580 = protoModule.writeTag(buff, var1572, 4, protoModule.wireTypes.lengthDelimited)
		var1579, var2448 = protoModule.writeString(var1579, var1580, self.secondary_text)
		buff = var1579
		var1572 = var1580
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1581, var1582 = protoModule.writeTag(buff, var1572, 5, protoModule.wireTypes.lengthDelimited)
		var1581, var2450 = protoModule.writeString(var1581, var1582, self.prompt_id)
		buff = var1581
		var1572 = var1582
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1583, var1584 = protoModule.writeTag(buff, var1572, 6, protoModule.wireTypes.lengthDelimited)
		var1583, var2452 = protoModule.writeString(var1583, var1584, self.prompt_type)
		buff = var1583
		var1572 = var1584
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1585, var1586 = protoModule.writeTag(buff, var1572, 7, protoModule.wireTypes.varint)
		var1585, var2454 = protoModule.writeVarInt(var1585, var1586, self.times_seen)
		buff = var1585
		var1572 = var1586
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1587 = self.content.value:encode()
		local var1588, var1589 = protoModule.writeTag(buff, var1572, 8, protoModule.wireTypes.lengthDelimited)
		var1588, var2457 = protoModule.writeBuffer(var1588, var1589, var1587, buffer.len(var1587))
		buff = var1588
		var1572 = var1589
	end
	local buff_1 = buffer.create(var1572)
	buffer.copy(buff_1, 0, buff, 0, var1572)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1572 = t_57.new()
	local var1573 = 0
	while var1573 < buffer.len(p57) do
		local _ = nil
		local var1574 = nil
		local var1575, var1576, var1577 = protoModule.readTag(p57, var1573)
		local var1578 = var1575
		var1574 = var1576
		var1573 = var1577
		
		if var1574 == protoModule.wireTypes.varint then
			if var1578 == 7 then
				local _ = nil
				local var1579, var1580 = protoModule.readVarIntI32(p57, var1573)
				var1573 = var1580
				var1572.times_seen = var1579
			else
				local _ = nil
				local var1581, var1582 = protoModule.readVarInt(p57, var1573)
				local _ = var1581
				var1573 = var1582
			end
		end
		if var1574 == protoModule.wireTypes.lengthDelimited then
			if var1578 == 1 then
				local _ = nil
				local var1583, var1584 = protoModule.readBuffer(p57, var1573)
				var1573 = var1584
				var1572.title = buffer.tostring(var1583)
			elseif var1578 == 2 then
				local _ = nil
				local var1585, var1586 = protoModule.readBuffer(p57, var1573)
				var1573 = var1586
				var1572.description = buffer.tostring(var1585)
			elseif var1578 == 3 then
				local _ = nil
				local var1587, var1588 = protoModule.readBuffer(p57, var1573)
				var1573 = var1588
				var1572.primary_text = buffer.tostring(var1587)
			elseif var1578 == 4 then
				local _ = nil
				local var1589, var1590 = protoModule.readBuffer(p57, var1573)
				var1573 = var1590
				var1572.secondary_text = buffer.tostring(var1589)
			elseif var1578 == 5 then
				local _ = nil
				local var1591, var1592 = protoModule.readBuffer(p57, var1573)
				var1573 = var1592
				var1572.prompt_id = buffer.tostring(var1591)
			elseif var1578 == 6 then
				local _ = nil
				local var1593, var1594 = protoModule.readBuffer(p57, var1573)
				var1573 = var1594
				var1572.prompt_type = buffer.tostring(var1593)
			elseif var1578 == 8 then
				local _ = nil
				local var1595, var1596 = protoModule.readBuffer(p57, var1573)
				var1573 = var1596
				var1572.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1595)
				}
			else
				local _ = nil
				local var1597, var1598 = protoModule.readVarInt(p57, var1573)
				var1573 = var1598 + var1597
			end
		elseif var1574 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1599, var1600 = protoModule.readFixed32(p57, var1573)
			local _ = var1599
			var1573 = var1600
		elseif var1574 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1601, var1602 = protoModule.readFixed64(p57, var1573)
			local _ = var1601
			var1573 = var1602
		else
			error("Unsupported wire type: " .. var2461)
		end
	end
	return var1572
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
	local var1603 = t_57.new()
	
	if self.title ~= nil then
		var1603.title = self.title
	end
	if self.description ~= nil then
		var1603.description = self.description
	end
	if self.primary_text ~= nil then
		var1603.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1603.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1603.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1603.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1603.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1603.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1603.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1603.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1603.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1603.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1603.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1603.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var1603
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
	local var1603 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1604, var1605 = protoModule.writeTag(buff, var1603, 1, protoModule.wireTypes.lengthDelimited)
		var1604, var2495 = protoModule.writeString(var1604, var1605, self.tooltip_text)
		buff = var1604
		var1603 = var1605
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1606, var1607 = protoModule.writeTag(buff, var1603, 2, protoModule.wireTypes.lengthDelimited)
		var1606, var2497 = protoModule.writeString(var1606, var1607, self.prompt_id)
		buff = var1606
		var1603 = var1607
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1608, var1609 = protoModule.writeTag(buff, var1603, 3, protoModule.wireTypes.lengthDelimited)
		var1608, var2499 = protoModule.writeString(var1608, var1609, self.prompt_type)
		buff = var1608
		var1603 = var1609
	end
	local buff_1 = buffer.create(var1603)
	buffer.copy(buff_1, 0, buff, 0, var1603)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1603 = t_58.new()
	local var1604 = 0
	while var1604 < buffer.len(p58) do
		local _ = nil
		local var1605 = nil
		local var1606, var1607, var1608 = protoModule.readTag(p58, var1604)
		local var1609 = var1606
		var1605 = var1607
		var1604 = var1608
		
		if var1605 == protoModule.wireTypes.varint then
			local _ = nil
			local var1610, var1611 = protoModule.readVarInt(p58, var1604)
			local _ = var1610
			var1604 = var1611
			continue
		end
		if var1605 == protoModule.wireTypes.lengthDelimited then
			if var1609 == 1 then
				local _ = nil
				local var1612, var1613 = protoModule.readBuffer(p58, var1604)
				var1604 = var1613
				var1603.tooltip_text = buffer.tostring(var1612)
			elseif var1609 == 2 then
				local _ = nil
				local var1614, var1615 = protoModule.readBuffer(p58, var1604)
				var1604 = var1615
				var1603.prompt_id = buffer.tostring(var1614)
			elseif var1609 == 3 then
				local _ = nil
				local var1616, var1617 = protoModule.readBuffer(p58, var1604)
				var1604 = var1617
				var1603.prompt_type = buffer.tostring(var1616)
			else
				local _ = nil
				local var1618, var1619 = protoModule.readVarInt(p58, var1604)
				var1604 = var1619 + var1618
			end
		elseif var1605 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1620, var1621 = protoModule.readFixed32(p58, var1604)
			local _ = var1620
			var1604 = var1621
		elseif var1605 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1622, var1623 = protoModule.readFixed64(p58, var1604)
			local _ = var1622
			var1604 = var1623
		else
			error("Unsupported wire type: " .. var2503)
		end
	end
	return var1603
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
	local var1624 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var1624.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1624.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1624.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1624.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1624.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1624.prompt_type = self.promptType
	end
	return var1624
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
	local var1624 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1625, var1626 = protoModule.writeTag(buff, var1624, 1, protoModule.wireTypes.lengthDelimited)
		var1625, var2527 = protoModule.writeString(var1625, var1626, self.media_id)
		buff = var1625
		var1624 = var1626
	end
	if self.title ~= nil and self.title ~= "" then
		local var1627, var1628 = protoModule.writeTag(buff, var1624, 2, protoModule.wireTypes.lengthDelimited)
		var1627, var2529 = protoModule.writeString(var1627, var1628, self.title)
		buff = var1627
		var1624 = var1628
	end
	if self.description ~= nil and self.description ~= "" then
		local var1629, var1630 = protoModule.writeTag(buff, var1624, 3, protoModule.wireTypes.lengthDelimited)
		var1629, var2531 = protoModule.writeString(var1629, var1630, self.description)
		buff = var1629
		var1624 = var1630
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1631, var1632 = protoModule.writeTag(buff, var1624, 4, protoModule.wireTypes.lengthDelimited)
		var1631, var2533 = protoModule.writeString(var1631, var1632, self.prompt_id)
		buff = var1631
		var1624 = var1632
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1633, var1634 = protoModule.writeTag(buff, var1624, 5, protoModule.wireTypes.lengthDelimited)
		var1633, var2535 = protoModule.writeString(var1633, var1634, self.prompt_type)
		buff = var1633
		var1624 = var1634
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1635, var1636 = protoModule.writeTag(buff, var1624, 6, protoModule.wireTypes.lengthDelimited)
		var1635, var2537 = protoModule.writeString(var1635, var1636, self.anchor_tag)
		buff = var1635
		var1624 = var1636
	end
	local buff_1 = buffer.create(var1624)
	buffer.copy(buff_1, 0, buff, 0, var1624)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1624 = t_59.new()
	local var1625 = 0
	while var1625 < buffer.len(p59) do
		local _ = nil
		local var1626 = nil
		local var1627, var1628, var1629 = protoModule.readTag(p59, var1625)
		local var1630 = var1627
		var1626 = var1628
		var1625 = var1629
		
		if var1626 == protoModule.wireTypes.varint then
			local _ = nil
			local var1631, var1632 = protoModule.readVarInt(p59, var1625)
			local _ = var1631
			var1625 = var1632
			continue
		end
		if var1626 == protoModule.wireTypes.lengthDelimited then
			if var1630 == 1 then
				local _ = nil
				local var1633, var1634 = protoModule.readBuffer(p59, var1625)
				var1625 = var1634
				var1624.media_id = buffer.tostring(var1633)
			elseif var1630 == 2 then
				local _ = nil
				local var1635, var1636 = protoModule.readBuffer(p59, var1625)
				var1625 = var1636
				var1624.title = buffer.tostring(var1635)
			elseif var1630 == 3 then
				local _ = nil
				local var1637, var1638 = protoModule.readBuffer(p59, var1625)
				var1625 = var1638
				var1624.description = buffer.tostring(var1637)
			elseif var1630 == 4 then
				local _ = nil
				local var1639, var1640 = protoModule.readBuffer(p59, var1625)
				var1625 = var1640
				var1624.prompt_id = buffer.tostring(var1639)
			elseif var1630 == 5 then
				local _ = nil
				local var1641, var1642 = protoModule.readBuffer(p59, var1625)
				var1625 = var1642
				var1624.prompt_type = buffer.tostring(var1641)
			elseif var1630 == 6 then
				local _ = nil
				local var1643, var1644 = protoModule.readBuffer(p59, var1625)
				var1625 = var1644
				var1624.anchor_tag = buffer.tostring(var1643)
			else
				local _ = nil
				local var1645, var1646 = protoModule.readVarInt(p59, var1625)
				var1625 = var1646 + var1645
			end
		elseif var1626 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1647, var1648 = protoModule.readFixed32(p59, var1625)
			local _ = var1647
			var1625 = var1648
		elseif var1626 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1649, var1650 = protoModule.readFixed64(p59, var1625)
			local _ = var1649
			var1625 = var1650
		else
			error("Unsupported wire type: " .. var2541)
		end
	end
	return var1624
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
	local var1651 = t_59.new()
	
	if self.media_id ~= nil then
		var1651.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1651.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1651.title = self.title
	end
	if self.description ~= nil then
		var1651.description = self.description
	end
	if self.prompt_id ~= nil then
		var1651.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1651.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1651.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1651.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1651.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1651.anchor_tag = self.anchorTag
	end
	return var1651
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
	local var1651 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1652, var1653 = protoModule.writeTag(buff, var1651, 1, protoModule.wireTypes.lengthDelimited)
		var1652, var2571 = protoModule.writeString(var1652, var1653, self.prompt_id)
		buff = var1652
		var1651 = var1653
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1654, var1655 = protoModule.writeTag(buff, var1651, 2, protoModule.wireTypes.lengthDelimited)
		var1654, var2573 = protoModule.writeString(var1654, var1655, self.prompt_type)
		buff = var1654
		var1651 = var1655
	end
	local buff_1 = buffer.create(var1651)
	buffer.copy(buff_1, 0, buff, 0, var1651)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1651 = t_60.new()
	local var1652 = 0
	while var1652 < buffer.len(p60) do
		local _ = nil
		local var1653 = nil
		local var1654, var1655, var1656 = protoModule.readTag(p60, var1652)
		local var1657 = var1654
		var1653 = var1655
		var1652 = var1656
		
		if var1653 == protoModule.wireTypes.varint then
			local _ = nil
			local var1658, var1659 = protoModule.readVarInt(p60, var1652)
			local _ = var1658
			var1652 = var1659
			continue
		end
		if var1653 == protoModule.wireTypes.lengthDelimited then
			if var1657 == 1 then
				local _ = nil
				local var1660, var1661 = protoModule.readBuffer(p60, var1652)
				var1652 = var1661
				var1651.prompt_id = buffer.tostring(var1660)
			elseif var1657 == 2 then
				local _ = nil
				local var1662, var1663 = protoModule.readBuffer(p60, var1652)
				var1652 = var1663
				var1651.prompt_type = buffer.tostring(var1662)
			else
				local _ = nil
				local var1664, var1665 = protoModule.readVarInt(p60, var1652)
				var1652 = var1665 + var1664
			end
		elseif var1653 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1666, var1667 = protoModule.readFixed32(p60, var1652)
			local _ = var1666
			var1652 = var1667
		elseif var1653 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1668, var1669 = protoModule.readFixed64(p60, var1652)
			local _ = var1668
			var1652 = var1669
		else
			error("Unsupported wire type: " .. var2577)
		end
	end
	return var1651
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
	local var1670 = t_60.new()
	
	if self.prompt_id ~= nil then
		var1670.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1670.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1670.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1670.prompt_type = self.promptType
	end
	return var1670
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
	local var1670 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1671, var1672 = protoModule.writeTag(buff, var1670, 1, protoModule.wireTypes.lengthDelimited)
		var1671, var2599 = protoModule.writeString(var1671, var1672, self.upsell_prompt)
		buff = var1671
		var1670 = var1672
	end
	local buff_1 = buffer.create(var1670)
	buffer.copy(buff_1, 0, buff, 0, var1670)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1670 = t_61.new()
	local var1671 = 0
	while var1671 < buffer.len(p61) do
		local _ = nil
		local var1672 = nil
		local var1673, var1674, var1675 = protoModule.readTag(p61, var1671)
		local var1676 = var1673
		var1672 = var1674
		var1671 = var1675
		
		if var1672 == protoModule.wireTypes.varint then
			local _ = nil
			local var1677, var1678 = protoModule.readVarInt(p61, var1671)
			local _ = var1677
			var1671 = var1678
			continue
		end
		if var1672 == protoModule.wireTypes.lengthDelimited then
			if var1676 == 1 then
				local _ = nil
				local var1679, var1680 = protoModule.readBuffer(p61, var1671)
				var1671 = var1680
				var1670.upsell_prompt = buffer.tostring(var1679)
			else
				local _ = nil
				local var1681, var1682 = protoModule.readVarInt(p61, var1671)
				var1671 = var1682 + var1681
			end
		elseif var1672 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1683, var1684 = protoModule.readFixed32(p61, var1671)
			local _ = var1683
			var1671 = var1684
		elseif var1672 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1685, var1686 = protoModule.readFixed64(p61, var1671)
			local _ = var1685
			var1671 = var1686
		else
			error("Unsupported wire type: " .. var2603)
		end
	end
	return var1670
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
	local var1687 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var1687.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1687.upsell_prompt = self.upsellPrompt
	end
	return var1687
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
	local var1687 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1688, var1689 = protoModule.writeTag(buff, var1687, 1, protoModule.wireTypes.lengthDelimited)
		var1688, var2623 = protoModule.writeString(var1688, var1689, self.modal_variant)
		buff = var1688
		var1687 = var1689
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1690, var1691 = protoModule.writeTag(buff, var1687, 2, protoModule.wireTypes.lengthDelimited)
		var1690, var2625 = protoModule.writeString(var1690, var1691, self.modal_sequence)
		buff = var1690
		var1687 = var1691
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1692, var1693 = protoModule.writeTag(buff, var1687, 3, protoModule.wireTypes.lengthDelimited)
		var1692, var2627 = protoModule.writeString(var1692, var1693, self.conversation_id)
		buff = var1692
		var1687 = var1693
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1694, var1695 = protoModule.writeTag(buff, var1687, 4, protoModule.wireTypes.lengthDelimited)
		var1694, var2629 = protoModule.writeString(var1694, var1695, self.friend_id)
		buff = var1694
		var1687 = var1695
	end
	local buff_1 = buffer.create(var1687)
	buffer.copy(buff_1, 0, buff, 0, var1687)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1687 = t_62.new()
	local var1688 = 0
	while var1688 < buffer.len(p62) do
		local _ = nil
		local var1689 = nil
		local var1690, var1691, var1692 = protoModule.readTag(p62, var1688)
		local var1693 = var1690
		var1689 = var1691
		var1688 = var1692
		
		if var1689 == protoModule.wireTypes.varint then
			local _ = nil
			local var1694, var1695 = protoModule.readVarInt(p62, var1688)
			local _ = var1694
			var1688 = var1695
			continue
		end
		if var1689 == protoModule.wireTypes.lengthDelimited then
			if var1693 == 1 then
				local _ = nil
				local var1696, var1697 = protoModule.readBuffer(p62, var1688)
				var1688 = var1697
				var1687.modal_variant = buffer.tostring(var1696)
			elseif var1693 == 2 then
				local _ = nil
				local var1698, var1699 = protoModule.readBuffer(p62, var1688)
				var1688 = var1699
				var1687.modal_sequence = buffer.tostring(var1698)
			elseif var1693 == 3 then
				local _ = nil
				local var1700, var1701 = protoModule.readBuffer(p62, var1688)
				var1688 = var1701
				var1687.conversation_id = buffer.tostring(var1700)
			elseif var1693 == 4 then
				local _ = nil
				local var1702, var1703 = protoModule.readBuffer(p62, var1688)
				var1688 = var1703
				var1687.friend_id = buffer.tostring(var1702)
			else
				local _ = nil
				local var1704, var1705 = protoModule.readVarInt(p62, var1688)
				var1688 = var1705 + var1704
			end
		elseif var1689 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1706, var1707 = protoModule.readFixed32(p62, var1688)
			local _ = var1706
			var1688 = var1707
		elseif var1689 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1708, var1709 = protoModule.readFixed64(p62, var1688)
			local _ = var1708
			var1688 = var1709
		else
			error("Unsupported wire type: " .. var2633)
		end
	end
	return var1687
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
	local var1710 = t_62.new()
	
	if self.modal_variant ~= nil then
		var1710.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1710.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1710.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1710.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1710.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1710.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1710.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1710.friend_id = self.friendId
	end
	return var1710
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
	local var1710 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1711, var1712 = protoModule.writeTag(buff, var1710, 1, protoModule.wireTypes.lengthDelimited)
		var1711, var2659 = protoModule.writeString(var1711, var1712, self.event_id)
		buff = var1711
		var1710 = var1712
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1713, var1714 = protoModule.writeTag(buff, var1710, 2, protoModule.wireTypes.lengthDelimited)
		var1713, var2661 = protoModule.writeString(var1713, var1714, self.universe_id)
		buff = var1713
		var1710 = var1714
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1715, var1716 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1715, var2663 = protoModule.writeString(var1715, var1716, i)
			local var1717 = v:encode()
			var1716, var2665 = protoModule.writeTag(var1715, var1716, 2, protoModule.wireTypes.lengthDelimited)
			var1716, var2665 = protoModule.writeBuffer(var1716, var2665, var1717, buffer.len(var1717))
			local var1718 = var1716
			local var1719 = var2665
			local var1720, var1721 = protoModule.writeTag(buff, var1710, 3, protoModule.wireTypes.lengthDelimited)
			var1720, var2669 = protoModule.writeBuffer(var1720, var1721, var1718, var1719)
			buff = var1720
			var1710 = var1721
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1722, var1723 = protoModule.writeTag(buff, var1710, 4, protoModule.wireTypes.lengthDelimited)
			var1722, var2671 = protoModule.writeString(var1722, var1723, v)
			buff = var1722
			var1710 = var1723
		end
	end
	local buff_1 = buffer.create(var1710)
	buffer.copy(buff_1, 0, buff, 0, var1710)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var1724 = t_63.new()
	local var1725 = 0
	while var1725 < buffer.len(p63) do
		local _ = nil
		local var1726 = nil
		local var1727, var1728, var1729 = protoModule.readTag(p63, var1725)
		local var1730 = var1727
		var1726 = var1728
		var1725 = var1729
		
		if var1726 == protoModule.wireTypes.varint then
			local _ = nil
			local var1731, var1732 = protoModule.readVarInt(p63, var1725)
			local _ = var1731
			var1725 = var1732
			continue
		end
		if var1726 == protoModule.wireTypes.lengthDelimited then
			if var1730 == 1 then
				local _ = nil
				local var1733, var1734 = protoModule.readBuffer(p63, var1725)
				var1725 = var1734
				var1724.event_id = buffer.tostring(var1733)
			elseif var1730 == 2 then
				local _ = nil
				local var1735, var1736 = protoModule.readBuffer(p63, var1725)
				var1725 = var1736
				var1724.universe_id = buffer.tostring(var1735)
			elseif var1730 == 3 then
				local _ = nil
				local var1737, var1738 = protoModule.readBuffer(p63, var1725)
				var1725 = var1738
				var1737 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1737)
				var1724.entry_map[var1737.key or ""] = var1737.value or t.FeedEntry.new()
			elseif var1730 == 4 then
				local _ = nil
				local var1739, var1740 = protoModule.readBuffer(p63, var1725)
				var1725 = var1740
				table.insert(var1724.entry_order, buffer.tostring(var1739))
			else
				local _ = nil
				local var1741, var1742 = protoModule.readVarInt(p63, var1725)
				var1725 = var1742 + var1741
			end
		elseif var1726 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1743, var1744 = protoModule.readFixed32(p63, var1725)
			local _ = var1743
			var1725 = var1744
		elseif var1726 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1745, var1746 = protoModule.readFixed64(p63, var1725)
			local _ = var1745
			var1725 = var1746
		else
			error("Unsupported wire type: " .. var2675)
		end
	end
	return var1724
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
	local var1747 = t_63.new()
	
	if self.event_id ~= nil then
		var1747.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1747.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1747.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1747.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1747.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1747.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1747.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1747.entry_order = t_1
	end
	return var1747
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
	local var1748 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1749, var1750 = protoModule.writeTag(buff, var1748, 1, protoModule.wireTypes.lengthDelimited)
		var1749, var2707 = protoModule.writeString(var1749, var1750, self.key)
		buff = var1749
		var1748 = var1750
	end
	if self.value ~= nil then
		local var1751 = self.value:encode()
		local var1752, var1753 = protoModule.writeTag(buff, var1748, 2, protoModule.wireTypes.lengthDelimited)
		var1752, var2710 = protoModule.writeBuffer(var1752, var1753, var1751, buffer.len(var1751))
		buff = var1752
		var1748 = var1753
	end
	local buff_1 = buffer.create(var1748)
	buffer.copy(buff_1, 0, buff, 0, var1748)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1748 = t_64.new()
	local var1749 = 0
	while var1749 < buffer.len(p64) do
		local _ = nil
		local var1750 = nil
		local var1751, var1752, var1753 = protoModule.readTag(p64, var1749)
		local var1754 = var1751
		var1750 = var1752
		var1749 = var1753
		
		if var1750 == protoModule.wireTypes.varint then
			local _ = nil
			local var1755, var1756 = protoModule.readVarInt(p64, var1749)
			local _ = var1755
			var1749 = var1756
			continue
		end
		if var1750 == protoModule.wireTypes.lengthDelimited then
			if var1754 == 1 then
				local _ = nil
				local var1757, var1758 = protoModule.readBuffer(p64, var1749)
				var1749 = var1758
				var1748.key = buffer.tostring(var1757)
			elseif var1754 == 2 then
				local _ = nil
				local var1759, var1760 = protoModule.readBuffer(p64, var1749)
				var1749 = var1760
				var1748.value = t.FeedEntry.decode(var1759)
			else
				local _ = nil
				local var1761, var1762 = protoModule.readVarInt(p64, var1749)
				var1749 = var1762 + var1761
			end
		elseif var1750 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1763, var1764 = protoModule.readFixed32(p64, var1749)
			local _ = var1763
			var1749 = var1764
		elseif var1750 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1765, var1766 = protoModule.readFixed64(p64, var1749)
			local _ = var1765
			var1749 = var1766
		else
			error("Unsupported wire type: " .. var2714)
		end
	end
	return var1748
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
	local var1767 = t_64.new()
	
	if self.key ~= nil then
		var1767.key = self.key
	end
	if self.value ~= nil then
		var1767.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1767
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
	local var1767 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1768, var1769 = protoModule.writeTag(buff, var1767, 1, protoModule.wireTypes.lengthDelimited)
		var1768, var2736 = protoModule.writeString(var1768, var1769, self.event_id)
		buff = var1768
		var1767 = var1769
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1770, var1771 = protoModule.writeTag(buff, var1767, 2, protoModule.wireTypes.lengthDelimited)
		var1770, var2738 = protoModule.writeString(var1770, var1771, self.universe_id)
		buff = var1770
		var1767 = var1771
	end
	local buff_1 = buffer.create(var1767)
	buffer.copy(buff_1, 0, buff, 0, var1767)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1767 = t_65.new()
	local var1768 = 0
	while var1768 < buffer.len(p65) do
		local _ = nil
		local var1769 = nil
		local var1770, var1771, var1772 = protoModule.readTag(p65, var1768)
		local var1773 = var1770
		var1769 = var1771
		var1768 = var1772
		
		if var1769 == protoModule.wireTypes.varint then
			local _ = nil
			local var1774, var1775 = protoModule.readVarInt(p65, var1768)
			local _ = var1774
			var1768 = var1775
			continue
		end
		if var1769 == protoModule.wireTypes.lengthDelimited then
			if var1773 == 1 then
				local _ = nil
				local var1776, var1777 = protoModule.readBuffer(p65, var1768)
				var1768 = var1777
				var1767.event_id = buffer.tostring(var1776)
			elseif var1773 == 2 then
				local _ = nil
				local var1778, var1779 = protoModule.readBuffer(p65, var1768)
				var1768 = var1779
				var1767.universe_id = buffer.tostring(var1778)
			else
				local _ = nil
				local var1780, var1781 = protoModule.readVarInt(p65, var1768)
				var1768 = var1781 + var1780
			end
		elseif var1769 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1782, var1783 = protoModule.readFixed32(p65, var1768)
			local _ = var1782
			var1768 = var1783
		elseif var1769 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1784, var1785 = protoModule.readFixed64(p65, var1768)
			local _ = var1784
			var1768 = var1785
		else
			error("Unsupported wire type: " .. var2742)
		end
	end
	return var1767
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
	local var1786 = t_65.new()
	
	if self.event_id ~= nil then
		var1786.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1786.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1786.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1786.universe_id = self.universeId
	end
	return var1786
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
	local var1786 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1787, var1788 = protoModule.writeTag(buff, var1786, 1, protoModule.wireTypes.lengthDelimited)
		var1787, var2764 = protoModule.writeString(var1787, var1788, self.event_id)
		buff = var1787
		var1786 = var1788
	end
	local buff_1 = buffer.create(var1786)
	buffer.copy(buff_1, 0, buff, 0, var1786)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref)
	local var1786 = t_66.new()
	local var1787 = 0
	while var1787 < buffer.len(p66) do
		local _ = nil
		local var1788 = nil
		local var1789, var1790, var1791 = protoModule.readTag(p66, var1787)
		local var1792 = var1789
		var1788 = var1790
		var1787 = var1791
		
		if var1788 == protoModule.wireTypes.varint then
			local _ = nil
			local var1793, var1794 = protoModule.readVarInt(p66, var1787)
			local _ = var1793
			var1787 = var1794
			continue
		end
		if var1788 == protoModule.wireTypes.lengthDelimited then
			if var1792 == 1 then
				local _ = nil
				local var1795, var1796 = protoModule.readBuffer(p66, var1787)
				var1787 = var1796
				var1786.event_id = buffer.tostring(var1795)
			else
				local _ = nil
				local var1797, var1798 = protoModule.readVarInt(p66, var1787)
				var1787 = var1798 + var1797
			end
		elseif var1788 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1799, var1800 = protoModule.readFixed32(p66, var1787)
			local _ = var1799
			var1787 = var1800
		elseif var1788 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1801, var1802 = protoModule.readFixed64(p66, var1787)
			local _ = var1801
			var1787 = var1802
		else
			error("Unsupported wire type: " .. var2768)
		end
	end
	return var1786
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
	local var1803 = t_66.new()
	
	if self.event_id ~= nil then
		var1803.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1803.event_id = self.eventId
	end
	return var1803
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
	local var1803 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1804, var1805 = protoModule.writeTag(buff, var1803, 1, protoModule.wireTypes.lengthDelimited)
		var1804, var2788 = protoModule.writeString(var1804, var1805, self.event_id)
		buff = var1804
		var1803 = var1805
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1806, var1807 = protoModule.writeTag(buff, var1803, 2, protoModule.wireTypes.lengthDelimited)
		var1806, var2790 = protoModule.writeString(var1806, var1807, self.universe_id)
		buff = var1806
		var1803 = var1807
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var1808 = v:encode()
			local var1809, var1810 = protoModule.writeTag(buff, var1803, 3, protoModule.wireTypes.lengthDelimited)
			var1809, var2793 = protoModule.writeBuffer(var1809, var1810, var1808, buffer.len(var1808))
			buff = var1809
			var1803 = var1810
		end
	end
	local buff_1 = buffer.create(var1803)
	buffer.copy(buff_1, 0, buff, 0, var1803)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1811 = t_67.new()
	local var1812 = 0
	while var1812 < buffer.len(p67) do
		local _ = nil
		local var1813 = nil
		local var1814, var1815, var1816 = protoModule.readTag(p67, var1812)
		local var1817 = var1814
		var1813 = var1815
		var1812 = var1816
		
		if var1813 == protoModule.wireTypes.varint then
			local _ = nil
			local var1818, var1819 = protoModule.readVarInt(p67, var1812)
			local _ = var1818
			var1812 = var1819
			continue
		end
		if var1813 == protoModule.wireTypes.lengthDelimited then
			if var1817 == 1 then
				local _ = nil
				local var1820, var1821 = protoModule.readBuffer(p67, var1812)
				var1812 = var1821
				var1811.event_id = buffer.tostring(var1820)
			elseif var1817 == 2 then
				local _ = nil
				local var1822, var1823 = protoModule.readBuffer(p67, var1812)
				var1812 = var1823
				var1811.universe_id = buffer.tostring(var1822)
			elseif var1817 == 3 then
				local _ = nil
				local var1824, var1825 = protoModule.readBuffer(p67, var1812)
				var1812 = var1825
				table.insert(var1811.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var1824))
			else
				local _ = nil
				local var1826, var1827 = protoModule.readVarInt(p67, var1812)
				var1812 = var1827 + var1826
			end
		elseif var1813 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1828, var1829 = protoModule.readFixed32(p67, var1812)
			local _ = var1828
			var1812 = var1829
		elseif var1813 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1830, var1831 = protoModule.readFixed64(p67, var1812)
			local _ = var1830
			var1812 = var1831
		else
			error("Unsupported wire type: " .. var2797)
		end
	end
	return var1811
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
	local var1832 = t_67.new()
	
	if self.event_id ~= nil then
		var1832.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1832.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1832.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1832.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1832.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1832.rsvp_users = t_1
	end
	return var1832
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
	local var1833 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var1834, var1835 = protoModule.writeTag(buff, var1833, 1, protoModule.wireTypes.varint)
		var1834, var2824 = protoModule.writeVarInt(var1834, var1835, self.user_id)
		buff = var1834
		var1833 = var1835
	end
	local buff_1 = buffer.create(var1833)
	buffer.copy(buff_1, 0, buff, 0, var1833)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1833 = t_68.new()
	local var1834 = 0
	while var1834 < buffer.len(p68) do
		local _ = nil
		local _ = nil
		local var1835, var1836, var1837 = protoModule.readTag(p68, var1834)
		local var1838 = var1835
		local var1839 = var1836
		var1834 = var1837
		
		if var1839 == protoModule.wireTypes.varint then
			if var1838 == 1 then
				local _ = nil
				local var1840, var1841 = protoModule.readVarIntI64(p68, var1834)
				var1834 = var1841
				var1833.user_id = var1840
			else
				local _ = nil
				local var1842, var1843 = protoModule.readVarInt(p68, var1834)
				local _ = var1842
				var1834 = var1843
			end
		elseif var1839 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1844, var1845 = protoModule.readVarInt(p68, var1834)
			var1834 = var1845 + var1844
		elseif var1839 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1846, var1847 = protoModule.readFixed32(p68, var1834)
			local _ = var1846
			var1834 = var1847
		elseif var1839 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1848, var1849 = protoModule.readFixed64(p68, var1834)
			local _ = var1848
			var1834 = var1849
		else
			error("Unsupported wire type: " .. var2832)
		end
	end
	return var1833
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
	local var1850 = t_68.new()
	
	if self.user_id ~= nil then
		var1850.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1850.user_id = self.userId
	end
	return var1850
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
	local var1850 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1851, var1852 = protoModule.writeTag(buff, var1850, 1, protoModule.wireTypes.lengthDelimited)
		var1851, var2848 = protoModule.writeString(var1851, var1852, self.event_id)
		buff = var1851
		var1850 = var1852
	end
	local buff_1 = buffer.create(var1850)
	buffer.copy(buff_1, 0, buff, 0, var1850)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1850 = t_69.new()
	local var1851 = 0
	while var1851 < buffer.len(p69) do
		local _ = nil
		local var1852 = nil
		local var1853, var1854, var1855 = protoModule.readTag(p69, var1851)
		local var1856 = var1853
		var1852 = var1854
		var1851 = var1855
		
		if var1852 == protoModule.wireTypes.varint then
			local _ = nil
			local var1857, var1858 = protoModule.readVarInt(p69, var1851)
			local _ = var1857
			var1851 = var1858
			continue
		end
		if var1852 == protoModule.wireTypes.lengthDelimited then
			if var1856 == 1 then
				local _ = nil
				local var1859, var1860 = protoModule.readBuffer(p69, var1851)
				var1851 = var1860
				var1850.event_id = buffer.tostring(var1859)
			else
				local _ = nil
				local var1861, var1862 = protoModule.readVarInt(p69, var1851)
				var1851 = var1862 + var1861
			end
		elseif var1852 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1863, var1864 = protoModule.readFixed32(p69, var1851)
			local _ = var1863
			var1851 = var1864
		elseif var1852 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1865, var1866 = protoModule.readFixed64(p69, var1851)
			local _ = var1865
			var1851 = var1866
		else
			error("Unsupported wire type: " .. var2852)
		end
	end
	return var1850
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
	local var1867 = t_69.new()
	
	if self.event_id ~= nil then
		var1867.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1867.event_id = self.eventId
	end
	return var1867
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
	local var1867 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1868, var1869 = protoModule.writeTag(buff, var1867, 1, protoModule.wireTypes.lengthDelimited)
		var1868, var2872 = protoModule.writeString(var1868, var1869, self.event_id)
		buff = var1868
		var1867 = var1869
	end
	local buff_1 = buffer.create(var1867)
	buffer.copy(buff_1, 0, buff, 0, var1867)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var1867 = t_70.new()
	local var1868 = 0
	while var1868 < buffer.len(p70) do
		local _ = nil
		local var1869 = nil
		local var1870, var1871, var1872 = protoModule.readTag(p70, var1868)
		local var1873 = var1870
		var1869 = var1871
		var1868 = var1872
		
		if var1869 == protoModule.wireTypes.varint then
			local _ = nil
			local var1874, var1875 = protoModule.readVarInt(p70, var1868)
			local _ = var1874
			var1868 = var1875
			continue
		end
		if var1869 == protoModule.wireTypes.lengthDelimited then
			if var1873 == 1 then
				local _ = nil
				local var1876, var1877 = protoModule.readBuffer(p70, var1868)
				var1868 = var1877
				var1867.event_id = buffer.tostring(var1876)
			else
				local _ = nil
				local var1878, var1879 = protoModule.readVarInt(p70, var1868)
				var1868 = var1879 + var1878
			end
		elseif var1869 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1880, var1881 = protoModule.readFixed32(p70, var1868)
			local _ = var1880
			var1868 = var1881
		elseif var1869 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1882, var1883 = protoModule.readFixed64(p70, var1868)
			local _ = var1882
			var1868 = var1883
		else
			error("Unsupported wire type: " .. var2876)
		end
	end
	return var1867
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
	local var1884 = t_70.new()
	
	if self.event_id ~= nil then
		var1884.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1884.event_id = self.eventId
	end
	return var1884
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
	local var1884 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1885, var1886 = protoModule.writeTag(buff, var1884, 1, protoModule.wireTypes.lengthDelimited)
		var1885, var2896 = protoModule.writeString(var1885, var1886, self.event_id)
		buff = var1885
		var1884 = var1886
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1887, var1888 = protoModule.writeTag(buff, var1884, 2, protoModule.wireTypes.lengthDelimited)
		var1887, var2898 = protoModule.writeString(var1887, var1888, self.universe_id)
		buff = var1887
		var1884 = var1888
	end
	local buff_1 = buffer.create(var1884)
	buffer.copy(buff_1, 0, buff, 0, var1884)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var1884 = t_71.new()
	local var1885 = 0
	while var1885 < buffer.len(p71) do
		local _ = nil
		local var1886 = nil
		local var1887, var1888, var1889 = protoModule.readTag(p71, var1885)
		local var1890 = var1887
		var1886 = var1888
		var1885 = var1889
		
		if var1886 == protoModule.wireTypes.varint then
			local _ = nil
			local var1891, var1892 = protoModule.readVarInt(p71, var1885)
			local _ = var1891
			var1885 = var1892
			continue
		end
		if var1886 == protoModule.wireTypes.lengthDelimited then
			if var1890 == 1 then
				local _ = nil
				local var1893, var1894 = protoModule.readBuffer(p71, var1885)
				var1885 = var1894
				var1884.event_id = buffer.tostring(var1893)
			elseif var1890 == 2 then
				local _ = nil
				local var1895, var1896 = protoModule.readBuffer(p71, var1885)
				var1885 = var1896
				var1884.universe_id = buffer.tostring(var1895)
			else
				local _ = nil
				local var1897, var1898 = protoModule.readVarInt(p71, var1885)
				var1885 = var1898 + var1897
			end
		elseif var1886 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1899, var1900 = protoModule.readFixed32(p71, var1885)
			local _ = var1899
			var1885 = var1900
		elseif var1886 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1901, var1902 = protoModule.readFixed64(p71, var1885)
			local _ = var1901
			var1885 = var1902
		else
			error("Unsupported wire type: " .. var2902)
		end
	end
	return var1884
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
	local var1903 = t_71.new()
	
	if self.event_id ~= nil then
		var1903.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1903.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1903.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1903.universe_id = self.universeId
	end
	return var1903
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
	local var1903 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1904, var1905 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1904, var2924 = protoModule.writeString(var1904, var1905, i)
			local var1906 = v:encode()
			var1905, var2926 = protoModule.writeTag(var1904, var1905, 2, protoModule.wireTypes.lengthDelimited)
			var1905, var2926 = protoModule.writeBuffer(var1905, var2926, var1906, buffer.len(var1906))
			local var1907 = var1905
			local var1908 = var2926
			local var1909, var1910 = protoModule.writeTag(buff, var1903, 1, protoModule.wireTypes.lengthDelimited)
			var1909, var2930 = protoModule.writeBuffer(var1909, var1910, var1907, var1908)
			buff = var1909
			var1903 = var1910
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1911, var1912 = protoModule.writeTag(buff, var1903, 2, protoModule.wireTypes.lengthDelimited)
			var1911, var2932 = protoModule.writeString(var1911, var1912, v)
			buff = var1911
			var1903 = var1912
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1913, var1914 = protoModule.writeTag(buff, var1903, 3, protoModule.wireTypes.lengthDelimited)
		var1913, var2934 = protoModule.writeString(var1913, var1914, self.next_page_token)
		buff = var1913
		var1903 = var1914
	end
	if self.sticky_filter_pills ~= nil then
		local var1915 = self.sticky_filter_pills:encode()
		local var1916, var1917 = protoModule.writeTag(buff, var1903, 4, protoModule.wireTypes.lengthDelimited)
		var1916, var2937 = protoModule.writeBuffer(var1916, var1917, var1915, buffer.len(var1915))
		buff = var1916
		var1903 = var1917
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var1918, var1919 = protoModule.writeTag(buff, var1903, 5, protoModule.wireTypes.lengthDelimited)
		var1918, var2939 = protoModule.writeString(var1918, var1919, self.applied_filters)
		buff = var1918
		var1903 = var1919
	end
	local buff_1 = buffer.create(var1903)
	buffer.copy(buff_1, 0, buff, 0, var1903)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var1920 = t_72.new()
	local var1921 = 0
	while var1921 < buffer.len(p72) do
		local _ = nil
		local var1922 = nil
		local var1923, var1924, var1925 = protoModule.readTag(p72, var1921)
		local var1926 = var1923
		var1922 = var1924
		var1921 = var1925
		
		if var1922 == protoModule.wireTypes.varint then
			local _ = nil
			local var1927, var1928 = protoModule.readVarInt(p72, var1921)
			local _ = var1927
			var1921 = var1928
			continue
		end
		if var1922 == protoModule.wireTypes.lengthDelimited then
			if var1926 == 1 then
				local _ = nil
				local var1929, var1930 = protoModule.readBuffer(p72, var1921)
				var1921 = var1930
				var1929 = t.ChartsFeedInputData_EntryMapEntry.decode(var1929)
				var1920.entry_map[var1929.key or ""] = var1929.value or t.FeedEntry.new()
			elseif var1926 == 2 then
				local _ = nil
				local var1931, var1932 = protoModule.readBuffer(p72, var1921)
				var1921 = var1932
				table.insert(var1920.entry_order, buffer.tostring(var1931))
			elseif var1926 == 3 then
				local _ = nil
				local var1933, var1934 = protoModule.readBuffer(p72, var1921)
				var1921 = var1934
				var1920.next_page_token = buffer.tostring(var1933)
			elseif var1926 == 4 then
				local _ = nil
				local var1935, var1936 = protoModule.readBuffer(p72, var1921)
				var1921 = var1936
				var1920.sticky_filter_pills = t.FilterPillsInputData.decode(var1935)
			elseif var1926 == 5 then
				local _ = nil
				local var1937, var1938 = protoModule.readBuffer(p72, var1921)
				var1921 = var1938
				var1920.applied_filters = buffer.tostring(var1937)
			else
				local _ = nil
				local var1939, var1940 = protoModule.readVarInt(p72, var1921)
				var1921 = var1940 + var1939
			end
		elseif var1922 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1941, var1942 = protoModule.readFixed32(p72, var1921)
			local _ = var1941
			var1921 = var1942
		elseif var1922 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1943, var1944 = protoModule.readFixed64(p72, var1921)
			local _ = var1943
			var1921 = var1944
		else
			error("Unsupported wire type: " .. var2943)
		end
	end
	return var1920
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
	local var1945 = t_72.new()
	
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
	if self.next_page_token ~= nil then
		var1945.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1945.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var1945.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var1945.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var1945.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1945.applied_filters = self.appliedFilters
	end
	return var1945
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
	local var1946 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1947, var1948 = protoModule.writeTag(buff, var1946, 1, protoModule.wireTypes.lengthDelimited)
		var1947, var2977 = protoModule.writeString(var1947, var1948, self.key)
		buff = var1947
		var1946 = var1948
	end
	if self.value ~= nil then
		local var1949 = self.value:encode()
		local var1950, var1951 = protoModule.writeTag(buff, var1946, 2, protoModule.wireTypes.lengthDelimited)
		var1950, var2980 = protoModule.writeBuffer(var1950, var1951, var1949, buffer.len(var1949))
		buff = var1950
		var1946 = var1951
	end
	local buff_1 = buffer.create(var1946)
	buffer.copy(buff_1, 0, buff, 0, var1946)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var1946 = t_73.new()
	local var1947 = 0
	while var1947 < buffer.len(p73) do
		local _ = nil
		local var1948 = nil
		local var1949, var1950, var1951 = protoModule.readTag(p73, var1947)
		local var1952 = var1949
		var1948 = var1950
		var1947 = var1951
		
		if var1948 == protoModule.wireTypes.varint then
			local _ = nil
			local var1953, var1954 = protoModule.readVarInt(p73, var1947)
			local _ = var1953
			var1947 = var1954
			continue
		end
		if var1948 == protoModule.wireTypes.lengthDelimited then
			if var1952 == 1 then
				local _ = nil
				local var1955, var1956 = protoModule.readBuffer(p73, var1947)
				var1947 = var1956
				var1946.key = buffer.tostring(var1955)
			elseif var1952 == 2 then
				local _ = nil
				local var1957, var1958 = protoModule.readBuffer(p73, var1947)
				var1947 = var1958
				var1946.value = t.FeedEntry.decode(var1957)
			else
				local _ = nil
				local var1959, var1960 = protoModule.readVarInt(p73, var1947)
				var1947 = var1960 + var1959
			end
		elseif var1948 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1961, var1962 = protoModule.readFixed32(p73, var1947)
			local _ = var1961
			var1947 = var1962
		elseif var1948 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1963, var1964 = protoModule.readFixed64(p73, var1947)
			local _ = var1963
			var1947 = var1964
		else
			error("Unsupported wire type: " .. var2984)
		end
	end
	return var1946
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
	local var1965 = t_73.new()
	
	if self.key ~= nil then
		var1965.key = self.key
	end
	if self.value ~= nil then
		var1965.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1965
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
	local var1965 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var1966 = v:encode()
			local var1967, var1968 = protoModule.writeTag(buff, var1965, 1, protoModule.wireTypes.lengthDelimited)
			var1967, var3007 = protoModule.writeBuffer(var1967, var1968, var1966, buffer.len(var1966))
			buff = var1967
			var1965 = var1968
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1969, var1970 = protoModule.writeTag(buff, var1965, 2, protoModule.wireTypes.lengthDelimited)
		var1969, var3009 = protoModule.writeString(var1969, var1970, self.sort_id)
		buff = var1969
		var1965 = var1970
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1971, var1972 = protoModule.writeTag(buff, var1965, 3, protoModule.wireTypes.varint)
		var1971, var3011 = protoModule.writeVarInt(var1971, var1972, self.secondary_sort_id)
		buff = var1971
		var1965 = var1972
	end
	if self.title ~= nil and self.title ~= "" then
		local var1973, var1974 = protoModule.writeTag(buff, var1965, 4, protoModule.wireTypes.lengthDelimited)
		var1973, var3013 = protoModule.writeString(var1973, var1974, self.title)
		buff = var1973
		var1965 = var1974
	end
	if self.primary_sort_id ~= nil then
		local var1975, var1976 = protoModule.writeTag(buff, var1965, 5, protoModule.wireTypes.varint)
		var1975, var3015 = protoModule.writeVarInt(var1975, var1976, self.primary_sort_id)
		buff = var1975
		var1965 = var1976
	end
	if self.applied_filters ~= nil then
		local var1977, var1978 = protoModule.writeTag(buff, var1965, 6, protoModule.wireTypes.lengthDelimited)
		var1977, var3017 = protoModule.writeString(var1977, var1978, self.applied_filters)
		buff = var1977
		var1965 = var1978
	end
	local buff_1 = buffer.create(var1965)
	buffer.copy(buff_1, 0, buff, 0, var1965)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var1979 = t_74.new()
	local var1980 = 0
	while var1980 < buffer.len(p74) do
		local _ = nil
		local var1981 = nil
		local var1982, var1983, var1984 = protoModule.readTag(p74, var1980)
		local var1985 = var1982
		var1981 = var1983
		var1980 = var1984
		
		if var1981 == protoModule.wireTypes.varint then
			if var1985 == 3 then
				local _ = nil
				local var1986, var1987 = protoModule.readVarIntI32(p74, var1980)
				var1980 = var1987
				var1979.secondary_sort_id = var1986
			elseif var1985 == 5 then
				local _ = nil
				local var1988, var1989 = protoModule.readVarIntI32(p74, var1980)
				var1980 = var1989
				var1979.primary_sort_id = var1988
			else
				local _ = nil
				local var1990, var1991 = protoModule.readVarInt(p74, var1980)
				local _ = var1990
				var1980 = var1991
			end
		end
		if var1981 == protoModule.wireTypes.lengthDelimited then
			if var1985 == 1 then
				local _ = nil
				local var1992, var1993 = protoModule.readBuffer(p74, var1980)
				var1980 = var1993
				table.insert(var1979.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var1992))
			elseif var1985 == 2 then
				local _ = nil
				local var1994, var1995 = protoModule.readBuffer(p74, var1980)
				var1980 = var1995
				var1979.sort_id = buffer.tostring(var1994)
			elseif var1985 == 4 then
				local _ = nil
				local var1996, var1997 = protoModule.readBuffer(p74, var1980)
				var1980 = var1997
				var1979.title = buffer.tostring(var1996)
			elseif var1985 == 6 then
				local _ = nil
				local var1998, var1999 = protoModule.readBuffer(p74, var1980)
				var1980 = var1999
				var1979.applied_filters = buffer.tostring(var1998)
			else
				local _ = nil
				local var2000, var2001 = protoModule.readVarInt(p74, var1980)
				var1980 = var2001 + var2000
			end
		elseif var1981 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2002, var2003 = protoModule.readFixed32(p74, var1980)
			local _ = var2002
			var1980 = var2003
		elseif var1981 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2004, var2005 = protoModule.readFixed64(p74, var1980)
			local _ = var2004
			var1980 = var2005
		else
			error("Unsupported wire type: " .. var3021)
		end
	end
	return var1979
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
	local var2006 = t_74.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2006.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2006.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2006.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2006.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2006.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2006.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2006.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2006.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2006.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2006.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2006.applied_filters = self.appliedFilters
	end
	return var2006
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
	local var2007 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2008, var2009 = protoModule.writeTag(buff, var2007, 1, protoModule.wireTypes.lengthDelimited)
		var2008, var3054 = protoModule.writeString(var2008, var2009, self.filter_id)
		buff = var2008
		var2007 = var2009
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2010, var2011 = protoModule.writeTag(buff, var2007, 2, protoModule.wireTypes.lengthDelimited)
		var2010, var3056 = protoModule.writeString(var2010, var2011, self.display_name)
		buff = var2010
		var2007 = var2011
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2012 = v:encode()
			local var2013, var2014 = protoModule.writeTag(buff, var2007, 3, protoModule.wireTypes.lengthDelimited)
			var2013, var3059 = protoModule.writeBuffer(var2013, var2014, var2012, buffer.len(var2012))
			buff = var2013
			var2007 = var2014
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2015, var2016 = protoModule.writeTag(buff, var2007, 4, protoModule.wireTypes.lengthDelimited)
		var2015, var3061 = protoModule.writeString(var2015, var2016, self.default_option_id)
		buff = var2015
		var2007 = var2016
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2017, var2018 = protoModule.writeTag(buff, var2007, 5, protoModule.wireTypes.lengthDelimited)
		var2017, var3063 = protoModule.writeString(var2017, var2018, self.selected_option_id)
		buff = var2017
		var2007 = var2018
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2019, var2020 = protoModule.writeTag(buff, var2007, 6, protoModule.wireTypes.lengthDelimited)
		var2019, var3065 = protoModule.writeString(var2019, var2020, self.filter_type)
		buff = var2019
		var2007 = var2020
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2021, var2022 = protoModule.writeTag(buff, var2007, 7, protoModule.wireTypes.lengthDelimited)
			var2021, var3067 = protoModule.writeString(var2021, var2022, v)
			buff = var2021
			var2007 = var2022
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2023, var2024 = protoModule.writeTag(buff, var2007, 8, protoModule.wireTypes.lengthDelimited)
		var2023, var3069 = protoModule.writeString(var2023, var2024, self.info_text)
		buff = var2023
		var2007 = var2024
	end
	local buff_1 = buffer.create(var2007)
	buffer.copy(buff_1, 0, buff, 0, var2007)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2025 = t_75.new()
	local var2026 = 0
	while var2026 < buffer.len(p75) do
		local _ = nil
		local var2027 = nil
		local var2028, var2029, var2030 = protoModule.readTag(p75, var2026)
		local var2031 = var2028
		var2027 = var2029
		var2026 = var2030
		
		if var2027 == protoModule.wireTypes.varint then
			local _ = nil
			local var2032, var2033 = protoModule.readVarInt(p75, var2026)
			local _ = var2032
			var2026 = var2033
			continue
		end
		if var2027 == protoModule.wireTypes.lengthDelimited then
			if var2031 == 1 then
				local _ = nil
				local var2034, var2035 = protoModule.readBuffer(p75, var2026)
				var2026 = var2035
				var2025.filter_id = buffer.tostring(var2034)
			elseif var2031 == 2 then
				local _ = nil
				local var2036, var2037 = protoModule.readBuffer(p75, var2026)
				var2026 = var2037
				var2025.display_name = buffer.tostring(var2036)
			elseif var2031 == 3 then
				local _ = nil
				local var2038, var2039 = protoModule.readBuffer(p75, var2026)
				var2026 = var2039
				table.insert(var2025.options, t.FilterPillsInputData_FilterOption.decode(var2038))
			elseif var2031 == 4 then
				local _ = nil
				local var2040, var2041 = protoModule.readBuffer(p75, var2026)
				var2026 = var2041
				var2025.default_option_id = buffer.tostring(var2040)
			elseif var2031 == 5 then
				local _ = nil
				local var2042, var2043 = protoModule.readBuffer(p75, var2026)
				var2026 = var2043
				var2025.selected_option_id = buffer.tostring(var2042)
			elseif var2031 == 6 then
				local _ = nil
				local var2044, var2045 = protoModule.readBuffer(p75, var2026)
				var2026 = var2045
				var2025.filter_type = buffer.tostring(var2044)
			elseif var2031 == 7 then
				local _ = nil
				local var2046, var2047 = protoModule.readBuffer(p75, var2026)
				var2026 = var2047
				table.insert(var2025.inactive_option_ids, buffer.tostring(var2046))
			elseif var2031 == 8 then
				local _ = nil
				local var2048, var2049 = protoModule.readBuffer(p75, var2026)
				var2026 = var2049
				var2025.info_text = buffer.tostring(var2048)
			else
				local _ = nil
				local var2050, var2051 = protoModule.readVarInt(p75, var2026)
				var2026 = var2051 + var2050
			end
		elseif var2027 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2052, var2053 = protoModule.readFixed32(p75, var2026)
			local _ = var2052
			var2026 = var2053
		elseif var2027 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2054, var2055 = protoModule.readFixed64(p75, var2026)
			local _ = var2054
			var2026 = var2055
		else
			error("Unsupported wire type: " .. var3073)
		end
	end
	return var2025
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
	local var2056 = t_75.new()
	
	if self.filter_id ~= nil then
		var2056.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2056.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2056.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2056.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2056.options = t_1
	end
	if self.default_option_id ~= nil then
		var2056.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2056.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2056.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2056.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2056.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2056.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2056.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2056.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2056.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2056.info_text = self.infoText
	end
	return var2056
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
	local var2057 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2058, var2059 = protoModule.writeTag(buff, var2057, 1, protoModule.wireTypes.lengthDelimited)
		var2058, var3112 = protoModule.writeString(var2058, var2059, self.option_id)
		buff = var2058
		var2057 = var2059
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2060, var2061 = protoModule.writeTag(buff, var2057, 2, protoModule.wireTypes.lengthDelimited)
		var2060, var3114 = protoModule.writeString(var2060, var2061, self.display_name)
		buff = var2060
		var2057 = var2061
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2062, var2063 = protoModule.writeTag(buff, var2057, 3, protoModule.wireTypes.lengthDelimited)
		var2062, var3116 = protoModule.writeString(var2062, var2063, self.option_context_tag)
		buff = var2062
		var2057 = var2063
	end
	local buff_1 = buffer.create(var2057)
	buffer.copy(buff_1, 0, buff, 0, var2057)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref)
	local var2057 = t_76.new()
	local var2058 = 0
	while var2058 < buffer.len(p76) do
		local _ = nil
		local var2059 = nil
		local var2060, var2061, var2062 = protoModule.readTag(p76, var2058)
		local var2063 = var2060
		var2059 = var2061
		var2058 = var2062
		
		if var2059 == protoModule.wireTypes.varint then
			local _ = nil
			local var2064, var2065 = protoModule.readVarInt(p76, var2058)
			local _ = var2064
			var2058 = var2065
			continue
		end
		if var2059 == protoModule.wireTypes.lengthDelimited then
			if var2063 == 1 then
				local _ = nil
				local var2066, var2067 = protoModule.readBuffer(p76, var2058)
				var2058 = var2067
				var2057.option_id = buffer.tostring(var2066)
			elseif var2063 == 2 then
				local _ = nil
				local var2068, var2069 = protoModule.readBuffer(p76, var2058)
				var2058 = var2069
				var2057.display_name = buffer.tostring(var2068)
			elseif var2063 == 3 then
				local _ = nil
				local var2070, var2071 = protoModule.readBuffer(p76, var2058)
				var2058 = var2071
				var2057.option_context_tag = buffer.tostring(var2070)
			else
				local _ = nil
				local var2072, var2073 = protoModule.readVarInt(p76, var2058)
				var2058 = var2073 + var2072
			end
		elseif var2059 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2074, var2075 = protoModule.readFixed32(p76, var2058)
			local _ = var2074
			var2058 = var2075
		elseif var2059 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2076, var2077 = protoModule.readFixed64(p76, var2058)
			local _ = var2076
			var2058 = var2077
		else
			error("Unsupported wire type: " .. var3120)
		end
	end
	return var2057
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
	local var2078 = t_76.new()
	
	if self.option_id ~= nil then
		var2078.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2078.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2078.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2078.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2078.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2078.option_context_tag = self.optionContextTag
	end
	return var2078
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
	local var2078 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2079 = v:encode()
			local var2080, var2081 = protoModule.writeTag(buff, var2078, 1, protoModule.wireTypes.lengthDelimited)
			var2080, var3145 = protoModule.writeBuffer(var2080, var2081, var2079, buffer.len(var2079))
			buff = var2080
			var2078 = var2081
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2082, var2083 = protoModule.writeTag(buff, var2078, 2, protoModule.wireTypes.lengthDelimited)
		var2082, var3147 = protoModule.writeString(var2082, var2083, self.selected_sort_id)
		buff = var2082
		var2078 = var2083
	end
	local buff_1 = buffer.create(var2078)
	buffer.copy(buff_1, 0, buff, 0, var2078)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2084 = t_77.new()
	local var2085 = 0
	while var2085 < buffer.len(p77) do
		local _ = nil
		local var2086 = nil
		local var2087, var2088, var2089 = protoModule.readTag(p77, var2085)
		local var2090 = var2087
		var2086 = var2088
		var2085 = var2089
		
		if var2086 == protoModule.wireTypes.varint then
			local _ = nil
			local var2091, var2092 = protoModule.readVarInt(p77, var2085)
			local _ = var2091
			var2085 = var2092
			continue
		end
		if var2086 == protoModule.wireTypes.lengthDelimited then
			if var2090 == 1 then
				local _ = nil
				local var2093, var2094 = protoModule.readBuffer(p77, var2085)
				var2085 = var2094
				table.insert(var2084.sort_options, t.SortSelectorInputData_SortOption.decode(var2093))
			elseif var2090 == 2 then
				local _ = nil
				local var2095, var2096 = protoModule.readBuffer(p77, var2085)
				var2085 = var2096
				var2084.selected_sort_id = buffer.tostring(var2095)
			else
				local _ = nil
				local var2097, var2098 = protoModule.readVarInt(p77, var2085)
				var2085 = var2098 + var2097
			end
		elseif var2086 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2099, var2100 = protoModule.readFixed32(p77, var2085)
			local _ = var2099
			var2085 = var2100
		elseif var2086 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2101, var2102 = protoModule.readFixed64(p77, var2085)
			local _ = var2101
			var2085 = var2102
		else
			error("Unsupported wire type: " .. var3151)
		end
	end
	return var2084
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
	local var2103 = t_77.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2103.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2103.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2103.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2103.selected_sort_id = self.selectedSortId
	end
	return var2103
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
	local var2104 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2105, var2106 = protoModule.writeTag(buff, var2104, 1, protoModule.wireTypes.lengthDelimited)
		var2105, var3176 = protoModule.writeString(var2105, var2106, self.sort_id)
		buff = var2105
		var2104 = var2106
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2107, var2108 = protoModule.writeTag(buff, var2104, 2, protoModule.wireTypes.lengthDelimited)
		var2107, var3178 = protoModule.writeString(var2107, var2108, self.display_name)
		buff = var2107
		var2104 = var2108
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2109, var2110 = protoModule.writeTag(buff, var2104, 3, protoModule.wireTypes.lengthDelimited)
		var2109, var3180 = protoModule.writeString(var2109, var2110, self.content_type)
		buff = var2109
		var2104 = var2110
	end
	local buff_1 = buffer.create(var2104)
	buffer.copy(buff_1, 0, buff, 0, var2104)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var2104 = t_78.new()
	local var2105 = 0
	while var2105 < buffer.len(p78) do
		local _ = nil
		local var2106 = nil
		local var2107, var2108, var2109 = protoModule.readTag(p78, var2105)
		local var2110 = var2107
		var2106 = var2108
		var2105 = var2109
		
		if var2106 == protoModule.wireTypes.varint then
			local _ = nil
			local var2111, var2112 = protoModule.readVarInt(p78, var2105)
			local _ = var2111
			var2105 = var2112
			continue
		end
		if var2106 == protoModule.wireTypes.lengthDelimited then
			if var2110 == 1 then
				local _ = nil
				local var2113, var2114 = protoModule.readBuffer(p78, var2105)
				var2105 = var2114
				var2104.sort_id = buffer.tostring(var2113)
			elseif var2110 == 2 then
				local _ = nil
				local var2115, var2116 = protoModule.readBuffer(p78, var2105)
				var2105 = var2116
				var2104.display_name = buffer.tostring(var2115)
			elseif var2110 == 3 then
				local _ = nil
				local var2117, var2118 = protoModule.readBuffer(p78, var2105)
				var2105 = var2118
				var2104.content_type = buffer.tostring(var2117)
			else
				local _ = nil
				local var2119, var2120 = protoModule.readVarInt(p78, var2105)
				var2105 = var2120 + var2119
			end
		elseif var2106 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2121, var2122 = protoModule.readFixed32(p78, var2105)
			local _ = var2121
			var2105 = var2122
		elseif var2106 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2123, var2124 = protoModule.readFixed64(p78, var2105)
			local _ = var2123
			var2105 = var2124
		else
			error("Unsupported wire type: " .. var3184)
		end
	end
	return var2104
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
	local var2125 = t_78.new()
	
	if self.sort_id ~= nil then
		var2125.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2125.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2125.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2125.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2125.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2125.content_type = self.contentType
	end
	return var2125
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
	local var2125 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2126, var2127 = protoModule.writeTag(buff, var2125, 1, protoModule.wireTypes.lengthDelimited)
		var2126, var3208 = protoModule.writeString(var2126, var2127, self.selected_option)
		buff = var2126
		var2125 = var2127
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2128 = v:encode()
			local var2129, var2130 = protoModule.writeTag(buff, var2125, 2, protoModule.wireTypes.lengthDelimited)
			var2129, var3211 = protoModule.writeBuffer(var2129, var2130, var2128, buffer.len(var2128))
			buff = var2129
			var2125 = var2130
		end
	end
	if self.experience_carousel ~= nil then
		local var2131 = self.experience_carousel:encode()
		local var2132, var2133 = protoModule.writeTag(buff, var2125, 3, protoModule.wireTypes.lengthDelimited)
		var2132, var3214 = protoModule.writeBuffer(var2132, var2133, var2131, buffer.len(var2131))
		buff = var2132
		var2125 = var2133
	end
	local buff_1 = buffer.create(var2125)
	buffer.copy(buff_1, 0, buff, 0, var2125)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2134 = t_79.new()
	local var2135 = 0
	while var2135 < buffer.len(p79) do
		local _ = nil
		local var2136 = nil
		local var2137, var2138, var2139 = protoModule.readTag(p79, var2135)
		local var2140 = var2137
		var2136 = var2138
		var2135 = var2139
		
		if var2136 == protoModule.wireTypes.varint then
			local _ = nil
			local var2141, var2142 = protoModule.readVarInt(p79, var2135)
			local _ = var2141
			var2135 = var2142
			continue
		end
		if var2136 == protoModule.wireTypes.lengthDelimited then
			if var2140 == 1 then
				local _ = nil
				local var2143, var2144 = protoModule.readBuffer(p79, var2135)
				var2135 = var2144
				var2134.selected_option = buffer.tostring(var2143)
			elseif var2140 == 2 then
				local _ = nil
				local var2145, var2146 = protoModule.readBuffer(p79, var2135)
				var2135 = var2146
				table.insert(var2134.options, t.SelectorOption.decode(var2145))
			elseif var2140 == 3 then
				local _ = nil
				local var2147, var2148 = protoModule.readBuffer(p79, var2135)
				var2135 = var2148
				var2134.experience_carousel = t.ExperienceCarouselInputData.decode(var2147)
			else
				local _ = nil
				local var2149, var2150 = protoModule.readVarInt(p79, var2135)
				var2135 = var2150 + var2149
			end
		elseif var2136 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2151, var2152 = protoModule.readFixed32(p79, var2135)
			local _ = var2151
			var2135 = var2152
		elseif var2136 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2153, var2154 = protoModule.readFixed64(p79, var2135)
			local _ = var2153
			var2135 = var2154
		else
			error("Unsupported wire type: " .. var3218)
		end
	end
	return var2134
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
	local var2155 = t_79.new()
	
	if self.selected_option ~= nil then
		var2155.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2155.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2155.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2155.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2155.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2155
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
	local var2156 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2157, var2158 = protoModule.writeTag(buff, var2156, 1, protoModule.wireTypes.lengthDelimited)
		var2157, var3244 = protoModule.writeString(var2157, var2158, self.id)
		buff = var2157
		var2156 = var2158
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2159, var2160 = protoModule.writeTag(buff, var2156, 4, protoModule.wireTypes.varint)
		var2159, var3246 = protoModule.writeVarInt(var2159, var2160, self.preview_rows)
		buff = var2159
		var2156 = var2160
	end
	if self.widget_style ~= nil then
		local var2161 = self.widget_style:encode()
		local var2162, var2163 = protoModule.writeTag(buff, var2156, 3, protoModule.wireTypes.lengthDelimited)
		var2162, var3249 = protoModule.writeBuffer(var2162, var2163, var2161, buffer.len(var2161))
		buff = var2162
		var2156 = var2163
	end
	if self.see_all_button then
		local var2164, var2165 = protoModule.writeTag(buff, var2156, 5, protoModule.wireTypes.varint)
		var2164, var3251 = protoModule.writeVarInt(var2164, var2165, if self.see_all_button then 1 else 0)
		buff = var2164
		var2156 = var2165
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2166, var2167 = protoModule.writeTag(buff, var2156, 6, protoModule.wireTypes.lengthDelimited)
		var2166, var3253 = protoModule.writeString(var2166, var2167, self.information_popover_text)
		buff = var2166
		var2156 = var2167
	end
	local buff_1 = buffer.create(var2156)
	buffer.copy(buff_1, 0, buff, 0, var2156)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2156 = t_80.new()
	local var2157 = 0
	while var2157 < buffer.len(p80) do
		local _ = nil
		local var2158 = nil
		local var2159, var2160, var2161 = protoModule.readTag(p80, var2157)
		local var2162 = var2159
		var2158 = var2160
		var2157 = var2161
		
		if var2158 == protoModule.wireTypes.varint then
			if var2162 == 4 then
				local _ = nil
				local var2163, var2164 = protoModule.readVarIntI64(p80, var2157)
				var2157 = var2164
				var2156.preview_rows = var2163
			elseif var2162 == 5 then
				local _ = nil
				local var2165, var2166 = protoModule.readVarInt(p80, var2157)
				var2157 = var2166
				var2156.see_all_button = var2165 ~= 0
			else
				local _ = nil
				local var2167, var2168 = protoModule.readVarInt(p80, var2157)
				local _ = var2167
				var2157 = var2168
			end
		end
		if var2158 == protoModule.wireTypes.lengthDelimited then
			if var2162 == 1 then
				local _ = nil
				local var2169, var2170 = protoModule.readBuffer(p80, var2157)
				var2157 = var2170
				var2156.id = buffer.tostring(var2169)
			elseif var2162 == 3 then
				local _ = nil
				local var2171, var2172 = protoModule.readBuffer(p80, var2157)
				var2157 = var2172
				var2156.widget_style = t.WidgetStyleData.decode(var2171)
			elseif var2162 == 6 then
				local _ = nil
				local var2173, var2174 = protoModule.readBuffer(p80, var2157)
				var2157 = var2174
				var2156.information_popover_text = buffer.tostring(var2173)
			else
				local _ = nil
				local var2175, var2176 = protoModule.readVarInt(p80, var2157)
				var2157 = var2176 + var2175
			end
		elseif var2158 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2177, var2178 = protoModule.readFixed32(p80, var2157)
			local _ = var2177
			var2157 = var2178
		elseif var2158 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2179, var2180 = protoModule.readFixed64(p80, var2157)
			local _ = var2179
			var2157 = var2180
		else
			error("Unsupported wire type: " .. var3257)
		end
	end
	return var2156
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
	local var2181 = t_80.new()
	
	if self.id ~= nil then
		var2181.id = self.id
	end
	if self.preview_rows ~= nil then
		var2181.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2181.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2181.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2181.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2181.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2181.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2181.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2181.information_popover_text = self.informationPopoverText
	end
	return var2181
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
	local var2181 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2182, var2183 = protoModule.writeTag(buff, var2181, 1, protoModule.wireTypes.lengthDelimited)
		var2182, var3285 = protoModule.writeString(var2182, var2183, self.id)
		buff = var2182
		var2181 = var2183
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2184, var2185 = protoModule.writeTag(buff, var2181, 5, protoModule.wireTypes.varint)
		var2184, var3287 = protoModule.writeVarInt(var2184, var2185, self.num_items_to_show)
		buff = var2184
		var2181 = var2185
	end
	if self.widget_style ~= nil then
		local var2186 = self.widget_style:encode()
		local var2187, var2188 = protoModule.writeTag(buff, var2181, 3, protoModule.wireTypes.lengthDelimited)
		var2187, var3290 = protoModule.writeBuffer(var2187, var2188, var2186, buffer.len(var2186))
		buff = var2187
		var2181 = var2188
	end
	if self.see_all_button then
		local var2189, var2190 = protoModule.writeTag(buff, var2181, 6, protoModule.wireTypes.varint)
		var2189, var3292 = protoModule.writeVarInt(var2189, var2190, if self.see_all_button then 1 else 0)
		buff = var2189
		var2181 = var2190
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2191, var2192 = protoModule.writeTag(buff, var2181, 7, protoModule.wireTypes.lengthDelimited)
		var2191, var3294 = protoModule.writeString(var2191, var2192, self.information_popover_text)
		buff = var2191
		var2181 = var2192
	end
	local buff_1 = buffer.create(var2181)
	buffer.copy(buff_1, 0, buff, 0, var2181)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2181 = t_81.new()
	local var2182 = 0
	while var2182 < buffer.len(p81) do
		local _ = nil
		local var2183 = nil
		local var2184, var2185, var2186 = protoModule.readTag(p81, var2182)
		local var2187 = var2184
		var2183 = var2185
		var2182 = var2186
		
		if var2183 == protoModule.wireTypes.varint then
			if var2187 == 5 then
				local _ = nil
				local var2188, var2189 = protoModule.readVarIntI64(p81, var2182)
				var2182 = var2189
				var2181.num_items_to_show = var2188
			elseif var2187 == 6 then
				local _ = nil
				local var2190, var2191 = protoModule.readVarInt(p81, var2182)
				var2182 = var2191
				var2181.see_all_button = var2190 ~= 0
			else
				local _ = nil
				local var2192, var2193 = protoModule.readVarInt(p81, var2182)
				local _ = var2192
				var2182 = var2193
			end
		end
		if var2183 == protoModule.wireTypes.lengthDelimited then
			if var2187 == 1 then
				local _ = nil
				local var2194, var2195 = protoModule.readBuffer(p81, var2182)
				var2182 = var2195
				var2181.id = buffer.tostring(var2194)
			elseif var2187 == 3 then
				local _ = nil
				local var2196, var2197 = protoModule.readBuffer(p81, var2182)
				var2182 = var2197
				var2181.widget_style = t.WidgetStyleData.decode(var2196)
			elseif var2187 == 7 then
				local _ = nil
				local var2198, var2199 = protoModule.readBuffer(p81, var2182)
				var2182 = var2199
				var2181.information_popover_text = buffer.tostring(var2198)
			else
				local _ = nil
				local var2200, var2201 = protoModule.readVarInt(p81, var2182)
				var2182 = var2201 + var2200
			end
		elseif var2183 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2202, var2203 = protoModule.readFixed32(p81, var2182)
			local _ = var2202
			var2182 = var2203
		elseif var2183 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2204, var2205 = protoModule.readFixed64(p81, var2182)
			local _ = var2204
			var2182 = var2205
		else
			error("Unsupported wire type: " .. var3298)
		end
	end
	return var2181
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
	local var2206 = t_81.new()
	
	if self.id ~= nil then
		var2206.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2206.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2206.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2206.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2206.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2206.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2206.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2206.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2206.information_popover_text = self.informationPopoverText
	end
	return var2206
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
	local var2206 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2207 = v:encode()
			local var2208, var2209 = protoModule.writeTag(buff, var2206, 1, protoModule.wireTypes.lengthDelimited)
			var2208, var3327 = protoModule.writeBuffer(var2208, var2209, var2207, buffer.len(var2207))
			buff = var2208
			var2206 = var2209
		end
	end
	local buff_1 = buffer.create(var2206)
	buffer.copy(buff_1, 0, buff, 0, var2206)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2210 = t_82.new()
	local var2211 = 0
	while var2211 < buffer.len(p82) do
		local _ = nil
		local var2212 = nil
		local var2213, var2214, var2215 = protoModule.readTag(p82, var2211)
		local var2216 = var2213
		var2212 = var2214
		var2211 = var2215
		
		if var2212 == protoModule.wireTypes.varint then
			local _ = nil
			local var2217, var2218 = protoModule.readVarInt(p82, var2211)
			local _ = var2217
			var2211 = var2218
			continue
		end
		if var2212 == protoModule.wireTypes.lengthDelimited then
			if var2216 == 1 then
				local _ = nil
				local var2219, var2220 = protoModule.readBuffer(p82, var2211)
				var2211 = var2220
				table.insert(var2210.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2219))
			else
				local _ = nil
				local var2221, var2222 = protoModule.readVarInt(p82, var2211)
				var2211 = var2222 + var2221
			end
		elseif var2212 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2223, var2224 = protoModule.readFixed32(p82, var2211)
			local _ = var2223
			var2211 = var2224
		elseif var2212 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2225, var2226 = protoModule.readFixed64(p82, var2211)
			local _ = var2225
			var2211 = var2226
		else
			error("Unsupported wire type: " .. var3331)
		end
	end
	return var2210
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
	local var2227 = t_82.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2227.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2227.background_layers = t
	end
	return var2227
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
	local var2228 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2229, var2230 = protoModule.writeTag(buff, var2228, 1, protoModule.wireTypes.lengthDelimited)
		var2229, var3354 = protoModule.writeString(var2229, var2230, self.id)
		buff = var2229
		var2228 = var2230
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2231, var2232 = protoModule.writeTag(buff, var2228, 2, protoModule.wireTypes.lengthDelimited)
		var2231, var3356 = protoModule.writeString(var2231, var2232, self.available_until)
		buff = var2231
		var2228 = var2232
	end
	if self.widget_style ~= nil then
		local var2233 = self.widget_style:encode()
		local var2234, var2235 = protoModule.writeTag(buff, var2228, 3, protoModule.wireTypes.lengthDelimited)
		var2234, var3359 = protoModule.writeBuffer(var2234, var2235, var2233, buffer.len(var2233))
		buff = var2234
		var2228 = var2235
	end
	local buff_1 = buffer.create(var2228)
	buffer.copy(buff_1, 0, buff, 0, var2228)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2228 = t_83.new()
	local var2229 = 0
	while var2229 < buffer.len(p83) do
		local _ = nil
		local var2230 = nil
		local var2231, var2232, var2233 = protoModule.readTag(p83, var2229)
		local var2234 = var2231
		var2230 = var2232
		var2229 = var2233
		
		if var2230 == protoModule.wireTypes.varint then
			local _ = nil
			local var2235, var2236 = protoModule.readVarInt(p83, var2229)
			local _ = var2235
			var2229 = var2236
			continue
		end
		if var2230 == protoModule.wireTypes.lengthDelimited then
			if var2234 == 1 then
				local _ = nil
				local var2237, var2238 = protoModule.readBuffer(p83, var2229)
				var2229 = var2238
				var2228.id = buffer.tostring(var2237)
			elseif var2234 == 2 then
				local _ = nil
				local var2239, var2240 = protoModule.readBuffer(p83, var2229)
				var2229 = var2240
				var2228.available_until = buffer.tostring(var2239)
			elseif var2234 == 3 then
				local _ = nil
				local var2241, var2242 = protoModule.readBuffer(p83, var2229)
				var2229 = var2242
				var2228.widget_style = t.WidgetStyleData.decode(var2241)
			else
				local _ = nil
				local var2243, var2244 = protoModule.readVarInt(p83, var2229)
				var2229 = var2244 + var2243
			end
		elseif var2230 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2245, var2246 = protoModule.readFixed32(p83, var2229)
			local _ = var2245
			var2229 = var2246
		elseif var2230 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2247, var2248 = protoModule.readFixed64(p83, var2229)
			local _ = var2247
			var2229 = var2248
		else
			error("Unsupported wire type: " .. var3363)
		end
	end
	return var2228
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
	local var2249 = t_83.new()
	
	if self.id ~= nil then
		var2249.id = self.id
	end
	if self.available_until ~= nil then
		var2249.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2249.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2249.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2249.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2249
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
	local var2249 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2250, var2251 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2250, var3387 = protoModule.writeString(var2250, var2251, i)
			local var2252 = v:encode()
			var2251, var3389 = protoModule.writeTag(var2250, var2251, 2, protoModule.wireTypes.lengthDelimited)
			var2251, var3389 = protoModule.writeBuffer(var2251, var3389, var2252, buffer.len(var2252))
			local var2253 = var2251
			local var2254 = var3389
			local var2255, var2256 = protoModule.writeTag(buff, var2249, 1, protoModule.wireTypes.lengthDelimited)
			var2255, var3393 = protoModule.writeBuffer(var2255, var2256, var2253, var2254)
			buff = var2255
			var2249 = var2256
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2257, var2258 = protoModule.writeTag(buff, var2249, 2, protoModule.wireTypes.lengthDelimited)
			var2257, var3395 = protoModule.writeString(var2257, var2258, v)
			buff = var2257
			var2249 = var2258
		end
	end
	local buff_1 = buffer.create(var2249)
	buffer.copy(buff_1, 0, buff, 0, var2249)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2259 = t_84.new()
	local var2260 = 0
	while var2260 < buffer.len(p84) do
		local _ = nil
		local var2261 = nil
		local var2262, var2263, var2264 = protoModule.readTag(p84, var2260)
		local var2265 = var2262
		var2261 = var2263
		var2260 = var2264
		
		if var2261 == protoModule.wireTypes.varint then
			local _ = nil
			local var2266, var2267 = protoModule.readVarInt(p84, var2260)
			local _ = var2266
			var2260 = var2267
			continue
		end
		if var2261 == protoModule.wireTypes.lengthDelimited then
			if var2265 == 1 then
				local _ = nil
				local var2268, var2269 = protoModule.readBuffer(p84, var2260)
				var2260 = var2269
				var2268 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2268)
				var2259.entry_map[var2268.key or ""] = var2268.value or t.FeedEntry.new()
			elseif var2265 == 2 then
				local _ = nil
				local var2270, var2271 = protoModule.readBuffer(p84, var2260)
				var2260 = var2271
				table.insert(var2259.entry_order, buffer.tostring(var2270))
			else
				local _ = nil
				local var2272, var2273 = protoModule.readVarInt(p84, var2260)
				var2260 = var2273 + var2272
			end
		elseif var2261 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2274, var2275 = protoModule.readFixed32(p84, var2260)
			local _ = var2274
			var2260 = var2275
		elseif var2261 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2276, var2277 = protoModule.readFixed64(p84, var2260)
			local _ = var2276
			var2260 = var2277
		else
			error("Unsupported wire type: " .. var3399)
		end
	end
	return var2259
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
	local var2278 = t_84.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2278.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2278.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2278.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2278.entry_order = t_1
	end
	return var2278
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
	local var2279 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2280, var2281 = protoModule.writeTag(buff, var2279, 1, protoModule.wireTypes.lengthDelimited)
		var2280, var3427 = protoModule.writeString(var2280, var2281, self.key)
		buff = var2280
		var2279 = var2281
	end
	if self.value ~= nil then
		local var2282 = self.value:encode()
		local var2283, var2284 = protoModule.writeTag(buff, var2279, 2, protoModule.wireTypes.lengthDelimited)
		var2283, var3430 = protoModule.writeBuffer(var2283, var2284, var2282, buffer.len(var2282))
		buff = var2283
		var2279 = var2284
	end
	local buff_1 = buffer.create(var2279)
	buffer.copy(buff_1, 0, buff, 0, var2279)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2279 = t_85.new()
	local var2280 = 0
	while var2280 < buffer.len(p85) do
		local _ = nil
		local var2281 = nil
		local var2282, var2283, var2284 = protoModule.readTag(p85, var2280)
		local var2285 = var2282
		var2281 = var2283
		var2280 = var2284
		
		if var2281 == protoModule.wireTypes.varint then
			local _ = nil
			local var2286, var2287 = protoModule.readVarInt(p85, var2280)
			local _ = var2286
			var2280 = var2287
			continue
		end
		if var2281 == protoModule.wireTypes.lengthDelimited then
			if var2285 == 1 then
				local _ = nil
				local var2288, var2289 = protoModule.readBuffer(p85, var2280)
				var2280 = var2289
				var2279.key = buffer.tostring(var2288)
			elseif var2285 == 2 then
				local _ = nil
				local var2290, var2291 = protoModule.readBuffer(p85, var2280)
				var2280 = var2291
				var2279.value = t.FeedEntry.decode(var2290)
			else
				local _ = nil
				local var2292, var2293 = protoModule.readVarInt(p85, var2280)
				var2280 = var2293 + var2292
			end
		elseif var2281 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2294, var2295 = protoModule.readFixed32(p85, var2280)
			local _ = var2294
			var2280 = var2295
		elseif var2281 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2296, var2297 = protoModule.readFixed64(p85, var2280)
			local _ = var2296
			var2280 = var2297
		else
			error("Unsupported wire type: " .. var3434)
		end
	end
	return var2279
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
	local var2298 = t_85.new()
	
	if self.key ~= nil then
		var2298.key = self.key
	end
	if self.value ~= nil then
		var2298.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2298
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
	local var2298 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2299 = v:encode()
			local var2300, var2301 = protoModule.writeTag(buff, var2298, 1, protoModule.wireTypes.lengthDelimited)
			var2300, var3457 = protoModule.writeBuffer(var2300, var2301, var2299, buffer.len(var2299))
			buff = var2300
			var2298 = var2301
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2302, var2303 = protoModule.writeTag(buff, var2298, 2, protoModule.wireTypes.lengthDelimited)
		var2302, var3459 = protoModule.writeString(var2302, var2303, self.active_category_id)
		buff = var2302
		var2298 = var2303
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2304, var2305 = protoModule.writeTag(buff, var2298, 3, protoModule.wireTypes.varint)
		var2304, var3461 = protoModule.writeVarInt(var2304, var2305, self.active_tooltip_idx)
		buff = var2304
		var2298 = var2305
	end
	local buff_1 = buffer.create(var2298)
	buffer.copy(buff_1, 0, buff, 0, var2298)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2306 = t_86.new()
	local var2307 = 0
	while var2307 < buffer.len(p86) do
		local _ = nil
		local var2308 = nil
		local var2309, var2310, var2311 = protoModule.readTag(p86, var2307)
		local var2312 = var2309
		var2308 = var2310
		var2307 = var2311
		
		if var2308 == protoModule.wireTypes.varint then
			if var2312 == 3 then
				local _ = nil
				local var2313, var2314 = protoModule.readVarIntI64(p86, var2307)
				var2307 = var2314
				var2306.active_tooltip_idx = var2313
			else
				local _ = nil
				local var2315, var2316 = protoModule.readVarInt(p86, var2307)
				local _ = var2315
				var2307 = var2316
			end
		end
		if var2308 == protoModule.wireTypes.lengthDelimited then
			if var2312 == 1 then
				local _ = nil
				local var2317, var2318 = protoModule.readBuffer(p86, var2307)
				var2307 = var2318
				table.insert(var2306.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2317))
			elseif var2312 == 2 then
				local _ = nil
				local var2319, var2320 = protoModule.readBuffer(p86, var2307)
				var2307 = var2320
				var2306.active_category_id = buffer.tostring(var2319)
			else
				local _ = nil
				local var2321, var2322 = protoModule.readVarInt(p86, var2307)
				var2307 = var2322 + var2321
			end
		elseif var2308 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2323, var2324 = protoModule.readFixed32(p86, var2307)
			local _ = var2323
			var2307 = var2324
		elseif var2308 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2325, var2326 = protoModule.readFixed64(p86, var2307)
			local _ = var2325
			var2307 = var2326
		else
			error("Unsupported wire type: " .. var3465)
		end
	end
	return var2306
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
	local var2327 = t_86.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2327.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2327.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2327.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2327.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2327.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2327.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2327
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
	local var2328 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2329, var2330 = protoModule.writeTag(buff, var2328, 1, protoModule.wireTypes.lengthDelimited)
		var2329, var3492 = protoModule.writeString(var2329, var2330, self.marketplace_catalog_category_item_id)
		buff = var2329
		var2328 = var2330
	end
	local buff_1 = buffer.create(var2328)
	buffer.copy(buff_1, 0, buff, 0, var2328)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref)
	local var2328 = t_87.new()
	local var2329 = 0
	while var2329 < buffer.len(p87) do
		local _ = nil
		local var2330 = nil
		local var2331, var2332, var2333 = protoModule.readTag(p87, var2329)
		local var2334 = var2331
		var2330 = var2332
		var2329 = var2333
		
		if var2330 == protoModule.wireTypes.varint then
			local _ = nil
			local var2335, var2336 = protoModule.readVarInt(p87, var2329)
			local _ = var2335
			var2329 = var2336
			continue
		end
		if var2330 == protoModule.wireTypes.lengthDelimited then
			if var2334 == 1 then
				local _ = nil
				local var2337, var2338 = protoModule.readBuffer(p87, var2329)
				var2329 = var2338
				var2328.marketplace_catalog_category_item_id = buffer.tostring(var2337)
			else
				local _ = nil
				local var2339, var2340 = protoModule.readVarInt(p87, var2329)
				var2329 = var2340 + var2339
			end
		elseif var2330 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2341, var2342 = protoModule.readFixed32(p87, var2329)
			local _ = var2341
			var2329 = var2342
		elseif var2330 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2343, var2344 = protoModule.readFixed64(p87, var2329)
			local _ = var2343
			var2329 = var2344
		else
			error("Unsupported wire type: " .. var3496)
		end
	end
	return var2328
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
	local var2345 = t_87.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2345.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2345.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2345
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
	local var2345 = 0
	
	if self.hero_icon ~= nil then
		local var2346, var2347 = protoModule.writeTag(buff, var2345, 1, protoModule.wireTypes.lengthDelimited)
		var2346, var3516 = protoModule.writeString(var2346, var2347, self.hero_icon)
		buff = var2346
		var2345 = var2347
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2348, var2349 = protoModule.writeTag(buff, var2345, 2, protoModule.wireTypes.lengthDelimited)
		var2348, var3518 = protoModule.writeString(var2348, var2349, self.body_dismiss_button_text)
		buff = var2348
		var2345 = var2349
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2350, var2351 = protoModule.writeTag(buff, var2345, 3, protoModule.wireTypes.lengthDelimited)
		var2350, var3520 = protoModule.writeString(var2350, var2351, self.body_title)
		buff = var2350
		var2345 = var2351
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2352, var2353 = protoModule.writeTag(buff, var2345, 4, protoModule.wireTypes.lengthDelimited)
		var2352, var3522 = protoModule.writeString(var2352, var2353, self.body_rich_text)
		buff = var2352
		var2345 = var2353
	end
	if self.terms_link_text ~= nil then
		local var2354, var2355 = protoModule.writeTag(buff, var2345, 5, protoModule.wireTypes.lengthDelimited)
		var2354, var3524 = protoModule.writeString(var2354, var2355, self.terms_link_text)
		buff = var2354
		var2345 = var2355
	end
	if self.terms_title ~= nil then
		local var2356, var2357 = protoModule.writeTag(buff, var2345, 6, protoModule.wireTypes.lengthDelimited)
		var2356, var3526 = protoModule.writeString(var2356, var2357, self.terms_title)
		buff = var2356
		var2345 = var2357
	end
	if self.terms_body_rich_text ~= nil then
		local var2358, var2359 = protoModule.writeTag(buff, var2345, 7, protoModule.wireTypes.lengthDelimited)
		var2358, var3528 = protoModule.writeString(var2358, var2359, self.terms_body_rich_text)
		buff = var2358
		var2345 = var2359
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2360, var2361 = protoModule.writeTag(buff, var2345, 8, protoModule.wireTypes.lengthDelimited)
		var2360, var3530 = protoModule.writeString(var2360, var2361, self.terms_dismiss_button_text)
		buff = var2360
		var2345 = var2361
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2362, var2363 = protoModule.writeTag(buff, var2345, 9, protoModule.wireTypes.lengthDelimited)
		var2362, var3532 = protoModule.writeString(var2362, var2363, self.offer_id)
		buff = var2362
		var2345 = var2363
	end
	local buff_1 = buffer.create(var2345)
	buffer.copy(buff_1, 0, buff, 0, var2345)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref)
	local var2345 = t_88.new()
	local var2346 = 0
	while var2346 < buffer.len(p88) do
		local _ = nil
		local var2347 = nil
		local var2348, var2349, var2350 = protoModule.readTag(p88, var2346)
		local var2351 = var2348
		var2347 = var2349
		var2346 = var2350
		
		if var2347 == protoModule.wireTypes.varint then
			local _ = nil
			local var2352, var2353 = protoModule.readVarInt(p88, var2346)
			local _ = var2352
			var2346 = var2353
			continue
		end
		if var2347 == protoModule.wireTypes.lengthDelimited then
			if var2351 == 1 then
				local _ = nil
				local var2354, var2355 = protoModule.readBuffer(p88, var2346)
				var2346 = var2355
				var2345.hero_icon = buffer.tostring(var2354)
			elseif var2351 == 2 then
				local _ = nil
				local var2356, var2357 = protoModule.readBuffer(p88, var2346)
				var2346 = var2357
				var2345.body_dismiss_button_text = buffer.tostring(var2356)
			elseif var2351 == 3 then
				local _ = nil
				local var2358, var2359 = protoModule.readBuffer(p88, var2346)
				var2346 = var2359
				var2345.body_title = buffer.tostring(var2358)
			elseif var2351 == 4 then
				local _ = nil
				local var2360, var2361 = protoModule.readBuffer(p88, var2346)
				var2346 = var2361
				var2345.body_rich_text = buffer.tostring(var2360)
			elseif var2351 == 5 then
				local _ = nil
				local var2362, var2363 = protoModule.readBuffer(p88, var2346)
				var2346 = var2363
				var2345.terms_link_text = buffer.tostring(var2362)
			elseif var2351 == 6 then
				local _ = nil
				local var2364, var2365 = protoModule.readBuffer(p88, var2346)
				var2346 = var2365
				var2345.terms_title = buffer.tostring(var2364)
			elseif var2351 == 7 then
				local _ = nil
				local var2366, var2367 = protoModule.readBuffer(p88, var2346)
				var2346 = var2367
				var2345.terms_body_rich_text = buffer.tostring(var2366)
			elseif var2351 == 8 then
				local _ = nil
				local var2368, var2369 = protoModule.readBuffer(p88, var2346)
				var2346 = var2369
				var2345.terms_dismiss_button_text = buffer.tostring(var2368)
			elseif var2351 == 9 then
				local _ = nil
				local var2370, var2371 = protoModule.readBuffer(p88, var2346)
				var2346 = var2371
				var2345.offer_id = buffer.tostring(var2370)
			else
				local _ = nil
				local var2372, var2373 = protoModule.readVarInt(p88, var2346)
				var2346 = var2373 + var2372
			end
		elseif var2347 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2374, var2375 = protoModule.readFixed32(p88, var2346)
			local _ = var2374
			var2346 = var2375
		elseif var2347 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2376, var2377 = protoModule.readFixed64(p88, var2346)
			local _ = var2376
			var2346 = var2377
		else
			error("Unsupported wire type: " .. var3536)
		end
	end
	return var2345
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
	local var2378 = t_88.new()
	
	if self.hero_icon ~= nil then
		var2378.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2378.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2378.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2378.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2378.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2378.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2378.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2378.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2378.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2378.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2378.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2378.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2378.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2378.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2378.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2378.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2378.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2378.offer_id = self.offerId
	end
	return var2378
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
	local var2378 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2379 = v:encode()
			local var2380, var2381 = protoModule.writeTag(buff, var2378, 1, protoModule.wireTypes.lengthDelimited)
			var2380, var3573 = protoModule.writeBuffer(var2380, var2381, var2379, buffer.len(var2379))
			buff = var2380
			var2378 = var2381
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2382, var2383 = protoModule.writeTag(buff, var2378, 2, protoModule.wireTypes.varint)
		var2382, var3575 = protoModule.writeVarInt(var2382, var2383, self.preview_columns)
		buff = var2382
		var2378 = var2383
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2384, var2385 = protoModule.writeTag(buff, var2378, 3, protoModule.wireTypes.lengthDelimited)
		var2384, var3577 = protoModule.writeString(var2384, var2385, self.impression_id)
		buff = var2384
		var2378 = var2385
	end
	local buff_1 = buffer.create(var2378)
	buffer.copy(buff_1, 0, buff, 0, var2378)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var2386 = t_89.new()
	local var2387 = 0
	while var2387 < buffer.len(p89) do
		local _ = nil
		local var2388 = nil
		local var2389, var2390, var2391 = protoModule.readTag(p89, var2387)
		local var2392 = var2389
		var2388 = var2390
		var2387 = var2391
		
		if var2388 == protoModule.wireTypes.varint then
			if var2392 == 2 then
				local _ = nil
				local var2393, var2394 = protoModule.readVarIntI32(p89, var2387)
				var2387 = var2394
				var2386.preview_columns = var2393
			else
				local _ = nil
				local var2395, var2396 = protoModule.readVarInt(p89, var2387)
				local _ = var2395
				var2387 = var2396
			end
		end
		if var2388 == protoModule.wireTypes.lengthDelimited then
			if var2392 == 1 then
				local _ = nil
				local var2397, var2398 = protoModule.readBuffer(p89, var2387)
				var2387 = var2398
				table.insert(var2386.items, t.CatalogItemGridInputData_CatalogItem.decode(var2397))
			elseif var2392 == 3 then
				local _ = nil
				local var2399, var2400 = protoModule.readBuffer(p89, var2387)
				var2387 = var2400
				var2386.impression_id = buffer.tostring(var2399)
			else
				local _ = nil
				local var2401, var2402 = protoModule.readVarInt(p89, var2387)
				var2387 = var2402 + var2401
			end
		elseif var2388 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2403, var2404 = protoModule.readFixed32(p89, var2387)
			local _ = var2403
			var2387 = var2404
		elseif var2388 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2405, var2406 = protoModule.readFixed64(p89, var2387)
			local _ = var2405
			var2387 = var2406
		else
			error("Unsupported wire type: " .. var3581)
		end
	end
	return var2386
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
	local var2407 = t_89.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2407.items = t_1
	end
	if self.preview_columns ~= nil then
		var2407.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2407.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2407.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2407.impression_id = self.impressionId
	end
	return var2407
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
	local var2408 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2409, var2410 = protoModule.writeTag(buff, var2408, 1, protoModule.wireTypes.lengthDelimited)
		var2409, var3607 = protoModule.writeString(var2409, var2410, self.id)
		buff = var2409
		var2408 = var2410
	end
	if self.type ~= nil and self.type ~= "" then
		local var2411, var2412 = protoModule.writeTag(buff, var2408, 2, protoModule.wireTypes.lengthDelimited)
		var2411, var3609 = protoModule.writeString(var2411, var2412, self.type)
		buff = var2411
		var2408 = var2412
	end
	local buff_1 = buffer.create(var2408)
	buffer.copy(buff_1, 0, buff, 0, var2408)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2408 = t_90.new()
	local var2409 = 0
	while var2409 < buffer.len(p90) do
		local _ = nil
		local var2410 = nil
		local var2411, var2412, var2413 = protoModule.readTag(p90, var2409)
		local var2414 = var2411
		var2410 = var2412
		var2409 = var2413
		
		if var2410 == protoModule.wireTypes.varint then
			local _ = nil
			local var2415, var2416 = protoModule.readVarInt(p90, var2409)
			local _ = var2415
			var2409 = var2416
			continue
		end
		if var2410 == protoModule.wireTypes.lengthDelimited then
			if var2414 == 1 then
				local _ = nil
				local var2417, var2418 = protoModule.readBuffer(p90, var2409)
				var2409 = var2418
				var2408.id = buffer.tostring(var2417)
			elseif var2414 == 2 then
				local _ = nil
				local var2419, var2420 = protoModule.readBuffer(p90, var2409)
				var2409 = var2420
				var2408.type = buffer.tostring(var2419)
			else
				local _ = nil
				local var2421, var2422 = protoModule.readVarInt(p90, var2409)
				var2409 = var2422 + var2421
			end
		elseif var2410 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2423, var2424 = protoModule.readFixed32(p90, var2409)
			local _ = var2423
			var2409 = var2424
		elseif var2410 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2425, var2426 = protoModule.readFixed64(p90, var2409)
			local _ = var2425
			var2409 = var2426
		else
			error("Unsupported wire type: " .. var3613)
		end
	end
	return var2408
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
	local var2427 = t_90.new()
	
	if self.id ~= nil then
		var2427.id = self.id
	end
	if self.type ~= nil then
		var2427.type = self.type
	end
	return var2427
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
	local var2427 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2428, var2429 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2428, var3635 = protoModule.writeString(var2428, var2429, i)
			local var2430 = v:encode()
			var2429, var3637 = protoModule.writeTag(var2428, var2429, 2, protoModule.wireTypes.lengthDelimited)
			var2429, var3637 = protoModule.writeBuffer(var2429, var3637, var2430, buffer.len(var2430))
			local var2431 = var2429
			local var2432 = var3637
			local var2433, var2434 = protoModule.writeTag(buff, var2427, 1, protoModule.wireTypes.lengthDelimited)
			var2433, var3641 = protoModule.writeBuffer(var2433, var2434, var2431, var2432)
			buff = var2433
			var2427 = var2434
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2435, var2436 = protoModule.writeTag(buff, var2427, 2, protoModule.wireTypes.lengthDelimited)
			var2435, var3643 = protoModule.writeString(var2435, var2436, v)
			buff = var2435
			var2427 = var2436
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2437, var2438 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2437, var3645 = protoModule.writeString(var2437, var2438, i)
			local var2439 = v:encode()
			var2438, var3647 = protoModule.writeTag(var2437, var2438, 2, protoModule.wireTypes.lengthDelimited)
			var2438, var3647 = protoModule.writeBuffer(var2438, var3647, var2439, buffer.len(var2439))
			local var2440 = var2438
			local var2441 = var3647
			local var2442, var2443 = protoModule.writeTag(buff, var2427, 3, protoModule.wireTypes.lengthDelimited)
			var2442, var3651 = protoModule.writeBuffer(var2442, var2443, var2440, var2441)
			buff = var2442
			var2427 = var2443
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2444, var2445 = protoModule.writeTag(buff, var2427, 4, protoModule.wireTypes.lengthDelimited)
		var2444, var3653 = protoModule.writeString(var2444, var2445, self.search_session_id)
		buff = var2444
		var2427 = var2445
	end
	local buff_1 = buffer.create(var2427)
	buffer.copy(buff_1, 0, buff, 0, var2427)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var2446 = t_91.new()
	local var2447 = 0
	while var2447 < buffer.len(p91) do
		local _ = nil
		local var2448 = nil
		local var2449, var2450, var2451 = protoModule.readTag(p91, var2447)
		local var2452 = var2449
		var2448 = var2450
		var2447 = var2451
		
		if var2448 == protoModule.wireTypes.varint then
			local _ = nil
			local var2453, var2454 = protoModule.readVarInt(p91, var2447)
			local _ = var2453
			var2447 = var2454
			continue
		end
		if var2448 == protoModule.wireTypes.lengthDelimited then
			if var2452 == 1 then
				local _ = nil
				local var2455, var2456 = protoModule.readBuffer(p91, var2447)
				var2447 = var2456
				var2455 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2455)
				var2446.entry_map[var2455.key or ""] = var2455.value or t.FeedEntry.new()
			elseif var2452 == 2 then
				local _ = nil
				local var2457, var2458 = protoModule.readBuffer(p91, var2447)
				var2447 = var2458
				table.insert(var2446.entry_order, buffer.tostring(var2457))
			elseif var2452 == 3 then
				local _ = nil
				local var2459, var2460 = protoModule.readBuffer(p91, var2447)
				var2447 = var2460
				var2459 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2459)
				var2446.content_pools[var2459.key or ""] = var2459.value or t.ContentPool.new()
			elseif var2452 == 4 then
				local _ = nil
				local var2461, var2462 = protoModule.readBuffer(p91, var2447)
				var2447 = var2462
				var2446.search_session_id = buffer.tostring(var2461)
			else
				local _ = nil
				local var2463, var2464 = protoModule.readVarInt(p91, var2447)
				var2447 = var2464 + var2463
			end
		elseif var2448 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2465, var2466 = protoModule.readFixed32(p91, var2447)
			local _ = var2465
			var2447 = var2466
		elseif var2448 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2467, var2468 = protoModule.readFixed64(p91, var2447)
			local _ = var2467
			var2447 = var2468
		else
			error("Unsupported wire type: " .. var3657)
		end
	end
	return var2446
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
	local var2469 = t_91.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2469.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2469.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2469.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2469.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2469.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2469.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2469.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2469.search_session_id = self.searchSessionId
	end
	return var2469
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
	local var2470 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2471, var2472 = protoModule.writeTag(buff, var2470, 1, protoModule.wireTypes.lengthDelimited)
		var2471, var3692 = protoModule.writeString(var2471, var2472, self.key)
		buff = var2471
		var2470 = var2472
	end
	if self.value ~= nil then
		local var2473 = self.value:encode()
		local var2474, var2475 = protoModule.writeTag(buff, var2470, 2, protoModule.wireTypes.lengthDelimited)
		var2474, var3695 = protoModule.writeBuffer(var2474, var2475, var2473, buffer.len(var2473))
		buff = var2474
		var2470 = var2475
	end
	local buff_1 = buffer.create(var2470)
	buffer.copy(buff_1, 0, buff, 0, var2470)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var2470 = t_92.new()
	local var2471 = 0
	while var2471 < buffer.len(p92) do
		local _ = nil
		local var2472 = nil
		local var2473, var2474, var2475 = protoModule.readTag(p92, var2471)
		local var2476 = var2473
		var2472 = var2474
		var2471 = var2475
		
		if var2472 == protoModule.wireTypes.varint then
			local _ = nil
			local var2477, var2478 = protoModule.readVarInt(p92, var2471)
			local _ = var2477
			var2471 = var2478
			continue
		end
		if var2472 == protoModule.wireTypes.lengthDelimited then
			if var2476 == 1 then
				local _ = nil
				local var2479, var2480 = protoModule.readBuffer(p92, var2471)
				var2471 = var2480
				var2470.key = buffer.tostring(var2479)
			elseif var2476 == 2 then
				local _ = nil
				local var2481, var2482 = protoModule.readBuffer(p92, var2471)
				var2471 = var2482
				var2470.value = t.FeedEntry.decode(var2481)
			else
				local _ = nil
				local var2483, var2484 = protoModule.readVarInt(p92, var2471)
				var2471 = var2484 + var2483
			end
		elseif var2472 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2485, var2486 = protoModule.readFixed32(p92, var2471)
			local _ = var2485
			var2471 = var2486
		elseif var2472 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2487, var2488 = protoModule.readFixed64(p92, var2471)
			local _ = var2487
			var2471 = var2488
		else
			error("Unsupported wire type: " .. var3699)
		end
	end
	return var2470
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
	local var2489 = t_92.new()
	
	if self.key ~= nil then
		var2489.key = self.key
	end
	if self.value ~= nil then
		var2489.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2489
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
	local var2489 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2490, var2491 = protoModule.writeTag(buff, var2489, 1, protoModule.wireTypes.lengthDelimited)
		var2490, var3721 = protoModule.writeString(var2490, var2491, self.key)
		buff = var2490
		var2489 = var2491
	end
	if self.value ~= nil then
		local var2492 = self.value:encode()
		local var2493, var2494 = protoModule.writeTag(buff, var2489, 2, protoModule.wireTypes.lengthDelimited)
		var2493, var3724 = protoModule.writeBuffer(var2493, var2494, var2492, buffer.len(var2492))
		buff = var2493
		var2489 = var2494
	end
	local buff_1 = buffer.create(var2489)
	buffer.copy(buff_1, 0, buff, 0, var2489)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2489 = t_93.new()
	local var2490 = 0
	while var2490 < buffer.len(p93) do
		local _ = nil
		local var2491 = nil
		local var2492, var2493, var2494 = protoModule.readTag(p93, var2490)
		local var2495 = var2492
		var2491 = var2493
		var2490 = var2494
		
		if var2491 == protoModule.wireTypes.varint then
			local _ = nil
			local var2496, var2497 = protoModule.readVarInt(p93, var2490)
			local _ = var2496
			var2490 = var2497
			continue
		end
		if var2491 == protoModule.wireTypes.lengthDelimited then
			if var2495 == 1 then
				local _ = nil
				local var2498, var2499 = protoModule.readBuffer(p93, var2490)
				var2490 = var2499
				var2489.key = buffer.tostring(var2498)
			elseif var2495 == 2 then
				local _ = nil
				local var2500, var2501 = protoModule.readBuffer(p93, var2490)
				var2490 = var2501
				var2489.value = t.ContentPool.decode(var2500)
			else
				local _ = nil
				local var2502, var2503 = protoModule.readVarInt(p93, var2490)
				var2490 = var2503 + var2502
			end
		elseif var2491 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2504, var2505 = protoModule.readFixed32(p93, var2490)
			local _ = var2504
			var2490 = var2505
		elseif var2491 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2506, var2507 = protoModule.readFixed64(p93, var2490)
			local _ = var2506
			var2490 = var2507
		else
			error("Unsupported wire type: " .. var3728)
		end
	end
	return var2489
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
	local var2508 = t_93.new()
	
	if self.key ~= nil then
		var2508.key = self.key
	end
	if self.value ~= nil then
		var2508.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2508
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
	local var2508 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2509, var2510 = protoModule.writeTag(buff, var2508, 1, protoModule.wireTypes.lengthDelimited)
		var2509, var3750 = protoModule.writeString(var2509, var2510, self.universe_id)
		buff = var2509
		var2508 = var2510
	end
	if self.is_content_locked then
		local var2511, var2512 = protoModule.writeTag(buff, var2508, 2, protoModule.wireTypes.varint)
		var2511, var3752 = protoModule.writeVarInt(var2511, var2512, if self.is_content_locked then 1 else 0)
		buff = var2511
		var2508 = var2512
	end
	local buff_1 = buffer.create(var2508)
	buffer.copy(buff_1, 0, buff, 0, var2508)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref)
	local var2508 = t_94.new()
	local var2509 = 0
	while var2509 < buffer.len(p94) do
		local _ = nil
		local var2510 = nil
		local var2511, var2512, var2513 = protoModule.readTag(p94, var2509)
		local var2514 = var2511
		var2510 = var2512
		var2509 = var2513
		
		if var2510 == protoModule.wireTypes.varint then
			if var2514 == 2 then
				local _ = nil
				local var2515, var2516 = protoModule.readVarInt(p94, var2509)
				var2509 = var2516
				var2508.is_content_locked = var2515 ~= 0
			else
				local _ = nil
				local var2517, var2518 = protoModule.readVarInt(p94, var2509)
				local _ = var2517
				var2509 = var2518
			end
		end
		if var2510 == protoModule.wireTypes.lengthDelimited then
			if var2514 == 1 then
				local _ = nil
				local var2519, var2520 = protoModule.readBuffer(p94, var2509)
				var2509 = var2520
				var2508.universe_id = buffer.tostring(var2519)
			else
				local _ = nil
				local var2521, var2522 = protoModule.readVarInt(p94, var2509)
				var2509 = var2522 + var2521
			end
		elseif var2510 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2523, var2524 = protoModule.readFixed32(p94, var2509)
			local _ = var2523
			var2509 = var2524
		elseif var2510 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2525, var2526 = protoModule.readFixed64(p94, var2509)
			local _ = var2525
			var2509 = var2526
		else
			error("Unsupported wire type: " .. var3756)
		end
	end
	return var2508
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
	local var2527 = t_94.new()
	
	if self.universe_id ~= nil then
		var2527.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2527.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2527.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2527.is_content_locked = self.isContentLocked
	end
	return var2527
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
	local var2527 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2528, var2529 = protoModule.writeTag(buff, var2527, 1, protoModule.wireTypes.lengthDelimited)
		var2528, var3778 = protoModule.writeString(var2528, var2529, self.overview_rich_text)
		buff = var2528
		var2527 = var2529
	end
	if self.result_entry ~= nil then
		local var2530 = self.result_entry:encode()
		local var2531, var2532 = protoModule.writeTag(buff, var2527, 2, protoModule.wireTypes.lengthDelimited)
		var2531, var3781 = protoModule.writeBuffer(var2531, var2532, var2530, buffer.len(var2530))
		buff = var2531
		var2527 = var2532
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2533, var2534 = protoModule.writeTag(buff, var2527, 3, protoModule.wireTypes.lengthDelimited)
			var2533, var3783 = protoModule.writeString(var2533, var2534, v)
			buff = var2533
			var2527 = var2534
		end
	end
	if self.show_loading then
		local var2535, var2536 = protoModule.writeTag(buff, var2527, 4, protoModule.wireTypes.varint)
		var2535, var3785 = protoModule.writeVarInt(var2535, var2536, if self.show_loading then 1 else 0)
		buff = var2535
		var2527 = var2536
	end
	if self.title ~= nil and self.title ~= "" then
		local var2537, var2538 = protoModule.writeTag(buff, var2527, 5, protoModule.wireTypes.lengthDelimited)
		var2537, var3787 = protoModule.writeString(var2537, var2538, self.title)
		buff = var2537
		var2527 = var2538
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2539, var2540 = protoModule.writeTag(buff, var2527, 6, protoModule.wireTypes.lengthDelimited)
		var2539, var3789 = protoModule.writeString(var2539, var2540, self.search_query)
		buff = var2539
		var2527 = var2540
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2541, var2542 = protoModule.writeTag(buff, var2527, 8, protoModule.wireTypes.lengthDelimited)
		var2541, var3791 = protoModule.writeString(var2541, var2542, self.universe_ids)
		buff = var2541
		var2527 = var2542
	end
	local buff_1 = buffer.create(var2527)
	buffer.copy(buff_1, 0, buff, 0, var2527)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2543 = t_95.new()
	local var2544 = 0
	while var2544 < buffer.len(p95) do
		local _ = nil
		local var2545 = nil
		local var2546, var2547, var2548 = protoModule.readTag(p95, var2544)
		local var2549 = var2546
		var2545 = var2547
		var2544 = var2548
		
		if var2545 == protoModule.wireTypes.varint then
			if var2549 == 4 then
				local _ = nil
				local var2550, var2551 = protoModule.readVarInt(p95, var2544)
				var2544 = var2551
				var2543.show_loading = var2550 ~= 0
			else
				local _ = nil
				local var2552, var2553 = protoModule.readVarInt(p95, var2544)
				local _ = var2552
				var2544 = var2553
			end
		end
		if var2545 == protoModule.wireTypes.lengthDelimited then
			if var2549 == 1 then
				local _ = nil
				local var2554, var2555 = protoModule.readBuffer(p95, var2544)
				var2544 = var2555
				var2543.overview_rich_text = buffer.tostring(var2554)
			elseif var2549 == 2 then
				local _ = nil
				local var2556, var2557 = protoModule.readBuffer(p95, var2544)
				var2544 = var2557
				var2543.result_entry = t.FeedEntry.decode(var2556)
			elseif var2549 == 3 then
				local _ = nil
				local var2558, var2559 = protoModule.readBuffer(p95, var2544)
				var2544 = var2559
				table.insert(var2543.follow_up_queries, buffer.tostring(var2558))
			elseif var2549 == 5 then
				local _ = nil
				local var2560, var2561 = protoModule.readBuffer(p95, var2544)
				var2544 = var2561
				var2543.title = buffer.tostring(var2560)
			elseif var2549 == 6 then
				local _ = nil
				local var2562, var2563 = protoModule.readBuffer(p95, var2544)
				var2544 = var2563
				var2543.search_query = buffer.tostring(var2562)
			elseif var2549 == 8 then
				local _ = nil
				local var2564, var2565 = protoModule.readBuffer(p95, var2544)
				var2544 = var2565
				var2543.universe_ids = buffer.tostring(var2564)
			else
				local _ = nil
				local var2566, var2567 = protoModule.readVarInt(p95, var2544)
				var2544 = var2567 + var2566
			end
		elseif var2545 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2568, var2569 = protoModule.readFixed32(p95, var2544)
			local _ = var2568
			var2544 = var2569
		elseif var2545 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2570, var2571 = protoModule.readFixed64(p95, var2544)
			local _ = var2570
			var2544 = var2571
		else
			error("Unsupported wire type: " .. var3795)
		end
	end
	return var2543
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
	local var2572 = t_95.new()
	
	if self.overview_rich_text ~= nil then
		var2572.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2572.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2572.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2572.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2572.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2572.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2572.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2572.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2572.title = self.title
	end
	if self.search_query ~= nil then
		var2572.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2572.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2572.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2572.universe_ids = self.universeIds
	end
	return var2572
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
	local var2573 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2574, var2575 = protoModule.writeTag(buff, var2573, 1, protoModule.wireTypes.lengthDelimited)
		var2574, var3830 = protoModule.writeString(var2574, var2575, self.title)
		buff = var2574
		var2573 = var2575
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2576 = v:encode()
			local var2577, var2578 = protoModule.writeTag(buff, var2573, 2, protoModule.wireTypes.lengthDelimited)
			var2577, var3833 = protoModule.writeBuffer(var2577, var2578, var2576, buffer.len(var2576))
			buff = var2577
			var2573 = var2578
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2579, var2580 = protoModule.writeTag(buff, var2573, 3, protoModule.wireTypes.varint)
		var2579, var3835 = protoModule.writeVarInt(var2579, var2580, self.max_visible_rows)
		buff = var2579
		var2573 = var2580
	end
	if self.sort_id ~= nil then
		local var2581, var2582 = protoModule.writeTag(buff, var2573, 4, protoModule.wireTypes.lengthDelimited)
		var2581, var3837 = protoModule.writeString(var2581, var2582, self.sort_id)
		buff = var2581
		var2573 = var2582
	end
	local buff_1 = buffer.create(var2573)
	buffer.copy(buff_1, 0, buff, 0, var2573)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var2583 = t_96.new()
	local var2584 = 0
	while var2584 < buffer.len(p96) do
		local _ = nil
		local var2585 = nil
		local var2586, var2587, var2588 = protoModule.readTag(p96, var2584)
		local var2589 = var2586
		var2585 = var2587
		var2584 = var2588
		
		if var2585 == protoModule.wireTypes.varint then
			if var2589 == 3 then
				local _ = nil
				local var2590, var2591 = protoModule.readVarIntI32(p96, var2584)
				var2584 = var2591
				var2583.max_visible_rows = var2590
			else
				local _ = nil
				local var2592, var2593 = protoModule.readVarInt(p96, var2584)
				local _ = var2592
				var2584 = var2593
			end
		end
		if var2585 == protoModule.wireTypes.lengthDelimited then
			if var2589 == 1 then
				local _ = nil
				local var2594, var2595 = protoModule.readBuffer(p96, var2584)
				var2584 = var2595
				var2583.title = buffer.tostring(var2594)
			elseif var2589 == 2 then
				local _ = nil
				local var2596, var2597 = protoModule.readBuffer(p96, var2584)
				var2584 = var2597
				table.insert(var2583.user_items, t.UserListInputData_UserItem.decode(var2596))
			elseif var2589 == 4 then
				local _ = nil
				local var2598, var2599 = protoModule.readBuffer(p96, var2584)
				var2584 = var2599
				var2583.sort_id = buffer.tostring(var2598)
			else
				local _ = nil
				local var2600, var2601 = protoModule.readVarInt(p96, var2584)
				var2584 = var2601 + var2600
			end
		elseif var2585 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2602, var2603 = protoModule.readFixed32(p96, var2584)
			local _ = var2602
			var2584 = var2603
		elseif var2585 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2604, var2605 = protoModule.readFixed64(p96, var2584)
			local _ = var2604
			var2584 = var2605
		else
			error("Unsupported wire type: " .. var3841)
		end
	end
	return var2583
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
	local var2606 = t_96.new()
	
	if self.title ~= nil then
		var2606.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2606.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2606.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2606.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2606.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2606.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2606.sort_id = self.sortId
	end
	return var2606
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
	local var2607 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2608, var2609 = protoModule.writeTag(buff, var2607, 1, protoModule.wireTypes.lengthDelimited)
		var2608, var3870 = protoModule.writeString(var2608, var2609, self.user_id)
		buff = var2608
		var2607 = var2609
	end
	local buff_1 = buffer.create(var2607)
	buffer.copy(buff_1, 0, buff, 0, var2607)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref)
	local var2607 = t_97.new()
	local var2608 = 0
	while var2608 < buffer.len(p97) do
		local _ = nil
		local var2609 = nil
		local var2610, var2611, var2612 = protoModule.readTag(p97, var2608)
		local var2613 = var2610
		var2609 = var2611
		var2608 = var2612
		
		if var2609 == protoModule.wireTypes.varint then
			local _ = nil
			local var2614, var2615 = protoModule.readVarInt(p97, var2608)
			local _ = var2614
			var2608 = var2615
			continue
		end
		if var2609 == protoModule.wireTypes.lengthDelimited then
			if var2613 == 1 then
				local _ = nil
				local var2616, var2617 = protoModule.readBuffer(p97, var2608)
				var2608 = var2617
				var2607.user_id = buffer.tostring(var2616)
			else
				local _ = nil
				local var2618, var2619 = protoModule.readVarInt(p97, var2608)
				var2608 = var2619 + var2618
			end
		elseif var2609 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2620, var2621 = protoModule.readFixed32(p97, var2608)
			local _ = var2620
			var2608 = var2621
		elseif var2609 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2622, var2623 = protoModule.readFixed64(p97, var2608)
			local _ = var2622
			var2608 = var2623
		else
			error("Unsupported wire type: " .. var3874)
		end
	end
	return var2607
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
	local var2624 = t_97.new()
	
	if self.user_id ~= nil then
		var2624.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2624.user_id = self.userId
	end
	return var2624
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
	local var2624 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2625, var2626 = protoModule.writeTag(buff, var2624, 1, protoModule.wireTypes.lengthDelimited)
		var2625, var3894 = protoModule.writeString(var2625, var2626, self.title)
		buff = var2625
		var2624 = var2626
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2627 = v:encode()
			local var2628, var2629 = protoModule.writeTag(buff, var2624, 2, protoModule.wireTypes.lengthDelimited)
			var2628, var3897 = protoModule.writeBuffer(var2628, var2629, var2627, buffer.len(var2627))
			buff = var2628
			var2624 = var2629
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2630, var2631 = protoModule.writeTag(buff, var2624, 3, protoModule.wireTypes.varint)
		var2630, var3899 = protoModule.writeVarInt(var2630, var2631, self.max_visible_rows)
		buff = var2630
		var2624 = var2631
	end
	if self.sort_id ~= nil then
		local var2632, var2633 = protoModule.writeTag(buff, var2624, 4, protoModule.wireTypes.lengthDelimited)
		var2632, var3901 = protoModule.writeString(var2632, var2633, self.sort_id)
		buff = var2632
		var2624 = var2633
	end
	local buff_1 = buffer.create(var2624)
	buffer.copy(buff_1, 0, buff, 0, var2624)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2634 = t_98.new()
	local var2635 = 0
	while var2635 < buffer.len(p98) do
		local _ = nil
		local var2636 = nil
		local var2637, var2638, var2639 = protoModule.readTag(p98, var2635)
		local var2640 = var2637
		var2636 = var2638
		var2635 = var2639
		
		if var2636 == protoModule.wireTypes.varint then
			if var2640 == 3 then
				local _ = nil
				local var2641, var2642 = protoModule.readVarIntI32(p98, var2635)
				var2635 = var2642
				var2634.max_visible_rows = var2641
			else
				local _ = nil
				local var2643, var2644 = protoModule.readVarInt(p98, var2635)
				local _ = var2643
				var2635 = var2644
			end
		end
		if var2636 == protoModule.wireTypes.lengthDelimited then
			if var2640 == 1 then
				local _ = nil
				local var2645, var2646 = protoModule.readBuffer(p98, var2635)
				var2635 = var2646
				var2634.title = buffer.tostring(var2645)
			elseif var2640 == 2 then
				local _ = nil
				local var2647, var2648 = protoModule.readBuffer(p98, var2635)
				var2635 = var2648
				table.insert(var2634.items, t.CatalogItemListInputData_CatalogItem.decode(var2647))
			elseif var2640 == 4 then
				local _ = nil
				local var2649, var2650 = protoModule.readBuffer(p98, var2635)
				var2635 = var2650
				var2634.sort_id = buffer.tostring(var2649)
			else
				local _ = nil
				local var2651, var2652 = protoModule.readVarInt(p98, var2635)
				var2635 = var2652 + var2651
			end
		elseif var2636 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2653, var2654 = protoModule.readFixed32(p98, var2635)
			local _ = var2653
			var2635 = var2654
		elseif var2636 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2655, var2656 = protoModule.readFixed64(p98, var2635)
			local _ = var2655
			var2635 = var2656
		else
			error("Unsupported wire type: " .. var3905)
		end
	end
	return var2634
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
	local var2657 = t_98.new()
	
	if self.title ~= nil then
		var2657.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2657.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2657.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2657.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2657.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2657.sort_id = self.sortId
	end
	return var2657
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
	local var2658 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2659, var2660 = protoModule.writeTag(buff, var2658, 1, protoModule.wireTypes.lengthDelimited)
		var2659, var3933 = protoModule.writeString(var2659, var2660, self.item_id)
		buff = var2659
		var2658 = var2660
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2661, var2662 = protoModule.writeTag(buff, var2658, 2, protoModule.wireTypes.lengthDelimited)
		var2661, var3935 = protoModule.writeString(var2661, var2662, self.item_type)
		buff = var2661
		var2658 = var2662
	end
	local buff_1 = buffer.create(var2658)
	buffer.copy(buff_1, 0, buff, 0, var2658)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2658 = t_99.new()
	local var2659 = 0
	while var2659 < buffer.len(p99) do
		local _ = nil
		local var2660 = nil
		local var2661, var2662, var2663 = protoModule.readTag(p99, var2659)
		local var2664 = var2661
		var2660 = var2662
		var2659 = var2663
		
		if var2660 == protoModule.wireTypes.varint then
			local _ = nil
			local var2665, var2666 = protoModule.readVarInt(p99, var2659)
			local _ = var2665
			var2659 = var2666
			continue
		end
		if var2660 == protoModule.wireTypes.lengthDelimited then
			if var2664 == 1 then
				local _ = nil
				local var2667, var2668 = protoModule.readBuffer(p99, var2659)
				var2659 = var2668
				var2658.item_id = buffer.tostring(var2667)
			elseif var2664 == 2 then
				local _ = nil
				local var2669, var2670 = protoModule.readBuffer(p99, var2659)
				var2659 = var2670
				var2658.item_type = buffer.tostring(var2669)
			else
				local _ = nil
				local var2671, var2672 = protoModule.readVarInt(p99, var2659)
				var2659 = var2672 + var2671
			end
		elseif var2660 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2673, var2674 = protoModule.readFixed32(p99, var2659)
			local _ = var2673
			var2659 = var2674
		elseif var2660 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2675, var2676 = protoModule.readFixed64(p99, var2659)
			local _ = var2675
			var2659 = var2676
		else
			error("Unsupported wire type: " .. var3939)
		end
	end
	return var2658
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
	local var2677 = t_99.new()
	
	if self.item_id ~= nil then
		var2677.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2677.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2677.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2677.item_type = self.itemType
	end
	return var2677
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
	local var2677 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2678, var2679 = protoModule.writeTag(buff, var2677, 1, protoModule.wireTypes.lengthDelimited)
		var2678, var3961 = protoModule.writeString(var2678, var2679, self.universe_id)
		buff = var2678
		var2677 = var2679
	end
	local buff_1 = buffer.create(var2677)
	buffer.copy(buff_1, 0, buff, 0, var2677)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref)
	local var2677 = t_100.new()
	local var2678 = 0
	while var2678 < buffer.len(p100) do
		local _ = nil
		local var2679 = nil
		local var2680, var2681, var2682 = protoModule.readTag(p100, var2678)
		local var2683 = var2680
		var2679 = var2681
		var2678 = var2682
		
		if var2679 == protoModule.wireTypes.varint then
			local _ = nil
			local var2684, var2685 = protoModule.readVarInt(p100, var2678)
			local _ = var2684
			var2678 = var2685
			continue
		end
		if var2679 == protoModule.wireTypes.lengthDelimited then
			if var2683 == 1 then
				local _ = nil
				local var2686, var2687 = protoModule.readBuffer(p100, var2678)
				var2678 = var2687
				var2677.universe_id = buffer.tostring(var2686)
			else
				local _ = nil
				local var2688, var2689 = protoModule.readVarInt(p100, var2678)
				var2678 = var2689 + var2688
			end
		elseif var2679 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2690, var2691 = protoModule.readFixed32(p100, var2678)
			local _ = var2690
			var2678 = var2691
		elseif var2679 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2692, var2693 = protoModule.readFixed64(p100, var2678)
			local _ = var2692
			var2678 = var2693
		else
			error("Unsupported wire type: " .. var3965)
		end
	end
	return var2677
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
	local var2694 = t_100.new()
	
	if self.universe_id ~= nil then
		var2694.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2694.universe_id = self.universeId
	end
	return var2694
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
	local var2694 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2695, var2696 = protoModule.writeTag(buff, var2694, 1, protoModule.wireTypes.lengthDelimited)
		var2695, var3985 = protoModule.writeString(var2695, var2696, self.title)
		buff = var2695
		var2694 = var2696
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2697, var2698 = protoModule.writeTag(buff, var2694, 2, protoModule.wireTypes.lengthDelimited)
		var2697, var3987 = protoModule.writeString(var2697, var2698, self.subtitle)
		buff = var2697
		var2694 = var2698
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2699 = v:encode()
			local var2700, var2701 = protoModule.writeTag(buff, var2694, 3, protoModule.wireTypes.lengthDelimited)
			var2700, var3990 = protoModule.writeBuffer(var2700, var2701, var2699, buffer.len(var2699))
			buff = var2700
			var2694 = var2701
		end
	end
	local buff_1 = buffer.create(var2694)
	buffer.copy(buff_1, 0, buff, 0, var2694)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2702 = t_101.new()
	local var2703 = 0
	while var2703 < buffer.len(p101) do
		local _ = nil
		local var2704 = nil
		local var2705, var2706, var2707 = protoModule.readTag(p101, var2703)
		local var2708 = var2705
		var2704 = var2706
		var2703 = var2707
		
		if var2704 == protoModule.wireTypes.varint then
			local _ = nil
			local var2709, var2710 = protoModule.readVarInt(p101, var2703)
			local _ = var2709
			var2703 = var2710
			continue
		end
		if var2704 == protoModule.wireTypes.lengthDelimited then
			if var2708 == 1 then
				local _ = nil
				local var2711, var2712 = protoModule.readBuffer(p101, var2703)
				var2703 = var2712
				var2702.title = buffer.tostring(var2711)
			elseif var2708 == 2 then
				local _ = nil
				local var2713, var2714 = protoModule.readBuffer(p101, var2703)
				var2703 = var2714
				var2702.subtitle = buffer.tostring(var2713)
			elseif var2708 == 3 then
				local _ = nil
				local var2715, var2716 = protoModule.readBuffer(p101, var2703)
				var2703 = var2716
				table.insert(var2702.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2715))
			else
				local _ = nil
				local var2717, var2718 = protoModule.readVarInt(p101, var2703)
				var2703 = var2718 + var2717
			end
		elseif var2704 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2719, var2720 = protoModule.readFixed32(p101, var2703)
			local _ = var2719
			var2703 = var2720
		elseif var2704 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2721, var2722 = protoModule.readFixed64(p101, var2703)
			local _ = var2721
			var2703 = var2722
		else
			error("Unsupported wire type: " .. var3994)
		end
	end
	return var2702
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
	local var2723 = t_101.new()
	
	if self.title ~= nil then
		var2723.title = self.title
	end
	if self.subtitle ~= nil then
		var2723.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2723.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2723.moment_items = t_1
	end
	return var2723
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
	local var2724 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2725, var2726 = protoModule.writeTag(buff, var2724, 1, protoModule.wireTypes.lengthDelimited)
		var2725, var4021 = protoModule.writeString(var2725, var2726, self.moment_id)
		buff = var2725
		var2724 = var2726
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2727, var2728 = protoModule.writeTag(buff, var2724, 2, protoModule.wireTypes.lengthDelimited)
		var2727, var4023 = protoModule.writeString(var2727, var2728, self.video_asset_id)
		buff = var2727
		var2724 = var2728
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2729, var2730 = protoModule.writeTag(buff, var2724, 3, protoModule.wireTypes.lengthDelimited)
		var2729, var4025 = protoModule.writeString(var2729, var2730, self.target_universe_id)
		buff = var2729
		var2724 = var2730
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2731, var2732 = protoModule.writeTag(buff, var2724, 4, protoModule.wireTypes.lengthDelimited)
		var2731, var4027 = protoModule.writeString(var2731, var2732, self.target_place_id)
		buff = var2731
		var2724 = var2732
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2733, var2734 = protoModule.writeTag(buff, var2724, 5, protoModule.wireTypes.lengthDelimited)
		var2733, var4029 = protoModule.writeString(var2733, var2734, self.feed_item_id)
		buff = var2733
		var2724 = var2734
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2735, var2736 = protoModule.writeTag(buff, var2724, 6, protoModule.wireTypes.lengthDelimited)
		var2735, var4031 = protoModule.writeString(var2735, var2736, self.capture_universe_id)
		buff = var2735
		var2724 = var2736
	end
	local buff_1 = buffer.create(var2724)
	buffer.copy(buff_1, 0, buff, 0, var2724)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2724 = t_102.new()
	local var2725 = 0
	while var2725 < buffer.len(p102) do
		local _ = nil
		local var2726 = nil
		local var2727, var2728, var2729 = protoModule.readTag(p102, var2725)
		local var2730 = var2727
		var2726 = var2728
		var2725 = var2729
		
		if var2726 == protoModule.wireTypes.varint then
			local _ = nil
			local var2731, var2732 = protoModule.readVarInt(p102, var2725)
			local _ = var2731
			var2725 = var2732
			continue
		end
		if var2726 == protoModule.wireTypes.lengthDelimited then
			if var2730 == 1 then
				local _ = nil
				local var2733, var2734 = protoModule.readBuffer(p102, var2725)
				var2725 = var2734
				var2724.moment_id = buffer.tostring(var2733)
			elseif var2730 == 2 then
				local _ = nil
				local var2735, var2736 = protoModule.readBuffer(p102, var2725)
				var2725 = var2736
				var2724.video_asset_id = buffer.tostring(var2735)
			elseif var2730 == 3 then
				local _ = nil
				local var2737, var2738 = protoModule.readBuffer(p102, var2725)
				var2725 = var2738
				var2724.target_universe_id = buffer.tostring(var2737)
			elseif var2730 == 4 then
				local _ = nil
				local var2739, var2740 = protoModule.readBuffer(p102, var2725)
				var2725 = var2740
				var2724.target_place_id = buffer.tostring(var2739)
			elseif var2730 == 5 then
				local _ = nil
				local var2741, var2742 = protoModule.readBuffer(p102, var2725)
				var2725 = var2742
				var2724.feed_item_id = buffer.tostring(var2741)
			elseif var2730 == 6 then
				local _ = nil
				local var2743, var2744 = protoModule.readBuffer(p102, var2725)
				var2725 = var2744
				var2724.capture_universe_id = buffer.tostring(var2743)
			else
				local _ = nil
				local var2745, var2746 = protoModule.readVarInt(p102, var2725)
				var2725 = var2746 + var2745
			end
		elseif var2726 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2747, var2748 = protoModule.readFixed32(p102, var2725)
			local _ = var2747
			var2725 = var2748
		elseif var2726 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2749, var2750 = protoModule.readFixed64(p102, var2725)
			local _ = var2749
			var2725 = var2750
		else
			error("Unsupported wire type: " .. var4035)
		end
	end
	return var2724
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
	local var2751 = t_102.new()
	
	if self.moment_id ~= nil then
		var2751.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var2751.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var2751.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2751.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var2751.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var2751.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var2751.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var2751.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var2751.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var2751.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var2751.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var2751.capture_universe_id = self.captureUniverseId
	end
	return var2751
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
	local var2751 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2752, var2753 = protoModule.writeTag(buff, var2751, 1, protoModule.wireTypes.lengthDelimited)
		var2752, var4065 = protoModule.writeString(var2752, var2753, self.title)
		buff = var2752
		var2751 = var2753
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2754, var2755 = protoModule.writeTag(buff, var2751, 2, protoModule.wireTypes.lengthDelimited)
		var2754, var4067 = protoModule.writeString(var2754, var2755, self.subtitle)
		buff = var2754
		var2751 = var2755
	end
	local buff_1 = buffer.create(var2751)
	buffer.copy(buff_1, 0, buff, 0, var2751)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref)
	local var2751 = t_103.new()
	local var2752 = 0
	while var2752 < buffer.len(p103) do
		local _ = nil
		local var2753 = nil
		local var2754, var2755, var2756 = protoModule.readTag(p103, var2752)
		local var2757 = var2754
		var2753 = var2755
		var2752 = var2756
		
		if var2753 == protoModule.wireTypes.varint then
			local _ = nil
			local var2758, var2759 = protoModule.readVarInt(p103, var2752)
			local _ = var2758
			var2752 = var2759
			continue
		end
		if var2753 == protoModule.wireTypes.lengthDelimited then
			if var2757 == 1 then
				local _ = nil
				local var2760, var2761 = protoModule.readBuffer(p103, var2752)
				var2752 = var2761
				var2751.title = buffer.tostring(var2760)
			elseif var2757 == 2 then
				local _ = nil
				local var2762, var2763 = protoModule.readBuffer(p103, var2752)
				var2752 = var2763
				var2751.subtitle = buffer.tostring(var2762)
			else
				local _ = nil
				local var2764, var2765 = protoModule.readVarInt(p103, var2752)
				var2752 = var2765 + var2764
			end
		elseif var2753 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2766, var2767 = protoModule.readFixed32(p103, var2752)
			local _ = var2766
			var2752 = var2767
		elseif var2753 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2768, var2769 = protoModule.readFixed64(p103, var2752)
			local _ = var2768
			var2752 = var2769
		else
			error("Unsupported wire type: " .. var4071)
		end
	end
	return var2751
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
	local var2770 = t_103.new()
	
	if self.title ~= nil then
		var2770.title = self.title
	end
	if self.subtitle ~= nil then
		var2770.subtitle = self.subtitle
	end
	return var2770
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
	local var2770 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var2771, var2772 = protoModule.writeTag(buff, var2770, 1, protoModule.wireTypes.lengthDelimited)
		var2771, var4093 = protoModule.writeString(var2771, var2772, self.primary_cta_button_text)
		buff = var2771
		var2770 = var2772
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var2773, var2774 = protoModule.writeTag(buff, var2770, 2, protoModule.wireTypes.lengthDelimited)
		var2773, var4095 = protoModule.writeString(var2773, var2774, self.secondary_cta_button_text)
		buff = var2773
		var2770 = var2774
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var2775, var2776 = protoModule.writeTag(buff, var2770, 3, protoModule.wireTypes.lengthDelimited)
		var2775, var4097 = protoModule.writeString(var2775, var2776, self.primary_cta_type)
		buff = var2775
		var2770 = var2776
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var2777, var2778 = protoModule.writeTag(buff, var2770, 4, protoModule.wireTypes.lengthDelimited)
		var2777, var4099 = protoModule.writeString(var2777, var2778, self.secondary_cta_type)
		buff = var2777
		var2770 = var2778
	end
	local buff_1 = buffer.create(var2770)
	buffer.copy(buff_1, 0, buff, 0, var2770)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2770 = t_104.new()
	local var2771 = 0
	while var2771 < buffer.len(p104) do
		local _ = nil
		local var2772 = nil
		local var2773, var2774, var2775 = protoModule.readTag(p104, var2771)
		local var2776 = var2773
		var2772 = var2774
		var2771 = var2775
		
		if var2772 == protoModule.wireTypes.varint then
			local _ = nil
			local var2777, var2778 = protoModule.readVarInt(p104, var2771)
			local _ = var2777
			var2771 = var2778
			continue
		end
		if var2772 == protoModule.wireTypes.lengthDelimited then
			if var2776 == 1 then
				local _ = nil
				local var2779, var2780 = protoModule.readBuffer(p104, var2771)
				var2771 = var2780
				var2770.primary_cta_button_text = buffer.tostring(var2779)
			elseif var2776 == 2 then
				local _ = nil
				local var2781, var2782 = protoModule.readBuffer(p104, var2771)
				var2771 = var2782
				var2770.secondary_cta_button_text = buffer.tostring(var2781)
			elseif var2776 == 3 then
				local _ = nil
				local var2783, var2784 = protoModule.readBuffer(p104, var2771)
				var2771 = var2784
				var2770.primary_cta_type = buffer.tostring(var2783)
			elseif var2776 == 4 then
				local _ = nil
				local var2785, var2786 = protoModule.readBuffer(p104, var2771)
				var2771 = var2786
				var2770.secondary_cta_type = buffer.tostring(var2785)
			else
				local _ = nil
				local var2787, var2788 = protoModule.readVarInt(p104, var2771)
				var2771 = var2788 + var2787
			end
		elseif var2772 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2789, var2790 = protoModule.readFixed32(p104, var2771)
			local _ = var2789
			var2771 = var2790
		elseif var2772 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2791, var2792 = protoModule.readFixed64(p104, var2771)
			local _ = var2791
			var2771 = var2792
		else
			error("Unsupported wire type: " .. var4103)
		end
	end
	return var2770
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
	local var2793 = t_104.new()
	
	if self.primary_cta_button_text ~= nil then
		var2793.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var2793.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var2793.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var2793.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var2793.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var2793.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var2793.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var2793.secondary_cta_type = self.secondaryCtaType
	end
	return var2793
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
	local var2793 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2794, var2795 = protoModule.writeTag(buff, var2793, 1, protoModule.wireTypes.lengthDelimited)
		var2794, var4129 = protoModule.writeString(var2794, var2795, self.image_asset_id)
		buff = var2794
		var2793 = var2795
	end
	local buff_1 = buffer.create(var2793)
	buffer.copy(buff_1, 0, buff, 0, var2793)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2793 = t_105.new()
	local var2794 = 0
	while var2794 < buffer.len(p105) do
		local _ = nil
		local var2795 = nil
		local var2796, var2797, var2798 = protoModule.readTag(p105, var2794)
		local var2799 = var2796
		var2795 = var2797
		var2794 = var2798
		
		if var2795 == protoModule.wireTypes.varint then
			local _ = nil
			local var2800, var2801 = protoModule.readVarInt(p105, var2794)
			local _ = var2800
			var2794 = var2801
			continue
		end
		if var2795 == protoModule.wireTypes.lengthDelimited then
			if var2799 == 1 then
				local _ = nil
				local var2802, var2803 = protoModule.readBuffer(p105, var2794)
				var2794 = var2803
				var2793.image_asset_id = buffer.tostring(var2802)
			else
				local _ = nil
				local var2804, var2805 = protoModule.readVarInt(p105, var2794)
				var2794 = var2805 + var2804
			end
		elseif var2795 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2806, var2807 = protoModule.readFixed32(p105, var2794)
			local _ = var2806
			var2794 = var2807
		elseif var2795 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2808, var2809 = protoModule.readFixed64(p105, var2794)
			local _ = var2808
			var2794 = var2809
		else
			error("Unsupported wire type: " .. var4133)
		end
	end
	return var2793
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
	local var2810 = t_105.new()
	
	if self.image_asset_id ~= nil then
		var2810.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var2810.image_asset_id = self.imageAssetId
	end
	return var2810
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
	local var2810 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2811, var2812 = protoModule.writeTag(buff, var2810, 1, protoModule.wireTypes.lengthDelimited)
		var2811, var4153 = protoModule.writeString(var2811, var2812, self.video_asset_id)
		buff = var2811
		var2810 = var2812
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var2813, var2814 = protoModule.writeTag(buff, var2810, 2, protoModule.wireTypes.lengthDelimited)
		var2813, var4155 = protoModule.writeString(var2813, var2814, self.loading_image_asset_id)
		buff = var2813
		var2810 = var2814
	end
	local buff_1 = buffer.create(var2810)
	buffer.copy(buff_1, 0, buff, 0, var2810)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var2810 = t_106.new()
	local var2811 = 0
	while var2811 < buffer.len(p106) do
		local _ = nil
		local var2812 = nil
		local var2813, var2814, var2815 = protoModule.readTag(p106, var2811)
		local var2816 = var2813
		var2812 = var2814
		var2811 = var2815
		
		if var2812 == protoModule.wireTypes.varint then
			local _ = nil
			local var2817, var2818 = protoModule.readVarInt(p106, var2811)
			local _ = var2817
			var2811 = var2818
			continue
		end
		if var2812 == protoModule.wireTypes.lengthDelimited then
			if var2816 == 1 then
				local _ = nil
				local var2819, var2820 = protoModule.readBuffer(p106, var2811)
				var2811 = var2820
				var2810.video_asset_id = buffer.tostring(var2819)
			elseif var2816 == 2 then
				local _ = nil
				local var2821, var2822 = protoModule.readBuffer(p106, var2811)
				var2811 = var2822
				var2810.loading_image_asset_id = buffer.tostring(var2821)
			else
				local _ = nil
				local var2823, var2824 = protoModule.readVarInt(p106, var2811)
				var2811 = var2824 + var2823
			end
		elseif var2812 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2825, var2826 = protoModule.readFixed32(p106, var2811)
			local _ = var2825
			var2811 = var2826
		elseif var2812 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2827, var2828 = protoModule.readFixed64(p106, var2811)
			local _ = var2827
			var2811 = var2828
		else
			error("Unsupported wire type: " .. var4159)
		end
	end
	return var2810
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
	local var2829 = t_106.new()
	
	if self.video_asset_id ~= nil then
		var2829.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2829.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var2829.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var2829.loading_image_asset_id = self.loadingImageAssetId
	end
	return var2829
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
	local var2829 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var2830, var2831 = protoModule.writeTag(buff, var2829, 1, protoModule.wireTypes.lengthDelimited)
		var2830, var4181 = protoModule.writeString(var2830, var2831, self.text)
		buff = var2830
		var2829 = var2831
	end
	if self.is_rendered_text then
		local var2832, var2833 = protoModule.writeTag(buff, var2829, 2, protoModule.wireTypes.varint)
		var2832, var4183 = protoModule.writeVarInt(var2832, var2833, if self.is_rendered_text then 1 else 0)
		buff = var2832
		var2829 = var2833
	end
	local buff_1 = buffer.create(var2829)
	buffer.copy(buff_1, 0, buff, 0, var2829)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2829 = t_107.new()
	local var2830 = 0
	while var2830 < buffer.len(p107) do
		local _ = nil
		local var2831 = nil
		local var2832, var2833, var2834 = protoModule.readTag(p107, var2830)
		local var2835 = var2832
		var2831 = var2833
		var2830 = var2834
		
		if var2831 == protoModule.wireTypes.varint then
			if var2835 == 2 then
				local _ = nil
				local var2836, var2837 = protoModule.readVarInt(p107, var2830)
				var2830 = var2837
				var2829.is_rendered_text = var2836 ~= 0
			else
				local _ = nil
				local var2838, var2839 = protoModule.readVarInt(p107, var2830)
				local _ = var2838
				var2830 = var2839
			end
		end
		if var2831 == protoModule.wireTypes.lengthDelimited then
			if var2835 == 1 then
				local _ = nil
				local var2840, var2841 = protoModule.readBuffer(p107, var2830)
				var2830 = var2841
				var2829.text = buffer.tostring(var2840)
			else
				local _ = nil
				local var2842, var2843 = protoModule.readVarInt(p107, var2830)
				var2830 = var2843 + var2842
			end
		elseif var2831 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2844, var2845 = protoModule.readFixed32(p107, var2830)
			local _ = var2844
			var2830 = var2845
		elseif var2831 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2846, var2847 = protoModule.readFixed64(p107, var2830)
			local _ = var2846
			var2830 = var2847
		else
			error("Unsupported wire type: " .. var4187)
		end
	end
	return var2829
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
	local var2848 = t_107.new()
	
	if self.text ~= nil then
		var2848.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var2848.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var2848.is_rendered_text = self.isRenderedText
	end
	return var2848
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
	local var2848 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2849, var2850 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2849, var4209 = protoModule.writeString(var2849, var2850, i)
			local var2851 = v:encode()
			var2850, var4211 = protoModule.writeTag(var2849, var2850, 2, protoModule.wireTypes.lengthDelimited)
			var2850, var4211 = protoModule.writeBuffer(var2850, var4211, var2851, buffer.len(var2851))
			local var2852 = var2850
			local var2853 = var4211
			local var2854, var2855 = protoModule.writeTag(buff, var2848, 1, protoModule.wireTypes.lengthDelimited)
			var2854, var4215 = protoModule.writeBuffer(var2854, var2855, var2852, var2853)
			buff = var2854
			var2848 = var2855
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2856, var2857 = protoModule.writeTag(buff, var2848, 2, protoModule.wireTypes.lengthDelimited)
			var2856, var4217 = protoModule.writeString(var2856, var2857, v)
			buff = var2856
			var2848 = var2857
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var2858, var2859 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2858, var4219 = protoModule.writeString(var2858, var2859, i)
			local var2860 = v:encode()
			var2859, var4221 = protoModule.writeTag(var2858, var2859, 2, protoModule.wireTypes.lengthDelimited)
			var2859, var4221 = protoModule.writeBuffer(var2859, var4221, var2860, buffer.len(var2860))
			local var2861 = var2859
			local var2862 = var4221
			local var2863, var2864 = protoModule.writeTag(buff, var2848, 3, protoModule.wireTypes.lengthDelimited)
			var2863, var4225 = protoModule.writeBuffer(var2863, var2864, var2861, var2862)
			buff = var2863
			var2848 = var2864
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2865, var2866 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2865, var4227 = protoModule.writeString(var2865, var2866, i)
			local var2867 = v:encode()
			var2866, var4229 = protoModule.writeTag(var2865, var2866, 2, protoModule.wireTypes.lengthDelimited)
			var2866, var4229 = protoModule.writeBuffer(var2866, var4229, var2867, buffer.len(var2867))
			local var2868 = var2866
			local var2869 = var4229
			local var2870, var2871 = protoModule.writeTag(buff, var2848, 4, protoModule.wireTypes.lengthDelimited)
			var2870, var4233 = protoModule.writeBuffer(var2870, var2871, var2868, var2869)
			buff = var2870
			var2848 = var2871
		end
	end
	local buff_1 = buffer.create(var2848)
	buffer.copy(buff_1, 0, buff, 0, var2848)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var2872 = t_108.new()
	local var2873 = 0
	while var2873 < buffer.len(p108) do
		local _ = nil
		local var2874 = nil
		local var2875, var2876, var2877 = protoModule.readTag(p108, var2873)
		local var2878 = var2875
		var2874 = var2876
		var2873 = var2877
		
		if var2874 == protoModule.wireTypes.varint then
			local _ = nil
			local var2879, var2880 = protoModule.readVarInt(p108, var2873)
			local _ = var2879
			var2873 = var2880
			continue
		end
		if var2874 == protoModule.wireTypes.lengthDelimited then
			if var2878 == 1 then
				local _ = nil
				local var2881, var2882 = protoModule.readBuffer(p108, var2873)
				var2873 = var2882
				var2881 = t.VerticalFeedInputData_EntryMapEntry.decode(var2881)
				var2872.entry_map[var2881.key or ""] = var2881.value or t.FeedEntry.new()
			elseif var2878 == 2 then
				local _ = nil
				local var2883, var2884 = protoModule.readBuffer(p108, var2873)
				var2873 = var2884
				table.insert(var2872.entry_order, buffer.tostring(var2883))
			elseif var2878 == 3 then
				local _ = nil
				local var2885, var2886 = protoModule.readBuffer(p108, var2873)
				var2873 = var2886
				var2885 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var2885)
				var2872.entry_order_map[var2885.key or ""] = var2885.value or t.EntryOrder.new()
			elseif var2878 == 4 then
				local _ = nil
				local var2887, var2888 = protoModule.readBuffer(p108, var2873)
				var2873 = var2888
				var2887 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var2887)
				var2872.content_pools[var2887.key or ""] = var2887.value or t.ContentPool.new()
			else
				local _ = nil
				local var2889, var2890 = protoModule.readVarInt(p108, var2873)
				var2873 = var2890 + var2889
			end
		elseif var2874 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2891, var2892 = protoModule.readFixed32(p108, var2873)
			local _ = var2891
			var2873 = var2892
		elseif var2874 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2893, var2894 = protoModule.readFixed64(p108, var2873)
			local _ = var2893
			var2873 = var2894
		else
			error("Unsupported wire type: " .. var4237)
		end
	end
	return var2872
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
	local var2895 = t_108.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2895.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2895.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2895.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2895.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var2895.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var2895.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2895.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2895.content_pools = t_1
	end
	return var2895
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
	local var2896 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2897, var2898 = protoModule.writeTag(buff, var2896, 1, protoModule.wireTypes.lengthDelimited)
		var2897, var4275 = protoModule.writeString(var2897, var2898, self.key)
		buff = var2897
		var2896 = var2898
	end
	if self.value ~= nil then
		local var2899 = self.value:encode()
		local var2900, var2901 = protoModule.writeTag(buff, var2896, 2, protoModule.wireTypes.lengthDelimited)
		var2900, var4278 = protoModule.writeBuffer(var2900, var2901, var2899, buffer.len(var2899))
		buff = var2900
		var2896 = var2901
	end
	local buff_1 = buffer.create(var2896)
	buffer.copy(buff_1, 0, buff, 0, var2896)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var2896 = t_109.new()
	local var2897 = 0
	while var2897 < buffer.len(p109) do
		local _ = nil
		local var2898 = nil
		local var2899, var2900, var2901 = protoModule.readTag(p109, var2897)
		local var2902 = var2899
		var2898 = var2900
		var2897 = var2901
		
		if var2898 == protoModule.wireTypes.varint then
			local _ = nil
			local var2903, var2904 = protoModule.readVarInt(p109, var2897)
			local _ = var2903
			var2897 = var2904
			continue
		end
		if var2898 == protoModule.wireTypes.lengthDelimited then
			if var2902 == 1 then
				local _ = nil
				local var2905, var2906 = protoModule.readBuffer(p109, var2897)
				var2897 = var2906
				var2896.key = buffer.tostring(var2905)
			elseif var2902 == 2 then
				local _ = nil
				local var2907, var2908 = protoModule.readBuffer(p109, var2897)
				var2897 = var2908
				var2896.value = t.FeedEntry.decode(var2907)
			else
				local _ = nil
				local var2909, var2910 = protoModule.readVarInt(p109, var2897)
				var2897 = var2910 + var2909
			end
		elseif var2898 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2911, var2912 = protoModule.readFixed32(p109, var2897)
			local _ = var2911
			var2897 = var2912
		elseif var2898 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2913, var2914 = protoModule.readFixed64(p109, var2897)
			local _ = var2913
			var2897 = var2914
		else
			error("Unsupported wire type: " .. var4282)
		end
	end
	return var2896
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
	local var2915 = t_109.new()
	
	if self.key ~= nil then
		var2915.key = self.key
	end
	if self.value ~= nil then
		var2915.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2915
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
	local var2915 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2916, var2917 = protoModule.writeTag(buff, var2915, 1, protoModule.wireTypes.lengthDelimited)
		var2916, var4304 = protoModule.writeString(var2916, var2917, self.key)
		buff = var2916
		var2915 = var2917
	end
	if self.value ~= nil then
		local var2918 = self.value:encode()
		local var2919, var2920 = protoModule.writeTag(buff, var2915, 2, protoModule.wireTypes.lengthDelimited)
		var2919, var4307 = protoModule.writeBuffer(var2919, var2920, var2918, buffer.len(var2918))
		buff = var2919
		var2915 = var2920
	end
	local buff_1 = buffer.create(var2915)
	buffer.copy(buff_1, 0, buff, 0, var2915)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var2915 = t_110.new()
	local var2916 = 0
	while var2916 < buffer.len(p110) do
		local _ = nil
		local var2917 = nil
		local var2918, var2919, var2920 = protoModule.readTag(p110, var2916)
		local var2921 = var2918
		var2917 = var2919
		var2916 = var2920
		
		if var2917 == protoModule.wireTypes.varint then
			local _ = nil
			local var2922, var2923 = protoModule.readVarInt(p110, var2916)
			local _ = var2922
			var2916 = var2923
			continue
		end
		if var2917 == protoModule.wireTypes.lengthDelimited then
			if var2921 == 1 then
				local _ = nil
				local var2924, var2925 = protoModule.readBuffer(p110, var2916)
				var2916 = var2925
				var2915.key = buffer.tostring(var2924)
			elseif var2921 == 2 then
				local _ = nil
				local var2926, var2927 = protoModule.readBuffer(p110, var2916)
				var2916 = var2927
				var2915.value = t.EntryOrder.decode(var2926)
			else
				local _ = nil
				local var2928, var2929 = protoModule.readVarInt(p110, var2916)
				var2916 = var2929 + var2928
			end
		elseif var2917 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2930, var2931 = protoModule.readFixed32(p110, var2916)
			local _ = var2930
			var2916 = var2931
		elseif var2917 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2932, var2933 = protoModule.readFixed64(p110, var2916)
			local _ = var2932
			var2916 = var2933
		else
			error("Unsupported wire type: " .. var4311)
		end
	end
	return var2915
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
	local var2934 = t_110.new()
	
	if self.key ~= nil then
		var2934.key = self.key
	end
	if self.value ~= nil then
		var2934.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var2934
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
	local var2934 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2935, var2936 = protoModule.writeTag(buff, var2934, 1, protoModule.wireTypes.lengthDelimited)
		var2935, var4333 = protoModule.writeString(var2935, var2936, self.key)
		buff = var2935
		var2934 = var2936
	end
	if self.value ~= nil then
		local var2937 = self.value:encode()
		local var2938, var2939 = protoModule.writeTag(buff, var2934, 2, protoModule.wireTypes.lengthDelimited)
		var2938, var4336 = protoModule.writeBuffer(var2938, var2939, var2937, buffer.len(var2937))
		buff = var2938
		var2934 = var2939
	end
	local buff_1 = buffer.create(var2934)
	buffer.copy(buff_1, 0, buff, 0, var2934)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var2934 = t_111.new()
	local var2935 = 0
	while var2935 < buffer.len(p111) do
		local _ = nil
		local var2936 = nil
		local var2937, var2938, var2939 = protoModule.readTag(p111, var2935)
		local var2940 = var2937
		var2936 = var2938
		var2935 = var2939
		
		if var2936 == protoModule.wireTypes.varint then
			local _ = nil
			local var2941, var2942 = protoModule.readVarInt(p111, var2935)
			local _ = var2941
			var2935 = var2942
			continue
		end
		if var2936 == protoModule.wireTypes.lengthDelimited then
			if var2940 == 1 then
				local _ = nil
				local var2943, var2944 = protoModule.readBuffer(p111, var2935)
				var2935 = var2944
				var2934.key = buffer.tostring(var2943)
			elseif var2940 == 2 then
				local _ = nil
				local var2945, var2946 = protoModule.readBuffer(p111, var2935)
				var2935 = var2946
				var2934.value = t.ContentPool.decode(var2945)
			else
				local _ = nil
				local var2947, var2948 = protoModule.readVarInt(p111, var2935)
				var2935 = var2948 + var2947
			end
		elseif var2936 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2949, var2950 = protoModule.readFixed32(p111, var2935)
			local _ = var2949
			var2935 = var2950
		elseif var2936 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2951, var2952 = protoModule.readFixed64(p111, var2935)
			local _ = var2951
			var2935 = var2952
		else
			error("Unsupported wire type: " .. var4340)
		end
	end
	return var2934
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
	local var2953 = t_111.new()
	
	if self.key ~= nil then
		var2953.key = self.key
	end
	if self.value ~= nil then
		var2953.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2953
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
	local var2953 = 0
	
	if self.foreground_header_entry ~= nil then
		local var2954 = self.foreground_header_entry:encode()
		local var2955, var2956 = protoModule.writeTag(buff, var2953, 1, protoModule.wireTypes.lengthDelimited)
		var2955, var4363 = protoModule.writeBuffer(var2955, var2956, var2954, buffer.len(var2954))
		buff = var2955
		var2953 = var2956
	end
	if self.background_header_entry ~= nil then
		local var2957 = self.background_header_entry:encode()
		local var2958, var2959 = protoModule.writeTag(buff, var2953, 2, protoModule.wireTypes.lengthDelimited)
		var2958, var4366 = protoModule.writeBuffer(var2958, var2959, var2957, buffer.len(var2957))
		buff = var2958
		var2953 = var2959
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var2960, var2961 = protoModule.writeTag(buff, var2953, 3, protoModule.wireTypes.lengthDelimited)
		var2960, var4368 = protoModule.writeString(var2960, var2961, self.layout_variant)
		buff = var2960
		var2953 = var2961
	end
	local buff_1 = buffer.create(var2953)
	buffer.copy(buff_1, 0, buff, 0, var2953)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var2953 = t_112.new()
	local var2954 = 0
	while var2954 < buffer.len(p112) do
		local _ = nil
		local var2955 = nil
		local var2956, var2957, var2958 = protoModule.readTag(p112, var2954)
		local var2959 = var2956
		var2955 = var2957
		var2954 = var2958
		
		if var2955 == protoModule.wireTypes.varint then
			local _ = nil
			local var2960, var2961 = protoModule.readVarInt(p112, var2954)
			local _ = var2960
			var2954 = var2961
			continue
		end
		if var2955 == protoModule.wireTypes.lengthDelimited then
			if var2959 == 1 then
				local _ = nil
				local var2962, var2963 = protoModule.readBuffer(p112, var2954)
				var2954 = var2963
				var2953.foreground_header_entry = t.ForegroundHeaderEntry.decode(var2962)
			elseif var2959 == 2 then
				local _ = nil
				local var2964, var2965 = protoModule.readBuffer(p112, var2954)
				var2954 = var2965
				var2953.background_header_entry = t.BackgroundHeaderEntry.decode(var2964)
			elseif var2959 == 3 then
				local _ = nil
				local var2966, var2967 = protoModule.readBuffer(p112, var2954)
				var2954 = var2967
				var2953.layout_variant = buffer.tostring(var2966)
			else
				local _ = nil
				local var2968, var2969 = protoModule.readVarInt(p112, var2954)
				var2954 = var2969 + var2968
			end
		elseif var2955 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2970, var2971 = protoModule.readFixed32(p112, var2954)
			local _ = var2970
			var2954 = var2971
		elseif var2955 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2972, var2973 = protoModule.readFixed64(p112, var2954)
			local _ = var2972
			var2954 = var2973
		else
			error("Unsupported wire type: " .. var4372)
		end
	end
	return var2953
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
	local var2974 = t_112.new()
	
	if self.foreground_header_entry ~= nil then
		var2974.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var2974.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var2974.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var2974.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var2974.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var2974.layout_variant = self.layoutVariant
	end
	return var2974
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
	local var2974 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var2975, var2976 = protoModule.writeTag(buff, var2974, 1, protoModule.wireTypes.lengthDelimited)
		var2975, var4396 = protoModule.writeString(var2975, var2976, self.cta_button_text)
		buff = var2975
		var2974 = var2976
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var2977, var2978 = protoModule.writeTag(buff, var2974, 2, protoModule.wireTypes.lengthDelimited)
		var2977, var4398 = protoModule.writeString(var2977, var2978, self.cta_type)
		buff = var2977
		var2974 = var2978
	end
	local buff_1 = buffer.create(var2974)
	buffer.copy(buff_1, 0, buff, 0, var2974)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref)
	local var2974 = t_113.new()
	local var2975 = 0
	while var2975 < buffer.len(p113) do
		local _ = nil
		local var2976 = nil
		local var2977, var2978, var2979 = protoModule.readTag(p113, var2975)
		local var2980 = var2977
		var2976 = var2978
		var2975 = var2979
		
		if var2976 == protoModule.wireTypes.varint then
			local _ = nil
			local var2981, var2982 = protoModule.readVarInt(p113, var2975)
			local _ = var2981
			var2975 = var2982
			continue
		end
		if var2976 == protoModule.wireTypes.lengthDelimited then
			if var2980 == 1 then
				local _ = nil
				local var2983, var2984 = protoModule.readBuffer(p113, var2975)
				var2975 = var2984
				var2974.cta_button_text = buffer.tostring(var2983)
			elseif var2980 == 2 then
				local _ = nil
				local var2985, var2986 = protoModule.readBuffer(p113, var2975)
				var2975 = var2986
				var2974.cta_type = buffer.tostring(var2985)
			else
				local _ = nil
				local var2987, var2988 = protoModule.readVarInt(p113, var2975)
				var2975 = var2988 + var2987
			end
		elseif var2976 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2989, var2990 = protoModule.readFixed32(p113, var2975)
			local _ = var2989
			var2975 = var2990
		elseif var2976 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2991, var2992 = protoModule.readFixed64(p113, var2975)
			local _ = var2991
			var2975 = var2992
		else
			error("Unsupported wire type: " .. var4402)
		end
	end
	return var2974
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
	local var2993 = t_113.new()
	
	if self.cta_button_text ~= nil then
		var2993.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var2993.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var2993.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var2993.cta_type = self.ctaType
	end
	return var2993
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
	local var2993 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2994, var2995 = protoModule.writeTag(buff, var2993, 1, protoModule.wireTypes.lengthDelimited)
		var2994, var4424 = protoModule.writeString(var2994, var2995, self.title)
		buff = var2994
		var2993 = var2995
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var2996, var2997 = protoModule.writeTag(buff, var2993, 2, protoModule.wireTypes.lengthDelimited)
		var2996, var4426 = protoModule.writeString(var2996, var2997, self.cta_button_text)
		buff = var2996
		var2993 = var2997
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2998, var2999 = protoModule.writeTag(buff, var2993, 3, protoModule.wireTypes.lengthDelimited)
		var2998, var4428 = protoModule.writeString(var2998, var2999, self.image_asset_id)
		buff = var2998
		var2993 = var2999
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3000, var3001 = protoModule.writeTag(buff, var2993, 4, protoModule.wireTypes.lengthDelimited)
		var3000, var4430 = protoModule.writeString(var3000, var3001, self.cta_type)
		buff = var3000
		var2993 = var3001
	end
	local buff_1 = buffer.create(var2993)
	buffer.copy(buff_1, 0, buff, 0, var2993)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref)
	local var2993 = t_114.new()
	local var2994 = 0
	while var2994 < buffer.len(p114) do
		local _ = nil
		local var2995 = nil
		local var2996, var2997, var2998 = protoModule.readTag(p114, var2994)
		local var2999 = var2996
		var2995 = var2997
		var2994 = var2998
		
		if var2995 == protoModule.wireTypes.varint then
			local _ = nil
			local var3000, var3001 = protoModule.readVarInt(p114, var2994)
			local _ = var3000
			var2994 = var3001
			continue
		end
		if var2995 == protoModule.wireTypes.lengthDelimited then
			if var2999 == 1 then
				local _ = nil
				local var3002, var3003 = protoModule.readBuffer(p114, var2994)
				var2994 = var3003
				var2993.title = buffer.tostring(var3002)
			elseif var2999 == 2 then
				local _ = nil
				local var3004, var3005 = protoModule.readBuffer(p114, var2994)
				var2994 = var3005
				var2993.cta_button_text = buffer.tostring(var3004)
			elseif var2999 == 3 then
				local _ = nil
				local var3006, var3007 = protoModule.readBuffer(p114, var2994)
				var2994 = var3007
				var2993.image_asset_id = buffer.tostring(var3006)
			elseif var2999 == 4 then
				local _ = nil
				local var3008, var3009 = protoModule.readBuffer(p114, var2994)
				var2994 = var3009
				var2993.cta_type = buffer.tostring(var3008)
			else
				local _ = nil
				local var3010, var3011 = protoModule.readVarInt(p114, var2994)
				var2994 = var3011 + var3010
			end
		elseif var2995 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3012, var3013 = protoModule.readFixed32(p114, var2994)
			local _ = var3012
			var2994 = var3013
		elseif var2995 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3014, var3015 = protoModule.readFixed64(p114, var2994)
			local _ = var3014
			var2994 = var3015
		else
			error("Unsupported wire type: " .. var4434)
		end
	end
	return var2993
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
	local var3016 = t_114.new()
	
	if self.title ~= nil then
		var3016.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3016.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3016.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3016.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3016.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3016.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3016.cta_type = self.ctaType
	end
	return var3016
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
	local var3016 = 0
	
	if self.universe_id ~= nil then
		local var3017, var3018 = protoModule.writeTag(buff, var3016, 1, protoModule.wireTypes.lengthDelimited)
		var3017, var4460 = protoModule.writeString(var3017, var3018, self.universe_id)
		buff = var3017
		var3016 = var3018
	end
	if self.title ~= nil then
		local var3019, var3020 = protoModule.writeTag(buff, var3016, 2, protoModule.wireTypes.lengthDelimited)
		var3019, var4462 = protoModule.writeString(var3019, var3020, self.title)
		buff = var3019
		var3016 = var3020
	end
	if self.subtitle ~= nil then
		local var3021, var3022 = protoModule.writeTag(buff, var3016, 3, protoModule.wireTypes.lengthDelimited)
		var3021, var4464 = protoModule.writeString(var3021, var3022, self.subtitle)
		buff = var3021
		var3016 = var3022
	end
	if self.badge_text ~= nil then
		local var3023, var3024 = protoModule.writeTag(buff, var3016, 4, protoModule.wireTypes.lengthDelimited)
		var3023, var4466 = protoModule.writeString(var3023, var3024, self.badge_text)
		buff = var3023
		var3016 = var3024
	end
	if self.foreground ~= nil then
		local var3025 = self.foreground:encode()
		local var3026, var3027 = protoModule.writeTag(buff, var3016, 5, protoModule.wireTypes.lengthDelimited)
		var3026, var4469 = protoModule.writeBuffer(var3026, var3027, var3025, buffer.len(var3025))
		buff = var3026
		var3016 = var3027
	end
	if self.background ~= nil then
		local var3028 = self.background:encode()
		local var3029, var3030 = protoModule.writeTag(buff, var3016, 6, protoModule.wireTypes.lengthDelimited)
		var3029, var4472 = protoModule.writeBuffer(var3029, var3030, var3028, buffer.len(var3028))
		buff = var3029
		var3016 = var3030
	end
	if self.title_image ~= nil then
		local var3031 = self.title_image:encode()
		local var3032, var3033 = protoModule.writeTag(buff, var3016, 7, protoModule.wireTypes.lengthDelimited)
		var3032, var4475 = protoModule.writeBuffer(var3032, var3033, var3031, buffer.len(var3031))
		buff = var3032
		var3016 = var3033
	end
	if self.asset_title ~= nil then
		local var3034, var3035 = protoModule.writeTag(buff, var3016, 8, protoModule.wireTypes.lengthDelimited)
		var3034, var4477 = protoModule.writeString(var3034, var3035, self.asset_title)
		buff = var3034
		var3016 = var3035
	end
	if self.asset_subtitle ~= nil then
		local var3036, var3037 = protoModule.writeTag(buff, var3016, 9, protoModule.wireTypes.lengthDelimited)
		var3036, var4479 = protoModule.writeString(var3036, var3037, self.asset_subtitle)
		buff = var3036
		var3016 = var3037
	end
	if self.gradient ~= nil then
		local var3038 = self.gradient:encode()
		local var3039, var3040 = protoModule.writeTag(buff, var3016, 10, protoModule.wireTypes.lengthDelimited)
		var3039, var4482 = protoModule.writeBuffer(var3039, var3040, var3038, buffer.len(var3038))
		buff = var3039
		var3016 = var3040
	end
	if self.playable_text ~= nil then
		local var3041, var3042 = protoModule.writeTag(buff, var3016, 11, protoModule.wireTypes.lengthDelimited)
		var3041, var4484 = protoModule.writeString(var3041, var3042, self.playable_text)
		buff = var3041
		var3016 = var3042
	end
	local buff_1 = buffer.create(var3016)
	buffer.copy(buff_1, 0, buff, 0, var3016)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var3016 = t_115.new()
	local var3017 = 0
	while var3017 < buffer.len(p115) do
		local _ = nil
		local var3018 = nil
		local var3019, var3020, var3021 = protoModule.readTag(p115, var3017)
		local var3022 = var3019
		var3018 = var3020
		var3017 = var3021
		
		if var3018 == protoModule.wireTypes.varint then
			local _ = nil
			local var3023, var3024 = protoModule.readVarInt(p115, var3017)
			local _ = var3023
			var3017 = var3024
			continue
		end
		if var3018 == protoModule.wireTypes.lengthDelimited then
			if var3022 == 1 then
				local _ = nil
				local var3025, var3026 = protoModule.readBuffer(p115, var3017)
				var3017 = var3026
				var3016.universe_id = buffer.tostring(var3025)
			elseif var3022 == 2 then
				local _ = nil
				local var3027, var3028 = protoModule.readBuffer(p115, var3017)
				var3017 = var3028
				var3016.title = buffer.tostring(var3027)
			elseif var3022 == 3 then
				local _ = nil
				local var3029, var3030 = protoModule.readBuffer(p115, var3017)
				var3017 = var3030
				var3016.subtitle = buffer.tostring(var3029)
			elseif var3022 == 4 then
				local _ = nil
				local var3031, var3032 = protoModule.readBuffer(p115, var3017)
				var3017 = var3032
				var3016.badge_text = buffer.tostring(var3031)
			elseif var3022 == 5 then
				local _ = nil
				local var3033, var3034 = protoModule.readBuffer(p115, var3017)
				var3017 = var3034
				var3016.foreground = t.HeroUnitInputData_VisualAsset.decode(var3033)
			elseif var3022 == 6 then
				local _ = nil
				local var3035, var3036 = protoModule.readBuffer(p115, var3017)
				var3017 = var3036
				var3016.background = t.HeroUnitInputData_VisualAsset.decode(var3035)
			elseif var3022 == 7 then
				local _ = nil
				local var3037, var3038 = protoModule.readBuffer(p115, var3017)
				var3017 = var3038
				var3016.title_image = t.HeroUnitInputData_VisualAsset.decode(var3037)
			elseif var3022 == 8 then
				local _ = nil
				local var3039, var3040 = protoModule.readBuffer(p115, var3017)
				var3017 = var3040
				var3016.asset_title = buffer.tostring(var3039)
			elseif var3022 == 9 then
				local _ = nil
				local var3041, var3042 = protoModule.readBuffer(p115, var3017)
				var3017 = var3042
				var3016.asset_subtitle = buffer.tostring(var3041)
			elseif var3022 == 10 then
				local _ = nil
				local var3043, var3044 = protoModule.readBuffer(p115, var3017)
				var3017 = var3044
				var3016.gradient = t.HeroUnitInputData_Gradient.decode(var3043)
			elseif var3022 == 11 then
				local _ = nil
				local var3045, var3046 = protoModule.readBuffer(p115, var3017)
				var3017 = var3046
				var3016.playable_text = buffer.tostring(var3045)
			else
				local _ = nil
				local var3047, var3048 = protoModule.readVarInt(p115, var3017)
				var3017 = var3048 + var3047
			end
		elseif var3018 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3049, var3050 = protoModule.readFixed32(p115, var3017)
			local _ = var3049
			var3017 = var3050
		elseif var3018 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3051, var3052 = protoModule.readFixed64(p115, var3017)
			local _ = var3051
			var3017 = var3052
		else
			error("Unsupported wire type: " .. var4488)
		end
	end
	return var3016
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
	local var3053 = t_115.new()
	
	if self.universe_id ~= nil then
		var3053.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3053.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3053.title = self.title
	end
	if self.subtitle ~= nil then
		var3053.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3053.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3053.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3053.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3053.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3053.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3053.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3053.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3053.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3053.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3053.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3053.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3053.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3053.playable_text = self.playableText
	end
	return var3053
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
	local var3053 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3054, var3055 = protoModule.writeTag(buff, var3053, 1, protoModule.wireTypes.lengthDelimited)
		var3054, var4528 = protoModule.writeString(var3054, var3055, self.asset_id)
		buff = var3054
		var3053 = var3055
	end
	if self.aspect_ratio ~= nil then
		local var3056, var3057 = protoModule.writeTag(buff, var3053, 2, protoModule.wireTypes.i64)
		var3056, var4530 = protoModule.writeDouble(var3056, var3057, self.aspect_ratio)
		buff = var3056
		var3053 = var3057
	end
	if self.enable_animation ~= nil then
		local var3058, var3059 = protoModule.writeTag(buff, var3053, 3, protoModule.wireTypes.varint)
		var3058, var4532 = protoModule.writeVarInt(var3058, var3059, if self.enable_animation then 1 else 0)
		buff = var3058
		var3053 = var3059
	end
	local buff_1 = buffer.create(var3053)
	buffer.copy(buff_1, 0, buff, 0, var3053)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3053 = t_116.new()
	local var3054 = 0
	while var3054 < buffer.len(p116) do
		local _ = nil
		local var3055 = nil
		local var3056, var3057, var3058 = protoModule.readTag(p116, var3054)
		local var3059 = var3056
		var3055 = var3057
		var3054 = var3058
		
		if var3055 == protoModule.wireTypes.varint then
			if var3059 == 3 then
				local _ = nil
				local var3060, var3061 = protoModule.readVarInt(p116, var3054)
				var3054 = var3061
				var3053.enable_animation = var3060 ~= 0
			else
				local _ = nil
				local var3062, var3063 = protoModule.readVarInt(p116, var3054)
				local _ = var3062
				var3054 = var3063
			end
		end
		if var3055 == protoModule.wireTypes.lengthDelimited then
			if var3059 == 1 then
				local _ = nil
				local var3064, var3065 = protoModule.readBuffer(p116, var3054)
				var3054 = var3065
				var3053.asset_id = buffer.tostring(var3064)
			else
				local _ = nil
				local var3066, var3067 = protoModule.readVarInt(p116, var3054)
				var3054 = var3067 + var3066
			end
		elseif var3055 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3068, var3069 = protoModule.readFixed32(p116, var3054)
			local _ = var3068
			var3054 = var3069
		elseif var3055 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4536)
		elseif var3059 == 2 then
			local _ = nil
			local var3070, var3071 = protoModule.readDouble(p116, var3054)
			var3054 = var3071
			var3053.aspect_ratio = var3070
		else
			local _ = nil
			local var3072, var3073 = protoModule.readFixed64(p116, var3054)
			local _ = var3072
			var3054 = var3073
		end
	end
	return var3053
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
	local var3074 = t_116.new()
	
	if self.asset_id ~= nil then
		var3074.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3074.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3074.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3074.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3074.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3074.enable_animation = self.enableAnimation
	end
	return var3074
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
	local var3074 = 0
	
	if self.start_color ~= nil then
		local var3075, var3076 = protoModule.writeTag(buff, var3074, 1, protoModule.wireTypes.lengthDelimited)
		var3075, var4560 = protoModule.writeString(var3075, var3076, self.start_color)
		buff = var3075
		var3074 = var3076
	end
	if self.end_color ~= nil then
		local var3077, var3078 = protoModule.writeTag(buff, var3074, 2, protoModule.wireTypes.lengthDelimited)
		var3077, var4562 = protoModule.writeString(var3077, var3078, self.end_color)
		buff = var3077
		var3074 = var3078
	end
	if self.start_opacity ~= nil then
		local var3079, var3080 = protoModule.writeTag(buff, var3074, 3, protoModule.wireTypes.i64)
		var3079, var4564 = protoModule.writeDouble(var3079, var3080, self.start_opacity)
		buff = var3079
		var3074 = var3080
	end
	if self.end_opacity ~= nil then
		local var3081, var3082 = protoModule.writeTag(buff, var3074, 4, protoModule.wireTypes.i64)
		var3081, var4566 = protoModule.writeDouble(var3081, var3082, self.end_opacity)
		buff = var3081
		var3074 = var3082
	end
	if self.degree ~= nil then
		local var3083, var3084 = protoModule.writeTag(buff, var3074, 5, protoModule.wireTypes.i64)
		var3083, var4568 = protoModule.writeDouble(var3083, var3084, self.degree)
		buff = var3083
		var3074 = var3084
	end
	local buff_1 = buffer.create(var3074)
	buffer.copy(buff_1, 0, buff, 0, var3074)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var3074 = t_117.new()
	local var3075 = 0
	while var3075 < buffer.len(p117) do
		local _ = nil
		local var3076 = nil
		local var3077, var3078, var3079 = protoModule.readTag(p117, var3075)
		local var3080 = var3077
		var3076 = var3078
		var3075 = var3079
		
		if var3076 == protoModule.wireTypes.varint then
			local _ = nil
			local var3081, var3082 = protoModule.readVarInt(p117, var3075)
			local _ = var3081
			var3075 = var3082
			continue
		end
		if var3076 == protoModule.wireTypes.lengthDelimited then
			if var3080 == 1 then
				local _ = nil
				local var3083, var3084 = protoModule.readBuffer(p117, var3075)
				var3075 = var3084
				var3074.start_color = buffer.tostring(var3083)
			elseif var3080 == 2 then
				local _ = nil
				local var3085, var3086 = protoModule.readBuffer(p117, var3075)
				var3075 = var3086
				var3074.end_color = buffer.tostring(var3085)
			else
				local _ = nil
				local var3087, var3088 = protoModule.readVarInt(p117, var3075)
				var3075 = var3088 + var3087
			end
		elseif var3076 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3089, var3090 = protoModule.readFixed32(p117, var3075)
			local _ = var3089
			var3075 = var3090
		elseif var3076 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4572)
		elseif var3080 == 3 then
			local _ = nil
			local var3091, var3092 = protoModule.readDouble(p117, var3075)
			var3075 = var3092
			var3074.start_opacity = var3091
		elseif var3080 == 4 then
			local _ = nil
			local var3093, var3094 = protoModule.readDouble(p117, var3075)
			var3075 = var3094
			var3074.end_opacity = var3093
		elseif var3080 == 5 then
			local _ = nil
			local var3095, var3096 = protoModule.readDouble(p117, var3075)
			var3075 = var3096
			var3074.degree = var3095
		else
			local _ = nil
			local var3097, var3098 = protoModule.readFixed64(p117, var3075)
			local _ = var3097
			var3075 = var3098
		end
	end
	return var3074
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
	local var3099 = t_117.new()
	
	if self.start_color ~= nil then
		var3099.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3099.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3099.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3099.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3099.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3099.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3099.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3099.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3099.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3099
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
	local var3099 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3100 = v:encode()
			local var3101, var3102 = protoModule.writeTag(buff, var3099, 1, protoModule.wireTypes.lengthDelimited)
			var3101, var4601 = protoModule.writeBuffer(var3101, var3102, var3100, buffer.len(var3100))
			buff = var3101
			var3099 = var3102
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3103, var3104 = protoModule.writeTag(buff, var3099, 2, protoModule.wireTypes.lengthDelimited)
		var3103, var4603 = protoModule.writeString(var3103, var3104, self.sort_id)
		buff = var3103
		var3099 = var3104
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3105, var3106 = protoModule.writeTag(buff, var3099, 3, protoModule.wireTypes.lengthDelimited)
		var3105, var4605 = protoModule.writeString(var3105, var3106, self.recommendation_request_id)
		buff = var3105
		var3099 = var3106
	end
	local buff_1 = buffer.create(var3099)
	buffer.copy(buff_1, 0, buff, 0, var3099)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var3107 = t_118.new()
	local var3108 = 0
	while var3108 < buffer.len(p118) do
		local _ = nil
		local var3109 = nil
		local var3110, var3111, var3112 = protoModule.readTag(p118, var3108)
		local var3113 = var3110
		var3109 = var3111
		var3108 = var3112
		
		if var3109 == protoModule.wireTypes.varint then
			local _ = nil
			local var3114, var3115 = protoModule.readVarInt(p118, var3108)
			local _ = var3114
			var3108 = var3115
			continue
		end
		if var3109 == protoModule.wireTypes.lengthDelimited then
			if var3113 == 1 then
				local _ = nil
				local var3116, var3117 = protoModule.readBuffer(p118, var3108)
				var3108 = var3117
				table.insert(var3107.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3116))
			elseif var3113 == 2 then
				local _ = nil
				local var3118, var3119 = protoModule.readBuffer(p118, var3108)
				var3108 = var3119
				var3107.sort_id = buffer.tostring(var3118)
			elseif var3113 == 3 then
				local _ = nil
				local var3120, var3121 = protoModule.readBuffer(p118, var3108)
				var3108 = var3121
				var3107.recommendation_request_id = buffer.tostring(var3120)
			else
				local _ = nil
				local var3122, var3123 = protoModule.readVarInt(p118, var3108)
				var3108 = var3123 + var3122
			end
		elseif var3109 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3124, var3125 = protoModule.readFixed32(p118, var3108)
			local _ = var3124
			var3108 = var3125
		elseif var3109 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3126, var3127 = protoModule.readFixed64(p118, var3108)
			local _ = var3126
			var3108 = var3127
		else
			error("Unsupported wire type: " .. var4609)
		end
	end
	return var3107
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
	local var3128 = t_118.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3128.items = t_1
	end
	if self.sort_id ~= nil then
		var3128.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3128.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3128.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3128.recommendation_request_id = self.recommendationRequestId
	end
	return var3128
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
	local var3129 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3130, var3131 = protoModule.writeTag(buff, var3129, 1, protoModule.wireTypes.lengthDelimited)
		var3130, var4635 = protoModule.writeString(var3130, var3131, self.user_id)
		buff = var3130
		var3129 = var3131
	end
	local buff_1 = buffer.create(var3129)
	buffer.copy(buff_1, 0, buff, 0, var3129)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3129 = t_119.new()
	local var3130 = 0
	while var3130 < buffer.len(p119) do
		local _ = nil
		local var3131 = nil
		local var3132, var3133, var3134 = protoModule.readTag(p119, var3130)
		local var3135 = var3132
		var3131 = var3133
		var3130 = var3134
		
		if var3131 == protoModule.wireTypes.varint then
			local _ = nil
			local var3136, var3137 = protoModule.readVarInt(p119, var3130)
			local _ = var3136
			var3130 = var3137
			continue
		end
		if var3131 == protoModule.wireTypes.lengthDelimited then
			if var3135 == 1 then
				local _ = nil
				local var3138, var3139 = protoModule.readBuffer(p119, var3130)
				var3130 = var3139
				var3129.user_id = buffer.tostring(var3138)
			else
				local _ = nil
				local var3140, var3141 = protoModule.readVarInt(p119, var3130)
				var3130 = var3141 + var3140
			end
		elseif var3131 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3142, var3143 = protoModule.readFixed32(p119, var3130)
			local _ = var3142
			var3130 = var3143
		elseif var3131 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3144, var3145 = protoModule.readFixed64(p119, var3130)
			local _ = var3144
			var3130 = var3145
		else
			error("Unsupported wire type: " .. var4639)
		end
	end
	return var3129
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
	local var3146 = t_119.new()
	
	if self.user_id ~= nil then
		var3146.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3146.user_id = self.userId
	end
	return var3146
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
	local var3146 = 0
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		local var3147, var3148 = protoModule.writeTag(buff, var3146, 1, protoModule.wireTypes.lengthDelimited)
		var3147, var4659 = protoModule.writeString(var3147, var3148, self.contact_id)
		buff = var3147
		var3146 = var3148
	end
	local buff_1 = buffer.create(var3146)
	buffer.copy(buff_1, 0, buff, 0, var3146)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3146 = t_120.new()
	local var3147 = 0
	while var3147 < buffer.len(p120) do
		local _ = nil
		local var3148 = nil
		local var3149, var3150, var3151 = protoModule.readTag(p120, var3147)
		local var3152 = var3149
		var3148 = var3150
		var3147 = var3151
		
		if var3148 == protoModule.wireTypes.varint then
			local _ = nil
			local var3153, var3154 = protoModule.readVarInt(p120, var3147)
			local _ = var3153
			var3147 = var3154
			continue
		end
		if var3148 == protoModule.wireTypes.lengthDelimited then
			if var3152 == 1 then
				local _ = nil
				local var3155, var3156 = protoModule.readBuffer(p120, var3147)
				var3147 = var3156
				var3146.contact_id = buffer.tostring(var3155)
			else
				local _ = nil
				local var3157, var3158 = protoModule.readVarInt(p120, var3147)
				var3147 = var3158 + var3157
			end
		elseif var3148 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3159, var3160 = protoModule.readFixed32(p120, var3147)
			local _ = var3159
			var3147 = var3160
		elseif var3148 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3161, var3162 = protoModule.readFixed64(p120, var3147)
			local _ = var3161
			var3147 = var3162
		else
			error("Unsupported wire type: " .. var4663)
		end
	end
	return var3146
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
	local var3163 = t_120.new()
	
	if self.contact_id ~= nil then
		var3163.contact_id = self.contact_id
	end
	if self.contactId ~= nil then
		var3163.contact_id = self.contactId
	end
	return var3163
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
	local var3163 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "user" then
			local var3164 = self.kind.value:encode()
			local var3165, var3166 = protoModule.writeTag(buff, var3163, 1, protoModule.wireTypes.lengthDelimited)
			var3165, var4684 = protoModule.writeBuffer(var3165, var3166, var3164, buffer.len(var3164))
			buff = var3165
			var3163 = var3166
		elseif self.kind.type == "contact" then
			local var3167 = self.kind.value:encode()
			local var3168, var3169 = protoModule.writeTag(buff, var3163, 2, protoModule.wireTypes.lengthDelimited)
			var3168, var4687 = protoModule.writeBuffer(var3168, var3169, var3167, buffer.len(var3167))
			buff = var3168
			var3163 = var3169
		end
	end
	if self.has_pending_friend_request then
		local var3170, var3171 = protoModule.writeTag(buff, var3163, 3, protoModule.wireTypes.varint)
		var3170, var4689 = protoModule.writeVarInt(var3170, var3171, if self.has_pending_friend_request then 1 else 0)
		buff = var3170
		var3163 = var3171
	end
	local buff_1 = buffer.create(var3163)
	buffer.copy(buff_1, 0, buff, 0, var3163)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var3163 = t_121.new()
	local var3164 = 0
	while var3164 < buffer.len(p121) do
		local _ = nil
		local var3165 = nil
		local var3166, var3167, var3168 = protoModule.readTag(p121, var3164)
		local var3169 = var3166
		var3165 = var3167
		var3164 = var3168
		
		if var3165 == protoModule.wireTypes.varint then
			if var3169 == 3 then
				local _ = nil
				local var3170, var3171 = protoModule.readVarInt(p121, var3164)
				var3164 = var3171
				var3163.has_pending_friend_request = var3170 ~= 0
			else
				local _ = nil
				local var3172, var3173 = protoModule.readVarInt(p121, var3164)
				local _ = var3172
				var3164 = var3173
			end
		end
		if var3165 == protoModule.wireTypes.lengthDelimited then
			if var3169 == 1 then
				local _ = nil
				local var3174, var3175 = protoModule.readBuffer(p121, var3164)
				var3164 = var3175
				var3163.kind = {
					type = "user",
					value = t.FriendRecommendationCarouselInputData_UserRecommendation.decode(var3174)
				}
			elseif var3169 == 2 then
				local _ = nil
				local var3176, var3177 = protoModule.readBuffer(p121, var3164)
				var3164 = var3177
				var3163.kind = {
					type = "contact",
					value = t.FriendRecommendationCarouselInputData_ContactRecommendation.decode(var3176)
				}
			else
				local _ = nil
				local var3178, var3179 = protoModule.readVarInt(p121, var3164)
				var3164 = var3179 + var3178
			end
		elseif var3165 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3180, var3181 = protoModule.readFixed32(p121, var3164)
			local _ = var3180
			var3164 = var3181
		elseif var3165 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3182, var3183 = protoModule.readFixed64(p121, var3164)
			local _ = var3182
			var3164 = var3183
		else
			error("Unsupported wire type: " .. var4693)
		end
	end
	return var3163
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
	local var3184 = t_121.new()
	
	if self.user ~= nil then
		var3184.kind = {
			type = "user",
			value = t.FriendRecommendationCarouselInputData_UserRecommendation.jsonDecode(self.user)
		}
	end
	if self.contact ~= nil then
		var3184.kind = {
			type = "contact",
			value = t.FriendRecommendationCarouselInputData_ContactRecommendation.jsonDecode(self.contact)
		}
	end
	if self.has_pending_friend_request ~= nil then
		var3184.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3184.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3184
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
	local var3184 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3185, var3186 = protoModule.writeTag(buff, var3184, 1, protoModule.wireTypes.lengthDelimited)
		var3185, var4717 = protoModule.writeString(var3185, var3186, self.selected_option)
		buff = var3185
		var3184 = var3186
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3187, var3188 = protoModule.writeTag(buff, var3184, 2, protoModule.wireTypes.lengthDelimited)
		var3187, var4719 = protoModule.writeString(var3187, var3188, self.sort_id)
		buff = var3187
		var3184 = var3188
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3189 = v:encode()
			local var3190, var3191 = protoModule.writeTag(buff, var3184, 3, protoModule.wireTypes.lengthDelimited)
			var3190, var4722 = protoModule.writeBuffer(var3190, var3191, var3189, buffer.len(var3189))
			buff = var3190
			var3184 = var3191
		end
	end
	if self.experience_carousel ~= nil then
		local var3192 = self.experience_carousel:encode()
		local var3193, var3194 = protoModule.writeTag(buff, var3184, 4, protoModule.wireTypes.lengthDelimited)
		var3193, var4725 = protoModule.writeBuffer(var3193, var3194, var3192, buffer.len(var3192))
		buff = var3193
		var3184 = var3194
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3195, var3196 = protoModule.writeTag(buff, var3184, 5, protoModule.wireTypes.lengthDelimited)
		var3195, var4727 = protoModule.writeString(var3195, var3196, self.feed_item_key)
		buff = var3195
		var3184 = var3196
	end
	local buff_1 = buffer.create(var3184)
	buffer.copy(buff_1, 0, buff, 0, var3184)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3197 = t_122.new()
	local var3198 = 0
	while var3198 < buffer.len(p122) do
		local _ = nil
		local var3199 = nil
		local var3200, var3201, var3202 = protoModule.readTag(p122, var3198)
		local var3203 = var3200
		var3199 = var3201
		var3198 = var3202
		
		if var3199 == protoModule.wireTypes.varint then
			local _ = nil
			local var3204, var3205 = protoModule.readVarInt(p122, var3198)
			local _ = var3204
			var3198 = var3205
			continue
		end
		if var3199 == protoModule.wireTypes.lengthDelimited then
			if var3203 == 1 then
				local _ = nil
				local var3206, var3207 = protoModule.readBuffer(p122, var3198)
				var3198 = var3207
				var3197.selected_option = buffer.tostring(var3206)
			elseif var3203 == 2 then
				local _ = nil
				local var3208, var3209 = protoModule.readBuffer(p122, var3198)
				var3198 = var3209
				var3197.sort_id = buffer.tostring(var3208)
			elseif var3203 == 3 then
				local _ = nil
				local var3210, var3211 = protoModule.readBuffer(p122, var3198)
				var3198 = var3211
				table.insert(var3197.options, t.SelectorOption.decode(var3210))
			elseif var3203 == 4 then
				local _ = nil
				local var3212, var3213 = protoModule.readBuffer(p122, var3198)
				var3198 = var3213
				var3197.experience_carousel = t.ExperienceCarouselInputData.decode(var3212)
			elseif var3203 == 5 then
				local _ = nil
				local var3214, var3215 = protoModule.readBuffer(p122, var3198)
				var3198 = var3215
				var3197.feed_item_key = buffer.tostring(var3214)
			else
				local _ = nil
				local var3216, var3217 = protoModule.readVarInt(p122, var3198)
				var3198 = var3217 + var3216
			end
		elseif var3199 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3218, var3219 = protoModule.readFixed32(p122, var3198)
			local _ = var3218
			var3198 = var3219
		elseif var3199 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3220, var3221 = protoModule.readFixed64(p122, var3198)
			local _ = var3220
			var3198 = var3221
		else
			error("Unsupported wire type: " .. var4731)
		end
	end
	return var3197
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
	local var3222 = t_122.new()
	
	if self.selected_option ~= nil then
		var3222.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3222.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3222.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3222.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3222.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3222.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3222.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3222.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3222.feed_item_key = self.feedItemKey
	end
	return var3222
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
	local var3223 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3224, var3225 = protoModule.writeTag(buff, var3223, 1, protoModule.wireTypes.lengthDelimited)
		var3224, var4761 = protoModule.writeString(var3224, var3225, self.id)
		buff = var3224
		var3223 = var3225
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3226, var3227 = protoModule.writeTag(buff, var3223, 2, protoModule.wireTypes.lengthDelimited)
		var3226, var4763 = protoModule.writeString(var3226, var3227, self.display_name)
		buff = var3226
		var3223 = var3227
	end
	if self.is_selected then
		local var3228, var3229 = protoModule.writeTag(buff, var3223, 3, protoModule.wireTypes.varint)
		var3228, var4765 = protoModule.writeVarInt(var3228, var3229, if self.is_selected then 1 else 0)
		buff = var3228
		var3223 = var3229
	end
	local buff_1 = buffer.create(var3223)
	buffer.copy(buff_1, 0, buff, 0, var3223)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3223 = t_123.new()
	local var3224 = 0
	while var3224 < buffer.len(p123) do
		local _ = nil
		local var3225 = nil
		local var3226, var3227, var3228 = protoModule.readTag(p123, var3224)
		local var3229 = var3226
		var3225 = var3227
		var3224 = var3228
		
		if var3225 == protoModule.wireTypes.varint then
			if var3229 == 3 then
				local _ = nil
				local var3230, var3231 = protoModule.readVarInt(p123, var3224)
				var3224 = var3231
				var3223.is_selected = var3230 ~= 0
			else
				local _ = nil
				local var3232, var3233 = protoModule.readVarInt(p123, var3224)
				local _ = var3232
				var3224 = var3233
			end
		end
		if var3225 == protoModule.wireTypes.lengthDelimited then
			if var3229 == 1 then
				local _ = nil
				local var3234, var3235 = protoModule.readBuffer(p123, var3224)
				var3224 = var3235
				var3223.id = buffer.tostring(var3234)
			elseif var3229 == 2 then
				local _ = nil
				local var3236, var3237 = protoModule.readBuffer(p123, var3224)
				var3224 = var3237
				var3223.display_name = buffer.tostring(var3236)
			else
				local _ = nil
				local var3238, var3239 = protoModule.readVarInt(p123, var3224)
				var3224 = var3239 + var3238
			end
		elseif var3225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3240, var3241 = protoModule.readFixed32(p123, var3224)
			local _ = var3240
			var3224 = var3241
		elseif var3225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3242, var3243 = protoModule.readFixed64(p123, var3224)
			local _ = var3242
			var3224 = var3243
		else
			error("Unsupported wire type: " .. var4769)
		end
	end
	return var3223
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
	local var3244 = t_123.new()
	
	if self.id ~= nil then
		var3244.id = self.id
	end
	if self.display_name ~= nil then
		var3244.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3244.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3244.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3244.is_selected = self.isSelected
	end
	return var3244
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
	local var3244 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3245 = v:encode()
			local var3246, var3247 = protoModule.writeTag(buff, var3244, 1, protoModule.wireTypes.lengthDelimited)
			var3246, var4794 = protoModule.writeBuffer(var3246, var3247, var3245, buffer.len(var3245))
			buff = var3246
			var3244 = var3247
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3248, var3249 = protoModule.writeTag(buff, var3244, 2, protoModule.wireTypes.lengthDelimited)
		var3248, var4796 = protoModule.writeString(var3248, var3249, self.title)
		buff = var3248
		var3244 = var3249
	end
	local buff_1 = buffer.create(var3244)
	buffer.copy(buff_1, 0, buff, 0, var3244)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var3250 = t_124.new()
	local var3251 = 0
	while var3251 < buffer.len(p124) do
		local _ = nil
		local var3252 = nil
		local var3253, var3254, var3255 = protoModule.readTag(p124, var3251)
		local var3256 = var3253
		var3252 = var3254
		var3251 = var3255
		
		if var3252 == protoModule.wireTypes.varint then
			local _ = nil
			local var3257, var3258 = protoModule.readVarInt(p124, var3251)
			local _ = var3257
			var3251 = var3258
			continue
		end
		if var3252 == protoModule.wireTypes.lengthDelimited then
			if var3256 == 1 then
				local _ = nil
				local var3259, var3260 = protoModule.readBuffer(p124, var3251)
				var3251 = var3260
				table.insert(var3250.cards, t.GameItemsCardInputData.decode(var3259))
			elseif var3256 == 2 then
				local _ = nil
				local var3261, var3262 = protoModule.readBuffer(p124, var3251)
				var3251 = var3262
				var3250.title = buffer.tostring(var3261)
			else
				local _ = nil
				local var3263, var3264 = protoModule.readVarInt(p124, var3251)
				var3251 = var3264 + var3263
			end
		elseif var3252 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3265, var3266 = protoModule.readFixed32(p124, var3251)
			local _ = var3265
			var3251 = var3266
		elseif var3252 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3267, var3268 = protoModule.readFixed64(p124, var3251)
			local _ = var3267
			var3251 = var3268
		else
			error("Unsupported wire type: " .. var4800)
		end
	end
	return var3250
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
	local var3269 = t_124.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3269.cards = t_1
	end
	if self.title ~= nil then
		var3269.title = self.title
	end
	return var3269
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
	local var3270 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3271, var3272 = protoModule.writeTag(buff, var3270, 1, protoModule.wireTypes.lengthDelimited)
		var3271, var4824 = protoModule.writeString(var3271, var3272, self.universe_id)
		buff = var3271
		var3270 = var3272
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3273 = v:encode()
			local var3274, var3275 = protoModule.writeTag(buff, var3270, 2, protoModule.wireTypes.lengthDelimited)
			var3274, var4827 = protoModule.writeBuffer(var3274, var3275, var3273, buffer.len(var3273))
			buff = var3274
			var3270 = var3275
		end
	end
	local buff_1 = buffer.create(var3270)
	buffer.copy(buff_1, 0, buff, 0, var3270)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3276 = t_125.new()
	local var3277 = 0
	while var3277 < buffer.len(p125) do
		local _ = nil
		local var3278 = nil
		local var3279, var3280, var3281 = protoModule.readTag(p125, var3277)
		local var3282 = var3279
		var3278 = var3280
		var3277 = var3281
		
		if var3278 == protoModule.wireTypes.varint then
			local _ = nil
			local var3283, var3284 = protoModule.readVarInt(p125, var3277)
			local _ = var3283
			var3277 = var3284
			continue
		end
		if var3278 == protoModule.wireTypes.lengthDelimited then
			if var3282 == 1 then
				local _ = nil
				local var3285, var3286 = protoModule.readBuffer(p125, var3277)
				var3277 = var3286
				var3276.universe_id = buffer.tostring(var3285)
			elseif var3282 == 2 then
				local _ = nil
				local var3287, var3288 = protoModule.readBuffer(p125, var3277)
				var3277 = var3288
				table.insert(var3276.items, t.GameItemInputData.decode(var3287))
			else
				local _ = nil
				local var3289, var3290 = protoModule.readVarInt(p125, var3277)
				var3277 = var3290 + var3289
			end
		elseif var3278 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3291, var3292 = protoModule.readFixed32(p125, var3277)
			local _ = var3291
			var3277 = var3292
		elseif var3278 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3293, var3294 = protoModule.readFixed64(p125, var3277)
			local _ = var3293
			var3277 = var3294
		else
			error("Unsupported wire type: " .. var4831)
		end
	end
	return var3276
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
	local var3295 = t_125.new()
	
	if self.universe_id ~= nil then
		var3295.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3295.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3295.items = t_1
	end
	return var3295
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
	local var3296 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3297, var3298 = protoModule.writeTag(buff, var3296, 1, protoModule.wireTypes.lengthDelimited)
		var3297, var4855 = protoModule.writeString(var3297, var3298, self.item_id)
		buff = var3297
		var3296 = var3298
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3299, var3300 = protoModule.writeTag(buff, var3296, 2, protoModule.wireTypes.lengthDelimited)
		var3299, var4857 = protoModule.writeString(var3299, var3300, self.item_type)
		buff = var3299
		var3296 = var3300
	end
	local buff_1 = buffer.create(var3296)
	buffer.copy(buff_1, 0, buff, 0, var3296)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3296 = t_126.new()
	local var3297 = 0
	while var3297 < buffer.len(p126) do
		local _ = nil
		local var3298 = nil
		local var3299, var3300, var3301 = protoModule.readTag(p126, var3297)
		local var3302 = var3299
		var3298 = var3300
		var3297 = var3301
		
		if var3298 == protoModule.wireTypes.varint then
			local _ = nil
			local var3303, var3304 = protoModule.readVarInt(p126, var3297)
			local _ = var3303
			var3297 = var3304
			continue
		end
		if var3298 == protoModule.wireTypes.lengthDelimited then
			if var3302 == 1 then
				local _ = nil
				local var3305, var3306 = protoModule.readBuffer(p126, var3297)
				var3297 = var3306
				var3296.item_id = buffer.tostring(var3305)
			elseif var3302 == 2 then
				local _ = nil
				local var3307, var3308 = protoModule.readBuffer(p126, var3297)
				var3297 = var3308
				var3296.item_type = buffer.tostring(var3307)
			else
				local _ = nil
				local var3309, var3310 = protoModule.readVarInt(p126, var3297)
				var3297 = var3310 + var3309
			end
		elseif var3298 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3311, var3312 = protoModule.readFixed32(p126, var3297)
			local _ = var3311
			var3297 = var3312
		elseif var3298 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3313, var3314 = protoModule.readFixed64(p126, var3297)
			local _ = var3313
			var3297 = var3314
		else
			error("Unsupported wire type: " .. var4861)
		end
	end
	return var3296
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
	local var3315 = t_126.new()
	
	if self.item_id ~= nil then
		var3315.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3315.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3315.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3315.item_type = self.itemType
	end
	return var3315
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
	local var3315 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3316, var3317 = protoModule.writeTag(buff, var3315, 1, protoModule.wireTypes.lengthDelimited)
		var3316, var4883 = protoModule.writeString(var3316, var3317, self.clickout_url)
		buff = var3316
		var3315 = var3317
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3318, var3319 = protoModule.writeTag(buff, var3315, 2, protoModule.wireTypes.lengthDelimited)
		var3318, var4885 = protoModule.writeString(var3318, var3319, self.native_ad_data)
		buff = var3318
		var3315 = var3319
	end
	if self.payer_name ~= nil then
		local var3320, var3321 = protoModule.writeTag(buff, var3315, 3, protoModule.wireTypes.lengthDelimited)
		var3320, var4887 = protoModule.writeString(var3320, var3321, self.payer_name)
		buff = var3320
		var3315 = var3321
	end
	if self.logo_asset_id ~= nil then
		local var3322, var3323 = protoModule.writeTag(buff, var3315, 4, protoModule.wireTypes.lengthDelimited)
		var3322, var4889 = protoModule.writeString(var3322, var3323, self.logo_asset_id)
		buff = var3322
		var3315 = var3323
	end
	if self.logo_aspect_ratio ~= nil then
		local var3324, var3325 = protoModule.writeTag(buff, var3315, 5, protoModule.wireTypes.i64)
		var3324, var4891 = protoModule.writeDouble(var3324, var3325, self.logo_aspect_ratio)
		buff = var3324
		var3315 = var3325
	end
	if self.cta_text ~= nil then
		local var3326, var3327 = protoModule.writeTag(buff, var3315, 6, protoModule.wireTypes.lengthDelimited)
		var3326, var4893 = protoModule.writeString(var3326, var3327, self.cta_text)
		buff = var3326
		var3315 = var3327
	end
	if self.title ~= nil then
		local var3328, var3329 = protoModule.writeTag(buff, var3315, 7, protoModule.wireTypes.lengthDelimited)
		var3328, var4895 = protoModule.writeString(var3328, var3329, self.title)
		buff = var3328
		var3315 = var3329
	end
	if self.subtitle ~= nil then
		local var3330, var3331 = protoModule.writeTag(buff, var3315, 8, protoModule.wireTypes.lengthDelimited)
		var3330, var4897 = protoModule.writeString(var3330, var3331, self.subtitle)
		buff = var3330
		var3315 = var3331
	end
	if self.image_asset_id ~= nil then
		local var3332, var3333 = protoModule.writeTag(buff, var3315, 9, protoModule.wireTypes.lengthDelimited)
		var3332, var4899 = protoModule.writeString(var3332, var3333, self.image_asset_id)
		buff = var3332
		var3315 = var3333
	end
	if self.video_asset_id ~= nil then
		local var3334, var3335 = protoModule.writeTag(buff, var3315, 10, protoModule.wireTypes.lengthDelimited)
		var3334, var4901 = protoModule.writeString(var3334, var3335, self.video_asset_id)
		buff = var3334
		var3315 = var3335
	end
	if self.badge_text ~= nil then
		local var3336, var3337 = protoModule.writeTag(buff, var3315, 11, protoModule.wireTypes.lengthDelimited)
		var3336, var4903 = protoModule.writeString(var3336, var3337, self.badge_text)
		buff = var3336
		var3315 = var3337
	end
	if self.badge_analytics_id ~= nil then
		local var3338, var3339 = protoModule.writeTag(buff, var3315, 12, protoModule.wireTypes.lengthDelimited)
		var3338, var4905 = protoModule.writeString(var3338, var3339, self.badge_analytics_id)
		buff = var3338
		var3315 = var3339
	end
	if self.roblox_component ~= nil then
		local var3340, var3341 = protoModule.writeTag(buff, var3315, 13, protoModule.wireTypes.lengthDelimited)
		var3340, var4907 = protoModule.writeString(var3340, var3341, self.roblox_component)
		buff = var3340
		var3315 = var3341
	end
	local buff_1 = buffer.create(var3315)
	buffer.copy(buff_1, 0, buff, 0, var3315)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3315 = t_127.new()
	local var3316 = 0
	while var3316 < buffer.len(p127) do
		local _ = nil
		local var3317 = nil
		local var3318, var3319, var3320 = protoModule.readTag(p127, var3316)
		local var3321 = var3318
		var3317 = var3319
		var3316 = var3320
		
		if var3317 == protoModule.wireTypes.varint then
			local _ = nil
			local var3322, var3323 = protoModule.readVarInt(p127, var3316)
			local _ = var3322
			var3316 = var3323
			continue
		end
		if var3317 == protoModule.wireTypes.lengthDelimited then
			if var3321 == 1 then
				local _ = nil
				local var3324, var3325 = protoModule.readBuffer(p127, var3316)
				var3316 = var3325
				var3315.clickout_url = buffer.tostring(var3324)
			elseif var3321 == 2 then
				local _ = nil
				local var3326, var3327 = protoModule.readBuffer(p127, var3316)
				var3316 = var3327
				var3315.native_ad_data = buffer.tostring(var3326)
			elseif var3321 == 3 then
				local _ = nil
				local var3328, var3329 = protoModule.readBuffer(p127, var3316)
				var3316 = var3329
				var3315.payer_name = buffer.tostring(var3328)
			elseif var3321 == 4 then
				local _ = nil
				local var3330, var3331 = protoModule.readBuffer(p127, var3316)
				var3316 = var3331
				var3315.logo_asset_id = buffer.tostring(var3330)
			elseif var3321 == 6 then
				local _ = nil
				local var3332, var3333 = protoModule.readBuffer(p127, var3316)
				var3316 = var3333
				var3315.cta_text = buffer.tostring(var3332)
			elseif var3321 == 7 then
				local _ = nil
				local var3334, var3335 = protoModule.readBuffer(p127, var3316)
				var3316 = var3335
				var3315.title = buffer.tostring(var3334)
			elseif var3321 == 8 then
				local _ = nil
				local var3336, var3337 = protoModule.readBuffer(p127, var3316)
				var3316 = var3337
				var3315.subtitle = buffer.tostring(var3336)
			elseif var3321 == 9 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p127, var3316)
				var3316 = var3339
				var3315.image_asset_id = buffer.tostring(var3338)
			elseif var3321 == 10 then
				local _ = nil
				local var3340, var3341 = protoModule.readBuffer(p127, var3316)
				var3316 = var3341
				var3315.video_asset_id = buffer.tostring(var3340)
			elseif var3321 == 11 then
				local _ = nil
				local var3342, var3343 = protoModule.readBuffer(p127, var3316)
				var3316 = var3343
				var3315.badge_text = buffer.tostring(var3342)
			elseif var3321 == 12 then
				local _ = nil
				local var3344, var3345 = protoModule.readBuffer(p127, var3316)
				var3316 = var3345
				var3315.badge_analytics_id = buffer.tostring(var3344)
			elseif var3321 == 13 then
				local _ = nil
				local var3346, var3347 = protoModule.readBuffer(p127, var3316)
				var3316 = var3347
				var3315.roblox_component = buffer.tostring(var3346)
			else
				local _ = nil
				local var3348, var3349 = protoModule.readVarInt(p127, var3316)
				var3316 = var3349 + var3348
			end
		elseif var3317 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3350, var3351 = protoModule.readFixed32(p127, var3316)
			local _ = var3350
			var3316 = var3351
		elseif var3317 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4911)
		elseif var3321 == 5 then
			local _ = nil
			local var3352, var3353 = protoModule.readDouble(p127, var3316)
			var3316 = var3353
			var3315.logo_aspect_ratio = var3352
		else
			local _ = nil
			local var3354, var3355 = protoModule.readFixed64(p127, var3316)
			local _ = var3354
			var3316 = var3355
		end
	end
	return var3315
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
	local var3356 = t_127.new()
	
	if self.clickout_url ~= nil then
		var3356.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3356.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3356.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3356.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3356.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3356.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3356.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3356.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3356.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3356.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3356.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3356.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3356.title = self.title
	end
	if self.subtitle ~= nil then
		var3356.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3356.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3356.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3356.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3356.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3356.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3356.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3356.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3356.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3356.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3356.roblox_component = self.robloxComponent
	end
	return var3356
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
	local var3356 = 0
	
	if self.layout ~= nil then
		local var3357 = self.layout:encode()
		local var3358, var3359 = protoModule.writeTag(buff, var3356, 1, protoModule.wireTypes.lengthDelimited)
		var3358, var4956 = protoModule.writeBuffer(var3358, var3359, var3357, buffer.len(var3357))
		buff = var3358
		var3356 = var3359
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3360 = self.kind.value:encode()
			local var3361, var3362 = protoModule.writeTag(buff, var3356, 2, protoModule.wireTypes.lengthDelimited)
			var3361, var4959 = protoModule.writeBuffer(var3361, var3362, var3360, buffer.len(var3360))
			buff = var3361
			var3356 = var3362
		elseif self.kind.type == "ad_link" then
			local var3363 = self.kind.value:encode()
			local var3364, var3365 = protoModule.writeTag(buff, var3356, 3, protoModule.wireTypes.lengthDelimited)
			var3364, var4962 = protoModule.writeBuffer(var3364, var3365, var3363, buffer.len(var3363))
			buff = var3364
			var3356 = var3365
		end
	end
	local buff_1 = buffer.create(var3356)
	buffer.copy(buff_1, 0, buff, 0, var3356)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var3356 = t_128.new()
	local var3357 = 0
	while var3357 < buffer.len(p128) do
		local _ = nil
		local var3358 = nil
		local var3359, var3360, var3361 = protoModule.readTag(p128, var3357)
		local var3362 = var3359
		var3358 = var3360
		var3357 = var3361
		
		if var3358 == protoModule.wireTypes.varint then
			local _ = nil
			local var3363, var3364 = protoModule.readVarInt(p128, var3357)
			local _ = var3363
			var3357 = var3364
			continue
		end
		if var3358 == protoModule.wireTypes.lengthDelimited then
			if var3362 == 1 then
				local _ = nil
				local var3365, var3366 = protoModule.readBuffer(p128, var3357)
				var3357 = var3366
				var3356.layout = t.ItemLayout.decode(var3365)
			elseif var3362 == 2 then
				local _ = nil
				local var3367, var3368 = protoModule.readBuffer(p128, var3357)
				var3357 = var3368
				var3356.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3367)
				}
			elseif var3362 == 3 then
				local _ = nil
				local var3369, var3370 = protoModule.readBuffer(p128, var3357)
				var3357 = var3370
				var3356.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3369) }
			else
				local _ = nil
				local var3371, var3372 = protoModule.readVarInt(p128, var3357)
				var3357 = var3372 + var3371
			end
		elseif var3358 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3373, var3374 = protoModule.readFixed32(p128, var3357)
			local _ = var3373
			var3357 = var3374
		elseif var3358 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3375, var3376 = protoModule.readFixed64(p128, var3357)
			local _ = var3375
			var3357 = var3376
		else
			error("Unsupported wire type: " .. var4966)
		end
	end
	return var3356
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
	local var3377 = t_128.new()
	
	if self.layout ~= nil then
		var3377.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3377.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3377.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3377.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3377
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
	local var3377 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3378 = v:encode()
			local var3379, var3380 = protoModule.writeTag(buff, var3377, 1, protoModule.wireTypes.lengthDelimited)
			var3379, var4991 = protoModule.writeBuffer(var3379, var3380, var3378, buffer.len(var3378))
			buff = var3379
			var3377 = var3380
		end
	end
	if self.collection_item_size ~= nil then
		local var3381, var3382 = protoModule.writeTag(buff, var3377, 2, protoModule.wireTypes.lengthDelimited)
		var3381, var4993 = protoModule.writeString(var3381, var3382, self.collection_item_size)
		buff = var3381
		var3377 = var3382
	end
	local buff_1 = buffer.create(var3377)
	buffer.copy(buff_1, 0, buff, 0, var3377)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3383 = t_129.new()
	local var3384 = 0
	while var3384 < buffer.len(p129) do
		local _ = nil
		local var3385 = nil
		local var3386, var3387, var3388 = protoModule.readTag(p129, var3384)
		local var3389 = var3386
		var3385 = var3387
		var3384 = var3388
		
		if var3385 == protoModule.wireTypes.varint then
			local _ = nil
			local var3390, var3391 = protoModule.readVarInt(p129, var3384)
			local _ = var3390
			var3384 = var3391
			continue
		end
		if var3385 == protoModule.wireTypes.lengthDelimited then
			if var3389 == 1 then
				local _ = nil
				local var3392, var3393 = protoModule.readBuffer(p129, var3384)
				var3384 = var3393
				table.insert(var3383.items, t.ItemWithLayout.decode(var3392))
			elseif var3389 == 2 then
				local _ = nil
				local var3394, var3395 = protoModule.readBuffer(p129, var3384)
				var3384 = var3395
				var3383.collection_item_size = buffer.tostring(var3394)
			else
				local _ = nil
				local var3396, var3397 = protoModule.readVarInt(p129, var3384)
				var3384 = var3397 + var3396
			end
		elseif var3385 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3398, var3399 = protoModule.readFixed32(p129, var3384)
			local _ = var3398
			var3384 = var3399
		elseif var3385 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3400, var3401 = protoModule.readFixed64(p129, var3384)
			local _ = var3400
			var3384 = var3401
		else
			error("Unsupported wire type: " .. var4997)
		end
	end
	return var3383
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
	local var3402 = t_129.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3402.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3402.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3402.collection_item_size = self.collectionItemSize
	end
	return var3402
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
	local var3403 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3404, var3405 = protoModule.writeTag(buff, var3403, 1, protoModule.wireTypes.varint)
		var3404, var5021 = protoModule.writeVarInt(var3404, var3405, self.col_span)
		buff = var3404
		var3403 = var3405
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3406, var3407 = protoModule.writeTag(buff, var3403, 2, protoModule.wireTypes.varint)
		var3406, var5023 = protoModule.writeVarInt(var3406, var3407, self.row_span)
		buff = var3406
		var3403 = var3407
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3408, var3409 = protoModule.writeTag(buff, var3403, 3, protoModule.wireTypes.lengthDelimited)
		var3408, var5025 = protoModule.writeString(var3408, var3409, self.alignment_type)
		buff = var3408
		var3403 = var3409
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3410, var3411 = protoModule.writeTag(buff, var3403, 4, protoModule.wireTypes.varint)
		var3410, var5027 = protoModule.writeVarInt(var3410, var3411, self.min_row_padding)
		buff = var3410
		var3403 = var3411
	end
	local buff_1 = buffer.create(var3403)
	buffer.copy(buff_1, 0, buff, 0, var3403)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref)
	local var3403 = t_130.new()
	local var3404 = 0
	while var3404 < buffer.len(p130) do
		local _ = nil
		local var3405 = nil
		local var3406, var3407, var3408 = protoModule.readTag(p130, var3404)
		local var3409 = var3406
		var3405 = var3407
		var3404 = var3408
		
		if var3405 == protoModule.wireTypes.varint then
			if var3409 == 1 then
				local _ = nil
				local var3410, var3411 = protoModule.readVarIntI32(p130, var3404)
				var3404 = var3411
				var3403.col_span = var3410
			elseif var3409 == 2 then
				local _ = nil
				local var3412, var3413 = protoModule.readVarIntI32(p130, var3404)
				var3404 = var3413
				var3403.row_span = var3412
			elseif var3409 == 4 then
				local _ = nil
				local var3414, var3415 = protoModule.readVarIntI32(p130, var3404)
				var3404 = var3415
				var3403.min_row_padding = var3414
			else
				local _ = nil
				local var3416, var3417 = protoModule.readVarInt(p130, var3404)
				local _ = var3416
				var3404 = var3417
			end
		end
		if var3405 == protoModule.wireTypes.lengthDelimited then
			if var3409 == 3 then
				local _ = nil
				local var3418, var3419 = protoModule.readBuffer(p130, var3404)
				var3404 = var3419
				var3403.alignment_type = buffer.tostring(var3418)
			else
				local _ = nil
				local var3420, var3421 = protoModule.readVarInt(p130, var3404)
				var3404 = var3421 + var3420
			end
		elseif var3405 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3422, var3423 = protoModule.readFixed32(p130, var3404)
			local _ = var3422
			var3404 = var3423
		elseif var3405 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3424, var3425 = protoModule.readFixed64(p130, var3404)
			local _ = var3424
			var3404 = var3425
		else
			error("Unsupported wire type: " .. var5031)
		end
	end
	return var3403
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
	local var3426 = t_130.new()
	
	if self.col_span ~= nil then
		var3426.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3426.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3426.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3426.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3426.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3426.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3426.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3426.min_row_padding = self.minRowPadding
	end
	return var3426
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