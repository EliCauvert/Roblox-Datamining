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
		creator_key = if p41 == nil or p41.creator_key == nil then "" else p41.creator_key,
		pill_tabs = if p41 == nil or p41.pill_tabs == nil then nil else p41.pill_tabs
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
	if self.pill_tabs ~= nil then
		local var1227 = self.pill_tabs:encode()
		local var1228, var1229 = protoModule.writeTag(buff, var1213, 5, protoModule.wireTypes.lengthDelimited)
		var1228, var1916 = protoModule.writeBuffer(var1228, var1229, var1227, buffer.len(var1227))
		buff = var1228
		var1213 = var1229
	end
	local buff_1 = buffer.create(var1213)
	buffer.copy(buff_1, 0, buff, 0, var1213)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1230 = t_41.new()
	local var1231 = 0
	while var1231 < buffer.len(p41) do
		local _ = nil
		local var1232 = nil
		local var1233, var1234, var1235 = protoModule.readTag(p41, var1231)
		local var1236 = var1233
		var1232 = var1234
		var1231 = var1235
		
		if var1232 == protoModule.wireTypes.varint then
			local _ = nil
			local var1237, var1238 = protoModule.readVarInt(p41, var1231)
			local _ = var1237
			var1231 = var1238
			continue
		end
		if var1232 == protoModule.wireTypes.lengthDelimited then
			if var1236 == 1 then
				local _ = nil
				local var1239, var1240 = protoModule.readBuffer(p41, var1231)
				var1231 = var1240
				var1230.universe_id = buffer.tostring(var1239)
			elseif var1236 == 2 then
				local _ = nil
				local var1241, var1242 = protoModule.readBuffer(p41, var1231)
				var1231 = var1242
				var1241 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1241)
				var1230.entry_map[var1241.key or ""] = var1241.value or t.FeedEntry.new()
			elseif var1236 == 3 then
				local _ = nil
				local var1243, var1244 = protoModule.readBuffer(p41, var1231)
				var1231 = var1244
				table.insert(var1230.entry_order, buffer.tostring(var1243))
			elseif var1236 == 4 then
				local _ = nil
				local var1245, var1246 = protoModule.readBuffer(p41, var1231)
				var1231 = var1246
				var1230.creator_key = buffer.tostring(var1245)
			elseif var1236 == 5 then
				local _ = nil
				local var1247, var1248 = protoModule.readBuffer(p41, var1231)
				var1231 = var1248
				var1230.pill_tabs = t.PillTabsInputData.decode(var1247)
			else
				local _ = nil
				local var1249, var1250 = protoModule.readVarInt(p41, var1231)
				var1231 = var1250 + var1249
			end
		elseif var1232 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1251, var1252 = protoModule.readFixed32(p41, var1231)
			local _ = var1251
			var1231 = var1252
		elseif var1232 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1253, var1254 = protoModule.readFixed64(p41, var1231)
			local _ = var1253
			var1231 = var1254
		else
			error("Unsupported wire type: " .. var1920)
		end
	end
	return var1230
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
	local var1255 = t_41.new()
	
	if self.universe_id ~= nil then
		var1255.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1255.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1255.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1255.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1255.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1255.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1255.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1255.creator_key = self.creatorKey
	end
	if self.pill_tabs ~= nil then
		var1255.pill_tabs = t.PillTabsInputData.jsonDecode(self.pill_tabs)
	end
	if self.pillTabs ~= nil then
		var1255.pill_tabs = t.PillTabsInputData.jsonDecode(self.pillTabs)
	end
	return var1255
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
	local var1256 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1257, var1258 = protoModule.writeTag(buff, var1256, 1, protoModule.wireTypes.lengthDelimited)
		var1257, var1954 = protoModule.writeString(var1257, var1258, self.key)
		buff = var1257
		var1256 = var1258
	end
	if self.value ~= nil then
		local var1259 = self.value:encode()
		local var1260, var1261 = protoModule.writeTag(buff, var1256, 2, protoModule.wireTypes.lengthDelimited)
		var1260, var1957 = protoModule.writeBuffer(var1260, var1261, var1259, buffer.len(var1259))
		buff = var1260
		var1256 = var1261
	end
	local buff_1 = buffer.create(var1256)
	buffer.copy(buff_1, 0, buff, 0, var1256)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1256 = t_42.new()
	local var1257 = 0
	while var1257 < buffer.len(p42) do
		local _ = nil
		local var1258 = nil
		local var1259, var1260, var1261 = protoModule.readTag(p42, var1257)
		local var1262 = var1259
		var1258 = var1260
		var1257 = var1261
		
		if var1258 == protoModule.wireTypes.varint then
			local _ = nil
			local var1263, var1264 = protoModule.readVarInt(p42, var1257)
			local _ = var1263
			var1257 = var1264
			continue
		end
		if var1258 == protoModule.wireTypes.lengthDelimited then
			if var1262 == 1 then
				local _ = nil
				local var1265, var1266 = protoModule.readBuffer(p42, var1257)
				var1257 = var1266
				var1256.key = buffer.tostring(var1265)
			elseif var1262 == 2 then
				local _ = nil
				local var1267, var1268 = protoModule.readBuffer(p42, var1257)
				var1257 = var1268
				var1256.value = t.FeedEntry.decode(var1267)
			else
				local _ = nil
				local var1269, var1270 = protoModule.readVarInt(p42, var1257)
				var1257 = var1270 + var1269
			end
		elseif var1258 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1271, var1272 = protoModule.readFixed32(p42, var1257)
			local _ = var1271
			var1257 = var1272
		elseif var1258 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1273, var1274 = protoModule.readFixed64(p42, var1257)
			local _ = var1273
			var1257 = var1274
		else
			error("Unsupported wire type: " .. var1961)
		end
	end
	return var1256
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
	local var1275 = t_42.new()
	
	if self.key ~= nil then
		var1275.key = self.key
	end
	if self.value ~= nil then
		var1275.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1275
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
	local var1275 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1276 = v:encode()
			local var1277, var1278 = protoModule.writeTag(buff, var1275, 1, protoModule.wireTypes.lengthDelimited)
			var1277, var1984 = protoModule.writeBuffer(var1277, var1278, var1276, buffer.len(var1276))
			buff = var1277
			var1275 = var1278
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var1279, var1280 = protoModule.writeTag(buff, var1275, 2, protoModule.wireTypes.lengthDelimited)
		var1279, var1986 = protoModule.writeString(var1279, var1280, self.default_option_id)
		buff = var1279
		var1275 = var1280
	end
	local buff_1 = buffer.create(var1275)
	buffer.copy(buff_1, 0, buff, 0, var1275)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1281 = t_43.new()
	local var1282 = 0
	while var1282 < buffer.len(p43) do
		local _ = nil
		local var1283 = nil
		local var1284, var1285, var1286 = protoModule.readTag(p43, var1282)
		local var1287 = var1284
		var1283 = var1285
		var1282 = var1286
		
		if var1283 == protoModule.wireTypes.varint then
			local _ = nil
			local var1288, var1289 = protoModule.readVarInt(p43, var1282)
			local _ = var1288
			var1282 = var1289
			continue
		end
		if var1283 == protoModule.wireTypes.lengthDelimited then
			if var1287 == 1 then
				local _ = nil
				local var1290, var1291 = protoModule.readBuffer(p43, var1282)
				var1282 = var1291
				table.insert(var1281.options, t.PillTabsInputData_PillTabOption.decode(var1290))
			elseif var1287 == 2 then
				local _ = nil
				local var1292, var1293 = protoModule.readBuffer(p43, var1282)
				var1282 = var1293
				var1281.default_option_id = buffer.tostring(var1292)
			else
				local _ = nil
				local var1294, var1295 = protoModule.readVarInt(p43, var1282)
				var1282 = var1295 + var1294
			end
		elseif var1283 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1296, var1297 = protoModule.readFixed32(p43, var1282)
			local _ = var1296
			var1282 = var1297
		elseif var1283 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1298, var1299 = protoModule.readFixed64(p43, var1282)
			local _ = var1298
			var1282 = var1299
		else
			error("Unsupported wire type: " .. var1990)
		end
	end
	return var1281
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
	local var1300 = t_43.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.PillTabsInputData_PillTabOption.jsonDecode(v))
		end
		var1300.options = t_1
	end
	if self.default_option_id ~= nil then
		var1300.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1300.default_option_id = self.defaultOptionId
	end
	return var1300
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
	local var1301 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var1302, var1303 = protoModule.writeTag(buff, var1301, 1, protoModule.wireTypes.lengthDelimited)
		var1302, var2014 = protoModule.writeString(var1302, var1303, self.option_id)
		buff = var1302
		var1301 = var1303
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var1304, var1305 = protoModule.writeTag(buff, var1301, 2, protoModule.wireTypes.lengthDelimited)
		var1304, var2016 = protoModule.writeString(var1304, var1305, self.display_name)
		buff = var1304
		var1301 = var1305
	end
	local buff_1 = buffer.create(var1301)
	buffer.copy(buff_1, 0, buff, 0, var1301)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1301 = t_44.new()
	local var1302 = 0
	while var1302 < buffer.len(p44) do
		local _ = nil
		local var1303 = nil
		local var1304, var1305, var1306 = protoModule.readTag(p44, var1302)
		local var1307 = var1304
		var1303 = var1305
		var1302 = var1306
		
		if var1303 == protoModule.wireTypes.varint then
			local _ = nil
			local var1308, var1309 = protoModule.readVarInt(p44, var1302)
			local _ = var1308
			var1302 = var1309
			continue
		end
		if var1303 == protoModule.wireTypes.lengthDelimited then
			if var1307 == 1 then
				local _ = nil
				local var1310, var1311 = protoModule.readBuffer(p44, var1302)
				var1302 = var1311
				var1301.option_id = buffer.tostring(var1310)
			elseif var1307 == 2 then
				local _ = nil
				local var1312, var1313 = protoModule.readBuffer(p44, var1302)
				var1302 = var1313
				var1301.display_name = buffer.tostring(var1312)
			else
				local _ = nil
				local var1314, var1315 = protoModule.readVarInt(p44, var1302)
				var1302 = var1315 + var1314
			end
		elseif var1303 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1316, var1317 = protoModule.readFixed32(p44, var1302)
			local _ = var1316
			var1302 = var1317
		elseif var1303 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1318, var1319 = protoModule.readFixed64(p44, var1302)
			local _ = var1318
			var1302 = var1319
		else
			error("Unsupported wire type: " .. var2020)
		end
	end
	return var1301
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
	local var1320 = t_44.new()
	
	if self.option_id ~= nil then
		var1320.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1320.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1320.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1320.display_name = self.displayName
	end
	return var1320
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
	local var1320 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1321 = v:encode()
			local var1322, var1323 = protoModule.writeTag(buff, var1320, 1, protoModule.wireTypes.lengthDelimited)
			var1322, var2043 = protoModule.writeBuffer(var1322, var1323, var1321, buffer.len(var1321))
			buff = var1322
			var1320 = var1323
		end
	end
	local buff_1 = buffer.create(var1320)
	buffer.copy(buff_1, 0, buff, 0, var1320)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1324 = t_45.new()
	local var1325 = 0
	while var1325 < buffer.len(p45) do
		local _ = nil
		local var1326 = nil
		local var1327, var1328, var1329 = protoModule.readTag(p45, var1325)
		local var1330 = var1327
		var1326 = var1328
		var1325 = var1329
		
		if var1326 == protoModule.wireTypes.varint then
			local _ = nil
			local var1331, var1332 = protoModule.readVarInt(p45, var1325)
			local _ = var1331
			var1325 = var1332
			continue
		end
		if var1326 == protoModule.wireTypes.lengthDelimited then
			if var1330 == 1 then
				local _ = nil
				local var1333, var1334 = protoModule.readBuffer(p45, var1325)
				var1325 = var1334
				table.insert(var1324.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1333))
			else
				local _ = nil
				local var1335, var1336 = protoModule.readVarInt(p45, var1325)
				var1325 = var1336 + var1335
			end
		elseif var1326 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1337, var1338 = protoModule.readFixed32(p45, var1325)
			local _ = var1337
			var1325 = var1338
		elseif var1326 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1339, var1340 = protoModule.readFixed64(p45, var1325)
			local _ = var1339
			var1325 = var1340
		else
			error("Unsupported wire type: " .. var2047)
		end
	end
	return var1324
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
	local var1341 = t_45.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1341.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1341.game_passes = t_1
	end
	return var1341
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
	local var1342 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1343, var1344 = protoModule.writeTag(buff, var1342, 1, protoModule.wireTypes.lengthDelimited)
		var1343, var2070 = protoModule.writeString(var1343, var1344, self.game_pass_id)
		buff = var1343
		var1342 = var1344
	end
	local buff_1 = buffer.create(var1342)
	buffer.copy(buff_1, 0, buff, 0, var1342)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1342 = t_46.new()
	local var1343 = 0
	while var1343 < buffer.len(p46) do
		local _ = nil
		local var1344 = nil
		local var1345, var1346, var1347 = protoModule.readTag(p46, var1343)
		local var1348 = var1345
		var1344 = var1346
		var1343 = var1347
		
		if var1344 == protoModule.wireTypes.varint then
			local _ = nil
			local var1349, var1350 = protoModule.readVarInt(p46, var1343)
			local _ = var1349
			var1343 = var1350
			continue
		end
		if var1344 == protoModule.wireTypes.lengthDelimited then
			if var1348 == 1 then
				local _ = nil
				local var1351, var1352 = protoModule.readBuffer(p46, var1343)
				var1343 = var1352
				var1342.game_pass_id = buffer.tostring(var1351)
			else
				local _ = nil
				local var1353, var1354 = protoModule.readVarInt(p46, var1343)
				var1343 = var1354 + var1353
			end
		elseif var1344 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1355, var1356 = protoModule.readFixed32(p46, var1343)
			local _ = var1355
			var1343 = var1356
		elseif var1344 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1357, var1358 = protoModule.readFixed64(p46, var1343)
			local _ = var1357
			var1343 = var1358
		else
			error("Unsupported wire type: " .. var2074)
		end
	end
	return var1342
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
	local var1359 = t_46.new()
	
	if self.game_pass_id ~= nil then
		var1359.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1359.game_pass_id = self.gamePassId
	end
	return var1359
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
	local var1359 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1360 = v:encode()
			local var1361, var1362 = protoModule.writeTag(buff, var1359, 1, protoModule.wireTypes.lengthDelimited)
			var1361, var2095 = protoModule.writeBuffer(var1361, var1362, var1360, buffer.len(var1360))
			buff = var1361
			var1359 = var1362
		end
	end
	local buff_1 = buffer.create(var1359)
	buffer.copy(buff_1, 0, buff, 0, var1359)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1363 = t_47.new()
	local var1364 = 0
	while var1364 < buffer.len(p47) do
		local _ = nil
		local var1365 = nil
		local var1366, var1367, var1368 = protoModule.readTag(p47, var1364)
		local var1369 = var1366
		var1365 = var1367
		var1364 = var1368
		
		if var1365 == protoModule.wireTypes.varint then
			local _ = nil
			local var1370, var1371 = protoModule.readVarInt(p47, var1364)
			local _ = var1370
			var1364 = var1371
			continue
		end
		if var1365 == protoModule.wireTypes.lengthDelimited then
			if var1369 == 1 then
				local _ = nil
				local var1372, var1373 = protoModule.readBuffer(p47, var1364)
				var1364 = var1373
				table.insert(var1363.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1372))
			else
				local _ = nil
				local var1374, var1375 = protoModule.readVarInt(p47, var1364)
				var1364 = var1375 + var1374
			end
		elseif var1365 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1376, var1377 = protoModule.readFixed32(p47, var1364)
			local _ = var1376
			var1364 = var1377
		elseif var1365 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1378, var1379 = protoModule.readFixed64(p47, var1364)
			local _ = var1378
			var1364 = var1379
		else
			error("Unsupported wire type: " .. var2099)
		end
	end
	return var1363
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
	local var1380 = t_47.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1380.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1380.developer_products = t_1
	end
	return var1380
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
	local var1381 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1382, var1383 = protoModule.writeTag(buff, var1381, 1, protoModule.wireTypes.lengthDelimited)
		var1382, var2122 = protoModule.writeString(var1382, var1383, self.developer_product_id)
		buff = var1382
		var1381 = var1383
	end
	local buff_1 = buffer.create(var1381)
	buffer.copy(buff_1, 0, buff, 0, var1381)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1381 = t_48.new()
	local var1382 = 0
	while var1382 < buffer.len(p48) do
		local _ = nil
		local var1383 = nil
		local var1384, var1385, var1386 = protoModule.readTag(p48, var1382)
		local var1387 = var1384
		var1383 = var1385
		var1382 = var1386
		
		if var1383 == protoModule.wireTypes.varint then
			local _ = nil
			local var1388, var1389 = protoModule.readVarInt(p48, var1382)
			local _ = var1388
			var1382 = var1389
			continue
		end
		if var1383 == protoModule.wireTypes.lengthDelimited then
			if var1387 == 1 then
				local _ = nil
				local var1390, var1391 = protoModule.readBuffer(p48, var1382)
				var1382 = var1391
				var1381.developer_product_id = buffer.tostring(var1390)
			else
				local _ = nil
				local var1392, var1393 = protoModule.readVarInt(p48, var1382)
				var1382 = var1393 + var1392
			end
		elseif var1383 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1394, var1395 = protoModule.readFixed32(p48, var1382)
			local _ = var1394
			var1382 = var1395
		elseif var1383 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1396, var1397 = protoModule.readFixed64(p48, var1382)
			local _ = var1396
			var1382 = var1397
		else
			error("Unsupported wire type: " .. var2126)
		end
	end
	return var1381
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
	local var1398 = t_48.new()
	
	if self.developer_product_id ~= nil then
		var1398.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1398.developer_product_id = self.developerProductId
	end
	return var1398
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
	local var1398 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1399 = v:encode()
			local var1400, var1401 = protoModule.writeTag(buff, var1398, 1, protoModule.wireTypes.lengthDelimited)
			var1400, var2147 = protoModule.writeBuffer(var1400, var1401, var1399, buffer.len(var1399))
			buff = var1400
			var1398 = var1401
		end
	end
	local buff_1 = buffer.create(var1398)
	buffer.copy(buff_1, 0, buff, 0, var1398)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1402 = t_49.new()
	local var1403 = 0
	while var1403 < buffer.len(p49) do
		local _ = nil
		local var1404 = nil
		local var1405, var1406, var1407 = protoModule.readTag(p49, var1403)
		local var1408 = var1405
		var1404 = var1406
		var1403 = var1407
		
		if var1404 == protoModule.wireTypes.varint then
			local _ = nil
			local var1409, var1410 = protoModule.readVarInt(p49, var1403)
			local _ = var1409
			var1403 = var1410
			continue
		end
		if var1404 == protoModule.wireTypes.lengthDelimited then
			if var1408 == 1 then
				local _ = nil
				local var1411, var1412 = protoModule.readBuffer(p49, var1403)
				var1403 = var1412
				table.insert(var1402.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1411))
			else
				local _ = nil
				local var1413, var1414 = protoModule.readVarInt(p49, var1403)
				var1403 = var1414 + var1413
			end
		elseif var1404 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1415, var1416 = protoModule.readFixed32(p49, var1403)
			local _ = var1415
			var1403 = var1416
		elseif var1404 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1417, var1418 = protoModule.readFixed64(p49, var1403)
			local _ = var1417
			var1403 = var1418
		else
			error("Unsupported wire type: " .. var2151)
		end
	end
	return var1402
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
	local var1419 = t_49.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1419.subscriptions = t_1
	end
	return var1419
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
	local var1420 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1421, var1422 = protoModule.writeTag(buff, var1420, 1, protoModule.wireTypes.lengthDelimited)
		var1421, var2173 = protoModule.writeString(var1421, var1422, self.subscription_id)
		buff = var1421
		var1420 = var1422
	end
	local buff_1 = buffer.create(var1420)
	buffer.copy(buff_1, 0, buff, 0, var1420)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref)
	local var1420 = t_50.new()
	local var1421 = 0
	while var1421 < buffer.len(p50) do
		local _ = nil
		local var1422 = nil
		local var1423, var1424, var1425 = protoModule.readTag(p50, var1421)
		local var1426 = var1423
		var1422 = var1424
		var1421 = var1425
		
		if var1422 == protoModule.wireTypes.varint then
			local _ = nil
			local var1427, var1428 = protoModule.readVarInt(p50, var1421)
			local _ = var1427
			var1421 = var1428
			continue
		end
		if var1422 == protoModule.wireTypes.lengthDelimited then
			if var1426 == 1 then
				local _ = nil
				local var1429, var1430 = protoModule.readBuffer(p50, var1421)
				var1421 = var1430
				var1420.subscription_id = buffer.tostring(var1429)
			else
				local _ = nil
				local var1431, var1432 = protoModule.readVarInt(p50, var1421)
				var1421 = var1432 + var1431
			end
		elseif var1422 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1433, var1434 = protoModule.readFixed32(p50, var1421)
			local _ = var1433
			var1421 = var1434
		elseif var1422 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1435, var1436 = protoModule.readFixed64(p50, var1421)
			local _ = var1435
			var1421 = var1436
		else
			error("Unsupported wire type: " .. var2177)
		end
	end
	return var1420
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
	local var1437 = t_50.new()
	
	if self.subscription_id ~= nil then
		var1437.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1437.subscription_id = self.subscriptionId
	end
	return var1437
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
	local var1437 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1438 = v:encode()
			local var1439, var1440 = protoModule.writeTag(buff, var1437, 1, protoModule.wireTypes.lengthDelimited)
			var1439, var2198 = protoModule.writeBuffer(var1439, var1440, var1438, buffer.len(var1438))
			buff = var1439
			var1437 = var1440
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1441, var1442 = protoModule.writeTag(buff, var1437, 2, protoModule.wireTypes.lengthDelimited)
		var1441, var2200 = protoModule.writeString(var1441, var1442, self.universe_id)
		buff = var1441
		var1437 = var1442
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1443, var1444 = protoModule.writeTag(buff, var1437, 3, protoModule.wireTypes.lengthDelimited)
		var1443, var2202 = protoModule.writeString(var1443, var1444, self.section_title)
		buff = var1443
		var1437 = var1444
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1445, var1446 = protoModule.writeTag(buff, var1437, 4, protoModule.wireTypes.lengthDelimited)
		var1445, var2204 = protoModule.writeString(var1445, var1446, self.creator_key)
		buff = var1445
		var1437 = var1446
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1447, var1448 = protoModule.writeTag(buff, var1437, 5, protoModule.wireTypes.lengthDelimited)
		var1447, var2206 = protoModule.writeString(var1447, var1448, self.collection_item_size)
		buff = var1447
		var1437 = var1448
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1449, var1450 = protoModule.writeTag(buff, var1437, 6, protoModule.wireTypes.lengthDelimited)
		var1449, var2208 = protoModule.writeString(var1449, var1450, self.item_height_mode)
		buff = var1449
		var1437 = var1450
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1451, var1452 = protoModule.writeTag(buff, var1437, 7, protoModule.wireTypes.lengthDelimited)
		var1451, var2210 = protoModule.writeString(var1451, var1452, self.experience_store_product_type)
		buff = var1451
		var1437 = var1452
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1453, var1454 = protoModule.writeTag(buff, var1437, 8, protoModule.wireTypes.lengthDelimited)
		var1453, var2212 = protoModule.writeString(var1453, var1454, self.content_type)
		buff = var1453
		var1437 = var1454
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1455, var1456 = protoModule.writeTag(buff, var1437, 9, protoModule.wireTypes.lengthDelimited)
		var1455, var2214 = protoModule.writeString(var1455, var1456, self.item_type)
		buff = var1455
		var1437 = var1456
	end
	if self.filter_category_id ~= nil and self.filter_category_id ~= "" then
		local var1457, var1458 = protoModule.writeTag(buff, var1437, 10, protoModule.wireTypes.lengthDelimited)
		var1457, var2216 = protoModule.writeString(var1457, var1458, self.filter_category_id)
		buff = var1457
		var1437 = var1458
	end
	local buff_1 = buffer.create(var1437)
	buffer.copy(buff_1, 0, buff, 0, var1437)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1459 = t_51.new()
	local var1460 = 0
	while var1460 < buffer.len(p51) do
		local _ = nil
		local var1461 = nil
		local var1462, var1463, var1464 = protoModule.readTag(p51, var1460)
		local var1465 = var1462
		var1461 = var1463
		var1460 = var1464
		
		if var1461 == protoModule.wireTypes.varint then
			local _ = nil
			local var1466, var1467 = protoModule.readVarInt(p51, var1460)
			local _ = var1466
			var1460 = var1467
			continue
		end
		if var1461 == protoModule.wireTypes.lengthDelimited then
			if var1465 == 1 then
				local _ = nil
				local var1468, var1469 = protoModule.readBuffer(p51, var1460)
				var1460 = var1469
				table.insert(var1459.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1468))
			elseif var1465 == 2 then
				local _ = nil
				local var1470, var1471 = protoModule.readBuffer(p51, var1460)
				var1460 = var1471
				var1459.universe_id = buffer.tostring(var1470)
			elseif var1465 == 3 then
				local _ = nil
				local var1472, var1473 = protoModule.readBuffer(p51, var1460)
				var1460 = var1473
				var1459.section_title = buffer.tostring(var1472)
			elseif var1465 == 4 then
				local _ = nil
				local var1474, var1475 = protoModule.readBuffer(p51, var1460)
				var1460 = var1475
				var1459.creator_key = buffer.tostring(var1474)
			elseif var1465 == 5 then
				local _ = nil
				local var1476, var1477 = protoModule.readBuffer(p51, var1460)
				var1460 = var1477
				var1459.collection_item_size = buffer.tostring(var1476)
			elseif var1465 == 6 then
				local _ = nil
				local var1478, var1479 = protoModule.readBuffer(p51, var1460)
				var1460 = var1479
				var1459.item_height_mode = buffer.tostring(var1478)
			elseif var1465 == 7 then
				local _ = nil
				local var1480, var1481 = protoModule.readBuffer(p51, var1460)
				var1460 = var1481
				var1459.experience_store_product_type = buffer.tostring(var1480)
			elseif var1465 == 8 then
				local _ = nil
				local var1482, var1483 = protoModule.readBuffer(p51, var1460)
				var1460 = var1483
				var1459.content_type = buffer.tostring(var1482)
			elseif var1465 == 9 then
				local _ = nil
				local var1484, var1485 = protoModule.readBuffer(p51, var1460)
				var1460 = var1485
				var1459.item_type = buffer.tostring(var1484)
			elseif var1465 == 10 then
				local _ = nil
				local var1486, var1487 = protoModule.readBuffer(p51, var1460)
				var1460 = var1487
				var1459.filter_category_id = buffer.tostring(var1486)
			else
				local _ = nil
				local var1488, var1489 = protoModule.readVarInt(p51, var1460)
				var1460 = var1489 + var1488
			end
		elseif var1461 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1490, var1491 = protoModule.readFixed32(p51, var1460)
			local _ = var1490
			var1460 = var1491
		elseif var1461 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1492, var1493 = protoModule.readFixed64(p51, var1460)
			local _ = var1492
			var1460 = var1493
		else
			error("Unsupported wire type: " .. var2220)
		end
	end
	return var1459
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
	local var1494 = t_51.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1494.items = t_1
	end
	if self.universe_id ~= nil then
		var1494.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1494.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1494.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1494.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1494.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1494.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1494.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1494.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1494.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1494.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1494.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1494.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1494.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1494.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1494.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1494.item_type = self.itemType
	end
	if self.filter_category_id ~= nil then
		var1494.filter_category_id = self.filter_category_id
	end
	if self.filterCategoryId ~= nil then
		var1494.filter_category_id = self.filterCategoryId
	end
	return var1494
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
	local var1495 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1496, var1497 = protoModule.writeTag(buff, var1495, 1, protoModule.wireTypes.lengthDelimited)
		var1496, var2260 = protoModule.writeString(var1496, var1497, self.item_id)
		buff = var1496
		var1495 = var1497
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1498, var1499 = protoModule.writeTag(buff, var1495, 2, protoModule.wireTypes.varint)
		var1498, var2262 = protoModule.writeVarInt(var1498, var1499, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1498
		var1495 = var1499
	end
	local buff_1 = buffer.create(var1495)
	buffer.copy(buff_1, 0, buff, 0, var1495)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1495 = t_52.new()
	local var1496 = 0
	while var1496 < buffer.len(p52) do
		local _ = nil
		local var1497 = nil
		local var1498, var1499, var1500 = protoModule.readTag(p52, var1496)
		local var1501 = var1498
		var1497 = var1499
		var1496 = var1500
		
		if var1497 == protoModule.wireTypes.varint then
			if var1501 == 2 then
				local _ = nil
				local var1502, var1503 = protoModule.readVarIntI32(p52, var1496)
				local var1504 = var1502
				var1496 = var1503
				var1495.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1504) or var1504
			else
				local _ = nil
				local var1505, var1506 = protoModule.readVarInt(p52, var1496)
				local _ = var1505
				var1496 = var1506
			end
		end
		if var1497 == protoModule.wireTypes.lengthDelimited then
			if var1501 == 1 then
				local _ = nil
				local var1507, var1508 = protoModule.readBuffer(p52, var1496)
				var1496 = var1508
				var1495.item_id = buffer.tostring(var1507)
			else
				local _ = nil
				local var1509, var1510 = protoModule.readVarInt(p52, var1496)
				var1496 = var1510 + var1509
			end
		elseif var1497 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1511, var1512 = protoModule.readFixed32(p52, var1496)
			local _ = var1511
			var1496 = var1512
		elseif var1497 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1513, var1514 = protoModule.readFixed64(p52, var1496)
			local _ = var1513
			var1496 = var1514
		else
			error("Unsupported wire type: " .. var2266)
		end
	end
	return var1495
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
	local var1515 = t_52.new()
	
	if self.item_id ~= nil then
		var1515.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1515.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1515.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1515
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
	local var1515 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1516, var1517 = protoModule.writeTag(buff, var1515, 1, protoModule.wireTypes.lengthDelimited)
		var1516, var2289 = protoModule.writeString(var1516, var1517, self.roblox_component)
		buff = var1516
		var1515 = var1517
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1518, var1519 = protoModule.writeTag(buff, var1515, 2, protoModule.wireTypes.lengthDelimited)
		var1518, var2291 = protoModule.writeString(var1518, var1519, self.identifier)
		buff = var1518
		var1515 = var1519
	end
	if self.title ~= nil and self.title ~= "" then
		local var1520, var1521 = protoModule.writeTag(buff, var1515, 3, protoModule.wireTypes.lengthDelimited)
		var1520, var2293 = protoModule.writeString(var1520, var1521, self.title)
		buff = var1520
		var1515 = var1521
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1522, var1523 = protoModule.writeTag(buff, var1515, 4, protoModule.wireTypes.lengthDelimited)
		var1522, var2295 = protoModule.writeString(var1522, var1523, self.user_id)
		buff = var1522
		var1515 = var1523
	end
	if self.description ~= nil and self.description ~= "" then
		local var1524, var1525 = protoModule.writeTag(buff, var1515, 5, protoModule.wireTypes.lengthDelimited)
		var1524, var2297 = protoModule.writeString(var1524, var1525, self.description)
		buff = var1524
		var1515 = var1525
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1526, var1527 = protoModule.writeTag(buff, var1515, 6, protoModule.wireTypes.lengthDelimited)
		var1526, var2299 = protoModule.writeString(var1526, var1527, self.cta_text)
		buff = var1526
		var1515 = var1527
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1528, var1529 = protoModule.writeTag(buff, var1515, 7, protoModule.wireTypes.lengthDelimited)
		var1528, var2301 = protoModule.writeString(var1528, var1529, self.prompt_id)
		buff = var1528
		var1515 = var1529
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1530, var1531 = protoModule.writeTag(buff, var1515, 8, protoModule.wireTypes.lengthDelimited)
		var1530, var2303 = protoModule.writeString(var1530, var1531, self.prompt_type)
		buff = var1530
		var1515 = var1531
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1532, var1533 = protoModule.writeTag(buff, var1515, 9, protoModule.wireTypes.lengthDelimited)
		var1532, var2305 = protoModule.writeString(var1532, var1533, self.entity_id)
		buff = var1532
		var1515 = var1533
	end
	local buff_1 = buffer.create(var1515)
	buffer.copy(buff_1, 0, buff, 0, var1515)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref)
	local var1515 = t_53.new()
	local var1516 = 0
	while var1516 < buffer.len(p53) do
		local _ = nil
		local var1517 = nil
		local var1518, var1519, var1520 = protoModule.readTag(p53, var1516)
		local var1521 = var1518
		var1517 = var1519
		var1516 = var1520
		
		if var1517 == protoModule.wireTypes.varint then
			local _ = nil
			local var1522, var1523 = protoModule.readVarInt(p53, var1516)
			local _ = var1522
			var1516 = var1523
			continue
		end
		if var1517 == protoModule.wireTypes.lengthDelimited then
			if var1521 == 1 then
				local _ = nil
				local var1524, var1525 = protoModule.readBuffer(p53, var1516)
				var1516 = var1525
				var1515.roblox_component = buffer.tostring(var1524)
			elseif var1521 == 2 then
				local _ = nil
				local var1526, var1527 = protoModule.readBuffer(p53, var1516)
				var1516 = var1527
				var1515.identifier = buffer.tostring(var1526)
			elseif var1521 == 3 then
				local _ = nil
				local var1528, var1529 = protoModule.readBuffer(p53, var1516)
				var1516 = var1529
				var1515.title = buffer.tostring(var1528)
			elseif var1521 == 4 then
				local _ = nil
				local var1530, var1531 = protoModule.readBuffer(p53, var1516)
				var1516 = var1531
				var1515.user_id = buffer.tostring(var1530)
			elseif var1521 == 5 then
				local _ = nil
				local var1532, var1533 = protoModule.readBuffer(p53, var1516)
				var1516 = var1533
				var1515.description = buffer.tostring(var1532)
			elseif var1521 == 6 then
				local _ = nil
				local var1534, var1535 = protoModule.readBuffer(p53, var1516)
				var1516 = var1535
				var1515.cta_text = buffer.tostring(var1534)
			elseif var1521 == 7 then
				local _ = nil
				local var1536, var1537 = protoModule.readBuffer(p53, var1516)
				var1516 = var1537
				var1515.prompt_id = buffer.tostring(var1536)
			elseif var1521 == 8 then
				local _ = nil
				local var1538, var1539 = protoModule.readBuffer(p53, var1516)
				var1516 = var1539
				var1515.prompt_type = buffer.tostring(var1538)
			elseif var1521 == 9 then
				local _ = nil
				local var1540, var1541 = protoModule.readBuffer(p53, var1516)
				var1516 = var1541
				var1515.entity_id = buffer.tostring(var1540)
			else
				local _ = nil
				local var1542, var1543 = protoModule.readVarInt(p53, var1516)
				var1516 = var1543 + var1542
			end
		elseif var1517 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1544, var1545 = protoModule.readFixed32(p53, var1516)
			local _ = var1544
			var1516 = var1545
		elseif var1517 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1546, var1547 = protoModule.readFixed64(p53, var1516)
			local _ = var1546
			var1516 = var1547
		else
			error("Unsupported wire type: " .. var2309)
		end
	end
	return var1515
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
	local var1548 = t_53.new()
	
	if self.roblox_component ~= nil then
		var1548.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1548.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1548.identifier = self.identifier
	end
	if self.title ~= nil then
		var1548.title = self.title
	end
	if self.user_id ~= nil then
		var1548.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1548.user_id = self.userId
	end
	if self.description ~= nil then
		var1548.description = self.description
	end
	if self.cta_text ~= nil then
		var1548.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1548.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1548.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1548.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1548.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1548.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1548.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1548.entity_id = self.entityId
	end
	return var1548
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
	local var1548 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1549, var1550 = protoModule.writeTag(buff, var1548, 1, protoModule.wireTypes.lengthDelimited)
		var1549, var2345 = protoModule.writeString(var1549, var1550, self.group_id)
		buff = var1549
		var1548 = var1550
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1551, var1552 = protoModule.writeTag(buff, var1548, 2, protoModule.wireTypes.lengthDelimited)
		var1551, var2347 = protoModule.writeString(var1551, var1552, self.experience_id)
		buff = var1551
		var1548 = var1552
	end
	local buff_1 = buffer.create(var1548)
	buffer.copy(buff_1, 0, buff, 0, var1548)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1548 = t_54.new()
	local var1549 = 0
	while var1549 < buffer.len(p54) do
		local _ = nil
		local var1550 = nil
		local var1551, var1552, var1553 = protoModule.readTag(p54, var1549)
		local var1554 = var1551
		var1550 = var1552
		var1549 = var1553
		
		if var1550 == protoModule.wireTypes.varint then
			local _ = nil
			local var1555, var1556 = protoModule.readVarInt(p54, var1549)
			local _ = var1555
			var1549 = var1556
			continue
		end
		if var1550 == protoModule.wireTypes.lengthDelimited then
			if var1554 == 1 then
				local _ = nil
				local var1557, var1558 = protoModule.readBuffer(p54, var1549)
				var1549 = var1558
				var1548.group_id = buffer.tostring(var1557)
			elseif var1554 == 2 then
				local _ = nil
				local var1559, var1560 = protoModule.readBuffer(p54, var1549)
				var1549 = var1560
				var1548.experience_id = buffer.tostring(var1559)
			else
				local _ = nil
				local var1561, var1562 = protoModule.readVarInt(p54, var1549)
				var1549 = var1562 + var1561
			end
		elseif var1550 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1563, var1564 = protoModule.readFixed32(p54, var1549)
			local _ = var1563
			var1549 = var1564
		elseif var1550 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1565, var1566 = protoModule.readFixed64(p54, var1549)
			local _ = var1565
			var1549 = var1566
		else
			error("Unsupported wire type: " .. var2351)
		end
	end
	return var1548
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
	local var1567 = t_54.new()
	
	if self.group_id ~= nil then
		var1567.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1567.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1567.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1567.experience_id = self.experienceId
	end
	return var1567
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
	local var1567 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1568, var1569 = protoModule.writeTag(buff, var1567, 1, protoModule.wireTypes.lengthDelimited)
		var1568, var2373 = protoModule.writeString(var1568, var1569, self.title)
		buff = var1568
		var1567 = var1569
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1570, var1571 = protoModule.writeTag(buff, var1567, 2, protoModule.wireTypes.lengthDelimited)
		var1570, var2375 = protoModule.writeString(var1570, var1571, self.dismiss_text)
		buff = var1570
		var1567 = var1571
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1572, var1573 = protoModule.writeTag(buff, var1567, 3, protoModule.wireTypes.lengthDelimited)
		var1572, var2377 = protoModule.writeString(var1572, var1573, self.user_id)
		buff = var1572
		var1567 = var1573
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1574 = v:encode()
			local var1575, var1576 = protoModule.writeTag(buff, var1567, 4, protoModule.wireTypes.lengthDelimited)
			var1575, var2380 = protoModule.writeBuffer(var1575, var1576, var1574, buffer.len(var1574))
			buff = var1575
			var1567 = var1576
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1577, var1578 = protoModule.writeTag(buff, var1567, 5, protoModule.wireTypes.lengthDelimited)
		var1577, var2382 = protoModule.writeString(var1577, var1578, self.prompt_id)
		buff = var1577
		var1567 = var1578
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1579, var1580 = protoModule.writeTag(buff, var1567, 6, protoModule.wireTypes.lengthDelimited)
		var1579, var2384 = protoModule.writeString(var1579, var1580, self.prompt_type)
		buff = var1579
		var1567 = var1580
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1581, var1582 = protoModule.writeTag(buff, var1567, 7, protoModule.wireTypes.lengthDelimited)
		var1581, var2386 = protoModule.writeString(var1581, var1582, self.sort_id)
		buff = var1581
		var1567 = var1582
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1583, var1584 = protoModule.writeTag(buff, var1567, 8, protoModule.wireTypes.lengthDelimited)
		var1583, var2388 = protoModule.writeString(var1583, var1584, self.feed_item_key)
		buff = var1583
		var1567 = var1584
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1585 = self.client_attributes.value:encode()
		local var1586, var1587 = protoModule.writeTag(buff, var1567, 9, protoModule.wireTypes.lengthDelimited)
		var1586, var2391 = protoModule.writeBuffer(var1586, var1587, var1585, buffer.len(var1585))
		buff = var1586
		var1567 = var1587
	end
	local buff_1 = buffer.create(var1567)
	buffer.copy(buff_1, 0, buff, 0, var1567)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref), t (ref)
	local var1588 = t_55.new()
	local var1589 = 0
	while var1589 < buffer.len(p55) do
		local _ = nil
		local var1590 = nil
		local var1591, var1592, var1593 = protoModule.readTag(p55, var1589)
		local var1594 = var1591
		var1590 = var1592
		var1589 = var1593
		
		if var1590 == protoModule.wireTypes.varint then
			local _ = nil
			local var1595, var1596 = protoModule.readVarInt(p55, var1589)
			local _ = var1595
			var1589 = var1596
			continue
		end
		if var1590 == protoModule.wireTypes.lengthDelimited then
			if var1594 == 1 then
				local _ = nil
				local var1597, var1598 = protoModule.readBuffer(p55, var1589)
				var1589 = var1598
				var1588.title = buffer.tostring(var1597)
			elseif var1594 == 2 then
				local _ = nil
				local var1599, var1600 = protoModule.readBuffer(p55, var1589)
				var1589 = var1600
				var1588.dismiss_text = buffer.tostring(var1599)
			elseif var1594 == 3 then
				local _ = nil
				local var1601, var1602 = protoModule.readBuffer(p55, var1589)
				var1589 = var1602
				var1588.user_id = buffer.tostring(var1601)
			elseif var1594 == 4 then
				local _ = nil
				local var1603, var1604 = protoModule.readBuffer(p55, var1589)
				var1589 = var1604
				table.insert(var1588.cards, t.CardContainerCardInputData.decode(var1603))
			elseif var1594 == 5 then
				local _ = nil
				local var1605, var1606 = protoModule.readBuffer(p55, var1589)
				var1589 = var1606
				var1588.prompt_id = buffer.tostring(var1605)
			elseif var1594 == 6 then
				local _ = nil
				local var1607, var1608 = protoModule.readBuffer(p55, var1589)
				var1589 = var1608
				var1588.prompt_type = buffer.tostring(var1607)
			elseif var1594 == 7 then
				local _ = nil
				local var1609, var1610 = protoModule.readBuffer(p55, var1589)
				var1589 = var1610
				var1588.sort_id = buffer.tostring(var1609)
			elseif var1594 == 8 then
				local _ = nil
				local var1611, var1612 = protoModule.readBuffer(p55, var1589)
				var1589 = var1612
				var1588.feed_item_key = buffer.tostring(var1611)
			elseif var1594 == 9 then
				local _ = nil
				local var1613, var1614 = protoModule.readBuffer(p55, var1589)
				var1589 = var1614
				var1588.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1613)
				}
			else
				local _ = nil
				local var1615, var1616 = protoModule.readVarInt(p55, var1589)
				var1589 = var1616 + var1615
			end
		elseif var1590 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1617, var1618 = protoModule.readFixed32(p55, var1589)
			local _ = var1617
			var1589 = var1618
		elseif var1590 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1619, var1620 = protoModule.readFixed64(p55, var1589)
			local _ = var1619
			var1589 = var1620
		else
			error("Unsupported wire type: " .. var2395)
		end
	end
	return var1588
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
	local var1621 = t_55.new()
	
	if self.title ~= nil then
		var1621.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1621.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1621.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1621.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1621.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1621.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1621.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1621.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1621.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1621.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1621.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1621.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1621.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1621.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1621.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1621.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1621
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
	local var1622 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1623, var1624 = protoModule.writeTag(buff, var1622, 1, protoModule.wireTypes.lengthDelimited)
		var1623, var2433 = protoModule.writeString(var1623, var1624, self.title)
		buff = var1623
		var1622 = var1624
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1625, var1626 = protoModule.writeTag(buff, var1622, 2, protoModule.wireTypes.lengthDelimited)
		var1625, var2435 = protoModule.writeString(var1625, var1626, self.user_id)
		buff = var1625
		var1622 = var1626
	end
	if self.description ~= nil and self.description ~= "" then
		local var1627, var1628 = protoModule.writeTag(buff, var1622, 3, protoModule.wireTypes.lengthDelimited)
		var1627, var2437 = protoModule.writeString(var1627, var1628, self.description)
		buff = var1627
		var1622 = var1628
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1629, var1630 = protoModule.writeTag(buff, var1622, 4, protoModule.wireTypes.lengthDelimited)
		var1629, var2439 = protoModule.writeString(var1629, var1630, self.cta_text)
		buff = var1629
		var1622 = var1630
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1631, var1632 = protoModule.writeTag(buff, var1622, 5, protoModule.wireTypes.lengthDelimited)
		var1631, var2441 = protoModule.writeString(var1631, var1632, self.prompt_id)
		buff = var1631
		var1622 = var1632
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1633, var1634 = protoModule.writeTag(buff, var1622, 6, protoModule.wireTypes.lengthDelimited)
		var1633, var2443 = protoModule.writeString(var1633, var1634, self.prompt_type)
		buff = var1633
		var1622 = var1634
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1635, var1636 = protoModule.writeTag(buff, var1622, 7, protoModule.wireTypes.lengthDelimited)
		var1635, var2445 = protoModule.writeString(var1635, var1636, self.entity_id)
		buff = var1635
		var1622 = var1636
	end
	local buff_1 = buffer.create(var1622)
	buffer.copy(buff_1, 0, buff, 0, var1622)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1622 = t_56.new()
	local var1623 = 0
	while var1623 < buffer.len(p56) do
		local _ = nil
		local var1624 = nil
		local var1625, var1626, var1627 = protoModule.readTag(p56, var1623)
		local var1628 = var1625
		var1624 = var1626
		var1623 = var1627
		
		if var1624 == protoModule.wireTypes.varint then
			local _ = nil
			local var1629, var1630 = protoModule.readVarInt(p56, var1623)
			local _ = var1629
			var1623 = var1630
			continue
		end
		if var1624 == protoModule.wireTypes.lengthDelimited then
			if var1628 == 1 then
				local _ = nil
				local var1631, var1632 = protoModule.readBuffer(p56, var1623)
				var1623 = var1632
				var1622.title = buffer.tostring(var1631)
			elseif var1628 == 2 then
				local _ = nil
				local var1633, var1634 = protoModule.readBuffer(p56, var1623)
				var1623 = var1634
				var1622.user_id = buffer.tostring(var1633)
			elseif var1628 == 3 then
				local _ = nil
				local var1635, var1636 = protoModule.readBuffer(p56, var1623)
				var1623 = var1636
				var1622.description = buffer.tostring(var1635)
			elseif var1628 == 4 then
				local _ = nil
				local var1637, var1638 = protoModule.readBuffer(p56, var1623)
				var1623 = var1638
				var1622.cta_text = buffer.tostring(var1637)
			elseif var1628 == 5 then
				local _ = nil
				local var1639, var1640 = protoModule.readBuffer(p56, var1623)
				var1623 = var1640
				var1622.prompt_id = buffer.tostring(var1639)
			elseif var1628 == 6 then
				local _ = nil
				local var1641, var1642 = protoModule.readBuffer(p56, var1623)
				var1623 = var1642
				var1622.prompt_type = buffer.tostring(var1641)
			elseif var1628 == 7 then
				local _ = nil
				local var1643, var1644 = protoModule.readBuffer(p56, var1623)
				var1623 = var1644
				var1622.entity_id = buffer.tostring(var1643)
			else
				local _ = nil
				local var1645, var1646 = protoModule.readVarInt(p56, var1623)
				var1623 = var1646 + var1645
			end
		elseif var1624 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1647, var1648 = protoModule.readFixed32(p56, var1623)
			local _ = var1647
			var1623 = var1648
		elseif var1624 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1649, var1650 = protoModule.readFixed64(p56, var1623)
			local _ = var1649
			var1623 = var1650
		else
			error("Unsupported wire type: " .. var2449)
		end
	end
	return var1622
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
	local var1651 = t_56.new()
	
	if self.title ~= nil then
		var1651.title = self.title
	end
	if self.user_id ~= nil then
		var1651.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1651.user_id = self.userId
	end
	if self.description ~= nil then
		var1651.description = self.description
	end
	if self.cta_text ~= nil then
		var1651.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1651.cta_text = self.ctaText
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
	if self.entity_id ~= nil then
		var1651.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1651.entity_id = self.entityId
	end
	return var1651
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
	local var1651 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1652, var1653 = protoModule.writeTag(buff, var1651, 1, protoModule.wireTypes.lengthDelimited)
		var1652, var2481 = protoModule.writeString(var1652, var1653, self.prompt_id)
		buff = var1652
		var1651 = var1653
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1654, var1655 = protoModule.writeTag(buff, var1651, 2, protoModule.wireTypes.lengthDelimited)
		var1654, var2483 = protoModule.writeString(var1654, var1655, self.prompt_type)
		buff = var1654
		var1651 = var1655
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1656, var1657 = protoModule.writeTag(buff, var1651, 3, protoModule.wireTypes.lengthDelimited)
		var1656, var2485 = protoModule.writeString(var1656, var1657, self.user_id)
		buff = var1656
		var1651 = var1657
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1658, var1659 = protoModule.writeTag(buff, var1651, 4, protoModule.wireTypes.lengthDelimited)
		var1658, var2487 = protoModule.writeString(var1658, var1659, self.audit_data)
		buff = var1658
		var1651 = var1659
	end
	local buff_1 = buffer.create(var1651)
	buffer.copy(buff_1, 0, buff, 0, var1651)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref)
	local var1651 = t_57.new()
	local var1652 = 0
	while var1652 < buffer.len(p57) do
		local _ = nil
		local var1653 = nil
		local var1654, var1655, var1656 = protoModule.readTag(p57, var1652)
		local var1657 = var1654
		var1653 = var1655
		var1652 = var1656
		
		if var1653 == protoModule.wireTypes.varint then
			local _ = nil
			local var1658, var1659 = protoModule.readVarInt(p57, var1652)
			local _ = var1658
			var1652 = var1659
			continue
		end
		if var1653 == protoModule.wireTypes.lengthDelimited then
			if var1657 == 1 then
				local _ = nil
				local var1660, var1661 = protoModule.readBuffer(p57, var1652)
				var1652 = var1661
				var1651.prompt_id = buffer.tostring(var1660)
			elseif var1657 == 2 then
				local _ = nil
				local var1662, var1663 = protoModule.readBuffer(p57, var1652)
				var1652 = var1663
				var1651.prompt_type = buffer.tostring(var1662)
			elseif var1657 == 3 then
				local _ = nil
				local var1664, var1665 = protoModule.readBuffer(p57, var1652)
				var1652 = var1665
				var1651.user_id = buffer.tostring(var1664)
			elseif var1657 == 4 then
				local _ = nil
				local var1666, var1667 = protoModule.readBuffer(p57, var1652)
				var1652 = var1667
				var1651.audit_data = buffer.tostring(var1666)
			else
				local _ = nil
				local var1668, var1669 = protoModule.readVarInt(p57, var1652)
				var1652 = var1669 + var1668
			end
		elseif var1653 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1670, var1671 = protoModule.readFixed32(p57, var1652)
			local _ = var1670
			var1652 = var1671
		elseif var1653 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1672, var1673 = protoModule.readFixed64(p57, var1652)
			local _ = var1672
			var1652 = var1673
		else
			error("Unsupported wire type: " .. var2491)
		end
	end
	return var1651
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
	local var1674 = t_57.new()
	
	if self.prompt_id ~= nil then
		var1674.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1674.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1674.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1674.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1674.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1674.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1674.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1674.audit_data = self.auditData
	end
	return var1674
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
	local var1674 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1675, var1676 = protoModule.writeTag(buff, var1674, 1, protoModule.wireTypes.varint)
		var1675, var2517 = protoModule.writeVarInt(var1675, var1676, self.sender_count)
		buff = var1675
		var1674 = var1676
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1677, var1678 = protoModule.writeTag(buff, var1674, 2, protoModule.wireTypes.varint)
		var1677, var2519 = protoModule.writeVarInt(var1677, var1678, self.total_robux_amount)
		buff = var1677
		var1674 = var1678
	end
	local buff_1 = buffer.create(var1674)
	buffer.copy(buff_1, 0, buff, 0, var1674)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1674 = t_58.new()
	local var1675 = 0
	while var1675 < buffer.len(p58) do
		local _ = nil
		local _ = nil
		local var1676, var1677, var1678 = protoModule.readTag(p58, var1675)
		local var1679 = var1676
		local var1680 = var1677
		var1675 = var1678
		
		if var1680 == protoModule.wireTypes.varint then
			if var1679 == 1 then
				local _ = nil
				local var1681, var1682 = protoModule.readVarIntI32(p58, var1675)
				var1675 = var1682
				var1674.sender_count = var1681
			elseif var1679 == 2 then
				local _ = nil
				local var1683, var1684 = protoModule.readVarIntI64(p58, var1675)
				var1675 = var1684
				var1674.total_robux_amount = var1683
			else
				local _ = nil
				local var1685, var1686 = protoModule.readVarInt(p58, var1675)
				local _ = var1685
				var1675 = var1686
			end
		elseif var1680 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1687, var1688 = protoModule.readVarInt(p58, var1675)
			var1675 = var1688 + var1687
		elseif var1680 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1689, var1690 = protoModule.readFixed32(p58, var1675)
			local _ = var1689
			var1675 = var1690
		elseif var1680 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1691, var1692 = protoModule.readFixed64(p58, var1675)
			local _ = var1691
			var1675 = var1692
		else
			error("Unsupported wire type: " .. var2527)
		end
	end
	return var1674
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
	local var1693 = t_58.new()
	
	if self.sender_count ~= nil then
		var1693.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1693.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1693.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1693.total_robux_amount = self.totalRobuxAmount
	end
	return var1693
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
	local var1693 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1694, var1695 = protoModule.writeTag(buff, var1693, 1, protoModule.wireTypes.lengthDelimited)
		var1694, var2545 = protoModule.writeString(var1694, var1695, self.title)
		buff = var1694
		var1693 = var1695
	end
	if self.description ~= nil and self.description ~= "" then
		local var1696, var1697 = protoModule.writeTag(buff, var1693, 2, protoModule.wireTypes.lengthDelimited)
		var1696, var2547 = protoModule.writeString(var1696, var1697, self.description)
		buff = var1696
		var1693 = var1697
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1698, var1699 = protoModule.writeTag(buff, var1693, 3, protoModule.wireTypes.lengthDelimited)
		var1698, var2549 = protoModule.writeString(var1698, var1699, self.primary_text)
		buff = var1698
		var1693 = var1699
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1700, var1701 = protoModule.writeTag(buff, var1693, 4, protoModule.wireTypes.lengthDelimited)
		var1700, var2551 = protoModule.writeString(var1700, var1701, self.secondary_text)
		buff = var1700
		var1693 = var1701
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1702, var1703 = protoModule.writeTag(buff, var1693, 5, protoModule.wireTypes.lengthDelimited)
		var1702, var2553 = protoModule.writeString(var1702, var1703, self.prompt_id)
		buff = var1702
		var1693 = var1703
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1704, var1705 = protoModule.writeTag(buff, var1693, 6, protoModule.wireTypes.lengthDelimited)
		var1704, var2555 = protoModule.writeString(var1704, var1705, self.prompt_type)
		buff = var1704
		var1693 = var1705
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1706, var1707 = protoModule.writeTag(buff, var1693, 7, protoModule.wireTypes.varint)
		var1706, var2557 = protoModule.writeVarInt(var1706, var1707, self.times_seen)
		buff = var1706
		var1693 = var1707
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1708 = self.content.value:encode()
		local var1709, var1710 = protoModule.writeTag(buff, var1693, 8, protoModule.wireTypes.lengthDelimited)
		var1709, var2560 = protoModule.writeBuffer(var1709, var1710, var1708, buffer.len(var1708))
		buff = var1709
		var1693 = var1710
	end
	if self.sort_id ~= nil then
		local var1711, var1712 = protoModule.writeTag(buff, var1693, 9, protoModule.wireTypes.lengthDelimited)
		var1711, var2562 = protoModule.writeString(var1711, var1712, self.sort_id)
		buff = var1711
		var1693 = var1712
	end
	local buff_1 = buffer.create(var1693)
	buffer.copy(buff_1, 0, buff, 0, var1693)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref), t (ref)
	local var1693 = t_59.new()
	local var1694 = 0
	while var1694 < buffer.len(p59) do
		local _ = nil
		local var1695 = nil
		local var1696, var1697, var1698 = protoModule.readTag(p59, var1694)
		local var1699 = var1696
		var1695 = var1697
		var1694 = var1698
		
		if var1695 == protoModule.wireTypes.varint then
			if var1699 == 7 then
				local _ = nil
				local var1700, var1701 = protoModule.readVarIntI32(p59, var1694)
				var1694 = var1701
				var1693.times_seen = var1700
			else
				local _ = nil
				local var1702, var1703 = protoModule.readVarInt(p59, var1694)
				local _ = var1702
				var1694 = var1703
			end
		end
		if var1695 == protoModule.wireTypes.lengthDelimited then
			if var1699 == 1 then
				local _ = nil
				local var1704, var1705 = protoModule.readBuffer(p59, var1694)
				var1694 = var1705
				var1693.title = buffer.tostring(var1704)
			elseif var1699 == 2 then
				local _ = nil
				local var1706, var1707 = protoModule.readBuffer(p59, var1694)
				var1694 = var1707
				var1693.description = buffer.tostring(var1706)
			elseif var1699 == 3 then
				local _ = nil
				local var1708, var1709 = protoModule.readBuffer(p59, var1694)
				var1694 = var1709
				var1693.primary_text = buffer.tostring(var1708)
			elseif var1699 == 4 then
				local _ = nil
				local var1710, var1711 = protoModule.readBuffer(p59, var1694)
				var1694 = var1711
				var1693.secondary_text = buffer.tostring(var1710)
			elseif var1699 == 5 then
				local _ = nil
				local var1712, var1713 = protoModule.readBuffer(p59, var1694)
				var1694 = var1713
				var1693.prompt_id = buffer.tostring(var1712)
			elseif var1699 == 6 then
				local _ = nil
				local var1714, var1715 = protoModule.readBuffer(p59, var1694)
				var1694 = var1715
				var1693.prompt_type = buffer.tostring(var1714)
			elseif var1699 == 8 then
				local _ = nil
				local var1716, var1717 = protoModule.readBuffer(p59, var1694)
				var1694 = var1717
				var1693.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1716)
				}
			elseif var1699 == 9 then
				local _ = nil
				local var1718, var1719 = protoModule.readBuffer(p59, var1694)
				var1694 = var1719
				var1693.sort_id = buffer.tostring(var1718)
			else
				local _ = nil
				local var1720, var1721 = protoModule.readVarInt(p59, var1694)
				var1694 = var1721 + var1720
			end
		elseif var1695 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1722, var1723 = protoModule.readFixed32(p59, var1694)
			local _ = var1722
			var1694 = var1723
		elseif var1695 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1724, var1725 = protoModule.readFixed64(p59, var1694)
			local _ = var1724
			var1694 = var1725
		else
			error("Unsupported wire type: " .. var2566)
		end
	end
	return var1693
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
	local var1726 = t_59.new()
	
	if self.title ~= nil then
		var1726.title = self.title
	end
	if self.description ~= nil then
		var1726.description = self.description
	end
	if self.primary_text ~= nil then
		var1726.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1726.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1726.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1726.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1726.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1726.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1726.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1726.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1726.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1726.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1726.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1726.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	if self.sort_id ~= nil then
		var1726.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1726.sort_id = self.sortId
	end
	return var1726
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
	local var1726 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1727, var1728 = protoModule.writeTag(buff, var1726, 1, protoModule.wireTypes.lengthDelimited)
		var1727, var2602 = protoModule.writeString(var1727, var1728, self.tooltip_text)
		buff = var1727
		var1726 = var1728
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1729, var1730 = protoModule.writeTag(buff, var1726, 2, protoModule.wireTypes.lengthDelimited)
		var1729, var2604 = protoModule.writeString(var1729, var1730, self.prompt_id)
		buff = var1729
		var1726 = var1730
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1731, var1732 = protoModule.writeTag(buff, var1726, 3, protoModule.wireTypes.lengthDelimited)
		var1731, var2606 = protoModule.writeString(var1731, var1732, self.prompt_type)
		buff = var1731
		var1726 = var1732
	end
	local buff_1 = buffer.create(var1726)
	buffer.copy(buff_1, 0, buff, 0, var1726)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1726 = t_60.new()
	local var1727 = 0
	while var1727 < buffer.len(p60) do
		local _ = nil
		local var1728 = nil
		local var1729, var1730, var1731 = protoModule.readTag(p60, var1727)
		local var1732 = var1729
		var1728 = var1730
		var1727 = var1731
		
		if var1728 == protoModule.wireTypes.varint then
			local _ = nil
			local var1733, var1734 = protoModule.readVarInt(p60, var1727)
			local _ = var1733
			var1727 = var1734
			continue
		end
		if var1728 == protoModule.wireTypes.lengthDelimited then
			if var1732 == 1 then
				local _ = nil
				local var1735, var1736 = protoModule.readBuffer(p60, var1727)
				var1727 = var1736
				var1726.tooltip_text = buffer.tostring(var1735)
			elseif var1732 == 2 then
				local _ = nil
				local var1737, var1738 = protoModule.readBuffer(p60, var1727)
				var1727 = var1738
				var1726.prompt_id = buffer.tostring(var1737)
			elseif var1732 == 3 then
				local _ = nil
				local var1739, var1740 = protoModule.readBuffer(p60, var1727)
				var1727 = var1740
				var1726.prompt_type = buffer.tostring(var1739)
			else
				local _ = nil
				local var1741, var1742 = protoModule.readVarInt(p60, var1727)
				var1727 = var1742 + var1741
			end
		elseif var1728 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1743, var1744 = protoModule.readFixed32(p60, var1727)
			local _ = var1743
			var1727 = var1744
		elseif var1728 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1745, var1746 = protoModule.readFixed64(p60, var1727)
			local _ = var1745
			var1727 = var1746
		else
			error("Unsupported wire type: " .. var2610)
		end
	end
	return var1726
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
	local var1747 = t_60.new()
	
	if self.tooltip_text ~= nil then
		var1747.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1747.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1747.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1747.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1747.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1747.prompt_type = self.promptType
	end
	return var1747
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
	local var1747 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1748, var1749 = protoModule.writeTag(buff, var1747, 1, protoModule.wireTypes.lengthDelimited)
		var1748, var2634 = protoModule.writeString(var1748, var1749, self.media_id)
		buff = var1748
		var1747 = var1749
	end
	if self.title ~= nil and self.title ~= "" then
		local var1750, var1751 = protoModule.writeTag(buff, var1747, 2, protoModule.wireTypes.lengthDelimited)
		var1750, var2636 = protoModule.writeString(var1750, var1751, self.title)
		buff = var1750
		var1747 = var1751
	end
	if self.description ~= nil and self.description ~= "" then
		local var1752, var1753 = protoModule.writeTag(buff, var1747, 3, protoModule.wireTypes.lengthDelimited)
		var1752, var2638 = protoModule.writeString(var1752, var1753, self.description)
		buff = var1752
		var1747 = var1753
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1754, var1755 = protoModule.writeTag(buff, var1747, 4, protoModule.wireTypes.lengthDelimited)
		var1754, var2640 = protoModule.writeString(var1754, var1755, self.prompt_id)
		buff = var1754
		var1747 = var1755
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1756, var1757 = protoModule.writeTag(buff, var1747, 5, protoModule.wireTypes.lengthDelimited)
		var1756, var2642 = protoModule.writeString(var1756, var1757, self.prompt_type)
		buff = var1756
		var1747 = var1757
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1758, var1759 = protoModule.writeTag(buff, var1747, 6, protoModule.wireTypes.lengthDelimited)
		var1758, var2644 = protoModule.writeString(var1758, var1759, self.anchor_tag)
		buff = var1758
		var1747 = var1759
	end
	local buff_1 = buffer.create(var1747)
	buffer.copy(buff_1, 0, buff, 0, var1747)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1747 = t_61.new()
	local var1748 = 0
	while var1748 < buffer.len(p61) do
		local _ = nil
		local var1749 = nil
		local var1750, var1751, var1752 = protoModule.readTag(p61, var1748)
		local var1753 = var1750
		var1749 = var1751
		var1748 = var1752
		
		if var1749 == protoModule.wireTypes.varint then
			local _ = nil
			local var1754, var1755 = protoModule.readVarInt(p61, var1748)
			local _ = var1754
			var1748 = var1755
			continue
		end
		if var1749 == protoModule.wireTypes.lengthDelimited then
			if var1753 == 1 then
				local _ = nil
				local var1756, var1757 = protoModule.readBuffer(p61, var1748)
				var1748 = var1757
				var1747.media_id = buffer.tostring(var1756)
			elseif var1753 == 2 then
				local _ = nil
				local var1758, var1759 = protoModule.readBuffer(p61, var1748)
				var1748 = var1759
				var1747.title = buffer.tostring(var1758)
			elseif var1753 == 3 then
				local _ = nil
				local var1760, var1761 = protoModule.readBuffer(p61, var1748)
				var1748 = var1761
				var1747.description = buffer.tostring(var1760)
			elseif var1753 == 4 then
				local _ = nil
				local var1762, var1763 = protoModule.readBuffer(p61, var1748)
				var1748 = var1763
				var1747.prompt_id = buffer.tostring(var1762)
			elseif var1753 == 5 then
				local _ = nil
				local var1764, var1765 = protoModule.readBuffer(p61, var1748)
				var1748 = var1765
				var1747.prompt_type = buffer.tostring(var1764)
			elseif var1753 == 6 then
				local _ = nil
				local var1766, var1767 = protoModule.readBuffer(p61, var1748)
				var1748 = var1767
				var1747.anchor_tag = buffer.tostring(var1766)
			else
				local _ = nil
				local var1768, var1769 = protoModule.readVarInt(p61, var1748)
				var1748 = var1769 + var1768
			end
		elseif var1749 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1770, var1771 = protoModule.readFixed32(p61, var1748)
			local _ = var1770
			var1748 = var1771
		elseif var1749 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1772, var1773 = protoModule.readFixed64(p61, var1748)
			local _ = var1772
			var1748 = var1773
		else
			error("Unsupported wire type: " .. var2648)
		end
	end
	return var1747
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
	local var1774 = t_61.new()
	
	if self.media_id ~= nil then
		var1774.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1774.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1774.title = self.title
	end
	if self.description ~= nil then
		var1774.description = self.description
	end
	if self.prompt_id ~= nil then
		var1774.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1774.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1774.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1774.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1774.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1774.anchor_tag = self.anchorTag
	end
	return var1774
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
	local var1774 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1775, var1776 = protoModule.writeTag(buff, var1774, 1, protoModule.wireTypes.lengthDelimited)
		var1775, var2678 = protoModule.writeString(var1775, var1776, self.prompt_id)
		buff = var1775
		var1774 = var1776
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1777, var1778 = protoModule.writeTag(buff, var1774, 2, protoModule.wireTypes.lengthDelimited)
		var1777, var2680 = protoModule.writeString(var1777, var1778, self.prompt_type)
		buff = var1777
		var1774 = var1778
	end
	local buff_1 = buffer.create(var1774)
	buffer.copy(buff_1, 0, buff, 0, var1774)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1774 = t_62.new()
	local var1775 = 0
	while var1775 < buffer.len(p62) do
		local _ = nil
		local var1776 = nil
		local var1777, var1778, var1779 = protoModule.readTag(p62, var1775)
		local var1780 = var1777
		var1776 = var1778
		var1775 = var1779
		
		if var1776 == protoModule.wireTypes.varint then
			local _ = nil
			local var1781, var1782 = protoModule.readVarInt(p62, var1775)
			local _ = var1781
			var1775 = var1782
			continue
		end
		if var1776 == protoModule.wireTypes.lengthDelimited then
			if var1780 == 1 then
				local _ = nil
				local var1783, var1784 = protoModule.readBuffer(p62, var1775)
				var1775 = var1784
				var1774.prompt_id = buffer.tostring(var1783)
			elseif var1780 == 2 then
				local _ = nil
				local var1785, var1786 = protoModule.readBuffer(p62, var1775)
				var1775 = var1786
				var1774.prompt_type = buffer.tostring(var1785)
			else
				local _ = nil
				local var1787, var1788 = protoModule.readVarInt(p62, var1775)
				var1775 = var1788 + var1787
			end
		elseif var1776 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1789, var1790 = protoModule.readFixed32(p62, var1775)
			local _ = var1789
			var1775 = var1790
		elseif var1776 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1791, var1792 = protoModule.readFixed64(p62, var1775)
			local _ = var1791
			var1775 = var1792
		else
			error("Unsupported wire type: " .. var2684)
		end
	end
	return var1774
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
	local var1793 = t_62.new()
	
	if self.prompt_id ~= nil then
		var1793.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1793.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1793.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1793.prompt_type = self.promptType
	end
	return var1793
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
	local var1793 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1794, var1795 = protoModule.writeTag(buff, var1793, 1, protoModule.wireTypes.lengthDelimited)
		var1794, var2706 = protoModule.writeString(var1794, var1795, self.upsell_prompt)
		buff = var1794
		var1793 = var1795
	end
	local buff_1 = buffer.create(var1793)
	buffer.copy(buff_1, 0, buff, 0, var1793)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref)
	local var1793 = t_63.new()
	local var1794 = 0
	while var1794 < buffer.len(p63) do
		local _ = nil
		local var1795 = nil
		local var1796, var1797, var1798 = protoModule.readTag(p63, var1794)
		local var1799 = var1796
		var1795 = var1797
		var1794 = var1798
		
		if var1795 == protoModule.wireTypes.varint then
			local _ = nil
			local var1800, var1801 = protoModule.readVarInt(p63, var1794)
			local _ = var1800
			var1794 = var1801
			continue
		end
		if var1795 == protoModule.wireTypes.lengthDelimited then
			if var1799 == 1 then
				local _ = nil
				local var1802, var1803 = protoModule.readBuffer(p63, var1794)
				var1794 = var1803
				var1793.upsell_prompt = buffer.tostring(var1802)
			else
				local _ = nil
				local var1804, var1805 = protoModule.readVarInt(p63, var1794)
				var1794 = var1805 + var1804
			end
		elseif var1795 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1806, var1807 = protoModule.readFixed32(p63, var1794)
			local _ = var1806
			var1794 = var1807
		elseif var1795 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1808, var1809 = protoModule.readFixed64(p63, var1794)
			local _ = var1808
			var1794 = var1809
		else
			error("Unsupported wire type: " .. var2710)
		end
	end
	return var1793
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
	local var1810 = t_63.new()
	
	if self.upsell_prompt ~= nil then
		var1810.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1810.upsell_prompt = self.upsellPrompt
	end
	return var1810
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
	local var1810 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1811, var1812 = protoModule.writeTag(buff, var1810, 1, protoModule.wireTypes.lengthDelimited)
		var1811, var2730 = protoModule.writeString(var1811, var1812, self.modal_variant)
		buff = var1811
		var1810 = var1812
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1813, var1814 = protoModule.writeTag(buff, var1810, 2, protoModule.wireTypes.lengthDelimited)
		var1813, var2732 = protoModule.writeString(var1813, var1814, self.modal_sequence)
		buff = var1813
		var1810 = var1814
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1815, var1816 = protoModule.writeTag(buff, var1810, 3, protoModule.wireTypes.lengthDelimited)
		var1815, var2734 = protoModule.writeString(var1815, var1816, self.conversation_id)
		buff = var1815
		var1810 = var1816
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1817, var1818 = protoModule.writeTag(buff, var1810, 4, protoModule.wireTypes.lengthDelimited)
		var1817, var2736 = protoModule.writeString(var1817, var1818, self.friend_id)
		buff = var1817
		var1810 = var1818
	end
	local buff_1 = buffer.create(var1810)
	buffer.copy(buff_1, 0, buff, 0, var1810)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref)
	local var1810 = t_64.new()
	local var1811 = 0
	while var1811 < buffer.len(p64) do
		local _ = nil
		local var1812 = nil
		local var1813, var1814, var1815 = protoModule.readTag(p64, var1811)
		local var1816 = var1813
		var1812 = var1814
		var1811 = var1815
		
		if var1812 == protoModule.wireTypes.varint then
			local _ = nil
			local var1817, var1818 = protoModule.readVarInt(p64, var1811)
			local _ = var1817
			var1811 = var1818
			continue
		end
		if var1812 == protoModule.wireTypes.lengthDelimited then
			if var1816 == 1 then
				local _ = nil
				local var1819, var1820 = protoModule.readBuffer(p64, var1811)
				var1811 = var1820
				var1810.modal_variant = buffer.tostring(var1819)
			elseif var1816 == 2 then
				local _ = nil
				local var1821, var1822 = protoModule.readBuffer(p64, var1811)
				var1811 = var1822
				var1810.modal_sequence = buffer.tostring(var1821)
			elseif var1816 == 3 then
				local _ = nil
				local var1823, var1824 = protoModule.readBuffer(p64, var1811)
				var1811 = var1824
				var1810.conversation_id = buffer.tostring(var1823)
			elseif var1816 == 4 then
				local _ = nil
				local var1825, var1826 = protoModule.readBuffer(p64, var1811)
				var1811 = var1826
				var1810.friend_id = buffer.tostring(var1825)
			else
				local _ = nil
				local var1827, var1828 = protoModule.readVarInt(p64, var1811)
				var1811 = var1828 + var1827
			end
		elseif var1812 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1829, var1830 = protoModule.readFixed32(p64, var1811)
			local _ = var1829
			var1811 = var1830
		elseif var1812 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1831, var1832 = protoModule.readFixed64(p64, var1811)
			local _ = var1831
			var1811 = var1832
		else
			error("Unsupported wire type: " .. var2740)
		end
	end
	return var1810
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
	local var1833 = t_64.new()
	
	if self.modal_variant ~= nil then
		var1833.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1833.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1833.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1833.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1833.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1833.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1833.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1833.friend_id = self.friendId
	end
	return var1833
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
	local var1833 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1834, var1835 = protoModule.writeTag(buff, var1833, 1, protoModule.wireTypes.lengthDelimited)
		var1834, var2766 = protoModule.writeString(var1834, var1835, self.event_id)
		buff = var1834
		var1833 = var1835
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1836, var1837 = protoModule.writeTag(buff, var1833, 2, protoModule.wireTypes.lengthDelimited)
		var1836, var2768 = protoModule.writeString(var1836, var1837, self.universe_id)
		buff = var1836
		var1833 = var1837
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1838, var1839 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1838, var2770 = protoModule.writeString(var1838, var1839, i)
			local var1840 = v:encode()
			var1839, var2772 = protoModule.writeTag(var1838, var1839, 2, protoModule.wireTypes.lengthDelimited)
			var1839, var2772 = protoModule.writeBuffer(var1839, var2772, var1840, buffer.len(var1840))
			local var1841 = var1839
			local var1842 = var2772
			local var1843, var1844 = protoModule.writeTag(buff, var1833, 3, protoModule.wireTypes.lengthDelimited)
			var1843, var2776 = protoModule.writeBuffer(var1843, var1844, var1841, var1842)
			buff = var1843
			var1833 = var1844
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1845, var1846 = protoModule.writeTag(buff, var1833, 4, protoModule.wireTypes.lengthDelimited)
			var1845, var2778 = protoModule.writeString(var1845, var1846, v)
			buff = var1845
			var1833 = var1846
		end
	end
	local buff_1 = buffer.create(var1833)
	buffer.copy(buff_1, 0, buff, 0, var1833)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref), t (ref)
	local var1847 = t_65.new()
	local var1848 = 0
	while var1848 < buffer.len(p65) do
		local _ = nil
		local var1849 = nil
		local var1850, var1851, var1852 = protoModule.readTag(p65, var1848)
		local var1853 = var1850
		var1849 = var1851
		var1848 = var1852
		
		if var1849 == protoModule.wireTypes.varint then
			local _ = nil
			local var1854, var1855 = protoModule.readVarInt(p65, var1848)
			local _ = var1854
			var1848 = var1855
			continue
		end
		if var1849 == protoModule.wireTypes.lengthDelimited then
			if var1853 == 1 then
				local _ = nil
				local var1856, var1857 = protoModule.readBuffer(p65, var1848)
				var1848 = var1857
				var1847.event_id = buffer.tostring(var1856)
			elseif var1853 == 2 then
				local _ = nil
				local var1858, var1859 = protoModule.readBuffer(p65, var1848)
				var1848 = var1859
				var1847.universe_id = buffer.tostring(var1858)
			elseif var1853 == 3 then
				local _ = nil
				local var1860, var1861 = protoModule.readBuffer(p65, var1848)
				var1848 = var1861
				var1860 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1860)
				var1847.entry_map[var1860.key or ""] = var1860.value or t.FeedEntry.new()
			elseif var1853 == 4 then
				local _ = nil
				local var1862, var1863 = protoModule.readBuffer(p65, var1848)
				var1848 = var1863
				table.insert(var1847.entry_order, buffer.tostring(var1862))
			else
				local _ = nil
				local var1864, var1865 = protoModule.readVarInt(p65, var1848)
				var1848 = var1865 + var1864
			end
		elseif var1849 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1866, var1867 = protoModule.readFixed32(p65, var1848)
			local _ = var1866
			var1848 = var1867
		elseif var1849 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1868, var1869 = protoModule.readFixed64(p65, var1848)
			local _ = var1868
			var1848 = var1869
		else
			error("Unsupported wire type: " .. var2782)
		end
	end
	return var1847
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
	local var1870 = t_65.new()
	
	if self.event_id ~= nil then
		var1870.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1870.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1870.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1870.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1870.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1870.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1870.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1870.entry_order = t_1
	end
	return var1870
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
	local var1871 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1872, var1873 = protoModule.writeTag(buff, var1871, 1, protoModule.wireTypes.lengthDelimited)
		var1872, var2814 = protoModule.writeString(var1872, var1873, self.key)
		buff = var1872
		var1871 = var1873
	end
	if self.value ~= nil then
		local var1874 = self.value:encode()
		local var1875, var1876 = protoModule.writeTag(buff, var1871, 2, protoModule.wireTypes.lengthDelimited)
		var1875, var2817 = protoModule.writeBuffer(var1875, var1876, var1874, buffer.len(var1874))
		buff = var1875
		var1871 = var1876
	end
	local buff_1 = buffer.create(var1871)
	buffer.copy(buff_1, 0, buff, 0, var1871)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1871 = t_66.new()
	local var1872 = 0
	while var1872 < buffer.len(p66) do
		local _ = nil
		local var1873 = nil
		local var1874, var1875, var1876 = protoModule.readTag(p66, var1872)
		local var1877 = var1874
		var1873 = var1875
		var1872 = var1876
		
		if var1873 == protoModule.wireTypes.varint then
			local _ = nil
			local var1878, var1879 = protoModule.readVarInt(p66, var1872)
			local _ = var1878
			var1872 = var1879
			continue
		end
		if var1873 == protoModule.wireTypes.lengthDelimited then
			if var1877 == 1 then
				local _ = nil
				local var1880, var1881 = protoModule.readBuffer(p66, var1872)
				var1872 = var1881
				var1871.key = buffer.tostring(var1880)
			elseif var1877 == 2 then
				local _ = nil
				local var1882, var1883 = protoModule.readBuffer(p66, var1872)
				var1872 = var1883
				var1871.value = t.FeedEntry.decode(var1882)
			else
				local _ = nil
				local var1884, var1885 = protoModule.readVarInt(p66, var1872)
				var1872 = var1885 + var1884
			end
		elseif var1873 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1886, var1887 = protoModule.readFixed32(p66, var1872)
			local _ = var1886
			var1872 = var1887
		elseif var1873 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1888, var1889 = protoModule.readFixed64(p66, var1872)
			local _ = var1888
			var1872 = var1889
		else
			error("Unsupported wire type: " .. var2821)
		end
	end
	return var1871
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
	local var1890 = t_66.new()
	
	if self.key ~= nil then
		var1890.key = self.key
	end
	if self.value ~= nil then
		var1890.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1890
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
	local var1890 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1891, var1892 = protoModule.writeTag(buff, var1890, 1, protoModule.wireTypes.lengthDelimited)
		var1891, var2843 = protoModule.writeString(var1891, var1892, self.event_id)
		buff = var1891
		var1890 = var1892
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1893, var1894 = protoModule.writeTag(buff, var1890, 2, protoModule.wireTypes.lengthDelimited)
		var1893, var2845 = protoModule.writeString(var1893, var1894, self.universe_id)
		buff = var1893
		var1890 = var1894
	end
	local buff_1 = buffer.create(var1890)
	buffer.copy(buff_1, 0, buff, 0, var1890)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref)
	local var1890 = t_67.new()
	local var1891 = 0
	while var1891 < buffer.len(p67) do
		local _ = nil
		local var1892 = nil
		local var1893, var1894, var1895 = protoModule.readTag(p67, var1891)
		local var1896 = var1893
		var1892 = var1894
		var1891 = var1895
		
		if var1892 == protoModule.wireTypes.varint then
			local _ = nil
			local var1897, var1898 = protoModule.readVarInt(p67, var1891)
			local _ = var1897
			var1891 = var1898
			continue
		end
		if var1892 == protoModule.wireTypes.lengthDelimited then
			if var1896 == 1 then
				local _ = nil
				local var1899, var1900 = protoModule.readBuffer(p67, var1891)
				var1891 = var1900
				var1890.event_id = buffer.tostring(var1899)
			elseif var1896 == 2 then
				local _ = nil
				local var1901, var1902 = protoModule.readBuffer(p67, var1891)
				var1891 = var1902
				var1890.universe_id = buffer.tostring(var1901)
			else
				local _ = nil
				local var1903, var1904 = protoModule.readVarInt(p67, var1891)
				var1891 = var1904 + var1903
			end
		elseif var1892 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1905, var1906 = protoModule.readFixed32(p67, var1891)
			local _ = var1905
			var1891 = var1906
		elseif var1892 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1907, var1908 = protoModule.readFixed64(p67, var1891)
			local _ = var1907
			var1891 = var1908
		else
			error("Unsupported wire type: " .. var2849)
		end
	end
	return var1890
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
	local var1909 = t_67.new()
	
	if self.event_id ~= nil then
		var1909.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1909.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1909.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1909.universe_id = self.universeId
	end
	return var1909
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
	local var1909 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1910, var1911 = protoModule.writeTag(buff, var1909, 1, protoModule.wireTypes.lengthDelimited)
		var1910, var2871 = protoModule.writeString(var1910, var1911, self.event_id)
		buff = var1910
		var1909 = var1911
	end
	local buff_1 = buffer.create(var1909)
	buffer.copy(buff_1, 0, buff, 0, var1909)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1909 = t_68.new()
	local var1910 = 0
	while var1910 < buffer.len(p68) do
		local _ = nil
		local var1911 = nil
		local var1912, var1913, var1914 = protoModule.readTag(p68, var1910)
		local var1915 = var1912
		var1911 = var1913
		var1910 = var1914
		
		if var1911 == protoModule.wireTypes.varint then
			local _ = nil
			local var1916, var1917 = protoModule.readVarInt(p68, var1910)
			local _ = var1916
			var1910 = var1917
			continue
		end
		if var1911 == protoModule.wireTypes.lengthDelimited then
			if var1915 == 1 then
				local _ = nil
				local var1918, var1919 = protoModule.readBuffer(p68, var1910)
				var1910 = var1919
				var1909.event_id = buffer.tostring(var1918)
			else
				local _ = nil
				local var1920, var1921 = protoModule.readVarInt(p68, var1910)
				var1910 = var1921 + var1920
			end
		elseif var1911 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1922, var1923 = protoModule.readFixed32(p68, var1910)
			local _ = var1922
			var1910 = var1923
		elseif var1911 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1924, var1925 = protoModule.readFixed64(p68, var1910)
			local _ = var1924
			var1910 = var1925
		else
			error("Unsupported wire type: " .. var2875)
		end
	end
	return var1909
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
	local var1926 = t_68.new()
	
	if self.event_id ~= nil then
		var1926.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1926.event_id = self.eventId
	end
	return var1926
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
	local var1926 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1927, var1928 = protoModule.writeTag(buff, var1926, 1, protoModule.wireTypes.lengthDelimited)
		var1927, var2895 = protoModule.writeString(var1927, var1928, self.event_id)
		buff = var1927
		var1926 = var1928
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1929, var1930 = protoModule.writeTag(buff, var1926, 2, protoModule.wireTypes.lengthDelimited)
		var1929, var2897 = protoModule.writeString(var1929, var1930, self.universe_id)
		buff = var1929
		var1926 = var1930
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var1931 = v:encode()
			local var1932, var1933 = protoModule.writeTag(buff, var1926, 3, protoModule.wireTypes.lengthDelimited)
			var1932, var2900 = protoModule.writeBuffer(var1932, var1933, var1931, buffer.len(var1931))
			buff = var1932
			var1926 = var1933
		end
	end
	local buff_1 = buffer.create(var1926)
	buffer.copy(buff_1, 0, buff, 0, var1926)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref), t (ref)
	local var1934 = t_69.new()
	local var1935 = 0
	while var1935 < buffer.len(p69) do
		local _ = nil
		local var1936 = nil
		local var1937, var1938, var1939 = protoModule.readTag(p69, var1935)
		local var1940 = var1937
		var1936 = var1938
		var1935 = var1939
		
		if var1936 == protoModule.wireTypes.varint then
			local _ = nil
			local var1941, var1942 = protoModule.readVarInt(p69, var1935)
			local _ = var1941
			var1935 = var1942
			continue
		end
		if var1936 == protoModule.wireTypes.lengthDelimited then
			if var1940 == 1 then
				local _ = nil
				local var1943, var1944 = protoModule.readBuffer(p69, var1935)
				var1935 = var1944
				var1934.event_id = buffer.tostring(var1943)
			elseif var1940 == 2 then
				local _ = nil
				local var1945, var1946 = protoModule.readBuffer(p69, var1935)
				var1935 = var1946
				var1934.universe_id = buffer.tostring(var1945)
			elseif var1940 == 3 then
				local _ = nil
				local var1947, var1948 = protoModule.readBuffer(p69, var1935)
				var1935 = var1948
				table.insert(var1934.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var1947))
			else
				local _ = nil
				local var1949, var1950 = protoModule.readVarInt(p69, var1935)
				var1935 = var1950 + var1949
			end
		elseif var1936 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1951, var1952 = protoModule.readFixed32(p69, var1935)
			local _ = var1951
			var1935 = var1952
		elseif var1936 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1953, var1954 = protoModule.readFixed64(p69, var1935)
			local _ = var1953
			var1935 = var1954
		else
			error("Unsupported wire type: " .. var2904)
		end
	end
	return var1934
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
	local var1955 = t_69.new()
	
	if self.event_id ~= nil then
		var1955.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1955.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1955.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1955.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1955.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1955.rsvp_users = t_1
	end
	return var1955
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
	local var1956 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var1957, var1958 = protoModule.writeTag(buff, var1956, 1, protoModule.wireTypes.varint)
		var1957, var2931 = protoModule.writeVarInt(var1957, var1958, self.user_id)
		buff = var1957
		var1956 = var1958
	end
	local buff_1 = buffer.create(var1956)
	buffer.copy(buff_1, 0, buff, 0, var1956)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var1956 = t_70.new()
	local var1957 = 0
	while var1957 < buffer.len(p70) do
		local _ = nil
		local _ = nil
		local var1958, var1959, var1960 = protoModule.readTag(p70, var1957)
		local var1961 = var1958
		local var1962 = var1959
		var1957 = var1960
		
		if var1962 == protoModule.wireTypes.varint then
			if var1961 == 1 then
				local _ = nil
				local var1963, var1964 = protoModule.readVarIntI64(p70, var1957)
				var1957 = var1964
				var1956.user_id = var1963
			else
				local _ = nil
				local var1965, var1966 = protoModule.readVarInt(p70, var1957)
				local _ = var1965
				var1957 = var1966
			end
		elseif var1962 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1967, var1968 = protoModule.readVarInt(p70, var1957)
			var1957 = var1968 + var1967
		elseif var1962 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1969, var1970 = protoModule.readFixed32(p70, var1957)
			local _ = var1969
			var1957 = var1970
		elseif var1962 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1971, var1972 = protoModule.readFixed64(p70, var1957)
			local _ = var1971
			var1957 = var1972
		else
			error("Unsupported wire type: " .. var2939)
		end
	end
	return var1956
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
	local var1973 = t_70.new()
	
	if self.user_id ~= nil then
		var1973.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1973.user_id = self.userId
	end
	return var1973
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
	local var1973 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1974, var1975 = protoModule.writeTag(buff, var1973, 1, protoModule.wireTypes.lengthDelimited)
		var1974, var2955 = protoModule.writeString(var1974, var1975, self.event_id)
		buff = var1974
		var1973 = var1975
	end
	local buff_1 = buffer.create(var1973)
	buffer.copy(buff_1, 0, buff, 0, var1973)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var1973 = t_71.new()
	local var1974 = 0
	while var1974 < buffer.len(p71) do
		local _ = nil
		local var1975 = nil
		local var1976, var1977, var1978 = protoModule.readTag(p71, var1974)
		local var1979 = var1976
		var1975 = var1977
		var1974 = var1978
		
		if var1975 == protoModule.wireTypes.varint then
			local _ = nil
			local var1980, var1981 = protoModule.readVarInt(p71, var1974)
			local _ = var1980
			var1974 = var1981
			continue
		end
		if var1975 == protoModule.wireTypes.lengthDelimited then
			if var1979 == 1 then
				local _ = nil
				local var1982, var1983 = protoModule.readBuffer(p71, var1974)
				var1974 = var1983
				var1973.event_id = buffer.tostring(var1982)
			else
				local _ = nil
				local var1984, var1985 = protoModule.readVarInt(p71, var1974)
				var1974 = var1985 + var1984
			end
		elseif var1975 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1986, var1987 = protoModule.readFixed32(p71, var1974)
			local _ = var1986
			var1974 = var1987
		elseif var1975 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1988, var1989 = protoModule.readFixed64(p71, var1974)
			local _ = var1988
			var1974 = var1989
		else
			error("Unsupported wire type: " .. var2959)
		end
	end
	return var1973
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
	local var1990 = t_71.new()
	
	if self.event_id ~= nil then
		var1990.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1990.event_id = self.eventId
	end
	return var1990
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
	local var1990 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1991, var1992 = protoModule.writeTag(buff, var1990, 1, protoModule.wireTypes.lengthDelimited)
		var1991, var2979 = protoModule.writeString(var1991, var1992, self.event_id)
		buff = var1991
		var1990 = var1992
	end
	local buff_1 = buffer.create(var1990)
	buffer.copy(buff_1, 0, buff, 0, var1990)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var1990 = t_72.new()
	local var1991 = 0
	while var1991 < buffer.len(p72) do
		local _ = nil
		local var1992 = nil
		local var1993, var1994, var1995 = protoModule.readTag(p72, var1991)
		local var1996 = var1993
		var1992 = var1994
		var1991 = var1995
		
		if var1992 == protoModule.wireTypes.varint then
			local _ = nil
			local var1997, var1998 = protoModule.readVarInt(p72, var1991)
			local _ = var1997
			var1991 = var1998
			continue
		end
		if var1992 == protoModule.wireTypes.lengthDelimited then
			if var1996 == 1 then
				local _ = nil
				local var1999, var2000 = protoModule.readBuffer(p72, var1991)
				var1991 = var2000
				var1990.event_id = buffer.tostring(var1999)
			else
				local _ = nil
				local var2001, var2002 = protoModule.readVarInt(p72, var1991)
				var1991 = var2002 + var2001
			end
		elseif var1992 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2003, var2004 = protoModule.readFixed32(p72, var1991)
			local _ = var2003
			var1991 = var2004
		elseif var1992 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2005, var2006 = protoModule.readFixed64(p72, var1991)
			local _ = var2005
			var1991 = var2006
		else
			error("Unsupported wire type: " .. var2983)
		end
	end
	return var1990
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
	local var2007 = t_72.new()
	
	if self.event_id ~= nil then
		var2007.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2007.event_id = self.eventId
	end
	return var2007
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
	local var2007 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2008, var2009 = protoModule.writeTag(buff, var2007, 1, protoModule.wireTypes.lengthDelimited)
		var2008, var3003 = protoModule.writeString(var2008, var2009, self.event_id)
		buff = var2008
		var2007 = var2009
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2010, var2011 = protoModule.writeTag(buff, var2007, 2, protoModule.wireTypes.lengthDelimited)
		var2010, var3005 = protoModule.writeString(var2010, var2011, self.universe_id)
		buff = var2010
		var2007 = var2011
	end
	local buff_1 = buffer.create(var2007)
	buffer.copy(buff_1, 0, buff, 0, var2007)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref)
	local var2007 = t_73.new()
	local var2008 = 0
	while var2008 < buffer.len(p73) do
		local _ = nil
		local var2009 = nil
		local var2010, var2011, var2012 = protoModule.readTag(p73, var2008)
		local var2013 = var2010
		var2009 = var2011
		var2008 = var2012
		
		if var2009 == protoModule.wireTypes.varint then
			local _ = nil
			local var2014, var2015 = protoModule.readVarInt(p73, var2008)
			local _ = var2014
			var2008 = var2015
			continue
		end
		if var2009 == protoModule.wireTypes.lengthDelimited then
			if var2013 == 1 then
				local _ = nil
				local var2016, var2017 = protoModule.readBuffer(p73, var2008)
				var2008 = var2017
				var2007.event_id = buffer.tostring(var2016)
			elseif var2013 == 2 then
				local _ = nil
				local var2018, var2019 = protoModule.readBuffer(p73, var2008)
				var2008 = var2019
				var2007.universe_id = buffer.tostring(var2018)
			else
				local _ = nil
				local var2020, var2021 = protoModule.readVarInt(p73, var2008)
				var2008 = var2021 + var2020
			end
		elseif var2009 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2022, var2023 = protoModule.readFixed32(p73, var2008)
			local _ = var2022
			var2008 = var2023
		elseif var2009 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2024, var2025 = protoModule.readFixed64(p73, var2008)
			local _ = var2024
			var2008 = var2025
		else
			error("Unsupported wire type: " .. var3009)
		end
	end
	return var2007
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
	local var2026 = t_73.new()
	
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
	return var2026
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
	local var2026 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2027, var2028 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2027, var3031 = protoModule.writeString(var2027, var2028, i)
			local var2029 = v:encode()
			var2028, var3033 = protoModule.writeTag(var2027, var2028, 2, protoModule.wireTypes.lengthDelimited)
			var2028, var3033 = protoModule.writeBuffer(var2028, var3033, var2029, buffer.len(var2029))
			local var2030 = var2028
			local var2031 = var3033
			local var2032, var2033 = protoModule.writeTag(buff, var2026, 1, protoModule.wireTypes.lengthDelimited)
			var2032, var3037 = protoModule.writeBuffer(var2032, var2033, var2030, var2031)
			buff = var2032
			var2026 = var2033
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2034, var2035 = protoModule.writeTag(buff, var2026, 2, protoModule.wireTypes.lengthDelimited)
			var2034, var3039 = protoModule.writeString(var2034, var2035, v)
			buff = var2034
			var2026 = var2035
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2036, var2037 = protoModule.writeTag(buff, var2026, 3, protoModule.wireTypes.lengthDelimited)
		var2036, var3041 = protoModule.writeString(var2036, var2037, self.next_page_token)
		buff = var2036
		var2026 = var2037
	end
	if self.sticky_filter_pills ~= nil then
		local var2038 = self.sticky_filter_pills:encode()
		local var2039, var2040 = protoModule.writeTag(buff, var2026, 4, protoModule.wireTypes.lengthDelimited)
		var2039, var3044 = protoModule.writeBuffer(var2039, var2040, var2038, buffer.len(var2038))
		buff = var2039
		var2026 = var2040
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2041, var2042 = protoModule.writeTag(buff, var2026, 5, protoModule.wireTypes.lengthDelimited)
		var2041, var3046 = protoModule.writeString(var2041, var2042, self.applied_filters)
		buff = var2041
		var2026 = var2042
	end
	local buff_1 = buffer.create(var2026)
	buffer.copy(buff_1, 0, buff, 0, var2026)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2043 = t_74.new()
	local var2044 = 0
	while var2044 < buffer.len(p74) do
		local _ = nil
		local var2045 = nil
		local var2046, var2047, var2048 = protoModule.readTag(p74, var2044)
		local var2049 = var2046
		var2045 = var2047
		var2044 = var2048
		
		if var2045 == protoModule.wireTypes.varint then
			local _ = nil
			local var2050, var2051 = protoModule.readVarInt(p74, var2044)
			local _ = var2050
			var2044 = var2051
			continue
		end
		if var2045 == protoModule.wireTypes.lengthDelimited then
			if var2049 == 1 then
				local _ = nil
				local var2052, var2053 = protoModule.readBuffer(p74, var2044)
				var2044 = var2053
				var2052 = t.ChartsFeedInputData_EntryMapEntry.decode(var2052)
				var2043.entry_map[var2052.key or ""] = var2052.value or t.FeedEntry.new()
			elseif var2049 == 2 then
				local _ = nil
				local var2054, var2055 = protoModule.readBuffer(p74, var2044)
				var2044 = var2055
				table.insert(var2043.entry_order, buffer.tostring(var2054))
			elseif var2049 == 3 then
				local _ = nil
				local var2056, var2057 = protoModule.readBuffer(p74, var2044)
				var2044 = var2057
				var2043.next_page_token = buffer.tostring(var2056)
			elseif var2049 == 4 then
				local _ = nil
				local var2058, var2059 = protoModule.readBuffer(p74, var2044)
				var2044 = var2059
				var2043.sticky_filter_pills = t.FilterPillsInputData.decode(var2058)
			elseif var2049 == 5 then
				local _ = nil
				local var2060, var2061 = protoModule.readBuffer(p74, var2044)
				var2044 = var2061
				var2043.applied_filters = buffer.tostring(var2060)
			else
				local _ = nil
				local var2062, var2063 = protoModule.readVarInt(p74, var2044)
				var2044 = var2063 + var2062
			end
		elseif var2045 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2064, var2065 = protoModule.readFixed32(p74, var2044)
			local _ = var2064
			var2044 = var2065
		elseif var2045 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2066, var2067 = protoModule.readFixed64(p74, var2044)
			local _ = var2066
			var2044 = var2067
		else
			error("Unsupported wire type: " .. var3050)
		end
	end
	return var2043
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
	local var2068 = t_74.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2068.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2068.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2068.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2068.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2068.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2068.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2068.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2068.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2068.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2068.applied_filters = self.appliedFilters
	end
	return var2068
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
	local var2069 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2070, var2071 = protoModule.writeTag(buff, var2069, 1, protoModule.wireTypes.lengthDelimited)
		var2070, var3084 = protoModule.writeString(var2070, var2071, self.key)
		buff = var2070
		var2069 = var2071
	end
	if self.value ~= nil then
		local var2072 = self.value:encode()
		local var2073, var2074 = protoModule.writeTag(buff, var2069, 2, protoModule.wireTypes.lengthDelimited)
		var2073, var3087 = protoModule.writeBuffer(var2073, var2074, var2072, buffer.len(var2072))
		buff = var2073
		var2069 = var2074
	end
	local buff_1 = buffer.create(var2069)
	buffer.copy(buff_1, 0, buff, 0, var2069)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2069 = t_75.new()
	local var2070 = 0
	while var2070 < buffer.len(p75) do
		local _ = nil
		local var2071 = nil
		local var2072, var2073, var2074 = protoModule.readTag(p75, var2070)
		local var2075 = var2072
		var2071 = var2073
		var2070 = var2074
		
		if var2071 == protoModule.wireTypes.varint then
			local _ = nil
			local var2076, var2077 = protoModule.readVarInt(p75, var2070)
			local _ = var2076
			var2070 = var2077
			continue
		end
		if var2071 == protoModule.wireTypes.lengthDelimited then
			if var2075 == 1 then
				local _ = nil
				local var2078, var2079 = protoModule.readBuffer(p75, var2070)
				var2070 = var2079
				var2069.key = buffer.tostring(var2078)
			elseif var2075 == 2 then
				local _ = nil
				local var2080, var2081 = protoModule.readBuffer(p75, var2070)
				var2070 = var2081
				var2069.value = t.FeedEntry.decode(var2080)
			else
				local _ = nil
				local var2082, var2083 = protoModule.readVarInt(p75, var2070)
				var2070 = var2083 + var2082
			end
		elseif var2071 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2084, var2085 = protoModule.readFixed32(p75, var2070)
			local _ = var2084
			var2070 = var2085
		elseif var2071 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2086, var2087 = protoModule.readFixed64(p75, var2070)
			local _ = var2086
			var2070 = var2087
		else
			error("Unsupported wire type: " .. var3091)
		end
	end
	return var2069
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
	local var2088 = t_75.new()
	
	if self.key ~= nil then
		var2088.key = self.key
	end
	if self.value ~= nil then
		var2088.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2088
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
	local var2088 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2089 = v:encode()
			local var2090, var2091 = protoModule.writeTag(buff, var2088, 1, protoModule.wireTypes.lengthDelimited)
			var2090, var3114 = protoModule.writeBuffer(var2090, var2091, var2089, buffer.len(var2089))
			buff = var2090
			var2088 = var2091
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2092, var2093 = protoModule.writeTag(buff, var2088, 2, protoModule.wireTypes.lengthDelimited)
		var2092, var3116 = protoModule.writeString(var2092, var2093, self.sort_id)
		buff = var2092
		var2088 = var2093
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2094, var2095 = protoModule.writeTag(buff, var2088, 3, protoModule.wireTypes.varint)
		var2094, var3118 = protoModule.writeVarInt(var2094, var2095, self.secondary_sort_id)
		buff = var2094
		var2088 = var2095
	end
	if self.title ~= nil and self.title ~= "" then
		local var2096, var2097 = protoModule.writeTag(buff, var2088, 4, protoModule.wireTypes.lengthDelimited)
		var2096, var3120 = protoModule.writeString(var2096, var2097, self.title)
		buff = var2096
		var2088 = var2097
	end
	if self.primary_sort_id ~= nil then
		local var2098, var2099 = protoModule.writeTag(buff, var2088, 5, protoModule.wireTypes.varint)
		var2098, var3122 = protoModule.writeVarInt(var2098, var2099, self.primary_sort_id)
		buff = var2098
		var2088 = var2099
	end
	if self.applied_filters ~= nil then
		local var2100, var2101 = protoModule.writeTag(buff, var2088, 6, protoModule.wireTypes.lengthDelimited)
		var2100, var3124 = protoModule.writeString(var2100, var2101, self.applied_filters)
		buff = var2100
		var2088 = var2101
	end
	local buff_1 = buffer.create(var2088)
	buffer.copy(buff_1, 0, buff, 0, var2088)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var2102 = t_76.new()
	local var2103 = 0
	while var2103 < buffer.len(p76) do
		local _ = nil
		local var2104 = nil
		local var2105, var2106, var2107 = protoModule.readTag(p76, var2103)
		local var2108 = var2105
		var2104 = var2106
		var2103 = var2107
		
		if var2104 == protoModule.wireTypes.varint then
			if var2108 == 3 then
				local _ = nil
				local var2109, var2110 = protoModule.readVarIntI32(p76, var2103)
				var2103 = var2110
				var2102.secondary_sort_id = var2109
			elseif var2108 == 5 then
				local _ = nil
				local var2111, var2112 = protoModule.readVarIntI32(p76, var2103)
				var2103 = var2112
				var2102.primary_sort_id = var2111
			else
				local _ = nil
				local var2113, var2114 = protoModule.readVarInt(p76, var2103)
				local _ = var2113
				var2103 = var2114
			end
		end
		if var2104 == protoModule.wireTypes.lengthDelimited then
			if var2108 == 1 then
				local _ = nil
				local var2115, var2116 = protoModule.readBuffer(p76, var2103)
				var2103 = var2116
				table.insert(var2102.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2115))
			elseif var2108 == 2 then
				local _ = nil
				local var2117, var2118 = protoModule.readBuffer(p76, var2103)
				var2103 = var2118
				var2102.sort_id = buffer.tostring(var2117)
			elseif var2108 == 4 then
				local _ = nil
				local var2119, var2120 = protoModule.readBuffer(p76, var2103)
				var2103 = var2120
				var2102.title = buffer.tostring(var2119)
			elseif var2108 == 6 then
				local _ = nil
				local var2121, var2122 = protoModule.readBuffer(p76, var2103)
				var2103 = var2122
				var2102.applied_filters = buffer.tostring(var2121)
			else
				local _ = nil
				local var2123, var2124 = protoModule.readVarInt(p76, var2103)
				var2103 = var2124 + var2123
			end
		elseif var2104 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2125, var2126 = protoModule.readFixed32(p76, var2103)
			local _ = var2125
			var2103 = var2126
		elseif var2104 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2127, var2128 = protoModule.readFixed64(p76, var2103)
			local _ = var2127
			var2103 = var2128
		else
			error("Unsupported wire type: " .. var3128)
		end
	end
	return var2102
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
	local var2129 = t_76.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2129.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2129.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2129.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2129.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2129.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2129.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2129.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2129.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2129.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2129.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2129.applied_filters = self.appliedFilters
	end
	return var2129
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
	local var2130 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2131, var2132 = protoModule.writeTag(buff, var2130, 1, protoModule.wireTypes.lengthDelimited)
		var2131, var3161 = protoModule.writeString(var2131, var2132, self.filter_id)
		buff = var2131
		var2130 = var2132
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2133, var2134 = protoModule.writeTag(buff, var2130, 2, protoModule.wireTypes.lengthDelimited)
		var2133, var3163 = protoModule.writeString(var2133, var2134, self.display_name)
		buff = var2133
		var2130 = var2134
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2135 = v:encode()
			local var2136, var2137 = protoModule.writeTag(buff, var2130, 3, protoModule.wireTypes.lengthDelimited)
			var2136, var3166 = protoModule.writeBuffer(var2136, var2137, var2135, buffer.len(var2135))
			buff = var2136
			var2130 = var2137
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2138, var2139 = protoModule.writeTag(buff, var2130, 4, protoModule.wireTypes.lengthDelimited)
		var2138, var3168 = protoModule.writeString(var2138, var2139, self.default_option_id)
		buff = var2138
		var2130 = var2139
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2140, var2141 = protoModule.writeTag(buff, var2130, 5, protoModule.wireTypes.lengthDelimited)
		var2140, var3170 = protoModule.writeString(var2140, var2141, self.selected_option_id)
		buff = var2140
		var2130 = var2141
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2142, var2143 = protoModule.writeTag(buff, var2130, 6, protoModule.wireTypes.lengthDelimited)
		var2142, var3172 = protoModule.writeString(var2142, var2143, self.filter_type)
		buff = var2142
		var2130 = var2143
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2144, var2145 = protoModule.writeTag(buff, var2130, 7, protoModule.wireTypes.lengthDelimited)
			var2144, var3174 = protoModule.writeString(var2144, var2145, v)
			buff = var2144
			var2130 = var2145
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2146, var2147 = protoModule.writeTag(buff, var2130, 8, protoModule.wireTypes.lengthDelimited)
		var2146, var3176 = protoModule.writeString(var2146, var2147, self.info_text)
		buff = var2146
		var2130 = var2147
	end
	local buff_1 = buffer.create(var2130)
	buffer.copy(buff_1, 0, buff, 0, var2130)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2148 = t_77.new()
	local var2149 = 0
	while var2149 < buffer.len(p77) do
		local _ = nil
		local var2150 = nil
		local var2151, var2152, var2153 = protoModule.readTag(p77, var2149)
		local var2154 = var2151
		var2150 = var2152
		var2149 = var2153
		
		if var2150 == protoModule.wireTypes.varint then
			local _ = nil
			local var2155, var2156 = protoModule.readVarInt(p77, var2149)
			local _ = var2155
			var2149 = var2156
			continue
		end
		if var2150 == protoModule.wireTypes.lengthDelimited then
			if var2154 == 1 then
				local _ = nil
				local var2157, var2158 = protoModule.readBuffer(p77, var2149)
				var2149 = var2158
				var2148.filter_id = buffer.tostring(var2157)
			elseif var2154 == 2 then
				local _ = nil
				local var2159, var2160 = protoModule.readBuffer(p77, var2149)
				var2149 = var2160
				var2148.display_name = buffer.tostring(var2159)
			elseif var2154 == 3 then
				local _ = nil
				local var2161, var2162 = protoModule.readBuffer(p77, var2149)
				var2149 = var2162
				table.insert(var2148.options, t.FilterPillsInputData_FilterOption.decode(var2161))
			elseif var2154 == 4 then
				local _ = nil
				local var2163, var2164 = protoModule.readBuffer(p77, var2149)
				var2149 = var2164
				var2148.default_option_id = buffer.tostring(var2163)
			elseif var2154 == 5 then
				local _ = nil
				local var2165, var2166 = protoModule.readBuffer(p77, var2149)
				var2149 = var2166
				var2148.selected_option_id = buffer.tostring(var2165)
			elseif var2154 == 6 then
				local _ = nil
				local var2167, var2168 = protoModule.readBuffer(p77, var2149)
				var2149 = var2168
				var2148.filter_type = buffer.tostring(var2167)
			elseif var2154 == 7 then
				local _ = nil
				local var2169, var2170 = protoModule.readBuffer(p77, var2149)
				var2149 = var2170
				table.insert(var2148.inactive_option_ids, buffer.tostring(var2169))
			elseif var2154 == 8 then
				local _ = nil
				local var2171, var2172 = protoModule.readBuffer(p77, var2149)
				var2149 = var2172
				var2148.info_text = buffer.tostring(var2171)
			else
				local _ = nil
				local var2173, var2174 = protoModule.readVarInt(p77, var2149)
				var2149 = var2174 + var2173
			end
		elseif var2150 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2175, var2176 = protoModule.readFixed32(p77, var2149)
			local _ = var2175
			var2149 = var2176
		elseif var2150 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2177, var2178 = protoModule.readFixed64(p77, var2149)
			local _ = var2177
			var2149 = var2178
		else
			error("Unsupported wire type: " .. var3180)
		end
	end
	return var2148
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
	local var2179 = t_77.new()
	
	if self.filter_id ~= nil then
		var2179.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2179.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2179.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2179.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2179.options = t_1
	end
	if self.default_option_id ~= nil then
		var2179.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2179.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2179.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2179.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2179.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2179.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2179.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2179.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2179.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2179.info_text = self.infoText
	end
	return var2179
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
	local var2180 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2181, var2182 = protoModule.writeTag(buff, var2180, 1, protoModule.wireTypes.lengthDelimited)
		var2181, var3219 = protoModule.writeString(var2181, var2182, self.option_id)
		buff = var2181
		var2180 = var2182
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2183, var2184 = protoModule.writeTag(buff, var2180, 2, protoModule.wireTypes.lengthDelimited)
		var2183, var3221 = protoModule.writeString(var2183, var2184, self.display_name)
		buff = var2183
		var2180 = var2184
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2185, var2186 = protoModule.writeTag(buff, var2180, 3, protoModule.wireTypes.lengthDelimited)
		var2185, var3223 = protoModule.writeString(var2185, var2186, self.option_context_tag)
		buff = var2185
		var2180 = var2186
	end
	local buff_1 = buffer.create(var2180)
	buffer.copy(buff_1, 0, buff, 0, var2180)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var2180 = t_78.new()
	local var2181 = 0
	while var2181 < buffer.len(p78) do
		local _ = nil
		local var2182 = nil
		local var2183, var2184, var2185 = protoModule.readTag(p78, var2181)
		local var2186 = var2183
		var2182 = var2184
		var2181 = var2185
		
		if var2182 == protoModule.wireTypes.varint then
			local _ = nil
			local var2187, var2188 = protoModule.readVarInt(p78, var2181)
			local _ = var2187
			var2181 = var2188
			continue
		end
		if var2182 == protoModule.wireTypes.lengthDelimited then
			if var2186 == 1 then
				local _ = nil
				local var2189, var2190 = protoModule.readBuffer(p78, var2181)
				var2181 = var2190
				var2180.option_id = buffer.tostring(var2189)
			elseif var2186 == 2 then
				local _ = nil
				local var2191, var2192 = protoModule.readBuffer(p78, var2181)
				var2181 = var2192
				var2180.display_name = buffer.tostring(var2191)
			elseif var2186 == 3 then
				local _ = nil
				local var2193, var2194 = protoModule.readBuffer(p78, var2181)
				var2181 = var2194
				var2180.option_context_tag = buffer.tostring(var2193)
			else
				local _ = nil
				local var2195, var2196 = protoModule.readVarInt(p78, var2181)
				var2181 = var2196 + var2195
			end
		elseif var2182 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2197, var2198 = protoModule.readFixed32(p78, var2181)
			local _ = var2197
			var2181 = var2198
		elseif var2182 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2199, var2200 = protoModule.readFixed64(p78, var2181)
			local _ = var2199
			var2181 = var2200
		else
			error("Unsupported wire type: " .. var3227)
		end
	end
	return var2180
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
	local var2201 = t_78.new()
	
	if self.option_id ~= nil then
		var2201.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2201.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2201.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2201.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2201.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2201.option_context_tag = self.optionContextTag
	end
	return var2201
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
	local var2201 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2202 = v:encode()
			local var2203, var2204 = protoModule.writeTag(buff, var2201, 1, protoModule.wireTypes.lengthDelimited)
			var2203, var3252 = protoModule.writeBuffer(var2203, var2204, var2202, buffer.len(var2202))
			buff = var2203
			var2201 = var2204
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2205, var2206 = protoModule.writeTag(buff, var2201, 2, protoModule.wireTypes.lengthDelimited)
		var2205, var3254 = protoModule.writeString(var2205, var2206, self.selected_sort_id)
		buff = var2205
		var2201 = var2206
	end
	local buff_1 = buffer.create(var2201)
	buffer.copy(buff_1, 0, buff, 0, var2201)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2207 = t_79.new()
	local var2208 = 0
	while var2208 < buffer.len(p79) do
		local _ = nil
		local var2209 = nil
		local var2210, var2211, var2212 = protoModule.readTag(p79, var2208)
		local var2213 = var2210
		var2209 = var2211
		var2208 = var2212
		
		if var2209 == protoModule.wireTypes.varint then
			local _ = nil
			local var2214, var2215 = protoModule.readVarInt(p79, var2208)
			local _ = var2214
			var2208 = var2215
			continue
		end
		if var2209 == protoModule.wireTypes.lengthDelimited then
			if var2213 == 1 then
				local _ = nil
				local var2216, var2217 = protoModule.readBuffer(p79, var2208)
				var2208 = var2217
				table.insert(var2207.sort_options, t.SortSelectorInputData_SortOption.decode(var2216))
			elseif var2213 == 2 then
				local _ = nil
				local var2218, var2219 = protoModule.readBuffer(p79, var2208)
				var2208 = var2219
				var2207.selected_sort_id = buffer.tostring(var2218)
			else
				local _ = nil
				local var2220, var2221 = protoModule.readVarInt(p79, var2208)
				var2208 = var2221 + var2220
			end
		elseif var2209 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2222, var2223 = protoModule.readFixed32(p79, var2208)
			local _ = var2222
			var2208 = var2223
		elseif var2209 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2224, var2225 = protoModule.readFixed64(p79, var2208)
			local _ = var2224
			var2208 = var2225
		else
			error("Unsupported wire type: " .. var3258)
		end
	end
	return var2207
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
	local var2226 = t_79.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2226.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2226.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2226.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2226.selected_sort_id = self.selectedSortId
	end
	return var2226
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
	local var2227 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2228, var2229 = protoModule.writeTag(buff, var2227, 1, protoModule.wireTypes.lengthDelimited)
		var2228, var3283 = protoModule.writeString(var2228, var2229, self.sort_id)
		buff = var2228
		var2227 = var2229
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2230, var2231 = protoModule.writeTag(buff, var2227, 2, protoModule.wireTypes.lengthDelimited)
		var2230, var3285 = protoModule.writeString(var2230, var2231, self.display_name)
		buff = var2230
		var2227 = var2231
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2232, var2233 = protoModule.writeTag(buff, var2227, 3, protoModule.wireTypes.lengthDelimited)
		var2232, var3287 = protoModule.writeString(var2232, var2233, self.content_type)
		buff = var2232
		var2227 = var2233
	end
	local buff_1 = buffer.create(var2227)
	buffer.copy(buff_1, 0, buff, 0, var2227)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref)
	local var2227 = t_80.new()
	local var2228 = 0
	while var2228 < buffer.len(p80) do
		local _ = nil
		local var2229 = nil
		local var2230, var2231, var2232 = protoModule.readTag(p80, var2228)
		local var2233 = var2230
		var2229 = var2231
		var2228 = var2232
		
		if var2229 == protoModule.wireTypes.varint then
			local _ = nil
			local var2234, var2235 = protoModule.readVarInt(p80, var2228)
			local _ = var2234
			var2228 = var2235
			continue
		end
		if var2229 == protoModule.wireTypes.lengthDelimited then
			if var2233 == 1 then
				local _ = nil
				local var2236, var2237 = protoModule.readBuffer(p80, var2228)
				var2228 = var2237
				var2227.sort_id = buffer.tostring(var2236)
			elseif var2233 == 2 then
				local _ = nil
				local var2238, var2239 = protoModule.readBuffer(p80, var2228)
				var2228 = var2239
				var2227.display_name = buffer.tostring(var2238)
			elseif var2233 == 3 then
				local _ = nil
				local var2240, var2241 = protoModule.readBuffer(p80, var2228)
				var2228 = var2241
				var2227.content_type = buffer.tostring(var2240)
			else
				local _ = nil
				local var2242, var2243 = protoModule.readVarInt(p80, var2228)
				var2228 = var2243 + var2242
			end
		elseif var2229 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2244, var2245 = protoModule.readFixed32(p80, var2228)
			local _ = var2244
			var2228 = var2245
		elseif var2229 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2246, var2247 = protoModule.readFixed64(p80, var2228)
			local _ = var2246
			var2228 = var2247
		else
			error("Unsupported wire type: " .. var3291)
		end
	end
	return var2227
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
	local var2248 = t_80.new()
	
	if self.sort_id ~= nil then
		var2248.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2248.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2248.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2248.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2248.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2248.content_type = self.contentType
	end
	return var2248
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
	local var2248 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2249, var2250 = protoModule.writeTag(buff, var2248, 1, protoModule.wireTypes.lengthDelimited)
		var2249, var3315 = protoModule.writeString(var2249, var2250, self.selected_option)
		buff = var2249
		var2248 = var2250
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2251 = v:encode()
			local var2252, var2253 = protoModule.writeTag(buff, var2248, 2, protoModule.wireTypes.lengthDelimited)
			var2252, var3318 = protoModule.writeBuffer(var2252, var2253, var2251, buffer.len(var2251))
			buff = var2252
			var2248 = var2253
		end
	end
	if self.experience_carousel ~= nil then
		local var2254 = self.experience_carousel:encode()
		local var2255, var2256 = protoModule.writeTag(buff, var2248, 3, protoModule.wireTypes.lengthDelimited)
		var2255, var3321 = protoModule.writeBuffer(var2255, var2256, var2254, buffer.len(var2254))
		buff = var2255
		var2248 = var2256
	end
	local buff_1 = buffer.create(var2248)
	buffer.copy(buff_1, 0, buff, 0, var2248)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2257 = t_81.new()
	local var2258 = 0
	while var2258 < buffer.len(p81) do
		local _ = nil
		local var2259 = nil
		local var2260, var2261, var2262 = protoModule.readTag(p81, var2258)
		local var2263 = var2260
		var2259 = var2261
		var2258 = var2262
		
		if var2259 == protoModule.wireTypes.varint then
			local _ = nil
			local var2264, var2265 = protoModule.readVarInt(p81, var2258)
			local _ = var2264
			var2258 = var2265
			continue
		end
		if var2259 == protoModule.wireTypes.lengthDelimited then
			if var2263 == 1 then
				local _ = nil
				local var2266, var2267 = protoModule.readBuffer(p81, var2258)
				var2258 = var2267
				var2257.selected_option = buffer.tostring(var2266)
			elseif var2263 == 2 then
				local _ = nil
				local var2268, var2269 = protoModule.readBuffer(p81, var2258)
				var2258 = var2269
				table.insert(var2257.options, t.SelectorOption.decode(var2268))
			elseif var2263 == 3 then
				local _ = nil
				local var2270, var2271 = protoModule.readBuffer(p81, var2258)
				var2258 = var2271
				var2257.experience_carousel = t.ExperienceCarouselInputData.decode(var2270)
			else
				local _ = nil
				local var2272, var2273 = protoModule.readVarInt(p81, var2258)
				var2258 = var2273 + var2272
			end
		elseif var2259 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2274, var2275 = protoModule.readFixed32(p81, var2258)
			local _ = var2274
			var2258 = var2275
		elseif var2259 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2276, var2277 = protoModule.readFixed64(p81, var2258)
			local _ = var2276
			var2258 = var2277
		else
			error("Unsupported wire type: " .. var3325)
		end
	end
	return var2257
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
	local var2278 = t_81.new()
	
	if self.selected_option ~= nil then
		var2278.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2278.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2278.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2278.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2278.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2278
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
	local var2279 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2280, var2281 = protoModule.writeTag(buff, var2279, 1, protoModule.wireTypes.lengthDelimited)
		var2280, var3351 = protoModule.writeString(var2280, var2281, self.id)
		buff = var2280
		var2279 = var2281
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2282, var2283 = protoModule.writeTag(buff, var2279, 4, protoModule.wireTypes.varint)
		var2282, var3353 = protoModule.writeVarInt(var2282, var2283, self.preview_rows)
		buff = var2282
		var2279 = var2283
	end
	if self.widget_style ~= nil then
		local var2284 = self.widget_style:encode()
		local var2285, var2286 = protoModule.writeTag(buff, var2279, 3, protoModule.wireTypes.lengthDelimited)
		var2285, var3356 = protoModule.writeBuffer(var2285, var2286, var2284, buffer.len(var2284))
		buff = var2285
		var2279 = var2286
	end
	if self.see_all_button then
		local var2287, var2288 = protoModule.writeTag(buff, var2279, 5, protoModule.wireTypes.varint)
		var2287, var3358 = protoModule.writeVarInt(var2287, var2288, if self.see_all_button then 1 else 0)
		buff = var2287
		var2279 = var2288
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2289, var2290 = protoModule.writeTag(buff, var2279, 6, protoModule.wireTypes.lengthDelimited)
		var2289, var3360 = protoModule.writeString(var2289, var2290, self.information_popover_text)
		buff = var2289
		var2279 = var2290
	end
	local buff_1 = buffer.create(var2279)
	buffer.copy(buff_1, 0, buff, 0, var2279)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2279 = t_82.new()
	local var2280 = 0
	while var2280 < buffer.len(p82) do
		local _ = nil
		local var2281 = nil
		local var2282, var2283, var2284 = protoModule.readTag(p82, var2280)
		local var2285 = var2282
		var2281 = var2283
		var2280 = var2284
		
		if var2281 == protoModule.wireTypes.varint then
			if var2285 == 4 then
				local _ = nil
				local var2286, var2287 = protoModule.readVarIntI64(p82, var2280)
				var2280 = var2287
				var2279.preview_rows = var2286
			elseif var2285 == 5 then
				local _ = nil
				local var2288, var2289 = protoModule.readVarInt(p82, var2280)
				var2280 = var2289
				var2279.see_all_button = var2288 ~= 0
			else
				local _ = nil
				local var2290, var2291 = protoModule.readVarInt(p82, var2280)
				local _ = var2290
				var2280 = var2291
			end
		end
		if var2281 == protoModule.wireTypes.lengthDelimited then
			if var2285 == 1 then
				local _ = nil
				local var2292, var2293 = protoModule.readBuffer(p82, var2280)
				var2280 = var2293
				var2279.id = buffer.tostring(var2292)
			elseif var2285 == 3 then
				local _ = nil
				local var2294, var2295 = protoModule.readBuffer(p82, var2280)
				var2280 = var2295
				var2279.widget_style = t.WidgetStyleData.decode(var2294)
			elseif var2285 == 6 then
				local _ = nil
				local var2296, var2297 = protoModule.readBuffer(p82, var2280)
				var2280 = var2297
				var2279.information_popover_text = buffer.tostring(var2296)
			else
				local _ = nil
				local var2298, var2299 = protoModule.readVarInt(p82, var2280)
				var2280 = var2299 + var2298
			end
		elseif var2281 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2300, var2301 = protoModule.readFixed32(p82, var2280)
			local _ = var2300
			var2280 = var2301
		elseif var2281 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2302, var2303 = protoModule.readFixed64(p82, var2280)
			local _ = var2302
			var2280 = var2303
		else
			error("Unsupported wire type: " .. var3364)
		end
	end
	return var2279
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
	local var2304 = t_82.new()
	
	if self.id ~= nil then
		var2304.id = self.id
	end
	if self.preview_rows ~= nil then
		var2304.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2304.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2304.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2304.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2304.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2304.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2304.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2304.information_popover_text = self.informationPopoverText
	end
	return var2304
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
	local var2304 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2305, var2306 = protoModule.writeTag(buff, var2304, 1, protoModule.wireTypes.lengthDelimited)
		var2305, var3392 = protoModule.writeString(var2305, var2306, self.id)
		buff = var2305
		var2304 = var2306
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2307, var2308 = protoModule.writeTag(buff, var2304, 5, protoModule.wireTypes.varint)
		var2307, var3394 = protoModule.writeVarInt(var2307, var2308, self.num_items_to_show)
		buff = var2307
		var2304 = var2308
	end
	if self.widget_style ~= nil then
		local var2309 = self.widget_style:encode()
		local var2310, var2311 = protoModule.writeTag(buff, var2304, 3, protoModule.wireTypes.lengthDelimited)
		var2310, var3397 = protoModule.writeBuffer(var2310, var2311, var2309, buffer.len(var2309))
		buff = var2310
		var2304 = var2311
	end
	if self.see_all_button then
		local var2312, var2313 = protoModule.writeTag(buff, var2304, 6, protoModule.wireTypes.varint)
		var2312, var3399 = protoModule.writeVarInt(var2312, var2313, if self.see_all_button then 1 else 0)
		buff = var2312
		var2304 = var2313
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2314, var2315 = protoModule.writeTag(buff, var2304, 7, protoModule.wireTypes.lengthDelimited)
		var2314, var3401 = protoModule.writeString(var2314, var2315, self.information_popover_text)
		buff = var2314
		var2304 = var2315
	end
	local buff_1 = buffer.create(var2304)
	buffer.copy(buff_1, 0, buff, 0, var2304)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2304 = t_83.new()
	local var2305 = 0
	while var2305 < buffer.len(p83) do
		local _ = nil
		local var2306 = nil
		local var2307, var2308, var2309 = protoModule.readTag(p83, var2305)
		local var2310 = var2307
		var2306 = var2308
		var2305 = var2309
		
		if var2306 == protoModule.wireTypes.varint then
			if var2310 == 5 then
				local _ = nil
				local var2311, var2312 = protoModule.readVarIntI64(p83, var2305)
				var2305 = var2312
				var2304.num_items_to_show = var2311
			elseif var2310 == 6 then
				local _ = nil
				local var2313, var2314 = protoModule.readVarInt(p83, var2305)
				var2305 = var2314
				var2304.see_all_button = var2313 ~= 0
			else
				local _ = nil
				local var2315, var2316 = protoModule.readVarInt(p83, var2305)
				local _ = var2315
				var2305 = var2316
			end
		end
		if var2306 == protoModule.wireTypes.lengthDelimited then
			if var2310 == 1 then
				local _ = nil
				local var2317, var2318 = protoModule.readBuffer(p83, var2305)
				var2305 = var2318
				var2304.id = buffer.tostring(var2317)
			elseif var2310 == 3 then
				local _ = nil
				local var2319, var2320 = protoModule.readBuffer(p83, var2305)
				var2305 = var2320
				var2304.widget_style = t.WidgetStyleData.decode(var2319)
			elseif var2310 == 7 then
				local _ = nil
				local var2321, var2322 = protoModule.readBuffer(p83, var2305)
				var2305 = var2322
				var2304.information_popover_text = buffer.tostring(var2321)
			else
				local _ = nil
				local var2323, var2324 = protoModule.readVarInt(p83, var2305)
				var2305 = var2324 + var2323
			end
		elseif var2306 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2325, var2326 = protoModule.readFixed32(p83, var2305)
			local _ = var2325
			var2305 = var2326
		elseif var2306 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2327, var2328 = protoModule.readFixed64(p83, var2305)
			local _ = var2327
			var2305 = var2328
		else
			error("Unsupported wire type: " .. var3405)
		end
	end
	return var2304
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
	local var2329 = t_83.new()
	
	if self.id ~= nil then
		var2329.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2329.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2329.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2329.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2329.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2329.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2329.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2329.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2329.information_popover_text = self.informationPopoverText
	end
	return var2329
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
	local var2329 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2330 = v:encode()
			local var2331, var2332 = protoModule.writeTag(buff, var2329, 1, protoModule.wireTypes.lengthDelimited)
			var2331, var3434 = protoModule.writeBuffer(var2331, var2332, var2330, buffer.len(var2330))
			buff = var2331
			var2329 = var2332
		end
	end
	local buff_1 = buffer.create(var2329)
	buffer.copy(buff_1, 0, buff, 0, var2329)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2333 = t_84.new()
	local var2334 = 0
	while var2334 < buffer.len(p84) do
		local _ = nil
		local var2335 = nil
		local var2336, var2337, var2338 = protoModule.readTag(p84, var2334)
		local var2339 = var2336
		var2335 = var2337
		var2334 = var2338
		
		if var2335 == protoModule.wireTypes.varint then
			local _ = nil
			local var2340, var2341 = protoModule.readVarInt(p84, var2334)
			local _ = var2340
			var2334 = var2341
			continue
		end
		if var2335 == protoModule.wireTypes.lengthDelimited then
			if var2339 == 1 then
				local _ = nil
				local var2342, var2343 = protoModule.readBuffer(p84, var2334)
				var2334 = var2343
				table.insert(var2333.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2342))
			else
				local _ = nil
				local var2344, var2345 = protoModule.readVarInt(p84, var2334)
				var2334 = var2345 + var2344
			end
		elseif var2335 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2346, var2347 = protoModule.readFixed32(p84, var2334)
			local _ = var2346
			var2334 = var2347
		elseif var2335 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2348, var2349 = protoModule.readFixed64(p84, var2334)
			local _ = var2348
			var2334 = var2349
		else
			error("Unsupported wire type: " .. var3438)
		end
	end
	return var2333
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
	local var2350 = t_84.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2350.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2350.background_layers = t
	end
	return var2350
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
	local var2351 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2352, var2353 = protoModule.writeTag(buff, var2351, 1, protoModule.wireTypes.lengthDelimited)
		var2352, var3461 = protoModule.writeString(var2352, var2353, self.id)
		buff = var2352
		var2351 = var2353
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2354, var2355 = protoModule.writeTag(buff, var2351, 2, protoModule.wireTypes.lengthDelimited)
		var2354, var3463 = protoModule.writeString(var2354, var2355, self.available_until)
		buff = var2354
		var2351 = var2355
	end
	if self.widget_style ~= nil then
		local var2356 = self.widget_style:encode()
		local var2357, var2358 = protoModule.writeTag(buff, var2351, 3, protoModule.wireTypes.lengthDelimited)
		var2357, var3466 = protoModule.writeBuffer(var2357, var2358, var2356, buffer.len(var2356))
		buff = var2357
		var2351 = var2358
	end
	local buff_1 = buffer.create(var2351)
	buffer.copy(buff_1, 0, buff, 0, var2351)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2351 = t_85.new()
	local var2352 = 0
	while var2352 < buffer.len(p85) do
		local _ = nil
		local var2353 = nil
		local var2354, var2355, var2356 = protoModule.readTag(p85, var2352)
		local var2357 = var2354
		var2353 = var2355
		var2352 = var2356
		
		if var2353 == protoModule.wireTypes.varint then
			local _ = nil
			local var2358, var2359 = protoModule.readVarInt(p85, var2352)
			local _ = var2358
			var2352 = var2359
			continue
		end
		if var2353 == protoModule.wireTypes.lengthDelimited then
			if var2357 == 1 then
				local _ = nil
				local var2360, var2361 = protoModule.readBuffer(p85, var2352)
				var2352 = var2361
				var2351.id = buffer.tostring(var2360)
			elseif var2357 == 2 then
				local _ = nil
				local var2362, var2363 = protoModule.readBuffer(p85, var2352)
				var2352 = var2363
				var2351.available_until = buffer.tostring(var2362)
			elseif var2357 == 3 then
				local _ = nil
				local var2364, var2365 = protoModule.readBuffer(p85, var2352)
				var2352 = var2365
				var2351.widget_style = t.WidgetStyleData.decode(var2364)
			else
				local _ = nil
				local var2366, var2367 = protoModule.readVarInt(p85, var2352)
				var2352 = var2367 + var2366
			end
		elseif var2353 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2368, var2369 = protoModule.readFixed32(p85, var2352)
			local _ = var2368
			var2352 = var2369
		elseif var2353 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2370, var2371 = protoModule.readFixed64(p85, var2352)
			local _ = var2370
			var2352 = var2371
		else
			error("Unsupported wire type: " .. var3470)
		end
	end
	return var2351
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
	local var2372 = t_85.new()
	
	if self.id ~= nil then
		var2372.id = self.id
	end
	if self.available_until ~= nil then
		var2372.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2372.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2372.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2372.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2372
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
	local var2372 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2373, var2374 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2373, var3494 = protoModule.writeString(var2373, var2374, i)
			local var2375 = v:encode()
			var2374, var3496 = protoModule.writeTag(var2373, var2374, 2, protoModule.wireTypes.lengthDelimited)
			var2374, var3496 = protoModule.writeBuffer(var2374, var3496, var2375, buffer.len(var2375))
			local var2376 = var2374
			local var2377 = var3496
			local var2378, var2379 = protoModule.writeTag(buff, var2372, 1, protoModule.wireTypes.lengthDelimited)
			var2378, var3500 = protoModule.writeBuffer(var2378, var2379, var2376, var2377)
			buff = var2378
			var2372 = var2379
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2380, var2381 = protoModule.writeTag(buff, var2372, 2, protoModule.wireTypes.lengthDelimited)
			var2380, var3502 = protoModule.writeString(var2380, var2381, v)
			buff = var2380
			var2372 = var2381
		end
	end
	local buff_1 = buffer.create(var2372)
	buffer.copy(buff_1, 0, buff, 0, var2372)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2382 = t_86.new()
	local var2383 = 0
	while var2383 < buffer.len(p86) do
		local _ = nil
		local var2384 = nil
		local var2385, var2386, var2387 = protoModule.readTag(p86, var2383)
		local var2388 = var2385
		var2384 = var2386
		var2383 = var2387
		
		if var2384 == protoModule.wireTypes.varint then
			local _ = nil
			local var2389, var2390 = protoModule.readVarInt(p86, var2383)
			local _ = var2389
			var2383 = var2390
			continue
		end
		if var2384 == protoModule.wireTypes.lengthDelimited then
			if var2388 == 1 then
				local _ = nil
				local var2391, var2392 = protoModule.readBuffer(p86, var2383)
				var2383 = var2392
				var2391 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2391)
				var2382.entry_map[var2391.key or ""] = var2391.value or t.FeedEntry.new()
			elseif var2388 == 2 then
				local _ = nil
				local var2393, var2394 = protoModule.readBuffer(p86, var2383)
				var2383 = var2394
				table.insert(var2382.entry_order, buffer.tostring(var2393))
			else
				local _ = nil
				local var2395, var2396 = protoModule.readVarInt(p86, var2383)
				var2383 = var2396 + var2395
			end
		elseif var2384 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2397, var2398 = protoModule.readFixed32(p86, var2383)
			local _ = var2397
			var2383 = var2398
		elseif var2384 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2399, var2400 = protoModule.readFixed64(p86, var2383)
			local _ = var2399
			var2383 = var2400
		else
			error("Unsupported wire type: " .. var3506)
		end
	end
	return var2382
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
	local var2401 = t_86.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2401.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2401.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2401.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2401.entry_order = t_1
	end
	return var2401
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
	local var2402 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2403, var2404 = protoModule.writeTag(buff, var2402, 1, protoModule.wireTypes.lengthDelimited)
		var2403, var3534 = protoModule.writeString(var2403, var2404, self.key)
		buff = var2403
		var2402 = var2404
	end
	if self.value ~= nil then
		local var2405 = self.value:encode()
		local var2406, var2407 = protoModule.writeTag(buff, var2402, 2, protoModule.wireTypes.lengthDelimited)
		var2406, var3537 = protoModule.writeBuffer(var2406, var2407, var2405, buffer.len(var2405))
		buff = var2406
		var2402 = var2407
	end
	local buff_1 = buffer.create(var2402)
	buffer.copy(buff_1, 0, buff, 0, var2402)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2402 = t_87.new()
	local var2403 = 0
	while var2403 < buffer.len(p87) do
		local _ = nil
		local var2404 = nil
		local var2405, var2406, var2407 = protoModule.readTag(p87, var2403)
		local var2408 = var2405
		var2404 = var2406
		var2403 = var2407
		
		if var2404 == protoModule.wireTypes.varint then
			local _ = nil
			local var2409, var2410 = protoModule.readVarInt(p87, var2403)
			local _ = var2409
			var2403 = var2410
			continue
		end
		if var2404 == protoModule.wireTypes.lengthDelimited then
			if var2408 == 1 then
				local _ = nil
				local var2411, var2412 = protoModule.readBuffer(p87, var2403)
				var2403 = var2412
				var2402.key = buffer.tostring(var2411)
			elseif var2408 == 2 then
				local _ = nil
				local var2413, var2414 = protoModule.readBuffer(p87, var2403)
				var2403 = var2414
				var2402.value = t.FeedEntry.decode(var2413)
			else
				local _ = nil
				local var2415, var2416 = protoModule.readVarInt(p87, var2403)
				var2403 = var2416 + var2415
			end
		elseif var2404 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2417, var2418 = protoModule.readFixed32(p87, var2403)
			local _ = var2417
			var2403 = var2418
		elseif var2404 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2419, var2420 = protoModule.readFixed64(p87, var2403)
			local _ = var2419
			var2403 = var2420
		else
			error("Unsupported wire type: " .. var3541)
		end
	end
	return var2402
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
	local var2421 = t_87.new()
	
	if self.key ~= nil then
		var2421.key = self.key
	end
	if self.value ~= nil then
		var2421.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2421
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
	local var2421 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2422 = v:encode()
			local var2423, var2424 = protoModule.writeTag(buff, var2421, 1, protoModule.wireTypes.lengthDelimited)
			var2423, var3564 = protoModule.writeBuffer(var2423, var2424, var2422, buffer.len(var2422))
			buff = var2423
			var2421 = var2424
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2425, var2426 = protoModule.writeTag(buff, var2421, 2, protoModule.wireTypes.lengthDelimited)
		var2425, var3566 = protoModule.writeString(var2425, var2426, self.active_category_id)
		buff = var2425
		var2421 = var2426
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2427, var2428 = protoModule.writeTag(buff, var2421, 3, protoModule.wireTypes.varint)
		var2427, var3568 = protoModule.writeVarInt(var2427, var2428, self.active_tooltip_idx)
		buff = var2427
		var2421 = var2428
	end
	local buff_1 = buffer.create(var2421)
	buffer.copy(buff_1, 0, buff, 0, var2421)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2429 = t_88.new()
	local var2430 = 0
	while var2430 < buffer.len(p88) do
		local _ = nil
		local var2431 = nil
		local var2432, var2433, var2434 = protoModule.readTag(p88, var2430)
		local var2435 = var2432
		var2431 = var2433
		var2430 = var2434
		
		if var2431 == protoModule.wireTypes.varint then
			if var2435 == 3 then
				local _ = nil
				local var2436, var2437 = protoModule.readVarIntI64(p88, var2430)
				var2430 = var2437
				var2429.active_tooltip_idx = var2436
			else
				local _ = nil
				local var2438, var2439 = protoModule.readVarInt(p88, var2430)
				local _ = var2438
				var2430 = var2439
			end
		end
		if var2431 == protoModule.wireTypes.lengthDelimited then
			if var2435 == 1 then
				local _ = nil
				local var2440, var2441 = protoModule.readBuffer(p88, var2430)
				var2430 = var2441
				table.insert(var2429.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2440))
			elseif var2435 == 2 then
				local _ = nil
				local var2442, var2443 = protoModule.readBuffer(p88, var2430)
				var2430 = var2443
				var2429.active_category_id = buffer.tostring(var2442)
			else
				local _ = nil
				local var2444, var2445 = protoModule.readVarInt(p88, var2430)
				var2430 = var2445 + var2444
			end
		elseif var2431 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2446, var2447 = protoModule.readFixed32(p88, var2430)
			local _ = var2446
			var2430 = var2447
		elseif var2431 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2448, var2449 = protoModule.readFixed64(p88, var2430)
			local _ = var2448
			var2430 = var2449
		else
			error("Unsupported wire type: " .. var3572)
		end
	end
	return var2429
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
	local var2450 = t_88.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2450.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2450.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2450.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2450.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2450.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2450.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2450
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
	local var2451 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2452, var2453 = protoModule.writeTag(buff, var2451, 1, protoModule.wireTypes.lengthDelimited)
		var2452, var3599 = protoModule.writeString(var2452, var2453, self.marketplace_catalog_category_item_id)
		buff = var2452
		var2451 = var2453
	end
	local buff_1 = buffer.create(var2451)
	buffer.copy(buff_1, 0, buff, 0, var2451)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref)
	local var2451 = t_89.new()
	local var2452 = 0
	while var2452 < buffer.len(p89) do
		local _ = nil
		local var2453 = nil
		local var2454, var2455, var2456 = protoModule.readTag(p89, var2452)
		local var2457 = var2454
		var2453 = var2455
		var2452 = var2456
		
		if var2453 == protoModule.wireTypes.varint then
			local _ = nil
			local var2458, var2459 = protoModule.readVarInt(p89, var2452)
			local _ = var2458
			var2452 = var2459
			continue
		end
		if var2453 == protoModule.wireTypes.lengthDelimited then
			if var2457 == 1 then
				local _ = nil
				local var2460, var2461 = protoModule.readBuffer(p89, var2452)
				var2452 = var2461
				var2451.marketplace_catalog_category_item_id = buffer.tostring(var2460)
			else
				local _ = nil
				local var2462, var2463 = protoModule.readVarInt(p89, var2452)
				var2452 = var2463 + var2462
			end
		elseif var2453 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2464, var2465 = protoModule.readFixed32(p89, var2452)
			local _ = var2464
			var2452 = var2465
		elseif var2453 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2466, var2467 = protoModule.readFixed64(p89, var2452)
			local _ = var2466
			var2452 = var2467
		else
			error("Unsupported wire type: " .. var3603)
		end
	end
	return var2451
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
	local var2468 = t_89.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2468.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2468.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2468
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
	local var2468 = 0
	
	if self.hero_icon ~= nil then
		local var2469, var2470 = protoModule.writeTag(buff, var2468, 1, protoModule.wireTypes.lengthDelimited)
		var2469, var3623 = protoModule.writeString(var2469, var2470, self.hero_icon)
		buff = var2469
		var2468 = var2470
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2471, var2472 = protoModule.writeTag(buff, var2468, 2, protoModule.wireTypes.lengthDelimited)
		var2471, var3625 = protoModule.writeString(var2471, var2472, self.body_dismiss_button_text)
		buff = var2471
		var2468 = var2472
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2473, var2474 = protoModule.writeTag(buff, var2468, 3, protoModule.wireTypes.lengthDelimited)
		var2473, var3627 = protoModule.writeString(var2473, var2474, self.body_title)
		buff = var2473
		var2468 = var2474
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2475, var2476 = protoModule.writeTag(buff, var2468, 4, protoModule.wireTypes.lengthDelimited)
		var2475, var3629 = protoModule.writeString(var2475, var2476, self.body_rich_text)
		buff = var2475
		var2468 = var2476
	end
	if self.terms_link_text ~= nil then
		local var2477, var2478 = protoModule.writeTag(buff, var2468, 5, protoModule.wireTypes.lengthDelimited)
		var2477, var3631 = protoModule.writeString(var2477, var2478, self.terms_link_text)
		buff = var2477
		var2468 = var2478
	end
	if self.terms_title ~= nil then
		local var2479, var2480 = protoModule.writeTag(buff, var2468, 6, protoModule.wireTypes.lengthDelimited)
		var2479, var3633 = protoModule.writeString(var2479, var2480, self.terms_title)
		buff = var2479
		var2468 = var2480
	end
	if self.terms_body_rich_text ~= nil then
		local var2481, var2482 = protoModule.writeTag(buff, var2468, 7, protoModule.wireTypes.lengthDelimited)
		var2481, var3635 = protoModule.writeString(var2481, var2482, self.terms_body_rich_text)
		buff = var2481
		var2468 = var2482
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2483, var2484 = protoModule.writeTag(buff, var2468, 8, protoModule.wireTypes.lengthDelimited)
		var2483, var3637 = protoModule.writeString(var2483, var2484, self.terms_dismiss_button_text)
		buff = var2483
		var2468 = var2484
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2485, var2486 = protoModule.writeTag(buff, var2468, 9, protoModule.wireTypes.lengthDelimited)
		var2485, var3639 = protoModule.writeString(var2485, var2486, self.offer_id)
		buff = var2485
		var2468 = var2486
	end
	local buff_1 = buffer.create(var2468)
	buffer.copy(buff_1, 0, buff, 0, var2468)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2468 = t_90.new()
	local var2469 = 0
	while var2469 < buffer.len(p90) do
		local _ = nil
		local var2470 = nil
		local var2471, var2472, var2473 = protoModule.readTag(p90, var2469)
		local var2474 = var2471
		var2470 = var2472
		var2469 = var2473
		
		if var2470 == protoModule.wireTypes.varint then
			local _ = nil
			local var2475, var2476 = protoModule.readVarInt(p90, var2469)
			local _ = var2475
			var2469 = var2476
			continue
		end
		if var2470 == protoModule.wireTypes.lengthDelimited then
			if var2474 == 1 then
				local _ = nil
				local var2477, var2478 = protoModule.readBuffer(p90, var2469)
				var2469 = var2478
				var2468.hero_icon = buffer.tostring(var2477)
			elseif var2474 == 2 then
				local _ = nil
				local var2479, var2480 = protoModule.readBuffer(p90, var2469)
				var2469 = var2480
				var2468.body_dismiss_button_text = buffer.tostring(var2479)
			elseif var2474 == 3 then
				local _ = nil
				local var2481, var2482 = protoModule.readBuffer(p90, var2469)
				var2469 = var2482
				var2468.body_title = buffer.tostring(var2481)
			elseif var2474 == 4 then
				local _ = nil
				local var2483, var2484 = protoModule.readBuffer(p90, var2469)
				var2469 = var2484
				var2468.body_rich_text = buffer.tostring(var2483)
			elseif var2474 == 5 then
				local _ = nil
				local var2485, var2486 = protoModule.readBuffer(p90, var2469)
				var2469 = var2486
				var2468.terms_link_text = buffer.tostring(var2485)
			elseif var2474 == 6 then
				local _ = nil
				local var2487, var2488 = protoModule.readBuffer(p90, var2469)
				var2469 = var2488
				var2468.terms_title = buffer.tostring(var2487)
			elseif var2474 == 7 then
				local _ = nil
				local var2489, var2490 = protoModule.readBuffer(p90, var2469)
				var2469 = var2490
				var2468.terms_body_rich_text = buffer.tostring(var2489)
			elseif var2474 == 8 then
				local _ = nil
				local var2491, var2492 = protoModule.readBuffer(p90, var2469)
				var2469 = var2492
				var2468.terms_dismiss_button_text = buffer.tostring(var2491)
			elseif var2474 == 9 then
				local _ = nil
				local var2493, var2494 = protoModule.readBuffer(p90, var2469)
				var2469 = var2494
				var2468.offer_id = buffer.tostring(var2493)
			else
				local _ = nil
				local var2495, var2496 = protoModule.readVarInt(p90, var2469)
				var2469 = var2496 + var2495
			end
		elseif var2470 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2497, var2498 = protoModule.readFixed32(p90, var2469)
			local _ = var2497
			var2469 = var2498
		elseif var2470 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2499, var2500 = protoModule.readFixed64(p90, var2469)
			local _ = var2499
			var2469 = var2500
		else
			error("Unsupported wire type: " .. var3643)
		end
	end
	return var2468
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
	local var2501 = t_90.new()
	
	if self.hero_icon ~= nil then
		var2501.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2501.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2501.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2501.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2501.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2501.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2501.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2501.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2501.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2501.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2501.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2501.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2501.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2501.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2501.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2501.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2501.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2501.offer_id = self.offerId
	end
	return var2501
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
	local var2501 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2502 = v:encode()
			local var2503, var2504 = protoModule.writeTag(buff, var2501, 1, protoModule.wireTypes.lengthDelimited)
			var2503, var3680 = protoModule.writeBuffer(var2503, var2504, var2502, buffer.len(var2502))
			buff = var2503
			var2501 = var2504
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2505, var2506 = protoModule.writeTag(buff, var2501, 2, protoModule.wireTypes.varint)
		var2505, var3682 = protoModule.writeVarInt(var2505, var2506, self.preview_columns)
		buff = var2505
		var2501 = var2506
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2507, var2508 = protoModule.writeTag(buff, var2501, 3, protoModule.wireTypes.lengthDelimited)
		var2507, var3684 = protoModule.writeString(var2507, var2508, self.impression_id)
		buff = var2507
		var2501 = var2508
	end
	local buff_1 = buffer.create(var2501)
	buffer.copy(buff_1, 0, buff, 0, var2501)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var2509 = t_91.new()
	local var2510 = 0
	while var2510 < buffer.len(p91) do
		local _ = nil
		local var2511 = nil
		local var2512, var2513, var2514 = protoModule.readTag(p91, var2510)
		local var2515 = var2512
		var2511 = var2513
		var2510 = var2514
		
		if var2511 == protoModule.wireTypes.varint then
			if var2515 == 2 then
				local _ = nil
				local var2516, var2517 = protoModule.readVarIntI32(p91, var2510)
				var2510 = var2517
				var2509.preview_columns = var2516
			else
				local _ = nil
				local var2518, var2519 = protoModule.readVarInt(p91, var2510)
				local _ = var2518
				var2510 = var2519
			end
		end
		if var2511 == protoModule.wireTypes.lengthDelimited then
			if var2515 == 1 then
				local _ = nil
				local var2520, var2521 = protoModule.readBuffer(p91, var2510)
				var2510 = var2521
				table.insert(var2509.items, t.CatalogItemGridInputData_CatalogItem.decode(var2520))
			elseif var2515 == 3 then
				local _ = nil
				local var2522, var2523 = protoModule.readBuffer(p91, var2510)
				var2510 = var2523
				var2509.impression_id = buffer.tostring(var2522)
			else
				local _ = nil
				local var2524, var2525 = protoModule.readVarInt(p91, var2510)
				var2510 = var2525 + var2524
			end
		elseif var2511 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2526, var2527 = protoModule.readFixed32(p91, var2510)
			local _ = var2526
			var2510 = var2527
		elseif var2511 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2528, var2529 = protoModule.readFixed64(p91, var2510)
			local _ = var2528
			var2510 = var2529
		else
			error("Unsupported wire type: " .. var3688)
		end
	end
	return var2509
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
	local var2530 = t_91.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2530.items = t_1
	end
	if self.preview_columns ~= nil then
		var2530.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2530.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2530.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2530.impression_id = self.impressionId
	end
	return var2530
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
	local var2531 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2532, var2533 = protoModule.writeTag(buff, var2531, 1, protoModule.wireTypes.lengthDelimited)
		var2532, var3714 = protoModule.writeString(var2532, var2533, self.id)
		buff = var2532
		var2531 = var2533
	end
	if self.type ~= nil and self.type ~= "" then
		local var2534, var2535 = protoModule.writeTag(buff, var2531, 2, protoModule.wireTypes.lengthDelimited)
		var2534, var3716 = protoModule.writeString(var2534, var2535, self.type)
		buff = var2534
		var2531 = var2535
	end
	local buff_1 = buffer.create(var2531)
	buffer.copy(buff_1, 0, buff, 0, var2531)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref)
	local var2531 = t_92.new()
	local var2532 = 0
	while var2532 < buffer.len(p92) do
		local _ = nil
		local var2533 = nil
		local var2534, var2535, var2536 = protoModule.readTag(p92, var2532)
		local var2537 = var2534
		var2533 = var2535
		var2532 = var2536
		
		if var2533 == protoModule.wireTypes.varint then
			local _ = nil
			local var2538, var2539 = protoModule.readVarInt(p92, var2532)
			local _ = var2538
			var2532 = var2539
			continue
		end
		if var2533 == protoModule.wireTypes.lengthDelimited then
			if var2537 == 1 then
				local _ = nil
				local var2540, var2541 = protoModule.readBuffer(p92, var2532)
				var2532 = var2541
				var2531.id = buffer.tostring(var2540)
			elseif var2537 == 2 then
				local _ = nil
				local var2542, var2543 = protoModule.readBuffer(p92, var2532)
				var2532 = var2543
				var2531.type = buffer.tostring(var2542)
			else
				local _ = nil
				local var2544, var2545 = protoModule.readVarInt(p92, var2532)
				var2532 = var2545 + var2544
			end
		elseif var2533 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2546, var2547 = protoModule.readFixed32(p92, var2532)
			local _ = var2546
			var2532 = var2547
		elseif var2533 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2548, var2549 = protoModule.readFixed64(p92, var2532)
			local _ = var2548
			var2532 = var2549
		else
			error("Unsupported wire type: " .. var3720)
		end
	end
	return var2531
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
	local var2550 = t_92.new()
	
	if self.id ~= nil then
		var2550.id = self.id
	end
	if self.type ~= nil then
		var2550.type = self.type
	end
	return var2550
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
	local var2550 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2551, var2552 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2551, var3742 = protoModule.writeString(var2551, var2552, i)
			local var2553 = v:encode()
			var2552, var3744 = protoModule.writeTag(var2551, var2552, 2, protoModule.wireTypes.lengthDelimited)
			var2552, var3744 = protoModule.writeBuffer(var2552, var3744, var2553, buffer.len(var2553))
			local var2554 = var2552
			local var2555 = var3744
			local var2556, var2557 = protoModule.writeTag(buff, var2550, 1, protoModule.wireTypes.lengthDelimited)
			var2556, var3748 = protoModule.writeBuffer(var2556, var2557, var2554, var2555)
			buff = var2556
			var2550 = var2557
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2558, var2559 = protoModule.writeTag(buff, var2550, 2, protoModule.wireTypes.lengthDelimited)
			var2558, var3750 = protoModule.writeString(var2558, var2559, v)
			buff = var2558
			var2550 = var2559
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2560, var2561 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2560, var3752 = protoModule.writeString(var2560, var2561, i)
			local var2562 = v:encode()
			var2561, var3754 = protoModule.writeTag(var2560, var2561, 2, protoModule.wireTypes.lengthDelimited)
			var2561, var3754 = protoModule.writeBuffer(var2561, var3754, var2562, buffer.len(var2562))
			local var2563 = var2561
			local var2564 = var3754
			local var2565, var2566 = protoModule.writeTag(buff, var2550, 3, protoModule.wireTypes.lengthDelimited)
			var2565, var3758 = protoModule.writeBuffer(var2565, var2566, var2563, var2564)
			buff = var2565
			var2550 = var2566
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2567, var2568 = protoModule.writeTag(buff, var2550, 4, protoModule.wireTypes.lengthDelimited)
		var2567, var3760 = protoModule.writeString(var2567, var2568, self.search_session_id)
		buff = var2567
		var2550 = var2568
	end
	local buff_1 = buffer.create(var2550)
	buffer.copy(buff_1, 0, buff, 0, var2550)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2569 = t_93.new()
	local var2570 = 0
	while var2570 < buffer.len(p93) do
		local _ = nil
		local var2571 = nil
		local var2572, var2573, var2574 = protoModule.readTag(p93, var2570)
		local var2575 = var2572
		var2571 = var2573
		var2570 = var2574
		
		if var2571 == protoModule.wireTypes.varint then
			local _ = nil
			local var2576, var2577 = protoModule.readVarInt(p93, var2570)
			local _ = var2576
			var2570 = var2577
			continue
		end
		if var2571 == protoModule.wireTypes.lengthDelimited then
			if var2575 == 1 then
				local _ = nil
				local var2578, var2579 = protoModule.readBuffer(p93, var2570)
				var2570 = var2579
				var2578 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2578)
				var2569.entry_map[var2578.key or ""] = var2578.value or t.FeedEntry.new()
			elseif var2575 == 2 then
				local _ = nil
				local var2580, var2581 = protoModule.readBuffer(p93, var2570)
				var2570 = var2581
				table.insert(var2569.entry_order, buffer.tostring(var2580))
			elseif var2575 == 3 then
				local _ = nil
				local var2582, var2583 = protoModule.readBuffer(p93, var2570)
				var2570 = var2583
				var2582 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2582)
				var2569.content_pools[var2582.key or ""] = var2582.value or t.ContentPool.new()
			elseif var2575 == 4 then
				local _ = nil
				local var2584, var2585 = protoModule.readBuffer(p93, var2570)
				var2570 = var2585
				var2569.search_session_id = buffer.tostring(var2584)
			else
				local _ = nil
				local var2586, var2587 = protoModule.readVarInt(p93, var2570)
				var2570 = var2587 + var2586
			end
		elseif var2571 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2588, var2589 = protoModule.readFixed32(p93, var2570)
			local _ = var2588
			var2570 = var2589
		elseif var2571 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2590, var2591 = protoModule.readFixed64(p93, var2570)
			local _ = var2590
			var2570 = var2591
		else
			error("Unsupported wire type: " .. var3764)
		end
	end
	return var2569
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
	local var2592 = t_93.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2592.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2592.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2592.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2592.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2592.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2592.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2592.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2592.search_session_id = self.searchSessionId
	end
	return var2592
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
	local var2593 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2594, var2595 = protoModule.writeTag(buff, var2593, 1, protoModule.wireTypes.lengthDelimited)
		var2594, var3799 = protoModule.writeString(var2594, var2595, self.key)
		buff = var2594
		var2593 = var2595
	end
	if self.value ~= nil then
		local var2596 = self.value:encode()
		local var2597, var2598 = protoModule.writeTag(buff, var2593, 2, protoModule.wireTypes.lengthDelimited)
		var2597, var3802 = protoModule.writeBuffer(var2597, var2598, var2596, buffer.len(var2596))
		buff = var2597
		var2593 = var2598
	end
	local buff_1 = buffer.create(var2593)
	buffer.copy(buff_1, 0, buff, 0, var2593)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var2593 = t_94.new()
	local var2594 = 0
	while var2594 < buffer.len(p94) do
		local _ = nil
		local var2595 = nil
		local var2596, var2597, var2598 = protoModule.readTag(p94, var2594)
		local var2599 = var2596
		var2595 = var2597
		var2594 = var2598
		
		if var2595 == protoModule.wireTypes.varint then
			local _ = nil
			local var2600, var2601 = protoModule.readVarInt(p94, var2594)
			local _ = var2600
			var2594 = var2601
			continue
		end
		if var2595 == protoModule.wireTypes.lengthDelimited then
			if var2599 == 1 then
				local _ = nil
				local var2602, var2603 = protoModule.readBuffer(p94, var2594)
				var2594 = var2603
				var2593.key = buffer.tostring(var2602)
			elseif var2599 == 2 then
				local _ = nil
				local var2604, var2605 = protoModule.readBuffer(p94, var2594)
				var2594 = var2605
				var2593.value = t.FeedEntry.decode(var2604)
			else
				local _ = nil
				local var2606, var2607 = protoModule.readVarInt(p94, var2594)
				var2594 = var2607 + var2606
			end
		elseif var2595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2608, var2609 = protoModule.readFixed32(p94, var2594)
			local _ = var2608
			var2594 = var2609
		elseif var2595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2610, var2611 = protoModule.readFixed64(p94, var2594)
			local _ = var2610
			var2594 = var2611
		else
			error("Unsupported wire type: " .. var3806)
		end
	end
	return var2593
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
	local var2612 = t_94.new()
	
	if self.key ~= nil then
		var2612.key = self.key
	end
	if self.value ~= nil then
		var2612.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2612
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
	local var2612 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2613, var2614 = protoModule.writeTag(buff, var2612, 1, protoModule.wireTypes.lengthDelimited)
		var2613, var3828 = protoModule.writeString(var2613, var2614, self.key)
		buff = var2613
		var2612 = var2614
	end
	if self.value ~= nil then
		local var2615 = self.value:encode()
		local var2616, var2617 = protoModule.writeTag(buff, var2612, 2, protoModule.wireTypes.lengthDelimited)
		var2616, var3831 = protoModule.writeBuffer(var2616, var2617, var2615, buffer.len(var2615))
		buff = var2616
		var2612 = var2617
	end
	local buff_1 = buffer.create(var2612)
	buffer.copy(buff_1, 0, buff, 0, var2612)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2612 = t_95.new()
	local var2613 = 0
	while var2613 < buffer.len(p95) do
		local _ = nil
		local var2614 = nil
		local var2615, var2616, var2617 = protoModule.readTag(p95, var2613)
		local var2618 = var2615
		var2614 = var2616
		var2613 = var2617
		
		if var2614 == protoModule.wireTypes.varint then
			local _ = nil
			local var2619, var2620 = protoModule.readVarInt(p95, var2613)
			local _ = var2619
			var2613 = var2620
			continue
		end
		if var2614 == protoModule.wireTypes.lengthDelimited then
			if var2618 == 1 then
				local _ = nil
				local var2621, var2622 = protoModule.readBuffer(p95, var2613)
				var2613 = var2622
				var2612.key = buffer.tostring(var2621)
			elseif var2618 == 2 then
				local _ = nil
				local var2623, var2624 = protoModule.readBuffer(p95, var2613)
				var2613 = var2624
				var2612.value = t.ContentPool.decode(var2623)
			else
				local _ = nil
				local var2625, var2626 = protoModule.readVarInt(p95, var2613)
				var2613 = var2626 + var2625
			end
		elseif var2614 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2627, var2628 = protoModule.readFixed32(p95, var2613)
			local _ = var2627
			var2613 = var2628
		elseif var2614 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2629, var2630 = protoModule.readFixed64(p95, var2613)
			local _ = var2629
			var2613 = var2630
		else
			error("Unsupported wire type: " .. var3835)
		end
	end
	return var2612
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
	local var2631 = t_95.new()
	
	if self.key ~= nil then
		var2631.key = self.key
	end
	if self.value ~= nil then
		var2631.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2631
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
	local var2631 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2632, var2633 = protoModule.writeTag(buff, var2631, 1, protoModule.wireTypes.lengthDelimited)
		var2632, var3857 = protoModule.writeString(var2632, var2633, self.universe_id)
		buff = var2632
		var2631 = var2633
	end
	if self.is_content_locked then
		local var2634, var2635 = protoModule.writeTag(buff, var2631, 2, protoModule.wireTypes.varint)
		var2634, var3859 = protoModule.writeVarInt(var2634, var2635, if self.is_content_locked then 1 else 0)
		buff = var2634
		var2631 = var2635
	end
	local buff_1 = buffer.create(var2631)
	buffer.copy(buff_1, 0, buff, 0, var2631)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref)
	local var2631 = t_96.new()
	local var2632 = 0
	while var2632 < buffer.len(p96) do
		local _ = nil
		local var2633 = nil
		local var2634, var2635, var2636 = protoModule.readTag(p96, var2632)
		local var2637 = var2634
		var2633 = var2635
		var2632 = var2636
		
		if var2633 == protoModule.wireTypes.varint then
			if var2637 == 2 then
				local _ = nil
				local var2638, var2639 = protoModule.readVarInt(p96, var2632)
				var2632 = var2639
				var2631.is_content_locked = var2638 ~= 0
			else
				local _ = nil
				local var2640, var2641 = protoModule.readVarInt(p96, var2632)
				local _ = var2640
				var2632 = var2641
			end
		end
		if var2633 == protoModule.wireTypes.lengthDelimited then
			if var2637 == 1 then
				local _ = nil
				local var2642, var2643 = protoModule.readBuffer(p96, var2632)
				var2632 = var2643
				var2631.universe_id = buffer.tostring(var2642)
			else
				local _ = nil
				local var2644, var2645 = protoModule.readVarInt(p96, var2632)
				var2632 = var2645 + var2644
			end
		elseif var2633 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2646, var2647 = protoModule.readFixed32(p96, var2632)
			local _ = var2646
			var2632 = var2647
		elseif var2633 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2648, var2649 = protoModule.readFixed64(p96, var2632)
			local _ = var2648
			var2632 = var2649
		else
			error("Unsupported wire type: " .. var3863)
		end
	end
	return var2631
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
	local var2650 = t_96.new()
	
	if self.universe_id ~= nil then
		var2650.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2650.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2650.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2650.is_content_locked = self.isContentLocked
	end
	return var2650
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
	local var2650 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2651, var2652 = protoModule.writeTag(buff, var2650, 1, protoModule.wireTypes.lengthDelimited)
		var2651, var3885 = protoModule.writeString(var2651, var2652, self.overview_rich_text)
		buff = var2651
		var2650 = var2652
	end
	if self.result_entry ~= nil then
		local var2653 = self.result_entry:encode()
		local var2654, var2655 = protoModule.writeTag(buff, var2650, 2, protoModule.wireTypes.lengthDelimited)
		var2654, var3888 = protoModule.writeBuffer(var2654, var2655, var2653, buffer.len(var2653))
		buff = var2654
		var2650 = var2655
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2656, var2657 = protoModule.writeTag(buff, var2650, 3, protoModule.wireTypes.lengthDelimited)
			var2656, var3890 = protoModule.writeString(var2656, var2657, v)
			buff = var2656
			var2650 = var2657
		end
	end
	if self.show_loading then
		local var2658, var2659 = protoModule.writeTag(buff, var2650, 4, protoModule.wireTypes.varint)
		var2658, var3892 = protoModule.writeVarInt(var2658, var2659, if self.show_loading then 1 else 0)
		buff = var2658
		var2650 = var2659
	end
	if self.title ~= nil and self.title ~= "" then
		local var2660, var2661 = protoModule.writeTag(buff, var2650, 5, protoModule.wireTypes.lengthDelimited)
		var2660, var3894 = protoModule.writeString(var2660, var2661, self.title)
		buff = var2660
		var2650 = var2661
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2662, var2663 = protoModule.writeTag(buff, var2650, 6, protoModule.wireTypes.lengthDelimited)
		var2662, var3896 = protoModule.writeString(var2662, var2663, self.search_query)
		buff = var2662
		var2650 = var2663
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2664, var2665 = protoModule.writeTag(buff, var2650, 8, protoModule.wireTypes.lengthDelimited)
		var2664, var3898 = protoModule.writeString(var2664, var2665, self.universe_ids)
		buff = var2664
		var2650 = var2665
	end
	local buff_1 = buffer.create(var2650)
	buffer.copy(buff_1, 0, buff, 0, var2650)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var2666 = t_97.new()
	local var2667 = 0
	while var2667 < buffer.len(p97) do
		local _ = nil
		local var2668 = nil
		local var2669, var2670, var2671 = protoModule.readTag(p97, var2667)
		local var2672 = var2669
		var2668 = var2670
		var2667 = var2671
		
		if var2668 == protoModule.wireTypes.varint then
			if var2672 == 4 then
				local _ = nil
				local var2673, var2674 = protoModule.readVarInt(p97, var2667)
				var2667 = var2674
				var2666.show_loading = var2673 ~= 0
			else
				local _ = nil
				local var2675, var2676 = protoModule.readVarInt(p97, var2667)
				local _ = var2675
				var2667 = var2676
			end
		end
		if var2668 == protoModule.wireTypes.lengthDelimited then
			if var2672 == 1 then
				local _ = nil
				local var2677, var2678 = protoModule.readBuffer(p97, var2667)
				var2667 = var2678
				var2666.overview_rich_text = buffer.tostring(var2677)
			elseif var2672 == 2 then
				local _ = nil
				local var2679, var2680 = protoModule.readBuffer(p97, var2667)
				var2667 = var2680
				var2666.result_entry = t.FeedEntry.decode(var2679)
			elseif var2672 == 3 then
				local _ = nil
				local var2681, var2682 = protoModule.readBuffer(p97, var2667)
				var2667 = var2682
				table.insert(var2666.follow_up_queries, buffer.tostring(var2681))
			elseif var2672 == 5 then
				local _ = nil
				local var2683, var2684 = protoModule.readBuffer(p97, var2667)
				var2667 = var2684
				var2666.title = buffer.tostring(var2683)
			elseif var2672 == 6 then
				local _ = nil
				local var2685, var2686 = protoModule.readBuffer(p97, var2667)
				var2667 = var2686
				var2666.search_query = buffer.tostring(var2685)
			elseif var2672 == 8 then
				local _ = nil
				local var2687, var2688 = protoModule.readBuffer(p97, var2667)
				var2667 = var2688
				var2666.universe_ids = buffer.tostring(var2687)
			else
				local _ = nil
				local var2689, var2690 = protoModule.readVarInt(p97, var2667)
				var2667 = var2690 + var2689
			end
		elseif var2668 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2691, var2692 = protoModule.readFixed32(p97, var2667)
			local _ = var2691
			var2667 = var2692
		elseif var2668 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2693, var2694 = protoModule.readFixed64(p97, var2667)
			local _ = var2693
			var2667 = var2694
		else
			error("Unsupported wire type: " .. var3902)
		end
	end
	return var2666
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
	local var2695 = t_97.new()
	
	if self.overview_rich_text ~= nil then
		var2695.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2695.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2695.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2695.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2695.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2695.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2695.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2695.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2695.title = self.title
	end
	if self.search_query ~= nil then
		var2695.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2695.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2695.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2695.universe_ids = self.universeIds
	end
	return var2695
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
	local var2696 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2697, var2698 = protoModule.writeTag(buff, var2696, 1, protoModule.wireTypes.lengthDelimited)
		var2697, var3937 = protoModule.writeString(var2697, var2698, self.title)
		buff = var2697
		var2696 = var2698
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2699 = v:encode()
			local var2700, var2701 = protoModule.writeTag(buff, var2696, 2, protoModule.wireTypes.lengthDelimited)
			var2700, var3940 = protoModule.writeBuffer(var2700, var2701, var2699, buffer.len(var2699))
			buff = var2700
			var2696 = var2701
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2702, var2703 = protoModule.writeTag(buff, var2696, 3, protoModule.wireTypes.varint)
		var2702, var3942 = protoModule.writeVarInt(var2702, var2703, self.max_visible_rows)
		buff = var2702
		var2696 = var2703
	end
	if self.sort_id ~= nil then
		local var2704, var2705 = protoModule.writeTag(buff, var2696, 4, protoModule.wireTypes.lengthDelimited)
		var2704, var3944 = protoModule.writeString(var2704, var2705, self.sort_id)
		buff = var2704
		var2696 = var2705
	end
	local buff_1 = buffer.create(var2696)
	buffer.copy(buff_1, 0, buff, 0, var2696)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2706 = t_98.new()
	local var2707 = 0
	while var2707 < buffer.len(p98) do
		local _ = nil
		local var2708 = nil
		local var2709, var2710, var2711 = protoModule.readTag(p98, var2707)
		local var2712 = var2709
		var2708 = var2710
		var2707 = var2711
		
		if var2708 == protoModule.wireTypes.varint then
			if var2712 == 3 then
				local _ = nil
				local var2713, var2714 = protoModule.readVarIntI32(p98, var2707)
				var2707 = var2714
				var2706.max_visible_rows = var2713
			else
				local _ = nil
				local var2715, var2716 = protoModule.readVarInt(p98, var2707)
				local _ = var2715
				var2707 = var2716
			end
		end
		if var2708 == protoModule.wireTypes.lengthDelimited then
			if var2712 == 1 then
				local _ = nil
				local var2717, var2718 = protoModule.readBuffer(p98, var2707)
				var2707 = var2718
				var2706.title = buffer.tostring(var2717)
			elseif var2712 == 2 then
				local _ = nil
				local var2719, var2720 = protoModule.readBuffer(p98, var2707)
				var2707 = var2720
				table.insert(var2706.user_items, t.UserListInputData_UserItem.decode(var2719))
			elseif var2712 == 4 then
				local _ = nil
				local var2721, var2722 = protoModule.readBuffer(p98, var2707)
				var2707 = var2722
				var2706.sort_id = buffer.tostring(var2721)
			else
				local _ = nil
				local var2723, var2724 = protoModule.readVarInt(p98, var2707)
				var2707 = var2724 + var2723
			end
		elseif var2708 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2725, var2726 = protoModule.readFixed32(p98, var2707)
			local _ = var2725
			var2707 = var2726
		elseif var2708 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2727, var2728 = protoModule.readFixed64(p98, var2707)
			local _ = var2727
			var2707 = var2728
		else
			error("Unsupported wire type: " .. var3948)
		end
	end
	return var2706
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
	local var2729 = t_98.new()
	
	if self.title ~= nil then
		var2729.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2729.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2729.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2729.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2729.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2729.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2729.sort_id = self.sortId
	end
	return var2729
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
	local var2730 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2731, var2732 = protoModule.writeTag(buff, var2730, 1, protoModule.wireTypes.lengthDelimited)
		var2731, var3977 = protoModule.writeString(var2731, var2732, self.user_id)
		buff = var2731
		var2730 = var2732
	end
	local buff_1 = buffer.create(var2730)
	buffer.copy(buff_1, 0, buff, 0, var2730)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2730 = t_99.new()
	local var2731 = 0
	while var2731 < buffer.len(p99) do
		local _ = nil
		local var2732 = nil
		local var2733, var2734, var2735 = protoModule.readTag(p99, var2731)
		local var2736 = var2733
		var2732 = var2734
		var2731 = var2735
		
		if var2732 == protoModule.wireTypes.varint then
			local _ = nil
			local var2737, var2738 = protoModule.readVarInt(p99, var2731)
			local _ = var2737
			var2731 = var2738
			continue
		end
		if var2732 == protoModule.wireTypes.lengthDelimited then
			if var2736 == 1 then
				local _ = nil
				local var2739, var2740 = protoModule.readBuffer(p99, var2731)
				var2731 = var2740
				var2730.user_id = buffer.tostring(var2739)
			else
				local _ = nil
				local var2741, var2742 = protoModule.readVarInt(p99, var2731)
				var2731 = var2742 + var2741
			end
		elseif var2732 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2743, var2744 = protoModule.readFixed32(p99, var2731)
			local _ = var2743
			var2731 = var2744
		elseif var2732 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2745, var2746 = protoModule.readFixed64(p99, var2731)
			local _ = var2745
			var2731 = var2746
		else
			error("Unsupported wire type: " .. var3981)
		end
	end
	return var2730
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
	local var2747 = t_99.new()
	
	if self.user_id ~= nil then
		var2747.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2747.user_id = self.userId
	end
	return var2747
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
	local var2747 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2748, var2749 = protoModule.writeTag(buff, var2747, 1, protoModule.wireTypes.lengthDelimited)
		var2748, var4001 = protoModule.writeString(var2748, var2749, self.title)
		buff = var2748
		var2747 = var2749
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2750 = v:encode()
			local var2751, var2752 = protoModule.writeTag(buff, var2747, 2, protoModule.wireTypes.lengthDelimited)
			var2751, var4004 = protoModule.writeBuffer(var2751, var2752, var2750, buffer.len(var2750))
			buff = var2751
			var2747 = var2752
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2753, var2754 = protoModule.writeTag(buff, var2747, 3, protoModule.wireTypes.varint)
		var2753, var4006 = protoModule.writeVarInt(var2753, var2754, self.max_visible_rows)
		buff = var2753
		var2747 = var2754
	end
	if self.sort_id ~= nil then
		local var2755, var2756 = protoModule.writeTag(buff, var2747, 4, protoModule.wireTypes.lengthDelimited)
		var2755, var4008 = protoModule.writeString(var2755, var2756, self.sort_id)
		buff = var2755
		var2747 = var2756
	end
	local buff_1 = buffer.create(var2747)
	buffer.copy(buff_1, 0, buff, 0, var2747)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var2757 = t_100.new()
	local var2758 = 0
	while var2758 < buffer.len(p100) do
		local _ = nil
		local var2759 = nil
		local var2760, var2761, var2762 = protoModule.readTag(p100, var2758)
		local var2763 = var2760
		var2759 = var2761
		var2758 = var2762
		
		if var2759 == protoModule.wireTypes.varint then
			if var2763 == 3 then
				local _ = nil
				local var2764, var2765 = protoModule.readVarIntI32(p100, var2758)
				var2758 = var2765
				var2757.max_visible_rows = var2764
			else
				local _ = nil
				local var2766, var2767 = protoModule.readVarInt(p100, var2758)
				local _ = var2766
				var2758 = var2767
			end
		end
		if var2759 == protoModule.wireTypes.lengthDelimited then
			if var2763 == 1 then
				local _ = nil
				local var2768, var2769 = protoModule.readBuffer(p100, var2758)
				var2758 = var2769
				var2757.title = buffer.tostring(var2768)
			elseif var2763 == 2 then
				local _ = nil
				local var2770, var2771 = protoModule.readBuffer(p100, var2758)
				var2758 = var2771
				table.insert(var2757.items, t.CatalogItemListInputData_CatalogItem.decode(var2770))
			elseif var2763 == 4 then
				local _ = nil
				local var2772, var2773 = protoModule.readBuffer(p100, var2758)
				var2758 = var2773
				var2757.sort_id = buffer.tostring(var2772)
			else
				local _ = nil
				local var2774, var2775 = protoModule.readVarInt(p100, var2758)
				var2758 = var2775 + var2774
			end
		elseif var2759 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2776, var2777 = protoModule.readFixed32(p100, var2758)
			local _ = var2776
			var2758 = var2777
		elseif var2759 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2778, var2779 = protoModule.readFixed64(p100, var2758)
			local _ = var2778
			var2758 = var2779
		else
			error("Unsupported wire type: " .. var4012)
		end
	end
	return var2757
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
	local var2780 = t_100.new()
	
	if self.title ~= nil then
		var2780.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2780.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2780.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2780.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2780.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2780.sort_id = self.sortId
	end
	return var2780
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
	local var2781 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2782, var2783 = protoModule.writeTag(buff, var2781, 1, protoModule.wireTypes.lengthDelimited)
		var2782, var4040 = protoModule.writeString(var2782, var2783, self.item_id)
		buff = var2782
		var2781 = var2783
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2784, var2785 = protoModule.writeTag(buff, var2781, 2, protoModule.wireTypes.lengthDelimited)
		var2784, var4042 = protoModule.writeString(var2784, var2785, self.item_type)
		buff = var2784
		var2781 = var2785
	end
	local buff_1 = buffer.create(var2781)
	buffer.copy(buff_1, 0, buff, 0, var2781)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref)
	local var2781 = t_101.new()
	local var2782 = 0
	while var2782 < buffer.len(p101) do
		local _ = nil
		local var2783 = nil
		local var2784, var2785, var2786 = protoModule.readTag(p101, var2782)
		local var2787 = var2784
		var2783 = var2785
		var2782 = var2786
		
		if var2783 == protoModule.wireTypes.varint then
			local _ = nil
			local var2788, var2789 = protoModule.readVarInt(p101, var2782)
			local _ = var2788
			var2782 = var2789
			continue
		end
		if var2783 == protoModule.wireTypes.lengthDelimited then
			if var2787 == 1 then
				local _ = nil
				local var2790, var2791 = protoModule.readBuffer(p101, var2782)
				var2782 = var2791
				var2781.item_id = buffer.tostring(var2790)
			elseif var2787 == 2 then
				local _ = nil
				local var2792, var2793 = protoModule.readBuffer(p101, var2782)
				var2782 = var2793
				var2781.item_type = buffer.tostring(var2792)
			else
				local _ = nil
				local var2794, var2795 = protoModule.readVarInt(p101, var2782)
				var2782 = var2795 + var2794
			end
		elseif var2783 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2796, var2797 = protoModule.readFixed32(p101, var2782)
			local _ = var2796
			var2782 = var2797
		elseif var2783 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2798, var2799 = protoModule.readFixed64(p101, var2782)
			local _ = var2798
			var2782 = var2799
		else
			error("Unsupported wire type: " .. var4046)
		end
	end
	return var2781
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
	local var2800 = t_101.new()
	
	if self.item_id ~= nil then
		var2800.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2800.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2800.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2800.item_type = self.itemType
	end
	return var2800
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
	local var2800 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2801, var2802 = protoModule.writeTag(buff, var2800, 1, protoModule.wireTypes.lengthDelimited)
		var2801, var4068 = protoModule.writeString(var2801, var2802, self.universe_id)
		buff = var2801
		var2800 = var2802
	end
	local buff_1 = buffer.create(var2800)
	buffer.copy(buff_1, 0, buff, 0, var2800)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2800 = t_102.new()
	local var2801 = 0
	while var2801 < buffer.len(p102) do
		local _ = nil
		local var2802 = nil
		local var2803, var2804, var2805 = protoModule.readTag(p102, var2801)
		local var2806 = var2803
		var2802 = var2804
		var2801 = var2805
		
		if var2802 == protoModule.wireTypes.varint then
			local _ = nil
			local var2807, var2808 = protoModule.readVarInt(p102, var2801)
			local _ = var2807
			var2801 = var2808
			continue
		end
		if var2802 == protoModule.wireTypes.lengthDelimited then
			if var2806 == 1 then
				local _ = nil
				local var2809, var2810 = protoModule.readBuffer(p102, var2801)
				var2801 = var2810
				var2800.universe_id = buffer.tostring(var2809)
			else
				local _ = nil
				local var2811, var2812 = protoModule.readVarInt(p102, var2801)
				var2801 = var2812 + var2811
			end
		elseif var2802 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2813, var2814 = protoModule.readFixed32(p102, var2801)
			local _ = var2813
			var2801 = var2814
		elseif var2802 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2815, var2816 = protoModule.readFixed64(p102, var2801)
			local _ = var2815
			var2801 = var2816
		else
			error("Unsupported wire type: " .. var4072)
		end
	end
	return var2800
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
	local var2817 = t_102.new()
	
	if self.universe_id ~= nil then
		var2817.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2817.universe_id = self.universeId
	end
	return var2817
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
	local var2817 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2818, var2819 = protoModule.writeTag(buff, var2817, 1, protoModule.wireTypes.lengthDelimited)
		var2818, var4092 = protoModule.writeString(var2818, var2819, self.title)
		buff = var2818
		var2817 = var2819
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2820, var2821 = protoModule.writeTag(buff, var2817, 2, protoModule.wireTypes.lengthDelimited)
		var2820, var4094 = protoModule.writeString(var2820, var2821, self.subtitle)
		buff = var2820
		var2817 = var2821
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2822 = v:encode()
			local var2823, var2824 = protoModule.writeTag(buff, var2817, 3, protoModule.wireTypes.lengthDelimited)
			var2823, var4097 = protoModule.writeBuffer(var2823, var2824, var2822, buffer.len(var2822))
			buff = var2823
			var2817 = var2824
		end
	end
	local buff_1 = buffer.create(var2817)
	buffer.copy(buff_1, 0, buff, 0, var2817)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref), t (ref)
	local var2825 = t_103.new()
	local var2826 = 0
	while var2826 < buffer.len(p103) do
		local _ = nil
		local var2827 = nil
		local var2828, var2829, var2830 = protoModule.readTag(p103, var2826)
		local var2831 = var2828
		var2827 = var2829
		var2826 = var2830
		
		if var2827 == protoModule.wireTypes.varint then
			local _ = nil
			local var2832, var2833 = protoModule.readVarInt(p103, var2826)
			local _ = var2832
			var2826 = var2833
			continue
		end
		if var2827 == protoModule.wireTypes.lengthDelimited then
			if var2831 == 1 then
				local _ = nil
				local var2834, var2835 = protoModule.readBuffer(p103, var2826)
				var2826 = var2835
				var2825.title = buffer.tostring(var2834)
			elseif var2831 == 2 then
				local _ = nil
				local var2836, var2837 = protoModule.readBuffer(p103, var2826)
				var2826 = var2837
				var2825.subtitle = buffer.tostring(var2836)
			elseif var2831 == 3 then
				local _ = nil
				local var2838, var2839 = protoModule.readBuffer(p103, var2826)
				var2826 = var2839
				table.insert(var2825.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2838))
			else
				local _ = nil
				local var2840, var2841 = protoModule.readVarInt(p103, var2826)
				var2826 = var2841 + var2840
			end
		elseif var2827 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2842, var2843 = protoModule.readFixed32(p103, var2826)
			local _ = var2842
			var2826 = var2843
		elseif var2827 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2844, var2845 = protoModule.readFixed64(p103, var2826)
			local _ = var2844
			var2826 = var2845
		else
			error("Unsupported wire type: " .. var4101)
		end
	end
	return var2825
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
	local var2846 = t_103.new()
	
	if self.title ~= nil then
		var2846.title = self.title
	end
	if self.subtitle ~= nil then
		var2846.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2846.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2846.moment_items = t_1
	end
	return var2846
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
	local var2847 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2848, var2849 = protoModule.writeTag(buff, var2847, 1, protoModule.wireTypes.lengthDelimited)
		var2848, var4128 = protoModule.writeString(var2848, var2849, self.moment_id)
		buff = var2848
		var2847 = var2849
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2850, var2851 = protoModule.writeTag(buff, var2847, 2, protoModule.wireTypes.lengthDelimited)
		var2850, var4130 = protoModule.writeString(var2850, var2851, self.video_asset_id)
		buff = var2850
		var2847 = var2851
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2852, var2853 = protoModule.writeTag(buff, var2847, 3, protoModule.wireTypes.lengthDelimited)
		var2852, var4132 = protoModule.writeString(var2852, var2853, self.target_universe_id)
		buff = var2852
		var2847 = var2853
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2854, var2855 = protoModule.writeTag(buff, var2847, 4, protoModule.wireTypes.lengthDelimited)
		var2854, var4134 = protoModule.writeString(var2854, var2855, self.target_place_id)
		buff = var2854
		var2847 = var2855
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2856, var2857 = protoModule.writeTag(buff, var2847, 5, protoModule.wireTypes.lengthDelimited)
		var2856, var4136 = protoModule.writeString(var2856, var2857, self.feed_item_id)
		buff = var2856
		var2847 = var2857
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2858, var2859 = protoModule.writeTag(buff, var2847, 6, protoModule.wireTypes.lengthDelimited)
		var2858, var4138 = protoModule.writeString(var2858, var2859, self.capture_universe_id)
		buff = var2858
		var2847 = var2859
	end
	local buff_1 = buffer.create(var2847)
	buffer.copy(buff_1, 0, buff, 0, var2847)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2847 = t_104.new()
	local var2848 = 0
	while var2848 < buffer.len(p104) do
		local _ = nil
		local var2849 = nil
		local var2850, var2851, var2852 = protoModule.readTag(p104, var2848)
		local var2853 = var2850
		var2849 = var2851
		var2848 = var2852
		
		if var2849 == protoModule.wireTypes.varint then
			local _ = nil
			local var2854, var2855 = protoModule.readVarInt(p104, var2848)
			local _ = var2854
			var2848 = var2855
			continue
		end
		if var2849 == protoModule.wireTypes.lengthDelimited then
			if var2853 == 1 then
				local _ = nil
				local var2856, var2857 = protoModule.readBuffer(p104, var2848)
				var2848 = var2857
				var2847.moment_id = buffer.tostring(var2856)
			elseif var2853 == 2 then
				local _ = nil
				local var2858, var2859 = protoModule.readBuffer(p104, var2848)
				var2848 = var2859
				var2847.video_asset_id = buffer.tostring(var2858)
			elseif var2853 == 3 then
				local _ = nil
				local var2860, var2861 = protoModule.readBuffer(p104, var2848)
				var2848 = var2861
				var2847.target_universe_id = buffer.tostring(var2860)
			elseif var2853 == 4 then
				local _ = nil
				local var2862, var2863 = protoModule.readBuffer(p104, var2848)
				var2848 = var2863
				var2847.target_place_id = buffer.tostring(var2862)
			elseif var2853 == 5 then
				local _ = nil
				local var2864, var2865 = protoModule.readBuffer(p104, var2848)
				var2848 = var2865
				var2847.feed_item_id = buffer.tostring(var2864)
			elseif var2853 == 6 then
				local _ = nil
				local var2866, var2867 = protoModule.readBuffer(p104, var2848)
				var2848 = var2867
				var2847.capture_universe_id = buffer.tostring(var2866)
			else
				local _ = nil
				local var2868, var2869 = protoModule.readVarInt(p104, var2848)
				var2848 = var2869 + var2868
			end
		elseif var2849 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2870, var2871 = protoModule.readFixed32(p104, var2848)
			local _ = var2870
			var2848 = var2871
		elseif var2849 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2872, var2873 = protoModule.readFixed64(p104, var2848)
			local _ = var2872
			var2848 = var2873
		else
			error("Unsupported wire type: " .. var4142)
		end
	end
	return var2847
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
	local var2874 = t_104.new()
	
	if self.moment_id ~= nil then
		var2874.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var2874.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var2874.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2874.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var2874.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var2874.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var2874.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var2874.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var2874.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var2874.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var2874.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var2874.capture_universe_id = self.captureUniverseId
	end
	return var2874
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
	local var2874 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2875, var2876 = protoModule.writeTag(buff, var2874, 1, protoModule.wireTypes.lengthDelimited)
		var2875, var4172 = protoModule.writeString(var2875, var2876, self.title)
		buff = var2875
		var2874 = var2876
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2877, var2878 = protoModule.writeTag(buff, var2874, 2, protoModule.wireTypes.lengthDelimited)
		var2877, var4174 = protoModule.writeString(var2877, var2878, self.subtitle)
		buff = var2877
		var2874 = var2878
	end
	local buff_1 = buffer.create(var2874)
	buffer.copy(buff_1, 0, buff, 0, var2874)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2874 = t_105.new()
	local var2875 = 0
	while var2875 < buffer.len(p105) do
		local _ = nil
		local var2876 = nil
		local var2877, var2878, var2879 = protoModule.readTag(p105, var2875)
		local var2880 = var2877
		var2876 = var2878
		var2875 = var2879
		
		if var2876 == protoModule.wireTypes.varint then
			local _ = nil
			local var2881, var2882 = protoModule.readVarInt(p105, var2875)
			local _ = var2881
			var2875 = var2882
			continue
		end
		if var2876 == protoModule.wireTypes.lengthDelimited then
			if var2880 == 1 then
				local _ = nil
				local var2883, var2884 = protoModule.readBuffer(p105, var2875)
				var2875 = var2884
				var2874.title = buffer.tostring(var2883)
			elseif var2880 == 2 then
				local _ = nil
				local var2885, var2886 = protoModule.readBuffer(p105, var2875)
				var2875 = var2886
				var2874.subtitle = buffer.tostring(var2885)
			else
				local _ = nil
				local var2887, var2888 = protoModule.readVarInt(p105, var2875)
				var2875 = var2888 + var2887
			end
		elseif var2876 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2889, var2890 = protoModule.readFixed32(p105, var2875)
			local _ = var2889
			var2875 = var2890
		elseif var2876 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2891, var2892 = protoModule.readFixed64(p105, var2875)
			local _ = var2891
			var2875 = var2892
		else
			error("Unsupported wire type: " .. var4178)
		end
	end
	return var2874
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
	local var2893 = t_105.new()
	
	if self.title ~= nil then
		var2893.title = self.title
	end
	if self.subtitle ~= nil then
		var2893.subtitle = self.subtitle
	end
	return var2893
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
	local var2893 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var2894, var2895 = protoModule.writeTag(buff, var2893, 1, protoModule.wireTypes.lengthDelimited)
		var2894, var4200 = protoModule.writeString(var2894, var2895, self.primary_cta_button_text)
		buff = var2894
		var2893 = var2895
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var2896, var2897 = protoModule.writeTag(buff, var2893, 2, protoModule.wireTypes.lengthDelimited)
		var2896, var4202 = protoModule.writeString(var2896, var2897, self.secondary_cta_button_text)
		buff = var2896
		var2893 = var2897
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var2898, var2899 = protoModule.writeTag(buff, var2893, 3, protoModule.wireTypes.lengthDelimited)
		var2898, var4204 = protoModule.writeString(var2898, var2899, self.primary_cta_type)
		buff = var2898
		var2893 = var2899
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var2900, var2901 = protoModule.writeTag(buff, var2893, 4, protoModule.wireTypes.lengthDelimited)
		var2900, var4206 = protoModule.writeString(var2900, var2901, self.secondary_cta_type)
		buff = var2900
		var2893 = var2901
	end
	local buff_1 = buffer.create(var2893)
	buffer.copy(buff_1, 0, buff, 0, var2893)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var2893 = t_106.new()
	local var2894 = 0
	while var2894 < buffer.len(p106) do
		local _ = nil
		local var2895 = nil
		local var2896, var2897, var2898 = protoModule.readTag(p106, var2894)
		local var2899 = var2896
		var2895 = var2897
		var2894 = var2898
		
		if var2895 == protoModule.wireTypes.varint then
			local _ = nil
			local var2900, var2901 = protoModule.readVarInt(p106, var2894)
			local _ = var2900
			var2894 = var2901
			continue
		end
		if var2895 == protoModule.wireTypes.lengthDelimited then
			if var2899 == 1 then
				local _ = nil
				local var2902, var2903 = protoModule.readBuffer(p106, var2894)
				var2894 = var2903
				var2893.primary_cta_button_text = buffer.tostring(var2902)
			elseif var2899 == 2 then
				local _ = nil
				local var2904, var2905 = protoModule.readBuffer(p106, var2894)
				var2894 = var2905
				var2893.secondary_cta_button_text = buffer.tostring(var2904)
			elseif var2899 == 3 then
				local _ = nil
				local var2906, var2907 = protoModule.readBuffer(p106, var2894)
				var2894 = var2907
				var2893.primary_cta_type = buffer.tostring(var2906)
			elseif var2899 == 4 then
				local _ = nil
				local var2908, var2909 = protoModule.readBuffer(p106, var2894)
				var2894 = var2909
				var2893.secondary_cta_type = buffer.tostring(var2908)
			else
				local _ = nil
				local var2910, var2911 = protoModule.readVarInt(p106, var2894)
				var2894 = var2911 + var2910
			end
		elseif var2895 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2912, var2913 = protoModule.readFixed32(p106, var2894)
			local _ = var2912
			var2894 = var2913
		elseif var2895 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2914, var2915 = protoModule.readFixed64(p106, var2894)
			local _ = var2914
			var2894 = var2915
		else
			error("Unsupported wire type: " .. var4210)
		end
	end
	return var2893
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
	local var2916 = t_106.new()
	
	if self.primary_cta_button_text ~= nil then
		var2916.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var2916.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var2916.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var2916.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var2916.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var2916.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var2916.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var2916.secondary_cta_type = self.secondaryCtaType
	end
	return var2916
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
	local var2916 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2917, var2918 = protoModule.writeTag(buff, var2916, 1, protoModule.wireTypes.lengthDelimited)
		var2917, var4236 = protoModule.writeString(var2917, var2918, self.image_asset_id)
		buff = var2917
		var2916 = var2918
	end
	local buff_1 = buffer.create(var2916)
	buffer.copy(buff_1, 0, buff, 0, var2916)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2916 = t_107.new()
	local var2917 = 0
	while var2917 < buffer.len(p107) do
		local _ = nil
		local var2918 = nil
		local var2919, var2920, var2921 = protoModule.readTag(p107, var2917)
		local var2922 = var2919
		var2918 = var2920
		var2917 = var2921
		
		if var2918 == protoModule.wireTypes.varint then
			local _ = nil
			local var2923, var2924 = protoModule.readVarInt(p107, var2917)
			local _ = var2923
			var2917 = var2924
			continue
		end
		if var2918 == protoModule.wireTypes.lengthDelimited then
			if var2922 == 1 then
				local _ = nil
				local var2925, var2926 = protoModule.readBuffer(p107, var2917)
				var2917 = var2926
				var2916.image_asset_id = buffer.tostring(var2925)
			else
				local _ = nil
				local var2927, var2928 = protoModule.readVarInt(p107, var2917)
				var2917 = var2928 + var2927
			end
		elseif var2918 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2929, var2930 = protoModule.readFixed32(p107, var2917)
			local _ = var2929
			var2917 = var2930
		elseif var2918 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2931, var2932 = protoModule.readFixed64(p107, var2917)
			local _ = var2931
			var2917 = var2932
		else
			error("Unsupported wire type: " .. var4240)
		end
	end
	return var2916
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
	local var2933 = t_107.new()
	
	if self.image_asset_id ~= nil then
		var2933.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var2933.image_asset_id = self.imageAssetId
	end
	return var2933
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
	local var2933 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2934, var2935 = protoModule.writeTag(buff, var2933, 1, protoModule.wireTypes.lengthDelimited)
		var2934, var4260 = protoModule.writeString(var2934, var2935, self.video_asset_id)
		buff = var2934
		var2933 = var2935
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var2936, var2937 = protoModule.writeTag(buff, var2933, 2, protoModule.wireTypes.lengthDelimited)
		var2936, var4262 = protoModule.writeString(var2936, var2937, self.loading_image_asset_id)
		buff = var2936
		var2933 = var2937
	end
	local buff_1 = buffer.create(var2933)
	buffer.copy(buff_1, 0, buff, 0, var2933)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref)
	local var2933 = t_108.new()
	local var2934 = 0
	while var2934 < buffer.len(p108) do
		local _ = nil
		local var2935 = nil
		local var2936, var2937, var2938 = protoModule.readTag(p108, var2934)
		local var2939 = var2936
		var2935 = var2937
		var2934 = var2938
		
		if var2935 == protoModule.wireTypes.varint then
			local _ = nil
			local var2940, var2941 = protoModule.readVarInt(p108, var2934)
			local _ = var2940
			var2934 = var2941
			continue
		end
		if var2935 == protoModule.wireTypes.lengthDelimited then
			if var2939 == 1 then
				local _ = nil
				local var2942, var2943 = protoModule.readBuffer(p108, var2934)
				var2934 = var2943
				var2933.video_asset_id = buffer.tostring(var2942)
			elseif var2939 == 2 then
				local _ = nil
				local var2944, var2945 = protoModule.readBuffer(p108, var2934)
				var2934 = var2945
				var2933.loading_image_asset_id = buffer.tostring(var2944)
			else
				local _ = nil
				local var2946, var2947 = protoModule.readVarInt(p108, var2934)
				var2934 = var2947 + var2946
			end
		elseif var2935 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2948, var2949 = protoModule.readFixed32(p108, var2934)
			local _ = var2948
			var2934 = var2949
		elseif var2935 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2950, var2951 = protoModule.readFixed64(p108, var2934)
			local _ = var2950
			var2934 = var2951
		else
			error("Unsupported wire type: " .. var4266)
		end
	end
	return var2933
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
	local var2952 = t_108.new()
	
	if self.video_asset_id ~= nil then
		var2952.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2952.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var2952.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var2952.loading_image_asset_id = self.loadingImageAssetId
	end
	return var2952
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
	local var2952 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var2953, var2954 = protoModule.writeTag(buff, var2952, 1, protoModule.wireTypes.lengthDelimited)
		var2953, var4288 = protoModule.writeString(var2953, var2954, self.text)
		buff = var2953
		var2952 = var2954
	end
	if self.is_rendered_text then
		local var2955, var2956 = protoModule.writeTag(buff, var2952, 2, protoModule.wireTypes.varint)
		var2955, var4290 = protoModule.writeVarInt(var2955, var2956, if self.is_rendered_text then 1 else 0)
		buff = var2955
		var2952 = var2956
	end
	local buff_1 = buffer.create(var2952)
	buffer.copy(buff_1, 0, buff, 0, var2952)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref)
	local var2952 = t_109.new()
	local var2953 = 0
	while var2953 < buffer.len(p109) do
		local _ = nil
		local var2954 = nil
		local var2955, var2956, var2957 = protoModule.readTag(p109, var2953)
		local var2958 = var2955
		var2954 = var2956
		var2953 = var2957
		
		if var2954 == protoModule.wireTypes.varint then
			if var2958 == 2 then
				local _ = nil
				local var2959, var2960 = protoModule.readVarInt(p109, var2953)
				var2953 = var2960
				var2952.is_rendered_text = var2959 ~= 0
			else
				local _ = nil
				local var2961, var2962 = protoModule.readVarInt(p109, var2953)
				local _ = var2961
				var2953 = var2962
			end
		end
		if var2954 == protoModule.wireTypes.lengthDelimited then
			if var2958 == 1 then
				local _ = nil
				local var2963, var2964 = protoModule.readBuffer(p109, var2953)
				var2953 = var2964
				var2952.text = buffer.tostring(var2963)
			else
				local _ = nil
				local var2965, var2966 = protoModule.readVarInt(p109, var2953)
				var2953 = var2966 + var2965
			end
		elseif var2954 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2967, var2968 = protoModule.readFixed32(p109, var2953)
			local _ = var2967
			var2953 = var2968
		elseif var2954 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2969, var2970 = protoModule.readFixed64(p109, var2953)
			local _ = var2969
			var2953 = var2970
		else
			error("Unsupported wire type: " .. var4294)
		end
	end
	return var2952
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
	local var2971 = t_109.new()
	
	if self.text ~= nil then
		var2971.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var2971.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var2971.is_rendered_text = self.isRenderedText
	end
	return var2971
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
	local var2971 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2972, var2973 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2972, var4316 = protoModule.writeString(var2972, var2973, i)
			local var2974 = v:encode()
			var2973, var4318 = protoModule.writeTag(var2972, var2973, 2, protoModule.wireTypes.lengthDelimited)
			var2973, var4318 = protoModule.writeBuffer(var2973, var4318, var2974, buffer.len(var2974))
			local var2975 = var2973
			local var2976 = var4318
			local var2977, var2978 = protoModule.writeTag(buff, var2971, 1, protoModule.wireTypes.lengthDelimited)
			var2977, var4322 = protoModule.writeBuffer(var2977, var2978, var2975, var2976)
			buff = var2977
			var2971 = var2978
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2979, var2980 = protoModule.writeTag(buff, var2971, 2, protoModule.wireTypes.lengthDelimited)
			var2979, var4324 = protoModule.writeString(var2979, var2980, v)
			buff = var2979
			var2971 = var2980
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var2981, var2982 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2981, var4326 = protoModule.writeString(var2981, var2982, i)
			local var2983 = v:encode()
			var2982, var4328 = protoModule.writeTag(var2981, var2982, 2, protoModule.wireTypes.lengthDelimited)
			var2982, var4328 = protoModule.writeBuffer(var2982, var4328, var2983, buffer.len(var2983))
			local var2984 = var2982
			local var2985 = var4328
			local var2986, var2987 = protoModule.writeTag(buff, var2971, 3, protoModule.wireTypes.lengthDelimited)
			var2986, var4332 = protoModule.writeBuffer(var2986, var2987, var2984, var2985)
			buff = var2986
			var2971 = var2987
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2988, var2989 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2988, var4334 = protoModule.writeString(var2988, var2989, i)
			local var2990 = v:encode()
			var2989, var4336 = protoModule.writeTag(var2988, var2989, 2, protoModule.wireTypes.lengthDelimited)
			var2989, var4336 = protoModule.writeBuffer(var2989, var4336, var2990, buffer.len(var2990))
			local var2991 = var2989
			local var2992 = var4336
			local var2993, var2994 = protoModule.writeTag(buff, var2971, 4, protoModule.wireTypes.lengthDelimited)
			var2993, var4340 = protoModule.writeBuffer(var2993, var2994, var2991, var2992)
			buff = var2993
			var2971 = var2994
		end
	end
	local buff_1 = buffer.create(var2971)
	buffer.copy(buff_1, 0, buff, 0, var2971)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var2995 = t_110.new()
	local var2996 = 0
	while var2996 < buffer.len(p110) do
		local _ = nil
		local var2997 = nil
		local var2998, var2999, var3000 = protoModule.readTag(p110, var2996)
		local var3001 = var2998
		var2997 = var2999
		var2996 = var3000
		
		if var2997 == protoModule.wireTypes.varint then
			local _ = nil
			local var3002, var3003 = protoModule.readVarInt(p110, var2996)
			local _ = var3002
			var2996 = var3003
			continue
		end
		if var2997 == protoModule.wireTypes.lengthDelimited then
			if var3001 == 1 then
				local _ = nil
				local var3004, var3005 = protoModule.readBuffer(p110, var2996)
				var2996 = var3005
				var3004 = t.VerticalFeedInputData_EntryMapEntry.decode(var3004)
				var2995.entry_map[var3004.key or ""] = var3004.value or t.FeedEntry.new()
			elseif var3001 == 2 then
				local _ = nil
				local var3006, var3007 = protoModule.readBuffer(p110, var2996)
				var2996 = var3007
				table.insert(var2995.entry_order, buffer.tostring(var3006))
			elseif var3001 == 3 then
				local _ = nil
				local var3008, var3009 = protoModule.readBuffer(p110, var2996)
				var2996 = var3009
				var3008 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var3008)
				var2995.entry_order_map[var3008.key or ""] = var3008.value or t.EntryOrder.new()
			elseif var3001 == 4 then
				local _ = nil
				local var3010, var3011 = protoModule.readBuffer(p110, var2996)
				var2996 = var3011
				var3010 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var3010)
				var2995.content_pools[var3010.key or ""] = var3010.value or t.ContentPool.new()
			else
				local _ = nil
				local var3012, var3013 = protoModule.readVarInt(p110, var2996)
				var2996 = var3013 + var3012
			end
		elseif var2997 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3014, var3015 = protoModule.readFixed32(p110, var2996)
			local _ = var3014
			var2996 = var3015
		elseif var2997 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3016, var3017 = protoModule.readFixed64(p110, var2996)
			local _ = var3016
			var2996 = var3017
		else
			error("Unsupported wire type: " .. var4344)
		end
	end
	return var2995
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
	local var3018 = t_110.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3018.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3018.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3018.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3018.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3018.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var3018.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3018.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3018.content_pools = t_1
	end
	return var3018
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
	local var3019 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3020, var3021 = protoModule.writeTag(buff, var3019, 1, protoModule.wireTypes.lengthDelimited)
		var3020, var4382 = protoModule.writeString(var3020, var3021, self.key)
		buff = var3020
		var3019 = var3021
	end
	if self.value ~= nil then
		local var3022 = self.value:encode()
		local var3023, var3024 = protoModule.writeTag(buff, var3019, 2, protoModule.wireTypes.lengthDelimited)
		var3023, var4385 = protoModule.writeBuffer(var3023, var3024, var3022, buffer.len(var3022))
		buff = var3023
		var3019 = var3024
	end
	local buff_1 = buffer.create(var3019)
	buffer.copy(buff_1, 0, buff, 0, var3019)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var3019 = t_111.new()
	local var3020 = 0
	while var3020 < buffer.len(p111) do
		local _ = nil
		local var3021 = nil
		local var3022, var3023, var3024 = protoModule.readTag(p111, var3020)
		local var3025 = var3022
		var3021 = var3023
		var3020 = var3024
		
		if var3021 == protoModule.wireTypes.varint then
			local _ = nil
			local var3026, var3027 = protoModule.readVarInt(p111, var3020)
			local _ = var3026
			var3020 = var3027
			continue
		end
		if var3021 == protoModule.wireTypes.lengthDelimited then
			if var3025 == 1 then
				local _ = nil
				local var3028, var3029 = protoModule.readBuffer(p111, var3020)
				var3020 = var3029
				var3019.key = buffer.tostring(var3028)
			elseif var3025 == 2 then
				local _ = nil
				local var3030, var3031 = protoModule.readBuffer(p111, var3020)
				var3020 = var3031
				var3019.value = t.FeedEntry.decode(var3030)
			else
				local _ = nil
				local var3032, var3033 = protoModule.readVarInt(p111, var3020)
				var3020 = var3033 + var3032
			end
		elseif var3021 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3034, var3035 = protoModule.readFixed32(p111, var3020)
			local _ = var3034
			var3020 = var3035
		elseif var3021 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3036, var3037 = protoModule.readFixed64(p111, var3020)
			local _ = var3036
			var3020 = var3037
		else
			error("Unsupported wire type: " .. var4389)
		end
	end
	return var3019
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
	local var3038 = t_111.new()
	
	if self.key ~= nil then
		var3038.key = self.key
	end
	if self.value ~= nil then
		var3038.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3038
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
	local var3038 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3039, var3040 = protoModule.writeTag(buff, var3038, 1, protoModule.wireTypes.lengthDelimited)
		var3039, var4411 = protoModule.writeString(var3039, var3040, self.key)
		buff = var3039
		var3038 = var3040
	end
	if self.value ~= nil then
		local var3041 = self.value:encode()
		local var3042, var3043 = protoModule.writeTag(buff, var3038, 2, protoModule.wireTypes.lengthDelimited)
		var3042, var4414 = protoModule.writeBuffer(var3042, var3043, var3041, buffer.len(var3041))
		buff = var3042
		var3038 = var3043
	end
	local buff_1 = buffer.create(var3038)
	buffer.copy(buff_1, 0, buff, 0, var3038)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var3038 = t_112.new()
	local var3039 = 0
	while var3039 < buffer.len(p112) do
		local _ = nil
		local var3040 = nil
		local var3041, var3042, var3043 = protoModule.readTag(p112, var3039)
		local var3044 = var3041
		var3040 = var3042
		var3039 = var3043
		
		if var3040 == protoModule.wireTypes.varint then
			local _ = nil
			local var3045, var3046 = protoModule.readVarInt(p112, var3039)
			local _ = var3045
			var3039 = var3046
			continue
		end
		if var3040 == protoModule.wireTypes.lengthDelimited then
			if var3044 == 1 then
				local _ = nil
				local var3047, var3048 = protoModule.readBuffer(p112, var3039)
				var3039 = var3048
				var3038.key = buffer.tostring(var3047)
			elseif var3044 == 2 then
				local _ = nil
				local var3049, var3050 = protoModule.readBuffer(p112, var3039)
				var3039 = var3050
				var3038.value = t.EntryOrder.decode(var3049)
			else
				local _ = nil
				local var3051, var3052 = protoModule.readVarInt(p112, var3039)
				var3039 = var3052 + var3051
			end
		elseif var3040 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3053, var3054 = protoModule.readFixed32(p112, var3039)
			local _ = var3053
			var3039 = var3054
		elseif var3040 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3055, var3056 = protoModule.readFixed64(p112, var3039)
			local _ = var3055
			var3039 = var3056
		else
			error("Unsupported wire type: " .. var4418)
		end
	end
	return var3038
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
	local var3057 = t_112.new()
	
	if self.key ~= nil then
		var3057.key = self.key
	end
	if self.value ~= nil then
		var3057.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var3057
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
	local var3057 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3058, var3059 = protoModule.writeTag(buff, var3057, 1, protoModule.wireTypes.lengthDelimited)
		var3058, var4440 = protoModule.writeString(var3058, var3059, self.key)
		buff = var3058
		var3057 = var3059
	end
	if self.value ~= nil then
		local var3060 = self.value:encode()
		local var3061, var3062 = protoModule.writeTag(buff, var3057, 2, protoModule.wireTypes.lengthDelimited)
		var3061, var4443 = protoModule.writeBuffer(var3061, var3062, var3060, buffer.len(var3060))
		buff = var3061
		var3057 = var3062
	end
	local buff_1 = buffer.create(var3057)
	buffer.copy(buff_1, 0, buff, 0, var3057)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var3057 = t_113.new()
	local var3058 = 0
	while var3058 < buffer.len(p113) do
		local _ = nil
		local var3059 = nil
		local var3060, var3061, var3062 = protoModule.readTag(p113, var3058)
		local var3063 = var3060
		var3059 = var3061
		var3058 = var3062
		
		if var3059 == protoModule.wireTypes.varint then
			local _ = nil
			local var3064, var3065 = protoModule.readVarInt(p113, var3058)
			local _ = var3064
			var3058 = var3065
			continue
		end
		if var3059 == protoModule.wireTypes.lengthDelimited then
			if var3063 == 1 then
				local _ = nil
				local var3066, var3067 = protoModule.readBuffer(p113, var3058)
				var3058 = var3067
				var3057.key = buffer.tostring(var3066)
			elseif var3063 == 2 then
				local _ = nil
				local var3068, var3069 = protoModule.readBuffer(p113, var3058)
				var3058 = var3069
				var3057.value = t.ContentPool.decode(var3068)
			else
				local _ = nil
				local var3070, var3071 = protoModule.readVarInt(p113, var3058)
				var3058 = var3071 + var3070
			end
		elseif var3059 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3072, var3073 = protoModule.readFixed32(p113, var3058)
			local _ = var3072
			var3058 = var3073
		elseif var3059 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3074, var3075 = protoModule.readFixed64(p113, var3058)
			local _ = var3074
			var3058 = var3075
		else
			error("Unsupported wire type: " .. var4447)
		end
	end
	return var3057
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
	local var3076 = t_113.new()
	
	if self.key ~= nil then
		var3076.key = self.key
	end
	if self.value ~= nil then
		var3076.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3076
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
	local var3076 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3077 = self.foreground_header_entry:encode()
		local var3078, var3079 = protoModule.writeTag(buff, var3076, 1, protoModule.wireTypes.lengthDelimited)
		var3078, var4470 = protoModule.writeBuffer(var3078, var3079, var3077, buffer.len(var3077))
		buff = var3078
		var3076 = var3079
	end
	if self.background_header_entry ~= nil then
		local var3080 = self.background_header_entry:encode()
		local var3081, var3082 = protoModule.writeTag(buff, var3076, 2, protoModule.wireTypes.lengthDelimited)
		var3081, var4473 = protoModule.writeBuffer(var3081, var3082, var3080, buffer.len(var3080))
		buff = var3081
		var3076 = var3082
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3083, var3084 = protoModule.writeTag(buff, var3076, 3, protoModule.wireTypes.lengthDelimited)
		var3083, var4475 = protoModule.writeString(var3083, var3084, self.layout_variant)
		buff = var3083
		var3076 = var3084
	end
	local buff_1 = buffer.create(var3076)
	buffer.copy(buff_1, 0, buff, 0, var3076)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref), t (ref)
	local var3076 = t_114.new()
	local var3077 = 0
	while var3077 < buffer.len(p114) do
		local _ = nil
		local var3078 = nil
		local var3079, var3080, var3081 = protoModule.readTag(p114, var3077)
		local var3082 = var3079
		var3078 = var3080
		var3077 = var3081
		
		if var3078 == protoModule.wireTypes.varint then
			local _ = nil
			local var3083, var3084 = protoModule.readVarInt(p114, var3077)
			local _ = var3083
			var3077 = var3084
			continue
		end
		if var3078 == protoModule.wireTypes.lengthDelimited then
			if var3082 == 1 then
				local _ = nil
				local var3085, var3086 = protoModule.readBuffer(p114, var3077)
				var3077 = var3086
				var3076.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3085)
			elseif var3082 == 2 then
				local _ = nil
				local var3087, var3088 = protoModule.readBuffer(p114, var3077)
				var3077 = var3088
				var3076.background_header_entry = t.BackgroundHeaderEntry.decode(var3087)
			elseif var3082 == 3 then
				local _ = nil
				local var3089, var3090 = protoModule.readBuffer(p114, var3077)
				var3077 = var3090
				var3076.layout_variant = buffer.tostring(var3089)
			else
				local _ = nil
				local var3091, var3092 = protoModule.readVarInt(p114, var3077)
				var3077 = var3092 + var3091
			end
		elseif var3078 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3093, var3094 = protoModule.readFixed32(p114, var3077)
			local _ = var3093
			var3077 = var3094
		elseif var3078 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3095, var3096 = protoModule.readFixed64(p114, var3077)
			local _ = var3095
			var3077 = var3096
		else
			error("Unsupported wire type: " .. var4479)
		end
	end
	return var3076
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
	local var3097 = t_114.new()
	
	if self.foreground_header_entry ~= nil then
		var3097.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3097.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3097.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3097.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3097.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3097.layout_variant = self.layoutVariant
	end
	return var3097
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
	local var3097 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3098, var3099 = protoModule.writeTag(buff, var3097, 1, protoModule.wireTypes.lengthDelimited)
		var3098, var4503 = protoModule.writeString(var3098, var3099, self.cta_button_text)
		buff = var3098
		var3097 = var3099
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3100, var3101 = protoModule.writeTag(buff, var3097, 2, protoModule.wireTypes.lengthDelimited)
		var3100, var4505 = protoModule.writeString(var3100, var3101, self.cta_type)
		buff = var3100
		var3097 = var3101
	end
	local buff_1 = buffer.create(var3097)
	buffer.copy(buff_1, 0, buff, 0, var3097)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref)
	local var3097 = t_115.new()
	local var3098 = 0
	while var3098 < buffer.len(p115) do
		local _ = nil
		local var3099 = nil
		local var3100, var3101, var3102 = protoModule.readTag(p115, var3098)
		local var3103 = var3100
		var3099 = var3101
		var3098 = var3102
		
		if var3099 == protoModule.wireTypes.varint then
			local _ = nil
			local var3104, var3105 = protoModule.readVarInt(p115, var3098)
			local _ = var3104
			var3098 = var3105
			continue
		end
		if var3099 == protoModule.wireTypes.lengthDelimited then
			if var3103 == 1 then
				local _ = nil
				local var3106, var3107 = protoModule.readBuffer(p115, var3098)
				var3098 = var3107
				var3097.cta_button_text = buffer.tostring(var3106)
			elseif var3103 == 2 then
				local _ = nil
				local var3108, var3109 = protoModule.readBuffer(p115, var3098)
				var3098 = var3109
				var3097.cta_type = buffer.tostring(var3108)
			else
				local _ = nil
				local var3110, var3111 = protoModule.readVarInt(p115, var3098)
				var3098 = var3111 + var3110
			end
		elseif var3099 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3112, var3113 = protoModule.readFixed32(p115, var3098)
			local _ = var3112
			var3098 = var3113
		elseif var3099 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3114, var3115 = protoModule.readFixed64(p115, var3098)
			local _ = var3114
			var3098 = var3115
		else
			error("Unsupported wire type: " .. var4509)
		end
	end
	return var3097
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
	local var3116 = t_115.new()
	
	if self.cta_button_text ~= nil then
		var3116.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3116.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3116.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3116.cta_type = self.ctaType
	end
	return var3116
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
	local var3116 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3117, var3118 = protoModule.writeTag(buff, var3116, 1, protoModule.wireTypes.lengthDelimited)
		var3117, var4531 = protoModule.writeString(var3117, var3118, self.title)
		buff = var3117
		var3116 = var3118
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3119, var3120 = protoModule.writeTag(buff, var3116, 2, protoModule.wireTypes.lengthDelimited)
		var3119, var4533 = protoModule.writeString(var3119, var3120, self.cta_button_text)
		buff = var3119
		var3116 = var3120
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3121, var3122 = protoModule.writeTag(buff, var3116, 3, protoModule.wireTypes.lengthDelimited)
		var3121, var4535 = protoModule.writeString(var3121, var3122, self.image_asset_id)
		buff = var3121
		var3116 = var3122
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3123, var3124 = protoModule.writeTag(buff, var3116, 4, protoModule.wireTypes.lengthDelimited)
		var3123, var4537 = protoModule.writeString(var3123, var3124, self.cta_type)
		buff = var3123
		var3116 = var3124
	end
	local buff_1 = buffer.create(var3116)
	buffer.copy(buff_1, 0, buff, 0, var3116)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3116 = t_116.new()
	local var3117 = 0
	while var3117 < buffer.len(p116) do
		local _ = nil
		local var3118 = nil
		local var3119, var3120, var3121 = protoModule.readTag(p116, var3117)
		local var3122 = var3119
		var3118 = var3120
		var3117 = var3121
		
		if var3118 == protoModule.wireTypes.varint then
			local _ = nil
			local var3123, var3124 = protoModule.readVarInt(p116, var3117)
			local _ = var3123
			var3117 = var3124
			continue
		end
		if var3118 == protoModule.wireTypes.lengthDelimited then
			if var3122 == 1 then
				local _ = nil
				local var3125, var3126 = protoModule.readBuffer(p116, var3117)
				var3117 = var3126
				var3116.title = buffer.tostring(var3125)
			elseif var3122 == 2 then
				local _ = nil
				local var3127, var3128 = protoModule.readBuffer(p116, var3117)
				var3117 = var3128
				var3116.cta_button_text = buffer.tostring(var3127)
			elseif var3122 == 3 then
				local _ = nil
				local var3129, var3130 = protoModule.readBuffer(p116, var3117)
				var3117 = var3130
				var3116.image_asset_id = buffer.tostring(var3129)
			elseif var3122 == 4 then
				local _ = nil
				local var3131, var3132 = protoModule.readBuffer(p116, var3117)
				var3117 = var3132
				var3116.cta_type = buffer.tostring(var3131)
			else
				local _ = nil
				local var3133, var3134 = protoModule.readVarInt(p116, var3117)
				var3117 = var3134 + var3133
			end
		elseif var3118 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3135, var3136 = protoModule.readFixed32(p116, var3117)
			local _ = var3135
			var3117 = var3136
		elseif var3118 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3137, var3138 = protoModule.readFixed64(p116, var3117)
			local _ = var3137
			var3117 = var3138
		else
			error("Unsupported wire type: " .. var4541)
		end
	end
	return var3116
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
	local var3139 = t_116.new()
	
	if self.title ~= nil then
		var3139.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3139.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3139.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3139.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3139.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3139.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3139.cta_type = self.ctaType
	end
	return var3139
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
		universe_id = if p117 == nil or p117.universe_id == nil then nil else p117.universe_id,
		title = if p117 == nil or p117.title == nil then nil else p117.title,
		subtitle = if p117 == nil or p117.subtitle == nil then nil else p117.subtitle,
		badge_text = if p117 == nil or p117.badge_text == nil then nil else p117.badge_text,
		foreground = if p117 == nil or p117.foreground == nil then nil else p117.foreground,
		background = if p117 == nil or p117.background == nil then nil else p117.background,
		title_image = if p117 == nil or p117.title_image == nil then nil else p117.title_image,
		asset_title = if p117 == nil or p117.asset_title == nil then nil else p117.asset_title,
		asset_subtitle = if p117 == nil or p117.asset_subtitle == nil then nil else p117.asset_subtitle,
		gradient = if p117 == nil or p117.gradient == nil then nil else p117.gradient,
		playable_text = if p117 == nil or p117.playable_text == nil then nil else p117.playable_text,
		collection_id = if p117 == nil or p117.collection_id == nil then nil else p117.collection_id,
		campaign_id = if p117 == nil or p117.campaign_id == nil then nil else p117.campaign_id,
		cohort_id = if p117 == nil or p117.cohort_id == nil then nil else p117.cohort_id,
		sort_id = if p117 == nil or p117.sort_id == nil then nil else p117.sort_id,
		hero_unit_id = if p117 == nil or p117.hero_unit_id == nil then nil else p117.hero_unit_id,
		analytics_id = if p117 == nil or p117.analytics_id == nil then nil else p117.analytics_id,
		is_sponsored = if p117 == nil or p117.is_sponsored == nil then nil else p117.is_sponsored
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3139 = 0
	
	if self.universe_id ~= nil then
		local var3140, var3141 = protoModule.writeTag(buff, var3139, 1, protoModule.wireTypes.lengthDelimited)
		var3140, var4567 = protoModule.writeString(var3140, var3141, self.universe_id)
		buff = var3140
		var3139 = var3141
	end
	if self.title ~= nil then
		local var3142, var3143 = protoModule.writeTag(buff, var3139, 2, protoModule.wireTypes.lengthDelimited)
		var3142, var4569 = protoModule.writeString(var3142, var3143, self.title)
		buff = var3142
		var3139 = var3143
	end
	if self.subtitle ~= nil then
		local var3144, var3145 = protoModule.writeTag(buff, var3139, 3, protoModule.wireTypes.lengthDelimited)
		var3144, var4571 = protoModule.writeString(var3144, var3145, self.subtitle)
		buff = var3144
		var3139 = var3145
	end
	if self.badge_text ~= nil then
		local var3146, var3147 = protoModule.writeTag(buff, var3139, 4, protoModule.wireTypes.lengthDelimited)
		var3146, var4573 = protoModule.writeString(var3146, var3147, self.badge_text)
		buff = var3146
		var3139 = var3147
	end
	if self.foreground ~= nil then
		local var3148 = self.foreground:encode()
		local var3149, var3150 = protoModule.writeTag(buff, var3139, 5, protoModule.wireTypes.lengthDelimited)
		var3149, var4576 = protoModule.writeBuffer(var3149, var3150, var3148, buffer.len(var3148))
		buff = var3149
		var3139 = var3150
	end
	if self.background ~= nil then
		local var3151 = self.background:encode()
		local var3152, var3153 = protoModule.writeTag(buff, var3139, 6, protoModule.wireTypes.lengthDelimited)
		var3152, var4579 = protoModule.writeBuffer(var3152, var3153, var3151, buffer.len(var3151))
		buff = var3152
		var3139 = var3153
	end
	if self.title_image ~= nil then
		local var3154 = self.title_image:encode()
		local var3155, var3156 = protoModule.writeTag(buff, var3139, 7, protoModule.wireTypes.lengthDelimited)
		var3155, var4582 = protoModule.writeBuffer(var3155, var3156, var3154, buffer.len(var3154))
		buff = var3155
		var3139 = var3156
	end
	if self.asset_title ~= nil then
		local var3157, var3158 = protoModule.writeTag(buff, var3139, 8, protoModule.wireTypes.lengthDelimited)
		var3157, var4584 = protoModule.writeString(var3157, var3158, self.asset_title)
		buff = var3157
		var3139 = var3158
	end
	if self.asset_subtitle ~= nil then
		local var3159, var3160 = protoModule.writeTag(buff, var3139, 9, protoModule.wireTypes.lengthDelimited)
		var3159, var4586 = protoModule.writeString(var3159, var3160, self.asset_subtitle)
		buff = var3159
		var3139 = var3160
	end
	if self.gradient ~= nil then
		local var3161 = self.gradient:encode()
		local var3162, var3163 = protoModule.writeTag(buff, var3139, 10, protoModule.wireTypes.lengthDelimited)
		var3162, var4589 = protoModule.writeBuffer(var3162, var3163, var3161, buffer.len(var3161))
		buff = var3162
		var3139 = var3163
	end
	if self.playable_text ~= nil then
		local var3164, var3165 = protoModule.writeTag(buff, var3139, 11, protoModule.wireTypes.lengthDelimited)
		var3164, var4591 = protoModule.writeString(var3164, var3165, self.playable_text)
		buff = var3164
		var3139 = var3165
	end
	if self.collection_id ~= nil then
		local var3166, var3167 = protoModule.writeTag(buff, var3139, 12, protoModule.wireTypes.lengthDelimited)
		var3166, var4593 = protoModule.writeString(var3166, var3167, self.collection_id)
		buff = var3166
		var3139 = var3167
	end
	if self.campaign_id ~= nil then
		local var3168, var3169 = protoModule.writeTag(buff, var3139, 13, protoModule.wireTypes.lengthDelimited)
		var3168, var4595 = protoModule.writeString(var3168, var3169, self.campaign_id)
		buff = var3168
		var3139 = var3169
	end
	if self.cohort_id ~= nil then
		local var3170, var3171 = protoModule.writeTag(buff, var3139, 14, protoModule.wireTypes.lengthDelimited)
		var3170, var4597 = protoModule.writeString(var3170, var3171, self.cohort_id)
		buff = var3170
		var3139 = var3171
	end
	if self.sort_id ~= nil then
		local var3172, var3173 = protoModule.writeTag(buff, var3139, 15, protoModule.wireTypes.lengthDelimited)
		var3172, var4599 = protoModule.writeString(var3172, var3173, self.sort_id)
		buff = var3172
		var3139 = var3173
	end
	if self.hero_unit_id ~= nil then
		local var3174, var3175 = protoModule.writeTag(buff, var3139, 16, protoModule.wireTypes.lengthDelimited)
		var3174, var4601 = protoModule.writeString(var3174, var3175, self.hero_unit_id)
		buff = var3174
		var3139 = var3175
	end
	if self.analytics_id ~= nil then
		local var3176, var3177 = protoModule.writeTag(buff, var3139, 17, protoModule.wireTypes.lengthDelimited)
		var3176, var4603 = protoModule.writeString(var3176, var3177, self.analytics_id)
		buff = var3176
		var3139 = var3177
	end
	if self.is_sponsored ~= nil then
		local var3178, var3179 = protoModule.writeTag(buff, var3139, 18, protoModule.wireTypes.varint)
		var3178, var4605 = protoModule.writeVarInt(var3178, var3179, if self.is_sponsored then 1 else 0)
		buff = var3178
		var3139 = var3179
	end
	local buff_1 = buffer.create(var3139)
	buffer.copy(buff_1, 0, buff, 0, var3139)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var3139 = t_117.new()
	local var3140 = 0
	while var3140 < buffer.len(p117) do
		local _ = nil
		local var3141 = nil
		local var3142, var3143, var3144 = protoModule.readTag(p117, var3140)
		local var3145 = var3142
		var3141 = var3143
		var3140 = var3144
		
		if var3141 == protoModule.wireTypes.varint then
			if var3145 == 18 then
				local _ = nil
				local var3146, var3147 = protoModule.readVarInt(p117, var3140)
				var3140 = var3147
				var3139.is_sponsored = var3146 ~= 0
			else
				local _ = nil
				local var3148, var3149 = protoModule.readVarInt(p117, var3140)
				local _ = var3148
				var3140 = var3149
			end
		end
		if var3141 == protoModule.wireTypes.lengthDelimited then
			if var3145 == 1 then
				local _ = nil
				local var3150, var3151 = protoModule.readBuffer(p117, var3140)
				var3140 = var3151
				var3139.universe_id = buffer.tostring(var3150)
			elseif var3145 == 2 then
				local _ = nil
				local var3152, var3153 = protoModule.readBuffer(p117, var3140)
				var3140 = var3153
				var3139.title = buffer.tostring(var3152)
			elseif var3145 == 3 then
				local _ = nil
				local var3154, var3155 = protoModule.readBuffer(p117, var3140)
				var3140 = var3155
				var3139.subtitle = buffer.tostring(var3154)
			elseif var3145 == 4 then
				local _ = nil
				local var3156, var3157 = protoModule.readBuffer(p117, var3140)
				var3140 = var3157
				var3139.badge_text = buffer.tostring(var3156)
			elseif var3145 == 5 then
				local _ = nil
				local var3158, var3159 = protoModule.readBuffer(p117, var3140)
				var3140 = var3159
				var3139.foreground = t.HeroUnitInputData_VisualAsset.decode(var3158)
			elseif var3145 == 6 then
				local _ = nil
				local var3160, var3161 = protoModule.readBuffer(p117, var3140)
				var3140 = var3161
				var3139.background = t.HeroUnitInputData_VisualAsset.decode(var3160)
			elseif var3145 == 7 then
				local _ = nil
				local var3162, var3163 = protoModule.readBuffer(p117, var3140)
				var3140 = var3163
				var3139.title_image = t.HeroUnitInputData_VisualAsset.decode(var3162)
			elseif var3145 == 8 then
				local _ = nil
				local var3164, var3165 = protoModule.readBuffer(p117, var3140)
				var3140 = var3165
				var3139.asset_title = buffer.tostring(var3164)
			elseif var3145 == 9 then
				local _ = nil
				local var3166, var3167 = protoModule.readBuffer(p117, var3140)
				var3140 = var3167
				var3139.asset_subtitle = buffer.tostring(var3166)
			elseif var3145 == 10 then
				local _ = nil
				local var3168, var3169 = protoModule.readBuffer(p117, var3140)
				var3140 = var3169
				var3139.gradient = t.HeroUnitInputData_Gradient.decode(var3168)
			elseif var3145 == 11 then
				local _ = nil
				local var3170, var3171 = protoModule.readBuffer(p117, var3140)
				var3140 = var3171
				var3139.playable_text = buffer.tostring(var3170)
			elseif var3145 == 12 then
				local _ = nil
				local var3172, var3173 = protoModule.readBuffer(p117, var3140)
				var3140 = var3173
				var3139.collection_id = buffer.tostring(var3172)
			elseif var3145 == 13 then
				local _ = nil
				local var3174, var3175 = protoModule.readBuffer(p117, var3140)
				var3140 = var3175
				var3139.campaign_id = buffer.tostring(var3174)
			elseif var3145 == 14 then
				local _ = nil
				local var3176, var3177 = protoModule.readBuffer(p117, var3140)
				var3140 = var3177
				var3139.cohort_id = buffer.tostring(var3176)
			elseif var3145 == 15 then
				local _ = nil
				local var3178, var3179 = protoModule.readBuffer(p117, var3140)
				var3140 = var3179
				var3139.sort_id = buffer.tostring(var3178)
			elseif var3145 == 16 then
				local _ = nil
				local var3180, var3181 = protoModule.readBuffer(p117, var3140)
				var3140 = var3181
				var3139.hero_unit_id = buffer.tostring(var3180)
			elseif var3145 == 17 then
				local _ = nil
				local var3182, var3183 = protoModule.readBuffer(p117, var3140)
				var3140 = var3183
				var3139.analytics_id = buffer.tostring(var3182)
			else
				local _ = nil
				local var3184, var3185 = protoModule.readVarInt(p117, var3140)
				var3140 = var3185 + var3184
			end
		elseif var3141 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3186, var3187 = protoModule.readFixed32(p117, var3140)
			local _ = var3186
			var3140 = var3187
		elseif var3141 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3188, var3189 = protoModule.readFixed64(p117, var3140)
			local _ = var3188
			var3140 = var3189
		else
			error("Unsupported wire type: " .. var4609)
		end
	end
	return var3139
end

function t_117:jsonEncode()
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

function t_117:jsonDecode()
	-- upvalues: t_117 (ref), t (ref)
	local var3190 = t_117.new()
	
	if self.universe_id ~= nil then
		var3190.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3190.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3190.title = self.title
	end
	if self.subtitle ~= nil then
		var3190.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3190.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3190.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3190.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3190.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3190.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3190.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3190.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3190.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3190.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3190.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3190.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3190.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3190.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3190.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3190.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3190.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3190.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3190.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3190.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3190.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3190.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3190.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3190.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3190.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3190.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3190.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3190.is_sponsored = self.isSponsored
	end
	return var3190
end

t_117.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_117
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p118)
	-- upvalues: t_118 (ref)
	return setmetatable({
		asset_id = if p118 == nil or p118.asset_id == nil then "" else p118.asset_id,
		aspect_ratio = if p118 == nil or p118.aspect_ratio == nil then nil else p118.aspect_ratio,
		enable_animation = if p118 == nil or p118.enable_animation == nil then nil else p118.enable_animation
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3190 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3191, var3192 = protoModule.writeTag(buff, var3190, 1, protoModule.wireTypes.lengthDelimited)
		var3191, var4663 = protoModule.writeString(var3191, var3192, self.asset_id)
		buff = var3191
		var3190 = var3192
	end
	if self.aspect_ratio ~= nil then
		local var3193, var3194 = protoModule.writeTag(buff, var3190, 2, protoModule.wireTypes.i64)
		var3193, var4665 = protoModule.writeDouble(var3193, var3194, self.aspect_ratio)
		buff = var3193
		var3190 = var3194
	end
	if self.enable_animation ~= nil then
		local var3195, var3196 = protoModule.writeTag(buff, var3190, 3, protoModule.wireTypes.varint)
		var3195, var4667 = protoModule.writeVarInt(var3195, var3196, if self.enable_animation then 1 else 0)
		buff = var3195
		var3190 = var3196
	end
	local buff_1 = buffer.create(var3190)
	buffer.copy(buff_1, 0, buff, 0, var3190)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref)
	local var3190 = t_118.new()
	local var3191 = 0
	while var3191 < buffer.len(p118) do
		local _ = nil
		local var3192 = nil
		local var3193, var3194, var3195 = protoModule.readTag(p118, var3191)
		local var3196 = var3193
		var3192 = var3194
		var3191 = var3195
		
		if var3192 == protoModule.wireTypes.varint then
			if var3196 == 3 then
				local _ = nil
				local var3197, var3198 = protoModule.readVarInt(p118, var3191)
				var3191 = var3198
				var3190.enable_animation = var3197 ~= 0
			else
				local _ = nil
				local var3199, var3200 = protoModule.readVarInt(p118, var3191)
				local _ = var3199
				var3191 = var3200
			end
		end
		if var3192 == protoModule.wireTypes.lengthDelimited then
			if var3196 == 1 then
				local _ = nil
				local var3201, var3202 = protoModule.readBuffer(p118, var3191)
				var3191 = var3202
				var3190.asset_id = buffer.tostring(var3201)
			else
				local _ = nil
				local var3203, var3204 = protoModule.readVarInt(p118, var3191)
				var3191 = var3204 + var3203
			end
		elseif var3192 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3205, var3206 = protoModule.readFixed32(p118, var3191)
			local _ = var3205
			var3191 = var3206
		elseif var3192 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4671)
		elseif var3196 == 2 then
			local _ = nil
			local var3207, var3208 = protoModule.readDouble(p118, var3191)
			var3191 = var3208
			var3190.aspect_ratio = var3207
		else
			local _ = nil
			local var3209, var3210 = protoModule.readFixed64(p118, var3191)
			local _ = var3209
			var3191 = var3210
		end
	end
	return var3190
end

function t_118:jsonEncode()
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

function t_118:jsonDecode()
	-- upvalues: t_118 (ref), protoModule (ref)
	local var3211 = t_118.new()
	
	if self.asset_id ~= nil then
		var3211.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3211.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3211.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3211.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3211.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3211.enable_animation = self.enableAnimation
	end
	return var3211
end

t_118.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_118
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p119)
	-- upvalues: t_119 (ref)
	return setmetatable({
		start_color = if p119 == nil or p119.start_color == nil then nil else p119.start_color,
		end_color = if p119 == nil or p119.end_color == nil then nil else p119.end_color,
		start_opacity = if p119 == nil or p119.start_opacity == nil then nil else p119.start_opacity,
		end_opacity = if p119 == nil or p119.end_opacity == nil then nil else p119.end_opacity,
		degree = if p119 == nil or p119.degree == nil then nil else p119.degree
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3211 = 0
	
	if self.start_color ~= nil then
		local var3212, var3213 = protoModule.writeTag(buff, var3211, 1, protoModule.wireTypes.lengthDelimited)
		var3212, var4695 = protoModule.writeString(var3212, var3213, self.start_color)
		buff = var3212
		var3211 = var3213
	end
	if self.end_color ~= nil then
		local var3214, var3215 = protoModule.writeTag(buff, var3211, 2, protoModule.wireTypes.lengthDelimited)
		var3214, var4697 = protoModule.writeString(var3214, var3215, self.end_color)
		buff = var3214
		var3211 = var3215
	end
	if self.start_opacity ~= nil then
		local var3216, var3217 = protoModule.writeTag(buff, var3211, 3, protoModule.wireTypes.i64)
		var3216, var4699 = protoModule.writeDouble(var3216, var3217, self.start_opacity)
		buff = var3216
		var3211 = var3217
	end
	if self.end_opacity ~= nil then
		local var3218, var3219 = protoModule.writeTag(buff, var3211, 4, protoModule.wireTypes.i64)
		var3218, var4701 = protoModule.writeDouble(var3218, var3219, self.end_opacity)
		buff = var3218
		var3211 = var3219
	end
	if self.degree ~= nil then
		local var3220, var3221 = protoModule.writeTag(buff, var3211, 5, protoModule.wireTypes.i64)
		var3220, var4703 = protoModule.writeDouble(var3220, var3221, self.degree)
		buff = var3220
		var3211 = var3221
	end
	local buff_1 = buffer.create(var3211)
	buffer.copy(buff_1, 0, buff, 0, var3211)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3211 = t_119.new()
	local var3212 = 0
	while var3212 < buffer.len(p119) do
		local _ = nil
		local var3213 = nil
		local var3214, var3215, var3216 = protoModule.readTag(p119, var3212)
		local var3217 = var3214
		var3213 = var3215
		var3212 = var3216
		
		if var3213 == protoModule.wireTypes.varint then
			local _ = nil
			local var3218, var3219 = protoModule.readVarInt(p119, var3212)
			local _ = var3218
			var3212 = var3219
			continue
		end
		if var3213 == protoModule.wireTypes.lengthDelimited then
			if var3217 == 1 then
				local _ = nil
				local var3220, var3221 = protoModule.readBuffer(p119, var3212)
				var3212 = var3221
				var3211.start_color = buffer.tostring(var3220)
			elseif var3217 == 2 then
				local _ = nil
				local var3222, var3223 = protoModule.readBuffer(p119, var3212)
				var3212 = var3223
				var3211.end_color = buffer.tostring(var3222)
			else
				local _ = nil
				local var3224, var3225 = protoModule.readVarInt(p119, var3212)
				var3212 = var3225 + var3224
			end
		elseif var3213 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3226, var3227 = protoModule.readFixed32(p119, var3212)
			local _ = var3226
			var3212 = var3227
		elseif var3213 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4707)
		elseif var3217 == 3 then
			local _ = nil
			local var3228, var3229 = protoModule.readDouble(p119, var3212)
			var3212 = var3229
			var3211.start_opacity = var3228
		elseif var3217 == 4 then
			local _ = nil
			local var3230, var3231 = protoModule.readDouble(p119, var3212)
			var3212 = var3231
			var3211.end_opacity = var3230
		elseif var3217 == 5 then
			local _ = nil
			local var3232, var3233 = protoModule.readDouble(p119, var3212)
			var3212 = var3233
			var3211.degree = var3232
		else
			local _ = nil
			local var3234, var3235 = protoModule.readFixed64(p119, var3212)
			local _ = var3234
			var3212 = var3235
		end
	end
	return var3211
end

function t_119:jsonEncode()
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

function t_119:jsonDecode()
	-- upvalues: t_119 (ref), protoModule (ref)
	local var3236 = t_119.new()
	
	if self.start_color ~= nil then
		var3236.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3236.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3236.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3236.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3236.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3236.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3236.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3236.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3236.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3236
end

t_119.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_119
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p120)
	-- upvalues: t_120 (ref)
	return setmetatable({
		items = if p120 == nil or p120.items == nil then {} else p120.items,
		sort_id = if p120 == nil or p120.sort_id == nil then "" else p120.sort_id,
		recommendation_request_id = if p120 == nil or p120.recommendation_request_id == nil then "" else p120.recommendation_request_id
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3236 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3237 = v:encode()
			local var3238, var3239 = protoModule.writeTag(buff, var3236, 1, protoModule.wireTypes.lengthDelimited)
			var3238, var4736 = protoModule.writeBuffer(var3238, var3239, var3237, buffer.len(var3237))
			buff = var3238
			var3236 = var3239
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3240, var3241 = protoModule.writeTag(buff, var3236, 2, protoModule.wireTypes.lengthDelimited)
		var3240, var4738 = protoModule.writeString(var3240, var3241, self.sort_id)
		buff = var3240
		var3236 = var3241
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3242, var3243 = protoModule.writeTag(buff, var3236, 3, protoModule.wireTypes.lengthDelimited)
		var3242, var4740 = protoModule.writeString(var3242, var3243, self.recommendation_request_id)
		buff = var3242
		var3236 = var3243
	end
	local buff_1 = buffer.create(var3236)
	buffer.copy(buff_1, 0, buff, 0, var3236)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref), t (ref)
	local var3244 = t_120.new()
	local var3245 = 0
	while var3245 < buffer.len(p120) do
		local _ = nil
		local var3246 = nil
		local var3247, var3248, var3249 = protoModule.readTag(p120, var3245)
		local var3250 = var3247
		var3246 = var3248
		var3245 = var3249
		
		if var3246 == protoModule.wireTypes.varint then
			local _ = nil
			local var3251, var3252 = protoModule.readVarInt(p120, var3245)
			local _ = var3251
			var3245 = var3252
			continue
		end
		if var3246 == protoModule.wireTypes.lengthDelimited then
			if var3250 == 1 then
				local _ = nil
				local var3253, var3254 = protoModule.readBuffer(p120, var3245)
				var3245 = var3254
				table.insert(var3244.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3253))
			elseif var3250 == 2 then
				local _ = nil
				local var3255, var3256 = protoModule.readBuffer(p120, var3245)
				var3245 = var3256
				var3244.sort_id = buffer.tostring(var3255)
			elseif var3250 == 3 then
				local _ = nil
				local var3257, var3258 = protoModule.readBuffer(p120, var3245)
				var3245 = var3258
				var3244.recommendation_request_id = buffer.tostring(var3257)
			else
				local _ = nil
				local var3259, var3260 = protoModule.readVarInt(p120, var3245)
				var3245 = var3260 + var3259
			end
		elseif var3246 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3261, var3262 = protoModule.readFixed32(p120, var3245)
			local _ = var3261
			var3245 = var3262
		elseif var3246 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3263, var3264 = protoModule.readFixed64(p120, var3245)
			local _ = var3263
			var3245 = var3264
		else
			error("Unsupported wire type: " .. var4744)
		end
	end
	return var3244
end

function t_120:jsonEncode()
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

function t_120:jsonDecode()
	-- upvalues: t_120 (ref), t (ref)
	local var3265 = t_120.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3265.items = t_1
	end
	if self.sort_id ~= nil then
		var3265.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3265.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3265.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3265.recommendation_request_id = self.recommendationRequestId
	end
	return var3265
end

t_120.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_120
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p121)
	-- upvalues: t_121 (ref)
	return setmetatable({
		item_id = if p121 == nil or p121.item_id == nil then "" else p121.item_id,
		has_pending_friend_request = if p121 == nil or p121.has_pending_friend_request == nil then false else p121.has_pending_friend_request
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3266 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3267, var3268 = protoModule.writeTag(buff, var3266, 1, protoModule.wireTypes.lengthDelimited)
		var3267, var4770 = protoModule.writeString(var3267, var3268, self.item_id)
		buff = var3267
		var3266 = var3268
	end
	if self.has_pending_friend_request then
		local var3269, var3270 = protoModule.writeTag(buff, var3266, 2, protoModule.wireTypes.varint)
		var3269, var4772 = protoModule.writeVarInt(var3269, var3270, if self.has_pending_friend_request then 1 else 0)
		buff = var3269
		var3266 = var3270
	end
	local buff_1 = buffer.create(var3266)
	buffer.copy(buff_1, 0, buff, 0, var3266)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref)
	local var3266 = t_121.new()
	local var3267 = 0
	while var3267 < buffer.len(p121) do
		local _ = nil
		local var3268 = nil
		local var3269, var3270, var3271 = protoModule.readTag(p121, var3267)
		local var3272 = var3269
		var3268 = var3270
		var3267 = var3271
		
		if var3268 == protoModule.wireTypes.varint then
			if var3272 == 2 then
				local _ = nil
				local var3273, var3274 = protoModule.readVarInt(p121, var3267)
				var3267 = var3274
				var3266.has_pending_friend_request = var3273 ~= 0
			else
				local _ = nil
				local var3275, var3276 = protoModule.readVarInt(p121, var3267)
				local _ = var3275
				var3267 = var3276
			end
		end
		if var3268 == protoModule.wireTypes.lengthDelimited then
			if var3272 == 1 then
				local _ = nil
				local var3277, var3278 = protoModule.readBuffer(p121, var3267)
				var3267 = var3278
				var3266.item_id = buffer.tostring(var3277)
			else
				local _ = nil
				local var3279, var3280 = protoModule.readVarInt(p121, var3267)
				var3267 = var3280 + var3279
			end
		elseif var3268 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3281, var3282 = protoModule.readFixed32(p121, var3267)
			local _ = var3281
			var3267 = var3282
		elseif var3268 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3283, var3284 = protoModule.readFixed64(p121, var3267)
			local _ = var3283
			var3267 = var3284
		else
			error("Unsupported wire type: " .. var4776)
		end
	end
	return var3266
end

function t_121:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function t_121:jsonDecode()
	-- upvalues: t_121 (ref)
	local var3285 = t_121.new()
	
	if self.item_id ~= nil then
		var3285.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3285.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		var3285.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3285.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3285
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
	local var3285 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3286, var3287 = protoModule.writeTag(buff, var3285, 1, protoModule.wireTypes.lengthDelimited)
		var3286, var4798 = protoModule.writeString(var3286, var3287, self.selected_option)
		buff = var3286
		var3285 = var3287
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3288, var3289 = protoModule.writeTag(buff, var3285, 2, protoModule.wireTypes.lengthDelimited)
		var3288, var4800 = protoModule.writeString(var3288, var3289, self.sort_id)
		buff = var3288
		var3285 = var3289
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3290 = v:encode()
			local var3291, var3292 = protoModule.writeTag(buff, var3285, 3, protoModule.wireTypes.lengthDelimited)
			var3291, var4803 = protoModule.writeBuffer(var3291, var3292, var3290, buffer.len(var3290))
			buff = var3291
			var3285 = var3292
		end
	end
	if self.experience_carousel ~= nil then
		local var3293 = self.experience_carousel:encode()
		local var3294, var3295 = protoModule.writeTag(buff, var3285, 4, protoModule.wireTypes.lengthDelimited)
		var3294, var4806 = protoModule.writeBuffer(var3294, var3295, var3293, buffer.len(var3293))
		buff = var3294
		var3285 = var3295
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3296, var3297 = protoModule.writeTag(buff, var3285, 5, protoModule.wireTypes.lengthDelimited)
		var3296, var4808 = protoModule.writeString(var3296, var3297, self.feed_item_key)
		buff = var3296
		var3285 = var3297
	end
	local buff_1 = buffer.create(var3285)
	buffer.copy(buff_1, 0, buff, 0, var3285)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3298 = t_122.new()
	local var3299 = 0
	while var3299 < buffer.len(p122) do
		local _ = nil
		local var3300 = nil
		local var3301, var3302, var3303 = protoModule.readTag(p122, var3299)
		local var3304 = var3301
		var3300 = var3302
		var3299 = var3303
		
		if var3300 == protoModule.wireTypes.varint then
			local _ = nil
			local var3305, var3306 = protoModule.readVarInt(p122, var3299)
			local _ = var3305
			var3299 = var3306
			continue
		end
		if var3300 == protoModule.wireTypes.lengthDelimited then
			if var3304 == 1 then
				local _ = nil
				local var3307, var3308 = protoModule.readBuffer(p122, var3299)
				var3299 = var3308
				var3298.selected_option = buffer.tostring(var3307)
			elseif var3304 == 2 then
				local _ = nil
				local var3309, var3310 = protoModule.readBuffer(p122, var3299)
				var3299 = var3310
				var3298.sort_id = buffer.tostring(var3309)
			elseif var3304 == 3 then
				local _ = nil
				local var3311, var3312 = protoModule.readBuffer(p122, var3299)
				var3299 = var3312
				table.insert(var3298.options, t.SelectorOption.decode(var3311))
			elseif var3304 == 4 then
				local _ = nil
				local var3313, var3314 = protoModule.readBuffer(p122, var3299)
				var3299 = var3314
				var3298.experience_carousel = t.ExperienceCarouselInputData.decode(var3313)
			elseif var3304 == 5 then
				local _ = nil
				local var3315, var3316 = protoModule.readBuffer(p122, var3299)
				var3299 = var3316
				var3298.feed_item_key = buffer.tostring(var3315)
			else
				local _ = nil
				local var3317, var3318 = protoModule.readVarInt(p122, var3299)
				var3299 = var3318 + var3317
			end
		elseif var3300 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3319, var3320 = protoModule.readFixed32(p122, var3299)
			local _ = var3319
			var3299 = var3320
		elseif var3300 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3321, var3322 = protoModule.readFixed64(p122, var3299)
			local _ = var3321
			var3299 = var3322
		else
			error("Unsupported wire type: " .. var4812)
		end
	end
	return var3298
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
	local var3323 = t_122.new()
	
	if self.selected_option ~= nil then
		var3323.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3323.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3323.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3323.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3323.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3323.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3323.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3323.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3323.feed_item_key = self.feedItemKey
	end
	return var3323
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
	local var3324 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3325, var3326 = protoModule.writeTag(buff, var3324, 1, protoModule.wireTypes.lengthDelimited)
		var3325, var4842 = protoModule.writeString(var3325, var3326, self.id)
		buff = var3325
		var3324 = var3326
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3327, var3328 = protoModule.writeTag(buff, var3324, 2, protoModule.wireTypes.lengthDelimited)
		var3327, var4844 = protoModule.writeString(var3327, var3328, self.display_name)
		buff = var3327
		var3324 = var3328
	end
	if self.is_selected then
		local var3329, var3330 = protoModule.writeTag(buff, var3324, 3, protoModule.wireTypes.varint)
		var3329, var4846 = protoModule.writeVarInt(var3329, var3330, if self.is_selected then 1 else 0)
		buff = var3329
		var3324 = var3330
	end
	local buff_1 = buffer.create(var3324)
	buffer.copy(buff_1, 0, buff, 0, var3324)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3324 = t_123.new()
	local var3325 = 0
	while var3325 < buffer.len(p123) do
		local _ = nil
		local var3326 = nil
		local var3327, var3328, var3329 = protoModule.readTag(p123, var3325)
		local var3330 = var3327
		var3326 = var3328
		var3325 = var3329
		
		if var3326 == protoModule.wireTypes.varint then
			if var3330 == 3 then
				local _ = nil
				local var3331, var3332 = protoModule.readVarInt(p123, var3325)
				var3325 = var3332
				var3324.is_selected = var3331 ~= 0
			else
				local _ = nil
				local var3333, var3334 = protoModule.readVarInt(p123, var3325)
				local _ = var3333
				var3325 = var3334
			end
		end
		if var3326 == protoModule.wireTypes.lengthDelimited then
			if var3330 == 1 then
				local _ = nil
				local var3335, var3336 = protoModule.readBuffer(p123, var3325)
				var3325 = var3336
				var3324.id = buffer.tostring(var3335)
			elseif var3330 == 2 then
				local _ = nil
				local var3337, var3338 = protoModule.readBuffer(p123, var3325)
				var3325 = var3338
				var3324.display_name = buffer.tostring(var3337)
			else
				local _ = nil
				local var3339, var3340 = protoModule.readVarInt(p123, var3325)
				var3325 = var3340 + var3339
			end
		elseif var3326 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3341, var3342 = protoModule.readFixed32(p123, var3325)
			local _ = var3341
			var3325 = var3342
		elseif var3326 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3343, var3344 = protoModule.readFixed64(p123, var3325)
			local _ = var3343
			var3325 = var3344
		else
			error("Unsupported wire type: " .. var4850)
		end
	end
	return var3324
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
	local var3345 = t_123.new()
	
	if self.id ~= nil then
		var3345.id = self.id
	end
	if self.display_name ~= nil then
		var3345.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3345.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3345.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3345.is_selected = self.isSelected
	end
	return var3345
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
		title = if p124 == nil or p124.title == nil then "" else p124.title,
		sort_id = if p124 == nil or p124.sort_id == nil then nil else p124.sort_id
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3345 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3346 = v:encode()
			local var3347, var3348 = protoModule.writeTag(buff, var3345, 1, protoModule.wireTypes.lengthDelimited)
			var3347, var4875 = protoModule.writeBuffer(var3347, var3348, var3346, buffer.len(var3346))
			buff = var3347
			var3345 = var3348
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3349, var3350 = protoModule.writeTag(buff, var3345, 2, protoModule.wireTypes.lengthDelimited)
		var3349, var4877 = protoModule.writeString(var3349, var3350, self.title)
		buff = var3349
		var3345 = var3350
	end
	if self.sort_id ~= nil then
		local var3351, var3352 = protoModule.writeTag(buff, var3345, 3, protoModule.wireTypes.lengthDelimited)
		var3351, var4879 = protoModule.writeString(var3351, var3352, self.sort_id)
		buff = var3351
		var3345 = var3352
	end
	local buff_1 = buffer.create(var3345)
	buffer.copy(buff_1, 0, buff, 0, var3345)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var3353 = t_124.new()
	local var3354 = 0
	while var3354 < buffer.len(p124) do
		local _ = nil
		local var3355 = nil
		local var3356, var3357, var3358 = protoModule.readTag(p124, var3354)
		local var3359 = var3356
		var3355 = var3357
		var3354 = var3358
		
		if var3355 == protoModule.wireTypes.varint then
			local _ = nil
			local var3360, var3361 = protoModule.readVarInt(p124, var3354)
			local _ = var3360
			var3354 = var3361
			continue
		end
		if var3355 == protoModule.wireTypes.lengthDelimited then
			if var3359 == 1 then
				local _ = nil
				local var3362, var3363 = protoModule.readBuffer(p124, var3354)
				var3354 = var3363
				table.insert(var3353.cards, t.GameItemsCardInputData.decode(var3362))
			elseif var3359 == 2 then
				local _ = nil
				local var3364, var3365 = protoModule.readBuffer(p124, var3354)
				var3354 = var3365
				var3353.title = buffer.tostring(var3364)
			elseif var3359 == 3 then
				local _ = nil
				local var3366, var3367 = protoModule.readBuffer(p124, var3354)
				var3354 = var3367
				var3353.sort_id = buffer.tostring(var3366)
			else
				local _ = nil
				local var3368, var3369 = protoModule.readVarInt(p124, var3354)
				var3354 = var3369 + var3368
			end
		elseif var3355 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3370, var3371 = protoModule.readFixed32(p124, var3354)
			local _ = var3370
			var3354 = var3371
		elseif var3355 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3372, var3373 = protoModule.readFixed64(p124, var3354)
			local _ = var3372
			var3354 = var3373
		else
			error("Unsupported wire type: " .. var4883)
		end
	end
	return var3353
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
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function t_124:jsonDecode()
	-- upvalues: t_124 (ref), t (ref)
	local var3374 = t_124.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3374.cards = t_1
	end
	if self.title ~= nil then
		var3374.title = self.title
	end
	if self.sort_id ~= nil then
		var3374.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3374.sort_id = self.sortId
	end
	return var3374
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
	local var3375 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3376, var3377 = protoModule.writeTag(buff, var3375, 1, protoModule.wireTypes.lengthDelimited)
		var3376, var4909 = protoModule.writeString(var3376, var3377, self.universe_id)
		buff = var3376
		var3375 = var3377
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3378 = v:encode()
			local var3379, var3380 = protoModule.writeTag(buff, var3375, 2, protoModule.wireTypes.lengthDelimited)
			var3379, var4912 = protoModule.writeBuffer(var3379, var3380, var3378, buffer.len(var3378))
			buff = var3379
			var3375 = var3380
		end
	end
	local buff_1 = buffer.create(var3375)
	buffer.copy(buff_1, 0, buff, 0, var3375)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3381 = t_125.new()
	local var3382 = 0
	while var3382 < buffer.len(p125) do
		local _ = nil
		local var3383 = nil
		local var3384, var3385, var3386 = protoModule.readTag(p125, var3382)
		local var3387 = var3384
		var3383 = var3385
		var3382 = var3386
		
		if var3383 == protoModule.wireTypes.varint then
			local _ = nil
			local var3388, var3389 = protoModule.readVarInt(p125, var3382)
			local _ = var3388
			var3382 = var3389
			continue
		end
		if var3383 == protoModule.wireTypes.lengthDelimited then
			if var3387 == 1 then
				local _ = nil
				local var3390, var3391 = protoModule.readBuffer(p125, var3382)
				var3382 = var3391
				var3381.universe_id = buffer.tostring(var3390)
			elseif var3387 == 2 then
				local _ = nil
				local var3392, var3393 = protoModule.readBuffer(p125, var3382)
				var3382 = var3393
				table.insert(var3381.items, t.GameItemInputData.decode(var3392))
			else
				local _ = nil
				local var3394, var3395 = protoModule.readVarInt(p125, var3382)
				var3382 = var3395 + var3394
			end
		elseif var3383 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3396, var3397 = protoModule.readFixed32(p125, var3382)
			local _ = var3396
			var3382 = var3397
		elseif var3383 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3398, var3399 = protoModule.readFixed64(p125, var3382)
			local _ = var3398
			var3382 = var3399
		else
			error("Unsupported wire type: " .. var4916)
		end
	end
	return var3381
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
	local var3400 = t_125.new()
	
	if self.universe_id ~= nil then
		var3400.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3400.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3400.items = t_1
	end
	return var3400
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
	local var3401 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3402, var3403 = protoModule.writeTag(buff, var3401, 1, protoModule.wireTypes.lengthDelimited)
		var3402, var4940 = protoModule.writeString(var3402, var3403, self.item_id)
		buff = var3402
		var3401 = var3403
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3404, var3405 = protoModule.writeTag(buff, var3401, 2, protoModule.wireTypes.lengthDelimited)
		var3404, var4942 = protoModule.writeString(var3404, var3405, self.item_type)
		buff = var3404
		var3401 = var3405
	end
	local buff_1 = buffer.create(var3401)
	buffer.copy(buff_1, 0, buff, 0, var3401)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3401 = t_126.new()
	local var3402 = 0
	while var3402 < buffer.len(p126) do
		local _ = nil
		local var3403 = nil
		local var3404, var3405, var3406 = protoModule.readTag(p126, var3402)
		local var3407 = var3404
		var3403 = var3405
		var3402 = var3406
		
		if var3403 == protoModule.wireTypes.varint then
			local _ = nil
			local var3408, var3409 = protoModule.readVarInt(p126, var3402)
			local _ = var3408
			var3402 = var3409
			continue
		end
		if var3403 == protoModule.wireTypes.lengthDelimited then
			if var3407 == 1 then
				local _ = nil
				local var3410, var3411 = protoModule.readBuffer(p126, var3402)
				var3402 = var3411
				var3401.item_id = buffer.tostring(var3410)
			elseif var3407 == 2 then
				local _ = nil
				local var3412, var3413 = protoModule.readBuffer(p126, var3402)
				var3402 = var3413
				var3401.item_type = buffer.tostring(var3412)
			else
				local _ = nil
				local var3414, var3415 = protoModule.readVarInt(p126, var3402)
				var3402 = var3415 + var3414
			end
		elseif var3403 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3416, var3417 = protoModule.readFixed32(p126, var3402)
			local _ = var3416
			var3402 = var3417
		elseif var3403 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3418, var3419 = protoModule.readFixed64(p126, var3402)
			local _ = var3418
			var3402 = var3419
		else
			error("Unsupported wire type: " .. var4946)
		end
	end
	return var3401
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
	local var3420 = t_126.new()
	
	if self.item_id ~= nil then
		var3420.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3420.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3420.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3420.item_type = self.itemType
	end
	return var3420
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
	local var3420 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3421, var3422 = protoModule.writeTag(buff, var3420, 1, protoModule.wireTypes.lengthDelimited)
		var3421, var4968 = protoModule.writeString(var3421, var3422, self.clickout_url)
		buff = var3421
		var3420 = var3422
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3423, var3424 = protoModule.writeTag(buff, var3420, 2, protoModule.wireTypes.lengthDelimited)
		var3423, var4970 = protoModule.writeString(var3423, var3424, self.native_ad_data)
		buff = var3423
		var3420 = var3424
	end
	if self.payer_name ~= nil then
		local var3425, var3426 = protoModule.writeTag(buff, var3420, 3, protoModule.wireTypes.lengthDelimited)
		var3425, var4972 = protoModule.writeString(var3425, var3426, self.payer_name)
		buff = var3425
		var3420 = var3426
	end
	if self.logo_asset_id ~= nil then
		local var3427, var3428 = protoModule.writeTag(buff, var3420, 4, protoModule.wireTypes.lengthDelimited)
		var3427, var4974 = protoModule.writeString(var3427, var3428, self.logo_asset_id)
		buff = var3427
		var3420 = var3428
	end
	if self.logo_aspect_ratio ~= nil then
		local var3429, var3430 = protoModule.writeTag(buff, var3420, 5, protoModule.wireTypes.i64)
		var3429, var4976 = protoModule.writeDouble(var3429, var3430, self.logo_aspect_ratio)
		buff = var3429
		var3420 = var3430
	end
	if self.cta_text ~= nil then
		local var3431, var3432 = protoModule.writeTag(buff, var3420, 6, protoModule.wireTypes.lengthDelimited)
		var3431, var4978 = protoModule.writeString(var3431, var3432, self.cta_text)
		buff = var3431
		var3420 = var3432
	end
	if self.title ~= nil then
		local var3433, var3434 = protoModule.writeTag(buff, var3420, 7, protoModule.wireTypes.lengthDelimited)
		var3433, var4980 = protoModule.writeString(var3433, var3434, self.title)
		buff = var3433
		var3420 = var3434
	end
	if self.subtitle ~= nil then
		local var3435, var3436 = protoModule.writeTag(buff, var3420, 8, protoModule.wireTypes.lengthDelimited)
		var3435, var4982 = protoModule.writeString(var3435, var3436, self.subtitle)
		buff = var3435
		var3420 = var3436
	end
	if self.image_asset_id ~= nil then
		local var3437, var3438 = protoModule.writeTag(buff, var3420, 9, protoModule.wireTypes.lengthDelimited)
		var3437, var4984 = protoModule.writeString(var3437, var3438, self.image_asset_id)
		buff = var3437
		var3420 = var3438
	end
	if self.video_asset_id ~= nil then
		local var3439, var3440 = protoModule.writeTag(buff, var3420, 10, protoModule.wireTypes.lengthDelimited)
		var3439, var4986 = protoModule.writeString(var3439, var3440, self.video_asset_id)
		buff = var3439
		var3420 = var3440
	end
	if self.badge_text ~= nil then
		local var3441, var3442 = protoModule.writeTag(buff, var3420, 11, protoModule.wireTypes.lengthDelimited)
		var3441, var4988 = protoModule.writeString(var3441, var3442, self.badge_text)
		buff = var3441
		var3420 = var3442
	end
	if self.badge_analytics_id ~= nil then
		local var3443, var3444 = protoModule.writeTag(buff, var3420, 12, protoModule.wireTypes.lengthDelimited)
		var3443, var4990 = protoModule.writeString(var3443, var3444, self.badge_analytics_id)
		buff = var3443
		var3420 = var3444
	end
	if self.roblox_component ~= nil then
		local var3445, var3446 = protoModule.writeTag(buff, var3420, 13, protoModule.wireTypes.lengthDelimited)
		var3445, var4992 = protoModule.writeString(var3445, var3446, self.roblox_component)
		buff = var3445
		var3420 = var3446
	end
	local buff_1 = buffer.create(var3420)
	buffer.copy(buff_1, 0, buff, 0, var3420)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3420 = t_127.new()
	local var3421 = 0
	while var3421 < buffer.len(p127) do
		local _ = nil
		local var3422 = nil
		local var3423, var3424, var3425 = protoModule.readTag(p127, var3421)
		local var3426 = var3423
		var3422 = var3424
		var3421 = var3425
		
		if var3422 == protoModule.wireTypes.varint then
			local _ = nil
			local var3427, var3428 = protoModule.readVarInt(p127, var3421)
			local _ = var3427
			var3421 = var3428
			continue
		end
		if var3422 == protoModule.wireTypes.lengthDelimited then
			if var3426 == 1 then
				local _ = nil
				local var3429, var3430 = protoModule.readBuffer(p127, var3421)
				var3421 = var3430
				var3420.clickout_url = buffer.tostring(var3429)
			elseif var3426 == 2 then
				local _ = nil
				local var3431, var3432 = protoModule.readBuffer(p127, var3421)
				var3421 = var3432
				var3420.native_ad_data = buffer.tostring(var3431)
			elseif var3426 == 3 then
				local _ = nil
				local var3433, var3434 = protoModule.readBuffer(p127, var3421)
				var3421 = var3434
				var3420.payer_name = buffer.tostring(var3433)
			elseif var3426 == 4 then
				local _ = nil
				local var3435, var3436 = protoModule.readBuffer(p127, var3421)
				var3421 = var3436
				var3420.logo_asset_id = buffer.tostring(var3435)
			elseif var3426 == 6 then
				local _ = nil
				local var3437, var3438 = protoModule.readBuffer(p127, var3421)
				var3421 = var3438
				var3420.cta_text = buffer.tostring(var3437)
			elseif var3426 == 7 then
				local _ = nil
				local var3439, var3440 = protoModule.readBuffer(p127, var3421)
				var3421 = var3440
				var3420.title = buffer.tostring(var3439)
			elseif var3426 == 8 then
				local _ = nil
				local var3441, var3442 = protoModule.readBuffer(p127, var3421)
				var3421 = var3442
				var3420.subtitle = buffer.tostring(var3441)
			elseif var3426 == 9 then
				local _ = nil
				local var3443, var3444 = protoModule.readBuffer(p127, var3421)
				var3421 = var3444
				var3420.image_asset_id = buffer.tostring(var3443)
			elseif var3426 == 10 then
				local _ = nil
				local var3445, var3446 = protoModule.readBuffer(p127, var3421)
				var3421 = var3446
				var3420.video_asset_id = buffer.tostring(var3445)
			elseif var3426 == 11 then
				local _ = nil
				local var3447, var3448 = protoModule.readBuffer(p127, var3421)
				var3421 = var3448
				var3420.badge_text = buffer.tostring(var3447)
			elseif var3426 == 12 then
				local _ = nil
				local var3449, var3450 = protoModule.readBuffer(p127, var3421)
				var3421 = var3450
				var3420.badge_analytics_id = buffer.tostring(var3449)
			elseif var3426 == 13 then
				local _ = nil
				local var3451, var3452 = protoModule.readBuffer(p127, var3421)
				var3421 = var3452
				var3420.roblox_component = buffer.tostring(var3451)
			else
				local _ = nil
				local var3453, var3454 = protoModule.readVarInt(p127, var3421)
				var3421 = var3454 + var3453
			end
		elseif var3422 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3455, var3456 = protoModule.readFixed32(p127, var3421)
			local _ = var3455
			var3421 = var3456
		elseif var3422 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4996)
		elseif var3426 == 5 then
			local _ = nil
			local var3457, var3458 = protoModule.readDouble(p127, var3421)
			var3421 = var3458
			var3420.logo_aspect_ratio = var3457
		else
			local _ = nil
			local var3459, var3460 = protoModule.readFixed64(p127, var3421)
			local _ = var3459
			var3421 = var3460
		end
	end
	return var3420
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
	local var3461 = t_127.new()
	
	if self.clickout_url ~= nil then
		var3461.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3461.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3461.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3461.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3461.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3461.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3461.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3461.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3461.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3461.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3461.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3461.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3461.title = self.title
	end
	if self.subtitle ~= nil then
		var3461.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3461.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3461.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3461.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3461.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3461.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3461.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3461.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3461.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3461.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3461.roblox_component = self.robloxComponent
	end
	return var3461
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
	local var3461 = 0
	
	if self.layout ~= nil then
		local var3462 = self.layout:encode()
		local var3463, var3464 = protoModule.writeTag(buff, var3461, 1, protoModule.wireTypes.lengthDelimited)
		var3463, var5041 = protoModule.writeBuffer(var3463, var3464, var3462, buffer.len(var3462))
		buff = var3463
		var3461 = var3464
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3465 = self.kind.value:encode()
			local var3466, var3467 = protoModule.writeTag(buff, var3461, 2, protoModule.wireTypes.lengthDelimited)
			var3466, var5044 = protoModule.writeBuffer(var3466, var3467, var3465, buffer.len(var3465))
			buff = var3466
			var3461 = var3467
		elseif self.kind.type == "ad_link" then
			local var3468 = self.kind.value:encode()
			local var3469, var3470 = protoModule.writeTag(buff, var3461, 3, protoModule.wireTypes.lengthDelimited)
			var3469, var5047 = protoModule.writeBuffer(var3469, var3470, var3468, buffer.len(var3468))
			buff = var3469
			var3461 = var3470
		end
	end
	local buff_1 = buffer.create(var3461)
	buffer.copy(buff_1, 0, buff, 0, var3461)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var3461 = t_128.new()
	local var3462 = 0
	while var3462 < buffer.len(p128) do
		local _ = nil
		local var3463 = nil
		local var3464, var3465, var3466 = protoModule.readTag(p128, var3462)
		local var3467 = var3464
		var3463 = var3465
		var3462 = var3466
		
		if var3463 == protoModule.wireTypes.varint then
			local _ = nil
			local var3468, var3469 = protoModule.readVarInt(p128, var3462)
			local _ = var3468
			var3462 = var3469
			continue
		end
		if var3463 == protoModule.wireTypes.lengthDelimited then
			if var3467 == 1 then
				local _ = nil
				local var3470, var3471 = protoModule.readBuffer(p128, var3462)
				var3462 = var3471
				var3461.layout = t.ItemLayout.decode(var3470)
			elseif var3467 == 2 then
				local _ = nil
				local var3472, var3473 = protoModule.readBuffer(p128, var3462)
				var3462 = var3473
				var3461.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3472)
				}
			elseif var3467 == 3 then
				local _ = nil
				local var3474, var3475 = protoModule.readBuffer(p128, var3462)
				var3462 = var3475
				var3461.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3474) }
			else
				local _ = nil
				local var3476, var3477 = protoModule.readVarInt(p128, var3462)
				var3462 = var3477 + var3476
			end
		elseif var3463 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3478, var3479 = protoModule.readFixed32(p128, var3462)
			local _ = var3478
			var3462 = var3479
		elseif var3463 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3480, var3481 = protoModule.readFixed64(p128, var3462)
			local _ = var3480
			var3462 = var3481
		else
			error("Unsupported wire type: " .. var5051)
		end
	end
	return var3461
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
	local var3482 = t_128.new()
	
	if self.layout ~= nil then
		var3482.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3482.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3482.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3482.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3482
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
	local var3482 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3483 = v:encode()
			local var3484, var3485 = protoModule.writeTag(buff, var3482, 1, protoModule.wireTypes.lengthDelimited)
			var3484, var5076 = protoModule.writeBuffer(var3484, var3485, var3483, buffer.len(var3483))
			buff = var3484
			var3482 = var3485
		end
	end
	if self.collection_item_size ~= nil then
		local var3486, var3487 = protoModule.writeTag(buff, var3482, 2, protoModule.wireTypes.lengthDelimited)
		var3486, var5078 = protoModule.writeString(var3486, var3487, self.collection_item_size)
		buff = var3486
		var3482 = var3487
	end
	local buff_1 = buffer.create(var3482)
	buffer.copy(buff_1, 0, buff, 0, var3482)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3488 = t_129.new()
	local var3489 = 0
	while var3489 < buffer.len(p129) do
		local _ = nil
		local var3490 = nil
		local var3491, var3492, var3493 = protoModule.readTag(p129, var3489)
		local var3494 = var3491
		var3490 = var3492
		var3489 = var3493
		
		if var3490 == protoModule.wireTypes.varint then
			local _ = nil
			local var3495, var3496 = protoModule.readVarInt(p129, var3489)
			local _ = var3495
			var3489 = var3496
			continue
		end
		if var3490 == protoModule.wireTypes.lengthDelimited then
			if var3494 == 1 then
				local _ = nil
				local var3497, var3498 = protoModule.readBuffer(p129, var3489)
				var3489 = var3498
				table.insert(var3488.items, t.ItemWithLayout.decode(var3497))
			elseif var3494 == 2 then
				local _ = nil
				local var3499, var3500 = protoModule.readBuffer(p129, var3489)
				var3489 = var3500
				var3488.collection_item_size = buffer.tostring(var3499)
			else
				local _ = nil
				local var3501, var3502 = protoModule.readVarInt(p129, var3489)
				var3489 = var3502 + var3501
			end
		elseif var3490 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3503, var3504 = protoModule.readFixed32(p129, var3489)
			local _ = var3503
			var3489 = var3504
		elseif var3490 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3505, var3506 = protoModule.readFixed64(p129, var3489)
			local _ = var3505
			var3489 = var3506
		else
			error("Unsupported wire type: " .. var5082)
		end
	end
	return var3488
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
	local var3507 = t_129.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3507.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3507.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3507.collection_item_size = self.collectionItemSize
	end
	return var3507
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
	local var3508 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3509, var3510 = protoModule.writeTag(buff, var3508, 1, protoModule.wireTypes.varint)
		var3509, var5106 = protoModule.writeVarInt(var3509, var3510, self.col_span)
		buff = var3509
		var3508 = var3510
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3511, var3512 = protoModule.writeTag(buff, var3508, 2, protoModule.wireTypes.varint)
		var3511, var5108 = protoModule.writeVarInt(var3511, var3512, self.row_span)
		buff = var3511
		var3508 = var3512
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3513, var3514 = protoModule.writeTag(buff, var3508, 3, protoModule.wireTypes.lengthDelimited)
		var3513, var5110 = protoModule.writeString(var3513, var3514, self.alignment_type)
		buff = var3513
		var3508 = var3514
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3515, var3516 = protoModule.writeTag(buff, var3508, 4, protoModule.wireTypes.varint)
		var3515, var5112 = protoModule.writeVarInt(var3515, var3516, self.min_row_padding)
		buff = var3515
		var3508 = var3516
	end
	local buff_1 = buffer.create(var3508)
	buffer.copy(buff_1, 0, buff, 0, var3508)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref)
	local var3508 = t_130.new()
	local var3509 = 0
	while var3509 < buffer.len(p130) do
		local _ = nil
		local var3510 = nil
		local var3511, var3512, var3513 = protoModule.readTag(p130, var3509)
		local var3514 = var3511
		var3510 = var3512
		var3509 = var3513
		
		if var3510 == protoModule.wireTypes.varint then
			if var3514 == 1 then
				local _ = nil
				local var3515, var3516 = protoModule.readVarIntI32(p130, var3509)
				var3509 = var3516
				var3508.col_span = var3515
			elseif var3514 == 2 then
				local _ = nil
				local var3517, var3518 = protoModule.readVarIntI32(p130, var3509)
				var3509 = var3518
				var3508.row_span = var3517
			elseif var3514 == 4 then
				local _ = nil
				local var3519, var3520 = protoModule.readVarIntI32(p130, var3509)
				var3509 = var3520
				var3508.min_row_padding = var3519
			else
				local _ = nil
				local var3521, var3522 = protoModule.readVarInt(p130, var3509)
				local _ = var3521
				var3509 = var3522
			end
		end
		if var3510 == protoModule.wireTypes.lengthDelimited then
			if var3514 == 3 then
				local _ = nil
				local var3523, var3524 = protoModule.readBuffer(p130, var3509)
				var3509 = var3524
				var3508.alignment_type = buffer.tostring(var3523)
			else
				local _ = nil
				local var3525, var3526 = protoModule.readVarInt(p130, var3509)
				var3509 = var3526 + var3525
			end
		elseif var3510 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3527, var3528 = protoModule.readFixed32(p130, var3509)
			local _ = var3527
			var3509 = var3528
		elseif var3510 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3529, var3530 = protoModule.readFixed64(p130, var3509)
			local _ = var3529
			var3509 = var3530
		else
			error("Unsupported wire type: " .. var5116)
		end
	end
	return var3508
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
	local var3531 = t_130.new()
	
	if self.col_span ~= nil then
		var3531.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3531.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3531.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3531.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3531.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3531.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3531.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3531.min_row_padding = self.minRowPadding
	end
	return var3531
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
	local var3531 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3532, var3533 = protoModule.writeTag(buff, var3531, 1, protoModule.wireTypes.lengthDelimited)
		var3532, var5142 = protoModule.writeString(var3532, var3533, self.community_id)
		buff = var3532
		var3531 = var3533
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3534, var3535 = protoModule.writeTag(buff, var3531, 2, protoModule.wireTypes.lengthDelimited)
		var3534, var5144 = protoModule.writeString(var3534, var3535, self.announcement_id)
		buff = var3534
		var3531 = var3535
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3536, var3537 = protoModule.writeTag(buff, var3531, 3, protoModule.wireTypes.lengthDelimited)
		var3536, var5146 = protoModule.writeString(var3536, var3537, self.message_id)
		buff = var3536
		var3531 = var3537
	end
	if self.title ~= nil and self.title ~= "" then
		local var3538, var3539 = protoModule.writeTag(buff, var3531, 4, protoModule.wireTypes.lengthDelimited)
		var3538, var5148 = protoModule.writeString(var3538, var3539, self.title)
		buff = var3538
		var3531 = var3539
	end
	if self.body ~= nil and self.body ~= "" then
		local var3540, var3541 = protoModule.writeTag(buff, var3531, 5, protoModule.wireTypes.lengthDelimited)
		var3540, var5150 = protoModule.writeString(var3540, var3541, self.body)
		buff = var3540
		var3531 = var3541
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3542, var3543 = protoModule.writeTag(buff, var3531, 6, protoModule.wireTypes.lengthDelimited)
		var3542, var5152 = protoModule.writeString(var3542, var3543, self.creator_key)
		buff = var3542
		var3531 = var3543
	end
	if self.creator_role_name ~= nil then
		local var3544, var3545 = protoModule.writeTag(buff, var3531, 7, protoModule.wireTypes.lengthDelimited)
		var3544, var5154 = protoModule.writeString(var3544, var3545, self.creator_role_name)
		buff = var3544
		var3531 = var3545
	end
	if self.media_asset_id ~= nil then
		local var3546, var3547 = protoModule.writeTag(buff, var3531, 8, protoModule.wireTypes.lengthDelimited)
		var3546, var5156 = protoModule.writeString(var3546, var3547, self.media_asset_id)
		buff = var3546
		var3531 = var3547
	end
	if self.created_time ~= nil then
		local var3548 = self.created_time:encode()
		local var3549, var3550 = protoModule.writeTag(buff, var3531, 9, protoModule.wireTypes.lengthDelimited)
		var3549, var5159 = protoModule.writeBuffer(var3549, var3550, var3548, buffer.len(var3548))
		buff = var3549
		var3531 = var3550
	end
	local buff_1 = buffer.create(var3531)
	buffer.copy(buff_1, 0, buff, 0, var3531)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref), timestampModule (ref)
	local var3531 = t_131.new()
	local var3532 = 0
	while var3532 < buffer.len(p131) do
		local _ = nil
		local var3533 = nil
		local var3534, var3535, var3536 = protoModule.readTag(p131, var3532)
		local var3537 = var3534
		var3533 = var3535
		var3532 = var3536
		
		if var3533 == protoModule.wireTypes.varint then
			local _ = nil
			local var3538, var3539 = protoModule.readVarInt(p131, var3532)
			local _ = var3538
			var3532 = var3539
			continue
		end
		if var3533 == protoModule.wireTypes.lengthDelimited then
			if var3537 == 1 then
				local _ = nil
				local var3540, var3541 = protoModule.readBuffer(p131, var3532)
				var3532 = var3541
				var3531.community_id = buffer.tostring(var3540)
			elseif var3537 == 2 then
				local _ = nil
				local var3542, var3543 = protoModule.readBuffer(p131, var3532)
				var3532 = var3543
				var3531.announcement_id = buffer.tostring(var3542)
			elseif var3537 == 3 then
				local _ = nil
				local var3544, var3545 = protoModule.readBuffer(p131, var3532)
				var3532 = var3545
				var3531.message_id = buffer.tostring(var3544)
			elseif var3537 == 4 then
				local _ = nil
				local var3546, var3547 = protoModule.readBuffer(p131, var3532)
				var3532 = var3547
				var3531.title = buffer.tostring(var3546)
			elseif var3537 == 5 then
				local _ = nil
				local var3548, var3549 = protoModule.readBuffer(p131, var3532)
				var3532 = var3549
				var3531.body = buffer.tostring(var3548)
			elseif var3537 == 6 then
				local _ = nil
				local var3550, var3551 = protoModule.readBuffer(p131, var3532)
				var3532 = var3551
				var3531.creator_key = buffer.tostring(var3550)
			elseif var3537 == 7 then
				local _ = nil
				local var3552, var3553 = protoModule.readBuffer(p131, var3532)
				var3532 = var3553
				var3531.creator_role_name = buffer.tostring(var3552)
			elseif var3537 == 8 then
				local _ = nil
				local var3554, var3555 = protoModule.readBuffer(p131, var3532)
				var3532 = var3555
				var3531.media_asset_id = buffer.tostring(var3554)
			elseif var3537 == 9 then
				local _ = nil
				local var3556, var3557 = protoModule.readBuffer(p131, var3532)
				var3532 = var3557
				var3531.created_time = timestampModule.Timestamp.decode(var3556)
			else
				local _ = nil
				local var3558, var3559 = protoModule.readVarInt(p131, var3532)
				var3532 = var3559 + var3558
			end
		elseif var3533 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3560, var3561 = protoModule.readFixed32(p131, var3532)
			local _ = var3560
			var3532 = var3561
		elseif var3533 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3562, var3563 = protoModule.readFixed64(p131, var3532)
			local _ = var3562
			var3532 = var3563
		else
			error("Unsupported wire type: " .. var5163)
		end
	end
	return var3531
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
	local var3564 = t_131.new()
	
	if self.community_id ~= nil then
		var3564.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3564.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3564.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3564.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3564.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3564.message_id = self.messageId
	end
	if self.title ~= nil then
		var3564.title = self.title
	end
	if self.body ~= nil then
		var3564.body = self.body
	end
	if self.creator_key ~= nil then
		var3564.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3564.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3564.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3564.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3564.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3564.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3564.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3564.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3564
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