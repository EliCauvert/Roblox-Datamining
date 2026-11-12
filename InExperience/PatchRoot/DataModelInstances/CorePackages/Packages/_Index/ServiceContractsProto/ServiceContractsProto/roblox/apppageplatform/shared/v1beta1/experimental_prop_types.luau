local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local PropTypesModule = require(script.Parent.prop_types)
local PropTypesEngineModule = require(script.Parent.prop_types_engine)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		prop_builder = if p1 == nil or p1.prop_builder == nil then nil else p1.prop_builder,
		oneof_prop = if p1 == nil or p1.oneof_prop == nil then nil else p1.oneof_prop
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.prop_builder ~= nil then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1000, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.prop_builder)
	end
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "int32_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "int64_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "float_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "double_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "bool_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "struct_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "array_of_struct_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "string_array_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "image_string_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult12, WriteTagResult2_11, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "image_set_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult13, WriteTagResult2_12, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "icon_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult14, WriteTagResult2_13, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "icon_size_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult15, WriteTagResult2_14, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "foundation_icon_config_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult16, WriteTagResult2_15, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "color_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult17, WriteTagResult2_16, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "color_style_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult18, WriteTagResult2_17 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult18, WriteTagResult2_17, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "gradient_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult19, WriteTagResult2_18 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult19, WriteTagResult2_18, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "typography_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult20, WriteTagResult2_19 = ProtoModule.writeTag(Buf, Count, 18, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult20, WriteTagResult2_19, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "typography_font_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult21, WriteTagResult2_20 = ProtoModule.writeTag(Buf, Count, 19, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult21, WriteTagResult2_20, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "udim_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult22, WriteTagResult2_21 = ProtoModule.writeTag(Buf, Count, 20, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult22, WriteTagResult2_21, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "udim2_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult23, WriteTagResult2_22 = ProtoModule.writeTag(Buf, Count, 21, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult23, WriteTagResult2_22, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "vector2_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult24, WriteTagResult2_23 = ProtoModule.writeTag(Buf, Count, 22, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult24, WriteTagResult2_23, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "ui_scaled_float_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult25, WriteTagResult2_24 = ProtoModule.writeTag(Buf, Count, 23, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult25, WriteTagResult2_24, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "ui_scaled_udim_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult26, WriteTagResult2_25 = ProtoModule.writeTag(Buf, Count, 24, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult26, WriteTagResult2_25, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "ui_scaled_udim2_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult27, WriteTagResult2_26 = ProtoModule.writeTag(Buf, Count, 25, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult27, WriteTagResult2_26, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "fill_behavior_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult28, WriteTagResult2_27 = ProtoModule.writeTag(Buf, Count, 26, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult28, WriteTagResult2_27, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "input_size_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult29, WriteTagResult2_28 = ProtoModule.writeTag(Buf, Count, 27, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult29, WriteTagResult2_28, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "automatic_size_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult30, WriteTagResult2_29 = ProtoModule.writeTag(Buf, Count, 28, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult30, WriteTagResult2_29, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "text_truncate_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult31, WriteTagResult2_30 = ProtoModule.writeTag(Buf, Count, 29, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult31, WriteTagResult2_30, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "text_x_alignment_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult32, WriteTagResult2_31 = ProtoModule.writeTag(Buf, Count, 30, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult32, WriteTagResult2_31, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "text_y_alignment_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 31, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "ui_flex_mode_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult33, WriteTagResult2_32 = ProtoModule.writeTag(Buf, Count, 32, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult33, WriteTagResult2_32, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "scale_type_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult34, WriteTagResult2_33 = ProtoModule.writeTag(Buf, Count, 33, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult34, WriteTagResult2_33, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "resampler_mode_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult35, WriteTagResult2_34 = ProtoModule.writeTag(Buf, Count, 34, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult35, WriteTagResult2_34, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "size_constraint_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult36, WriteTagResult2_35 = ProtoModule.writeTag(Buf, Count, 35, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult36, WriteTagResult2_35, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "selection_behavior_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult37, WriteTagResult2_36 = ProtoModule.writeTag(Buf, Count, 36, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult37, WriteTagResult2_36, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "key_code_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult38, WriteTagResult2_37 = ProtoModule.writeTag(Buf, Count, 37, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult38, WriteTagResult2_37, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), PropTypesModule (copy), PropTypesEngineModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v122 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v122 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "string_prop",
					value = PropTypesModule.StringProp.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "int32_prop",
					value = PropTypesModule.Int32Prop.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "int64_prop",
					value = PropTypesModule.Int64Prop.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "float_prop",
					value = PropTypesModule.FloatProp.decode(Buffer4)
				}
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "double_prop",
					value = PropTypesModule.DoubleProp.decode(Buffer5)
				}
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "bool_prop",
					value = PropTypesModule.BoolProp.decode(Buffer6)
				}
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "struct_prop",
					value = PropTypesModule.StructProp.decode(Buffer7)
				}
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "array_of_struct_prop",
					value = PropTypesModule.ArrayOfStructProp.decode(Buffer8)
				}
			elseif Tag == 9 then
				local Buffer9
				Buffer9, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "string_array_prop",
					value = PropTypesModule.StringArrayProp.decode(Buffer9)
				}
			elseif Tag == 10 then
				local Buffer10
				Buffer10, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "image_string_prop",
					value = PropTypesModule.ImageStringProp.decode(Buffer10)
				}
			elseif Tag == 11 then
				local Buffer11
				Buffer11, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "image_set_prop",
					value = PropTypesModule.ImageSetProp.decode(Buffer11)
				}
			elseif Tag == 12 then
				local Buffer12
				Buffer12, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "icon_prop",
					value = PropTypesModule.IconProp.decode(Buffer12)
				}
			elseif Tag == 13 then
				local Buffer13
				Buffer13, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "icon_size_prop",
					value = PropTypesModule.IconSizeProp.decode(Buffer13)
				}
			elseif Tag == 14 then
				local Buffer14
				Buffer14, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "foundation_icon_config_prop",
					value = PropTypesModule.FoundationIconConfigProp.decode(Buffer14)
				}
			elseif Tag == 15 then
				local Buffer15
				Buffer15, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "color_prop",
					value = PropTypesModule.ColorProp.decode(Buffer15)
				}
			elseif Tag == 16 then
				local Buffer16
				Buffer16, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "color_style_prop",
					value = PropTypesModule.ColorStyleProp.decode(Buffer16)
				}
			elseif Tag == 17 then
				local Buffer17
				Buffer17, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "gradient_prop",
					value = PropTypesModule.GradientProp.decode(Buffer17)
				}
			elseif Tag == 18 then
				local Buffer18
				Buffer18, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "typography_prop",
					value = PropTypesModule.TypographyProp.decode(Buffer18)
				}
			elseif Tag == 19 then
				local Buffer19
				Buffer19, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "typography_font_prop",
					value = PropTypesModule.TypographyFontProp.decode(Buffer19)
				}
			elseif Tag == 20 then
				local Buffer20
				Buffer20, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "udim_prop",
					value = PropTypesModule.UDimProp.decode(Buffer20)
				}
			elseif Tag == 21 then
				local Buffer21
				Buffer21, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "udim2_prop",
					value = PropTypesModule.UDim2Prop.decode(Buffer21)
				}
			elseif Tag == 22 then
				local Buffer22
				Buffer22, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "vector2_prop",
					value = PropTypesModule.Vector2Prop.decode(Buffer22)
				}
			elseif Tag == 23 then
				local Buffer23
				Buffer23, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "ui_scaled_float_prop",
					value = PropTypesModule.UiScaledFloatProp.decode(Buffer23)
				}
			elseif Tag == 24 then
				local Buffer24
				Buffer24, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "ui_scaled_udim_prop",
					value = PropTypesModule.UiScaledUDimProp.decode(Buffer24)
				}
			elseif Tag == 25 then
				local Buffer25
				Buffer25, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "ui_scaled_udim2_prop",
					value = PropTypesModule.UiScaledUDim2Prop.decode(Buffer25)
				}
			elseif Tag == 26 then
				local Buffer26
				Buffer26, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "fill_behavior_prop",
					value = PropTypesModule.FillBehaviorProp.decode(Buffer26)
				}
			elseif Tag == 27 then
				local Buffer27
				Buffer27, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "input_size_prop",
					value = PropTypesModule.InputSizeProp.decode(Buffer27)
				}
			elseif Tag == 28 then
				local Buffer28
				Buffer28, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "automatic_size_prop",
					value = PropTypesEngineModule.AutomaticSizeProp.decode(Buffer28)
				}
			elseif Tag == 29 then
				local Buffer29
				Buffer29, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "text_truncate_prop",
					value = PropTypesEngineModule.TextTruncateProp.decode(Buffer29)
				}
			elseif Tag == 30 then
				local Buffer30
				Buffer30, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "text_x_alignment_prop",
					value = PropTypesEngineModule.TextXAlignmentProp.decode(Buffer30)
				}
			elseif Tag == 31 then
				local Buffer31
				Buffer31, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "text_y_alignment_prop",
					value = PropTypesEngineModule.TextYAlignmentProp.decode(Buffer31)
				}
			elseif Tag == 32 then
				local Buffer32
				Buffer32, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "ui_flex_mode_prop",
					value = PropTypesEngineModule.UIFlexModeProp.decode(Buffer32)
				}
			elseif Tag == 33 then
				local Buffer33
				Buffer33, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "scale_type_prop",
					value = PropTypesEngineModule.ScaleTypeProp.decode(Buffer33)
				}
			elseif Tag == 34 then
				local Buffer34
				Buffer34, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "resampler_mode_prop",
					value = PropTypesEngineModule.ResamplerModeProp.decode(Buffer34)
				}
			elseif Tag == 35 then
				local Buffer35
				Buffer35, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "size_constraint_prop",
					value = PropTypesEngineModule.SizeConstraintProp.decode(Buffer35)
				}
			elseif Tag == 36 then
				local Buffer36
				Buffer36, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "selection_behavior_prop",
					value = PropTypesEngineModule.SelectionBehaviorProp.decode(Buffer36)
				}
			elseif Tag == 37 then
				local Buffer37
				Buffer37, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.oneof_prop = {
					type = "key_code_prop",
					value = PropTypesEngineModule.KeyCodeProp.decode(Buffer37)
				}
			elseif Tag == 1000 then
				local Buffer38
				Buffer38, v122 = ProtoModule.readBuffer(Buf, v1)
				NewModule.prop_builder = buffer.tostring(Buffer38)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v122 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v122 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.prop_builder ~= nil then
		t.propBuilder = self.prop_builder
	end
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			t.stringProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "int32_prop" then
			t.int32Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "int64_prop" then
			t.int64Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "float_prop" then
			t.floatProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "double_prop" then
			t.doubleProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "bool_prop" then
			t.boolProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "struct_prop" then
			t.structProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "array_of_struct_prop" then
			t.arrayOfStructProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "string_array_prop" then
			t.stringArrayProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "image_string_prop" then
			t.imageStringProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "image_set_prop" then
			t.imageSetProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "icon_prop" then
			t.iconProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "icon_size_prop" then
			t.iconSizeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "foundation_icon_config_prop" then
			t.foundationIconConfigProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "color_prop" then
			t.colorProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "color_style_prop" then
			t.colorStyleProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "gradient_prop" then
			t.gradientProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "typography_prop" then
			t.typographyProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "typography_font_prop" then
			t.typographyFontProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "udim_prop" then
			t.udimProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "udim2_prop" then
			t.udim2Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "vector2_prop" then
			t.vector2Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "ui_scaled_float_prop" then
			t.uiScaledFloatProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "ui_scaled_udim_prop" then
			t.uiScaledUdimProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "ui_scaled_udim2_prop" then
			t.uiScaledUdim2Prop = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "fill_behavior_prop" then
			t.fillBehaviorProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "input_size_prop" then
			t.inputSizeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "automatic_size_prop" then
			t.automaticSizeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "text_truncate_prop" then
			t.textTruncateProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "text_x_alignment_prop" then
			t.textXAlignmentProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "text_y_alignment_prop" then
			t.textYAlignmentProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "ui_flex_mode_prop" then
			t.uiFlexModeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "scale_type_prop" then
			t.scaleTypeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "resampler_mode_prop" then
			t.resamplerModeProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "size_constraint_prop" then
			t.sizeConstraintProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "selection_behavior_prop" then
			t.selectionBehaviorProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "key_code_prop" then
			t.keyCodeProp = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), PropTypesModule (copy), PropTypesEngineModule (copy)
	local NewModule = Module.new()
	
	if self.prop_builder ~= nil then
		NewModule.prop_builder = self.prop_builder
	end
	if self.propBuilder ~= nil then
		NewModule.prop_builder = self.propBuilder
	end
	if self.string_prop ~= nil then
		NewModule.oneof_prop = {
			type = "string_prop",
			value = PropTypesModule.StringProp.jsonDecode(self.string_prop)
		}
	end
	if self.stringProp ~= nil then
		NewModule.oneof_prop = {
			type = "string_prop",
			value = PropTypesModule.StringProp.jsonDecode(self.stringProp)
		}
	end
	if self.int32_prop ~= nil then
		NewModule.oneof_prop = {
			type = "int32_prop",
			value = PropTypesModule.Int32Prop.jsonDecode(self.int32_prop)
		}
	end
	if self.int32Prop ~= nil then
		NewModule.oneof_prop = {
			type = "int32_prop",
			value = PropTypesModule.Int32Prop.jsonDecode(self.int32Prop)
		}
	end
	if self.int64_prop ~= nil then
		NewModule.oneof_prop = {
			type = "int64_prop",
			value = PropTypesModule.Int64Prop.jsonDecode(self.int64_prop)
		}
	end
	if self.int64Prop ~= nil then
		NewModule.oneof_prop = {
			type = "int64_prop",
			value = PropTypesModule.Int64Prop.jsonDecode(self.int64Prop)
		}
	end
	if self.float_prop ~= nil then
		NewModule.oneof_prop = {
			type = "float_prop",
			value = PropTypesModule.FloatProp.jsonDecode(self.float_prop)
		}
	end
	if self.floatProp ~= nil then
		NewModule.oneof_prop = {
			type = "float_prop",
			value = PropTypesModule.FloatProp.jsonDecode(self.floatProp)
		}
	end
	if self.double_prop ~= nil then
		NewModule.oneof_prop = {
			type = "double_prop",
			value = PropTypesModule.DoubleProp.jsonDecode(self.double_prop)
		}
	end
	if self.doubleProp ~= nil then
		NewModule.oneof_prop = {
			type = "double_prop",
			value = PropTypesModule.DoubleProp.jsonDecode(self.doubleProp)
		}
	end
	if self.bool_prop ~= nil then
		NewModule.oneof_prop = {
			type = "bool_prop",
			value = PropTypesModule.BoolProp.jsonDecode(self.bool_prop)
		}
	end
	if self.boolProp ~= nil then
		NewModule.oneof_prop = {
			type = "bool_prop",
			value = PropTypesModule.BoolProp.jsonDecode(self.boolProp)
		}
	end
	if self.struct_prop ~= nil then
		NewModule.oneof_prop = {
			type = "struct_prop",
			value = PropTypesModule.StructProp.jsonDecode(self.struct_prop)
		}
	end
	if self.structProp ~= nil then
		NewModule.oneof_prop = {
			type = "struct_prop",
			value = PropTypesModule.StructProp.jsonDecode(self.structProp)
		}
	end
	if self.array_of_struct_prop ~= nil then
		NewModule.oneof_prop = {
			type = "array_of_struct_prop",
			value = PropTypesModule.ArrayOfStructProp.jsonDecode(self.array_of_struct_prop)
		}
	end
	if self.arrayOfStructProp ~= nil then
		NewModule.oneof_prop = {
			type = "array_of_struct_prop",
			value = PropTypesModule.ArrayOfStructProp.jsonDecode(self.arrayOfStructProp)
		}
	end
	if self.string_array_prop ~= nil then
		NewModule.oneof_prop = {
			type = "string_array_prop",
			value = PropTypesModule.StringArrayProp.jsonDecode(self.string_array_prop)
		}
	end
	if self.stringArrayProp ~= nil then
		NewModule.oneof_prop = {
			type = "string_array_prop",
			value = PropTypesModule.StringArrayProp.jsonDecode(self.stringArrayProp)
		}
	end
	if self.image_string_prop ~= nil then
		NewModule.oneof_prop = {
			type = "image_string_prop",
			value = PropTypesModule.ImageStringProp.jsonDecode(self.image_string_prop)
		}
	end
	if self.imageStringProp ~= nil then
		NewModule.oneof_prop = {
			type = "image_string_prop",
			value = PropTypesModule.ImageStringProp.jsonDecode(self.imageStringProp)
		}
	end
	if self.image_set_prop ~= nil then
		NewModule.oneof_prop = {
			type = "image_set_prop",
			value = PropTypesModule.ImageSetProp.jsonDecode(self.image_set_prop)
		}
	end
	if self.imageSetProp ~= nil then
		NewModule.oneof_prop = {
			type = "image_set_prop",
			value = PropTypesModule.ImageSetProp.jsonDecode(self.imageSetProp)
		}
	end
	if self.icon_prop ~= nil then
		NewModule.oneof_prop = {
			type = "icon_prop",
			value = PropTypesModule.IconProp.jsonDecode(self.icon_prop)
		}
	end
	if self.iconProp ~= nil then
		NewModule.oneof_prop = {
			type = "icon_prop",
			value = PropTypesModule.IconProp.jsonDecode(self.iconProp)
		}
	end
	if self.icon_size_prop ~= nil then
		NewModule.oneof_prop = {
			type = "icon_size_prop",
			value = PropTypesModule.IconSizeProp.jsonDecode(self.icon_size_prop)
		}
	end
	if self.iconSizeProp ~= nil then
		NewModule.oneof_prop = {
			type = "icon_size_prop",
			value = PropTypesModule.IconSizeProp.jsonDecode(self.iconSizeProp)
		}
	end
	if self.foundation_icon_config_prop ~= nil then
		NewModule.oneof_prop = {
			type = "foundation_icon_config_prop",
			value = PropTypesModule.FoundationIconConfigProp.jsonDecode(self.foundation_icon_config_prop)
		}
	end
	if self.foundationIconConfigProp ~= nil then
		NewModule.oneof_prop = {
			type = "foundation_icon_config_prop",
			value = PropTypesModule.FoundationIconConfigProp.jsonDecode(self.foundationIconConfigProp)
		}
	end
	if self.color_prop ~= nil then
		NewModule.oneof_prop = {
			type = "color_prop",
			value = PropTypesModule.ColorProp.jsonDecode(self.color_prop)
		}
	end
	if self.colorProp ~= nil then
		NewModule.oneof_prop = {
			type = "color_prop",
			value = PropTypesModule.ColorProp.jsonDecode(self.colorProp)
		}
	end
	if self.color_style_prop ~= nil then
		NewModule.oneof_prop = {
			type = "color_style_prop",
			value = PropTypesModule.ColorStyleProp.jsonDecode(self.color_style_prop)
		}
	end
	if self.colorStyleProp ~= nil then
		NewModule.oneof_prop = {
			type = "color_style_prop",
			value = PropTypesModule.ColorStyleProp.jsonDecode(self.colorStyleProp)
		}
	end
	if self.gradient_prop ~= nil then
		NewModule.oneof_prop = {
			type = "gradient_prop",
			value = PropTypesModule.GradientProp.jsonDecode(self.gradient_prop)
		}
	end
	if self.gradientProp ~= nil then
		NewModule.oneof_prop = {
			type = "gradient_prop",
			value = PropTypesModule.GradientProp.jsonDecode(self.gradientProp)
		}
	end
	if self.typography_prop ~= nil then
		NewModule.oneof_prop = {
			type = "typography_prop",
			value = PropTypesModule.TypographyProp.jsonDecode(self.typography_prop)
		}
	end
	if self.typographyProp ~= nil then
		NewModule.oneof_prop = {
			type = "typography_prop",
			value = PropTypesModule.TypographyProp.jsonDecode(self.typographyProp)
		}
	end
	if self.typography_font_prop ~= nil then
		NewModule.oneof_prop = {
			type = "typography_font_prop",
			value = PropTypesModule.TypographyFontProp.jsonDecode(self.typography_font_prop)
		}
	end
	if self.typographyFontProp ~= nil then
		NewModule.oneof_prop = {
			type = "typography_font_prop",
			value = PropTypesModule.TypographyFontProp.jsonDecode(self.typographyFontProp)
		}
	end
	if self.udim_prop ~= nil then
		NewModule.oneof_prop = {
			type = "udim_prop",
			value = PropTypesModule.UDimProp.jsonDecode(self.udim_prop)
		}
	end
	if self.udimProp ~= nil then
		NewModule.oneof_prop = {
			type = "udim_prop",
			value = PropTypesModule.UDimProp.jsonDecode(self.udimProp)
		}
	end
	if self.udim2_prop ~= nil then
		NewModule.oneof_prop = {
			type = "udim2_prop",
			value = PropTypesModule.UDim2Prop.jsonDecode(self.udim2_prop)
		}
	end
	if self.udim2Prop ~= nil then
		NewModule.oneof_prop = {
			type = "udim2_prop",
			value = PropTypesModule.UDim2Prop.jsonDecode(self.udim2Prop)
		}
	end
	if self.vector2_prop ~= nil then
		NewModule.oneof_prop = {
			type = "vector2_prop",
			value = PropTypesModule.Vector2Prop.jsonDecode(self.vector2_prop)
		}
	end
	if self.vector2Prop ~= nil then
		NewModule.oneof_prop = {
			type = "vector2_prop",
			value = PropTypesModule.Vector2Prop.jsonDecode(self.vector2Prop)
		}
	end
	if self.ui_scaled_float_prop ~= nil then
		NewModule.oneof_prop = {
			type = "ui_scaled_float_prop",
			value = PropTypesModule.UiScaledFloatProp.jsonDecode(self.ui_scaled_float_prop)
		}
	end
	if self.uiScaledFloatProp ~= nil then
		NewModule.oneof_prop = {
			type = "ui_scaled_float_prop",
			value = PropTypesModule.UiScaledFloatProp.jsonDecode(self.uiScaledFloatProp)
		}
	end
	if self.ui_scaled_udim_prop ~= nil then
		NewModule.oneof_prop = {
			type = "ui_scaled_udim_prop",
			value = PropTypesModule.UiScaledUDimProp.jsonDecode(self.ui_scaled_udim_prop)
		}
	end
	if self.uiScaledUdimProp ~= nil then
		NewModule.oneof_prop = {
			type = "ui_scaled_udim_prop",
			value = PropTypesModule.UiScaledUDimProp.jsonDecode(self.uiScaledUdimProp)
		}
	end
	if self.ui_scaled_udim2_prop ~= nil then
		NewModule.oneof_prop = {
			type = "ui_scaled_udim2_prop",
			value = PropTypesModule.UiScaledUDim2Prop.jsonDecode(self.ui_scaled_udim2_prop)
		}
	end
	if self.uiScaledUdim2Prop ~= nil then
		NewModule.oneof_prop = {
			type = "ui_scaled_udim2_prop",
			value = PropTypesModule.UiScaledUDim2Prop.jsonDecode(self.uiScaledUdim2Prop)
		}
	end
	if self.fill_behavior_prop ~= nil then
		NewModule.oneof_prop = {
			type = "fill_behavior_prop",
			value = PropTypesModule.FillBehaviorProp.jsonDecode(self.fill_behavior_prop)
		}
	end
	if self.fillBehaviorProp ~= nil then
		NewModule.oneof_prop = {
			type = "fill_behavior_prop",
			value = PropTypesModule.FillBehaviorProp.jsonDecode(self.fillBehaviorProp)
		}
	end
	if self.input_size_prop ~= nil then
		NewModule.oneof_prop = {
			type = "input_size_prop",
			value = PropTypesModule.InputSizeProp.jsonDecode(self.input_size_prop)
		}
	end
	if self.inputSizeProp ~= nil then
		NewModule.oneof_prop = {
			type = "input_size_prop",
			value = PropTypesModule.InputSizeProp.jsonDecode(self.inputSizeProp)
		}
	end
	if self.automatic_size_prop ~= nil then
		NewModule.oneof_prop = {
			type = "automatic_size_prop",
			value = PropTypesEngineModule.AutomaticSizeProp.jsonDecode(self.automatic_size_prop)
		}
	end
	if self.automaticSizeProp ~= nil then
		NewModule.oneof_prop = {
			type = "automatic_size_prop",
			value = PropTypesEngineModule.AutomaticSizeProp.jsonDecode(self.automaticSizeProp)
		}
	end
	if self.text_truncate_prop ~= nil then
		NewModule.oneof_prop = {
			type = "text_truncate_prop",
			value = PropTypesEngineModule.TextTruncateProp.jsonDecode(self.text_truncate_prop)
		}
	end
	if self.textTruncateProp ~= nil then
		NewModule.oneof_prop = {
			type = "text_truncate_prop",
			value = PropTypesEngineModule.TextTruncateProp.jsonDecode(self.textTruncateProp)
		}
	end
	if self.text_x_alignment_prop ~= nil then
		NewModule.oneof_prop = {
			type = "text_x_alignment_prop",
			value = PropTypesEngineModule.TextXAlignmentProp.jsonDecode(self.text_x_alignment_prop)
		}
	end
	if self.textXAlignmentProp ~= nil then
		NewModule.oneof_prop = {
			type = "text_x_alignment_prop",
			value = PropTypesEngineModule.TextXAlignmentProp.jsonDecode(self.textXAlignmentProp)
		}
	end
	if self.text_y_alignment_prop ~= nil then
		NewModule.oneof_prop = {
			type = "text_y_alignment_prop",
			value = PropTypesEngineModule.TextYAlignmentProp.jsonDecode(self.text_y_alignment_prop)
		}
	end
	if self.textYAlignmentProp ~= nil then
		NewModule.oneof_prop = {
			type = "text_y_alignment_prop",
			value = PropTypesEngineModule.TextYAlignmentProp.jsonDecode(self.textYAlignmentProp)
		}
	end
	if self.ui_flex_mode_prop ~= nil then
		NewModule.oneof_prop = {
			type = "ui_flex_mode_prop",
			value = PropTypesEngineModule.UIFlexModeProp.jsonDecode(self.ui_flex_mode_prop)
		}
	end
	if self.uiFlexModeProp ~= nil then
		NewModule.oneof_prop = {
			type = "ui_flex_mode_prop",
			value = PropTypesEngineModule.UIFlexModeProp.jsonDecode(self.uiFlexModeProp)
		}
	end
	if self.scale_type_prop ~= nil then
		NewModule.oneof_prop = {
			type = "scale_type_prop",
			value = PropTypesEngineModule.ScaleTypeProp.jsonDecode(self.scale_type_prop)
		}
	end
	if self.scaleTypeProp ~= nil then
		NewModule.oneof_prop = {
			type = "scale_type_prop",
			value = PropTypesEngineModule.ScaleTypeProp.jsonDecode(self.scaleTypeProp)
		}
	end
	if self.resampler_mode_prop ~= nil then
		NewModule.oneof_prop = {
			type = "resampler_mode_prop",
			value = PropTypesEngineModule.ResamplerModeProp.jsonDecode(self.resampler_mode_prop)
		}
	end
	if self.resamplerModeProp ~= nil then
		NewModule.oneof_prop = {
			type = "resampler_mode_prop",
			value = PropTypesEngineModule.ResamplerModeProp.jsonDecode(self.resamplerModeProp)
		}
	end
	if self.size_constraint_prop ~= nil then
		NewModule.oneof_prop = {
			type = "size_constraint_prop",
			value = PropTypesEngineModule.SizeConstraintProp.jsonDecode(self.size_constraint_prop)
		}
	end
	if self.sizeConstraintProp ~= nil then
		NewModule.oneof_prop = {
			type = "size_constraint_prop",
			value = PropTypesEngineModule.SizeConstraintProp.jsonDecode(self.sizeConstraintProp)
		}
	end
	if self.selection_behavior_prop ~= nil then
		NewModule.oneof_prop = {
			type = "selection_behavior_prop",
			value = PropTypesEngineModule.SelectionBehaviorProp.jsonDecode(self.selection_behavior_prop)
		}
	end
	if self.selectionBehaviorProp ~= nil then
		NewModule.oneof_prop = {
			type = "selection_behavior_prop",
			value = PropTypesEngineModule.SelectionBehaviorProp.jsonDecode(self.selectionBehaviorProp)
		}
	end
	if self.key_code_prop ~= nil then
		NewModule.oneof_prop = {
			type = "key_code_prop",
			value = PropTypesEngineModule.KeyCodeProp.jsonDecode(self.key_code_prop)
		}
	end
	if self.keyCodeProp ~= nil then
		NewModule.oneof_prop = {
			type = "key_code_prop",
			value = PropTypesEngineModule.KeyCodeProp.jsonDecode(self.keyCodeProp)
		}
	end
	return NewModule
end

Module.descriptor = {
	name = "ExperimentalProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperimentalProp"
}
local config = { ExperimentalProp = Module }
TypeRegistryModule.default:register(config.ExperimentalProp)

return { ExperimentalProp = config.ExperimentalProp }