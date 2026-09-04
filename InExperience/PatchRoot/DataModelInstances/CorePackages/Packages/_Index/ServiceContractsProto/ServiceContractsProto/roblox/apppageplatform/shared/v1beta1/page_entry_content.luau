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
		var3, var141 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.input_data ~= nil then
		local var5 = self.input_data:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var144 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
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
			error("Unsupported wire type: " .. var148)
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
		var22, var171 = protoModule.writeBuffer(var22, var23, var21, buffer.len(var21))
		buff = var22
		var20 = var23
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var20, 2, protoModule.wireTypes.lengthDelimited)
		var24, var173 = protoModule.writeString(var24, var25, self.roblox_component)
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
			error("Unsupported wire type: " .. var177)
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
		var40, var199 = protoModule.writeString(var40, var41, self.roblox_component)
		buff = var40
		var39 = var41
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var42 = self.input_data.value:encode()
		local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
		var43, var202 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
		buff = var43
		var39 = var44
	end
	if self.cta_buttons ~= nil then
		local var45 = self.cta_buttons:encode()
		local var46, var47 = protoModule.writeTag(buff, var39, 3, protoModule.wireTypes.lengthDelimited)
		var46, var205 = protoModule.writeBuffer(var46, var47, var45, buffer.len(var45))
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
			error("Unsupported wire type: " .. var209)
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
		var61, var233 = protoModule.writeString(var61, var62, self.roblox_component)
		buff = var61
		var60 = var62
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var63 = self.input_data.value:encode()
			local var64, var65 = protoModule.writeTag(buff, var60, 2, protoModule.wireTypes.lengthDelimited)
			var64, var236 = protoModule.writeBuffer(var64, var65, var63, buffer.len(var63))
			buff = var64
			var60 = var65
		elseif self.input_data.type == "video" then
			local var66 = self.input_data.value:encode()
			local var67, var68 = protoModule.writeTag(buff, var60, 3, protoModule.wireTypes.lengthDelimited)
			var67, var239 = protoModule.writeBuffer(var67, var68, var66, buffer.len(var66))
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
			error("Unsupported wire type: " .. var243)
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
			var83, var268 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var81 = var84
		elseif self.kind.type == "badge_details" then
			local var85 = self.kind.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var81, 2, protoModule.wireTypes.lengthDelimited)
			var86, var271 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var81 = var87
		elseif self.kind.type == "static_content" then
			local var88 = self.kind.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var81, 3, protoModule.wireTypes.lengthDelimited)
			var89, var274 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var81 = var90
		elseif self.kind.type == "experience_attribution_row" then
			local var91 = self.kind.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var81, 4, protoModule.wireTypes.lengthDelimited)
			var92, var277 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var81 = var93
		elseif self.kind.type == "experience_action_module" then
			local var94 = self.kind.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var81, 5, protoModule.wireTypes.lengthDelimited)
			var95, var280 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var81 = var96
		elseif self.kind.type == "experience_media_gallery" then
			local var97 = self.kind.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var81, 6, protoModule.wireTypes.lengthDelimited)
			var98, var283 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var81 = var99
		elseif self.kind.type == "experience_description" then
			local var100 = self.kind.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var81, 7, protoModule.wireTypes.lengthDelimited)
			var101, var286 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var81 = var102
		elseif self.kind.type == "experience_stat_row" then
			local var103 = self.kind.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var81, 8, protoModule.wireTypes.lengthDelimited)
			var104, var289 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var81 = var105
		elseif self.kind.type == "experience_info_table" then
			local var106 = self.kind.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var81, 9, protoModule.wireTypes.lengthDelimited)
			var107, var292 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var81 = var108
		elseif self.kind.type == "social_link_row" then
			local var109 = self.kind.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var81, 10, protoModule.wireTypes.lengthDelimited)
			var110, var295 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var81 = var111
		elseif self.kind.type == "experience_carousel" then
			local var112 = self.kind.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var81, 11, protoModule.wireTypes.lengthDelimited)
			var113, var298 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var81 = var114
		elseif self.kind.type == "song_carousel" then
			local var115 = self.kind.value:encode()
			local var116, var117 = protoModule.writeTag(buff, var81, 12, protoModule.wireTypes.lengthDelimited)
			var116, var301 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var81 = var117
		elseif self.kind.type == "events_carousel" then
			local var118 = self.kind.value:encode()
			local var119, var120 = protoModule.writeTag(buff, var81, 13, protoModule.wireTypes.lengthDelimited)
			var119, var304 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
			buff = var119
			var81 = var120
		elseif self.kind.type == "game_pass_collection" then
			local var121 = self.kind.value:encode()
			local var122, var123 = protoModule.writeTag(buff, var81, 14, protoModule.wireTypes.lengthDelimited)
			var122, var307 = protoModule.writeBuffer(var122, var123, var121, buffer.len(var121))
			buff = var122
			var81 = var123
		elseif self.kind.type == "developer_product_collection" then
			local var124 = self.kind.value:encode()
			local var125, var126 = protoModule.writeTag(buff, var81, 15, protoModule.wireTypes.lengthDelimited)
			var125, var310 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
			buff = var125
			var81 = var126
		elseif self.kind.type == "subscription_collection" then
			local var127 = self.kind.value:encode()
			local var128, var129 = protoModule.writeTag(buff, var81, 16, protoModule.wireTypes.lengthDelimited)
			var128, var313 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var81 = var129
		elseif self.kind.type == "dynamic_store_category" then
			local var130 = self.kind.value:encode()
			local var131, var132 = protoModule.writeTag(buff, var81, 17, protoModule.wireTypes.lengthDelimited)
			var131, var316 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
			buff = var131
			var81 = var132
		elseif self.kind.type == "card_container" then
			local var133 = self.kind.value:encode()
			local var134, var135 = protoModule.writeTag(buff, var81, 20, protoModule.wireTypes.lengthDelimited)
			var134, var319 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
			buff = var134
			var81 = var135
		elseif self.kind.type == "card" then
			local var136 = self.kind.value:encode()
			local var137, var138 = protoModule.writeTag(buff, var81, 21, protoModule.wireTypes.lengthDelimited)
			var137, var322 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
			buff = var137
			var81 = var138
		elseif self.kind.type == "dialog" then
			local var139 = self.kind.value:encode()
			local var140, var141 = protoModule.writeTag(buff, var81, 22, protoModule.wireTypes.lengthDelimited)
			var140, var325 = protoModule.writeBuffer(var140, var141, var139, buffer.len(var139))
			buff = var140
			var81 = var141
		elseif self.kind.type == "banner" then
			local var142 = self.kind.value:encode()
			local var143, var144 = protoModule.writeTag(buff, var81, 23, protoModule.wireTypes.lengthDelimited)
			var143, var328 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
			buff = var143
			var81 = var144
		elseif self.kind.type == "tooltip" then
			local var145 = self.kind.value:encode()
			local var146, var147 = protoModule.writeTag(buff, var81, 24, protoModule.wireTypes.lengthDelimited)
			var146, var331 = protoModule.writeBuffer(var146, var147, var145, buffer.len(var145))
			buff = var146
			var81 = var147
		elseif self.kind.type == "coachmark" then
			local var148 = self.kind.value:encode()
			local var149, var150 = protoModule.writeTag(buff, var81, 25, protoModule.wireTypes.lengthDelimited)
			var149, var334 = protoModule.writeBuffer(var149, var150, var148, buffer.len(var148))
			buff = var149
			var81 = var150
		elseif self.kind.type == "system_banner_prompt" then
			local var151 = self.kind.value:encode()
			local var152, var153 = protoModule.writeTag(buff, var81, 28, protoModule.wireTypes.lengthDelimited)
			var152, var337 = protoModule.writeBuffer(var152, var153, var151, buffer.len(var151))
			buff = var152
			var81 = var153
		elseif self.kind.type == "age_check_upsell" then
			local var154 = self.kind.value:encode()
			local var155, var156 = protoModule.writeTag(buff, var81, 29, protoModule.wireTypes.lengthDelimited)
			var155, var340 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
			buff = var155
			var81 = var156
		elseif self.kind.type == "catalog_item_list" then
			local var157 = self.kind.value:encode()
			local var158, var159 = protoModule.writeTag(buff, var81, 26, protoModule.wireTypes.lengthDelimited)
			var158, var343 = protoModule.writeBuffer(var158, var159, var157, buffer.len(var157))
			buff = var158
			var81 = var159
		elseif self.kind.type == "user_list" then
			local var160 = self.kind.value:encode()
			local var161, var162 = protoModule.writeTag(buff, var81, 27, protoModule.wireTypes.lengthDelimited)
			var161, var346 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
			buff = var161
			var81 = var162
		elseif self.kind.type == "experience_content_rating_label" then
			local var163 = self.kind.value:encode()
			local var164, var165 = protoModule.writeTag(buff, var81, 30, protoModule.wireTypes.lengthDelimited)
			var164, var349 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
			buff = var164
			var81 = var165
		elseif self.kind.type == "experience_refund_policy" then
			local var166 = self.kind.value:encode()
			local var167, var168 = protoModule.writeTag(buff, var81, 31, protoModule.wireTypes.lengthDelimited)
			var167, var352 = protoModule.writeBuffer(var167, var168, var166, buffer.len(var166))
			buff = var167
			var81 = var168
		elseif self.kind.type == "experience_play_with_reward" then
			local var169 = self.kind.value:encode()
			local var170, var171 = protoModule.writeTag(buff, var81, 32, protoModule.wireTypes.lengthDelimited)
			var170, var355 = protoModule.writeBuffer(var170, var171, var169, buffer.len(var169))
			buff = var170
			var81 = var171
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var172 = self.kind.value:encode()
			local var173, var174 = protoModule.writeTag(buff, var81, 33, protoModule.wireTypes.lengthDelimited)
			var173, var358 = protoModule.writeBuffer(var173, var174, var172, buffer.len(var172))
			buff = var173
			var81 = var174
		elseif self.kind.type == "community_section" then
			local var175 = self.kind.value:encode()
			local var176, var177 = protoModule.writeTag(buff, var81, 35, protoModule.wireTypes.lengthDelimited)
			var176, var361 = protoModule.writeBuffer(var176, var177, var175, buffer.len(var175))
			buff = var176
			var81 = var177
		elseif self.kind.type == "moments_carousel" then
			local var178 = self.kind.value:encode()
			local var179, var180 = protoModule.writeTag(buff, var81, 34, protoModule.wireTypes.lengthDelimited)
			var179, var364 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var81 = var180
		elseif self.kind.type == "text" then
			local var181 = self.kind.value:encode()
			local var182, var183 = protoModule.writeTag(buff, var81, 40, protoModule.wireTypes.lengthDelimited)
			var182, var367 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
			buff = var182
			var81 = var183
		elseif self.kind.type == "vertical_feed" then
			local var184 = self.kind.value:encode()
			local var185, var186 = protoModule.writeTag(buff, var81, 41, protoModule.wireTypes.lengthDelimited)
			var185, var370 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
			buff = var185
			var81 = var186
		elseif self.kind.type == "page_header" then
			local var187 = self.kind.value:encode()
			local var188, var189 = protoModule.writeTag(buff, var81, 42, protoModule.wireTypes.lengthDelimited)
			var188, var373 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var81 = var189
		elseif self.kind.type == "image_cta_section" then
			local var190 = self.kind.value:encode()
			local var191, var192 = protoModule.writeTag(buff, var81, 43, protoModule.wireTypes.lengthDelimited)
			var191, var376 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
			buff = var191
			var81 = var192
		elseif self.kind.type == "experience_details_feed" then
			local var193 = self.kind.value:encode()
			local var194, var195 = protoModule.writeTag(buff, var81, 500, protoModule.wireTypes.lengthDelimited)
			var194, var379 = protoModule.writeBuffer(var194, var195, var193, buffer.len(var193))
			buff = var194
			var81 = var195
		elseif self.kind.type == "experience_details_action_bar" then
			local var196 = self.kind.value:encode()
			local var197, var198 = protoModule.writeTag(buff, var81, 501, protoModule.wireTypes.lengthDelimited)
			var197, var382 = protoModule.writeBuffer(var197, var198, var196, buffer.len(var196))
			buff = var197
			var81 = var198
		elseif self.kind.type == "experience_details_banner_image" then
			local var199 = self.kind.value:encode()
			local var200, var201 = protoModule.writeTag(buff, var81, 502, protoModule.wireTypes.lengthDelimited)
			var200, var385 = protoModule.writeBuffer(var200, var201, var199, buffer.len(var199))
			buff = var200
			var81 = var201
		elseif self.kind.type == "experience_details_sticky_header" then
			local var202 = self.kind.value:encode()
			local var203, var204 = protoModule.writeTag(buff, var81, 503, protoModule.wireTypes.lengthDelimited)
			var203, var388 = protoModule.writeBuffer(var203, var204, var202, buffer.len(var202))
			buff = var203
			var81 = var204
		elseif self.kind.type == "event_details_feed" then
			local var205 = self.kind.value:encode()
			local var206, var207 = protoModule.writeTag(buff, var81, 600, protoModule.wireTypes.lengthDelimited)
			var206, var391 = protoModule.writeBuffer(var206, var207, var205, buffer.len(var205))
			buff = var206
			var81 = var207
		elseif self.kind.type == "event_details_action_bar" then
			local var208 = self.kind.value:encode()
			local var209, var210 = protoModule.writeTag(buff, var81, 601, protoModule.wireTypes.lengthDelimited)
			var209, var394 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
			buff = var209
			var81 = var210
		elseif self.kind.type == "event_attribution_row" then
			local var211 = self.kind.value:encode()
			local var212, var213 = protoModule.writeTag(buff, var81, 602, protoModule.wireTypes.lengthDelimited)
			var212, var397 = protoModule.writeBuffer(var212, var213, var211, buffer.len(var211))
			buff = var212
			var81 = var213
		elseif self.kind.type == "event_description" then
			local var214 = self.kind.value:encode()
			local var215, var216 = protoModule.writeTag(buff, var81, 603, protoModule.wireTypes.lengthDelimited)
			var215, var400 = protoModule.writeBuffer(var215, var216, var214, buffer.len(var214))
			buff = var215
			var81 = var216
		elseif self.kind.type == "event_info_table" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var81, 604, protoModule.wireTypes.lengthDelimited)
			var218, var403 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var81 = var219
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var220 = self.kind.value:encode()
			local var221, var222 = protoModule.writeTag(buff, var81, 605, protoModule.wireTypes.lengthDelimited)
			var221, var406 = protoModule.writeBuffer(var221, var222, var220, buffer.len(var220))
			buff = var221
			var81 = var222
		elseif self.kind.type == "event_notifications_modal" then
			local var223 = self.kind.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var81, 606, protoModule.wireTypes.lengthDelimited)
			var224, var409 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var81 = var225
		elseif self.kind.type == "dev_store_feed" then
			local var226 = self.kind.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var81, 700, protoModule.wireTypes.lengthDelimited)
			var227, var412 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var81 = var228
		elseif self.kind.type == "charts_feed" then
			local var229 = self.kind.value:encode()
			local var230, var231 = protoModule.writeTag(buff, var81, 800, protoModule.wireTypes.lengthDelimited)
			var230, var415 = protoModule.writeBuffer(var230, var231, var229, buffer.len(var229))
			buff = var230
			var81 = var231
		elseif self.kind.type == "filter_pills" then
			local var232 = self.kind.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var81, 801, protoModule.wireTypes.lengthDelimited)
			var233, var418 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var81 = var234
		elseif self.kind.type == "sort_selector" then
			local var235 = self.kind.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var81, 802, protoModule.wireTypes.lengthDelimited)
			var236, var421 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var81 = var237
		elseif self.kind.type == "genre_selector" then
			local var238 = self.kind.value:encode()
			local var239, var240 = protoModule.writeTag(buff, var81, 803, protoModule.wireTypes.lengthDelimited)
			var239, var424 = protoModule.writeBuffer(var239, var240, var238, buffer.len(var238))
			buff = var239
			var81 = var240
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var241 = self.kind.value:encode()
			local var242, var243 = protoModule.writeTag(buff, var81, 900, protoModule.wireTypes.lengthDelimited)
			var242, var427 = protoModule.writeBuffer(var242, var243, var241, buffer.len(var241))
			buff = var242
			var81 = var243
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var244 = self.kind.value:encode()
			local var245, var246 = protoModule.writeTag(buff, var81, 901, protoModule.wireTypes.lengthDelimited)
			var245, var430 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var81 = var246
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var247 = self.kind.value:encode()
			local var248, var249 = protoModule.writeTag(buff, var81, 902, protoModule.wireTypes.lengthDelimited)
			var248, var433 = protoModule.writeBuffer(var248, var249, var247, buffer.len(var247))
			buff = var248
			var81 = var249
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var250 = self.kind.value:encode()
			local var251, var252 = protoModule.writeTag(buff, var81, 903, protoModule.wireTypes.lengthDelimited)
			var251, var436 = protoModule.writeBuffer(var251, var252, var250, buffer.len(var250))
			buff = var251
			var81 = var252
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var253 = self.kind.value:encode()
			local var254, var255 = protoModule.writeTag(buff, var81, 904, protoModule.wireTypes.lengthDelimited)
			var254, var439 = protoModule.writeBuffer(var254, var255, var253, buffer.len(var253))
			buff = var254
			var81 = var255
		elseif self.kind.type == "catalog_item_grid" then
			local var256 = self.kind.value:encode()
			local var257, var258 = protoModule.writeTag(buff, var81, 905, protoModule.wireTypes.lengthDelimited)
			var257, var442 = protoModule.writeBuffer(var257, var258, var256, buffer.len(var256))
			buff = var257
			var81 = var258
		elseif self.kind.type == "marketplace_offer_modal" then
			local var259 = self.kind.value:encode()
			local var260, var261 = protoModule.writeTag(buff, var81, 906, protoModule.wireTypes.lengthDelimited)
			var260, var445 = protoModule.writeBuffer(var260, var261, var259, buffer.len(var259))
			buff = var260
			var81 = var261
		elseif self.kind.type == "search_results_feed" then
			local var262 = self.kind.value:encode()
			local var263, var264 = protoModule.writeTag(buff, var81, 1000, protoModule.wireTypes.lengthDelimited)
			var263, var448 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
			buff = var263
			var81 = var264
		elseif self.kind.type == "power_search_ai_overview" then
			local var265 = self.kind.value:encode()
			local var266, var267 = protoModule.writeTag(buff, var81, 1001, protoModule.wireTypes.lengthDelimited)
			var266, var451 = protoModule.writeBuffer(var266, var267, var265, buffer.len(var265))
			buff = var266
			var81 = var267
		elseif self.kind.type == "experience_emphasis_tile" then
			local var268 = self.kind.value:encode()
			local var269, var270 = protoModule.writeTag(buff, var81, 1002, protoModule.wireTypes.lengthDelimited)
			var269, var454 = protoModule.writeBuffer(var269, var270, var268, buffer.len(var268))
			buff = var269
			var81 = var270
		elseif self.kind.type == "option_selector_carousel" then
			local var271 = self.kind.value:encode()
			local var272, var273 = protoModule.writeTag(buff, var81, 1100, protoModule.wireTypes.lengthDelimited)
			var272, var457 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var81 = var273
		elseif self.kind.type == "game_items_carousel" then
			local var274 = self.kind.value:encode()
			local var275, var276 = protoModule.writeTag(buff, var81, 1101, protoModule.wireTypes.lengthDelimited)
			var275, var460 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
			buff = var275
			var81 = var276
		elseif self.kind.type == "hero_unit" then
			local var277 = self.kind.value:encode()
			local var278, var279 = protoModule.writeTag(buff, var81, 1102, protoModule.wireTypes.lengthDelimited)
			var278, var463 = protoModule.writeBuffer(var278, var279, var277, buffer.len(var277))
			buff = var278
			var81 = var279
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var280 = self.kind.value:encode()
			local var281, var282 = protoModule.writeTag(buff, var81, 1103, protoModule.wireTypes.lengthDelimited)
			var281, var466 = protoModule.writeBuffer(var281, var282, var280, buffer.len(var280))
			buff = var281
			var81 = var282
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var283 = self.kind.value:encode()
			local var284, var285 = protoModule.writeTag(buff, var81, 1200, protoModule.wireTypes.lengthDelimited)
			var284, var469 = protoModule.writeBuffer(var284, var285, var283, buffer.len(var283))
			buff = var284
			var81 = var285
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var286 = self.kind.value:encode()
			local var287, var288 = protoModule.writeTag(buff, var81, 1300, protoModule.wireTypes.lengthDelimited)
			var287, var472 = protoModule.writeBuffer(var287, var288, var286, buffer.len(var286))
			buff = var287
			var81 = var288
		elseif self.kind.type == "community_announcement" then
			local var289 = self.kind.value:encode()
			local var290, var291 = protoModule.writeTag(buff, var81, 1400, protoModule.wireTypes.lengthDelimited)
			var290, var475 = protoModule.writeBuffer(var290, var291, var289, buffer.len(var289))
			buff = var290
			var81 = var291
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
			else
				local _ = nil
				local var230, var231 = protoModule.readVarInt(p5, var82)
				var82 = var231 + var230
			end
		elseif var83 == protoModule.wireTypes.i32 then
			local _ = nil
			local var232, var233 = protoModule.readFixed32(p5, var82)
			local _ = var232
			var82 = var233
		elseif var83 == protoModule.wireTypes.i64 then
			local _ = nil
			local var234, var235 = protoModule.readFixed64(p5, var82)
			local _ = var234
			var82 = var235
		else
			error("Unsupported wire type: " .. var479)
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
		end
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var236 = t_5.new()
	
	if self.badges_grid ~= nil then
		var236.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var236.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var236.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var236.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var236.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var236.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var236.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var236.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var236.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var236.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var236.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var236.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var236.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var236.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var236.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var236.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var236.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var236.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var236.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var236.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var236.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var236.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var236.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var236.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var236.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var236.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var236.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var236.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var236.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var236.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var236.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var236.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var236.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var236.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var236.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var236.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var236.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var236.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var236.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var236.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var236.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var236.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var236.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var236.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var236.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var236.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var236.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var236.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var236.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var236.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var236.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var236.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var236.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var236.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var236.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var236.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var236.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var236.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var236.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var236.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var236.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var236.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var236.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var236.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var236.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var236.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var236.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var236.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.experience_details_feed ~= nil then
		var236.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var236.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var236.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var236.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var236.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var236.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var236.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var236.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var236.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var236.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var236.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var236.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var236.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var236.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var236.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var236.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var236.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var236.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var236.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var236.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var236.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var236.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var236.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var236.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var236.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var236.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var236.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var236.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var236.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var236.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var236.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var236.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var236.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var236.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var236.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var236.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var236.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var236.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var236.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var236.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var236.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var236.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var236.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var236.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var236.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var236.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var236.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var236.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var236.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var236.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var236.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var236.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var236.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var236.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var236.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var236.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var236.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var236.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var236.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var236.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var236.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var236.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var236.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var236.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	if self.community_announcement ~= nil then
		var236.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.community_announcement)
		}
	end
	if self.communityAnnouncement ~= nil then
		var236.kind = {
			type = "community_announcement",
			value = t.CommunityAnnouncementInputData.jsonDecode(self.communityAnnouncement)
		}
	end
	return var236
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
	local var236 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var237, var238 = protoModule.writeTag(buff, var236, 1, protoModule.wireTypes.lengthDelimited)
		var237, var637 = protoModule.writeString(var237, var238, self.section_title)
		buff = var237
		var236 = var238
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var239 = v:encode()
			local var240, var241 = protoModule.writeTag(buff, var236, 2, protoModule.wireTypes.lengthDelimited)
			var240, var640 = protoModule.writeBuffer(var240, var241, var239, buffer.len(var239))
			buff = var240
			var236 = var241
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var242, var243 = protoModule.writeTag(buff, var236, 3, protoModule.wireTypes.lengthDelimited)
		var242, var642 = protoModule.writeString(var242, var243, self.collection_id)
		buff = var242
		var236 = var243
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var244, var245 = protoModule.writeTag(buff, var236, 4, protoModule.wireTypes.lengthDelimited)
		var244, var644 = protoModule.writeString(var244, var245, self.collection_position)
		buff = var244
		var236 = var245
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var246, var247 = protoModule.writeTag(buff, var236, 5, protoModule.wireTypes.lengthDelimited)
		var246, var646 = protoModule.writeString(var246, var247, self.universe_id)
		buff = var246
		var236 = var247
	end
	local buff_1 = buffer.create(var236)
	buffer.copy(buff_1, 0, buff, 0, var236)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var248 = t_6.new()
	local var249 = 0
	while var249 < buffer.len(p6) do
		local _ = nil
		local var250 = nil
		local var251, var252, var253 = protoModule.readTag(p6, var249)
		local var254 = var251
		var250 = var252
		var249 = var253
		
		if var250 == protoModule.wireTypes.varint then
			local _ = nil
			local var255, var256 = protoModule.readVarInt(p6, var249)
			local _ = var255
			var249 = var256
			continue
		end
		if var250 == protoModule.wireTypes.lengthDelimited then
			if var254 == 1 then
				local _ = nil
				local var257, var258 = protoModule.readBuffer(p6, var249)
				var249 = var258
				var248.section_title = buffer.tostring(var257)
			elseif var254 == 2 then
				local _ = nil
				local var259, var260 = protoModule.readBuffer(p6, var249)
				var249 = var260
				table.insert(var248.badges, t.BadgesGridInputData_BadgeInputData.decode(var259))
			elseif var254 == 3 then
				local _ = nil
				local var261, var262 = protoModule.readBuffer(p6, var249)
				var249 = var262
				var248.collection_id = buffer.tostring(var261)
			elseif var254 == 4 then
				local _ = nil
				local var263, var264 = protoModule.readBuffer(p6, var249)
				var249 = var264
				var248.collection_position = buffer.tostring(var263)
			elseif var254 == 5 then
				local _ = nil
				local var265, var266 = protoModule.readBuffer(p6, var249)
				var249 = var266
				var248.universe_id = buffer.tostring(var265)
			else
				local _ = nil
				local var267, var268 = protoModule.readVarInt(p6, var249)
				var249 = var268 + var267
			end
		elseif var250 == protoModule.wireTypes.i32 then
			local _ = nil
			local var269, var270 = protoModule.readFixed32(p6, var249)
			local _ = var269
			var249 = var270
		elseif var250 == protoModule.wireTypes.i64 then
			local _ = nil
			local var271, var272 = protoModule.readFixed64(p6, var249)
			local _ = var271
			var249 = var272
		else
			error("Unsupported wire type: " .. var650)
		end
	end
	return var248
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
	local var273 = t_6.new()
	
	if self.section_title ~= nil then
		var273.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var273.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var273.badges = t_1
	end
	if self.collection_id ~= nil then
		var273.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var273.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var273.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var273.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var273.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var273.universe_id = self.universeId
	end
	return var273
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
	local var274 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var275, var276 = protoModule.writeTag(buff, var274, 1, protoModule.wireTypes.lengthDelimited)
		var275, var680 = protoModule.writeString(var275, var276, self.badge_id)
		buff = var275
		var274 = var276
	end
	local buff_1 = buffer.create(var274)
	buffer.copy(buff_1, 0, buff, 0, var274)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var274 = t_7.new()
	local var275 = 0
	while var275 < buffer.len(p7) do
		local _ = nil
		local var276 = nil
		local var277, var278, var279 = protoModule.readTag(p7, var275)
		local var280 = var277
		var276 = var278
		var275 = var279
		
		if var276 == protoModule.wireTypes.varint then
			local _ = nil
			local var281, var282 = protoModule.readVarInt(p7, var275)
			local _ = var281
			var275 = var282
			continue
		end
		if var276 == protoModule.wireTypes.lengthDelimited then
			if var280 == 1 then
				local _ = nil
				local var283, var284 = protoModule.readBuffer(p7, var275)
				var275 = var284
				var274.badge_id = buffer.tostring(var283)
			else
				local _ = nil
				local var285, var286 = protoModule.readVarInt(p7, var275)
				var275 = var286 + var285
			end
		elseif var276 == protoModule.wireTypes.i32 then
			local _ = nil
			local var287, var288 = protoModule.readFixed32(p7, var275)
			local _ = var287
			var275 = var288
		elseif var276 == protoModule.wireTypes.i64 then
			local _ = nil
			local var289, var290 = protoModule.readFixed64(p7, var275)
			local _ = var289
			var275 = var290
		else
			error("Unsupported wire type: " .. var684)
		end
	end
	return var274
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
	local var291 = t_7.new()
	
	if self.badge_id ~= nil then
		var291.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var291.badge_id = self.badgeId
	end
	return var291
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
	local var291 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var292, var293 = protoModule.writeTag(buff, var291, 1, protoModule.wireTypes.lengthDelimited)
		var292, var704 = protoModule.writeString(var292, var293, self.badge_id)
		buff = var292
		var291 = var293
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var294, var295 = protoModule.writeTag(buff, var291, 2, protoModule.wireTypes.lengthDelimited)
		var294, var706 = protoModule.writeString(var294, var295, self.universe_id)
		buff = var294
		var291 = var295
	end
	if self.localized_literals ~= nil then
		local var296 = self.localized_literals:encode()
		local var297, var298 = protoModule.writeTag(buff, var291, 3, protoModule.wireTypes.lengthDelimited)
		var297, var709 = protoModule.writeBuffer(var297, var298, var296, buffer.len(var296))
		buff = var297
		var291 = var298
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var299, var300 = protoModule.writeTag(buff, var291, 4, protoModule.wireTypes.lengthDelimited)
		var299, var711 = protoModule.writeString(var299, var300, self.creator_key)
		buff = var299
		var291 = var300
	end
	local buff_1 = buffer.create(var291)
	buffer.copy(buff_1, 0, buff, 0, var291)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var291 = t_8.new()
	local var292 = 0
	while var292 < buffer.len(p8) do
		local _ = nil
		local var293 = nil
		local var294, var295, var296 = protoModule.readTag(p8, var292)
		local var297 = var294
		var293 = var295
		var292 = var296
		
		if var293 == protoModule.wireTypes.varint then
			local _ = nil
			local var298, var299 = protoModule.readVarInt(p8, var292)
			local _ = var298
			var292 = var299
			continue
		end
		if var293 == protoModule.wireTypes.lengthDelimited then
			if var297 == 1 then
				local _ = nil
				local var300, var301 = protoModule.readBuffer(p8, var292)
				var292 = var301
				var291.badge_id = buffer.tostring(var300)
			elseif var297 == 2 then
				local _ = nil
				local var302, var303 = protoModule.readBuffer(p8, var292)
				var292 = var303
				var291.universe_id = buffer.tostring(var302)
			elseif var297 == 3 then
				local _ = nil
				local var304, var305 = protoModule.readBuffer(p8, var292)
				var292 = var305
				var291.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var304)
			elseif var297 == 4 then
				local _ = nil
				local var306, var307 = protoModule.readBuffer(p8, var292)
				var292 = var307
				var291.creator_key = buffer.tostring(var306)
			else
				local _ = nil
				local var308, var309 = protoModule.readVarInt(p8, var292)
				var292 = var309 + var308
			end
		elseif var293 == protoModule.wireTypes.i32 then
			local _ = nil
			local var310, var311 = protoModule.readFixed32(p8, var292)
			local _ = var310
			var292 = var311
		elseif var293 == protoModule.wireTypes.i64 then
			local _ = nil
			local var312, var313 = protoModule.readFixed64(p8, var292)
			local _ = var312
			var292 = var313
		else
			error("Unsupported wire type: " .. var715)
		end
	end
	return var291
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
	local var314 = t_8.new()
	
	if self.badge_id ~= nil then
		var314.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var314.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var314.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var314.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var314.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var314.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var314.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var314.creator_key = self.creatorKey
	end
	return var314
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
	local var314 = 0
	
	if self.info_table ~= nil then
		local var315 = self.info_table:encode()
		local var316, var317 = protoModule.writeTag(buff, var314, 1, protoModule.wireTypes.lengthDelimited)
		var316, var742 = protoModule.writeBuffer(var316, var317, var315, buffer.len(var315))
		buff = var316
		var314 = var317
	end
	if self.action_module ~= nil then
		local var318 = self.action_module:encode()
		local var319, var320 = protoModule.writeTag(buff, var314, 2, protoModule.wireTypes.lengthDelimited)
		var319, var745 = protoModule.writeBuffer(var319, var320, var318, buffer.len(var318))
		buff = var319
		var314 = var320
	end
	if self.overflow_menu ~= nil then
		local var321 = self.overflow_menu:encode()
		local var322, var323 = protoModule.writeTag(buff, var314, 3, protoModule.wireTypes.lengthDelimited)
		var322, var748 = protoModule.writeBuffer(var322, var323, var321, buffer.len(var321))
		buff = var322
		var314 = var323
	end
	local buff_1 = buffer.create(var314)
	buffer.copy(buff_1, 0, buff, 0, var314)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var314 = t_9.new()
	local var315 = 0
	while var315 < buffer.len(p9) do
		local _ = nil
		local var316 = nil
		local var317, var318, var319 = protoModule.readTag(p9, var315)
		local var320 = var317
		var316 = var318
		var315 = var319
		
		if var316 == protoModule.wireTypes.varint then
			local _ = nil
			local var321, var322 = protoModule.readVarInt(p9, var315)
			local _ = var321
			var315 = var322
			continue
		end
		if var316 == protoModule.wireTypes.lengthDelimited then
			if var320 == 1 then
				local _ = nil
				local var323, var324 = protoModule.readBuffer(p9, var315)
				var315 = var324
				var314.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var323)
			elseif var320 == 2 then
				local _ = nil
				local var325, var326 = protoModule.readBuffer(p9, var315)
				var315 = var326
				var314.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var325)
			elseif var320 == 3 then
				local _ = nil
				local var327, var328 = protoModule.readBuffer(p9, var315)
				var315 = var328
				var314.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var327)
			else
				local _ = nil
				local var329, var330 = protoModule.readVarInt(p9, var315)
				var315 = var330 + var329
			end
		elseif var316 == protoModule.wireTypes.i32 then
			local _ = nil
			local var331, var332 = protoModule.readFixed32(p9, var315)
			local _ = var331
			var315 = var332
		elseif var316 == protoModule.wireTypes.i64 then
			local _ = nil
			local var333, var334 = protoModule.readFixed64(p9, var315)
			local _ = var333
			var315 = var334
		else
			error("Unsupported wire type: " .. var752)
		end
	end
	return var314
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
	local var335 = t_9.new()
	
	if self.info_table ~= nil then
		var335.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var335.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var335.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var335.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var335.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var335.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var335
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
	local var335 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var336, var337 = protoModule.writeTag(buff, var335, 1, protoModule.wireTypes.lengthDelimited)
		var336, var776 = protoModule.writeString(var336, var337, self.type_label)
		buff = var336
		var335 = var337
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var338, var339 = protoModule.writeTag(buff, var335, 2, protoModule.wireTypes.lengthDelimited)
		var338, var778 = protoModule.writeString(var338, var339, self.earned_label)
		buff = var338
		var335 = var339
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var340, var341 = protoModule.writeTag(buff, var335, 3, protoModule.wireTypes.lengthDelimited)
		var340, var780 = protoModule.writeString(var340, var341, self.updated_label)
		buff = var340
		var335 = var341
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var342, var343 = protoModule.writeTag(buff, var335, 4, protoModule.wireTypes.lengthDelimited)
		var342, var782 = protoModule.writeString(var342, var343, self.experience_label)
		buff = var342
		var335 = var343
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var344, var345 = protoModule.writeTag(buff, var335, 5, protoModule.wireTypes.lengthDelimited)
		var344, var784 = protoModule.writeString(var344, var345, self.rarity_label)
		buff = var344
		var335 = var345
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var346, var347 = protoModule.writeTag(buff, var335, 6, protoModule.wireTypes.lengthDelimited)
		var346, var786 = protoModule.writeString(var346, var347, self.won_yesterday_label)
		buff = var346
		var335 = var347
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var348, var349 = protoModule.writeTag(buff, var335, 7, protoModule.wireTypes.lengthDelimited)
		var348, var788 = protoModule.writeString(var348, var349, self.won_ever_label)
		buff = var348
		var335 = var349
	end
	local buff_1 = buffer.create(var335)
	buffer.copy(buff_1, 0, buff, 0, var335)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var335 = t_10.new()
	local var336 = 0
	while var336 < buffer.len(p10) do
		local _ = nil
		local var337 = nil
		local var338, var339, var340 = protoModule.readTag(p10, var336)
		local var341 = var338
		var337 = var339
		var336 = var340
		
		if var337 == protoModule.wireTypes.varint then
			local _ = nil
			local var342, var343 = protoModule.readVarInt(p10, var336)
			local _ = var342
			var336 = var343
			continue
		end
		if var337 == protoModule.wireTypes.lengthDelimited then
			if var341 == 1 then
				local _ = nil
				local var344, var345 = protoModule.readBuffer(p10, var336)
				var336 = var345
				var335.type_label = buffer.tostring(var344)
			elseif var341 == 2 then
				local _ = nil
				local var346, var347 = protoModule.readBuffer(p10, var336)
				var336 = var347
				var335.earned_label = buffer.tostring(var346)
			elseif var341 == 3 then
				local _ = nil
				local var348, var349 = protoModule.readBuffer(p10, var336)
				var336 = var349
				var335.updated_label = buffer.tostring(var348)
			elseif var341 == 4 then
				local _ = nil
				local var350, var351 = protoModule.readBuffer(p10, var336)
				var336 = var351
				var335.experience_label = buffer.tostring(var350)
			elseif var341 == 5 then
				local _ = nil
				local var352, var353 = protoModule.readBuffer(p10, var336)
				var336 = var353
				var335.rarity_label = buffer.tostring(var352)
			elseif var341 == 6 then
				local _ = nil
				local var354, var355 = protoModule.readBuffer(p10, var336)
				var336 = var355
				var335.won_yesterday_label = buffer.tostring(var354)
			elseif var341 == 7 then
				local _ = nil
				local var356, var357 = protoModule.readBuffer(p10, var336)
				var336 = var357
				var335.won_ever_label = buffer.tostring(var356)
			else
				local _ = nil
				local var358, var359 = protoModule.readVarInt(p10, var336)
				var336 = var359 + var358
			end
		elseif var337 == protoModule.wireTypes.i32 then
			local _ = nil
			local var360, var361 = protoModule.readFixed32(p10, var336)
			local _ = var360
			var336 = var361
		elseif var337 == protoModule.wireTypes.i64 then
			local _ = nil
			local var362, var363 = protoModule.readFixed64(p10, var336)
			local _ = var362
			var336 = var363
		else
			error("Unsupported wire type: " .. var792)
		end
	end
	return var335
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
	local var364 = t_10.new()
	
	if self.type_label ~= nil then
		var364.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var364.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var364.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var364.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var364.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var364.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var364.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var364.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var364.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var364.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var364.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var364.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var364.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var364.won_ever_label = self.wonEverLabel
	end
	return var364
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
	local var364 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var365, var366 = protoModule.writeTag(buff, var364, 1, protoModule.wireTypes.lengthDelimited)
		var365, var824 = protoModule.writeString(var365, var366, self.share)
		buff = var365
		var364 = var366
	end
	if self.report ~= nil and self.report ~= "" then
		local var367, var368 = protoModule.writeTag(buff, var364, 2, protoModule.wireTypes.lengthDelimited)
		var367, var826 = protoModule.writeString(var367, var368, self.report)
		buff = var367
		var364 = var368
	end
	local buff_1 = buffer.create(var364)
	buffer.copy(buff_1, 0, buff, 0, var364)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var364 = t_11.new()
	local var365 = 0
	while var365 < buffer.len(p11) do
		local _ = nil
		local var366 = nil
		local var367, var368, var369 = protoModule.readTag(p11, var365)
		local var370 = var367
		var366 = var368
		var365 = var369
		
		if var366 == protoModule.wireTypes.varint then
			local _ = nil
			local var371, var372 = protoModule.readVarInt(p11, var365)
			local _ = var371
			var365 = var372
			continue
		end
		if var366 == protoModule.wireTypes.lengthDelimited then
			if var370 == 1 then
				local _ = nil
				local var373, var374 = protoModule.readBuffer(p11, var365)
				var365 = var374
				var364.share = buffer.tostring(var373)
			elseif var370 == 2 then
				local _ = nil
				local var375, var376 = protoModule.readBuffer(p11, var365)
				var365 = var376
				var364.report = buffer.tostring(var375)
			else
				local _ = nil
				local var377, var378 = protoModule.readVarInt(p11, var365)
				var365 = var378 + var377
			end
		elseif var366 == protoModule.wireTypes.i32 then
			local _ = nil
			local var379, var380 = protoModule.readFixed32(p11, var365)
			local _ = var379
			var365 = var380
		elseif var366 == protoModule.wireTypes.i64 then
			local _ = nil
			local var381, var382 = protoModule.readFixed64(p11, var365)
			local _ = var381
			var365 = var382
		else
			error("Unsupported wire type: " .. var830)
		end
	end
	return var364
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
	local var383 = t_11.new()
	
	if self.share ~= nil then
		var383.share = self.share
	end
	if self.report ~= nil then
		var383.report = self.report
	end
	return var383
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
	local var383 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var384, var385 = protoModule.writeTag(buff, var383, 1, protoModule.wireTypes.lengthDelimited)
		var384, var852 = protoModule.writeString(var384, var385, self.report)
		buff = var384
		var383 = var385
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var386, var387 = protoModule.writeTag(buff, var383, 2, protoModule.wireTypes.lengthDelimited)
		var386, var854 = protoModule.writeString(var386, var387, self.remove)
		buff = var386
		var383 = var387
	end
	local buff_1 = buffer.create(var383)
	buffer.copy(buff_1, 0, buff, 0, var383)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var383 = t_12.new()
	local var384 = 0
	while var384 < buffer.len(p12) do
		local _ = nil
		local var385 = nil
		local var386, var387, var388 = protoModule.readTag(p12, var384)
		local var389 = var386
		var385 = var387
		var384 = var388
		
		if var385 == protoModule.wireTypes.varint then
			local _ = nil
			local var390, var391 = protoModule.readVarInt(p12, var384)
			local _ = var390
			var384 = var391
			continue
		end
		if var385 == protoModule.wireTypes.lengthDelimited then
			if var389 == 1 then
				local _ = nil
				local var392, var393 = protoModule.readBuffer(p12, var384)
				var384 = var393
				var383.report = buffer.tostring(var392)
			elseif var389 == 2 then
				local _ = nil
				local var394, var395 = protoModule.readBuffer(p12, var384)
				var384 = var395
				var383.remove = buffer.tostring(var394)
			else
				local _ = nil
				local var396, var397 = protoModule.readVarInt(p12, var384)
				var384 = var397 + var396
			end
		elseif var385 == protoModule.wireTypes.i32 then
			local _ = nil
			local var398, var399 = protoModule.readFixed32(p12, var384)
			local _ = var398
			var384 = var399
		elseif var385 == protoModule.wireTypes.i64 then
			local _ = nil
			local var400, var401 = protoModule.readFixed64(p12, var384)
			local _ = var400
			var384 = var401
		else
			error("Unsupported wire type: " .. var858)
		end
	end
	return var383
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
	local var402 = t_12.new()
	
	if self.report ~= nil then
		var402.report = self.report
	end
	if self.remove ~= nil then
		var402.remove = self.remove
	end
	return var402
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
	local var402 = t_13.new()
	local var403 = 0
	while var403 < buffer.len(p13) do
		local var404 = nil
		local _ = nil
		local var405, var406, var407 = protoModule.readTag(p13, var403)
		var404 = var405
		local var408 = var406
		var403 = var407
		
		if var408 == protoModule.wireTypes.varint then
			local _ = nil
			local var409, var410 = protoModule.readVarInt(p13, var403)
			local _ = var409
			var403 = var410
		elseif var408 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var411, var412 = protoModule.readVarInt(p13, var403)
			var403 = var412 + var411
		elseif var408 == protoModule.wireTypes.i32 then
			local _ = nil
			local var413, var414 = protoModule.readFixed32(p13, var403)
			local _ = var413
			var403 = var414
		elseif var408 == protoModule.wireTypes.i64 then
			local _ = nil
			local var415, var416 = protoModule.readFixed64(p13, var403)
			local _ = var415
			var403 = var416
		else
			error("Unsupported wire type: " .. var884)
		end
	end
	return var402
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
	local var417 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var418, var419 = protoModule.writeTag(buff, var417, 1, protoModule.wireTypes.lengthDelimited)
		var418, var896 = protoModule.writeString(var418, var419, self.universe_id)
		buff = var418
		var417 = var419
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var420, var421 = protoModule.writeTag(buff, var417, 2, protoModule.wireTypes.lengthDelimited)
		var420, var898 = protoModule.writeString(var420, var421, self.creator_key)
		buff = var420
		var417 = var421
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var422, var423 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var422, var900 = protoModule.writeString(var422, var423, i)
			local var424 = v:encode()
			var423, var902 = protoModule.writeTag(var422, var423, 2, protoModule.wireTypes.lengthDelimited)
			var423, var902 = protoModule.writeBuffer(var423, var902, var424, buffer.len(var424))
			local var425 = var423
			local var426 = var902
			local var427, var428 = protoModule.writeTag(buff, var417, 3, protoModule.wireTypes.lengthDelimited)
			var427, var906 = protoModule.writeBuffer(var427, var428, var425, var426)
			buff = var427
			var417 = var428
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var429, var430 = protoModule.writeTag(buff, var417, 4, protoModule.wireTypes.lengthDelimited)
			var429, var908 = protoModule.writeString(var429, var430, v)
			buff = var429
			var417 = var430
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var431, var432 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var431, var910 = protoModule.writeString(var431, var432, i)
			local var433 = v:encode()
			var432, var912 = protoModule.writeTag(var431, var432, 2, protoModule.wireTypes.lengthDelimited)
			var432, var912 = protoModule.writeBuffer(var432, var912, var433, buffer.len(var433))
			local var434 = var432
			local var435 = var912
			local var436, var437 = protoModule.writeTag(buff, var417, 5, protoModule.wireTypes.lengthDelimited)
			var436, var916 = protoModule.writeBuffer(var436, var437, var434, var435)
			buff = var436
			var417 = var437
		end
	end
	local buff_1 = buffer.create(var417)
	buffer.copy(buff_1, 0, buff, 0, var417)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var438 = t_14.new()
	local var439 = 0
	while var439 < buffer.len(p14) do
		local _ = nil
		local var440 = nil
		local var441, var442, var443 = protoModule.readTag(p14, var439)
		local var444 = var441
		var440 = var442
		var439 = var443
		
		if var440 == protoModule.wireTypes.varint then
			local _ = nil
			local var445, var446 = protoModule.readVarInt(p14, var439)
			local _ = var445
			var439 = var446
			continue
		end
		if var440 == protoModule.wireTypes.lengthDelimited then
			if var444 == 1 then
				local _ = nil
				local var447, var448 = protoModule.readBuffer(p14, var439)
				var439 = var448
				var438.universe_id = buffer.tostring(var447)
			elseif var444 == 2 then
				local _ = nil
				local var449, var450 = protoModule.readBuffer(p14, var439)
				var439 = var450
				var438.creator_key = buffer.tostring(var449)
			elseif var444 == 3 then
				local _ = nil
				local var451, var452 = protoModule.readBuffer(p14, var439)
				var439 = var452
				var451 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var451)
				var438.entry_map[var451.key or ""] = var451.value or t.FeedEntry.new()
			elseif var444 == 4 then
				local _ = nil
				local var453, var454 = protoModule.readBuffer(p14, var439)
				var439 = var454
				table.insert(var438.entry_order, buffer.tostring(var453))
			elseif var444 == 5 then
				local _ = nil
				local var455, var456 = protoModule.readBuffer(p14, var439)
				var439 = var456
				var455 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var455)
				var438.entry_order_map[var455.key or ""] = var455.value or t.EntryOrder.new()
			else
				local _ = nil
				local var457, var458 = protoModule.readVarInt(p14, var439)
				var439 = var458 + var457
			end
		elseif var440 == protoModule.wireTypes.i32 then
			local _ = nil
			local var459, var460 = protoModule.readFixed32(p14, var439)
			local _ = var459
			var439 = var460
		elseif var440 == protoModule.wireTypes.i64 then
			local _ = nil
			local var461, var462 = protoModule.readFixed64(p14, var439)
			local _ = var461
			var439 = var462
		else
			error("Unsupported wire type: " .. var920)
		end
	end
	return var438
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
	local var463 = t_14.new()
	
	if self.universe_id ~= nil then
		var463.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var463.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var463.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var463.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var463.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var463.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var463.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var463.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var463.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var463.entry_order_map = t_1
	end
	return var463
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
	local var464 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var465, var466 = protoModule.writeTag(buff, var464, 1, protoModule.wireTypes.lengthDelimited)
		var465, var957 = protoModule.writeString(var465, var466, self.key)
		buff = var465
		var464 = var466
	end
	if self.value ~= nil then
		local var467 = self.value:encode()
		local var468, var469 = protoModule.writeTag(buff, var464, 2, protoModule.wireTypes.lengthDelimited)
		var468, var960 = protoModule.writeBuffer(var468, var469, var467, buffer.len(var467))
		buff = var468
		var464 = var469
	end
	local buff_1 = buffer.create(var464)
	buffer.copy(buff_1, 0, buff, 0, var464)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var464 = t_15.new()
	local var465 = 0
	while var465 < buffer.len(p15) do
		local _ = nil
		local var466 = nil
		local var467, var468, var469 = protoModule.readTag(p15, var465)
		local var470 = var467
		var466 = var468
		var465 = var469
		
		if var466 == protoModule.wireTypes.varint then
			local _ = nil
			local var471, var472 = protoModule.readVarInt(p15, var465)
			local _ = var471
			var465 = var472
			continue
		end
		if var466 == protoModule.wireTypes.lengthDelimited then
			if var470 == 1 then
				local _ = nil
				local var473, var474 = protoModule.readBuffer(p15, var465)
				var465 = var474
				var464.key = buffer.tostring(var473)
			elseif var470 == 2 then
				local _ = nil
				local var475, var476 = protoModule.readBuffer(p15, var465)
				var465 = var476
				var464.value = t.FeedEntry.decode(var475)
			else
				local _ = nil
				local var477, var478 = protoModule.readVarInt(p15, var465)
				var465 = var478 + var477
			end
		elseif var466 == protoModule.wireTypes.i32 then
			local _ = nil
			local var479, var480 = protoModule.readFixed32(p15, var465)
			local _ = var479
			var465 = var480
		elseif var466 == protoModule.wireTypes.i64 then
			local _ = nil
			local var481, var482 = protoModule.readFixed64(p15, var465)
			local _ = var481
			var465 = var482
		else
			error("Unsupported wire type: " .. var964)
		end
	end
	return var464
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
	local var483 = t_15.new()
	
	if self.key ~= nil then
		var483.key = self.key
	end
	if self.value ~= nil then
		var483.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var483
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
	local var483 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var484, var485 = protoModule.writeTag(buff, var483, 1, protoModule.wireTypes.lengthDelimited)
		var484, var986 = protoModule.writeString(var484, var485, self.key)
		buff = var484
		var483 = var485
	end
	if self.value ~= nil then
		local var486 = self.value:encode()
		local var487, var488 = protoModule.writeTag(buff, var483, 2, protoModule.wireTypes.lengthDelimited)
		var487, var989 = protoModule.writeBuffer(var487, var488, var486, buffer.len(var486))
		buff = var487
		var483 = var488
	end
	local buff_1 = buffer.create(var483)
	buffer.copy(buff_1, 0, buff, 0, var483)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var483 = t_16.new()
	local var484 = 0
	while var484 < buffer.len(p16) do
		local _ = nil
		local var485 = nil
		local var486, var487, var488 = protoModule.readTag(p16, var484)
		local var489 = var486
		var485 = var487
		var484 = var488
		
		if var485 == protoModule.wireTypes.varint then
			local _ = nil
			local var490, var491 = protoModule.readVarInt(p16, var484)
			local _ = var490
			var484 = var491
			continue
		end
		if var485 == protoModule.wireTypes.lengthDelimited then
			if var489 == 1 then
				local _ = nil
				local var492, var493 = protoModule.readBuffer(p16, var484)
				var484 = var493
				var483.key = buffer.tostring(var492)
			elseif var489 == 2 then
				local _ = nil
				local var494, var495 = protoModule.readBuffer(p16, var484)
				var484 = var495
				var483.value = t.EntryOrder.decode(var494)
			else
				local _ = nil
				local var496, var497 = protoModule.readVarInt(p16, var484)
				var484 = var497 + var496
			end
		elseif var485 == protoModule.wireTypes.i32 then
			local _ = nil
			local var498, var499 = protoModule.readFixed32(p16, var484)
			local _ = var498
			var484 = var499
		elseif var485 == protoModule.wireTypes.i64 then
			local _ = nil
			local var500, var501 = protoModule.readFixed64(p16, var484)
			local _ = var500
			var484 = var501
		else
			error("Unsupported wire type: " .. var993)
		end
	end
	return var483
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
	local var502 = t_16.new()
	
	if self.key ~= nil then
		var502.key = self.key
	end
	if self.value ~= nil then
		var502.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var502
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
	local var502 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var503, var504 = protoModule.writeTag(buff, var502, 1, protoModule.wireTypes.lengthDelimited)
			var503, var1015 = protoModule.writeString(var503, var504, v)
			buff = var503
			var502 = var504
		end
	end
	local buff_1 = buffer.create(var502)
	buffer.copy(buff_1, 0, buff, 0, var502)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var505 = t_17.new()
	local var506 = 0
	while var506 < buffer.len(p17) do
		local _ = nil
		local var507 = nil
		local var508, var509, var510 = protoModule.readTag(p17, var506)
		local var511 = var508
		var507 = var509
		var506 = var510
		
		if var507 == protoModule.wireTypes.varint then
			local _ = nil
			local var512, var513 = protoModule.readVarInt(p17, var506)
			local _ = var512
			var506 = var513
			continue
		end
		if var507 == protoModule.wireTypes.lengthDelimited then
			if var511 == 1 then
				local _ = nil
				local var514, var515 = protoModule.readBuffer(p17, var506)
				var506 = var515
				table.insert(var505.items, buffer.tostring(var514))
			else
				local _ = nil
				local var516, var517 = protoModule.readVarInt(p17, var506)
				var506 = var517 + var516
			end
		elseif var507 == protoModule.wireTypes.i32 then
			local _ = nil
			local var518, var519 = protoModule.readFixed32(p17, var506)
			local _ = var518
			var506 = var519
		elseif var507 == protoModule.wireTypes.i64 then
			local _ = nil
			local var520, var521 = protoModule.readFixed64(p17, var506)
			local _ = var520
			var506 = var521
		else
			error("Unsupported wire type: " .. var1019)
		end
	end
	return var505
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
	local var522 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var522.items = t
	end
	return var522
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
	local var523 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var524, var525 = protoModule.writeTag(buff, var523, 1, protoModule.wireTypes.lengthDelimited)
		var524, var1041 = protoModule.writeString(var524, var525, self.universe_id)
		buff = var524
		var523 = var525
	end
	if self.user_owns_experience then
		local var526, var527 = protoModule.writeTag(buff, var523, 2, protoModule.wireTypes.varint)
		var526, var1043 = protoModule.writeVarInt(var526, var527, if self.user_owns_experience then 1 else 0)
		buff = var526
		var523 = var527
	end
	local buff_1 = buffer.create(var523)
	buffer.copy(buff_1, 0, buff, 0, var523)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var523 = t_18.new()
	local var524 = 0
	while var524 < buffer.len(p18) do
		local _ = nil
		local var525 = nil
		local var526, var527, var528 = protoModule.readTag(p18, var524)
		local var529 = var526
		var525 = var527
		var524 = var528
		
		if var525 == protoModule.wireTypes.varint then
			if var529 == 2 then
				local _ = nil
				local var530, var531 = protoModule.readVarInt(p18, var524)
				var524 = var531
				var523.user_owns_experience = var530 ~= 0
			else
				local _ = nil
				local var532, var533 = protoModule.readVarInt(p18, var524)
				local _ = var532
				var524 = var533
			end
		end
		if var525 == protoModule.wireTypes.lengthDelimited then
			if var529 == 1 then
				local _ = nil
				local var534, var535 = protoModule.readBuffer(p18, var524)
				var524 = var535
				var523.universe_id = buffer.tostring(var534)
			else
				local _ = nil
				local var536, var537 = protoModule.readVarInt(p18, var524)
				var524 = var537 + var536
			end
		elseif var525 == protoModule.wireTypes.i32 then
			local _ = nil
			local var538, var539 = protoModule.readFixed32(p18, var524)
			local _ = var538
			var524 = var539
		elseif var525 == protoModule.wireTypes.i64 then
			local _ = nil
			local var540, var541 = protoModule.readFixed64(p18, var524)
			local _ = var540
			var524 = var541
		else
			error("Unsupported wire type: " .. var1047)
		end
	end
	return var523
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
	local var542 = t_18.new()
	
	if self.universe_id ~= nil then
		var542.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var542.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var542.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var542.user_owns_experience = self.userOwnsExperience
	end
	return var542
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
	local var542 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var543, var544 = protoModule.writeTag(buff, var542, 1, protoModule.wireTypes.lengthDelimited)
		var543, var1069 = protoModule.writeString(var543, var544, self.media_asset_id)
		buff = var543
		var542 = var544
	end
	local buff_1 = buffer.create(var542)
	buffer.copy(buff_1, 0, buff, 0, var542)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var542 = t_19.new()
	local var543 = 0
	while var543 < buffer.len(p19) do
		local _ = nil
		local var544 = nil
		local var545, var546, var547 = protoModule.readTag(p19, var543)
		local var548 = var545
		var544 = var546
		var543 = var547
		
		if var544 == protoModule.wireTypes.varint then
			local _ = nil
			local var549, var550 = protoModule.readVarInt(p19, var543)
			local _ = var549
			var543 = var550
			continue
		end
		if var544 == protoModule.wireTypes.lengthDelimited then
			if var548 == 1 then
				local _ = nil
				local var551, var552 = protoModule.readBuffer(p19, var543)
				var543 = var552
				var542.media_asset_id = buffer.tostring(var551)
			else
				local _ = nil
				local var553, var554 = protoModule.readVarInt(p19, var543)
				var543 = var554 + var553
			end
		elseif var544 == protoModule.wireTypes.i32 then
			local _ = nil
			local var555, var556 = protoModule.readFixed32(p19, var543)
			local _ = var555
			var543 = var556
		elseif var544 == protoModule.wireTypes.i64 then
			local _ = nil
			local var557, var558 = protoModule.readFixed64(p19, var543)
			local _ = var557
			var543 = var558
		else
			error("Unsupported wire type: " .. var1073)
		end
	end
	return var542
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
	local var559 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var559.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var559.media_asset_id = self.mediaAssetId
	end
	return var559
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
	local var559 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var560, var561 = protoModule.writeTag(buff, var559, 1, protoModule.wireTypes.lengthDelimited)
		var560, var1093 = protoModule.writeString(var560, var561, self.universe_id)
		buff = var560
		var559 = var561
	end
	local buff_1 = buffer.create(var559)
	buffer.copy(buff_1, 0, buff, 0, var559)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var559 = t_20.new()
	local var560 = 0
	while var560 < buffer.len(p20) do
		local _ = nil
		local var561 = nil
		local var562, var563, var564 = protoModule.readTag(p20, var560)
		local var565 = var562
		var561 = var563
		var560 = var564
		
		if var561 == protoModule.wireTypes.varint then
			local _ = nil
			local var566, var567 = protoModule.readVarInt(p20, var560)
			local _ = var566
			var560 = var567
			continue
		end
		if var561 == protoModule.wireTypes.lengthDelimited then
			if var565 == 1 then
				local _ = nil
				local var568, var569 = protoModule.readBuffer(p20, var560)
				var560 = var569
				var559.universe_id = buffer.tostring(var568)
			else
				local _ = nil
				local var570, var571 = protoModule.readVarInt(p20, var560)
				var560 = var571 + var570
			end
		elseif var561 == protoModule.wireTypes.i32 then
			local _ = nil
			local var572, var573 = protoModule.readFixed32(p20, var560)
			local _ = var572
			var560 = var573
		elseif var561 == protoModule.wireTypes.i64 then
			local _ = nil
			local var574, var575 = protoModule.readFixed64(p20, var560)
			local _ = var574
			var560 = var575
		else
			error("Unsupported wire type: " .. var1097)
		end
	end
	return var559
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
	local var576 = t_20.new()
	
	if self.universe_id ~= nil then
		var576.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var576.universe_id = self.universeId
	end
	return var576
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
	local var576 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var577, var578 = protoModule.writeTag(buff, var576, 1, protoModule.wireTypes.lengthDelimited)
		var577, var1117 = protoModule.writeString(var577, var578, self.universe_id)
		buff = var577
		var576 = var578
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var579, var580 = protoModule.writeTag(buff, var576, 2, protoModule.wireTypes.lengthDelimited)
		var579, var1119 = protoModule.writeString(var579, var580, self.creator_key)
		buff = var579
		var576 = var580
	end
	local buff_1 = buffer.create(var576)
	buffer.copy(buff_1, 0, buff, 0, var576)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var576 = t_21.new()
	local var577 = 0
	while var577 < buffer.len(p21) do
		local _ = nil
		local var578 = nil
		local var579, var580, var581 = protoModule.readTag(p21, var577)
		local var582 = var579
		var578 = var580
		var577 = var581
		
		if var578 == protoModule.wireTypes.varint then
			local _ = nil
			local var583, var584 = protoModule.readVarInt(p21, var577)
			local _ = var583
			var577 = var584
			continue
		end
		if var578 == protoModule.wireTypes.lengthDelimited then
			if var582 == 1 then
				local _ = nil
				local var585, var586 = protoModule.readBuffer(p21, var577)
				var577 = var586
				var576.universe_id = buffer.tostring(var585)
			elseif var582 == 2 then
				local _ = nil
				local var587, var588 = protoModule.readBuffer(p21, var577)
				var577 = var588
				var576.creator_key = buffer.tostring(var587)
			else
				local _ = nil
				local var589, var590 = protoModule.readVarInt(p21, var577)
				var577 = var590 + var589
			end
		elseif var578 == protoModule.wireTypes.i32 then
			local _ = nil
			local var591, var592 = protoModule.readFixed32(p21, var577)
			local _ = var591
			var577 = var592
		elseif var578 == protoModule.wireTypes.i64 then
			local _ = nil
			local var593, var594 = protoModule.readFixed64(p21, var577)
			local _ = var593
			var577 = var594
		else
			error("Unsupported wire type: " .. var1123)
		end
	end
	return var576
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
	local var595 = t_21.new()
	
	if self.universe_id ~= nil then
		var595.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var595.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var595.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var595.creator_key = self.creatorKey
	end
	return var595
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
	local var595 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var596, var597 = protoModule.writeTag(buff, var595, 1, protoModule.wireTypes.lengthDelimited)
		var596, var1145 = protoModule.writeString(var596, var597, self.universe_id)
		buff = var596
		var595 = var597
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var598, var599 = protoModule.writeTag(buff, var595, 2, protoModule.wireTypes.lengthDelimited)
		var598, var1147 = protoModule.writeString(var598, var599, self.root_place_id)
		buff = var598
		var595 = var599
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var600, var601 = protoModule.writeTag(buff, var595, 3, protoModule.wireTypes.lengthDelimited)
		var600, var1149 = protoModule.writeString(var600, var601, self.connection_played_display_name)
		buff = var600
		var595 = var601
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var602, var603 = protoModule.writeTag(buff, var595, 4, protoModule.wireTypes.lengthDelimited)
		var602, var1151 = protoModule.writeString(var602, var603, self.upsell_prompt)
		buff = var602
		var595 = var603
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var604 = v:encode()
			local var605, var606 = protoModule.writeTag(buff, var595, 5, protoModule.wireTypes.lengthDelimited)
			var605, var1154 = protoModule.writeBuffer(var605, var606, var604, buffer.len(var604))
			buff = var605
			var595 = var606
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var607, var608 = protoModule.writeTag(buff, var595, 6, protoModule.wireTypes.varint)
		var607, var1156 = protoModule.writeVarInt(var607, var608, self.connection_played_num_others)
		buff = var607
		var595 = var608
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var609, var610 = protoModule.writeTag(buff, var595, 7, protoModule.wireTypes.varint)
		var609, var1158 = protoModule.writeVarInt(var609, var610, self.connection_played_total_count)
		buff = var609
		var595 = var610
	end
	local buff_1 = buffer.create(var595)
	buffer.copy(buff_1, 0, buff, 0, var595)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var611 = t_22.new()
	local var612 = 0
	while var612 < buffer.len(p22) do
		local _ = nil
		local var613 = nil
		local var614, var615, var616 = protoModule.readTag(p22, var612)
		local var617 = var614
		var613 = var615
		var612 = var616
		
		if var613 == protoModule.wireTypes.varint then
			if var617 == 6 then
				local _ = nil
				local var618, var619 = protoModule.readVarIntI32(p22, var612)
				var612 = var619
				var611.connection_played_num_others = var618
			elseif var617 == 7 then
				local _ = nil
				local var620, var621 = protoModule.readVarIntI32(p22, var612)
				var612 = var621
				var611.connection_played_total_count = var620
			else
				local _ = nil
				local var622, var623 = protoModule.readVarInt(p22, var612)
				local _ = var622
				var612 = var623
			end
		end
		if var613 == protoModule.wireTypes.lengthDelimited then
			if var617 == 1 then
				local _ = nil
				local var624, var625 = protoModule.readBuffer(p22, var612)
				var612 = var625
				var611.universe_id = buffer.tostring(var624)
			elseif var617 == 2 then
				local _ = nil
				local var626, var627 = protoModule.readBuffer(p22, var612)
				var612 = var627
				var611.root_place_id = buffer.tostring(var626)
			elseif var617 == 3 then
				local _ = nil
				local var628, var629 = protoModule.readBuffer(p22, var612)
				var612 = var629
				var611.connection_played_display_name = buffer.tostring(var628)
			elseif var617 == 4 then
				local _ = nil
				local var630, var631 = protoModule.readBuffer(p22, var612)
				var612 = var631
				var611.upsell_prompt = buffer.tostring(var630)
			elseif var617 == 5 then
				local _ = nil
				local var632, var633 = protoModule.readBuffer(p22, var612)
				var612 = var633
				table.insert(var611.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var632))
			else
				local _ = nil
				local var634, var635 = protoModule.readVarInt(p22, var612)
				var612 = var635 + var634
			end
		elseif var613 == protoModule.wireTypes.i32 then
			local _ = nil
			local var636, var637 = protoModule.readFixed32(p22, var612)
			local _ = var636
			var612 = var637
		elseif var613 == protoModule.wireTypes.i64 then
			local _ = nil
			local var638, var639 = protoModule.readFixed64(p22, var612)
			local _ = var638
			var612 = var639
		else
			error("Unsupported wire type: " .. var1162)
		end
	end
	return var611
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
	local var640 = t_22.new()
	
	if self.universe_id ~= nil then
		var640.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var640.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var640.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var640.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var640.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var640.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var640.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var640.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var640.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var640.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var640.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var640.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var640.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var640.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var640
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
	local var641 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var642, var643 = protoModule.writeTag(buff, var641, 1, protoModule.wireTypes.lengthDelimited)
		var642, var1197 = protoModule.writeString(var642, var643, self.user_id)
		buff = var642
		var641 = var643
	end
	local buff_1 = buffer.create(var641)
	buffer.copy(buff_1, 0, buff, 0, var641)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var641 = t_23.new()
	local var642 = 0
	while var642 < buffer.len(p23) do
		local _ = nil
		local var643 = nil
		local var644, var645, var646 = protoModule.readTag(p23, var642)
		local var647 = var644
		var643 = var645
		var642 = var646
		
		if var643 == protoModule.wireTypes.varint then
			local _ = nil
			local var648, var649 = protoModule.readVarInt(p23, var642)
			local _ = var648
			var642 = var649
			continue
		end
		if var643 == protoModule.wireTypes.lengthDelimited then
			if var647 == 1 then
				local _ = nil
				local var650, var651 = protoModule.readBuffer(p23, var642)
				var642 = var651
				var641.user_id = buffer.tostring(var650)
			else
				local _ = nil
				local var652, var653 = protoModule.readVarInt(p23, var642)
				var642 = var653 + var652
			end
		elseif var643 == protoModule.wireTypes.i32 then
			local _ = nil
			local var654, var655 = protoModule.readFixed32(p23, var642)
			local _ = var654
			var642 = var655
		elseif var643 == protoModule.wireTypes.i64 then
			local _ = nil
			local var656, var657 = protoModule.readFixed64(p23, var642)
			local _ = var656
			var642 = var657
		else
			error("Unsupported wire type: " .. var1201)
		end
	end
	return var641
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
	local var658 = t_23.new()
	
	if self.user_id ~= nil then
		var658.user_id = self.user_id
	end
	if self.userId ~= nil then
		var658.user_id = self.userId
	end
	return var658
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
	local var658 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var659 = v:encode()
			local var660, var661 = protoModule.writeTag(buff, var658, 1, protoModule.wireTypes.lengthDelimited)
			var660, var1222 = protoModule.writeBuffer(var660, var661, var659, buffer.len(var659))
			buff = var660
			var658 = var661
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var662, var663 = protoModule.writeTag(buff, var658, 2, protoModule.wireTypes.lengthDelimited)
		var662, var1224 = protoModule.writeString(var662, var663, self.universe_id)
		buff = var662
		var658 = var663
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var664, var665 = protoModule.writeTag(buff, var658, 3, protoModule.wireTypes.lengthDelimited)
		var664, var1226 = protoModule.writeString(var664, var665, self.place_id)
		buff = var664
		var658 = var665
	end
	local buff_1 = buffer.create(var658)
	buffer.copy(buff_1, 0, buff, 0, var658)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var666 = t_24.new()
	local var667 = 0
	while var667 < buffer.len(p24) do
		local _ = nil
		local var668 = nil
		local var669, var670, var671 = protoModule.readTag(p24, var667)
		local var672 = var669
		var668 = var670
		var667 = var671
		
		if var668 == protoModule.wireTypes.varint then
			local _ = nil
			local var673, var674 = protoModule.readVarInt(p24, var667)
			local _ = var673
			var667 = var674
			continue
		end
		if var668 == protoModule.wireTypes.lengthDelimited then
			if var672 == 1 then
				local _ = nil
				local var675, var676 = protoModule.readBuffer(p24, var667)
				var667 = var676
				table.insert(var666.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var675))
			elseif var672 == 2 then
				local _ = nil
				local var677, var678 = protoModule.readBuffer(p24, var667)
				var667 = var678
				var666.universe_id = buffer.tostring(var677)
			elseif var672 == 3 then
				local _ = nil
				local var679, var680 = protoModule.readBuffer(p24, var667)
				var667 = var680
				var666.place_id = buffer.tostring(var679)
			else
				local _ = nil
				local var681, var682 = protoModule.readVarInt(p24, var667)
				var667 = var682 + var681
			end
		elseif var668 == protoModule.wireTypes.i32 then
			local _ = nil
			local var683, var684 = protoModule.readFixed32(p24, var667)
			local _ = var683
			var667 = var684
		elseif var668 == protoModule.wireTypes.i64 then
			local _ = nil
			local var685, var686 = protoModule.readFixed64(p24, var667)
			local _ = var685
			var667 = var686
		else
			error("Unsupported wire type: " .. var1230)
		end
	end
	return var666
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
	local var687 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var687.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var687.media_items = t_1
	end
	if self.universe_id ~= nil then
		var687.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var687.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var687.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var687.place_id = self.placeId
	end
	return var687
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
	local var688 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var689, var690 = protoModule.writeTag(buff, var688, 1, protoModule.wireTypes.lengthDelimited)
		var689, var1257 = protoModule.writeString(var689, var690, self.media_asset_id)
		buff = var689
		var688 = var690
	end
	local buff_1 = buffer.create(var688)
	buffer.copy(buff_1, 0, buff, 0, var688)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref)
	local var688 = t_25.new()
	local var689 = 0
	while var689 < buffer.len(p25) do
		local _ = nil
		local var690 = nil
		local var691, var692, var693 = protoModule.readTag(p25, var689)
		local var694 = var691
		var690 = var692
		var689 = var693
		
		if var690 == protoModule.wireTypes.varint then
			local _ = nil
			local var695, var696 = protoModule.readVarInt(p25, var689)
			local _ = var695
			var689 = var696
			continue
		end
		if var690 == protoModule.wireTypes.lengthDelimited then
			if var694 == 1 then
				local _ = nil
				local var697, var698 = protoModule.readBuffer(p25, var689)
				var689 = var698
				var688.media_asset_id = buffer.tostring(var697)
			else
				local _ = nil
				local var699, var700 = protoModule.readVarInt(p25, var689)
				var689 = var700 + var699
			end
		elseif var690 == protoModule.wireTypes.i32 then
			local _ = nil
			local var701, var702 = protoModule.readFixed32(p25, var689)
			local _ = var701
			var689 = var702
		elseif var690 == protoModule.wireTypes.i64 then
			local _ = nil
			local var703, var704 = protoModule.readFixed64(p25, var689)
			local _ = var703
			var689 = var704
		else
			error("Unsupported wire type: " .. var1261)
		end
	end
	return var688
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
	local var705 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var705.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var705.media_asset_id = self.mediaAssetId
	end
	return var705
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
	local var705 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var706, var707 = protoModule.writeTag(buff, var705, 1, protoModule.wireTypes.lengthDelimited)
		var706, var1281 = protoModule.writeString(var706, var707, self.universe_id)
		buff = var706
		var705 = var707
	end
	local buff_1 = buffer.create(var705)
	buffer.copy(buff_1, 0, buff, 0, var705)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var705 = t_26.new()
	local var706 = 0
	while var706 < buffer.len(p26) do
		local _ = nil
		local var707 = nil
		local var708, var709, var710 = protoModule.readTag(p26, var706)
		local var711 = var708
		var707 = var709
		var706 = var710
		
		if var707 == protoModule.wireTypes.varint then
			local _ = nil
			local var712, var713 = protoModule.readVarInt(p26, var706)
			local _ = var712
			var706 = var713
			continue
		end
		if var707 == protoModule.wireTypes.lengthDelimited then
			if var711 == 1 then
				local _ = nil
				local var714, var715 = protoModule.readBuffer(p26, var706)
				var706 = var715
				var705.universe_id = buffer.tostring(var714)
			else
				local _ = nil
				local var716, var717 = protoModule.readVarInt(p26, var706)
				var706 = var717 + var716
			end
		elseif var707 == protoModule.wireTypes.i32 then
			local _ = nil
			local var718, var719 = protoModule.readFixed32(p26, var706)
			local _ = var718
			var706 = var719
		elseif var707 == protoModule.wireTypes.i64 then
			local _ = nil
			local var720, var721 = protoModule.readFixed64(p26, var706)
			local _ = var720
			var706 = var721
		else
			error("Unsupported wire type: " .. var1285)
		end
	end
	return var705
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
	local var722 = t_26.new()
	
	if self.universe_id ~= nil then
		var722.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var722.universe_id = self.universeId
	end
	return var722
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
	local var722 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var723, var724 = protoModule.writeTag(buff, var722, 1, protoModule.wireTypes.lengthDelimited)
		var723, var1305 = protoModule.writeString(var723, var724, self.universe_id)
		buff = var723
		var722 = var724
	end
	local buff_1 = buffer.create(var722)
	buffer.copy(buff_1, 0, buff, 0, var722)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var722 = t_27.new()
	local var723 = 0
	while var723 < buffer.len(p27) do
		local _ = nil
		local var724 = nil
		local var725, var726, var727 = protoModule.readTag(p27, var723)
		local var728 = var725
		var724 = var726
		var723 = var727
		
		if var724 == protoModule.wireTypes.varint then
			local _ = nil
			local var729, var730 = protoModule.readVarInt(p27, var723)
			local _ = var729
			var723 = var730
			continue
		end
		if var724 == protoModule.wireTypes.lengthDelimited then
			if var728 == 1 then
				local _ = nil
				local var731, var732 = protoModule.readBuffer(p27, var723)
				var723 = var732
				var722.universe_id = buffer.tostring(var731)
			else
				local _ = nil
				local var733, var734 = protoModule.readVarInt(p27, var723)
				var723 = var734 + var733
			end
		elseif var724 == protoModule.wireTypes.i32 then
			local _ = nil
			local var735, var736 = protoModule.readFixed32(p27, var723)
			local _ = var735
			var723 = var736
		elseif var724 == protoModule.wireTypes.i64 then
			local _ = nil
			local var737, var738 = protoModule.readFixed64(p27, var723)
			local _ = var737
			var723 = var738
		else
			error("Unsupported wire type: " .. var1309)
		end
	end
	return var722
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
	local var739 = t_27.new()
	
	if self.universe_id ~= nil then
		var739.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var739.universe_id = self.universeId
	end
	return var739
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
	local var739 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var740, var741 = protoModule.writeTag(buff, var739, 1, protoModule.wireTypes.lengthDelimited)
		var740, var1329 = protoModule.writeString(var740, var741, self.universe_id)
		buff = var740
		var739 = var741
	end
	if self.has_store_items then
		local var742, var743 = protoModule.writeTag(buff, var739, 2, protoModule.wireTypes.varint)
		var742, var1331 = protoModule.writeVarInt(var742, var743, if self.has_store_items then 1 else 0)
		buff = var742
		var739 = var743
	end
	if self.has_badges then
		local var744, var745 = protoModule.writeTag(buff, var739, 3, protoModule.wireTypes.varint)
		var744, var1333 = protoModule.writeVarInt(var744, var745, if self.has_badges then 1 else 0)
		buff = var744
		var739 = var745
	end
	if self.has_game_passes then
		local var746, var747 = protoModule.writeTag(buff, var739, 4, protoModule.wireTypes.varint)
		var746, var1335 = protoModule.writeVarInt(var746, var747, if self.has_game_passes then 1 else 0)
		buff = var746
		var739 = var747
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var748, var749 = protoModule.writeTag(buff, var739, 5, protoModule.wireTypes.lengthDelimited)
		var748, var1337 = protoModule.writeString(var748, var749, self.community_id)
		buff = var748
		var739 = var749
	end
	local buff_1 = buffer.create(var739)
	buffer.copy(buff_1, 0, buff, 0, var739)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var739 = t_28.new()
	local var740 = 0
	while var740 < buffer.len(p28) do
		local _ = nil
		local var741 = nil
		local var742, var743, var744 = protoModule.readTag(p28, var740)
		local var745 = var742
		var741 = var743
		var740 = var744
		
		if var741 == protoModule.wireTypes.varint then
			if var745 == 2 then
				local _ = nil
				local var746, var747 = protoModule.readVarInt(p28, var740)
				var740 = var747
				var739.has_store_items = var746 ~= 0
			elseif var745 == 3 then
				local _ = nil
				local var748, var749 = protoModule.readVarInt(p28, var740)
				var740 = var749
				var739.has_badges = var748 ~= 0
			elseif var745 == 4 then
				local _ = nil
				local var750, var751 = protoModule.readVarInt(p28, var740)
				var740 = var751
				var739.has_game_passes = var750 ~= 0
			else
				local _ = nil
				local var752, var753 = protoModule.readVarInt(p28, var740)
				local _ = var752
				var740 = var753
			end
		end
		if var741 == protoModule.wireTypes.lengthDelimited then
			if var745 == 1 then
				local _ = nil
				local var754, var755 = protoModule.readBuffer(p28, var740)
				var740 = var755
				var739.universe_id = buffer.tostring(var754)
			elseif var745 == 5 then
				local _ = nil
				local var756, var757 = protoModule.readBuffer(p28, var740)
				var740 = var757
				var739.community_id = buffer.tostring(var756)
			else
				local _ = nil
				local var758, var759 = protoModule.readVarInt(p28, var740)
				var740 = var759 + var758
			end
		elseif var741 == protoModule.wireTypes.i32 then
			local _ = nil
			local var760, var761 = protoModule.readFixed32(p28, var740)
			local _ = var760
			var740 = var761
		elseif var741 == protoModule.wireTypes.i64 then
			local _ = nil
			local var762, var763 = protoModule.readFixed64(p28, var740)
			local _ = var762
			var740 = var763
		else
			error("Unsupported wire type: " .. var1341)
		end
	end
	return var739
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
	local var764 = t_28.new()
	
	if self.universe_id ~= nil then
		var764.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var764.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var764.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var764.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var764.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var764.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var764.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var764.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var764.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var764.community_id = self.communityId
	end
	return var764
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
	local var764 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var765, var766 = protoModule.writeTag(buff, var764, 1, protoModule.wireTypes.lengthDelimited)
		var765, var1369 = protoModule.writeString(var765, var766, self.universe_id)
		buff = var765
		var764 = var766
	end
	local buff_1 = buffer.create(var764)
	buffer.copy(buff_1, 0, buff, 0, var764)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var764 = t_29.new()
	local var765 = 0
	while var765 < buffer.len(p29) do
		local _ = nil
		local var766 = nil
		local var767, var768, var769 = protoModule.readTag(p29, var765)
		local var770 = var767
		var766 = var768
		var765 = var769
		
		if var766 == protoModule.wireTypes.varint then
			local _ = nil
			local var771, var772 = protoModule.readVarInt(p29, var765)
			local _ = var771
			var765 = var772
			continue
		end
		if var766 == protoModule.wireTypes.lengthDelimited then
			if var770 == 1 then
				local _ = nil
				local var773, var774 = protoModule.readBuffer(p29, var765)
				var765 = var774
				var764.universe_id = buffer.tostring(var773)
			else
				local _ = nil
				local var775, var776 = protoModule.readVarInt(p29, var765)
				var765 = var776 + var775
			end
		elseif var766 == protoModule.wireTypes.i32 then
			local _ = nil
			local var777, var778 = protoModule.readFixed32(p29, var765)
			local _ = var777
			var765 = var778
		elseif var766 == protoModule.wireTypes.i64 then
			local _ = nil
			local var779, var780 = protoModule.readFixed64(p29, var765)
			local _ = var779
			var765 = var780
		else
			error("Unsupported wire type: " .. var1373)
		end
	end
	return var764
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
	local var781 = t_29.new()
	
	if self.universe_id ~= nil then
		var781.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var781.universe_id = self.universeId
	end
	return var781
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
	local var781 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var782, var783 = protoModule.writeTag(buff, var781, 1, protoModule.wireTypes.lengthDelimited)
		var782, var1393 = protoModule.writeString(var782, var783, self.universe_id)
		buff = var782
		var781 = var783
	end
	if self.user_owns_experience then
		local var784, var785 = protoModule.writeTag(buff, var781, 2, protoModule.wireTypes.varint)
		var784, var1395 = protoModule.writeVarInt(var784, var785, if self.user_owns_experience then 1 else 0)
		buff = var784
		var781 = var785
	end
	local buff_1 = buffer.create(var781)
	buffer.copy(buff_1, 0, buff, 0, var781)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var781 = t_30.new()
	local var782 = 0
	while var782 < buffer.len(p30) do
		local _ = nil
		local var783 = nil
		local var784, var785, var786 = protoModule.readTag(p30, var782)
		local var787 = var784
		var783 = var785
		var782 = var786
		
		if var783 == protoModule.wireTypes.varint then
			if var787 == 2 then
				local _ = nil
				local var788, var789 = protoModule.readVarInt(p30, var782)
				var782 = var789
				var781.user_owns_experience = var788 ~= 0
			else
				local _ = nil
				local var790, var791 = protoModule.readVarInt(p30, var782)
				local _ = var790
				var782 = var791
			end
		end
		if var783 == protoModule.wireTypes.lengthDelimited then
			if var787 == 1 then
				local _ = nil
				local var792, var793 = protoModule.readBuffer(p30, var782)
				var782 = var793
				var781.universe_id = buffer.tostring(var792)
			else
				local _ = nil
				local var794, var795 = protoModule.readVarInt(p30, var782)
				var782 = var795 + var794
			end
		elseif var783 == protoModule.wireTypes.i32 then
			local _ = nil
			local var796, var797 = protoModule.readFixed32(p30, var782)
			local _ = var796
			var782 = var797
		elseif var783 == protoModule.wireTypes.i64 then
			local _ = nil
			local var798, var799 = protoModule.readFixed64(p30, var782)
			local _ = var798
			var782 = var799
		else
			error("Unsupported wire type: " .. var1399)
		end
	end
	return var781
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
	local var800 = t_30.new()
	
	if self.universe_id ~= nil then
		var800.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var800.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var800.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var800.user_owns_experience = self.userOwnsExperience
	end
	return var800
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
	local var800 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var801, var802 = protoModule.writeTag(buff, var800, 1, protoModule.wireTypes.lengthDelimited)
		var801, var1421 = protoModule.writeString(var801, var802, self.universe_id)
		buff = var801
		var800 = var802
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var803, var804 = protoModule.writeTag(buff, var800, 2, protoModule.wireTypes.lengthDelimited)
		var803, var1423 = protoModule.writeString(var803, var804, self.place_id)
		buff = var803
		var800 = var804
	end
	local buff_1 = buffer.create(var800)
	buffer.copy(buff_1, 0, buff, 0, var800)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var800 = t_31.new()
	local var801 = 0
	while var801 < buffer.len(p31) do
		local _ = nil
		local var802 = nil
		local var803, var804, var805 = protoModule.readTag(p31, var801)
		local var806 = var803
		var802 = var804
		var801 = var805
		
		if var802 == protoModule.wireTypes.varint then
			local _ = nil
			local var807, var808 = protoModule.readVarInt(p31, var801)
			local _ = var807
			var801 = var808
			continue
		end
		if var802 == protoModule.wireTypes.lengthDelimited then
			if var806 == 1 then
				local _ = nil
				local var809, var810 = protoModule.readBuffer(p31, var801)
				var801 = var810
				var800.universe_id = buffer.tostring(var809)
			elseif var806 == 2 then
				local _ = nil
				local var811, var812 = protoModule.readBuffer(p31, var801)
				var801 = var812
				var800.place_id = buffer.tostring(var811)
			else
				local _ = nil
				local var813, var814 = protoModule.readVarInt(p31, var801)
				var801 = var814 + var813
			end
		elseif var802 == protoModule.wireTypes.i32 then
			local _ = nil
			local var815, var816 = protoModule.readFixed32(p31, var801)
			local _ = var815
			var801 = var816
		elseif var802 == protoModule.wireTypes.i64 then
			local _ = nil
			local var817, var818 = protoModule.readFixed64(p31, var801)
			local _ = var817
			var801 = var818
		else
			error("Unsupported wire type: " .. var1427)
		end
	end
	return var800
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
	local var819 = t_31.new()
	
	if self.universe_id ~= nil then
		var819.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var819.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var819.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var819.place_id = self.placeId
	end
	return var819
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
	local var819 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var820, var821 = protoModule.writeTag(buff, var819, 1, protoModule.wireTypes.lengthDelimited)
		var820, var1449 = protoModule.writeString(var820, var821, self.community_id)
		buff = var820
		var819 = var821
	end
	local buff_1 = buffer.create(var819)
	buffer.copy(buff_1, 0, buff, 0, var819)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var819 = t_32.new()
	local var820 = 0
	while var820 < buffer.len(p32) do
		local _ = nil
		local var821 = nil
		local var822, var823, var824 = protoModule.readTag(p32, var820)
		local var825 = var822
		var821 = var823
		var820 = var824
		
		if var821 == protoModule.wireTypes.varint then
			local _ = nil
			local var826, var827 = protoModule.readVarInt(p32, var820)
			local _ = var826
			var820 = var827
			continue
		end
		if var821 == protoModule.wireTypes.lengthDelimited then
			if var825 == 1 then
				local _ = nil
				local var828, var829 = protoModule.readBuffer(p32, var820)
				var820 = var829
				var819.community_id = buffer.tostring(var828)
			else
				local _ = nil
				local var830, var831 = protoModule.readVarInt(p32, var820)
				var820 = var831 + var830
			end
		elseif var821 == protoModule.wireTypes.i32 then
			local _ = nil
			local var832, var833 = protoModule.readFixed32(p32, var820)
			local _ = var832
			var820 = var833
		elseif var821 == protoModule.wireTypes.i64 then
			local _ = nil
			local var834, var835 = protoModule.readFixed64(p32, var820)
			local _ = var834
			var820 = var835
		else
			error("Unsupported wire type: " .. var1453)
		end
	end
	return var819
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
	local var836 = t_32.new()
	
	if self.community_id ~= nil then
		var836.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var836.community_id = self.communityId
	end
	return var836
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
	local var836 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var837 = v:encode()
			local var838, var839 = protoModule.writeTag(buff, var836, 1, protoModule.wireTypes.lengthDelimited)
			var838, var1474 = protoModule.writeBuffer(var838, var839, var837, buffer.len(var837))
			buff = var838
			var836 = var839
		end
	end
	local buff_1 = buffer.create(var836)
	buffer.copy(buff_1, 0, buff, 0, var836)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var840 = t_33.new()
	local var841 = 0
	while var841 < buffer.len(p33) do
		local _ = nil
		local var842 = nil
		local var843, var844, var845 = protoModule.readTag(p33, var841)
		local var846 = var843
		var842 = var844
		var841 = var845
		
		if var842 == protoModule.wireTypes.varint then
			local _ = nil
			local var847, var848 = protoModule.readVarInt(p33, var841)
			local _ = var847
			var841 = var848
			continue
		end
		if var842 == protoModule.wireTypes.lengthDelimited then
			if var846 == 1 then
				local _ = nil
				local var849, var850 = protoModule.readBuffer(p33, var841)
				var841 = var850
				table.insert(var840.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var849))
			else
				local _ = nil
				local var851, var852 = protoModule.readVarInt(p33, var841)
				var841 = var852 + var851
			end
		elseif var842 == protoModule.wireTypes.i32 then
			local _ = nil
			local var853, var854 = protoModule.readFixed32(p33, var841)
			local _ = var853
			var841 = var854
		elseif var842 == protoModule.wireTypes.i64 then
			local _ = nil
			local var855, var856 = protoModule.readFixed64(p33, var841)
			local _ = var855
			var841 = var856
		else
			error("Unsupported wire type: " .. var1478)
		end
	end
	return var840
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
	local var857 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var857.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var857.social_link_items = t_1
	end
	return var857
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
	local var858 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var859, var860 = protoModule.writeTag(buff, var858, 1, protoModule.wireTypes.lengthDelimited)
		var859, var1501 = protoModule.writeString(var859, var860, self.social_link_id)
		buff = var859
		var858 = var860
	end
	local buff_1 = buffer.create(var858)
	buffer.copy(buff_1, 0, buff, 0, var858)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref)
	local var858 = t_34.new()
	local var859 = 0
	while var859 < buffer.len(p34) do
		local _ = nil
		local var860 = nil
		local var861, var862, var863 = protoModule.readTag(p34, var859)
		local var864 = var861
		var860 = var862
		var859 = var863
		
		if var860 == protoModule.wireTypes.varint then
			local _ = nil
			local var865, var866 = protoModule.readVarInt(p34, var859)
			local _ = var865
			var859 = var866
			continue
		end
		if var860 == protoModule.wireTypes.lengthDelimited then
			if var864 == 1 then
				local _ = nil
				local var867, var868 = protoModule.readBuffer(p34, var859)
				var859 = var868
				var858.social_link_id = buffer.tostring(var867)
			else
				local _ = nil
				local var869, var870 = protoModule.readVarInt(p34, var859)
				var859 = var870 + var869
			end
		elseif var860 == protoModule.wireTypes.i32 then
			local _ = nil
			local var871, var872 = protoModule.readFixed32(p34, var859)
			local _ = var871
			var859 = var872
		elseif var860 == protoModule.wireTypes.i64 then
			local _ = nil
			local var873, var874 = protoModule.readFixed64(p34, var859)
			local _ = var873
			var859 = var874
		else
			error("Unsupported wire type: " .. var1505)
		end
	end
	return var858
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
	local var875 = t_34.new()
	
	if self.social_link_id ~= nil then
		var875.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var875.social_link_id = self.socialLinkId
	end
	return var875
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
	local var875 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var876, var877 = protoModule.writeTag(buff, var875, 1, protoModule.wireTypes.lengthDelimited)
		var876, var1525 = protoModule.writeString(var876, var877, self.title)
		buff = var876
		var875 = var877
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var878 = v:encode()
			local var879, var880 = protoModule.writeTag(buff, var875, 2, protoModule.wireTypes.lengthDelimited)
			var879, var1528 = protoModule.writeBuffer(var879, var880, var878, buffer.len(var878))
			buff = var879
			var875 = var880
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var881, var882 = protoModule.writeTag(buff, var875, 3, protoModule.wireTypes.lengthDelimited)
		var881, var1530 = protoModule.writeString(var881, var882, self.next_page_token)
		buff = var881
		var875 = var882
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var883, var884 = protoModule.writeTag(buff, var875, 4, protoModule.wireTypes.lengthDelimited)
		var883, var1532 = protoModule.writeString(var883, var884, self.sort_id)
		buff = var883
		var875 = var884
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var885, var886 = protoModule.writeTag(buff, var875, 5, protoModule.wireTypes.varint)
		var885, var1534 = protoModule.writeVarInt(var885, var886, self.secondary_sort_id)
		buff = var885
		var875 = var886
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var887, var888 = protoModule.writeTag(buff, var875, 6, protoModule.wireTypes.varint)
		var887, var1536 = protoModule.writeVarInt(var887, var888, self.max_visible_rows)
		buff = var887
		var875 = var888
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var889, var890 = protoModule.writeTag(buff, var875, 7, protoModule.wireTypes.lengthDelimited)
		var889, var1538 = protoModule.writeString(var889, var890, self.subtitle)
		buff = var889
		var875 = var890
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var891, var892 = protoModule.writeTag(buff, var875, 8, protoModule.wireTypes.lengthDelimited)
		var891, var1540 = protoModule.writeString(var891, var892, self.info_text)
		buff = var891
		var875 = var892
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var893, var894 = protoModule.writeTag(buff, var875, 9, protoModule.wireTypes.lengthDelimited)
		var893, var1542 = protoModule.writeString(var893, var894, self.subtitle_link_path)
		buff = var893
		var875 = var894
	end
	if self.is_placeholder ~= nil then
		local var895, var896 = protoModule.writeTag(buff, var875, 10, protoModule.wireTypes.varint)
		var895, var1544 = protoModule.writeVarInt(var895, var896, if self.is_placeholder then 1 else 0)
		buff = var895
		var875 = var896
	end
	if self.primary_sort_id ~= nil then
		local var897, var898 = protoModule.writeTag(buff, var875, 11, protoModule.wireTypes.varint)
		var897, var1546 = protoModule.writeVarInt(var897, var898, self.primary_sort_id)
		buff = var897
		var875 = var898
	end
	if self.applied_filters ~= nil then
		local var899, var900 = protoModule.writeTag(buff, var875, 12, protoModule.wireTypes.lengthDelimited)
		var899, var1548 = protoModule.writeString(var899, var900, self.applied_filters)
		buff = var899
		var875 = var900
	end
	if self.pool_id ~= nil then
		local var901, var902 = protoModule.writeTag(buff, var875, 13, protoModule.wireTypes.lengthDelimited)
		var901, var1550 = protoModule.writeString(var901, var902, self.pool_id)
		buff = var901
		var875 = var902
	end
	if self.has_emphasized_tile then
		local var903, var904 = protoModule.writeTag(buff, var875, 14, protoModule.wireTypes.varint)
		var903, var1552 = protoModule.writeVarInt(var903, var904, if self.has_emphasized_tile then 1 else 0)
		buff = var903
		var875 = var904
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var905, var906 = protoModule.writeTag(buff, var875, 15, protoModule.wireTypes.lengthDelimited)
		var905, var1554 = protoModule.writeString(var905, var906, self.tile_activation_mode)
		buff = var905
		var875 = var906
	end
	if self.initial_feed_visible_rows ~= nil then
		local var907, var908 = protoModule.writeTag(buff, var875, 16, protoModule.wireTypes.varint)
		var907, var1556 = protoModule.writeVarInt(var907, var908, self.initial_feed_visible_rows)
		buff = var907
		var875 = var908
	end
	if self.visible_rows_per_reveal ~= nil then
		local var909, var910 = protoModule.writeTag(buff, var875, 17, protoModule.wireTypes.varint)
		var909, var1558 = protoModule.writeVarInt(var909, var910, self.visible_rows_per_reveal)
		buff = var909
		var875 = var910
	end
	if self.sponsored_user_cohort ~= nil then
		local var911, var912 = protoModule.writeTag(buff, var875, 18, protoModule.wireTypes.lengthDelimited)
		var911, var1560 = protoModule.writeString(var911, var912, self.sponsored_user_cohort)
		buff = var911
		var875 = var912
	end
	if self.anchor_tag ~= nil then
		local var913, var914 = protoModule.writeTag(buff, var875, 19, protoModule.wireTypes.lengthDelimited)
		var913, var1562 = protoModule.writeString(var913, var914, self.anchor_tag)
		buff = var913
		var875 = var914
	end
	local buff_1 = buffer.create(var875)
	buffer.copy(buff_1, 0, buff, 0, var875)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var915 = t_35.new()
	local var916 = 0
	while var916 < buffer.len(p35) do
		local _ = nil
		local var917 = nil
		local var918, var919, var920 = protoModule.readTag(p35, var916)
		local var921 = var918
		var917 = var919
		var916 = var920
		
		if var917 == protoModule.wireTypes.varint then
			if var921 == 5 then
				local _ = nil
				local var922, var923 = protoModule.readVarIntI32(p35, var916)
				var916 = var923
				var915.secondary_sort_id = var922
			elseif var921 == 6 then
				local _ = nil
				local var924, var925 = protoModule.readVarIntI32(p35, var916)
				var916 = var925
				var915.max_visible_rows = var924
			elseif var921 == 10 then
				local _ = nil
				local var926, var927 = protoModule.readVarInt(p35, var916)
				var916 = var927
				var915.is_placeholder = var926 ~= 0
			elseif var921 == 11 then
				local _ = nil
				local var928, var929 = protoModule.readVarIntI32(p35, var916)
				var916 = var929
				var915.primary_sort_id = var928
			elseif var921 == 14 then
				local _ = nil
				local var930, var931 = protoModule.readVarInt(p35, var916)
				var916 = var931
				var915.has_emphasized_tile = var930 ~= 0
			elseif var921 == 16 then
				local _ = nil
				local var932, var933 = protoModule.readVarIntI32(p35, var916)
				var916 = var933
				var915.initial_feed_visible_rows = var932
			elseif var921 == 17 then
				local _ = nil
				local var934, var935 = protoModule.readVarIntI32(p35, var916)
				var916 = var935
				var915.visible_rows_per_reveal = var934
			else
				local _ = nil
				local var936, var937 = protoModule.readVarInt(p35, var916)
				local _ = var936
				var916 = var937
			end
		end
		if var917 == protoModule.wireTypes.lengthDelimited then
			if var921 == 1 then
				local _ = nil
				local var938, var939 = protoModule.readBuffer(p35, var916)
				var916 = var939
				var915.title = buffer.tostring(var938)
			elseif var921 == 2 then
				local _ = nil
				local var940, var941 = protoModule.readBuffer(p35, var916)
				var916 = var941
				table.insert(var915.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var940))
			elseif var921 == 3 then
				local _ = nil
				local var942, var943 = protoModule.readBuffer(p35, var916)
				var916 = var943
				var915.next_page_token = buffer.tostring(var942)
			elseif var921 == 4 then
				local _ = nil
				local var944, var945 = protoModule.readBuffer(p35, var916)
				var916 = var945
				var915.sort_id = buffer.tostring(var944)
			elseif var921 == 7 then
				local _ = nil
				local var946, var947 = protoModule.readBuffer(p35, var916)
				var916 = var947
				var915.subtitle = buffer.tostring(var946)
			elseif var921 == 8 then
				local _ = nil
				local var948, var949 = protoModule.readBuffer(p35, var916)
				var916 = var949
				var915.info_text = buffer.tostring(var948)
			elseif var921 == 9 then
				local _ = nil
				local var950, var951 = protoModule.readBuffer(p35, var916)
				var916 = var951
				var915.subtitle_link_path = buffer.tostring(var950)
			elseif var921 == 12 then
				local _ = nil
				local var952, var953 = protoModule.readBuffer(p35, var916)
				var916 = var953
				var915.applied_filters = buffer.tostring(var952)
			elseif var921 == 13 then
				local _ = nil
				local var954, var955 = protoModule.readBuffer(p35, var916)
				var916 = var955
				var915.pool_id = buffer.tostring(var954)
			elseif var921 == 15 then
				local _ = nil
				local var956, var957 = protoModule.readBuffer(p35, var916)
				var916 = var957
				var915.tile_activation_mode = buffer.tostring(var956)
			elseif var921 == 18 then
				local _ = nil
				local var958, var959 = protoModule.readBuffer(p35, var916)
				var916 = var959
				var915.sponsored_user_cohort = buffer.tostring(var958)
			elseif var921 == 19 then
				local _ = nil
				local var960, var961 = protoModule.readBuffer(p35, var916)
				var916 = var961
				var915.anchor_tag = buffer.tostring(var960)
			else
				local _ = nil
				local var962, var963 = protoModule.readVarInt(p35, var916)
				var916 = var963 + var962
			end
		elseif var917 == protoModule.wireTypes.i32 then
			local _ = nil
			local var964, var965 = protoModule.readFixed32(p35, var916)
			local _ = var964
			var916 = var965
		elseif var917 == protoModule.wireTypes.i64 then
			local _ = nil
			local var966, var967 = protoModule.readFixed64(p35, var916)
			local _ = var966
			var916 = var967
		else
			error("Unsupported wire type: " .. var1566)
		end
	end
	return var915
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
	local var968 = t_35.new()
	
	if self.title ~= nil then
		var968.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var968.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var968.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var968.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var968.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var968.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var968.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var968.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var968.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var968.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var968.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var968.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var968.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var968.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var968.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var968.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var968.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var968.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var968.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var968.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var968.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var968.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var968.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var968.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var968.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var968.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var968.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var968.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var968.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var968.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var968.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var968.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var968.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var968.sponsored_user_cohort = self.sponsoredUserCohort
	end
	if self.anchor_tag ~= nil then
		var968.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var968.anchor_tag = self.anchorTag
	end
	return var968
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
	local var969 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var970, var971 = protoModule.writeTag(buff, var969, 1, protoModule.wireTypes.lengthDelimited)
		var970, var1625 = protoModule.writeString(var970, var971, self.universe_id)
		buff = var970
		var969 = var971
	end
	if self.is_sponsored then
		local var972, var973 = protoModule.writeTag(buff, var969, 2, protoModule.wireTypes.varint)
		var972, var1627 = protoModule.writeVarInt(var972, var973, if self.is_sponsored then 1 else 0)
		buff = var972
		var969 = var973
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var974, var975 = protoModule.writeTag(buff, var969, 3, protoModule.wireTypes.lengthDelimited)
		var974, var1629 = protoModule.writeString(var974, var975, self.roblox_component)
		buff = var974
		var969 = var975
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var976, var977 = protoModule.writeTag(buff, var969, 4, protoModule.wireTypes.lengthDelimited)
		var976, var1631 = protoModule.writeString(var976, var977, self.native_ad_data)
		buff = var976
		var969 = var977
	end
	if self.is_content_locked then
		local var978, var979 = protoModule.writeTag(buff, var969, 5, protoModule.wireTypes.varint)
		var978, var1633 = protoModule.writeVarInt(var978, var979, if self.is_content_locked then 1 else 0)
		buff = var978
		var969 = var979
	end
	if self.title ~= nil and self.title ~= "" then
		local var980, var981 = protoModule.writeTag(buff, var969, 6, protoModule.wireTypes.lengthDelimited)
		var980, var1635 = protoModule.writeString(var980, var981, self.title)
		buff = var980
		var969 = var981
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var982, var983 = protoModule.writeTag(buff, var969, 7, protoModule.wireTypes.lengthDelimited)
		var982, var1637 = protoModule.writeString(var982, var983, self.subtitle)
		buff = var982
		var969 = var983
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var984, var985 = protoModule.writeTag(buff, var969, 8, protoModule.wireTypes.lengthDelimited)
		var984, var1639 = protoModule.writeString(var984, var985, self.image_asset_id)
		buff = var984
		var969 = var985
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var986, var987 = protoModule.writeTag(buff, var969, 9, protoModule.wireTypes.lengthDelimited)
		var986, var1641 = protoModule.writeString(var986, var987, self.video_asset_id)
		buff = var986
		var969 = var987
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var988, var989 = protoModule.writeTag(buff, var969, 10, protoModule.wireTypes.lengthDelimited)
		var988, var1643 = protoModule.writeString(var988, var989, self.badge_text)
		buff = var988
		var969 = var989
	end
	if self.player_count ~= nil then
		local var990, var991 = protoModule.writeTag(buff, var969, 11, protoModule.wireTypes.varint)
		var990, var1645 = protoModule.writeVarInt(var990, var991, self.player_count)
		buff = var990
		var969 = var991
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var992, var993 = protoModule.writeTag(buff, var969, 12, protoModule.wireTypes.lengthDelimited)
		var992, var1647 = protoModule.writeString(var992, var993, self.creator_key)
		buff = var992
		var969 = var993
	end
	if self.rank ~= nil then
		local var994, var995 = protoModule.writeTag(buff, var969, 13, protoModule.wireTypes.varint)
		var994, var1649 = protoModule.writeVarInt(var994, var995, self.rank)
		buff = var994
		var969 = var995
	end
	if self.payer_name ~= nil then
		local var996, var997 = protoModule.writeTag(buff, var969, 14, protoModule.wireTypes.lengthDelimited)
		var996, var1651 = protoModule.writeString(var996, var997, self.payer_name)
		buff = var996
		var969 = var997
	end
	if self.logo_asset_id ~= nil then
		local var998, var999 = protoModule.writeTag(buff, var969, 15, protoModule.wireTypes.lengthDelimited)
		var998, var1653 = protoModule.writeString(var998, var999, self.logo_asset_id)
		buff = var998
		var969 = var999
	end
	if self.logo_aspect_ratio ~= nil then
		local var1000, var1001 = protoModule.writeTag(buff, var969, 16, protoModule.wireTypes.i64)
		var1000, var1655 = protoModule.writeDouble(var1000, var1001, self.logo_aspect_ratio)
		buff = var1000
		var969 = var1001
	end
	if self.place_id ~= nil then
		local var1002, var1003 = protoModule.writeTag(buff, var969, 17, protoModule.wireTypes.lengthDelimited)
		var1002, var1657 = protoModule.writeString(var1002, var1003, self.place_id)
		buff = var1002
		var969 = var1003
	end
	if self.launch_data ~= nil then
		local var1004, var1005 = protoModule.writeTag(buff, var969, 18, protoModule.wireTypes.lengthDelimited)
		var1004, var1659 = protoModule.writeString(var1004, var1005, self.launch_data)
		buff = var1004
		var969 = var1005
	end
	if self.tile_variant ~= nil then
		local var1006, var1007 = protoModule.writeTag(buff, var969, 19, protoModule.wireTypes.lengthDelimited)
		var1006, var1661 = protoModule.writeString(var1006, var1007, self.tile_variant)
		buff = var1006
		var969 = var1007
	end
	if self.cta_text ~= nil then
		local var1008, var1009 = protoModule.writeTag(buff, var969, 20, protoModule.wireTypes.lengthDelimited)
		var1008, var1663 = protoModule.writeString(var1008, var1009, self.cta_text)
		buff = var1008
		var969 = var1009
	end
	if self.badge_analytics_id ~= nil then
		local var1010, var1011 = protoModule.writeTag(buff, var969, 21, protoModule.wireTypes.lengthDelimited)
		var1010, var1665 = protoModule.writeString(var1010, var1011, self.badge_analytics_id)
		buff = var1010
		var969 = var1011
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1012 = v:encode()
			local var1013, var1014 = protoModule.writeTag(buff, var969, 22, protoModule.wireTypes.lengthDelimited)
			var1013, var1668 = protoModule.writeBuffer(var1013, var1014, var1012, buffer.len(var1012))
			buff = var1013
			var969 = var1014
		end
	end
	local buff_1 = buffer.create(var969)
	buffer.copy(buff_1, 0, buff, 0, var969)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1015 = t_36.new()
	local var1016 = 0
	while var1016 < buffer.len(p36) do
		local _ = nil
		local var1017 = nil
		local var1018, var1019, var1020 = protoModule.readTag(p36, var1016)
		local var1021 = var1018
		var1017 = var1019
		var1016 = var1020
		
		if var1017 == protoModule.wireTypes.varint then
			if var1021 == 2 then
				local _ = nil
				local var1022, var1023 = protoModule.readVarInt(p36, var1016)
				var1016 = var1023
				var1015.is_sponsored = var1022 ~= 0
			elseif var1021 == 5 then
				local _ = nil
				local var1024, var1025 = protoModule.readVarInt(p36, var1016)
				var1016 = var1025
				var1015.is_content_locked = var1024 ~= 0
			elseif var1021 == 11 then
				local _ = nil
				local var1026, var1027 = protoModule.readVarIntI64(p36, var1016)
				var1016 = var1027
				var1015.player_count = var1026
			elseif var1021 == 13 then
				local _ = nil
				local var1028, var1029 = protoModule.readVarIntI32(p36, var1016)
				var1016 = var1029
				var1015.rank = var1028
			else
				local _ = nil
				local var1030, var1031 = protoModule.readVarInt(p36, var1016)
				local _ = var1030
				var1016 = var1031
			end
		end
		if var1017 == protoModule.wireTypes.lengthDelimited then
			if var1021 == 1 then
				local _ = nil
				local var1032, var1033 = protoModule.readBuffer(p36, var1016)
				var1016 = var1033
				var1015.universe_id = buffer.tostring(var1032)
			elseif var1021 == 3 then
				local _ = nil
				local var1034, var1035 = protoModule.readBuffer(p36, var1016)
				var1016 = var1035
				var1015.roblox_component = buffer.tostring(var1034)
			elseif var1021 == 4 then
				local _ = nil
				local var1036, var1037 = protoModule.readBuffer(p36, var1016)
				var1016 = var1037
				var1015.native_ad_data = buffer.tostring(var1036)
			elseif var1021 == 6 then
				local _ = nil
				local var1038, var1039 = protoModule.readBuffer(p36, var1016)
				var1016 = var1039
				var1015.title = buffer.tostring(var1038)
			elseif var1021 == 7 then
				local _ = nil
				local var1040, var1041 = protoModule.readBuffer(p36, var1016)
				var1016 = var1041
				var1015.subtitle = buffer.tostring(var1040)
			elseif var1021 == 8 then
				local _ = nil
				local var1042, var1043 = protoModule.readBuffer(p36, var1016)
				var1016 = var1043
				var1015.image_asset_id = buffer.tostring(var1042)
			elseif var1021 == 9 then
				local _ = nil
				local var1044, var1045 = protoModule.readBuffer(p36, var1016)
				var1016 = var1045
				var1015.video_asset_id = buffer.tostring(var1044)
			elseif var1021 == 10 then
				local _ = nil
				local var1046, var1047 = protoModule.readBuffer(p36, var1016)
				var1016 = var1047
				var1015.badge_text = buffer.tostring(var1046)
			elseif var1021 == 12 then
				local _ = nil
				local var1048, var1049 = protoModule.readBuffer(p36, var1016)
				var1016 = var1049
				var1015.creator_key = buffer.tostring(var1048)
			elseif var1021 == 14 then
				local _ = nil
				local var1050, var1051 = protoModule.readBuffer(p36, var1016)
				var1016 = var1051
				var1015.payer_name = buffer.tostring(var1050)
			elseif var1021 == 15 then
				local _ = nil
				local var1052, var1053 = protoModule.readBuffer(p36, var1016)
				var1016 = var1053
				var1015.logo_asset_id = buffer.tostring(var1052)
			elseif var1021 == 17 then
				local _ = nil
				local var1054, var1055 = protoModule.readBuffer(p36, var1016)
				var1016 = var1055
				var1015.place_id = buffer.tostring(var1054)
			elseif var1021 == 18 then
				local _ = nil
				local var1056, var1057 = protoModule.readBuffer(p36, var1016)
				var1016 = var1057
				var1015.launch_data = buffer.tostring(var1056)
			elseif var1021 == 19 then
				local _ = nil
				local var1058, var1059 = protoModule.readBuffer(p36, var1016)
				var1016 = var1059
				var1015.tile_variant = buffer.tostring(var1058)
			elseif var1021 == 20 then
				local _ = nil
				local var1060, var1061 = protoModule.readBuffer(p36, var1016)
				var1016 = var1061
				var1015.cta_text = buffer.tostring(var1060)
			elseif var1021 == 21 then
				local _ = nil
				local var1062, var1063 = protoModule.readBuffer(p36, var1016)
				var1016 = var1063
				var1015.badge_analytics_id = buffer.tostring(var1062)
			elseif var1021 == 22 then
				local _ = nil
				local var1064, var1065 = protoModule.readBuffer(p36, var1016)
				var1016 = var1065
				table.insert(var1015.game_items, t.GameItemInputData.decode(var1064))
			else
				local _ = nil
				local var1066, var1067 = protoModule.readVarInt(p36, var1016)
				var1016 = var1067 + var1066
			end
		elseif var1017 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1068, var1069 = protoModule.readFixed32(p36, var1016)
			local _ = var1068
			var1016 = var1069
		elseif var1017 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1672)
		elseif var1021 == 16 then
			local _ = nil
			local var1070, var1071 = protoModule.readDouble(p36, var1016)
			var1016 = var1071
			var1015.logo_aspect_ratio = var1070
		else
			local _ = nil
			local var1072, var1073 = protoModule.readFixed64(p36, var1016)
			local _ = var1072
			var1016 = var1073
		end
	end
	return var1015
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
	local var1074 = t_36.new()
	
	if self.universe_id ~= nil then
		var1074.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1074.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1074.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1074.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1074.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1074.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1074.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1074.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1074.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1074.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1074.title = self.title
	end
	if self.subtitle ~= nil then
		var1074.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1074.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1074.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1074.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1074.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1074.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1074.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1074.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1074.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1074.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1074.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1074.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1074.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1074.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1074.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1074.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1074.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1074.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1074.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1074.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1074.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1074.launch_data = self.launchData
	end
	if self.tile_variant ~= nil then
		var1074.tile_variant = self.tile_variant
	end
	if self.tileVariant ~= nil then
		var1074.tile_variant = self.tileVariant
	end
	if self.cta_text ~= nil then
		var1074.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1074.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1074.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1074.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1074.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1074.game_items = t_1
	end
	return var1074
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
	local var1075 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1076, var1077 = protoModule.writeTag(buff, var1075, 1, protoModule.wireTypes.lengthDelimited)
		var1076, var1737 = protoModule.writeString(var1076, var1077, self.title)
		buff = var1076
		var1075 = var1077
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1078 = v:encode()
			local var1079, var1080 = protoModule.writeTag(buff, var1075, 2, protoModule.wireTypes.lengthDelimited)
			var1079, var1740 = protoModule.writeBuffer(var1079, var1080, var1078, buffer.len(var1078))
			buff = var1079
			var1075 = var1080
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1081, var1082 = protoModule.writeTag(buff, var1075, 3, protoModule.wireTypes.lengthDelimited)
		var1081, var1742 = protoModule.writeString(var1081, var1082, self.next_page_token)
		buff = var1081
		var1075 = var1082
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1083, var1084 = protoModule.writeTag(buff, var1075, 4, protoModule.wireTypes.lengthDelimited)
		var1083, var1744 = protoModule.writeString(var1083, var1084, self.sort_id)
		buff = var1083
		var1075 = var1084
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1085, var1086 = protoModule.writeTag(buff, var1075, 5, protoModule.wireTypes.varint)
		var1085, var1746 = protoModule.writeVarInt(var1085, var1086, self.secondary_sort_id)
		buff = var1085
		var1075 = var1086
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1087, var1088 = protoModule.writeTag(buff, var1075, 6, protoModule.wireTypes.lengthDelimited)
		var1087, var1748 = protoModule.writeString(var1087, var1088, self.subtitle)
		buff = var1087
		var1075 = var1088
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1089, var1090 = protoModule.writeTag(buff, var1075, 7, protoModule.wireTypes.lengthDelimited)
		var1089, var1750 = protoModule.writeString(var1089, var1090, self.info_text)
		buff = var1089
		var1075 = var1090
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1091, var1092 = protoModule.writeTag(buff, var1075, 8, protoModule.wireTypes.lengthDelimited)
		var1091, var1752 = protoModule.writeString(var1091, var1092, self.subtitle_link_path)
		buff = var1091
		var1075 = var1092
	end
	if self.is_placeholder ~= nil then
		local var1093, var1094 = protoModule.writeTag(buff, var1075, 9, protoModule.wireTypes.varint)
		var1093, var1754 = protoModule.writeVarInt(var1093, var1094, if self.is_placeholder then 1 else 0)
		buff = var1093
		var1075 = var1094
	end
	if self.primary_sort_id ~= nil then
		local var1095, var1096 = protoModule.writeTag(buff, var1075, 10, protoModule.wireTypes.varint)
		var1095, var1756 = protoModule.writeVarInt(var1095, var1096, self.primary_sort_id)
		buff = var1095
		var1075 = var1096
	end
	if self.applied_filters ~= nil then
		local var1097, var1098 = protoModule.writeTag(buff, var1075, 11, protoModule.wireTypes.lengthDelimited)
		var1097, var1758 = protoModule.writeString(var1097, var1098, self.applied_filters)
		buff = var1097
		var1075 = var1098
	end
	local buff_1 = buffer.create(var1075)
	buffer.copy(buff_1, 0, buff, 0, var1075)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1099 = t_37.new()
	local var1100 = 0
	while var1100 < buffer.len(p37) do
		local _ = nil
		local var1101 = nil
		local var1102, var1103, var1104 = protoModule.readTag(p37, var1100)
		local var1105 = var1102
		var1101 = var1103
		var1100 = var1104
		
		if var1101 == protoModule.wireTypes.varint then
			if var1105 == 5 then
				local _ = nil
				local var1106, var1107 = protoModule.readVarIntI32(p37, var1100)
				var1100 = var1107
				var1099.secondary_sort_id = var1106
			elseif var1105 == 9 then
				local _ = nil
				local var1108, var1109 = protoModule.readVarInt(p37, var1100)
				var1100 = var1109
				var1099.is_placeholder = var1108 ~= 0
			elseif var1105 == 10 then
				local _ = nil
				local var1110, var1111 = protoModule.readVarIntI32(p37, var1100)
				var1100 = var1111
				var1099.primary_sort_id = var1110
			else
				local _ = nil
				local var1112, var1113 = protoModule.readVarInt(p37, var1100)
				local _ = var1112
				var1100 = var1113
			end
		end
		if var1101 == protoModule.wireTypes.lengthDelimited then
			if var1105 == 1 then
				local _ = nil
				local var1114, var1115 = protoModule.readBuffer(p37, var1100)
				var1100 = var1115
				var1099.title = buffer.tostring(var1114)
			elseif var1105 == 2 then
				local _ = nil
				local var1116, var1117 = protoModule.readBuffer(p37, var1100)
				var1100 = var1117
				table.insert(var1099.song_items, t.SongCarouselInputData_SongItem.decode(var1116))
			elseif var1105 == 3 then
				local _ = nil
				local var1118, var1119 = protoModule.readBuffer(p37, var1100)
				var1100 = var1119
				var1099.next_page_token = buffer.tostring(var1118)
			elseif var1105 == 4 then
				local _ = nil
				local var1120, var1121 = protoModule.readBuffer(p37, var1100)
				var1100 = var1121
				var1099.sort_id = buffer.tostring(var1120)
			elseif var1105 == 6 then
				local _ = nil
				local var1122, var1123 = protoModule.readBuffer(p37, var1100)
				var1100 = var1123
				var1099.subtitle = buffer.tostring(var1122)
			elseif var1105 == 7 then
				local _ = nil
				local var1124, var1125 = protoModule.readBuffer(p37, var1100)
				var1100 = var1125
				var1099.info_text = buffer.tostring(var1124)
			elseif var1105 == 8 then
				local _ = nil
				local var1126, var1127 = protoModule.readBuffer(p37, var1100)
				var1100 = var1127
				var1099.subtitle_link_path = buffer.tostring(var1126)
			elseif var1105 == 11 then
				local _ = nil
				local var1128, var1129 = protoModule.readBuffer(p37, var1100)
				var1100 = var1129
				var1099.applied_filters = buffer.tostring(var1128)
			else
				local _ = nil
				local var1130, var1131 = protoModule.readVarInt(p37, var1100)
				var1100 = var1131 + var1130
			end
		elseif var1101 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1132, var1133 = protoModule.readFixed32(p37, var1100)
			local _ = var1132
			var1100 = var1133
		elseif var1101 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1134, var1135 = protoModule.readFixed64(p37, var1100)
			local _ = var1134
			var1100 = var1135
		else
			error("Unsupported wire type: " .. var1762)
		end
	end
	return var1099
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
	local var1136 = t_37.new()
	
	if self.title ~= nil then
		var1136.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1136.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1136.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1136.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1136.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1136.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1136.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1136.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1136.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1136.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1136.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1136.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1136.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1136.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1136.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1136.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1136.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1136.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1136.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1136.applied_filters = self.appliedFilters
	end
	return var1136
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
	local var1137 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1138, var1139 = protoModule.writeTag(buff, var1137, 1, protoModule.wireTypes.lengthDelimited)
		var1138, var1805 = protoModule.writeString(var1138, var1139, self.song_id)
		buff = var1138
		var1137 = var1139
	end
	local buff_1 = buffer.create(var1137)
	buffer.copy(buff_1, 0, buff, 0, var1137)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1137 = t_38.new()
	local var1138 = 0
	while var1138 < buffer.len(p38) do
		local _ = nil
		local var1139 = nil
		local var1140, var1141, var1142 = protoModule.readTag(p38, var1138)
		local var1143 = var1140
		var1139 = var1141
		var1138 = var1142
		
		if var1139 == protoModule.wireTypes.varint then
			local _ = nil
			local var1144, var1145 = protoModule.readVarInt(p38, var1138)
			local _ = var1144
			var1138 = var1145
			continue
		end
		if var1139 == protoModule.wireTypes.lengthDelimited then
			if var1143 == 1 then
				local _ = nil
				local var1146, var1147 = protoModule.readBuffer(p38, var1138)
				var1138 = var1147
				var1137.song_id = buffer.tostring(var1146)
			else
				local _ = nil
				local var1148, var1149 = protoModule.readVarInt(p38, var1138)
				var1138 = var1149 + var1148
			end
		elseif var1139 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1150, var1151 = protoModule.readFixed32(p38, var1138)
			local _ = var1150
			var1138 = var1151
		elseif var1139 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1152, var1153 = protoModule.readFixed64(p38, var1138)
			local _ = var1152
			var1138 = var1153
		else
			error("Unsupported wire type: " .. var1809)
		end
	end
	return var1137
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
	local var1154 = t_38.new()
	
	if self.song_id ~= nil then
		var1154.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1154.song_id = self.songId
	end
	return var1154
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
	local var1154 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1155, var1156 = protoModule.writeTag(buff, var1154, 1, protoModule.wireTypes.lengthDelimited)
		var1155, var1829 = protoModule.writeString(var1155, var1156, self.title)
		buff = var1155
		var1154 = var1156
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1157 = v:encode()
			local var1158, var1159 = protoModule.writeTag(buff, var1154, 2, protoModule.wireTypes.lengthDelimited)
			var1158, var1832 = protoModule.writeBuffer(var1158, var1159, var1157, buffer.len(var1157))
			buff = var1158
			var1154 = var1159
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1160, var1161 = protoModule.writeTag(buff, var1154, 3, protoModule.wireTypes.lengthDelimited)
		var1160, var1834 = protoModule.writeString(var1160, var1161, self.universe_id)
		buff = var1160
		var1154 = var1161
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1162, var1163 = protoModule.writeTag(buff, var1154, 4, protoModule.wireTypes.lengthDelimited)
		var1162, var1836 = protoModule.writeString(var1162, var1163, self.sort_id)
		buff = var1162
		var1154 = var1163
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1164, var1165 = protoModule.writeTag(buff, var1154, 5, protoModule.wireTypes.lengthDelimited)
		var1164, var1838 = protoModule.writeString(var1164, var1165, self.subtitle)
		buff = var1164
		var1154 = var1165
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1166, var1167 = protoModule.writeTag(buff, var1154, 6, protoModule.wireTypes.lengthDelimited)
		var1166, var1840 = protoModule.writeString(var1166, var1167, self.info_text)
		buff = var1166
		var1154 = var1167
	end
	local buff_1 = buffer.create(var1154)
	buffer.copy(buff_1, 0, buff, 0, var1154)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1168 = t_39.new()
	local var1169 = 0
	while var1169 < buffer.len(p39) do
		local _ = nil
		local var1170 = nil
		local var1171, var1172, var1173 = protoModule.readTag(p39, var1169)
		local var1174 = var1171
		var1170 = var1172
		var1169 = var1173
		
		if var1170 == protoModule.wireTypes.varint then
			local _ = nil
			local var1175, var1176 = protoModule.readVarInt(p39, var1169)
			local _ = var1175
			var1169 = var1176
			continue
		end
		if var1170 == protoModule.wireTypes.lengthDelimited then
			if var1174 == 1 then
				local _ = nil
				local var1177, var1178 = protoModule.readBuffer(p39, var1169)
				var1169 = var1178
				var1168.title = buffer.tostring(var1177)
			elseif var1174 == 2 then
				local _ = nil
				local var1179, var1180 = protoModule.readBuffer(p39, var1169)
				var1169 = var1180
				table.insert(var1168.event_items, t.EventsCarouselInputData_EventItem.decode(var1179))
			elseif var1174 == 3 then
				local _ = nil
				local var1181, var1182 = protoModule.readBuffer(p39, var1169)
				var1169 = var1182
				var1168.universe_id = buffer.tostring(var1181)
			elseif var1174 == 4 then
				local _ = nil
				local var1183, var1184 = protoModule.readBuffer(p39, var1169)
				var1169 = var1184
				var1168.sort_id = buffer.tostring(var1183)
			elseif var1174 == 5 then
				local _ = nil
				local var1185, var1186 = protoModule.readBuffer(p39, var1169)
				var1169 = var1186
				var1168.subtitle = buffer.tostring(var1185)
			elseif var1174 == 6 then
				local _ = nil
				local var1187, var1188 = protoModule.readBuffer(p39, var1169)
				var1169 = var1188
				var1168.info_text = buffer.tostring(var1187)
			else
				local _ = nil
				local var1189, var1190 = protoModule.readVarInt(p39, var1169)
				var1169 = var1190 + var1189
			end
		elseif var1170 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1191, var1192 = protoModule.readFixed32(p39, var1169)
			local _ = var1191
			var1169 = var1192
		elseif var1170 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1193, var1194 = protoModule.readFixed64(p39, var1169)
			local _ = var1193
			var1169 = var1194
		else
			error("Unsupported wire type: " .. var1844)
		end
	end
	return var1168
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
	local var1195 = t_39.new()
	
	if self.title ~= nil then
		var1195.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1195.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1195.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1195.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1195.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1195.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1195.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1195.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1195.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1195.info_text = self.infoText
	end
	return var1195
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
	local var1196 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1197, var1198 = protoModule.writeTag(buff, var1196, 1, protoModule.wireTypes.lengthDelimited)
		var1197, var1877 = protoModule.writeString(var1197, var1198, self.event_id)
		buff = var1197
		var1196 = var1198
	end
	local buff_1 = buffer.create(var1196)
	buffer.copy(buff_1, 0, buff, 0, var1196)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1196 = t_40.new()
	local var1197 = 0
	while var1197 < buffer.len(p40) do
		local _ = nil
		local var1198 = nil
		local var1199, var1200, var1201 = protoModule.readTag(p40, var1197)
		local var1202 = var1199
		var1198 = var1200
		var1197 = var1201
		
		if var1198 == protoModule.wireTypes.varint then
			local _ = nil
			local var1203, var1204 = protoModule.readVarInt(p40, var1197)
			local _ = var1203
			var1197 = var1204
			continue
		end
		if var1198 == protoModule.wireTypes.lengthDelimited then
			if var1202 == 1 then
				local _ = nil
				local var1205, var1206 = protoModule.readBuffer(p40, var1197)
				var1197 = var1206
				var1196.event_id = buffer.tostring(var1205)
			else
				local _ = nil
				local var1207, var1208 = protoModule.readVarInt(p40, var1197)
				var1197 = var1208 + var1207
			end
		elseif var1198 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1209, var1210 = protoModule.readFixed32(p40, var1197)
			local _ = var1209
			var1197 = var1210
		elseif var1198 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1211, var1212 = protoModule.readFixed64(p40, var1197)
			local _ = var1211
			var1197 = var1212
		else
			error("Unsupported wire type: " .. var1881)
		end
	end
	return var1196
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
	local var1213 = t_40.new()
	
	if self.event_id ~= nil then
		var1213.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1213.event_id = self.eventId
	end
	return var1213
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
	local var1213 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1214, var1215 = protoModule.writeTag(buff, var1213, 1, protoModule.wireTypes.lengthDelimited)
		var1214, var1901 = protoModule.writeString(var1214, var1215, self.universe_id)
		buff = var1214
		var1213 = var1215
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1216, var1217 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1216, var1903 = protoModule.writeString(var1216, var1217, i)
			local var1218 = v:encode()
			var1217, var1905 = protoModule.writeTag(var1216, var1217, 2, protoModule.wireTypes.lengthDelimited)
			var1217, var1905 = protoModule.writeBuffer(var1217, var1905, var1218, buffer.len(var1218))
			local var1219 = var1217
			local var1220 = var1905
			local var1221, var1222 = protoModule.writeTag(buff, var1213, 2, protoModule.wireTypes.lengthDelimited)
			var1221, var1909 = protoModule.writeBuffer(var1221, var1222, var1219, var1220)
			buff = var1221
			var1213 = var1222
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1223, var1224 = protoModule.writeTag(buff, var1213, 3, protoModule.wireTypes.lengthDelimited)
			var1223, var1911 = protoModule.writeString(var1223, var1224, v)
			buff = var1223
			var1213 = var1224
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1225, var1226 = protoModule.writeTag(buff, var1213, 4, protoModule.wireTypes.lengthDelimited)
		var1225, var1913 = protoModule.writeString(var1225, var1226, self.creator_key)
		buff = var1225
		var1213 = var1226
	end
	local buff_1 = buffer.create(var1213)
	buffer.copy(buff_1, 0, buff, 0, var1213)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1227 = t_41.new()
	local var1228 = 0
	while var1228 < buffer.len(p41) do
		local _ = nil
		local var1229 = nil
		local var1230, var1231, var1232 = protoModule.readTag(p41, var1228)
		local var1233 = var1230
		var1229 = var1231
		var1228 = var1232
		
		if var1229 == protoModule.wireTypes.varint then
			local _ = nil
			local var1234, var1235 = protoModule.readVarInt(p41, var1228)
			local _ = var1234
			var1228 = var1235
			continue
		end
		if var1229 == protoModule.wireTypes.lengthDelimited then
			if var1233 == 1 then
				local _ = nil
				local var1236, var1237 = protoModule.readBuffer(p41, var1228)
				var1228 = var1237
				var1227.universe_id = buffer.tostring(var1236)
			elseif var1233 == 2 then
				local _ = nil
				local var1238, var1239 = protoModule.readBuffer(p41, var1228)
				var1228 = var1239
				var1238 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1238)
				var1227.entry_map[var1238.key or ""] = var1238.value or t.FeedEntry.new()
			elseif var1233 == 3 then
				local _ = nil
				local var1240, var1241 = protoModule.readBuffer(p41, var1228)
				var1228 = var1241
				table.insert(var1227.entry_order, buffer.tostring(var1240))
			elseif var1233 == 4 then
				local _ = nil
				local var1242, var1243 = protoModule.readBuffer(p41, var1228)
				var1228 = var1243
				var1227.creator_key = buffer.tostring(var1242)
			else
				local _ = nil
				local var1244, var1245 = protoModule.readVarInt(p41, var1228)
				var1228 = var1245 + var1244
			end
		elseif var1229 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1246, var1247 = protoModule.readFixed32(p41, var1228)
			local _ = var1246
			var1228 = var1247
		elseif var1229 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1248, var1249 = protoModule.readFixed64(p41, var1228)
			local _ = var1248
			var1228 = var1249
		else
			error("Unsupported wire type: " .. var1917)
		end
	end
	return var1227
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
	local var1250 = t_41.new()
	
	if self.universe_id ~= nil then
		var1250.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1250.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1250.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1250.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1250.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1250.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1250.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1250.creator_key = self.creatorKey
	end
	return var1250
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
	local var1251 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1252, var1253 = protoModule.writeTag(buff, var1251, 1, protoModule.wireTypes.lengthDelimited)
		var1252, var1949 = protoModule.writeString(var1252, var1253, self.key)
		buff = var1252
		var1251 = var1253
	end
	if self.value ~= nil then
		local var1254 = self.value:encode()
		local var1255, var1256 = protoModule.writeTag(buff, var1251, 2, protoModule.wireTypes.lengthDelimited)
		var1255, var1952 = protoModule.writeBuffer(var1255, var1256, var1254, buffer.len(var1254))
		buff = var1255
		var1251 = var1256
	end
	local buff_1 = buffer.create(var1251)
	buffer.copy(buff_1, 0, buff, 0, var1251)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1251 = t_42.new()
	local var1252 = 0
	while var1252 < buffer.len(p42) do
		local _ = nil
		local var1253 = nil
		local var1254, var1255, var1256 = protoModule.readTag(p42, var1252)
		local var1257 = var1254
		var1253 = var1255
		var1252 = var1256
		
		if var1253 == protoModule.wireTypes.varint then
			local _ = nil
			local var1258, var1259 = protoModule.readVarInt(p42, var1252)
			local _ = var1258
			var1252 = var1259
			continue
		end
		if var1253 == protoModule.wireTypes.lengthDelimited then
			if var1257 == 1 then
				local _ = nil
				local var1260, var1261 = protoModule.readBuffer(p42, var1252)
				var1252 = var1261
				var1251.key = buffer.tostring(var1260)
			elseif var1257 == 2 then
				local _ = nil
				local var1262, var1263 = protoModule.readBuffer(p42, var1252)
				var1252 = var1263
				var1251.value = t.FeedEntry.decode(var1262)
			else
				local _ = nil
				local var1264, var1265 = protoModule.readVarInt(p42, var1252)
				var1252 = var1265 + var1264
			end
		elseif var1253 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1266, var1267 = protoModule.readFixed32(p42, var1252)
			local _ = var1266
			var1252 = var1267
		elseif var1253 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1268, var1269 = protoModule.readFixed64(p42, var1252)
			local _ = var1268
			var1252 = var1269
		else
			error("Unsupported wire type: " .. var1956)
		end
	end
	return var1251
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
	local var1270 = t_42.new()
	
	if self.key ~= nil then
		var1270.key = self.key
	end
	if self.value ~= nil then
		var1270.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1270
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
	local var1270 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1271 = v:encode()
			local var1272, var1273 = protoModule.writeTag(buff, var1270, 1, protoModule.wireTypes.lengthDelimited)
			var1272, var1979 = protoModule.writeBuffer(var1272, var1273, var1271, buffer.len(var1271))
			buff = var1272
			var1270 = var1273
		end
	end
	local buff_1 = buffer.create(var1270)
	buffer.copy(buff_1, 0, buff, 0, var1270)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1274 = t_43.new()
	local var1275 = 0
	while var1275 < buffer.len(p43) do
		local _ = nil
		local var1276 = nil
		local var1277, var1278, var1279 = protoModule.readTag(p43, var1275)
		local var1280 = var1277
		var1276 = var1278
		var1275 = var1279
		
		if var1276 == protoModule.wireTypes.varint then
			local _ = nil
			local var1281, var1282 = protoModule.readVarInt(p43, var1275)
			local _ = var1281
			var1275 = var1282
			continue
		end
		if var1276 == protoModule.wireTypes.lengthDelimited then
			if var1280 == 1 then
				local _ = nil
				local var1283, var1284 = protoModule.readBuffer(p43, var1275)
				var1275 = var1284
				table.insert(var1274.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1283))
			else
				local _ = nil
				local var1285, var1286 = protoModule.readVarInt(p43, var1275)
				var1275 = var1286 + var1285
			end
		elseif var1276 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1287, var1288 = protoModule.readFixed32(p43, var1275)
			local _ = var1287
			var1275 = var1288
		elseif var1276 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1289, var1290 = protoModule.readFixed64(p43, var1275)
			local _ = var1289
			var1275 = var1290
		else
			error("Unsupported wire type: " .. var1983)
		end
	end
	return var1274
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
	local var1291 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1291.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1291.game_passes = t_1
	end
	return var1291
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
	local var1292 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1293, var1294 = protoModule.writeTag(buff, var1292, 1, protoModule.wireTypes.lengthDelimited)
		var1293, var2006 = protoModule.writeString(var1293, var1294, self.game_pass_id)
		buff = var1293
		var1292 = var1294
	end
	local buff_1 = buffer.create(var1292)
	buffer.copy(buff_1, 0, buff, 0, var1292)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1292 = t_44.new()
	local var1293 = 0
	while var1293 < buffer.len(p44) do
		local _ = nil
		local var1294 = nil
		local var1295, var1296, var1297 = protoModule.readTag(p44, var1293)
		local var1298 = var1295
		var1294 = var1296
		var1293 = var1297
		
		if var1294 == protoModule.wireTypes.varint then
			local _ = nil
			local var1299, var1300 = protoModule.readVarInt(p44, var1293)
			local _ = var1299
			var1293 = var1300
			continue
		end
		if var1294 == protoModule.wireTypes.lengthDelimited then
			if var1298 == 1 then
				local _ = nil
				local var1301, var1302 = protoModule.readBuffer(p44, var1293)
				var1293 = var1302
				var1292.game_pass_id = buffer.tostring(var1301)
			else
				local _ = nil
				local var1303, var1304 = protoModule.readVarInt(p44, var1293)
				var1293 = var1304 + var1303
			end
		elseif var1294 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1305, var1306 = protoModule.readFixed32(p44, var1293)
			local _ = var1305
			var1293 = var1306
		elseif var1294 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1307, var1308 = protoModule.readFixed64(p44, var1293)
			local _ = var1307
			var1293 = var1308
		else
			error("Unsupported wire type: " .. var2010)
		end
	end
	return var1292
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
	local var1309 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1309.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1309.game_pass_id = self.gamePassId
	end
	return var1309
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
	local var1309 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1310 = v:encode()
			local var1311, var1312 = protoModule.writeTag(buff, var1309, 1, protoModule.wireTypes.lengthDelimited)
			var1311, var2031 = protoModule.writeBuffer(var1311, var1312, var1310, buffer.len(var1310))
			buff = var1311
			var1309 = var1312
		end
	end
	local buff_1 = buffer.create(var1309)
	buffer.copy(buff_1, 0, buff, 0, var1309)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1313 = t_45.new()
	local var1314 = 0
	while var1314 < buffer.len(p45) do
		local _ = nil
		local var1315 = nil
		local var1316, var1317, var1318 = protoModule.readTag(p45, var1314)
		local var1319 = var1316
		var1315 = var1317
		var1314 = var1318
		
		if var1315 == protoModule.wireTypes.varint then
			local _ = nil
			local var1320, var1321 = protoModule.readVarInt(p45, var1314)
			local _ = var1320
			var1314 = var1321
			continue
		end
		if var1315 == protoModule.wireTypes.lengthDelimited then
			if var1319 == 1 then
				local _ = nil
				local var1322, var1323 = protoModule.readBuffer(p45, var1314)
				var1314 = var1323
				table.insert(var1313.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1322))
			else
				local _ = nil
				local var1324, var1325 = protoModule.readVarInt(p45, var1314)
				var1314 = var1325 + var1324
			end
		elseif var1315 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1326, var1327 = protoModule.readFixed32(p45, var1314)
			local _ = var1326
			var1314 = var1327
		elseif var1315 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1328, var1329 = protoModule.readFixed64(p45, var1314)
			local _ = var1328
			var1314 = var1329
		else
			error("Unsupported wire type: " .. var2035)
		end
	end
	return var1313
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
	local var1330 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1330.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1330.developer_products = t_1
	end
	return var1330
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
	local var1331 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1332, var1333 = protoModule.writeTag(buff, var1331, 1, protoModule.wireTypes.lengthDelimited)
		var1332, var2058 = protoModule.writeString(var1332, var1333, self.developer_product_id)
		buff = var1332
		var1331 = var1333
	end
	local buff_1 = buffer.create(var1331)
	buffer.copy(buff_1, 0, buff, 0, var1331)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1331 = t_46.new()
	local var1332 = 0
	while var1332 < buffer.len(p46) do
		local _ = nil
		local var1333 = nil
		local var1334, var1335, var1336 = protoModule.readTag(p46, var1332)
		local var1337 = var1334
		var1333 = var1335
		var1332 = var1336
		
		if var1333 == protoModule.wireTypes.varint then
			local _ = nil
			local var1338, var1339 = protoModule.readVarInt(p46, var1332)
			local _ = var1338
			var1332 = var1339
			continue
		end
		if var1333 == protoModule.wireTypes.lengthDelimited then
			if var1337 == 1 then
				local _ = nil
				local var1340, var1341 = protoModule.readBuffer(p46, var1332)
				var1332 = var1341
				var1331.developer_product_id = buffer.tostring(var1340)
			else
				local _ = nil
				local var1342, var1343 = protoModule.readVarInt(p46, var1332)
				var1332 = var1343 + var1342
			end
		elseif var1333 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1344, var1345 = protoModule.readFixed32(p46, var1332)
			local _ = var1344
			var1332 = var1345
		elseif var1333 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1346, var1347 = protoModule.readFixed64(p46, var1332)
			local _ = var1346
			var1332 = var1347
		else
			error("Unsupported wire type: " .. var2062)
		end
	end
	return var1331
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
	local var1348 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var1348.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1348.developer_product_id = self.developerProductId
	end
	return var1348
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
	local var1348 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1349 = v:encode()
			local var1350, var1351 = protoModule.writeTag(buff, var1348, 1, protoModule.wireTypes.lengthDelimited)
			var1350, var2083 = protoModule.writeBuffer(var1350, var1351, var1349, buffer.len(var1349))
			buff = var1350
			var1348 = var1351
		end
	end
	local buff_1 = buffer.create(var1348)
	buffer.copy(buff_1, 0, buff, 0, var1348)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1352 = t_47.new()
	local var1353 = 0
	while var1353 < buffer.len(p47) do
		local _ = nil
		local var1354 = nil
		local var1355, var1356, var1357 = protoModule.readTag(p47, var1353)
		local var1358 = var1355
		var1354 = var1356
		var1353 = var1357
		
		if var1354 == protoModule.wireTypes.varint then
			local _ = nil
			local var1359, var1360 = protoModule.readVarInt(p47, var1353)
			local _ = var1359
			var1353 = var1360
			continue
		end
		if var1354 == protoModule.wireTypes.lengthDelimited then
			if var1358 == 1 then
				local _ = nil
				local var1361, var1362 = protoModule.readBuffer(p47, var1353)
				var1353 = var1362
				table.insert(var1352.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1361))
			else
				local _ = nil
				local var1363, var1364 = protoModule.readVarInt(p47, var1353)
				var1353 = var1364 + var1363
			end
		elseif var1354 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1365, var1366 = protoModule.readFixed32(p47, var1353)
			local _ = var1365
			var1353 = var1366
		elseif var1354 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1367, var1368 = protoModule.readFixed64(p47, var1353)
			local _ = var1367
			var1353 = var1368
		else
			error("Unsupported wire type: " .. var2087)
		end
	end
	return var1352
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
	local var1369 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1369.subscriptions = t_1
	end
	return var1369
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
	local var1370 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1371, var1372 = protoModule.writeTag(buff, var1370, 1, protoModule.wireTypes.lengthDelimited)
		var1371, var2109 = protoModule.writeString(var1371, var1372, self.subscription_id)
		buff = var1371
		var1370 = var1372
	end
	local buff_1 = buffer.create(var1370)
	buffer.copy(buff_1, 0, buff, 0, var1370)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1370 = t_48.new()
	local var1371 = 0
	while var1371 < buffer.len(p48) do
		local _ = nil
		local var1372 = nil
		local var1373, var1374, var1375 = protoModule.readTag(p48, var1371)
		local var1376 = var1373
		var1372 = var1374
		var1371 = var1375
		
		if var1372 == protoModule.wireTypes.varint then
			local _ = nil
			local var1377, var1378 = protoModule.readVarInt(p48, var1371)
			local _ = var1377
			var1371 = var1378
			continue
		end
		if var1372 == protoModule.wireTypes.lengthDelimited then
			if var1376 == 1 then
				local _ = nil
				local var1379, var1380 = protoModule.readBuffer(p48, var1371)
				var1371 = var1380
				var1370.subscription_id = buffer.tostring(var1379)
			else
				local _ = nil
				local var1381, var1382 = protoModule.readVarInt(p48, var1371)
				var1371 = var1382 + var1381
			end
		elseif var1372 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1383, var1384 = protoModule.readFixed32(p48, var1371)
			local _ = var1383
			var1371 = var1384
		elseif var1372 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1385, var1386 = protoModule.readFixed64(p48, var1371)
			local _ = var1385
			var1371 = var1386
		else
			error("Unsupported wire type: " .. var2113)
		end
	end
	return var1370
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
	local var1387 = t_48.new()
	
	if self.subscription_id ~= nil then
		var1387.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1387.subscription_id = self.subscriptionId
	end
	return var1387
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
	local var1387 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1388 = v:encode()
			local var1389, var1390 = protoModule.writeTag(buff, var1387, 1, protoModule.wireTypes.lengthDelimited)
			var1389, var2134 = protoModule.writeBuffer(var1389, var1390, var1388, buffer.len(var1388))
			buff = var1389
			var1387 = var1390
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1391, var1392 = protoModule.writeTag(buff, var1387, 2, protoModule.wireTypes.lengthDelimited)
		var1391, var2136 = protoModule.writeString(var1391, var1392, self.universe_id)
		buff = var1391
		var1387 = var1392
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1393, var1394 = protoModule.writeTag(buff, var1387, 3, protoModule.wireTypes.lengthDelimited)
		var1393, var2138 = protoModule.writeString(var1393, var1394, self.section_title)
		buff = var1393
		var1387 = var1394
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1395, var1396 = protoModule.writeTag(buff, var1387, 4, protoModule.wireTypes.lengthDelimited)
		var1395, var2140 = protoModule.writeString(var1395, var1396, self.creator_key)
		buff = var1395
		var1387 = var1396
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1397, var1398 = protoModule.writeTag(buff, var1387, 5, protoModule.wireTypes.lengthDelimited)
		var1397, var2142 = protoModule.writeString(var1397, var1398, self.collection_item_size)
		buff = var1397
		var1387 = var1398
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1399, var1400 = protoModule.writeTag(buff, var1387, 6, protoModule.wireTypes.lengthDelimited)
		var1399, var2144 = protoModule.writeString(var1399, var1400, self.item_height_mode)
		buff = var1399
		var1387 = var1400
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1401, var1402 = protoModule.writeTag(buff, var1387, 7, protoModule.wireTypes.lengthDelimited)
		var1401, var2146 = protoModule.writeString(var1401, var1402, self.experience_store_product_type)
		buff = var1401
		var1387 = var1402
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1403, var1404 = protoModule.writeTag(buff, var1387, 8, protoModule.wireTypes.lengthDelimited)
		var1403, var2148 = protoModule.writeString(var1403, var1404, self.content_type)
		buff = var1403
		var1387 = var1404
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1405, var1406 = protoModule.writeTag(buff, var1387, 9, protoModule.wireTypes.lengthDelimited)
		var1405, var2150 = protoModule.writeString(var1405, var1406, self.item_type)
		buff = var1405
		var1387 = var1406
	end
	local buff_1 = buffer.create(var1387)
	buffer.copy(buff_1, 0, buff, 0, var1387)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1407 = t_49.new()
	local var1408 = 0
	while var1408 < buffer.len(p49) do
		local _ = nil
		local var1409 = nil
		local var1410, var1411, var1412 = protoModule.readTag(p49, var1408)
		local var1413 = var1410
		var1409 = var1411
		var1408 = var1412
		
		if var1409 == protoModule.wireTypes.varint then
			local _ = nil
			local var1414, var1415 = protoModule.readVarInt(p49, var1408)
			local _ = var1414
			var1408 = var1415
			continue
		end
		if var1409 == protoModule.wireTypes.lengthDelimited then
			if var1413 == 1 then
				local _ = nil
				local var1416, var1417 = protoModule.readBuffer(p49, var1408)
				var1408 = var1417
				table.insert(var1407.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1416))
			elseif var1413 == 2 then
				local _ = nil
				local var1418, var1419 = protoModule.readBuffer(p49, var1408)
				var1408 = var1419
				var1407.universe_id = buffer.tostring(var1418)
			elseif var1413 == 3 then
				local _ = nil
				local var1420, var1421 = protoModule.readBuffer(p49, var1408)
				var1408 = var1421
				var1407.section_title = buffer.tostring(var1420)
			elseif var1413 == 4 then
				local _ = nil
				local var1422, var1423 = protoModule.readBuffer(p49, var1408)
				var1408 = var1423
				var1407.creator_key = buffer.tostring(var1422)
			elseif var1413 == 5 then
				local _ = nil
				local var1424, var1425 = protoModule.readBuffer(p49, var1408)
				var1408 = var1425
				var1407.collection_item_size = buffer.tostring(var1424)
			elseif var1413 == 6 then
				local _ = nil
				local var1426, var1427 = protoModule.readBuffer(p49, var1408)
				var1408 = var1427
				var1407.item_height_mode = buffer.tostring(var1426)
			elseif var1413 == 7 then
				local _ = nil
				local var1428, var1429 = protoModule.readBuffer(p49, var1408)
				var1408 = var1429
				var1407.experience_store_product_type = buffer.tostring(var1428)
			elseif var1413 == 8 then
				local _ = nil
				local var1430, var1431 = protoModule.readBuffer(p49, var1408)
				var1408 = var1431
				var1407.content_type = buffer.tostring(var1430)
			elseif var1413 == 9 then
				local _ = nil
				local var1432, var1433 = protoModule.readBuffer(p49, var1408)
				var1408 = var1433
				var1407.item_type = buffer.tostring(var1432)
			else
				local _ = nil
				local var1434, var1435 = protoModule.readVarInt(p49, var1408)
				var1408 = var1435 + var1434
			end
		elseif var1409 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1436, var1437 = protoModule.readFixed32(p49, var1408)
			local _ = var1436
			var1408 = var1437
		elseif var1409 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1438, var1439 = protoModule.readFixed64(p49, var1408)
			local _ = var1438
			var1408 = var1439
		else
			error("Unsupported wire type: " .. var2154)
		end
	end
	return var1407
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
	local var1440 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1440.items = t_1
	end
	if self.universe_id ~= nil then
		var1440.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1440.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1440.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1440.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1440.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1440.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1440.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1440.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1440.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1440.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1440.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1440.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1440.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1440.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1440.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1440.item_type = self.itemType
	end
	return var1440
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
	local var1441 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1442, var1443 = protoModule.writeTag(buff, var1441, 1, protoModule.wireTypes.lengthDelimited)
		var1442, var2192 = protoModule.writeString(var1442, var1443, self.item_id)
		buff = var1442
		var1441 = var1443
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1444, var1445 = protoModule.writeTag(buff, var1441, 2, protoModule.wireTypes.varint)
		var1444, var2194 = protoModule.writeVarInt(var1444, var1445, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1444
		var1441 = var1445
	end
	local buff_1 = buffer.create(var1441)
	buffer.copy(buff_1, 0, buff, 0, var1441)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1441 = t_50.new()
	local var1442 = 0
	while var1442 < buffer.len(p50) do
		local _ = nil
		local var1443 = nil
		local var1444, var1445, var1446 = protoModule.readTag(p50, var1442)
		local var1447 = var1444
		var1443 = var1445
		var1442 = var1446
		
		if var1443 == protoModule.wireTypes.varint then
			if var1447 == 2 then
				local _ = nil
				local var1448, var1449 = protoModule.readVarIntI32(p50, var1442)
				local var1450 = var1448
				var1442 = var1449
				var1441.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1450) or var1450
			else
				local _ = nil
				local var1451, var1452 = protoModule.readVarInt(p50, var1442)
				local _ = var1451
				var1442 = var1452
			end
		end
		if var1443 == protoModule.wireTypes.lengthDelimited then
			if var1447 == 1 then
				local _ = nil
				local var1453, var1454 = protoModule.readBuffer(p50, var1442)
				var1442 = var1454
				var1441.item_id = buffer.tostring(var1453)
			else
				local _ = nil
				local var1455, var1456 = protoModule.readVarInt(p50, var1442)
				var1442 = var1456 + var1455
			end
		elseif var1443 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1457, var1458 = protoModule.readFixed32(p50, var1442)
			local _ = var1457
			var1442 = var1458
		elseif var1443 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1459, var1460 = protoModule.readFixed64(p50, var1442)
			local _ = var1459
			var1442 = var1460
		else
			error("Unsupported wire type: " .. var2198)
		end
	end
	return var1441
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
	local var1461 = t_50.new()
	
	if self.item_id ~= nil then
		var1461.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1461.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1461.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1461
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
	local var1461 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1462, var1463 = protoModule.writeTag(buff, var1461, 1, protoModule.wireTypes.lengthDelimited)
		var1462, var2221 = protoModule.writeString(var1462, var1463, self.roblox_component)
		buff = var1462
		var1461 = var1463
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1464, var1465 = protoModule.writeTag(buff, var1461, 2, protoModule.wireTypes.lengthDelimited)
		var1464, var2223 = protoModule.writeString(var1464, var1465, self.identifier)
		buff = var1464
		var1461 = var1465
	end
	if self.title ~= nil and self.title ~= "" then
		local var1466, var1467 = protoModule.writeTag(buff, var1461, 3, protoModule.wireTypes.lengthDelimited)
		var1466, var2225 = protoModule.writeString(var1466, var1467, self.title)
		buff = var1466
		var1461 = var1467
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1468, var1469 = protoModule.writeTag(buff, var1461, 4, protoModule.wireTypes.lengthDelimited)
		var1468, var2227 = protoModule.writeString(var1468, var1469, self.user_id)
		buff = var1468
		var1461 = var1469
	end
	if self.description ~= nil and self.description ~= "" then
		local var1470, var1471 = protoModule.writeTag(buff, var1461, 5, protoModule.wireTypes.lengthDelimited)
		var1470, var2229 = protoModule.writeString(var1470, var1471, self.description)
		buff = var1470
		var1461 = var1471
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1472, var1473 = protoModule.writeTag(buff, var1461, 6, protoModule.wireTypes.lengthDelimited)
		var1472, var2231 = protoModule.writeString(var1472, var1473, self.cta_text)
		buff = var1472
		var1461 = var1473
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1474, var1475 = protoModule.writeTag(buff, var1461, 7, protoModule.wireTypes.lengthDelimited)
		var1474, var2233 = protoModule.writeString(var1474, var1475, self.prompt_id)
		buff = var1474
		var1461 = var1475
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1476, var1477 = protoModule.writeTag(buff, var1461, 8, protoModule.wireTypes.lengthDelimited)
		var1476, var2235 = protoModule.writeString(var1476, var1477, self.prompt_type)
		buff = var1476
		var1461 = var1477
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1478, var1479 = protoModule.writeTag(buff, var1461, 9, protoModule.wireTypes.lengthDelimited)
		var1478, var2237 = protoModule.writeString(var1478, var1479, self.entity_id)
		buff = var1478
		var1461 = var1479
	end
	local buff_1 = buffer.create(var1461)
	buffer.copy(buff_1, 0, buff, 0, var1461)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref)
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
				var1461.roblox_component = buffer.tostring(var1470)
			elseif var1467 == 2 then
				local _ = nil
				local var1472, var1473 = protoModule.readBuffer(p51, var1462)
				var1462 = var1473
				var1461.identifier = buffer.tostring(var1472)
			elseif var1467 == 3 then
				local _ = nil
				local var1474, var1475 = protoModule.readBuffer(p51, var1462)
				var1462 = var1475
				var1461.title = buffer.tostring(var1474)
			elseif var1467 == 4 then
				local _ = nil
				local var1476, var1477 = protoModule.readBuffer(p51, var1462)
				var1462 = var1477
				var1461.user_id = buffer.tostring(var1476)
			elseif var1467 == 5 then
				local _ = nil
				local var1478, var1479 = protoModule.readBuffer(p51, var1462)
				var1462 = var1479
				var1461.description = buffer.tostring(var1478)
			elseif var1467 == 6 then
				local _ = nil
				local var1480, var1481 = protoModule.readBuffer(p51, var1462)
				var1462 = var1481
				var1461.cta_text = buffer.tostring(var1480)
			elseif var1467 == 7 then
				local _ = nil
				local var1482, var1483 = protoModule.readBuffer(p51, var1462)
				var1462 = var1483
				var1461.prompt_id = buffer.tostring(var1482)
			elseif var1467 == 8 then
				local _ = nil
				local var1484, var1485 = protoModule.readBuffer(p51, var1462)
				var1462 = var1485
				var1461.prompt_type = buffer.tostring(var1484)
			elseif var1467 == 9 then
				local _ = nil
				local var1486, var1487 = protoModule.readBuffer(p51, var1462)
				var1462 = var1487
				var1461.entity_id = buffer.tostring(var1486)
			else
				local _ = nil
				local var1488, var1489 = protoModule.readVarInt(p51, var1462)
				var1462 = var1489 + var1488
			end
		elseif var1463 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1490, var1491 = protoModule.readFixed32(p51, var1462)
			local _ = var1490
			var1462 = var1491
		elseif var1463 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1492, var1493 = protoModule.readFixed64(p51, var1462)
			local _ = var1492
			var1462 = var1493
		else
			error("Unsupported wire type: " .. var2241)
		end
	end
	return var1461
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
	local var1494 = t_51.new()
	
	if self.roblox_component ~= nil then
		var1494.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1494.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1494.identifier = self.identifier
	end
	if self.title ~= nil then
		var1494.title = self.title
	end
	if self.user_id ~= nil then
		var1494.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1494.user_id = self.userId
	end
	if self.description ~= nil then
		var1494.description = self.description
	end
	if self.cta_text ~= nil then
		var1494.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1494.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1494.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1494.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1494.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1494.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1494.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1494.entity_id = self.entityId
	end
	return var1494
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
	local var1494 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1495, var1496 = protoModule.writeTag(buff, var1494, 1, protoModule.wireTypes.lengthDelimited)
		var1495, var2277 = protoModule.writeString(var1495, var1496, self.group_id)
		buff = var1495
		var1494 = var1496
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1497, var1498 = protoModule.writeTag(buff, var1494, 2, protoModule.wireTypes.lengthDelimited)
		var1497, var2279 = protoModule.writeString(var1497, var1498, self.experience_id)
		buff = var1497
		var1494 = var1498
	end
	local buff_1 = buffer.create(var1494)
	buffer.copy(buff_1, 0, buff, 0, var1494)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref)
	local var1494 = t_52.new()
	local var1495 = 0
	while var1495 < buffer.len(p52) do
		local _ = nil
		local var1496 = nil
		local var1497, var1498, var1499 = protoModule.readTag(p52, var1495)
		local var1500 = var1497
		var1496 = var1498
		var1495 = var1499
		
		if var1496 == protoModule.wireTypes.varint then
			local _ = nil
			local var1501, var1502 = protoModule.readVarInt(p52, var1495)
			local _ = var1501
			var1495 = var1502
			continue
		end
		if var1496 == protoModule.wireTypes.lengthDelimited then
			if var1500 == 1 then
				local _ = nil
				local var1503, var1504 = protoModule.readBuffer(p52, var1495)
				var1495 = var1504
				var1494.group_id = buffer.tostring(var1503)
			elseif var1500 == 2 then
				local _ = nil
				local var1505, var1506 = protoModule.readBuffer(p52, var1495)
				var1495 = var1506
				var1494.experience_id = buffer.tostring(var1505)
			else
				local _ = nil
				local var1507, var1508 = protoModule.readVarInt(p52, var1495)
				var1495 = var1508 + var1507
			end
		elseif var1496 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1509, var1510 = protoModule.readFixed32(p52, var1495)
			local _ = var1509
			var1495 = var1510
		elseif var1496 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1511, var1512 = protoModule.readFixed64(p52, var1495)
			local _ = var1511
			var1495 = var1512
		else
			error("Unsupported wire type: " .. var2283)
		end
	end
	return var1494
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
	local var1513 = t_52.new()
	
	if self.group_id ~= nil then
		var1513.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1513.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1513.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1513.experience_id = self.experienceId
	end
	return var1513
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
	local var1513 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1514, var1515 = protoModule.writeTag(buff, var1513, 1, protoModule.wireTypes.lengthDelimited)
		var1514, var2305 = protoModule.writeString(var1514, var1515, self.title)
		buff = var1514
		var1513 = var1515
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1516, var1517 = protoModule.writeTag(buff, var1513, 2, protoModule.wireTypes.lengthDelimited)
		var1516, var2307 = protoModule.writeString(var1516, var1517, self.dismiss_text)
		buff = var1516
		var1513 = var1517
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1518, var1519 = protoModule.writeTag(buff, var1513, 3, protoModule.wireTypes.lengthDelimited)
		var1518, var2309 = protoModule.writeString(var1518, var1519, self.user_id)
		buff = var1518
		var1513 = var1519
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1520 = v:encode()
			local var1521, var1522 = protoModule.writeTag(buff, var1513, 4, protoModule.wireTypes.lengthDelimited)
			var1521, var2312 = protoModule.writeBuffer(var1521, var1522, var1520, buffer.len(var1520))
			buff = var1521
			var1513 = var1522
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1523, var1524 = protoModule.writeTag(buff, var1513, 5, protoModule.wireTypes.lengthDelimited)
		var1523, var2314 = protoModule.writeString(var1523, var1524, self.prompt_id)
		buff = var1523
		var1513 = var1524
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1525, var1526 = protoModule.writeTag(buff, var1513, 6, protoModule.wireTypes.lengthDelimited)
		var1525, var2316 = protoModule.writeString(var1525, var1526, self.prompt_type)
		buff = var1525
		var1513 = var1526
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1527, var1528 = protoModule.writeTag(buff, var1513, 7, protoModule.wireTypes.lengthDelimited)
		var1527, var2318 = protoModule.writeString(var1527, var1528, self.sort_id)
		buff = var1527
		var1513 = var1528
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1529, var1530 = protoModule.writeTag(buff, var1513, 8, protoModule.wireTypes.lengthDelimited)
		var1529, var2320 = protoModule.writeString(var1529, var1530, self.feed_item_key)
		buff = var1529
		var1513 = var1530
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1531 = self.client_attributes.value:encode()
		local var1532, var1533 = protoModule.writeTag(buff, var1513, 9, protoModule.wireTypes.lengthDelimited)
		var1532, var2323 = protoModule.writeBuffer(var1532, var1533, var1531, buffer.len(var1531))
		buff = var1532
		var1513 = var1533
	end
	local buff_1 = buffer.create(var1513)
	buffer.copy(buff_1, 0, buff, 0, var1513)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1534 = t_53.new()
	local var1535 = 0
	while var1535 < buffer.len(p53) do
		local _ = nil
		local var1536 = nil
		local var1537, var1538, var1539 = protoModule.readTag(p53, var1535)
		local var1540 = var1537
		var1536 = var1538
		var1535 = var1539
		
		if var1536 == protoModule.wireTypes.varint then
			local _ = nil
			local var1541, var1542 = protoModule.readVarInt(p53, var1535)
			local _ = var1541
			var1535 = var1542
			continue
		end
		if var1536 == protoModule.wireTypes.lengthDelimited then
			if var1540 == 1 then
				local _ = nil
				local var1543, var1544 = protoModule.readBuffer(p53, var1535)
				var1535 = var1544
				var1534.title = buffer.tostring(var1543)
			elseif var1540 == 2 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p53, var1535)
				var1535 = var1546
				var1534.dismiss_text = buffer.tostring(var1545)
			elseif var1540 == 3 then
				local _ = nil
				local var1547, var1548 = protoModule.readBuffer(p53, var1535)
				var1535 = var1548
				var1534.user_id = buffer.tostring(var1547)
			elseif var1540 == 4 then
				local _ = nil
				local var1549, var1550 = protoModule.readBuffer(p53, var1535)
				var1535 = var1550
				table.insert(var1534.cards, t.CardContainerCardInputData.decode(var1549))
			elseif var1540 == 5 then
				local _ = nil
				local var1551, var1552 = protoModule.readBuffer(p53, var1535)
				var1535 = var1552
				var1534.prompt_id = buffer.tostring(var1551)
			elseif var1540 == 6 then
				local _ = nil
				local var1553, var1554 = protoModule.readBuffer(p53, var1535)
				var1535 = var1554
				var1534.prompt_type = buffer.tostring(var1553)
			elseif var1540 == 7 then
				local _ = nil
				local var1555, var1556 = protoModule.readBuffer(p53, var1535)
				var1535 = var1556
				var1534.sort_id = buffer.tostring(var1555)
			elseif var1540 == 8 then
				local _ = nil
				local var1557, var1558 = protoModule.readBuffer(p53, var1535)
				var1535 = var1558
				var1534.feed_item_key = buffer.tostring(var1557)
			elseif var1540 == 9 then
				local _ = nil
				local var1559, var1560 = protoModule.readBuffer(p53, var1535)
				var1535 = var1560
				var1534.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1559)
				}
			else
				local _ = nil
				local var1561, var1562 = protoModule.readVarInt(p53, var1535)
				var1535 = var1562 + var1561
			end
		elseif var1536 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1563, var1564 = protoModule.readFixed32(p53, var1535)
			local _ = var1563
			var1535 = var1564
		elseif var1536 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1565, var1566 = protoModule.readFixed64(p53, var1535)
			local _ = var1565
			var1535 = var1566
		else
			error("Unsupported wire type: " .. var2327)
		end
	end
	return var1534
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
	local var1567 = t_53.new()
	
	if self.title ~= nil then
		var1567.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1567.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1567.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1567.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1567.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1567.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1567.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1567.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1567.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1567.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1567.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1567.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1567.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1567.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1567.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1567.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1567
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
	local var1568 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1569, var1570 = protoModule.writeTag(buff, var1568, 1, protoModule.wireTypes.lengthDelimited)
		var1569, var2365 = protoModule.writeString(var1569, var1570, self.title)
		buff = var1569
		var1568 = var1570
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1571, var1572 = protoModule.writeTag(buff, var1568, 2, protoModule.wireTypes.lengthDelimited)
		var1571, var2367 = protoModule.writeString(var1571, var1572, self.user_id)
		buff = var1571
		var1568 = var1572
	end
	if self.description ~= nil and self.description ~= "" then
		local var1573, var1574 = protoModule.writeTag(buff, var1568, 3, protoModule.wireTypes.lengthDelimited)
		var1573, var2369 = protoModule.writeString(var1573, var1574, self.description)
		buff = var1573
		var1568 = var1574
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1575, var1576 = protoModule.writeTag(buff, var1568, 4, protoModule.wireTypes.lengthDelimited)
		var1575, var2371 = protoModule.writeString(var1575, var1576, self.cta_text)
		buff = var1575
		var1568 = var1576
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1577, var1578 = protoModule.writeTag(buff, var1568, 5, protoModule.wireTypes.lengthDelimited)
		var1577, var2373 = protoModule.writeString(var1577, var1578, self.prompt_id)
		buff = var1577
		var1568 = var1578
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1579, var1580 = protoModule.writeTag(buff, var1568, 6, protoModule.wireTypes.lengthDelimited)
		var1579, var2375 = protoModule.writeString(var1579, var1580, self.prompt_type)
		buff = var1579
		var1568 = var1580
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1581, var1582 = protoModule.writeTag(buff, var1568, 7, protoModule.wireTypes.lengthDelimited)
		var1581, var2377 = protoModule.writeString(var1581, var1582, self.entity_id)
		buff = var1581
		var1568 = var1582
	end
	local buff_1 = buffer.create(var1568)
	buffer.copy(buff_1, 0, buff, 0, var1568)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1568 = t_54.new()
	local var1569 = 0
	while var1569 < buffer.len(p54) do
		local _ = nil
		local var1570 = nil
		local var1571, var1572, var1573 = protoModule.readTag(p54, var1569)
		local var1574 = var1571
		var1570 = var1572
		var1569 = var1573
		
		if var1570 == protoModule.wireTypes.varint then
			local _ = nil
			local var1575, var1576 = protoModule.readVarInt(p54, var1569)
			local _ = var1575
			var1569 = var1576
			continue
		end
		if var1570 == protoModule.wireTypes.lengthDelimited then
			if var1574 == 1 then
				local _ = nil
				local var1577, var1578 = protoModule.readBuffer(p54, var1569)
				var1569 = var1578
				var1568.title = buffer.tostring(var1577)
			elseif var1574 == 2 then
				local _ = nil
				local var1579, var1580 = protoModule.readBuffer(p54, var1569)
				var1569 = var1580
				var1568.user_id = buffer.tostring(var1579)
			elseif var1574 == 3 then
				local _ = nil
				local var1581, var1582 = protoModule.readBuffer(p54, var1569)
				var1569 = var1582
				var1568.description = buffer.tostring(var1581)
			elseif var1574 == 4 then
				local _ = nil
				local var1583, var1584 = protoModule.readBuffer(p54, var1569)
				var1569 = var1584
				var1568.cta_text = buffer.tostring(var1583)
			elseif var1574 == 5 then
				local _ = nil
				local var1585, var1586 = protoModule.readBuffer(p54, var1569)
				var1569 = var1586
				var1568.prompt_id = buffer.tostring(var1585)
			elseif var1574 == 6 then
				local _ = nil
				local var1587, var1588 = protoModule.readBuffer(p54, var1569)
				var1569 = var1588
				var1568.prompt_type = buffer.tostring(var1587)
			elseif var1574 == 7 then
				local _ = nil
				local var1589, var1590 = protoModule.readBuffer(p54, var1569)
				var1569 = var1590
				var1568.entity_id = buffer.tostring(var1589)
			else
				local _ = nil
				local var1591, var1592 = protoModule.readVarInt(p54, var1569)
				var1569 = var1592 + var1591
			end
		elseif var1570 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1593, var1594 = protoModule.readFixed32(p54, var1569)
			local _ = var1593
			var1569 = var1594
		elseif var1570 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1595, var1596 = protoModule.readFixed64(p54, var1569)
			local _ = var1595
			var1569 = var1596
		else
			error("Unsupported wire type: " .. var2381)
		end
	end
	return var1568
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
	local var1597 = t_54.new()
	
	if self.title ~= nil then
		var1597.title = self.title
	end
	if self.user_id ~= nil then
		var1597.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1597.user_id = self.userId
	end
	if self.description ~= nil then
		var1597.description = self.description
	end
	if self.cta_text ~= nil then
		var1597.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1597.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1597.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1597.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1597.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1597.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1597.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1597.entity_id = self.entityId
	end
	return var1597
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
	local var1597 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1598, var1599 = protoModule.writeTag(buff, var1597, 1, protoModule.wireTypes.lengthDelimited)
		var1598, var2413 = protoModule.writeString(var1598, var1599, self.prompt_id)
		buff = var1598
		var1597 = var1599
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1600, var1601 = protoModule.writeTag(buff, var1597, 2, protoModule.wireTypes.lengthDelimited)
		var1600, var2415 = protoModule.writeString(var1600, var1601, self.prompt_type)
		buff = var1600
		var1597 = var1601
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1602, var1603 = protoModule.writeTag(buff, var1597, 3, protoModule.wireTypes.lengthDelimited)
		var1602, var2417 = protoModule.writeString(var1602, var1603, self.user_id)
		buff = var1602
		var1597 = var1603
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1604, var1605 = protoModule.writeTag(buff, var1597, 4, protoModule.wireTypes.lengthDelimited)
		var1604, var2419 = protoModule.writeString(var1604, var1605, self.audit_data)
		buff = var1604
		var1597 = var1605
	end
	local buff_1 = buffer.create(var1597)
	buffer.copy(buff_1, 0, buff, 0, var1597)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1597 = t_55.new()
	local var1598 = 0
	while var1598 < buffer.len(p55) do
		local _ = nil
		local var1599 = nil
		local var1600, var1601, var1602 = protoModule.readTag(p55, var1598)
		local var1603 = var1600
		var1599 = var1601
		var1598 = var1602
		
		if var1599 == protoModule.wireTypes.varint then
			local _ = nil
			local var1604, var1605 = protoModule.readVarInt(p55, var1598)
			local _ = var1604
			var1598 = var1605
			continue
		end
		if var1599 == protoModule.wireTypes.lengthDelimited then
			if var1603 == 1 then
				local _ = nil
				local var1606, var1607 = protoModule.readBuffer(p55, var1598)
				var1598 = var1607
				var1597.prompt_id = buffer.tostring(var1606)
			elseif var1603 == 2 then
				local _ = nil
				local var1608, var1609 = protoModule.readBuffer(p55, var1598)
				var1598 = var1609
				var1597.prompt_type = buffer.tostring(var1608)
			elseif var1603 == 3 then
				local _ = nil
				local var1610, var1611 = protoModule.readBuffer(p55, var1598)
				var1598 = var1611
				var1597.user_id = buffer.tostring(var1610)
			elseif var1603 == 4 then
				local _ = nil
				local var1612, var1613 = protoModule.readBuffer(p55, var1598)
				var1598 = var1613
				var1597.audit_data = buffer.tostring(var1612)
			else
				local _ = nil
				local var1614, var1615 = protoModule.readVarInt(p55, var1598)
				var1598 = var1615 + var1614
			end
		elseif var1599 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1616, var1617 = protoModule.readFixed32(p55, var1598)
			local _ = var1616
			var1598 = var1617
		elseif var1599 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1618, var1619 = protoModule.readFixed64(p55, var1598)
			local _ = var1618
			var1598 = var1619
		else
			error("Unsupported wire type: " .. var2423)
		end
	end
	return var1597
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
	local var1620 = t_55.new()
	
	if self.prompt_id ~= nil then
		var1620.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1620.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1620.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1620.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1620.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1620.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1620.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1620.audit_data = self.auditData
	end
	return var1620
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
	local var1620 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1621, var1622 = protoModule.writeTag(buff, var1620, 1, protoModule.wireTypes.varint)
		var1621, var2449 = protoModule.writeVarInt(var1621, var1622, self.sender_count)
		buff = var1621
		var1620 = var1622
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1623, var1624 = protoModule.writeTag(buff, var1620, 2, protoModule.wireTypes.varint)
		var1623, var2451 = protoModule.writeVarInt(var1623, var1624, self.total_robux_amount)
		buff = var1623
		var1620 = var1624
	end
	local buff_1 = buffer.create(var1620)
	buffer.copy(buff_1, 0, buff, 0, var1620)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1620 = t_56.new()
	local var1621 = 0
	while var1621 < buffer.len(p56) do
		local _ = nil
		local _ = nil
		local var1622, var1623, var1624 = protoModule.readTag(p56, var1621)
		local var1625 = var1622
		local var1626 = var1623
		var1621 = var1624
		
		if var1626 == protoModule.wireTypes.varint then
			if var1625 == 1 then
				local _ = nil
				local var1627, var1628 = protoModule.readVarIntI32(p56, var1621)
				var1621 = var1628
				var1620.sender_count = var1627
			elseif var1625 == 2 then
				local _ = nil
				local var1629, var1630 = protoModule.readVarIntI64(p56, var1621)
				var1621 = var1630
				var1620.total_robux_amount = var1629
			else
				local _ = nil
				local var1631, var1632 = protoModule.readVarInt(p56, var1621)
				local _ = var1631
				var1621 = var1632
			end
		elseif var1626 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1633, var1634 = protoModule.readVarInt(p56, var1621)
			var1621 = var1634 + var1633
		elseif var1626 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1635, var1636 = protoModule.readFixed32(p56, var1621)
			local _ = var1635
			var1621 = var1636
		elseif var1626 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1637, var1638 = protoModule.readFixed64(p56, var1621)
			local _ = var1637
			var1621 = var1638
		else
			error("Unsupported wire type: " .. var2459)
		end
	end
	return var1620
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
	local var1639 = t_56.new()
	
	if self.sender_count ~= nil then
		var1639.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1639.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1639.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1639.total_robux_amount = self.totalRobuxAmount
	end
	return var1639
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
	local var1639 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1640, var1641 = protoModule.writeTag(buff, var1639, 1, protoModule.wireTypes.lengthDelimited)
		var1640, var2477 = protoModule.writeString(var1640, var1641, self.title)
		buff = var1640
		var1639 = var1641
	end
	if self.description ~= nil and self.description ~= "" then
		local var1642, var1643 = protoModule.writeTag(buff, var1639, 2, protoModule.wireTypes.lengthDelimited)
		var1642, var2479 = protoModule.writeString(var1642, var1643, self.description)
		buff = var1642
		var1639 = var1643
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1644, var1645 = protoModule.writeTag(buff, var1639, 3, protoModule.wireTypes.lengthDelimited)
		var1644, var2481 = protoModule.writeString(var1644, var1645, self.primary_text)
		buff = var1644
		var1639 = var1645
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1646, var1647 = protoModule.writeTag(buff, var1639, 4, protoModule.wireTypes.lengthDelimited)
		var1646, var2483 = protoModule.writeString(var1646, var1647, self.secondary_text)
		buff = var1646
		var1639 = var1647
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1648, var1649 = protoModule.writeTag(buff, var1639, 5, protoModule.wireTypes.lengthDelimited)
		var1648, var2485 = protoModule.writeString(var1648, var1649, self.prompt_id)
		buff = var1648
		var1639 = var1649
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1650, var1651 = protoModule.writeTag(buff, var1639, 6, protoModule.wireTypes.lengthDelimited)
		var1650, var2487 = protoModule.writeString(var1650, var1651, self.prompt_type)
		buff = var1650
		var1639 = var1651
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1652, var1653 = protoModule.writeTag(buff, var1639, 7, protoModule.wireTypes.varint)
		var1652, var2489 = protoModule.writeVarInt(var1652, var1653, self.times_seen)
		buff = var1652
		var1639 = var1653
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1654 = self.content.value:encode()
		local var1655, var1656 = protoModule.writeTag(buff, var1639, 8, protoModule.wireTypes.lengthDelimited)
		var1655, var2492 = protoModule.writeBuffer(var1655, var1656, var1654, buffer.len(var1654))
		buff = var1655
		var1639 = var1656
	end
	local buff_1 = buffer.create(var1639)
	buffer.copy(buff_1, 0, buff, 0, var1639)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1639 = t_57.new()
	local var1640 = 0
	while var1640 < buffer.len(p57) do
		local _ = nil
		local var1641 = nil
		local var1642, var1643, var1644 = protoModule.readTag(p57, var1640)
		local var1645 = var1642
		var1641 = var1643
		var1640 = var1644
		
		if var1641 == protoModule.wireTypes.varint then
			if var1645 == 7 then
				local _ = nil
				local var1646, var1647 = protoModule.readVarIntI32(p57, var1640)
				var1640 = var1647
				var1639.times_seen = var1646
			else
				local _ = nil
				local var1648, var1649 = protoModule.readVarInt(p57, var1640)
				local _ = var1648
				var1640 = var1649
			end
		end
		if var1641 == protoModule.wireTypes.lengthDelimited then
			if var1645 == 1 then
				local _ = nil
				local var1650, var1651 = protoModule.readBuffer(p57, var1640)
				var1640 = var1651
				var1639.title = buffer.tostring(var1650)
			elseif var1645 == 2 then
				local _ = nil
				local var1652, var1653 = protoModule.readBuffer(p57, var1640)
				var1640 = var1653
				var1639.description = buffer.tostring(var1652)
			elseif var1645 == 3 then
				local _ = nil
				local var1654, var1655 = protoModule.readBuffer(p57, var1640)
				var1640 = var1655
				var1639.primary_text = buffer.tostring(var1654)
			elseif var1645 == 4 then
				local _ = nil
				local var1656, var1657 = protoModule.readBuffer(p57, var1640)
				var1640 = var1657
				var1639.secondary_text = buffer.tostring(var1656)
			elseif var1645 == 5 then
				local _ = nil
				local var1658, var1659 = protoModule.readBuffer(p57, var1640)
				var1640 = var1659
				var1639.prompt_id = buffer.tostring(var1658)
			elseif var1645 == 6 then
				local _ = nil
				local var1660, var1661 = protoModule.readBuffer(p57, var1640)
				var1640 = var1661
				var1639.prompt_type = buffer.tostring(var1660)
			elseif var1645 == 8 then
				local _ = nil
				local var1662, var1663 = protoModule.readBuffer(p57, var1640)
				var1640 = var1663
				var1639.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1662)
				}
			else
				local _ = nil
				local var1664, var1665 = protoModule.readVarInt(p57, var1640)
				var1640 = var1665 + var1664
			end
		elseif var1641 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1666, var1667 = protoModule.readFixed32(p57, var1640)
			local _ = var1666
			var1640 = var1667
		elseif var1641 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1668, var1669 = protoModule.readFixed64(p57, var1640)
			local _ = var1668
			var1640 = var1669
		else
			error("Unsupported wire type: " .. var2496)
		end
	end
	return var1639
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
	local var1670 = t_57.new()
	
	if self.title ~= nil then
		var1670.title = self.title
	end
	if self.description ~= nil then
		var1670.description = self.description
	end
	if self.primary_text ~= nil then
		var1670.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1670.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1670.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1670.secondary_text = self.secondaryText
	end
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
	if self.times_seen ~= nil then
		var1670.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1670.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1670.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1670.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var1670
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
	local var1670 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1671, var1672 = protoModule.writeTag(buff, var1670, 1, protoModule.wireTypes.lengthDelimited)
		var1671, var2530 = protoModule.writeString(var1671, var1672, self.tooltip_text)
		buff = var1671
		var1670 = var1672
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1673, var1674 = protoModule.writeTag(buff, var1670, 2, protoModule.wireTypes.lengthDelimited)
		var1673, var2532 = protoModule.writeString(var1673, var1674, self.prompt_id)
		buff = var1673
		var1670 = var1674
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1675, var1676 = protoModule.writeTag(buff, var1670, 3, protoModule.wireTypes.lengthDelimited)
		var1675, var2534 = protoModule.writeString(var1675, var1676, self.prompt_type)
		buff = var1675
		var1670 = var1676
	end
	local buff_1 = buffer.create(var1670)
	buffer.copy(buff_1, 0, buff, 0, var1670)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1670 = t_58.new()
	local var1671 = 0
	while var1671 < buffer.len(p58) do
		local _ = nil
		local var1672 = nil
		local var1673, var1674, var1675 = protoModule.readTag(p58, var1671)
		local var1676 = var1673
		var1672 = var1674
		var1671 = var1675
		
		if var1672 == protoModule.wireTypes.varint then
			local _ = nil
			local var1677, var1678 = protoModule.readVarInt(p58, var1671)
			local _ = var1677
			var1671 = var1678
			continue
		end
		if var1672 == protoModule.wireTypes.lengthDelimited then
			if var1676 == 1 then
				local _ = nil
				local var1679, var1680 = protoModule.readBuffer(p58, var1671)
				var1671 = var1680
				var1670.tooltip_text = buffer.tostring(var1679)
			elseif var1676 == 2 then
				local _ = nil
				local var1681, var1682 = protoModule.readBuffer(p58, var1671)
				var1671 = var1682
				var1670.prompt_id = buffer.tostring(var1681)
			elseif var1676 == 3 then
				local _ = nil
				local var1683, var1684 = protoModule.readBuffer(p58, var1671)
				var1671 = var1684
				var1670.prompt_type = buffer.tostring(var1683)
			else
				local _ = nil
				local var1685, var1686 = protoModule.readVarInt(p58, var1671)
				var1671 = var1686 + var1685
			end
		elseif var1672 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1687, var1688 = protoModule.readFixed32(p58, var1671)
			local _ = var1687
			var1671 = var1688
		elseif var1672 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1689, var1690 = protoModule.readFixed64(p58, var1671)
			local _ = var1689
			var1671 = var1690
		else
			error("Unsupported wire type: " .. var2538)
		end
	end
	return var1670
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
	local var1691 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var1691.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1691.tooltip_text = self.tooltipText
	end
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
	return var1691
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
	local var1691 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1692, var1693 = protoModule.writeTag(buff, var1691, 1, protoModule.wireTypes.lengthDelimited)
		var1692, var2562 = protoModule.writeString(var1692, var1693, self.media_id)
		buff = var1692
		var1691 = var1693
	end
	if self.title ~= nil and self.title ~= "" then
		local var1694, var1695 = protoModule.writeTag(buff, var1691, 2, protoModule.wireTypes.lengthDelimited)
		var1694, var2564 = protoModule.writeString(var1694, var1695, self.title)
		buff = var1694
		var1691 = var1695
	end
	if self.description ~= nil and self.description ~= "" then
		local var1696, var1697 = protoModule.writeTag(buff, var1691, 3, protoModule.wireTypes.lengthDelimited)
		var1696, var2566 = protoModule.writeString(var1696, var1697, self.description)
		buff = var1696
		var1691 = var1697
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1698, var1699 = protoModule.writeTag(buff, var1691, 4, protoModule.wireTypes.lengthDelimited)
		var1698, var2568 = protoModule.writeString(var1698, var1699, self.prompt_id)
		buff = var1698
		var1691 = var1699
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1700, var1701 = protoModule.writeTag(buff, var1691, 5, protoModule.wireTypes.lengthDelimited)
		var1700, var2570 = protoModule.writeString(var1700, var1701, self.prompt_type)
		buff = var1700
		var1691 = var1701
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1702, var1703 = protoModule.writeTag(buff, var1691, 6, protoModule.wireTypes.lengthDelimited)
		var1702, var2572 = protoModule.writeString(var1702, var1703, self.anchor_tag)
		buff = var1702
		var1691 = var1703
	end
	local buff_1 = buffer.create(var1691)
	buffer.copy(buff_1, 0, buff, 0, var1691)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1691 = t_59.new()
	local var1692 = 0
	while var1692 < buffer.len(p59) do
		local _ = nil
		local var1693 = nil
		local var1694, var1695, var1696 = protoModule.readTag(p59, var1692)
		local var1697 = var1694
		var1693 = var1695
		var1692 = var1696
		
		if var1693 == protoModule.wireTypes.varint then
			local _ = nil
			local var1698, var1699 = protoModule.readVarInt(p59, var1692)
			local _ = var1698
			var1692 = var1699
			continue
		end
		if var1693 == protoModule.wireTypes.lengthDelimited then
			if var1697 == 1 then
				local _ = nil
				local var1700, var1701 = protoModule.readBuffer(p59, var1692)
				var1692 = var1701
				var1691.media_id = buffer.tostring(var1700)
			elseif var1697 == 2 then
				local _ = nil
				local var1702, var1703 = protoModule.readBuffer(p59, var1692)
				var1692 = var1703
				var1691.title = buffer.tostring(var1702)
			elseif var1697 == 3 then
				local _ = nil
				local var1704, var1705 = protoModule.readBuffer(p59, var1692)
				var1692 = var1705
				var1691.description = buffer.tostring(var1704)
			elseif var1697 == 4 then
				local _ = nil
				local var1706, var1707 = protoModule.readBuffer(p59, var1692)
				var1692 = var1707
				var1691.prompt_id = buffer.tostring(var1706)
			elseif var1697 == 5 then
				local _ = nil
				local var1708, var1709 = protoModule.readBuffer(p59, var1692)
				var1692 = var1709
				var1691.prompt_type = buffer.tostring(var1708)
			elseif var1697 == 6 then
				local _ = nil
				local var1710, var1711 = protoModule.readBuffer(p59, var1692)
				var1692 = var1711
				var1691.anchor_tag = buffer.tostring(var1710)
			else
				local _ = nil
				local var1712, var1713 = protoModule.readVarInt(p59, var1692)
				var1692 = var1713 + var1712
			end
		elseif var1693 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1714, var1715 = protoModule.readFixed32(p59, var1692)
			local _ = var1714
			var1692 = var1715
		elseif var1693 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1716, var1717 = protoModule.readFixed64(p59, var1692)
			local _ = var1716
			var1692 = var1717
		else
			error("Unsupported wire type: " .. var2576)
		end
	end
	return var1691
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
	local var1718 = t_59.new()
	
	if self.media_id ~= nil then
		var1718.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1718.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1718.title = self.title
	end
	if self.description ~= nil then
		var1718.description = self.description
	end
	if self.prompt_id ~= nil then
		var1718.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1718.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1718.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1718.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1718.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1718.anchor_tag = self.anchorTag
	end
	return var1718
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
	local var1718 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1719, var1720 = protoModule.writeTag(buff, var1718, 1, protoModule.wireTypes.lengthDelimited)
		var1719, var2606 = protoModule.writeString(var1719, var1720, self.prompt_id)
		buff = var1719
		var1718 = var1720
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1721, var1722 = protoModule.writeTag(buff, var1718, 2, protoModule.wireTypes.lengthDelimited)
		var1721, var2608 = protoModule.writeString(var1721, var1722, self.prompt_type)
		buff = var1721
		var1718 = var1722
	end
	local buff_1 = buffer.create(var1718)
	buffer.copy(buff_1, 0, buff, 0, var1718)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1718 = t_60.new()
	local var1719 = 0
	while var1719 < buffer.len(p60) do
		local _ = nil
		local var1720 = nil
		local var1721, var1722, var1723 = protoModule.readTag(p60, var1719)
		local var1724 = var1721
		var1720 = var1722
		var1719 = var1723
		
		if var1720 == protoModule.wireTypes.varint then
			local _ = nil
			local var1725, var1726 = protoModule.readVarInt(p60, var1719)
			local _ = var1725
			var1719 = var1726
			continue
		end
		if var1720 == protoModule.wireTypes.lengthDelimited then
			if var1724 == 1 then
				local _ = nil
				local var1727, var1728 = protoModule.readBuffer(p60, var1719)
				var1719 = var1728
				var1718.prompt_id = buffer.tostring(var1727)
			elseif var1724 == 2 then
				local _ = nil
				local var1729, var1730 = protoModule.readBuffer(p60, var1719)
				var1719 = var1730
				var1718.prompt_type = buffer.tostring(var1729)
			else
				local _ = nil
				local var1731, var1732 = protoModule.readVarInt(p60, var1719)
				var1719 = var1732 + var1731
			end
		elseif var1720 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1733, var1734 = protoModule.readFixed32(p60, var1719)
			local _ = var1733
			var1719 = var1734
		elseif var1720 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1735, var1736 = protoModule.readFixed64(p60, var1719)
			local _ = var1735
			var1719 = var1736
		else
			error("Unsupported wire type: " .. var2612)
		end
	end
	return var1718
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
	local var1737 = t_60.new()
	
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
	return var1737
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
	local var1737 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1738, var1739 = protoModule.writeTag(buff, var1737, 1, protoModule.wireTypes.lengthDelimited)
		var1738, var2634 = protoModule.writeString(var1738, var1739, self.upsell_prompt)
		buff = var1738
		var1737 = var1739
	end
	local buff_1 = buffer.create(var1737)
	buffer.copy(buff_1, 0, buff, 0, var1737)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1737 = t_61.new()
	local var1738 = 0
	while var1738 < buffer.len(p61) do
		local _ = nil
		local var1739 = nil
		local var1740, var1741, var1742 = protoModule.readTag(p61, var1738)
		local var1743 = var1740
		var1739 = var1741
		var1738 = var1742
		
		if var1739 == protoModule.wireTypes.varint then
			local _ = nil
			local var1744, var1745 = protoModule.readVarInt(p61, var1738)
			local _ = var1744
			var1738 = var1745
			continue
		end
		if var1739 == protoModule.wireTypes.lengthDelimited then
			if var1743 == 1 then
				local _ = nil
				local var1746, var1747 = protoModule.readBuffer(p61, var1738)
				var1738 = var1747
				var1737.upsell_prompt = buffer.tostring(var1746)
			else
				local _ = nil
				local var1748, var1749 = protoModule.readVarInt(p61, var1738)
				var1738 = var1749 + var1748
			end
		elseif var1739 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1750, var1751 = protoModule.readFixed32(p61, var1738)
			local _ = var1750
			var1738 = var1751
		elseif var1739 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1752, var1753 = protoModule.readFixed64(p61, var1738)
			local _ = var1752
			var1738 = var1753
		else
			error("Unsupported wire type: " .. var2638)
		end
	end
	return var1737
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
	local var1754 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var1754.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1754.upsell_prompt = self.upsellPrompt
	end
	return var1754
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
	local var1754 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1755, var1756 = protoModule.writeTag(buff, var1754, 1, protoModule.wireTypes.lengthDelimited)
		var1755, var2658 = protoModule.writeString(var1755, var1756, self.modal_variant)
		buff = var1755
		var1754 = var1756
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1757, var1758 = protoModule.writeTag(buff, var1754, 2, protoModule.wireTypes.lengthDelimited)
		var1757, var2660 = protoModule.writeString(var1757, var1758, self.modal_sequence)
		buff = var1757
		var1754 = var1758
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1759, var1760 = protoModule.writeTag(buff, var1754, 3, protoModule.wireTypes.lengthDelimited)
		var1759, var2662 = protoModule.writeString(var1759, var1760, self.conversation_id)
		buff = var1759
		var1754 = var1760
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1761, var1762 = protoModule.writeTag(buff, var1754, 4, protoModule.wireTypes.lengthDelimited)
		var1761, var2664 = protoModule.writeString(var1761, var1762, self.friend_id)
		buff = var1761
		var1754 = var1762
	end
	local buff_1 = buffer.create(var1754)
	buffer.copy(buff_1, 0, buff, 0, var1754)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1754 = t_62.new()
	local var1755 = 0
	while var1755 < buffer.len(p62) do
		local _ = nil
		local var1756 = nil
		local var1757, var1758, var1759 = protoModule.readTag(p62, var1755)
		local var1760 = var1757
		var1756 = var1758
		var1755 = var1759
		
		if var1756 == protoModule.wireTypes.varint then
			local _ = nil
			local var1761, var1762 = protoModule.readVarInt(p62, var1755)
			local _ = var1761
			var1755 = var1762
			continue
		end
		if var1756 == protoModule.wireTypes.lengthDelimited then
			if var1760 == 1 then
				local _ = nil
				local var1763, var1764 = protoModule.readBuffer(p62, var1755)
				var1755 = var1764
				var1754.modal_variant = buffer.tostring(var1763)
			elseif var1760 == 2 then
				local _ = nil
				local var1765, var1766 = protoModule.readBuffer(p62, var1755)
				var1755 = var1766
				var1754.modal_sequence = buffer.tostring(var1765)
			elseif var1760 == 3 then
				local _ = nil
				local var1767, var1768 = protoModule.readBuffer(p62, var1755)
				var1755 = var1768
				var1754.conversation_id = buffer.tostring(var1767)
			elseif var1760 == 4 then
				local _ = nil
				local var1769, var1770 = protoModule.readBuffer(p62, var1755)
				var1755 = var1770
				var1754.friend_id = buffer.tostring(var1769)
			else
				local _ = nil
				local var1771, var1772 = protoModule.readVarInt(p62, var1755)
				var1755 = var1772 + var1771
			end
		elseif var1756 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1773, var1774 = protoModule.readFixed32(p62, var1755)
			local _ = var1773
			var1755 = var1774
		elseif var1756 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1775, var1776 = protoModule.readFixed64(p62, var1755)
			local _ = var1775
			var1755 = var1776
		else
			error("Unsupported wire type: " .. var2668)
		end
	end
	return var1754
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
	local var1777 = t_62.new()
	
	if self.modal_variant ~= nil then
		var1777.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1777.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1777.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1777.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1777.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1777.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1777.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1777.friend_id = self.friendId
	end
	return var1777
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
	local var1777 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1778, var1779 = protoModule.writeTag(buff, var1777, 1, protoModule.wireTypes.lengthDelimited)
		var1778, var2694 = protoModule.writeString(var1778, var1779, self.event_id)
		buff = var1778
		var1777 = var1779
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1780, var1781 = protoModule.writeTag(buff, var1777, 2, protoModule.wireTypes.lengthDelimited)
		var1780, var2696 = protoModule.writeString(var1780, var1781, self.universe_id)
		buff = var1780
		var1777 = var1781
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1782, var1783 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1782, var2698 = protoModule.writeString(var1782, var1783, i)
			local var1784 = v:encode()
			var1783, var2700 = protoModule.writeTag(var1782, var1783, 2, protoModule.wireTypes.lengthDelimited)
			var1783, var2700 = protoModule.writeBuffer(var1783, var2700, var1784, buffer.len(var1784))
			local var1785 = var1783
			local var1786 = var2700
			local var1787, var1788 = protoModule.writeTag(buff, var1777, 3, protoModule.wireTypes.lengthDelimited)
			var1787, var2704 = protoModule.writeBuffer(var1787, var1788, var1785, var1786)
			buff = var1787
			var1777 = var1788
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1789, var1790 = protoModule.writeTag(buff, var1777, 4, protoModule.wireTypes.lengthDelimited)
			var1789, var2706 = protoModule.writeString(var1789, var1790, v)
			buff = var1789
			var1777 = var1790
		end
	end
	local buff_1 = buffer.create(var1777)
	buffer.copy(buff_1, 0, buff, 0, var1777)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var1791 = t_63.new()
	local var1792 = 0
	while var1792 < buffer.len(p63) do
		local _ = nil
		local var1793 = nil
		local var1794, var1795, var1796 = protoModule.readTag(p63, var1792)
		local var1797 = var1794
		var1793 = var1795
		var1792 = var1796
		
		if var1793 == protoModule.wireTypes.varint then
			local _ = nil
			local var1798, var1799 = protoModule.readVarInt(p63, var1792)
			local _ = var1798
			var1792 = var1799
			continue
		end
		if var1793 == protoModule.wireTypes.lengthDelimited then
			if var1797 == 1 then
				local _ = nil
				local var1800, var1801 = protoModule.readBuffer(p63, var1792)
				var1792 = var1801
				var1791.event_id = buffer.tostring(var1800)
			elseif var1797 == 2 then
				local _ = nil
				local var1802, var1803 = protoModule.readBuffer(p63, var1792)
				var1792 = var1803
				var1791.universe_id = buffer.tostring(var1802)
			elseif var1797 == 3 then
				local _ = nil
				local var1804, var1805 = protoModule.readBuffer(p63, var1792)
				var1792 = var1805
				var1804 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1804)
				var1791.entry_map[var1804.key or ""] = var1804.value or t.FeedEntry.new()
			elseif var1797 == 4 then
				local _ = nil
				local var1806, var1807 = protoModule.readBuffer(p63, var1792)
				var1792 = var1807
				table.insert(var1791.entry_order, buffer.tostring(var1806))
			else
				local _ = nil
				local var1808, var1809 = protoModule.readVarInt(p63, var1792)
				var1792 = var1809 + var1808
			end
		elseif var1793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1810, var1811 = protoModule.readFixed32(p63, var1792)
			local _ = var1810
			var1792 = var1811
		elseif var1793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1812, var1813 = protoModule.readFixed64(p63, var1792)
			local _ = var1812
			var1792 = var1813
		else
			error("Unsupported wire type: " .. var2710)
		end
	end
	return var1791
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
	local var1814 = t_63.new()
	
	if self.event_id ~= nil then
		var1814.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1814.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1814.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1814.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1814.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1814.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1814.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1814.entry_order = t_1
	end
	return var1814
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
	local var1815 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1816, var1817 = protoModule.writeTag(buff, var1815, 1, protoModule.wireTypes.lengthDelimited)
		var1816, var2742 = protoModule.writeString(var1816, var1817, self.key)
		buff = var1816
		var1815 = var1817
	end
	if self.value ~= nil then
		local var1818 = self.value:encode()
		local var1819, var1820 = protoModule.writeTag(buff, var1815, 2, protoModule.wireTypes.lengthDelimited)
		var1819, var2745 = protoModule.writeBuffer(var1819, var1820, var1818, buffer.len(var1818))
		buff = var1819
		var1815 = var1820
	end
	local buff_1 = buffer.create(var1815)
	buffer.copy(buff_1, 0, buff, 0, var1815)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1815 = t_64.new()
	local var1816 = 0
	while var1816 < buffer.len(p64) do
		local _ = nil
		local var1817 = nil
		local var1818, var1819, var1820 = protoModule.readTag(p64, var1816)
		local var1821 = var1818
		var1817 = var1819
		var1816 = var1820
		
		if var1817 == protoModule.wireTypes.varint then
			local _ = nil
			local var1822, var1823 = protoModule.readVarInt(p64, var1816)
			local _ = var1822
			var1816 = var1823
			continue
		end
		if var1817 == protoModule.wireTypes.lengthDelimited then
			if var1821 == 1 then
				local _ = nil
				local var1824, var1825 = protoModule.readBuffer(p64, var1816)
				var1816 = var1825
				var1815.key = buffer.tostring(var1824)
			elseif var1821 == 2 then
				local _ = nil
				local var1826, var1827 = protoModule.readBuffer(p64, var1816)
				var1816 = var1827
				var1815.value = t.FeedEntry.decode(var1826)
			else
				local _ = nil
				local var1828, var1829 = protoModule.readVarInt(p64, var1816)
				var1816 = var1829 + var1828
			end
		elseif var1817 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1830, var1831 = protoModule.readFixed32(p64, var1816)
			local _ = var1830
			var1816 = var1831
		elseif var1817 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1832, var1833 = protoModule.readFixed64(p64, var1816)
			local _ = var1832
			var1816 = var1833
		else
			error("Unsupported wire type: " .. var2749)
		end
	end
	return var1815
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
	local var1834 = t_64.new()
	
	if self.key ~= nil then
		var1834.key = self.key
	end
	if self.value ~= nil then
		var1834.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1834
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
	local var1834 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1835, var1836 = protoModule.writeTag(buff, var1834, 1, protoModule.wireTypes.lengthDelimited)
		var1835, var2771 = protoModule.writeString(var1835, var1836, self.event_id)
		buff = var1835
		var1834 = var1836
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1837, var1838 = protoModule.writeTag(buff, var1834, 2, protoModule.wireTypes.lengthDelimited)
		var1837, var2773 = protoModule.writeString(var1837, var1838, self.universe_id)
		buff = var1837
		var1834 = var1838
	end
	local buff_1 = buffer.create(var1834)
	buffer.copy(buff_1, 0, buff, 0, var1834)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1834 = t_65.new()
	local var1835 = 0
	while var1835 < buffer.len(p65) do
		local _ = nil
		local var1836 = nil
		local var1837, var1838, var1839 = protoModule.readTag(p65, var1835)
		local var1840 = var1837
		var1836 = var1838
		var1835 = var1839
		
		if var1836 == protoModule.wireTypes.varint then
			local _ = nil
			local var1841, var1842 = protoModule.readVarInt(p65, var1835)
			local _ = var1841
			var1835 = var1842
			continue
		end
		if var1836 == protoModule.wireTypes.lengthDelimited then
			if var1840 == 1 then
				local _ = nil
				local var1843, var1844 = protoModule.readBuffer(p65, var1835)
				var1835 = var1844
				var1834.event_id = buffer.tostring(var1843)
			elseif var1840 == 2 then
				local _ = nil
				local var1845, var1846 = protoModule.readBuffer(p65, var1835)
				var1835 = var1846
				var1834.universe_id = buffer.tostring(var1845)
			else
				local _ = nil
				local var1847, var1848 = protoModule.readVarInt(p65, var1835)
				var1835 = var1848 + var1847
			end
		elseif var1836 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1849, var1850 = protoModule.readFixed32(p65, var1835)
			local _ = var1849
			var1835 = var1850
		elseif var1836 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1851, var1852 = protoModule.readFixed64(p65, var1835)
			local _ = var1851
			var1835 = var1852
		else
			error("Unsupported wire type: " .. var2777)
		end
	end
	return var1834
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
	local var1853 = t_65.new()
	
	if self.event_id ~= nil then
		var1853.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1853.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1853.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1853.universe_id = self.universeId
	end
	return var1853
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
	local var1853 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1854, var1855 = protoModule.writeTag(buff, var1853, 1, protoModule.wireTypes.lengthDelimited)
		var1854, var2799 = protoModule.writeString(var1854, var1855, self.event_id)
		buff = var1854
		var1853 = var1855
	end
	local buff_1 = buffer.create(var1853)
	buffer.copy(buff_1, 0, buff, 0, var1853)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref)
	local var1853 = t_66.new()
	local var1854 = 0
	while var1854 < buffer.len(p66) do
		local _ = nil
		local var1855 = nil
		local var1856, var1857, var1858 = protoModule.readTag(p66, var1854)
		local var1859 = var1856
		var1855 = var1857
		var1854 = var1858
		
		if var1855 == protoModule.wireTypes.varint then
			local _ = nil
			local var1860, var1861 = protoModule.readVarInt(p66, var1854)
			local _ = var1860
			var1854 = var1861
			continue
		end
		if var1855 == protoModule.wireTypes.lengthDelimited then
			if var1859 == 1 then
				local _ = nil
				local var1862, var1863 = protoModule.readBuffer(p66, var1854)
				var1854 = var1863
				var1853.event_id = buffer.tostring(var1862)
			else
				local _ = nil
				local var1864, var1865 = protoModule.readVarInt(p66, var1854)
				var1854 = var1865 + var1864
			end
		elseif var1855 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1866, var1867 = protoModule.readFixed32(p66, var1854)
			local _ = var1866
			var1854 = var1867
		elseif var1855 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1868, var1869 = protoModule.readFixed64(p66, var1854)
			local _ = var1868
			var1854 = var1869
		else
			error("Unsupported wire type: " .. var2803)
		end
	end
	return var1853
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
	local var1870 = t_66.new()
	
	if self.event_id ~= nil then
		var1870.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1870.event_id = self.eventId
	end
	return var1870
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
	local var1870 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1871, var1872 = protoModule.writeTag(buff, var1870, 1, protoModule.wireTypes.lengthDelimited)
		var1871, var2823 = protoModule.writeString(var1871, var1872, self.event_id)
		buff = var1871
		var1870 = var1872
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1873, var1874 = protoModule.writeTag(buff, var1870, 2, protoModule.wireTypes.lengthDelimited)
		var1873, var2825 = protoModule.writeString(var1873, var1874, self.universe_id)
		buff = var1873
		var1870 = var1874
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var1875 = v:encode()
			local var1876, var1877 = protoModule.writeTag(buff, var1870, 3, protoModule.wireTypes.lengthDelimited)
			var1876, var2828 = protoModule.writeBuffer(var1876, var1877, var1875, buffer.len(var1875))
			buff = var1876
			var1870 = var1877
		end
	end
	local buff_1 = buffer.create(var1870)
	buffer.copy(buff_1, 0, buff, 0, var1870)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1878 = t_67.new()
	local var1879 = 0
	while var1879 < buffer.len(p67) do
		local _ = nil
		local var1880 = nil
		local var1881, var1882, var1883 = protoModule.readTag(p67, var1879)
		local var1884 = var1881
		var1880 = var1882
		var1879 = var1883
		
		if var1880 == protoModule.wireTypes.varint then
			local _ = nil
			local var1885, var1886 = protoModule.readVarInt(p67, var1879)
			local _ = var1885
			var1879 = var1886
			continue
		end
		if var1880 == protoModule.wireTypes.lengthDelimited then
			if var1884 == 1 then
				local _ = nil
				local var1887, var1888 = protoModule.readBuffer(p67, var1879)
				var1879 = var1888
				var1878.event_id = buffer.tostring(var1887)
			elseif var1884 == 2 then
				local _ = nil
				local var1889, var1890 = protoModule.readBuffer(p67, var1879)
				var1879 = var1890
				var1878.universe_id = buffer.tostring(var1889)
			elseif var1884 == 3 then
				local _ = nil
				local var1891, var1892 = protoModule.readBuffer(p67, var1879)
				var1879 = var1892
				table.insert(var1878.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var1891))
			else
				local _ = nil
				local var1893, var1894 = protoModule.readVarInt(p67, var1879)
				var1879 = var1894 + var1893
			end
		elseif var1880 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1895, var1896 = protoModule.readFixed32(p67, var1879)
			local _ = var1895
			var1879 = var1896
		elseif var1880 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1897, var1898 = protoModule.readFixed64(p67, var1879)
			local _ = var1897
			var1879 = var1898
		else
			error("Unsupported wire type: " .. var2832)
		end
	end
	return var1878
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
	local var1899 = t_67.new()
	
	if self.event_id ~= nil then
		var1899.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1899.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1899.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1899.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1899.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1899.rsvp_users = t_1
	end
	return var1899
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
	local var1900 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var1901, var1902 = protoModule.writeTag(buff, var1900, 1, protoModule.wireTypes.varint)
		var1901, var2859 = protoModule.writeVarInt(var1901, var1902, self.user_id)
		buff = var1901
		var1900 = var1902
	end
	local buff_1 = buffer.create(var1900)
	buffer.copy(buff_1, 0, buff, 0, var1900)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1900 = t_68.new()
	local var1901 = 0
	while var1901 < buffer.len(p68) do
		local _ = nil
		local _ = nil
		local var1902, var1903, var1904 = protoModule.readTag(p68, var1901)
		local var1905 = var1902
		local var1906 = var1903
		var1901 = var1904
		
		if var1906 == protoModule.wireTypes.varint then
			if var1905 == 1 then
				local _ = nil
				local var1907, var1908 = protoModule.readVarIntI64(p68, var1901)
				var1901 = var1908
				var1900.user_id = var1907
			else
				local _ = nil
				local var1909, var1910 = protoModule.readVarInt(p68, var1901)
				local _ = var1909
				var1901 = var1910
			end
		elseif var1906 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1911, var1912 = protoModule.readVarInt(p68, var1901)
			var1901 = var1912 + var1911
		elseif var1906 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1913, var1914 = protoModule.readFixed32(p68, var1901)
			local _ = var1913
			var1901 = var1914
		elseif var1906 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1915, var1916 = protoModule.readFixed64(p68, var1901)
			local _ = var1915
			var1901 = var1916
		else
			error("Unsupported wire type: " .. var2867)
		end
	end
	return var1900
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
	local var1917 = t_68.new()
	
	if self.user_id ~= nil then
		var1917.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1917.user_id = self.userId
	end
	return var1917
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
	local var1917 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1918, var1919 = protoModule.writeTag(buff, var1917, 1, protoModule.wireTypes.lengthDelimited)
		var1918, var2883 = protoModule.writeString(var1918, var1919, self.event_id)
		buff = var1918
		var1917 = var1919
	end
	local buff_1 = buffer.create(var1917)
	buffer.copy(buff_1, 0, buff, 0, var1917)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1917 = t_69.new()
	local var1918 = 0
	while var1918 < buffer.len(p69) do
		local _ = nil
		local var1919 = nil
		local var1920, var1921, var1922 = protoModule.readTag(p69, var1918)
		local var1923 = var1920
		var1919 = var1921
		var1918 = var1922
		
		if var1919 == protoModule.wireTypes.varint then
			local _ = nil
			local var1924, var1925 = protoModule.readVarInt(p69, var1918)
			local _ = var1924
			var1918 = var1925
			continue
		end
		if var1919 == protoModule.wireTypes.lengthDelimited then
			if var1923 == 1 then
				local _ = nil
				local var1926, var1927 = protoModule.readBuffer(p69, var1918)
				var1918 = var1927
				var1917.event_id = buffer.tostring(var1926)
			else
				local _ = nil
				local var1928, var1929 = protoModule.readVarInt(p69, var1918)
				var1918 = var1929 + var1928
			end
		elseif var1919 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1930, var1931 = protoModule.readFixed32(p69, var1918)
			local _ = var1930
			var1918 = var1931
		elseif var1919 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1932, var1933 = protoModule.readFixed64(p69, var1918)
			local _ = var1932
			var1918 = var1933
		else
			error("Unsupported wire type: " .. var2887)
		end
	end
	return var1917
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
	local var1934 = t_69.new()
	
	if self.event_id ~= nil then
		var1934.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1934.event_id = self.eventId
	end
	return var1934
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
	local var1934 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1935, var1936 = protoModule.writeTag(buff, var1934, 1, protoModule.wireTypes.lengthDelimited)
		var1935, var2907 = protoModule.writeString(var1935, var1936, self.event_id)
		buff = var1935
		var1934 = var1936
	end
	local buff_1 = buffer.create(var1934)
	buffer.copy(buff_1, 0, buff, 0, var1934)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var1934 = t_70.new()
	local var1935 = 0
	while var1935 < buffer.len(p70) do
		local _ = nil
		local var1936 = nil
		local var1937, var1938, var1939 = protoModule.readTag(p70, var1935)
		local var1940 = var1937
		var1936 = var1938
		var1935 = var1939
		
		if var1936 == protoModule.wireTypes.varint then
			local _ = nil
			local var1941, var1942 = protoModule.readVarInt(p70, var1935)
			local _ = var1941
			var1935 = var1942
			continue
		end
		if var1936 == protoModule.wireTypes.lengthDelimited then
			if var1940 == 1 then
				local _ = nil
				local var1943, var1944 = protoModule.readBuffer(p70, var1935)
				var1935 = var1944
				var1934.event_id = buffer.tostring(var1943)
			else
				local _ = nil
				local var1945, var1946 = protoModule.readVarInt(p70, var1935)
				var1935 = var1946 + var1945
			end
		elseif var1936 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1947, var1948 = protoModule.readFixed32(p70, var1935)
			local _ = var1947
			var1935 = var1948
		elseif var1936 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1949, var1950 = protoModule.readFixed64(p70, var1935)
			local _ = var1949
			var1935 = var1950
		else
			error("Unsupported wire type: " .. var2911)
		end
	end
	return var1934
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
	local var1951 = t_70.new()
	
	if self.event_id ~= nil then
		var1951.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1951.event_id = self.eventId
	end
	return var1951
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
	local var1951 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1952, var1953 = protoModule.writeTag(buff, var1951, 1, protoModule.wireTypes.lengthDelimited)
		var1952, var2931 = protoModule.writeString(var1952, var1953, self.event_id)
		buff = var1952
		var1951 = var1953
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1954, var1955 = protoModule.writeTag(buff, var1951, 2, protoModule.wireTypes.lengthDelimited)
		var1954, var2933 = protoModule.writeString(var1954, var1955, self.universe_id)
		buff = var1954
		var1951 = var1955
	end
	local buff_1 = buffer.create(var1951)
	buffer.copy(buff_1, 0, buff, 0, var1951)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var1951 = t_71.new()
	local var1952 = 0
	while var1952 < buffer.len(p71) do
		local _ = nil
		local var1953 = nil
		local var1954, var1955, var1956 = protoModule.readTag(p71, var1952)
		local var1957 = var1954
		var1953 = var1955
		var1952 = var1956
		
		if var1953 == protoModule.wireTypes.varint then
			local _ = nil
			local var1958, var1959 = protoModule.readVarInt(p71, var1952)
			local _ = var1958
			var1952 = var1959
			continue
		end
		if var1953 == protoModule.wireTypes.lengthDelimited then
			if var1957 == 1 then
				local _ = nil
				local var1960, var1961 = protoModule.readBuffer(p71, var1952)
				var1952 = var1961
				var1951.event_id = buffer.tostring(var1960)
			elseif var1957 == 2 then
				local _ = nil
				local var1962, var1963 = protoModule.readBuffer(p71, var1952)
				var1952 = var1963
				var1951.universe_id = buffer.tostring(var1962)
			else
				local _ = nil
				local var1964, var1965 = protoModule.readVarInt(p71, var1952)
				var1952 = var1965 + var1964
			end
		elseif var1953 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1966, var1967 = protoModule.readFixed32(p71, var1952)
			local _ = var1966
			var1952 = var1967
		elseif var1953 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1968, var1969 = protoModule.readFixed64(p71, var1952)
			local _ = var1968
			var1952 = var1969
		else
			error("Unsupported wire type: " .. var2937)
		end
	end
	return var1951
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
	local var1970 = t_71.new()
	
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
	local var1970 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1971, var1972 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1971, var2959 = protoModule.writeString(var1971, var1972, i)
			local var1973 = v:encode()
			var1972, var2961 = protoModule.writeTag(var1971, var1972, 2, protoModule.wireTypes.lengthDelimited)
			var1972, var2961 = protoModule.writeBuffer(var1972, var2961, var1973, buffer.len(var1973))
			local var1974 = var1972
			local var1975 = var2961
			local var1976, var1977 = protoModule.writeTag(buff, var1970, 1, protoModule.wireTypes.lengthDelimited)
			var1976, var2965 = protoModule.writeBuffer(var1976, var1977, var1974, var1975)
			buff = var1976
			var1970 = var1977
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1978, var1979 = protoModule.writeTag(buff, var1970, 2, protoModule.wireTypes.lengthDelimited)
			var1978, var2967 = protoModule.writeString(var1978, var1979, v)
			buff = var1978
			var1970 = var1979
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1980, var1981 = protoModule.writeTag(buff, var1970, 3, protoModule.wireTypes.lengthDelimited)
		var1980, var2969 = protoModule.writeString(var1980, var1981, self.next_page_token)
		buff = var1980
		var1970 = var1981
	end
	if self.sticky_filter_pills ~= nil then
		local var1982 = self.sticky_filter_pills:encode()
		local var1983, var1984 = protoModule.writeTag(buff, var1970, 4, protoModule.wireTypes.lengthDelimited)
		var1983, var2972 = protoModule.writeBuffer(var1983, var1984, var1982, buffer.len(var1982))
		buff = var1983
		var1970 = var1984
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var1985, var1986 = protoModule.writeTag(buff, var1970, 5, protoModule.wireTypes.lengthDelimited)
		var1985, var2974 = protoModule.writeString(var1985, var1986, self.applied_filters)
		buff = var1985
		var1970 = var1986
	end
	local buff_1 = buffer.create(var1970)
	buffer.copy(buff_1, 0, buff, 0, var1970)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var1987 = t_72.new()
	local var1988 = 0
	while var1988 < buffer.len(p72) do
		local _ = nil
		local var1989 = nil
		local var1990, var1991, var1992 = protoModule.readTag(p72, var1988)
		local var1993 = var1990
		var1989 = var1991
		var1988 = var1992
		
		if var1989 == protoModule.wireTypes.varint then
			local _ = nil
			local var1994, var1995 = protoModule.readVarInt(p72, var1988)
			local _ = var1994
			var1988 = var1995
			continue
		end
		if var1989 == protoModule.wireTypes.lengthDelimited then
			if var1993 == 1 then
				local _ = nil
				local var1996, var1997 = protoModule.readBuffer(p72, var1988)
				var1988 = var1997
				var1996 = t.ChartsFeedInputData_EntryMapEntry.decode(var1996)
				var1987.entry_map[var1996.key or ""] = var1996.value or t.FeedEntry.new()
			elseif var1993 == 2 then
				local _ = nil
				local var1998, var1999 = protoModule.readBuffer(p72, var1988)
				var1988 = var1999
				table.insert(var1987.entry_order, buffer.tostring(var1998))
			elseif var1993 == 3 then
				local _ = nil
				local var2000, var2001 = protoModule.readBuffer(p72, var1988)
				var1988 = var2001
				var1987.next_page_token = buffer.tostring(var2000)
			elseif var1993 == 4 then
				local _ = nil
				local var2002, var2003 = protoModule.readBuffer(p72, var1988)
				var1988 = var2003
				var1987.sticky_filter_pills = t.FilterPillsInputData.decode(var2002)
			elseif var1993 == 5 then
				local _ = nil
				local var2004, var2005 = protoModule.readBuffer(p72, var1988)
				var1988 = var2005
				var1987.applied_filters = buffer.tostring(var2004)
			else
				local _ = nil
				local var2006, var2007 = protoModule.readVarInt(p72, var1988)
				var1988 = var2007 + var2006
			end
		elseif var1989 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2008, var2009 = protoModule.readFixed32(p72, var1988)
			local _ = var2008
			var1988 = var2009
		elseif var1989 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2010, var2011 = protoModule.readFixed64(p72, var1988)
			local _ = var2010
			var1988 = var2011
		else
			error("Unsupported wire type: " .. var2978)
		end
	end
	return var1987
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
	local var2012 = t_72.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2012.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2012.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2012.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2012.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2012.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2012.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2012.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2012.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2012.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2012.applied_filters = self.appliedFilters
	end
	return var2012
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
	local var2013 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2014, var2015 = protoModule.writeTag(buff, var2013, 1, protoModule.wireTypes.lengthDelimited)
		var2014, var3012 = protoModule.writeString(var2014, var2015, self.key)
		buff = var2014
		var2013 = var2015
	end
	if self.value ~= nil then
		local var2016 = self.value:encode()
		local var2017, var2018 = protoModule.writeTag(buff, var2013, 2, protoModule.wireTypes.lengthDelimited)
		var2017, var3015 = protoModule.writeBuffer(var2017, var2018, var2016, buffer.len(var2016))
		buff = var2017
		var2013 = var2018
	end
	local buff_1 = buffer.create(var2013)
	buffer.copy(buff_1, 0, buff, 0, var2013)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2013 = t_73.new()
	local var2014 = 0
	while var2014 < buffer.len(p73) do
		local _ = nil
		local var2015 = nil
		local var2016, var2017, var2018 = protoModule.readTag(p73, var2014)
		local var2019 = var2016
		var2015 = var2017
		var2014 = var2018
		
		if var2015 == protoModule.wireTypes.varint then
			local _ = nil
			local var2020, var2021 = protoModule.readVarInt(p73, var2014)
			local _ = var2020
			var2014 = var2021
			continue
		end
		if var2015 == protoModule.wireTypes.lengthDelimited then
			if var2019 == 1 then
				local _ = nil
				local var2022, var2023 = protoModule.readBuffer(p73, var2014)
				var2014 = var2023
				var2013.key = buffer.tostring(var2022)
			elseif var2019 == 2 then
				local _ = nil
				local var2024, var2025 = protoModule.readBuffer(p73, var2014)
				var2014 = var2025
				var2013.value = t.FeedEntry.decode(var2024)
			else
				local _ = nil
				local var2026, var2027 = protoModule.readVarInt(p73, var2014)
				var2014 = var2027 + var2026
			end
		elseif var2015 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2028, var2029 = protoModule.readFixed32(p73, var2014)
			local _ = var2028
			var2014 = var2029
		elseif var2015 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2030, var2031 = protoModule.readFixed64(p73, var2014)
			local _ = var2030
			var2014 = var2031
		else
			error("Unsupported wire type: " .. var3019)
		end
	end
	return var2013
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
	local var2032 = t_73.new()
	
	if self.key ~= nil then
		var2032.key = self.key
	end
	if self.value ~= nil then
		var2032.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2032
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
	local var2032 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2033 = v:encode()
			local var2034, var2035 = protoModule.writeTag(buff, var2032, 1, protoModule.wireTypes.lengthDelimited)
			var2034, var3042 = protoModule.writeBuffer(var2034, var2035, var2033, buffer.len(var2033))
			buff = var2034
			var2032 = var2035
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2036, var2037 = protoModule.writeTag(buff, var2032, 2, protoModule.wireTypes.lengthDelimited)
		var2036, var3044 = protoModule.writeString(var2036, var2037, self.sort_id)
		buff = var2036
		var2032 = var2037
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2038, var2039 = protoModule.writeTag(buff, var2032, 3, protoModule.wireTypes.varint)
		var2038, var3046 = protoModule.writeVarInt(var2038, var2039, self.secondary_sort_id)
		buff = var2038
		var2032 = var2039
	end
	if self.title ~= nil and self.title ~= "" then
		local var2040, var2041 = protoModule.writeTag(buff, var2032, 4, protoModule.wireTypes.lengthDelimited)
		var2040, var3048 = protoModule.writeString(var2040, var2041, self.title)
		buff = var2040
		var2032 = var2041
	end
	if self.primary_sort_id ~= nil then
		local var2042, var2043 = protoModule.writeTag(buff, var2032, 5, protoModule.wireTypes.varint)
		var2042, var3050 = protoModule.writeVarInt(var2042, var2043, self.primary_sort_id)
		buff = var2042
		var2032 = var2043
	end
	if self.applied_filters ~= nil then
		local var2044, var2045 = protoModule.writeTag(buff, var2032, 6, protoModule.wireTypes.lengthDelimited)
		var2044, var3052 = protoModule.writeString(var2044, var2045, self.applied_filters)
		buff = var2044
		var2032 = var2045
	end
	local buff_1 = buffer.create(var2032)
	buffer.copy(buff_1, 0, buff, 0, var2032)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2046 = t_74.new()
	local var2047 = 0
	while var2047 < buffer.len(p74) do
		local _ = nil
		local var2048 = nil
		local var2049, var2050, var2051 = protoModule.readTag(p74, var2047)
		local var2052 = var2049
		var2048 = var2050
		var2047 = var2051
		
		if var2048 == protoModule.wireTypes.varint then
			if var2052 == 3 then
				local _ = nil
				local var2053, var2054 = protoModule.readVarIntI32(p74, var2047)
				var2047 = var2054
				var2046.secondary_sort_id = var2053
			elseif var2052 == 5 then
				local _ = nil
				local var2055, var2056 = protoModule.readVarIntI32(p74, var2047)
				var2047 = var2056
				var2046.primary_sort_id = var2055
			else
				local _ = nil
				local var2057, var2058 = protoModule.readVarInt(p74, var2047)
				local _ = var2057
				var2047 = var2058
			end
		end
		if var2048 == protoModule.wireTypes.lengthDelimited then
			if var2052 == 1 then
				local _ = nil
				local var2059, var2060 = protoModule.readBuffer(p74, var2047)
				var2047 = var2060
				table.insert(var2046.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2059))
			elseif var2052 == 2 then
				local _ = nil
				local var2061, var2062 = protoModule.readBuffer(p74, var2047)
				var2047 = var2062
				var2046.sort_id = buffer.tostring(var2061)
			elseif var2052 == 4 then
				local _ = nil
				local var2063, var2064 = protoModule.readBuffer(p74, var2047)
				var2047 = var2064
				var2046.title = buffer.tostring(var2063)
			elseif var2052 == 6 then
				local _ = nil
				local var2065, var2066 = protoModule.readBuffer(p74, var2047)
				var2047 = var2066
				var2046.applied_filters = buffer.tostring(var2065)
			else
				local _ = nil
				local var2067, var2068 = protoModule.readVarInt(p74, var2047)
				var2047 = var2068 + var2067
			end
		elseif var2048 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2069, var2070 = protoModule.readFixed32(p74, var2047)
			local _ = var2069
			var2047 = var2070
		elseif var2048 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2071, var2072 = protoModule.readFixed64(p74, var2047)
			local _ = var2071
			var2047 = var2072
		else
			error("Unsupported wire type: " .. var3056)
		end
	end
	return var2046
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
	local var2073 = t_74.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2073.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2073.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2073.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2073.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2073.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2073.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2073.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2073.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2073.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2073.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2073.applied_filters = self.appliedFilters
	end
	return var2073
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
	local var2074 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2075, var2076 = protoModule.writeTag(buff, var2074, 1, protoModule.wireTypes.lengthDelimited)
		var2075, var3089 = protoModule.writeString(var2075, var2076, self.filter_id)
		buff = var2075
		var2074 = var2076
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2077, var2078 = protoModule.writeTag(buff, var2074, 2, protoModule.wireTypes.lengthDelimited)
		var2077, var3091 = protoModule.writeString(var2077, var2078, self.display_name)
		buff = var2077
		var2074 = var2078
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2079 = v:encode()
			local var2080, var2081 = protoModule.writeTag(buff, var2074, 3, protoModule.wireTypes.lengthDelimited)
			var2080, var3094 = protoModule.writeBuffer(var2080, var2081, var2079, buffer.len(var2079))
			buff = var2080
			var2074 = var2081
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2082, var2083 = protoModule.writeTag(buff, var2074, 4, protoModule.wireTypes.lengthDelimited)
		var2082, var3096 = protoModule.writeString(var2082, var2083, self.default_option_id)
		buff = var2082
		var2074 = var2083
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2084, var2085 = protoModule.writeTag(buff, var2074, 5, protoModule.wireTypes.lengthDelimited)
		var2084, var3098 = protoModule.writeString(var2084, var2085, self.selected_option_id)
		buff = var2084
		var2074 = var2085
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2086, var2087 = protoModule.writeTag(buff, var2074, 6, protoModule.wireTypes.lengthDelimited)
		var2086, var3100 = protoModule.writeString(var2086, var2087, self.filter_type)
		buff = var2086
		var2074 = var2087
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2088, var2089 = protoModule.writeTag(buff, var2074, 7, protoModule.wireTypes.lengthDelimited)
			var2088, var3102 = protoModule.writeString(var2088, var2089, v)
			buff = var2088
			var2074 = var2089
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2090, var2091 = protoModule.writeTag(buff, var2074, 8, protoModule.wireTypes.lengthDelimited)
		var2090, var3104 = protoModule.writeString(var2090, var2091, self.info_text)
		buff = var2090
		var2074 = var2091
	end
	local buff_1 = buffer.create(var2074)
	buffer.copy(buff_1, 0, buff, 0, var2074)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2092 = t_75.new()
	local var2093 = 0
	while var2093 < buffer.len(p75) do
		local _ = nil
		local var2094 = nil
		local var2095, var2096, var2097 = protoModule.readTag(p75, var2093)
		local var2098 = var2095
		var2094 = var2096
		var2093 = var2097
		
		if var2094 == protoModule.wireTypes.varint then
			local _ = nil
			local var2099, var2100 = protoModule.readVarInt(p75, var2093)
			local _ = var2099
			var2093 = var2100
			continue
		end
		if var2094 == protoModule.wireTypes.lengthDelimited then
			if var2098 == 1 then
				local _ = nil
				local var2101, var2102 = protoModule.readBuffer(p75, var2093)
				var2093 = var2102
				var2092.filter_id = buffer.tostring(var2101)
			elseif var2098 == 2 then
				local _ = nil
				local var2103, var2104 = protoModule.readBuffer(p75, var2093)
				var2093 = var2104
				var2092.display_name = buffer.tostring(var2103)
			elseif var2098 == 3 then
				local _ = nil
				local var2105, var2106 = protoModule.readBuffer(p75, var2093)
				var2093 = var2106
				table.insert(var2092.options, t.FilterPillsInputData_FilterOption.decode(var2105))
			elseif var2098 == 4 then
				local _ = nil
				local var2107, var2108 = protoModule.readBuffer(p75, var2093)
				var2093 = var2108
				var2092.default_option_id = buffer.tostring(var2107)
			elseif var2098 == 5 then
				local _ = nil
				local var2109, var2110 = protoModule.readBuffer(p75, var2093)
				var2093 = var2110
				var2092.selected_option_id = buffer.tostring(var2109)
			elseif var2098 == 6 then
				local _ = nil
				local var2111, var2112 = protoModule.readBuffer(p75, var2093)
				var2093 = var2112
				var2092.filter_type = buffer.tostring(var2111)
			elseif var2098 == 7 then
				local _ = nil
				local var2113, var2114 = protoModule.readBuffer(p75, var2093)
				var2093 = var2114
				table.insert(var2092.inactive_option_ids, buffer.tostring(var2113))
			elseif var2098 == 8 then
				local _ = nil
				local var2115, var2116 = protoModule.readBuffer(p75, var2093)
				var2093 = var2116
				var2092.info_text = buffer.tostring(var2115)
			else
				local _ = nil
				local var2117, var2118 = protoModule.readVarInt(p75, var2093)
				var2093 = var2118 + var2117
			end
		elseif var2094 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2119, var2120 = protoModule.readFixed32(p75, var2093)
			local _ = var2119
			var2093 = var2120
		elseif var2094 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2121, var2122 = protoModule.readFixed64(p75, var2093)
			local _ = var2121
			var2093 = var2122
		else
			error("Unsupported wire type: " .. var3108)
		end
	end
	return var2092
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
	local var2123 = t_75.new()
	
	if self.filter_id ~= nil then
		var2123.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2123.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2123.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2123.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2123.options = t_1
	end
	if self.default_option_id ~= nil then
		var2123.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2123.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2123.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2123.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2123.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2123.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2123.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2123.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2123.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2123.info_text = self.infoText
	end
	return var2123
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
	local var2124 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2125, var2126 = protoModule.writeTag(buff, var2124, 1, protoModule.wireTypes.lengthDelimited)
		var2125, var3147 = protoModule.writeString(var2125, var2126, self.option_id)
		buff = var2125
		var2124 = var2126
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2127, var2128 = protoModule.writeTag(buff, var2124, 2, protoModule.wireTypes.lengthDelimited)
		var2127, var3149 = protoModule.writeString(var2127, var2128, self.display_name)
		buff = var2127
		var2124 = var2128
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2129, var2130 = protoModule.writeTag(buff, var2124, 3, protoModule.wireTypes.lengthDelimited)
		var2129, var3151 = protoModule.writeString(var2129, var2130, self.option_context_tag)
		buff = var2129
		var2124 = var2130
	end
	local buff_1 = buffer.create(var2124)
	buffer.copy(buff_1, 0, buff, 0, var2124)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref)
	local var2124 = t_76.new()
	local var2125 = 0
	while var2125 < buffer.len(p76) do
		local _ = nil
		local var2126 = nil
		local var2127, var2128, var2129 = protoModule.readTag(p76, var2125)
		local var2130 = var2127
		var2126 = var2128
		var2125 = var2129
		
		if var2126 == protoModule.wireTypes.varint then
			local _ = nil
			local var2131, var2132 = protoModule.readVarInt(p76, var2125)
			local _ = var2131
			var2125 = var2132
			continue
		end
		if var2126 == protoModule.wireTypes.lengthDelimited then
			if var2130 == 1 then
				local _ = nil
				local var2133, var2134 = protoModule.readBuffer(p76, var2125)
				var2125 = var2134
				var2124.option_id = buffer.tostring(var2133)
			elseif var2130 == 2 then
				local _ = nil
				local var2135, var2136 = protoModule.readBuffer(p76, var2125)
				var2125 = var2136
				var2124.display_name = buffer.tostring(var2135)
			elseif var2130 == 3 then
				local _ = nil
				local var2137, var2138 = protoModule.readBuffer(p76, var2125)
				var2125 = var2138
				var2124.option_context_tag = buffer.tostring(var2137)
			else
				local _ = nil
				local var2139, var2140 = protoModule.readVarInt(p76, var2125)
				var2125 = var2140 + var2139
			end
		elseif var2126 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2141, var2142 = protoModule.readFixed32(p76, var2125)
			local _ = var2141
			var2125 = var2142
		elseif var2126 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2143, var2144 = protoModule.readFixed64(p76, var2125)
			local _ = var2143
			var2125 = var2144
		else
			error("Unsupported wire type: " .. var3155)
		end
	end
	return var2124
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
	local var2145 = t_76.new()
	
	if self.option_id ~= nil then
		var2145.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2145.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2145.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2145.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2145.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2145.option_context_tag = self.optionContextTag
	end
	return var2145
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
	local var2145 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2146 = v:encode()
			local var2147, var2148 = protoModule.writeTag(buff, var2145, 1, protoModule.wireTypes.lengthDelimited)
			var2147, var3180 = protoModule.writeBuffer(var2147, var2148, var2146, buffer.len(var2146))
			buff = var2147
			var2145 = var2148
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2149, var2150 = protoModule.writeTag(buff, var2145, 2, protoModule.wireTypes.lengthDelimited)
		var2149, var3182 = protoModule.writeString(var2149, var2150, self.selected_sort_id)
		buff = var2149
		var2145 = var2150
	end
	local buff_1 = buffer.create(var2145)
	buffer.copy(buff_1, 0, buff, 0, var2145)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2151 = t_77.new()
	local var2152 = 0
	while var2152 < buffer.len(p77) do
		local _ = nil
		local var2153 = nil
		local var2154, var2155, var2156 = protoModule.readTag(p77, var2152)
		local var2157 = var2154
		var2153 = var2155
		var2152 = var2156
		
		if var2153 == protoModule.wireTypes.varint then
			local _ = nil
			local var2158, var2159 = protoModule.readVarInt(p77, var2152)
			local _ = var2158
			var2152 = var2159
			continue
		end
		if var2153 == protoModule.wireTypes.lengthDelimited then
			if var2157 == 1 then
				local _ = nil
				local var2160, var2161 = protoModule.readBuffer(p77, var2152)
				var2152 = var2161
				table.insert(var2151.sort_options, t.SortSelectorInputData_SortOption.decode(var2160))
			elseif var2157 == 2 then
				local _ = nil
				local var2162, var2163 = protoModule.readBuffer(p77, var2152)
				var2152 = var2163
				var2151.selected_sort_id = buffer.tostring(var2162)
			else
				local _ = nil
				local var2164, var2165 = protoModule.readVarInt(p77, var2152)
				var2152 = var2165 + var2164
			end
		elseif var2153 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2166, var2167 = protoModule.readFixed32(p77, var2152)
			local _ = var2166
			var2152 = var2167
		elseif var2153 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2168, var2169 = protoModule.readFixed64(p77, var2152)
			local _ = var2168
			var2152 = var2169
		else
			error("Unsupported wire type: " .. var3186)
		end
	end
	return var2151
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
	local var2170 = t_77.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2170.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2170.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2170.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2170.selected_sort_id = self.selectedSortId
	end
	return var2170
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
	local var2171 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2172, var2173 = protoModule.writeTag(buff, var2171, 1, protoModule.wireTypes.lengthDelimited)
		var2172, var3211 = protoModule.writeString(var2172, var2173, self.sort_id)
		buff = var2172
		var2171 = var2173
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2174, var2175 = protoModule.writeTag(buff, var2171, 2, protoModule.wireTypes.lengthDelimited)
		var2174, var3213 = protoModule.writeString(var2174, var2175, self.display_name)
		buff = var2174
		var2171 = var2175
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2176, var2177 = protoModule.writeTag(buff, var2171, 3, protoModule.wireTypes.lengthDelimited)
		var2176, var3215 = protoModule.writeString(var2176, var2177, self.content_type)
		buff = var2176
		var2171 = var2177
	end
	local buff_1 = buffer.create(var2171)
	buffer.copy(buff_1, 0, buff, 0, var2171)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var2171 = t_78.new()
	local var2172 = 0
	while var2172 < buffer.len(p78) do
		local _ = nil
		local var2173 = nil
		local var2174, var2175, var2176 = protoModule.readTag(p78, var2172)
		local var2177 = var2174
		var2173 = var2175
		var2172 = var2176
		
		if var2173 == protoModule.wireTypes.varint then
			local _ = nil
			local var2178, var2179 = protoModule.readVarInt(p78, var2172)
			local _ = var2178
			var2172 = var2179
			continue
		end
		if var2173 == protoModule.wireTypes.lengthDelimited then
			if var2177 == 1 then
				local _ = nil
				local var2180, var2181 = protoModule.readBuffer(p78, var2172)
				var2172 = var2181
				var2171.sort_id = buffer.tostring(var2180)
			elseif var2177 == 2 then
				local _ = nil
				local var2182, var2183 = protoModule.readBuffer(p78, var2172)
				var2172 = var2183
				var2171.display_name = buffer.tostring(var2182)
			elseif var2177 == 3 then
				local _ = nil
				local var2184, var2185 = protoModule.readBuffer(p78, var2172)
				var2172 = var2185
				var2171.content_type = buffer.tostring(var2184)
			else
				local _ = nil
				local var2186, var2187 = protoModule.readVarInt(p78, var2172)
				var2172 = var2187 + var2186
			end
		elseif var2173 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2188, var2189 = protoModule.readFixed32(p78, var2172)
			local _ = var2188
			var2172 = var2189
		elseif var2173 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2190, var2191 = protoModule.readFixed64(p78, var2172)
			local _ = var2190
			var2172 = var2191
		else
			error("Unsupported wire type: " .. var3219)
		end
	end
	return var2171
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
	local var2192 = t_78.new()
	
	if self.sort_id ~= nil then
		var2192.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2192.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2192.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2192.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2192.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2192.content_type = self.contentType
	end
	return var2192
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
	local var2192 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2193, var2194 = protoModule.writeTag(buff, var2192, 1, protoModule.wireTypes.lengthDelimited)
		var2193, var3243 = protoModule.writeString(var2193, var2194, self.selected_option)
		buff = var2193
		var2192 = var2194
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2195 = v:encode()
			local var2196, var2197 = protoModule.writeTag(buff, var2192, 2, protoModule.wireTypes.lengthDelimited)
			var2196, var3246 = protoModule.writeBuffer(var2196, var2197, var2195, buffer.len(var2195))
			buff = var2196
			var2192 = var2197
		end
	end
	if self.experience_carousel ~= nil then
		local var2198 = self.experience_carousel:encode()
		local var2199, var2200 = protoModule.writeTag(buff, var2192, 3, protoModule.wireTypes.lengthDelimited)
		var2199, var3249 = protoModule.writeBuffer(var2199, var2200, var2198, buffer.len(var2198))
		buff = var2199
		var2192 = var2200
	end
	local buff_1 = buffer.create(var2192)
	buffer.copy(buff_1, 0, buff, 0, var2192)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2201 = t_79.new()
	local var2202 = 0
	while var2202 < buffer.len(p79) do
		local _ = nil
		local var2203 = nil
		local var2204, var2205, var2206 = protoModule.readTag(p79, var2202)
		local var2207 = var2204
		var2203 = var2205
		var2202 = var2206
		
		if var2203 == protoModule.wireTypes.varint then
			local _ = nil
			local var2208, var2209 = protoModule.readVarInt(p79, var2202)
			local _ = var2208
			var2202 = var2209
			continue
		end
		if var2203 == protoModule.wireTypes.lengthDelimited then
			if var2207 == 1 then
				local _ = nil
				local var2210, var2211 = protoModule.readBuffer(p79, var2202)
				var2202 = var2211
				var2201.selected_option = buffer.tostring(var2210)
			elseif var2207 == 2 then
				local _ = nil
				local var2212, var2213 = protoModule.readBuffer(p79, var2202)
				var2202 = var2213
				table.insert(var2201.options, t.SelectorOption.decode(var2212))
			elseif var2207 == 3 then
				local _ = nil
				local var2214, var2215 = protoModule.readBuffer(p79, var2202)
				var2202 = var2215
				var2201.experience_carousel = t.ExperienceCarouselInputData.decode(var2214)
			else
				local _ = nil
				local var2216, var2217 = protoModule.readVarInt(p79, var2202)
				var2202 = var2217 + var2216
			end
		elseif var2203 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2218, var2219 = protoModule.readFixed32(p79, var2202)
			local _ = var2218
			var2202 = var2219
		elseif var2203 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2220, var2221 = protoModule.readFixed64(p79, var2202)
			local _ = var2220
			var2202 = var2221
		else
			error("Unsupported wire type: " .. var3253)
		end
	end
	return var2201
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
	local var2222 = t_79.new()
	
	if self.selected_option ~= nil then
		var2222.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2222.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2222.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2222.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2222.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2222
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
	local var2223 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2224, var2225 = protoModule.writeTag(buff, var2223, 1, protoModule.wireTypes.lengthDelimited)
		var2224, var3279 = protoModule.writeString(var2224, var2225, self.id)
		buff = var2224
		var2223 = var2225
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2226, var2227 = protoModule.writeTag(buff, var2223, 4, protoModule.wireTypes.varint)
		var2226, var3281 = protoModule.writeVarInt(var2226, var2227, self.preview_rows)
		buff = var2226
		var2223 = var2227
	end
	if self.widget_style ~= nil then
		local var2228 = self.widget_style:encode()
		local var2229, var2230 = protoModule.writeTag(buff, var2223, 3, protoModule.wireTypes.lengthDelimited)
		var2229, var3284 = protoModule.writeBuffer(var2229, var2230, var2228, buffer.len(var2228))
		buff = var2229
		var2223 = var2230
	end
	if self.see_all_button then
		local var2231, var2232 = protoModule.writeTag(buff, var2223, 5, protoModule.wireTypes.varint)
		var2231, var3286 = protoModule.writeVarInt(var2231, var2232, if self.see_all_button then 1 else 0)
		buff = var2231
		var2223 = var2232
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2233, var2234 = protoModule.writeTag(buff, var2223, 6, protoModule.wireTypes.lengthDelimited)
		var2233, var3288 = protoModule.writeString(var2233, var2234, self.information_popover_text)
		buff = var2233
		var2223 = var2234
	end
	local buff_1 = buffer.create(var2223)
	buffer.copy(buff_1, 0, buff, 0, var2223)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2223 = t_80.new()
	local var2224 = 0
	while var2224 < buffer.len(p80) do
		local _ = nil
		local var2225 = nil
		local var2226, var2227, var2228 = protoModule.readTag(p80, var2224)
		local var2229 = var2226
		var2225 = var2227
		var2224 = var2228
		
		if var2225 == protoModule.wireTypes.varint then
			if var2229 == 4 then
				local _ = nil
				local var2230, var2231 = protoModule.readVarIntI64(p80, var2224)
				var2224 = var2231
				var2223.preview_rows = var2230
			elseif var2229 == 5 then
				local _ = nil
				local var2232, var2233 = protoModule.readVarInt(p80, var2224)
				var2224 = var2233
				var2223.see_all_button = var2232 ~= 0
			else
				local _ = nil
				local var2234, var2235 = protoModule.readVarInt(p80, var2224)
				local _ = var2234
				var2224 = var2235
			end
		end
		if var2225 == protoModule.wireTypes.lengthDelimited then
			if var2229 == 1 then
				local _ = nil
				local var2236, var2237 = protoModule.readBuffer(p80, var2224)
				var2224 = var2237
				var2223.id = buffer.tostring(var2236)
			elseif var2229 == 3 then
				local _ = nil
				local var2238, var2239 = protoModule.readBuffer(p80, var2224)
				var2224 = var2239
				var2223.widget_style = t.WidgetStyleData.decode(var2238)
			elseif var2229 == 6 then
				local _ = nil
				local var2240, var2241 = protoModule.readBuffer(p80, var2224)
				var2224 = var2241
				var2223.information_popover_text = buffer.tostring(var2240)
			else
				local _ = nil
				local var2242, var2243 = protoModule.readVarInt(p80, var2224)
				var2224 = var2243 + var2242
			end
		elseif var2225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2244, var2245 = protoModule.readFixed32(p80, var2224)
			local _ = var2244
			var2224 = var2245
		elseif var2225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2246, var2247 = protoModule.readFixed64(p80, var2224)
			local _ = var2246
			var2224 = var2247
		else
			error("Unsupported wire type: " .. var3292)
		end
	end
	return var2223
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
	local var2248 = t_80.new()
	
	if self.id ~= nil then
		var2248.id = self.id
	end
	if self.preview_rows ~= nil then
		var2248.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2248.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2248.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2248.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2248.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2248.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2248.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2248.information_popover_text = self.informationPopoverText
	end
	return var2248
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
	local var2248 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2249, var2250 = protoModule.writeTag(buff, var2248, 1, protoModule.wireTypes.lengthDelimited)
		var2249, var3320 = protoModule.writeString(var2249, var2250, self.id)
		buff = var2249
		var2248 = var2250
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2251, var2252 = protoModule.writeTag(buff, var2248, 5, protoModule.wireTypes.varint)
		var2251, var3322 = protoModule.writeVarInt(var2251, var2252, self.num_items_to_show)
		buff = var2251
		var2248 = var2252
	end
	if self.widget_style ~= nil then
		local var2253 = self.widget_style:encode()
		local var2254, var2255 = protoModule.writeTag(buff, var2248, 3, protoModule.wireTypes.lengthDelimited)
		var2254, var3325 = protoModule.writeBuffer(var2254, var2255, var2253, buffer.len(var2253))
		buff = var2254
		var2248 = var2255
	end
	if self.see_all_button then
		local var2256, var2257 = protoModule.writeTag(buff, var2248, 6, protoModule.wireTypes.varint)
		var2256, var3327 = protoModule.writeVarInt(var2256, var2257, if self.see_all_button then 1 else 0)
		buff = var2256
		var2248 = var2257
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2258, var2259 = protoModule.writeTag(buff, var2248, 7, protoModule.wireTypes.lengthDelimited)
		var2258, var3329 = protoModule.writeString(var2258, var2259, self.information_popover_text)
		buff = var2258
		var2248 = var2259
	end
	local buff_1 = buffer.create(var2248)
	buffer.copy(buff_1, 0, buff, 0, var2248)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2248 = t_81.new()
	local var2249 = 0
	while var2249 < buffer.len(p81) do
		local _ = nil
		local var2250 = nil
		local var2251, var2252, var2253 = protoModule.readTag(p81, var2249)
		local var2254 = var2251
		var2250 = var2252
		var2249 = var2253
		
		if var2250 == protoModule.wireTypes.varint then
			if var2254 == 5 then
				local _ = nil
				local var2255, var2256 = protoModule.readVarIntI64(p81, var2249)
				var2249 = var2256
				var2248.num_items_to_show = var2255
			elseif var2254 == 6 then
				local _ = nil
				local var2257, var2258 = protoModule.readVarInt(p81, var2249)
				var2249 = var2258
				var2248.see_all_button = var2257 ~= 0
			else
				local _ = nil
				local var2259, var2260 = protoModule.readVarInt(p81, var2249)
				local _ = var2259
				var2249 = var2260
			end
		end
		if var2250 == protoModule.wireTypes.lengthDelimited then
			if var2254 == 1 then
				local _ = nil
				local var2261, var2262 = protoModule.readBuffer(p81, var2249)
				var2249 = var2262
				var2248.id = buffer.tostring(var2261)
			elseif var2254 == 3 then
				local _ = nil
				local var2263, var2264 = protoModule.readBuffer(p81, var2249)
				var2249 = var2264
				var2248.widget_style = t.WidgetStyleData.decode(var2263)
			elseif var2254 == 7 then
				local _ = nil
				local var2265, var2266 = protoModule.readBuffer(p81, var2249)
				var2249 = var2266
				var2248.information_popover_text = buffer.tostring(var2265)
			else
				local _ = nil
				local var2267, var2268 = protoModule.readVarInt(p81, var2249)
				var2249 = var2268 + var2267
			end
		elseif var2250 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2269, var2270 = protoModule.readFixed32(p81, var2249)
			local _ = var2269
			var2249 = var2270
		elseif var2250 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2271, var2272 = protoModule.readFixed64(p81, var2249)
			local _ = var2271
			var2249 = var2272
		else
			error("Unsupported wire type: " .. var3333)
		end
	end
	return var2248
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
	local var2273 = t_81.new()
	
	if self.id ~= nil then
		var2273.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2273.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2273.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2273.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2273.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2273.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2273.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2273.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2273.information_popover_text = self.informationPopoverText
	end
	return var2273
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
	local var2273 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2274 = v:encode()
			local var2275, var2276 = protoModule.writeTag(buff, var2273, 1, protoModule.wireTypes.lengthDelimited)
			var2275, var3362 = protoModule.writeBuffer(var2275, var2276, var2274, buffer.len(var2274))
			buff = var2275
			var2273 = var2276
		end
	end
	local buff_1 = buffer.create(var2273)
	buffer.copy(buff_1, 0, buff, 0, var2273)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2277 = t_82.new()
	local var2278 = 0
	while var2278 < buffer.len(p82) do
		local _ = nil
		local var2279 = nil
		local var2280, var2281, var2282 = protoModule.readTag(p82, var2278)
		local var2283 = var2280
		var2279 = var2281
		var2278 = var2282
		
		if var2279 == protoModule.wireTypes.varint then
			local _ = nil
			local var2284, var2285 = protoModule.readVarInt(p82, var2278)
			local _ = var2284
			var2278 = var2285
			continue
		end
		if var2279 == protoModule.wireTypes.lengthDelimited then
			if var2283 == 1 then
				local _ = nil
				local var2286, var2287 = protoModule.readBuffer(p82, var2278)
				var2278 = var2287
				table.insert(var2277.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2286))
			else
				local _ = nil
				local var2288, var2289 = protoModule.readVarInt(p82, var2278)
				var2278 = var2289 + var2288
			end
		elseif var2279 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2290, var2291 = protoModule.readFixed32(p82, var2278)
			local _ = var2290
			var2278 = var2291
		elseif var2279 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2292, var2293 = protoModule.readFixed64(p82, var2278)
			local _ = var2292
			var2278 = var2293
		else
			error("Unsupported wire type: " .. var3366)
		end
	end
	return var2277
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
	local var2294 = t_82.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2294.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2294.background_layers = t
	end
	return var2294
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
	local var2295 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2296, var2297 = protoModule.writeTag(buff, var2295, 1, protoModule.wireTypes.lengthDelimited)
		var2296, var3389 = protoModule.writeString(var2296, var2297, self.id)
		buff = var2296
		var2295 = var2297
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2298, var2299 = protoModule.writeTag(buff, var2295, 2, protoModule.wireTypes.lengthDelimited)
		var2298, var3391 = protoModule.writeString(var2298, var2299, self.available_until)
		buff = var2298
		var2295 = var2299
	end
	if self.widget_style ~= nil then
		local var2300 = self.widget_style:encode()
		local var2301, var2302 = protoModule.writeTag(buff, var2295, 3, protoModule.wireTypes.lengthDelimited)
		var2301, var3394 = protoModule.writeBuffer(var2301, var2302, var2300, buffer.len(var2300))
		buff = var2301
		var2295 = var2302
	end
	local buff_1 = buffer.create(var2295)
	buffer.copy(buff_1, 0, buff, 0, var2295)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2295 = t_83.new()
	local var2296 = 0
	while var2296 < buffer.len(p83) do
		local _ = nil
		local var2297 = nil
		local var2298, var2299, var2300 = protoModule.readTag(p83, var2296)
		local var2301 = var2298
		var2297 = var2299
		var2296 = var2300
		
		if var2297 == protoModule.wireTypes.varint then
			local _ = nil
			local var2302, var2303 = protoModule.readVarInt(p83, var2296)
			local _ = var2302
			var2296 = var2303
			continue
		end
		if var2297 == protoModule.wireTypes.lengthDelimited then
			if var2301 == 1 then
				local _ = nil
				local var2304, var2305 = protoModule.readBuffer(p83, var2296)
				var2296 = var2305
				var2295.id = buffer.tostring(var2304)
			elseif var2301 == 2 then
				local _ = nil
				local var2306, var2307 = protoModule.readBuffer(p83, var2296)
				var2296 = var2307
				var2295.available_until = buffer.tostring(var2306)
			elseif var2301 == 3 then
				local _ = nil
				local var2308, var2309 = protoModule.readBuffer(p83, var2296)
				var2296 = var2309
				var2295.widget_style = t.WidgetStyleData.decode(var2308)
			else
				local _ = nil
				local var2310, var2311 = protoModule.readVarInt(p83, var2296)
				var2296 = var2311 + var2310
			end
		elseif var2297 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2312, var2313 = protoModule.readFixed32(p83, var2296)
			local _ = var2312
			var2296 = var2313
		elseif var2297 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2314, var2315 = protoModule.readFixed64(p83, var2296)
			local _ = var2314
			var2296 = var2315
		else
			error("Unsupported wire type: " .. var3398)
		end
	end
	return var2295
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
	local var2316 = t_83.new()
	
	if self.id ~= nil then
		var2316.id = self.id
	end
	if self.available_until ~= nil then
		var2316.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2316.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2316.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2316.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2316
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
	local var2316 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2317, var2318 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2317, var3422 = protoModule.writeString(var2317, var2318, i)
			local var2319 = v:encode()
			var2318, var3424 = protoModule.writeTag(var2317, var2318, 2, protoModule.wireTypes.lengthDelimited)
			var2318, var3424 = protoModule.writeBuffer(var2318, var3424, var2319, buffer.len(var2319))
			local var2320 = var2318
			local var2321 = var3424
			local var2322, var2323 = protoModule.writeTag(buff, var2316, 1, protoModule.wireTypes.lengthDelimited)
			var2322, var3428 = protoModule.writeBuffer(var2322, var2323, var2320, var2321)
			buff = var2322
			var2316 = var2323
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2324, var2325 = protoModule.writeTag(buff, var2316, 2, protoModule.wireTypes.lengthDelimited)
			var2324, var3430 = protoModule.writeString(var2324, var2325, v)
			buff = var2324
			var2316 = var2325
		end
	end
	local buff_1 = buffer.create(var2316)
	buffer.copy(buff_1, 0, buff, 0, var2316)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2326 = t_84.new()
	local var2327 = 0
	while var2327 < buffer.len(p84) do
		local _ = nil
		local var2328 = nil
		local var2329, var2330, var2331 = protoModule.readTag(p84, var2327)
		local var2332 = var2329
		var2328 = var2330
		var2327 = var2331
		
		if var2328 == protoModule.wireTypes.varint then
			local _ = nil
			local var2333, var2334 = protoModule.readVarInt(p84, var2327)
			local _ = var2333
			var2327 = var2334
			continue
		end
		if var2328 == protoModule.wireTypes.lengthDelimited then
			if var2332 == 1 then
				local _ = nil
				local var2335, var2336 = protoModule.readBuffer(p84, var2327)
				var2327 = var2336
				var2335 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2335)
				var2326.entry_map[var2335.key or ""] = var2335.value or t.FeedEntry.new()
			elseif var2332 == 2 then
				local _ = nil
				local var2337, var2338 = protoModule.readBuffer(p84, var2327)
				var2327 = var2338
				table.insert(var2326.entry_order, buffer.tostring(var2337))
			else
				local _ = nil
				local var2339, var2340 = protoModule.readVarInt(p84, var2327)
				var2327 = var2340 + var2339
			end
		elseif var2328 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2341, var2342 = protoModule.readFixed32(p84, var2327)
			local _ = var2341
			var2327 = var2342
		elseif var2328 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2343, var2344 = protoModule.readFixed64(p84, var2327)
			local _ = var2343
			var2327 = var2344
		else
			error("Unsupported wire type: " .. var3434)
		end
	end
	return var2326
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
	local var2345 = t_84.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2345.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2345.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2345.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2345.entry_order = t_1
	end
	return var2345
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
	local var2346 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2347, var2348 = protoModule.writeTag(buff, var2346, 1, protoModule.wireTypes.lengthDelimited)
		var2347, var3462 = protoModule.writeString(var2347, var2348, self.key)
		buff = var2347
		var2346 = var2348
	end
	if self.value ~= nil then
		local var2349 = self.value:encode()
		local var2350, var2351 = protoModule.writeTag(buff, var2346, 2, protoModule.wireTypes.lengthDelimited)
		var2350, var3465 = protoModule.writeBuffer(var2350, var2351, var2349, buffer.len(var2349))
		buff = var2350
		var2346 = var2351
	end
	local buff_1 = buffer.create(var2346)
	buffer.copy(buff_1, 0, buff, 0, var2346)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2346 = t_85.new()
	local var2347 = 0
	while var2347 < buffer.len(p85) do
		local _ = nil
		local var2348 = nil
		local var2349, var2350, var2351 = protoModule.readTag(p85, var2347)
		local var2352 = var2349
		var2348 = var2350
		var2347 = var2351
		
		if var2348 == protoModule.wireTypes.varint then
			local _ = nil
			local var2353, var2354 = protoModule.readVarInt(p85, var2347)
			local _ = var2353
			var2347 = var2354
			continue
		end
		if var2348 == protoModule.wireTypes.lengthDelimited then
			if var2352 == 1 then
				local _ = nil
				local var2355, var2356 = protoModule.readBuffer(p85, var2347)
				var2347 = var2356
				var2346.key = buffer.tostring(var2355)
			elseif var2352 == 2 then
				local _ = nil
				local var2357, var2358 = protoModule.readBuffer(p85, var2347)
				var2347 = var2358
				var2346.value = t.FeedEntry.decode(var2357)
			else
				local _ = nil
				local var2359, var2360 = protoModule.readVarInt(p85, var2347)
				var2347 = var2360 + var2359
			end
		elseif var2348 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2361, var2362 = protoModule.readFixed32(p85, var2347)
			local _ = var2361
			var2347 = var2362
		elseif var2348 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2363, var2364 = protoModule.readFixed64(p85, var2347)
			local _ = var2363
			var2347 = var2364
		else
			error("Unsupported wire type: " .. var3469)
		end
	end
	return var2346
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
	local var2365 = t_85.new()
	
	if self.key ~= nil then
		var2365.key = self.key
	end
	if self.value ~= nil then
		var2365.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2365
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
	local var2365 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2366 = v:encode()
			local var2367, var2368 = protoModule.writeTag(buff, var2365, 1, protoModule.wireTypes.lengthDelimited)
			var2367, var3492 = protoModule.writeBuffer(var2367, var2368, var2366, buffer.len(var2366))
			buff = var2367
			var2365 = var2368
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2369, var2370 = protoModule.writeTag(buff, var2365, 2, protoModule.wireTypes.lengthDelimited)
		var2369, var3494 = protoModule.writeString(var2369, var2370, self.active_category_id)
		buff = var2369
		var2365 = var2370
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2371, var2372 = protoModule.writeTag(buff, var2365, 3, protoModule.wireTypes.varint)
		var2371, var3496 = protoModule.writeVarInt(var2371, var2372, self.active_tooltip_idx)
		buff = var2371
		var2365 = var2372
	end
	local buff_1 = buffer.create(var2365)
	buffer.copy(buff_1, 0, buff, 0, var2365)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2373 = t_86.new()
	local var2374 = 0
	while var2374 < buffer.len(p86) do
		local _ = nil
		local var2375 = nil
		local var2376, var2377, var2378 = protoModule.readTag(p86, var2374)
		local var2379 = var2376
		var2375 = var2377
		var2374 = var2378
		
		if var2375 == protoModule.wireTypes.varint then
			if var2379 == 3 then
				local _ = nil
				local var2380, var2381 = protoModule.readVarIntI64(p86, var2374)
				var2374 = var2381
				var2373.active_tooltip_idx = var2380
			else
				local _ = nil
				local var2382, var2383 = protoModule.readVarInt(p86, var2374)
				local _ = var2382
				var2374 = var2383
			end
		end
		if var2375 == protoModule.wireTypes.lengthDelimited then
			if var2379 == 1 then
				local _ = nil
				local var2384, var2385 = protoModule.readBuffer(p86, var2374)
				var2374 = var2385
				table.insert(var2373.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2384))
			elseif var2379 == 2 then
				local _ = nil
				local var2386, var2387 = protoModule.readBuffer(p86, var2374)
				var2374 = var2387
				var2373.active_category_id = buffer.tostring(var2386)
			else
				local _ = nil
				local var2388, var2389 = protoModule.readVarInt(p86, var2374)
				var2374 = var2389 + var2388
			end
		elseif var2375 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2390, var2391 = protoModule.readFixed32(p86, var2374)
			local _ = var2390
			var2374 = var2391
		elseif var2375 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2392, var2393 = protoModule.readFixed64(p86, var2374)
			local _ = var2392
			var2374 = var2393
		else
			error("Unsupported wire type: " .. var3500)
		end
	end
	return var2373
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
	local var2394 = t_86.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2394.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2394.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2394.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2394.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2394.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2394.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2394
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
	local var2395 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2396, var2397 = protoModule.writeTag(buff, var2395, 1, protoModule.wireTypes.lengthDelimited)
		var2396, var3527 = protoModule.writeString(var2396, var2397, self.marketplace_catalog_category_item_id)
		buff = var2396
		var2395 = var2397
	end
	local buff_1 = buffer.create(var2395)
	buffer.copy(buff_1, 0, buff, 0, var2395)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref)
	local var2395 = t_87.new()
	local var2396 = 0
	while var2396 < buffer.len(p87) do
		local _ = nil
		local var2397 = nil
		local var2398, var2399, var2400 = protoModule.readTag(p87, var2396)
		local var2401 = var2398
		var2397 = var2399
		var2396 = var2400
		
		if var2397 == protoModule.wireTypes.varint then
			local _ = nil
			local var2402, var2403 = protoModule.readVarInt(p87, var2396)
			local _ = var2402
			var2396 = var2403
			continue
		end
		if var2397 == protoModule.wireTypes.lengthDelimited then
			if var2401 == 1 then
				local _ = nil
				local var2404, var2405 = protoModule.readBuffer(p87, var2396)
				var2396 = var2405
				var2395.marketplace_catalog_category_item_id = buffer.tostring(var2404)
			else
				local _ = nil
				local var2406, var2407 = protoModule.readVarInt(p87, var2396)
				var2396 = var2407 + var2406
			end
		elseif var2397 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2408, var2409 = protoModule.readFixed32(p87, var2396)
			local _ = var2408
			var2396 = var2409
		elseif var2397 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2410, var2411 = protoModule.readFixed64(p87, var2396)
			local _ = var2410
			var2396 = var2411
		else
			error("Unsupported wire type: " .. var3531)
		end
	end
	return var2395
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
	local var2412 = t_87.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2412.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2412.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2412
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
	local var2412 = 0
	
	if self.hero_icon ~= nil then
		local var2413, var2414 = protoModule.writeTag(buff, var2412, 1, protoModule.wireTypes.lengthDelimited)
		var2413, var3551 = protoModule.writeString(var2413, var2414, self.hero_icon)
		buff = var2413
		var2412 = var2414
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2415, var2416 = protoModule.writeTag(buff, var2412, 2, protoModule.wireTypes.lengthDelimited)
		var2415, var3553 = protoModule.writeString(var2415, var2416, self.body_dismiss_button_text)
		buff = var2415
		var2412 = var2416
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2417, var2418 = protoModule.writeTag(buff, var2412, 3, protoModule.wireTypes.lengthDelimited)
		var2417, var3555 = protoModule.writeString(var2417, var2418, self.body_title)
		buff = var2417
		var2412 = var2418
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2419, var2420 = protoModule.writeTag(buff, var2412, 4, protoModule.wireTypes.lengthDelimited)
		var2419, var3557 = protoModule.writeString(var2419, var2420, self.body_rich_text)
		buff = var2419
		var2412 = var2420
	end
	if self.terms_link_text ~= nil then
		local var2421, var2422 = protoModule.writeTag(buff, var2412, 5, protoModule.wireTypes.lengthDelimited)
		var2421, var3559 = protoModule.writeString(var2421, var2422, self.terms_link_text)
		buff = var2421
		var2412 = var2422
	end
	if self.terms_title ~= nil then
		local var2423, var2424 = protoModule.writeTag(buff, var2412, 6, protoModule.wireTypes.lengthDelimited)
		var2423, var3561 = protoModule.writeString(var2423, var2424, self.terms_title)
		buff = var2423
		var2412 = var2424
	end
	if self.terms_body_rich_text ~= nil then
		local var2425, var2426 = protoModule.writeTag(buff, var2412, 7, protoModule.wireTypes.lengthDelimited)
		var2425, var3563 = protoModule.writeString(var2425, var2426, self.terms_body_rich_text)
		buff = var2425
		var2412 = var2426
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2427, var2428 = protoModule.writeTag(buff, var2412, 8, protoModule.wireTypes.lengthDelimited)
		var2427, var3565 = protoModule.writeString(var2427, var2428, self.terms_dismiss_button_text)
		buff = var2427
		var2412 = var2428
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2429, var2430 = protoModule.writeTag(buff, var2412, 9, protoModule.wireTypes.lengthDelimited)
		var2429, var3567 = protoModule.writeString(var2429, var2430, self.offer_id)
		buff = var2429
		var2412 = var2430
	end
	local buff_1 = buffer.create(var2412)
	buffer.copy(buff_1, 0, buff, 0, var2412)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref)
	local var2412 = t_88.new()
	local var2413 = 0
	while var2413 < buffer.len(p88) do
		local _ = nil
		local var2414 = nil
		local var2415, var2416, var2417 = protoModule.readTag(p88, var2413)
		local var2418 = var2415
		var2414 = var2416
		var2413 = var2417
		
		if var2414 == protoModule.wireTypes.varint then
			local _ = nil
			local var2419, var2420 = protoModule.readVarInt(p88, var2413)
			local _ = var2419
			var2413 = var2420
			continue
		end
		if var2414 == protoModule.wireTypes.lengthDelimited then
			if var2418 == 1 then
				local _ = nil
				local var2421, var2422 = protoModule.readBuffer(p88, var2413)
				var2413 = var2422
				var2412.hero_icon = buffer.tostring(var2421)
			elseif var2418 == 2 then
				local _ = nil
				local var2423, var2424 = protoModule.readBuffer(p88, var2413)
				var2413 = var2424
				var2412.body_dismiss_button_text = buffer.tostring(var2423)
			elseif var2418 == 3 then
				local _ = nil
				local var2425, var2426 = protoModule.readBuffer(p88, var2413)
				var2413 = var2426
				var2412.body_title = buffer.tostring(var2425)
			elseif var2418 == 4 then
				local _ = nil
				local var2427, var2428 = protoModule.readBuffer(p88, var2413)
				var2413 = var2428
				var2412.body_rich_text = buffer.tostring(var2427)
			elseif var2418 == 5 then
				local _ = nil
				local var2429, var2430 = protoModule.readBuffer(p88, var2413)
				var2413 = var2430
				var2412.terms_link_text = buffer.tostring(var2429)
			elseif var2418 == 6 then
				local _ = nil
				local var2431, var2432 = protoModule.readBuffer(p88, var2413)
				var2413 = var2432
				var2412.terms_title = buffer.tostring(var2431)
			elseif var2418 == 7 then
				local _ = nil
				local var2433, var2434 = protoModule.readBuffer(p88, var2413)
				var2413 = var2434
				var2412.terms_body_rich_text = buffer.tostring(var2433)
			elseif var2418 == 8 then
				local _ = nil
				local var2435, var2436 = protoModule.readBuffer(p88, var2413)
				var2413 = var2436
				var2412.terms_dismiss_button_text = buffer.tostring(var2435)
			elseif var2418 == 9 then
				local _ = nil
				local var2437, var2438 = protoModule.readBuffer(p88, var2413)
				var2413 = var2438
				var2412.offer_id = buffer.tostring(var2437)
			else
				local _ = nil
				local var2439, var2440 = protoModule.readVarInt(p88, var2413)
				var2413 = var2440 + var2439
			end
		elseif var2414 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2441, var2442 = protoModule.readFixed32(p88, var2413)
			local _ = var2441
			var2413 = var2442
		elseif var2414 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2443, var2444 = protoModule.readFixed64(p88, var2413)
			local _ = var2443
			var2413 = var2444
		else
			error("Unsupported wire type: " .. var3571)
		end
	end
	return var2412
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
	local var2445 = t_88.new()
	
	if self.hero_icon ~= nil then
		var2445.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2445.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2445.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2445.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2445.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2445.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2445.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2445.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2445.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2445.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2445.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2445.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2445.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2445.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2445.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2445.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2445.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2445.offer_id = self.offerId
	end
	return var2445
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
	local var2445 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2446 = v:encode()
			local var2447, var2448 = protoModule.writeTag(buff, var2445, 1, protoModule.wireTypes.lengthDelimited)
			var2447, var3608 = protoModule.writeBuffer(var2447, var2448, var2446, buffer.len(var2446))
			buff = var2447
			var2445 = var2448
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2449, var2450 = protoModule.writeTag(buff, var2445, 2, protoModule.wireTypes.varint)
		var2449, var3610 = protoModule.writeVarInt(var2449, var2450, self.preview_columns)
		buff = var2449
		var2445 = var2450
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2451, var2452 = protoModule.writeTag(buff, var2445, 3, protoModule.wireTypes.lengthDelimited)
		var2451, var3612 = protoModule.writeString(var2451, var2452, self.impression_id)
		buff = var2451
		var2445 = var2452
	end
	local buff_1 = buffer.create(var2445)
	buffer.copy(buff_1, 0, buff, 0, var2445)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
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
			if var2459 == 2 then
				local _ = nil
				local var2460, var2461 = protoModule.readVarIntI32(p89, var2454)
				var2454 = var2461
				var2453.preview_columns = var2460
			else
				local _ = nil
				local var2462, var2463 = protoModule.readVarInt(p89, var2454)
				local _ = var2462
				var2454 = var2463
			end
		end
		if var2455 == protoModule.wireTypes.lengthDelimited then
			if var2459 == 1 then
				local _ = nil
				local var2464, var2465 = protoModule.readBuffer(p89, var2454)
				var2454 = var2465
				table.insert(var2453.items, t.CatalogItemGridInputData_CatalogItem.decode(var2464))
			elseif var2459 == 3 then
				local _ = nil
				local var2466, var2467 = protoModule.readBuffer(p89, var2454)
				var2454 = var2467
				var2453.impression_id = buffer.tostring(var2466)
			else
				local _ = nil
				local var2468, var2469 = protoModule.readVarInt(p89, var2454)
				var2454 = var2469 + var2468
			end
		elseif var2455 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2470, var2471 = protoModule.readFixed32(p89, var2454)
			local _ = var2470
			var2454 = var2471
		elseif var2455 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2472, var2473 = protoModule.readFixed64(p89, var2454)
			local _ = var2472
			var2454 = var2473
		else
			error("Unsupported wire type: " .. var3616)
		end
	end
	return var2453
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
	local var2474 = t_89.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2474.items = t_1
	end
	if self.preview_columns ~= nil then
		var2474.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2474.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2474.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2474.impression_id = self.impressionId
	end
	return var2474
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
	local var2475 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2476, var2477 = protoModule.writeTag(buff, var2475, 1, protoModule.wireTypes.lengthDelimited)
		var2476, var3642 = protoModule.writeString(var2476, var2477, self.id)
		buff = var2476
		var2475 = var2477
	end
	if self.type ~= nil and self.type ~= "" then
		local var2478, var2479 = protoModule.writeTag(buff, var2475, 2, protoModule.wireTypes.lengthDelimited)
		var2478, var3644 = protoModule.writeString(var2478, var2479, self.type)
		buff = var2478
		var2475 = var2479
	end
	local buff_1 = buffer.create(var2475)
	buffer.copy(buff_1, 0, buff, 0, var2475)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2475 = t_90.new()
	local var2476 = 0
	while var2476 < buffer.len(p90) do
		local _ = nil
		local var2477 = nil
		local var2478, var2479, var2480 = protoModule.readTag(p90, var2476)
		local var2481 = var2478
		var2477 = var2479
		var2476 = var2480
		
		if var2477 == protoModule.wireTypes.varint then
			local _ = nil
			local var2482, var2483 = protoModule.readVarInt(p90, var2476)
			local _ = var2482
			var2476 = var2483
			continue
		end
		if var2477 == protoModule.wireTypes.lengthDelimited then
			if var2481 == 1 then
				local _ = nil
				local var2484, var2485 = protoModule.readBuffer(p90, var2476)
				var2476 = var2485
				var2475.id = buffer.tostring(var2484)
			elseif var2481 == 2 then
				local _ = nil
				local var2486, var2487 = protoModule.readBuffer(p90, var2476)
				var2476 = var2487
				var2475.type = buffer.tostring(var2486)
			else
				local _ = nil
				local var2488, var2489 = protoModule.readVarInt(p90, var2476)
				var2476 = var2489 + var2488
			end
		elseif var2477 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2490, var2491 = protoModule.readFixed32(p90, var2476)
			local _ = var2490
			var2476 = var2491
		elseif var2477 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2492, var2493 = protoModule.readFixed64(p90, var2476)
			local _ = var2492
			var2476 = var2493
		else
			error("Unsupported wire type: " .. var3648)
		end
	end
	return var2475
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
	local var2494 = t_90.new()
	
	if self.id ~= nil then
		var2494.id = self.id
	end
	if self.type ~= nil then
		var2494.type = self.type
	end
	return var2494
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
	local var2494 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2495, var2496 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2495, var3670 = protoModule.writeString(var2495, var2496, i)
			local var2497 = v:encode()
			var2496, var3672 = protoModule.writeTag(var2495, var2496, 2, protoModule.wireTypes.lengthDelimited)
			var2496, var3672 = protoModule.writeBuffer(var2496, var3672, var2497, buffer.len(var2497))
			local var2498 = var2496
			local var2499 = var3672
			local var2500, var2501 = protoModule.writeTag(buff, var2494, 1, protoModule.wireTypes.lengthDelimited)
			var2500, var3676 = protoModule.writeBuffer(var2500, var2501, var2498, var2499)
			buff = var2500
			var2494 = var2501
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2502, var2503 = protoModule.writeTag(buff, var2494, 2, protoModule.wireTypes.lengthDelimited)
			var2502, var3678 = protoModule.writeString(var2502, var2503, v)
			buff = var2502
			var2494 = var2503
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2504, var2505 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2504, var3680 = protoModule.writeString(var2504, var2505, i)
			local var2506 = v:encode()
			var2505, var3682 = protoModule.writeTag(var2504, var2505, 2, protoModule.wireTypes.lengthDelimited)
			var2505, var3682 = protoModule.writeBuffer(var2505, var3682, var2506, buffer.len(var2506))
			local var2507 = var2505
			local var2508 = var3682
			local var2509, var2510 = protoModule.writeTag(buff, var2494, 3, protoModule.wireTypes.lengthDelimited)
			var2509, var3686 = protoModule.writeBuffer(var2509, var2510, var2507, var2508)
			buff = var2509
			var2494 = var2510
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2511, var2512 = protoModule.writeTag(buff, var2494, 4, protoModule.wireTypes.lengthDelimited)
		var2511, var3688 = protoModule.writeString(var2511, var2512, self.search_session_id)
		buff = var2511
		var2494 = var2512
	end
	local buff_1 = buffer.create(var2494)
	buffer.copy(buff_1, 0, buff, 0, var2494)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var2513 = t_91.new()
	local var2514 = 0
	while var2514 < buffer.len(p91) do
		local _ = nil
		local var2515 = nil
		local var2516, var2517, var2518 = protoModule.readTag(p91, var2514)
		local var2519 = var2516
		var2515 = var2517
		var2514 = var2518
		
		if var2515 == protoModule.wireTypes.varint then
			local _ = nil
			local var2520, var2521 = protoModule.readVarInt(p91, var2514)
			local _ = var2520
			var2514 = var2521
			continue
		end
		if var2515 == protoModule.wireTypes.lengthDelimited then
			if var2519 == 1 then
				local _ = nil
				local var2522, var2523 = protoModule.readBuffer(p91, var2514)
				var2514 = var2523
				var2522 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2522)
				var2513.entry_map[var2522.key or ""] = var2522.value or t.FeedEntry.new()
			elseif var2519 == 2 then
				local _ = nil
				local var2524, var2525 = protoModule.readBuffer(p91, var2514)
				var2514 = var2525
				table.insert(var2513.entry_order, buffer.tostring(var2524))
			elseif var2519 == 3 then
				local _ = nil
				local var2526, var2527 = protoModule.readBuffer(p91, var2514)
				var2514 = var2527
				var2526 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2526)
				var2513.content_pools[var2526.key or ""] = var2526.value or t.ContentPool.new()
			elseif var2519 == 4 then
				local _ = nil
				local var2528, var2529 = protoModule.readBuffer(p91, var2514)
				var2514 = var2529
				var2513.search_session_id = buffer.tostring(var2528)
			else
				local _ = nil
				local var2530, var2531 = protoModule.readVarInt(p91, var2514)
				var2514 = var2531 + var2530
			end
		elseif var2515 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2532, var2533 = protoModule.readFixed32(p91, var2514)
			local _ = var2532
			var2514 = var2533
		elseif var2515 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2534, var2535 = protoModule.readFixed64(p91, var2514)
			local _ = var2534
			var2514 = var2535
		else
			error("Unsupported wire type: " .. var3692)
		end
	end
	return var2513
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
	local var2536 = t_91.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2536.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2536.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2536.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2536.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2536.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2536.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2536.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2536.search_session_id = self.searchSessionId
	end
	return var2536
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
	local var2537 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2538, var2539 = protoModule.writeTag(buff, var2537, 1, protoModule.wireTypes.lengthDelimited)
		var2538, var3727 = protoModule.writeString(var2538, var2539, self.key)
		buff = var2538
		var2537 = var2539
	end
	if self.value ~= nil then
		local var2540 = self.value:encode()
		local var2541, var2542 = protoModule.writeTag(buff, var2537, 2, protoModule.wireTypes.lengthDelimited)
		var2541, var3730 = protoModule.writeBuffer(var2541, var2542, var2540, buffer.len(var2540))
		buff = var2541
		var2537 = var2542
	end
	local buff_1 = buffer.create(var2537)
	buffer.copy(buff_1, 0, buff, 0, var2537)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var2537 = t_92.new()
	local var2538 = 0
	while var2538 < buffer.len(p92) do
		local _ = nil
		local var2539 = nil
		local var2540, var2541, var2542 = protoModule.readTag(p92, var2538)
		local var2543 = var2540
		var2539 = var2541
		var2538 = var2542
		
		if var2539 == protoModule.wireTypes.varint then
			local _ = nil
			local var2544, var2545 = protoModule.readVarInt(p92, var2538)
			local _ = var2544
			var2538 = var2545
			continue
		end
		if var2539 == protoModule.wireTypes.lengthDelimited then
			if var2543 == 1 then
				local _ = nil
				local var2546, var2547 = protoModule.readBuffer(p92, var2538)
				var2538 = var2547
				var2537.key = buffer.tostring(var2546)
			elseif var2543 == 2 then
				local _ = nil
				local var2548, var2549 = protoModule.readBuffer(p92, var2538)
				var2538 = var2549
				var2537.value = t.FeedEntry.decode(var2548)
			else
				local _ = nil
				local var2550, var2551 = protoModule.readVarInt(p92, var2538)
				var2538 = var2551 + var2550
			end
		elseif var2539 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2552, var2553 = protoModule.readFixed32(p92, var2538)
			local _ = var2552
			var2538 = var2553
		elseif var2539 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2554, var2555 = protoModule.readFixed64(p92, var2538)
			local _ = var2554
			var2538 = var2555
		else
			error("Unsupported wire type: " .. var3734)
		end
	end
	return var2537
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
	local var2556 = t_92.new()
	
	if self.key ~= nil then
		var2556.key = self.key
	end
	if self.value ~= nil then
		var2556.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2556
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
	local var2556 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2557, var2558 = protoModule.writeTag(buff, var2556, 1, protoModule.wireTypes.lengthDelimited)
		var2557, var3756 = protoModule.writeString(var2557, var2558, self.key)
		buff = var2557
		var2556 = var2558
	end
	if self.value ~= nil then
		local var2559 = self.value:encode()
		local var2560, var2561 = protoModule.writeTag(buff, var2556, 2, protoModule.wireTypes.lengthDelimited)
		var2560, var3759 = protoModule.writeBuffer(var2560, var2561, var2559, buffer.len(var2559))
		buff = var2560
		var2556 = var2561
	end
	local buff_1 = buffer.create(var2556)
	buffer.copy(buff_1, 0, buff, 0, var2556)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2556 = t_93.new()
	local var2557 = 0
	while var2557 < buffer.len(p93) do
		local _ = nil
		local var2558 = nil
		local var2559, var2560, var2561 = protoModule.readTag(p93, var2557)
		local var2562 = var2559
		var2558 = var2560
		var2557 = var2561
		
		if var2558 == protoModule.wireTypes.varint then
			local _ = nil
			local var2563, var2564 = protoModule.readVarInt(p93, var2557)
			local _ = var2563
			var2557 = var2564
			continue
		end
		if var2558 == protoModule.wireTypes.lengthDelimited then
			if var2562 == 1 then
				local _ = nil
				local var2565, var2566 = protoModule.readBuffer(p93, var2557)
				var2557 = var2566
				var2556.key = buffer.tostring(var2565)
			elseif var2562 == 2 then
				local _ = nil
				local var2567, var2568 = protoModule.readBuffer(p93, var2557)
				var2557 = var2568
				var2556.value = t.ContentPool.decode(var2567)
			else
				local _ = nil
				local var2569, var2570 = protoModule.readVarInt(p93, var2557)
				var2557 = var2570 + var2569
			end
		elseif var2558 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2571, var2572 = protoModule.readFixed32(p93, var2557)
			local _ = var2571
			var2557 = var2572
		elseif var2558 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2573, var2574 = protoModule.readFixed64(p93, var2557)
			local _ = var2573
			var2557 = var2574
		else
			error("Unsupported wire type: " .. var3763)
		end
	end
	return var2556
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
	local var2575 = t_93.new()
	
	if self.key ~= nil then
		var2575.key = self.key
	end
	if self.value ~= nil then
		var2575.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2575
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
	local var2575 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2576, var2577 = protoModule.writeTag(buff, var2575, 1, protoModule.wireTypes.lengthDelimited)
		var2576, var3785 = protoModule.writeString(var2576, var2577, self.universe_id)
		buff = var2576
		var2575 = var2577
	end
	if self.is_content_locked then
		local var2578, var2579 = protoModule.writeTag(buff, var2575, 2, protoModule.wireTypes.varint)
		var2578, var3787 = protoModule.writeVarInt(var2578, var2579, if self.is_content_locked then 1 else 0)
		buff = var2578
		var2575 = var2579
	end
	local buff_1 = buffer.create(var2575)
	buffer.copy(buff_1, 0, buff, 0, var2575)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref)
	local var2575 = t_94.new()
	local var2576 = 0
	while var2576 < buffer.len(p94) do
		local _ = nil
		local var2577 = nil
		local var2578, var2579, var2580 = protoModule.readTag(p94, var2576)
		local var2581 = var2578
		var2577 = var2579
		var2576 = var2580
		
		if var2577 == protoModule.wireTypes.varint then
			if var2581 == 2 then
				local _ = nil
				local var2582, var2583 = protoModule.readVarInt(p94, var2576)
				var2576 = var2583
				var2575.is_content_locked = var2582 ~= 0
			else
				local _ = nil
				local var2584, var2585 = protoModule.readVarInt(p94, var2576)
				local _ = var2584
				var2576 = var2585
			end
		end
		if var2577 == protoModule.wireTypes.lengthDelimited then
			if var2581 == 1 then
				local _ = nil
				local var2586, var2587 = protoModule.readBuffer(p94, var2576)
				var2576 = var2587
				var2575.universe_id = buffer.tostring(var2586)
			else
				local _ = nil
				local var2588, var2589 = protoModule.readVarInt(p94, var2576)
				var2576 = var2589 + var2588
			end
		elseif var2577 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2590, var2591 = protoModule.readFixed32(p94, var2576)
			local _ = var2590
			var2576 = var2591
		elseif var2577 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2592, var2593 = protoModule.readFixed64(p94, var2576)
			local _ = var2592
			var2576 = var2593
		else
			error("Unsupported wire type: " .. var3791)
		end
	end
	return var2575
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
	local var2594 = t_94.new()
	
	if self.universe_id ~= nil then
		var2594.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2594.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2594.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2594.is_content_locked = self.isContentLocked
	end
	return var2594
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
	local var2594 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2595, var2596 = protoModule.writeTag(buff, var2594, 1, protoModule.wireTypes.lengthDelimited)
		var2595, var3813 = protoModule.writeString(var2595, var2596, self.overview_rich_text)
		buff = var2595
		var2594 = var2596
	end
	if self.result_entry ~= nil then
		local var2597 = self.result_entry:encode()
		local var2598, var2599 = protoModule.writeTag(buff, var2594, 2, protoModule.wireTypes.lengthDelimited)
		var2598, var3816 = protoModule.writeBuffer(var2598, var2599, var2597, buffer.len(var2597))
		buff = var2598
		var2594 = var2599
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2600, var2601 = protoModule.writeTag(buff, var2594, 3, protoModule.wireTypes.lengthDelimited)
			var2600, var3818 = protoModule.writeString(var2600, var2601, v)
			buff = var2600
			var2594 = var2601
		end
	end
	if self.show_loading then
		local var2602, var2603 = protoModule.writeTag(buff, var2594, 4, protoModule.wireTypes.varint)
		var2602, var3820 = protoModule.writeVarInt(var2602, var2603, if self.show_loading then 1 else 0)
		buff = var2602
		var2594 = var2603
	end
	if self.title ~= nil and self.title ~= "" then
		local var2604, var2605 = protoModule.writeTag(buff, var2594, 5, protoModule.wireTypes.lengthDelimited)
		var2604, var3822 = protoModule.writeString(var2604, var2605, self.title)
		buff = var2604
		var2594 = var2605
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2606, var2607 = protoModule.writeTag(buff, var2594, 6, protoModule.wireTypes.lengthDelimited)
		var2606, var3824 = protoModule.writeString(var2606, var2607, self.search_query)
		buff = var2606
		var2594 = var2607
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2608, var2609 = protoModule.writeTag(buff, var2594, 8, protoModule.wireTypes.lengthDelimited)
		var2608, var3826 = protoModule.writeString(var2608, var2609, self.universe_ids)
		buff = var2608
		var2594 = var2609
	end
	local buff_1 = buffer.create(var2594)
	buffer.copy(buff_1, 0, buff, 0, var2594)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2610 = t_95.new()
	local var2611 = 0
	while var2611 < buffer.len(p95) do
		local _ = nil
		local var2612 = nil
		local var2613, var2614, var2615 = protoModule.readTag(p95, var2611)
		local var2616 = var2613
		var2612 = var2614
		var2611 = var2615
		
		if var2612 == protoModule.wireTypes.varint then
			if var2616 == 4 then
				local _ = nil
				local var2617, var2618 = protoModule.readVarInt(p95, var2611)
				var2611 = var2618
				var2610.show_loading = var2617 ~= 0
			else
				local _ = nil
				local var2619, var2620 = protoModule.readVarInt(p95, var2611)
				local _ = var2619
				var2611 = var2620
			end
		end
		if var2612 == protoModule.wireTypes.lengthDelimited then
			if var2616 == 1 then
				local _ = nil
				local var2621, var2622 = protoModule.readBuffer(p95, var2611)
				var2611 = var2622
				var2610.overview_rich_text = buffer.tostring(var2621)
			elseif var2616 == 2 then
				local _ = nil
				local var2623, var2624 = protoModule.readBuffer(p95, var2611)
				var2611 = var2624
				var2610.result_entry = t.FeedEntry.decode(var2623)
			elseif var2616 == 3 then
				local _ = nil
				local var2625, var2626 = protoModule.readBuffer(p95, var2611)
				var2611 = var2626
				table.insert(var2610.follow_up_queries, buffer.tostring(var2625))
			elseif var2616 == 5 then
				local _ = nil
				local var2627, var2628 = protoModule.readBuffer(p95, var2611)
				var2611 = var2628
				var2610.title = buffer.tostring(var2627)
			elseif var2616 == 6 then
				local _ = nil
				local var2629, var2630 = protoModule.readBuffer(p95, var2611)
				var2611 = var2630
				var2610.search_query = buffer.tostring(var2629)
			elseif var2616 == 8 then
				local _ = nil
				local var2631, var2632 = protoModule.readBuffer(p95, var2611)
				var2611 = var2632
				var2610.universe_ids = buffer.tostring(var2631)
			else
				local _ = nil
				local var2633, var2634 = protoModule.readVarInt(p95, var2611)
				var2611 = var2634 + var2633
			end
		elseif var2612 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2635, var2636 = protoModule.readFixed32(p95, var2611)
			local _ = var2635
			var2611 = var2636
		elseif var2612 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2637, var2638 = protoModule.readFixed64(p95, var2611)
			local _ = var2637
			var2611 = var2638
		else
			error("Unsupported wire type: " .. var3830)
		end
	end
	return var2610
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
	local var2639 = t_95.new()
	
	if self.overview_rich_text ~= nil then
		var2639.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2639.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2639.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2639.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2639.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2639.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2639.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2639.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2639.title = self.title
	end
	if self.search_query ~= nil then
		var2639.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2639.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2639.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2639.universe_ids = self.universeIds
	end
	return var2639
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
	local var2640 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2641, var2642 = protoModule.writeTag(buff, var2640, 1, protoModule.wireTypes.lengthDelimited)
		var2641, var3865 = protoModule.writeString(var2641, var2642, self.title)
		buff = var2641
		var2640 = var2642
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2643 = v:encode()
			local var2644, var2645 = protoModule.writeTag(buff, var2640, 2, protoModule.wireTypes.lengthDelimited)
			var2644, var3868 = protoModule.writeBuffer(var2644, var2645, var2643, buffer.len(var2643))
			buff = var2644
			var2640 = var2645
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2646, var2647 = protoModule.writeTag(buff, var2640, 3, protoModule.wireTypes.varint)
		var2646, var3870 = protoModule.writeVarInt(var2646, var2647, self.max_visible_rows)
		buff = var2646
		var2640 = var2647
	end
	if self.sort_id ~= nil then
		local var2648, var2649 = protoModule.writeTag(buff, var2640, 4, protoModule.wireTypes.lengthDelimited)
		var2648, var3872 = protoModule.writeString(var2648, var2649, self.sort_id)
		buff = var2648
		var2640 = var2649
	end
	local buff_1 = buffer.create(var2640)
	buffer.copy(buff_1, 0, buff, 0, var2640)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var2650 = t_96.new()
	local var2651 = 0
	while var2651 < buffer.len(p96) do
		local _ = nil
		local var2652 = nil
		local var2653, var2654, var2655 = protoModule.readTag(p96, var2651)
		local var2656 = var2653
		var2652 = var2654
		var2651 = var2655
		
		if var2652 == protoModule.wireTypes.varint then
			if var2656 == 3 then
				local _ = nil
				local var2657, var2658 = protoModule.readVarIntI32(p96, var2651)
				var2651 = var2658
				var2650.max_visible_rows = var2657
			else
				local _ = nil
				local var2659, var2660 = protoModule.readVarInt(p96, var2651)
				local _ = var2659
				var2651 = var2660
			end
		end
		if var2652 == protoModule.wireTypes.lengthDelimited then
			if var2656 == 1 then
				local _ = nil
				local var2661, var2662 = protoModule.readBuffer(p96, var2651)
				var2651 = var2662
				var2650.title = buffer.tostring(var2661)
			elseif var2656 == 2 then
				local _ = nil
				local var2663, var2664 = protoModule.readBuffer(p96, var2651)
				var2651 = var2664
				table.insert(var2650.user_items, t.UserListInputData_UserItem.decode(var2663))
			elseif var2656 == 4 then
				local _ = nil
				local var2665, var2666 = protoModule.readBuffer(p96, var2651)
				var2651 = var2666
				var2650.sort_id = buffer.tostring(var2665)
			else
				local _ = nil
				local var2667, var2668 = protoModule.readVarInt(p96, var2651)
				var2651 = var2668 + var2667
			end
		elseif var2652 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2669, var2670 = protoModule.readFixed32(p96, var2651)
			local _ = var2669
			var2651 = var2670
		elseif var2652 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2671, var2672 = protoModule.readFixed64(p96, var2651)
			local _ = var2671
			var2651 = var2672
		else
			error("Unsupported wire type: " .. var3876)
		end
	end
	return var2650
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
	local var2673 = t_96.new()
	
	if self.title ~= nil then
		var2673.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2673.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2673.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2673.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2673.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2673.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2673.sort_id = self.sortId
	end
	return var2673
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
	local var2674 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2675, var2676 = protoModule.writeTag(buff, var2674, 1, protoModule.wireTypes.lengthDelimited)
		var2675, var3905 = protoModule.writeString(var2675, var2676, self.user_id)
		buff = var2675
		var2674 = var2676
	end
	local buff_1 = buffer.create(var2674)
	buffer.copy(buff_1, 0, buff, 0, var2674)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref)
	local var2674 = t_97.new()
	local var2675 = 0
	while var2675 < buffer.len(p97) do
		local _ = nil
		local var2676 = nil
		local var2677, var2678, var2679 = protoModule.readTag(p97, var2675)
		local var2680 = var2677
		var2676 = var2678
		var2675 = var2679
		
		if var2676 == protoModule.wireTypes.varint then
			local _ = nil
			local var2681, var2682 = protoModule.readVarInt(p97, var2675)
			local _ = var2681
			var2675 = var2682
			continue
		end
		if var2676 == protoModule.wireTypes.lengthDelimited then
			if var2680 == 1 then
				local _ = nil
				local var2683, var2684 = protoModule.readBuffer(p97, var2675)
				var2675 = var2684
				var2674.user_id = buffer.tostring(var2683)
			else
				local _ = nil
				local var2685, var2686 = protoModule.readVarInt(p97, var2675)
				var2675 = var2686 + var2685
			end
		elseif var2676 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2687, var2688 = protoModule.readFixed32(p97, var2675)
			local _ = var2687
			var2675 = var2688
		elseif var2676 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2689, var2690 = protoModule.readFixed64(p97, var2675)
			local _ = var2689
			var2675 = var2690
		else
			error("Unsupported wire type: " .. var3909)
		end
	end
	return var2674
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
	local var2691 = t_97.new()
	
	if self.user_id ~= nil then
		var2691.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2691.user_id = self.userId
	end
	return var2691
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
	local var2691 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2692, var2693 = protoModule.writeTag(buff, var2691, 1, protoModule.wireTypes.lengthDelimited)
		var2692, var3929 = protoModule.writeString(var2692, var2693, self.title)
		buff = var2692
		var2691 = var2693
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2694 = v:encode()
			local var2695, var2696 = protoModule.writeTag(buff, var2691, 2, protoModule.wireTypes.lengthDelimited)
			var2695, var3932 = protoModule.writeBuffer(var2695, var2696, var2694, buffer.len(var2694))
			buff = var2695
			var2691 = var2696
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2697, var2698 = protoModule.writeTag(buff, var2691, 3, protoModule.wireTypes.varint)
		var2697, var3934 = protoModule.writeVarInt(var2697, var2698, self.max_visible_rows)
		buff = var2697
		var2691 = var2698
	end
	if self.sort_id ~= nil then
		local var2699, var2700 = protoModule.writeTag(buff, var2691, 4, protoModule.wireTypes.lengthDelimited)
		var2699, var3936 = protoModule.writeString(var2699, var2700, self.sort_id)
		buff = var2699
		var2691 = var2700
	end
	local buff_1 = buffer.create(var2691)
	buffer.copy(buff_1, 0, buff, 0, var2691)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2701 = t_98.new()
	local var2702 = 0
	while var2702 < buffer.len(p98) do
		local _ = nil
		local var2703 = nil
		local var2704, var2705, var2706 = protoModule.readTag(p98, var2702)
		local var2707 = var2704
		var2703 = var2705
		var2702 = var2706
		
		if var2703 == protoModule.wireTypes.varint then
			if var2707 == 3 then
				local _ = nil
				local var2708, var2709 = protoModule.readVarIntI32(p98, var2702)
				var2702 = var2709
				var2701.max_visible_rows = var2708
			else
				local _ = nil
				local var2710, var2711 = protoModule.readVarInt(p98, var2702)
				local _ = var2710
				var2702 = var2711
			end
		end
		if var2703 == protoModule.wireTypes.lengthDelimited then
			if var2707 == 1 then
				local _ = nil
				local var2712, var2713 = protoModule.readBuffer(p98, var2702)
				var2702 = var2713
				var2701.title = buffer.tostring(var2712)
			elseif var2707 == 2 then
				local _ = nil
				local var2714, var2715 = protoModule.readBuffer(p98, var2702)
				var2702 = var2715
				table.insert(var2701.items, t.CatalogItemListInputData_CatalogItem.decode(var2714))
			elseif var2707 == 4 then
				local _ = nil
				local var2716, var2717 = protoModule.readBuffer(p98, var2702)
				var2702 = var2717
				var2701.sort_id = buffer.tostring(var2716)
			else
				local _ = nil
				local var2718, var2719 = protoModule.readVarInt(p98, var2702)
				var2702 = var2719 + var2718
			end
		elseif var2703 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2720, var2721 = protoModule.readFixed32(p98, var2702)
			local _ = var2720
			var2702 = var2721
		elseif var2703 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2722, var2723 = protoModule.readFixed64(p98, var2702)
			local _ = var2722
			var2702 = var2723
		else
			error("Unsupported wire type: " .. var3940)
		end
	end
	return var2701
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
	local var2724 = t_98.new()
	
	if self.title ~= nil then
		var2724.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2724.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2724.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2724.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2724.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2724.sort_id = self.sortId
	end
	return var2724
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
	local var2725 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2726, var2727 = protoModule.writeTag(buff, var2725, 1, protoModule.wireTypes.lengthDelimited)
		var2726, var3968 = protoModule.writeString(var2726, var2727, self.item_id)
		buff = var2726
		var2725 = var2727
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2728, var2729 = protoModule.writeTag(buff, var2725, 2, protoModule.wireTypes.lengthDelimited)
		var2728, var3970 = protoModule.writeString(var2728, var2729, self.item_type)
		buff = var2728
		var2725 = var2729
	end
	local buff_1 = buffer.create(var2725)
	buffer.copy(buff_1, 0, buff, 0, var2725)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2725 = t_99.new()
	local var2726 = 0
	while var2726 < buffer.len(p99) do
		local _ = nil
		local var2727 = nil
		local var2728, var2729, var2730 = protoModule.readTag(p99, var2726)
		local var2731 = var2728
		var2727 = var2729
		var2726 = var2730
		
		if var2727 == protoModule.wireTypes.varint then
			local _ = nil
			local var2732, var2733 = protoModule.readVarInt(p99, var2726)
			local _ = var2732
			var2726 = var2733
			continue
		end
		if var2727 == protoModule.wireTypes.lengthDelimited then
			if var2731 == 1 then
				local _ = nil
				local var2734, var2735 = protoModule.readBuffer(p99, var2726)
				var2726 = var2735
				var2725.item_id = buffer.tostring(var2734)
			elseif var2731 == 2 then
				local _ = nil
				local var2736, var2737 = protoModule.readBuffer(p99, var2726)
				var2726 = var2737
				var2725.item_type = buffer.tostring(var2736)
			else
				local _ = nil
				local var2738, var2739 = protoModule.readVarInt(p99, var2726)
				var2726 = var2739 + var2738
			end
		elseif var2727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2740, var2741 = protoModule.readFixed32(p99, var2726)
			local _ = var2740
			var2726 = var2741
		elseif var2727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2742, var2743 = protoModule.readFixed64(p99, var2726)
			local _ = var2742
			var2726 = var2743
		else
			error("Unsupported wire type: " .. var3974)
		end
	end
	return var2725
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
	local var2744 = t_99.new()
	
	if self.item_id ~= nil then
		var2744.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2744.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2744.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2744.item_type = self.itemType
	end
	return var2744
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
	local var2744 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2745, var2746 = protoModule.writeTag(buff, var2744, 1, protoModule.wireTypes.lengthDelimited)
		var2745, var3996 = protoModule.writeString(var2745, var2746, self.universe_id)
		buff = var2745
		var2744 = var2746
	end
	local buff_1 = buffer.create(var2744)
	buffer.copy(buff_1, 0, buff, 0, var2744)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref)
	local var2744 = t_100.new()
	local var2745 = 0
	while var2745 < buffer.len(p100) do
		local _ = nil
		local var2746 = nil
		local var2747, var2748, var2749 = protoModule.readTag(p100, var2745)
		local var2750 = var2747
		var2746 = var2748
		var2745 = var2749
		
		if var2746 == protoModule.wireTypes.varint then
			local _ = nil
			local var2751, var2752 = protoModule.readVarInt(p100, var2745)
			local _ = var2751
			var2745 = var2752
			continue
		end
		if var2746 == protoModule.wireTypes.lengthDelimited then
			if var2750 == 1 then
				local _ = nil
				local var2753, var2754 = protoModule.readBuffer(p100, var2745)
				var2745 = var2754
				var2744.universe_id = buffer.tostring(var2753)
			else
				local _ = nil
				local var2755, var2756 = protoModule.readVarInt(p100, var2745)
				var2745 = var2756 + var2755
			end
		elseif var2746 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2757, var2758 = protoModule.readFixed32(p100, var2745)
			local _ = var2757
			var2745 = var2758
		elseif var2746 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2759, var2760 = protoModule.readFixed64(p100, var2745)
			local _ = var2759
			var2745 = var2760
		else
			error("Unsupported wire type: " .. var4000)
		end
	end
	return var2744
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
	local var2761 = t_100.new()
	
	if self.universe_id ~= nil then
		var2761.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2761.universe_id = self.universeId
	end
	return var2761
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
	local var2761 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2762, var2763 = protoModule.writeTag(buff, var2761, 1, protoModule.wireTypes.lengthDelimited)
		var2762, var4020 = protoModule.writeString(var2762, var2763, self.title)
		buff = var2762
		var2761 = var2763
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2764, var2765 = protoModule.writeTag(buff, var2761, 2, protoModule.wireTypes.lengthDelimited)
		var2764, var4022 = protoModule.writeString(var2764, var2765, self.subtitle)
		buff = var2764
		var2761 = var2765
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2766 = v:encode()
			local var2767, var2768 = protoModule.writeTag(buff, var2761, 3, protoModule.wireTypes.lengthDelimited)
			var2767, var4025 = protoModule.writeBuffer(var2767, var2768, var2766, buffer.len(var2766))
			buff = var2767
			var2761 = var2768
		end
	end
	local buff_1 = buffer.create(var2761)
	buffer.copy(buff_1, 0, buff, 0, var2761)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2769 = t_101.new()
	local var2770 = 0
	while var2770 < buffer.len(p101) do
		local _ = nil
		local var2771 = nil
		local var2772, var2773, var2774 = protoModule.readTag(p101, var2770)
		local var2775 = var2772
		var2771 = var2773
		var2770 = var2774
		
		if var2771 == protoModule.wireTypes.varint then
			local _ = nil
			local var2776, var2777 = protoModule.readVarInt(p101, var2770)
			local _ = var2776
			var2770 = var2777
			continue
		end
		if var2771 == protoModule.wireTypes.lengthDelimited then
			if var2775 == 1 then
				local _ = nil
				local var2778, var2779 = protoModule.readBuffer(p101, var2770)
				var2770 = var2779
				var2769.title = buffer.tostring(var2778)
			elseif var2775 == 2 then
				local _ = nil
				local var2780, var2781 = protoModule.readBuffer(p101, var2770)
				var2770 = var2781
				var2769.subtitle = buffer.tostring(var2780)
			elseif var2775 == 3 then
				local _ = nil
				local var2782, var2783 = protoModule.readBuffer(p101, var2770)
				var2770 = var2783
				table.insert(var2769.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2782))
			else
				local _ = nil
				local var2784, var2785 = protoModule.readVarInt(p101, var2770)
				var2770 = var2785 + var2784
			end
		elseif var2771 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2786, var2787 = protoModule.readFixed32(p101, var2770)
			local _ = var2786
			var2770 = var2787
		elseif var2771 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2788, var2789 = protoModule.readFixed64(p101, var2770)
			local _ = var2788
			var2770 = var2789
		else
			error("Unsupported wire type: " .. var4029)
		end
	end
	return var2769
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
	local var2790 = t_101.new()
	
	if self.title ~= nil then
		var2790.title = self.title
	end
	if self.subtitle ~= nil then
		var2790.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2790.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2790.moment_items = t_1
	end
	return var2790
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
	local var2791 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2792, var2793 = protoModule.writeTag(buff, var2791, 1, protoModule.wireTypes.lengthDelimited)
		var2792, var4056 = protoModule.writeString(var2792, var2793, self.moment_id)
		buff = var2792
		var2791 = var2793
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2794, var2795 = protoModule.writeTag(buff, var2791, 2, protoModule.wireTypes.lengthDelimited)
		var2794, var4058 = protoModule.writeString(var2794, var2795, self.video_asset_id)
		buff = var2794
		var2791 = var2795
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2796, var2797 = protoModule.writeTag(buff, var2791, 3, protoModule.wireTypes.lengthDelimited)
		var2796, var4060 = protoModule.writeString(var2796, var2797, self.target_universe_id)
		buff = var2796
		var2791 = var2797
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2798, var2799 = protoModule.writeTag(buff, var2791, 4, protoModule.wireTypes.lengthDelimited)
		var2798, var4062 = protoModule.writeString(var2798, var2799, self.target_place_id)
		buff = var2798
		var2791 = var2799
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2800, var2801 = protoModule.writeTag(buff, var2791, 5, protoModule.wireTypes.lengthDelimited)
		var2800, var4064 = protoModule.writeString(var2800, var2801, self.feed_item_id)
		buff = var2800
		var2791 = var2801
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2802, var2803 = protoModule.writeTag(buff, var2791, 6, protoModule.wireTypes.lengthDelimited)
		var2802, var4066 = protoModule.writeString(var2802, var2803, self.capture_universe_id)
		buff = var2802
		var2791 = var2803
	end
	local buff_1 = buffer.create(var2791)
	buffer.copy(buff_1, 0, buff, 0, var2791)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2791 = t_102.new()
	local var2792 = 0
	while var2792 < buffer.len(p102) do
		local _ = nil
		local var2793 = nil
		local var2794, var2795, var2796 = protoModule.readTag(p102, var2792)
		local var2797 = var2794
		var2793 = var2795
		var2792 = var2796
		
		if var2793 == protoModule.wireTypes.varint then
			local _ = nil
			local var2798, var2799 = protoModule.readVarInt(p102, var2792)
			local _ = var2798
			var2792 = var2799
			continue
		end
		if var2793 == protoModule.wireTypes.lengthDelimited then
			if var2797 == 1 then
				local _ = nil
				local var2800, var2801 = protoModule.readBuffer(p102, var2792)
				var2792 = var2801
				var2791.moment_id = buffer.tostring(var2800)
			elseif var2797 == 2 then
				local _ = nil
				local var2802, var2803 = protoModule.readBuffer(p102, var2792)
				var2792 = var2803
				var2791.video_asset_id = buffer.tostring(var2802)
			elseif var2797 == 3 then
				local _ = nil
				local var2804, var2805 = protoModule.readBuffer(p102, var2792)
				var2792 = var2805
				var2791.target_universe_id = buffer.tostring(var2804)
			elseif var2797 == 4 then
				local _ = nil
				local var2806, var2807 = protoModule.readBuffer(p102, var2792)
				var2792 = var2807
				var2791.target_place_id = buffer.tostring(var2806)
			elseif var2797 == 5 then
				local _ = nil
				local var2808, var2809 = protoModule.readBuffer(p102, var2792)
				var2792 = var2809
				var2791.feed_item_id = buffer.tostring(var2808)
			elseif var2797 == 6 then
				local _ = nil
				local var2810, var2811 = protoModule.readBuffer(p102, var2792)
				var2792 = var2811
				var2791.capture_universe_id = buffer.tostring(var2810)
			else
				local _ = nil
				local var2812, var2813 = protoModule.readVarInt(p102, var2792)
				var2792 = var2813 + var2812
			end
		elseif var2793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2814, var2815 = protoModule.readFixed32(p102, var2792)
			local _ = var2814
			var2792 = var2815
		elseif var2793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2816, var2817 = protoModule.readFixed64(p102, var2792)
			local _ = var2816
			var2792 = var2817
		else
			error("Unsupported wire type: " .. var4070)
		end
	end
	return var2791
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
	local var2818 = t_102.new()
	
	if self.moment_id ~= nil then
		var2818.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var2818.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var2818.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2818.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var2818.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var2818.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var2818.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var2818.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var2818.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var2818.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var2818.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var2818.capture_universe_id = self.captureUniverseId
	end
	return var2818
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
	local var2818 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2819, var2820 = protoModule.writeTag(buff, var2818, 1, protoModule.wireTypes.lengthDelimited)
		var2819, var4100 = protoModule.writeString(var2819, var2820, self.title)
		buff = var2819
		var2818 = var2820
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2821, var2822 = protoModule.writeTag(buff, var2818, 2, protoModule.wireTypes.lengthDelimited)
		var2821, var4102 = protoModule.writeString(var2821, var2822, self.subtitle)
		buff = var2821
		var2818 = var2822
	end
	local buff_1 = buffer.create(var2818)
	buffer.copy(buff_1, 0, buff, 0, var2818)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref)
	local var2818 = t_103.new()
	local var2819 = 0
	while var2819 < buffer.len(p103) do
		local _ = nil
		local var2820 = nil
		local var2821, var2822, var2823 = protoModule.readTag(p103, var2819)
		local var2824 = var2821
		var2820 = var2822
		var2819 = var2823
		
		if var2820 == protoModule.wireTypes.varint then
			local _ = nil
			local var2825, var2826 = protoModule.readVarInt(p103, var2819)
			local _ = var2825
			var2819 = var2826
			continue
		end
		if var2820 == protoModule.wireTypes.lengthDelimited then
			if var2824 == 1 then
				local _ = nil
				local var2827, var2828 = protoModule.readBuffer(p103, var2819)
				var2819 = var2828
				var2818.title = buffer.tostring(var2827)
			elseif var2824 == 2 then
				local _ = nil
				local var2829, var2830 = protoModule.readBuffer(p103, var2819)
				var2819 = var2830
				var2818.subtitle = buffer.tostring(var2829)
			else
				local _ = nil
				local var2831, var2832 = protoModule.readVarInt(p103, var2819)
				var2819 = var2832 + var2831
			end
		elseif var2820 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2833, var2834 = protoModule.readFixed32(p103, var2819)
			local _ = var2833
			var2819 = var2834
		elseif var2820 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2835, var2836 = protoModule.readFixed64(p103, var2819)
			local _ = var2835
			var2819 = var2836
		else
			error("Unsupported wire type: " .. var4106)
		end
	end
	return var2818
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
	local var2837 = t_103.new()
	
	if self.title ~= nil then
		var2837.title = self.title
	end
	if self.subtitle ~= nil then
		var2837.subtitle = self.subtitle
	end
	return var2837
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
	local var2837 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var2838, var2839 = protoModule.writeTag(buff, var2837, 1, protoModule.wireTypes.lengthDelimited)
		var2838, var4128 = protoModule.writeString(var2838, var2839, self.primary_cta_button_text)
		buff = var2838
		var2837 = var2839
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var2840, var2841 = protoModule.writeTag(buff, var2837, 2, protoModule.wireTypes.lengthDelimited)
		var2840, var4130 = protoModule.writeString(var2840, var2841, self.secondary_cta_button_text)
		buff = var2840
		var2837 = var2841
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var2842, var2843 = protoModule.writeTag(buff, var2837, 3, protoModule.wireTypes.lengthDelimited)
		var2842, var4132 = protoModule.writeString(var2842, var2843, self.primary_cta_type)
		buff = var2842
		var2837 = var2843
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var2844, var2845 = protoModule.writeTag(buff, var2837, 4, protoModule.wireTypes.lengthDelimited)
		var2844, var4134 = protoModule.writeString(var2844, var2845, self.secondary_cta_type)
		buff = var2844
		var2837 = var2845
	end
	local buff_1 = buffer.create(var2837)
	buffer.copy(buff_1, 0, buff, 0, var2837)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2837 = t_104.new()
	local var2838 = 0
	while var2838 < buffer.len(p104) do
		local _ = nil
		local var2839 = nil
		local var2840, var2841, var2842 = protoModule.readTag(p104, var2838)
		local var2843 = var2840
		var2839 = var2841
		var2838 = var2842
		
		if var2839 == protoModule.wireTypes.varint then
			local _ = nil
			local var2844, var2845 = protoModule.readVarInt(p104, var2838)
			local _ = var2844
			var2838 = var2845
			continue
		end
		if var2839 == protoModule.wireTypes.lengthDelimited then
			if var2843 == 1 then
				local _ = nil
				local var2846, var2847 = protoModule.readBuffer(p104, var2838)
				var2838 = var2847
				var2837.primary_cta_button_text = buffer.tostring(var2846)
			elseif var2843 == 2 then
				local _ = nil
				local var2848, var2849 = protoModule.readBuffer(p104, var2838)
				var2838 = var2849
				var2837.secondary_cta_button_text = buffer.tostring(var2848)
			elseif var2843 == 3 then
				local _ = nil
				local var2850, var2851 = protoModule.readBuffer(p104, var2838)
				var2838 = var2851
				var2837.primary_cta_type = buffer.tostring(var2850)
			elseif var2843 == 4 then
				local _ = nil
				local var2852, var2853 = protoModule.readBuffer(p104, var2838)
				var2838 = var2853
				var2837.secondary_cta_type = buffer.tostring(var2852)
			else
				local _ = nil
				local var2854, var2855 = protoModule.readVarInt(p104, var2838)
				var2838 = var2855 + var2854
			end
		elseif var2839 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2856, var2857 = protoModule.readFixed32(p104, var2838)
			local _ = var2856
			var2838 = var2857
		elseif var2839 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2858, var2859 = protoModule.readFixed64(p104, var2838)
			local _ = var2858
			var2838 = var2859
		else
			error("Unsupported wire type: " .. var4138)
		end
	end
	return var2837
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
	local var2860 = t_104.new()
	
	if self.primary_cta_button_text ~= nil then
		var2860.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var2860.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var2860.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var2860.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var2860.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var2860.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var2860.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var2860.secondary_cta_type = self.secondaryCtaType
	end
	return var2860
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
	local var2860 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2861, var2862 = protoModule.writeTag(buff, var2860, 1, protoModule.wireTypes.lengthDelimited)
		var2861, var4164 = protoModule.writeString(var2861, var2862, self.image_asset_id)
		buff = var2861
		var2860 = var2862
	end
	local buff_1 = buffer.create(var2860)
	buffer.copy(buff_1, 0, buff, 0, var2860)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2860 = t_105.new()
	local var2861 = 0
	while var2861 < buffer.len(p105) do
		local _ = nil
		local var2862 = nil
		local var2863, var2864, var2865 = protoModule.readTag(p105, var2861)
		local var2866 = var2863
		var2862 = var2864
		var2861 = var2865
		
		if var2862 == protoModule.wireTypes.varint then
			local _ = nil
			local var2867, var2868 = protoModule.readVarInt(p105, var2861)
			local _ = var2867
			var2861 = var2868
			continue
		end
		if var2862 == protoModule.wireTypes.lengthDelimited then
			if var2866 == 1 then
				local _ = nil
				local var2869, var2870 = protoModule.readBuffer(p105, var2861)
				var2861 = var2870
				var2860.image_asset_id = buffer.tostring(var2869)
			else
				local _ = nil
				local var2871, var2872 = protoModule.readVarInt(p105, var2861)
				var2861 = var2872 + var2871
			end
		elseif var2862 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2873, var2874 = protoModule.readFixed32(p105, var2861)
			local _ = var2873
			var2861 = var2874
		elseif var2862 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2875, var2876 = protoModule.readFixed64(p105, var2861)
			local _ = var2875
			var2861 = var2876
		else
			error("Unsupported wire type: " .. var4168)
		end
	end
	return var2860
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
	local var2877 = t_105.new()
	
	if self.image_asset_id ~= nil then
		var2877.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var2877.image_asset_id = self.imageAssetId
	end
	return var2877
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
	local var2877 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2878, var2879 = protoModule.writeTag(buff, var2877, 1, protoModule.wireTypes.lengthDelimited)
		var2878, var4188 = protoModule.writeString(var2878, var2879, self.video_asset_id)
		buff = var2878
		var2877 = var2879
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var2880, var2881 = protoModule.writeTag(buff, var2877, 2, protoModule.wireTypes.lengthDelimited)
		var2880, var4190 = protoModule.writeString(var2880, var2881, self.loading_image_asset_id)
		buff = var2880
		var2877 = var2881
	end
	local buff_1 = buffer.create(var2877)
	buffer.copy(buff_1, 0, buff, 0, var2877)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var2877 = t_106.new()
	local var2878 = 0
	while var2878 < buffer.len(p106) do
		local _ = nil
		local var2879 = nil
		local var2880, var2881, var2882 = protoModule.readTag(p106, var2878)
		local var2883 = var2880
		var2879 = var2881
		var2878 = var2882
		
		if var2879 == protoModule.wireTypes.varint then
			local _ = nil
			local var2884, var2885 = protoModule.readVarInt(p106, var2878)
			local _ = var2884
			var2878 = var2885
			continue
		end
		if var2879 == protoModule.wireTypes.lengthDelimited then
			if var2883 == 1 then
				local _ = nil
				local var2886, var2887 = protoModule.readBuffer(p106, var2878)
				var2878 = var2887
				var2877.video_asset_id = buffer.tostring(var2886)
			elseif var2883 == 2 then
				local _ = nil
				local var2888, var2889 = protoModule.readBuffer(p106, var2878)
				var2878 = var2889
				var2877.loading_image_asset_id = buffer.tostring(var2888)
			else
				local _ = nil
				local var2890, var2891 = protoModule.readVarInt(p106, var2878)
				var2878 = var2891 + var2890
			end
		elseif var2879 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2892, var2893 = protoModule.readFixed32(p106, var2878)
			local _ = var2892
			var2878 = var2893
		elseif var2879 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2894, var2895 = protoModule.readFixed64(p106, var2878)
			local _ = var2894
			var2878 = var2895
		else
			error("Unsupported wire type: " .. var4194)
		end
	end
	return var2877
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
	local var2896 = t_106.new()
	
	if self.video_asset_id ~= nil then
		var2896.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2896.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var2896.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var2896.loading_image_asset_id = self.loadingImageAssetId
	end
	return var2896
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
	local var2896 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var2897, var2898 = protoModule.writeTag(buff, var2896, 1, protoModule.wireTypes.lengthDelimited)
		var2897, var4216 = protoModule.writeString(var2897, var2898, self.text)
		buff = var2897
		var2896 = var2898
	end
	if self.is_rendered_text then
		local var2899, var2900 = protoModule.writeTag(buff, var2896, 2, protoModule.wireTypes.varint)
		var2899, var4218 = protoModule.writeVarInt(var2899, var2900, if self.is_rendered_text then 1 else 0)
		buff = var2899
		var2896 = var2900
	end
	local buff_1 = buffer.create(var2896)
	buffer.copy(buff_1, 0, buff, 0, var2896)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2896 = t_107.new()
	local var2897 = 0
	while var2897 < buffer.len(p107) do
		local _ = nil
		local var2898 = nil
		local var2899, var2900, var2901 = protoModule.readTag(p107, var2897)
		local var2902 = var2899
		var2898 = var2900
		var2897 = var2901
		
		if var2898 == protoModule.wireTypes.varint then
			if var2902 == 2 then
				local _ = nil
				local var2903, var2904 = protoModule.readVarInt(p107, var2897)
				var2897 = var2904
				var2896.is_rendered_text = var2903 ~= 0
			else
				local _ = nil
				local var2905, var2906 = protoModule.readVarInt(p107, var2897)
				local _ = var2905
				var2897 = var2906
			end
		end
		if var2898 == protoModule.wireTypes.lengthDelimited then
			if var2902 == 1 then
				local _ = nil
				local var2907, var2908 = protoModule.readBuffer(p107, var2897)
				var2897 = var2908
				var2896.text = buffer.tostring(var2907)
			else
				local _ = nil
				local var2909, var2910 = protoModule.readVarInt(p107, var2897)
				var2897 = var2910 + var2909
			end
		elseif var2898 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2911, var2912 = protoModule.readFixed32(p107, var2897)
			local _ = var2911
			var2897 = var2912
		elseif var2898 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2913, var2914 = protoModule.readFixed64(p107, var2897)
			local _ = var2913
			var2897 = var2914
		else
			error("Unsupported wire type: " .. var4222)
		end
	end
	return var2896
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
	local var2915 = t_107.new()
	
	if self.text ~= nil then
		var2915.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var2915.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var2915.is_rendered_text = self.isRenderedText
	end
	return var2915
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
	local var2915 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2916, var2917 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2916, var4244 = protoModule.writeString(var2916, var2917, i)
			local var2918 = v:encode()
			var2917, var4246 = protoModule.writeTag(var2916, var2917, 2, protoModule.wireTypes.lengthDelimited)
			var2917, var4246 = protoModule.writeBuffer(var2917, var4246, var2918, buffer.len(var2918))
			local var2919 = var2917
			local var2920 = var4246
			local var2921, var2922 = protoModule.writeTag(buff, var2915, 1, protoModule.wireTypes.lengthDelimited)
			var2921, var4250 = protoModule.writeBuffer(var2921, var2922, var2919, var2920)
			buff = var2921
			var2915 = var2922
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2923, var2924 = protoModule.writeTag(buff, var2915, 2, protoModule.wireTypes.lengthDelimited)
			var2923, var4252 = protoModule.writeString(var2923, var2924, v)
			buff = var2923
			var2915 = var2924
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var2925, var2926 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2925, var4254 = protoModule.writeString(var2925, var2926, i)
			local var2927 = v:encode()
			var2926, var4256 = protoModule.writeTag(var2925, var2926, 2, protoModule.wireTypes.lengthDelimited)
			var2926, var4256 = protoModule.writeBuffer(var2926, var4256, var2927, buffer.len(var2927))
			local var2928 = var2926
			local var2929 = var4256
			local var2930, var2931 = protoModule.writeTag(buff, var2915, 3, protoModule.wireTypes.lengthDelimited)
			var2930, var4260 = protoModule.writeBuffer(var2930, var2931, var2928, var2929)
			buff = var2930
			var2915 = var2931
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2932, var2933 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2932, var4262 = protoModule.writeString(var2932, var2933, i)
			local var2934 = v:encode()
			var2933, var4264 = protoModule.writeTag(var2932, var2933, 2, protoModule.wireTypes.lengthDelimited)
			var2933, var4264 = protoModule.writeBuffer(var2933, var4264, var2934, buffer.len(var2934))
			local var2935 = var2933
			local var2936 = var4264
			local var2937, var2938 = protoModule.writeTag(buff, var2915, 4, protoModule.wireTypes.lengthDelimited)
			var2937, var4268 = protoModule.writeBuffer(var2937, var2938, var2935, var2936)
			buff = var2937
			var2915 = var2938
		end
	end
	local buff_1 = buffer.create(var2915)
	buffer.copy(buff_1, 0, buff, 0, var2915)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var2939 = t_108.new()
	local var2940 = 0
	while var2940 < buffer.len(p108) do
		local _ = nil
		local var2941 = nil
		local var2942, var2943, var2944 = protoModule.readTag(p108, var2940)
		local var2945 = var2942
		var2941 = var2943
		var2940 = var2944
		
		if var2941 == protoModule.wireTypes.varint then
			local _ = nil
			local var2946, var2947 = protoModule.readVarInt(p108, var2940)
			local _ = var2946
			var2940 = var2947
			continue
		end
		if var2941 == protoModule.wireTypes.lengthDelimited then
			if var2945 == 1 then
				local _ = nil
				local var2948, var2949 = protoModule.readBuffer(p108, var2940)
				var2940 = var2949
				var2948 = t.VerticalFeedInputData_EntryMapEntry.decode(var2948)
				var2939.entry_map[var2948.key or ""] = var2948.value or t.FeedEntry.new()
			elseif var2945 == 2 then
				local _ = nil
				local var2950, var2951 = protoModule.readBuffer(p108, var2940)
				var2940 = var2951
				table.insert(var2939.entry_order, buffer.tostring(var2950))
			elseif var2945 == 3 then
				local _ = nil
				local var2952, var2953 = protoModule.readBuffer(p108, var2940)
				var2940 = var2953
				var2952 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var2952)
				var2939.entry_order_map[var2952.key or ""] = var2952.value or t.EntryOrder.new()
			elseif var2945 == 4 then
				local _ = nil
				local var2954, var2955 = protoModule.readBuffer(p108, var2940)
				var2940 = var2955
				var2954 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var2954)
				var2939.content_pools[var2954.key or ""] = var2954.value or t.ContentPool.new()
			else
				local _ = nil
				local var2956, var2957 = protoModule.readVarInt(p108, var2940)
				var2940 = var2957 + var2956
			end
		elseif var2941 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2958, var2959 = protoModule.readFixed32(p108, var2940)
			local _ = var2958
			var2940 = var2959
		elseif var2941 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2960, var2961 = protoModule.readFixed64(p108, var2940)
			local _ = var2960
			var2940 = var2961
		else
			error("Unsupported wire type: " .. var4272)
		end
	end
	return var2939
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
	local var2962 = t_108.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2962.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2962.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2962.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2962.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var2962.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var2962.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2962.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2962.content_pools = t_1
	end
	return var2962
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
	local var2963 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2964, var2965 = protoModule.writeTag(buff, var2963, 1, protoModule.wireTypes.lengthDelimited)
		var2964, var4310 = protoModule.writeString(var2964, var2965, self.key)
		buff = var2964
		var2963 = var2965
	end
	if self.value ~= nil then
		local var2966 = self.value:encode()
		local var2967, var2968 = protoModule.writeTag(buff, var2963, 2, protoModule.wireTypes.lengthDelimited)
		var2967, var4313 = protoModule.writeBuffer(var2967, var2968, var2966, buffer.len(var2966))
		buff = var2967
		var2963 = var2968
	end
	local buff_1 = buffer.create(var2963)
	buffer.copy(buff_1, 0, buff, 0, var2963)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
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
			local _ = nil
			local var2970, var2971 = protoModule.readVarInt(p109, var2964)
			local _ = var2970
			var2964 = var2971
			continue
		end
		if var2965 == protoModule.wireTypes.lengthDelimited then
			if var2969 == 1 then
				local _ = nil
				local var2972, var2973 = protoModule.readBuffer(p109, var2964)
				var2964 = var2973
				var2963.key = buffer.tostring(var2972)
			elseif var2969 == 2 then
				local _ = nil
				local var2974, var2975 = protoModule.readBuffer(p109, var2964)
				var2964 = var2975
				var2963.value = t.FeedEntry.decode(var2974)
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
			error("Unsupported wire type: " .. var4317)
		end
	end
	return var2963
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
	local var2982 = t_109.new()
	
	if self.key ~= nil then
		var2982.key = self.key
	end
	if self.value ~= nil then
		var2982.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2982
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
	local var2982 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2983, var2984 = protoModule.writeTag(buff, var2982, 1, protoModule.wireTypes.lengthDelimited)
		var2983, var4339 = protoModule.writeString(var2983, var2984, self.key)
		buff = var2983
		var2982 = var2984
	end
	if self.value ~= nil then
		local var2985 = self.value:encode()
		local var2986, var2987 = protoModule.writeTag(buff, var2982, 2, protoModule.wireTypes.lengthDelimited)
		var2986, var4342 = protoModule.writeBuffer(var2986, var2987, var2985, buffer.len(var2985))
		buff = var2986
		var2982 = var2987
	end
	local buff_1 = buffer.create(var2982)
	buffer.copy(buff_1, 0, buff, 0, var2982)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var2982 = t_110.new()
	local var2983 = 0
	while var2983 < buffer.len(p110) do
		local _ = nil
		local var2984 = nil
		local var2985, var2986, var2987 = protoModule.readTag(p110, var2983)
		local var2988 = var2985
		var2984 = var2986
		var2983 = var2987
		
		if var2984 == protoModule.wireTypes.varint then
			local _ = nil
			local var2989, var2990 = protoModule.readVarInt(p110, var2983)
			local _ = var2989
			var2983 = var2990
			continue
		end
		if var2984 == protoModule.wireTypes.lengthDelimited then
			if var2988 == 1 then
				local _ = nil
				local var2991, var2992 = protoModule.readBuffer(p110, var2983)
				var2983 = var2992
				var2982.key = buffer.tostring(var2991)
			elseif var2988 == 2 then
				local _ = nil
				local var2993, var2994 = protoModule.readBuffer(p110, var2983)
				var2983 = var2994
				var2982.value = t.EntryOrder.decode(var2993)
			else
				local _ = nil
				local var2995, var2996 = protoModule.readVarInt(p110, var2983)
				var2983 = var2996 + var2995
			end
		elseif var2984 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2997, var2998 = protoModule.readFixed32(p110, var2983)
			local _ = var2997
			var2983 = var2998
		elseif var2984 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2999, var3000 = protoModule.readFixed64(p110, var2983)
			local _ = var2999
			var2983 = var3000
		else
			error("Unsupported wire type: " .. var4346)
		end
	end
	return var2982
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
	local var3001 = t_110.new()
	
	if self.key ~= nil then
		var3001.key = self.key
	end
	if self.value ~= nil then
		var3001.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3001
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
	local var3001 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3002, var3003 = protoModule.writeTag(buff, var3001, 1, protoModule.wireTypes.lengthDelimited)
		var3002, var4368 = protoModule.writeString(var3002, var3003, self.key)
		buff = var3002
		var3001 = var3003
	end
	if self.value ~= nil then
		local var3004 = self.value:encode()
		local var3005, var3006 = protoModule.writeTag(buff, var3001, 2, protoModule.wireTypes.lengthDelimited)
		var3005, var4371 = protoModule.writeBuffer(var3005, var3006, var3004, buffer.len(var3004))
		buff = var3005
		var3001 = var3006
	end
	local buff_1 = buffer.create(var3001)
	buffer.copy(buff_1, 0, buff, 0, var3001)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var3001 = t_111.new()
	local var3002 = 0
	while var3002 < buffer.len(p111) do
		local _ = nil
		local var3003 = nil
		local var3004, var3005, var3006 = protoModule.readTag(p111, var3002)
		local var3007 = var3004
		var3003 = var3005
		var3002 = var3006
		
		if var3003 == protoModule.wireTypes.varint then
			local _ = nil
			local var3008, var3009 = protoModule.readVarInt(p111, var3002)
			local _ = var3008
			var3002 = var3009
			continue
		end
		if var3003 == protoModule.wireTypes.lengthDelimited then
			if var3007 == 1 then
				local _ = nil
				local var3010, var3011 = protoModule.readBuffer(p111, var3002)
				var3002 = var3011
				var3001.key = buffer.tostring(var3010)
			elseif var3007 == 2 then
				local _ = nil
				local var3012, var3013 = protoModule.readBuffer(p111, var3002)
				var3002 = var3013
				var3001.value = t.ContentPool.decode(var3012)
			else
				local _ = nil
				local var3014, var3015 = protoModule.readVarInt(p111, var3002)
				var3002 = var3015 + var3014
			end
		elseif var3003 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3016, var3017 = protoModule.readFixed32(p111, var3002)
			local _ = var3016
			var3002 = var3017
		elseif var3003 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3018, var3019 = protoModule.readFixed64(p111, var3002)
			local _ = var3018
			var3002 = var3019
		else
			error("Unsupported wire type: " .. var4375)
		end
	end
	return var3001
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
	local var3020 = t_111.new()
	
	if self.key ~= nil then
		var3020.key = self.key
	end
	if self.value ~= nil then
		var3020.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3020
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
	local var3020 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3021 = self.foreground_header_entry:encode()
		local var3022, var3023 = protoModule.writeTag(buff, var3020, 1, protoModule.wireTypes.lengthDelimited)
		var3022, var4398 = protoModule.writeBuffer(var3022, var3023, var3021, buffer.len(var3021))
		buff = var3022
		var3020 = var3023
	end
	if self.background_header_entry ~= nil then
		local var3024 = self.background_header_entry:encode()
		local var3025, var3026 = protoModule.writeTag(buff, var3020, 2, protoModule.wireTypes.lengthDelimited)
		var3025, var4401 = protoModule.writeBuffer(var3025, var3026, var3024, buffer.len(var3024))
		buff = var3025
		var3020 = var3026
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3027, var3028 = protoModule.writeTag(buff, var3020, 3, protoModule.wireTypes.lengthDelimited)
		var3027, var4403 = protoModule.writeString(var3027, var3028, self.layout_variant)
		buff = var3027
		var3020 = var3028
	end
	local buff_1 = buffer.create(var3020)
	buffer.copy(buff_1, 0, buff, 0, var3020)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var3020 = t_112.new()
	local var3021 = 0
	while var3021 < buffer.len(p112) do
		local _ = nil
		local var3022 = nil
		local var3023, var3024, var3025 = protoModule.readTag(p112, var3021)
		local var3026 = var3023
		var3022 = var3024
		var3021 = var3025
		
		if var3022 == protoModule.wireTypes.varint then
			local _ = nil
			local var3027, var3028 = protoModule.readVarInt(p112, var3021)
			local _ = var3027
			var3021 = var3028
			continue
		end
		if var3022 == protoModule.wireTypes.lengthDelimited then
			if var3026 == 1 then
				local _ = nil
				local var3029, var3030 = protoModule.readBuffer(p112, var3021)
				var3021 = var3030
				var3020.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3029)
			elseif var3026 == 2 then
				local _ = nil
				local var3031, var3032 = protoModule.readBuffer(p112, var3021)
				var3021 = var3032
				var3020.background_header_entry = t.BackgroundHeaderEntry.decode(var3031)
			elseif var3026 == 3 then
				local _ = nil
				local var3033, var3034 = protoModule.readBuffer(p112, var3021)
				var3021 = var3034
				var3020.layout_variant = buffer.tostring(var3033)
			else
				local _ = nil
				local var3035, var3036 = protoModule.readVarInt(p112, var3021)
				var3021 = var3036 + var3035
			end
		elseif var3022 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3037, var3038 = protoModule.readFixed32(p112, var3021)
			local _ = var3037
			var3021 = var3038
		elseif var3022 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3039, var3040 = protoModule.readFixed64(p112, var3021)
			local _ = var3039
			var3021 = var3040
		else
			error("Unsupported wire type: " .. var4407)
		end
	end
	return var3020
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
	local var3041 = t_112.new()
	
	if self.foreground_header_entry ~= nil then
		var3041.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3041.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3041.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3041.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3041.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3041.layout_variant = self.layoutVariant
	end
	return var3041
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
	local var3041 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3042, var3043 = protoModule.writeTag(buff, var3041, 1, protoModule.wireTypes.lengthDelimited)
		var3042, var4431 = protoModule.writeString(var3042, var3043, self.cta_button_text)
		buff = var3042
		var3041 = var3043
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3044, var3045 = protoModule.writeTag(buff, var3041, 2, protoModule.wireTypes.lengthDelimited)
		var3044, var4433 = protoModule.writeString(var3044, var3045, self.cta_type)
		buff = var3044
		var3041 = var3045
	end
	local buff_1 = buffer.create(var3041)
	buffer.copy(buff_1, 0, buff, 0, var3041)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref)
	local var3041 = t_113.new()
	local var3042 = 0
	while var3042 < buffer.len(p113) do
		local _ = nil
		local var3043 = nil
		local var3044, var3045, var3046 = protoModule.readTag(p113, var3042)
		local var3047 = var3044
		var3043 = var3045
		var3042 = var3046
		
		if var3043 == protoModule.wireTypes.varint then
			local _ = nil
			local var3048, var3049 = protoModule.readVarInt(p113, var3042)
			local _ = var3048
			var3042 = var3049
			continue
		end
		if var3043 == protoModule.wireTypes.lengthDelimited then
			if var3047 == 1 then
				local _ = nil
				local var3050, var3051 = protoModule.readBuffer(p113, var3042)
				var3042 = var3051
				var3041.cta_button_text = buffer.tostring(var3050)
			elseif var3047 == 2 then
				local _ = nil
				local var3052, var3053 = protoModule.readBuffer(p113, var3042)
				var3042 = var3053
				var3041.cta_type = buffer.tostring(var3052)
			else
				local _ = nil
				local var3054, var3055 = protoModule.readVarInt(p113, var3042)
				var3042 = var3055 + var3054
			end
		elseif var3043 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3056, var3057 = protoModule.readFixed32(p113, var3042)
			local _ = var3056
			var3042 = var3057
		elseif var3043 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3058, var3059 = protoModule.readFixed64(p113, var3042)
			local _ = var3058
			var3042 = var3059
		else
			error("Unsupported wire type: " .. var4437)
		end
	end
	return var3041
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
	local var3060 = t_113.new()
	
	if self.cta_button_text ~= nil then
		var3060.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3060.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3060.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3060.cta_type = self.ctaType
	end
	return var3060
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
	local var3060 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3061, var3062 = protoModule.writeTag(buff, var3060, 1, protoModule.wireTypes.lengthDelimited)
		var3061, var4459 = protoModule.writeString(var3061, var3062, self.title)
		buff = var3061
		var3060 = var3062
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3063, var3064 = protoModule.writeTag(buff, var3060, 2, protoModule.wireTypes.lengthDelimited)
		var3063, var4461 = protoModule.writeString(var3063, var3064, self.cta_button_text)
		buff = var3063
		var3060 = var3064
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3065, var3066 = protoModule.writeTag(buff, var3060, 3, protoModule.wireTypes.lengthDelimited)
		var3065, var4463 = protoModule.writeString(var3065, var3066, self.image_asset_id)
		buff = var3065
		var3060 = var3066
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3067, var3068 = protoModule.writeTag(buff, var3060, 4, protoModule.wireTypes.lengthDelimited)
		var3067, var4465 = protoModule.writeString(var3067, var3068, self.cta_type)
		buff = var3067
		var3060 = var3068
	end
	local buff_1 = buffer.create(var3060)
	buffer.copy(buff_1, 0, buff, 0, var3060)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref)
	local var3060 = t_114.new()
	local var3061 = 0
	while var3061 < buffer.len(p114) do
		local _ = nil
		local var3062 = nil
		local var3063, var3064, var3065 = protoModule.readTag(p114, var3061)
		local var3066 = var3063
		var3062 = var3064
		var3061 = var3065
		
		if var3062 == protoModule.wireTypes.varint then
			local _ = nil
			local var3067, var3068 = protoModule.readVarInt(p114, var3061)
			local _ = var3067
			var3061 = var3068
			continue
		end
		if var3062 == protoModule.wireTypes.lengthDelimited then
			if var3066 == 1 then
				local _ = nil
				local var3069, var3070 = protoModule.readBuffer(p114, var3061)
				var3061 = var3070
				var3060.title = buffer.tostring(var3069)
			elseif var3066 == 2 then
				local _ = nil
				local var3071, var3072 = protoModule.readBuffer(p114, var3061)
				var3061 = var3072
				var3060.cta_button_text = buffer.tostring(var3071)
			elseif var3066 == 3 then
				local _ = nil
				local var3073, var3074 = protoModule.readBuffer(p114, var3061)
				var3061 = var3074
				var3060.image_asset_id = buffer.tostring(var3073)
			elseif var3066 == 4 then
				local _ = nil
				local var3075, var3076 = protoModule.readBuffer(p114, var3061)
				var3061 = var3076
				var3060.cta_type = buffer.tostring(var3075)
			else
				local _ = nil
				local var3077, var3078 = protoModule.readVarInt(p114, var3061)
				var3061 = var3078 + var3077
			end
		elseif var3062 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3079, var3080 = protoModule.readFixed32(p114, var3061)
			local _ = var3079
			var3061 = var3080
		elseif var3062 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3081, var3082 = protoModule.readFixed64(p114, var3061)
			local _ = var3081
			var3061 = var3082
		else
			error("Unsupported wire type: " .. var4469)
		end
	end
	return var3060
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
	local var3083 = t_114.new()
	
	if self.title ~= nil then
		var3083.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3083.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3083.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3083.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3083.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3083.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3083.cta_type = self.ctaType
	end
	return var3083
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
		playable_text = if p115 == nil or p115.playable_text == nil then nil else p115.playable_text,
		collection_id = if p115 == nil or p115.collection_id == nil then nil else p115.collection_id,
		campaign_id = if p115 == nil or p115.campaign_id == nil then nil else p115.campaign_id,
		cohort_id = if p115 == nil or p115.cohort_id == nil then nil else p115.cohort_id,
		sort_id = if p115 == nil or p115.sort_id == nil then nil else p115.sort_id,
		hero_unit_id = if p115 == nil or p115.hero_unit_id == nil then nil else p115.hero_unit_id,
		analytics_id = if p115 == nil or p115.analytics_id == nil then nil else p115.analytics_id,
		is_sponsored = if p115 == nil or p115.is_sponsored == nil then nil else p115.is_sponsored
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3083 = 0
	
	if self.universe_id ~= nil then
		local var3084, var3085 = protoModule.writeTag(buff, var3083, 1, protoModule.wireTypes.lengthDelimited)
		var3084, var4495 = protoModule.writeString(var3084, var3085, self.universe_id)
		buff = var3084
		var3083 = var3085
	end
	if self.title ~= nil then
		local var3086, var3087 = protoModule.writeTag(buff, var3083, 2, protoModule.wireTypes.lengthDelimited)
		var3086, var4497 = protoModule.writeString(var3086, var3087, self.title)
		buff = var3086
		var3083 = var3087
	end
	if self.subtitle ~= nil then
		local var3088, var3089 = protoModule.writeTag(buff, var3083, 3, protoModule.wireTypes.lengthDelimited)
		var3088, var4499 = protoModule.writeString(var3088, var3089, self.subtitle)
		buff = var3088
		var3083 = var3089
	end
	if self.badge_text ~= nil then
		local var3090, var3091 = protoModule.writeTag(buff, var3083, 4, protoModule.wireTypes.lengthDelimited)
		var3090, var4501 = protoModule.writeString(var3090, var3091, self.badge_text)
		buff = var3090
		var3083 = var3091
	end
	if self.foreground ~= nil then
		local var3092 = self.foreground:encode()
		local var3093, var3094 = protoModule.writeTag(buff, var3083, 5, protoModule.wireTypes.lengthDelimited)
		var3093, var4504 = protoModule.writeBuffer(var3093, var3094, var3092, buffer.len(var3092))
		buff = var3093
		var3083 = var3094
	end
	if self.background ~= nil then
		local var3095 = self.background:encode()
		local var3096, var3097 = protoModule.writeTag(buff, var3083, 6, protoModule.wireTypes.lengthDelimited)
		var3096, var4507 = protoModule.writeBuffer(var3096, var3097, var3095, buffer.len(var3095))
		buff = var3096
		var3083 = var3097
	end
	if self.title_image ~= nil then
		local var3098 = self.title_image:encode()
		local var3099, var3100 = protoModule.writeTag(buff, var3083, 7, protoModule.wireTypes.lengthDelimited)
		var3099, var4510 = protoModule.writeBuffer(var3099, var3100, var3098, buffer.len(var3098))
		buff = var3099
		var3083 = var3100
	end
	if self.asset_title ~= nil then
		local var3101, var3102 = protoModule.writeTag(buff, var3083, 8, protoModule.wireTypes.lengthDelimited)
		var3101, var4512 = protoModule.writeString(var3101, var3102, self.asset_title)
		buff = var3101
		var3083 = var3102
	end
	if self.asset_subtitle ~= nil then
		local var3103, var3104 = protoModule.writeTag(buff, var3083, 9, protoModule.wireTypes.lengthDelimited)
		var3103, var4514 = protoModule.writeString(var3103, var3104, self.asset_subtitle)
		buff = var3103
		var3083 = var3104
	end
	if self.gradient ~= nil then
		local var3105 = self.gradient:encode()
		local var3106, var3107 = protoModule.writeTag(buff, var3083, 10, protoModule.wireTypes.lengthDelimited)
		var3106, var4517 = protoModule.writeBuffer(var3106, var3107, var3105, buffer.len(var3105))
		buff = var3106
		var3083 = var3107
	end
	if self.playable_text ~= nil then
		local var3108, var3109 = protoModule.writeTag(buff, var3083, 11, protoModule.wireTypes.lengthDelimited)
		var3108, var4519 = protoModule.writeString(var3108, var3109, self.playable_text)
		buff = var3108
		var3083 = var3109
	end
	if self.collection_id ~= nil then
		local var3110, var3111 = protoModule.writeTag(buff, var3083, 12, protoModule.wireTypes.lengthDelimited)
		var3110, var4521 = protoModule.writeString(var3110, var3111, self.collection_id)
		buff = var3110
		var3083 = var3111
	end
	if self.campaign_id ~= nil then
		local var3112, var3113 = protoModule.writeTag(buff, var3083, 13, protoModule.wireTypes.lengthDelimited)
		var3112, var4523 = protoModule.writeString(var3112, var3113, self.campaign_id)
		buff = var3112
		var3083 = var3113
	end
	if self.cohort_id ~= nil then
		local var3114, var3115 = protoModule.writeTag(buff, var3083, 14, protoModule.wireTypes.lengthDelimited)
		var3114, var4525 = protoModule.writeString(var3114, var3115, self.cohort_id)
		buff = var3114
		var3083 = var3115
	end
	if self.sort_id ~= nil then
		local var3116, var3117 = protoModule.writeTag(buff, var3083, 15, protoModule.wireTypes.lengthDelimited)
		var3116, var4527 = protoModule.writeString(var3116, var3117, self.sort_id)
		buff = var3116
		var3083 = var3117
	end
	if self.hero_unit_id ~= nil then
		local var3118, var3119 = protoModule.writeTag(buff, var3083, 16, protoModule.wireTypes.lengthDelimited)
		var3118, var4529 = protoModule.writeString(var3118, var3119, self.hero_unit_id)
		buff = var3118
		var3083 = var3119
	end
	if self.analytics_id ~= nil then
		local var3120, var3121 = protoModule.writeTag(buff, var3083, 17, protoModule.wireTypes.lengthDelimited)
		var3120, var4531 = protoModule.writeString(var3120, var3121, self.analytics_id)
		buff = var3120
		var3083 = var3121
	end
	if self.is_sponsored ~= nil then
		local var3122, var3123 = protoModule.writeTag(buff, var3083, 18, protoModule.wireTypes.varint)
		var3122, var4533 = protoModule.writeVarInt(var3122, var3123, if self.is_sponsored then 1 else 0)
		buff = var3122
		var3083 = var3123
	end
	local buff_1 = buffer.create(var3083)
	buffer.copy(buff_1, 0, buff, 0, var3083)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var3083 = t_115.new()
	local var3084 = 0
	while var3084 < buffer.len(p115) do
		local _ = nil
		local var3085 = nil
		local var3086, var3087, var3088 = protoModule.readTag(p115, var3084)
		local var3089 = var3086
		var3085 = var3087
		var3084 = var3088
		
		if var3085 == protoModule.wireTypes.varint then
			if var3089 == 18 then
				local _ = nil
				local var3090, var3091 = protoModule.readVarInt(p115, var3084)
				var3084 = var3091
				var3083.is_sponsored = var3090 ~= 0
			else
				local _ = nil
				local var3092, var3093 = protoModule.readVarInt(p115, var3084)
				local _ = var3092
				var3084 = var3093
			end
		end
		if var3085 == protoModule.wireTypes.lengthDelimited then
			if var3089 == 1 then
				local _ = nil
				local var3094, var3095 = protoModule.readBuffer(p115, var3084)
				var3084 = var3095
				var3083.universe_id = buffer.tostring(var3094)
			elseif var3089 == 2 then
				local _ = nil
				local var3096, var3097 = protoModule.readBuffer(p115, var3084)
				var3084 = var3097
				var3083.title = buffer.tostring(var3096)
			elseif var3089 == 3 then
				local _ = nil
				local var3098, var3099 = protoModule.readBuffer(p115, var3084)
				var3084 = var3099
				var3083.subtitle = buffer.tostring(var3098)
			elseif var3089 == 4 then
				local _ = nil
				local var3100, var3101 = protoModule.readBuffer(p115, var3084)
				var3084 = var3101
				var3083.badge_text = buffer.tostring(var3100)
			elseif var3089 == 5 then
				local _ = nil
				local var3102, var3103 = protoModule.readBuffer(p115, var3084)
				var3084 = var3103
				var3083.foreground = t.HeroUnitInputData_VisualAsset.decode(var3102)
			elseif var3089 == 6 then
				local _ = nil
				local var3104, var3105 = protoModule.readBuffer(p115, var3084)
				var3084 = var3105
				var3083.background = t.HeroUnitInputData_VisualAsset.decode(var3104)
			elseif var3089 == 7 then
				local _ = nil
				local var3106, var3107 = protoModule.readBuffer(p115, var3084)
				var3084 = var3107
				var3083.title_image = t.HeroUnitInputData_VisualAsset.decode(var3106)
			elseif var3089 == 8 then
				local _ = nil
				local var3108, var3109 = protoModule.readBuffer(p115, var3084)
				var3084 = var3109
				var3083.asset_title = buffer.tostring(var3108)
			elseif var3089 == 9 then
				local _ = nil
				local var3110, var3111 = protoModule.readBuffer(p115, var3084)
				var3084 = var3111
				var3083.asset_subtitle = buffer.tostring(var3110)
			elseif var3089 == 10 then
				local _ = nil
				local var3112, var3113 = protoModule.readBuffer(p115, var3084)
				var3084 = var3113
				var3083.gradient = t.HeroUnitInputData_Gradient.decode(var3112)
			elseif var3089 == 11 then
				local _ = nil
				local var3114, var3115 = protoModule.readBuffer(p115, var3084)
				var3084 = var3115
				var3083.playable_text = buffer.tostring(var3114)
			elseif var3089 == 12 then
				local _ = nil
				local var3116, var3117 = protoModule.readBuffer(p115, var3084)
				var3084 = var3117
				var3083.collection_id = buffer.tostring(var3116)
			elseif var3089 == 13 then
				local _ = nil
				local var3118, var3119 = protoModule.readBuffer(p115, var3084)
				var3084 = var3119
				var3083.campaign_id = buffer.tostring(var3118)
			elseif var3089 == 14 then
				local _ = nil
				local var3120, var3121 = protoModule.readBuffer(p115, var3084)
				var3084 = var3121
				var3083.cohort_id = buffer.tostring(var3120)
			elseif var3089 == 15 then
				local _ = nil
				local var3122, var3123 = protoModule.readBuffer(p115, var3084)
				var3084 = var3123
				var3083.sort_id = buffer.tostring(var3122)
			elseif var3089 == 16 then
				local _ = nil
				local var3124, var3125 = protoModule.readBuffer(p115, var3084)
				var3084 = var3125
				var3083.hero_unit_id = buffer.tostring(var3124)
			elseif var3089 == 17 then
				local _ = nil
				local var3126, var3127 = protoModule.readBuffer(p115, var3084)
				var3084 = var3127
				var3083.analytics_id = buffer.tostring(var3126)
			else
				local _ = nil
				local var3128, var3129 = protoModule.readVarInt(p115, var3084)
				var3084 = var3129 + var3128
			end
		elseif var3085 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3130, var3131 = protoModule.readFixed32(p115, var3084)
			local _ = var3130
			var3084 = var3131
		elseif var3085 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3132, var3133 = protoModule.readFixed64(p115, var3084)
			local _ = var3132
			var3084 = var3133
		else
			error("Unsupported wire type: " .. var4537)
		end
	end
	return var3083
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

function t_115:jsonDecode()
	-- upvalues: t_115 (ref), t (ref)
	local var3134 = t_115.new()
	
	if self.universe_id ~= nil then
		var3134.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3134.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3134.title = self.title
	end
	if self.subtitle ~= nil then
		var3134.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3134.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3134.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3134.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3134.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3134.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3134.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3134.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3134.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3134.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3134.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3134.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3134.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3134.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3134.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3134.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3134.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3134.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3134.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3134.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3134.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3134.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3134.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3134.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3134.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3134.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3134.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3134.is_sponsored = self.isSponsored
	end
	return var3134
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
	local var3134 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3135, var3136 = protoModule.writeTag(buff, var3134, 1, protoModule.wireTypes.lengthDelimited)
		var3135, var4591 = protoModule.writeString(var3135, var3136, self.asset_id)
		buff = var3135
		var3134 = var3136
	end
	if self.aspect_ratio ~= nil then
		local var3137, var3138 = protoModule.writeTag(buff, var3134, 2, protoModule.wireTypes.i64)
		var3137, var4593 = protoModule.writeDouble(var3137, var3138, self.aspect_ratio)
		buff = var3137
		var3134 = var3138
	end
	if self.enable_animation ~= nil then
		local var3139, var3140 = protoModule.writeTag(buff, var3134, 3, protoModule.wireTypes.varint)
		var3139, var4595 = protoModule.writeVarInt(var3139, var3140, if self.enable_animation then 1 else 0)
		buff = var3139
		var3134 = var3140
	end
	local buff_1 = buffer.create(var3134)
	buffer.copy(buff_1, 0, buff, 0, var3134)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3134 = t_116.new()
	local var3135 = 0
	while var3135 < buffer.len(p116) do
		local _ = nil
		local var3136 = nil
		local var3137, var3138, var3139 = protoModule.readTag(p116, var3135)
		local var3140 = var3137
		var3136 = var3138
		var3135 = var3139
		
		if var3136 == protoModule.wireTypes.varint then
			if var3140 == 3 then
				local _ = nil
				local var3141, var3142 = protoModule.readVarInt(p116, var3135)
				var3135 = var3142
				var3134.enable_animation = var3141 ~= 0
			else
				local _ = nil
				local var3143, var3144 = protoModule.readVarInt(p116, var3135)
				local _ = var3143
				var3135 = var3144
			end
		end
		if var3136 == protoModule.wireTypes.lengthDelimited then
			if var3140 == 1 then
				local _ = nil
				local var3145, var3146 = protoModule.readBuffer(p116, var3135)
				var3135 = var3146
				var3134.asset_id = buffer.tostring(var3145)
			else
				local _ = nil
				local var3147, var3148 = protoModule.readVarInt(p116, var3135)
				var3135 = var3148 + var3147
			end
		elseif var3136 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3149, var3150 = protoModule.readFixed32(p116, var3135)
			local _ = var3149
			var3135 = var3150
		elseif var3136 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4599)
		elseif var3140 == 2 then
			local _ = nil
			local var3151, var3152 = protoModule.readDouble(p116, var3135)
			var3135 = var3152
			var3134.aspect_ratio = var3151
		else
			local _ = nil
			local var3153, var3154 = protoModule.readFixed64(p116, var3135)
			local _ = var3153
			var3135 = var3154
		end
	end
	return var3134
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
	local var3155 = t_116.new()
	
	if self.asset_id ~= nil then
		var3155.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3155.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3155.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3155.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3155.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3155.enable_animation = self.enableAnimation
	end
	return var3155
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
	local var3155 = 0
	
	if self.start_color ~= nil then
		local var3156, var3157 = protoModule.writeTag(buff, var3155, 1, protoModule.wireTypes.lengthDelimited)
		var3156, var4623 = protoModule.writeString(var3156, var3157, self.start_color)
		buff = var3156
		var3155 = var3157
	end
	if self.end_color ~= nil then
		local var3158, var3159 = protoModule.writeTag(buff, var3155, 2, protoModule.wireTypes.lengthDelimited)
		var3158, var4625 = protoModule.writeString(var3158, var3159, self.end_color)
		buff = var3158
		var3155 = var3159
	end
	if self.start_opacity ~= nil then
		local var3160, var3161 = protoModule.writeTag(buff, var3155, 3, protoModule.wireTypes.i64)
		var3160, var4627 = protoModule.writeDouble(var3160, var3161, self.start_opacity)
		buff = var3160
		var3155 = var3161
	end
	if self.end_opacity ~= nil then
		local var3162, var3163 = protoModule.writeTag(buff, var3155, 4, protoModule.wireTypes.i64)
		var3162, var4629 = protoModule.writeDouble(var3162, var3163, self.end_opacity)
		buff = var3162
		var3155 = var3163
	end
	if self.degree ~= nil then
		local var3164, var3165 = protoModule.writeTag(buff, var3155, 5, protoModule.wireTypes.i64)
		var3164, var4631 = protoModule.writeDouble(var3164, var3165, self.degree)
		buff = var3164
		var3155 = var3165
	end
	local buff_1 = buffer.create(var3155)
	buffer.copy(buff_1, 0, buff, 0, var3155)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var3155 = t_117.new()
	local var3156 = 0
	while var3156 < buffer.len(p117) do
		local _ = nil
		local var3157 = nil
		local var3158, var3159, var3160 = protoModule.readTag(p117, var3156)
		local var3161 = var3158
		var3157 = var3159
		var3156 = var3160
		
		if var3157 == protoModule.wireTypes.varint then
			local _ = nil
			local var3162, var3163 = protoModule.readVarInt(p117, var3156)
			local _ = var3162
			var3156 = var3163
			continue
		end
		if var3157 == protoModule.wireTypes.lengthDelimited then
			if var3161 == 1 then
				local _ = nil
				local var3164, var3165 = protoModule.readBuffer(p117, var3156)
				var3156 = var3165
				var3155.start_color = buffer.tostring(var3164)
			elseif var3161 == 2 then
				local _ = nil
				local var3166, var3167 = protoModule.readBuffer(p117, var3156)
				var3156 = var3167
				var3155.end_color = buffer.tostring(var3166)
			else
				local _ = nil
				local var3168, var3169 = protoModule.readVarInt(p117, var3156)
				var3156 = var3169 + var3168
			end
		elseif var3157 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3170, var3171 = protoModule.readFixed32(p117, var3156)
			local _ = var3170
			var3156 = var3171
		elseif var3157 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4635)
		elseif var3161 == 3 then
			local _ = nil
			local var3172, var3173 = protoModule.readDouble(p117, var3156)
			var3156 = var3173
			var3155.start_opacity = var3172
		elseif var3161 == 4 then
			local _ = nil
			local var3174, var3175 = protoModule.readDouble(p117, var3156)
			var3156 = var3175
			var3155.end_opacity = var3174
		elseif var3161 == 5 then
			local _ = nil
			local var3176, var3177 = protoModule.readDouble(p117, var3156)
			var3156 = var3177
			var3155.degree = var3176
		else
			local _ = nil
			local var3178, var3179 = protoModule.readFixed64(p117, var3156)
			local _ = var3178
			var3156 = var3179
		end
	end
	return var3155
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
	local var3180 = t_117.new()
	
	if self.start_color ~= nil then
		var3180.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3180.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3180.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3180.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3180.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3180.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3180.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3180.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3180.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3180
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
	local var3180 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3181 = v:encode()
			local var3182, var3183 = protoModule.writeTag(buff, var3180, 1, protoModule.wireTypes.lengthDelimited)
			var3182, var4664 = protoModule.writeBuffer(var3182, var3183, var3181, buffer.len(var3181))
			buff = var3182
			var3180 = var3183
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3184, var3185 = protoModule.writeTag(buff, var3180, 2, protoModule.wireTypes.lengthDelimited)
		var3184, var4666 = protoModule.writeString(var3184, var3185, self.sort_id)
		buff = var3184
		var3180 = var3185
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3186, var3187 = protoModule.writeTag(buff, var3180, 3, protoModule.wireTypes.lengthDelimited)
		var3186, var4668 = protoModule.writeString(var3186, var3187, self.recommendation_request_id)
		buff = var3186
		var3180 = var3187
	end
	local buff_1 = buffer.create(var3180)
	buffer.copy(buff_1, 0, buff, 0, var3180)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var3188 = t_118.new()
	local var3189 = 0
	while var3189 < buffer.len(p118) do
		local _ = nil
		local var3190 = nil
		local var3191, var3192, var3193 = protoModule.readTag(p118, var3189)
		local var3194 = var3191
		var3190 = var3192
		var3189 = var3193
		
		if var3190 == protoModule.wireTypes.varint then
			local _ = nil
			local var3195, var3196 = protoModule.readVarInt(p118, var3189)
			local _ = var3195
			var3189 = var3196
			continue
		end
		if var3190 == protoModule.wireTypes.lengthDelimited then
			if var3194 == 1 then
				local _ = nil
				local var3197, var3198 = protoModule.readBuffer(p118, var3189)
				var3189 = var3198
				table.insert(var3188.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3197))
			elseif var3194 == 2 then
				local _ = nil
				local var3199, var3200 = protoModule.readBuffer(p118, var3189)
				var3189 = var3200
				var3188.sort_id = buffer.tostring(var3199)
			elseif var3194 == 3 then
				local _ = nil
				local var3201, var3202 = protoModule.readBuffer(p118, var3189)
				var3189 = var3202
				var3188.recommendation_request_id = buffer.tostring(var3201)
			else
				local _ = nil
				local var3203, var3204 = protoModule.readVarInt(p118, var3189)
				var3189 = var3204 + var3203
			end
		elseif var3190 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3205, var3206 = protoModule.readFixed32(p118, var3189)
			local _ = var3205
			var3189 = var3206
		elseif var3190 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3207, var3208 = protoModule.readFixed64(p118, var3189)
			local _ = var3207
			var3189 = var3208
		else
			error("Unsupported wire type: " .. var4672)
		end
	end
	return var3188
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
	local var3209 = t_118.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3209.items = t_1
	end
	if self.sort_id ~= nil then
		var3209.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3209.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3209.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3209.recommendation_request_id = self.recommendationRequestId
	end
	return var3209
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
	local var3210 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3211, var3212 = protoModule.writeTag(buff, var3210, 1, protoModule.wireTypes.lengthDelimited)
		var3211, var4698 = protoModule.writeString(var3211, var3212, self.user_id)
		buff = var3211
		var3210 = var3212
	end
	local buff_1 = buffer.create(var3210)
	buffer.copy(buff_1, 0, buff, 0, var3210)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3210 = t_119.new()
	local var3211 = 0
	while var3211 < buffer.len(p119) do
		local _ = nil
		local var3212 = nil
		local var3213, var3214, var3215 = protoModule.readTag(p119, var3211)
		local var3216 = var3213
		var3212 = var3214
		var3211 = var3215
		
		if var3212 == protoModule.wireTypes.varint then
			local _ = nil
			local var3217, var3218 = protoModule.readVarInt(p119, var3211)
			local _ = var3217
			var3211 = var3218
			continue
		end
		if var3212 == protoModule.wireTypes.lengthDelimited then
			if var3216 == 1 then
				local _ = nil
				local var3219, var3220 = protoModule.readBuffer(p119, var3211)
				var3211 = var3220
				var3210.user_id = buffer.tostring(var3219)
			else
				local _ = nil
				local var3221, var3222 = protoModule.readVarInt(p119, var3211)
				var3211 = var3222 + var3221
			end
		elseif var3212 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3223, var3224 = protoModule.readFixed32(p119, var3211)
			local _ = var3223
			var3211 = var3224
		elseif var3212 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3225, var3226 = protoModule.readFixed64(p119, var3211)
			local _ = var3225
			var3211 = var3226
		else
			error("Unsupported wire type: " .. var4702)
		end
	end
	return var3210
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
	local var3227 = t_119.new()
	
	if self.user_id ~= nil then
		var3227.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3227.user_id = self.userId
	end
	return var3227
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
	local var3227 = 0
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		local var3228, var3229 = protoModule.writeTag(buff, var3227, 1, protoModule.wireTypes.lengthDelimited)
		var3228, var4722 = protoModule.writeString(var3228, var3229, self.contact_id)
		buff = var3228
		var3227 = var3229
	end
	local buff_1 = buffer.create(var3227)
	buffer.copy(buff_1, 0, buff, 0, var3227)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3227 = t_120.new()
	local var3228 = 0
	while var3228 < buffer.len(p120) do
		local _ = nil
		local var3229 = nil
		local var3230, var3231, var3232 = protoModule.readTag(p120, var3228)
		local var3233 = var3230
		var3229 = var3231
		var3228 = var3232
		
		if var3229 == protoModule.wireTypes.varint then
			local _ = nil
			local var3234, var3235 = protoModule.readVarInt(p120, var3228)
			local _ = var3234
			var3228 = var3235
			continue
		end
		if var3229 == protoModule.wireTypes.lengthDelimited then
			if var3233 == 1 then
				local _ = nil
				local var3236, var3237 = protoModule.readBuffer(p120, var3228)
				var3228 = var3237
				var3227.contact_id = buffer.tostring(var3236)
			else
				local _ = nil
				local var3238, var3239 = protoModule.readVarInt(p120, var3228)
				var3228 = var3239 + var3238
			end
		elseif var3229 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3240, var3241 = protoModule.readFixed32(p120, var3228)
			local _ = var3240
			var3228 = var3241
		elseif var3229 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3242, var3243 = protoModule.readFixed64(p120, var3228)
			local _ = var3242
			var3228 = var3243
		else
			error("Unsupported wire type: " .. var4726)
		end
	end
	return var3227
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
	local var3244 = t_120.new()
	
	if self.contact_id ~= nil then
		var3244.contact_id = self.contact_id
	end
	if self.contactId ~= nil then
		var3244.contact_id = self.contactId
	end
	return var3244
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
	local var3244 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "user" then
			local var3245 = self.kind.value:encode()
			local var3246, var3247 = protoModule.writeTag(buff, var3244, 1, protoModule.wireTypes.lengthDelimited)
			var3246, var4747 = protoModule.writeBuffer(var3246, var3247, var3245, buffer.len(var3245))
			buff = var3246
			var3244 = var3247
		elseif self.kind.type == "contact" then
			local var3248 = self.kind.value:encode()
			local var3249, var3250 = protoModule.writeTag(buff, var3244, 2, protoModule.wireTypes.lengthDelimited)
			var3249, var4750 = protoModule.writeBuffer(var3249, var3250, var3248, buffer.len(var3248))
			buff = var3249
			var3244 = var3250
		end
	end
	if self.has_pending_friend_request then
		local var3251, var3252 = protoModule.writeTag(buff, var3244, 3, protoModule.wireTypes.varint)
		var3251, var4752 = protoModule.writeVarInt(var3251, var3252, if self.has_pending_friend_request then 1 else 0)
		buff = var3251
		var3244 = var3252
	end
	local buff_1 = buffer.create(var3244)
	buffer.copy(buff_1, 0, buff, 0, var3244)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var3244 = t_121.new()
	local var3245 = 0
	while var3245 < buffer.len(p121) do
		local _ = nil
		local var3246 = nil
		local var3247, var3248, var3249 = protoModule.readTag(p121, var3245)
		local var3250 = var3247
		var3246 = var3248
		var3245 = var3249
		
		if var3246 == protoModule.wireTypes.varint then
			if var3250 == 3 then
				local _ = nil
				local var3251, var3252 = protoModule.readVarInt(p121, var3245)
				var3245 = var3252
				var3244.has_pending_friend_request = var3251 ~= 0
			else
				local _ = nil
				local var3253, var3254 = protoModule.readVarInt(p121, var3245)
				local _ = var3253
				var3245 = var3254
			end
		end
		if var3246 == protoModule.wireTypes.lengthDelimited then
			if var3250 == 1 then
				local _ = nil
				local var3255, var3256 = protoModule.readBuffer(p121, var3245)
				var3245 = var3256
				var3244.kind = {
					type = "user",
					value = t.FriendRecommendationCarouselInputData_UserRecommendation.decode(var3255)
				}
			elseif var3250 == 2 then
				local _ = nil
				local var3257, var3258 = protoModule.readBuffer(p121, var3245)
				var3245 = var3258
				var3244.kind = {
					type = "contact",
					value = t.FriendRecommendationCarouselInputData_ContactRecommendation.decode(var3257)
				}
			else
				local _ = nil
				local var3259, var3260 = protoModule.readVarInt(p121, var3245)
				var3245 = var3260 + var3259
			end
		elseif var3246 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3261, var3262 = protoModule.readFixed32(p121, var3245)
			local _ = var3261
			var3245 = var3262
		elseif var3246 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3263, var3264 = protoModule.readFixed64(p121, var3245)
			local _ = var3263
			var3245 = var3264
		else
			error("Unsupported wire type: " .. var4756)
		end
	end
	return var3244
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
	local var3265 = t_121.new()
	
	if self.user ~= nil then
		var3265.kind = {
			type = "user",
			value = t.FriendRecommendationCarouselInputData_UserRecommendation.jsonDecode(self.user)
		}
	end
	if self.contact ~= nil then
		var3265.kind = {
			type = "contact",
			value = t.FriendRecommendationCarouselInputData_ContactRecommendation.jsonDecode(self.contact)
		}
	end
	if self.has_pending_friend_request ~= nil then
		var3265.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3265.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3265
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
	local var3265 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3266, var3267 = protoModule.writeTag(buff, var3265, 1, protoModule.wireTypes.lengthDelimited)
		var3266, var4780 = protoModule.writeString(var3266, var3267, self.selected_option)
		buff = var3266
		var3265 = var3267
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3268, var3269 = protoModule.writeTag(buff, var3265, 2, protoModule.wireTypes.lengthDelimited)
		var3268, var4782 = protoModule.writeString(var3268, var3269, self.sort_id)
		buff = var3268
		var3265 = var3269
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3270 = v:encode()
			local var3271, var3272 = protoModule.writeTag(buff, var3265, 3, protoModule.wireTypes.lengthDelimited)
			var3271, var4785 = protoModule.writeBuffer(var3271, var3272, var3270, buffer.len(var3270))
			buff = var3271
			var3265 = var3272
		end
	end
	if self.experience_carousel ~= nil then
		local var3273 = self.experience_carousel:encode()
		local var3274, var3275 = protoModule.writeTag(buff, var3265, 4, protoModule.wireTypes.lengthDelimited)
		var3274, var4788 = protoModule.writeBuffer(var3274, var3275, var3273, buffer.len(var3273))
		buff = var3274
		var3265 = var3275
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3276, var3277 = protoModule.writeTag(buff, var3265, 5, protoModule.wireTypes.lengthDelimited)
		var3276, var4790 = protoModule.writeString(var3276, var3277, self.feed_item_key)
		buff = var3276
		var3265 = var3277
	end
	local buff_1 = buffer.create(var3265)
	buffer.copy(buff_1, 0, buff, 0, var3265)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3278 = t_122.new()
	local var3279 = 0
	while var3279 < buffer.len(p122) do
		local _ = nil
		local var3280 = nil
		local var3281, var3282, var3283 = protoModule.readTag(p122, var3279)
		local var3284 = var3281
		var3280 = var3282
		var3279 = var3283
		
		if var3280 == protoModule.wireTypes.varint then
			local _ = nil
			local var3285, var3286 = protoModule.readVarInt(p122, var3279)
			local _ = var3285
			var3279 = var3286
			continue
		end
		if var3280 == protoModule.wireTypes.lengthDelimited then
			if var3284 == 1 then
				local _ = nil
				local var3287, var3288 = protoModule.readBuffer(p122, var3279)
				var3279 = var3288
				var3278.selected_option = buffer.tostring(var3287)
			elseif var3284 == 2 then
				local _ = nil
				local var3289, var3290 = protoModule.readBuffer(p122, var3279)
				var3279 = var3290
				var3278.sort_id = buffer.tostring(var3289)
			elseif var3284 == 3 then
				local _ = nil
				local var3291, var3292 = protoModule.readBuffer(p122, var3279)
				var3279 = var3292
				table.insert(var3278.options, t.SelectorOption.decode(var3291))
			elseif var3284 == 4 then
				local _ = nil
				local var3293, var3294 = protoModule.readBuffer(p122, var3279)
				var3279 = var3294
				var3278.experience_carousel = t.ExperienceCarouselInputData.decode(var3293)
			elseif var3284 == 5 then
				local _ = nil
				local var3295, var3296 = protoModule.readBuffer(p122, var3279)
				var3279 = var3296
				var3278.feed_item_key = buffer.tostring(var3295)
			else
				local _ = nil
				local var3297, var3298 = protoModule.readVarInt(p122, var3279)
				var3279 = var3298 + var3297
			end
		elseif var3280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3299, var3300 = protoModule.readFixed32(p122, var3279)
			local _ = var3299
			var3279 = var3300
		elseif var3280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3301, var3302 = protoModule.readFixed64(p122, var3279)
			local _ = var3301
			var3279 = var3302
		else
			error("Unsupported wire type: " .. var4794)
		end
	end
	return var3278
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
	local var3303 = t_122.new()
	
	if self.selected_option ~= nil then
		var3303.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3303.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3303.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3303.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3303.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3303.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3303.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3303.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3303.feed_item_key = self.feedItemKey
	end
	return var3303
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
	local var3304 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3305, var3306 = protoModule.writeTag(buff, var3304, 1, protoModule.wireTypes.lengthDelimited)
		var3305, var4824 = protoModule.writeString(var3305, var3306, self.id)
		buff = var3305
		var3304 = var3306
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3307, var3308 = protoModule.writeTag(buff, var3304, 2, protoModule.wireTypes.lengthDelimited)
		var3307, var4826 = protoModule.writeString(var3307, var3308, self.display_name)
		buff = var3307
		var3304 = var3308
	end
	if self.is_selected then
		local var3309, var3310 = protoModule.writeTag(buff, var3304, 3, protoModule.wireTypes.varint)
		var3309, var4828 = protoModule.writeVarInt(var3309, var3310, if self.is_selected then 1 else 0)
		buff = var3309
		var3304 = var3310
	end
	local buff_1 = buffer.create(var3304)
	buffer.copy(buff_1, 0, buff, 0, var3304)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3304 = t_123.new()
	local var3305 = 0
	while var3305 < buffer.len(p123) do
		local _ = nil
		local var3306 = nil
		local var3307, var3308, var3309 = protoModule.readTag(p123, var3305)
		local var3310 = var3307
		var3306 = var3308
		var3305 = var3309
		
		if var3306 == protoModule.wireTypes.varint then
			if var3310 == 3 then
				local _ = nil
				local var3311, var3312 = protoModule.readVarInt(p123, var3305)
				var3305 = var3312
				var3304.is_selected = var3311 ~= 0
			else
				local _ = nil
				local var3313, var3314 = protoModule.readVarInt(p123, var3305)
				local _ = var3313
				var3305 = var3314
			end
		end
		if var3306 == protoModule.wireTypes.lengthDelimited then
			if var3310 == 1 then
				local _ = nil
				local var3315, var3316 = protoModule.readBuffer(p123, var3305)
				var3305 = var3316
				var3304.id = buffer.tostring(var3315)
			elseif var3310 == 2 then
				local _ = nil
				local var3317, var3318 = protoModule.readBuffer(p123, var3305)
				var3305 = var3318
				var3304.display_name = buffer.tostring(var3317)
			else
				local _ = nil
				local var3319, var3320 = protoModule.readVarInt(p123, var3305)
				var3305 = var3320 + var3319
			end
		elseif var3306 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3321, var3322 = protoModule.readFixed32(p123, var3305)
			local _ = var3321
			var3305 = var3322
		elseif var3306 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3323, var3324 = protoModule.readFixed64(p123, var3305)
			local _ = var3323
			var3305 = var3324
		else
			error("Unsupported wire type: " .. var4832)
		end
	end
	return var3304
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
	local var3325 = t_123.new()
	
	if self.id ~= nil then
		var3325.id = self.id
	end
	if self.display_name ~= nil then
		var3325.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3325.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3325.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3325.is_selected = self.isSelected
	end
	return var3325
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
	local var3325 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3326 = v:encode()
			local var3327, var3328 = protoModule.writeTag(buff, var3325, 1, protoModule.wireTypes.lengthDelimited)
			var3327, var4857 = protoModule.writeBuffer(var3327, var3328, var3326, buffer.len(var3326))
			buff = var3327
			var3325 = var3328
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3329, var3330 = protoModule.writeTag(buff, var3325, 2, protoModule.wireTypes.lengthDelimited)
		var3329, var4859 = protoModule.writeString(var3329, var3330, self.title)
		buff = var3329
		var3325 = var3330
	end
	local buff_1 = buffer.create(var3325)
	buffer.copy(buff_1, 0, buff, 0, var3325)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var3331 = t_124.new()
	local var3332 = 0
	while var3332 < buffer.len(p124) do
		local _ = nil
		local var3333 = nil
		local var3334, var3335, var3336 = protoModule.readTag(p124, var3332)
		local var3337 = var3334
		var3333 = var3335
		var3332 = var3336
		
		if var3333 == protoModule.wireTypes.varint then
			local _ = nil
			local var3338, var3339 = protoModule.readVarInt(p124, var3332)
			local _ = var3338
			var3332 = var3339
			continue
		end
		if var3333 == protoModule.wireTypes.lengthDelimited then
			if var3337 == 1 then
				local _ = nil
				local var3340, var3341 = protoModule.readBuffer(p124, var3332)
				var3332 = var3341
				table.insert(var3331.cards, t.GameItemsCardInputData.decode(var3340))
			elseif var3337 == 2 then
				local _ = nil
				local var3342, var3343 = protoModule.readBuffer(p124, var3332)
				var3332 = var3343
				var3331.title = buffer.tostring(var3342)
			else
				local _ = nil
				local var3344, var3345 = protoModule.readVarInt(p124, var3332)
				var3332 = var3345 + var3344
			end
		elseif var3333 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3346, var3347 = protoModule.readFixed32(p124, var3332)
			local _ = var3346
			var3332 = var3347
		elseif var3333 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3348, var3349 = protoModule.readFixed64(p124, var3332)
			local _ = var3348
			var3332 = var3349
		else
			error("Unsupported wire type: " .. var4863)
		end
	end
	return var3331
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
	local var3350 = t_124.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3350.cards = t_1
	end
	if self.title ~= nil then
		var3350.title = self.title
	end
	return var3350
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
	local var3351 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3352, var3353 = protoModule.writeTag(buff, var3351, 1, protoModule.wireTypes.lengthDelimited)
		var3352, var4887 = protoModule.writeString(var3352, var3353, self.universe_id)
		buff = var3352
		var3351 = var3353
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3354 = v:encode()
			local var3355, var3356 = protoModule.writeTag(buff, var3351, 2, protoModule.wireTypes.lengthDelimited)
			var3355, var4890 = protoModule.writeBuffer(var3355, var3356, var3354, buffer.len(var3354))
			buff = var3355
			var3351 = var3356
		end
	end
	local buff_1 = buffer.create(var3351)
	buffer.copy(buff_1, 0, buff, 0, var3351)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3357 = t_125.new()
	local var3358 = 0
	while var3358 < buffer.len(p125) do
		local _ = nil
		local var3359 = nil
		local var3360, var3361, var3362 = protoModule.readTag(p125, var3358)
		local var3363 = var3360
		var3359 = var3361
		var3358 = var3362
		
		if var3359 == protoModule.wireTypes.varint then
			local _ = nil
			local var3364, var3365 = protoModule.readVarInt(p125, var3358)
			local _ = var3364
			var3358 = var3365
			continue
		end
		if var3359 == protoModule.wireTypes.lengthDelimited then
			if var3363 == 1 then
				local _ = nil
				local var3366, var3367 = protoModule.readBuffer(p125, var3358)
				var3358 = var3367
				var3357.universe_id = buffer.tostring(var3366)
			elseif var3363 == 2 then
				local _ = nil
				local var3368, var3369 = protoModule.readBuffer(p125, var3358)
				var3358 = var3369
				table.insert(var3357.items, t.GameItemInputData.decode(var3368))
			else
				local _ = nil
				local var3370, var3371 = protoModule.readVarInt(p125, var3358)
				var3358 = var3371 + var3370
			end
		elseif var3359 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3372, var3373 = protoModule.readFixed32(p125, var3358)
			local _ = var3372
			var3358 = var3373
		elseif var3359 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3374, var3375 = protoModule.readFixed64(p125, var3358)
			local _ = var3374
			var3358 = var3375
		else
			error("Unsupported wire type: " .. var4894)
		end
	end
	return var3357
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
	local var3376 = t_125.new()
	
	if self.universe_id ~= nil then
		var3376.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3376.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3376.items = t_1
	end
	return var3376
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
	local var3377 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3378, var3379 = protoModule.writeTag(buff, var3377, 1, protoModule.wireTypes.lengthDelimited)
		var3378, var4918 = protoModule.writeString(var3378, var3379, self.item_id)
		buff = var3378
		var3377 = var3379
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3380, var3381 = protoModule.writeTag(buff, var3377, 2, protoModule.wireTypes.lengthDelimited)
		var3380, var4920 = protoModule.writeString(var3380, var3381, self.item_type)
		buff = var3380
		var3377 = var3381
	end
	local buff_1 = buffer.create(var3377)
	buffer.copy(buff_1, 0, buff, 0, var3377)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3377 = t_126.new()
	local var3378 = 0
	while var3378 < buffer.len(p126) do
		local _ = nil
		local var3379 = nil
		local var3380, var3381, var3382 = protoModule.readTag(p126, var3378)
		local var3383 = var3380
		var3379 = var3381
		var3378 = var3382
		
		if var3379 == protoModule.wireTypes.varint then
			local _ = nil
			local var3384, var3385 = protoModule.readVarInt(p126, var3378)
			local _ = var3384
			var3378 = var3385
			continue
		end
		if var3379 == protoModule.wireTypes.lengthDelimited then
			if var3383 == 1 then
				local _ = nil
				local var3386, var3387 = protoModule.readBuffer(p126, var3378)
				var3378 = var3387
				var3377.item_id = buffer.tostring(var3386)
			elseif var3383 == 2 then
				local _ = nil
				local var3388, var3389 = protoModule.readBuffer(p126, var3378)
				var3378 = var3389
				var3377.item_type = buffer.tostring(var3388)
			else
				local _ = nil
				local var3390, var3391 = protoModule.readVarInt(p126, var3378)
				var3378 = var3391 + var3390
			end
		elseif var3379 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3392, var3393 = protoModule.readFixed32(p126, var3378)
			local _ = var3392
			var3378 = var3393
		elseif var3379 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3394, var3395 = protoModule.readFixed64(p126, var3378)
			local _ = var3394
			var3378 = var3395
		else
			error("Unsupported wire type: " .. var4924)
		end
	end
	return var3377
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
	local var3396 = t_126.new()
	
	if self.item_id ~= nil then
		var3396.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3396.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3396.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3396.item_type = self.itemType
	end
	return var3396
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
	local var3396 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3397, var3398 = protoModule.writeTag(buff, var3396, 1, protoModule.wireTypes.lengthDelimited)
		var3397, var4946 = protoModule.writeString(var3397, var3398, self.clickout_url)
		buff = var3397
		var3396 = var3398
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3399, var3400 = protoModule.writeTag(buff, var3396, 2, protoModule.wireTypes.lengthDelimited)
		var3399, var4948 = protoModule.writeString(var3399, var3400, self.native_ad_data)
		buff = var3399
		var3396 = var3400
	end
	if self.payer_name ~= nil then
		local var3401, var3402 = protoModule.writeTag(buff, var3396, 3, protoModule.wireTypes.lengthDelimited)
		var3401, var4950 = protoModule.writeString(var3401, var3402, self.payer_name)
		buff = var3401
		var3396 = var3402
	end
	if self.logo_asset_id ~= nil then
		local var3403, var3404 = protoModule.writeTag(buff, var3396, 4, protoModule.wireTypes.lengthDelimited)
		var3403, var4952 = protoModule.writeString(var3403, var3404, self.logo_asset_id)
		buff = var3403
		var3396 = var3404
	end
	if self.logo_aspect_ratio ~= nil then
		local var3405, var3406 = protoModule.writeTag(buff, var3396, 5, protoModule.wireTypes.i64)
		var3405, var4954 = protoModule.writeDouble(var3405, var3406, self.logo_aspect_ratio)
		buff = var3405
		var3396 = var3406
	end
	if self.cta_text ~= nil then
		local var3407, var3408 = protoModule.writeTag(buff, var3396, 6, protoModule.wireTypes.lengthDelimited)
		var3407, var4956 = protoModule.writeString(var3407, var3408, self.cta_text)
		buff = var3407
		var3396 = var3408
	end
	if self.title ~= nil then
		local var3409, var3410 = protoModule.writeTag(buff, var3396, 7, protoModule.wireTypes.lengthDelimited)
		var3409, var4958 = protoModule.writeString(var3409, var3410, self.title)
		buff = var3409
		var3396 = var3410
	end
	if self.subtitle ~= nil then
		local var3411, var3412 = protoModule.writeTag(buff, var3396, 8, protoModule.wireTypes.lengthDelimited)
		var3411, var4960 = protoModule.writeString(var3411, var3412, self.subtitle)
		buff = var3411
		var3396 = var3412
	end
	if self.image_asset_id ~= nil then
		local var3413, var3414 = protoModule.writeTag(buff, var3396, 9, protoModule.wireTypes.lengthDelimited)
		var3413, var4962 = protoModule.writeString(var3413, var3414, self.image_asset_id)
		buff = var3413
		var3396 = var3414
	end
	if self.video_asset_id ~= nil then
		local var3415, var3416 = protoModule.writeTag(buff, var3396, 10, protoModule.wireTypes.lengthDelimited)
		var3415, var4964 = protoModule.writeString(var3415, var3416, self.video_asset_id)
		buff = var3415
		var3396 = var3416
	end
	if self.badge_text ~= nil then
		local var3417, var3418 = protoModule.writeTag(buff, var3396, 11, protoModule.wireTypes.lengthDelimited)
		var3417, var4966 = protoModule.writeString(var3417, var3418, self.badge_text)
		buff = var3417
		var3396 = var3418
	end
	if self.badge_analytics_id ~= nil then
		local var3419, var3420 = protoModule.writeTag(buff, var3396, 12, protoModule.wireTypes.lengthDelimited)
		var3419, var4968 = protoModule.writeString(var3419, var3420, self.badge_analytics_id)
		buff = var3419
		var3396 = var3420
	end
	if self.roblox_component ~= nil then
		local var3421, var3422 = protoModule.writeTag(buff, var3396, 13, protoModule.wireTypes.lengthDelimited)
		var3421, var4970 = protoModule.writeString(var3421, var3422, self.roblox_component)
		buff = var3421
		var3396 = var3422
	end
	local buff_1 = buffer.create(var3396)
	buffer.copy(buff_1, 0, buff, 0, var3396)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3396 = t_127.new()
	local var3397 = 0
	while var3397 < buffer.len(p127) do
		local _ = nil
		local var3398 = nil
		local var3399, var3400, var3401 = protoModule.readTag(p127, var3397)
		local var3402 = var3399
		var3398 = var3400
		var3397 = var3401
		
		if var3398 == protoModule.wireTypes.varint then
			local _ = nil
			local var3403, var3404 = protoModule.readVarInt(p127, var3397)
			local _ = var3403
			var3397 = var3404
			continue
		end
		if var3398 == protoModule.wireTypes.lengthDelimited then
			if var3402 == 1 then
				local _ = nil
				local var3405, var3406 = protoModule.readBuffer(p127, var3397)
				var3397 = var3406
				var3396.clickout_url = buffer.tostring(var3405)
			elseif var3402 == 2 then
				local _ = nil
				local var3407, var3408 = protoModule.readBuffer(p127, var3397)
				var3397 = var3408
				var3396.native_ad_data = buffer.tostring(var3407)
			elseif var3402 == 3 then
				local _ = nil
				local var3409, var3410 = protoModule.readBuffer(p127, var3397)
				var3397 = var3410
				var3396.payer_name = buffer.tostring(var3409)
			elseif var3402 == 4 then
				local _ = nil
				local var3411, var3412 = protoModule.readBuffer(p127, var3397)
				var3397 = var3412
				var3396.logo_asset_id = buffer.tostring(var3411)
			elseif var3402 == 6 then
				local _ = nil
				local var3413, var3414 = protoModule.readBuffer(p127, var3397)
				var3397 = var3414
				var3396.cta_text = buffer.tostring(var3413)
			elseif var3402 == 7 then
				local _ = nil
				local var3415, var3416 = protoModule.readBuffer(p127, var3397)
				var3397 = var3416
				var3396.title = buffer.tostring(var3415)
			elseif var3402 == 8 then
				local _ = nil
				local var3417, var3418 = protoModule.readBuffer(p127, var3397)
				var3397 = var3418
				var3396.subtitle = buffer.tostring(var3417)
			elseif var3402 == 9 then
				local _ = nil
				local var3419, var3420 = protoModule.readBuffer(p127, var3397)
				var3397 = var3420
				var3396.image_asset_id = buffer.tostring(var3419)
			elseif var3402 == 10 then
				local _ = nil
				local var3421, var3422 = protoModule.readBuffer(p127, var3397)
				var3397 = var3422
				var3396.video_asset_id = buffer.tostring(var3421)
			elseif var3402 == 11 then
				local _ = nil
				local var3423, var3424 = protoModule.readBuffer(p127, var3397)
				var3397 = var3424
				var3396.badge_text = buffer.tostring(var3423)
			elseif var3402 == 12 then
				local _ = nil
				local var3425, var3426 = protoModule.readBuffer(p127, var3397)
				var3397 = var3426
				var3396.badge_analytics_id = buffer.tostring(var3425)
			elseif var3402 == 13 then
				local _ = nil
				local var3427, var3428 = protoModule.readBuffer(p127, var3397)
				var3397 = var3428
				var3396.roblox_component = buffer.tostring(var3427)
			else
				local _ = nil
				local var3429, var3430 = protoModule.readVarInt(p127, var3397)
				var3397 = var3430 + var3429
			end
		elseif var3398 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3431, var3432 = protoModule.readFixed32(p127, var3397)
			local _ = var3431
			var3397 = var3432
		elseif var3398 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4974)
		elseif var3402 == 5 then
			local _ = nil
			local var3433, var3434 = protoModule.readDouble(p127, var3397)
			var3397 = var3434
			var3396.logo_aspect_ratio = var3433
		else
			local _ = nil
			local var3435, var3436 = protoModule.readFixed64(p127, var3397)
			local _ = var3435
			var3397 = var3436
		end
	end
	return var3396
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
	local var3437 = t_127.new()
	
	if self.clickout_url ~= nil then
		var3437.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3437.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3437.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3437.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3437.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3437.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3437.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3437.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3437.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3437.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3437.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3437.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3437.title = self.title
	end
	if self.subtitle ~= nil then
		var3437.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3437.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3437.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3437.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3437.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3437.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3437.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3437.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3437.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3437.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3437.roblox_component = self.robloxComponent
	end
	return var3437
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
	local var3437 = 0
	
	if self.layout ~= nil then
		local var3438 = self.layout:encode()
		local var3439, var3440 = protoModule.writeTag(buff, var3437, 1, protoModule.wireTypes.lengthDelimited)
		var3439, var5019 = protoModule.writeBuffer(var3439, var3440, var3438, buffer.len(var3438))
		buff = var3439
		var3437 = var3440
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3441 = self.kind.value:encode()
			local var3442, var3443 = protoModule.writeTag(buff, var3437, 2, protoModule.wireTypes.lengthDelimited)
			var3442, var5022 = protoModule.writeBuffer(var3442, var3443, var3441, buffer.len(var3441))
			buff = var3442
			var3437 = var3443
		elseif self.kind.type == "ad_link" then
			local var3444 = self.kind.value:encode()
			local var3445, var3446 = protoModule.writeTag(buff, var3437, 3, protoModule.wireTypes.lengthDelimited)
			var3445, var5025 = protoModule.writeBuffer(var3445, var3446, var3444, buffer.len(var3444))
			buff = var3445
			var3437 = var3446
		end
	end
	local buff_1 = buffer.create(var3437)
	buffer.copy(buff_1, 0, buff, 0, var3437)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var3437 = t_128.new()
	local var3438 = 0
	while var3438 < buffer.len(p128) do
		local _ = nil
		local var3439 = nil
		local var3440, var3441, var3442 = protoModule.readTag(p128, var3438)
		local var3443 = var3440
		var3439 = var3441
		var3438 = var3442
		
		if var3439 == protoModule.wireTypes.varint then
			local _ = nil
			local var3444, var3445 = protoModule.readVarInt(p128, var3438)
			local _ = var3444
			var3438 = var3445
			continue
		end
		if var3439 == protoModule.wireTypes.lengthDelimited then
			if var3443 == 1 then
				local _ = nil
				local var3446, var3447 = protoModule.readBuffer(p128, var3438)
				var3438 = var3447
				var3437.layout = t.ItemLayout.decode(var3446)
			elseif var3443 == 2 then
				local _ = nil
				local var3448, var3449 = protoModule.readBuffer(p128, var3438)
				var3438 = var3449
				var3437.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3448)
				}
			elseif var3443 == 3 then
				local _ = nil
				local var3450, var3451 = protoModule.readBuffer(p128, var3438)
				var3438 = var3451
				var3437.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3450) }
			else
				local _ = nil
				local var3452, var3453 = protoModule.readVarInt(p128, var3438)
				var3438 = var3453 + var3452
			end
		elseif var3439 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3454, var3455 = protoModule.readFixed32(p128, var3438)
			local _ = var3454
			var3438 = var3455
		elseif var3439 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3456, var3457 = protoModule.readFixed64(p128, var3438)
			local _ = var3456
			var3438 = var3457
		else
			error("Unsupported wire type: " .. var5029)
		end
	end
	return var3437
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
	local var3458 = t_128.new()
	
	if self.layout ~= nil then
		var3458.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3458.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3458.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3458.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3458
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
	local var3458 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3459 = v:encode()
			local var3460, var3461 = protoModule.writeTag(buff, var3458, 1, protoModule.wireTypes.lengthDelimited)
			var3460, var5054 = protoModule.writeBuffer(var3460, var3461, var3459, buffer.len(var3459))
			buff = var3460
			var3458 = var3461
		end
	end
	if self.collection_item_size ~= nil then
		local var3462, var3463 = protoModule.writeTag(buff, var3458, 2, protoModule.wireTypes.lengthDelimited)
		var3462, var5056 = protoModule.writeString(var3462, var3463, self.collection_item_size)
		buff = var3462
		var3458 = var3463
	end
	local buff_1 = buffer.create(var3458)
	buffer.copy(buff_1, 0, buff, 0, var3458)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3464 = t_129.new()
	local var3465 = 0
	while var3465 < buffer.len(p129) do
		local _ = nil
		local var3466 = nil
		local var3467, var3468, var3469 = protoModule.readTag(p129, var3465)
		local var3470 = var3467
		var3466 = var3468
		var3465 = var3469
		
		if var3466 == protoModule.wireTypes.varint then
			local _ = nil
			local var3471, var3472 = protoModule.readVarInt(p129, var3465)
			local _ = var3471
			var3465 = var3472
			continue
		end
		if var3466 == protoModule.wireTypes.lengthDelimited then
			if var3470 == 1 then
				local _ = nil
				local var3473, var3474 = protoModule.readBuffer(p129, var3465)
				var3465 = var3474
				table.insert(var3464.items, t.ItemWithLayout.decode(var3473))
			elseif var3470 == 2 then
				local _ = nil
				local var3475, var3476 = protoModule.readBuffer(p129, var3465)
				var3465 = var3476
				var3464.collection_item_size = buffer.tostring(var3475)
			else
				local _ = nil
				local var3477, var3478 = protoModule.readVarInt(p129, var3465)
				var3465 = var3478 + var3477
			end
		elseif var3466 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3479, var3480 = protoModule.readFixed32(p129, var3465)
			local _ = var3479
			var3465 = var3480
		elseif var3466 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3481, var3482 = protoModule.readFixed64(p129, var3465)
			local _ = var3481
			var3465 = var3482
		else
			error("Unsupported wire type: " .. var5060)
		end
	end
	return var3464
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
	local var3483 = t_129.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3483.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3483.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3483.collection_item_size = self.collectionItemSize
	end
	return var3483
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
	local var3484 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3485, var3486 = protoModule.writeTag(buff, var3484, 1, protoModule.wireTypes.varint)
		var3485, var5084 = protoModule.writeVarInt(var3485, var3486, self.col_span)
		buff = var3485
		var3484 = var3486
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3487, var3488 = protoModule.writeTag(buff, var3484, 2, protoModule.wireTypes.varint)
		var3487, var5086 = protoModule.writeVarInt(var3487, var3488, self.row_span)
		buff = var3487
		var3484 = var3488
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3489, var3490 = protoModule.writeTag(buff, var3484, 3, protoModule.wireTypes.lengthDelimited)
		var3489, var5088 = protoModule.writeString(var3489, var3490, self.alignment_type)
		buff = var3489
		var3484 = var3490
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3491, var3492 = protoModule.writeTag(buff, var3484, 4, protoModule.wireTypes.varint)
		var3491, var5090 = protoModule.writeVarInt(var3491, var3492, self.min_row_padding)
		buff = var3491
		var3484 = var3492
	end
	local buff_1 = buffer.create(var3484)
	buffer.copy(buff_1, 0, buff, 0, var3484)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref)
	local var3484 = t_130.new()
	local var3485 = 0
	while var3485 < buffer.len(p130) do
		local _ = nil
		local var3486 = nil
		local var3487, var3488, var3489 = protoModule.readTag(p130, var3485)
		local var3490 = var3487
		var3486 = var3488
		var3485 = var3489
		
		if var3486 == protoModule.wireTypes.varint then
			if var3490 == 1 then
				local _ = nil
				local var3491, var3492 = protoModule.readVarIntI32(p130, var3485)
				var3485 = var3492
				var3484.col_span = var3491
			elseif var3490 == 2 then
				local _ = nil
				local var3493, var3494 = protoModule.readVarIntI32(p130, var3485)
				var3485 = var3494
				var3484.row_span = var3493
			elseif var3490 == 4 then
				local _ = nil
				local var3495, var3496 = protoModule.readVarIntI32(p130, var3485)
				var3485 = var3496
				var3484.min_row_padding = var3495
			else
				local _ = nil
				local var3497, var3498 = protoModule.readVarInt(p130, var3485)
				local _ = var3497
				var3485 = var3498
			end
		end
		if var3486 == protoModule.wireTypes.lengthDelimited then
			if var3490 == 3 then
				local _ = nil
				local var3499, var3500 = protoModule.readBuffer(p130, var3485)
				var3485 = var3500
				var3484.alignment_type = buffer.tostring(var3499)
			else
				local _ = nil
				local var3501, var3502 = protoModule.readVarInt(p130, var3485)
				var3485 = var3502 + var3501
			end
		elseif var3486 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3503, var3504 = protoModule.readFixed32(p130, var3485)
			local _ = var3503
			var3485 = var3504
		elseif var3486 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3505, var3506 = protoModule.readFixed64(p130, var3485)
			local _ = var3505
			var3485 = var3506
		else
			error("Unsupported wire type: " .. var5094)
		end
	end
	return var3484
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
	local var3507 = t_130.new()
	
	if self.col_span ~= nil then
		var3507.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3507.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3507.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3507.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3507.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3507.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3507.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3507.min_row_padding = self.minRowPadding
	end
	return var3507
end

t_130.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_130
typeRegistryModule.default:register(t.ItemLayout)
local t_131 = {}
t_131.__index = t_131

function t_131.new(p131)
	-- upvalues: t_131 (ref)
	return setmetatable({
		community_id = if p131 == nil or p131.community_id == nil then "" else p131.community_id,
		announcement_id = if p131 == nil or p131.announcement_id == nil then "" else p131.announcement_id,
		message_id = if p131 == nil or p131.message_id == nil then "" else p131.message_id,
		title = if p131 == nil or p131.title == nil then "" else p131.title,
		body = if p131 == nil or p131.body == nil then "" else p131.body,
		creator_key = if p131 == nil or p131.creator_key == nil then "" else p131.creator_key,
		creator_role_name = if p131 == nil or p131.creator_role_name == nil then nil else p131.creator_role_name,
		media_asset_id = if p131 == nil or p131.media_asset_id == nil then nil else p131.media_asset_id,
		created_time = if p131 == nil or p131.created_time == nil then nil else p131.created_time
	}, t_131)
end

function t_131:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3507 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3508, var3509 = protoModule.writeTag(buff, var3507, 1, protoModule.wireTypes.lengthDelimited)
		var3508, var5120 = protoModule.writeString(var3508, var3509, self.community_id)
		buff = var3508
		var3507 = var3509
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3510, var3511 = protoModule.writeTag(buff, var3507, 2, protoModule.wireTypes.lengthDelimited)
		var3510, var5122 = protoModule.writeString(var3510, var3511, self.announcement_id)
		buff = var3510
		var3507 = var3511
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3512, var3513 = protoModule.writeTag(buff, var3507, 3, protoModule.wireTypes.lengthDelimited)
		var3512, var5124 = protoModule.writeString(var3512, var3513, self.message_id)
		buff = var3512
		var3507 = var3513
	end
	if self.title ~= nil and self.title ~= "" then
		local var3514, var3515 = protoModule.writeTag(buff, var3507, 4, protoModule.wireTypes.lengthDelimited)
		var3514, var5126 = protoModule.writeString(var3514, var3515, self.title)
		buff = var3514
		var3507 = var3515
	end
	if self.body ~= nil and self.body ~= "" then
		local var3516, var3517 = protoModule.writeTag(buff, var3507, 5, protoModule.wireTypes.lengthDelimited)
		var3516, var5128 = protoModule.writeString(var3516, var3517, self.body)
		buff = var3516
		var3507 = var3517
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3518, var3519 = protoModule.writeTag(buff, var3507, 6, protoModule.wireTypes.lengthDelimited)
		var3518, var5130 = protoModule.writeString(var3518, var3519, self.creator_key)
		buff = var3518
		var3507 = var3519
	end
	if self.creator_role_name ~= nil then
		local var3520, var3521 = protoModule.writeTag(buff, var3507, 7, protoModule.wireTypes.lengthDelimited)
		var3520, var5132 = protoModule.writeString(var3520, var3521, self.creator_role_name)
		buff = var3520
		var3507 = var3521
	end
	if self.media_asset_id ~= nil then
		local var3522, var3523 = protoModule.writeTag(buff, var3507, 8, protoModule.wireTypes.lengthDelimited)
		var3522, var5134 = protoModule.writeString(var3522, var3523, self.media_asset_id)
		buff = var3522
		var3507 = var3523
	end
	if self.created_time ~= nil then
		local var3524 = self.created_time:encode()
		local var3525, var3526 = protoModule.writeTag(buff, var3507, 9, protoModule.wireTypes.lengthDelimited)
		var3525, var5137 = protoModule.writeBuffer(var3525, var3526, var3524, buffer.len(var3524))
		buff = var3525
		var3507 = var3526
	end
	local buff_1 = buffer.create(var3507)
	buffer.copy(buff_1, 0, buff, 0, var3507)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref), timestampModule (ref)
	local var3507 = t_131.new()
	local var3508 = 0
	while var3508 < buffer.len(p131) do
		local _ = nil
		local var3509 = nil
		local var3510, var3511, var3512 = protoModule.readTag(p131, var3508)
		local var3513 = var3510
		var3509 = var3511
		var3508 = var3512
		
		if var3509 == protoModule.wireTypes.varint then
			local _ = nil
			local var3514, var3515 = protoModule.readVarInt(p131, var3508)
			local _ = var3514
			var3508 = var3515
			continue
		end
		if var3509 == protoModule.wireTypes.lengthDelimited then
			if var3513 == 1 then
				local _ = nil
				local var3516, var3517 = protoModule.readBuffer(p131, var3508)
				var3508 = var3517
				var3507.community_id = buffer.tostring(var3516)
			elseif var3513 == 2 then
				local _ = nil
				local var3518, var3519 = protoModule.readBuffer(p131, var3508)
				var3508 = var3519
				var3507.announcement_id = buffer.tostring(var3518)
			elseif var3513 == 3 then
				local _ = nil
				local var3520, var3521 = protoModule.readBuffer(p131, var3508)
				var3508 = var3521
				var3507.message_id = buffer.tostring(var3520)
			elseif var3513 == 4 then
				local _ = nil
				local var3522, var3523 = protoModule.readBuffer(p131, var3508)
				var3508 = var3523
				var3507.title = buffer.tostring(var3522)
			elseif var3513 == 5 then
				local _ = nil
				local var3524, var3525 = protoModule.readBuffer(p131, var3508)
				var3508 = var3525
				var3507.body = buffer.tostring(var3524)
			elseif var3513 == 6 then
				local _ = nil
				local var3526, var3527 = protoModule.readBuffer(p131, var3508)
				var3508 = var3527
				var3507.creator_key = buffer.tostring(var3526)
			elseif var3513 == 7 then
				local _ = nil
				local var3528, var3529 = protoModule.readBuffer(p131, var3508)
				var3508 = var3529
				var3507.creator_role_name = buffer.tostring(var3528)
			elseif var3513 == 8 then
				local _ = nil
				local var3530, var3531 = protoModule.readBuffer(p131, var3508)
				var3508 = var3531
				var3507.media_asset_id = buffer.tostring(var3530)
			elseif var3513 == 9 then
				local _ = nil
				local var3532, var3533 = protoModule.readBuffer(p131, var3508)
				var3508 = var3533
				var3507.created_time = timestampModule.Timestamp.decode(var3532)
			else
				local _ = nil
				local var3534, var3535 = protoModule.readVarInt(p131, var3508)
				var3508 = var3535 + var3534
			end
		elseif var3509 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3536, var3537 = protoModule.readFixed32(p131, var3508)
			local _ = var3536
			var3508 = var3537
		elseif var3509 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3538, var3539 = protoModule.readFixed64(p131, var3508)
			local _ = var3538
			var3508 = var3539
		else
			error("Unsupported wire type: " .. var5141)
		end
	end
	return var3507
end

function t_131:jsonEncode()
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

function t_131:jsonDecode()
	-- upvalues: t_131 (ref), timestampModule (ref)
	local var3540 = t_131.new()
	
	if self.community_id ~= nil then
		var3540.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3540.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3540.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3540.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3540.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3540.message_id = self.messageId
	end
	if self.title ~= nil then
		var3540.title = self.title
	end
	if self.body ~= nil then
		var3540.body = self.body
	end
	if self.creator_key ~= nil then
		var3540.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3540.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3540.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3540.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3540.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3540.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3540.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3540.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3540
end

t_131.descriptor = {
	name = "CommunityAnnouncementInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunityAnnouncementInputData"
}
t.CommunityAnnouncementInputData = t_131
typeRegistryModule.default:register(t.CommunityAnnouncementInputData)
t.PageEntryFormat = {
	fromNumber = function(p132)
		return if p132 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p132 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p132)
		return if p132 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p132 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p132
	end,
	fromName = function(p132)
		return if p132 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p132 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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
	CommunityAnnouncementInputData = t.CommunityAnnouncementInputData,
	PageEntryFormat = t.PageEntryFormat
}