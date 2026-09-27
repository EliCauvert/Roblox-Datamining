local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local propTypesModule = require(script.Parent.prop_types)
local propTypesEngineModule = require(script.Parent.prop_types_engine)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		prop_builder = if p1 == nil or p1.prop_builder == nil then nil else p1.prop_builder,
		oneof_prop = if p1 == nil or p1.oneof_prop == nil then nil else p1.oneof_prop
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.prop_builder ~= nil then
		local var2, var3 = protoModule.writeTag(buff, var1, 1000, protoModule.wireTypes.lengthDelimited)
		var2, var9 = protoModule.writeString(var2, var3, self.prop_builder)
		buff = var2
		var1 = var3
	end
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			local var4 = self.oneof_prop.value:encode()
			local var5, var6 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var5, var12 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
			buff = var5
			var1 = var6
		elseif self.oneof_prop.type == "int32_prop" then
			local var7 = self.oneof_prop.value:encode()
			local var8, var9 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var8, var15 = protoModule.writeBuffer(var8, var9, var7, buffer.len(var7))
			buff = var8
			var1 = var9
		elseif self.oneof_prop.type == "int64_prop" then
			local var10 = self.oneof_prop.value:encode()
			local var11, var12 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var11, var18 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
			buff = var11
			var1 = var12
		elseif self.oneof_prop.type == "float_prop" then
			local var13 = self.oneof_prop.value:encode()
			local var14, var15 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var14, var21 = protoModule.writeBuffer(var14, var15, var13, buffer.len(var13))
			buff = var14
			var1 = var15
		elseif self.oneof_prop.type == "double_prop" then
			local var16 = self.oneof_prop.value:encode()
			local var17, var18 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var17, var24 = protoModule.writeBuffer(var17, var18, var16, buffer.len(var16))
			buff = var17
			var1 = var18
		elseif self.oneof_prop.type == "bool_prop" then
			local var19 = self.oneof_prop.value:encode()
			local var20, var21 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var20, var27 = protoModule.writeBuffer(var20, var21, var19, buffer.len(var19))
			buff = var20
			var1 = var21
		elseif self.oneof_prop.type == "struct_prop" then
			local var22 = self.oneof_prop.value:encode()
			local var23, var24 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var23, var30 = protoModule.writeBuffer(var23, var24, var22, buffer.len(var22))
			buff = var23
			var1 = var24
		elseif self.oneof_prop.type == "array_of_struct_prop" then
			local var25 = self.oneof_prop.value:encode()
			local var26, var27 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var26, var33 = protoModule.writeBuffer(var26, var27, var25, buffer.len(var25))
			buff = var26
			var1 = var27
		elseif self.oneof_prop.type == "string_array_prop" then
			local var28 = self.oneof_prop.value:encode()
			local var29, var30 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
			var29, var36 = protoModule.writeBuffer(var29, var30, var28, buffer.len(var28))
			buff = var29
			var1 = var30
		elseif self.oneof_prop.type == "image_string_prop" then
			local var31 = self.oneof_prop.value:encode()
			local var32, var33 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
			var32, var39 = protoModule.writeBuffer(var32, var33, var31, buffer.len(var31))
			buff = var32
			var1 = var33
		elseif self.oneof_prop.type == "image_set_prop" then
			local var34 = self.oneof_prop.value:encode()
			local var35, var36 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
			var35, var42 = protoModule.writeBuffer(var35, var36, var34, buffer.len(var34))
			buff = var35
			var1 = var36
		elseif self.oneof_prop.type == "icon_prop" then
			local var37 = self.oneof_prop.value:encode()
			local var38, var39 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
			var38, var45 = protoModule.writeBuffer(var38, var39, var37, buffer.len(var37))
			buff = var38
			var1 = var39
		elseif self.oneof_prop.type == "icon_size_prop" then
			local var40 = self.oneof_prop.value:encode()
			local var41, var42 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
			var41, var48 = protoModule.writeBuffer(var41, var42, var40, buffer.len(var40))
			buff = var41
			var1 = var42
		elseif self.oneof_prop.type == "foundation_icon_config_prop" then
			local var43 = self.oneof_prop.value:encode()
			local var44, var45 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
			var44, var51 = protoModule.writeBuffer(var44, var45, var43, buffer.len(var43))
			buff = var44
			var1 = var45
		elseif self.oneof_prop.type == "color_prop" then
			local var46 = self.oneof_prop.value:encode()
			local var47, var48 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
			var47, var54 = protoModule.writeBuffer(var47, var48, var46, buffer.len(var46))
			buff = var47
			var1 = var48
		elseif self.oneof_prop.type == "color_style_prop" then
			local var49 = self.oneof_prop.value:encode()
			local var50, var51 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
			var50, var57 = protoModule.writeBuffer(var50, var51, var49, buffer.len(var49))
			buff = var50
			var1 = var51
		elseif self.oneof_prop.type == "gradient_prop" then
			local var52 = self.oneof_prop.value:encode()
			local var53, var54 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
			var53, var60 = protoModule.writeBuffer(var53, var54, var52, buffer.len(var52))
			buff = var53
			var1 = var54
		elseif self.oneof_prop.type == "typography_prop" then
			local var55 = self.oneof_prop.value:encode()
			local var56, var57 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.lengthDelimited)
			var56, var63 = protoModule.writeBuffer(var56, var57, var55, buffer.len(var55))
			buff = var56
			var1 = var57
		elseif self.oneof_prop.type == "typography_font_prop" then
			local var58 = self.oneof_prop.value:encode()
			local var59, var60 = protoModule.writeTag(buff, var1, 19, protoModule.wireTypes.lengthDelimited)
			var59, var66 = protoModule.writeBuffer(var59, var60, var58, buffer.len(var58))
			buff = var59
			var1 = var60
		elseif self.oneof_prop.type == "udim_prop" then
			local var61 = self.oneof_prop.value:encode()
			local var62, var63 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
			var62, var69 = protoModule.writeBuffer(var62, var63, var61, buffer.len(var61))
			buff = var62
			var1 = var63
		elseif self.oneof_prop.type == "udim2_prop" then
			local var64 = self.oneof_prop.value:encode()
			local var65, var66 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.lengthDelimited)
			var65, var72 = protoModule.writeBuffer(var65, var66, var64, buffer.len(var64))
			buff = var65
			var1 = var66
		elseif self.oneof_prop.type == "vector2_prop" then
			local var67 = self.oneof_prop.value:encode()
			local var68, var69 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
			var68, var75 = protoModule.writeBuffer(var68, var69, var67, buffer.len(var67))
			buff = var68
			var1 = var69
		elseif self.oneof_prop.type == "ui_scaled_float_prop" then
			local var70 = self.oneof_prop.value:encode()
			local var71, var72 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
			var71, var78 = protoModule.writeBuffer(var71, var72, var70, buffer.len(var70))
			buff = var71
			var1 = var72
		elseif self.oneof_prop.type == "ui_scaled_udim_prop" then
			local var73 = self.oneof_prop.value:encode()
			local var74, var75 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.lengthDelimited)
			var74, var81 = protoModule.writeBuffer(var74, var75, var73, buffer.len(var73))
			buff = var74
			var1 = var75
		elseif self.oneof_prop.type == "ui_scaled_udim2_prop" then
			local var76 = self.oneof_prop.value:encode()
			local var77, var78 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
			var77, var84 = protoModule.writeBuffer(var77, var78, var76, buffer.len(var76))
			buff = var77
			var1 = var78
		elseif self.oneof_prop.type == "fill_behavior_prop" then
			local var79 = self.oneof_prop.value:encode()
			local var80, var81 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
			var80, var87 = protoModule.writeBuffer(var80, var81, var79, buffer.len(var79))
			buff = var80
			var1 = var81
		elseif self.oneof_prop.type == "input_size_prop" then
			local var82 = self.oneof_prop.value:encode()
			local var83, var84 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.lengthDelimited)
			var83, var90 = protoModule.writeBuffer(var83, var84, var82, buffer.len(var82))
			buff = var83
			var1 = var84
		elseif self.oneof_prop.type == "automatic_size_prop" then
			local var85 = self.oneof_prop.value:encode()
			local var86, var87 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
			var86, var93 = protoModule.writeBuffer(var86, var87, var85, buffer.len(var85))
			buff = var86
			var1 = var87
		elseif self.oneof_prop.type == "text_truncate_prop" then
			local var88 = self.oneof_prop.value:encode()
			local var89, var90 = protoModule.writeTag(buff, var1, 29, protoModule.wireTypes.lengthDelimited)
			var89, var96 = protoModule.writeBuffer(var89, var90, var88, buffer.len(var88))
			buff = var89
			var1 = var90
		elseif self.oneof_prop.type == "text_x_alignment_prop" then
			local var91 = self.oneof_prop.value:encode()
			local var92, var93 = protoModule.writeTag(buff, var1, 30, protoModule.wireTypes.lengthDelimited)
			var92, var99 = protoModule.writeBuffer(var92, var93, var91, buffer.len(var91))
			buff = var92
			var1 = var93
		elseif self.oneof_prop.type == "text_y_alignment_prop" then
			local var94 = self.oneof_prop.value:encode()
			local var95, var96 = protoModule.writeTag(buff, var1, 31, protoModule.wireTypes.lengthDelimited)
			var95, var102 = protoModule.writeBuffer(var95, var96, var94, buffer.len(var94))
			buff = var95
			var1 = var96
		elseif self.oneof_prop.type == "ui_flex_mode_prop" then
			local var97 = self.oneof_prop.value:encode()
			local var98, var99 = protoModule.writeTag(buff, var1, 32, protoModule.wireTypes.lengthDelimited)
			var98, var105 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var1 = var99
		elseif self.oneof_prop.type == "scale_type_prop" then
			local var100 = self.oneof_prop.value:encode()
			local var101, var102 = protoModule.writeTag(buff, var1, 33, protoModule.wireTypes.lengthDelimited)
			var101, var108 = protoModule.writeBuffer(var101, var102, var100, buffer.len(var100))
			buff = var101
			var1 = var102
		elseif self.oneof_prop.type == "resampler_mode_prop" then
			local var103 = self.oneof_prop.value:encode()
			local var104, var105 = protoModule.writeTag(buff, var1, 34, protoModule.wireTypes.lengthDelimited)
			var104, var111 = protoModule.writeBuffer(var104, var105, var103, buffer.len(var103))
			buff = var104
			var1 = var105
		elseif self.oneof_prop.type == "size_constraint_prop" then
			local var106 = self.oneof_prop.value:encode()
			local var107, var108 = protoModule.writeTag(buff, var1, 35, protoModule.wireTypes.lengthDelimited)
			var107, var114 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
			buff = var107
			var1 = var108
		elseif self.oneof_prop.type == "selection_behavior_prop" then
			local var109 = self.oneof_prop.value:encode()
			local var110, var111 = protoModule.writeTag(buff, var1, 36, protoModule.wireTypes.lengthDelimited)
			var110, var117 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
			buff = var110
			var1 = var111
		elseif self.oneof_prop.type == "key_code_prop" then
			local var112 = self.oneof_prop.value:encode()
			local var113, var114 = protoModule.writeTag(buff, var1, 37, protoModule.wireTypes.lengthDelimited)
			var113, var120 = protoModule.writeBuffer(var113, var114, var112, buffer.len(var112))
			buff = var113
			var1 = var114
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), propTypesModule (ref), propTypesEngineModule (ref)
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
				var1.oneof_prop = {
					type = "string_prop",
					value = propTypesModule.StringProp.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.oneof_prop = {
					type = "int32_prop",
					value = propTypesModule.Int32Prop.decode(var12)
				}
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.oneof_prop = {
					type = "int64_prop",
					value = propTypesModule.Int64Prop.decode(var14)
				}
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.oneof_prop = {
					type = "float_prop",
					value = propTypesModule.FloatProp.decode(var16)
				}
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.oneof_prop = {
					type = "double_prop",
					value = propTypesModule.DoubleProp.decode(var18)
				}
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.oneof_prop = {
					type = "bool_prop",
					value = propTypesModule.BoolProp.decode(var20)
				}
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.oneof_prop = {
					type = "struct_prop",
					value = propTypesModule.StructProp.decode(var22)
				}
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.oneof_prop = {
					type = "array_of_struct_prop",
					value = propTypesModule.ArrayOfStructProp.decode(var24)
				}
			elseif var7 == 9 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var2)
				var2 = var27
				var1.oneof_prop = {
					type = "string_array_prop",
					value = propTypesModule.StringArrayProp.decode(var26)
				}
			elseif var7 == 10 then
				local _ = nil
				local var28, var29 = protoModule.readBuffer(p1, var2)
				var2 = var29
				var1.oneof_prop = {
					type = "image_string_prop",
					value = propTypesModule.ImageStringProp.decode(var28)
				}
			elseif var7 == 11 then
				local _ = nil
				local var30, var31 = protoModule.readBuffer(p1, var2)
				var2 = var31
				var1.oneof_prop = {
					type = "image_set_prop",
					value = propTypesModule.ImageSetProp.decode(var30)
				}
			elseif var7 == 12 then
				local _ = nil
				local var32, var33 = protoModule.readBuffer(p1, var2)
				var2 = var33
				var1.oneof_prop = {
					type = "icon_prop",
					value = propTypesModule.IconProp.decode(var32)
				}
			elseif var7 == 13 then
				local _ = nil
				local var34, var35 = protoModule.readBuffer(p1, var2)
				var2 = var35
				var1.oneof_prop = {
					type = "icon_size_prop",
					value = propTypesModule.IconSizeProp.decode(var34)
				}
			elseif var7 == 14 then
				local _ = nil
				local var36, var37 = protoModule.readBuffer(p1, var2)
				var2 = var37
				var1.oneof_prop = {
					type = "foundation_icon_config_prop",
					value = propTypesModule.FoundationIconConfigProp.decode(var36)
				}
			elseif var7 == 15 then
				local _ = nil
				local var38, var39 = protoModule.readBuffer(p1, var2)
				var2 = var39
				var1.oneof_prop = {
					type = "color_prop",
					value = propTypesModule.ColorProp.decode(var38)
				}
			elseif var7 == 16 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p1, var2)
				var2 = var41
				var1.oneof_prop = {
					type = "color_style_prop",
					value = propTypesModule.ColorStyleProp.decode(var40)
				}
			elseif var7 == 17 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p1, var2)
				var2 = var43
				var1.oneof_prop = {
					type = "gradient_prop",
					value = propTypesModule.GradientProp.decode(var42)
				}
			elseif var7 == 18 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var2)
				var2 = var45
				var1.oneof_prop = {
					type = "typography_prop",
					value = propTypesModule.TypographyProp.decode(var44)
				}
			elseif var7 == 19 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var2)
				var2 = var47
				var1.oneof_prop = {
					type = "typography_font_prop",
					value = propTypesModule.TypographyFontProp.decode(var46)
				}
			elseif var7 == 20 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p1, var2)
				var2 = var49
				var1.oneof_prop = {
					type = "udim_prop",
					value = propTypesModule.UDimProp.decode(var48)
				}
			elseif var7 == 21 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p1, var2)
				var2 = var51
				var1.oneof_prop = {
					type = "udim2_prop",
					value = propTypesModule.UDim2Prop.decode(var50)
				}
			elseif var7 == 22 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p1, var2)
				var2 = var53
				var1.oneof_prop = {
					type = "vector2_prop",
					value = propTypesModule.Vector2Prop.decode(var52)
				}
			elseif var7 == 23 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p1, var2)
				var2 = var55
				var1.oneof_prop = {
					type = "ui_scaled_float_prop",
					value = propTypesModule.UiScaledFloatProp.decode(var54)
				}
			elseif var7 == 24 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p1, var2)
				var2 = var57
				var1.oneof_prop = {
					type = "ui_scaled_udim_prop",
					value = propTypesModule.UiScaledUDimProp.decode(var56)
				}
			elseif var7 == 25 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p1, var2)
				var2 = var59
				var1.oneof_prop = {
					type = "ui_scaled_udim2_prop",
					value = propTypesModule.UiScaledUDim2Prop.decode(var58)
				}
			elseif var7 == 26 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p1, var2)
				var2 = var61
				var1.oneof_prop = {
					type = "fill_behavior_prop",
					value = propTypesModule.FillBehaviorProp.decode(var60)
				}
			elseif var7 == 27 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var2)
				var2 = var63
				var1.oneof_prop = {
					type = "input_size_prop",
					value = propTypesModule.InputSizeProp.decode(var62)
				}
			elseif var7 == 28 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var2)
				var2 = var65
				var1.oneof_prop = {
					type = "automatic_size_prop",
					value = propTypesEngineModule.AutomaticSizeProp.decode(var64)
				}
			elseif var7 == 29 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p1, var2)
				var2 = var67
				var1.oneof_prop = {
					type = "text_truncate_prop",
					value = propTypesEngineModule.TextTruncateProp.decode(var66)
				}
			elseif var7 == 30 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p1, var2)
				var2 = var69
				var1.oneof_prop = {
					type = "text_x_alignment_prop",
					value = propTypesEngineModule.TextXAlignmentProp.decode(var68)
				}
			elseif var7 == 31 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p1, var2)
				var2 = var71
				var1.oneof_prop = {
					type = "text_y_alignment_prop",
					value = propTypesEngineModule.TextYAlignmentProp.decode(var70)
				}
			elseif var7 == 32 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p1, var2)
				var2 = var73
				var1.oneof_prop = {
					type = "ui_flex_mode_prop",
					value = propTypesEngineModule.UIFlexModeProp.decode(var72)
				}
			elseif var7 == 33 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p1, var2)
				var2 = var75
				var1.oneof_prop = {
					type = "scale_type_prop",
					value = propTypesEngineModule.ScaleTypeProp.decode(var74)
				}
			elseif var7 == 34 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p1, var2)
				var2 = var77
				var1.oneof_prop = {
					type = "resampler_mode_prop",
					value = propTypesEngineModule.ResamplerModeProp.decode(var76)
				}
			elseif var7 == 35 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p1, var2)
				var2 = var79
				var1.oneof_prop = {
					type = "size_constraint_prop",
					value = propTypesEngineModule.SizeConstraintProp.decode(var78)
				}
			elseif var7 == 36 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p1, var2)
				var2 = var81
				var1.oneof_prop = {
					type = "selection_behavior_prop",
					value = propTypesEngineModule.SelectionBehaviorProp.decode(var80)
				}
			elseif var7 == 37 then
				local _ = nil
				local var82, var83 = protoModule.readBuffer(p1, var2)
				var2 = var83
				var1.oneof_prop = {
					type = "key_code_prop",
					value = propTypesEngineModule.KeyCodeProp.decode(var82)
				}
			elseif var7 == 1000 then
				local _ = nil
				local var84, var85 = protoModule.readBuffer(p1, var2)
				var2 = var85
				var1.prop_builder = buffer.tostring(var84)
			else
				local _ = nil
				local var86, var87 = protoModule.readVarInt(p1, var2)
				var2 = var87 + var86
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var88, var89 = protoModule.readFixed32(p1, var2)
			local _ = var88
			var2 = var89
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var90, var91 = protoModule.readFixed64(p1, var2)
			local _ = var90
			var2 = var91
		else
			error("Unsupported wire type: " .. var124)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.prop_builder ~= nil then
		t.propBuilder = self.prop_builder
	end
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			t.stringProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "int32_prop" then
			t.int32Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "int64_prop" then
			t.int64Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "float_prop" then
			t.floatProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "double_prop" then
			t.doubleProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "bool_prop" then
			t.boolProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "struct_prop" then
			t.structProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "array_of_struct_prop" then
			t.arrayOfStructProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "string_array_prop" then
			t.stringArrayProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "image_string_prop" then
			t.imageStringProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "image_set_prop" then
			t.imageSetProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "icon_prop" then
			t.iconProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "icon_size_prop" then
			t.iconSizeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "foundation_icon_config_prop" then
			t.foundationIconConfigProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "color_prop" then
			t.colorProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "color_style_prop" then
			t.colorStyleProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "gradient_prop" then
			t.gradientProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "typography_prop" then
			t.typographyProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "typography_font_prop" then
			t.typographyFontProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "udim_prop" then
			t.udimProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "udim2_prop" then
			t.udim2Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "vector2_prop" then
			t.vector2Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "ui_scaled_float_prop" then
			t.uiScaledFloatProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "ui_scaled_udim_prop" then
			t.uiScaledUdimProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "ui_scaled_udim2_prop" then
			t.uiScaledUdim2Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "fill_behavior_prop" then
			t.fillBehaviorProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "input_size_prop" then
			t.inputSizeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "automatic_size_prop" then
			t.automaticSizeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "text_truncate_prop" then
			t.textTruncateProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "text_x_alignment_prop" then
			t.textXAlignmentProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "text_y_alignment_prop" then
			t.textYAlignmentProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "ui_flex_mode_prop" then
			t.uiFlexModeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "scale_type_prop" then
			t.scaleTypeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "resampler_mode_prop" then
			t.resamplerModeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "size_constraint_prop" then
			t.sizeConstraintProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "selection_behavior_prop" then
			t.selectionBehaviorProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "key_code_prop" then
			t.keyCodeProp = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), propTypesModule (ref), propTypesEngineModule (ref)
	local var92 = t_1.new()
	
	if self.prop_builder ~= nil then
		var92.prop_builder = self.prop_builder
	end
	if self.propBuilder ~= nil then
		var92.prop_builder = self.propBuilder
	end
	if self.string_prop ~= nil then
		var92.oneof_prop = {
			type = "string_prop",
			value = propTypesModule.StringProp.jsonDecode(self.string_prop)
		}
	end
	if self.stringProp ~= nil then
		var92.oneof_prop = {
			type = "string_prop",
			value = propTypesModule.StringProp.jsonDecode(self.stringProp)
		}
	end
	if self.int32_prop ~= nil then
		var92.oneof_prop = {
			type = "int32_prop",
			value = propTypesModule.Int32Prop.jsonDecode(self.int32_prop)
		}
	end
	if self.int32Prop ~= nil then
		var92.oneof_prop = {
			type = "int32_prop",
			value = propTypesModule.Int32Prop.jsonDecode(self.int32Prop)
		}
	end
	if self.int64_prop ~= nil then
		var92.oneof_prop = {
			type = "int64_prop",
			value = propTypesModule.Int64Prop.jsonDecode(self.int64_prop)
		}
	end
	if self.int64Prop ~= nil then
		var92.oneof_prop = {
			type = "int64_prop",
			value = propTypesModule.Int64Prop.jsonDecode(self.int64Prop)
		}
	end
	if self.float_prop ~= nil then
		var92.oneof_prop = {
			type = "float_prop",
			value = propTypesModule.FloatProp.jsonDecode(self.float_prop)
		}
	end
	if self.floatProp ~= nil then
		var92.oneof_prop = {
			type = "float_prop",
			value = propTypesModule.FloatProp.jsonDecode(self.floatProp)
		}
	end
	if self.double_prop ~= nil then
		var92.oneof_prop = {
			type = "double_prop",
			value = propTypesModule.DoubleProp.jsonDecode(self.double_prop)
		}
	end
	if self.doubleProp ~= nil then
		var92.oneof_prop = {
			type = "double_prop",
			value = propTypesModule.DoubleProp.jsonDecode(self.doubleProp)
		}
	end
	if self.bool_prop ~= nil then
		var92.oneof_prop = {
			type = "bool_prop",
			value = propTypesModule.BoolProp.jsonDecode(self.bool_prop)
		}
	end
	if self.boolProp ~= nil then
		var92.oneof_prop = {
			type = "bool_prop",
			value = propTypesModule.BoolProp.jsonDecode(self.boolProp)
		}
	end
	if self.struct_prop ~= nil then
		var92.oneof_prop = {
			type = "struct_prop",
			value = propTypesModule.StructProp.jsonDecode(self.struct_prop)
		}
	end
	if self.structProp ~= nil then
		var92.oneof_prop = {
			type = "struct_prop",
			value = propTypesModule.StructProp.jsonDecode(self.structProp)
		}
	end
	if self.array_of_struct_prop ~= nil then
		var92.oneof_prop = {
			type = "array_of_struct_prop",
			value = propTypesModule.ArrayOfStructProp.jsonDecode(self.array_of_struct_prop)
		}
	end
	if self.arrayOfStructProp ~= nil then
		var92.oneof_prop = {
			type = "array_of_struct_prop",
			value = propTypesModule.ArrayOfStructProp.jsonDecode(self.arrayOfStructProp)
		}
	end
	if self.string_array_prop ~= nil then
		var92.oneof_prop = {
			type = "string_array_prop",
			value = propTypesModule.StringArrayProp.jsonDecode(self.string_array_prop)
		}
	end
	if self.stringArrayProp ~= nil then
		var92.oneof_prop = {
			type = "string_array_prop",
			value = propTypesModule.StringArrayProp.jsonDecode(self.stringArrayProp)
		}
	end
	if self.image_string_prop ~= nil then
		var92.oneof_prop = {
			type = "image_string_prop",
			value = propTypesModule.ImageStringProp.jsonDecode(self.image_string_prop)
		}
	end
	if self.imageStringProp ~= nil then
		var92.oneof_prop = {
			type = "image_string_prop",
			value = propTypesModule.ImageStringProp.jsonDecode(self.imageStringProp)
		}
	end
	if self.image_set_prop ~= nil then
		var92.oneof_prop = {
			type = "image_set_prop",
			value = propTypesModule.ImageSetProp.jsonDecode(self.image_set_prop)
		}
	end
	if self.imageSetProp ~= nil then
		var92.oneof_prop = {
			type = "image_set_prop",
			value = propTypesModule.ImageSetProp.jsonDecode(self.imageSetProp)
		}
	end
	if self.icon_prop ~= nil then
		var92.oneof_prop = {
			type = "icon_prop",
			value = propTypesModule.IconProp.jsonDecode(self.icon_prop)
		}
	end
	if self.iconProp ~= nil then
		var92.oneof_prop = {
			type = "icon_prop",
			value = propTypesModule.IconProp.jsonDecode(self.iconProp)
		}
	end
	if self.icon_size_prop ~= nil then
		var92.oneof_prop = {
			type = "icon_size_prop",
			value = propTypesModule.IconSizeProp.jsonDecode(self.icon_size_prop)
		}
	end
	if self.iconSizeProp ~= nil then
		var92.oneof_prop = {
			type = "icon_size_prop",
			value = propTypesModule.IconSizeProp.jsonDecode(self.iconSizeProp)
		}
	end
	if self.foundation_icon_config_prop ~= nil then
		var92.oneof_prop = {
			type = "foundation_icon_config_prop",
			value = propTypesModule.FoundationIconConfigProp.jsonDecode(self.foundation_icon_config_prop)
		}
	end
	if self.foundationIconConfigProp ~= nil then
		var92.oneof_prop = {
			type = "foundation_icon_config_prop",
			value = propTypesModule.FoundationIconConfigProp.jsonDecode(self.foundationIconConfigProp)
		}
	end
	if self.color_prop ~= nil then
		var92.oneof_prop = {
			type = "color_prop",
			value = propTypesModule.ColorProp.jsonDecode(self.color_prop)
		}
	end
	if self.colorProp ~= nil then
		var92.oneof_prop = {
			type = "color_prop",
			value = propTypesModule.ColorProp.jsonDecode(self.colorProp)
		}
	end
	if self.color_style_prop ~= nil then
		var92.oneof_prop = {
			type = "color_style_prop",
			value = propTypesModule.ColorStyleProp.jsonDecode(self.color_style_prop)
		}
	end
	if self.colorStyleProp ~= nil then
		var92.oneof_prop = {
			type = "color_style_prop",
			value = propTypesModule.ColorStyleProp.jsonDecode(self.colorStyleProp)
		}
	end
	if self.gradient_prop ~= nil then
		var92.oneof_prop = {
			type = "gradient_prop",
			value = propTypesModule.GradientProp.jsonDecode(self.gradient_prop)
		}
	end
	if self.gradientProp ~= nil then
		var92.oneof_prop = {
			type = "gradient_prop",
			value = propTypesModule.GradientProp.jsonDecode(self.gradientProp)
		}
	end
	if self.typography_prop ~= nil then
		var92.oneof_prop = {
			type = "typography_prop",
			value = propTypesModule.TypographyProp.jsonDecode(self.typography_prop)
		}
	end
	if self.typographyProp ~= nil then
		var92.oneof_prop = {
			type = "typography_prop",
			value = propTypesModule.TypographyProp.jsonDecode(self.typographyProp)
		}
	end
	if self.typography_font_prop ~= nil then
		var92.oneof_prop = {
			type = "typography_font_prop",
			value = propTypesModule.TypographyFontProp.jsonDecode(self.typography_font_prop)
		}
	end
	if self.typographyFontProp ~= nil then
		var92.oneof_prop = {
			type = "typography_font_prop",
			value = propTypesModule.TypographyFontProp.jsonDecode(self.typographyFontProp)
		}
	end
	if self.udim_prop ~= nil then
		var92.oneof_prop = {
			type = "udim_prop",
			value = propTypesModule.UDimProp.jsonDecode(self.udim_prop)
		}
	end
	if self.udimProp ~= nil then
		var92.oneof_prop = {
			type = "udim_prop",
			value = propTypesModule.UDimProp.jsonDecode(self.udimProp)
		}
	end
	if self.udim2_prop ~= nil then
		var92.oneof_prop = {
			type = "udim2_prop",
			value = propTypesModule.UDim2Prop.jsonDecode(self.udim2_prop)
		}
	end
	if self.udim2Prop ~= nil then
		var92.oneof_prop = {
			type = "udim2_prop",
			value = propTypesModule.UDim2Prop.jsonDecode(self.udim2Prop)
		}
	end
	if self.vector2_prop ~= nil then
		var92.oneof_prop = {
			type = "vector2_prop",
			value = propTypesModule.Vector2Prop.jsonDecode(self.vector2_prop)
		}
	end
	if self.vector2Prop ~= nil then
		var92.oneof_prop = {
			type = "vector2_prop",
			value = propTypesModule.Vector2Prop.jsonDecode(self.vector2Prop)
		}
	end
	if self.ui_scaled_float_prop ~= nil then
		var92.oneof_prop = {
			type = "ui_scaled_float_prop",
			value = propTypesModule.UiScaledFloatProp.jsonDecode(self.ui_scaled_float_prop)
		}
	end
	if self.uiScaledFloatProp ~= nil then
		var92.oneof_prop = {
			type = "ui_scaled_float_prop",
			value = propTypesModule.UiScaledFloatProp.jsonDecode(self.uiScaledFloatProp)
		}
	end
	if self.ui_scaled_udim_prop ~= nil then
		var92.oneof_prop = {
			type = "ui_scaled_udim_prop",
			value = propTypesModule.UiScaledUDimProp.jsonDecode(self.ui_scaled_udim_prop)
		}
	end
	if self.uiScaledUdimProp ~= nil then
		var92.oneof_prop = {
			type = "ui_scaled_udim_prop",
			value = propTypesModule.UiScaledUDimProp.jsonDecode(self.uiScaledUdimProp)
		}
	end
	if self.ui_scaled_udim2_prop ~= nil then
		var92.oneof_prop = {
			type = "ui_scaled_udim2_prop",
			value = propTypesModule.UiScaledUDim2Prop.jsonDecode(self.ui_scaled_udim2_prop)
		}
	end
	if self.uiScaledUdim2Prop ~= nil then
		var92.oneof_prop = {
			type = "ui_scaled_udim2_prop",
			value = propTypesModule.UiScaledUDim2Prop.jsonDecode(self.uiScaledUdim2Prop)
		}
	end
	if self.fill_behavior_prop ~= nil then
		var92.oneof_prop = {
			type = "fill_behavior_prop",
			value = propTypesModule.FillBehaviorProp.jsonDecode(self.fill_behavior_prop)
		}
	end
	if self.fillBehaviorProp ~= nil then
		var92.oneof_prop = {
			type = "fill_behavior_prop",
			value = propTypesModule.FillBehaviorProp.jsonDecode(self.fillBehaviorProp)
		}
	end
	if self.input_size_prop ~= nil then
		var92.oneof_prop = {
			type = "input_size_prop",
			value = propTypesModule.InputSizeProp.jsonDecode(self.input_size_prop)
		}
	end
	if self.inputSizeProp ~= nil then
		var92.oneof_prop = {
			type = "input_size_prop",
			value = propTypesModule.InputSizeProp.jsonDecode(self.inputSizeProp)
		}
	end
	if self.automatic_size_prop ~= nil then
		var92.oneof_prop = {
			type = "automatic_size_prop",
			value = propTypesEngineModule.AutomaticSizeProp.jsonDecode(self.automatic_size_prop)
		}
	end
	if self.automaticSizeProp ~= nil then
		var92.oneof_prop = {
			type = "automatic_size_prop",
			value = propTypesEngineModule.AutomaticSizeProp.jsonDecode(self.automaticSizeProp)
		}
	end
	if self.text_truncate_prop ~= nil then
		var92.oneof_prop = {
			type = "text_truncate_prop",
			value = propTypesEngineModule.TextTruncateProp.jsonDecode(self.text_truncate_prop)
		}
	end
	if self.textTruncateProp ~= nil then
		var92.oneof_prop = {
			type = "text_truncate_prop",
			value = propTypesEngineModule.TextTruncateProp.jsonDecode(self.textTruncateProp)
		}
	end
	if self.text_x_alignment_prop ~= nil then
		var92.oneof_prop = {
			type = "text_x_alignment_prop",
			value = propTypesEngineModule.TextXAlignmentProp.jsonDecode(self.text_x_alignment_prop)
		}
	end
	if self.textXAlignmentProp ~= nil then
		var92.oneof_prop = {
			type = "text_x_alignment_prop",
			value = propTypesEngineModule.TextXAlignmentProp.jsonDecode(self.textXAlignmentProp)
		}
	end
	if self.text_y_alignment_prop ~= nil then
		var92.oneof_prop = {
			type = "text_y_alignment_prop",
			value = propTypesEngineModule.TextYAlignmentProp.jsonDecode(self.text_y_alignment_prop)
		}
	end
	if self.textYAlignmentProp ~= nil then
		var92.oneof_prop = {
			type = "text_y_alignment_prop",
			value = propTypesEngineModule.TextYAlignmentProp.jsonDecode(self.textYAlignmentProp)
		}
	end
	if self.ui_flex_mode_prop ~= nil then
		var92.oneof_prop = {
			type = "ui_flex_mode_prop",
			value = propTypesEngineModule.UIFlexModeProp.jsonDecode(self.ui_flex_mode_prop)
		}
	end
	if self.uiFlexModeProp ~= nil then
		var92.oneof_prop = {
			type = "ui_flex_mode_prop",
			value = propTypesEngineModule.UIFlexModeProp.jsonDecode(self.uiFlexModeProp)
		}
	end
	if self.scale_type_prop ~= nil then
		var92.oneof_prop = {
			type = "scale_type_prop",
			value = propTypesEngineModule.ScaleTypeProp.jsonDecode(self.scale_type_prop)
		}
	end
	if self.scaleTypeProp ~= nil then
		var92.oneof_prop = {
			type = "scale_type_prop",
			value = propTypesEngineModule.ScaleTypeProp.jsonDecode(self.scaleTypeProp)
		}
	end
	if self.resampler_mode_prop ~= nil then
		var92.oneof_prop = {
			type = "resampler_mode_prop",
			value = propTypesEngineModule.ResamplerModeProp.jsonDecode(self.resampler_mode_prop)
		}
	end
	if self.resamplerModeProp ~= nil then
		var92.oneof_prop = {
			type = "resampler_mode_prop",
			value = propTypesEngineModule.ResamplerModeProp.jsonDecode(self.resamplerModeProp)
		}
	end
	if self.size_constraint_prop ~= nil then
		var92.oneof_prop = {
			type = "size_constraint_prop",
			value = propTypesEngineModule.SizeConstraintProp.jsonDecode(self.size_constraint_prop)
		}
	end
	if self.sizeConstraintProp ~= nil then
		var92.oneof_prop = {
			type = "size_constraint_prop",
			value = propTypesEngineModule.SizeConstraintProp.jsonDecode(self.sizeConstraintProp)
		}
	end
	if self.selection_behavior_prop ~= nil then
		var92.oneof_prop = {
			type = "selection_behavior_prop",
			value = propTypesEngineModule.SelectionBehaviorProp.jsonDecode(self.selection_behavior_prop)
		}
	end
	if self.selectionBehaviorProp ~= nil then
		var92.oneof_prop = {
			type = "selection_behavior_prop",
			value = propTypesEngineModule.SelectionBehaviorProp.jsonDecode(self.selectionBehaviorProp)
		}
	end
	if self.key_code_prop ~= nil then
		var92.oneof_prop = {
			type = "key_code_prop",
			value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.key_code_prop)
		}
	end
	if self.keyCodeProp ~= nil then
		var92.oneof_prop = {
			type = "key_code_prop",
			value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.keyCodeProp)
		}
	end
	return var92
end

t_1.descriptor = {
	name = "ExperimentalProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperimentalProp"
}
t.ExperimentalProp = t_1
typeRegistryModule.default:register(t.ExperimentalProp)

return { ExperimentalProp = t.ExperimentalProp }