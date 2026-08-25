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
	local var1 = t_1.new()
	
	if self.page_entry ~= nil then
		var1.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var1.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.input_data ~= nil then
		var1.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var1.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	return var1
end

t_1.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t.UniversalPageEntry = t_1
typeRegistryModule.default:register(t.UniversalPageEntry)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p1)
	-- upvalues: t_2 (ref)
	return setmetatable({
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data,
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.input_data ~= nil then
		local var2 = self.input_data:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var169 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var171 = protoModule.writeString(var5, var6, self.roblox_component)
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_2.decode(p1)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var1 = t_2.new()
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
				var1.input_data = t.PageEntryInputData.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.roblox_component = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var175)
		end
	end
	return var1
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
	local var1 = t_2.new()
	
	if self.input_data ~= nil then
		var1.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var1.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	if self.roblox_component ~= nil then
		var1.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1.roblox_component = self.robloxComponent
	end
	return var1
end

t_2.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t.FeedEntry = t_2
typeRegistryModule.default:register(t.FeedEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p1)
	-- upvalues: t_3 (ref)
	return setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data,
		cta_buttons = if p1 == nil or p1.cta_buttons == nil then nil else p1.cta_buttons
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var197 = protoModule.writeString(var2, var3, self.roblox_component)
		buff = var2
		var1 = var3
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var4 = self.input_data.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var200 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	if self.cta_buttons ~= nil then
		local var7 = self.cta_buttons:encode()
		local var8, var9 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var8, var203 = protoModule.writeBuffer(var8, var9, var7, buffer.len(var7))
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_3.decode(p1)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var1 = t_3.new()
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
				var1.roblox_component = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(var12)
				}
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.cta_buttons = t.CtaButtonsInputData.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var207)
		end
	end
	return var1
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
	local var1 = t_3.new()
	
	if self.roblox_component ~= nil then
		var1.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1.roblox_component = self.robloxComponent
	end
	if self.attribution_row ~= nil then
		var1.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attribution_row)
		}
	end
	if self.attributionRow ~= nil then
		var1.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attributionRow)
		}
	end
	if self.cta_buttons ~= nil then
		var1.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.cta_buttons)
	end
	if self.ctaButtons ~= nil then
		var1.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.ctaButtons)
	end
	return var1
end

t_3.descriptor = {
	name = "ForegroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ForegroundHeaderEntry"
}
t.ForegroundHeaderEntry = t_3
typeRegistryModule.default:register(t.ForegroundHeaderEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p1)
	-- upvalues: t_4 (ref)
	return setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		input_data = if p1 == nil or p1.input_data == nil then nil else p1.input_data
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var231 = protoModule.writeString(var2, var3, self.roblox_component)
		buff = var2
		var1 = var3
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var4 = self.input_data.value:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var234 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		elseif self.input_data.type == "video" then
			local var7 = self.input_data.value:encode()
			local var8, var9 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var8, var237 = protoModule.writeBuffer(var8, var9, var7, buffer.len(var7))
			buff = var8
			var1 = var9
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_4.decode(p1)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var1 = t_4.new()
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
				var1.roblox_component = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.input_data = { type = "image", value = t.ImageInputData.decode(var12) }
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.input_data = { type = "video", value = t.VideoInputData.decode(var14) }
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var241)
		end
	end
	return var1
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
	local var1 = t_4.new()
	
	if self.roblox_component ~= nil then
		var1.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1.roblox_component = self.robloxComponent
	end
	if self.image ~= nil then
		var1.input_data = {
			type = "image",
			value = t.ImageInputData.jsonDecode(self.image)
		}
	end
	if self.video ~= nil then
		var1.input_data = {
			type = "video",
			value = t.VideoInputData.jsonDecode(self.video)
		}
	end
	return var1
end

t_4.descriptor = {
	name = "BackgroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundHeaderEntry"
}
t.BackgroundHeaderEntry = t_4
typeRegistryModule.default:register(t.BackgroundHeaderEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p1)
	-- upvalues: t_5 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var266 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "badge_details" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var269 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		elseif self.kind.type == "static_content" then
			local var8 = self.kind.value:encode()
			local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var9, var272 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
			buff = var9
			var1 = var10
		elseif self.kind.type == "experience_attribution_row" then
			local var11 = self.kind.value:encode()
			local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var12, var275 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
			buff = var12
			var1 = var13
		elseif self.kind.type == "experience_action_module" then
			local var14 = self.kind.value:encode()
			local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var15, var278 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
			buff = var15
			var1 = var16
		elseif self.kind.type == "experience_media_gallery" then
			local var17 = self.kind.value:encode()
			local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var18, var281 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
			buff = var18
			var1 = var19
		elseif self.kind.type == "experience_description" then
			local var20 = self.kind.value:encode()
			local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var21, var284 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
			buff = var21
			var1 = var22
		elseif self.kind.type == "experience_stat_row" then
			local var23 = self.kind.value:encode()
			local var24, var25 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var24, var287 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
			buff = var24
			var1 = var25
		elseif self.kind.type == "experience_info_table" then
			local var26 = self.kind.value:encode()
			local var27, var28 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
			var27, var290 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
			buff = var27
			var1 = var28
		elseif self.kind.type == "social_link_row" then
			local var29 = self.kind.value:encode()
			local var30, var31 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
			var30, var293 = protoModule.writeBuffer(var30, var31, var29, buffer.len(var29))
			buff = var30
			var1 = var31
		elseif self.kind.type == "experience_carousel" then
			local var32 = self.kind.value:encode()
			local var33, var34 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
			var33, var296 = protoModule.writeBuffer(var33, var34, var32, buffer.len(var32))
			buff = var33
			var1 = var34
		elseif self.kind.type == "song_carousel" then
			local var35 = self.kind.value:encode()
			local var36, var37 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
			var36, var299 = protoModule.writeBuffer(var36, var37, var35, buffer.len(var35))
			buff = var36
			var1 = var37
		elseif self.kind.type == "events_carousel" then
			local var38 = self.kind.value:encode()
			local var39, var40 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
			var39, var302 = protoModule.writeBuffer(var39, var40, var38, buffer.len(var38))
			buff = var39
			var1 = var40
		elseif self.kind.type == "game_pass_collection" then
			local var41 = self.kind.value:encode()
			local var42, var43 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
			var42, var305 = protoModule.writeBuffer(var42, var43, var41, buffer.len(var41))
			buff = var42
			var1 = var43
		elseif self.kind.type == "developer_product_collection" then
			local var44 = self.kind.value:encode()
			local var45, var46 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
			var45, var308 = protoModule.writeBuffer(var45, var46, var44, buffer.len(var44))
			buff = var45
			var1 = var46
		elseif self.kind.type == "subscription_collection" then
			local var47 = self.kind.value:encode()
			local var48, var49 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
			var48, var311 = protoModule.writeBuffer(var48, var49, var47, buffer.len(var47))
			buff = var48
			var1 = var49
		elseif self.kind.type == "dynamic_store_category" then
			local var50 = self.kind.value:encode()
			local var51, var52 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
			var51, var314 = protoModule.writeBuffer(var51, var52, var50, buffer.len(var50))
			buff = var51
			var1 = var52
		elseif self.kind.type == "card_container" then
			local var53 = self.kind.value:encode()
			local var54, var55 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
			var54, var317 = protoModule.writeBuffer(var54, var55, var53, buffer.len(var53))
			buff = var54
			var1 = var55
		elseif self.kind.type == "card" then
			local var56 = self.kind.value:encode()
			local var57, var58 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.lengthDelimited)
			var57, var320 = protoModule.writeBuffer(var57, var58, var56, buffer.len(var56))
			buff = var57
			var1 = var58
		elseif self.kind.type == "dialog" then
			local var59 = self.kind.value:encode()
			local var60, var61 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
			var60, var323 = protoModule.writeBuffer(var60, var61, var59, buffer.len(var59))
			buff = var60
			var1 = var61
		elseif self.kind.type == "banner" then
			local var62 = self.kind.value:encode()
			local var63, var64 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
			var63, var326 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
			buff = var63
			var1 = var64
		elseif self.kind.type == "tooltip" then
			local var65 = self.kind.value:encode()
			local var66, var67 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.lengthDelimited)
			var66, var329 = protoModule.writeBuffer(var66, var67, var65, buffer.len(var65))
			buff = var66
			var1 = var67
		elseif self.kind.type == "coachmark" then
			local var68 = self.kind.value:encode()
			local var69, var70 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
			var69, var332 = protoModule.writeBuffer(var69, var70, var68, buffer.len(var68))
			buff = var69
			var1 = var70
		elseif self.kind.type == "system_banner_prompt" then
			local var71 = self.kind.value:encode()
			local var72, var73 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
			var72, var335 = protoModule.writeBuffer(var72, var73, var71, buffer.len(var71))
			buff = var72
			var1 = var73
		elseif self.kind.type == "age_check_upsell" then
			local var74 = self.kind.value:encode()
			local var75, var76 = protoModule.writeTag(buff, var1, 29, protoModule.wireTypes.lengthDelimited)
			var75, var338 = protoModule.writeBuffer(var75, var76, var74, buffer.len(var74))
			buff = var75
			var1 = var76
		elseif self.kind.type == "catalog_item_list" then
			local var77 = self.kind.value:encode()
			local var78, var79 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
			var78, var341 = protoModule.writeBuffer(var78, var79, var77, buffer.len(var77))
			buff = var78
			var1 = var79
		elseif self.kind.type == "user_list" then
			local var80 = self.kind.value:encode()
			local var81, var82 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.lengthDelimited)
			var81, var344 = protoModule.writeBuffer(var81, var82, var80, buffer.len(var80))
			buff = var81
			var1 = var82
		elseif self.kind.type == "experience_content_rating_label" then
			local var83 = self.kind.value:encode()
			local var84, var85 = protoModule.writeTag(buff, var1, 30, protoModule.wireTypes.lengthDelimited)
			var84, var347 = protoModule.writeBuffer(var84, var85, var83, buffer.len(var83))
			buff = var84
			var1 = var85
		elseif self.kind.type == "experience_refund_policy" then
			local var86 = self.kind.value:encode()
			local var87, var88 = protoModule.writeTag(buff, var1, 31, protoModule.wireTypes.lengthDelimited)
			var87, var350 = protoModule.writeBuffer(var87, var88, var86, buffer.len(var86))
			buff = var87
			var1 = var88
		elseif self.kind.type == "experience_play_with_reward" then
			local var89 = self.kind.value:encode()
			local var90, var91 = protoModule.writeTag(buff, var1, 32, protoModule.wireTypes.lengthDelimited)
			var90, var353 = protoModule.writeBuffer(var90, var91, var89, buffer.len(var89))
			buff = var90
			var1 = var91
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var92 = self.kind.value:encode()
			local var93, var94 = protoModule.writeTag(buff, var1, 33, protoModule.wireTypes.lengthDelimited)
			var93, var356 = protoModule.writeBuffer(var93, var94, var92, buffer.len(var92))
			buff = var93
			var1 = var94
		elseif self.kind.type == "community_section" then
			local var95 = self.kind.value:encode()
			local var96, var97 = protoModule.writeTag(buff, var1, 35, protoModule.wireTypes.lengthDelimited)
			var96, var359 = protoModule.writeBuffer(var96, var97, var95, buffer.len(var95))
			buff = var96
			var1 = var97
		elseif self.kind.type == "moments_carousel" then
			local var98 = self.kind.value:encode()
			local var99, var100 = protoModule.writeTag(buff, var1, 34, protoModule.wireTypes.lengthDelimited)
			var99, var362 = protoModule.writeBuffer(var99, var100, var98, buffer.len(var98))
			buff = var99
			var1 = var100
		elseif self.kind.type == "text" then
			local var101 = self.kind.value:encode()
			local var102, var103 = protoModule.writeTag(buff, var1, 40, protoModule.wireTypes.lengthDelimited)
			var102, var365 = protoModule.writeBuffer(var102, var103, var101, buffer.len(var101))
			buff = var102
			var1 = var103
		elseif self.kind.type == "vertical_feed" then
			local var104 = self.kind.value:encode()
			local var105, var106 = protoModule.writeTag(buff, var1, 41, protoModule.wireTypes.lengthDelimited)
			var105, var368 = protoModule.writeBuffer(var105, var106, var104, buffer.len(var104))
			buff = var105
			var1 = var106
		elseif self.kind.type == "page_header" then
			local var107 = self.kind.value:encode()
			local var108, var109 = protoModule.writeTag(buff, var1, 42, protoModule.wireTypes.lengthDelimited)
			var108, var371 = protoModule.writeBuffer(var108, var109, var107, buffer.len(var107))
			buff = var108
			var1 = var109
		elseif self.kind.type == "image_cta_section" then
			local var110 = self.kind.value:encode()
			local var111, var112 = protoModule.writeTag(buff, var1, 43, protoModule.wireTypes.lengthDelimited)
			var111, var374 = protoModule.writeBuffer(var111, var112, var110, buffer.len(var110))
			buff = var111
			var1 = var112
		elseif self.kind.type == "experience_details_feed" then
			local var113 = self.kind.value:encode()
			local var114, var115 = protoModule.writeTag(buff, var1, 500, protoModule.wireTypes.lengthDelimited)
			var114, var377 = protoModule.writeBuffer(var114, var115, var113, buffer.len(var113))
			buff = var114
			var1 = var115
		elseif self.kind.type == "experience_details_action_bar" then
			local var116 = self.kind.value:encode()
			local var117, var118 = protoModule.writeTag(buff, var1, 501, protoModule.wireTypes.lengthDelimited)
			var117, var380 = protoModule.writeBuffer(var117, var118, var116, buffer.len(var116))
			buff = var117
			var1 = var118
		elseif self.kind.type == "experience_details_banner_image" then
			local var119 = self.kind.value:encode()
			local var120, var121 = protoModule.writeTag(buff, var1, 502, protoModule.wireTypes.lengthDelimited)
			var120, var383 = protoModule.writeBuffer(var120, var121, var119, buffer.len(var119))
			buff = var120
			var1 = var121
		elseif self.kind.type == "experience_details_sticky_header" then
			local var122 = self.kind.value:encode()
			local var123, var124 = protoModule.writeTag(buff, var1, 503, protoModule.wireTypes.lengthDelimited)
			var123, var386 = protoModule.writeBuffer(var123, var124, var122, buffer.len(var122))
			buff = var123
			var1 = var124
		elseif self.kind.type == "event_details_feed" then
			local var125 = self.kind.value:encode()
			local var126, var127 = protoModule.writeTag(buff, var1, 600, protoModule.wireTypes.lengthDelimited)
			var126, var389 = protoModule.writeBuffer(var126, var127, var125, buffer.len(var125))
			buff = var126
			var1 = var127
		elseif self.kind.type == "event_details_action_bar" then
			local var128 = self.kind.value:encode()
			local var129, var130 = protoModule.writeTag(buff, var1, 601, protoModule.wireTypes.lengthDelimited)
			var129, var392 = protoModule.writeBuffer(var129, var130, var128, buffer.len(var128))
			buff = var129
			var1 = var130
		elseif self.kind.type == "event_attribution_row" then
			local var131 = self.kind.value:encode()
			local var132, var133 = protoModule.writeTag(buff, var1, 602, protoModule.wireTypes.lengthDelimited)
			var132, var395 = protoModule.writeBuffer(var132, var133, var131, buffer.len(var131))
			buff = var132
			var1 = var133
		elseif self.kind.type == "event_description" then
			local var134 = self.kind.value:encode()
			local var135, var136 = protoModule.writeTag(buff, var1, 603, protoModule.wireTypes.lengthDelimited)
			var135, var398 = protoModule.writeBuffer(var135, var136, var134, buffer.len(var134))
			buff = var135
			var1 = var136
		elseif self.kind.type == "event_info_table" then
			local var137 = self.kind.value:encode()
			local var138, var139 = protoModule.writeTag(buff, var1, 604, protoModule.wireTypes.lengthDelimited)
			var138, var401 = protoModule.writeBuffer(var138, var139, var137, buffer.len(var137))
			buff = var138
			var1 = var139
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var140 = self.kind.value:encode()
			local var141, var142 = protoModule.writeTag(buff, var1, 605, protoModule.wireTypes.lengthDelimited)
			var141, var404 = protoModule.writeBuffer(var141, var142, var140, buffer.len(var140))
			buff = var141
			var1 = var142
		elseif self.kind.type == "event_notifications_modal" then
			local var143 = self.kind.value:encode()
			local var144, var145 = protoModule.writeTag(buff, var1, 606, protoModule.wireTypes.lengthDelimited)
			var144, var407 = protoModule.writeBuffer(var144, var145, var143, buffer.len(var143))
			buff = var144
			var1 = var145
		elseif self.kind.type == "dev_store_feed" then
			local var146 = self.kind.value:encode()
			local var147, var148 = protoModule.writeTag(buff, var1, 700, protoModule.wireTypes.lengthDelimited)
			var147, var410 = protoModule.writeBuffer(var147, var148, var146, buffer.len(var146))
			buff = var147
			var1 = var148
		elseif self.kind.type == "charts_feed" then
			local var149 = self.kind.value:encode()
			local var150, var151 = protoModule.writeTag(buff, var1, 800, protoModule.wireTypes.lengthDelimited)
			var150, var413 = protoModule.writeBuffer(var150, var151, var149, buffer.len(var149))
			buff = var150
			var1 = var151
		elseif self.kind.type == "filter_pills" then
			local var152 = self.kind.value:encode()
			local var153, var154 = protoModule.writeTag(buff, var1, 801, protoModule.wireTypes.lengthDelimited)
			var153, var416 = protoModule.writeBuffer(var153, var154, var152, buffer.len(var152))
			buff = var153
			var1 = var154
		elseif self.kind.type == "sort_selector" then
			local var155 = self.kind.value:encode()
			local var156, var157 = protoModule.writeTag(buff, var1, 802, protoModule.wireTypes.lengthDelimited)
			var156, var419 = protoModule.writeBuffer(var156, var157, var155, buffer.len(var155))
			buff = var156
			var1 = var157
		elseif self.kind.type == "genre_selector" then
			local var158 = self.kind.value:encode()
			local var159, var160 = protoModule.writeTag(buff, var1, 803, protoModule.wireTypes.lengthDelimited)
			var159, var422 = protoModule.writeBuffer(var159, var160, var158, buffer.len(var158))
			buff = var159
			var1 = var160
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var161 = self.kind.value:encode()
			local var162, var163 = protoModule.writeTag(buff, var1, 900, protoModule.wireTypes.lengthDelimited)
			var162, var425 = protoModule.writeBuffer(var162, var163, var161, buffer.len(var161))
			buff = var162
			var1 = var163
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var164 = self.kind.value:encode()
			local var165, var166 = protoModule.writeTag(buff, var1, 901, protoModule.wireTypes.lengthDelimited)
			var165, var428 = protoModule.writeBuffer(var165, var166, var164, buffer.len(var164))
			buff = var165
			var1 = var166
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var167 = self.kind.value:encode()
			local var168, var169 = protoModule.writeTag(buff, var1, 902, protoModule.wireTypes.lengthDelimited)
			var168, var431 = protoModule.writeBuffer(var168, var169, var167, buffer.len(var167))
			buff = var168
			var1 = var169
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var170 = self.kind.value:encode()
			local var171, var172 = protoModule.writeTag(buff, var1, 903, protoModule.wireTypes.lengthDelimited)
			var171, var434 = protoModule.writeBuffer(var171, var172, var170, buffer.len(var170))
			buff = var171
			var1 = var172
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var173 = self.kind.value:encode()
			local var174, var175 = protoModule.writeTag(buff, var1, 904, protoModule.wireTypes.lengthDelimited)
			var174, var437 = protoModule.writeBuffer(var174, var175, var173, buffer.len(var173))
			buff = var174
			var1 = var175
		elseif self.kind.type == "catalog_item_grid" then
			local var176 = self.kind.value:encode()
			local var177, var178 = protoModule.writeTag(buff, var1, 905, protoModule.wireTypes.lengthDelimited)
			var177, var440 = protoModule.writeBuffer(var177, var178, var176, buffer.len(var176))
			buff = var177
			var1 = var178
		elseif self.kind.type == "marketplace_offer_modal" then
			local var179 = self.kind.value:encode()
			local var180, var181 = protoModule.writeTag(buff, var1, 906, protoModule.wireTypes.lengthDelimited)
			var180, var443 = protoModule.writeBuffer(var180, var181, var179, buffer.len(var179))
			buff = var180
			var1 = var181
		elseif self.kind.type == "search_results_feed" then
			local var182 = self.kind.value:encode()
			local var183, var184 = protoModule.writeTag(buff, var1, 1000, protoModule.wireTypes.lengthDelimited)
			var183, var446 = protoModule.writeBuffer(var183, var184, var182, buffer.len(var182))
			buff = var183
			var1 = var184
		elseif self.kind.type == "power_search_ai_overview" then
			local var185 = self.kind.value:encode()
			local var186, var187 = protoModule.writeTag(buff, var1, 1001, protoModule.wireTypes.lengthDelimited)
			var186, var449 = protoModule.writeBuffer(var186, var187, var185, buffer.len(var185))
			buff = var186
			var1 = var187
		elseif self.kind.type == "experience_emphasis_tile" then
			local var188 = self.kind.value:encode()
			local var189, var190 = protoModule.writeTag(buff, var1, 1002, protoModule.wireTypes.lengthDelimited)
			var189, var452 = protoModule.writeBuffer(var189, var190, var188, buffer.len(var188))
			buff = var189
			var1 = var190
		elseif self.kind.type == "option_selector_carousel" then
			local var191 = self.kind.value:encode()
			local var192, var193 = protoModule.writeTag(buff, var1, 1100, protoModule.wireTypes.lengthDelimited)
			var192, var455 = protoModule.writeBuffer(var192, var193, var191, buffer.len(var191))
			buff = var192
			var1 = var193
		elseif self.kind.type == "game_items_carousel" then
			local var194 = self.kind.value:encode()
			local var195, var196 = protoModule.writeTag(buff, var1, 1101, protoModule.wireTypes.lengthDelimited)
			var195, var458 = protoModule.writeBuffer(var195, var196, var194, buffer.len(var194))
			buff = var195
			var1 = var196
		elseif self.kind.type == "hero_unit" then
			local var197 = self.kind.value:encode()
			local var198, var199 = protoModule.writeTag(buff, var1, 1102, protoModule.wireTypes.lengthDelimited)
			var198, var461 = protoModule.writeBuffer(var198, var199, var197, buffer.len(var197))
			buff = var198
			var1 = var199
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var200 = self.kind.value:encode()
			local var201, var202 = protoModule.writeTag(buff, var1, 1103, protoModule.wireTypes.lengthDelimited)
			var201, var464 = protoModule.writeBuffer(var201, var202, var200, buffer.len(var200))
			buff = var201
			var1 = var202
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var203 = self.kind.value:encode()
			local var204, var205 = protoModule.writeTag(buff, var1, 1200, protoModule.wireTypes.lengthDelimited)
			var204, var467 = protoModule.writeBuffer(var204, var205, var203, buffer.len(var203))
			buff = var204
			var1 = var205
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var206 = self.kind.value:encode()
			local var207, var208 = protoModule.writeTag(buff, var1, 1300, protoModule.wireTypes.lengthDelimited)
			var207, var470 = protoModule.writeBuffer(var207, var208, var206, buffer.len(var206))
			buff = var207
			var1 = var208
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_5.decode(p1)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var1 = t_5.new()
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
				var1.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(var12)
				}
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(var14)
				}
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(var16)
				}
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(var18)
				}
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(var20)
				}
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(var22)
				}
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(var24)
				}
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(var26)
				}
			elseif var7 == 10 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(var28)
				}
			elseif var7 == 11 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(var30)
				}
			elseif var7 == 12 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var2)
				var2 = var33
				var1.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(var32)
				}
			elseif var7 == 13 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var2)
				var2 = var35
				var1.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(var34)
				}
			elseif var7 == 14 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var2)
				var2 = var37
				var1.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(var36)
				}
			elseif var7 == 15 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var2)
				var2 = var39
				var1.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(var38)
				}
			elseif var7 == 16 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var2)
				var2 = var41
				var1.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(var40)
				}
			elseif var7 == 17 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var2)
				var2 = var43
				var1.kind = {
					type = "dynamic_store_category",
					value = t.DynamicStoreCategoryInputData.decode(var42)
				}
			elseif var7 == 20 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var2)
				var2 = var45
				var1.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(var44)
				}
			elseif var7 == 21 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var2)
				var2 = var47
				var1.kind = { type = "card", value = t.CardInputData.decode(var46) }
			elseif var7 == 22 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p1, var2)
				var2 = var49
				var1.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(var48)
				}
			elseif var7 == 23 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p1, var2)
				var2 = var51
				var1.kind = {
					type = "banner",
					value = t.BannerInputData.decode(var50)
				}
			elseif var7 == 24 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p1, var2)
				var2 = var53
				var1.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(var52)
				}
			elseif var7 == 25 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p1, var2)
				var2 = var55
				var1.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(var54)
				}
			elseif var7 == 26 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p1, var2)
				var2 = var57
				var1.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(var56)
				}
			elseif var7 == 27 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p1, var2)
				var2 = var59
				var1.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(var58)
				}
			elseif var7 == 28 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p1, var2)
				var2 = var61
				var1.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(var60)
				}
			elseif var7 == 29 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var2)
				var2 = var63
				var1.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(var62)
				}
			elseif var7 == 30 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var2)
				var2 = var65
				var1.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(var64)
				}
			elseif var7 == 31 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p1, var2)
				var2 = var67
				var1.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(var66)
				}
			elseif var7 == 32 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p1, var2)
				var2 = var69
				var1.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(var68)
				}
			elseif var7 == 33 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p1, var2)
				var2 = var71
				var1.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(var70)
				}
			elseif var7 == 34 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p1, var2)
				var2 = var73
				var1.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(var72)
				}
			elseif var7 == 35 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p1, var2)
				var2 = var75
				var1.kind = {
					type = "community_section",
					value = t.CommunitySectionInputData.decode(var74)
				}
			elseif var7 == 40 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p1, var2)
				var2 = var77
				var1.kind = { type = "text", value = t.TextInputData.decode(var76) }
			elseif var7 == 41 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p1, var2)
				var2 = var79
				var1.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(var78)
				}
			elseif var7 == 42 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p1, var2)
				var2 = var81
				var1.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(var80)
				}
			elseif var7 == 43 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p1, var2)
				var2 = var83
				var1.kind = {
					type = "image_cta_section",
					value = t.ImageCtaSectionInputData.decode(var82)
				}
			elseif var7 == 500 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p1, var2)
				var2 = var85
				var1.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var84)
				}
			elseif var7 == 501 then
				local _ = nil
				local var86, var87 = protoModule.readBuffer(p1, var2)
				var2 = var87
				var1.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var86)
				}
			elseif var7 == 502 then
				local _ = nil
				local var88, var89 = protoModule.readBuffer(p1, var2)
				var2 = var89
				var1.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var88)
				}
			elseif var7 == 503 then
				local _ = nil
				local var90, var91 = protoModule.readBuffer(p1, var2)
				var2 = var91
				var1.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var90)
				}
			elseif var7 == 600 then
				local _ = nil
				local var92, var93 = protoModule.readBuffer(p1, var2)
				var2 = var93
				var1.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var92)
				}
			elseif var7 == 601 then
				local _ = nil
				local var94, var95 = protoModule.readBuffer(p1, var2)
				var2 = var95
				var1.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var94)
				}
			elseif var7 == 602 then
				local _ = nil
				local var96, var97 = protoModule.readBuffer(p1, var2)
				var2 = var97
				var1.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var96)
				}
			elseif var7 == 603 then
				local _ = nil
				local var98, var99 = protoModule.readBuffer(p1, var2)
				var2 = var99
				var1.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var98)
				}
			elseif var7 == 604 then
				local _ = nil
				local var100, var101 = protoModule.readBuffer(p1, var2)
				var2 = var101
				var1.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var100)
				}
			elseif var7 == 605 then
				local _ = nil
				local var102, var103 = protoModule.readBuffer(p1, var2)
				var2 = var103
				var1.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var102)
				}
			elseif var7 == 606 then
				local _ = nil
				local var104, var105 = protoModule.readBuffer(p1, var2)
				var2 = var105
				var1.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var104)
				}
			elseif var7 == 700 then
				local _ = nil
				local var106, var107 = protoModule.readBuffer(p1, var2)
				var2 = var107
				var1.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var106)
				}
			elseif var7 == 800 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p1, var2)
				var2 = var109
				var1.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var108)
				}
			elseif var7 == 801 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p1, var2)
				var2 = var111
				var1.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var110)
				}
			elseif var7 == 802 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p1, var2)
				var2 = var113
				var1.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var112)
				}
			elseif var7 == 803 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p1, var2)
				var2 = var115
				var1.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(var114)
				}
			elseif var7 == 900 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p1, var2)
				var2 = var117
				var1.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var116)
				}
			elseif var7 == 901 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p1, var2)
				var2 = var119
				var1.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var118)
				}
			elseif var7 == 902 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p1, var2)
				var2 = var121
				var1.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var120)
				}
			elseif var7 == 903 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p1, var2)
				var2 = var123
				var1.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var122)
				}
			elseif var7 == 904 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p1, var2)
				var2 = var125
				var1.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var124)
				}
			elseif var7 == 905 then
				local _ = nil
				local var126, var127 = protoModule.readBuffer(p1, var2)
				var2 = var127
				var1.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(var126)
				}
			elseif var7 == 906 then
				local _ = nil
				local var128, var129 = protoModule.readBuffer(p1, var2)
				var2 = var129
				var1.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(var128)
				}
			elseif var7 == 1000 then
				local _ = nil
				local var130, var131 = protoModule.readBuffer(p1, var2)
				var2 = var131
				var1.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var130)
				}
			elseif var7 == 1001 then
				local _ = nil
				local var132, var133 = protoModule.readBuffer(p1, var2)
				var2 = var133
				var1.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var132)
				}
			elseif var7 == 1002 then
				local _ = nil
				local var134, var135 = protoModule.readBuffer(p1, var2)
				var2 = var135
				var1.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var134)
				}
			elseif var7 == 1100 then
				local _ = nil
				local var136, var137 = protoModule.readBuffer(p1, var2)
				var2 = var137
				var1.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var136)
				}
			elseif var7 == 1101 then
				local _ = nil
				local var138, var139 = protoModule.readBuffer(p1, var2)
				var2 = var139
				var1.kind = {
					type = "game_items_carousel",
					value = t.GameItemsCarouselInputData.decode(var138)
				}
			elseif var7 == 1102 then
				local _ = nil
				local var140, var141 = protoModule.readBuffer(p1, var2)
				var2 = var141
				var1.kind = {
					type = "hero_unit",
					value = t.HeroUnitInputData.decode(var140)
				}
			elseif var7 == 1103 then
				local _ = nil
				local var142, var143 = protoModule.readBuffer(p1, var2)
				var2 = var143
				var1.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(var142)
				}
			elseif var7 == 1200 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p1, var2)
				var2 = var145
				var1.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var144)
				}
			elseif var7 == 1300 then
				local _ = nil
				local var146, var147 = protoModule.readBuffer(p1, var2)
				var2 = var147
				var1.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var146)
				}
			else
				local _ = nil
				local var148, var149 = protoModule.readVarInt(p1, var2)
				var2 = var149 + var148
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var150, var151 = protoModule.readFixed32(p1, var2)
			local _ = var150
			var2 = var151
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var152, var153 = protoModule.readFixed64(p1, var2)
			local _ = var152
			var2 = var153
		else
			error("Unsupported wire type: " .. var474)
		end
	end
	return var1
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
	local var1 = t_5.new()
	
	if self.badges_grid ~= nil then
		var1.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var1.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var1.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var1.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var1.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var1.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var1.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var1.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var1.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var1.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var1.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var1.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var1.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var1.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var1.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var1.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var1.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var1.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var1.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var1.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var1.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var1.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var1.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var1.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var1.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var1.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var1.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var1.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var1.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var1.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var1.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var1.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var1.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var1.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var1.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var1.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var1.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var1.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var1.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var1.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var1.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var1.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var1.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var1.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var1.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var1.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var1.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var1.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var1.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var1.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var1.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var1.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var1.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var1.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var1.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var1.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var1.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var1.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var1.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var1.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var1.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var1.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var1.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var1.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var1.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var1.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var1.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var1.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.experience_details_feed ~= nil then
		var1.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var1.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var1.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var1.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var1.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var1.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var1.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var1.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var1.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var1.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var1.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var1.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var1.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var1.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var1.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var1.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var1.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var1.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var1.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var1.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var1.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var1.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var1.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var1.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var1.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var1.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var1.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var1.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var1.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var1.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var1.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var1.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var1.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var1.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var1.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var1.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var1.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var1.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var1.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var1.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var1.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var1.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var1.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var1.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var1.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var1.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var1.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var1.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var1.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var1.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var1.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var1.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var1.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var1.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var1.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var1.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var1.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var1.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var1.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var1.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var1.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var1.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var1.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var1.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	return var1
end

t_5.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t.PageEntryInputData = t_5
typeRegistryModule.default:register(t.PageEntryInputData)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p1)
	-- upvalues: t_6 (ref)
	return setmetatable({
		section_title = if p1 == nil or p1.section_title == nil then "" else p1.section_title,
		badges = if p1 == nil or p1.badges == nil then {} else p1.badges,
		collection_id = if p1 == nil or p1.collection_id == nil then "" else p1.collection_id,
		collection_position = if p1 == nil or p1.collection_position == nil then "" else p1.collection_position,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var630 = protoModule.writeString(var2, var3, self.section_title)
		buff = var2
		var1 = var3
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var4 = v:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var633 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var635 = protoModule.writeString(var7, var8, self.collection_id)
		buff = var7
		var1 = var8
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var637 = protoModule.writeString(var9, var10, self.collection_position)
		buff = var9
		var1 = var10
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var639 = protoModule.writeString(var11, var12, self.universe_id)
		buff = var11
		var1 = var12
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_6.decode(p1)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var1 = t_6.new()
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
				var1.section_title = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.badges, t.BadgesGridInputData_BadgeInputData.decode(var12))
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.collection_id = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.collection_position = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.universe_id = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var643)
		end
	end
	return var1
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
	local var1 = t_6.new()
	
	if self.section_title ~= nil then
		var1.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var1.badges = t_1
	end
	if self.collection_id ~= nil then
		var1.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var1.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var1.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var1.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	return var1
end

t_6.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t.BadgesGridInputData = t_6
typeRegistryModule.default:register(t.BadgesGridInputData)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p1)
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then "" else p1.badge_id
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var673 = protoModule.writeString(var2, var3, self.badge_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_7.decode(p1)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var1 = t_7.new()
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
				var1.badge_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var677)
		end
	end
	return var1
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
	local var1 = t_7.new()
	
	if self.badge_id ~= nil then
		var1.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var1.badge_id = self.badgeId
	end
	return var1
end

t_7.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t.BadgesGridInputData_BadgeInputData = t_7
typeRegistryModule.default:register(t.BadgesGridInputData_BadgeInputData)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p1)
	-- upvalues: t_8 (ref)
	return setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then "" else p1.badge_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		localized_literals = if p1 == nil or p1.localized_literals == nil then nil else p1.localized_literals,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var697 = protoModule.writeString(var2, var3, self.badge_id)
		buff = var2
		var1 = var3
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var699 = protoModule.writeString(var4, var5, self.universe_id)
		buff = var4
		var1 = var5
	end
	if self.localized_literals ~= nil then
		local var6 = self.localized_literals:encode()
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var702 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
		buff = var7
		var1 = var8
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var704 = protoModule.writeString(var9, var10, self.creator_key)
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_8.decode(p1)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var1 = t_8.new()
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
				var1.badge_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.creator_key = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var708)
		end
	end
	return var1
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
	local var1 = t_8.new()
	
	if self.badge_id ~= nil then
		var1.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var1.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var1.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var1.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var1.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1.creator_key = self.creatorKey
	end
	return var1
end

t_8.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t.BadgeDetailsInputData = t_8
typeRegistryModule.default:register(t.BadgeDetailsInputData)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p1)
	-- upvalues: t_9 (ref)
	return setmetatable({
		info_table = if p1 == nil or p1.info_table == nil then nil else p1.info_table,
		action_module = if p1 == nil or p1.action_module == nil then nil else p1.action_module,
		overflow_menu = if p1 == nil or p1.overflow_menu == nil then nil else p1.overflow_menu
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.info_table ~= nil then
		local var2 = self.info_table:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var735 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.action_module ~= nil then
		local var5 = self.action_module:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var738 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.overflow_menu ~= nil then
		local var8 = self.overflow_menu:encode()
		local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var9, var741 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_9.decode(p1)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var1 = t_9.new()
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
				var1.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var745)
		end
	end
	return var1
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
	local var1 = t_9.new()
	
	if self.info_table ~= nil then
		var1.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var1.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var1.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var1.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var1.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var1.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var1
end

t_9.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsInputData_LocalizedLiterals = t_9
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p1)
	-- upvalues: t_10 (ref)
	return setmetatable({
		type_label = if p1 == nil or p1.type_label == nil then "" else p1.type_label,
		earned_label = if p1 == nil or p1.earned_label == nil then "" else p1.earned_label,
		updated_label = if p1 == nil or p1.updated_label == nil then "" else p1.updated_label,
		experience_label = if p1 == nil or p1.experience_label == nil then "" else p1.experience_label,
		rarity_label = if p1 == nil or p1.rarity_label == nil then "" else p1.rarity_label,
		won_yesterday_label = if p1 == nil or p1.won_yesterday_label == nil then "" else p1.won_yesterday_label,
		won_ever_label = if p1 == nil or p1.won_ever_label == nil then "" else p1.won_ever_label
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var769 = protoModule.writeString(var2, var3, self.type_label)
		buff = var2
		var1 = var3
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var771 = protoModule.writeString(var4, var5, self.earned_label)
		buff = var4
		var1 = var5
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var773 = protoModule.writeString(var6, var7, self.updated_label)
		buff = var6
		var1 = var7
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var775 = protoModule.writeString(var8, var9, self.experience_label)
		buff = var8
		var1 = var9
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var777 = protoModule.writeString(var10, var11, self.rarity_label)
		buff = var10
		var1 = var11
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var779 = protoModule.writeString(var12, var13, self.won_yesterday_label)
		buff = var12
		var1 = var13
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var781 = protoModule.writeString(var14, var15, self.won_ever_label)
		buff = var14
		var1 = var15
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_10.decode(p1)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var1 = t_10.new()
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
				var1.type_label = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.earned_label = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.updated_label = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.experience_label = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.rarity_label = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.won_yesterday_label = buffer.tostring(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.won_ever_label = buffer.tostring(var22)
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var2)
				var2 = var25 + var24
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var2)
			local _ = var26
			var2 = var27
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var2)
			local _ = var28
			var2 = var29
		else
			error("Unsupported wire type: " .. var785)
		end
	end
	return var1
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
	local var1 = t_10.new()
	
	if self.type_label ~= nil then
		var1.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var1.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var1.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var1.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var1.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var1.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var1.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var1.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var1.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var1.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var1.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var1.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var1.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var1.won_ever_label = self.wonEverLabel
	end
	return var1
end

t_10.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t.BadgeDetailsInputData_LocalizedLiterals_InfoTable = t_10
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_InfoTable)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p1)
	-- upvalues: t_11 (ref)
	return setmetatable({
		share = if p1 == nil or p1.share == nil then "" else p1.share,
		report = if p1 == nil or p1.report == nil then "" else p1.report
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var817 = protoModule.writeString(var2, var3, self.share)
		buff = var2
		var1 = var3
	end
	if self.report ~= nil and self.report ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var819 = protoModule.writeString(var4, var5, self.report)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_11.decode(p1)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var1 = t_11.new()
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
				var1.share = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.report = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var823)
		end
	end
	return var1
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
	local var1 = t_11.new()
	
	if self.share ~= nil then
		var1.share = self.share
	end
	if self.report ~= nil then
		var1.report = self.report
	end
	return var1
end

t_11.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t.BadgeDetailsInputData_LocalizedLiterals_ActionModule = t_11
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_ActionModule)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p1)
	-- upvalues: t_12 (ref)
	return setmetatable({
		report = if p1 == nil or p1.report == nil then "" else p1.report,
		remove = if p1 == nil or p1.remove == nil then "" else p1.remove
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var845 = protoModule.writeString(var2, var3, self.report)
		buff = var2
		var1 = var3
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var847 = protoModule.writeString(var4, var5, self.remove)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_12.decode(p1)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var1 = t_12.new()
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
				var1.report = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.remove = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var851)
		end
	end
	return var1
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
	local var1 = t_12.new()
	
	if self.report ~= nil then
		var1.report = self.report
	end
	if self.remove ~= nil then
		var1.remove = self.remove
	end
	return var1
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

function t_13.decode(p1)
	-- upvalues: t_13 (ref), protoModule (ref)
	local var1 = t_13.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local var3 = nil
		local _ = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		var3 = var4
		local var7 = var5
		var2 = var6
		
		if var7 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var10, var11 = protoModule.readVarInt(p1, var2)
			var2 = var11 + var10
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var12, var13 = protoModule.readFixed32(p1, var2)
			local _ = var12
			var2 = var13
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var14, var15 = protoModule.readFixed64(p1, var2)
			local _ = var14
			var2 = var15
		else
			error("Unsupported wire type: " .. var877)
		end
	end
	return var1
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

function t_14.new(p1)
	-- upvalues: t_14 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		entry_order_map = if p1 == nil or p1.entry_order_map == nil then {} else p1.entry_order_map
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var889 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var891 = protoModule.writeString(var4, var5, self.creator_key)
		buff = var4
		var1 = var5
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var6, var7 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var6, var893 = protoModule.writeString(var6, var7, i)
			local var8 = v:encode()
			var7, var895 = protoModule.writeTag(var6, var7, 2, protoModule.wireTypes.lengthDelimited)
			var7, var895 = protoModule.writeBuffer(var7, var895, var8, buffer.len(var8))
			local var9 = var7
			local var10 = var895
			local var11, var12 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var11, var899 = protoModule.writeBuffer(var11, var12, var9, var10)
			buff = var11
			var1 = var12
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var13, var14 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var13, var901 = protoModule.writeString(var13, var14, v)
			buff = var13
			var1 = var14
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var15, var16 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var15, var903 = protoModule.writeString(var15, var16, i)
			local var17 = v:encode()
			var16, var905 = protoModule.writeTag(var15, var16, 2, protoModule.wireTypes.lengthDelimited)
			var16, var905 = protoModule.writeBuffer(var16, var905, var17, buffer.len(var17))
			local var18 = var16
			local var19 = var905
			local var20, var21 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var20, var909 = protoModule.writeBuffer(var20, var21, var18, var19)
			buff = var20
			var1 = var21
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_14.decode(p1)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var1 = t_14.new()
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
				var1.universe_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.creator_key = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var14 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var14)
				var1.entry_map[var14.key or ""] = var14.value or t.FeedEntry.new()
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				table.insert(var1.entry_order, buffer.tostring(var16))
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var18 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var18)
				var1.entry_order_map[var18.key or ""] = var18.value or t.EntryOrder.new()
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var913)
		end
	end
	return var1
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
	local var1 = t_14.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var1.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var1.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var1.entry_order_map = t_1
	end
	return var1
end

t_14.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t.ExperienceDetailsFeedInputData = t_14
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p1)
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_15)
end

function t_15:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var950 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var953 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_15.decode(p1)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var1 = t_15.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.FeedEntry.decode(var12)
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
			error("Unsupported wire type: " .. var957)
		end
	end
	return var1
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
	local var1 = t_15.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1
end

t_15.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryMapEntry = t_15
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryMapEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p1)
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var979 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var982 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_16.decode(p1)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var1 = t_16.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.EntryOrder.decode(var12)
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
			error("Unsupported wire type: " .. var986)
		end
	end
	return var1
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
	local var1 = t_16.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var1
end

t_16.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryOrderMapEntry = t_16
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryOrderMapEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p1)
	-- upvalues: t_17 (ref)
	return setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var2, var1008 = protoModule.writeString(var2, var3, v)
			buff = var2
			var1 = var3
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_17.decode(p1)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var1 = t_17.new()
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
				table.insert(var1.items, buffer.tostring(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1012)
		end
	end
	return var1
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
	local var1 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var1.items = t
	end
	return var1
end

t_17.descriptor = {
	name = "EntryOrder",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrder"
}
t.EntryOrder = t_17
typeRegistryModule.default:register(t.EntryOrder)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p1)
	-- upvalues: t_18 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		user_owns_experience = if p1 == nil or p1.user_owns_experience == nil then false else p1.user_owns_experience
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1034 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.user_owns_experience then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var1036 = protoModule.writeVarInt(var4, var5, if self.user_owns_experience then 1 else 0)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_18.decode(p1)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var1 = t_18.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.user_owns_experience = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var1040)
		end
	end
	return var1
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
	local var1 = t_18.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1.user_owns_experience = self.userOwnsExperience
	end
	return var1
end

t_18.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t.ExperienceDetailsActionBarInputData = t_18
typeRegistryModule.default:register(t.ExperienceDetailsActionBarInputData)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p1)
	-- upvalues: t_19 (ref)
	return setmetatable({
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then "" else p1.media_asset_id
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1062 = protoModule.writeString(var2, var3, self.media_asset_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_19.decode(p1)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var1 = t_19.new()
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
				var1.media_asset_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1066)
		end
	end
	return var1
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
	local var1 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var1.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1.media_asset_id = self.mediaAssetId
	end
	return var1
end

t_19.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t.ExperienceDetailsBannerImageInputData = t_19
typeRegistryModule.default:register(t.ExperienceDetailsBannerImageInputData)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p1)
	-- upvalues: t_20 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1086 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_20.decode(p1)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var1 = t_20.new()
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
				var1.universe_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1090)
		end
	end
	return var1
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
	local var1 = t_20.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	return var1
end

t_20.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t.ExperienceDetailsStickyHeaderInputData = t_20
typeRegistryModule.default:register(t.ExperienceDetailsStickyHeaderInputData)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p1)
	-- upvalues: t_21 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1110 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var1112 = protoModule.writeString(var4, var5, self.creator_key)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_21.decode(p1)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var1 = t_21.new()
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
				var1.universe_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.creator_key = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var1116)
		end
	end
	return var1
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
	local var1 = t_21.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var1.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1.creator_key = self.creatorKey
	end
	return var1
end

t_21.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t.ExperienceAttributionRowInputData = t_21
typeRegistryModule.default:register(t.ExperienceAttributionRowInputData)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p1)
	-- upvalues: t_22 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		root_place_id = if p1 == nil or p1.root_place_id == nil then "" else p1.root_place_id,
		connection_played_display_name = if p1 == nil or p1.connection_played_display_name == nil then "" else p1.connection_played_display_name,
		upsell_prompt = if p1 == nil or p1.upsell_prompt == nil then "" else p1.upsell_prompt,
		connection_played_users = if p1 == nil or p1.connection_played_users == nil then {} else p1.connection_played_users,
		connection_played_num_others = if p1 == nil or p1.connection_played_num_others == nil then 0 else p1.connection_played_num_others,
		connection_played_total_count = if p1 == nil or p1.connection_played_total_count == nil then 0 else p1.connection_played_total_count
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1138 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var1140 = protoModule.writeString(var4, var5, self.root_place_id)
		buff = var4
		var1 = var5
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var1142 = protoModule.writeString(var6, var7, self.connection_played_display_name)
		buff = var6
		var1 = var7
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var1144 = protoModule.writeString(var8, var9, self.upsell_prompt)
		buff = var8
		var1 = var9
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var10 = v:encode()
			local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var11, var1147 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
			buff = var11
			var1 = var12
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var13, var1149 = protoModule.writeVarInt(var13, var14, self.connection_played_num_others)
		buff = var13
		var1 = var14
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var15, var16 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.varint)
		var15, var1151 = protoModule.writeVarInt(var15, var16, self.connection_played_total_count)
		buff = var15
		var1 = var16
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_22.decode(p1)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var1 = t_22.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 6 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.connection_played_num_others = var8
			elseif var7 == 7 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI32(p1, var2)
				var2 = var11
				var1.connection_played_total_count = var10
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.universe_id = buffer.tostring(var14)
			elseif var7 == 2 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.root_place_id = buffer.tostring(var16)
			elseif var7 == 3 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.connection_played_display_name = buffer.tostring(var18)
			elseif var7 == 4 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.upsell_prompt = buffer.tostring(var20)
			elseif var7 == 5 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				table.insert(var1.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var22))
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var2)
				var2 = var25 + var24
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var2)
			local _ = var26
			var2 = var27
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var2)
			local _ = var28
			var2 = var29
		else
			error("Unsupported wire type: " .. var1155)
		end
	end
	return var1
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
	local var1 = t_22.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var1.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var1.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var1.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var1.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var1.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var1.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var1.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var1.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var1.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var1
end

t_22.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t.ExperienceActionModuleInputData = t_22
typeRegistryModule.default:register(t.ExperienceActionModuleInputData)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p1)
	-- upvalues: t_23 (ref)
	return setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id
	}, t_23)
end

function t_23:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1190 = protoModule.writeString(var2, var3, self.user_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_23.decode(p1)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var1 = t_23.new()
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
				var1.user_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1194)
		end
	end
	return var1
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
	local var1 = t_23.new()
	
	if self.user_id ~= nil then
		var1.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1.user_id = self.userId
	end
	return var1
end

t_23.descriptor = {
	name = "ExperienceActionModuleInputData_ConnectionPlayedUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConnectionPlayedUser"
}
t.ExperienceActionModuleInputData_ConnectionPlayedUser = t_23
typeRegistryModule.default:register(t.ExperienceActionModuleInputData_ConnectionPlayedUser)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p1)
	-- upvalues: t_24 (ref)
	return setmetatable({
		media_items = if p1 == nil or p1.media_items == nil then {} else p1.media_items,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then "" else p1.place_id
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var1215 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1217 = protoModule.writeString(var5, var6, self.universe_id)
		buff = var5
		var1 = var6
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var1219 = protoModule.writeString(var7, var8, self.place_id)
		buff = var7
		var1 = var8
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_24.decode(p1)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var1 = t_24.new()
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
				table.insert(var1.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var10))
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.place_id = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var1223)
		end
	end
	return var1
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
	local var1 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1.media_items = t_1
	end
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1.place_id = self.placeId
	end
	return var1
end

t_24.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t.ExperienceMediaGalleryInputData = t_24
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p1)
	-- upvalues: t_25 (ref)
	return setmetatable({
		media_asset_id = if p1 == nil or p1.media_asset_id == nil then "" else p1.media_asset_id
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1250 = protoModule.writeString(var2, var3, self.media_asset_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_25.decode(p1)
	-- upvalues: t_25 (ref), protoModule (ref)
	local var1 = t_25.new()
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
				var1.media_asset_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1254)
		end
	end
	return var1
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
	local var1 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var1.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1.media_asset_id = self.mediaAssetId
	end
	return var1
end

t_25.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t.ExperienceMediaGalleryInputData_MediaItem = t_25
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p1)
	-- upvalues: t_26 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1274 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_26.decode(p1)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var1 = t_26.new()
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
				var1.universe_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1278)
		end
	end
	return var1
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
	local var1 = t_26.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	return var1
end

t_26.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = t_26
typeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p1)
	-- upvalues: t_27 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, t_27)
end

function t_27:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1298 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_27.decode(p1)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var1 = t_27.new()
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
				var1.universe_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1302)
		end
	end
	return var1
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
	local var1 = t_27.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	return var1
end

t_27.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = t_27
typeRegistryModule.default:register(t.ExperienceStatRowInputData)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p1)
	-- upvalues: t_28 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		has_store_items = if p1 == nil or p1.has_store_items == nil then false else p1.has_store_items,
		has_badges = if p1 == nil or p1.has_badges == nil then false else p1.has_badges,
		has_game_passes = if p1 == nil or p1.has_game_passes == nil then false else p1.has_game_passes,
		community_id = if p1 == nil or p1.community_id == nil then "" else p1.community_id
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1322 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.has_store_items then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var1324 = protoModule.writeVarInt(var4, var5, if self.has_store_items then 1 else 0)
		buff = var4
		var1 = var5
	end
	if self.has_badges then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var1326 = protoModule.writeVarInt(var6, var7, if self.has_badges then 1 else 0)
		buff = var6
		var1 = var7
	end
	if self.has_game_passes then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var8, var1328 = protoModule.writeVarInt(var8, var9, if self.has_game_passes then 1 else 0)
		buff = var8
		var1 = var9
	end
	if self.community_id ~= nil and self.community_id ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var1330 = protoModule.writeString(var10, var11, self.community_id)
		buff = var10
		var1 = var11
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_28.decode(p1)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var1 = t_28.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.has_store_items = var8 ~= 0
			elseif var7 == 3 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.has_badges = var10 ~= 0
			elseif var7 == 4 then
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13
				var1.has_game_passes = var12 ~= 0
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				local _ = var14
				var2 = var15
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.universe_id = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.community_id = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var1334)
		end
	end
	return var1
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
	local var1 = t_28.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var1.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var1.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var1.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var1.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var1.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var1.has_game_passes = self.hasGamePasses
	end
	if self.community_id ~= nil then
		var1.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var1.community_id = self.communityId
	end
	return var1
end

t_28.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = t_28
typeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p1)
	-- upvalues: t_29 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1362 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_29.decode(p1)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var1 = t_29.new()
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
				var1.universe_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1366)
		end
	end
	return var1
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
	local var1 = t_29.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	return var1
end

t_29.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = t_29
typeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p1)
	-- upvalues: t_30 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		user_owns_experience = if p1 == nil or p1.user_owns_experience == nil then false else p1.user_owns_experience
	}, t_30)
end

function t_30:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1386 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.user_owns_experience then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var1388 = protoModule.writeVarInt(var4, var5, if self.user_owns_experience then 1 else 0)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_30.decode(p1)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var1 = t_30.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.user_owns_experience = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var1392)
		end
	end
	return var1
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
	local var1 = t_30.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1.user_owns_experience = self.userOwnsExperience
	end
	return var1
end

t_30.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = t_30
typeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p1)
	-- upvalues: t_31 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		place_id = if p1 == nil or p1.place_id == nil then "" else p1.place_id
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1414 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var1416 = protoModule.writeString(var4, var5, self.place_id)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_31.decode(p1)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var1 = t_31.new()
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
				var1.universe_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.place_id = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var1420)
		end
	end
	return var1
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
	local var1 = t_31.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1.place_id = self.placeId
	end
	return var1
end

t_31.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = t_31
typeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p1)
	-- upvalues: t_32 (ref)
	return setmetatable({
		community_id = if p1 == nil or p1.community_id == nil then "" else p1.community_id
	}, t_32)
end

function t_32:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1442 = protoModule.writeString(var2, var3, self.community_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_32.decode(p1)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var1 = t_32.new()
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
				var1.community_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1446)
		end
	end
	return var1
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
	local var1 = t_32.new()
	
	if self.community_id ~= nil then
		var1.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var1.community_id = self.communityId
	end
	return var1
end

t_32.descriptor = {
	name = "CommunitySectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitySectionInputData"
}
t.CommunitySectionInputData = t_32
typeRegistryModule.default:register(t.CommunitySectionInputData)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p1)
	-- upvalues: t_33 (ref)
	return setmetatable({
		social_link_items = if p1 == nil or p1.social_link_items == nil then {} else p1.social_link_items
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var1467 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_33.decode(p1)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1 = t_33.new()
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
				table.insert(var1.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1471)
		end
	end
	return var1
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
	local var1 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1.social_link_items = t_1
	end
	return var1
end

t_33.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_33
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p1)
	-- upvalues: t_34 (ref)
	return setmetatable({
		social_link_id = if p1 == nil or p1.social_link_id == nil then "" else p1.social_link_id
	}, t_34)
end

function t_34:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1494 = protoModule.writeString(var2, var3, self.social_link_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_34.decode(p1)
	-- upvalues: t_34 (ref), protoModule (ref)
	local var1 = t_34.new()
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
				var1.social_link_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1498)
		end
	end
	return var1
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
	local var1 = t_34.new()
	
	if self.social_link_id ~= nil then
		var1.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var1.social_link_id = self.socialLinkId
	end
	return var1
end

t_34.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_34
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p1)
	-- upvalues: t_35 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		universe_items = if p1 == nil or p1.universe_items == nil then {} else p1.universe_items,
		next_page_token = if p1 == nil or p1.next_page_token == nil then "" else p1.next_page_token,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		secondary_sort_id = if p1 == nil or p1.secondary_sort_id == nil then 0 else p1.secondary_sort_id,
		max_visible_rows = if p1 == nil or p1.max_visible_rows == nil then 0 else p1.max_visible_rows,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text,
		subtitle_link_path = if p1 == nil or p1.subtitle_link_path == nil then "" else p1.subtitle_link_path,
		is_placeholder = if p1 == nil or p1.is_placeholder == nil then nil else p1.is_placeholder,
		primary_sort_id = if p1 == nil or p1.primary_sort_id == nil then nil else p1.primary_sort_id,
		applied_filters = if p1 == nil or p1.applied_filters == nil then nil else p1.applied_filters,
		pool_id = if p1 == nil or p1.pool_id == nil then nil else p1.pool_id,
		has_emphasized_tile = if p1 == nil or p1.has_emphasized_tile == nil then false else p1.has_emphasized_tile,
		tile_activation_mode = if p1 == nil or p1.tile_activation_mode == nil then "" else p1.tile_activation_mode,
		initial_feed_visible_rows = if p1 == nil or p1.initial_feed_visible_rows == nil then nil else p1.initial_feed_visible_rows,
		visible_rows_per_reveal = if p1 == nil or p1.visible_rows_per_reveal == nil then nil else p1.visible_rows_per_reveal,
		sponsored_user_cohort = if p1 == nil or p1.sponsored_user_cohort == nil then nil else p1.sponsored_user_cohort
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1518 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var4 = v:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var1521 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var1523 = protoModule.writeString(var7, var8, self.next_page_token)
		buff = var7
		var1 = var8
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var1525 = protoModule.writeString(var9, var10, self.sort_id)
		buff = var9
		var1 = var10
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var11, var1527 = protoModule.writeVarInt(var11, var12, self.secondary_sort_id)
		buff = var11
		var1 = var12
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var13, var1529 = protoModule.writeVarInt(var13, var14, self.max_visible_rows)
		buff = var13
		var1 = var14
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var15, var16 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var15, var1531 = protoModule.writeString(var15, var16, self.subtitle)
		buff = var15
		var1 = var16
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var17, var18 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var17, var1533 = protoModule.writeString(var17, var18, self.info_text)
		buff = var17
		var1 = var18
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var19, var20 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var19, var1535 = protoModule.writeString(var19, var20, self.subtitle_link_path)
		buff = var19
		var1 = var20
	end
	if self.is_placeholder ~= nil then
		local var21, var22 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.varint)
		var21, var1537 = protoModule.writeVarInt(var21, var22, if self.is_placeholder then 1 else 0)
		buff = var21
		var1 = var22
	end
	if self.primary_sort_id ~= nil then
		local var23, var24 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.varint)
		var23, var1539 = protoModule.writeVarInt(var23, var24, self.primary_sort_id)
		buff = var23
		var1 = var24
	end
	if self.applied_filters ~= nil then
		local var25, var26 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
		var25, var1541 = protoModule.writeString(var25, var26, self.applied_filters)
		buff = var25
		var1 = var26
	end
	if self.pool_id ~= nil then
		local var27, var28 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
		var27, var1543 = protoModule.writeString(var27, var28, self.pool_id)
		buff = var27
		var1 = var28
	end
	if self.has_emphasized_tile then
		local var29, var30 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.varint)
		var29, var1545 = protoModule.writeVarInt(var29, var30, if self.has_emphasized_tile then 1 else 0)
		buff = var29
		var1 = var30
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var31, var32 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
		var31, var1547 = protoModule.writeString(var31, var32, self.tile_activation_mode)
		buff = var31
		var1 = var32
	end
	if self.initial_feed_visible_rows ~= nil then
		local var33, var34 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.varint)
		var33, var1549 = protoModule.writeVarInt(var33, var34, self.initial_feed_visible_rows)
		buff = var33
		var1 = var34
	end
	if self.visible_rows_per_reveal ~= nil then
		local var35, var36 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.varint)
		var35, var1551 = protoModule.writeVarInt(var35, var36, self.visible_rows_per_reveal)
		buff = var35
		var1 = var36
	end
	if self.sponsored_user_cohort ~= nil then
		local var37, var38 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.lengthDelimited)
		var37, var1553 = protoModule.writeString(var37, var38, self.sponsored_user_cohort)
		buff = var37
		var1 = var38
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_35.decode(p1)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var1 = t_35.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 5 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.secondary_sort_id = var8
			elseif var7 == 6 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI32(p1, var2)
				var2 = var11
				var1.max_visible_rows = var10
			elseif var7 == 10 then
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13
				var1.is_placeholder = var12 ~= 0
			elseif var7 == 11 then
				local _ = nil
				local var14, var15 = protoModule.readVarIntI32(p1, var2)
				var2 = var15
				var1.primary_sort_id = var14
			elseif var7 == 14 then
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17
				var1.has_emphasized_tile = var16 ~= 0
			elseif var7 == 16 then
				local _ = nil
				local var18, var19 = protoModule.readVarIntI32(p1, var2)
				var2 = var19
				var1.initial_feed_visible_rows = var18
			elseif var7 == 17 then
				local _ = nil
				local var20, var21 = protoModule.readVarIntI32(p1, var2)
				var2 = var21
				var1.visible_rows_per_reveal = var20
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var2)
				local _ = var22
				var2 = var23
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.title = buffer.tostring(var24)
			elseif var7 == 2 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				table.insert(var1.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var26))
			elseif var7 == 3 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.next_page_token = buffer.tostring(var28)
			elseif var7 == 4 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.sort_id = buffer.tostring(var30)
			elseif var7 == 7 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var2)
				var2 = var33
				var1.subtitle = buffer.tostring(var32)
			elseif var7 == 8 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var2)
				var2 = var35
				var1.info_text = buffer.tostring(var34)
			elseif var7 == 9 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var2)
				var2 = var37
				var1.subtitle_link_path = buffer.tostring(var36)
			elseif var7 == 12 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var2)
				var2 = var39
				var1.applied_filters = buffer.tostring(var38)
			elseif var7 == 13 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var2)
				var2 = var41
				var1.pool_id = buffer.tostring(var40)
			elseif var7 == 15 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var2)
				var2 = var43
				var1.tile_activation_mode = buffer.tostring(var42)
			elseif var7 == 18 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var2)
				var2 = var45
				var1.sponsored_user_cohort = buffer.tostring(var44)
			else
				local _ = nil
				local var46, var47 = protoModule.readVarInt(p1, var2)
				var2 = var47 + var46
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var48, var49 = protoModule.readFixed32(p1, var2)
			local _ = var48
			var2 = var49
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var50, var51 = protoModule.readFixed64(p1, var2)
			local _ = var50
			var2 = var51
		else
			error("Unsupported wire type: " .. var1557)
		end
	end
	return var1
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
	local var1 = t_35.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var1.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var1.tile_activation_mode = self.tileActivationMode
	end
	if self.initial_feed_visible_rows ~= nil then
		var1.initial_feed_visible_rows = self.initial_feed_visible_rows
	end
	if self.initialFeedVisibleRows ~= nil then
		var1.initial_feed_visible_rows = self.initialFeedVisibleRows
	end
	if self.visible_rows_per_reveal ~= nil then
		var1.visible_rows_per_reveal = self.visible_rows_per_reveal
	end
	if self.visibleRowsPerReveal ~= nil then
		var1.visible_rows_per_reveal = self.visibleRowsPerReveal
	end
	if self.sponsored_user_cohort ~= nil then
		var1.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var1.sponsored_user_cohort = self.sponsoredUserCohort
	end
	return var1
end

t_35.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_35
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p1)
	-- upvalues: t_36 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		is_sponsored = if p1 == nil or p1.is_sponsored == nil then false else p1.is_sponsored,
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		native_ad_data = if p1 == nil or p1.native_ad_data == nil then "" else p1.native_ad_data,
		is_content_locked = if p1 == nil or p1.is_content_locked == nil then false else p1.is_content_locked,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then "" else p1.image_asset_id,
		video_asset_id = if p1 == nil or p1.video_asset_id == nil then "" else p1.video_asset_id,
		badge_text = if p1 == nil or p1.badge_text == nil then "" else p1.badge_text,
		player_count = if p1 == nil or p1.player_count == nil then nil else p1.player_count,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		rank = if p1 == nil or p1.rank == nil then nil else p1.rank,
		payer_name = if p1 == nil or p1.payer_name == nil then nil else p1.payer_name,
		logo_asset_id = if p1 == nil or p1.logo_asset_id == nil then nil else p1.logo_asset_id,
		logo_aspect_ratio = if p1 == nil or p1.logo_aspect_ratio == nil then nil else p1.logo_aspect_ratio,
		place_id = if p1 == nil or p1.place_id == nil then nil else p1.place_id,
		launch_data = if p1 == nil or p1.launch_data == nil then nil else p1.launch_data,
		cta_text = if p1 == nil or p1.cta_text == nil then nil else p1.cta_text,
		badge_analytics_id = if p1 == nil or p1.badge_analytics_id == nil then nil else p1.badge_analytics_id
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1614 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.is_sponsored then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var1616 = protoModule.writeVarInt(var4, var5, if self.is_sponsored then 1 else 0)
		buff = var4
		var1 = var5
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var1618 = protoModule.writeString(var6, var7, self.roblox_component)
		buff = var6
		var1 = var7
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var1620 = protoModule.writeString(var8, var9, self.native_ad_data)
		buff = var8
		var1 = var9
	end
	if self.is_content_locked then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var10, var1622 = protoModule.writeVarInt(var10, var11, if self.is_content_locked then 1 else 0)
		buff = var10
		var1 = var11
	end
	if self.title ~= nil and self.title ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var1624 = protoModule.writeString(var12, var13, self.title)
		buff = var12
		var1 = var13
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var1626 = protoModule.writeString(var14, var15, self.subtitle)
		buff = var14
		var1 = var15
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var16, var1628 = protoModule.writeString(var16, var17, self.image_asset_id)
		buff = var16
		var1 = var17
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var18, var1630 = protoModule.writeString(var18, var19, self.video_asset_id)
		buff = var18
		var1 = var19
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var20, var21 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
		var20, var1632 = protoModule.writeString(var20, var21, self.badge_text)
		buff = var20
		var1 = var21
	end
	if self.player_count ~= nil then
		local var22, var23 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.varint)
		var22, var1634 = protoModule.writeVarInt(var22, var23, self.player_count)
		buff = var22
		var1 = var23
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
		var24, var1636 = protoModule.writeString(var24, var25, self.creator_key)
		buff = var24
		var1 = var25
	end
	if self.rank ~= nil then
		local var26, var27 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.varint)
		var26, var1638 = protoModule.writeVarInt(var26, var27, self.rank)
		buff = var26
		var1 = var27
	end
	if self.payer_name ~= nil then
		local var28, var29 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
		var28, var1640 = protoModule.writeString(var28, var29, self.payer_name)
		buff = var28
		var1 = var29
	end
	if self.logo_asset_id ~= nil then
		local var30, var31 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
		var30, var1642 = protoModule.writeString(var30, var31, self.logo_asset_id)
		buff = var30
		var1 = var31
	end
	if self.logo_aspect_ratio ~= nil then
		local var32, var33 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.i64)
		var32, var1644 = protoModule.writeDouble(var32, var33, self.logo_aspect_ratio)
		buff = var32
		var1 = var33
	end
	if self.place_id ~= nil then
		local var34, var35 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
		var34, var1646 = protoModule.writeString(var34, var35, self.place_id)
		buff = var34
		var1 = var35
	end
	if self.launch_data ~= nil then
		local var36, var37 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.lengthDelimited)
		var36, var1648 = protoModule.writeString(var36, var37, self.launch_data)
		buff = var36
		var1 = var37
	end
	if self.cta_text ~= nil then
		local var38, var39 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
		var38, var1650 = protoModule.writeString(var38, var39, self.cta_text)
		buff = var38
		var1 = var39
	end
	if self.badge_analytics_id ~= nil then
		local var40, var41 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.lengthDelimited)
		var40, var1652 = protoModule.writeString(var40, var41, self.badge_analytics_id)
		buff = var40
		var1 = var41
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_36.decode(p1)
	-- upvalues: t_36 (ref), protoModule (ref)
	local var1 = t_36.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.is_sponsored = var8 ~= 0
			elseif var7 == 5 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.is_content_locked = var10 ~= 0
			elseif var7 == 11 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI64(p1, var2)
				var2 = var13
				var1.player_count = var12
			elseif var7 == 13 then
				local _ = nil
				local var14, var15 = protoModule.readVarIntI32(p1, var2)
				var2 = var15
				var1.rank = var14
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				local _ = var16
				var2 = var17
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.universe_id = buffer.tostring(var18)
			elseif var7 == 3 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.roblox_component = buffer.tostring(var20)
			elseif var7 == 4 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.native_ad_data = buffer.tostring(var22)
			elseif var7 == 6 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.title = buffer.tostring(var24)
			elseif var7 == 7 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.subtitle = buffer.tostring(var26)
			elseif var7 == 8 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.image_asset_id = buffer.tostring(var28)
			elseif var7 == 9 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.video_asset_id = buffer.tostring(var30)
			elseif var7 == 10 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var2)
				var2 = var33
				var1.badge_text = buffer.tostring(var32)
			elseif var7 == 12 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var2)
				var2 = var35
				var1.creator_key = buffer.tostring(var34)
			elseif var7 == 14 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var2)
				var2 = var37
				var1.payer_name = buffer.tostring(var36)
			elseif var7 == 15 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var2)
				var2 = var39
				var1.logo_asset_id = buffer.tostring(var38)
			elseif var7 == 17 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var2)
				var2 = var41
				var1.place_id = buffer.tostring(var40)
			elseif var7 == 18 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var2)
				var2 = var43
				var1.launch_data = buffer.tostring(var42)
			elseif var7 == 20 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var2)
				var2 = var45
				var1.cta_text = buffer.tostring(var44)
			elseif var7 == 21 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var2)
				var2 = var47
				var1.badge_analytics_id = buffer.tostring(var46)
			else
				local _ = nil
				local var48, var49 = protoModule.readVarInt(p1, var2)
				var2 = var49 + var48
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var50, var51 = protoModule.readFixed32(p1, var2)
			local _ = var50
			var2 = var51
		elseif var3 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1656)
		elseif var7 == 16 then
			local _ = nil
			local var52, var53 = protoModule.readDouble(p1, var2)
			var2 = var53
			var1.logo_aspect_ratio = var52
		else
			local _ = nil
			local var54, var55 = protoModule.readFixed64(p1, var2)
			local _ = var54
			var2 = var55
		end
	end
	return var1
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
	local var1 = t_36.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.subtitle ~= nil then
		var1.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1.launch_data = self.launchData
	end
	if self.cta_text ~= nil then
		var1.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1.badge_analytics_id = self.badgeAnalyticsId
	end
	return var1
end

t_36.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_36
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p1)
	-- upvalues: t_37 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		song_items = if p1 == nil or p1.song_items == nil then {} else p1.song_items,
		next_page_token = if p1 == nil or p1.next_page_token == nil then "" else p1.next_page_token,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		secondary_sort_id = if p1 == nil or p1.secondary_sort_id == nil then 0 else p1.secondary_sort_id,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text,
		subtitle_link_path = if p1 == nil or p1.subtitle_link_path == nil then "" else p1.subtitle_link_path,
		is_placeholder = if p1 == nil or p1.is_placeholder == nil then nil else p1.is_placeholder,
		primary_sort_id = if p1 == nil or p1.primary_sort_id == nil then nil else p1.primary_sort_id,
		applied_filters = if p1 == nil or p1.applied_filters == nil then nil else p1.applied_filters
	}, t_37)
end

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1714 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var4 = v:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var1717 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var1719 = protoModule.writeString(var7, var8, self.next_page_token)
		buff = var7
		var1 = var8
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var1721 = protoModule.writeString(var9, var10, self.sort_id)
		buff = var9
		var1 = var10
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var11, var1723 = protoModule.writeVarInt(var11, var12, self.secondary_sort_id)
		buff = var11
		var1 = var12
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var13, var1725 = protoModule.writeString(var13, var14, self.subtitle)
		buff = var13
		var1 = var14
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var15, var16 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var15, var1727 = protoModule.writeString(var15, var16, self.info_text)
		buff = var15
		var1 = var16
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var17, var18 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var17, var1729 = protoModule.writeString(var17, var18, self.subtitle_link_path)
		buff = var17
		var1 = var18
	end
	if self.is_placeholder ~= nil then
		local var19, var20 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.varint)
		var19, var1731 = protoModule.writeVarInt(var19, var20, if self.is_placeholder then 1 else 0)
		buff = var19
		var1 = var20
	end
	if self.primary_sort_id ~= nil then
		local var21, var22 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.varint)
		var21, var1733 = protoModule.writeVarInt(var21, var22, self.primary_sort_id)
		buff = var21
		var1 = var22
	end
	if self.applied_filters ~= nil then
		local var23, var24 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
		var23, var1735 = protoModule.writeString(var23, var24, self.applied_filters)
		buff = var23
		var1 = var24
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_37.decode(p1)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1 = t_37.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 5 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.secondary_sort_id = var8
			elseif var7 == 9 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.is_placeholder = var10 ~= 0
			elseif var7 == 10 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI32(p1, var2)
				var2 = var13
				var1.primary_sort_id = var12
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				local _ = var14
				var2 = var15
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.title = buffer.tostring(var16)
			elseif var7 == 2 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				table.insert(var1.song_items, t.SongCarouselInputData_SongItem.decode(var18))
			elseif var7 == 3 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.next_page_token = buffer.tostring(var20)
			elseif var7 == 4 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.sort_id = buffer.tostring(var22)
			elseif var7 == 6 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.subtitle = buffer.tostring(var24)
			elseif var7 == 7 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.info_text = buffer.tostring(var26)
			elseif var7 == 8 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.subtitle_link_path = buffer.tostring(var28)
			elseif var7 == 11 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.applied_filters = buffer.tostring(var30)
			else
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var2)
				var2 = var33 + var32
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var34, var35 = protoModule.readFixed32(p1, var2)
			local _ = var34
			var2 = var35
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var36, var37 = protoModule.readFixed64(p1, var2)
			local _ = var36
			var2 = var37
		else
			error("Unsupported wire type: " .. var1739)
		end
	end
	return var1
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
	local var1 = t_37.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1.applied_filters = self.appliedFilters
	end
	return var1
end

t_37.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_37
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p1)
	-- upvalues: t_38 (ref)
	return setmetatable({
		song_id = if p1 == nil or p1.song_id == nil then "" else p1.song_id
	}, t_38)
end

function t_38:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1782 = protoModule.writeString(var2, var3, self.song_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_38.decode(p1)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1 = t_38.new()
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
				var1.song_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1786)
		end
	end
	return var1
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
	local var1 = t_38.new()
	
	if self.song_id ~= nil then
		var1.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1.song_id = self.songId
	end
	return var1
end

t_38.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_38
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p1)
	-- upvalues: t_39 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		event_items = if p1 == nil or p1.event_items == nil then {} else p1.event_items,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text
	}, t_39)
end

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1806 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var4 = v:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var1809 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var1811 = protoModule.writeString(var7, var8, self.universe_id)
		buff = var7
		var1 = var8
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var1813 = protoModule.writeString(var9, var10, self.sort_id)
		buff = var9
		var1 = var10
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var1815 = protoModule.writeString(var11, var12, self.subtitle)
		buff = var11
		var1 = var12
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var13, var1817 = protoModule.writeString(var13, var14, self.info_text)
		buff = var13
		var1 = var14
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_39.decode(p1)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1 = t_39.new()
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
				var1.title = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.event_items, t.EventsCarouselInputData_EventItem.decode(var12))
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.universe_id = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.sort_id = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.subtitle = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.info_text = buffer.tostring(var20)
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var2)
				var2 = var23 + var22
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var24, var25 = protoModule.readFixed32(p1, var2)
			local _ = var24
			var2 = var25
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var26, var27 = protoModule.readFixed64(p1, var2)
			local _ = var26
			var2 = var27
		else
			error("Unsupported wire type: " .. var1821)
		end
	end
	return var1
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
	local var1 = t_39.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1.info_text = self.infoText
	end
	return var1
end

t_39.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_39
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p1)
	-- upvalues: t_40 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, t_40)
end

function t_40:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1854 = protoModule.writeString(var2, var3, self.event_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_40.decode(p1)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1 = t_40.new()
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
				var1.event_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1858)
		end
	end
	return var1
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
	local var1 = t_40.new()
	
	if self.event_id ~= nil then
		var1.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1.event_id = self.eventId
	end
	return var1
end

t_40.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_40
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p1)
	-- upvalues: t_41 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1878 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var4, var5 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4, var1880 = protoModule.writeString(var4, var5, i)
			local var6 = v:encode()
			var5, var1882 = protoModule.writeTag(var4, var5, 2, protoModule.wireTypes.lengthDelimited)
			var5, var1882 = protoModule.writeBuffer(var5, var1882, var6, buffer.len(var6))
			local var7 = var5
			local var8 = var1882
			local var9, var10 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var9, var1886 = protoModule.writeBuffer(var9, var10, var7, var8)
			buff = var9
			var1 = var10
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var11, var12 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var11, var1888 = protoModule.writeString(var11, var12, v)
			buff = var11
			var1 = var12
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var13, var1890 = protoModule.writeString(var13, var14, self.creator_key)
		buff = var13
		var1 = var14
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_41.decode(p1)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1 = t_41.new()
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
				var1.universe_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var12 = t.DevStoreFeedInputData_EntryMapEntry.decode(var12)
				var1.entry_map[var12.key or ""] = var12.value or t.FeedEntry.new()
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				table.insert(var1.entry_order, buffer.tostring(var14))
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.creator_key = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var1894)
		end
	end
	return var1
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
	local var1 = t_41.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1.creator_key = self.creatorKey
	end
	return var1
end

t_41.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_41
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p1)
	-- upvalues: t_42 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_42)
end

function t_42:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1926 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var1929 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_42.decode(p1)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1 = t_42.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.FeedEntry.decode(var12)
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
			error("Unsupported wire type: " .. var1933)
		end
	end
	return var1
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
	local var1 = t_42.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1
end

t_42.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_42
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p1)
	-- upvalues: t_43 (ref)
	return setmetatable({
		game_passes = if p1 == nil or p1.game_passes == nil then {} else p1.game_passes
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var1956 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_43.decode(p1)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1 = t_43.new()
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
				table.insert(var1.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1960)
		end
	end
	return var1
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
	local var1 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1.game_passes = t_1
	end
	return var1
end

t_43.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_43
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p1)
	-- upvalues: t_44 (ref)
	return setmetatable({
		game_pass_id = if p1 == nil or p1.game_pass_id == nil then "" else p1.game_pass_id
	}, t_44)
end

function t_44:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var1983 = protoModule.writeString(var2, var3, self.game_pass_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_44.decode(p1)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1 = t_44.new()
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
				var1.game_pass_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var1987)
		end
	end
	return var1
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
	local var1 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1.game_pass_id = self.gamePassId
	end
	return var1
end

t_44.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_44
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p1)
	-- upvalues: t_45 (ref)
	return setmetatable({
		developer_products = if p1 == nil or p1.developer_products == nil then {} else p1.developer_products
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var2008 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_45.decode(p1)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1 = t_45.new()
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
				table.insert(var1.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2012)
		end
	end
	return var1
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
	local var1 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1.developer_products = t_1
	end
	return var1
end

t_45.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_45
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p1)
	-- upvalues: t_46 (ref)
	return setmetatable({
		developer_product_id = if p1 == nil or p1.developer_product_id == nil then "" else p1.developer_product_id
	}, t_46)
end

function t_46:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2035 = protoModule.writeString(var2, var3, self.developer_product_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_46.decode(p1)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1 = t_46.new()
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
				var1.developer_product_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2039)
		end
	end
	return var1
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
	local var1 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var1.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1.developer_product_id = self.developerProductId
	end
	return var1
end

t_46.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_46
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p1)
	-- upvalues: t_47 (ref)
	return setmetatable({
		subscriptions = if p1 == nil or p1.subscriptions == nil then {} else p1.subscriptions
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var2060 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_47.decode(p1)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1 = t_47.new()
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
				table.insert(var1.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2064)
		end
	end
	return var1
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
	local var1 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var1.subscriptions = t_1
	end
	return var1
end

t_47.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_47
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p1)
	-- upvalues: t_48 (ref)
	return setmetatable({
		subscription_id = if p1 == nil or p1.subscription_id == nil then "" else p1.subscription_id
	}, t_48)
end

function t_48:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2086 = protoModule.writeString(var2, var3, self.subscription_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_48.decode(p1)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var1 = t_48.new()
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
				var1.subscription_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2090)
		end
	end
	return var1
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
	local var1 = t_48.new()
	
	if self.subscription_id ~= nil then
		var1.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var1.subscription_id = self.subscriptionId
	end
	return var1
end

t_48.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_48
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p1)
	-- upvalues: t_49 (ref)
	return setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		section_title = if p1 == nil or p1.section_title == nil then "" else p1.section_title,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key,
		collection_item_size = if p1 == nil or p1.collection_item_size == nil then "" else p1.collection_item_size,
		item_height_mode = if p1 == nil or p1.item_height_mode == nil then "" else p1.item_height_mode,
		experience_store_product_type = if p1 == nil or p1.experience_store_product_type == nil then "" else p1.experience_store_product_type,
		content_type = if p1 == nil or p1.content_type == nil then "" else p1.content_type,
		item_type = if p1 == nil or p1.item_type == nil then "" else p1.item_type
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var2111 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2113 = protoModule.writeString(var5, var6, self.universe_id)
		buff = var5
		var1 = var6
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var2115 = protoModule.writeString(var7, var8, self.section_title)
		buff = var7
		var1 = var8
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var2117 = protoModule.writeString(var9, var10, self.creator_key)
		buff = var9
		var1 = var10
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var2119 = protoModule.writeString(var11, var12, self.collection_item_size)
		buff = var11
		var1 = var12
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var13, var2121 = protoModule.writeString(var13, var14, self.item_height_mode)
		buff = var13
		var1 = var14
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var15, var16 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var15, var2123 = protoModule.writeString(var15, var16, self.experience_store_product_type)
		buff = var15
		var1 = var16
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var17, var18 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var17, var2125 = protoModule.writeString(var17, var18, self.content_type)
		buff = var17
		var1 = var18
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var19, var20 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var19, var2127 = protoModule.writeString(var19, var20, self.item_type)
		buff = var19
		var1 = var20
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_49.decode(p1)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1 = t_49.new()
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
				table.insert(var1.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var10))
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.section_title = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.creator_key = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.collection_item_size = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.item_height_mode = buffer.tostring(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.experience_store_product_type = buffer.tostring(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.content_type = buffer.tostring(var24)
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.item_type = buffer.tostring(var26)
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var2)
				var2 = var29 + var28
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var30, var31 = protoModule.readFixed32(p1, var2)
			local _ = var30
			var2 = var31
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var32, var33 = protoModule.readFixed64(p1, var2)
			local _ = var32
			var2 = var33
		else
			error("Unsupported wire type: " .. var2131)
		end
	end
	return var1
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
	local var1 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var1.items = t_1
	end
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var1.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var1.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var1.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var1.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var1.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var1.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var1.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var1.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var1.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var1.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1.item_type = self.itemType
	end
	return var1
end

t_49.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_49
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p1)
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		identifier = if p1 == nil or p1.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p1.identifier
	}, t_50)
end

function t_50:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2169 = protoModule.writeString(var2, var3, self.item_id)
		buff = var2
		var1 = var3
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var2171 = protoModule.writeVarInt(var4, var5, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_50.decode(p1)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var1 = t_50.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var10) or var10
			else
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				local _ = var11
				var2 = var12
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var13, var14 = protoModule.readBuffer(p1, var2)
				var2 = var14
				var1.item_id = buffer.tostring(var13)
			else
				local _ = nil
				local var15, var16 = protoModule.readVarInt(p1, var2)
				var2 = var16 + var15
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var17, var18 = protoModule.readFixed32(p1, var2)
			local _ = var17
			var2 = var18
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var19, var20 = protoModule.readFixed64(p1, var2)
			local _ = var19
			var2 = var20
		else
			error("Unsupported wire type: " .. var2175)
		end
	end
	return var1
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
	local var1 = t_50.new()
	
	if self.item_id ~= nil then
		var1.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var1.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var1
end

t_50.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_50
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p1)
		return if p1 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p1 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p1 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p1 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p1)
		return if p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p1 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_51 = {}
t_51.__index = t_51

function t_51.new(p1)
	-- upvalues: t_51 (ref)
	return setmetatable({
		roblox_component = if p1 == nil or p1.roblox_component == nil then "" else p1.roblox_component,
		identifier = if p1 == nil or p1.identifier == nil then "" else p1.identifier,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		cta_text = if p1 == nil or p1.cta_text == nil then "" else p1.cta_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		entity_id = if p1 == nil or p1.entity_id == nil then "" else p1.entity_id
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2198 = protoModule.writeString(var2, var3, self.roblox_component)
		buff = var2
		var1 = var3
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2200 = protoModule.writeString(var4, var5, self.identifier)
		buff = var4
		var1 = var5
	end
	if self.title ~= nil and self.title ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var2202 = protoModule.writeString(var6, var7, self.title)
		buff = var6
		var1 = var7
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var2204 = protoModule.writeString(var8, var9, self.user_id)
		buff = var8
		var1 = var9
	end
	if self.description ~= nil and self.description ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var2206 = protoModule.writeString(var10, var11, self.description)
		buff = var10
		var1 = var11
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var2208 = protoModule.writeString(var12, var13, self.cta_text)
		buff = var12
		var1 = var13
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var2210 = protoModule.writeString(var14, var15, self.prompt_id)
		buff = var14
		var1 = var15
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var16, var2212 = protoModule.writeString(var16, var17, self.prompt_type)
		buff = var16
		var1 = var17
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var18, var2214 = protoModule.writeString(var18, var19, self.entity_id)
		buff = var18
		var1 = var19
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_51.decode(p1)
	-- upvalues: t_51 (ref), protoModule (ref)
	local var1 = t_51.new()
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
				var1.roblox_component = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.identifier = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.title = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.user_id = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.description = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.cta_text = buffer.tostring(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.prompt_id = buffer.tostring(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.prompt_type = buffer.tostring(var24)
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.entity_id = buffer.tostring(var26)
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var2)
				var2 = var29 + var28
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var30, var31 = protoModule.readFixed32(p1, var2)
			local _ = var30
			var2 = var31
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var32, var33 = protoModule.readFixed64(p1, var2)
			local _ = var32
			var2 = var33
		else
			error("Unsupported wire type: " .. var2218)
		end
	end
	return var1
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
	local var1 = t_51.new()
	
	if self.roblox_component ~= nil then
		var1.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var1.identifier = self.identifier
	end
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.user_id ~= nil then
		var1.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1.user_id = self.userId
	end
	if self.description ~= nil then
		var1.description = self.description
	end
	if self.cta_text ~= nil then
		var1.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1.entity_id = self.entityId
	end
	return var1
end

t_51.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_51
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p1)
	-- upvalues: t_52 (ref)
	return setmetatable({
		group_id = if p1 == nil or p1.group_id == nil then "" else p1.group_id,
		experience_id = if p1 == nil or p1.experience_id == nil then "" else p1.experience_id
	}, t_52)
end

function t_52:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2254 = protoModule.writeString(var2, var3, self.group_id)
		buff = var2
		var1 = var3
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2256 = protoModule.writeString(var4, var5, self.experience_id)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_52.decode(p1)
	-- upvalues: t_52 (ref), protoModule (ref)
	local var1 = t_52.new()
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
				var1.group_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.experience_id = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var2260)
		end
	end
	return var1
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
	local var1 = t_52.new()
	
	if self.group_id ~= nil then
		var1.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var1.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var1.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var1.experience_id = self.experienceId
	end
	return var1
end

t_52.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_52
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p1)
	-- upvalues: t_53 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		dismiss_text = if p1 == nil or p1.dismiss_text == nil then "" else p1.dismiss_text,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		cards = if p1 == nil or p1.cards == nil then {} else p1.cards,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		feed_item_key = if p1 == nil or p1.feed_item_key == nil then "" else p1.feed_item_key,
		client_attributes = if p1 == nil or p1.client_attributes == nil then nil else p1.client_attributes
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2282 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2284 = protoModule.writeString(var4, var5, self.dismiss_text)
		buff = var4
		var1 = var5
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var2286 = protoModule.writeString(var6, var7, self.user_id)
		buff = var6
		var1 = var7
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var8 = v:encode()
			local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var9, var2289 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
			buff = var9
			var1 = var10
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var2291 = protoModule.writeString(var11, var12, self.prompt_id)
		buff = var11
		var1 = var12
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var13, var2293 = protoModule.writeString(var13, var14, self.prompt_type)
		buff = var13
		var1 = var14
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var15, var16 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var15, var2295 = protoModule.writeString(var15, var16, self.sort_id)
		buff = var15
		var1 = var16
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var17, var18 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var17, var2297 = protoModule.writeString(var17, var18, self.feed_item_key)
		buff = var17
		var1 = var18
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var19 = self.client_attributes.value:encode()
		local var20, var21 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var20, var2300 = protoModule.writeBuffer(var20, var21, var19, buffer.len(var19))
		buff = var20
		var1 = var21
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_53.decode(p1)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var1 = t_53.new()
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
				var1.title = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.dismiss_text = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.user_id = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				table.insert(var1.cards, t.CardContainerCardInputData.decode(var16))
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.prompt_id = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.prompt_type = buffer.tostring(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.sort_id = buffer.tostring(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.feed_item_key = buffer.tostring(var24)
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var26)
				}
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var2)
				var2 = var29 + var28
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var30, var31 = protoModule.readFixed32(p1, var2)
			local _ = var30
			var2 = var31
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var32, var33 = protoModule.readFixed64(p1, var2)
			local _ = var32
			var2 = var33
		else
			error("Unsupported wire type: " .. var2304)
		end
	end
	return var1
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
	local var1 = t_53.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.dismiss_text ~= nil then
		var1.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var1.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var1.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var1.cards = t_1
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var1.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var1.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var1.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var1
end

t_53.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_53
typeRegistryModule.default:register(t.CardContainerInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p1)
	-- upvalues: t_54 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		cta_text = if p1 == nil or p1.cta_text == nil then "" else p1.cta_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		entity_id = if p1 == nil or p1.entity_id == nil then "" else p1.entity_id
	}, t_54)
end

function t_54:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2342 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2344 = protoModule.writeString(var4, var5, self.user_id)
		buff = var4
		var1 = var5
	end
	if self.description ~= nil and self.description ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var2346 = protoModule.writeString(var6, var7, self.description)
		buff = var6
		var1 = var7
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var2348 = protoModule.writeString(var8, var9, self.cta_text)
		buff = var8
		var1 = var9
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var2350 = protoModule.writeString(var10, var11, self.prompt_id)
		buff = var10
		var1 = var11
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var2352 = protoModule.writeString(var12, var13, self.prompt_type)
		buff = var12
		var1 = var13
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var2354 = protoModule.writeString(var14, var15, self.entity_id)
		buff = var14
		var1 = var15
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_54.decode(p1)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var1 = t_54.new()
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
				var1.title = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.user_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.description = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.cta_text = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.prompt_id = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.prompt_type = buffer.tostring(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.entity_id = buffer.tostring(var22)
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var2)
				var2 = var25 + var24
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var2)
			local _ = var26
			var2 = var27
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var2)
			local _ = var28
			var2 = var29
		else
			error("Unsupported wire type: " .. var2358)
		end
	end
	return var1
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
	local var1 = t_54.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.user_id ~= nil then
		var1.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1.user_id = self.userId
	end
	if self.description ~= nil then
		var1.description = self.description
	end
	if self.cta_text ~= nil then
		var1.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var1.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var1.entity_id = self.entityId
	end
	return var1
end

t_54.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_54
typeRegistryModule.default:register(t.CardInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p1)
	-- upvalues: t_55 (ref)
	return setmetatable({
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id,
		audit_data = if p1 == nil or p1.audit_data == nil then "" else p1.audit_data
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2390 = protoModule.writeString(var2, var3, self.prompt_id)
		buff = var2
		var1 = var3
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2392 = protoModule.writeString(var4, var5, self.prompt_type)
		buff = var4
		var1 = var5
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var2394 = protoModule.writeString(var6, var7, self.user_id)
		buff = var6
		var1 = var7
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var2396 = protoModule.writeString(var8, var9, self.audit_data)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_55.decode(p1)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var1 = t_55.new()
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
				var1.prompt_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.prompt_type = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.user_id = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.audit_data = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var2400)
		end
	end
	return var1
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
	local var1 = t_55.new()
	
	if self.prompt_id ~= nil then
		var1.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var1.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var1.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var1.audit_data = self.auditData
	end
	return var1
end

t_55.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_55
typeRegistryModule.default:register(t.DialogInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p1)
	-- upvalues: t_56 (ref)
	return setmetatable({
		sender_count = if p1 == nil or p1.sender_count == nil then 0 else p1.sender_count,
		total_robux_amount = if p1 == nil or p1.total_robux_amount == nil then 0 else p1.total_robux_amount
	}, t_56)
end

function t_56:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2426 = protoModule.writeVarInt(var2, var3, self.sender_count)
		buff = var2
		var1 = var3
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var2428 = protoModule.writeVarInt(var4, var5, self.total_robux_amount)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_56.decode(p1)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var1 = t_56.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var3, var4, var5 = protoModule.readTag(p1, var2)
		local var6 = var3
		local var7 = var4
		var2 = var5
		
		if var7 == protoModule.wireTypes.varint then
			if var6 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.sender_count = var8
			elseif var6 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.total_robux_amount = var10
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var14, var15 = protoModule.readVarInt(p1, var2)
			var2 = var15 + var14
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var2436)
		end
	end
	return var1
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
	local var1 = t_56.new()
	
	if self.sender_count ~= nil then
		var1.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var1.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var1.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var1.total_robux_amount = self.totalRobuxAmount
	end
	return var1
end

t_56.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_56
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p1)
	-- upvalues: t_57 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		primary_text = if p1 == nil or p1.primary_text == nil then "" else p1.primary_text,
		secondary_text = if p1 == nil or p1.secondary_text == nil then "" else p1.secondary_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		times_seen = if p1 == nil or p1.times_seen == nil then 0 else p1.times_seen,
		content = if p1 == nil or p1.content == nil then nil else p1.content
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2454 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.description ~= nil and self.description ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2456 = protoModule.writeString(var4, var5, self.description)
		buff = var4
		var1 = var5
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var2458 = protoModule.writeString(var6, var7, self.primary_text)
		buff = var6
		var1 = var7
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var2460 = protoModule.writeString(var8, var9, self.secondary_text)
		buff = var8
		var1 = var9
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var2462 = protoModule.writeString(var10, var11, self.prompt_id)
		buff = var10
		var1 = var11
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var2464 = protoModule.writeString(var12, var13, self.prompt_type)
		buff = var12
		var1 = var13
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.varint)
		var14, var2466 = protoModule.writeVarInt(var14, var15, self.times_seen)
		buff = var14
		var1 = var15
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var16 = self.content.value:encode()
		local var17, var18 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var17, var2469 = protoModule.writeBuffer(var17, var18, var16, buffer.len(var16))
		buff = var17
		var1 = var18
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_57.decode(p1)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1 = t_57.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 7 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.times_seen = var8
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.title = buffer.tostring(var12)
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.description = buffer.tostring(var14)
			elseif var7 == 3 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.primary_text = buffer.tostring(var16)
			elseif var7 == 4 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.secondary_text = buffer.tostring(var18)
			elseif var7 == 5 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.prompt_id = buffer.tostring(var20)
			elseif var7 == 6 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.prompt_type = buffer.tostring(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var24)
				}
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var2)
				var2 = var27 + var26
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var28, var29 = protoModule.readFixed32(p1, var2)
			local _ = var28
			var2 = var29
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var2)
			local _ = var30
			var2 = var31
		else
			error("Unsupported wire type: " .. var2473)
		end
	end
	return var1
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
	local var1 = t_57.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.description ~= nil then
		var1.description = self.description
	end
	if self.primary_text ~= nil then
		var1.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var1.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var1.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var1.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var1.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var1.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var1.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var1.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var1
end

t_57.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_57
typeRegistryModule.default:register(t.BannerInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p1)
	-- upvalues: t_58 (ref)
	return setmetatable({
		tooltip_text = if p1 == nil or p1.tooltip_text == nil then "" else p1.tooltip_text,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type
	}, t_58)
end

function t_58:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2507 = protoModule.writeString(var2, var3, self.tooltip_text)
		buff = var2
		var1 = var3
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2509 = protoModule.writeString(var4, var5, self.prompt_id)
		buff = var4
		var1 = var5
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var2511 = protoModule.writeString(var6, var7, self.prompt_type)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_58.decode(p1)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var1 = t_58.new()
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
				var1.tooltip_text = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.prompt_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.prompt_type = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var2515)
		end
	end
	return var1
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
	local var1 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var1.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var1.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1.prompt_type = self.promptType
	end
	return var1
end

t_58.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_58
typeRegistryModule.default:register(t.TooltipInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p1)
	-- upvalues: t_59 (ref)
	return setmetatable({
		media_id = if p1 == nil or p1.media_id == nil then "" else p1.media_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		description = if p1 == nil or p1.description == nil then "" else p1.description,
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type,
		anchor_tag = if p1 == nil or p1.anchor_tag == nil then "" else p1.anchor_tag
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2539 = protoModule.writeString(var2, var3, self.media_id)
		buff = var2
		var1 = var3
	end
	if self.title ~= nil and self.title ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2541 = protoModule.writeString(var4, var5, self.title)
		buff = var4
		var1 = var5
	end
	if self.description ~= nil and self.description ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var2543 = protoModule.writeString(var6, var7, self.description)
		buff = var6
		var1 = var7
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var2545 = protoModule.writeString(var8, var9, self.prompt_id)
		buff = var8
		var1 = var9
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var2547 = protoModule.writeString(var10, var11, self.prompt_type)
		buff = var10
		var1 = var11
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var2549 = protoModule.writeString(var12, var13, self.anchor_tag)
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_59.decode(p1)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var1 = t_59.new()
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
				var1.media_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.title = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.description = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.prompt_id = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.prompt_type = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.anchor_tag = buffer.tostring(var20)
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var2)
				var2 = var23 + var22
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var24, var25 = protoModule.readFixed32(p1, var2)
			local _ = var24
			var2 = var25
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var26, var27 = protoModule.readFixed64(p1, var2)
			local _ = var26
			var2 = var27
		else
			error("Unsupported wire type: " .. var2553)
		end
	end
	return var1
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
	local var1 = t_59.new()
	
	if self.media_id ~= nil then
		var1.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var1.media_id = self.mediaId
	end
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.description ~= nil then
		var1.description = self.description
	end
	if self.prompt_id ~= nil then
		var1.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var1.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var1.anchor_tag = self.anchorTag
	end
	return var1
end

t_59.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_59
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p1)
	-- upvalues: t_60 (ref)
	return setmetatable({
		prompt_id = if p1 == nil or p1.prompt_id == nil then "" else p1.prompt_id,
		prompt_type = if p1 == nil or p1.prompt_type == nil then "" else p1.prompt_type
	}, t_60)
end

function t_60:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2583 = protoModule.writeString(var2, var3, self.prompt_id)
		buff = var2
		var1 = var3
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2585 = protoModule.writeString(var4, var5, self.prompt_type)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_60.decode(p1)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var1 = t_60.new()
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
				var1.prompt_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.prompt_type = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var2589)
		end
	end
	return var1
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
	local var1 = t_60.new()
	
	if self.prompt_id ~= nil then
		var1.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var1.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var1.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var1.prompt_type = self.promptType
	end
	return var1
end

t_60.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_60
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p1)
	-- upvalues: t_61 (ref)
	return setmetatable({
		upsell_prompt = if p1 == nil or p1.upsell_prompt == nil then "" else p1.upsell_prompt
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2611 = protoModule.writeString(var2, var3, self.upsell_prompt)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_61.decode(p1)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var1 = t_61.new()
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
				var1.upsell_prompt = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2615)
		end
	end
	return var1
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
	local var1 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var1.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1.upsell_prompt = self.upsellPrompt
	end
	return var1
end

t_61.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_61
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p1)
	-- upvalues: t_62 (ref)
	return setmetatable({
		modal_variant = if p1 == nil or p1.modal_variant == nil then "" else p1.modal_variant,
		modal_sequence = if p1 == nil or p1.modal_sequence == nil then "" else p1.modal_sequence,
		conversation_id = if p1 == nil or p1.conversation_id == nil then "" else p1.conversation_id,
		friend_id = if p1 == nil or p1.friend_id == nil then "" else p1.friend_id
	}, t_62)
end

function t_62:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2635 = protoModule.writeString(var2, var3, self.modal_variant)
		buff = var2
		var1 = var3
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2637 = protoModule.writeString(var4, var5, self.modal_sequence)
		buff = var4
		var1 = var5
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var2639 = protoModule.writeString(var6, var7, self.conversation_id)
		buff = var6
		var1 = var7
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var2641 = protoModule.writeString(var8, var9, self.friend_id)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_62.decode(p1)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var1 = t_62.new()
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
				var1.modal_variant = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.modal_sequence = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.conversation_id = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.friend_id = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var2645)
		end
	end
	return var1
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
	local var1 = t_62.new()
	
	if self.modal_variant ~= nil then
		var1.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var1.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var1.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var1.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var1.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var1.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var1.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var1.friend_id = self.friendId
	end
	return var1
end

t_62.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_62
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p1)
	-- upvalues: t_63 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2671 = protoModule.writeString(var2, var3, self.event_id)
		buff = var2
		var1 = var3
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2673 = protoModule.writeString(var4, var5, self.universe_id)
		buff = var4
		var1 = var5
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var6, var7 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var6, var2675 = protoModule.writeString(var6, var7, i)
			local var8 = v:encode()
			var7, var2677 = protoModule.writeTag(var6, var7, 2, protoModule.wireTypes.lengthDelimited)
			var7, var2677 = protoModule.writeBuffer(var7, var2677, var8, buffer.len(var8))
			local var9 = var7
			local var10 = var2677
			local var11, var12 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var11, var2681 = protoModule.writeBuffer(var11, var12, var9, var10)
			buff = var11
			var1 = var12
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var13, var14 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var13, var2683 = protoModule.writeString(var13, var14, v)
			buff = var13
			var1 = var14
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_63.decode(p1)
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var1 = t_63.new()
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
				var1.event_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var14 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var14)
				var1.entry_map[var14.key or ""] = var14.value or t.FeedEntry.new()
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				table.insert(var1.entry_order, buffer.tostring(var16))
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var2687)
		end
	end
	return var1
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
	local var1 = t_63.new()
	
	if self.event_id ~= nil then
		var1.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	return var1
end

t_63.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_63
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p1)
	-- upvalues: t_64 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_64)
end

function t_64:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2719 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2722 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_64.decode(p1)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1 = t_64.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.FeedEntry.decode(var12)
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
			error("Unsupported wire type: " .. var2726)
		end
	end
	return var1
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
	local var1 = t_64.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1
end

t_64.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_64
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p1)
	-- upvalues: t_65 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, t_65)
end

function t_65:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2748 = protoModule.writeString(var2, var3, self.event_id)
		buff = var2
		var1 = var3
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2750 = protoModule.writeString(var4, var5, self.universe_id)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_65.decode(p1)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var1 = t_65.new()
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
				var1.event_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var2754)
		end
	end
	return var1
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
	local var1 = t_65.new()
	
	if self.event_id ~= nil then
		var1.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	return var1
end

t_65.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_65
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p1)
	-- upvalues: t_66 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, t_66)
end

function t_66:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2776 = protoModule.writeString(var2, var3, self.event_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_66.decode(p1)
	-- upvalues: t_66 (ref), protoModule (ref)
	local var1 = t_66.new()
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
				var1.event_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2780)
		end
	end
	return var1
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
	local var1 = t_66.new()
	
	if self.event_id ~= nil then
		var1.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1.event_id = self.eventId
	end
	return var1
end

t_66.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_66
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p1)
	-- upvalues: t_67 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		rsvp_users = if p1 == nil or p1.rsvp_users == nil then {} else p1.rsvp_users
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2800 = protoModule.writeString(var2, var3, self.event_id)
		buff = var2
		var1 = var3
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2802 = protoModule.writeString(var4, var5, self.universe_id)
		buff = var4
		var1 = var5
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var6 = v:encode()
			local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var7, var2805 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
			buff = var7
			var1 = var8
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_67.decode(p1)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1 = t_67.new()
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
				var1.event_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				table.insert(var1.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var14))
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var2809)
		end
	end
	return var1
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
	local var1 = t_67.new()
	
	if self.event_id ~= nil then
		var1.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var1.rsvp_users = t_1
	end
	return var1
end

t_67.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_67
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p1)
	-- upvalues: t_68 (ref)
	return setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then 0 else p1.user_id
	}, t_68)
end

function t_68:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var2836 = protoModule.writeVarInt(var2, var3, self.user_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_68.decode(p1)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var1 = t_68.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local _ = nil
		local var3, var4, var5 = protoModule.readTag(p1, var2)
		local var6 = var3
		local var7 = var4
		var2 = var5
		
		if var7 == protoModule.wireTypes.varint then
			if var6 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.user_id = var8
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		elseif var7 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var12, var13 = protoModule.readVarInt(p1, var2)
			var2 = var13 + var12
		elseif var7 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var7 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2844)
		end
	end
	return var1
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
	local var1 = t_68.new()
	
	if self.user_id ~= nil then
		var1.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1.user_id = self.userId
	end
	return var1
end

t_68.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = t_68
typeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p1)
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2860 = protoModule.writeString(var2, var3, self.event_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_69.decode(p1)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var1 = t_69.new()
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
				var1.event_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2864)
		end
	end
	return var1
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
	local var1 = t_69.new()
	
	if self.event_id ~= nil then
		var1.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1.event_id = self.eventId
	end
	return var1
end

t_69.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_69
typeRegistryModule.default:register(t.EventInfoTableInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p1)
	-- upvalues: t_70 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id
	}, t_70)
end

function t_70:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2884 = protoModule.writeString(var2, var3, self.event_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_70.decode(p1)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var1 = t_70.new()
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
				var1.event_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var2888)
		end
	end
	return var1
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
	local var1 = t_70.new()
	
	if self.event_id ~= nil then
		var1.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1.event_id = self.eventId
	end
	return var1
end

t_70.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_70
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p1)
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p1 == nil or p1.event_id == nil then "" else p1.event_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2908 = protoModule.writeString(var2, var3, self.event_id)
		buff = var2
		var1 = var3
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var2910 = protoModule.writeString(var4, var5, self.universe_id)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_71.decode(p1)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var1 = t_71.new()
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
				var1.event_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var2914)
		end
	end
	return var1
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
	local var1 = t_71.new()
	
	if self.event_id ~= nil then
		var1.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	return var1
end

t_71.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_71
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p1)
	-- upvalues: t_72 (ref)
	return setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		next_page_token = if p1 == nil or p1.next_page_token == nil then "" else p1.next_page_token,
		sticky_filter_pills = if p1 == nil or p1.sticky_filter_pills == nil then nil else p1.sticky_filter_pills,
		applied_filters = if p1 == nil or p1.applied_filters == nil then "" else p1.applied_filters
	}, t_72)
end

function t_72:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var2936 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var2938 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var2938 = protoModule.writeBuffer(var3, var2938, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var2938
			local var7, var8 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var7, var2942 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var9, var10 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var9, var2944 = protoModule.writeString(var9, var10, v)
			buff = var9
			var1 = var10
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var11, var2946 = protoModule.writeString(var11, var12, self.next_page_token)
		buff = var11
		var1 = var12
	end
	if self.sticky_filter_pills ~= nil then
		local var13 = self.sticky_filter_pills:encode()
		local var14, var15 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var14, var2949 = protoModule.writeBuffer(var14, var15, var13, buffer.len(var13))
		buff = var14
		var1 = var15
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var16, var17 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var16, var2951 = protoModule.writeString(var16, var17, self.applied_filters)
		buff = var16
		var1 = var17
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_72.decode(p1)
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var1 = t_72.new()
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
				var10 = t.ChartsFeedInputData_EntryMapEntry.decode(var10)
				var1.entry_map[var10.key or ""] = var10.value or t.FeedEntry.new()
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.entry_order, buffer.tostring(var12))
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.next_page_token = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.sticky_filter_pills = t.FilterPillsInputData.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.applied_filters = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var2955)
		end
	end
	return var1
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
	local var1 = t_72.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var1.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var1.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var1.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var1.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1.applied_filters = self.appliedFilters
	end
	return var1
end

t_72.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_72
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p1)
	-- upvalues: t_73 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var2989 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var2992 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_73.decode(p1)
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var1 = t_73.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.FeedEntry.decode(var12)
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
			error("Unsupported wire type: " .. var2996)
		end
	end
	return var1
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
	local var1 = t_73.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1
end

t_73.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_73
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p1)
	-- upvalues: t_74 (ref)
	return setmetatable({
		filter_groups = if p1 == nil or p1.filter_groups == nil then {} else p1.filter_groups,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		secondary_sort_id = if p1 == nil or p1.secondary_sort_id == nil then 0 else p1.secondary_sort_id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		primary_sort_id = if p1 == nil or p1.primary_sort_id == nil then nil else p1.primary_sort_id,
		applied_filters = if p1 == nil or p1.applied_filters == nil then nil else p1.applied_filters
	}, t_74)
end

function t_74:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var3019 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3021 = protoModule.writeString(var5, var6, self.sort_id)
		buff = var5
		var1 = var6
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var7, var3023 = protoModule.writeVarInt(var7, var8, self.secondary_sort_id)
		buff = var7
		var1 = var8
	end
	if self.title ~= nil and self.title ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var3025 = protoModule.writeString(var9, var10, self.title)
		buff = var9
		var1 = var10
	end
	if self.primary_sort_id ~= nil then
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var11, var3027 = protoModule.writeVarInt(var11, var12, self.primary_sort_id)
		buff = var11
		var1 = var12
	end
	if self.applied_filters ~= nil then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var13, var3029 = protoModule.writeString(var13, var14, self.applied_filters)
		buff = var13
		var1 = var14
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_74.decode(p1)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var1 = t_74.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.secondary_sort_id = var8
			elseif var7 == 5 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI32(p1, var2)
				var2 = var11
				var1.primary_sort_id = var10
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				table.insert(var1.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var14))
			elseif var7 == 2 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.sort_id = buffer.tostring(var16)
			elseif var7 == 4 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.title = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.applied_filters = buffer.tostring(var20)
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var2)
				var2 = var23 + var22
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var24, var25 = protoModule.readFixed32(p1, var2)
			local _ = var24
			var2 = var25
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var26, var27 = protoModule.readFixed64(p1, var2)
			local _ = var26
			var2 = var27
		else
			error("Unsupported wire type: " .. var3033)
		end
	end
	return var1
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
	local var1 = t_74.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var1.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var1.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var1.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1.applied_filters = self.appliedFilters
	end
	return var1
end

t_74.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_74
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p1)
	-- upvalues: t_75 (ref)
	return setmetatable({
		filter_id = if p1 == nil or p1.filter_id == nil then "" else p1.filter_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		options = if p1 == nil or p1.options == nil then {} else p1.options,
		default_option_id = if p1 == nil or p1.default_option_id == nil then "" else p1.default_option_id,
		selected_option_id = if p1 == nil or p1.selected_option_id == nil then "" else p1.selected_option_id,
		filter_type = if p1 == nil or p1.filter_type == nil then "" else p1.filter_type,
		inactive_option_ids = if p1 == nil or p1.inactive_option_ids == nil then {} else p1.inactive_option_ids,
		info_text = if p1 == nil or p1.info_text == nil then "" else p1.info_text
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3066 = protoModule.writeString(var2, var3, self.filter_id)
		buff = var2
		var1 = var3
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var3068 = protoModule.writeString(var4, var5, self.display_name)
		buff = var4
		var1 = var5
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var6 = v:encode()
			local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var7, var3071 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
			buff = var7
			var1 = var8
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var3073 = protoModule.writeString(var9, var10, self.default_option_id)
		buff = var9
		var1 = var10
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var3075 = protoModule.writeString(var11, var12, self.selected_option_id)
		buff = var11
		var1 = var12
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var13, var3077 = protoModule.writeString(var13, var14, self.filter_type)
		buff = var13
		var1 = var14
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var15, var16 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var15, var3079 = protoModule.writeString(var15, var16, v)
			buff = var15
			var1 = var16
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var17, var18 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var17, var3081 = protoModule.writeString(var17, var18, self.info_text)
		buff = var17
		var1 = var18
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_75.decode(p1)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var1 = t_75.new()
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
				var1.filter_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.display_name = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				table.insert(var1.options, t.FilterPillsInputData_FilterOption.decode(var14))
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.default_option_id = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.selected_option_id = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.filter_type = buffer.tostring(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				table.insert(var1.inactive_option_ids, buffer.tostring(var22))
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.info_text = buffer.tostring(var24)
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var2)
				var2 = var27 + var26
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var28, var29 = protoModule.readFixed32(p1, var2)
			local _ = var28
			var2 = var29
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var2)
			local _ = var30
			var2 = var31
		else
			error("Unsupported wire type: " .. var3085)
		end
	end
	return var1
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
	local var1 = t_75.new()
	
	if self.filter_id ~= nil then
		var1.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var1.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var1.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var1.options = t_1
	end
	if self.default_option_id ~= nil then
		var1.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var1.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var1.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var1.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var1.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var1.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var1.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var1.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var1.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1.info_text = self.infoText
	end
	return var1
end

t_75.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_75
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p1)
	-- upvalues: t_76 (ref)
	return setmetatable({
		option_id = if p1 == nil or p1.option_id == nil then "" else p1.option_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		option_context_tag = if p1 == nil or p1.option_context_tag == nil then "" else p1.option_context_tag
	}, t_76)
end

function t_76:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3124 = protoModule.writeString(var2, var3, self.option_id)
		buff = var2
		var1 = var3
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var3126 = protoModule.writeString(var4, var5, self.display_name)
		buff = var4
		var1 = var5
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var3128 = protoModule.writeString(var6, var7, self.option_context_tag)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_76.decode(p1)
	-- upvalues: t_76 (ref), protoModule (ref)
	local var1 = t_76.new()
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
				var1.option_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.display_name = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.option_context_tag = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var3132)
		end
	end
	return var1
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
	local var1 = t_76.new()
	
	if self.option_id ~= nil then
		var1.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var1.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var1.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var1.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var1.option_context_tag = self.optionContextTag
	end
	return var1
end

t_76.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_76
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p1)
	-- upvalues: t_77 (ref)
	return setmetatable({
		sort_options = if p1 == nil or p1.sort_options == nil then {} else p1.sort_options,
		selected_sort_id = if p1 == nil or p1.selected_sort_id == nil then "" else p1.selected_sort_id
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var3157 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3159 = protoModule.writeString(var5, var6, self.selected_sort_id)
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_77.decode(p1)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var1 = t_77.new()
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
				table.insert(var1.sort_options, t.SortSelectorInputData_SortOption.decode(var10))
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.selected_sort_id = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var3163)
		end
	end
	return var1
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
	local var1 = t_77.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var1.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var1.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var1.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var1.selected_sort_id = self.selectedSortId
	end
	return var1
end

t_77.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_77
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p1)
	-- upvalues: t_78 (ref)
	return setmetatable({
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		content_type = if p1 == nil or p1.content_type == nil then "" else p1.content_type
	}, t_78)
end

function t_78:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3188 = protoModule.writeString(var2, var3, self.sort_id)
		buff = var2
		var1 = var3
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var3190 = protoModule.writeString(var4, var5, self.display_name)
		buff = var4
		var1 = var5
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var3192 = protoModule.writeString(var6, var7, self.content_type)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_78.decode(p1)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var1 = t_78.new()
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
				var1.sort_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.display_name = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.content_type = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var3196)
		end
	end
	return var1
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
	local var1 = t_78.new()
	
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var1.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var1.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var1.content_type = self.contentType
	end
	return var1
end

t_78.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_78
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p1)
	-- upvalues: t_79 (ref)
	return setmetatable({
		selected_option = if p1 == nil or p1.selected_option == nil then "" else p1.selected_option,
		options = if p1 == nil or p1.options == nil then {} else p1.options,
		experience_carousel = if p1 == nil or p1.experience_carousel == nil then nil else p1.experience_carousel
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3220 = protoModule.writeString(var2, var3, self.selected_option)
		buff = var2
		var1 = var3
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var4 = v:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var3223 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		end
	end
	if self.experience_carousel ~= nil then
		local var7 = self.experience_carousel:encode()
		local var8, var9 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var8, var3226 = protoModule.writeBuffer(var8, var9, var7, buffer.len(var7))
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_79.decode(p1)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var1 = t_79.new()
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
				var1.selected_option = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.options, t.SelectorOption.decode(var12))
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.experience_carousel = t.ExperienceCarouselInputData.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var3230)
		end
	end
	return var1
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
	local var1 = t_79.new()
	
	if self.selected_option ~= nil then
		var1.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var1.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var1.options = t_1
	end
	if self.experience_carousel ~= nil then
		var1.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var1.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var1
end

t_79.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_79
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p1)
	-- upvalues: t_80 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		preview_rows = if p1 == nil or p1.preview_rows == nil then 0 else p1.preview_rows,
		widget_style = if p1 == nil or p1.widget_style == nil then nil else p1.widget_style,
		see_all_button = if p1 == nil or p1.see_all_button == nil then false else p1.see_all_button,
		information_popover_text = if p1 == nil or p1.information_popover_text == nil then "" else p1.information_popover_text
	}, t_80)
end

function t_80:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3256 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var4, var3258 = protoModule.writeVarInt(var4, var5, self.preview_rows)
		buff = var4
		var1 = var5
	end
	if self.widget_style ~= nil then
		local var6 = self.widget_style:encode()
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var3261 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
		buff = var7
		var1 = var8
	end
	if self.see_all_button then
		local var9, var10 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var9, var3263 = protoModule.writeVarInt(var9, var10, if self.see_all_button then 1 else 0)
		buff = var9
		var1 = var10
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var11, var3265 = protoModule.writeString(var11, var12, self.information_popover_text)
		buff = var11
		var1 = var12
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_80.decode(p1)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var1 = t_80.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 4 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.preview_rows = var8
			elseif var7 == 5 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.see_all_button = var10 ~= 0
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.id = buffer.tostring(var14)
			elseif var7 == 3 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.widget_style = t.WidgetStyleData.decode(var16)
			elseif var7 == 6 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.information_popover_text = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var3269)
		end
	end
	return var1
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
	local var1 = t_80.new()
	
	if self.id ~= nil then
		var1.id = self.id
	end
	if self.preview_rows ~= nil then
		var1.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var1.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var1.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var1.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var1.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var1.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var1.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var1.information_popover_text = self.informationPopoverText
	end
	return var1
end

t_80.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_80
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p1)
	-- upvalues: t_81 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		num_items_to_show = if p1 == nil or p1.num_items_to_show == nil then 0 else p1.num_items_to_show,
		widget_style = if p1 == nil or p1.widget_style == nil then nil else p1.widget_style,
		see_all_button = if p1 == nil or p1.see_all_button == nil then false else p1.see_all_button,
		information_popover_text = if p1 == nil or p1.information_popover_text == nil then "" else p1.information_popover_text
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3297 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var4, var3299 = protoModule.writeVarInt(var4, var5, self.num_items_to_show)
		buff = var4
		var1 = var5
	end
	if self.widget_style ~= nil then
		local var6 = self.widget_style:encode()
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var3302 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
		buff = var7
		var1 = var8
	end
	if self.see_all_button then
		local var9, var10 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.varint)
		var9, var3304 = protoModule.writeVarInt(var9, var10, if self.see_all_button then 1 else 0)
		buff = var9
		var1 = var10
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var11, var3306 = protoModule.writeString(var11, var12, self.information_popover_text)
		buff = var11
		var1 = var12
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_81.decode(p1)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var1 = t_81.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 5 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.num_items_to_show = var8
			elseif var7 == 6 then
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				var2 = var11
				var1.see_all_button = var10 ~= 0
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				local _ = var12
				var2 = var13
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.id = buffer.tostring(var14)
			elseif var7 == 3 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.widget_style = t.WidgetStyleData.decode(var16)
			elseif var7 == 7 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.information_popover_text = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var3310)
		end
	end
	return var1
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
	local var1 = t_81.new()
	
	if self.id ~= nil then
		var1.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var1.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var1.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var1.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var1.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var1.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var1.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var1.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var1.information_popover_text = self.informationPopoverText
	end
	return var1
end

t_81.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_81
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p1)
	-- upvalues: t_82 (ref)
	return setmetatable({
		background_layers = if p1 == nil or p1.background_layers == nil then {} else p1.background_layers
	}, t_82)
end

function t_82:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var3339 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_82.decode(p1)
	-- upvalues: t_82 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var1 = t_82.new()
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
				table.insert(var1.background_layers, backgroundLayerModule.BackgroundLayer.decode(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var3343)
		end
	end
	return var1
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
	local var1 = t_82.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var1.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var1.background_layers = t
	end
	return var1
end

t_82.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_82
typeRegistryModule.default:register(t.WidgetStyleData)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p1)
	-- upvalues: t_83 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		available_until = if p1 == nil or p1.available_until == nil then "" else p1.available_until,
		widget_style = if p1 == nil or p1.widget_style == nil then nil else p1.widget_style
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3366 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var3368 = protoModule.writeString(var4, var5, self.available_until)
		buff = var4
		var1 = var5
	end
	if self.widget_style ~= nil then
		local var6 = self.widget_style:encode()
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var3371 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
		buff = var7
		var1 = var8
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_83.decode(p1)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var1 = t_83.new()
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
				var1.id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.available_until = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.widget_style = t.WidgetStyleData.decode(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var3375)
		end
	end
	return var1
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
	local var1 = t_83.new()
	
	if self.id ~= nil then
		var1.id = self.id
	end
	if self.available_until ~= nil then
		var1.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var1.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var1.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var1.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var1
end

t_83.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_83
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p1)
	-- upvalues: t_84 (ref)
	return setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order
	}, t_84)
end

function t_84:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var3399 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var3401 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var3401 = protoModule.writeBuffer(var3, var3401, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var3401
			local var7, var8 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var7, var3405 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var9, var10 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var9, var3407 = protoModule.writeString(var9, var10, v)
			buff = var9
			var1 = var10
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_84.decode(p1)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var1 = t_84.new()
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
				var10 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var10)
				var1.entry_map[var10.key or ""] = var10.value or t.FeedEntry.new()
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.entry_order, buffer.tostring(var12))
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
			error("Unsupported wire type: " .. var3411)
		end
	end
	return var1
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
	local var1 = t_84.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	return var1
end

t_84.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_84
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p1)
	-- upvalues: t_85 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3439 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3442 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_85.decode(p1)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var1 = t_85.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.FeedEntry.decode(var12)
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
			error("Unsupported wire type: " .. var3446)
		end
	end
	return var1
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
	local var1 = t_85.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1
end

t_85.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_85
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p1)
	-- upvalues: t_86 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p1 == nil or p1.marketplace_catalog_category_items == nil then {} else p1.marketplace_catalog_category_items,
		active_category_id = if p1 == nil or p1.active_category_id == nil then "" else p1.active_category_id,
		active_tooltip_idx = if p1 == nil or p1.active_tooltip_idx == nil then 0 else p1.active_tooltip_idx
	}, t_86)
end

function t_86:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var3469 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3471 = protoModule.writeString(var5, var6, self.active_category_id)
		buff = var5
		var1 = var6
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var7, var3473 = protoModule.writeVarInt(var7, var8, self.active_tooltip_idx)
		buff = var7
		var1 = var8
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_86.decode(p1)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var1 = t_86.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.active_tooltip_idx = var8
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var12))
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.active_category_id = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var3477)
		end
	end
	return var1
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
	local var1 = t_86.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var1.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var1.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var1.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var1.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var1.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var1.active_tooltip_idx = self.activeTooltipIdx
	end
	return var1
end

t_86.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_86
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p1)
	-- upvalues: t_87 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p1 == nil or p1.marketplace_catalog_category_item_id == nil then "" else p1.marketplace_catalog_category_item_id
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3504 = protoModule.writeString(var2, var3, self.marketplace_catalog_category_item_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_87.decode(p1)
	-- upvalues: t_87 (ref), protoModule (ref)
	local var1 = t_87.new()
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
				var1.marketplace_catalog_category_item_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var3508)
		end
	end
	return var1
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
	local var1 = t_87.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var1.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var1.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var1
end

t_87.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_87
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p1)
	-- upvalues: t_88 (ref)
	return setmetatable({
		hero_icon = if p1 == nil or p1.hero_icon == nil then nil else p1.hero_icon,
		body_dismiss_button_text = if p1 == nil or p1.body_dismiss_button_text == nil then "" else p1.body_dismiss_button_text,
		body_title = if p1 == nil or p1.body_title == nil then "" else p1.body_title,
		body_rich_text = if p1 == nil or p1.body_rich_text == nil then "" else p1.body_rich_text,
		terms_link_text = if p1 == nil or p1.terms_link_text == nil then nil else p1.terms_link_text,
		terms_title = if p1 == nil or p1.terms_title == nil then nil else p1.terms_title,
		terms_body_rich_text = if p1 == nil or p1.terms_body_rich_text == nil then nil else p1.terms_body_rich_text,
		terms_dismiss_button_text = if p1 == nil or p1.terms_dismiss_button_text == nil then nil else p1.terms_dismiss_button_text,
		offer_id = if p1 == nil or p1.offer_id == nil then "" else p1.offer_id
	}, t_88)
end

function t_88:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.hero_icon ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3528 = protoModule.writeString(var2, var3, self.hero_icon)
		buff = var2
		var1 = var3
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var3530 = protoModule.writeString(var4, var5, self.body_dismiss_button_text)
		buff = var4
		var1 = var5
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var3532 = protoModule.writeString(var6, var7, self.body_title)
		buff = var6
		var1 = var7
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var3534 = protoModule.writeString(var8, var9, self.body_rich_text)
		buff = var8
		var1 = var9
	end
	if self.terms_link_text ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var3536 = protoModule.writeString(var10, var11, self.terms_link_text)
		buff = var10
		var1 = var11
	end
	if self.terms_title ~= nil then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var3538 = protoModule.writeString(var12, var13, self.terms_title)
		buff = var12
		var1 = var13
	end
	if self.terms_body_rich_text ~= nil then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var3540 = protoModule.writeString(var14, var15, self.terms_body_rich_text)
		buff = var14
		var1 = var15
	end
	if self.terms_dismiss_button_text ~= nil then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var16, var3542 = protoModule.writeString(var16, var17, self.terms_dismiss_button_text)
		buff = var16
		var1 = var17
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var18, var3544 = protoModule.writeString(var18, var19, self.offer_id)
		buff = var18
		var1 = var19
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_88.decode(p1)
	-- upvalues: t_88 (ref), protoModule (ref)
	local var1 = t_88.new()
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
				var1.hero_icon = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.body_dismiss_button_text = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.body_title = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.body_rich_text = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.terms_link_text = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.terms_title = buffer.tostring(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.terms_body_rich_text = buffer.tostring(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.terms_dismiss_button_text = buffer.tostring(var24)
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.offer_id = buffer.tostring(var26)
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var2)
				var2 = var29 + var28
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var30, var31 = protoModule.readFixed32(p1, var2)
			local _ = var30
			var2 = var31
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var32, var33 = protoModule.readFixed64(p1, var2)
			local _ = var32
			var2 = var33
		else
			error("Unsupported wire type: " .. var3548)
		end
	end
	return var1
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
	local var1 = t_88.new()
	
	if self.hero_icon ~= nil then
		var1.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var1.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var1.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var1.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var1.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var1.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var1.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var1.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var1.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var1.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var1.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var1.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var1.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var1.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var1.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var1.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var1.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var1.offer_id = self.offerId
	end
	return var1
end

t_88.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_88
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p1)
	-- upvalues: t_89 (ref)
	return setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		preview_columns = if p1 == nil or p1.preview_columns == nil then 0 else p1.preview_columns,
		impression_id = if p1 == nil or p1.impression_id == nil then "" else p1.impression_id
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var3585 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var5, var3587 = protoModule.writeVarInt(var5, var6, self.preview_columns)
		buff = var5
		var1 = var6
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var3589 = protoModule.writeString(var7, var8, self.impression_id)
		buff = var7
		var1 = var8
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_89.decode(p1)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var1 = t_89.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.preview_columns = var8
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.items, t.CatalogItemGridInputData_CatalogItem.decode(var12))
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.impression_id = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var3593)
		end
	end
	return var1
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
	local var1 = t_89.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var1.items = t_1
	end
	if self.preview_columns ~= nil then
		var1.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var1.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var1.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var1.impression_id = self.impressionId
	end
	return var1
end

t_89.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_89
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p1)
	-- upvalues: t_90 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		type = if p1 == nil or p1.type == nil then "" else p1.type
	}, t_90)
end

function t_90:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3619 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.type ~= nil and self.type ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var3621 = protoModule.writeString(var4, var5, self.type)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_90.decode(p1)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var1 = t_90.new()
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
				var1.id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.type = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var3625)
		end
	end
	return var1
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
	local var1 = t_90.new()
	
	if self.id ~= nil then
		var1.id = self.id
	end
	if self.type ~= nil then
		var1.type = self.type
	end
	return var1
end

t_90.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_90
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p1)
	-- upvalues: t_91 (ref)
	return setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		content_pools = if p1 == nil or p1.content_pools == nil then {} else p1.content_pools,
		search_session_id = if p1 == nil or p1.search_session_id == nil then "" else p1.search_session_id
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var3647 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var3649 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var3649 = protoModule.writeBuffer(var3, var3649, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var3649
			local var7, var8 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var7, var3653 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var9, var10 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var9, var3655 = protoModule.writeString(var9, var10, v)
			buff = var9
			var1 = var10
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var11, var12 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var11, var3657 = protoModule.writeString(var11, var12, i)
			local var13 = v:encode()
			var12, var3659 = protoModule.writeTag(var11, var12, 2, protoModule.wireTypes.lengthDelimited)
			var12, var3659 = protoModule.writeBuffer(var12, var3659, var13, buffer.len(var13))
			local var14 = var12
			local var15 = var3659
			local var16, var17 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var16, var3663 = protoModule.writeBuffer(var16, var17, var14, var15)
			buff = var16
			var1 = var17
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var18, var3665 = protoModule.writeString(var18, var19, self.search_session_id)
		buff = var18
		var1 = var19
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_91.decode(p1)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var1 = t_91.new()
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
				var10 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var10)
				var1.entry_map[var10.key or ""] = var10.value or t.FeedEntry.new()
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.entry_order, buffer.tostring(var12))
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var14 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var14)
				var1.content_pools[var14.key or ""] = var14.value or t.ContentPool.new()
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.search_session_id = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var3669)
		end
	end
	return var1
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
	local var1 = t_91.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var1.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var1.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var1.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var1.search_session_id = self.searchSessionId
	end
	return var1
end

t_91.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_91
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p1)
	-- upvalues: t_92 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_92)
end

function t_92:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3704 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3707 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_92.decode(p1)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var1 = t_92.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.FeedEntry.decode(var12)
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
			error("Unsupported wire type: " .. var3711)
		end
	end
	return var1
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
	local var1 = t_92.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1
end

t_92.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_92
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p1)
	-- upvalues: t_93 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3733 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3736 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_93.decode(p1)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var1 = t_93.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.ContentPool.decode(var12)
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
			error("Unsupported wire type: " .. var3740)
		end
	end
	return var1
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
	local var1 = t_93.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.ContentPool.jsonDecode(self.value)
	end
	return var1
end

t_93.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_93
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p1)
	-- upvalues: t_94 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		is_content_locked = if p1 == nil or p1.is_content_locked == nil then false else p1.is_content_locked
	}, t_94)
end

function t_94:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3762 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.is_content_locked then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var3764 = protoModule.writeVarInt(var4, var5, if self.is_content_locked then 1 else 0)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_94.decode(p1)
	-- upvalues: t_94 (ref), protoModule (ref)
	local var1 = t_94.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.is_content_locked = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.universe_id = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var3768)
		end
	end
	return var1
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
	local var1 = t_94.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var1.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1.is_content_locked = self.isContentLocked
	end
	return var1
end

t_94.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_94
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p1)
	-- upvalues: t_95 (ref)
	return setmetatable({
		overview_rich_text = if p1 == nil or p1.overview_rich_text == nil then "" else p1.overview_rich_text,
		result_entry = if p1 == nil or p1.result_entry == nil then nil else p1.result_entry,
		follow_up_queries = if p1 == nil or p1.follow_up_queries == nil then {} else p1.follow_up_queries,
		show_loading = if p1 == nil or p1.show_loading == nil then false else p1.show_loading,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		search_query = if p1 == nil or p1.search_query == nil then "" else p1.search_query,
		universe_ids = if p1 == nil or p1.universe_ids == nil then "" else p1.universe_ids
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3790 = protoModule.writeString(var2, var3, self.overview_rich_text)
		buff = var2
		var1 = var3
	end
	if self.result_entry ~= nil then
		local var4 = self.result_entry:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var3793 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var7, var3795 = protoModule.writeString(var7, var8, v)
			buff = var7
			var1 = var8
		end
	end
	if self.show_loading then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var9, var3797 = protoModule.writeVarInt(var9, var10, if self.show_loading then 1 else 0)
		buff = var9
		var1 = var10
	end
	if self.title ~= nil and self.title ~= "" then
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var3799 = protoModule.writeString(var11, var12, self.title)
		buff = var11
		var1 = var12
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var13, var3801 = protoModule.writeString(var13, var14, self.search_query)
		buff = var13
		var1 = var14
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var15, var16 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var15, var3803 = protoModule.writeString(var15, var16, self.universe_ids)
		buff = var15
		var1 = var16
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_95.decode(p1)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var1 = t_95.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 4 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.show_loading = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.overview_rich_text = buffer.tostring(var12)
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.result_entry = t.FeedEntry.decode(var14)
			elseif var7 == 3 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				table.insert(var1.follow_up_queries, buffer.tostring(var16))
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.title = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.search_query = buffer.tostring(var20)
			elseif var7 == 8 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.universe_ids = buffer.tostring(var22)
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var2)
				var2 = var25 + var24
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var2)
			local _ = var26
			var2 = var27
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var2)
			local _ = var28
			var2 = var29
		else
			error("Unsupported wire type: " .. var3807)
		end
	end
	return var1
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
	local var1 = t_95.new()
	
	if self.overview_rich_text ~= nil then
		var1.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var1.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var1.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var1.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var1.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var1.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var1.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var1.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.search_query ~= nil then
		var1.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var1.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var1.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var1.universe_ids = self.universeIds
	end
	return var1
end

t_95.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_95
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p1)
	-- upvalues: t_96 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		user_items = if p1 == nil or p1.user_items == nil then {} else p1.user_items,
		max_visible_rows = if p1 == nil or p1.max_visible_rows == nil then 0 else p1.max_visible_rows,
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id
	}, t_96)
end

function t_96:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3842 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var4 = v:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var3845 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var7, var3847 = protoModule.writeVarInt(var7, var8, self.max_visible_rows)
		buff = var7
		var1 = var8
	end
	if self.sort_id ~= nil then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var3849 = protoModule.writeString(var9, var10, self.sort_id)
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_96.decode(p1)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var1 = t_96.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.max_visible_rows = var8
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.title = buffer.tostring(var12)
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				table.insert(var1.user_items, t.UserListInputData_UserItem.decode(var14))
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.sort_id = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var3853)
		end
	end
	return var1
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
	local var1 = t_96.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var1.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var1.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var1.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	return var1
end

t_96.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_96
typeRegistryModule.default:register(t.UserListInputData)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p1)
	-- upvalues: t_97 (ref)
	return setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3882 = protoModule.writeString(var2, var3, self.user_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_97.decode(p1)
	-- upvalues: t_97 (ref), protoModule (ref)
	local var1 = t_97.new()
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
				var1.user_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var3886)
		end
	end
	return var1
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
	local var1 = t_97.new()
	
	if self.user_id ~= nil then
		var1.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1.user_id = self.userId
	end
	return var1
end

t_97.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_97
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p1)
	-- upvalues: t_98 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		max_visible_rows = if p1 == nil or p1.max_visible_rows == nil then 0 else p1.max_visible_rows,
		sort_id = if p1 == nil or p1.sort_id == nil then nil else p1.sort_id
	}, t_98)
end

function t_98:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3906 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4 = v:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var3909 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var7, var3911 = protoModule.writeVarInt(var7, var8, self.max_visible_rows)
		buff = var7
		var1 = var8
	end
	if self.sort_id ~= nil then
		local var9, var10 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var9, var3913 = protoModule.writeString(var9, var10, self.sort_id)
		buff = var9
		var1 = var10
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_98.decode(p1)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var1 = t_98.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.max_visible_rows = var8
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.title = buffer.tostring(var12)
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				table.insert(var1.items, t.CatalogItemListInputData_CatalogItem.decode(var14))
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.sort_id = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var3917)
		end
	end
	return var1
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
	local var1 = t_98.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var1.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var1.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	return var1
end

t_98.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_98
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p1)
	-- upvalues: t_99 (ref)
	return setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		item_type = if p1 == nil or p1.item_type == nil then "" else p1.item_type
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3945 = protoModule.writeString(var2, var3, self.item_id)
		buff = var2
		var1 = var3
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var3947 = protoModule.writeString(var4, var5, self.item_type)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_99.decode(p1)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var1 = t_99.new()
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
				var1.item_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.item_type = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var3951)
		end
	end
	return var1
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
	local var1 = t_99.new()
	
	if self.item_id ~= nil then
		var1.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var1.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1.item_type = self.itemType
	end
	return var1
end

t_99.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_99
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p1)
	-- upvalues: t_100 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, t_100)
end

function t_100:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3973 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_100.decode(p1)
	-- upvalues: t_100 (ref), protoModule (ref)
	local var1 = t_100.new()
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
				var1.universe_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var3977)
		end
	end
	return var1
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
	local var1 = t_100.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	return var1
end

t_100.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_100
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p1)
	-- upvalues: t_101 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle,
		moment_items = if p1 == nil or p1.moment_items == nil then {} else p1.moment_items
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var3997 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var3999 = protoModule.writeString(var4, var5, self.subtitle)
		buff = var4
		var1 = var5
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var6 = v:encode()
			local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var7, var4002 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
			buff = var7
			var1 = var8
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_101.decode(p1)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var1 = t_101.new()
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
				var1.title = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.subtitle = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				table.insert(var1.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var14))
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var4006)
		end
	end
	return var1
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
	local var1 = t_101.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.subtitle ~= nil then
		var1.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var1.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var1.moment_items = t_1
	end
	return var1
end

t_101.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_101
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p1)
	-- upvalues: t_102 (ref)
	return setmetatable({
		moment_id = if p1 == nil or p1.moment_id == nil then "" else p1.moment_id,
		video_asset_id = if p1 == nil or p1.video_asset_id == nil then "" else p1.video_asset_id,
		target_universe_id = if p1 == nil or p1.target_universe_id == nil then "" else p1.target_universe_id,
		target_place_id = if p1 == nil or p1.target_place_id == nil then "" else p1.target_place_id,
		feed_item_id = if p1 == nil or p1.feed_item_id == nil then "" else p1.feed_item_id,
		capture_universe_id = if p1 == nil or p1.capture_universe_id == nil then "" else p1.capture_universe_id
	}, t_102)
end

function t_102:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4033 = protoModule.writeString(var2, var3, self.moment_id)
		buff = var2
		var1 = var3
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4035 = protoModule.writeString(var4, var5, self.video_asset_id)
		buff = var4
		var1 = var5
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var4037 = protoModule.writeString(var6, var7, self.target_universe_id)
		buff = var6
		var1 = var7
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var4039 = protoModule.writeString(var8, var9, self.target_place_id)
		buff = var8
		var1 = var9
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var10, var4041 = protoModule.writeString(var10, var11, self.feed_item_id)
		buff = var10
		var1 = var11
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var4043 = protoModule.writeString(var12, var13, self.capture_universe_id)
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_102.decode(p1)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var1 = t_102.new()
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
				var1.moment_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.video_asset_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.target_universe_id = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.target_place_id = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.feed_item_id = buffer.tostring(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.capture_universe_id = buffer.tostring(var20)
			else
				local _ = nil
				local var22, var23 = protoModule.readVarInt(p1, var2)
				var2 = var23 + var22
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var24, var25 = protoModule.readFixed32(p1, var2)
			local _ = var24
			var2 = var25
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var26, var27 = protoModule.readFixed64(p1, var2)
			local _ = var26
			var2 = var27
		else
			error("Unsupported wire type: " .. var4047)
		end
	end
	return var1
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
	local var1 = t_102.new()
	
	if self.moment_id ~= nil then
		var1.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var1.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var1.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var1.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var1.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var1.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var1.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var1.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var1.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var1.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var1.capture_universe_id = self.captureUniverseId
	end
	return var1
end

t_102.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_102
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p1)
	-- upvalues: t_103 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then "" else p1.subtitle
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4077 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4079 = protoModule.writeString(var4, var5, self.subtitle)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_103.decode(p1)
	-- upvalues: t_103 (ref), protoModule (ref)
	local var1 = t_103.new()
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
				var1.title = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.subtitle = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var4083)
		end
	end
	return var1
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
	local var1 = t_103.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.subtitle ~= nil then
		var1.subtitle = self.subtitle
	end
	return var1
end

t_103.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_103
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p1)
	-- upvalues: t_104 (ref)
	return setmetatable({
		primary_cta_button_text = if p1 == nil or p1.primary_cta_button_text == nil then "" else p1.primary_cta_button_text,
		secondary_cta_button_text = if p1 == nil or p1.secondary_cta_button_text == nil then "" else p1.secondary_cta_button_text,
		primary_cta_type = if p1 == nil or p1.primary_cta_type == nil then "" else p1.primary_cta_type,
		secondary_cta_type = if p1 == nil or p1.secondary_cta_type == nil then "" else p1.secondary_cta_type
	}, t_104)
end

function t_104:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4105 = protoModule.writeString(var2, var3, self.primary_cta_button_text)
		buff = var2
		var1 = var3
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4107 = protoModule.writeString(var4, var5, self.secondary_cta_button_text)
		buff = var4
		var1 = var5
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var4109 = protoModule.writeString(var6, var7, self.primary_cta_type)
		buff = var6
		var1 = var7
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var4111 = protoModule.writeString(var8, var9, self.secondary_cta_type)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_104.decode(p1)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var1 = t_104.new()
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
				var1.primary_cta_button_text = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.secondary_cta_button_text = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.primary_cta_type = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.secondary_cta_type = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var4115)
		end
	end
	return var1
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
	local var1 = t_104.new()
	
	if self.primary_cta_button_text ~= nil then
		var1.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var1.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var1.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var1.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var1.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var1.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var1.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var1.secondary_cta_type = self.secondaryCtaType
	end
	return var1
end

t_104.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_104
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p1)
	-- upvalues: t_105 (ref)
	return setmetatable({
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then "" else p1.image_asset_id
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4141 = protoModule.writeString(var2, var3, self.image_asset_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_105.decode(p1)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var1 = t_105.new()
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
				var1.image_asset_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var4145)
		end
	end
	return var1
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
	local var1 = t_105.new()
	
	if self.image_asset_id ~= nil then
		var1.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1.image_asset_id = self.imageAssetId
	end
	return var1
end

t_105.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_105
typeRegistryModule.default:register(t.ImageInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p1)
	-- upvalues: t_106 (ref)
	return setmetatable({
		video_asset_id = if p1 == nil or p1.video_asset_id == nil then "" else p1.video_asset_id,
		loading_image_asset_id = if p1 == nil or p1.loading_image_asset_id == nil then "" else p1.loading_image_asset_id
	}, t_106)
end

function t_106:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4165 = protoModule.writeString(var2, var3, self.video_asset_id)
		buff = var2
		var1 = var3
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4167 = protoModule.writeString(var4, var5, self.loading_image_asset_id)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_106.decode(p1)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var1 = t_106.new()
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
				var1.video_asset_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.loading_image_asset_id = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var4171)
		end
	end
	return var1
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
	local var1 = t_106.new()
	
	if self.video_asset_id ~= nil then
		var1.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var1.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var1.loading_image_asset_id = self.loadingImageAssetId
	end
	return var1
end

t_106.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_106
typeRegistryModule.default:register(t.VideoInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p1)
	-- upvalues: t_107 (ref)
	return setmetatable({
		text = if p1 == nil or p1.text == nil then "" else p1.text,
		is_rendered_text = if p1 == nil or p1.is_rendered_text == nil then false else p1.is_rendered_text
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4193 = protoModule.writeString(var2, var3, self.text)
		buff = var2
		var1 = var3
	end
	if self.is_rendered_text then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var4195 = protoModule.writeVarInt(var4, var5, if self.is_rendered_text then 1 else 0)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_107.decode(p1)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var1 = t_107.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 2 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.is_rendered_text = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.text = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var4199)
		end
	end
	return var1
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
	local var1 = t_107.new()
	
	if self.text ~= nil then
		var1.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var1.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var1.is_rendered_text = self.isRenderedText
	end
	return var1
end

t_107.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_107
typeRegistryModule.default:register(t.TextInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p1)
	-- upvalues: t_108 (ref)
	return setmetatable({
		entry_map = if p1 == nil or p1.entry_map == nil then {} else p1.entry_map,
		entry_order = if p1 == nil or p1.entry_order == nil then {} else p1.entry_order,
		entry_order_map = if p1 == nil or p1.entry_order_map == nil then {} else p1.entry_order_map,
		content_pools = if p1 == nil or p1.content_pools == nil then {} else p1.content_pools
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var4221 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var4223 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var4223 = protoModule.writeBuffer(var3, var4223, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var4223
			local var7, var8 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var7, var4227 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var9, var10 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var9, var4229 = protoModule.writeString(var9, var10, v)
			buff = var9
			var1 = var10
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var11, var12 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var11, var4231 = protoModule.writeString(var11, var12, i)
			local var13 = v:encode()
			var12, var4233 = protoModule.writeTag(var11, var12, 2, protoModule.wireTypes.lengthDelimited)
			var12, var4233 = protoModule.writeBuffer(var12, var4233, var13, buffer.len(var13))
			local var14 = var12
			local var15 = var4233
			local var16, var17 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var16, var4237 = protoModule.writeBuffer(var16, var17, var14, var15)
			buff = var16
			var1 = var17
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var18, var19 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var18, var4239 = protoModule.writeString(var18, var19, i)
			local var20 = v:encode()
			var19, var4241 = protoModule.writeTag(var18, var19, 2, protoModule.wireTypes.lengthDelimited)
			var19, var4241 = protoModule.writeBuffer(var19, var4241, var20, buffer.len(var20))
			local var21 = var19
			local var22 = var4241
			local var23, var24 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var23, var4245 = protoModule.writeBuffer(var23, var24, var21, var22)
			buff = var23
			var1 = var24
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_108.decode(p1)
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var1 = t_108.new()
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
				var10 = t.VerticalFeedInputData_EntryMapEntry.decode(var10)
				var1.entry_map[var10.key or ""] = var10.value or t.FeedEntry.new()
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.entry_order, buffer.tostring(var12))
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var14 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var14)
				var1.entry_order_map[var14.key or ""] = var14.value or t.EntryOrder.new()
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var16 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var16)
				var1.content_pools[var16.key or ""] = var16.value or t.ContentPool.new()
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var4249)
		end
	end
	return var1
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
	local var1 = t_108.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var1.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var1.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var1.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var1.content_pools = t_1
	end
	return var1
end

t_108.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_108
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p1)
	-- upvalues: t_109 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4287 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4290 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_109.decode(p1)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var1 = t_109.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.FeedEntry.decode(var12)
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
			error("Unsupported wire type: " .. var4294)
		end
	end
	return var1
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
	local var1 = t_109.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1
end

t_109.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_109
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p1)
	-- upvalues: t_110 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_110)
end

function t_110:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4316 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4319 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_110.decode(p1)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var1 = t_110.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.EntryOrder.decode(var12)
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
			error("Unsupported wire type: " .. var4323)
		end
	end
	return var1
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
	local var1 = t_110.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var1
end

t_110.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_110
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p1)
	-- upvalues: t_111 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4345 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4348 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_111.decode(p1)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var1 = t_111.new()
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
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.ContentPool.decode(var12)
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
			error("Unsupported wire type: " .. var4352)
		end
	end
	return var1
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
	local var1 = t_111.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.ContentPool.jsonDecode(self.value)
	end
	return var1
end

t_111.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_111
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p1)
	-- upvalues: t_112 (ref)
	return setmetatable({
		foreground_header_entry = if p1 == nil or p1.foreground_header_entry == nil then nil else p1.foreground_header_entry,
		background_header_entry = if p1 == nil or p1.background_header_entry == nil then nil else p1.background_header_entry,
		layout_variant = if p1 == nil or p1.layout_variant == nil then "" else p1.layout_variant
	}, t_112)
end

function t_112:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.foreground_header_entry ~= nil then
		local var2 = self.foreground_header_entry:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4375 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.background_header_entry ~= nil then
		local var5 = self.background_header_entry:encode()
		local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var6, var4378 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
		buff = var6
		var1 = var7
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var8, var4380 = protoModule.writeString(var8, var9, self.layout_variant)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_112.decode(p1)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var1 = t_112.new()
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
				var1.foreground_header_entry = t.ForegroundHeaderEntry.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.background_header_entry = t.BackgroundHeaderEntry.decode(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.layout_variant = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var4384)
		end
	end
	return var1
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
	local var1 = t_112.new()
	
	if self.foreground_header_entry ~= nil then
		var1.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var1.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var1.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var1.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var1.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var1.layout_variant = self.layoutVariant
	end
	return var1
end

t_112.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_112
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p1)
	-- upvalues: t_113 (ref)
	return setmetatable({
		cta_button_text = if p1 == nil or p1.cta_button_text == nil then "" else p1.cta_button_text,
		cta_type = if p1 == nil or p1.cta_type == nil then "" else p1.cta_type
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4408 = protoModule.writeString(var2, var3, self.cta_button_text)
		buff = var2
		var1 = var3
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4410 = protoModule.writeString(var4, var5, self.cta_type)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_113.decode(p1)
	-- upvalues: t_113 (ref), protoModule (ref)
	local var1 = t_113.new()
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
				var1.cta_button_text = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.cta_type = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var4414)
		end
	end
	return var1
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
	local var1 = t_113.new()
	
	if self.cta_button_text ~= nil then
		var1.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var1.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var1.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var1.cta_type = self.ctaType
	end
	return var1
end

t_113.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_113
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p1)
	-- upvalues: t_114 (ref)
	return setmetatable({
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		cta_button_text = if p1 == nil or p1.cta_button_text == nil then "" else p1.cta_button_text,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then "" else p1.image_asset_id,
		cta_type = if p1 == nil or p1.cta_type == nil then "" else p1.cta_type
	}, t_114)
end

function t_114:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4436 = protoModule.writeString(var2, var3, self.title)
		buff = var2
		var1 = var3
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4438 = protoModule.writeString(var4, var5, self.cta_button_text)
		buff = var4
		var1 = var5
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var4440 = protoModule.writeString(var6, var7, self.image_asset_id)
		buff = var6
		var1 = var7
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var4442 = protoModule.writeString(var8, var9, self.cta_type)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_114.decode(p1)
	-- upvalues: t_114 (ref), protoModule (ref)
	local var1 = t_114.new()
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
				var1.title = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.cta_button_text = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.image_asset_id = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.cta_type = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var4446)
		end
	end
	return var1
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
	local var1 = t_114.new()
	
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.cta_button_text ~= nil then
		var1.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var1.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var1.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var1.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var1.cta_type = self.ctaType
	end
	return var1
end

t_114.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_114
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p1)
	-- upvalues: t_115 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then nil else p1.universe_id,
		title = if p1 == nil or p1.title == nil then nil else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then nil else p1.subtitle,
		badge_text = if p1 == nil or p1.badge_text == nil then nil else p1.badge_text,
		foreground = if p1 == nil or p1.foreground == nil then nil else p1.foreground,
		background = if p1 == nil or p1.background == nil then nil else p1.background,
		title_image = if p1 == nil or p1.title_image == nil then nil else p1.title_image,
		asset_title = if p1 == nil or p1.asset_title == nil then nil else p1.asset_title,
		asset_subtitle = if p1 == nil or p1.asset_subtitle == nil then nil else p1.asset_subtitle,
		gradient = if p1 == nil or p1.gradient == nil then nil else p1.gradient,
		playable_text = if p1 == nil or p1.playable_text == nil then nil else p1.playable_text
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4472 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.title ~= nil then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4474 = protoModule.writeString(var4, var5, self.title)
		buff = var4
		var1 = var5
	end
	if self.subtitle ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var4476 = protoModule.writeString(var6, var7, self.subtitle)
		buff = var6
		var1 = var7
	end
	if self.badge_text ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var4478 = protoModule.writeString(var8, var9, self.badge_text)
		buff = var8
		var1 = var9
	end
	if self.foreground ~= nil then
		local var10 = self.foreground:encode()
		local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var11, var4481 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
		buff = var11
		var1 = var12
	end
	if self.background ~= nil then
		local var13 = self.background:encode()
		local var14, var15 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var14, var4484 = protoModule.writeBuffer(var14, var15, var13, buffer.len(var13))
		buff = var14
		var1 = var15
	end
	if self.title_image ~= nil then
		local var16 = self.title_image:encode()
		local var17, var18 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var17, var4487 = protoModule.writeBuffer(var17, var18, var16, buffer.len(var16))
		buff = var17
		var1 = var18
	end
	if self.asset_title ~= nil then
		local var19, var20 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var19, var4489 = protoModule.writeString(var19, var20, self.asset_title)
		buff = var19
		var1 = var20
	end
	if self.asset_subtitle ~= nil then
		local var21, var22 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var21, var4491 = protoModule.writeString(var21, var22, self.asset_subtitle)
		buff = var21
		var1 = var22
	end
	if self.gradient ~= nil then
		local var23 = self.gradient:encode()
		local var24, var25 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
		var24, var4494 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
		buff = var24
		var1 = var25
	end
	if self.playable_text ~= nil then
		local var26, var27 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
		var26, var4496 = protoModule.writeString(var26, var27, self.playable_text)
		buff = var26
		var1 = var27
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_115.decode(p1)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var1 = t_115.new()
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
				var1.universe_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.title = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.subtitle = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.badge_text = buffer.tostring(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.foreground = t.HeroUnitInputData_VisualAsset.decode(var18)
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.background = t.HeroUnitInputData_VisualAsset.decode(var20)
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.title_image = t.HeroUnitInputData_VisualAsset.decode(var22)
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.asset_title = buffer.tostring(var24)
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.asset_subtitle = buffer.tostring(var26)
			elseif var7 == 10 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.gradient = t.HeroUnitInputData_Gradient.decode(var28)
			elseif var7 == 11 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.playable_text = buffer.tostring(var30)
			else
				local _ = nil
				local var32, var33 = protoModule.readVarInt(p1, var2)
				var2 = var33 + var32
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var34, var35 = protoModule.readFixed32(p1, var2)
			local _ = var34
			var2 = var35
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var36, var37 = protoModule.readFixed64(p1, var2)
			local _ = var36
			var2 = var37
		else
			error("Unsupported wire type: " .. var4500)
		end
	end
	return var1
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
	local var1 = t_115.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.subtitle ~= nil then
		var1.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var1.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var1.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var1.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var1.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var1.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var1.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var1.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var1.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var1.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var1.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var1.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var1.playable_text = self.playableText
	end
	return var1
end

t_115.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_115
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p1)
	-- upvalues: t_116 (ref)
	return setmetatable({
		asset_id = if p1 == nil or p1.asset_id == nil then "" else p1.asset_id,
		aspect_ratio = if p1 == nil or p1.aspect_ratio == nil then nil else p1.aspect_ratio,
		enable_animation = if p1 == nil or p1.enable_animation == nil then nil else p1.enable_animation
	}, t_116)
end

function t_116:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4540 = protoModule.writeString(var2, var3, self.asset_id)
		buff = var2
		var1 = var3
	end
	if self.aspect_ratio ~= nil then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.i64)
		var4, var4542 = protoModule.writeDouble(var4, var5, self.aspect_ratio)
		buff = var4
		var1 = var5
	end
	if self.enable_animation ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var4544 = protoModule.writeVarInt(var6, var7, if self.enable_animation then 1 else 0)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_116.decode(p1)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var1 = t_116.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.enable_animation = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.asset_id = buffer.tostring(var12)
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
		elseif var3 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4548)
		elseif var7 == 2 then
			local _ = nil
			local var18, var19 = protoModule.readDouble(p1, var2)
			var2 = var19
			var1.aspect_ratio = var18
		else
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		end
	end
	return var1
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
	local var1 = t_116.new()
	
	if self.asset_id ~= nil then
		var1.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var1.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var1.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var1.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var1.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var1.enable_animation = self.enableAnimation
	end
	return var1
end

t_116.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_116
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p1)
	-- upvalues: t_117 (ref)
	return setmetatable({
		start_color = if p1 == nil or p1.start_color == nil then nil else p1.start_color,
		end_color = if p1 == nil or p1.end_color == nil then nil else p1.end_color,
		start_opacity = if p1 == nil or p1.start_opacity == nil then nil else p1.start_opacity,
		end_opacity = if p1 == nil or p1.end_opacity == nil then nil else p1.end_opacity,
		degree = if p1 == nil or p1.degree == nil then nil else p1.degree
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.start_color ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4572 = protoModule.writeString(var2, var3, self.start_color)
		buff = var2
		var1 = var3
	end
	if self.end_color ~= nil then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4574 = protoModule.writeString(var4, var5, self.end_color)
		buff = var4
		var1 = var5
	end
	if self.start_opacity ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.i64)
		var6, var4576 = protoModule.writeDouble(var6, var7, self.start_opacity)
		buff = var6
		var1 = var7
	end
	if self.end_opacity ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.i64)
		var8, var4578 = protoModule.writeDouble(var8, var9, self.end_opacity)
		buff = var8
		var1 = var9
	end
	if self.degree ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.i64)
		var10, var4580 = protoModule.writeDouble(var10, var11, self.degree)
		buff = var10
		var1 = var11
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_117.decode(p1)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var1 = t_117.new()
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
				var1.start_color = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.end_color = buffer.tostring(var12)
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
		elseif var3 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4584)
		elseif var7 == 3 then
			local _ = nil
			local var18, var19 = protoModule.readDouble(p1, var2)
			var2 = var19
			var1.start_opacity = var18
		elseif var7 == 4 then
			local _ = nil
			local var20, var21 = protoModule.readDouble(p1, var2)
			var2 = var21
			var1.end_opacity = var20
		elseif var7 == 5 then
			local _ = nil
			local var22, var23 = protoModule.readDouble(p1, var2)
			var2 = var23
			var1.degree = var22
		else
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		end
	end
	return var1
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
	local var1 = t_117.new()
	
	if self.start_color ~= nil then
		var1.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var1.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var1.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var1.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var1.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var1.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var1.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var1.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var1.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var1
end

t_117.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_117
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p1)
	-- upvalues: t_118 (ref)
	return setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		recommendation_request_id = if p1 == nil or p1.recommendation_request_id == nil then "" else p1.recommendation_request_id
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var4613 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4615 = protoModule.writeString(var5, var6, self.sort_id)
		buff = var5
		var1 = var6
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var7, var4617 = protoModule.writeString(var7, var8, self.recommendation_request_id)
		buff = var7
		var1 = var8
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_118.decode(p1)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var1 = t_118.new()
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
				table.insert(var1.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var10))
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.sort_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.recommendation_request_id = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var4621)
		end
	end
	return var1
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
	local var1 = t_118.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var1.items = t_1
	end
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var1.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var1.recommendation_request_id = self.recommendationRequestId
	end
	return var1
end

t_118.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_118
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p1)
	-- upvalues: t_119 (ref)
	return setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then "" else p1.user_id
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4647 = protoModule.writeString(var2, var3, self.user_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_119.decode(p1)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var1 = t_119.new()
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
				var1.user_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var4651)
		end
	end
	return var1
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
	local var1 = t_119.new()
	
	if self.user_id ~= nil then
		var1.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1.user_id = self.userId
	end
	return var1
end

t_119.descriptor = {
	name = "FriendRecommendationCarouselInputData_UserRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserRecommendation"
}
t.FriendRecommendationCarouselInputData_UserRecommendation = t_119
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_UserRecommendation)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p1)
	-- upvalues: t_120 (ref)
	return setmetatable({
		contact_id = if p1 == nil or p1.contact_id == nil then "" else p1.contact_id
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4671 = protoModule.writeString(var2, var3, self.contact_id)
		buff = var2
		var1 = var3
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_120.decode(p1)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var1 = t_120.new()
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
				var1.contact_id = buffer.tostring(var10)
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var4675)
		end
	end
	return var1
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
	local var1 = t_120.new()
	
	if self.contact_id ~= nil then
		var1.contact_id = self.contact_id
	end
	if self.contactId ~= nil then
		var1.contact_id = self.contactId
	end
	return var1
end

t_120.descriptor = {
	name = "FriendRecommendationCarouselInputData_ContactRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContactRecommendation"
}
t.FriendRecommendationCarouselInputData_ContactRecommendation = t_120
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_ContactRecommendation)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p1)
	-- upvalues: t_121 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind,
		has_pending_friend_request = if p1 == nil or p1.has_pending_friend_request == nil then false else p1.has_pending_friend_request
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "user" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var4696 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "contact" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var4699 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		end
	end
	if self.has_pending_friend_request then
		local var8, var9 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var8, var4701 = protoModule.writeVarInt(var8, var9, if self.has_pending_friend_request then 1 else 0)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_121.decode(p1)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var1 = t_121.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.has_pending_friend_request = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = {
					type = "user",
					value = t.FriendRecommendationCarouselInputData_UserRecommendation.decode(var12)
				}
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.kind = {
					type = "contact",
					value = t.FriendRecommendationCarouselInputData_ContactRecommendation.decode(var14)
				}
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var4705)
		end
	end
	return var1
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
	local var1 = t_121.new()
	
	if self.user ~= nil then
		var1.kind = {
			type = "user",
			value = t.FriendRecommendationCarouselInputData_UserRecommendation.jsonDecode(self.user)
		}
	end
	if self.contact ~= nil then
		var1.kind = {
			type = "contact",
			value = t.FriendRecommendationCarouselInputData_ContactRecommendation.jsonDecode(self.contact)
		}
	end
	if self.has_pending_friend_request ~= nil then
		var1.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var1.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var1
end

t_121.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_121
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p1)
	-- upvalues: t_122 (ref)
	return setmetatable({
		selected_option = if p1 == nil or p1.selected_option == nil then "" else p1.selected_option,
		sort_id = if p1 == nil or p1.sort_id == nil then "" else p1.sort_id,
		options = if p1 == nil or p1.options == nil then {} else p1.options,
		experience_carousel = if p1 == nil or p1.experience_carousel == nil then nil else p1.experience_carousel,
		feed_item_key = if p1 == nil or p1.feed_item_key == nil then "" else p1.feed_item_key
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4729 = protoModule.writeString(var2, var3, self.selected_option)
		buff = var2
		var1 = var3
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4731 = protoModule.writeString(var4, var5, self.sort_id)
		buff = var4
		var1 = var5
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var6 = v:encode()
			local var7, var8 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var7, var4734 = protoModule.writeBuffer(var7, var8, var6, buffer.len(var6))
			buff = var7
			var1 = var8
		end
	end
	if self.experience_carousel ~= nil then
		local var9 = self.experience_carousel:encode()
		local var10, var11 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var10, var4737 = protoModule.writeBuffer(var10, var11, var9, buffer.len(var9))
		buff = var10
		var1 = var11
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
		var12, var4739 = protoModule.writeString(var12, var13, self.feed_item_key)
		buff = var12
		var1 = var13
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_122.decode(p1)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var1 = t_122.new()
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
				var1.selected_option = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.sort_id = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				table.insert(var1.options, t.SelectorOption.decode(var14))
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.experience_carousel = t.ExperienceCarouselInputData.decode(var16)
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.feed_item_key = buffer.tostring(var18)
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var2)
				var2 = var21 + var20
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var2)
			local _ = var22
			var2 = var23
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var2)
			local _ = var24
			var2 = var25
		else
			error("Unsupported wire type: " .. var4743)
		end
	end
	return var1
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
	local var1 = t_122.new()
	
	if self.selected_option ~= nil then
		var1.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var1.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var1.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var1.options = t_1
	end
	if self.experience_carousel ~= nil then
		var1.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var1.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var1.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var1.feed_item_key = self.feedItemKey
	end
	return var1
end

t_122.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_122
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p1)
	-- upvalues: t_123 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		display_name = if p1 == nil or p1.display_name == nil then "" else p1.display_name,
		is_selected = if p1 == nil or p1.is_selected == nil then false else p1.is_selected
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4773 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4775 = protoModule.writeString(var4, var5, self.display_name)
		buff = var4
		var1 = var5
	end
	if self.is_selected then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var4777 = protoModule.writeVarInt(var6, var7, if self.is_selected then 1 else 0)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_123.decode(p1)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var1 = t_123.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 3 then
				local _ = nil
				local var8, var9 = protoModule.readVarInt(p1, var2)
				var2 = var9
				var1.is_selected = var8 ~= 0
			else
				local _ = nil
				local var10, var11 = protoModule.readVarInt(p1, var2)
				local _ = var10
				var2 = var11
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.id = buffer.tostring(var12)
			elseif var7 == 2 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.display_name = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var4781)
		end
	end
	return var1
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
	local var1 = t_123.new()
	
	if self.id ~= nil then
		var1.id = self.id
	end
	if self.display_name ~= nil then
		var1.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var1.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var1.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var1.is_selected = self.isSelected
	end
	return var1
end

t_123.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_123
typeRegistryModule.default:register(t.SelectorOption)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p1)
	-- upvalues: t_124 (ref)
	return setmetatable({
		cards = if p1 == nil or p1.cards == nil then {} else p1.cards,
		title = if p1 == nil or p1.title == nil then "" else p1.title
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var4806 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var4808 = protoModule.writeString(var5, var6, self.title)
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_124.decode(p1)
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var1 = t_124.new()
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
				table.insert(var1.cards, t.GameItemsCardInputData.decode(var10))
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.title = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var4812)
		end
	end
	return var1
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
	local var1 = t_124.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var1.cards = t_1
	end
	if self.title ~= nil then
		var1.title = self.title
	end
	return var1
end

t_124.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_124
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p1)
	-- upvalues: t_125 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		items = if p1 == nil or p1.items == nil then {} else p1.items
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4836 = protoModule.writeString(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4 = v:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var5, var4839 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_125.decode(p1)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var1 = t_125.new()
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
				var1.universe_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				table.insert(var1.items, t.GameItemInputData.decode(var12))
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
			error("Unsupported wire type: " .. var4843)
		end
	end
	return var1
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
	local var1 = t_125.new()
	
	if self.universe_id ~= nil then
		var1.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var1.items = t_1
	end
	return var1
end

t_125.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_125
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p1)
	-- upvalues: t_126 (ref)
	return setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		item_type = if p1 == nil or p1.item_type == nil then "" else p1.item_type
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4867 = protoModule.writeString(var2, var3, self.item_id)
		buff = var2
		var1 = var3
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4869 = protoModule.writeString(var4, var5, self.item_type)
		buff = var4
		var1 = var5
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_126.decode(p1)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var1 = t_126.new()
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
				var1.item_id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.item_type = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var4873)
		end
	end
	return var1
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
	local var1 = t_126.new()
	
	if self.item_id ~= nil then
		var1.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var1.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var1.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var1.item_type = self.itemType
	end
	return var1
end

t_126.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_126
typeRegistryModule.default:register(t.GameItemInputData)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p1)
	-- upvalues: t_127 (ref)
	return setmetatable({
		clickout_url = if p1 == nil or p1.clickout_url == nil then "" else p1.clickout_url,
		native_ad_data = if p1 == nil or p1.native_ad_data == nil then "" else p1.native_ad_data,
		payer_name = if p1 == nil or p1.payer_name == nil then nil else p1.payer_name,
		logo_asset_id = if p1 == nil or p1.logo_asset_id == nil then nil else p1.logo_asset_id,
		logo_aspect_ratio = if p1 == nil or p1.logo_aspect_ratio == nil then nil else p1.logo_aspect_ratio,
		cta_text = if p1 == nil or p1.cta_text == nil then nil else p1.cta_text,
		title = if p1 == nil or p1.title == nil then nil else p1.title,
		subtitle = if p1 == nil or p1.subtitle == nil then nil else p1.subtitle,
		image_asset_id = if p1 == nil or p1.image_asset_id == nil then nil else p1.image_asset_id,
		video_asset_id = if p1 == nil or p1.video_asset_id == nil then nil else p1.video_asset_id,
		badge_text = if p1 == nil or p1.badge_text == nil then nil else p1.badge_text,
		badge_analytics_id = if p1 == nil or p1.badge_analytics_id == nil then nil else p1.badge_analytics_id,
		roblox_component = if p1 == nil or p1.roblox_component == nil then nil else p1.roblox_component
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var4895 = protoModule.writeString(var2, var3, self.clickout_url)
		buff = var2
		var1 = var3
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var4897 = protoModule.writeString(var4, var5, self.native_ad_data)
		buff = var4
		var1 = var5
	end
	if self.payer_name ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var4899 = protoModule.writeString(var6, var7, self.payer_name)
		buff = var6
		var1 = var7
	end
	if self.logo_asset_id ~= nil then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var4901 = protoModule.writeString(var8, var9, self.logo_asset_id)
		buff = var8
		var1 = var9
	end
	if self.logo_aspect_ratio ~= nil then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.i64)
		var10, var4903 = protoModule.writeDouble(var10, var11, self.logo_aspect_ratio)
		buff = var10
		var1 = var11
	end
	if self.cta_text ~= nil then
		local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var12, var4905 = protoModule.writeString(var12, var13, self.cta_text)
		buff = var12
		var1 = var13
	end
	if self.title ~= nil then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var4907 = protoModule.writeString(var14, var15, self.title)
		buff = var14
		var1 = var15
	end
	if self.subtitle ~= nil then
		local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
		var16, var4909 = protoModule.writeString(var16, var17, self.subtitle)
		buff = var16
		var1 = var17
	end
	if self.image_asset_id ~= nil then
		local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
		var18, var4911 = protoModule.writeString(var18, var19, self.image_asset_id)
		buff = var18
		var1 = var19
	end
	if self.video_asset_id ~= nil then
		local var20, var21 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
		var20, var4913 = protoModule.writeString(var20, var21, self.video_asset_id)
		buff = var20
		var1 = var21
	end
	if self.badge_text ~= nil then
		local var22, var23 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
		var22, var4915 = protoModule.writeString(var22, var23, self.badge_text)
		buff = var22
		var1 = var23
	end
	if self.badge_analytics_id ~= nil then
		local var24, var25 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
		var24, var4917 = protoModule.writeString(var24, var25, self.badge_analytics_id)
		buff = var24
		var1 = var25
	end
	if self.roblox_component ~= nil then
		local var26, var27 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
		var26, var4919 = protoModule.writeString(var26, var27, self.roblox_component)
		buff = var26
		var1 = var27
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_127.decode(p1)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var1 = t_127.new()
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
				var1.clickout_url = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.native_ad_data = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.payer_name = buffer.tostring(var14)
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.logo_asset_id = buffer.tostring(var16)
			elseif var7 == 6 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.cta_text = buffer.tostring(var18)
			elseif var7 == 7 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.title = buffer.tostring(var20)
			elseif var7 == 8 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.subtitle = buffer.tostring(var22)
			elseif var7 == 9 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.image_asset_id = buffer.tostring(var24)
			elseif var7 == 10 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.video_asset_id = buffer.tostring(var26)
			elseif var7 == 11 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.badge_text = buffer.tostring(var28)
			elseif var7 == 12 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.badge_analytics_id = buffer.tostring(var30)
			elseif var7 == 13 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var2)
				var2 = var33
				var1.roblox_component = buffer.tostring(var32)
			else
				local _ = nil
				local var34, var35 = protoModule.readVarInt(p1, var2)
				var2 = var35 + var34
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var36, var37 = protoModule.readFixed32(p1, var2)
			local _ = var36
			var2 = var37
		elseif var3 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4923)
		elseif var7 == 5 then
			local _ = nil
			local var38, var39 = protoModule.readDouble(p1, var2)
			var2 = var39
			var1.logo_aspect_ratio = var38
		else
			local _ = nil
			local var40, var41 = protoModule.readFixed64(p1, var2)
			local _ = var40
			var2 = var41
		end
	end
	return var1
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
	local var1 = t_127.new()
	
	if self.clickout_url ~= nil then
		var1.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var1.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var1.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var1.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var1.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var1.title = self.title
	end
	if self.subtitle ~= nil then
		var1.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var1.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var1.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1.roblox_component = self.robloxComponent
	end
	return var1
end

t_127.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = t_127
typeRegistryModule.default:register(t.AdLinkItem)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p1)
	-- upvalues: t_128 (ref)
	return setmetatable({
		layout = if p1 == nil or p1.layout == nil then nil else p1.layout,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.layout ~= nil then
		local var2 = self.layout:encode()
		local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var3, var4968 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
		buff = var3
		var1 = var4
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var4971 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		elseif self.kind.type == "ad_link" then
			local var8 = self.kind.value:encode()
			local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var9, var4974 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
			buff = var9
			var1 = var10
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_128.decode(p1)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var1 = t_128.new()
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
				var1.layout = t.ItemLayout.decode(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var12)
				}
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.kind = { type = "ad_link", value = t.AdLinkItem.decode(var14) }
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var4978)
		end
	end
	return var1
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
	local var1 = t_128.new()
	
	if self.layout ~= nil then
		var1.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var1.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var1.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var1.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var1
end

t_128.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_128
typeRegistryModule.default:register(t.ItemWithLayout)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p1)
	-- upvalues: t_129 (ref)
	return setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items,
		collection_item_size = if p1 == nil or p1.collection_item_size == nil then nil else p1.collection_item_size
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var5003 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	if self.collection_item_size ~= nil then
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var5005 = protoModule.writeString(var5, var6, self.collection_item_size)
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_129.decode(p1)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var1 = t_129.new()
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
				table.insert(var1.items, t.ItemWithLayout.decode(var10))
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.collection_item_size = buffer.tostring(var12)
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
			error("Unsupported wire type: " .. var5009)
		end
	end
	return var1
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
	local var1 = t_129.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var1.items = t_1
	end
	if self.collection_item_size ~= nil then
		var1.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var1.collection_item_size = self.collectionItemSize
	end
	return var1
end

t_129.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_129
typeRegistryModule.default:register(t.ContentPool)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p1)
	-- upvalues: t_130 (ref)
	return setmetatable({
		col_span = if p1 == nil or p1.col_span == nil then 0 else p1.col_span,
		row_span = if p1 == nil or p1.row_span == nil then 0 else p1.row_span,
		alignment_type = if p1 == nil or p1.alignment_type == nil then "" else p1.alignment_type,
		min_row_padding = if p1 == nil or p1.min_row_padding == nil then 0 else p1.min_row_padding
	}, t_130)
end

function t_130:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var5033 = protoModule.writeVarInt(var2, var3, self.col_span)
		buff = var2
		var1 = var3
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var5035 = protoModule.writeVarInt(var4, var5, self.row_span)
		buff = var4
		var1 = var5
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var5037 = protoModule.writeString(var6, var7, self.alignment_type)
		buff = var6
		var1 = var7
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
		var8, var5039 = protoModule.writeVarInt(var8, var9, self.min_row_padding)
		buff = var8
		var1 = var9
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_130.decode(p1)
	-- upvalues: t_130 (ref), protoModule (ref)
	local var1 = t_130.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				var2 = var9
				var1.col_span = var8
			elseif var7 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI32(p1, var2)
				var2 = var11
				var1.row_span = var10
			elseif var7 == 4 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI32(p1, var2)
				var2 = var13
				var1.min_row_padding = var12
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				local _ = var14
				var2 = var15
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 3 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.alignment_type = buffer.tostring(var16)
			else
				local _ = nil
				local var18, var19 = protoModule.readVarInt(p1, var2)
				var2 = var19 + var18
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var20, var21 = protoModule.readFixed32(p1, var2)
			local _ = var20
			var2 = var21
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var22, var23 = protoModule.readFixed64(p1, var2)
			local _ = var22
			var2 = var23
		else
			error("Unsupported wire type: " .. var5043)
		end
	end
	return var1
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
	local var1 = t_130.new()
	
	if self.col_span ~= nil then
		var1.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var1.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var1.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var1.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var1.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var1.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var1.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var1.min_row_padding = self.minRowPadding
	end
	return var1
end

t_130.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_130
typeRegistryModule.default:register(t.ItemLayout)
t.PageEntryFormat = {
	fromNumber = function(p1)
		return if p1 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p1 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p1)
		return if p1 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p1 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p1
	end,
	fromName = function(p1)
		return if p1 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p1 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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