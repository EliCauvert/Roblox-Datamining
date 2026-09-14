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
		oneof_prop = if p1 == nil or p1.oneof_prop == nil then nil else p1.oneof_prop
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			local var2 = self.oneof_prop.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var10 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.oneof_prop.type == "int32_prop" then
			local var5 = self.oneof_prop.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var13 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		elseif self.oneof_prop.type == "int64_prop" then
			local var8 = self.oneof_prop.value:encode()
			local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var9, var16 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
			buff = var9
			var1 = var10
		elseif self.oneof_prop.type == "float_prop" then
			local var11 = self.oneof_prop.value:encode()
			local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var12, var19 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
			buff = var12
			var1 = var13
		elseif self.oneof_prop.type == "double_prop" then
			local var14 = self.oneof_prop.value:encode()
			local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var15, var22 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
			buff = var15
			var1 = var16
		elseif self.oneof_prop.type == "bool_prop" then
			local var17 = self.oneof_prop.value:encode()
			local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var18, var25 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
			buff = var18
			var1 = var19
		elseif self.oneof_prop.type == "struct_prop" then
			local var20 = self.oneof_prop.value:encode()
			local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var21, var28 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
			buff = var21
			var1 = var22
		elseif self.oneof_prop.type == "array_of_struct_prop" then
			local var23 = self.oneof_prop.value:encode()
			local var24, var25 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var24, var31 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
			buff = var24
			var1 = var25
		elseif self.oneof_prop.type == "string_array_prop" then
			local var26 = self.oneof_prop.value:encode()
			local var27, var28 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
			var27, var34 = protoModule.writeBuffer(var27, var28, var26, buffer.len(var26))
			buff = var27
			var1 = var28
		elseif self.oneof_prop.type == "image_string_prop" then
			local var29 = self.oneof_prop.value:encode()
			local var30, var31 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.lengthDelimited)
			var30, var37 = protoModule.writeBuffer(var30, var31, var29, buffer.len(var29))
			buff = var30
			var1 = var31
		elseif self.oneof_prop.type == "image_set_prop" then
			local var32 = self.oneof_prop.value:encode()
			local var33, var34 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
			var33, var40 = protoModule.writeBuffer(var33, var34, var32, buffer.len(var32))
			buff = var33
			var1 = var34
		elseif self.oneof_prop.type == "icon_prop" then
			local var35 = self.oneof_prop.value:encode()
			local var36, var37 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.lengthDelimited)
			var36, var43 = protoModule.writeBuffer(var36, var37, var35, buffer.len(var35))
			buff = var36
			var1 = var37
		elseif self.oneof_prop.type == "icon_size_prop" then
			local var38 = self.oneof_prop.value:encode()
			local var39, var40 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
			var39, var46 = protoModule.writeBuffer(var39, var40, var38, buffer.len(var38))
			buff = var39
			var1 = var40
		elseif self.oneof_prop.type == "foundation_icon_config_prop" then
			local var41 = self.oneof_prop.value:encode()
			local var42, var43 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
			var42, var49 = protoModule.writeBuffer(var42, var43, var41, buffer.len(var41))
			buff = var42
			var1 = var43
		elseif self.oneof_prop.type == "color_prop" then
			local var44 = self.oneof_prop.value:encode()
			local var45, var46 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.lengthDelimited)
			var45, var52 = protoModule.writeBuffer(var45, var46, var44, buffer.len(var44))
			buff = var45
			var1 = var46
		elseif self.oneof_prop.type == "color_style_prop" then
			local var47 = self.oneof_prop.value:encode()
			local var48, var49 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.lengthDelimited)
			var48, var55 = protoModule.writeBuffer(var48, var49, var47, buffer.len(var47))
			buff = var48
			var1 = var49
		elseif self.oneof_prop.type == "gradient_prop" then
			local var50 = self.oneof_prop.value:encode()
			local var51, var52 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.lengthDelimited)
			var51, var58 = protoModule.writeBuffer(var51, var52, var50, buffer.len(var50))
			buff = var51
			var1 = var52
		elseif self.oneof_prop.type == "typography_prop" then
			local var53 = self.oneof_prop.value:encode()
			local var54, var55 = protoModule.writeTag(buff, var1, 18, protoModule.wireTypes.lengthDelimited)
			var54, var61 = protoModule.writeBuffer(var54, var55, var53, buffer.len(var53))
			buff = var54
			var1 = var55
		elseif self.oneof_prop.type == "typography_font_prop" then
			local var56 = self.oneof_prop.value:encode()
			local var57, var58 = protoModule.writeTag(buff, var1, 19, protoModule.wireTypes.lengthDelimited)
			var57, var64 = protoModule.writeBuffer(var57, var58, var56, buffer.len(var56))
			buff = var57
			var1 = var58
		elseif self.oneof_prop.type == "udim_prop" then
			local var59 = self.oneof_prop.value:encode()
			local var60, var61 = protoModule.writeTag(buff, var1, 20, protoModule.wireTypes.lengthDelimited)
			var60, var67 = protoModule.writeBuffer(var60, var61, var59, buffer.len(var59))
			buff = var60
			var1 = var61
		elseif self.oneof_prop.type == "udim2_prop" then
			local var62 = self.oneof_prop.value:encode()
			local var63, var64 = protoModule.writeTag(buff, var1, 21, protoModule.wireTypes.lengthDelimited)
			var63, var70 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
			buff = var63
			var1 = var64
		elseif self.oneof_prop.type == "vector2_prop" then
			local var65 = self.oneof_prop.value:encode()
			local var66, var67 = protoModule.writeTag(buff, var1, 22, protoModule.wireTypes.lengthDelimited)
			var66, var73 = protoModule.writeBuffer(var66, var67, var65, buffer.len(var65))
			buff = var66
			var1 = var67
		elseif self.oneof_prop.type == "ui_scaled_float_prop" then
			local var68 = self.oneof_prop.value:encode()
			local var69, var70 = protoModule.writeTag(buff, var1, 23, protoModule.wireTypes.lengthDelimited)
			var69, var76 = protoModule.writeBuffer(var69, var70, var68, buffer.len(var68))
			buff = var69
			var1 = var70
		elseif self.oneof_prop.type == "ui_scaled_udim_prop" then
			local var71 = self.oneof_prop.value:encode()
			local var72, var73 = protoModule.writeTag(buff, var1, 24, protoModule.wireTypes.lengthDelimited)
			var72, var79 = protoModule.writeBuffer(var72, var73, var71, buffer.len(var71))
			buff = var72
			var1 = var73
		elseif self.oneof_prop.type == "ui_scaled_udim2_prop" then
			local var74 = self.oneof_prop.value:encode()
			local var75, var76 = protoModule.writeTag(buff, var1, 25, protoModule.wireTypes.lengthDelimited)
			var75, var82 = protoModule.writeBuffer(var75, var76, var74, buffer.len(var74))
			buff = var75
			var1 = var76
		elseif self.oneof_prop.type == "fill_behavior_prop" then
			local var77 = self.oneof_prop.value:encode()
			local var78, var79 = protoModule.writeTag(buff, var1, 26, protoModule.wireTypes.lengthDelimited)
			var78, var85 = protoModule.writeBuffer(var78, var79, var77, buffer.len(var77))
			buff = var78
			var1 = var79
		elseif self.oneof_prop.type == "input_size_prop" then
			local var80 = self.oneof_prop.value:encode()
			local var81, var82 = protoModule.writeTag(buff, var1, 27, protoModule.wireTypes.lengthDelimited)
			var81, var88 = protoModule.writeBuffer(var81, var82, var80, buffer.len(var80))
			buff = var81
			var1 = var82
		elseif self.oneof_prop.type == "automatic_size_prop" then
			local var83 = self.oneof_prop.value:encode()
			local var84, var85 = protoModule.writeTag(buff, var1, 28, protoModule.wireTypes.lengthDelimited)
			var84, var91 = protoModule.writeBuffer(var84, var85, var83, buffer.len(var83))
			buff = var84
			var1 = var85
		elseif self.oneof_prop.type == "text_truncate_prop" then
			local var86 = self.oneof_prop.value:encode()
			local var87, var88 = protoModule.writeTag(buff, var1, 29, protoModule.wireTypes.lengthDelimited)
			var87, var94 = protoModule.writeBuffer(var87, var88, var86, buffer.len(var86))
			buff = var87
			var1 = var88
		elseif self.oneof_prop.type == "text_x_alignment_prop" then
			local var89 = self.oneof_prop.value:encode()
			local var90, var91 = protoModule.writeTag(buff, var1, 30, protoModule.wireTypes.lengthDelimited)
			var90, var97 = protoModule.writeBuffer(var90, var91, var89, buffer.len(var89))
			buff = var90
			var1 = var91
		elseif self.oneof_prop.type == "text_y_alignment_prop" then
			local var92 = self.oneof_prop.value:encode()
			local var93, var94 = protoModule.writeTag(buff, var1, 31, protoModule.wireTypes.lengthDelimited)
			var93, var100 = protoModule.writeBuffer(var93, var94, var92, buffer.len(var92))
			buff = var93
			var1 = var94
		elseif self.oneof_prop.type == "ui_flex_mode_prop" then
			local var95 = self.oneof_prop.value:encode()
			local var96, var97 = protoModule.writeTag(buff, var1, 32, protoModule.wireTypes.lengthDelimited)
			var96, var103 = protoModule.writeBuffer(var96, var97, var95, buffer.len(var95))
			buff = var96
			var1 = var97
		elseif self.oneof_prop.type == "scale_type_prop" then
			local var98 = self.oneof_prop.value:encode()
			local var99, var100 = protoModule.writeTag(buff, var1, 33, protoModule.wireTypes.lengthDelimited)
			var99, var106 = protoModule.writeBuffer(var99, var100, var98, buffer.len(var98))
			buff = var99
			var1 = var100
		elseif self.oneof_prop.type == "resampler_mode_prop" then
			local var101 = self.oneof_prop.value:encode()
			local var102, var103 = protoModule.writeTag(buff, var1, 34, protoModule.wireTypes.lengthDelimited)
			var102, var109 = protoModule.writeBuffer(var102, var103, var101, buffer.len(var101))
			buff = var102
			var1 = var103
		elseif self.oneof_prop.type == "size_constraint_prop" then
			local var104 = self.oneof_prop.value:encode()
			local var105, var106 = protoModule.writeTag(buff, var1, 35, protoModule.wireTypes.lengthDelimited)
			var105, var112 = protoModule.writeBuffer(var105, var106, var104, buffer.len(var104))
			buff = var105
			var1 = var106
		elseif self.oneof_prop.type == "selection_behavior_prop" then
			local var107 = self.oneof_prop.value:encode()
			local var108, var109 = protoModule.writeTag(buff, var1, 36, protoModule.wireTypes.lengthDelimited)
			var108, var115 = protoModule.writeBuffer(var108, var109, var107, buffer.len(var107))
			buff = var108
			var1 = var109
		elseif self.oneof_prop.type == "key_code_prop" then
			local var110 = self.oneof_prop.value:encode()
			local var111, var112 = protoModule.writeTag(buff, var1, 37, protoModule.wireTypes.lengthDelimited)
			var111, var118 = protoModule.writeBuffer(var111, var112, var110, buffer.len(var110))
			buff = var111
			var1 = var112
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
			else
				local _ = nil
				local var84, var85 = protoModule.readVarInt(p1, var2)
				var2 = var85 + var84
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var86, var87 = protoModule.readFixed32(p1, var2)
			local _ = var86
			var2 = var87
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var88, var89 = protoModule.readFixed64(p1, var2)
			local _ = var88
			var2 = var89
		else
			error("Unsupported wire type: " .. var122)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
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
	local var90 = t_1.new()
	
	if self.string_prop ~= nil then
		var90.oneof_prop = {
			type = "string_prop",
			value = propTypesModule.StringProp.jsonDecode(self.string_prop)
		}
	end
	if self.stringProp ~= nil then
		var90.oneof_prop = {
			type = "string_prop",
			value = propTypesModule.StringProp.jsonDecode(self.stringProp)
		}
	end
	if self.int32_prop ~= nil then
		var90.oneof_prop = {
			type = "int32_prop",
			value = propTypesModule.Int32Prop.jsonDecode(self.int32_prop)
		}
	end
	if self.int32Prop ~= nil then
		var90.oneof_prop = {
			type = "int32_prop",
			value = propTypesModule.Int32Prop.jsonDecode(self.int32Prop)
		}
	end
	if self.int64_prop ~= nil then
		var90.oneof_prop = {
			type = "int64_prop",
			value = propTypesModule.Int64Prop.jsonDecode(self.int64_prop)
		}
	end
	if self.int64Prop ~= nil then
		var90.oneof_prop = {
			type = "int64_prop",
			value = propTypesModule.Int64Prop.jsonDecode(self.int64Prop)
		}
	end
	if self.float_prop ~= nil then
		var90.oneof_prop = {
			type = "float_prop",
			value = propTypesModule.FloatProp.jsonDecode(self.float_prop)
		}
	end
	if self.floatProp ~= nil then
		var90.oneof_prop = {
			type = "float_prop",
			value = propTypesModule.FloatProp.jsonDecode(self.floatProp)
		}
	end
	if self.double_prop ~= nil then
		var90.oneof_prop = {
			type = "double_prop",
			value = propTypesModule.DoubleProp.jsonDecode(self.double_prop)
		}
	end
	if self.doubleProp ~= nil then
		var90.oneof_prop = {
			type = "double_prop",
			value = propTypesModule.DoubleProp.jsonDecode(self.doubleProp)
		}
	end
	if self.bool_prop ~= nil then
		var90.oneof_prop = {
			type = "bool_prop",
			value = propTypesModule.BoolProp.jsonDecode(self.bool_prop)
		}
	end
	if self.boolProp ~= nil then
		var90.oneof_prop = {
			type = "bool_prop",
			value = propTypesModule.BoolProp.jsonDecode(self.boolProp)
		}
	end
	if self.struct_prop ~= nil then
		var90.oneof_prop = {
			type = "struct_prop",
			value = propTypesModule.StructProp.jsonDecode(self.struct_prop)
		}
	end
	if self.structProp ~= nil then
		var90.oneof_prop = {
			type = "struct_prop",
			value = propTypesModule.StructProp.jsonDecode(self.structProp)
		}
	end
	if self.array_of_struct_prop ~= nil then
		var90.oneof_prop = {
			type = "array_of_struct_prop",
			value = propTypesModule.ArrayOfStructProp.jsonDecode(self.array_of_struct_prop)
		}
	end
	if self.arrayOfStructProp ~= nil then
		var90.oneof_prop = {
			type = "array_of_struct_prop",
			value = propTypesModule.ArrayOfStructProp.jsonDecode(self.arrayOfStructProp)
		}
	end
	if self.string_array_prop ~= nil then
		var90.oneof_prop = {
			type = "string_array_prop",
			value = propTypesModule.StringArrayProp.jsonDecode(self.string_array_prop)
		}
	end
	if self.stringArrayProp ~= nil then
		var90.oneof_prop = {
			type = "string_array_prop",
			value = propTypesModule.StringArrayProp.jsonDecode(self.stringArrayProp)
		}
	end
	if self.image_string_prop ~= nil then
		var90.oneof_prop = {
			type = "image_string_prop",
			value = propTypesModule.ImageStringProp.jsonDecode(self.image_string_prop)
		}
	end
	if self.imageStringProp ~= nil then
		var90.oneof_prop = {
			type = "image_string_prop",
			value = propTypesModule.ImageStringProp.jsonDecode(self.imageStringProp)
		}
	end
	if self.image_set_prop ~= nil then
		var90.oneof_prop = {
			type = "image_set_prop",
			value = propTypesModule.ImageSetProp.jsonDecode(self.image_set_prop)
		}
	end
	if self.imageSetProp ~= nil then
		var90.oneof_prop = {
			type = "image_set_prop",
			value = propTypesModule.ImageSetProp.jsonDecode(self.imageSetProp)
		}
	end
	if self.icon_prop ~= nil then
		var90.oneof_prop = {
			type = "icon_prop",
			value = propTypesModule.IconProp.jsonDecode(self.icon_prop)
		}
	end
	if self.iconProp ~= nil then
		var90.oneof_prop = {
			type = "icon_prop",
			value = propTypesModule.IconProp.jsonDecode(self.iconProp)
		}
	end
	if self.icon_size_prop ~= nil then
		var90.oneof_prop = {
			type = "icon_size_prop",
			value = propTypesModule.IconSizeProp.jsonDecode(self.icon_size_prop)
		}
	end
	if self.iconSizeProp ~= nil then
		var90.oneof_prop = {
			type = "icon_size_prop",
			value = propTypesModule.IconSizeProp.jsonDecode(self.iconSizeProp)
		}
	end
	if self.foundation_icon_config_prop ~= nil then
		var90.oneof_prop = {
			type = "foundation_icon_config_prop",
			value = propTypesModule.FoundationIconConfigProp.jsonDecode(self.foundation_icon_config_prop)
		}
	end
	if self.foundationIconConfigProp ~= nil then
		var90.oneof_prop = {
			type = "foundation_icon_config_prop",
			value = propTypesModule.FoundationIconConfigProp.jsonDecode(self.foundationIconConfigProp)
		}
	end
	if self.color_prop ~= nil then
		var90.oneof_prop = {
			type = "color_prop",
			value = propTypesModule.ColorProp.jsonDecode(self.color_prop)
		}
	end
	if self.colorProp ~= nil then
		var90.oneof_prop = {
			type = "color_prop",
			value = propTypesModule.ColorProp.jsonDecode(self.colorProp)
		}
	end
	if self.color_style_prop ~= nil then
		var90.oneof_prop = {
			type = "color_style_prop",
			value = propTypesModule.ColorStyleProp.jsonDecode(self.color_style_prop)
		}
	end
	if self.colorStyleProp ~= nil then
		var90.oneof_prop = {
			type = "color_style_prop",
			value = propTypesModule.ColorStyleProp.jsonDecode(self.colorStyleProp)
		}
	end
	if self.gradient_prop ~= nil then
		var90.oneof_prop = {
			type = "gradient_prop",
			value = propTypesModule.GradientProp.jsonDecode(self.gradient_prop)
		}
	end
	if self.gradientProp ~= nil then
		var90.oneof_prop = {
			type = "gradient_prop",
			value = propTypesModule.GradientProp.jsonDecode(self.gradientProp)
		}
	end
	if self.typography_prop ~= nil then
		var90.oneof_prop = {
			type = "typography_prop",
			value = propTypesModule.TypographyProp.jsonDecode(self.typography_prop)
		}
	end
	if self.typographyProp ~= nil then
		var90.oneof_prop = {
			type = "typography_prop",
			value = propTypesModule.TypographyProp.jsonDecode(self.typographyProp)
		}
	end
	if self.typography_font_prop ~= nil then
		var90.oneof_prop = {
			type = "typography_font_prop",
			value = propTypesModule.TypographyFontProp.jsonDecode(self.typography_font_prop)
		}
	end
	if self.typographyFontProp ~= nil then
		var90.oneof_prop = {
			type = "typography_font_prop",
			value = propTypesModule.TypographyFontProp.jsonDecode(self.typographyFontProp)
		}
	end
	if self.udim_prop ~= nil then
		var90.oneof_prop = {
			type = "udim_prop",
			value = propTypesModule.UDimProp.jsonDecode(self.udim_prop)
		}
	end
	if self.udimProp ~= nil then
		var90.oneof_prop = {
			type = "udim_prop",
			value = propTypesModule.UDimProp.jsonDecode(self.udimProp)
		}
	end
	if self.udim2_prop ~= nil then
		var90.oneof_prop = {
			type = "udim2_prop",
			value = propTypesModule.UDim2Prop.jsonDecode(self.udim2_prop)
		}
	end
	if self.udim2Prop ~= nil then
		var90.oneof_prop = {
			type = "udim2_prop",
			value = propTypesModule.UDim2Prop.jsonDecode(self.udim2Prop)
		}
	end
	if self.vector2_prop ~= nil then
		var90.oneof_prop = {
			type = "vector2_prop",
			value = propTypesModule.Vector2Prop.jsonDecode(self.vector2_prop)
		}
	end
	if self.vector2Prop ~= nil then
		var90.oneof_prop = {
			type = "vector2_prop",
			value = propTypesModule.Vector2Prop.jsonDecode(self.vector2Prop)
		}
	end
	if self.ui_scaled_float_prop ~= nil then
		var90.oneof_prop = {
			type = "ui_scaled_float_prop",
			value = propTypesModule.UiScaledFloatProp.jsonDecode(self.ui_scaled_float_prop)
		}
	end
	if self.uiScaledFloatProp ~= nil then
		var90.oneof_prop = {
			type = "ui_scaled_float_prop",
			value = propTypesModule.UiScaledFloatProp.jsonDecode(self.uiScaledFloatProp)
		}
	end
	if self.ui_scaled_udim_prop ~= nil then
		var90.oneof_prop = {
			type = "ui_scaled_udim_prop",
			value = propTypesModule.UiScaledUDimProp.jsonDecode(self.ui_scaled_udim_prop)
		}
	end
	if self.uiScaledUdimProp ~= nil then
		var90.oneof_prop = {
			type = "ui_scaled_udim_prop",
			value = propTypesModule.UiScaledUDimProp.jsonDecode(self.uiScaledUdimProp)
		}
	end
	if self.ui_scaled_udim2_prop ~= nil then
		var90.oneof_prop = {
			type = "ui_scaled_udim2_prop",
			value = propTypesModule.UiScaledUDim2Prop.jsonDecode(self.ui_scaled_udim2_prop)
		}
	end
	if self.uiScaledUdim2Prop ~= nil then
		var90.oneof_prop = {
			type = "ui_scaled_udim2_prop",
			value = propTypesModule.UiScaledUDim2Prop.jsonDecode(self.uiScaledUdim2Prop)
		}
	end
	if self.fill_behavior_prop ~= nil then
		var90.oneof_prop = {
			type = "fill_behavior_prop",
			value = propTypesModule.FillBehaviorProp.jsonDecode(self.fill_behavior_prop)
		}
	end
	if self.fillBehaviorProp ~= nil then
		var90.oneof_prop = {
			type = "fill_behavior_prop",
			value = propTypesModule.FillBehaviorProp.jsonDecode(self.fillBehaviorProp)
		}
	end
	if self.input_size_prop ~= nil then
		var90.oneof_prop = {
			type = "input_size_prop",
			value = propTypesModule.InputSizeProp.jsonDecode(self.input_size_prop)
		}
	end
	if self.inputSizeProp ~= nil then
		var90.oneof_prop = {
			type = "input_size_prop",
			value = propTypesModule.InputSizeProp.jsonDecode(self.inputSizeProp)
		}
	end
	if self.automatic_size_prop ~= nil then
		var90.oneof_prop = {
			type = "automatic_size_prop",
			value = propTypesEngineModule.AutomaticSizeProp.jsonDecode(self.automatic_size_prop)
		}
	end
	if self.automaticSizeProp ~= nil then
		var90.oneof_prop = {
			type = "automatic_size_prop",
			value = propTypesEngineModule.AutomaticSizeProp.jsonDecode(self.automaticSizeProp)
		}
	end
	if self.text_truncate_prop ~= nil then
		var90.oneof_prop = {
			type = "text_truncate_prop",
			value = propTypesEngineModule.TextTruncateProp.jsonDecode(self.text_truncate_prop)
		}
	end
	if self.textTruncateProp ~= nil then
		var90.oneof_prop = {
			type = "text_truncate_prop",
			value = propTypesEngineModule.TextTruncateProp.jsonDecode(self.textTruncateProp)
		}
	end
	if self.text_x_alignment_prop ~= nil then
		var90.oneof_prop = {
			type = "text_x_alignment_prop",
			value = propTypesEngineModule.TextXAlignmentProp.jsonDecode(self.text_x_alignment_prop)
		}
	end
	if self.textXAlignmentProp ~= nil then
		var90.oneof_prop = {
			type = "text_x_alignment_prop",
			value = propTypesEngineModule.TextXAlignmentProp.jsonDecode(self.textXAlignmentProp)
		}
	end
	if self.text_y_alignment_prop ~= nil then
		var90.oneof_prop = {
			type = "text_y_alignment_prop",
			value = propTypesEngineModule.TextYAlignmentProp.jsonDecode(self.text_y_alignment_prop)
		}
	end
	if self.textYAlignmentProp ~= nil then
		var90.oneof_prop = {
			type = "text_y_alignment_prop",
			value = propTypesEngineModule.TextYAlignmentProp.jsonDecode(self.textYAlignmentProp)
		}
	end
	if self.ui_flex_mode_prop ~= nil then
		var90.oneof_prop = {
			type = "ui_flex_mode_prop",
			value = propTypesEngineModule.UIFlexModeProp.jsonDecode(self.ui_flex_mode_prop)
		}
	end
	if self.uiFlexModeProp ~= nil then
		var90.oneof_prop = {
			type = "ui_flex_mode_prop",
			value = propTypesEngineModule.UIFlexModeProp.jsonDecode(self.uiFlexModeProp)
		}
	end
	if self.scale_type_prop ~= nil then
		var90.oneof_prop = {
			type = "scale_type_prop",
			value = propTypesEngineModule.ScaleTypeProp.jsonDecode(self.scale_type_prop)
		}
	end
	if self.scaleTypeProp ~= nil then
		var90.oneof_prop = {
			type = "scale_type_prop",
			value = propTypesEngineModule.ScaleTypeProp.jsonDecode(self.scaleTypeProp)
		}
	end
	if self.resampler_mode_prop ~= nil then
		var90.oneof_prop = {
			type = "resampler_mode_prop",
			value = propTypesEngineModule.ResamplerModeProp.jsonDecode(self.resampler_mode_prop)
		}
	end
	if self.resamplerModeProp ~= nil then
		var90.oneof_prop = {
			type = "resampler_mode_prop",
			value = propTypesEngineModule.ResamplerModeProp.jsonDecode(self.resamplerModeProp)
		}
	end
	if self.size_constraint_prop ~= nil then
		var90.oneof_prop = {
			type = "size_constraint_prop",
			value = propTypesEngineModule.SizeConstraintProp.jsonDecode(self.size_constraint_prop)
		}
	end
	if self.sizeConstraintProp ~= nil then
		var90.oneof_prop = {
			type = "size_constraint_prop",
			value = propTypesEngineModule.SizeConstraintProp.jsonDecode(self.sizeConstraintProp)
		}
	end
	if self.selection_behavior_prop ~= nil then
		var90.oneof_prop = {
			type = "selection_behavior_prop",
			value = propTypesEngineModule.SelectionBehaviorProp.jsonDecode(self.selection_behavior_prop)
		}
	end
	if self.selectionBehaviorProp ~= nil then
		var90.oneof_prop = {
			type = "selection_behavior_prop",
			value = propTypesEngineModule.SelectionBehaviorProp.jsonDecode(self.selectionBehaviorProp)
		}
	end
	if self.key_code_prop ~= nil then
		var90.oneof_prop = {
			type = "key_code_prop",
			value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.key_code_prop)
		}
	end
	if self.keyCodeProp ~= nil then
		var90.oneof_prop = {
			type = "key_code_prop",
			value = propTypesEngineModule.KeyCodeProp.jsonDecode(self.keyCodeProp)
		}
	end
	return var90
end

t_1.descriptor = {
	name = "ExperimentalProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperimentalProp"
}
t.ExperimentalProp = t_1
typeRegistryModule.default:register(t.ExperimentalProp)

return { ExperimentalProp = t.ExperimentalProp }