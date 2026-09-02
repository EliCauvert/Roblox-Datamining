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
	if self.cta_text ~= nil then
		local var1006, var1007 = protoModule.writeTag(buff, var969, 20, protoModule.wireTypes.lengthDelimited)
		var1006, var1661 = protoModule.writeString(var1006, var1007, self.cta_text)
		buff = var1006
		var969 = var1007
	end
	if self.badge_analytics_id ~= nil then
		local var1008, var1009 = protoModule.writeTag(buff, var969, 21, protoModule.wireTypes.lengthDelimited)
		var1008, var1663 = protoModule.writeString(var1008, var1009, self.badge_analytics_id)
		buff = var1008
		var969 = var1009
	end
	if self.game_items ~= nil and #self.game_items > 0 then
		for i, v in self.game_items do
			local var1010 = v:encode()
			local var1011, var1012 = protoModule.writeTag(buff, var969, 22, protoModule.wireTypes.lengthDelimited)
			var1011, var1666 = protoModule.writeBuffer(var1011, var1012, var1010, buffer.len(var1010))
			buff = var1011
			var969 = var1012
		end
	end
	local buff_1 = buffer.create(var969)
	buffer.copy(buff_1, 0, buff, 0, var969)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1013 = t_36.new()
	local var1014 = 0
	while var1014 < buffer.len(p36) do
		local _ = nil
		local var1015 = nil
		local var1016, var1017, var1018 = protoModule.readTag(p36, var1014)
		local var1019 = var1016
		var1015 = var1017
		var1014 = var1018
		
		if var1015 == protoModule.wireTypes.varint then
			if var1019 == 2 then
				local _ = nil
				local var1020, var1021 = protoModule.readVarInt(p36, var1014)
				var1014 = var1021
				var1013.is_sponsored = var1020 ~= 0
			elseif var1019 == 5 then
				local _ = nil
				local var1022, var1023 = protoModule.readVarInt(p36, var1014)
				var1014 = var1023
				var1013.is_content_locked = var1022 ~= 0
			elseif var1019 == 11 then
				local _ = nil
				local var1024, var1025 = protoModule.readVarIntI64(p36, var1014)
				var1014 = var1025
				var1013.player_count = var1024
			elseif var1019 == 13 then
				local _ = nil
				local var1026, var1027 = protoModule.readVarIntI32(p36, var1014)
				var1014 = var1027
				var1013.rank = var1026
			else
				local _ = nil
				local var1028, var1029 = protoModule.readVarInt(p36, var1014)
				local _ = var1028
				var1014 = var1029
			end
		end
		if var1015 == protoModule.wireTypes.lengthDelimited then
			if var1019 == 1 then
				local _ = nil
				local var1030, var1031 = protoModule.readBuffer(p36, var1014)
				var1014 = var1031
				var1013.universe_id = buffer.tostring(var1030)
			elseif var1019 == 3 then
				local _ = nil
				local var1032, var1033 = protoModule.readBuffer(p36, var1014)
				var1014 = var1033
				var1013.roblox_component = buffer.tostring(var1032)
			elseif var1019 == 4 then
				local _ = nil
				local var1034, var1035 = protoModule.readBuffer(p36, var1014)
				var1014 = var1035
				var1013.native_ad_data = buffer.tostring(var1034)
			elseif var1019 == 6 then
				local _ = nil
				local var1036, var1037 = protoModule.readBuffer(p36, var1014)
				var1014 = var1037
				var1013.title = buffer.tostring(var1036)
			elseif var1019 == 7 then
				local _ = nil
				local var1038, var1039 = protoModule.readBuffer(p36, var1014)
				var1014 = var1039
				var1013.subtitle = buffer.tostring(var1038)
			elseif var1019 == 8 then
				local _ = nil
				local var1040, var1041 = protoModule.readBuffer(p36, var1014)
				var1014 = var1041
				var1013.image_asset_id = buffer.tostring(var1040)
			elseif var1019 == 9 then
				local _ = nil
				local var1042, var1043 = protoModule.readBuffer(p36, var1014)
				var1014 = var1043
				var1013.video_asset_id = buffer.tostring(var1042)
			elseif var1019 == 10 then
				local _ = nil
				local var1044, var1045 = protoModule.readBuffer(p36, var1014)
				var1014 = var1045
				var1013.badge_text = buffer.tostring(var1044)
			elseif var1019 == 12 then
				local _ = nil
				local var1046, var1047 = protoModule.readBuffer(p36, var1014)
				var1014 = var1047
				var1013.creator_key = buffer.tostring(var1046)
			elseif var1019 == 14 then
				local _ = nil
				local var1048, var1049 = protoModule.readBuffer(p36, var1014)
				var1014 = var1049
				var1013.payer_name = buffer.tostring(var1048)
			elseif var1019 == 15 then
				local _ = nil
				local var1050, var1051 = protoModule.readBuffer(p36, var1014)
				var1014 = var1051
				var1013.logo_asset_id = buffer.tostring(var1050)
			elseif var1019 == 17 then
				local _ = nil
				local var1052, var1053 = protoModule.readBuffer(p36, var1014)
				var1014 = var1053
				var1013.place_id = buffer.tostring(var1052)
			elseif var1019 == 18 then
				local _ = nil
				local var1054, var1055 = protoModule.readBuffer(p36, var1014)
				var1014 = var1055
				var1013.launch_data = buffer.tostring(var1054)
			elseif var1019 == 20 then
				local _ = nil
				local var1056, var1057 = protoModule.readBuffer(p36, var1014)
				var1014 = var1057
				var1013.cta_text = buffer.tostring(var1056)
			elseif var1019 == 21 then
				local _ = nil
				local var1058, var1059 = protoModule.readBuffer(p36, var1014)
				var1014 = var1059
				var1013.badge_analytics_id = buffer.tostring(var1058)
			elseif var1019 == 22 then
				local _ = nil
				local var1060, var1061 = protoModule.readBuffer(p36, var1014)
				var1014 = var1061
				table.insert(var1013.game_items, t.GameItemInputData.decode(var1060))
			else
				local _ = nil
				local var1062, var1063 = protoModule.readVarInt(p36, var1014)
				var1014 = var1063 + var1062
			end
		elseif var1015 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1064, var1065 = protoModule.readFixed32(p36, var1014)
			local _ = var1064
			var1014 = var1065
		elseif var1015 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1670)
		elseif var1019 == 16 then
			local _ = nil
			local var1066, var1067 = protoModule.readDouble(p36, var1014)
			var1014 = var1067
			var1013.logo_aspect_ratio = var1066
		else
			local _ = nil
			local var1068, var1069 = protoModule.readFixed64(p36, var1014)
			local _ = var1068
			var1014 = var1069
		end
	end
	return var1013
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
	local var1070 = t_36.new()
	
	if self.universe_id ~= nil then
		var1070.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1070.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1070.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1070.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1070.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1070.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1070.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1070.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1070.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1070.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1070.title = self.title
	end
	if self.subtitle ~= nil then
		var1070.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1070.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1070.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1070.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1070.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1070.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1070.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1070.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1070.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1070.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1070.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1070.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1070.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1070.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1070.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1070.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1070.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1070.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1070.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1070.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1070.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1070.launch_data = self.launchData
	end
	if self.cta_text ~= nil then
		var1070.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1070.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1070.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1070.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.game_items ~= nil then
		local t_1 = {}
		
		for i, v in self.game_items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1070.game_items = t_1
	end
	if self.gameItems ~= nil then
		local t_1 = {}
		
		for i, v in self.gameItems do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1070.game_items = t_1
	end
	return var1070
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
	local var1071 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1072, var1073 = protoModule.writeTag(buff, var1071, 1, protoModule.wireTypes.lengthDelimited)
		var1072, var1733 = protoModule.writeString(var1072, var1073, self.title)
		buff = var1072
		var1071 = var1073
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1074 = v:encode()
			local var1075, var1076 = protoModule.writeTag(buff, var1071, 2, protoModule.wireTypes.lengthDelimited)
			var1075, var1736 = protoModule.writeBuffer(var1075, var1076, var1074, buffer.len(var1074))
			buff = var1075
			var1071 = var1076
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1077, var1078 = protoModule.writeTag(buff, var1071, 3, protoModule.wireTypes.lengthDelimited)
		var1077, var1738 = protoModule.writeString(var1077, var1078, self.next_page_token)
		buff = var1077
		var1071 = var1078
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1079, var1080 = protoModule.writeTag(buff, var1071, 4, protoModule.wireTypes.lengthDelimited)
		var1079, var1740 = protoModule.writeString(var1079, var1080, self.sort_id)
		buff = var1079
		var1071 = var1080
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1081, var1082 = protoModule.writeTag(buff, var1071, 5, protoModule.wireTypes.varint)
		var1081, var1742 = protoModule.writeVarInt(var1081, var1082, self.secondary_sort_id)
		buff = var1081
		var1071 = var1082
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1083, var1084 = protoModule.writeTag(buff, var1071, 6, protoModule.wireTypes.lengthDelimited)
		var1083, var1744 = protoModule.writeString(var1083, var1084, self.subtitle)
		buff = var1083
		var1071 = var1084
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1085, var1086 = protoModule.writeTag(buff, var1071, 7, protoModule.wireTypes.lengthDelimited)
		var1085, var1746 = protoModule.writeString(var1085, var1086, self.info_text)
		buff = var1085
		var1071 = var1086
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1087, var1088 = protoModule.writeTag(buff, var1071, 8, protoModule.wireTypes.lengthDelimited)
		var1087, var1748 = protoModule.writeString(var1087, var1088, self.subtitle_link_path)
		buff = var1087
		var1071 = var1088
	end
	if self.is_placeholder ~= nil then
		local var1089, var1090 = protoModule.writeTag(buff, var1071, 9, protoModule.wireTypes.varint)
		var1089, var1750 = protoModule.writeVarInt(var1089, var1090, if self.is_placeholder then 1 else 0)
		buff = var1089
		var1071 = var1090
	end
	if self.primary_sort_id ~= nil then
		local var1091, var1092 = protoModule.writeTag(buff, var1071, 10, protoModule.wireTypes.varint)
		var1091, var1752 = protoModule.writeVarInt(var1091, var1092, self.primary_sort_id)
		buff = var1091
		var1071 = var1092
	end
	if self.applied_filters ~= nil then
		local var1093, var1094 = protoModule.writeTag(buff, var1071, 11, protoModule.wireTypes.lengthDelimited)
		var1093, var1754 = protoModule.writeString(var1093, var1094, self.applied_filters)
		buff = var1093
		var1071 = var1094
	end
	local buff_1 = buffer.create(var1071)
	buffer.copy(buff_1, 0, buff, 0, var1071)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1095 = t_37.new()
	local var1096 = 0
	while var1096 < buffer.len(p37) do
		local _ = nil
		local var1097 = nil
		local var1098, var1099, var1100 = protoModule.readTag(p37, var1096)
		local var1101 = var1098
		var1097 = var1099
		var1096 = var1100
		
		if var1097 == protoModule.wireTypes.varint then
			if var1101 == 5 then
				local _ = nil
				local var1102, var1103 = protoModule.readVarIntI32(p37, var1096)
				var1096 = var1103
				var1095.secondary_sort_id = var1102
			elseif var1101 == 9 then
				local _ = nil
				local var1104, var1105 = protoModule.readVarInt(p37, var1096)
				var1096 = var1105
				var1095.is_placeholder = var1104 ~= 0
			elseif var1101 == 10 then
				local _ = nil
				local var1106, var1107 = protoModule.readVarIntI32(p37, var1096)
				var1096 = var1107
				var1095.primary_sort_id = var1106
			else
				local _ = nil
				local var1108, var1109 = protoModule.readVarInt(p37, var1096)
				local _ = var1108
				var1096 = var1109
			end
		end
		if var1097 == protoModule.wireTypes.lengthDelimited then
			if var1101 == 1 then
				local _ = nil
				local var1110, var1111 = protoModule.readBuffer(p37, var1096)
				var1096 = var1111
				var1095.title = buffer.tostring(var1110)
			elseif var1101 == 2 then
				local _ = nil
				local var1112, var1113 = protoModule.readBuffer(p37, var1096)
				var1096 = var1113
				table.insert(var1095.song_items, t.SongCarouselInputData_SongItem.decode(var1112))
			elseif var1101 == 3 then
				local _ = nil
				local var1114, var1115 = protoModule.readBuffer(p37, var1096)
				var1096 = var1115
				var1095.next_page_token = buffer.tostring(var1114)
			elseif var1101 == 4 then
				local _ = nil
				local var1116, var1117 = protoModule.readBuffer(p37, var1096)
				var1096 = var1117
				var1095.sort_id = buffer.tostring(var1116)
			elseif var1101 == 6 then
				local _ = nil
				local var1118, var1119 = protoModule.readBuffer(p37, var1096)
				var1096 = var1119
				var1095.subtitle = buffer.tostring(var1118)
			elseif var1101 == 7 then
				local _ = nil
				local var1120, var1121 = protoModule.readBuffer(p37, var1096)
				var1096 = var1121
				var1095.info_text = buffer.tostring(var1120)
			elseif var1101 == 8 then
				local _ = nil
				local var1122, var1123 = protoModule.readBuffer(p37, var1096)
				var1096 = var1123
				var1095.subtitle_link_path = buffer.tostring(var1122)
			elseif var1101 == 11 then
				local _ = nil
				local var1124, var1125 = protoModule.readBuffer(p37, var1096)
				var1096 = var1125
				var1095.applied_filters = buffer.tostring(var1124)
			else
				local _ = nil
				local var1126, var1127 = protoModule.readVarInt(p37, var1096)
				var1096 = var1127 + var1126
			end
		elseif var1097 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1128, var1129 = protoModule.readFixed32(p37, var1096)
			local _ = var1128
			var1096 = var1129
		elseif var1097 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1130, var1131 = protoModule.readFixed64(p37, var1096)
			local _ = var1130
			var1096 = var1131
		else
			error("Unsupported wire type: " .. var1758)
		end
	end
	return var1095
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
	local var1132 = t_37.new()
	
	if self.title ~= nil then
		var1132.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1132.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1132.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1132.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1132.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1132.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1132.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1132.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1132.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1132.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1132.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1132.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1132.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1132.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1132.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1132.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1132.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1132.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1132.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1132.applied_filters = self.appliedFilters
	end
	return var1132
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
	local var1133 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1134, var1135 = protoModule.writeTag(buff, var1133, 1, protoModule.wireTypes.lengthDelimited)
		var1134, var1801 = protoModule.writeString(var1134, var1135, self.song_id)
		buff = var1134
		var1133 = var1135
	end
	local buff_1 = buffer.create(var1133)
	buffer.copy(buff_1, 0, buff, 0, var1133)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1133 = t_38.new()
	local var1134 = 0
	while var1134 < buffer.len(p38) do
		local _ = nil
		local var1135 = nil
		local var1136, var1137, var1138 = protoModule.readTag(p38, var1134)
		local var1139 = var1136
		var1135 = var1137
		var1134 = var1138
		
		if var1135 == protoModule.wireTypes.varint then
			local _ = nil
			local var1140, var1141 = protoModule.readVarInt(p38, var1134)
			local _ = var1140
			var1134 = var1141
			continue
		end
		if var1135 == protoModule.wireTypes.lengthDelimited then
			if var1139 == 1 then
				local _ = nil
				local var1142, var1143 = protoModule.readBuffer(p38, var1134)
				var1134 = var1143
				var1133.song_id = buffer.tostring(var1142)
			else
				local _ = nil
				local var1144, var1145 = protoModule.readVarInt(p38, var1134)
				var1134 = var1145 + var1144
			end
		elseif var1135 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1146, var1147 = protoModule.readFixed32(p38, var1134)
			local _ = var1146
			var1134 = var1147
		elseif var1135 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1148, var1149 = protoModule.readFixed64(p38, var1134)
			local _ = var1148
			var1134 = var1149
		else
			error("Unsupported wire type: " .. var1805)
		end
	end
	return var1133
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
	local var1150 = t_38.new()
	
	if self.song_id ~= nil then
		var1150.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1150.song_id = self.songId
	end
	return var1150
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
	local var1150 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1151, var1152 = protoModule.writeTag(buff, var1150, 1, protoModule.wireTypes.lengthDelimited)
		var1151, var1825 = protoModule.writeString(var1151, var1152, self.title)
		buff = var1151
		var1150 = var1152
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1153 = v:encode()
			local var1154, var1155 = protoModule.writeTag(buff, var1150, 2, protoModule.wireTypes.lengthDelimited)
			var1154, var1828 = protoModule.writeBuffer(var1154, var1155, var1153, buffer.len(var1153))
			buff = var1154
			var1150 = var1155
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1156, var1157 = protoModule.writeTag(buff, var1150, 3, protoModule.wireTypes.lengthDelimited)
		var1156, var1830 = protoModule.writeString(var1156, var1157, self.universe_id)
		buff = var1156
		var1150 = var1157
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1158, var1159 = protoModule.writeTag(buff, var1150, 4, protoModule.wireTypes.lengthDelimited)
		var1158, var1832 = protoModule.writeString(var1158, var1159, self.sort_id)
		buff = var1158
		var1150 = var1159
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1160, var1161 = protoModule.writeTag(buff, var1150, 5, protoModule.wireTypes.lengthDelimited)
		var1160, var1834 = protoModule.writeString(var1160, var1161, self.subtitle)
		buff = var1160
		var1150 = var1161
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1162, var1163 = protoModule.writeTag(buff, var1150, 6, protoModule.wireTypes.lengthDelimited)
		var1162, var1836 = protoModule.writeString(var1162, var1163, self.info_text)
		buff = var1162
		var1150 = var1163
	end
	local buff_1 = buffer.create(var1150)
	buffer.copy(buff_1, 0, buff, 0, var1150)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1164 = t_39.new()
	local var1165 = 0
	while var1165 < buffer.len(p39) do
		local _ = nil
		local var1166 = nil
		local var1167, var1168, var1169 = protoModule.readTag(p39, var1165)
		local var1170 = var1167
		var1166 = var1168
		var1165 = var1169
		
		if var1166 == protoModule.wireTypes.varint then
			local _ = nil
			local var1171, var1172 = protoModule.readVarInt(p39, var1165)
			local _ = var1171
			var1165 = var1172
			continue
		end
		if var1166 == protoModule.wireTypes.lengthDelimited then
			if var1170 == 1 then
				local _ = nil
				local var1173, var1174 = protoModule.readBuffer(p39, var1165)
				var1165 = var1174
				var1164.title = buffer.tostring(var1173)
			elseif var1170 == 2 then
				local _ = nil
				local var1175, var1176 = protoModule.readBuffer(p39, var1165)
				var1165 = var1176
				table.insert(var1164.event_items, t.EventsCarouselInputData_EventItem.decode(var1175))
			elseif var1170 == 3 then
				local _ = nil
				local var1177, var1178 = protoModule.readBuffer(p39, var1165)
				var1165 = var1178
				var1164.universe_id = buffer.tostring(var1177)
			elseif var1170 == 4 then
				local _ = nil
				local var1179, var1180 = protoModule.readBuffer(p39, var1165)
				var1165 = var1180
				var1164.sort_id = buffer.tostring(var1179)
			elseif var1170 == 5 then
				local _ = nil
				local var1181, var1182 = protoModule.readBuffer(p39, var1165)
				var1165 = var1182
				var1164.subtitle = buffer.tostring(var1181)
			elseif var1170 == 6 then
				local _ = nil
				local var1183, var1184 = protoModule.readBuffer(p39, var1165)
				var1165 = var1184
				var1164.info_text = buffer.tostring(var1183)
			else
				local _ = nil
				local var1185, var1186 = protoModule.readVarInt(p39, var1165)
				var1165 = var1186 + var1185
			end
		elseif var1166 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1187, var1188 = protoModule.readFixed32(p39, var1165)
			local _ = var1187
			var1165 = var1188
		elseif var1166 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1189, var1190 = protoModule.readFixed64(p39, var1165)
			local _ = var1189
			var1165 = var1190
		else
			error("Unsupported wire type: " .. var1840)
		end
	end
	return var1164
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
	local var1191 = t_39.new()
	
	if self.title ~= nil then
		var1191.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1191.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1191.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1191.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1191.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1191.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1191.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1191.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1191.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1191.info_text = self.infoText
	end
	return var1191
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
	local var1192 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1193, var1194 = protoModule.writeTag(buff, var1192, 1, protoModule.wireTypes.lengthDelimited)
		var1193, var1873 = protoModule.writeString(var1193, var1194, self.event_id)
		buff = var1193
		var1192 = var1194
	end
	local buff_1 = buffer.create(var1192)
	buffer.copy(buff_1, 0, buff, 0, var1192)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1192 = t_40.new()
	local var1193 = 0
	while var1193 < buffer.len(p40) do
		local _ = nil
		local var1194 = nil
		local var1195, var1196, var1197 = protoModule.readTag(p40, var1193)
		local var1198 = var1195
		var1194 = var1196
		var1193 = var1197
		
		if var1194 == protoModule.wireTypes.varint then
			local _ = nil
			local var1199, var1200 = protoModule.readVarInt(p40, var1193)
			local _ = var1199
			var1193 = var1200
			continue
		end
		if var1194 == protoModule.wireTypes.lengthDelimited then
			if var1198 == 1 then
				local _ = nil
				local var1201, var1202 = protoModule.readBuffer(p40, var1193)
				var1193 = var1202
				var1192.event_id = buffer.tostring(var1201)
			else
				local _ = nil
				local var1203, var1204 = protoModule.readVarInt(p40, var1193)
				var1193 = var1204 + var1203
			end
		elseif var1194 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1205, var1206 = protoModule.readFixed32(p40, var1193)
			local _ = var1205
			var1193 = var1206
		elseif var1194 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1207, var1208 = protoModule.readFixed64(p40, var1193)
			local _ = var1207
			var1193 = var1208
		else
			error("Unsupported wire type: " .. var1877)
		end
	end
	return var1192
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
	local var1209 = t_40.new()
	
	if self.event_id ~= nil then
		var1209.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1209.event_id = self.eventId
	end
	return var1209
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
	local var1209 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1210, var1211 = protoModule.writeTag(buff, var1209, 1, protoModule.wireTypes.lengthDelimited)
		var1210, var1897 = protoModule.writeString(var1210, var1211, self.universe_id)
		buff = var1210
		var1209 = var1211
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1212, var1213 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1212, var1899 = protoModule.writeString(var1212, var1213, i)
			local var1214 = v:encode()
			var1213, var1901 = protoModule.writeTag(var1212, var1213, 2, protoModule.wireTypes.lengthDelimited)
			var1213, var1901 = protoModule.writeBuffer(var1213, var1901, var1214, buffer.len(var1214))
			local var1215 = var1213
			local var1216 = var1901
			local var1217, var1218 = protoModule.writeTag(buff, var1209, 2, protoModule.wireTypes.lengthDelimited)
			var1217, var1905 = protoModule.writeBuffer(var1217, var1218, var1215, var1216)
			buff = var1217
			var1209 = var1218
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1219, var1220 = protoModule.writeTag(buff, var1209, 3, protoModule.wireTypes.lengthDelimited)
			var1219, var1907 = protoModule.writeString(var1219, var1220, v)
			buff = var1219
			var1209 = var1220
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1221, var1222 = protoModule.writeTag(buff, var1209, 4, protoModule.wireTypes.lengthDelimited)
		var1221, var1909 = protoModule.writeString(var1221, var1222, self.creator_key)
		buff = var1221
		var1209 = var1222
	end
	local buff_1 = buffer.create(var1209)
	buffer.copy(buff_1, 0, buff, 0, var1209)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1223 = t_41.new()
	local var1224 = 0
	while var1224 < buffer.len(p41) do
		local _ = nil
		local var1225 = nil
		local var1226, var1227, var1228 = protoModule.readTag(p41, var1224)
		local var1229 = var1226
		var1225 = var1227
		var1224 = var1228
		
		if var1225 == protoModule.wireTypes.varint then
			local _ = nil
			local var1230, var1231 = protoModule.readVarInt(p41, var1224)
			local _ = var1230
			var1224 = var1231
			continue
		end
		if var1225 == protoModule.wireTypes.lengthDelimited then
			if var1229 == 1 then
				local _ = nil
				local var1232, var1233 = protoModule.readBuffer(p41, var1224)
				var1224 = var1233
				var1223.universe_id = buffer.tostring(var1232)
			elseif var1229 == 2 then
				local _ = nil
				local var1234, var1235 = protoModule.readBuffer(p41, var1224)
				var1224 = var1235
				var1234 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1234)
				var1223.entry_map[var1234.key or ""] = var1234.value or t.FeedEntry.new()
			elseif var1229 == 3 then
				local _ = nil
				local var1236, var1237 = protoModule.readBuffer(p41, var1224)
				var1224 = var1237
				table.insert(var1223.entry_order, buffer.tostring(var1236))
			elseif var1229 == 4 then
				local _ = nil
				local var1238, var1239 = protoModule.readBuffer(p41, var1224)
				var1224 = var1239
				var1223.creator_key = buffer.tostring(var1238)
			else
				local _ = nil
				local var1240, var1241 = protoModule.readVarInt(p41, var1224)
				var1224 = var1241 + var1240
			end
		elseif var1225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1242, var1243 = protoModule.readFixed32(p41, var1224)
			local _ = var1242
			var1224 = var1243
		elseif var1225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1244, var1245 = protoModule.readFixed64(p41, var1224)
			local _ = var1244
			var1224 = var1245
		else
			error("Unsupported wire type: " .. var1913)
		end
	end
	return var1223
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
	local var1246 = t_41.new()
	
	if self.universe_id ~= nil then
		var1246.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1246.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1246.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1246.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1246.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1246.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1246.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1246.creator_key = self.creatorKey
	end
	return var1246
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
	local var1247 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1248, var1249 = protoModule.writeTag(buff, var1247, 1, protoModule.wireTypes.lengthDelimited)
		var1248, var1945 = protoModule.writeString(var1248, var1249, self.key)
		buff = var1248
		var1247 = var1249
	end
	if self.value ~= nil then
		local var1250 = self.value:encode()
		local var1251, var1252 = protoModule.writeTag(buff, var1247, 2, protoModule.wireTypes.lengthDelimited)
		var1251, var1948 = protoModule.writeBuffer(var1251, var1252, var1250, buffer.len(var1250))
		buff = var1251
		var1247 = var1252
	end
	local buff_1 = buffer.create(var1247)
	buffer.copy(buff_1, 0, buff, 0, var1247)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1247 = t_42.new()
	local var1248 = 0
	while var1248 < buffer.len(p42) do
		local _ = nil
		local var1249 = nil
		local var1250, var1251, var1252 = protoModule.readTag(p42, var1248)
		local var1253 = var1250
		var1249 = var1251
		var1248 = var1252
		
		if var1249 == protoModule.wireTypes.varint then
			local _ = nil
			local var1254, var1255 = protoModule.readVarInt(p42, var1248)
			local _ = var1254
			var1248 = var1255
			continue
		end
		if var1249 == protoModule.wireTypes.lengthDelimited then
			if var1253 == 1 then
				local _ = nil
				local var1256, var1257 = protoModule.readBuffer(p42, var1248)
				var1248 = var1257
				var1247.key = buffer.tostring(var1256)
			elseif var1253 == 2 then
				local _ = nil
				local var1258, var1259 = protoModule.readBuffer(p42, var1248)
				var1248 = var1259
				var1247.value = t.FeedEntry.decode(var1258)
			else
				local _ = nil
				local var1260, var1261 = protoModule.readVarInt(p42, var1248)
				var1248 = var1261 + var1260
			end
		elseif var1249 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1262, var1263 = protoModule.readFixed32(p42, var1248)
			local _ = var1262
			var1248 = var1263
		elseif var1249 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1264, var1265 = protoModule.readFixed64(p42, var1248)
			local _ = var1264
			var1248 = var1265
		else
			error("Unsupported wire type: " .. var1952)
		end
	end
	return var1247
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
	local var1266 = t_42.new()
	
	if self.key ~= nil then
		var1266.key = self.key
	end
	if self.value ~= nil then
		var1266.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1266
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
	local var1266 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1267 = v:encode()
			local var1268, var1269 = protoModule.writeTag(buff, var1266, 1, protoModule.wireTypes.lengthDelimited)
			var1268, var1975 = protoModule.writeBuffer(var1268, var1269, var1267, buffer.len(var1267))
			buff = var1268
			var1266 = var1269
		end
	end
	local buff_1 = buffer.create(var1266)
	buffer.copy(buff_1, 0, buff, 0, var1266)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1270 = t_43.new()
	local var1271 = 0
	while var1271 < buffer.len(p43) do
		local _ = nil
		local var1272 = nil
		local var1273, var1274, var1275 = protoModule.readTag(p43, var1271)
		local var1276 = var1273
		var1272 = var1274
		var1271 = var1275
		
		if var1272 == protoModule.wireTypes.varint then
			local _ = nil
			local var1277, var1278 = protoModule.readVarInt(p43, var1271)
			local _ = var1277
			var1271 = var1278
			continue
		end
		if var1272 == protoModule.wireTypes.lengthDelimited then
			if var1276 == 1 then
				local _ = nil
				local var1279, var1280 = protoModule.readBuffer(p43, var1271)
				var1271 = var1280
				table.insert(var1270.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1279))
			else
				local _ = nil
				local var1281, var1282 = protoModule.readVarInt(p43, var1271)
				var1271 = var1282 + var1281
			end
		elseif var1272 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1283, var1284 = protoModule.readFixed32(p43, var1271)
			local _ = var1283
			var1271 = var1284
		elseif var1272 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1285, var1286 = protoModule.readFixed64(p43, var1271)
			local _ = var1285
			var1271 = var1286
		else
			error("Unsupported wire type: " .. var1979)
		end
	end
	return var1270
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
	local var1287 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1287.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1287.game_passes = t_1
	end
	return var1287
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
	local var1288 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1289, var1290 = protoModule.writeTag(buff, var1288, 1, protoModule.wireTypes.lengthDelimited)
		var1289, var2002 = protoModule.writeString(var1289, var1290, self.game_pass_id)
		buff = var1289
		var1288 = var1290
	end
	local buff_1 = buffer.create(var1288)
	buffer.copy(buff_1, 0, buff, 0, var1288)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1288 = t_44.new()
	local var1289 = 0
	while var1289 < buffer.len(p44) do
		local _ = nil
		local var1290 = nil
		local var1291, var1292, var1293 = protoModule.readTag(p44, var1289)
		local var1294 = var1291
		var1290 = var1292
		var1289 = var1293
		
		if var1290 == protoModule.wireTypes.varint then
			local _ = nil
			local var1295, var1296 = protoModule.readVarInt(p44, var1289)
			local _ = var1295
			var1289 = var1296
			continue
		end
		if var1290 == protoModule.wireTypes.lengthDelimited then
			if var1294 == 1 then
				local _ = nil
				local var1297, var1298 = protoModule.readBuffer(p44, var1289)
				var1289 = var1298
				var1288.game_pass_id = buffer.tostring(var1297)
			else
				local _ = nil
				local var1299, var1300 = protoModule.readVarInt(p44, var1289)
				var1289 = var1300 + var1299
			end
		elseif var1290 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1301, var1302 = protoModule.readFixed32(p44, var1289)
			local _ = var1301
			var1289 = var1302
		elseif var1290 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1303, var1304 = protoModule.readFixed64(p44, var1289)
			local _ = var1303
			var1289 = var1304
		else
			error("Unsupported wire type: " .. var2006)
		end
	end
	return var1288
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
	local var1305 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1305.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1305.game_pass_id = self.gamePassId
	end
	return var1305
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
	local var1305 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1306 = v:encode()
			local var1307, var1308 = protoModule.writeTag(buff, var1305, 1, protoModule.wireTypes.lengthDelimited)
			var1307, var2027 = protoModule.writeBuffer(var1307, var1308, var1306, buffer.len(var1306))
			buff = var1307
			var1305 = var1308
		end
	end
	local buff_1 = buffer.create(var1305)
	buffer.copy(buff_1, 0, buff, 0, var1305)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1309 = t_45.new()
	local var1310 = 0
	while var1310 < buffer.len(p45) do
		local _ = nil
		local var1311 = nil
		local var1312, var1313, var1314 = protoModule.readTag(p45, var1310)
		local var1315 = var1312
		var1311 = var1313
		var1310 = var1314
		
		if var1311 == protoModule.wireTypes.varint then
			local _ = nil
			local var1316, var1317 = protoModule.readVarInt(p45, var1310)
			local _ = var1316
			var1310 = var1317
			continue
		end
		if var1311 == protoModule.wireTypes.lengthDelimited then
			if var1315 == 1 then
				local _ = nil
				local var1318, var1319 = protoModule.readBuffer(p45, var1310)
				var1310 = var1319
				table.insert(var1309.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1318))
			else
				local _ = nil
				local var1320, var1321 = protoModule.readVarInt(p45, var1310)
				var1310 = var1321 + var1320
			end
		elseif var1311 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1322, var1323 = protoModule.readFixed32(p45, var1310)
			local _ = var1322
			var1310 = var1323
		elseif var1311 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1324, var1325 = protoModule.readFixed64(p45, var1310)
			local _ = var1324
			var1310 = var1325
		else
			error("Unsupported wire type: " .. var2031)
		end
	end
	return var1309
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
	local var1326 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1326.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1326.developer_products = t_1
	end
	return var1326
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
	local var1327 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1328, var1329 = protoModule.writeTag(buff, var1327, 1, protoModule.wireTypes.lengthDelimited)
		var1328, var2054 = protoModule.writeString(var1328, var1329, self.developer_product_id)
		buff = var1328
		var1327 = var1329
	end
	local buff_1 = buffer.create(var1327)
	buffer.copy(buff_1, 0, buff, 0, var1327)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1327 = t_46.new()
	local var1328 = 0
	while var1328 < buffer.len(p46) do
		local _ = nil
		local var1329 = nil
		local var1330, var1331, var1332 = protoModule.readTag(p46, var1328)
		local var1333 = var1330
		var1329 = var1331
		var1328 = var1332
		
		if var1329 == protoModule.wireTypes.varint then
			local _ = nil
			local var1334, var1335 = protoModule.readVarInt(p46, var1328)
			local _ = var1334
			var1328 = var1335
			continue
		end
		if var1329 == protoModule.wireTypes.lengthDelimited then
			if var1333 == 1 then
				local _ = nil
				local var1336, var1337 = protoModule.readBuffer(p46, var1328)
				var1328 = var1337
				var1327.developer_product_id = buffer.tostring(var1336)
			else
				local _ = nil
				local var1338, var1339 = protoModule.readVarInt(p46, var1328)
				var1328 = var1339 + var1338
			end
		elseif var1329 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1340, var1341 = protoModule.readFixed32(p46, var1328)
			local _ = var1340
			var1328 = var1341
		elseif var1329 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1342, var1343 = protoModule.readFixed64(p46, var1328)
			local _ = var1342
			var1328 = var1343
		else
			error("Unsupported wire type: " .. var2058)
		end
	end
	return var1327
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
	local var1344 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var1344.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1344.developer_product_id = self.developerProductId
	end
	return var1344
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
	local var1344 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1345 = v:encode()
			local var1346, var1347 = protoModule.writeTag(buff, var1344, 1, protoModule.wireTypes.lengthDelimited)
			var1346, var2079 = protoModule.writeBuffer(var1346, var1347, var1345, buffer.len(var1345))
			buff = var1346
			var1344 = var1347
		end
	end
	local buff_1 = buffer.create(var1344)
	buffer.copy(buff_1, 0, buff, 0, var1344)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1348 = t_47.new()
	local var1349 = 0
	while var1349 < buffer.len(p47) do
		local _ = nil
		local var1350 = nil
		local var1351, var1352, var1353 = protoModule.readTag(p47, var1349)
		local var1354 = var1351
		var1350 = var1352
		var1349 = var1353
		
		if var1350 == protoModule.wireTypes.varint then
			local _ = nil
			local var1355, var1356 = protoModule.readVarInt(p47, var1349)
			local _ = var1355
			var1349 = var1356
			continue
		end
		if var1350 == protoModule.wireTypes.lengthDelimited then
			if var1354 == 1 then
				local _ = nil
				local var1357, var1358 = protoModule.readBuffer(p47, var1349)
				var1349 = var1358
				table.insert(var1348.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1357))
			else
				local _ = nil
				local var1359, var1360 = protoModule.readVarInt(p47, var1349)
				var1349 = var1360 + var1359
			end
		elseif var1350 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1361, var1362 = protoModule.readFixed32(p47, var1349)
			local _ = var1361
			var1349 = var1362
		elseif var1350 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1363, var1364 = protoModule.readFixed64(p47, var1349)
			local _ = var1363
			var1349 = var1364
		else
			error("Unsupported wire type: " .. var2083)
		end
	end
	return var1348
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
	local var1365 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1365.subscriptions = t_1
	end
	return var1365
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
	local var1366 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var1367, var1368 = protoModule.writeTag(buff, var1366, 1, protoModule.wireTypes.lengthDelimited)
		var1367, var2105 = protoModule.writeString(var1367, var1368, self.subscription_id)
		buff = var1367
		var1366 = var1368
	end
	local buff_1 = buffer.create(var1366)
	buffer.copy(buff_1, 0, buff, 0, var1366)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1366 = t_48.new()
	local var1367 = 0
	while var1367 < buffer.len(p48) do
		local _ = nil
		local var1368 = nil
		local var1369, var1370, var1371 = protoModule.readTag(p48, var1367)
		local var1372 = var1369
		var1368 = var1370
		var1367 = var1371
		
		if var1368 == protoModule.wireTypes.varint then
			local _ = nil
			local var1373, var1374 = protoModule.readVarInt(p48, var1367)
			local _ = var1373
			var1367 = var1374
			continue
		end
		if var1368 == protoModule.wireTypes.lengthDelimited then
			if var1372 == 1 then
				local _ = nil
				local var1375, var1376 = protoModule.readBuffer(p48, var1367)
				var1367 = var1376
				var1366.subscription_id = buffer.tostring(var1375)
			else
				local _ = nil
				local var1377, var1378 = protoModule.readVarInt(p48, var1367)
				var1367 = var1378 + var1377
			end
		elseif var1368 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1379, var1380 = protoModule.readFixed32(p48, var1367)
			local _ = var1379
			var1367 = var1380
		elseif var1368 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1381, var1382 = protoModule.readFixed64(p48, var1367)
			local _ = var1381
			var1367 = var1382
		else
			error("Unsupported wire type: " .. var2109)
		end
	end
	return var1366
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
	local var1383 = t_48.new()
	
	if self.subscription_id ~= nil then
		var1383.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1383.subscription_id = self.subscriptionId
	end
	return var1383
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
	local var1383 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1384 = v:encode()
			local var1385, var1386 = protoModule.writeTag(buff, var1383, 1, protoModule.wireTypes.lengthDelimited)
			var1385, var2130 = protoModule.writeBuffer(var1385, var1386, var1384, buffer.len(var1384))
			buff = var1385
			var1383 = var1386
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1387, var1388 = protoModule.writeTag(buff, var1383, 2, protoModule.wireTypes.lengthDelimited)
		var1387, var2132 = protoModule.writeString(var1387, var1388, self.universe_id)
		buff = var1387
		var1383 = var1388
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var1389, var1390 = protoModule.writeTag(buff, var1383, 3, protoModule.wireTypes.lengthDelimited)
		var1389, var2134 = protoModule.writeString(var1389, var1390, self.section_title)
		buff = var1389
		var1383 = var1390
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1391, var1392 = protoModule.writeTag(buff, var1383, 4, protoModule.wireTypes.lengthDelimited)
		var1391, var2136 = protoModule.writeString(var1391, var1392, self.creator_key)
		buff = var1391
		var1383 = var1392
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var1393, var1394 = protoModule.writeTag(buff, var1383, 5, protoModule.wireTypes.lengthDelimited)
		var1393, var2138 = protoModule.writeString(var1393, var1394, self.collection_item_size)
		buff = var1393
		var1383 = var1394
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var1395, var1396 = protoModule.writeTag(buff, var1383, 6, protoModule.wireTypes.lengthDelimited)
		var1395, var2140 = protoModule.writeString(var1395, var1396, self.item_height_mode)
		buff = var1395
		var1383 = var1396
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var1397, var1398 = protoModule.writeTag(buff, var1383, 7, protoModule.wireTypes.lengthDelimited)
		var1397, var2142 = protoModule.writeString(var1397, var1398, self.experience_store_product_type)
		buff = var1397
		var1383 = var1398
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var1399, var1400 = protoModule.writeTag(buff, var1383, 8, protoModule.wireTypes.lengthDelimited)
		var1399, var2144 = protoModule.writeString(var1399, var1400, self.content_type)
		buff = var1399
		var1383 = var1400
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var1401, var1402 = protoModule.writeTag(buff, var1383, 9, protoModule.wireTypes.lengthDelimited)
		var1401, var2146 = protoModule.writeString(var1401, var1402, self.item_type)
		buff = var1401
		var1383 = var1402
	end
	local buff_1 = buffer.create(var1383)
	buffer.copy(buff_1, 0, buff, 0, var1383)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1403 = t_49.new()
	local var1404 = 0
	while var1404 < buffer.len(p49) do
		local _ = nil
		local var1405 = nil
		local var1406, var1407, var1408 = protoModule.readTag(p49, var1404)
		local var1409 = var1406
		var1405 = var1407
		var1404 = var1408
		
		if var1405 == protoModule.wireTypes.varint then
			local _ = nil
			local var1410, var1411 = protoModule.readVarInt(p49, var1404)
			local _ = var1410
			var1404 = var1411
			continue
		end
		if var1405 == protoModule.wireTypes.lengthDelimited then
			if var1409 == 1 then
				local _ = nil
				local var1412, var1413 = protoModule.readBuffer(p49, var1404)
				var1404 = var1413
				table.insert(var1403.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var1412))
			elseif var1409 == 2 then
				local _ = nil
				local var1414, var1415 = protoModule.readBuffer(p49, var1404)
				var1404 = var1415
				var1403.universe_id = buffer.tostring(var1414)
			elseif var1409 == 3 then
				local _ = nil
				local var1416, var1417 = protoModule.readBuffer(p49, var1404)
				var1404 = var1417
				var1403.section_title = buffer.tostring(var1416)
			elseif var1409 == 4 then
				local _ = nil
				local var1418, var1419 = protoModule.readBuffer(p49, var1404)
				var1404 = var1419
				var1403.creator_key = buffer.tostring(var1418)
			elseif var1409 == 5 then
				local _ = nil
				local var1420, var1421 = protoModule.readBuffer(p49, var1404)
				var1404 = var1421
				var1403.collection_item_size = buffer.tostring(var1420)
			elseif var1409 == 6 then
				local _ = nil
				local var1422, var1423 = protoModule.readBuffer(p49, var1404)
				var1404 = var1423
				var1403.item_height_mode = buffer.tostring(var1422)
			elseif var1409 == 7 then
				local _ = nil
				local var1424, var1425 = protoModule.readBuffer(p49, var1404)
				var1404 = var1425
				var1403.experience_store_product_type = buffer.tostring(var1424)
			elseif var1409 == 8 then
				local _ = nil
				local var1426, var1427 = protoModule.readBuffer(p49, var1404)
				var1404 = var1427
				var1403.content_type = buffer.tostring(var1426)
			elseif var1409 == 9 then
				local _ = nil
				local var1428, var1429 = protoModule.readBuffer(p49, var1404)
				var1404 = var1429
				var1403.item_type = buffer.tostring(var1428)
			else
				local _ = nil
				local var1430, var1431 = protoModule.readVarInt(p49, var1404)
				var1404 = var1431 + var1430
			end
		elseif var1405 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1432, var1433 = protoModule.readFixed32(p49, var1404)
			local _ = var1432
			var1404 = var1433
		elseif var1405 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1434, var1435 = protoModule.readFixed64(p49, var1404)
			local _ = var1434
			var1404 = var1435
		else
			error("Unsupported wire type: " .. var2150)
		end
	end
	return var1403
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
	local var1436 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1436.items = t_1
	end
	if self.universe_id ~= nil then
		var1436.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1436.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1436.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1436.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1436.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1436.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1436.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1436.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1436.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1436.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1436.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1436.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1436.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1436.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1436.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1436.item_type = self.itemType
	end
	return var1436
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
	local var1437 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var1438, var1439 = protoModule.writeTag(buff, var1437, 1, protoModule.wireTypes.lengthDelimited)
		var1438, var2188 = protoModule.writeString(var1438, var1439, self.item_id)
		buff = var1438
		var1437 = var1439
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var1440, var1441 = protoModule.writeTag(buff, var1437, 2, protoModule.wireTypes.varint)
		var1440, var2190 = protoModule.writeVarInt(var1440, var1441, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var1440
		var1437 = var1441
	end
	local buff_1 = buffer.create(var1437)
	buffer.copy(buff_1, 0, buff, 0, var1437)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
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
			if var1443 == 2 then
				local _ = nil
				local var1444, var1445 = protoModule.readVarIntI32(p50, var1438)
				local var1446 = var1444
				var1438 = var1445
				var1437.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var1446) or var1446
			else
				local _ = nil
				local var1447, var1448 = protoModule.readVarInt(p50, var1438)
				local _ = var1447
				var1438 = var1448
			end
		end
		if var1439 == protoModule.wireTypes.lengthDelimited then
			if var1443 == 1 then
				local _ = nil
				local var1449, var1450 = protoModule.readBuffer(p50, var1438)
				var1438 = var1450
				var1437.item_id = buffer.tostring(var1449)
			else
				local _ = nil
				local var1451, var1452 = protoModule.readVarInt(p50, var1438)
				var1438 = var1452 + var1451
			end
		elseif var1439 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1453, var1454 = protoModule.readFixed32(p50, var1438)
			local _ = var1453
			var1438 = var1454
		elseif var1439 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1455, var1456 = protoModule.readFixed64(p50, var1438)
			local _ = var1455
			var1438 = var1456
		else
			error("Unsupported wire type: " .. var2194)
		end
	end
	return var1437
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
	local var1457 = t_50.new()
	
	if self.item_id ~= nil then
		var1457.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1457.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1457.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1457
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
	local var1457 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1458, var1459 = protoModule.writeTag(buff, var1457, 1, protoModule.wireTypes.lengthDelimited)
		var1458, var2217 = protoModule.writeString(var1458, var1459, self.roblox_component)
		buff = var1458
		var1457 = var1459
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var1460, var1461 = protoModule.writeTag(buff, var1457, 2, protoModule.wireTypes.lengthDelimited)
		var1460, var2219 = protoModule.writeString(var1460, var1461, self.identifier)
		buff = var1460
		var1457 = var1461
	end
	if self.title ~= nil and self.title ~= "" then
		local var1462, var1463 = protoModule.writeTag(buff, var1457, 3, protoModule.wireTypes.lengthDelimited)
		var1462, var2221 = protoModule.writeString(var1462, var1463, self.title)
		buff = var1462
		var1457 = var1463
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1464, var1465 = protoModule.writeTag(buff, var1457, 4, protoModule.wireTypes.lengthDelimited)
		var1464, var2223 = protoModule.writeString(var1464, var1465, self.user_id)
		buff = var1464
		var1457 = var1465
	end
	if self.description ~= nil and self.description ~= "" then
		local var1466, var1467 = protoModule.writeTag(buff, var1457, 5, protoModule.wireTypes.lengthDelimited)
		var1466, var2225 = protoModule.writeString(var1466, var1467, self.description)
		buff = var1466
		var1457 = var1467
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1468, var1469 = protoModule.writeTag(buff, var1457, 6, protoModule.wireTypes.lengthDelimited)
		var1468, var2227 = protoModule.writeString(var1468, var1469, self.cta_text)
		buff = var1468
		var1457 = var1469
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1470, var1471 = protoModule.writeTag(buff, var1457, 7, protoModule.wireTypes.lengthDelimited)
		var1470, var2229 = protoModule.writeString(var1470, var1471, self.prompt_id)
		buff = var1470
		var1457 = var1471
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1472, var1473 = protoModule.writeTag(buff, var1457, 8, protoModule.wireTypes.lengthDelimited)
		var1472, var2231 = protoModule.writeString(var1472, var1473, self.prompt_type)
		buff = var1472
		var1457 = var1473
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1474, var1475 = protoModule.writeTag(buff, var1457, 9, protoModule.wireTypes.lengthDelimited)
		var1474, var2233 = protoModule.writeString(var1474, var1475, self.entity_id)
		buff = var1474
		var1457 = var1475
	end
	local buff_1 = buffer.create(var1457)
	buffer.copy(buff_1, 0, buff, 0, var1457)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref)
	local var1457 = t_51.new()
	local var1458 = 0
	while var1458 < buffer.len(p51) do
		local _ = nil
		local var1459 = nil
		local var1460, var1461, var1462 = protoModule.readTag(p51, var1458)
		local var1463 = var1460
		var1459 = var1461
		var1458 = var1462
		
		if var1459 == protoModule.wireTypes.varint then
			local _ = nil
			local var1464, var1465 = protoModule.readVarInt(p51, var1458)
			local _ = var1464
			var1458 = var1465
			continue
		end
		if var1459 == protoModule.wireTypes.lengthDelimited then
			if var1463 == 1 then
				local _ = nil
				local var1466, var1467 = protoModule.readBuffer(p51, var1458)
				var1458 = var1467
				var1457.roblox_component = buffer.tostring(var1466)
			elseif var1463 == 2 then
				local _ = nil
				local var1468, var1469 = protoModule.readBuffer(p51, var1458)
				var1458 = var1469
				var1457.identifier = buffer.tostring(var1468)
			elseif var1463 == 3 then
				local _ = nil
				local var1470, var1471 = protoModule.readBuffer(p51, var1458)
				var1458 = var1471
				var1457.title = buffer.tostring(var1470)
			elseif var1463 == 4 then
				local _ = nil
				local var1472, var1473 = protoModule.readBuffer(p51, var1458)
				var1458 = var1473
				var1457.user_id = buffer.tostring(var1472)
			elseif var1463 == 5 then
				local _ = nil
				local var1474, var1475 = protoModule.readBuffer(p51, var1458)
				var1458 = var1475
				var1457.description = buffer.tostring(var1474)
			elseif var1463 == 6 then
				local _ = nil
				local var1476, var1477 = protoModule.readBuffer(p51, var1458)
				var1458 = var1477
				var1457.cta_text = buffer.tostring(var1476)
			elseif var1463 == 7 then
				local _ = nil
				local var1478, var1479 = protoModule.readBuffer(p51, var1458)
				var1458 = var1479
				var1457.prompt_id = buffer.tostring(var1478)
			elseif var1463 == 8 then
				local _ = nil
				local var1480, var1481 = protoModule.readBuffer(p51, var1458)
				var1458 = var1481
				var1457.prompt_type = buffer.tostring(var1480)
			elseif var1463 == 9 then
				local _ = nil
				local var1482, var1483 = protoModule.readBuffer(p51, var1458)
				var1458 = var1483
				var1457.entity_id = buffer.tostring(var1482)
			else
				local _ = nil
				local var1484, var1485 = protoModule.readVarInt(p51, var1458)
				var1458 = var1485 + var1484
			end
		elseif var1459 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1486, var1487 = protoModule.readFixed32(p51, var1458)
			local _ = var1486
			var1458 = var1487
		elseif var1459 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1488, var1489 = protoModule.readFixed64(p51, var1458)
			local _ = var1488
			var1458 = var1489
		else
			error("Unsupported wire type: " .. var2237)
		end
	end
	return var1457
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
	local var1490 = t_51.new()
	
	if self.roblox_component ~= nil then
		var1490.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1490.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1490.identifier = self.identifier
	end
	if self.title ~= nil then
		var1490.title = self.title
	end
	if self.user_id ~= nil then
		var1490.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1490.user_id = self.userId
	end
	if self.description ~= nil then
		var1490.description = self.description
	end
	if self.cta_text ~= nil then
		var1490.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1490.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1490.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1490.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1490.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1490.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1490.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1490.entity_id = self.entityId
	end
	return var1490
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
	local var1490 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var1491, var1492 = protoModule.writeTag(buff, var1490, 1, protoModule.wireTypes.lengthDelimited)
		var1491, var2273 = protoModule.writeString(var1491, var1492, self.group_id)
		buff = var1491
		var1490 = var1492
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var1493, var1494 = protoModule.writeTag(buff, var1490, 2, protoModule.wireTypes.lengthDelimited)
		var1493, var2275 = protoModule.writeString(var1493, var1494, self.experience_id)
		buff = var1493
		var1490 = var1494
	end
	local buff_1 = buffer.create(var1490)
	buffer.copy(buff_1, 0, buff, 0, var1490)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref)
	local var1490 = t_52.new()
	local var1491 = 0
	while var1491 < buffer.len(p52) do
		local _ = nil
		local var1492 = nil
		local var1493, var1494, var1495 = protoModule.readTag(p52, var1491)
		local var1496 = var1493
		var1492 = var1494
		var1491 = var1495
		
		if var1492 == protoModule.wireTypes.varint then
			local _ = nil
			local var1497, var1498 = protoModule.readVarInt(p52, var1491)
			local _ = var1497
			var1491 = var1498
			continue
		end
		if var1492 == protoModule.wireTypes.lengthDelimited then
			if var1496 == 1 then
				local _ = nil
				local var1499, var1500 = protoModule.readBuffer(p52, var1491)
				var1491 = var1500
				var1490.group_id = buffer.tostring(var1499)
			elseif var1496 == 2 then
				local _ = nil
				local var1501, var1502 = protoModule.readBuffer(p52, var1491)
				var1491 = var1502
				var1490.experience_id = buffer.tostring(var1501)
			else
				local _ = nil
				local var1503, var1504 = protoModule.readVarInt(p52, var1491)
				var1491 = var1504 + var1503
			end
		elseif var1492 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1505, var1506 = protoModule.readFixed32(p52, var1491)
			local _ = var1505
			var1491 = var1506
		elseif var1492 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1507, var1508 = protoModule.readFixed64(p52, var1491)
			local _ = var1507
			var1491 = var1508
		else
			error("Unsupported wire type: " .. var2279)
		end
	end
	return var1490
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
	local var1509 = t_52.new()
	
	if self.group_id ~= nil then
		var1509.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1509.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1509.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1509.experience_id = self.experienceId
	end
	return var1509
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
	local var1509 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1510, var1511 = protoModule.writeTag(buff, var1509, 1, protoModule.wireTypes.lengthDelimited)
		var1510, var2301 = protoModule.writeString(var1510, var1511, self.title)
		buff = var1510
		var1509 = var1511
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var1512, var1513 = protoModule.writeTag(buff, var1509, 2, protoModule.wireTypes.lengthDelimited)
		var1512, var2303 = protoModule.writeString(var1512, var1513, self.dismiss_text)
		buff = var1512
		var1509 = var1513
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1514, var1515 = protoModule.writeTag(buff, var1509, 3, protoModule.wireTypes.lengthDelimited)
		var1514, var2305 = protoModule.writeString(var1514, var1515, self.user_id)
		buff = var1514
		var1509 = var1515
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var1516 = v:encode()
			local var1517, var1518 = protoModule.writeTag(buff, var1509, 4, protoModule.wireTypes.lengthDelimited)
			var1517, var2308 = protoModule.writeBuffer(var1517, var1518, var1516, buffer.len(var1516))
			buff = var1517
			var1509 = var1518
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1519, var1520 = protoModule.writeTag(buff, var1509, 5, protoModule.wireTypes.lengthDelimited)
		var1519, var2310 = protoModule.writeString(var1519, var1520, self.prompt_id)
		buff = var1519
		var1509 = var1520
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1521, var1522 = protoModule.writeTag(buff, var1509, 6, protoModule.wireTypes.lengthDelimited)
		var1521, var2312 = protoModule.writeString(var1521, var1522, self.prompt_type)
		buff = var1521
		var1509 = var1522
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1523, var1524 = protoModule.writeTag(buff, var1509, 7, protoModule.wireTypes.lengthDelimited)
		var1523, var2314 = protoModule.writeString(var1523, var1524, self.sort_id)
		buff = var1523
		var1509 = var1524
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var1525, var1526 = protoModule.writeTag(buff, var1509, 8, protoModule.wireTypes.lengthDelimited)
		var1525, var2316 = protoModule.writeString(var1525, var1526, self.feed_item_key)
		buff = var1525
		var1509 = var1526
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var1527 = self.client_attributes.value:encode()
		local var1528, var1529 = protoModule.writeTag(buff, var1509, 9, protoModule.wireTypes.lengthDelimited)
		var1528, var2319 = protoModule.writeBuffer(var1528, var1529, var1527, buffer.len(var1527))
		buff = var1528
		var1509 = var1529
	end
	local buff_1 = buffer.create(var1509)
	buffer.copy(buff_1, 0, buff, 0, var1509)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1530 = t_53.new()
	local var1531 = 0
	while var1531 < buffer.len(p53) do
		local _ = nil
		local var1532 = nil
		local var1533, var1534, var1535 = protoModule.readTag(p53, var1531)
		local var1536 = var1533
		var1532 = var1534
		var1531 = var1535
		
		if var1532 == protoModule.wireTypes.varint then
			local _ = nil
			local var1537, var1538 = protoModule.readVarInt(p53, var1531)
			local _ = var1537
			var1531 = var1538
			continue
		end
		if var1532 == protoModule.wireTypes.lengthDelimited then
			if var1536 == 1 then
				local _ = nil
				local var1539, var1540 = protoModule.readBuffer(p53, var1531)
				var1531 = var1540
				var1530.title = buffer.tostring(var1539)
			elseif var1536 == 2 then
				local _ = nil
				local var1541, var1542 = protoModule.readBuffer(p53, var1531)
				var1531 = var1542
				var1530.dismiss_text = buffer.tostring(var1541)
			elseif var1536 == 3 then
				local _ = nil
				local var1543, var1544 = protoModule.readBuffer(p53, var1531)
				var1531 = var1544
				var1530.user_id = buffer.tostring(var1543)
			elseif var1536 == 4 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p53, var1531)
				var1531 = var1546
				table.insert(var1530.cards, t.CardContainerCardInputData.decode(var1545))
			elseif var1536 == 5 then
				local _ = nil
				local var1547, var1548 = protoModule.readBuffer(p53, var1531)
				var1531 = var1548
				var1530.prompt_id = buffer.tostring(var1547)
			elseif var1536 == 6 then
				local _ = nil
				local var1549, var1550 = protoModule.readBuffer(p53, var1531)
				var1531 = var1550
				var1530.prompt_type = buffer.tostring(var1549)
			elseif var1536 == 7 then
				local _ = nil
				local var1551, var1552 = protoModule.readBuffer(p53, var1531)
				var1531 = var1552
				var1530.sort_id = buffer.tostring(var1551)
			elseif var1536 == 8 then
				local _ = nil
				local var1553, var1554 = protoModule.readBuffer(p53, var1531)
				var1531 = var1554
				var1530.feed_item_key = buffer.tostring(var1553)
			elseif var1536 == 9 then
				local _ = nil
				local var1555, var1556 = protoModule.readBuffer(p53, var1531)
				var1531 = var1556
				var1530.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var1555)
				}
			else
				local _ = nil
				local var1557, var1558 = protoModule.readVarInt(p53, var1531)
				var1531 = var1558 + var1557
			end
		elseif var1532 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1559, var1560 = protoModule.readFixed32(p53, var1531)
			local _ = var1559
			var1531 = var1560
		elseif var1532 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1561, var1562 = protoModule.readFixed64(p53, var1531)
			local _ = var1561
			var1531 = var1562
		else
			error("Unsupported wire type: " .. var2323)
		end
	end
	return var1530
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
	local var1563 = t_53.new()
	
	if self.title ~= nil then
		var1563.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1563.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1563.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1563.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1563.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1563.cards = t_1
	end
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
	if self.sort_id ~= nil then
		var1563.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1563.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1563.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1563.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1563.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1563.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1563
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
	local var1564 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1565, var1566 = protoModule.writeTag(buff, var1564, 1, protoModule.wireTypes.lengthDelimited)
		var1565, var2361 = protoModule.writeString(var1565, var1566, self.title)
		buff = var1565
		var1564 = var1566
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1567, var1568 = protoModule.writeTag(buff, var1564, 2, protoModule.wireTypes.lengthDelimited)
		var1567, var2363 = protoModule.writeString(var1567, var1568, self.user_id)
		buff = var1567
		var1564 = var1568
	end
	if self.description ~= nil and self.description ~= "" then
		local var1569, var1570 = protoModule.writeTag(buff, var1564, 3, protoModule.wireTypes.lengthDelimited)
		var1569, var2365 = protoModule.writeString(var1569, var1570, self.description)
		buff = var1569
		var1564 = var1570
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var1571, var1572 = protoModule.writeTag(buff, var1564, 4, protoModule.wireTypes.lengthDelimited)
		var1571, var2367 = protoModule.writeString(var1571, var1572, self.cta_text)
		buff = var1571
		var1564 = var1572
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1573, var1574 = protoModule.writeTag(buff, var1564, 5, protoModule.wireTypes.lengthDelimited)
		var1573, var2369 = protoModule.writeString(var1573, var1574, self.prompt_id)
		buff = var1573
		var1564 = var1574
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1575, var1576 = protoModule.writeTag(buff, var1564, 6, protoModule.wireTypes.lengthDelimited)
		var1575, var2371 = protoModule.writeString(var1575, var1576, self.prompt_type)
		buff = var1575
		var1564 = var1576
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var1577, var1578 = protoModule.writeTag(buff, var1564, 7, protoModule.wireTypes.lengthDelimited)
		var1577, var2373 = protoModule.writeString(var1577, var1578, self.entity_id)
		buff = var1577
		var1564 = var1578
	end
	local buff_1 = buffer.create(var1564)
	buffer.copy(buff_1, 0, buff, 0, var1564)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1564 = t_54.new()
	local var1565 = 0
	while var1565 < buffer.len(p54) do
		local _ = nil
		local var1566 = nil
		local var1567, var1568, var1569 = protoModule.readTag(p54, var1565)
		local var1570 = var1567
		var1566 = var1568
		var1565 = var1569
		
		if var1566 == protoModule.wireTypes.varint then
			local _ = nil
			local var1571, var1572 = protoModule.readVarInt(p54, var1565)
			local _ = var1571
			var1565 = var1572
			continue
		end
		if var1566 == protoModule.wireTypes.lengthDelimited then
			if var1570 == 1 then
				local _ = nil
				local var1573, var1574 = protoModule.readBuffer(p54, var1565)
				var1565 = var1574
				var1564.title = buffer.tostring(var1573)
			elseif var1570 == 2 then
				local _ = nil
				local var1575, var1576 = protoModule.readBuffer(p54, var1565)
				var1565 = var1576
				var1564.user_id = buffer.tostring(var1575)
			elseif var1570 == 3 then
				local _ = nil
				local var1577, var1578 = protoModule.readBuffer(p54, var1565)
				var1565 = var1578
				var1564.description = buffer.tostring(var1577)
			elseif var1570 == 4 then
				local _ = nil
				local var1579, var1580 = protoModule.readBuffer(p54, var1565)
				var1565 = var1580
				var1564.cta_text = buffer.tostring(var1579)
			elseif var1570 == 5 then
				local _ = nil
				local var1581, var1582 = protoModule.readBuffer(p54, var1565)
				var1565 = var1582
				var1564.prompt_id = buffer.tostring(var1581)
			elseif var1570 == 6 then
				local _ = nil
				local var1583, var1584 = protoModule.readBuffer(p54, var1565)
				var1565 = var1584
				var1564.prompt_type = buffer.tostring(var1583)
			elseif var1570 == 7 then
				local _ = nil
				local var1585, var1586 = protoModule.readBuffer(p54, var1565)
				var1565 = var1586
				var1564.entity_id = buffer.tostring(var1585)
			else
				local _ = nil
				local var1587, var1588 = protoModule.readVarInt(p54, var1565)
				var1565 = var1588 + var1587
			end
		elseif var1566 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1589, var1590 = protoModule.readFixed32(p54, var1565)
			local _ = var1589
			var1565 = var1590
		elseif var1566 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1591, var1592 = protoModule.readFixed64(p54, var1565)
			local _ = var1591
			var1565 = var1592
		else
			error("Unsupported wire type: " .. var2377)
		end
	end
	return var1564
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
	local var1593 = t_54.new()
	
	if self.title ~= nil then
		var1593.title = self.title
	end
	if self.user_id ~= nil then
		var1593.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1593.user_id = self.userId
	end
	if self.description ~= nil then
		var1593.description = self.description
	end
	if self.cta_text ~= nil then
		var1593.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1593.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1593.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1593.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1593.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1593.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1593.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1593.entity_id = self.entityId
	end
	return var1593
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
	local var1593 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1594, var1595 = protoModule.writeTag(buff, var1593, 1, protoModule.wireTypes.lengthDelimited)
		var1594, var2409 = protoModule.writeString(var1594, var1595, self.prompt_id)
		buff = var1594
		var1593 = var1595
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1596, var1597 = protoModule.writeTag(buff, var1593, 2, protoModule.wireTypes.lengthDelimited)
		var1596, var2411 = protoModule.writeString(var1596, var1597, self.prompt_type)
		buff = var1596
		var1593 = var1597
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1598, var1599 = protoModule.writeTag(buff, var1593, 3, protoModule.wireTypes.lengthDelimited)
		var1598, var2413 = protoModule.writeString(var1598, var1599, self.user_id)
		buff = var1598
		var1593 = var1599
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var1600, var1601 = protoModule.writeTag(buff, var1593, 4, protoModule.wireTypes.lengthDelimited)
		var1600, var2415 = protoModule.writeString(var1600, var1601, self.audit_data)
		buff = var1600
		var1593 = var1601
	end
	local buff_1 = buffer.create(var1593)
	buffer.copy(buff_1, 0, buff, 0, var1593)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1593 = t_55.new()
	local var1594 = 0
	while var1594 < buffer.len(p55) do
		local _ = nil
		local var1595 = nil
		local var1596, var1597, var1598 = protoModule.readTag(p55, var1594)
		local var1599 = var1596
		var1595 = var1597
		var1594 = var1598
		
		if var1595 == protoModule.wireTypes.varint then
			local _ = nil
			local var1600, var1601 = protoModule.readVarInt(p55, var1594)
			local _ = var1600
			var1594 = var1601
			continue
		end
		if var1595 == protoModule.wireTypes.lengthDelimited then
			if var1599 == 1 then
				local _ = nil
				local var1602, var1603 = protoModule.readBuffer(p55, var1594)
				var1594 = var1603
				var1593.prompt_id = buffer.tostring(var1602)
			elseif var1599 == 2 then
				local _ = nil
				local var1604, var1605 = protoModule.readBuffer(p55, var1594)
				var1594 = var1605
				var1593.prompt_type = buffer.tostring(var1604)
			elseif var1599 == 3 then
				local _ = nil
				local var1606, var1607 = protoModule.readBuffer(p55, var1594)
				var1594 = var1607
				var1593.user_id = buffer.tostring(var1606)
			elseif var1599 == 4 then
				local _ = nil
				local var1608, var1609 = protoModule.readBuffer(p55, var1594)
				var1594 = var1609
				var1593.audit_data = buffer.tostring(var1608)
			else
				local _ = nil
				local var1610, var1611 = protoModule.readVarInt(p55, var1594)
				var1594 = var1611 + var1610
			end
		elseif var1595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1612, var1613 = protoModule.readFixed32(p55, var1594)
			local _ = var1612
			var1594 = var1613
		elseif var1595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1614, var1615 = protoModule.readFixed64(p55, var1594)
			local _ = var1614
			var1594 = var1615
		else
			error("Unsupported wire type: " .. var2419)
		end
	end
	return var1593
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
	local var1616 = t_55.new()
	
	if self.prompt_id ~= nil then
		var1616.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1616.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1616.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1616.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1616.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1616.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1616.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1616.audit_data = self.auditData
	end
	return var1616
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
	local var1616 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var1617, var1618 = protoModule.writeTag(buff, var1616, 1, protoModule.wireTypes.varint)
		var1617, var2445 = protoModule.writeVarInt(var1617, var1618, self.sender_count)
		buff = var1617
		var1616 = var1618
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var1619, var1620 = protoModule.writeTag(buff, var1616, 2, protoModule.wireTypes.varint)
		var1619, var2447 = protoModule.writeVarInt(var1619, var1620, self.total_robux_amount)
		buff = var1619
		var1616 = var1620
	end
	local buff_1 = buffer.create(var1616)
	buffer.copy(buff_1, 0, buff, 0, var1616)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1616 = t_56.new()
	local var1617 = 0
	while var1617 < buffer.len(p56) do
		local _ = nil
		local _ = nil
		local var1618, var1619, var1620 = protoModule.readTag(p56, var1617)
		local var1621 = var1618
		local var1622 = var1619
		var1617 = var1620
		
		if var1622 == protoModule.wireTypes.varint then
			if var1621 == 1 then
				local _ = nil
				local var1623, var1624 = protoModule.readVarIntI32(p56, var1617)
				var1617 = var1624
				var1616.sender_count = var1623
			elseif var1621 == 2 then
				local _ = nil
				local var1625, var1626 = protoModule.readVarIntI64(p56, var1617)
				var1617 = var1626
				var1616.total_robux_amount = var1625
			else
				local _ = nil
				local var1627, var1628 = protoModule.readVarInt(p56, var1617)
				local _ = var1627
				var1617 = var1628
			end
		elseif var1622 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1629, var1630 = protoModule.readVarInt(p56, var1617)
			var1617 = var1630 + var1629
		elseif var1622 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1631, var1632 = protoModule.readFixed32(p56, var1617)
			local _ = var1631
			var1617 = var1632
		elseif var1622 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1633, var1634 = protoModule.readFixed64(p56, var1617)
			local _ = var1633
			var1617 = var1634
		else
			error("Unsupported wire type: " .. var2455)
		end
	end
	return var1616
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
	local var1635 = t_56.new()
	
	if self.sender_count ~= nil then
		var1635.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1635.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1635.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1635.total_robux_amount = self.totalRobuxAmount
	end
	return var1635
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
	local var1635 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1636, var1637 = protoModule.writeTag(buff, var1635, 1, protoModule.wireTypes.lengthDelimited)
		var1636, var2473 = protoModule.writeString(var1636, var1637, self.title)
		buff = var1636
		var1635 = var1637
	end
	if self.description ~= nil and self.description ~= "" then
		local var1638, var1639 = protoModule.writeTag(buff, var1635, 2, protoModule.wireTypes.lengthDelimited)
		var1638, var2475 = protoModule.writeString(var1638, var1639, self.description)
		buff = var1638
		var1635 = var1639
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var1640, var1641 = protoModule.writeTag(buff, var1635, 3, protoModule.wireTypes.lengthDelimited)
		var1640, var2477 = protoModule.writeString(var1640, var1641, self.primary_text)
		buff = var1640
		var1635 = var1641
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var1642, var1643 = protoModule.writeTag(buff, var1635, 4, protoModule.wireTypes.lengthDelimited)
		var1642, var2479 = protoModule.writeString(var1642, var1643, self.secondary_text)
		buff = var1642
		var1635 = var1643
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1644, var1645 = protoModule.writeTag(buff, var1635, 5, protoModule.wireTypes.lengthDelimited)
		var1644, var2481 = protoModule.writeString(var1644, var1645, self.prompt_id)
		buff = var1644
		var1635 = var1645
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1646, var1647 = protoModule.writeTag(buff, var1635, 6, protoModule.wireTypes.lengthDelimited)
		var1646, var2483 = protoModule.writeString(var1646, var1647, self.prompt_type)
		buff = var1646
		var1635 = var1647
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var1648, var1649 = protoModule.writeTag(buff, var1635, 7, protoModule.wireTypes.varint)
		var1648, var2485 = protoModule.writeVarInt(var1648, var1649, self.times_seen)
		buff = var1648
		var1635 = var1649
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var1650 = self.content.value:encode()
		local var1651, var1652 = protoModule.writeTag(buff, var1635, 8, protoModule.wireTypes.lengthDelimited)
		var1651, var2488 = protoModule.writeBuffer(var1651, var1652, var1650, buffer.len(var1650))
		buff = var1651
		var1635 = var1652
	end
	local buff_1 = buffer.create(var1635)
	buffer.copy(buff_1, 0, buff, 0, var1635)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1635 = t_57.new()
	local var1636 = 0
	while var1636 < buffer.len(p57) do
		local _ = nil
		local var1637 = nil
		local var1638, var1639, var1640 = protoModule.readTag(p57, var1636)
		local var1641 = var1638
		var1637 = var1639
		var1636 = var1640
		
		if var1637 == protoModule.wireTypes.varint then
			if var1641 == 7 then
				local _ = nil
				local var1642, var1643 = protoModule.readVarIntI32(p57, var1636)
				var1636 = var1643
				var1635.times_seen = var1642
			else
				local _ = nil
				local var1644, var1645 = protoModule.readVarInt(p57, var1636)
				local _ = var1644
				var1636 = var1645
			end
		end
		if var1637 == protoModule.wireTypes.lengthDelimited then
			if var1641 == 1 then
				local _ = nil
				local var1646, var1647 = protoModule.readBuffer(p57, var1636)
				var1636 = var1647
				var1635.title = buffer.tostring(var1646)
			elseif var1641 == 2 then
				local _ = nil
				local var1648, var1649 = protoModule.readBuffer(p57, var1636)
				var1636 = var1649
				var1635.description = buffer.tostring(var1648)
			elseif var1641 == 3 then
				local _ = nil
				local var1650, var1651 = protoModule.readBuffer(p57, var1636)
				var1636 = var1651
				var1635.primary_text = buffer.tostring(var1650)
			elseif var1641 == 4 then
				local _ = nil
				local var1652, var1653 = protoModule.readBuffer(p57, var1636)
				var1636 = var1653
				var1635.secondary_text = buffer.tostring(var1652)
			elseif var1641 == 5 then
				local _ = nil
				local var1654, var1655 = protoModule.readBuffer(p57, var1636)
				var1636 = var1655
				var1635.prompt_id = buffer.tostring(var1654)
			elseif var1641 == 6 then
				local _ = nil
				local var1656, var1657 = protoModule.readBuffer(p57, var1636)
				var1636 = var1657
				var1635.prompt_type = buffer.tostring(var1656)
			elseif var1641 == 8 then
				local _ = nil
				local var1658, var1659 = protoModule.readBuffer(p57, var1636)
				var1636 = var1659
				var1635.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var1658)
				}
			else
				local _ = nil
				local var1660, var1661 = protoModule.readVarInt(p57, var1636)
				var1636 = var1661 + var1660
			end
		elseif var1637 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1662, var1663 = protoModule.readFixed32(p57, var1636)
			local _ = var1662
			var1636 = var1663
		elseif var1637 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1664, var1665 = protoModule.readFixed64(p57, var1636)
			local _ = var1664
			var1636 = var1665
		else
			error("Unsupported wire type: " .. var2492)
		end
	end
	return var1635
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
	local var1666 = t_57.new()
	
	if self.title ~= nil then
		var1666.title = self.title
	end
	if self.description ~= nil then
		var1666.description = self.description
	end
	if self.primary_text ~= nil then
		var1666.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1666.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1666.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1666.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1666.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1666.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1666.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1666.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1666.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1666.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1666.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1666.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var1666
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
	local var1666 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var1667, var1668 = protoModule.writeTag(buff, var1666, 1, protoModule.wireTypes.lengthDelimited)
		var1667, var2526 = protoModule.writeString(var1667, var1668, self.tooltip_text)
		buff = var1667
		var1666 = var1668
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1669, var1670 = protoModule.writeTag(buff, var1666, 2, protoModule.wireTypes.lengthDelimited)
		var1669, var2528 = protoModule.writeString(var1669, var1670, self.prompt_id)
		buff = var1669
		var1666 = var1670
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1671, var1672 = protoModule.writeTag(buff, var1666, 3, protoModule.wireTypes.lengthDelimited)
		var1671, var2530 = protoModule.writeString(var1671, var1672, self.prompt_type)
		buff = var1671
		var1666 = var1672
	end
	local buff_1 = buffer.create(var1666)
	buffer.copy(buff_1, 0, buff, 0, var1666)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1666 = t_58.new()
	local var1667 = 0
	while var1667 < buffer.len(p58) do
		local _ = nil
		local var1668 = nil
		local var1669, var1670, var1671 = protoModule.readTag(p58, var1667)
		local var1672 = var1669
		var1668 = var1670
		var1667 = var1671
		
		if var1668 == protoModule.wireTypes.varint then
			local _ = nil
			local var1673, var1674 = protoModule.readVarInt(p58, var1667)
			local _ = var1673
			var1667 = var1674
			continue
		end
		if var1668 == protoModule.wireTypes.lengthDelimited then
			if var1672 == 1 then
				local _ = nil
				local var1675, var1676 = protoModule.readBuffer(p58, var1667)
				var1667 = var1676
				var1666.tooltip_text = buffer.tostring(var1675)
			elseif var1672 == 2 then
				local _ = nil
				local var1677, var1678 = protoModule.readBuffer(p58, var1667)
				var1667 = var1678
				var1666.prompt_id = buffer.tostring(var1677)
			elseif var1672 == 3 then
				local _ = nil
				local var1679, var1680 = protoModule.readBuffer(p58, var1667)
				var1667 = var1680
				var1666.prompt_type = buffer.tostring(var1679)
			else
				local _ = nil
				local var1681, var1682 = protoModule.readVarInt(p58, var1667)
				var1667 = var1682 + var1681
			end
		elseif var1668 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1683, var1684 = protoModule.readFixed32(p58, var1667)
			local _ = var1683
			var1667 = var1684
		elseif var1668 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1685, var1686 = protoModule.readFixed64(p58, var1667)
			local _ = var1685
			var1667 = var1686
		else
			error("Unsupported wire type: " .. var2534)
		end
	end
	return var1666
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
	local var1687 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var1687.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1687.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1687.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1687.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1687.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1687.prompt_type = self.promptType
	end
	return var1687
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
	local var1687 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var1688, var1689 = protoModule.writeTag(buff, var1687, 1, protoModule.wireTypes.lengthDelimited)
		var1688, var2558 = protoModule.writeString(var1688, var1689, self.media_id)
		buff = var1688
		var1687 = var1689
	end
	if self.title ~= nil and self.title ~= "" then
		local var1690, var1691 = protoModule.writeTag(buff, var1687, 2, protoModule.wireTypes.lengthDelimited)
		var1690, var2560 = protoModule.writeString(var1690, var1691, self.title)
		buff = var1690
		var1687 = var1691
	end
	if self.description ~= nil and self.description ~= "" then
		local var1692, var1693 = protoModule.writeTag(buff, var1687, 3, protoModule.wireTypes.lengthDelimited)
		var1692, var2562 = protoModule.writeString(var1692, var1693, self.description)
		buff = var1692
		var1687 = var1693
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1694, var1695 = protoModule.writeTag(buff, var1687, 4, protoModule.wireTypes.lengthDelimited)
		var1694, var2564 = protoModule.writeString(var1694, var1695, self.prompt_id)
		buff = var1694
		var1687 = var1695
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1696, var1697 = protoModule.writeTag(buff, var1687, 5, protoModule.wireTypes.lengthDelimited)
		var1696, var2566 = protoModule.writeString(var1696, var1697, self.prompt_type)
		buff = var1696
		var1687 = var1697
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var1698, var1699 = protoModule.writeTag(buff, var1687, 6, protoModule.wireTypes.lengthDelimited)
		var1698, var2568 = protoModule.writeString(var1698, var1699, self.anchor_tag)
		buff = var1698
		var1687 = var1699
	end
	local buff_1 = buffer.create(var1687)
	buffer.copy(buff_1, 0, buff, 0, var1687)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1687 = t_59.new()
	local var1688 = 0
	while var1688 < buffer.len(p59) do
		local _ = nil
		local var1689 = nil
		local var1690, var1691, var1692 = protoModule.readTag(p59, var1688)
		local var1693 = var1690
		var1689 = var1691
		var1688 = var1692
		
		if var1689 == protoModule.wireTypes.varint then
			local _ = nil
			local var1694, var1695 = protoModule.readVarInt(p59, var1688)
			local _ = var1694
			var1688 = var1695
			continue
		end
		if var1689 == protoModule.wireTypes.lengthDelimited then
			if var1693 == 1 then
				local _ = nil
				local var1696, var1697 = protoModule.readBuffer(p59, var1688)
				var1688 = var1697
				var1687.media_id = buffer.tostring(var1696)
			elseif var1693 == 2 then
				local _ = nil
				local var1698, var1699 = protoModule.readBuffer(p59, var1688)
				var1688 = var1699
				var1687.title = buffer.tostring(var1698)
			elseif var1693 == 3 then
				local _ = nil
				local var1700, var1701 = protoModule.readBuffer(p59, var1688)
				var1688 = var1701
				var1687.description = buffer.tostring(var1700)
			elseif var1693 == 4 then
				local _ = nil
				local var1702, var1703 = protoModule.readBuffer(p59, var1688)
				var1688 = var1703
				var1687.prompt_id = buffer.tostring(var1702)
			elseif var1693 == 5 then
				local _ = nil
				local var1704, var1705 = protoModule.readBuffer(p59, var1688)
				var1688 = var1705
				var1687.prompt_type = buffer.tostring(var1704)
			elseif var1693 == 6 then
				local _ = nil
				local var1706, var1707 = protoModule.readBuffer(p59, var1688)
				var1688 = var1707
				var1687.anchor_tag = buffer.tostring(var1706)
			else
				local _ = nil
				local var1708, var1709 = protoModule.readVarInt(p59, var1688)
				var1688 = var1709 + var1708
			end
		elseif var1689 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1710, var1711 = protoModule.readFixed32(p59, var1688)
			local _ = var1710
			var1688 = var1711
		elseif var1689 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1712, var1713 = protoModule.readFixed64(p59, var1688)
			local _ = var1712
			var1688 = var1713
		else
			error("Unsupported wire type: " .. var2572)
		end
	end
	return var1687
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
	local var1714 = t_59.new()
	
	if self.media_id ~= nil then
		var1714.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1714.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1714.title = self.title
	end
	if self.description ~= nil then
		var1714.description = self.description
	end
	if self.prompt_id ~= nil then
		var1714.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1714.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1714.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1714.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1714.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1714.anchor_tag = self.anchorTag
	end
	return var1714
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
	local var1714 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var1715, var1716 = protoModule.writeTag(buff, var1714, 1, protoModule.wireTypes.lengthDelimited)
		var1715, var2602 = protoModule.writeString(var1715, var1716, self.prompt_id)
		buff = var1715
		var1714 = var1716
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var1717, var1718 = protoModule.writeTag(buff, var1714, 2, protoModule.wireTypes.lengthDelimited)
		var1717, var2604 = protoModule.writeString(var1717, var1718, self.prompt_type)
		buff = var1717
		var1714 = var1718
	end
	local buff_1 = buffer.create(var1714)
	buffer.copy(buff_1, 0, buff, 0, var1714)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1714 = t_60.new()
	local var1715 = 0
	while var1715 < buffer.len(p60) do
		local _ = nil
		local var1716 = nil
		local var1717, var1718, var1719 = protoModule.readTag(p60, var1715)
		local var1720 = var1717
		var1716 = var1718
		var1715 = var1719
		
		if var1716 == protoModule.wireTypes.varint then
			local _ = nil
			local var1721, var1722 = protoModule.readVarInt(p60, var1715)
			local _ = var1721
			var1715 = var1722
			continue
		end
		if var1716 == protoModule.wireTypes.lengthDelimited then
			if var1720 == 1 then
				local _ = nil
				local var1723, var1724 = protoModule.readBuffer(p60, var1715)
				var1715 = var1724
				var1714.prompt_id = buffer.tostring(var1723)
			elseif var1720 == 2 then
				local _ = nil
				local var1725, var1726 = protoModule.readBuffer(p60, var1715)
				var1715 = var1726
				var1714.prompt_type = buffer.tostring(var1725)
			else
				local _ = nil
				local var1727, var1728 = protoModule.readVarInt(p60, var1715)
				var1715 = var1728 + var1727
			end
		elseif var1716 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1729, var1730 = protoModule.readFixed32(p60, var1715)
			local _ = var1729
			var1715 = var1730
		elseif var1716 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1731, var1732 = protoModule.readFixed64(p60, var1715)
			local _ = var1731
			var1715 = var1732
		else
			error("Unsupported wire type: " .. var2608)
		end
	end
	return var1714
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
	local var1733 = t_60.new()
	
	if self.prompt_id ~= nil then
		var1733.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1733.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1733.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1733.prompt_type = self.promptType
	end
	return var1733
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
	local var1733 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1734, var1735 = protoModule.writeTag(buff, var1733, 1, protoModule.wireTypes.lengthDelimited)
		var1734, var2630 = protoModule.writeString(var1734, var1735, self.upsell_prompt)
		buff = var1734
		var1733 = var1735
	end
	local buff_1 = buffer.create(var1733)
	buffer.copy(buff_1, 0, buff, 0, var1733)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1733 = t_61.new()
	local var1734 = 0
	while var1734 < buffer.len(p61) do
		local _ = nil
		local var1735 = nil
		local var1736, var1737, var1738 = protoModule.readTag(p61, var1734)
		local var1739 = var1736
		var1735 = var1737
		var1734 = var1738
		
		if var1735 == protoModule.wireTypes.varint then
			local _ = nil
			local var1740, var1741 = protoModule.readVarInt(p61, var1734)
			local _ = var1740
			var1734 = var1741
			continue
		end
		if var1735 == protoModule.wireTypes.lengthDelimited then
			if var1739 == 1 then
				local _ = nil
				local var1742, var1743 = protoModule.readBuffer(p61, var1734)
				var1734 = var1743
				var1733.upsell_prompt = buffer.tostring(var1742)
			else
				local _ = nil
				local var1744, var1745 = protoModule.readVarInt(p61, var1734)
				var1734 = var1745 + var1744
			end
		elseif var1735 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1746, var1747 = protoModule.readFixed32(p61, var1734)
			local _ = var1746
			var1734 = var1747
		elseif var1735 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1748, var1749 = protoModule.readFixed64(p61, var1734)
			local _ = var1748
			var1734 = var1749
		else
			error("Unsupported wire type: " .. var2634)
		end
	end
	return var1733
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
	local var1750 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var1750.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1750.upsell_prompt = self.upsellPrompt
	end
	return var1750
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
	local var1750 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var1751, var1752 = protoModule.writeTag(buff, var1750, 1, protoModule.wireTypes.lengthDelimited)
		var1751, var2654 = protoModule.writeString(var1751, var1752, self.modal_variant)
		buff = var1751
		var1750 = var1752
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var1753, var1754 = protoModule.writeTag(buff, var1750, 2, protoModule.wireTypes.lengthDelimited)
		var1753, var2656 = protoModule.writeString(var1753, var1754, self.modal_sequence)
		buff = var1753
		var1750 = var1754
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var1755, var1756 = protoModule.writeTag(buff, var1750, 3, protoModule.wireTypes.lengthDelimited)
		var1755, var2658 = protoModule.writeString(var1755, var1756, self.conversation_id)
		buff = var1755
		var1750 = var1756
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var1757, var1758 = protoModule.writeTag(buff, var1750, 4, protoModule.wireTypes.lengthDelimited)
		var1757, var2660 = protoModule.writeString(var1757, var1758, self.friend_id)
		buff = var1757
		var1750 = var1758
	end
	local buff_1 = buffer.create(var1750)
	buffer.copy(buff_1, 0, buff, 0, var1750)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1750 = t_62.new()
	local var1751 = 0
	while var1751 < buffer.len(p62) do
		local _ = nil
		local var1752 = nil
		local var1753, var1754, var1755 = protoModule.readTag(p62, var1751)
		local var1756 = var1753
		var1752 = var1754
		var1751 = var1755
		
		if var1752 == protoModule.wireTypes.varint then
			local _ = nil
			local var1757, var1758 = protoModule.readVarInt(p62, var1751)
			local _ = var1757
			var1751 = var1758
			continue
		end
		if var1752 == protoModule.wireTypes.lengthDelimited then
			if var1756 == 1 then
				local _ = nil
				local var1759, var1760 = protoModule.readBuffer(p62, var1751)
				var1751 = var1760
				var1750.modal_variant = buffer.tostring(var1759)
			elseif var1756 == 2 then
				local _ = nil
				local var1761, var1762 = protoModule.readBuffer(p62, var1751)
				var1751 = var1762
				var1750.modal_sequence = buffer.tostring(var1761)
			elseif var1756 == 3 then
				local _ = nil
				local var1763, var1764 = protoModule.readBuffer(p62, var1751)
				var1751 = var1764
				var1750.conversation_id = buffer.tostring(var1763)
			elseif var1756 == 4 then
				local _ = nil
				local var1765, var1766 = protoModule.readBuffer(p62, var1751)
				var1751 = var1766
				var1750.friend_id = buffer.tostring(var1765)
			else
				local _ = nil
				local var1767, var1768 = protoModule.readVarInt(p62, var1751)
				var1751 = var1768 + var1767
			end
		elseif var1752 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1769, var1770 = protoModule.readFixed32(p62, var1751)
			local _ = var1769
			var1751 = var1770
		elseif var1752 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1771, var1772 = protoModule.readFixed64(p62, var1751)
			local _ = var1771
			var1751 = var1772
		else
			error("Unsupported wire type: " .. var2664)
		end
	end
	return var1750
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
	local var1773 = t_62.new()
	
	if self.modal_variant ~= nil then
		var1773.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1773.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1773.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1773.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1773.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1773.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1773.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1773.friend_id = self.friendId
	end
	return var1773
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
	local var1773 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1774, var1775 = protoModule.writeTag(buff, var1773, 1, protoModule.wireTypes.lengthDelimited)
		var1774, var2690 = protoModule.writeString(var1774, var1775, self.event_id)
		buff = var1774
		var1773 = var1775
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1776, var1777 = protoModule.writeTag(buff, var1773, 2, protoModule.wireTypes.lengthDelimited)
		var1776, var2692 = protoModule.writeString(var1776, var1777, self.universe_id)
		buff = var1776
		var1773 = var1777
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1778, var1779 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1778, var2694 = protoModule.writeString(var1778, var1779, i)
			local var1780 = v:encode()
			var1779, var2696 = protoModule.writeTag(var1778, var1779, 2, protoModule.wireTypes.lengthDelimited)
			var1779, var2696 = protoModule.writeBuffer(var1779, var2696, var1780, buffer.len(var1780))
			local var1781 = var1779
			local var1782 = var2696
			local var1783, var1784 = protoModule.writeTag(buff, var1773, 3, protoModule.wireTypes.lengthDelimited)
			var1783, var2700 = protoModule.writeBuffer(var1783, var1784, var1781, var1782)
			buff = var1783
			var1773 = var1784
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1785, var1786 = protoModule.writeTag(buff, var1773, 4, protoModule.wireTypes.lengthDelimited)
			var1785, var2702 = protoModule.writeString(var1785, var1786, v)
			buff = var1785
			var1773 = var1786
		end
	end
	local buff_1 = buffer.create(var1773)
	buffer.copy(buff_1, 0, buff, 0, var1773)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var1787 = t_63.new()
	local var1788 = 0
	while var1788 < buffer.len(p63) do
		local _ = nil
		local var1789 = nil
		local var1790, var1791, var1792 = protoModule.readTag(p63, var1788)
		local var1793 = var1790
		var1789 = var1791
		var1788 = var1792
		
		if var1789 == protoModule.wireTypes.varint then
			local _ = nil
			local var1794, var1795 = protoModule.readVarInt(p63, var1788)
			local _ = var1794
			var1788 = var1795
			continue
		end
		if var1789 == protoModule.wireTypes.lengthDelimited then
			if var1793 == 1 then
				local _ = nil
				local var1796, var1797 = protoModule.readBuffer(p63, var1788)
				var1788 = var1797
				var1787.event_id = buffer.tostring(var1796)
			elseif var1793 == 2 then
				local _ = nil
				local var1798, var1799 = protoModule.readBuffer(p63, var1788)
				var1788 = var1799
				var1787.universe_id = buffer.tostring(var1798)
			elseif var1793 == 3 then
				local _ = nil
				local var1800, var1801 = protoModule.readBuffer(p63, var1788)
				var1788 = var1801
				var1800 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var1800)
				var1787.entry_map[var1800.key or ""] = var1800.value or t.FeedEntry.new()
			elseif var1793 == 4 then
				local _ = nil
				local var1802, var1803 = protoModule.readBuffer(p63, var1788)
				var1788 = var1803
				table.insert(var1787.entry_order, buffer.tostring(var1802))
			else
				local _ = nil
				local var1804, var1805 = protoModule.readVarInt(p63, var1788)
				var1788 = var1805 + var1804
			end
		elseif var1789 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1806, var1807 = protoModule.readFixed32(p63, var1788)
			local _ = var1806
			var1788 = var1807
		elseif var1789 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1808, var1809 = protoModule.readFixed64(p63, var1788)
			local _ = var1808
			var1788 = var1809
		else
			error("Unsupported wire type: " .. var2706)
		end
	end
	return var1787
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
	local var1810 = t_63.new()
	
	if self.event_id ~= nil then
		var1810.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1810.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1810.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1810.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1810.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1810.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1810.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1810.entry_order = t_1
	end
	return var1810
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
	local var1811 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1812, var1813 = protoModule.writeTag(buff, var1811, 1, protoModule.wireTypes.lengthDelimited)
		var1812, var2738 = protoModule.writeString(var1812, var1813, self.key)
		buff = var1812
		var1811 = var1813
	end
	if self.value ~= nil then
		local var1814 = self.value:encode()
		local var1815, var1816 = protoModule.writeTag(buff, var1811, 2, protoModule.wireTypes.lengthDelimited)
		var1815, var2741 = protoModule.writeBuffer(var1815, var1816, var1814, buffer.len(var1814))
		buff = var1815
		var1811 = var1816
	end
	local buff_1 = buffer.create(var1811)
	buffer.copy(buff_1, 0, buff, 0, var1811)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1811 = t_64.new()
	local var1812 = 0
	while var1812 < buffer.len(p64) do
		local _ = nil
		local var1813 = nil
		local var1814, var1815, var1816 = protoModule.readTag(p64, var1812)
		local var1817 = var1814
		var1813 = var1815
		var1812 = var1816
		
		if var1813 == protoModule.wireTypes.varint then
			local _ = nil
			local var1818, var1819 = protoModule.readVarInt(p64, var1812)
			local _ = var1818
			var1812 = var1819
			continue
		end
		if var1813 == protoModule.wireTypes.lengthDelimited then
			if var1817 == 1 then
				local _ = nil
				local var1820, var1821 = protoModule.readBuffer(p64, var1812)
				var1812 = var1821
				var1811.key = buffer.tostring(var1820)
			elseif var1817 == 2 then
				local _ = nil
				local var1822, var1823 = protoModule.readBuffer(p64, var1812)
				var1812 = var1823
				var1811.value = t.FeedEntry.decode(var1822)
			else
				local _ = nil
				local var1824, var1825 = protoModule.readVarInt(p64, var1812)
				var1812 = var1825 + var1824
			end
		elseif var1813 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1826, var1827 = protoModule.readFixed32(p64, var1812)
			local _ = var1826
			var1812 = var1827
		elseif var1813 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1828, var1829 = protoModule.readFixed64(p64, var1812)
			local _ = var1828
			var1812 = var1829
		else
			error("Unsupported wire type: " .. var2745)
		end
	end
	return var1811
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
	local var1830 = t_64.new()
	
	if self.key ~= nil then
		var1830.key = self.key
	end
	if self.value ~= nil then
		var1830.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1830
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
	local var1830 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1831, var1832 = protoModule.writeTag(buff, var1830, 1, protoModule.wireTypes.lengthDelimited)
		var1831, var2767 = protoModule.writeString(var1831, var1832, self.event_id)
		buff = var1831
		var1830 = var1832
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1833, var1834 = protoModule.writeTag(buff, var1830, 2, protoModule.wireTypes.lengthDelimited)
		var1833, var2769 = protoModule.writeString(var1833, var1834, self.universe_id)
		buff = var1833
		var1830 = var1834
	end
	local buff_1 = buffer.create(var1830)
	buffer.copy(buff_1, 0, buff, 0, var1830)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1830 = t_65.new()
	local var1831 = 0
	while var1831 < buffer.len(p65) do
		local _ = nil
		local var1832 = nil
		local var1833, var1834, var1835 = protoModule.readTag(p65, var1831)
		local var1836 = var1833
		var1832 = var1834
		var1831 = var1835
		
		if var1832 == protoModule.wireTypes.varint then
			local _ = nil
			local var1837, var1838 = protoModule.readVarInt(p65, var1831)
			local _ = var1837
			var1831 = var1838
			continue
		end
		if var1832 == protoModule.wireTypes.lengthDelimited then
			if var1836 == 1 then
				local _ = nil
				local var1839, var1840 = protoModule.readBuffer(p65, var1831)
				var1831 = var1840
				var1830.event_id = buffer.tostring(var1839)
			elseif var1836 == 2 then
				local _ = nil
				local var1841, var1842 = protoModule.readBuffer(p65, var1831)
				var1831 = var1842
				var1830.universe_id = buffer.tostring(var1841)
			else
				local _ = nil
				local var1843, var1844 = protoModule.readVarInt(p65, var1831)
				var1831 = var1844 + var1843
			end
		elseif var1832 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1845, var1846 = protoModule.readFixed32(p65, var1831)
			local _ = var1845
			var1831 = var1846
		elseif var1832 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1847, var1848 = protoModule.readFixed64(p65, var1831)
			local _ = var1847
			var1831 = var1848
		else
			error("Unsupported wire type: " .. var2773)
		end
	end
	return var1830
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
	local var1849 = t_65.new()
	
	if self.event_id ~= nil then
		var1849.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1849.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1849.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1849.universe_id = self.universeId
	end
	return var1849
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
	local var1849 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1850, var1851 = protoModule.writeTag(buff, var1849, 1, protoModule.wireTypes.lengthDelimited)
		var1850, var2795 = protoModule.writeString(var1850, var1851, self.event_id)
		buff = var1850
		var1849 = var1851
	end
	local buff_1 = buffer.create(var1849)
	buffer.copy(buff_1, 0, buff, 0, var1849)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref)
	local var1849 = t_66.new()
	local var1850 = 0
	while var1850 < buffer.len(p66) do
		local _ = nil
		local var1851 = nil
		local var1852, var1853, var1854 = protoModule.readTag(p66, var1850)
		local var1855 = var1852
		var1851 = var1853
		var1850 = var1854
		
		if var1851 == protoModule.wireTypes.varint then
			local _ = nil
			local var1856, var1857 = protoModule.readVarInt(p66, var1850)
			local _ = var1856
			var1850 = var1857
			continue
		end
		if var1851 == protoModule.wireTypes.lengthDelimited then
			if var1855 == 1 then
				local _ = nil
				local var1858, var1859 = protoModule.readBuffer(p66, var1850)
				var1850 = var1859
				var1849.event_id = buffer.tostring(var1858)
			else
				local _ = nil
				local var1860, var1861 = protoModule.readVarInt(p66, var1850)
				var1850 = var1861 + var1860
			end
		elseif var1851 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1862, var1863 = protoModule.readFixed32(p66, var1850)
			local _ = var1862
			var1850 = var1863
		elseif var1851 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1864, var1865 = protoModule.readFixed64(p66, var1850)
			local _ = var1864
			var1850 = var1865
		else
			error("Unsupported wire type: " .. var2799)
		end
	end
	return var1849
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
	local var1866 = t_66.new()
	
	if self.event_id ~= nil then
		var1866.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1866.event_id = self.eventId
	end
	return var1866
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
	local var1866 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1867, var1868 = protoModule.writeTag(buff, var1866, 1, protoModule.wireTypes.lengthDelimited)
		var1867, var2819 = protoModule.writeString(var1867, var1868, self.event_id)
		buff = var1867
		var1866 = var1868
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1869, var1870 = protoModule.writeTag(buff, var1866, 2, protoModule.wireTypes.lengthDelimited)
		var1869, var2821 = protoModule.writeString(var1869, var1870, self.universe_id)
		buff = var1869
		var1866 = var1870
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var1871 = v:encode()
			local var1872, var1873 = protoModule.writeTag(buff, var1866, 3, protoModule.wireTypes.lengthDelimited)
			var1872, var2824 = protoModule.writeBuffer(var1872, var1873, var1871, buffer.len(var1871))
			buff = var1872
			var1866 = var1873
		end
	end
	local buff_1 = buffer.create(var1866)
	buffer.copy(buff_1, 0, buff, 0, var1866)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1874 = t_67.new()
	local var1875 = 0
	while var1875 < buffer.len(p67) do
		local _ = nil
		local var1876 = nil
		local var1877, var1878, var1879 = protoModule.readTag(p67, var1875)
		local var1880 = var1877
		var1876 = var1878
		var1875 = var1879
		
		if var1876 == protoModule.wireTypes.varint then
			local _ = nil
			local var1881, var1882 = protoModule.readVarInt(p67, var1875)
			local _ = var1881
			var1875 = var1882
			continue
		end
		if var1876 == protoModule.wireTypes.lengthDelimited then
			if var1880 == 1 then
				local _ = nil
				local var1883, var1884 = protoModule.readBuffer(p67, var1875)
				var1875 = var1884
				var1874.event_id = buffer.tostring(var1883)
			elseif var1880 == 2 then
				local _ = nil
				local var1885, var1886 = protoModule.readBuffer(p67, var1875)
				var1875 = var1886
				var1874.universe_id = buffer.tostring(var1885)
			elseif var1880 == 3 then
				local _ = nil
				local var1887, var1888 = protoModule.readBuffer(p67, var1875)
				var1875 = var1888
				table.insert(var1874.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var1887))
			else
				local _ = nil
				local var1889, var1890 = protoModule.readVarInt(p67, var1875)
				var1875 = var1890 + var1889
			end
		elseif var1876 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1891, var1892 = protoModule.readFixed32(p67, var1875)
			local _ = var1891
			var1875 = var1892
		elseif var1876 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1893, var1894 = protoModule.readFixed64(p67, var1875)
			local _ = var1893
			var1875 = var1894
		else
			error("Unsupported wire type: " .. var2828)
		end
	end
	return var1874
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
	local var1895 = t_67.new()
	
	if self.event_id ~= nil then
		var1895.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1895.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1895.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1895.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1895.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1895.rsvp_users = t_1
	end
	return var1895
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
	local var1896 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var1897, var1898 = protoModule.writeTag(buff, var1896, 1, protoModule.wireTypes.varint)
		var1897, var2855 = protoModule.writeVarInt(var1897, var1898, self.user_id)
		buff = var1897
		var1896 = var1898
	end
	local buff_1 = buffer.create(var1896)
	buffer.copy(buff_1, 0, buff, 0, var1896)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1896 = t_68.new()
	local var1897 = 0
	while var1897 < buffer.len(p68) do
		local _ = nil
		local _ = nil
		local var1898, var1899, var1900 = protoModule.readTag(p68, var1897)
		local var1901 = var1898
		local var1902 = var1899
		var1897 = var1900
		
		if var1902 == protoModule.wireTypes.varint then
			if var1901 == 1 then
				local _ = nil
				local var1903, var1904 = protoModule.readVarIntI64(p68, var1897)
				var1897 = var1904
				var1896.user_id = var1903
			else
				local _ = nil
				local var1905, var1906 = protoModule.readVarInt(p68, var1897)
				local _ = var1905
				var1897 = var1906
			end
		elseif var1902 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var1907, var1908 = protoModule.readVarInt(p68, var1897)
			var1897 = var1908 + var1907
		elseif var1902 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1909, var1910 = protoModule.readFixed32(p68, var1897)
			local _ = var1909
			var1897 = var1910
		elseif var1902 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1911, var1912 = protoModule.readFixed64(p68, var1897)
			local _ = var1911
			var1897 = var1912
		else
			error("Unsupported wire type: " .. var2863)
		end
	end
	return var1896
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
	local var1913 = t_68.new()
	
	if self.user_id ~= nil then
		var1913.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1913.user_id = self.userId
	end
	return var1913
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
	local var1913 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1914, var1915 = protoModule.writeTag(buff, var1913, 1, protoModule.wireTypes.lengthDelimited)
		var1914, var2879 = protoModule.writeString(var1914, var1915, self.event_id)
		buff = var1914
		var1913 = var1915
	end
	local buff_1 = buffer.create(var1913)
	buffer.copy(buff_1, 0, buff, 0, var1913)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1913 = t_69.new()
	local var1914 = 0
	while var1914 < buffer.len(p69) do
		local _ = nil
		local var1915 = nil
		local var1916, var1917, var1918 = protoModule.readTag(p69, var1914)
		local var1919 = var1916
		var1915 = var1917
		var1914 = var1918
		
		if var1915 == protoModule.wireTypes.varint then
			local _ = nil
			local var1920, var1921 = protoModule.readVarInt(p69, var1914)
			local _ = var1920
			var1914 = var1921
			continue
		end
		if var1915 == protoModule.wireTypes.lengthDelimited then
			if var1919 == 1 then
				local _ = nil
				local var1922, var1923 = protoModule.readBuffer(p69, var1914)
				var1914 = var1923
				var1913.event_id = buffer.tostring(var1922)
			else
				local _ = nil
				local var1924, var1925 = protoModule.readVarInt(p69, var1914)
				var1914 = var1925 + var1924
			end
		elseif var1915 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1926, var1927 = protoModule.readFixed32(p69, var1914)
			local _ = var1926
			var1914 = var1927
		elseif var1915 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1928, var1929 = protoModule.readFixed64(p69, var1914)
			local _ = var1928
			var1914 = var1929
		else
			error("Unsupported wire type: " .. var2883)
		end
	end
	return var1913
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
	local var1930 = t_69.new()
	
	if self.event_id ~= nil then
		var1930.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1930.event_id = self.eventId
	end
	return var1930
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
	local var1930 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1931, var1932 = protoModule.writeTag(buff, var1930, 1, protoModule.wireTypes.lengthDelimited)
		var1931, var2903 = protoModule.writeString(var1931, var1932, self.event_id)
		buff = var1931
		var1930 = var1932
	end
	local buff_1 = buffer.create(var1930)
	buffer.copy(buff_1, 0, buff, 0, var1930)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var1930 = t_70.new()
	local var1931 = 0
	while var1931 < buffer.len(p70) do
		local _ = nil
		local var1932 = nil
		local var1933, var1934, var1935 = protoModule.readTag(p70, var1931)
		local var1936 = var1933
		var1932 = var1934
		var1931 = var1935
		
		if var1932 == protoModule.wireTypes.varint then
			local _ = nil
			local var1937, var1938 = protoModule.readVarInt(p70, var1931)
			local _ = var1937
			var1931 = var1938
			continue
		end
		if var1932 == protoModule.wireTypes.lengthDelimited then
			if var1936 == 1 then
				local _ = nil
				local var1939, var1940 = protoModule.readBuffer(p70, var1931)
				var1931 = var1940
				var1930.event_id = buffer.tostring(var1939)
			else
				local _ = nil
				local var1941, var1942 = protoModule.readVarInt(p70, var1931)
				var1931 = var1942 + var1941
			end
		elseif var1932 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1943, var1944 = protoModule.readFixed32(p70, var1931)
			local _ = var1943
			var1931 = var1944
		elseif var1932 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1945, var1946 = protoModule.readFixed64(p70, var1931)
			local _ = var1945
			var1931 = var1946
		else
			error("Unsupported wire type: " .. var2907)
		end
	end
	return var1930
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
	local var1947 = t_70.new()
	
	if self.event_id ~= nil then
		var1947.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1947.event_id = self.eventId
	end
	return var1947
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
	local var1947 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1948, var1949 = protoModule.writeTag(buff, var1947, 1, protoModule.wireTypes.lengthDelimited)
		var1948, var2927 = protoModule.writeString(var1948, var1949, self.event_id)
		buff = var1948
		var1947 = var1949
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1950, var1951 = protoModule.writeTag(buff, var1947, 2, protoModule.wireTypes.lengthDelimited)
		var1950, var2929 = protoModule.writeString(var1950, var1951, self.universe_id)
		buff = var1950
		var1947 = var1951
	end
	local buff_1 = buffer.create(var1947)
	buffer.copy(buff_1, 0, buff, 0, var1947)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var1947 = t_71.new()
	local var1948 = 0
	while var1948 < buffer.len(p71) do
		local _ = nil
		local var1949 = nil
		local var1950, var1951, var1952 = protoModule.readTag(p71, var1948)
		local var1953 = var1950
		var1949 = var1951
		var1948 = var1952
		
		if var1949 == protoModule.wireTypes.varint then
			local _ = nil
			local var1954, var1955 = protoModule.readVarInt(p71, var1948)
			local _ = var1954
			var1948 = var1955
			continue
		end
		if var1949 == protoModule.wireTypes.lengthDelimited then
			if var1953 == 1 then
				local _ = nil
				local var1956, var1957 = protoModule.readBuffer(p71, var1948)
				var1948 = var1957
				var1947.event_id = buffer.tostring(var1956)
			elseif var1953 == 2 then
				local _ = nil
				local var1958, var1959 = protoModule.readBuffer(p71, var1948)
				var1948 = var1959
				var1947.universe_id = buffer.tostring(var1958)
			else
				local _ = nil
				local var1960, var1961 = protoModule.readVarInt(p71, var1948)
				var1948 = var1961 + var1960
			end
		elseif var1949 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1962, var1963 = protoModule.readFixed32(p71, var1948)
			local _ = var1962
			var1948 = var1963
		elseif var1949 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1964, var1965 = protoModule.readFixed64(p71, var1948)
			local _ = var1964
			var1948 = var1965
		else
			error("Unsupported wire type: " .. var2933)
		end
	end
	return var1947
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
	local var1966 = t_71.new()
	
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
	return var1966
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
	local var1966 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1967, var1968 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1967, var2955 = protoModule.writeString(var1967, var1968, i)
			local var1969 = v:encode()
			var1968, var2957 = protoModule.writeTag(var1967, var1968, 2, protoModule.wireTypes.lengthDelimited)
			var1968, var2957 = protoModule.writeBuffer(var1968, var2957, var1969, buffer.len(var1969))
			local var1970 = var1968
			local var1971 = var2957
			local var1972, var1973 = protoModule.writeTag(buff, var1966, 1, protoModule.wireTypes.lengthDelimited)
			var1972, var2961 = protoModule.writeBuffer(var1972, var1973, var1970, var1971)
			buff = var1972
			var1966 = var1973
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1974, var1975 = protoModule.writeTag(buff, var1966, 2, protoModule.wireTypes.lengthDelimited)
			var1974, var2963 = protoModule.writeString(var1974, var1975, v)
			buff = var1974
			var1966 = var1975
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1976, var1977 = protoModule.writeTag(buff, var1966, 3, protoModule.wireTypes.lengthDelimited)
		var1976, var2965 = protoModule.writeString(var1976, var1977, self.next_page_token)
		buff = var1976
		var1966 = var1977
	end
	if self.sticky_filter_pills ~= nil then
		local var1978 = self.sticky_filter_pills:encode()
		local var1979, var1980 = protoModule.writeTag(buff, var1966, 4, protoModule.wireTypes.lengthDelimited)
		var1979, var2968 = protoModule.writeBuffer(var1979, var1980, var1978, buffer.len(var1978))
		buff = var1979
		var1966 = var1980
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var1981, var1982 = protoModule.writeTag(buff, var1966, 5, protoModule.wireTypes.lengthDelimited)
		var1981, var2970 = protoModule.writeString(var1981, var1982, self.applied_filters)
		buff = var1981
		var1966 = var1982
	end
	local buff_1 = buffer.create(var1966)
	buffer.copy(buff_1, 0, buff, 0, var1966)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var1983 = t_72.new()
	local var1984 = 0
	while var1984 < buffer.len(p72) do
		local _ = nil
		local var1985 = nil
		local var1986, var1987, var1988 = protoModule.readTag(p72, var1984)
		local var1989 = var1986
		var1985 = var1987
		var1984 = var1988
		
		if var1985 == protoModule.wireTypes.varint then
			local _ = nil
			local var1990, var1991 = protoModule.readVarInt(p72, var1984)
			local _ = var1990
			var1984 = var1991
			continue
		end
		if var1985 == protoModule.wireTypes.lengthDelimited then
			if var1989 == 1 then
				local _ = nil
				local var1992, var1993 = protoModule.readBuffer(p72, var1984)
				var1984 = var1993
				var1992 = t.ChartsFeedInputData_EntryMapEntry.decode(var1992)
				var1983.entry_map[var1992.key or ""] = var1992.value or t.FeedEntry.new()
			elseif var1989 == 2 then
				local _ = nil
				local var1994, var1995 = protoModule.readBuffer(p72, var1984)
				var1984 = var1995
				table.insert(var1983.entry_order, buffer.tostring(var1994))
			elseif var1989 == 3 then
				local _ = nil
				local var1996, var1997 = protoModule.readBuffer(p72, var1984)
				var1984 = var1997
				var1983.next_page_token = buffer.tostring(var1996)
			elseif var1989 == 4 then
				local _ = nil
				local var1998, var1999 = protoModule.readBuffer(p72, var1984)
				var1984 = var1999
				var1983.sticky_filter_pills = t.FilterPillsInputData.decode(var1998)
			elseif var1989 == 5 then
				local _ = nil
				local var2000, var2001 = protoModule.readBuffer(p72, var1984)
				var1984 = var2001
				var1983.applied_filters = buffer.tostring(var2000)
			else
				local _ = nil
				local var2002, var2003 = protoModule.readVarInt(p72, var1984)
				var1984 = var2003 + var2002
			end
		elseif var1985 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2004, var2005 = protoModule.readFixed32(p72, var1984)
			local _ = var2004
			var1984 = var2005
		elseif var1985 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2006, var2007 = protoModule.readFixed64(p72, var1984)
			local _ = var2006
			var1984 = var2007
		else
			error("Unsupported wire type: " .. var2974)
		end
	end
	return var1983
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
	local var2008 = t_72.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2008.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2008.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2008.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2008.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2008.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2008.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2008.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2008.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2008.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2008.applied_filters = self.appliedFilters
	end
	return var2008
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
	local var2009 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2010, var2011 = protoModule.writeTag(buff, var2009, 1, protoModule.wireTypes.lengthDelimited)
		var2010, var3008 = protoModule.writeString(var2010, var2011, self.key)
		buff = var2010
		var2009 = var2011
	end
	if self.value ~= nil then
		local var2012 = self.value:encode()
		local var2013, var2014 = protoModule.writeTag(buff, var2009, 2, protoModule.wireTypes.lengthDelimited)
		var2013, var3011 = protoModule.writeBuffer(var2013, var2014, var2012, buffer.len(var2012))
		buff = var2013
		var2009 = var2014
	end
	local buff_1 = buffer.create(var2009)
	buffer.copy(buff_1, 0, buff, 0, var2009)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
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
				var2009.key = buffer.tostring(var2018)
			elseif var2015 == 2 then
				local _ = nil
				local var2020, var2021 = protoModule.readBuffer(p73, var2010)
				var2010 = var2021
				var2009.value = t.FeedEntry.decode(var2020)
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
	local var2028 = t_73.new()
	
	if self.key ~= nil then
		var2028.key = self.key
	end
	if self.value ~= nil then
		var2028.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2028
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
	local var2028 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2029 = v:encode()
			local var2030, var2031 = protoModule.writeTag(buff, var2028, 1, protoModule.wireTypes.lengthDelimited)
			var2030, var3038 = protoModule.writeBuffer(var2030, var2031, var2029, buffer.len(var2029))
			buff = var2030
			var2028 = var2031
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2032, var2033 = protoModule.writeTag(buff, var2028, 2, protoModule.wireTypes.lengthDelimited)
		var2032, var3040 = protoModule.writeString(var2032, var2033, self.sort_id)
		buff = var2032
		var2028 = var2033
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2034, var2035 = protoModule.writeTag(buff, var2028, 3, protoModule.wireTypes.varint)
		var2034, var3042 = protoModule.writeVarInt(var2034, var2035, self.secondary_sort_id)
		buff = var2034
		var2028 = var2035
	end
	if self.title ~= nil and self.title ~= "" then
		local var2036, var2037 = protoModule.writeTag(buff, var2028, 4, protoModule.wireTypes.lengthDelimited)
		var2036, var3044 = protoModule.writeString(var2036, var2037, self.title)
		buff = var2036
		var2028 = var2037
	end
	if self.primary_sort_id ~= nil then
		local var2038, var2039 = protoModule.writeTag(buff, var2028, 5, protoModule.wireTypes.varint)
		var2038, var3046 = protoModule.writeVarInt(var2038, var2039, self.primary_sort_id)
		buff = var2038
		var2028 = var2039
	end
	if self.applied_filters ~= nil then
		local var2040, var2041 = protoModule.writeTag(buff, var2028, 6, protoModule.wireTypes.lengthDelimited)
		var2040, var3048 = protoModule.writeString(var2040, var2041, self.applied_filters)
		buff = var2040
		var2028 = var2041
	end
	local buff_1 = buffer.create(var2028)
	buffer.copy(buff_1, 0, buff, 0, var2028)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2042 = t_74.new()
	local var2043 = 0
	while var2043 < buffer.len(p74) do
		local _ = nil
		local var2044 = nil
		local var2045, var2046, var2047 = protoModule.readTag(p74, var2043)
		local var2048 = var2045
		var2044 = var2046
		var2043 = var2047
		
		if var2044 == protoModule.wireTypes.varint then
			if var2048 == 3 then
				local _ = nil
				local var2049, var2050 = protoModule.readVarIntI32(p74, var2043)
				var2043 = var2050
				var2042.secondary_sort_id = var2049
			elseif var2048 == 5 then
				local _ = nil
				local var2051, var2052 = protoModule.readVarIntI32(p74, var2043)
				var2043 = var2052
				var2042.primary_sort_id = var2051
			else
				local _ = nil
				local var2053, var2054 = protoModule.readVarInt(p74, var2043)
				local _ = var2053
				var2043 = var2054
			end
		end
		if var2044 == protoModule.wireTypes.lengthDelimited then
			if var2048 == 1 then
				local _ = nil
				local var2055, var2056 = protoModule.readBuffer(p74, var2043)
				var2043 = var2056
				table.insert(var2042.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2055))
			elseif var2048 == 2 then
				local _ = nil
				local var2057, var2058 = protoModule.readBuffer(p74, var2043)
				var2043 = var2058
				var2042.sort_id = buffer.tostring(var2057)
			elseif var2048 == 4 then
				local _ = nil
				local var2059, var2060 = protoModule.readBuffer(p74, var2043)
				var2043 = var2060
				var2042.title = buffer.tostring(var2059)
			elseif var2048 == 6 then
				local _ = nil
				local var2061, var2062 = protoModule.readBuffer(p74, var2043)
				var2043 = var2062
				var2042.applied_filters = buffer.tostring(var2061)
			else
				local _ = nil
				local var2063, var2064 = protoModule.readVarInt(p74, var2043)
				var2043 = var2064 + var2063
			end
		elseif var2044 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2065, var2066 = protoModule.readFixed32(p74, var2043)
			local _ = var2065
			var2043 = var2066
		elseif var2044 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2067, var2068 = protoModule.readFixed64(p74, var2043)
			local _ = var2067
			var2043 = var2068
		else
			error("Unsupported wire type: " .. var3052)
		end
	end
	return var2042
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
	local var2069 = t_74.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2069.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2069.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2069.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2069.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2069.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2069.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2069.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2069.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2069.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2069.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2069.applied_filters = self.appliedFilters
	end
	return var2069
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
	local var2070 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2071, var2072 = protoModule.writeTag(buff, var2070, 1, protoModule.wireTypes.lengthDelimited)
		var2071, var3085 = protoModule.writeString(var2071, var2072, self.filter_id)
		buff = var2071
		var2070 = var2072
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2073, var2074 = protoModule.writeTag(buff, var2070, 2, protoModule.wireTypes.lengthDelimited)
		var2073, var3087 = protoModule.writeString(var2073, var2074, self.display_name)
		buff = var2073
		var2070 = var2074
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2075 = v:encode()
			local var2076, var2077 = protoModule.writeTag(buff, var2070, 3, protoModule.wireTypes.lengthDelimited)
			var2076, var3090 = protoModule.writeBuffer(var2076, var2077, var2075, buffer.len(var2075))
			buff = var2076
			var2070 = var2077
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2078, var2079 = protoModule.writeTag(buff, var2070, 4, protoModule.wireTypes.lengthDelimited)
		var2078, var3092 = protoModule.writeString(var2078, var2079, self.default_option_id)
		buff = var2078
		var2070 = var2079
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2080, var2081 = protoModule.writeTag(buff, var2070, 5, protoModule.wireTypes.lengthDelimited)
		var2080, var3094 = protoModule.writeString(var2080, var2081, self.selected_option_id)
		buff = var2080
		var2070 = var2081
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2082, var2083 = protoModule.writeTag(buff, var2070, 6, protoModule.wireTypes.lengthDelimited)
		var2082, var3096 = protoModule.writeString(var2082, var2083, self.filter_type)
		buff = var2082
		var2070 = var2083
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2084, var2085 = protoModule.writeTag(buff, var2070, 7, protoModule.wireTypes.lengthDelimited)
			var2084, var3098 = protoModule.writeString(var2084, var2085, v)
			buff = var2084
			var2070 = var2085
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2086, var2087 = protoModule.writeTag(buff, var2070, 8, protoModule.wireTypes.lengthDelimited)
		var2086, var3100 = protoModule.writeString(var2086, var2087, self.info_text)
		buff = var2086
		var2070 = var2087
	end
	local buff_1 = buffer.create(var2070)
	buffer.copy(buff_1, 0, buff, 0, var2070)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2088 = t_75.new()
	local var2089 = 0
	while var2089 < buffer.len(p75) do
		local _ = nil
		local var2090 = nil
		local var2091, var2092, var2093 = protoModule.readTag(p75, var2089)
		local var2094 = var2091
		var2090 = var2092
		var2089 = var2093
		
		if var2090 == protoModule.wireTypes.varint then
			local _ = nil
			local var2095, var2096 = protoModule.readVarInt(p75, var2089)
			local _ = var2095
			var2089 = var2096
			continue
		end
		if var2090 == protoModule.wireTypes.lengthDelimited then
			if var2094 == 1 then
				local _ = nil
				local var2097, var2098 = protoModule.readBuffer(p75, var2089)
				var2089 = var2098
				var2088.filter_id = buffer.tostring(var2097)
			elseif var2094 == 2 then
				local _ = nil
				local var2099, var2100 = protoModule.readBuffer(p75, var2089)
				var2089 = var2100
				var2088.display_name = buffer.tostring(var2099)
			elseif var2094 == 3 then
				local _ = nil
				local var2101, var2102 = protoModule.readBuffer(p75, var2089)
				var2089 = var2102
				table.insert(var2088.options, t.FilterPillsInputData_FilterOption.decode(var2101))
			elseif var2094 == 4 then
				local _ = nil
				local var2103, var2104 = protoModule.readBuffer(p75, var2089)
				var2089 = var2104
				var2088.default_option_id = buffer.tostring(var2103)
			elseif var2094 == 5 then
				local _ = nil
				local var2105, var2106 = protoModule.readBuffer(p75, var2089)
				var2089 = var2106
				var2088.selected_option_id = buffer.tostring(var2105)
			elseif var2094 == 6 then
				local _ = nil
				local var2107, var2108 = protoModule.readBuffer(p75, var2089)
				var2089 = var2108
				var2088.filter_type = buffer.tostring(var2107)
			elseif var2094 == 7 then
				local _ = nil
				local var2109, var2110 = protoModule.readBuffer(p75, var2089)
				var2089 = var2110
				table.insert(var2088.inactive_option_ids, buffer.tostring(var2109))
			elseif var2094 == 8 then
				local _ = nil
				local var2111, var2112 = protoModule.readBuffer(p75, var2089)
				var2089 = var2112
				var2088.info_text = buffer.tostring(var2111)
			else
				local _ = nil
				local var2113, var2114 = protoModule.readVarInt(p75, var2089)
				var2089 = var2114 + var2113
			end
		elseif var2090 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2115, var2116 = protoModule.readFixed32(p75, var2089)
			local _ = var2115
			var2089 = var2116
		elseif var2090 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2117, var2118 = protoModule.readFixed64(p75, var2089)
			local _ = var2117
			var2089 = var2118
		else
			error("Unsupported wire type: " .. var3104)
		end
	end
	return var2088
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
	local var2119 = t_75.new()
	
	if self.filter_id ~= nil then
		var2119.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2119.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2119.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2119.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2119.options = t_1
	end
	if self.default_option_id ~= nil then
		var2119.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2119.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2119.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2119.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2119.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2119.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2119.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2119.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2119.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2119.info_text = self.infoText
	end
	return var2119
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
	local var2120 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2121, var2122 = protoModule.writeTag(buff, var2120, 1, protoModule.wireTypes.lengthDelimited)
		var2121, var3143 = protoModule.writeString(var2121, var2122, self.option_id)
		buff = var2121
		var2120 = var2122
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2123, var2124 = protoModule.writeTag(buff, var2120, 2, protoModule.wireTypes.lengthDelimited)
		var2123, var3145 = protoModule.writeString(var2123, var2124, self.display_name)
		buff = var2123
		var2120 = var2124
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2125, var2126 = protoModule.writeTag(buff, var2120, 3, protoModule.wireTypes.lengthDelimited)
		var2125, var3147 = protoModule.writeString(var2125, var2126, self.option_context_tag)
		buff = var2125
		var2120 = var2126
	end
	local buff_1 = buffer.create(var2120)
	buffer.copy(buff_1, 0, buff, 0, var2120)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref)
	local var2120 = t_76.new()
	local var2121 = 0
	while var2121 < buffer.len(p76) do
		local _ = nil
		local var2122 = nil
		local var2123, var2124, var2125 = protoModule.readTag(p76, var2121)
		local var2126 = var2123
		var2122 = var2124
		var2121 = var2125
		
		if var2122 == protoModule.wireTypes.varint then
			local _ = nil
			local var2127, var2128 = protoModule.readVarInt(p76, var2121)
			local _ = var2127
			var2121 = var2128
			continue
		end
		if var2122 == protoModule.wireTypes.lengthDelimited then
			if var2126 == 1 then
				local _ = nil
				local var2129, var2130 = protoModule.readBuffer(p76, var2121)
				var2121 = var2130
				var2120.option_id = buffer.tostring(var2129)
			elseif var2126 == 2 then
				local _ = nil
				local var2131, var2132 = protoModule.readBuffer(p76, var2121)
				var2121 = var2132
				var2120.display_name = buffer.tostring(var2131)
			elseif var2126 == 3 then
				local _ = nil
				local var2133, var2134 = protoModule.readBuffer(p76, var2121)
				var2121 = var2134
				var2120.option_context_tag = buffer.tostring(var2133)
			else
				local _ = nil
				local var2135, var2136 = protoModule.readVarInt(p76, var2121)
				var2121 = var2136 + var2135
			end
		elseif var2122 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2137, var2138 = protoModule.readFixed32(p76, var2121)
			local _ = var2137
			var2121 = var2138
		elseif var2122 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2139, var2140 = protoModule.readFixed64(p76, var2121)
			local _ = var2139
			var2121 = var2140
		else
			error("Unsupported wire type: " .. var3151)
		end
	end
	return var2120
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
	local var2141 = t_76.new()
	
	if self.option_id ~= nil then
		var2141.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var2141.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var2141.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2141.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var2141.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var2141.option_context_tag = self.optionContextTag
	end
	return var2141
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
	local var2141 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2142 = v:encode()
			local var2143, var2144 = protoModule.writeTag(buff, var2141, 1, protoModule.wireTypes.lengthDelimited)
			var2143, var3176 = protoModule.writeBuffer(var2143, var2144, var2142, buffer.len(var2142))
			buff = var2143
			var2141 = var2144
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var2145, var2146 = protoModule.writeTag(buff, var2141, 2, protoModule.wireTypes.lengthDelimited)
		var2145, var3178 = protoModule.writeString(var2145, var2146, self.selected_sort_id)
		buff = var2145
		var2141 = var2146
	end
	local buff_1 = buffer.create(var2141)
	buffer.copy(buff_1, 0, buff, 0, var2141)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2147 = t_77.new()
	local var2148 = 0
	while var2148 < buffer.len(p77) do
		local _ = nil
		local var2149 = nil
		local var2150, var2151, var2152 = protoModule.readTag(p77, var2148)
		local var2153 = var2150
		var2149 = var2151
		var2148 = var2152
		
		if var2149 == protoModule.wireTypes.varint then
			local _ = nil
			local var2154, var2155 = protoModule.readVarInt(p77, var2148)
			local _ = var2154
			var2148 = var2155
			continue
		end
		if var2149 == protoModule.wireTypes.lengthDelimited then
			if var2153 == 1 then
				local _ = nil
				local var2156, var2157 = protoModule.readBuffer(p77, var2148)
				var2148 = var2157
				table.insert(var2147.sort_options, t.SortSelectorInputData_SortOption.decode(var2156))
			elseif var2153 == 2 then
				local _ = nil
				local var2158, var2159 = protoModule.readBuffer(p77, var2148)
				var2148 = var2159
				var2147.selected_sort_id = buffer.tostring(var2158)
			else
				local _ = nil
				local var2160, var2161 = protoModule.readVarInt(p77, var2148)
				var2148 = var2161 + var2160
			end
		elseif var2149 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2162, var2163 = protoModule.readFixed32(p77, var2148)
			local _ = var2162
			var2148 = var2163
		elseif var2149 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2164, var2165 = protoModule.readFixed64(p77, var2148)
			local _ = var2164
			var2148 = var2165
		else
			error("Unsupported wire type: " .. var3182)
		end
	end
	return var2147
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
	local var2166 = t_77.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2166.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var2166.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var2166.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var2166.selected_sort_id = self.selectedSortId
	end
	return var2166
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
	local var2167 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2168, var2169 = protoModule.writeTag(buff, var2167, 1, protoModule.wireTypes.lengthDelimited)
		var2168, var3207 = protoModule.writeString(var2168, var2169, self.sort_id)
		buff = var2168
		var2167 = var2169
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2170, var2171 = protoModule.writeTag(buff, var2167, 2, protoModule.wireTypes.lengthDelimited)
		var2170, var3209 = protoModule.writeString(var2170, var2171, self.display_name)
		buff = var2170
		var2167 = var2171
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2172, var2173 = protoModule.writeTag(buff, var2167, 3, protoModule.wireTypes.lengthDelimited)
		var2172, var3211 = protoModule.writeString(var2172, var2173, self.content_type)
		buff = var2172
		var2167 = var2173
	end
	local buff_1 = buffer.create(var2167)
	buffer.copy(buff_1, 0, buff, 0, var2167)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var2167 = t_78.new()
	local var2168 = 0
	while var2168 < buffer.len(p78) do
		local _ = nil
		local var2169 = nil
		local var2170, var2171, var2172 = protoModule.readTag(p78, var2168)
		local var2173 = var2170
		var2169 = var2171
		var2168 = var2172
		
		if var2169 == protoModule.wireTypes.varint then
			local _ = nil
			local var2174, var2175 = protoModule.readVarInt(p78, var2168)
			local _ = var2174
			var2168 = var2175
			continue
		end
		if var2169 == protoModule.wireTypes.lengthDelimited then
			if var2173 == 1 then
				local _ = nil
				local var2176, var2177 = protoModule.readBuffer(p78, var2168)
				var2168 = var2177
				var2167.sort_id = buffer.tostring(var2176)
			elseif var2173 == 2 then
				local _ = nil
				local var2178, var2179 = protoModule.readBuffer(p78, var2168)
				var2168 = var2179
				var2167.display_name = buffer.tostring(var2178)
			elseif var2173 == 3 then
				local _ = nil
				local var2180, var2181 = protoModule.readBuffer(p78, var2168)
				var2168 = var2181
				var2167.content_type = buffer.tostring(var2180)
			else
				local _ = nil
				local var2182, var2183 = protoModule.readVarInt(p78, var2168)
				var2168 = var2183 + var2182
			end
		elseif var2169 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2184, var2185 = protoModule.readFixed32(p78, var2168)
			local _ = var2184
			var2168 = var2185
		elseif var2169 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2186, var2187 = protoModule.readFixed64(p78, var2168)
			local _ = var2186
			var2168 = var2187
		else
			error("Unsupported wire type: " .. var3215)
		end
	end
	return var2167
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
	local var2188 = t_78.new()
	
	if self.sort_id ~= nil then
		var2188.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2188.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var2188.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2188.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var2188.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2188.content_type = self.contentType
	end
	return var2188
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
	local var2188 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2189, var2190 = protoModule.writeTag(buff, var2188, 1, protoModule.wireTypes.lengthDelimited)
		var2189, var3239 = protoModule.writeString(var2189, var2190, self.selected_option)
		buff = var2189
		var2188 = var2190
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2191 = v:encode()
			local var2192, var2193 = protoModule.writeTag(buff, var2188, 2, protoModule.wireTypes.lengthDelimited)
			var2192, var3242 = protoModule.writeBuffer(var2192, var2193, var2191, buffer.len(var2191))
			buff = var2192
			var2188 = var2193
		end
	end
	if self.experience_carousel ~= nil then
		local var2194 = self.experience_carousel:encode()
		local var2195, var2196 = protoModule.writeTag(buff, var2188, 3, protoModule.wireTypes.lengthDelimited)
		var2195, var3245 = protoModule.writeBuffer(var2195, var2196, var2194, buffer.len(var2194))
		buff = var2195
		var2188 = var2196
	end
	local buff_1 = buffer.create(var2188)
	buffer.copy(buff_1, 0, buff, 0, var2188)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2197 = t_79.new()
	local var2198 = 0
	while var2198 < buffer.len(p79) do
		local _ = nil
		local var2199 = nil
		local var2200, var2201, var2202 = protoModule.readTag(p79, var2198)
		local var2203 = var2200
		var2199 = var2201
		var2198 = var2202
		
		if var2199 == protoModule.wireTypes.varint then
			local _ = nil
			local var2204, var2205 = protoModule.readVarInt(p79, var2198)
			local _ = var2204
			var2198 = var2205
			continue
		end
		if var2199 == protoModule.wireTypes.lengthDelimited then
			if var2203 == 1 then
				local _ = nil
				local var2206, var2207 = protoModule.readBuffer(p79, var2198)
				var2198 = var2207
				var2197.selected_option = buffer.tostring(var2206)
			elseif var2203 == 2 then
				local _ = nil
				local var2208, var2209 = protoModule.readBuffer(p79, var2198)
				var2198 = var2209
				table.insert(var2197.options, t.SelectorOption.decode(var2208))
			elseif var2203 == 3 then
				local _ = nil
				local var2210, var2211 = protoModule.readBuffer(p79, var2198)
				var2198 = var2211
				var2197.experience_carousel = t.ExperienceCarouselInputData.decode(var2210)
			else
				local _ = nil
				local var2212, var2213 = protoModule.readVarInt(p79, var2198)
				var2198 = var2213 + var2212
			end
		elseif var2199 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2214, var2215 = protoModule.readFixed32(p79, var2198)
			local _ = var2214
			var2198 = var2215
		elseif var2199 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2216, var2217 = protoModule.readFixed64(p79, var2198)
			local _ = var2216
			var2198 = var2217
		else
			error("Unsupported wire type: " .. var3249)
		end
	end
	return var2197
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
	local var2218 = t_79.new()
	
	if self.selected_option ~= nil then
		var2218.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var2218.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var2218.options = t_1
	end
	if self.experience_carousel ~= nil then
		var2218.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var2218.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var2218
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
	local var2219 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2220, var2221 = protoModule.writeTag(buff, var2219, 1, protoModule.wireTypes.lengthDelimited)
		var2220, var3275 = protoModule.writeString(var2220, var2221, self.id)
		buff = var2220
		var2219 = var2221
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var2222, var2223 = protoModule.writeTag(buff, var2219, 4, protoModule.wireTypes.varint)
		var2222, var3277 = protoModule.writeVarInt(var2222, var2223, self.preview_rows)
		buff = var2222
		var2219 = var2223
	end
	if self.widget_style ~= nil then
		local var2224 = self.widget_style:encode()
		local var2225, var2226 = protoModule.writeTag(buff, var2219, 3, protoModule.wireTypes.lengthDelimited)
		var2225, var3280 = protoModule.writeBuffer(var2225, var2226, var2224, buffer.len(var2224))
		buff = var2225
		var2219 = var2226
	end
	if self.see_all_button then
		local var2227, var2228 = protoModule.writeTag(buff, var2219, 5, protoModule.wireTypes.varint)
		var2227, var3282 = protoModule.writeVarInt(var2227, var2228, if self.see_all_button then 1 else 0)
		buff = var2227
		var2219 = var2228
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2229, var2230 = protoModule.writeTag(buff, var2219, 6, protoModule.wireTypes.lengthDelimited)
		var2229, var3284 = protoModule.writeString(var2229, var2230, self.information_popover_text)
		buff = var2229
		var2219 = var2230
	end
	local buff_1 = buffer.create(var2219)
	buffer.copy(buff_1, 0, buff, 0, var2219)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2219 = t_80.new()
	local var2220 = 0
	while var2220 < buffer.len(p80) do
		local _ = nil
		local var2221 = nil
		local var2222, var2223, var2224 = protoModule.readTag(p80, var2220)
		local var2225 = var2222
		var2221 = var2223
		var2220 = var2224
		
		if var2221 == protoModule.wireTypes.varint then
			if var2225 == 4 then
				local _ = nil
				local var2226, var2227 = protoModule.readVarIntI64(p80, var2220)
				var2220 = var2227
				var2219.preview_rows = var2226
			elseif var2225 == 5 then
				local _ = nil
				local var2228, var2229 = protoModule.readVarInt(p80, var2220)
				var2220 = var2229
				var2219.see_all_button = var2228 ~= 0
			else
				local _ = nil
				local var2230, var2231 = protoModule.readVarInt(p80, var2220)
				local _ = var2230
				var2220 = var2231
			end
		end
		if var2221 == protoModule.wireTypes.lengthDelimited then
			if var2225 == 1 then
				local _ = nil
				local var2232, var2233 = protoModule.readBuffer(p80, var2220)
				var2220 = var2233
				var2219.id = buffer.tostring(var2232)
			elseif var2225 == 3 then
				local _ = nil
				local var2234, var2235 = protoModule.readBuffer(p80, var2220)
				var2220 = var2235
				var2219.widget_style = t.WidgetStyleData.decode(var2234)
			elseif var2225 == 6 then
				local _ = nil
				local var2236, var2237 = protoModule.readBuffer(p80, var2220)
				var2220 = var2237
				var2219.information_popover_text = buffer.tostring(var2236)
			else
				local _ = nil
				local var2238, var2239 = protoModule.readVarInt(p80, var2220)
				var2220 = var2239 + var2238
			end
		elseif var2221 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2240, var2241 = protoModule.readFixed32(p80, var2220)
			local _ = var2240
			var2220 = var2241
		elseif var2221 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2242, var2243 = protoModule.readFixed64(p80, var2220)
			local _ = var2242
			var2220 = var2243
		else
			error("Unsupported wire type: " .. var3288)
		end
	end
	return var2219
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
	local var2244 = t_80.new()
	
	if self.id ~= nil then
		var2244.id = self.id
	end
	if self.preview_rows ~= nil then
		var2244.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var2244.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var2244.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2244.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2244.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2244.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2244.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2244.information_popover_text = self.informationPopoverText
	end
	return var2244
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
	local var2244 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2245, var2246 = protoModule.writeTag(buff, var2244, 1, protoModule.wireTypes.lengthDelimited)
		var2245, var3316 = protoModule.writeString(var2245, var2246, self.id)
		buff = var2245
		var2244 = var2246
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var2247, var2248 = protoModule.writeTag(buff, var2244, 5, protoModule.wireTypes.varint)
		var2247, var3318 = protoModule.writeVarInt(var2247, var2248, self.num_items_to_show)
		buff = var2247
		var2244 = var2248
	end
	if self.widget_style ~= nil then
		local var2249 = self.widget_style:encode()
		local var2250, var2251 = protoModule.writeTag(buff, var2244, 3, protoModule.wireTypes.lengthDelimited)
		var2250, var3321 = protoModule.writeBuffer(var2250, var2251, var2249, buffer.len(var2249))
		buff = var2250
		var2244 = var2251
	end
	if self.see_all_button then
		local var2252, var2253 = protoModule.writeTag(buff, var2244, 6, protoModule.wireTypes.varint)
		var2252, var3323 = protoModule.writeVarInt(var2252, var2253, if self.see_all_button then 1 else 0)
		buff = var2252
		var2244 = var2253
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var2254, var2255 = protoModule.writeTag(buff, var2244, 7, protoModule.wireTypes.lengthDelimited)
		var2254, var3325 = protoModule.writeString(var2254, var2255, self.information_popover_text)
		buff = var2254
		var2244 = var2255
	end
	local buff_1 = buffer.create(var2244)
	buffer.copy(buff_1, 0, buff, 0, var2244)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var2244 = t_81.new()
	local var2245 = 0
	while var2245 < buffer.len(p81) do
		local _ = nil
		local var2246 = nil
		local var2247, var2248, var2249 = protoModule.readTag(p81, var2245)
		local var2250 = var2247
		var2246 = var2248
		var2245 = var2249
		
		if var2246 == protoModule.wireTypes.varint then
			if var2250 == 5 then
				local _ = nil
				local var2251, var2252 = protoModule.readVarIntI64(p81, var2245)
				var2245 = var2252
				var2244.num_items_to_show = var2251
			elseif var2250 == 6 then
				local _ = nil
				local var2253, var2254 = protoModule.readVarInt(p81, var2245)
				var2245 = var2254
				var2244.see_all_button = var2253 ~= 0
			else
				local _ = nil
				local var2255, var2256 = protoModule.readVarInt(p81, var2245)
				local _ = var2255
				var2245 = var2256
			end
		end
		if var2246 == protoModule.wireTypes.lengthDelimited then
			if var2250 == 1 then
				local _ = nil
				local var2257, var2258 = protoModule.readBuffer(p81, var2245)
				var2245 = var2258
				var2244.id = buffer.tostring(var2257)
			elseif var2250 == 3 then
				local _ = nil
				local var2259, var2260 = protoModule.readBuffer(p81, var2245)
				var2245 = var2260
				var2244.widget_style = t.WidgetStyleData.decode(var2259)
			elseif var2250 == 7 then
				local _ = nil
				local var2261, var2262 = protoModule.readBuffer(p81, var2245)
				var2245 = var2262
				var2244.information_popover_text = buffer.tostring(var2261)
			else
				local _ = nil
				local var2263, var2264 = protoModule.readVarInt(p81, var2245)
				var2245 = var2264 + var2263
			end
		elseif var2246 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2265, var2266 = protoModule.readFixed32(p81, var2245)
			local _ = var2265
			var2245 = var2266
		elseif var2246 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2267, var2268 = protoModule.readFixed64(p81, var2245)
			local _ = var2267
			var2245 = var2268
		else
			error("Unsupported wire type: " .. var3329)
		end
	end
	return var2244
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
	local var2269 = t_81.new()
	
	if self.id ~= nil then
		var2269.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var2269.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var2269.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var2269.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2269.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var2269.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var2269.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var2269.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var2269.information_popover_text = self.informationPopoverText
	end
	return var2269
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
	local var2269 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2270 = v:encode()
			local var2271, var2272 = protoModule.writeTag(buff, var2269, 1, protoModule.wireTypes.lengthDelimited)
			var2271, var3358 = protoModule.writeBuffer(var2271, var2272, var2270, buffer.len(var2270))
			buff = var2271
			var2269 = var2272
		end
	end
	local buff_1 = buffer.create(var2269)
	buffer.copy(buff_1, 0, buff, 0, var2269)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var2273 = t_82.new()
	local var2274 = 0
	while var2274 < buffer.len(p82) do
		local _ = nil
		local var2275 = nil
		local var2276, var2277, var2278 = protoModule.readTag(p82, var2274)
		local var2279 = var2276
		var2275 = var2277
		var2274 = var2278
		
		if var2275 == protoModule.wireTypes.varint then
			local _ = nil
			local var2280, var2281 = protoModule.readVarInt(p82, var2274)
			local _ = var2280
			var2274 = var2281
			continue
		end
		if var2275 == protoModule.wireTypes.lengthDelimited then
			if var2279 == 1 then
				local _ = nil
				local var2282, var2283 = protoModule.readBuffer(p82, var2274)
				var2274 = var2283
				table.insert(var2273.background_layers, backgroundLayerModule.BackgroundLayer.decode(var2282))
			else
				local _ = nil
				local var2284, var2285 = protoModule.readVarInt(p82, var2274)
				var2274 = var2285 + var2284
			end
		elseif var2275 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2286, var2287 = protoModule.readFixed32(p82, var2274)
			local _ = var2286
			var2274 = var2287
		elseif var2275 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2288, var2289 = protoModule.readFixed64(p82, var2274)
			local _ = var2288
			var2274 = var2289
		else
			error("Unsupported wire type: " .. var3362)
		end
	end
	return var2273
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
	local var2290 = t_82.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2290.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var2290.background_layers = t
	end
	return var2290
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
	local var2291 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2292, var2293 = protoModule.writeTag(buff, var2291, 1, protoModule.wireTypes.lengthDelimited)
		var2292, var3385 = protoModule.writeString(var2292, var2293, self.id)
		buff = var2292
		var2291 = var2293
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var2294, var2295 = protoModule.writeTag(buff, var2291, 2, protoModule.wireTypes.lengthDelimited)
		var2294, var3387 = protoModule.writeString(var2294, var2295, self.available_until)
		buff = var2294
		var2291 = var2295
	end
	if self.widget_style ~= nil then
		local var2296 = self.widget_style:encode()
		local var2297, var2298 = protoModule.writeTag(buff, var2291, 3, protoModule.wireTypes.lengthDelimited)
		var2297, var3390 = protoModule.writeBuffer(var2297, var2298, var2296, buffer.len(var2296))
		buff = var2297
		var2291 = var2298
	end
	local buff_1 = buffer.create(var2291)
	buffer.copy(buff_1, 0, buff, 0, var2291)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2291 = t_83.new()
	local var2292 = 0
	while var2292 < buffer.len(p83) do
		local _ = nil
		local var2293 = nil
		local var2294, var2295, var2296 = protoModule.readTag(p83, var2292)
		local var2297 = var2294
		var2293 = var2295
		var2292 = var2296
		
		if var2293 == protoModule.wireTypes.varint then
			local _ = nil
			local var2298, var2299 = protoModule.readVarInt(p83, var2292)
			local _ = var2298
			var2292 = var2299
			continue
		end
		if var2293 == protoModule.wireTypes.lengthDelimited then
			if var2297 == 1 then
				local _ = nil
				local var2300, var2301 = protoModule.readBuffer(p83, var2292)
				var2292 = var2301
				var2291.id = buffer.tostring(var2300)
			elseif var2297 == 2 then
				local _ = nil
				local var2302, var2303 = protoModule.readBuffer(p83, var2292)
				var2292 = var2303
				var2291.available_until = buffer.tostring(var2302)
			elseif var2297 == 3 then
				local _ = nil
				local var2304, var2305 = protoModule.readBuffer(p83, var2292)
				var2292 = var2305
				var2291.widget_style = t.WidgetStyleData.decode(var2304)
			else
				local _ = nil
				local var2306, var2307 = protoModule.readVarInt(p83, var2292)
				var2292 = var2307 + var2306
			end
		elseif var2293 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2308, var2309 = protoModule.readFixed32(p83, var2292)
			local _ = var2308
			var2292 = var2309
		elseif var2293 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2310, var2311 = protoModule.readFixed64(p83, var2292)
			local _ = var2310
			var2292 = var2311
		else
			error("Unsupported wire type: " .. var3394)
		end
	end
	return var2291
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
	local var2312 = t_83.new()
	
	if self.id ~= nil then
		var2312.id = self.id
	end
	if self.available_until ~= nil then
		var2312.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var2312.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var2312.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var2312.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var2312
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
	local var2312 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2313, var2314 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2313, var3418 = protoModule.writeString(var2313, var2314, i)
			local var2315 = v:encode()
			var2314, var3420 = protoModule.writeTag(var2313, var2314, 2, protoModule.wireTypes.lengthDelimited)
			var2314, var3420 = protoModule.writeBuffer(var2314, var3420, var2315, buffer.len(var2315))
			local var2316 = var2314
			local var2317 = var3420
			local var2318, var2319 = protoModule.writeTag(buff, var2312, 1, protoModule.wireTypes.lengthDelimited)
			var2318, var3424 = protoModule.writeBuffer(var2318, var2319, var2316, var2317)
			buff = var2318
			var2312 = var2319
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2320, var2321 = protoModule.writeTag(buff, var2312, 2, protoModule.wireTypes.lengthDelimited)
			var2320, var3426 = protoModule.writeString(var2320, var2321, v)
			buff = var2320
			var2312 = var2321
		end
	end
	local buff_1 = buffer.create(var2312)
	buffer.copy(buff_1, 0, buff, 0, var2312)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var2322 = t_84.new()
	local var2323 = 0
	while var2323 < buffer.len(p84) do
		local _ = nil
		local var2324 = nil
		local var2325, var2326, var2327 = protoModule.readTag(p84, var2323)
		local var2328 = var2325
		var2324 = var2326
		var2323 = var2327
		
		if var2324 == protoModule.wireTypes.varint then
			local _ = nil
			local var2329, var2330 = protoModule.readVarInt(p84, var2323)
			local _ = var2329
			var2323 = var2330
			continue
		end
		if var2324 == protoModule.wireTypes.lengthDelimited then
			if var2328 == 1 then
				local _ = nil
				local var2331, var2332 = protoModule.readBuffer(p84, var2323)
				var2323 = var2332
				var2331 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var2331)
				var2322.entry_map[var2331.key or ""] = var2331.value or t.FeedEntry.new()
			elseif var2328 == 2 then
				local _ = nil
				local var2333, var2334 = protoModule.readBuffer(p84, var2323)
				var2323 = var2334
				table.insert(var2322.entry_order, buffer.tostring(var2333))
			else
				local _ = nil
				local var2335, var2336 = protoModule.readVarInt(p84, var2323)
				var2323 = var2336 + var2335
			end
		elseif var2324 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2337, var2338 = protoModule.readFixed32(p84, var2323)
			local _ = var2337
			var2323 = var2338
		elseif var2324 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2339, var2340 = protoModule.readFixed64(p84, var2323)
			local _ = var2339
			var2323 = var2340
		else
			error("Unsupported wire type: " .. var3430)
		end
	end
	return var2322
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
	local var2341 = t_84.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2341.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2341.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2341.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2341.entry_order = t_1
	end
	return var2341
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
	local var2342 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2343, var2344 = protoModule.writeTag(buff, var2342, 1, protoModule.wireTypes.lengthDelimited)
		var2343, var3458 = protoModule.writeString(var2343, var2344, self.key)
		buff = var2343
		var2342 = var2344
	end
	if self.value ~= nil then
		local var2345 = self.value:encode()
		local var2346, var2347 = protoModule.writeTag(buff, var2342, 2, protoModule.wireTypes.lengthDelimited)
		var2346, var3461 = protoModule.writeBuffer(var2346, var2347, var2345, buffer.len(var2345))
		buff = var2346
		var2342 = var2347
	end
	local buff_1 = buffer.create(var2342)
	buffer.copy(buff_1, 0, buff, 0, var2342)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2342 = t_85.new()
	local var2343 = 0
	while var2343 < buffer.len(p85) do
		local _ = nil
		local var2344 = nil
		local var2345, var2346, var2347 = protoModule.readTag(p85, var2343)
		local var2348 = var2345
		var2344 = var2346
		var2343 = var2347
		
		if var2344 == protoModule.wireTypes.varint then
			local _ = nil
			local var2349, var2350 = protoModule.readVarInt(p85, var2343)
			local _ = var2349
			var2343 = var2350
			continue
		end
		if var2344 == protoModule.wireTypes.lengthDelimited then
			if var2348 == 1 then
				local _ = nil
				local var2351, var2352 = protoModule.readBuffer(p85, var2343)
				var2343 = var2352
				var2342.key = buffer.tostring(var2351)
			elseif var2348 == 2 then
				local _ = nil
				local var2353, var2354 = protoModule.readBuffer(p85, var2343)
				var2343 = var2354
				var2342.value = t.FeedEntry.decode(var2353)
			else
				local _ = nil
				local var2355, var2356 = protoModule.readVarInt(p85, var2343)
				var2343 = var2356 + var2355
			end
		elseif var2344 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2357, var2358 = protoModule.readFixed32(p85, var2343)
			local _ = var2357
			var2343 = var2358
		elseif var2344 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2359, var2360 = protoModule.readFixed64(p85, var2343)
			local _ = var2359
			var2343 = var2360
		else
			error("Unsupported wire type: " .. var3465)
		end
	end
	return var2342
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
	local var2361 = t_85.new()
	
	if self.key ~= nil then
		var2361.key = self.key
	end
	if self.value ~= nil then
		var2361.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2361
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
	local var2361 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2362 = v:encode()
			local var2363, var2364 = protoModule.writeTag(buff, var2361, 1, protoModule.wireTypes.lengthDelimited)
			var2363, var3488 = protoModule.writeBuffer(var2363, var2364, var2362, buffer.len(var2362))
			buff = var2363
			var2361 = var2364
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var2365, var2366 = protoModule.writeTag(buff, var2361, 2, protoModule.wireTypes.lengthDelimited)
		var2365, var3490 = protoModule.writeString(var2365, var2366, self.active_category_id)
		buff = var2365
		var2361 = var2366
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var2367, var2368 = protoModule.writeTag(buff, var2361, 3, protoModule.wireTypes.varint)
		var2367, var3492 = protoModule.writeVarInt(var2367, var2368, self.active_tooltip_idx)
		buff = var2367
		var2361 = var2368
	end
	local buff_1 = buffer.create(var2361)
	buffer.copy(buff_1, 0, buff, 0, var2361)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2369 = t_86.new()
	local var2370 = 0
	while var2370 < buffer.len(p86) do
		local _ = nil
		local var2371 = nil
		local var2372, var2373, var2374 = protoModule.readTag(p86, var2370)
		local var2375 = var2372
		var2371 = var2373
		var2370 = var2374
		
		if var2371 == protoModule.wireTypes.varint then
			if var2375 == 3 then
				local _ = nil
				local var2376, var2377 = protoModule.readVarIntI64(p86, var2370)
				var2370 = var2377
				var2369.active_tooltip_idx = var2376
			else
				local _ = nil
				local var2378, var2379 = protoModule.readVarInt(p86, var2370)
				local _ = var2378
				var2370 = var2379
			end
		end
		if var2371 == protoModule.wireTypes.lengthDelimited then
			if var2375 == 1 then
				local _ = nil
				local var2380, var2381 = protoModule.readBuffer(p86, var2370)
				var2370 = var2381
				table.insert(var2369.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var2380))
			elseif var2375 == 2 then
				local _ = nil
				local var2382, var2383 = protoModule.readBuffer(p86, var2370)
				var2370 = var2383
				var2369.active_category_id = buffer.tostring(var2382)
			else
				local _ = nil
				local var2384, var2385 = protoModule.readVarInt(p86, var2370)
				var2370 = var2385 + var2384
			end
		elseif var2371 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2386, var2387 = protoModule.readFixed32(p86, var2370)
			local _ = var2386
			var2370 = var2387
		elseif var2371 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2388, var2389 = protoModule.readFixed64(p86, var2370)
			local _ = var2388
			var2370 = var2389
		else
			error("Unsupported wire type: " .. var3496)
		end
	end
	return var2369
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
	local var2390 = t_86.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2390.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var2390.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var2390.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var2390.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var2390.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var2390.active_tooltip_idx = self.activeTooltipIdx
	end
	return var2390
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
	local var2391 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2392, var2393 = protoModule.writeTag(buff, var2391, 1, protoModule.wireTypes.lengthDelimited)
		var2392, var3523 = protoModule.writeString(var2392, var2393, self.marketplace_catalog_category_item_id)
		buff = var2392
		var2391 = var2393
	end
	local buff_1 = buffer.create(var2391)
	buffer.copy(buff_1, 0, buff, 0, var2391)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref)
	local var2391 = t_87.new()
	local var2392 = 0
	while var2392 < buffer.len(p87) do
		local _ = nil
		local var2393 = nil
		local var2394, var2395, var2396 = protoModule.readTag(p87, var2392)
		local var2397 = var2394
		var2393 = var2395
		var2392 = var2396
		
		if var2393 == protoModule.wireTypes.varint then
			local _ = nil
			local var2398, var2399 = protoModule.readVarInt(p87, var2392)
			local _ = var2398
			var2392 = var2399
			continue
		end
		if var2393 == protoModule.wireTypes.lengthDelimited then
			if var2397 == 1 then
				local _ = nil
				local var2400, var2401 = protoModule.readBuffer(p87, var2392)
				var2392 = var2401
				var2391.marketplace_catalog_category_item_id = buffer.tostring(var2400)
			else
				local _ = nil
				local var2402, var2403 = protoModule.readVarInt(p87, var2392)
				var2392 = var2403 + var2402
			end
		elseif var2393 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2404, var2405 = protoModule.readFixed32(p87, var2392)
			local _ = var2404
			var2392 = var2405
		elseif var2393 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2406, var2407 = protoModule.readFixed64(p87, var2392)
			local _ = var2406
			var2392 = var2407
		else
			error("Unsupported wire type: " .. var3527)
		end
	end
	return var2391
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
	local var2408 = t_87.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var2408.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var2408.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var2408
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
	local var2408 = 0
	
	if self.hero_icon ~= nil then
		local var2409, var2410 = protoModule.writeTag(buff, var2408, 1, protoModule.wireTypes.lengthDelimited)
		var2409, var3547 = protoModule.writeString(var2409, var2410, self.hero_icon)
		buff = var2409
		var2408 = var2410
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var2411, var2412 = protoModule.writeTag(buff, var2408, 2, protoModule.wireTypes.lengthDelimited)
		var2411, var3549 = protoModule.writeString(var2411, var2412, self.body_dismiss_button_text)
		buff = var2411
		var2408 = var2412
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var2413, var2414 = protoModule.writeTag(buff, var2408, 3, protoModule.wireTypes.lengthDelimited)
		var2413, var3551 = protoModule.writeString(var2413, var2414, self.body_title)
		buff = var2413
		var2408 = var2414
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var2415, var2416 = protoModule.writeTag(buff, var2408, 4, protoModule.wireTypes.lengthDelimited)
		var2415, var3553 = protoModule.writeString(var2415, var2416, self.body_rich_text)
		buff = var2415
		var2408 = var2416
	end
	if self.terms_link_text ~= nil then
		local var2417, var2418 = protoModule.writeTag(buff, var2408, 5, protoModule.wireTypes.lengthDelimited)
		var2417, var3555 = protoModule.writeString(var2417, var2418, self.terms_link_text)
		buff = var2417
		var2408 = var2418
	end
	if self.terms_title ~= nil then
		local var2419, var2420 = protoModule.writeTag(buff, var2408, 6, protoModule.wireTypes.lengthDelimited)
		var2419, var3557 = protoModule.writeString(var2419, var2420, self.terms_title)
		buff = var2419
		var2408 = var2420
	end
	if self.terms_body_rich_text ~= nil then
		local var2421, var2422 = protoModule.writeTag(buff, var2408, 7, protoModule.wireTypes.lengthDelimited)
		var2421, var3559 = protoModule.writeString(var2421, var2422, self.terms_body_rich_text)
		buff = var2421
		var2408 = var2422
	end
	if self.terms_dismiss_button_text ~= nil then
		local var2423, var2424 = protoModule.writeTag(buff, var2408, 8, protoModule.wireTypes.lengthDelimited)
		var2423, var3561 = protoModule.writeString(var2423, var2424, self.terms_dismiss_button_text)
		buff = var2423
		var2408 = var2424
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var2425, var2426 = protoModule.writeTag(buff, var2408, 9, protoModule.wireTypes.lengthDelimited)
		var2425, var3563 = protoModule.writeString(var2425, var2426, self.offer_id)
		buff = var2425
		var2408 = var2426
	end
	local buff_1 = buffer.create(var2408)
	buffer.copy(buff_1, 0, buff, 0, var2408)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref)
	local var2408 = t_88.new()
	local var2409 = 0
	while var2409 < buffer.len(p88) do
		local _ = nil
		local var2410 = nil
		local var2411, var2412, var2413 = protoModule.readTag(p88, var2409)
		local var2414 = var2411
		var2410 = var2412
		var2409 = var2413
		
		if var2410 == protoModule.wireTypes.varint then
			local _ = nil
			local var2415, var2416 = protoModule.readVarInt(p88, var2409)
			local _ = var2415
			var2409 = var2416
			continue
		end
		if var2410 == protoModule.wireTypes.lengthDelimited then
			if var2414 == 1 then
				local _ = nil
				local var2417, var2418 = protoModule.readBuffer(p88, var2409)
				var2409 = var2418
				var2408.hero_icon = buffer.tostring(var2417)
			elseif var2414 == 2 then
				local _ = nil
				local var2419, var2420 = protoModule.readBuffer(p88, var2409)
				var2409 = var2420
				var2408.body_dismiss_button_text = buffer.tostring(var2419)
			elseif var2414 == 3 then
				local _ = nil
				local var2421, var2422 = protoModule.readBuffer(p88, var2409)
				var2409 = var2422
				var2408.body_title = buffer.tostring(var2421)
			elseif var2414 == 4 then
				local _ = nil
				local var2423, var2424 = protoModule.readBuffer(p88, var2409)
				var2409 = var2424
				var2408.body_rich_text = buffer.tostring(var2423)
			elseif var2414 == 5 then
				local _ = nil
				local var2425, var2426 = protoModule.readBuffer(p88, var2409)
				var2409 = var2426
				var2408.terms_link_text = buffer.tostring(var2425)
			elseif var2414 == 6 then
				local _ = nil
				local var2427, var2428 = protoModule.readBuffer(p88, var2409)
				var2409 = var2428
				var2408.terms_title = buffer.tostring(var2427)
			elseif var2414 == 7 then
				local _ = nil
				local var2429, var2430 = protoModule.readBuffer(p88, var2409)
				var2409 = var2430
				var2408.terms_body_rich_text = buffer.tostring(var2429)
			elseif var2414 == 8 then
				local _ = nil
				local var2431, var2432 = protoModule.readBuffer(p88, var2409)
				var2409 = var2432
				var2408.terms_dismiss_button_text = buffer.tostring(var2431)
			elseif var2414 == 9 then
				local _ = nil
				local var2433, var2434 = protoModule.readBuffer(p88, var2409)
				var2409 = var2434
				var2408.offer_id = buffer.tostring(var2433)
			else
				local _ = nil
				local var2435, var2436 = protoModule.readVarInt(p88, var2409)
				var2409 = var2436 + var2435
			end
		elseif var2410 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2437, var2438 = protoModule.readFixed32(p88, var2409)
			local _ = var2437
			var2409 = var2438
		elseif var2410 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2439, var2440 = protoModule.readFixed64(p88, var2409)
			local _ = var2439
			var2409 = var2440
		else
			error("Unsupported wire type: " .. var3567)
		end
	end
	return var2408
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
	local var2441 = t_88.new()
	
	if self.hero_icon ~= nil then
		var2441.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var2441.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var2441.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var2441.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var2441.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var2441.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var2441.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var2441.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var2441.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var2441.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var2441.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var2441.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var2441.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var2441.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var2441.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var2441.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var2441.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var2441.offer_id = self.offerId
	end
	return var2441
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
	local var2441 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2442 = v:encode()
			local var2443, var2444 = protoModule.writeTag(buff, var2441, 1, protoModule.wireTypes.lengthDelimited)
			var2443, var3604 = protoModule.writeBuffer(var2443, var2444, var2442, buffer.len(var2442))
			buff = var2443
			var2441 = var2444
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var2445, var2446 = protoModule.writeTag(buff, var2441, 2, protoModule.wireTypes.varint)
		var2445, var3606 = protoModule.writeVarInt(var2445, var2446, self.preview_columns)
		buff = var2445
		var2441 = var2446
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var2447, var2448 = protoModule.writeTag(buff, var2441, 3, protoModule.wireTypes.lengthDelimited)
		var2447, var3608 = protoModule.writeString(var2447, var2448, self.impression_id)
		buff = var2447
		var2441 = var2448
	end
	local buff_1 = buffer.create(var2441)
	buffer.copy(buff_1, 0, buff, 0, var2441)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var2449 = t_89.new()
	local var2450 = 0
	while var2450 < buffer.len(p89) do
		local _ = nil
		local var2451 = nil
		local var2452, var2453, var2454 = protoModule.readTag(p89, var2450)
		local var2455 = var2452
		var2451 = var2453
		var2450 = var2454
		
		if var2451 == protoModule.wireTypes.varint then
			if var2455 == 2 then
				local _ = nil
				local var2456, var2457 = protoModule.readVarIntI32(p89, var2450)
				var2450 = var2457
				var2449.preview_columns = var2456
			else
				local _ = nil
				local var2458, var2459 = protoModule.readVarInt(p89, var2450)
				local _ = var2458
				var2450 = var2459
			end
		end
		if var2451 == protoModule.wireTypes.lengthDelimited then
			if var2455 == 1 then
				local _ = nil
				local var2460, var2461 = protoModule.readBuffer(p89, var2450)
				var2450 = var2461
				table.insert(var2449.items, t.CatalogItemGridInputData_CatalogItem.decode(var2460))
			elseif var2455 == 3 then
				local _ = nil
				local var2462, var2463 = protoModule.readBuffer(p89, var2450)
				var2450 = var2463
				var2449.impression_id = buffer.tostring(var2462)
			else
				local _ = nil
				local var2464, var2465 = protoModule.readVarInt(p89, var2450)
				var2450 = var2465 + var2464
			end
		elseif var2451 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2466, var2467 = protoModule.readFixed32(p89, var2450)
			local _ = var2466
			var2450 = var2467
		elseif var2451 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2468, var2469 = protoModule.readFixed64(p89, var2450)
			local _ = var2468
			var2450 = var2469
		else
			error("Unsupported wire type: " .. var3612)
		end
	end
	return var2449
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
	local var2470 = t_89.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var2470.items = t_1
	end
	if self.preview_columns ~= nil then
		var2470.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var2470.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var2470.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var2470.impression_id = self.impressionId
	end
	return var2470
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
	local var2471 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2472, var2473 = protoModule.writeTag(buff, var2471, 1, protoModule.wireTypes.lengthDelimited)
		var2472, var3638 = protoModule.writeString(var2472, var2473, self.id)
		buff = var2472
		var2471 = var2473
	end
	if self.type ~= nil and self.type ~= "" then
		local var2474, var2475 = protoModule.writeTag(buff, var2471, 2, protoModule.wireTypes.lengthDelimited)
		var2474, var3640 = protoModule.writeString(var2474, var2475, self.type)
		buff = var2474
		var2471 = var2475
	end
	local buff_1 = buffer.create(var2471)
	buffer.copy(buff_1, 0, buff, 0, var2471)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var2471 = t_90.new()
	local var2472 = 0
	while var2472 < buffer.len(p90) do
		local _ = nil
		local var2473 = nil
		local var2474, var2475, var2476 = protoModule.readTag(p90, var2472)
		local var2477 = var2474
		var2473 = var2475
		var2472 = var2476
		
		if var2473 == protoModule.wireTypes.varint then
			local _ = nil
			local var2478, var2479 = protoModule.readVarInt(p90, var2472)
			local _ = var2478
			var2472 = var2479
			continue
		end
		if var2473 == protoModule.wireTypes.lengthDelimited then
			if var2477 == 1 then
				local _ = nil
				local var2480, var2481 = protoModule.readBuffer(p90, var2472)
				var2472 = var2481
				var2471.id = buffer.tostring(var2480)
			elseif var2477 == 2 then
				local _ = nil
				local var2482, var2483 = protoModule.readBuffer(p90, var2472)
				var2472 = var2483
				var2471.type = buffer.tostring(var2482)
			else
				local _ = nil
				local var2484, var2485 = protoModule.readVarInt(p90, var2472)
				var2472 = var2485 + var2484
			end
		elseif var2473 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2486, var2487 = protoModule.readFixed32(p90, var2472)
			local _ = var2486
			var2472 = var2487
		elseif var2473 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2488, var2489 = protoModule.readFixed64(p90, var2472)
			local _ = var2488
			var2472 = var2489
		else
			error("Unsupported wire type: " .. var3644)
		end
	end
	return var2471
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
	local var2490 = t_90.new()
	
	if self.id ~= nil then
		var2490.id = self.id
	end
	if self.type ~= nil then
		var2490.type = self.type
	end
	return var2490
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
	local var2490 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2491, var2492 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2491, var3666 = protoModule.writeString(var2491, var2492, i)
			local var2493 = v:encode()
			var2492, var3668 = protoModule.writeTag(var2491, var2492, 2, protoModule.wireTypes.lengthDelimited)
			var2492, var3668 = protoModule.writeBuffer(var2492, var3668, var2493, buffer.len(var2493))
			local var2494 = var2492
			local var2495 = var3668
			local var2496, var2497 = protoModule.writeTag(buff, var2490, 1, protoModule.wireTypes.lengthDelimited)
			var2496, var3672 = protoModule.writeBuffer(var2496, var2497, var2494, var2495)
			buff = var2496
			var2490 = var2497
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2498, var2499 = protoModule.writeTag(buff, var2490, 2, protoModule.wireTypes.lengthDelimited)
			var2498, var3674 = protoModule.writeString(var2498, var2499, v)
			buff = var2498
			var2490 = var2499
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2500, var2501 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2500, var3676 = protoModule.writeString(var2500, var2501, i)
			local var2502 = v:encode()
			var2501, var3678 = protoModule.writeTag(var2500, var2501, 2, protoModule.wireTypes.lengthDelimited)
			var2501, var3678 = protoModule.writeBuffer(var2501, var3678, var2502, buffer.len(var2502))
			local var2503 = var2501
			local var2504 = var3678
			local var2505, var2506 = protoModule.writeTag(buff, var2490, 3, protoModule.wireTypes.lengthDelimited)
			var2505, var3682 = protoModule.writeBuffer(var2505, var2506, var2503, var2504)
			buff = var2505
			var2490 = var2506
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var2507, var2508 = protoModule.writeTag(buff, var2490, 4, protoModule.wireTypes.lengthDelimited)
		var2507, var3684 = protoModule.writeString(var2507, var2508, self.search_session_id)
		buff = var2507
		var2490 = var2508
	end
	local buff_1 = buffer.create(var2490)
	buffer.copy(buff_1, 0, buff, 0, var2490)
	
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
			local _ = nil
			local var2516, var2517 = protoModule.readVarInt(p91, var2510)
			local _ = var2516
			var2510 = var2517
			continue
		end
		if var2511 == protoModule.wireTypes.lengthDelimited then
			if var2515 == 1 then
				local _ = nil
				local var2518, var2519 = protoModule.readBuffer(p91, var2510)
				var2510 = var2519
				var2518 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var2518)
				var2509.entry_map[var2518.key or ""] = var2518.value or t.FeedEntry.new()
			elseif var2515 == 2 then
				local _ = nil
				local var2520, var2521 = protoModule.readBuffer(p91, var2510)
				var2510 = var2521
				table.insert(var2509.entry_order, buffer.tostring(var2520))
			elseif var2515 == 3 then
				local _ = nil
				local var2522, var2523 = protoModule.readBuffer(p91, var2510)
				var2510 = var2523
				var2522 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var2522)
				var2509.content_pools[var2522.key or ""] = var2522.value or t.ContentPool.new()
			elseif var2515 == 4 then
				local _ = nil
				local var2524, var2525 = protoModule.readBuffer(p91, var2510)
				var2510 = var2525
				var2509.search_session_id = buffer.tostring(var2524)
			else
				local _ = nil
				local var2526, var2527 = protoModule.readVarInt(p91, var2510)
				var2510 = var2527 + var2526
			end
		elseif var2511 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2528, var2529 = protoModule.readFixed32(p91, var2510)
			local _ = var2528
			var2510 = var2529
		elseif var2511 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2530, var2531 = protoModule.readFixed64(p91, var2510)
			local _ = var2530
			var2510 = var2531
		else
			error("Unsupported wire type: " .. var3688)
		end
	end
	return var2509
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
	local var2532 = t_91.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2532.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2532.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2532.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2532.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2532.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2532.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var2532.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var2532.search_session_id = self.searchSessionId
	end
	return var2532
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
	local var2533 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2534, var2535 = protoModule.writeTag(buff, var2533, 1, protoModule.wireTypes.lengthDelimited)
		var2534, var3723 = protoModule.writeString(var2534, var2535, self.key)
		buff = var2534
		var2533 = var2535
	end
	if self.value ~= nil then
		local var2536 = self.value:encode()
		local var2537, var2538 = protoModule.writeTag(buff, var2533, 2, protoModule.wireTypes.lengthDelimited)
		var2537, var3726 = protoModule.writeBuffer(var2537, var2538, var2536, buffer.len(var2536))
		buff = var2537
		var2533 = var2538
	end
	local buff_1 = buffer.create(var2533)
	buffer.copy(buff_1, 0, buff, 0, var2533)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
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
				var2533.key = buffer.tostring(var2542)
			elseif var2539 == 2 then
				local _ = nil
				local var2544, var2545 = protoModule.readBuffer(p92, var2534)
				var2534 = var2545
				var2533.value = t.FeedEntry.decode(var2544)
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
			error("Unsupported wire type: " .. var3730)
		end
	end
	return var2533
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
	local var2552 = t_92.new()
	
	if self.key ~= nil then
		var2552.key = self.key
	end
	if self.value ~= nil then
		var2552.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2552
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
	local var2552 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2553, var2554 = protoModule.writeTag(buff, var2552, 1, protoModule.wireTypes.lengthDelimited)
		var2553, var3752 = protoModule.writeString(var2553, var2554, self.key)
		buff = var2553
		var2552 = var2554
	end
	if self.value ~= nil then
		local var2555 = self.value:encode()
		local var2556, var2557 = protoModule.writeTag(buff, var2552, 2, protoModule.wireTypes.lengthDelimited)
		var2556, var3755 = protoModule.writeBuffer(var2556, var2557, var2555, buffer.len(var2555))
		buff = var2556
		var2552 = var2557
	end
	local buff_1 = buffer.create(var2552)
	buffer.copy(buff_1, 0, buff, 0, var2552)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2552 = t_93.new()
	local var2553 = 0
	while var2553 < buffer.len(p93) do
		local _ = nil
		local var2554 = nil
		local var2555, var2556, var2557 = protoModule.readTag(p93, var2553)
		local var2558 = var2555
		var2554 = var2556
		var2553 = var2557
		
		if var2554 == protoModule.wireTypes.varint then
			local _ = nil
			local var2559, var2560 = protoModule.readVarInt(p93, var2553)
			local _ = var2559
			var2553 = var2560
			continue
		end
		if var2554 == protoModule.wireTypes.lengthDelimited then
			if var2558 == 1 then
				local _ = nil
				local var2561, var2562 = protoModule.readBuffer(p93, var2553)
				var2553 = var2562
				var2552.key = buffer.tostring(var2561)
			elseif var2558 == 2 then
				local _ = nil
				local var2563, var2564 = protoModule.readBuffer(p93, var2553)
				var2553 = var2564
				var2552.value = t.ContentPool.decode(var2563)
			else
				local _ = nil
				local var2565, var2566 = protoModule.readVarInt(p93, var2553)
				var2553 = var2566 + var2565
			end
		elseif var2554 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2567, var2568 = protoModule.readFixed32(p93, var2553)
			local _ = var2567
			var2553 = var2568
		elseif var2554 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2569, var2570 = protoModule.readFixed64(p93, var2553)
			local _ = var2569
			var2553 = var2570
		else
			error("Unsupported wire type: " .. var3759)
		end
	end
	return var2552
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
	local var2571 = t_93.new()
	
	if self.key ~= nil then
		var2571.key = self.key
	end
	if self.value ~= nil then
		var2571.value = t.ContentPool.jsonDecode(self.value)
	end
	return var2571
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
	local var2571 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2572, var2573 = protoModule.writeTag(buff, var2571, 1, protoModule.wireTypes.lengthDelimited)
		var2572, var3781 = protoModule.writeString(var2572, var2573, self.universe_id)
		buff = var2572
		var2571 = var2573
	end
	if self.is_content_locked then
		local var2574, var2575 = protoModule.writeTag(buff, var2571, 2, protoModule.wireTypes.varint)
		var2574, var3783 = protoModule.writeVarInt(var2574, var2575, if self.is_content_locked then 1 else 0)
		buff = var2574
		var2571 = var2575
	end
	local buff_1 = buffer.create(var2571)
	buffer.copy(buff_1, 0, buff, 0, var2571)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref)
	local var2571 = t_94.new()
	local var2572 = 0
	while var2572 < buffer.len(p94) do
		local _ = nil
		local var2573 = nil
		local var2574, var2575, var2576 = protoModule.readTag(p94, var2572)
		local var2577 = var2574
		var2573 = var2575
		var2572 = var2576
		
		if var2573 == protoModule.wireTypes.varint then
			if var2577 == 2 then
				local _ = nil
				local var2578, var2579 = protoModule.readVarInt(p94, var2572)
				var2572 = var2579
				var2571.is_content_locked = var2578 ~= 0
			else
				local _ = nil
				local var2580, var2581 = protoModule.readVarInt(p94, var2572)
				local _ = var2580
				var2572 = var2581
			end
		end
		if var2573 == protoModule.wireTypes.lengthDelimited then
			if var2577 == 1 then
				local _ = nil
				local var2582, var2583 = protoModule.readBuffer(p94, var2572)
				var2572 = var2583
				var2571.universe_id = buffer.tostring(var2582)
			else
				local _ = nil
				local var2584, var2585 = protoModule.readVarInt(p94, var2572)
				var2572 = var2585 + var2584
			end
		elseif var2573 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2586, var2587 = protoModule.readFixed32(p94, var2572)
			local _ = var2586
			var2572 = var2587
		elseif var2573 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2588, var2589 = protoModule.readFixed64(p94, var2572)
			local _ = var2588
			var2572 = var2589
		else
			error("Unsupported wire type: " .. var3787)
		end
	end
	return var2571
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
	local var2590 = t_94.new()
	
	if self.universe_id ~= nil then
		var2590.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2590.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var2590.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var2590.is_content_locked = self.isContentLocked
	end
	return var2590
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
	local var2590 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2591, var2592 = protoModule.writeTag(buff, var2590, 1, protoModule.wireTypes.lengthDelimited)
		var2591, var3809 = protoModule.writeString(var2591, var2592, self.overview_rich_text)
		buff = var2591
		var2590 = var2592
	end
	if self.result_entry ~= nil then
		local var2593 = self.result_entry:encode()
		local var2594, var2595 = protoModule.writeTag(buff, var2590, 2, protoModule.wireTypes.lengthDelimited)
		var2594, var3812 = protoModule.writeBuffer(var2594, var2595, var2593, buffer.len(var2593))
		buff = var2594
		var2590 = var2595
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var2596, var2597 = protoModule.writeTag(buff, var2590, 3, protoModule.wireTypes.lengthDelimited)
			var2596, var3814 = protoModule.writeString(var2596, var2597, v)
			buff = var2596
			var2590 = var2597
		end
	end
	if self.show_loading then
		local var2598, var2599 = protoModule.writeTag(buff, var2590, 4, protoModule.wireTypes.varint)
		var2598, var3816 = protoModule.writeVarInt(var2598, var2599, if self.show_loading then 1 else 0)
		buff = var2598
		var2590 = var2599
	end
	if self.title ~= nil and self.title ~= "" then
		local var2600, var2601 = protoModule.writeTag(buff, var2590, 5, protoModule.wireTypes.lengthDelimited)
		var2600, var3818 = protoModule.writeString(var2600, var2601, self.title)
		buff = var2600
		var2590 = var2601
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var2602, var2603 = protoModule.writeTag(buff, var2590, 6, protoModule.wireTypes.lengthDelimited)
		var2602, var3820 = protoModule.writeString(var2602, var2603, self.search_query)
		buff = var2602
		var2590 = var2603
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var2604, var2605 = protoModule.writeTag(buff, var2590, 8, protoModule.wireTypes.lengthDelimited)
		var2604, var3822 = protoModule.writeString(var2604, var2605, self.universe_ids)
		buff = var2604
		var2590 = var2605
	end
	local buff_1 = buffer.create(var2590)
	buffer.copy(buff_1, 0, buff, 0, var2590)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2606 = t_95.new()
	local var2607 = 0
	while var2607 < buffer.len(p95) do
		local _ = nil
		local var2608 = nil
		local var2609, var2610, var2611 = protoModule.readTag(p95, var2607)
		local var2612 = var2609
		var2608 = var2610
		var2607 = var2611
		
		if var2608 == protoModule.wireTypes.varint then
			if var2612 == 4 then
				local _ = nil
				local var2613, var2614 = protoModule.readVarInt(p95, var2607)
				var2607 = var2614
				var2606.show_loading = var2613 ~= 0
			else
				local _ = nil
				local var2615, var2616 = protoModule.readVarInt(p95, var2607)
				local _ = var2615
				var2607 = var2616
			end
		end
		if var2608 == protoModule.wireTypes.lengthDelimited then
			if var2612 == 1 then
				local _ = nil
				local var2617, var2618 = protoModule.readBuffer(p95, var2607)
				var2607 = var2618
				var2606.overview_rich_text = buffer.tostring(var2617)
			elseif var2612 == 2 then
				local _ = nil
				local var2619, var2620 = protoModule.readBuffer(p95, var2607)
				var2607 = var2620
				var2606.result_entry = t.FeedEntry.decode(var2619)
			elseif var2612 == 3 then
				local _ = nil
				local var2621, var2622 = protoModule.readBuffer(p95, var2607)
				var2607 = var2622
				table.insert(var2606.follow_up_queries, buffer.tostring(var2621))
			elseif var2612 == 5 then
				local _ = nil
				local var2623, var2624 = protoModule.readBuffer(p95, var2607)
				var2607 = var2624
				var2606.title = buffer.tostring(var2623)
			elseif var2612 == 6 then
				local _ = nil
				local var2625, var2626 = protoModule.readBuffer(p95, var2607)
				var2607 = var2626
				var2606.search_query = buffer.tostring(var2625)
			elseif var2612 == 8 then
				local _ = nil
				local var2627, var2628 = protoModule.readBuffer(p95, var2607)
				var2607 = var2628
				var2606.universe_ids = buffer.tostring(var2627)
			else
				local _ = nil
				local var2629, var2630 = protoModule.readVarInt(p95, var2607)
				var2607 = var2630 + var2629
			end
		elseif var2608 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2631, var2632 = protoModule.readFixed32(p95, var2607)
			local _ = var2631
			var2607 = var2632
		elseif var2608 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2633, var2634 = protoModule.readFixed64(p95, var2607)
			local _ = var2633
			var2607 = var2634
		else
			error("Unsupported wire type: " .. var3826)
		end
	end
	return var2606
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
	local var2635 = t_95.new()
	
	if self.overview_rich_text ~= nil then
		var2635.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var2635.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var2635.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var2635.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var2635.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var2635.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var2635.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var2635.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var2635.title = self.title
	end
	if self.search_query ~= nil then
		var2635.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var2635.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var2635.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var2635.universe_ids = self.universeIds
	end
	return var2635
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
	local var2636 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2637, var2638 = protoModule.writeTag(buff, var2636, 1, protoModule.wireTypes.lengthDelimited)
		var2637, var3861 = protoModule.writeString(var2637, var2638, self.title)
		buff = var2637
		var2636 = var2638
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var2639 = v:encode()
			local var2640, var2641 = protoModule.writeTag(buff, var2636, 2, protoModule.wireTypes.lengthDelimited)
			var2640, var3864 = protoModule.writeBuffer(var2640, var2641, var2639, buffer.len(var2639))
			buff = var2640
			var2636 = var2641
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2642, var2643 = protoModule.writeTag(buff, var2636, 3, protoModule.wireTypes.varint)
		var2642, var3866 = protoModule.writeVarInt(var2642, var2643, self.max_visible_rows)
		buff = var2642
		var2636 = var2643
	end
	if self.sort_id ~= nil then
		local var2644, var2645 = protoModule.writeTag(buff, var2636, 4, protoModule.wireTypes.lengthDelimited)
		var2644, var3868 = protoModule.writeString(var2644, var2645, self.sort_id)
		buff = var2644
		var2636 = var2645
	end
	local buff_1 = buffer.create(var2636)
	buffer.copy(buff_1, 0, buff, 0, var2636)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var2646 = t_96.new()
	local var2647 = 0
	while var2647 < buffer.len(p96) do
		local _ = nil
		local var2648 = nil
		local var2649, var2650, var2651 = protoModule.readTag(p96, var2647)
		local var2652 = var2649
		var2648 = var2650
		var2647 = var2651
		
		if var2648 == protoModule.wireTypes.varint then
			if var2652 == 3 then
				local _ = nil
				local var2653, var2654 = protoModule.readVarIntI32(p96, var2647)
				var2647 = var2654
				var2646.max_visible_rows = var2653
			else
				local _ = nil
				local var2655, var2656 = protoModule.readVarInt(p96, var2647)
				local _ = var2655
				var2647 = var2656
			end
		end
		if var2648 == protoModule.wireTypes.lengthDelimited then
			if var2652 == 1 then
				local _ = nil
				local var2657, var2658 = protoModule.readBuffer(p96, var2647)
				var2647 = var2658
				var2646.title = buffer.tostring(var2657)
			elseif var2652 == 2 then
				local _ = nil
				local var2659, var2660 = protoModule.readBuffer(p96, var2647)
				var2647 = var2660
				table.insert(var2646.user_items, t.UserListInputData_UserItem.decode(var2659))
			elseif var2652 == 4 then
				local _ = nil
				local var2661, var2662 = protoModule.readBuffer(p96, var2647)
				var2647 = var2662
				var2646.sort_id = buffer.tostring(var2661)
			else
				local _ = nil
				local var2663, var2664 = protoModule.readVarInt(p96, var2647)
				var2647 = var2664 + var2663
			end
		elseif var2648 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2665, var2666 = protoModule.readFixed32(p96, var2647)
			local _ = var2665
			var2647 = var2666
		elseif var2648 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2667, var2668 = protoModule.readFixed64(p96, var2647)
			local _ = var2667
			var2647 = var2668
		else
			error("Unsupported wire type: " .. var3872)
		end
	end
	return var2646
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
	local var2669 = t_96.new()
	
	if self.title ~= nil then
		var2669.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2669.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var2669.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2669.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2669.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2669.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2669.sort_id = self.sortId
	end
	return var2669
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
	local var2670 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2671, var2672 = protoModule.writeTag(buff, var2670, 1, protoModule.wireTypes.lengthDelimited)
		var2671, var3901 = protoModule.writeString(var2671, var2672, self.user_id)
		buff = var2671
		var2670 = var2672
	end
	local buff_1 = buffer.create(var2670)
	buffer.copy(buff_1, 0, buff, 0, var2670)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref)
	local var2670 = t_97.new()
	local var2671 = 0
	while var2671 < buffer.len(p97) do
		local _ = nil
		local var2672 = nil
		local var2673, var2674, var2675 = protoModule.readTag(p97, var2671)
		local var2676 = var2673
		var2672 = var2674
		var2671 = var2675
		
		if var2672 == protoModule.wireTypes.varint then
			local _ = nil
			local var2677, var2678 = protoModule.readVarInt(p97, var2671)
			local _ = var2677
			var2671 = var2678
			continue
		end
		if var2672 == protoModule.wireTypes.lengthDelimited then
			if var2676 == 1 then
				local _ = nil
				local var2679, var2680 = protoModule.readBuffer(p97, var2671)
				var2671 = var2680
				var2670.user_id = buffer.tostring(var2679)
			else
				local _ = nil
				local var2681, var2682 = protoModule.readVarInt(p97, var2671)
				var2671 = var2682 + var2681
			end
		elseif var2672 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2683, var2684 = protoModule.readFixed32(p97, var2671)
			local _ = var2683
			var2671 = var2684
		elseif var2672 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2685, var2686 = protoModule.readFixed64(p97, var2671)
			local _ = var2685
			var2671 = var2686
		else
			error("Unsupported wire type: " .. var3905)
		end
	end
	return var2670
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
	local var2687 = t_97.new()
	
	if self.user_id ~= nil then
		var2687.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2687.user_id = self.userId
	end
	return var2687
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
	local var2687 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2688, var2689 = protoModule.writeTag(buff, var2687, 1, protoModule.wireTypes.lengthDelimited)
		var2688, var3925 = protoModule.writeString(var2688, var2689, self.title)
		buff = var2688
		var2687 = var2689
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2690 = v:encode()
			local var2691, var2692 = protoModule.writeTag(buff, var2687, 2, protoModule.wireTypes.lengthDelimited)
			var2691, var3928 = protoModule.writeBuffer(var2691, var2692, var2690, buffer.len(var2690))
			buff = var2691
			var2687 = var2692
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var2693, var2694 = protoModule.writeTag(buff, var2687, 3, protoModule.wireTypes.varint)
		var2693, var3930 = protoModule.writeVarInt(var2693, var2694, self.max_visible_rows)
		buff = var2693
		var2687 = var2694
	end
	if self.sort_id ~= nil then
		local var2695, var2696 = protoModule.writeTag(buff, var2687, 4, protoModule.wireTypes.lengthDelimited)
		var2695, var3932 = protoModule.writeString(var2695, var2696, self.sort_id)
		buff = var2695
		var2687 = var2696
	end
	local buff_1 = buffer.create(var2687)
	buffer.copy(buff_1, 0, buff, 0, var2687)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var2697 = t_98.new()
	local var2698 = 0
	while var2698 < buffer.len(p98) do
		local _ = nil
		local var2699 = nil
		local var2700, var2701, var2702 = protoModule.readTag(p98, var2698)
		local var2703 = var2700
		var2699 = var2701
		var2698 = var2702
		
		if var2699 == protoModule.wireTypes.varint then
			if var2703 == 3 then
				local _ = nil
				local var2704, var2705 = protoModule.readVarIntI32(p98, var2698)
				var2698 = var2705
				var2697.max_visible_rows = var2704
			else
				local _ = nil
				local var2706, var2707 = protoModule.readVarInt(p98, var2698)
				local _ = var2706
				var2698 = var2707
			end
		end
		if var2699 == protoModule.wireTypes.lengthDelimited then
			if var2703 == 1 then
				local _ = nil
				local var2708, var2709 = protoModule.readBuffer(p98, var2698)
				var2698 = var2709
				var2697.title = buffer.tostring(var2708)
			elseif var2703 == 2 then
				local _ = nil
				local var2710, var2711 = protoModule.readBuffer(p98, var2698)
				var2698 = var2711
				table.insert(var2697.items, t.CatalogItemListInputData_CatalogItem.decode(var2710))
			elseif var2703 == 4 then
				local _ = nil
				local var2712, var2713 = protoModule.readBuffer(p98, var2698)
				var2698 = var2713
				var2697.sort_id = buffer.tostring(var2712)
			else
				local _ = nil
				local var2714, var2715 = protoModule.readVarInt(p98, var2698)
				var2698 = var2715 + var2714
			end
		elseif var2699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2716, var2717 = protoModule.readFixed32(p98, var2698)
			local _ = var2716
			var2698 = var2717
		elseif var2699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2718, var2719 = protoModule.readFixed64(p98, var2698)
			local _ = var2718
			var2698 = var2719
		else
			error("Unsupported wire type: " .. var3936)
		end
	end
	return var2697
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
	local var2720 = t_98.new()
	
	if self.title ~= nil then
		var2720.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var2720.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var2720.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var2720.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var2720.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2720.sort_id = self.sortId
	end
	return var2720
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
	local var2721 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2722, var2723 = protoModule.writeTag(buff, var2721, 1, protoModule.wireTypes.lengthDelimited)
		var2722, var3964 = protoModule.writeString(var2722, var2723, self.item_id)
		buff = var2722
		var2721 = var2723
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2724, var2725 = protoModule.writeTag(buff, var2721, 2, protoModule.wireTypes.lengthDelimited)
		var2724, var3966 = protoModule.writeString(var2724, var2725, self.item_type)
		buff = var2724
		var2721 = var2725
	end
	local buff_1 = buffer.create(var2721)
	buffer.copy(buff_1, 0, buff, 0, var2721)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var2721 = t_99.new()
	local var2722 = 0
	while var2722 < buffer.len(p99) do
		local _ = nil
		local var2723 = nil
		local var2724, var2725, var2726 = protoModule.readTag(p99, var2722)
		local var2727 = var2724
		var2723 = var2725
		var2722 = var2726
		
		if var2723 == protoModule.wireTypes.varint then
			local _ = nil
			local var2728, var2729 = protoModule.readVarInt(p99, var2722)
			local _ = var2728
			var2722 = var2729
			continue
		end
		if var2723 == protoModule.wireTypes.lengthDelimited then
			if var2727 == 1 then
				local _ = nil
				local var2730, var2731 = protoModule.readBuffer(p99, var2722)
				var2722 = var2731
				var2721.item_id = buffer.tostring(var2730)
			elseif var2727 == 2 then
				local _ = nil
				local var2732, var2733 = protoModule.readBuffer(p99, var2722)
				var2722 = var2733
				var2721.item_type = buffer.tostring(var2732)
			else
				local _ = nil
				local var2734, var2735 = protoModule.readVarInt(p99, var2722)
				var2722 = var2735 + var2734
			end
		elseif var2723 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2736, var2737 = protoModule.readFixed32(p99, var2722)
			local _ = var2736
			var2722 = var2737
		elseif var2723 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2738, var2739 = protoModule.readFixed64(p99, var2722)
			local _ = var2738
			var2722 = var2739
		else
			error("Unsupported wire type: " .. var3970)
		end
	end
	return var2721
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
	local var2740 = t_99.new()
	
	if self.item_id ~= nil then
		var2740.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2740.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var2740.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2740.item_type = self.itemType
	end
	return var2740
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
	local var2740 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2741, var2742 = protoModule.writeTag(buff, var2740, 1, protoModule.wireTypes.lengthDelimited)
		var2741, var3992 = protoModule.writeString(var2741, var2742, self.universe_id)
		buff = var2741
		var2740 = var2742
	end
	local buff_1 = buffer.create(var2740)
	buffer.copy(buff_1, 0, buff, 0, var2740)
	
	return buff_1
end

function t_100.decode(p100)
	-- upvalues: t_100 (ref), protoModule (ref)
	local var2740 = t_100.new()
	local var2741 = 0
	while var2741 < buffer.len(p100) do
		local _ = nil
		local var2742 = nil
		local var2743, var2744, var2745 = protoModule.readTag(p100, var2741)
		local var2746 = var2743
		var2742 = var2744
		var2741 = var2745
		
		if var2742 == protoModule.wireTypes.varint then
			local _ = nil
			local var2747, var2748 = protoModule.readVarInt(p100, var2741)
			local _ = var2747
			var2741 = var2748
			continue
		end
		if var2742 == protoModule.wireTypes.lengthDelimited then
			if var2746 == 1 then
				local _ = nil
				local var2749, var2750 = protoModule.readBuffer(p100, var2741)
				var2741 = var2750
				var2740.universe_id = buffer.tostring(var2749)
			else
				local _ = nil
				local var2751, var2752 = protoModule.readVarInt(p100, var2741)
				var2741 = var2752 + var2751
			end
		elseif var2742 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2753, var2754 = protoModule.readFixed32(p100, var2741)
			local _ = var2753
			var2741 = var2754
		elseif var2742 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2755, var2756 = protoModule.readFixed64(p100, var2741)
			local _ = var2755
			var2741 = var2756
		else
			error("Unsupported wire type: " .. var3996)
		end
	end
	return var2740
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
	local var2757 = t_100.new()
	
	if self.universe_id ~= nil then
		var2757.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2757.universe_id = self.universeId
	end
	return var2757
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
	local var2757 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2758, var2759 = protoModule.writeTag(buff, var2757, 1, protoModule.wireTypes.lengthDelimited)
		var2758, var4016 = protoModule.writeString(var2758, var2759, self.title)
		buff = var2758
		var2757 = var2759
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2760, var2761 = protoModule.writeTag(buff, var2757, 2, protoModule.wireTypes.lengthDelimited)
		var2760, var4018 = protoModule.writeString(var2760, var2761, self.subtitle)
		buff = var2760
		var2757 = var2761
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var2762 = v:encode()
			local var2763, var2764 = protoModule.writeTag(buff, var2757, 3, protoModule.wireTypes.lengthDelimited)
			var2763, var4021 = protoModule.writeBuffer(var2763, var2764, var2762, buffer.len(var2762))
			buff = var2763
			var2757 = var2764
		end
	end
	local buff_1 = buffer.create(var2757)
	buffer.copy(buff_1, 0, buff, 0, var2757)
	
	return buff_1
end

function t_101.decode(p101)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var2765 = t_101.new()
	local var2766 = 0
	while var2766 < buffer.len(p101) do
		local _ = nil
		local var2767 = nil
		local var2768, var2769, var2770 = protoModule.readTag(p101, var2766)
		local var2771 = var2768
		var2767 = var2769
		var2766 = var2770
		
		if var2767 == protoModule.wireTypes.varint then
			local _ = nil
			local var2772, var2773 = protoModule.readVarInt(p101, var2766)
			local _ = var2772
			var2766 = var2773
			continue
		end
		if var2767 == protoModule.wireTypes.lengthDelimited then
			if var2771 == 1 then
				local _ = nil
				local var2774, var2775 = protoModule.readBuffer(p101, var2766)
				var2766 = var2775
				var2765.title = buffer.tostring(var2774)
			elseif var2771 == 2 then
				local _ = nil
				local var2776, var2777 = protoModule.readBuffer(p101, var2766)
				var2766 = var2777
				var2765.subtitle = buffer.tostring(var2776)
			elseif var2771 == 3 then
				local _ = nil
				local var2778, var2779 = protoModule.readBuffer(p101, var2766)
				var2766 = var2779
				table.insert(var2765.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var2778))
			else
				local _ = nil
				local var2780, var2781 = protoModule.readVarInt(p101, var2766)
				var2766 = var2781 + var2780
			end
		elseif var2767 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2782, var2783 = protoModule.readFixed32(p101, var2766)
			local _ = var2782
			var2766 = var2783
		elseif var2767 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2784, var2785 = protoModule.readFixed64(p101, var2766)
			local _ = var2784
			var2766 = var2785
		else
			error("Unsupported wire type: " .. var4025)
		end
	end
	return var2765
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
	local var2786 = t_101.new()
	
	if self.title ~= nil then
		var2786.title = self.title
	end
	if self.subtitle ~= nil then
		var2786.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2786.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var2786.moment_items = t_1
	end
	return var2786
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
	local var2787 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2788, var2789 = protoModule.writeTag(buff, var2787, 1, protoModule.wireTypes.lengthDelimited)
		var2788, var4052 = protoModule.writeString(var2788, var2789, self.moment_id)
		buff = var2788
		var2787 = var2789
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2790, var2791 = protoModule.writeTag(buff, var2787, 2, protoModule.wireTypes.lengthDelimited)
		var2790, var4054 = protoModule.writeString(var2790, var2791, self.video_asset_id)
		buff = var2790
		var2787 = var2791
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var2792, var2793 = protoModule.writeTag(buff, var2787, 3, protoModule.wireTypes.lengthDelimited)
		var2792, var4056 = protoModule.writeString(var2792, var2793, self.target_universe_id)
		buff = var2792
		var2787 = var2793
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var2794, var2795 = protoModule.writeTag(buff, var2787, 4, protoModule.wireTypes.lengthDelimited)
		var2794, var4058 = protoModule.writeString(var2794, var2795, self.target_place_id)
		buff = var2794
		var2787 = var2795
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var2796, var2797 = protoModule.writeTag(buff, var2787, 5, protoModule.wireTypes.lengthDelimited)
		var2796, var4060 = protoModule.writeString(var2796, var2797, self.feed_item_id)
		buff = var2796
		var2787 = var2797
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var2798, var2799 = protoModule.writeTag(buff, var2787, 6, protoModule.wireTypes.lengthDelimited)
		var2798, var4062 = protoModule.writeString(var2798, var2799, self.capture_universe_id)
		buff = var2798
		var2787 = var2799
	end
	local buff_1 = buffer.create(var2787)
	buffer.copy(buff_1, 0, buff, 0, var2787)
	
	return buff_1
end

function t_102.decode(p102)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var2787 = t_102.new()
	local var2788 = 0
	while var2788 < buffer.len(p102) do
		local _ = nil
		local var2789 = nil
		local var2790, var2791, var2792 = protoModule.readTag(p102, var2788)
		local var2793 = var2790
		var2789 = var2791
		var2788 = var2792
		
		if var2789 == protoModule.wireTypes.varint then
			local _ = nil
			local var2794, var2795 = protoModule.readVarInt(p102, var2788)
			local _ = var2794
			var2788 = var2795
			continue
		end
		if var2789 == protoModule.wireTypes.lengthDelimited then
			if var2793 == 1 then
				local _ = nil
				local var2796, var2797 = protoModule.readBuffer(p102, var2788)
				var2788 = var2797
				var2787.moment_id = buffer.tostring(var2796)
			elseif var2793 == 2 then
				local _ = nil
				local var2798, var2799 = protoModule.readBuffer(p102, var2788)
				var2788 = var2799
				var2787.video_asset_id = buffer.tostring(var2798)
			elseif var2793 == 3 then
				local _ = nil
				local var2800, var2801 = protoModule.readBuffer(p102, var2788)
				var2788 = var2801
				var2787.target_universe_id = buffer.tostring(var2800)
			elseif var2793 == 4 then
				local _ = nil
				local var2802, var2803 = protoModule.readBuffer(p102, var2788)
				var2788 = var2803
				var2787.target_place_id = buffer.tostring(var2802)
			elseif var2793 == 5 then
				local _ = nil
				local var2804, var2805 = protoModule.readBuffer(p102, var2788)
				var2788 = var2805
				var2787.feed_item_id = buffer.tostring(var2804)
			elseif var2793 == 6 then
				local _ = nil
				local var2806, var2807 = protoModule.readBuffer(p102, var2788)
				var2788 = var2807
				var2787.capture_universe_id = buffer.tostring(var2806)
			else
				local _ = nil
				local var2808, var2809 = protoModule.readVarInt(p102, var2788)
				var2788 = var2809 + var2808
			end
		elseif var2789 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2810, var2811 = protoModule.readFixed32(p102, var2788)
			local _ = var2810
			var2788 = var2811
		elseif var2789 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2812, var2813 = protoModule.readFixed64(p102, var2788)
			local _ = var2812
			var2788 = var2813
		else
			error("Unsupported wire type: " .. var4066)
		end
	end
	return var2787
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
	local var2814 = t_102.new()
	
	if self.moment_id ~= nil then
		var2814.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var2814.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var2814.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2814.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var2814.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var2814.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var2814.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var2814.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var2814.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var2814.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var2814.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var2814.capture_universe_id = self.captureUniverseId
	end
	return var2814
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
	local var2814 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2815, var2816 = protoModule.writeTag(buff, var2814, 1, protoModule.wireTypes.lengthDelimited)
		var2815, var4096 = protoModule.writeString(var2815, var2816, self.title)
		buff = var2815
		var2814 = var2816
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var2817, var2818 = protoModule.writeTag(buff, var2814, 2, protoModule.wireTypes.lengthDelimited)
		var2817, var4098 = protoModule.writeString(var2817, var2818, self.subtitle)
		buff = var2817
		var2814 = var2818
	end
	local buff_1 = buffer.create(var2814)
	buffer.copy(buff_1, 0, buff, 0, var2814)
	
	return buff_1
end

function t_103.decode(p103)
	-- upvalues: t_103 (ref), protoModule (ref)
	local var2814 = t_103.new()
	local var2815 = 0
	while var2815 < buffer.len(p103) do
		local _ = nil
		local var2816 = nil
		local var2817, var2818, var2819 = protoModule.readTag(p103, var2815)
		local var2820 = var2817
		var2816 = var2818
		var2815 = var2819
		
		if var2816 == protoModule.wireTypes.varint then
			local _ = nil
			local var2821, var2822 = protoModule.readVarInt(p103, var2815)
			local _ = var2821
			var2815 = var2822
			continue
		end
		if var2816 == protoModule.wireTypes.lengthDelimited then
			if var2820 == 1 then
				local _ = nil
				local var2823, var2824 = protoModule.readBuffer(p103, var2815)
				var2815 = var2824
				var2814.title = buffer.tostring(var2823)
			elseif var2820 == 2 then
				local _ = nil
				local var2825, var2826 = protoModule.readBuffer(p103, var2815)
				var2815 = var2826
				var2814.subtitle = buffer.tostring(var2825)
			else
				local _ = nil
				local var2827, var2828 = protoModule.readVarInt(p103, var2815)
				var2815 = var2828 + var2827
			end
		elseif var2816 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2829, var2830 = protoModule.readFixed32(p103, var2815)
			local _ = var2829
			var2815 = var2830
		elseif var2816 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2831, var2832 = protoModule.readFixed64(p103, var2815)
			local _ = var2831
			var2815 = var2832
		else
			error("Unsupported wire type: " .. var4102)
		end
	end
	return var2814
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
	local var2833 = t_103.new()
	
	if self.title ~= nil then
		var2833.title = self.title
	end
	if self.subtitle ~= nil then
		var2833.subtitle = self.subtitle
	end
	return var2833
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
	local var2833 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var2834, var2835 = protoModule.writeTag(buff, var2833, 1, protoModule.wireTypes.lengthDelimited)
		var2834, var4124 = protoModule.writeString(var2834, var2835, self.primary_cta_button_text)
		buff = var2834
		var2833 = var2835
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var2836, var2837 = protoModule.writeTag(buff, var2833, 2, protoModule.wireTypes.lengthDelimited)
		var2836, var4126 = protoModule.writeString(var2836, var2837, self.secondary_cta_button_text)
		buff = var2836
		var2833 = var2837
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var2838, var2839 = protoModule.writeTag(buff, var2833, 3, protoModule.wireTypes.lengthDelimited)
		var2838, var4128 = protoModule.writeString(var2838, var2839, self.primary_cta_type)
		buff = var2838
		var2833 = var2839
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var2840, var2841 = protoModule.writeTag(buff, var2833, 4, protoModule.wireTypes.lengthDelimited)
		var2840, var4130 = protoModule.writeString(var2840, var2841, self.secondary_cta_type)
		buff = var2840
		var2833 = var2841
	end
	local buff_1 = buffer.create(var2833)
	buffer.copy(buff_1, 0, buff, 0, var2833)
	
	return buff_1
end

function t_104.decode(p104)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var2833 = t_104.new()
	local var2834 = 0
	while var2834 < buffer.len(p104) do
		local _ = nil
		local var2835 = nil
		local var2836, var2837, var2838 = protoModule.readTag(p104, var2834)
		local var2839 = var2836
		var2835 = var2837
		var2834 = var2838
		
		if var2835 == protoModule.wireTypes.varint then
			local _ = nil
			local var2840, var2841 = protoModule.readVarInt(p104, var2834)
			local _ = var2840
			var2834 = var2841
			continue
		end
		if var2835 == protoModule.wireTypes.lengthDelimited then
			if var2839 == 1 then
				local _ = nil
				local var2842, var2843 = protoModule.readBuffer(p104, var2834)
				var2834 = var2843
				var2833.primary_cta_button_text = buffer.tostring(var2842)
			elseif var2839 == 2 then
				local _ = nil
				local var2844, var2845 = protoModule.readBuffer(p104, var2834)
				var2834 = var2845
				var2833.secondary_cta_button_text = buffer.tostring(var2844)
			elseif var2839 == 3 then
				local _ = nil
				local var2846, var2847 = protoModule.readBuffer(p104, var2834)
				var2834 = var2847
				var2833.primary_cta_type = buffer.tostring(var2846)
			elseif var2839 == 4 then
				local _ = nil
				local var2848, var2849 = protoModule.readBuffer(p104, var2834)
				var2834 = var2849
				var2833.secondary_cta_type = buffer.tostring(var2848)
			else
				local _ = nil
				local var2850, var2851 = protoModule.readVarInt(p104, var2834)
				var2834 = var2851 + var2850
			end
		elseif var2835 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2852, var2853 = protoModule.readFixed32(p104, var2834)
			local _ = var2852
			var2834 = var2853
		elseif var2835 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2854, var2855 = protoModule.readFixed64(p104, var2834)
			local _ = var2854
			var2834 = var2855
		else
			error("Unsupported wire type: " .. var4134)
		end
	end
	return var2833
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
	local var2856 = t_104.new()
	
	if self.primary_cta_button_text ~= nil then
		var2856.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var2856.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var2856.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var2856.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var2856.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var2856.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var2856.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var2856.secondary_cta_type = self.secondaryCtaType
	end
	return var2856
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
	local var2856 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2857, var2858 = protoModule.writeTag(buff, var2856, 1, protoModule.wireTypes.lengthDelimited)
		var2857, var4160 = protoModule.writeString(var2857, var2858, self.image_asset_id)
		buff = var2857
		var2856 = var2858
	end
	local buff_1 = buffer.create(var2856)
	buffer.copy(buff_1, 0, buff, 0, var2856)
	
	return buff_1
end

function t_105.decode(p105)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var2856 = t_105.new()
	local var2857 = 0
	while var2857 < buffer.len(p105) do
		local _ = nil
		local var2858 = nil
		local var2859, var2860, var2861 = protoModule.readTag(p105, var2857)
		local var2862 = var2859
		var2858 = var2860
		var2857 = var2861
		
		if var2858 == protoModule.wireTypes.varint then
			local _ = nil
			local var2863, var2864 = protoModule.readVarInt(p105, var2857)
			local _ = var2863
			var2857 = var2864
			continue
		end
		if var2858 == protoModule.wireTypes.lengthDelimited then
			if var2862 == 1 then
				local _ = nil
				local var2865, var2866 = protoModule.readBuffer(p105, var2857)
				var2857 = var2866
				var2856.image_asset_id = buffer.tostring(var2865)
			else
				local _ = nil
				local var2867, var2868 = protoModule.readVarInt(p105, var2857)
				var2857 = var2868 + var2867
			end
		elseif var2858 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2869, var2870 = protoModule.readFixed32(p105, var2857)
			local _ = var2869
			var2857 = var2870
		elseif var2858 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2871, var2872 = protoModule.readFixed64(p105, var2857)
			local _ = var2871
			var2857 = var2872
		else
			error("Unsupported wire type: " .. var4164)
		end
	end
	return var2856
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
	local var2873 = t_105.new()
	
	if self.image_asset_id ~= nil then
		var2873.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var2873.image_asset_id = self.imageAssetId
	end
	return var2873
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
	local var2873 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2874, var2875 = protoModule.writeTag(buff, var2873, 1, protoModule.wireTypes.lengthDelimited)
		var2874, var4184 = protoModule.writeString(var2874, var2875, self.video_asset_id)
		buff = var2874
		var2873 = var2875
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var2876, var2877 = protoModule.writeTag(buff, var2873, 2, protoModule.wireTypes.lengthDelimited)
		var2876, var4186 = protoModule.writeString(var2876, var2877, self.loading_image_asset_id)
		buff = var2876
		var2873 = var2877
	end
	local buff_1 = buffer.create(var2873)
	buffer.copy(buff_1, 0, buff, 0, var2873)
	
	return buff_1
end

function t_106.decode(p106)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var2873 = t_106.new()
	local var2874 = 0
	while var2874 < buffer.len(p106) do
		local _ = nil
		local var2875 = nil
		local var2876, var2877, var2878 = protoModule.readTag(p106, var2874)
		local var2879 = var2876
		var2875 = var2877
		var2874 = var2878
		
		if var2875 == protoModule.wireTypes.varint then
			local _ = nil
			local var2880, var2881 = protoModule.readVarInt(p106, var2874)
			local _ = var2880
			var2874 = var2881
			continue
		end
		if var2875 == protoModule.wireTypes.lengthDelimited then
			if var2879 == 1 then
				local _ = nil
				local var2882, var2883 = protoModule.readBuffer(p106, var2874)
				var2874 = var2883
				var2873.video_asset_id = buffer.tostring(var2882)
			elseif var2879 == 2 then
				local _ = nil
				local var2884, var2885 = protoModule.readBuffer(p106, var2874)
				var2874 = var2885
				var2873.loading_image_asset_id = buffer.tostring(var2884)
			else
				local _ = nil
				local var2886, var2887 = protoModule.readVarInt(p106, var2874)
				var2874 = var2887 + var2886
			end
		elseif var2875 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2888, var2889 = protoModule.readFixed32(p106, var2874)
			local _ = var2888
			var2874 = var2889
		elseif var2875 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2890, var2891 = protoModule.readFixed64(p106, var2874)
			local _ = var2890
			var2874 = var2891
		else
			error("Unsupported wire type: " .. var4190)
		end
	end
	return var2873
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
	local var2892 = t_106.new()
	
	if self.video_asset_id ~= nil then
		var2892.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var2892.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var2892.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var2892.loading_image_asset_id = self.loadingImageAssetId
	end
	return var2892
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
	local var2892 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var2893, var2894 = protoModule.writeTag(buff, var2892, 1, protoModule.wireTypes.lengthDelimited)
		var2893, var4212 = protoModule.writeString(var2893, var2894, self.text)
		buff = var2893
		var2892 = var2894
	end
	if self.is_rendered_text then
		local var2895, var2896 = protoModule.writeTag(buff, var2892, 2, protoModule.wireTypes.varint)
		var2895, var4214 = protoModule.writeVarInt(var2895, var2896, if self.is_rendered_text then 1 else 0)
		buff = var2895
		var2892 = var2896
	end
	local buff_1 = buffer.create(var2892)
	buffer.copy(buff_1, 0, buff, 0, var2892)
	
	return buff_1
end

function t_107.decode(p107)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var2892 = t_107.new()
	local var2893 = 0
	while var2893 < buffer.len(p107) do
		local _ = nil
		local var2894 = nil
		local var2895, var2896, var2897 = protoModule.readTag(p107, var2893)
		local var2898 = var2895
		var2894 = var2896
		var2893 = var2897
		
		if var2894 == protoModule.wireTypes.varint then
			if var2898 == 2 then
				local _ = nil
				local var2899, var2900 = protoModule.readVarInt(p107, var2893)
				var2893 = var2900
				var2892.is_rendered_text = var2899 ~= 0
			else
				local _ = nil
				local var2901, var2902 = protoModule.readVarInt(p107, var2893)
				local _ = var2901
				var2893 = var2902
			end
		end
		if var2894 == protoModule.wireTypes.lengthDelimited then
			if var2898 == 1 then
				local _ = nil
				local var2903, var2904 = protoModule.readBuffer(p107, var2893)
				var2893 = var2904
				var2892.text = buffer.tostring(var2903)
			else
				local _ = nil
				local var2905, var2906 = protoModule.readVarInt(p107, var2893)
				var2893 = var2906 + var2905
			end
		elseif var2894 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2907, var2908 = protoModule.readFixed32(p107, var2893)
			local _ = var2907
			var2893 = var2908
		elseif var2894 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2909, var2910 = protoModule.readFixed64(p107, var2893)
			local _ = var2909
			var2893 = var2910
		else
			error("Unsupported wire type: " .. var4218)
		end
	end
	return var2892
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
	local var2911 = t_107.new()
	
	if self.text ~= nil then
		var2911.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var2911.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var2911.is_rendered_text = self.isRenderedText
	end
	return var2911
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
	local var2911 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2912, var2913 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2912, var4240 = protoModule.writeString(var2912, var2913, i)
			local var2914 = v:encode()
			var2913, var4242 = protoModule.writeTag(var2912, var2913, 2, protoModule.wireTypes.lengthDelimited)
			var2913, var4242 = protoModule.writeBuffer(var2913, var4242, var2914, buffer.len(var2914))
			local var2915 = var2913
			local var2916 = var4242
			local var2917, var2918 = protoModule.writeTag(buff, var2911, 1, protoModule.wireTypes.lengthDelimited)
			var2917, var4246 = protoModule.writeBuffer(var2917, var2918, var2915, var2916)
			buff = var2917
			var2911 = var2918
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2919, var2920 = protoModule.writeTag(buff, var2911, 2, protoModule.wireTypes.lengthDelimited)
			var2919, var4248 = protoModule.writeString(var2919, var2920, v)
			buff = var2919
			var2911 = var2920
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var2921, var2922 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2921, var4250 = protoModule.writeString(var2921, var2922, i)
			local var2923 = v:encode()
			var2922, var4252 = protoModule.writeTag(var2921, var2922, 2, protoModule.wireTypes.lengthDelimited)
			var2922, var4252 = protoModule.writeBuffer(var2922, var4252, var2923, buffer.len(var2923))
			local var2924 = var2922
			local var2925 = var4252
			local var2926, var2927 = protoModule.writeTag(buff, var2911, 3, protoModule.wireTypes.lengthDelimited)
			var2926, var4256 = protoModule.writeBuffer(var2926, var2927, var2924, var2925)
			buff = var2926
			var2911 = var2927
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var2928, var2929 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2928, var4258 = protoModule.writeString(var2928, var2929, i)
			local var2930 = v:encode()
			var2929, var4260 = protoModule.writeTag(var2928, var2929, 2, protoModule.wireTypes.lengthDelimited)
			var2929, var4260 = protoModule.writeBuffer(var2929, var4260, var2930, buffer.len(var2930))
			local var2931 = var2929
			local var2932 = var4260
			local var2933, var2934 = protoModule.writeTag(buff, var2911, 4, protoModule.wireTypes.lengthDelimited)
			var2933, var4264 = protoModule.writeBuffer(var2933, var2934, var2931, var2932)
			buff = var2933
			var2911 = var2934
		end
	end
	local buff_1 = buffer.create(var2911)
	buffer.copy(buff_1, 0, buff, 0, var2911)
	
	return buff_1
end

function t_108.decode(p108)
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
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
				var2944 = t.VerticalFeedInputData_EntryMapEntry.decode(var2944)
				var2935.entry_map[var2944.key or ""] = var2944.value or t.FeedEntry.new()
			elseif var2941 == 2 then
				local _ = nil
				local var2946, var2947 = protoModule.readBuffer(p108, var2936)
				var2936 = var2947
				table.insert(var2935.entry_order, buffer.tostring(var2946))
			elseif var2941 == 3 then
				local _ = nil
				local var2948, var2949 = protoModule.readBuffer(p108, var2936)
				var2936 = var2949
				var2948 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var2948)
				var2935.entry_order_map[var2948.key or ""] = var2948.value or t.EntryOrder.new()
			elseif var2941 == 4 then
				local _ = nil
				local var2950, var2951 = protoModule.readBuffer(p108, var2936)
				var2936 = var2951
				var2950 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var2950)
				var2935.content_pools[var2950.key or ""] = var2950.value or t.ContentPool.new()
			else
				local _ = nil
				local var2952, var2953 = protoModule.readVarInt(p108, var2936)
				var2936 = var2953 + var2952
			end
		elseif var2937 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2954, var2955 = protoModule.readFixed32(p108, var2936)
			local _ = var2954
			var2936 = var2955
		elseif var2937 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2956, var2957 = protoModule.readFixed64(p108, var2936)
			local _ = var2956
			var2936 = var2957
		else
			error("Unsupported wire type: " .. var4268)
		end
	end
	return var2935
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
	local var2958 = t_108.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2958.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2958.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2958.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2958.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var2958.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var2958.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2958.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var2958.content_pools = t_1
	end
	return var2958
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
	local var2959 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2960, var2961 = protoModule.writeTag(buff, var2959, 1, protoModule.wireTypes.lengthDelimited)
		var2960, var4306 = protoModule.writeString(var2960, var2961, self.key)
		buff = var2960
		var2959 = var2961
	end
	if self.value ~= nil then
		local var2962 = self.value:encode()
		local var2963, var2964 = protoModule.writeTag(buff, var2959, 2, protoModule.wireTypes.lengthDelimited)
		var2963, var4309 = protoModule.writeBuffer(var2963, var2964, var2962, buffer.len(var2962))
		buff = var2963
		var2959 = var2964
	end
	local buff_1 = buffer.create(var2959)
	buffer.copy(buff_1, 0, buff, 0, var2959)
	
	return buff_1
end

function t_109.decode(p109)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var2959 = t_109.new()
	local var2960 = 0
	while var2960 < buffer.len(p109) do
		local _ = nil
		local var2961 = nil
		local var2962, var2963, var2964 = protoModule.readTag(p109, var2960)
		local var2965 = var2962
		var2961 = var2963
		var2960 = var2964
		
		if var2961 == protoModule.wireTypes.varint then
			local _ = nil
			local var2966, var2967 = protoModule.readVarInt(p109, var2960)
			local _ = var2966
			var2960 = var2967
			continue
		end
		if var2961 == protoModule.wireTypes.lengthDelimited then
			if var2965 == 1 then
				local _ = nil
				local var2968, var2969 = protoModule.readBuffer(p109, var2960)
				var2960 = var2969
				var2959.key = buffer.tostring(var2968)
			elseif var2965 == 2 then
				local _ = nil
				local var2970, var2971 = protoModule.readBuffer(p109, var2960)
				var2960 = var2971
				var2959.value = t.FeedEntry.decode(var2970)
			else
				local _ = nil
				local var2972, var2973 = protoModule.readVarInt(p109, var2960)
				var2960 = var2973 + var2972
			end
		elseif var2961 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2974, var2975 = protoModule.readFixed32(p109, var2960)
			local _ = var2974
			var2960 = var2975
		elseif var2961 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2976, var2977 = protoModule.readFixed64(p109, var2960)
			local _ = var2976
			var2960 = var2977
		else
			error("Unsupported wire type: " .. var4313)
		end
	end
	return var2959
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
	local var2978 = t_109.new()
	
	if self.key ~= nil then
		var2978.key = self.key
	end
	if self.value ~= nil then
		var2978.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2978
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
	local var2978 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2979, var2980 = protoModule.writeTag(buff, var2978, 1, protoModule.wireTypes.lengthDelimited)
		var2979, var4335 = protoModule.writeString(var2979, var2980, self.key)
		buff = var2979
		var2978 = var2980
	end
	if self.value ~= nil then
		local var2981 = self.value:encode()
		local var2982, var2983 = protoModule.writeTag(buff, var2978, 2, protoModule.wireTypes.lengthDelimited)
		var2982, var4338 = protoModule.writeBuffer(var2982, var2983, var2981, buffer.len(var2981))
		buff = var2982
		var2978 = var2983
	end
	local buff_1 = buffer.create(var2978)
	buffer.copy(buff_1, 0, buff, 0, var2978)
	
	return buff_1
end

function t_110.decode(p110)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var2978 = t_110.new()
	local var2979 = 0
	while var2979 < buffer.len(p110) do
		local _ = nil
		local var2980 = nil
		local var2981, var2982, var2983 = protoModule.readTag(p110, var2979)
		local var2984 = var2981
		var2980 = var2982
		var2979 = var2983
		
		if var2980 == protoModule.wireTypes.varint then
			local _ = nil
			local var2985, var2986 = protoModule.readVarInt(p110, var2979)
			local _ = var2985
			var2979 = var2986
			continue
		end
		if var2980 == protoModule.wireTypes.lengthDelimited then
			if var2984 == 1 then
				local _ = nil
				local var2987, var2988 = protoModule.readBuffer(p110, var2979)
				var2979 = var2988
				var2978.key = buffer.tostring(var2987)
			elseif var2984 == 2 then
				local _ = nil
				local var2989, var2990 = protoModule.readBuffer(p110, var2979)
				var2979 = var2990
				var2978.value = t.EntryOrder.decode(var2989)
			else
				local _ = nil
				local var2991, var2992 = protoModule.readVarInt(p110, var2979)
				var2979 = var2992 + var2991
			end
		elseif var2980 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2993, var2994 = protoModule.readFixed32(p110, var2979)
			local _ = var2993
			var2979 = var2994
		elseif var2980 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2995, var2996 = protoModule.readFixed64(p110, var2979)
			local _ = var2995
			var2979 = var2996
		else
			error("Unsupported wire type: " .. var4342)
		end
	end
	return var2978
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
	local var2997 = t_110.new()
	
	if self.key ~= nil then
		var2997.key = self.key
	end
	if self.value ~= nil then
		var2997.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var2997
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
	local var2997 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2998, var2999 = protoModule.writeTag(buff, var2997, 1, protoModule.wireTypes.lengthDelimited)
		var2998, var4364 = protoModule.writeString(var2998, var2999, self.key)
		buff = var2998
		var2997 = var2999
	end
	if self.value ~= nil then
		local var3000 = self.value:encode()
		local var3001, var3002 = protoModule.writeTag(buff, var2997, 2, protoModule.wireTypes.lengthDelimited)
		var3001, var4367 = protoModule.writeBuffer(var3001, var3002, var3000, buffer.len(var3000))
		buff = var3001
		var2997 = var3002
	end
	local buff_1 = buffer.create(var2997)
	buffer.copy(buff_1, 0, buff, 0, var2997)
	
	return buff_1
end

function t_111.decode(p111)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var2997 = t_111.new()
	local var2998 = 0
	while var2998 < buffer.len(p111) do
		local _ = nil
		local var2999 = nil
		local var3000, var3001, var3002 = protoModule.readTag(p111, var2998)
		local var3003 = var3000
		var2999 = var3001
		var2998 = var3002
		
		if var2999 == protoModule.wireTypes.varint then
			local _ = nil
			local var3004, var3005 = protoModule.readVarInt(p111, var2998)
			local _ = var3004
			var2998 = var3005
			continue
		end
		if var2999 == protoModule.wireTypes.lengthDelimited then
			if var3003 == 1 then
				local _ = nil
				local var3006, var3007 = protoModule.readBuffer(p111, var2998)
				var2998 = var3007
				var2997.key = buffer.tostring(var3006)
			elseif var3003 == 2 then
				local _ = nil
				local var3008, var3009 = protoModule.readBuffer(p111, var2998)
				var2998 = var3009
				var2997.value = t.ContentPool.decode(var3008)
			else
				local _ = nil
				local var3010, var3011 = protoModule.readVarInt(p111, var2998)
				var2998 = var3011 + var3010
			end
		elseif var2999 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3012, var3013 = protoModule.readFixed32(p111, var2998)
			local _ = var3012
			var2998 = var3013
		elseif var2999 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3014, var3015 = protoModule.readFixed64(p111, var2998)
			local _ = var3014
			var2998 = var3015
		else
			error("Unsupported wire type: " .. var4371)
		end
	end
	return var2997
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
	local var3016 = t_111.new()
	
	if self.key ~= nil then
		var3016.key = self.key
	end
	if self.value ~= nil then
		var3016.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3016
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
	local var3016 = 0
	
	if self.foreground_header_entry ~= nil then
		local var3017 = self.foreground_header_entry:encode()
		local var3018, var3019 = protoModule.writeTag(buff, var3016, 1, protoModule.wireTypes.lengthDelimited)
		var3018, var4394 = protoModule.writeBuffer(var3018, var3019, var3017, buffer.len(var3017))
		buff = var3018
		var3016 = var3019
	end
	if self.background_header_entry ~= nil then
		local var3020 = self.background_header_entry:encode()
		local var3021, var3022 = protoModule.writeTag(buff, var3016, 2, protoModule.wireTypes.lengthDelimited)
		var3021, var4397 = protoModule.writeBuffer(var3021, var3022, var3020, buffer.len(var3020))
		buff = var3021
		var3016 = var3022
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var3023, var3024 = protoModule.writeTag(buff, var3016, 3, protoModule.wireTypes.lengthDelimited)
		var3023, var4399 = protoModule.writeString(var3023, var3024, self.layout_variant)
		buff = var3023
		var3016 = var3024
	end
	local buff_1 = buffer.create(var3016)
	buffer.copy(buff_1, 0, buff, 0, var3016)
	
	return buff_1
end

function t_112.decode(p112)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var3016 = t_112.new()
	local var3017 = 0
	while var3017 < buffer.len(p112) do
		local _ = nil
		local var3018 = nil
		local var3019, var3020, var3021 = protoModule.readTag(p112, var3017)
		local var3022 = var3019
		var3018 = var3020
		var3017 = var3021
		
		if var3018 == protoModule.wireTypes.varint then
			local _ = nil
			local var3023, var3024 = protoModule.readVarInt(p112, var3017)
			local _ = var3023
			var3017 = var3024
			continue
		end
		if var3018 == protoModule.wireTypes.lengthDelimited then
			if var3022 == 1 then
				local _ = nil
				local var3025, var3026 = protoModule.readBuffer(p112, var3017)
				var3017 = var3026
				var3016.foreground_header_entry = t.ForegroundHeaderEntry.decode(var3025)
			elseif var3022 == 2 then
				local _ = nil
				local var3027, var3028 = protoModule.readBuffer(p112, var3017)
				var3017 = var3028
				var3016.background_header_entry = t.BackgroundHeaderEntry.decode(var3027)
			elseif var3022 == 3 then
				local _ = nil
				local var3029, var3030 = protoModule.readBuffer(p112, var3017)
				var3017 = var3030
				var3016.layout_variant = buffer.tostring(var3029)
			else
				local _ = nil
				local var3031, var3032 = protoModule.readVarInt(p112, var3017)
				var3017 = var3032 + var3031
			end
		elseif var3018 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3033, var3034 = protoModule.readFixed32(p112, var3017)
			local _ = var3033
			var3017 = var3034
		elseif var3018 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3035, var3036 = protoModule.readFixed64(p112, var3017)
			local _ = var3035
			var3017 = var3036
		else
			error("Unsupported wire type: " .. var4403)
		end
	end
	return var3016
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
	local var3037 = t_112.new()
	
	if self.foreground_header_entry ~= nil then
		var3037.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var3037.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var3037.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var3037.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var3037.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var3037.layout_variant = self.layoutVariant
	end
	return var3037
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
	local var3037 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3038, var3039 = protoModule.writeTag(buff, var3037, 1, protoModule.wireTypes.lengthDelimited)
		var3038, var4427 = protoModule.writeString(var3038, var3039, self.cta_button_text)
		buff = var3038
		var3037 = var3039
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3040, var3041 = protoModule.writeTag(buff, var3037, 2, protoModule.wireTypes.lengthDelimited)
		var3040, var4429 = protoModule.writeString(var3040, var3041, self.cta_type)
		buff = var3040
		var3037 = var3041
	end
	local buff_1 = buffer.create(var3037)
	buffer.copy(buff_1, 0, buff, 0, var3037)
	
	return buff_1
end

function t_113.decode(p113)
	-- upvalues: t_113 (ref), protoModule (ref)
	local var3037 = t_113.new()
	local var3038 = 0
	while var3038 < buffer.len(p113) do
		local _ = nil
		local var3039 = nil
		local var3040, var3041, var3042 = protoModule.readTag(p113, var3038)
		local var3043 = var3040
		var3039 = var3041
		var3038 = var3042
		
		if var3039 == protoModule.wireTypes.varint then
			local _ = nil
			local var3044, var3045 = protoModule.readVarInt(p113, var3038)
			local _ = var3044
			var3038 = var3045
			continue
		end
		if var3039 == protoModule.wireTypes.lengthDelimited then
			if var3043 == 1 then
				local _ = nil
				local var3046, var3047 = protoModule.readBuffer(p113, var3038)
				var3038 = var3047
				var3037.cta_button_text = buffer.tostring(var3046)
			elseif var3043 == 2 then
				local _ = nil
				local var3048, var3049 = protoModule.readBuffer(p113, var3038)
				var3038 = var3049
				var3037.cta_type = buffer.tostring(var3048)
			else
				local _ = nil
				local var3050, var3051 = protoModule.readVarInt(p113, var3038)
				var3038 = var3051 + var3050
			end
		elseif var3039 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3052, var3053 = protoModule.readFixed32(p113, var3038)
			local _ = var3052
			var3038 = var3053
		elseif var3039 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3054, var3055 = protoModule.readFixed64(p113, var3038)
			local _ = var3054
			var3038 = var3055
		else
			error("Unsupported wire type: " .. var4433)
		end
	end
	return var3037
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
	local var3056 = t_113.new()
	
	if self.cta_button_text ~= nil then
		var3056.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3056.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var3056.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3056.cta_type = self.ctaType
	end
	return var3056
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
	local var3056 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3057, var3058 = protoModule.writeTag(buff, var3056, 1, protoModule.wireTypes.lengthDelimited)
		var3057, var4455 = protoModule.writeString(var3057, var3058, self.title)
		buff = var3057
		var3056 = var3058
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var3059, var3060 = protoModule.writeTag(buff, var3056, 2, protoModule.wireTypes.lengthDelimited)
		var3059, var4457 = protoModule.writeString(var3059, var3060, self.cta_button_text)
		buff = var3059
		var3056 = var3060
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3061, var3062 = protoModule.writeTag(buff, var3056, 3, protoModule.wireTypes.lengthDelimited)
		var3061, var4459 = protoModule.writeString(var3061, var3062, self.image_asset_id)
		buff = var3061
		var3056 = var3062
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var3063, var3064 = protoModule.writeTag(buff, var3056, 4, protoModule.wireTypes.lengthDelimited)
		var3063, var4461 = protoModule.writeString(var3063, var3064, self.cta_type)
		buff = var3063
		var3056 = var3064
	end
	local buff_1 = buffer.create(var3056)
	buffer.copy(buff_1, 0, buff, 0, var3056)
	
	return buff_1
end

function t_114.decode(p114)
	-- upvalues: t_114 (ref), protoModule (ref)
	local var3056 = t_114.new()
	local var3057 = 0
	while var3057 < buffer.len(p114) do
		local _ = nil
		local var3058 = nil
		local var3059, var3060, var3061 = protoModule.readTag(p114, var3057)
		local var3062 = var3059
		var3058 = var3060
		var3057 = var3061
		
		if var3058 == protoModule.wireTypes.varint then
			local _ = nil
			local var3063, var3064 = protoModule.readVarInt(p114, var3057)
			local _ = var3063
			var3057 = var3064
			continue
		end
		if var3058 == protoModule.wireTypes.lengthDelimited then
			if var3062 == 1 then
				local _ = nil
				local var3065, var3066 = protoModule.readBuffer(p114, var3057)
				var3057 = var3066
				var3056.title = buffer.tostring(var3065)
			elseif var3062 == 2 then
				local _ = nil
				local var3067, var3068 = protoModule.readBuffer(p114, var3057)
				var3057 = var3068
				var3056.cta_button_text = buffer.tostring(var3067)
			elseif var3062 == 3 then
				local _ = nil
				local var3069, var3070 = protoModule.readBuffer(p114, var3057)
				var3057 = var3070
				var3056.image_asset_id = buffer.tostring(var3069)
			elseif var3062 == 4 then
				local _ = nil
				local var3071, var3072 = protoModule.readBuffer(p114, var3057)
				var3057 = var3072
				var3056.cta_type = buffer.tostring(var3071)
			else
				local _ = nil
				local var3073, var3074 = protoModule.readVarInt(p114, var3057)
				var3057 = var3074 + var3073
			end
		elseif var3058 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3075, var3076 = protoModule.readFixed32(p114, var3057)
			local _ = var3075
			var3057 = var3076
		elseif var3058 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3077, var3078 = protoModule.readFixed64(p114, var3057)
			local _ = var3077
			var3057 = var3078
		else
			error("Unsupported wire type: " .. var4465)
		end
	end
	return var3056
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
	local var3079 = t_114.new()
	
	if self.title ~= nil then
		var3079.title = self.title
	end
	if self.cta_button_text ~= nil then
		var3079.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var3079.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var3079.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3079.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var3079.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var3079.cta_type = self.ctaType
	end
	return var3079
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
	local var3079 = 0
	
	if self.universe_id ~= nil then
		local var3080, var3081 = protoModule.writeTag(buff, var3079, 1, protoModule.wireTypes.lengthDelimited)
		var3080, var4491 = protoModule.writeString(var3080, var3081, self.universe_id)
		buff = var3080
		var3079 = var3081
	end
	if self.title ~= nil then
		local var3082, var3083 = protoModule.writeTag(buff, var3079, 2, protoModule.wireTypes.lengthDelimited)
		var3082, var4493 = protoModule.writeString(var3082, var3083, self.title)
		buff = var3082
		var3079 = var3083
	end
	if self.subtitle ~= nil then
		local var3084, var3085 = protoModule.writeTag(buff, var3079, 3, protoModule.wireTypes.lengthDelimited)
		var3084, var4495 = protoModule.writeString(var3084, var3085, self.subtitle)
		buff = var3084
		var3079 = var3085
	end
	if self.badge_text ~= nil then
		local var3086, var3087 = protoModule.writeTag(buff, var3079, 4, protoModule.wireTypes.lengthDelimited)
		var3086, var4497 = protoModule.writeString(var3086, var3087, self.badge_text)
		buff = var3086
		var3079 = var3087
	end
	if self.foreground ~= nil then
		local var3088 = self.foreground:encode()
		local var3089, var3090 = protoModule.writeTag(buff, var3079, 5, protoModule.wireTypes.lengthDelimited)
		var3089, var4500 = protoModule.writeBuffer(var3089, var3090, var3088, buffer.len(var3088))
		buff = var3089
		var3079 = var3090
	end
	if self.background ~= nil then
		local var3091 = self.background:encode()
		local var3092, var3093 = protoModule.writeTag(buff, var3079, 6, protoModule.wireTypes.lengthDelimited)
		var3092, var4503 = protoModule.writeBuffer(var3092, var3093, var3091, buffer.len(var3091))
		buff = var3092
		var3079 = var3093
	end
	if self.title_image ~= nil then
		local var3094 = self.title_image:encode()
		local var3095, var3096 = protoModule.writeTag(buff, var3079, 7, protoModule.wireTypes.lengthDelimited)
		var3095, var4506 = protoModule.writeBuffer(var3095, var3096, var3094, buffer.len(var3094))
		buff = var3095
		var3079 = var3096
	end
	if self.asset_title ~= nil then
		local var3097, var3098 = protoModule.writeTag(buff, var3079, 8, protoModule.wireTypes.lengthDelimited)
		var3097, var4508 = protoModule.writeString(var3097, var3098, self.asset_title)
		buff = var3097
		var3079 = var3098
	end
	if self.asset_subtitle ~= nil then
		local var3099, var3100 = protoModule.writeTag(buff, var3079, 9, protoModule.wireTypes.lengthDelimited)
		var3099, var4510 = protoModule.writeString(var3099, var3100, self.asset_subtitle)
		buff = var3099
		var3079 = var3100
	end
	if self.gradient ~= nil then
		local var3101 = self.gradient:encode()
		local var3102, var3103 = protoModule.writeTag(buff, var3079, 10, protoModule.wireTypes.lengthDelimited)
		var3102, var4513 = protoModule.writeBuffer(var3102, var3103, var3101, buffer.len(var3101))
		buff = var3102
		var3079 = var3103
	end
	if self.playable_text ~= nil then
		local var3104, var3105 = protoModule.writeTag(buff, var3079, 11, protoModule.wireTypes.lengthDelimited)
		var3104, var4515 = protoModule.writeString(var3104, var3105, self.playable_text)
		buff = var3104
		var3079 = var3105
	end
	if self.collection_id ~= nil then
		local var3106, var3107 = protoModule.writeTag(buff, var3079, 12, protoModule.wireTypes.lengthDelimited)
		var3106, var4517 = protoModule.writeString(var3106, var3107, self.collection_id)
		buff = var3106
		var3079 = var3107
	end
	if self.campaign_id ~= nil then
		local var3108, var3109 = protoModule.writeTag(buff, var3079, 13, protoModule.wireTypes.lengthDelimited)
		var3108, var4519 = protoModule.writeString(var3108, var3109, self.campaign_id)
		buff = var3108
		var3079 = var3109
	end
	if self.cohort_id ~= nil then
		local var3110, var3111 = protoModule.writeTag(buff, var3079, 14, protoModule.wireTypes.lengthDelimited)
		var3110, var4521 = protoModule.writeString(var3110, var3111, self.cohort_id)
		buff = var3110
		var3079 = var3111
	end
	if self.sort_id ~= nil then
		local var3112, var3113 = protoModule.writeTag(buff, var3079, 15, protoModule.wireTypes.lengthDelimited)
		var3112, var4523 = protoModule.writeString(var3112, var3113, self.sort_id)
		buff = var3112
		var3079 = var3113
	end
	if self.hero_unit_id ~= nil then
		local var3114, var3115 = protoModule.writeTag(buff, var3079, 16, protoModule.wireTypes.lengthDelimited)
		var3114, var4525 = protoModule.writeString(var3114, var3115, self.hero_unit_id)
		buff = var3114
		var3079 = var3115
	end
	if self.analytics_id ~= nil then
		local var3116, var3117 = protoModule.writeTag(buff, var3079, 17, protoModule.wireTypes.lengthDelimited)
		var3116, var4527 = protoModule.writeString(var3116, var3117, self.analytics_id)
		buff = var3116
		var3079 = var3117
	end
	if self.is_sponsored ~= nil then
		local var3118, var3119 = protoModule.writeTag(buff, var3079, 18, protoModule.wireTypes.varint)
		var3118, var4529 = protoModule.writeVarInt(var3118, var3119, if self.is_sponsored then 1 else 0)
		buff = var3118
		var3079 = var3119
	end
	local buff_1 = buffer.create(var3079)
	buffer.copy(buff_1, 0, buff, 0, var3079)
	
	return buff_1
end

function t_115.decode(p115)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var3079 = t_115.new()
	local var3080 = 0
	while var3080 < buffer.len(p115) do
		local _ = nil
		local var3081 = nil
		local var3082, var3083, var3084 = protoModule.readTag(p115, var3080)
		local var3085 = var3082
		var3081 = var3083
		var3080 = var3084
		
		if var3081 == protoModule.wireTypes.varint then
			if var3085 == 18 then
				local _ = nil
				local var3086, var3087 = protoModule.readVarInt(p115, var3080)
				var3080 = var3087
				var3079.is_sponsored = var3086 ~= 0
			else
				local _ = nil
				local var3088, var3089 = protoModule.readVarInt(p115, var3080)
				local _ = var3088
				var3080 = var3089
			end
		end
		if var3081 == protoModule.wireTypes.lengthDelimited then
			if var3085 == 1 then
				local _ = nil
				local var3090, var3091 = protoModule.readBuffer(p115, var3080)
				var3080 = var3091
				var3079.universe_id = buffer.tostring(var3090)
			elseif var3085 == 2 then
				local _ = nil
				local var3092, var3093 = protoModule.readBuffer(p115, var3080)
				var3080 = var3093
				var3079.title = buffer.tostring(var3092)
			elseif var3085 == 3 then
				local _ = nil
				local var3094, var3095 = protoModule.readBuffer(p115, var3080)
				var3080 = var3095
				var3079.subtitle = buffer.tostring(var3094)
			elseif var3085 == 4 then
				local _ = nil
				local var3096, var3097 = protoModule.readBuffer(p115, var3080)
				var3080 = var3097
				var3079.badge_text = buffer.tostring(var3096)
			elseif var3085 == 5 then
				local _ = nil
				local var3098, var3099 = protoModule.readBuffer(p115, var3080)
				var3080 = var3099
				var3079.foreground = t.HeroUnitInputData_VisualAsset.decode(var3098)
			elseif var3085 == 6 then
				local _ = nil
				local var3100, var3101 = protoModule.readBuffer(p115, var3080)
				var3080 = var3101
				var3079.background = t.HeroUnitInputData_VisualAsset.decode(var3100)
			elseif var3085 == 7 then
				local _ = nil
				local var3102, var3103 = protoModule.readBuffer(p115, var3080)
				var3080 = var3103
				var3079.title_image = t.HeroUnitInputData_VisualAsset.decode(var3102)
			elseif var3085 == 8 then
				local _ = nil
				local var3104, var3105 = protoModule.readBuffer(p115, var3080)
				var3080 = var3105
				var3079.asset_title = buffer.tostring(var3104)
			elseif var3085 == 9 then
				local _ = nil
				local var3106, var3107 = protoModule.readBuffer(p115, var3080)
				var3080 = var3107
				var3079.asset_subtitle = buffer.tostring(var3106)
			elseif var3085 == 10 then
				local _ = nil
				local var3108, var3109 = protoModule.readBuffer(p115, var3080)
				var3080 = var3109
				var3079.gradient = t.HeroUnitInputData_Gradient.decode(var3108)
			elseif var3085 == 11 then
				local _ = nil
				local var3110, var3111 = protoModule.readBuffer(p115, var3080)
				var3080 = var3111
				var3079.playable_text = buffer.tostring(var3110)
			elseif var3085 == 12 then
				local _ = nil
				local var3112, var3113 = protoModule.readBuffer(p115, var3080)
				var3080 = var3113
				var3079.collection_id = buffer.tostring(var3112)
			elseif var3085 == 13 then
				local _ = nil
				local var3114, var3115 = protoModule.readBuffer(p115, var3080)
				var3080 = var3115
				var3079.campaign_id = buffer.tostring(var3114)
			elseif var3085 == 14 then
				local _ = nil
				local var3116, var3117 = protoModule.readBuffer(p115, var3080)
				var3080 = var3117
				var3079.cohort_id = buffer.tostring(var3116)
			elseif var3085 == 15 then
				local _ = nil
				local var3118, var3119 = protoModule.readBuffer(p115, var3080)
				var3080 = var3119
				var3079.sort_id = buffer.tostring(var3118)
			elseif var3085 == 16 then
				local _ = nil
				local var3120, var3121 = protoModule.readBuffer(p115, var3080)
				var3080 = var3121
				var3079.hero_unit_id = buffer.tostring(var3120)
			elseif var3085 == 17 then
				local _ = nil
				local var3122, var3123 = protoModule.readBuffer(p115, var3080)
				var3080 = var3123
				var3079.analytics_id = buffer.tostring(var3122)
			else
				local _ = nil
				local var3124, var3125 = protoModule.readVarInt(p115, var3080)
				var3080 = var3125 + var3124
			end
		elseif var3081 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3126, var3127 = protoModule.readFixed32(p115, var3080)
			local _ = var3126
			var3080 = var3127
		elseif var3081 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3128, var3129 = protoModule.readFixed64(p115, var3080)
			local _ = var3128
			var3080 = var3129
		else
			error("Unsupported wire type: " .. var4533)
		end
	end
	return var3079
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
	local var3130 = t_115.new()
	
	if self.universe_id ~= nil then
		var3130.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3130.universe_id = self.universeId
	end
	if self.title ~= nil then
		var3130.title = self.title
	end
	if self.subtitle ~= nil then
		var3130.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var3130.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3130.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var3130.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var3130.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var3130.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var3130.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var3130.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var3130.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var3130.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var3130.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var3130.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var3130.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var3130.playable_text = self.playableText
	end
	if self.collection_id ~= nil then
		var3130.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var3130.collection_id = self.collectionId
	end
	if self.campaign_id ~= nil then
		var3130.campaign_id = self.campaign_id
	end
	if self.campaignId ~= nil then
		var3130.campaign_id = self.campaignId
	end
	if self.cohort_id ~= nil then
		var3130.cohort_id = self.cohort_id
	end
	if self.cohortId ~= nil then
		var3130.cohort_id = self.cohortId
	end
	if self.sort_id ~= nil then
		var3130.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3130.sort_id = self.sortId
	end
	if self.hero_unit_id ~= nil then
		var3130.hero_unit_id = self.hero_unit_id
	end
	if self.heroUnitId ~= nil then
		var3130.hero_unit_id = self.heroUnitId
	end
	if self.analytics_id ~= nil then
		var3130.analytics_id = self.analytics_id
	end
	if self.analyticsId ~= nil then
		var3130.analytics_id = self.analyticsId
	end
	if self.is_sponsored ~= nil then
		var3130.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var3130.is_sponsored = self.isSponsored
	end
	return var3130
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
	local var3130 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var3131, var3132 = protoModule.writeTag(buff, var3130, 1, protoModule.wireTypes.lengthDelimited)
		var3131, var4587 = protoModule.writeString(var3131, var3132, self.asset_id)
		buff = var3131
		var3130 = var3132
	end
	if self.aspect_ratio ~= nil then
		local var3133, var3134 = protoModule.writeTag(buff, var3130, 2, protoModule.wireTypes.i64)
		var3133, var4589 = protoModule.writeDouble(var3133, var3134, self.aspect_ratio)
		buff = var3133
		var3130 = var3134
	end
	if self.enable_animation ~= nil then
		local var3135, var3136 = protoModule.writeTag(buff, var3130, 3, protoModule.wireTypes.varint)
		var3135, var4591 = protoModule.writeVarInt(var3135, var3136, if self.enable_animation then 1 else 0)
		buff = var3135
		var3130 = var3136
	end
	local buff_1 = buffer.create(var3130)
	buffer.copy(buff_1, 0, buff, 0, var3130)
	
	return buff_1
end

function t_116.decode(p116)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var3130 = t_116.new()
	local var3131 = 0
	while var3131 < buffer.len(p116) do
		local _ = nil
		local var3132 = nil
		local var3133, var3134, var3135 = protoModule.readTag(p116, var3131)
		local var3136 = var3133
		var3132 = var3134
		var3131 = var3135
		
		if var3132 == protoModule.wireTypes.varint then
			if var3136 == 3 then
				local _ = nil
				local var3137, var3138 = protoModule.readVarInt(p116, var3131)
				var3131 = var3138
				var3130.enable_animation = var3137 ~= 0
			else
				local _ = nil
				local var3139, var3140 = protoModule.readVarInt(p116, var3131)
				local _ = var3139
				var3131 = var3140
			end
		end
		if var3132 == protoModule.wireTypes.lengthDelimited then
			if var3136 == 1 then
				local _ = nil
				local var3141, var3142 = protoModule.readBuffer(p116, var3131)
				var3131 = var3142
				var3130.asset_id = buffer.tostring(var3141)
			else
				local _ = nil
				local var3143, var3144 = protoModule.readVarInt(p116, var3131)
				var3131 = var3144 + var3143
			end
		elseif var3132 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3145, var3146 = protoModule.readFixed32(p116, var3131)
			local _ = var3145
			var3131 = var3146
		elseif var3132 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4595)
		elseif var3136 == 2 then
			local _ = nil
			local var3147, var3148 = protoModule.readDouble(p116, var3131)
			var3131 = var3148
			var3130.aspect_ratio = var3147
		else
			local _ = nil
			local var3149, var3150 = protoModule.readFixed64(p116, var3131)
			local _ = var3149
			var3131 = var3150
		end
	end
	return var3130
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
	local var3151 = t_116.new()
	
	if self.asset_id ~= nil then
		var3151.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var3151.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var3151.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var3151.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var3151.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var3151.enable_animation = self.enableAnimation
	end
	return var3151
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
	local var3151 = 0
	
	if self.start_color ~= nil then
		local var3152, var3153 = protoModule.writeTag(buff, var3151, 1, protoModule.wireTypes.lengthDelimited)
		var3152, var4619 = protoModule.writeString(var3152, var3153, self.start_color)
		buff = var3152
		var3151 = var3153
	end
	if self.end_color ~= nil then
		local var3154, var3155 = protoModule.writeTag(buff, var3151, 2, protoModule.wireTypes.lengthDelimited)
		var3154, var4621 = protoModule.writeString(var3154, var3155, self.end_color)
		buff = var3154
		var3151 = var3155
	end
	if self.start_opacity ~= nil then
		local var3156, var3157 = protoModule.writeTag(buff, var3151, 3, protoModule.wireTypes.i64)
		var3156, var4623 = protoModule.writeDouble(var3156, var3157, self.start_opacity)
		buff = var3156
		var3151 = var3157
	end
	if self.end_opacity ~= nil then
		local var3158, var3159 = protoModule.writeTag(buff, var3151, 4, protoModule.wireTypes.i64)
		var3158, var4625 = protoModule.writeDouble(var3158, var3159, self.end_opacity)
		buff = var3158
		var3151 = var3159
	end
	if self.degree ~= nil then
		local var3160, var3161 = protoModule.writeTag(buff, var3151, 5, protoModule.wireTypes.i64)
		var3160, var4627 = protoModule.writeDouble(var3160, var3161, self.degree)
		buff = var3160
		var3151 = var3161
	end
	local buff_1 = buffer.create(var3151)
	buffer.copy(buff_1, 0, buff, 0, var3151)
	
	return buff_1
end

function t_117.decode(p117)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var3151 = t_117.new()
	local var3152 = 0
	while var3152 < buffer.len(p117) do
		local _ = nil
		local var3153 = nil
		local var3154, var3155, var3156 = protoModule.readTag(p117, var3152)
		local var3157 = var3154
		var3153 = var3155
		var3152 = var3156
		
		if var3153 == protoModule.wireTypes.varint then
			local _ = nil
			local var3158, var3159 = protoModule.readVarInt(p117, var3152)
			local _ = var3158
			var3152 = var3159
			continue
		end
		if var3153 == protoModule.wireTypes.lengthDelimited then
			if var3157 == 1 then
				local _ = nil
				local var3160, var3161 = protoModule.readBuffer(p117, var3152)
				var3152 = var3161
				var3151.start_color = buffer.tostring(var3160)
			elseif var3157 == 2 then
				local _ = nil
				local var3162, var3163 = protoModule.readBuffer(p117, var3152)
				var3152 = var3163
				var3151.end_color = buffer.tostring(var3162)
			else
				local _ = nil
				local var3164, var3165 = protoModule.readVarInt(p117, var3152)
				var3152 = var3165 + var3164
			end
		elseif var3153 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3166, var3167 = protoModule.readFixed32(p117, var3152)
			local _ = var3166
			var3152 = var3167
		elseif var3153 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4631)
		elseif var3157 == 3 then
			local _ = nil
			local var3168, var3169 = protoModule.readDouble(p117, var3152)
			var3152 = var3169
			var3151.start_opacity = var3168
		elseif var3157 == 4 then
			local _ = nil
			local var3170, var3171 = protoModule.readDouble(p117, var3152)
			var3152 = var3171
			var3151.end_opacity = var3170
		elseif var3157 == 5 then
			local _ = nil
			local var3172, var3173 = protoModule.readDouble(p117, var3152)
			var3152 = var3173
			var3151.degree = var3172
		else
			local _ = nil
			local var3174, var3175 = protoModule.readFixed64(p117, var3152)
			local _ = var3174
			var3152 = var3175
		end
	end
	return var3151
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
	local var3176 = t_117.new()
	
	if self.start_color ~= nil then
		var3176.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var3176.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var3176.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var3176.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var3176.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var3176.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var3176.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var3176.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var3176.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var3176
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
	local var3176 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3177 = v:encode()
			local var3178, var3179 = protoModule.writeTag(buff, var3176, 1, protoModule.wireTypes.lengthDelimited)
			var3178, var4660 = protoModule.writeBuffer(var3178, var3179, var3177, buffer.len(var3177))
			buff = var3178
			var3176 = var3179
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3180, var3181 = protoModule.writeTag(buff, var3176, 2, protoModule.wireTypes.lengthDelimited)
		var3180, var4662 = protoModule.writeString(var3180, var3181, self.sort_id)
		buff = var3180
		var3176 = var3181
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var3182, var3183 = protoModule.writeTag(buff, var3176, 3, protoModule.wireTypes.lengthDelimited)
		var3182, var4664 = protoModule.writeString(var3182, var3183, self.recommendation_request_id)
		buff = var3182
		var3176 = var3183
	end
	local buff_1 = buffer.create(var3176)
	buffer.copy(buff_1, 0, buff, 0, var3176)
	
	return buff_1
end

function t_118.decode(p118)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var3184 = t_118.new()
	local var3185 = 0
	while var3185 < buffer.len(p118) do
		local _ = nil
		local var3186 = nil
		local var3187, var3188, var3189 = protoModule.readTag(p118, var3185)
		local var3190 = var3187
		var3186 = var3188
		var3185 = var3189
		
		if var3186 == protoModule.wireTypes.varint then
			local _ = nil
			local var3191, var3192 = protoModule.readVarInt(p118, var3185)
			local _ = var3191
			var3185 = var3192
			continue
		end
		if var3186 == protoModule.wireTypes.lengthDelimited then
			if var3190 == 1 then
				local _ = nil
				local var3193, var3194 = protoModule.readBuffer(p118, var3185)
				var3185 = var3194
				table.insert(var3184.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var3193))
			elseif var3190 == 2 then
				local _ = nil
				local var3195, var3196 = protoModule.readBuffer(p118, var3185)
				var3185 = var3196
				var3184.sort_id = buffer.tostring(var3195)
			elseif var3190 == 3 then
				local _ = nil
				local var3197, var3198 = protoModule.readBuffer(p118, var3185)
				var3185 = var3198
				var3184.recommendation_request_id = buffer.tostring(var3197)
			else
				local _ = nil
				local var3199, var3200 = protoModule.readVarInt(p118, var3185)
				var3185 = var3200 + var3199
			end
		elseif var3186 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3201, var3202 = protoModule.readFixed32(p118, var3185)
			local _ = var3201
			var3185 = var3202
		elseif var3186 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3203, var3204 = protoModule.readFixed64(p118, var3185)
			local _ = var3203
			var3185 = var3204
		else
			error("Unsupported wire type: " .. var4668)
		end
	end
	return var3184
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
	local var3205 = t_118.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var3205.items = t_1
	end
	if self.sort_id ~= nil then
		var3205.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3205.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var3205.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var3205.recommendation_request_id = self.recommendationRequestId
	end
	return var3205
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
	local var3206 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3207, var3208 = protoModule.writeTag(buff, var3206, 1, protoModule.wireTypes.lengthDelimited)
		var3207, var4694 = protoModule.writeString(var3207, var3208, self.user_id)
		buff = var3207
		var3206 = var3208
	end
	local buff_1 = buffer.create(var3206)
	buffer.copy(buff_1, 0, buff, 0, var3206)
	
	return buff_1
end

function t_119.decode(p119)
	-- upvalues: t_119 (ref), protoModule (ref)
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
			local _ = nil
			local var3213, var3214 = protoModule.readVarInt(p119, var3207)
			local _ = var3213
			var3207 = var3214
			continue
		end
		if var3208 == protoModule.wireTypes.lengthDelimited then
			if var3212 == 1 then
				local _ = nil
				local var3215, var3216 = protoModule.readBuffer(p119, var3207)
				var3207 = var3216
				var3206.user_id = buffer.tostring(var3215)
			else
				local _ = nil
				local var3217, var3218 = protoModule.readVarInt(p119, var3207)
				var3207 = var3218 + var3217
			end
		elseif var3208 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3219, var3220 = protoModule.readFixed32(p119, var3207)
			local _ = var3219
			var3207 = var3220
		elseif var3208 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3221, var3222 = protoModule.readFixed64(p119, var3207)
			local _ = var3221
			var3207 = var3222
		else
			error("Unsupported wire type: " .. var4698)
		end
	end
	return var3206
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
	local var3223 = t_119.new()
	
	if self.user_id ~= nil then
		var3223.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3223.user_id = self.userId
	end
	return var3223
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
	local var3223 = 0
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		local var3224, var3225 = protoModule.writeTag(buff, var3223, 1, protoModule.wireTypes.lengthDelimited)
		var3224, var4718 = protoModule.writeString(var3224, var3225, self.contact_id)
		buff = var3224
		var3223 = var3225
	end
	local buff_1 = buffer.create(var3223)
	buffer.copy(buff_1, 0, buff, 0, var3223)
	
	return buff_1
end

function t_120.decode(p120)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var3223 = t_120.new()
	local var3224 = 0
	while var3224 < buffer.len(p120) do
		local _ = nil
		local var3225 = nil
		local var3226, var3227, var3228 = protoModule.readTag(p120, var3224)
		local var3229 = var3226
		var3225 = var3227
		var3224 = var3228
		
		if var3225 == protoModule.wireTypes.varint then
			local _ = nil
			local var3230, var3231 = protoModule.readVarInt(p120, var3224)
			local _ = var3230
			var3224 = var3231
			continue
		end
		if var3225 == protoModule.wireTypes.lengthDelimited then
			if var3229 == 1 then
				local _ = nil
				local var3232, var3233 = protoModule.readBuffer(p120, var3224)
				var3224 = var3233
				var3223.contact_id = buffer.tostring(var3232)
			else
				local _ = nil
				local var3234, var3235 = protoModule.readVarInt(p120, var3224)
				var3224 = var3235 + var3234
			end
		elseif var3225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3236, var3237 = protoModule.readFixed32(p120, var3224)
			local _ = var3236
			var3224 = var3237
		elseif var3225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3238, var3239 = protoModule.readFixed64(p120, var3224)
			local _ = var3238
			var3224 = var3239
		else
			error("Unsupported wire type: " .. var4722)
		end
	end
	return var3223
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
	local var3240 = t_120.new()
	
	if self.contact_id ~= nil then
		var3240.contact_id = self.contact_id
	end
	if self.contactId ~= nil then
		var3240.contact_id = self.contactId
	end
	return var3240
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
	local var3240 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "user" then
			local var3241 = self.kind.value:encode()
			local var3242, var3243 = protoModule.writeTag(buff, var3240, 1, protoModule.wireTypes.lengthDelimited)
			var3242, var4743 = protoModule.writeBuffer(var3242, var3243, var3241, buffer.len(var3241))
			buff = var3242
			var3240 = var3243
		elseif self.kind.type == "contact" then
			local var3244 = self.kind.value:encode()
			local var3245, var3246 = protoModule.writeTag(buff, var3240, 2, protoModule.wireTypes.lengthDelimited)
			var3245, var4746 = protoModule.writeBuffer(var3245, var3246, var3244, buffer.len(var3244))
			buff = var3245
			var3240 = var3246
		end
	end
	if self.has_pending_friend_request then
		local var3247, var3248 = protoModule.writeTag(buff, var3240, 3, protoModule.wireTypes.varint)
		var3247, var4748 = protoModule.writeVarInt(var3247, var3248, if self.has_pending_friend_request then 1 else 0)
		buff = var3247
		var3240 = var3248
	end
	local buff_1 = buffer.create(var3240)
	buffer.copy(buff_1, 0, buff, 0, var3240)
	
	return buff_1
end

function t_121.decode(p121)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var3240 = t_121.new()
	local var3241 = 0
	while var3241 < buffer.len(p121) do
		local _ = nil
		local var3242 = nil
		local var3243, var3244, var3245 = protoModule.readTag(p121, var3241)
		local var3246 = var3243
		var3242 = var3244
		var3241 = var3245
		
		if var3242 == protoModule.wireTypes.varint then
			if var3246 == 3 then
				local _ = nil
				local var3247, var3248 = protoModule.readVarInt(p121, var3241)
				var3241 = var3248
				var3240.has_pending_friend_request = var3247 ~= 0
			else
				local _ = nil
				local var3249, var3250 = protoModule.readVarInt(p121, var3241)
				local _ = var3249
				var3241 = var3250
			end
		end
		if var3242 == protoModule.wireTypes.lengthDelimited then
			if var3246 == 1 then
				local _ = nil
				local var3251, var3252 = protoModule.readBuffer(p121, var3241)
				var3241 = var3252
				var3240.kind = {
					type = "user",
					value = t.FriendRecommendationCarouselInputData_UserRecommendation.decode(var3251)
				}
			elseif var3246 == 2 then
				local _ = nil
				local var3253, var3254 = protoModule.readBuffer(p121, var3241)
				var3241 = var3254
				var3240.kind = {
					type = "contact",
					value = t.FriendRecommendationCarouselInputData_ContactRecommendation.decode(var3253)
				}
			else
				local _ = nil
				local var3255, var3256 = protoModule.readVarInt(p121, var3241)
				var3241 = var3256 + var3255
			end
		elseif var3242 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3257, var3258 = protoModule.readFixed32(p121, var3241)
			local _ = var3257
			var3241 = var3258
		elseif var3242 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3259, var3260 = protoModule.readFixed64(p121, var3241)
			local _ = var3259
			var3241 = var3260
		else
			error("Unsupported wire type: " .. var4752)
		end
	end
	return var3240
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
	local var3261 = t_121.new()
	
	if self.user ~= nil then
		var3261.kind = {
			type = "user",
			value = t.FriendRecommendationCarouselInputData_UserRecommendation.jsonDecode(self.user)
		}
	end
	if self.contact ~= nil then
		var3261.kind = {
			type = "contact",
			value = t.FriendRecommendationCarouselInputData_ContactRecommendation.jsonDecode(self.contact)
		}
	end
	if self.has_pending_friend_request ~= nil then
		var3261.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var3261.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var3261
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
	local var3261 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3262, var3263 = protoModule.writeTag(buff, var3261, 1, protoModule.wireTypes.lengthDelimited)
		var3262, var4776 = protoModule.writeString(var3262, var3263, self.selected_option)
		buff = var3262
		var3261 = var3263
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3264, var3265 = protoModule.writeTag(buff, var3261, 2, protoModule.wireTypes.lengthDelimited)
		var3264, var4778 = protoModule.writeString(var3264, var3265, self.sort_id)
		buff = var3264
		var3261 = var3265
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3266 = v:encode()
			local var3267, var3268 = protoModule.writeTag(buff, var3261, 3, protoModule.wireTypes.lengthDelimited)
			var3267, var4781 = protoModule.writeBuffer(var3267, var3268, var3266, buffer.len(var3266))
			buff = var3267
			var3261 = var3268
		end
	end
	if self.experience_carousel ~= nil then
		local var3269 = self.experience_carousel:encode()
		local var3270, var3271 = protoModule.writeTag(buff, var3261, 4, protoModule.wireTypes.lengthDelimited)
		var3270, var4784 = protoModule.writeBuffer(var3270, var3271, var3269, buffer.len(var3269))
		buff = var3270
		var3261 = var3271
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var3272, var3273 = protoModule.writeTag(buff, var3261, 5, protoModule.wireTypes.lengthDelimited)
		var3272, var4786 = protoModule.writeString(var3272, var3273, self.feed_item_key)
		buff = var3272
		var3261 = var3273
	end
	local buff_1 = buffer.create(var3261)
	buffer.copy(buff_1, 0, buff, 0, var3261)
	
	return buff_1
end

function t_122.decode(p122)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var3274 = t_122.new()
	local var3275 = 0
	while var3275 < buffer.len(p122) do
		local _ = nil
		local var3276 = nil
		local var3277, var3278, var3279 = protoModule.readTag(p122, var3275)
		local var3280 = var3277
		var3276 = var3278
		var3275 = var3279
		
		if var3276 == protoModule.wireTypes.varint then
			local _ = nil
			local var3281, var3282 = protoModule.readVarInt(p122, var3275)
			local _ = var3281
			var3275 = var3282
			continue
		end
		if var3276 == protoModule.wireTypes.lengthDelimited then
			if var3280 == 1 then
				local _ = nil
				local var3283, var3284 = protoModule.readBuffer(p122, var3275)
				var3275 = var3284
				var3274.selected_option = buffer.tostring(var3283)
			elseif var3280 == 2 then
				local _ = nil
				local var3285, var3286 = protoModule.readBuffer(p122, var3275)
				var3275 = var3286
				var3274.sort_id = buffer.tostring(var3285)
			elseif var3280 == 3 then
				local _ = nil
				local var3287, var3288 = protoModule.readBuffer(p122, var3275)
				var3275 = var3288
				table.insert(var3274.options, t.SelectorOption.decode(var3287))
			elseif var3280 == 4 then
				local _ = nil
				local var3289, var3290 = protoModule.readBuffer(p122, var3275)
				var3275 = var3290
				var3274.experience_carousel = t.ExperienceCarouselInputData.decode(var3289)
			elseif var3280 == 5 then
				local _ = nil
				local var3291, var3292 = protoModule.readBuffer(p122, var3275)
				var3275 = var3292
				var3274.feed_item_key = buffer.tostring(var3291)
			else
				local _ = nil
				local var3293, var3294 = protoModule.readVarInt(p122, var3275)
				var3275 = var3294 + var3293
			end
		elseif var3276 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3295, var3296 = protoModule.readFixed32(p122, var3275)
			local _ = var3295
			var3275 = var3296
		elseif var3276 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3297, var3298 = protoModule.readFixed64(p122, var3275)
			local _ = var3297
			var3275 = var3298
		else
			error("Unsupported wire type: " .. var4790)
		end
	end
	return var3274
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
	local var3299 = t_122.new()
	
	if self.selected_option ~= nil then
		var3299.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3299.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var3299.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3299.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3299.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3299.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3299.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var3299.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var3299.feed_item_key = self.feedItemKey
	end
	return var3299
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
	local var3300 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3301, var3302 = protoModule.writeTag(buff, var3300, 1, protoModule.wireTypes.lengthDelimited)
		var3301, var4820 = protoModule.writeString(var3301, var3302, self.id)
		buff = var3301
		var3300 = var3302
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3303, var3304 = protoModule.writeTag(buff, var3300, 2, protoModule.wireTypes.lengthDelimited)
		var3303, var4822 = protoModule.writeString(var3303, var3304, self.display_name)
		buff = var3303
		var3300 = var3304
	end
	if self.is_selected then
		local var3305, var3306 = protoModule.writeTag(buff, var3300, 3, protoModule.wireTypes.varint)
		var3305, var4824 = protoModule.writeVarInt(var3305, var3306, if self.is_selected then 1 else 0)
		buff = var3305
		var3300 = var3306
	end
	local buff_1 = buffer.create(var3300)
	buffer.copy(buff_1, 0, buff, 0, var3300)
	
	return buff_1
end

function t_123.decode(p123)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var3300 = t_123.new()
	local var3301 = 0
	while var3301 < buffer.len(p123) do
		local _ = nil
		local var3302 = nil
		local var3303, var3304, var3305 = protoModule.readTag(p123, var3301)
		local var3306 = var3303
		var3302 = var3304
		var3301 = var3305
		
		if var3302 == protoModule.wireTypes.varint then
			if var3306 == 3 then
				local _ = nil
				local var3307, var3308 = protoModule.readVarInt(p123, var3301)
				var3301 = var3308
				var3300.is_selected = var3307 ~= 0
			else
				local _ = nil
				local var3309, var3310 = protoModule.readVarInt(p123, var3301)
				local _ = var3309
				var3301 = var3310
			end
		end
		if var3302 == protoModule.wireTypes.lengthDelimited then
			if var3306 == 1 then
				local _ = nil
				local var3311, var3312 = protoModule.readBuffer(p123, var3301)
				var3301 = var3312
				var3300.id = buffer.tostring(var3311)
			elseif var3306 == 2 then
				local _ = nil
				local var3313, var3314 = protoModule.readBuffer(p123, var3301)
				var3301 = var3314
				var3300.display_name = buffer.tostring(var3313)
			else
				local _ = nil
				local var3315, var3316 = protoModule.readVarInt(p123, var3301)
				var3301 = var3316 + var3315
			end
		elseif var3302 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3317, var3318 = protoModule.readFixed32(p123, var3301)
			local _ = var3317
			var3301 = var3318
		elseif var3302 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3319, var3320 = protoModule.readFixed64(p123, var3301)
			local _ = var3319
			var3301 = var3320
		else
			error("Unsupported wire type: " .. var4828)
		end
	end
	return var3300
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
	local var3321 = t_123.new()
	
	if self.id ~= nil then
		var3321.id = self.id
	end
	if self.display_name ~= nil then
		var3321.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3321.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var3321.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var3321.is_selected = self.isSelected
	end
	return var3321
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
	local var3321 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var3322 = v:encode()
			local var3323, var3324 = protoModule.writeTag(buff, var3321, 1, protoModule.wireTypes.lengthDelimited)
			var3323, var4853 = protoModule.writeBuffer(var3323, var3324, var3322, buffer.len(var3322))
			buff = var3323
			var3321 = var3324
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var3325, var3326 = protoModule.writeTag(buff, var3321, 2, protoModule.wireTypes.lengthDelimited)
		var3325, var4855 = protoModule.writeString(var3325, var3326, self.title)
		buff = var3325
		var3321 = var3326
	end
	local buff_1 = buffer.create(var3321)
	buffer.copy(buff_1, 0, buff, 0, var3321)
	
	return buff_1
end

function t_124.decode(p124)
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var3327 = t_124.new()
	local var3328 = 0
	while var3328 < buffer.len(p124) do
		local _ = nil
		local var3329 = nil
		local var3330, var3331, var3332 = protoModule.readTag(p124, var3328)
		local var3333 = var3330
		var3329 = var3331
		var3328 = var3332
		
		if var3329 == protoModule.wireTypes.varint then
			local _ = nil
			local var3334, var3335 = protoModule.readVarInt(p124, var3328)
			local _ = var3334
			var3328 = var3335
			continue
		end
		if var3329 == protoModule.wireTypes.lengthDelimited then
			if var3333 == 1 then
				local _ = nil
				local var3336, var3337 = protoModule.readBuffer(p124, var3328)
				var3328 = var3337
				table.insert(var3327.cards, t.GameItemsCardInputData.decode(var3336))
			elseif var3333 == 2 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p124, var3328)
				var3328 = var3339
				var3327.title = buffer.tostring(var3338)
			else
				local _ = nil
				local var3340, var3341 = protoModule.readVarInt(p124, var3328)
				var3328 = var3341 + var3340
			end
		elseif var3329 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3342, var3343 = protoModule.readFixed32(p124, var3328)
			local _ = var3342
			var3328 = var3343
		elseif var3329 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3344, var3345 = protoModule.readFixed64(p124, var3328)
			local _ = var3344
			var3328 = var3345
		else
			error("Unsupported wire type: " .. var4859)
		end
	end
	return var3327
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
	local var3346 = t_124.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var3346.cards = t_1
	end
	if self.title ~= nil then
		var3346.title = self.title
	end
	return var3346
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
	local var3347 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3348, var3349 = protoModule.writeTag(buff, var3347, 1, protoModule.wireTypes.lengthDelimited)
		var3348, var4883 = protoModule.writeString(var3348, var3349, self.universe_id)
		buff = var3348
		var3347 = var3349
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3350 = v:encode()
			local var3351, var3352 = protoModule.writeTag(buff, var3347, 2, protoModule.wireTypes.lengthDelimited)
			var3351, var4886 = protoModule.writeBuffer(var3351, var3352, var3350, buffer.len(var3350))
			buff = var3351
			var3347 = var3352
		end
	end
	local buff_1 = buffer.create(var3347)
	buffer.copy(buff_1, 0, buff, 0, var3347)
	
	return buff_1
end

function t_125.decode(p125)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var3353 = t_125.new()
	local var3354 = 0
	while var3354 < buffer.len(p125) do
		local _ = nil
		local var3355 = nil
		local var3356, var3357, var3358 = protoModule.readTag(p125, var3354)
		local var3359 = var3356
		var3355 = var3357
		var3354 = var3358
		
		if var3355 == protoModule.wireTypes.varint then
			local _ = nil
			local var3360, var3361 = protoModule.readVarInt(p125, var3354)
			local _ = var3360
			var3354 = var3361
			continue
		end
		if var3355 == protoModule.wireTypes.lengthDelimited then
			if var3359 == 1 then
				local _ = nil
				local var3362, var3363 = protoModule.readBuffer(p125, var3354)
				var3354 = var3363
				var3353.universe_id = buffer.tostring(var3362)
			elseif var3359 == 2 then
				local _ = nil
				local var3364, var3365 = protoModule.readBuffer(p125, var3354)
				var3354 = var3365
				table.insert(var3353.items, t.GameItemInputData.decode(var3364))
			else
				local _ = nil
				local var3366, var3367 = protoModule.readVarInt(p125, var3354)
				var3354 = var3367 + var3366
			end
		elseif var3355 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3368, var3369 = protoModule.readFixed32(p125, var3354)
			local _ = var3368
			var3354 = var3369
		elseif var3355 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3370, var3371 = protoModule.readFixed64(p125, var3354)
			local _ = var3370
			var3354 = var3371
		else
			error("Unsupported wire type: " .. var4890)
		end
	end
	return var3353
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
	local var3372 = t_125.new()
	
	if self.universe_id ~= nil then
		var3372.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3372.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var3372.items = t_1
	end
	return var3372
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
	local var3373 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3374, var3375 = protoModule.writeTag(buff, var3373, 1, protoModule.wireTypes.lengthDelimited)
		var3374, var4914 = protoModule.writeString(var3374, var3375, self.item_id)
		buff = var3374
		var3373 = var3375
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3376, var3377 = protoModule.writeTag(buff, var3373, 2, protoModule.wireTypes.lengthDelimited)
		var3376, var4916 = protoModule.writeString(var3376, var3377, self.item_type)
		buff = var3376
		var3373 = var3377
	end
	local buff_1 = buffer.create(var3373)
	buffer.copy(buff_1, 0, buff, 0, var3373)
	
	return buff_1
end

function t_126.decode(p126)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var3373 = t_126.new()
	local var3374 = 0
	while var3374 < buffer.len(p126) do
		local _ = nil
		local var3375 = nil
		local var3376, var3377, var3378 = protoModule.readTag(p126, var3374)
		local var3379 = var3376
		var3375 = var3377
		var3374 = var3378
		
		if var3375 == protoModule.wireTypes.varint then
			local _ = nil
			local var3380, var3381 = protoModule.readVarInt(p126, var3374)
			local _ = var3380
			var3374 = var3381
			continue
		end
		if var3375 == protoModule.wireTypes.lengthDelimited then
			if var3379 == 1 then
				local _ = nil
				local var3382, var3383 = protoModule.readBuffer(p126, var3374)
				var3374 = var3383
				var3373.item_id = buffer.tostring(var3382)
			elseif var3379 == 2 then
				local _ = nil
				local var3384, var3385 = protoModule.readBuffer(p126, var3374)
				var3374 = var3385
				var3373.item_type = buffer.tostring(var3384)
			else
				local _ = nil
				local var3386, var3387 = protoModule.readVarInt(p126, var3374)
				var3374 = var3387 + var3386
			end
		elseif var3375 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3388, var3389 = protoModule.readFixed32(p126, var3374)
			local _ = var3388
			var3374 = var3389
		elseif var3375 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3390, var3391 = protoModule.readFixed64(p126, var3374)
			local _ = var3390
			var3374 = var3391
		else
			error("Unsupported wire type: " .. var4920)
		end
	end
	return var3373
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
	local var3392 = t_126.new()
	
	if self.item_id ~= nil then
		var3392.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3392.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3392.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3392.item_type = self.itemType
	end
	return var3392
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
	local var3392 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var3393, var3394 = protoModule.writeTag(buff, var3392, 1, protoModule.wireTypes.lengthDelimited)
		var3393, var4942 = protoModule.writeString(var3393, var3394, self.clickout_url)
		buff = var3393
		var3392 = var3394
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var3395, var3396 = protoModule.writeTag(buff, var3392, 2, protoModule.wireTypes.lengthDelimited)
		var3395, var4944 = protoModule.writeString(var3395, var3396, self.native_ad_data)
		buff = var3395
		var3392 = var3396
	end
	if self.payer_name ~= nil then
		local var3397, var3398 = protoModule.writeTag(buff, var3392, 3, protoModule.wireTypes.lengthDelimited)
		var3397, var4946 = protoModule.writeString(var3397, var3398, self.payer_name)
		buff = var3397
		var3392 = var3398
	end
	if self.logo_asset_id ~= nil then
		local var3399, var3400 = protoModule.writeTag(buff, var3392, 4, protoModule.wireTypes.lengthDelimited)
		var3399, var4948 = protoModule.writeString(var3399, var3400, self.logo_asset_id)
		buff = var3399
		var3392 = var3400
	end
	if self.logo_aspect_ratio ~= nil then
		local var3401, var3402 = protoModule.writeTag(buff, var3392, 5, protoModule.wireTypes.i64)
		var3401, var4950 = protoModule.writeDouble(var3401, var3402, self.logo_aspect_ratio)
		buff = var3401
		var3392 = var3402
	end
	if self.cta_text ~= nil then
		local var3403, var3404 = protoModule.writeTag(buff, var3392, 6, protoModule.wireTypes.lengthDelimited)
		var3403, var4952 = protoModule.writeString(var3403, var3404, self.cta_text)
		buff = var3403
		var3392 = var3404
	end
	if self.title ~= nil then
		local var3405, var3406 = protoModule.writeTag(buff, var3392, 7, protoModule.wireTypes.lengthDelimited)
		var3405, var4954 = protoModule.writeString(var3405, var3406, self.title)
		buff = var3405
		var3392 = var3406
	end
	if self.subtitle ~= nil then
		local var3407, var3408 = protoModule.writeTag(buff, var3392, 8, protoModule.wireTypes.lengthDelimited)
		var3407, var4956 = protoModule.writeString(var3407, var3408, self.subtitle)
		buff = var3407
		var3392 = var3408
	end
	if self.image_asset_id ~= nil then
		local var3409, var3410 = protoModule.writeTag(buff, var3392, 9, protoModule.wireTypes.lengthDelimited)
		var3409, var4958 = protoModule.writeString(var3409, var3410, self.image_asset_id)
		buff = var3409
		var3392 = var3410
	end
	if self.video_asset_id ~= nil then
		local var3411, var3412 = protoModule.writeTag(buff, var3392, 10, protoModule.wireTypes.lengthDelimited)
		var3411, var4960 = protoModule.writeString(var3411, var3412, self.video_asset_id)
		buff = var3411
		var3392 = var3412
	end
	if self.badge_text ~= nil then
		local var3413, var3414 = protoModule.writeTag(buff, var3392, 11, protoModule.wireTypes.lengthDelimited)
		var3413, var4962 = protoModule.writeString(var3413, var3414, self.badge_text)
		buff = var3413
		var3392 = var3414
	end
	if self.badge_analytics_id ~= nil then
		local var3415, var3416 = protoModule.writeTag(buff, var3392, 12, protoModule.wireTypes.lengthDelimited)
		var3415, var4964 = protoModule.writeString(var3415, var3416, self.badge_analytics_id)
		buff = var3415
		var3392 = var3416
	end
	if self.roblox_component ~= nil then
		local var3417, var3418 = protoModule.writeTag(buff, var3392, 13, protoModule.wireTypes.lengthDelimited)
		var3417, var4966 = protoModule.writeString(var3417, var3418, self.roblox_component)
		buff = var3417
		var3392 = var3418
	end
	local buff_1 = buffer.create(var3392)
	buffer.copy(buff_1, 0, buff, 0, var3392)
	
	return buff_1
end

function t_127.decode(p127)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var3392 = t_127.new()
	local var3393 = 0
	while var3393 < buffer.len(p127) do
		local _ = nil
		local var3394 = nil
		local var3395, var3396, var3397 = protoModule.readTag(p127, var3393)
		local var3398 = var3395
		var3394 = var3396
		var3393 = var3397
		
		if var3394 == protoModule.wireTypes.varint then
			local _ = nil
			local var3399, var3400 = protoModule.readVarInt(p127, var3393)
			local _ = var3399
			var3393 = var3400
			continue
		end
		if var3394 == protoModule.wireTypes.lengthDelimited then
			if var3398 == 1 then
				local _ = nil
				local var3401, var3402 = protoModule.readBuffer(p127, var3393)
				var3393 = var3402
				var3392.clickout_url = buffer.tostring(var3401)
			elseif var3398 == 2 then
				local _ = nil
				local var3403, var3404 = protoModule.readBuffer(p127, var3393)
				var3393 = var3404
				var3392.native_ad_data = buffer.tostring(var3403)
			elseif var3398 == 3 then
				local _ = nil
				local var3405, var3406 = protoModule.readBuffer(p127, var3393)
				var3393 = var3406
				var3392.payer_name = buffer.tostring(var3405)
			elseif var3398 == 4 then
				local _ = nil
				local var3407, var3408 = protoModule.readBuffer(p127, var3393)
				var3393 = var3408
				var3392.logo_asset_id = buffer.tostring(var3407)
			elseif var3398 == 6 then
				local _ = nil
				local var3409, var3410 = protoModule.readBuffer(p127, var3393)
				var3393 = var3410
				var3392.cta_text = buffer.tostring(var3409)
			elseif var3398 == 7 then
				local _ = nil
				local var3411, var3412 = protoModule.readBuffer(p127, var3393)
				var3393 = var3412
				var3392.title = buffer.tostring(var3411)
			elseif var3398 == 8 then
				local _ = nil
				local var3413, var3414 = protoModule.readBuffer(p127, var3393)
				var3393 = var3414
				var3392.subtitle = buffer.tostring(var3413)
			elseif var3398 == 9 then
				local _ = nil
				local var3415, var3416 = protoModule.readBuffer(p127, var3393)
				var3393 = var3416
				var3392.image_asset_id = buffer.tostring(var3415)
			elseif var3398 == 10 then
				local _ = nil
				local var3417, var3418 = protoModule.readBuffer(p127, var3393)
				var3393 = var3418
				var3392.video_asset_id = buffer.tostring(var3417)
			elseif var3398 == 11 then
				local _ = nil
				local var3419, var3420 = protoModule.readBuffer(p127, var3393)
				var3393 = var3420
				var3392.badge_text = buffer.tostring(var3419)
			elseif var3398 == 12 then
				local _ = nil
				local var3421, var3422 = protoModule.readBuffer(p127, var3393)
				var3393 = var3422
				var3392.badge_analytics_id = buffer.tostring(var3421)
			elseif var3398 == 13 then
				local _ = nil
				local var3423, var3424 = protoModule.readBuffer(p127, var3393)
				var3393 = var3424
				var3392.roblox_component = buffer.tostring(var3423)
			else
				local _ = nil
				local var3425, var3426 = protoModule.readVarInt(p127, var3393)
				var3393 = var3426 + var3425
			end
		elseif var3394 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3427, var3428 = protoModule.readFixed32(p127, var3393)
			local _ = var3427
			var3393 = var3428
		elseif var3394 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4970)
		elseif var3398 == 5 then
			local _ = nil
			local var3429, var3430 = protoModule.readDouble(p127, var3393)
			var3393 = var3430
			var3392.logo_aspect_ratio = var3429
		else
			local _ = nil
			local var3431, var3432 = protoModule.readFixed64(p127, var3393)
			local _ = var3431
			var3393 = var3432
		end
	end
	return var3392
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
	local var3433 = t_127.new()
	
	if self.clickout_url ~= nil then
		var3433.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var3433.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var3433.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var3433.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var3433.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var3433.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var3433.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var3433.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var3433.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var3433.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var3433.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var3433.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var3433.title = self.title
	end
	if self.subtitle ~= nil then
		var3433.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var3433.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var3433.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var3433.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3433.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var3433.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var3433.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var3433.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var3433.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var3433.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var3433.roblox_component = self.robloxComponent
	end
	return var3433
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
	local var3433 = 0
	
	if self.layout ~= nil then
		local var3434 = self.layout:encode()
		local var3435, var3436 = protoModule.writeTag(buff, var3433, 1, protoModule.wireTypes.lengthDelimited)
		var3435, var5015 = protoModule.writeBuffer(var3435, var3436, var3434, buffer.len(var3434))
		buff = var3435
		var3433 = var3436
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var3437 = self.kind.value:encode()
			local var3438, var3439 = protoModule.writeTag(buff, var3433, 2, protoModule.wireTypes.lengthDelimited)
			var3438, var5018 = protoModule.writeBuffer(var3438, var3439, var3437, buffer.len(var3437))
			buff = var3438
			var3433 = var3439
		elseif self.kind.type == "ad_link" then
			local var3440 = self.kind.value:encode()
			local var3441, var3442 = protoModule.writeTag(buff, var3433, 3, protoModule.wireTypes.lengthDelimited)
			var3441, var5021 = protoModule.writeBuffer(var3441, var3442, var3440, buffer.len(var3440))
			buff = var3441
			var3433 = var3442
		end
	end
	local buff_1 = buffer.create(var3433)
	buffer.copy(buff_1, 0, buff, 0, var3433)
	
	return buff_1
end

function t_128.decode(p128)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var3433 = t_128.new()
	local var3434 = 0
	while var3434 < buffer.len(p128) do
		local _ = nil
		local var3435 = nil
		local var3436, var3437, var3438 = protoModule.readTag(p128, var3434)
		local var3439 = var3436
		var3435 = var3437
		var3434 = var3438
		
		if var3435 == protoModule.wireTypes.varint then
			local _ = nil
			local var3440, var3441 = protoModule.readVarInt(p128, var3434)
			local _ = var3440
			var3434 = var3441
			continue
		end
		if var3435 == protoModule.wireTypes.lengthDelimited then
			if var3439 == 1 then
				local _ = nil
				local var3442, var3443 = protoModule.readBuffer(p128, var3434)
				var3434 = var3443
				var3433.layout = t.ItemLayout.decode(var3442)
			elseif var3439 == 2 then
				local _ = nil
				local var3444, var3445 = protoModule.readBuffer(p128, var3434)
				var3434 = var3445
				var3433.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var3444)
				}
			elseif var3439 == 3 then
				local _ = nil
				local var3446, var3447 = protoModule.readBuffer(p128, var3434)
				var3434 = var3447
				var3433.kind = { type = "ad_link", value = t.AdLinkItem.decode(var3446) }
			else
				local _ = nil
				local var3448, var3449 = protoModule.readVarInt(p128, var3434)
				var3434 = var3449 + var3448
			end
		elseif var3435 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3450, var3451 = protoModule.readFixed32(p128, var3434)
			local _ = var3450
			var3434 = var3451
		elseif var3435 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3452, var3453 = protoModule.readFixed64(p128, var3434)
			local _ = var3452
			var3434 = var3453
		else
			error("Unsupported wire type: " .. var5025)
		end
	end
	return var3433
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
	local var3454 = t_128.new()
	
	if self.layout ~= nil then
		var3454.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var3454.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var3454.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var3454.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var3454
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
	local var3454 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3455 = v:encode()
			local var3456, var3457 = protoModule.writeTag(buff, var3454, 1, protoModule.wireTypes.lengthDelimited)
			var3456, var5050 = protoModule.writeBuffer(var3456, var3457, var3455, buffer.len(var3455))
			buff = var3456
			var3454 = var3457
		end
	end
	if self.collection_item_size ~= nil then
		local var3458, var3459 = protoModule.writeTag(buff, var3454, 2, protoModule.wireTypes.lengthDelimited)
		var3458, var5052 = protoModule.writeString(var3458, var3459, self.collection_item_size)
		buff = var3458
		var3454 = var3459
	end
	local buff_1 = buffer.create(var3454)
	buffer.copy(buff_1, 0, buff, 0, var3454)
	
	return buff_1
end

function t_129.decode(p129)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var3460 = t_129.new()
	local var3461 = 0
	while var3461 < buffer.len(p129) do
		local _ = nil
		local var3462 = nil
		local var3463, var3464, var3465 = protoModule.readTag(p129, var3461)
		local var3466 = var3463
		var3462 = var3464
		var3461 = var3465
		
		if var3462 == protoModule.wireTypes.varint then
			local _ = nil
			local var3467, var3468 = protoModule.readVarInt(p129, var3461)
			local _ = var3467
			var3461 = var3468
			continue
		end
		if var3462 == protoModule.wireTypes.lengthDelimited then
			if var3466 == 1 then
				local _ = nil
				local var3469, var3470 = protoModule.readBuffer(p129, var3461)
				var3461 = var3470
				table.insert(var3460.items, t.ItemWithLayout.decode(var3469))
			elseif var3466 == 2 then
				local _ = nil
				local var3471, var3472 = protoModule.readBuffer(p129, var3461)
				var3461 = var3472
				var3460.collection_item_size = buffer.tostring(var3471)
			else
				local _ = nil
				local var3473, var3474 = protoModule.readVarInt(p129, var3461)
				var3461 = var3474 + var3473
			end
		elseif var3462 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3475, var3476 = protoModule.readFixed32(p129, var3461)
			local _ = var3475
			var3461 = var3476
		elseif var3462 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3477, var3478 = protoModule.readFixed64(p129, var3461)
			local _ = var3477
			var3461 = var3478
		else
			error("Unsupported wire type: " .. var5056)
		end
	end
	return var3460
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
	local var3479 = t_129.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var3479.items = t_1
	end
	if self.collection_item_size ~= nil then
		var3479.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var3479.collection_item_size = self.collectionItemSize
	end
	return var3479
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
	local var3480 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var3481, var3482 = protoModule.writeTag(buff, var3480, 1, protoModule.wireTypes.varint)
		var3481, var5080 = protoModule.writeVarInt(var3481, var3482, self.col_span)
		buff = var3481
		var3480 = var3482
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var3483, var3484 = protoModule.writeTag(buff, var3480, 2, protoModule.wireTypes.varint)
		var3483, var5082 = protoModule.writeVarInt(var3483, var3484, self.row_span)
		buff = var3483
		var3480 = var3484
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var3485, var3486 = protoModule.writeTag(buff, var3480, 3, protoModule.wireTypes.lengthDelimited)
		var3485, var5084 = protoModule.writeString(var3485, var3486, self.alignment_type)
		buff = var3485
		var3480 = var3486
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var3487, var3488 = protoModule.writeTag(buff, var3480, 4, protoModule.wireTypes.varint)
		var3487, var5086 = protoModule.writeVarInt(var3487, var3488, self.min_row_padding)
		buff = var3487
		var3480 = var3488
	end
	local buff_1 = buffer.create(var3480)
	buffer.copy(buff_1, 0, buff, 0, var3480)
	
	return buff_1
end

function t_130.decode(p130)
	-- upvalues: t_130 (ref), protoModule (ref)
	local var3480 = t_130.new()
	local var3481 = 0
	while var3481 < buffer.len(p130) do
		local _ = nil
		local var3482 = nil
		local var3483, var3484, var3485 = protoModule.readTag(p130, var3481)
		local var3486 = var3483
		var3482 = var3484
		var3481 = var3485
		
		if var3482 == protoModule.wireTypes.varint then
			if var3486 == 1 then
				local _ = nil
				local var3487, var3488 = protoModule.readVarIntI32(p130, var3481)
				var3481 = var3488
				var3480.col_span = var3487
			elseif var3486 == 2 then
				local _ = nil
				local var3489, var3490 = protoModule.readVarIntI32(p130, var3481)
				var3481 = var3490
				var3480.row_span = var3489
			elseif var3486 == 4 then
				local _ = nil
				local var3491, var3492 = protoModule.readVarIntI32(p130, var3481)
				var3481 = var3492
				var3480.min_row_padding = var3491
			else
				local _ = nil
				local var3493, var3494 = protoModule.readVarInt(p130, var3481)
				local _ = var3493
				var3481 = var3494
			end
		end
		if var3482 == protoModule.wireTypes.lengthDelimited then
			if var3486 == 3 then
				local _ = nil
				local var3495, var3496 = protoModule.readBuffer(p130, var3481)
				var3481 = var3496
				var3480.alignment_type = buffer.tostring(var3495)
			else
				local _ = nil
				local var3497, var3498 = protoModule.readVarInt(p130, var3481)
				var3481 = var3498 + var3497
			end
		elseif var3482 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3499, var3500 = protoModule.readFixed32(p130, var3481)
			local _ = var3499
			var3481 = var3500
		elseif var3482 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3501, var3502 = protoModule.readFixed64(p130, var3481)
			local _ = var3501
			var3481 = var3502
		else
			error("Unsupported wire type: " .. var5090)
		end
	end
	return var3480
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
	local var3503 = t_130.new()
	
	if self.col_span ~= nil then
		var3503.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var3503.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var3503.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var3503.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var3503.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var3503.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var3503.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var3503.min_row_padding = self.minRowPadding
	end
	return var3503
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
	local var3503 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var3504, var3505 = protoModule.writeTag(buff, var3503, 1, protoModule.wireTypes.lengthDelimited)
		var3504, var5116 = protoModule.writeString(var3504, var3505, self.community_id)
		buff = var3504
		var3503 = var3505
	end
	if self.announcement_id ~= nil and self.announcement_id ~= "" then
		local var3506, var3507 = protoModule.writeTag(buff, var3503, 2, protoModule.wireTypes.lengthDelimited)
		var3506, var5118 = protoModule.writeString(var3506, var3507, self.announcement_id)
		buff = var3506
		var3503 = var3507
	end
	if self.message_id ~= nil and self.message_id ~= "" then
		local var3508, var3509 = protoModule.writeTag(buff, var3503, 3, protoModule.wireTypes.lengthDelimited)
		var3508, var5120 = protoModule.writeString(var3508, var3509, self.message_id)
		buff = var3508
		var3503 = var3509
	end
	if self.title ~= nil and self.title ~= "" then
		local var3510, var3511 = protoModule.writeTag(buff, var3503, 4, protoModule.wireTypes.lengthDelimited)
		var3510, var5122 = protoModule.writeString(var3510, var3511, self.title)
		buff = var3510
		var3503 = var3511
	end
	if self.body ~= nil and self.body ~= "" then
		local var3512, var3513 = protoModule.writeTag(buff, var3503, 5, protoModule.wireTypes.lengthDelimited)
		var3512, var5124 = protoModule.writeString(var3512, var3513, self.body)
		buff = var3512
		var3503 = var3513
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var3514, var3515 = protoModule.writeTag(buff, var3503, 6, protoModule.wireTypes.lengthDelimited)
		var3514, var5126 = protoModule.writeString(var3514, var3515, self.creator_key)
		buff = var3514
		var3503 = var3515
	end
	if self.creator_role_name ~= nil then
		local var3516, var3517 = protoModule.writeTag(buff, var3503, 7, protoModule.wireTypes.lengthDelimited)
		var3516, var5128 = protoModule.writeString(var3516, var3517, self.creator_role_name)
		buff = var3516
		var3503 = var3517
	end
	if self.media_asset_id ~= nil then
		local var3518, var3519 = protoModule.writeTag(buff, var3503, 8, protoModule.wireTypes.lengthDelimited)
		var3518, var5130 = protoModule.writeString(var3518, var3519, self.media_asset_id)
		buff = var3518
		var3503 = var3519
	end
	if self.created_time ~= nil then
		local var3520 = self.created_time:encode()
		local var3521, var3522 = protoModule.writeTag(buff, var3503, 9, protoModule.wireTypes.lengthDelimited)
		var3521, var5133 = protoModule.writeBuffer(var3521, var3522, var3520, buffer.len(var3520))
		buff = var3521
		var3503 = var3522
	end
	local buff_1 = buffer.create(var3503)
	buffer.copy(buff_1, 0, buff, 0, var3503)
	
	return buff_1
end

function t_131.decode(p131)
	-- upvalues: t_131 (ref), protoModule (ref), timestampModule (ref)
	local var3503 = t_131.new()
	local var3504 = 0
	while var3504 < buffer.len(p131) do
		local _ = nil
		local var3505 = nil
		local var3506, var3507, var3508 = protoModule.readTag(p131, var3504)
		local var3509 = var3506
		var3505 = var3507
		var3504 = var3508
		
		if var3505 == protoModule.wireTypes.varint then
			local _ = nil
			local var3510, var3511 = protoModule.readVarInt(p131, var3504)
			local _ = var3510
			var3504 = var3511
			continue
		end
		if var3505 == protoModule.wireTypes.lengthDelimited then
			if var3509 == 1 then
				local _ = nil
				local var3512, var3513 = protoModule.readBuffer(p131, var3504)
				var3504 = var3513
				var3503.community_id = buffer.tostring(var3512)
			elseif var3509 == 2 then
				local _ = nil
				local var3514, var3515 = protoModule.readBuffer(p131, var3504)
				var3504 = var3515
				var3503.announcement_id = buffer.tostring(var3514)
			elseif var3509 == 3 then
				local _ = nil
				local var3516, var3517 = protoModule.readBuffer(p131, var3504)
				var3504 = var3517
				var3503.message_id = buffer.tostring(var3516)
			elseif var3509 == 4 then
				local _ = nil
				local var3518, var3519 = protoModule.readBuffer(p131, var3504)
				var3504 = var3519
				var3503.title = buffer.tostring(var3518)
			elseif var3509 == 5 then
				local _ = nil
				local var3520, var3521 = protoModule.readBuffer(p131, var3504)
				var3504 = var3521
				var3503.body = buffer.tostring(var3520)
			elseif var3509 == 6 then
				local _ = nil
				local var3522, var3523 = protoModule.readBuffer(p131, var3504)
				var3504 = var3523
				var3503.creator_key = buffer.tostring(var3522)
			elseif var3509 == 7 then
				local _ = nil
				local var3524, var3525 = protoModule.readBuffer(p131, var3504)
				var3504 = var3525
				var3503.creator_role_name = buffer.tostring(var3524)
			elseif var3509 == 8 then
				local _ = nil
				local var3526, var3527 = protoModule.readBuffer(p131, var3504)
				var3504 = var3527
				var3503.media_asset_id = buffer.tostring(var3526)
			elseif var3509 == 9 then
				local _ = nil
				local var3528, var3529 = protoModule.readBuffer(p131, var3504)
				var3504 = var3529
				var3503.created_time = timestampModule.Timestamp.decode(var3528)
			else
				local _ = nil
				local var3530, var3531 = protoModule.readVarInt(p131, var3504)
				var3504 = var3531 + var3530
			end
		elseif var3505 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3532, var3533 = protoModule.readFixed32(p131, var3504)
			local _ = var3532
			var3504 = var3533
		elseif var3505 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3534, var3535 = protoModule.readFixed64(p131, var3504)
			local _ = var3534
			var3504 = var3535
		else
			error("Unsupported wire type: " .. var5137)
		end
	end
	return var3503
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
	local var3536 = t_131.new()
	
	if self.community_id ~= nil then
		var3536.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var3536.community_id = self.communityId
	end
	if self.announcement_id ~= nil then
		var3536.announcement_id = self.announcement_id
	end
	if self.announcementId ~= nil then
		var3536.announcement_id = self.announcementId
	end
	if self.message_id ~= nil then
		var3536.message_id = self.message_id
	end
	if self.messageId ~= nil then
		var3536.message_id = self.messageId
	end
	if self.title ~= nil then
		var3536.title = self.title
	end
	if self.body ~= nil then
		var3536.body = self.body
	end
	if self.creator_key ~= nil then
		var3536.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var3536.creator_key = self.creatorKey
	end
	if self.creator_role_name ~= nil then
		var3536.creator_role_name = self.creator_role_name
	end
	if self.creatorRoleName ~= nil then
		var3536.creator_role_name = self.creatorRoleName
	end
	if self.media_asset_id ~= nil then
		var3536.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var3536.media_asset_id = self.mediaAssetId
	end
	if self.created_time ~= nil then
		var3536.created_time = timestampModule.Timestamp.jsonDecode(self.created_time)
	end
	if self.createdTime ~= nil then
		var3536.created_time = timestampModule.Timestamp.jsonDecode(self.createdTime)
	end
	return var3536
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