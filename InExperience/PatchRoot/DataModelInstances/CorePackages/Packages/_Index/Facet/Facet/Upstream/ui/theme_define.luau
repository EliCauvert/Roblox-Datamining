local _ = require("./theme_types")
local ThemeSupportModule = require("./theme_support")
local ThemeFinishModule = require("./theme_finish")
local Frozen = table.freeze({
	"udim",
	"udim2",
	"vector2",
	"colorSequence",
	"numberSequence"
})
local _ = ThemeSupportModule.copy
local MergeFunction = ThemeSupportModule.merge
local FrozenFunction = ThemeSupportModule.frozen
local ShadowPresets = ThemeSupportModule.shadowPresets
local Easing = require("../vendor/compose/core").easing
local config = {
	Linear = true,
	Sine = true,
	Back = true,
	Quad = true,
	Quart = true,
	Quint = true,
	Bounce = true,
	Elastic = true,
	Exponential = true,
	Circular = true,
	Cubic = true
}
local config1 = {
	strong = { base = "body", weight = "SemiBold" },
	numeral = { base = "control", weight = "Bold" }
}

local function _(p1: number): number
	return if p1 <= 0.04045 then p1 / 12.92 else ((p1 + 0.055) / 1.055) ^ 2.4
end

local _ = function(p1): number
	local R: number = p1.r
	local G: number = p1.g
	local v1 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B: number = p1.b
	
	return v1 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722
end

local _ = function(p1): string
	local Surface = p1.surface
	local R: number = Surface.r
	local G: number = Surface.g
	local v1 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B: number = Surface.b
	local v2 = v1 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722
	local Content = p1.content
	local R1: number = Content.r
	local G1: number = Content.g
	local v3 = (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G1 <= 0.04045 then G1 / 12.92 else ((G1 + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B1: number = Content.b
	
	return if v2 < v3 + (if B1 <= 0.04045 then B1 / 12.92 else ((B1 + 0.055) / 1.055) ^ 2.4) * 0.0722 then "dark" else "light"
end

local function isColor(Control): boolean
	if type(Control) ~= "table" then
		return false
	end
	for _, value in { "r", "g", "b" } do
		local ControlEntry: number = Control[value]
		
		if type(ControlEntry) ~= "number" or ControlEntry < 0 or ControlEntry > 1 then
			return false
		end
	end
	return true
end

local _ = function(p1, p2): number
	local R: number = p2.r
	local G: number = p2.g
	local v1 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B: number = p2.b
	local R1: number = p1.r
	local G1: number = p1.g
	local v2 = (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G1 <= 0.04045 then G1 / 12.92 else ((G1 + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B1: number = p1.b
	
	return (v1 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722 + 0.05) / (v2 + (if B1 <= 0.04045 then B1 / 12.92 else ((B1 + 0.055) / 1.055) ^ 2.4) * 0.0722 + 0.05)
end

local function shade(Control, Hover)
	local R: number = Control.r
	local G: number = Control.g
	local v1 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B: number = Control.b
	local v2 = v1 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722
	local ClampedValue = math.clamp((v2 + 0.05) * Hover - 0.05, 0, 1)
	local ClampedValues = {}
	
	for i, value in { Control.r, Control.g, Control.b } do
		ClampedValues[i] = math.clamp(if v2 > 0 then (if value <= 0.04045 then value / 12.92 else ((value + 0.055) / 1.055) ^ 2.4) * ClampedValue / v2 else ClampedValue, 0, 1)
	end
	local NewClampedValue = ClampedValues[1] * 0.2126 + ClampedValues[2] * 0.7152 + ClampedValues[3] * 0.0722
	local ClampedValueRatio: number = if NewClampedValue < ClampedValue then (ClampedValue - NewClampedValue) / (1 - NewClampedValue) else 0
	
	local function _(p1: number): number
		-- upvalues: ClampedValueRatio (copy)
		local NewClampedValueRatio = p1 + (1 - p1) * ClampedValueRatio
		
		return if NewClampedValueRatio <= 0.0031308 then NewClampedValueRatio * 12.92 else NewClampedValueRatio ^ 0.4166666666666667 * 1.055 - 0.055
	end
	
	local ClampedValue1: number = ClampedValues[1]
	local NewClampedValue1 = ClampedValue1 + (1 - ClampedValue1) * ClampedValueRatio
	local ClampedValue2: number = ClampedValues[2]
	local NewClampedValue11 = ClampedValue2 + (1 - ClampedValue2) * ClampedValueRatio
	local ScaledNewClampedValue = if NewClampedValue11 <= 0.0031308 then NewClampedValue11 * 12.92 else NewClampedValue11 ^ 0.4166666666666667 * 1.055 - 0.055
	local ClampedValue3: number = ClampedValues[3]
	local NewClampedValue2 = ClampedValue3 + (1 - ClampedValue3) * ClampedValueRatio
	
	return {
		r = if NewClampedValue1 <= 0.0031308 then NewClampedValue1 * 12.92 else NewClampedValue1 ^ 0.4166666666666667 * 1.055 - 0.055,
		g = ScaledNewClampedValue,
		b = if NewClampedValue2 <= 0.0031308 then NewClampedValue2 * 12.92 else NewClampedValue2 ^ 0.4166666666666667 * 1.055 - 0.055
	}
end

local function checkCoverage(p1, List)
	local Missing = {}
	local Covered = {}
	
	for _, value in List do
		local v3 = p1
		
		for i in string.gmatch(value.section or "metrics", "[^.]+") do
			if type(v3) == "table" then
				v3 = v3[i]
			else
				v3 = nil
			end
		end
		local IsNotNumber = true
		
		if value.kind == "color" then
			for _, theme in p1.style.themes do
				if (theme.colors or {})[value.name] == nil and (theme.extra or {})[value.name] == nil then
					IsNotNumber = false
				end
			end
		else
			local v4 = if type(v3) == "table" then v3[value.name] else nil
			IsNotNumber = v4 ~= nil and (value.kind ~= "number" or type(v4) == "number")
			local Fields = value.fields or {}
			for _, field in Fields do
				if type(v4) ~= "table" or type(v4[field]) ~= "number" then
					IsNotNumber = false
				end
			end
		end
		if IsNotNumber then
			table.insert(Covered, value.name)
		else
			table.insert(Missing, {
				name = value.name,
				message = "Theme has no " .. value.name,
				fix = "Declare " .. (value.section or "metrics") .. "." .. value.name
			})
		end
	end
	return { ok = #Missing == 0, missing = Missing, covered = Covered }
end

local list = {
	{
		role = "numeral",
		minimum = 1.6,
		message = "numeral is %g px, %.2f times body (%g px), so deciding values read as body text. Give numeral 1.6 times body or more"
	},
	{
		role = "title",
		minimum = 1.6,
		message = "title is %g px, %.2f times body (%g px), so a screen has no clear lead. Give title 1.6 times body or more"
	},
	{
		role = "heading",
		minimum = 1.2,
		message = "heading is %g px, %.2f times body (%g px), so groups do not separate. Give heading 1.2 times body or more"
	},
	{
		role = "caption",
		maximum = 0.95,
		message = "caption is %g px, %.2f times body (%g px), so labels compete with values. Make caption smaller than body"
	}
}

return function(p2, Schema, p3)
	-- upvalues: MergeFunction (copy), ThemeFinishModule (copy), config1 (copy), ThemeSupportModule (copy), Easing (copy), config (copy), Frozen (copy), ShadowPresets (copy), isColor (copy), shade (copy), list (copy), FrozenFunction (copy), checkCoverage (copy)
	local t = {}
	
	for _, theme in p2.style.themes do
		local Extra = theme.extra or {}
		local Control = Extra.control
		local ControlHover = Extra.controlHover
		local ControlPressed = Extra.controlPressed
		local Colors = theme.colors
		local Surface = Colors.surface
		local R: number = Surface.r
		local G: number = Surface.g
		local v5 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
		local B: number = Surface.b
		local v6 = v5 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722
		local Content = Colors.content
		local R1: number = Content.r
		local G1: number = Content.g
		local v7 = (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G1 <= 0.04045 then G1 / 12.92 else ((G1 + 0.055) / 1.055) ^ 2.4) * 0.7152
		local B1: number = Content.b
		local BRatio = if B1 <= 0.04045 then B1 / 12.92 else ((B1 + 0.055) / 1.055) ^ 2.4
		local Dark: string = if v6 < v7 + BRatio * 0.0722 then "dark" else "light"
		
		if Control and ControlHover and ControlPressed and t[Dark] == nil then
			local R2: number = ControlHover.r
			local G2: number = ControlHover.g
			local v8 = (if R2 <= 0.04045 then R2 / 12.92 else ((R2 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G2 <= 0.04045 then G2 / 12.92 else ((G2 + 0.055) / 1.055) ^ 2.4) * 0.7152
			local B2: number = ControlHover.b
			local v9 = v8 + (if B2 <= 0.04045 then B2 / 12.92 else ((B2 + 0.055) / 1.055) ^ 2.4) * 0.0722 + 0.05
			local R3: number = Control.r
			local G3: number = Control.g
			local v10 = (if R3 <= 0.04045 then R3 / 12.92 else ((R3 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G3 <= 0.04045 then G3 / 12.92 else ((G3 + 0.055) / 1.055) ^ 2.4) * 0.7152
			local B3: number = Control.b
			local BRatio1 = if B3 <= 0.04045 then B3 / 12.92 else ((B3 + 0.055) / 1.055) ^ 2.4
			local R4: number = ControlPressed.r
			local G4: number = ControlPressed.g
			local v11 = (if R4 <= 0.04045 then R4 / 12.92 else ((R4 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G4 <= 0.04045 then G4 / 12.92 else ((G4 + 0.055) / 1.055) ^ 2.4) * 0.7152
			local B4: number = ControlPressed.b
			local R5: number = Control.r
			local G5: number = Control.g
			local v12 = (if R5 <= 0.04045 then R5 / 12.92 else ((R5 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G5 <= 0.04045 then G5 / 12.92 else ((G5 + 0.055) / 1.055) ^ 2.4) * 0.7152
			local B11: number = Control.b
			t[Dark] = {
				hover = v9 / (v10 + BRatio1 * 0.0722 + 0.05),
				pressed = (v11 + (if B4 <= 0.04045 then B4 / 12.92 else ((B4 + 0.055) / 1.055) ^ 2.4) * 0.0722 + 0.05) / (v12 + (if B11 <= 0.04045 then B11 / 12.92 else ((B11 + 0.055) / 1.055) ^ 2.4) * 0.0722 + 0.05)
			}
		end
	end
	return {
		define = function(Key)
			-- upvalues: p2 (copy), MergeFunction (upval), ThemeFinishModule (upval), config1 (upval), p3 (copy), ThemeSupportModule (upval), Easing (upval), config (upval), Frozen (upval), ShadowPresets (upval), Schema (copy), isColor (upval), t (copy), shade (upval), list (upval), FrozenFunction (upval)
			local List1 = {}
			local t1 = {}
			
			local function validate(Callback: number, Field)
				-- upvalues: List1 (copy), t1 (copy), validate (copy)
				if type(Callback) == "number" and (Callback ~= Callback or math.abs(Callback) == 1e999) then
					table.insert(List1, { message = "Theme numbers must be finite", field = Field })
					
					return
				end
				if type(Callback) == "function" then
					table.insert(List1, {
						message = "Theme packages contain data, not callbacks",
						field = Field
					})
					
					return
				end
				if type(Callback) == "table" then
					if t1[Callback] then
						table.insert(List1, {
							message = "Theme packages cannot contain cycles",
							field = Field
						})
						
						return
					end
					t1[Callback] = true
					
					for i, value in Callback do
						validate(value, Field .. "." .. tostring(i))
					end
					t1[Callback] = nil
				end
			end
			
			if type(Key) ~= "table" then
				return nil, {
					ok = false,
					errors = {
						{
							field = "package",
							message = "Expected a package definition"
						}
					},
					missing = {},
					contrast = {},
					advice = {}
				}
			end
			if Key.base ~= nil and type(Key.base) ~= "table" then
				table.insert(List1, { field = "base", message = "Theme base must be a package" })
			end
			validate(Key, "package")
			
			if #List1 > 0 then
				return nil, {
					ok = false,
					errors = List1,
					missing = {},
					contrast = {},
					advice = {}
				}
			end
			local Base = Key.base or p2
			
			if type(Base.style) == "table" and type(Base.style.themes) == "table" and #Base.style.themes > 1 then
				Base = table.clone(Base)
				Base.style = table.clone(Base.style)
				Base.style.themes = { Base.style.themes[1] }
			end
			local MergeResult = MergeFunction(Base, Key)
			
			if type(MergeResult.identity) ~= "table" or type(MergeResult.identity.id) ~= "string" then
				table.insert(List1, {
					field = "identity.id",
					message = "A theme package needs an identity"
				})
			end
			if type(MergeResult.style) ~= "table" or type(MergeResult.style.themes) ~= "table" or #MergeResult.style.themes == 0 then
				table.insert(List1, {
					field = "style.themes",
					message = "A theme package needs at least one palette"
				})
			end
			if #List1 > 0 then
				return nil, {
					ok = false,
					errors = List1,
					missing = {},
					contrast = {},
					advice = {}
				}
			end
			local Finish = Key.finish
			MergeResult.finish = nil
			local t2 = {}
			
			if Finish ~= nil then
				local ApplyResult, ApplyResult2 = ThemeFinishModule.apply(MergeResult, Finish)
				
				for _, value2 in ApplyResult do
					table.insert(List1, value2)
				end
				t2 = ApplyResult2
			end
			local Typography = MergeResult.metrics.typography
			local Metrics = Key.metrics
			local Typography1 = if type(Metrics) == "table" and type(Metrics.typography) == "table" then Metrics.typography else {}
			for i2, value3 in config1 do
				local TypographyEntry = Typography[value3.base]
				
				if Typography1[i2] == nil and Typography1[value3.base] ~= nil and type(TypographyEntry) == "table" and type(TypographyEntry.font) == "table" then
					local TypographyEntryFont = TypographyEntry.font
					Typography[i2] = {
						size = TypographyEntry.size,
						lineHeight = TypographyEntry.lineHeight,
						font = {
							family = TypographyEntryFont.family,
							weight = value3.weight,
							style = TypographyEntryFont.style
						}
					}
				end
			end
			for _, value6 in p3 do
				local TypographyEntry = Typography[value6]
				local Size = if type(TypographyEntry) == "table" then TypographyEntry.size else nil
				
				if TypographyEntry ~= nil and (type(Size) ~= "number" or Size <= 0) then
					table.insert(List1, {
						message = "Type roles require a positive size",
						field = "metrics.typography." .. value6
					})
				end
			end
			local Largest = math.max(p2.metrics.controls.typography.minimumSize, ThemeSupportModule.numericMetric(MergeResult.metrics, "controls.typography.minimumSize") or 0)
			local List2 = {}
			
			for _, value9 in MergeResult.metrics.typography do
				if type(value9) == "table" and type(value9.size) == "number" and value9.size > 0 and not table.find(List2, value9.size) then
					table.insert(List2, value9.size)
				end
			end
			table.sort(List2)
			local Largests = {}
			local LargestDelta = Largest - 1
			
			for _, value10 in List2 do
				local Largest1 = math.max(value10, LargestDelta + 1)
				Largests[value10] = Largest1
				LargestDelta = Largest1
			end
			for _, value11 in MergeResult.metrics.typography do
				if type(value11) == "table" and type(value11.size) == "number" and Largests[value11.size] then
					value11.size = Largests[value11.size]
				end
			end
			local Space = MergeResult.metrics.space
			
			if type(Space) == "table" then
				for i6, value8 in Space do
					if type(i6) ~= "string" or type(value8) ~= "number" or value8 < 0 then
						table.insert(List1, {
							message = "Spacing steps require a pixel size of 0 or more",
							field = "metrics.space." .. tostring(i6)
						})
					end
				end
			else
				table.insert(List1, {
					field = "metrics.space",
					message = "Spacing steps must be a table of pixel sizes"
				})
			end
			local ControlSizes = MergeResult.metrics.controlSizes
			local Xsmall = if type(ControlSizes) == "table" then ControlSizes.xsmall else nil
			
			if Xsmall ~= nil then
				for _, value12 in { "height", "paddingX", "iconSize" } do
					local XsmallEntry = if type(Xsmall) == "table" then Xsmall[value12] else nil
					
					if type(XsmallEntry) ~= "number" or XsmallEntry < 0 then
						table.insert(List1, {
							message = "The xsmall rung needs a height, a paddingX and an iconSize of 0 or more",
							field = "metrics.controlSizes.xsmall." .. value12
						})
					end
				end
			end
			local TargetSizes = MergeResult.metrics.targetSizes
			local TargetSizes1 = if type(TargetSizes) == "table" then TargetSizes else {}
			local Minimum = TargetSizes1.minimum
			
			for _, value5 in { "pointer", "inline" } do
				local TargetSize: number = TargetSizes1[value5]
				
				if TargetSize ~= nil and (type(TargetSize) ~= "number" or TargetSize < 24 or type(Minimum) == "number" and Minimum < TargetSize) then
					table.insert(List1, {
						field = "metrics.targetSizes." .. value5,
						message = `targetSizes.{value5} must be from 24 to targetSizes.minimum`
					})
				end
			end
			for _, value13 in { "thumb", "thumbLarge" } do
				local TargetSize = TargetSizes1[value13]
				
				if TargetSize ~= nil and (type(TargetSize) ~= "number" or type(Minimum) == "number" and TargetSize < Minimum) then
					table.insert(List1, {
						field = "metrics.targetSizes." .. value13,
						message = `targetSizes.{value13} must be a number of pixels, at least targetSizes.minimum`
					})
				end
			end
			local Motion = MergeResult.metrics.motion
			
			if type(Motion) == "table" then
				local function _(Text, Message)
					-- upvalues: List1 (copy)
					table.insert(List1, { field = "metrics.motion." .. Text, message = Message })
				end
				
				local _ = function(Text, p4, Text1, p5, Enabled)
					-- upvalues: List1 (copy)
					if type(p4) ~= "number" or p5 < p4 or p4 < Text1 or Enabled == true and p4 == Text1 then
						table.insert(List1, {
							field = "metrics.motion." .. Text,
							message = `must be a number from {Text1} to {p5}{if Enabled then ", above " .. Text1 else ""}`
						})
					end
				end
				
				local function each(Text, Callback: (any, any) -> ())
					-- upvalues: Motion (copy), List1 (copy)
					local MotionEntry = Motion[Text]
					
					if MotionEntry == nil then return end
					if type(MotionEntry) ~= "table" then
						table.insert(List1, {
							message = "must be a table",
							field = "metrics.motion." .. Text
						})
						
						return
					end
					for i, value in MotionEntry do
						Callback(Text .. "." .. tostring(i), value)
					end
				end
				
				for _, value14 in { "fast", "normal", "press", "hover" } do
					local NoMotionEntry = Motion[value14] == nil
					
					if not NoMotionEntry then
						local MotionEntry: number = Motion[value14]
						NoMotionEntry = type(MotionEntry) == "number" and MotionEntry <= 10 and MotionEntry >= 0
					end
					if not NoMotionEntry then
						table.insert(List1, {
							field = "metrics.motion." .. value14,
							message = `must be a number from {0} to {10}`
						})
					end
				end
				if Motion.reducedFade ~= nil then
					local ReducedFade: number = Motion.reducedFade
					
					if type(ReducedFade) ~= "number" or ReducedFade > 10 or ReducedFade < 0 or ReducedFade == 0 then
						table.insert(List1, {
							field = "metrics.motion.reducedFade",
							message = `must be a number from {0} to {10}{", above " .. 0}`
						})
					end
				end
				for _, value15 in { "revealFadeShare", "unfoldStart" } do
					local NoMotionEntry1 = Motion[value15] == nil
					
					if not NoMotionEntry1 then
						local MotionEntry: number = Motion[value15]
						NoMotionEntry1 = type(MotionEntry) == "number" and MotionEntry <= 1 and MotionEntry >= 0
					end
					if not NoMotionEntry1 then
						table.insert(List1, {
							field = "metrics.motion." .. value15,
							message = `must be a number from {0} to {1}`
						})
					end
				end
				if Motion.restLimit ~= nil then
					local RestLimit: number = Motion.restLimit
					
					if type(RestLimit) ~= "number" or RestLimit > 1 or RestLimit < 0 then
						table.insert(List1, {
							field = "metrics.motion.restLimit",
							message = `must be a number from {0} to {1}`
						})
					end
				end
				if Motion.frameLimit ~= nil then
					local FrameLimit: number = Motion.frameLimit
					
					if type(FrameLimit) ~= "number" or FrameLimit > 1 or FrameLimit < 0 then
						table.insert(List1, {
							field = "metrics.motion.frameLimit",
							message = `must be a number from {0} to {1}`
						})
					end
				end
				for _, value16 in { "presentFadeIn", "presentFadeOut" } do
					local NoMotionEntry2 = Motion[value16] == nil
					
					if not NoMotionEntry2 then
						local MotionEntry: number = Motion[value16]
						NoMotionEntry2 = type(MotionEntry) == "number" and MotionEntry <= 1 and MotionEntry >= 0 and MotionEntry ~= 0
					end
					if not NoMotionEntry2 then
						table.insert(List1, {
							field = "metrics.motion." .. value16,
							message = `must be a number from {0} to {1}{", above " .. 0}`
						})
					end
				end
				for _, value17 in {
					"popover", "menu", "dialog", "reveal", "sheet", "toast", "radial"
				} do
					each(value17, function(Text, p6: number)
						-- upvalues: List1 (copy)
						if type(p6) ~= "number" or p6 > 10 or p6 < 0 then
							table.insert(List1, {
								field = "metrics.motion." .. Text,
								message = `must be a number from {0} to {10}`
							})
							
							return
						end
					end)
				end
				each("durations", function(Text, p6: number)
					-- upvalues: List1 (copy)
					if type(p6) ~= "number" or p6 > 10 or p6 < 0 then
						table.insert(List1, {
							field = "metrics.motion." .. Text,
							message = `must be a number from {0} to {10}`
						})
						
						return
					end
				end)
				each("springs", function(Text, p6)
					-- upvalues: List1 (copy)
					if type(p6) ~= "table" then
						table.insert(List1, {
							message = "must be { period, damping }",
							field = "metrics.motion." .. Text
						})
						
						return
					end
					local Text1 = Text .. ".period"
					local Period: number = p6.period
					
					if type(Period) ~= "number" or Period > 10 or Period < 0 or Period == 0 then
						table.insert(List1, {
							field = "metrics.motion." .. Text1,
							message = `must be a number from {0} to {10}{", above " .. 0}`
						})
					end
					local Text2 = Text .. ".damping"
					local Damping: number = p6.damping
					
					if type(Damping) ~= "number" or Damping > 10 or Damping < 0 or Damping == 0 then
						table.insert(List1, {
							field = "metrics.motion." .. Text2,
							message = `must be a number from {0} to {10}{", above " .. 0}`
						})
					end
				end)
				each("materialize", function(Text, p6: number)
					-- upvalues: List1 (copy)
					if type(p6) ~= "number" or p6 > 10 or p6 < 0 or p6 == 0 then
						table.insert(List1, {
							field = "metrics.motion." .. Text,
							message = `must be a number from {0} to {10}{", above " .. 0}`
						})
					end
				end)
				each("distances", function(Text, p6: number)
					-- upvalues: List1 (copy)
					if type(p6) ~= "number" or p6 > 10000 or p6 < 0 then
						table.insert(List1, {
							field = "metrics.motion." .. Text,
							message = `must be a number from {0} to {10000}`
						})
						
						return
					end
				end)
				each("fling", function(Text, p6: number)
					-- upvalues: List1 (copy)
					local IsNotFlingProjection = Text ~= "fling.projection"
					
					if type(p6) ~= "number" or p6 > 100000 or p6 < 0 or IsNotFlingProjection == true and p6 == 0 then
						table.insert(List1, {
							field = "metrics.motion." .. Text,
							message = `must be a number from {0} to {100000}{if IsNotFlingProjection then ", above " .. 0 else ""}`
						})
					end
				end)
				each("easing", function(Text, p7)
					-- upvalues: Easing (upval), List1 (copy)
					if type(p7) ~= "string" or Easing[p7] == nil then
						table.insert(List1, {
							message = "must name a Compose.easing function",
							field = "metrics.motion." .. Text
						})
					end
				end)
				each("styles", function(Text, p7)
					-- upvalues: config (upval), List1 (copy)
					if type(p7) ~= "string" or config[p7] == nil then
						table.insert(List1, {
							message = "must name an Enum.EasingStyle item",
							field = "metrics.motion." .. Text
						})
					end
				end)
			else
				table.insert(List1, {
					field = "metrics.motion",
					message = "Motion tokens must be a table"
				})
			end
			local Rules = MergeResult.rules or {}
			for i3, value4 in Rules do
				local Properties = value4.properties or (value4.props or {})
				for i4, property in Properties do
					if typeof(property) == "table" and getmetatable(property) == nil then
						local Count = 0
						
						for _, value18 in Frozen do
							if property[value18] ~= nil then
								Count += 1
							end
						end
						if Count == 0 and (property.role == nil and property.metric == nil) then
							table.insert(List1, {
								message = "A rule value table must be a role, a metric, udim, udim2, vector2, colorSequence or numberSequence",
								field = `rules.{i3}.properties.{i4}`
							})
						elseif Count > 1 then
							table.insert(List1, {
								message = "A rule value table must name one data form",
								field = `rules.{i3}.properties.{i4}`
							})
						end
					end
					if type(property) == "table" and property.metric ~= nil and (property.role ~= nil or ThemeSupportModule.numericMetric(MergeResult.metrics, property.metric) == nil) then
						table.insert(List1, {
							message = "A metric reference must name one finite numeric theme metric",
							field = `rules.{i3}.properties.{i4}`
						})
					end
				end
			end
			local Shadows = MergeResult.style.shadows or {}
			
			local function checkLinks(List, Text)
				-- upvalues: List1 (copy), checkLinks (copy)
				if type(List) ~= "table" then return end
				if List.rotation ~= nil and List.rotation ~= 0 and List.rotation ~= 180 then
					table.insert(List1, {
						message = "Art rotation must be 0 or 180",
						field = Text .. ".rotation"
					})
				end
				local Tint = List.tint
				
				if Tint ~= nil then
					for _, value in { "r", "g", "b" } do
						local TintEntry = if type(Tint) == "table" then Tint[value] else nil
						
						if type(TintEntry) ~= "number" or TintEntry < 0 or TintEntry > 1 then
							table.insert(List1, {
								message = "Art tint needs r, g and b from 0 to 1",
								field = Text .. ".tint"
							})
							break
						end
					end
				end
				for i, value1 in List do
					checkLinks(value1, Text .. "." .. tostring(i))
				end
			end
			
			for i5, value7 in MergeResult.chrome or {} do
				if i5 == "panelTail" and value7.kind ~= "native" and value7.kind ~= "none" then
					local Size = value7.size
					local Overhang: number = value7.overhang
					
					if value7.kind ~= "fill" or (type(Size) ~= "table" or (type(Size.w) ~= "number" or type(Size.h) ~= "number" or Size.w <= 0 or (Size.w >= 1e999 or Size.h <= 0 or Size.h >= 1e999 or type(Overhang) ~= "number" or Overhang <= 0 or Overhang > Size.h or value7.asset == nil))) or value7.margin ~= nil and (type(value7.margin) ~= "number" or value7.margin < 0 or value7.margin >= 1e999) then
						table.insert(List1, {
							field = "chrome.panelTail",
							message = "Panel tail needs kind fill, an asset, positive finite size w/h, overhang in (0, size.h], and a nonnegative finite margin"
						})
					end
				end
				local Shadow = value7.shadow
				
				if type(Shadow) == "string" and Shadows[Shadow] == nil and ShadowPresets[Shadow] == nil then
					table.insert(List1, {
						field = "chrome." .. i5 .. ".shadow",
						message = "Unknown shadow preset " .. Shadow
					})
				end
				checkLinks(value7, "chrome." .. i5)
			end
			local function checkGlyph(p6, IconsName)
				-- upvalues: List1 (copy)
				if type(p6) ~= "table" or p6.codepoint == nil then return end
				local Codepoint: number = p6.codepoint
				
				if type(Codepoint) ~= "number" or Codepoint % 1 ~= 0 or Codepoint < 0 or Codepoint > 1114111 then
					table.insert(List1, {
						message = "A glyph codepoint must be an integer from 0 to 0x10FFFF",
						field = IconsName .. ".codepoint"
					})
				end
				if typeof(p6.font) ~= "Font" and type(p6.font) ~= "table" then
					table.insert(List1, {
						message = "A glyph needs a Font or a font spec",
						field = IconsName .. ".font"
					})
				end
			end
			
			local Icons = MergeResult.icons
			local Icons1 = if type(Icons) == "table" then Icons else {}
			for i1, value1 in Icons1 do
				if type(value1) ~= "table" or value1.default == nil then
					checkGlyph(value1, `icons.{i1}`)
					continue
				end
				for i, value in value1 do
					checkGlyph(value, `icons.{i1}.{i}`)
				end
			end
			if #List1 > 0 then
				return nil, {
					ok = false,
					errors = List1,
					missing = {},
					contrast = {},
					advice = {}
				}
			end
			MergeResult.schema = Schema
			local Contrast = {}
			
			for _, theme in MergeResult.style.themes do
				if type(theme) ~= "table" or type(theme.name) ~= "string" or theme.colors ~= nil and type(theme.colors) ~= "table" then
					table.insert(List1, {
						field = "style.themes",
						message = "Palettes require a name and color dictionary"
					})
					continue
				end
				local NeutralBaseResult = ThemeSupportModule.neutralBase(p2, theme.colors)
				local MergeResult1 = MergeFunction(NeutralBaseResult.colors, theme.colors)
				local Flag = true
				
				for i7, value19 in MergeResult1 do
					if not isColor(value19) then
						Flag = false
						table.insert(List1, {
							message = "Colors require RGB components between zero and one",
							field = "colors." .. i7
						})
					end
				end
				if Flag then
					local Extra = theme.extra
					local ControlSelectedFunction = t
					local Surface = MergeResult1.surface
					local R = Surface.r
					local v13 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126
					local G = Surface.g
					R = if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4
					local NewR = v13 + R * 0.7152
					R = Surface.b
					local NewNewR = NewR + (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.0722
					NewR = MergeResult1.content
					G = NewR.r
					R = if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4
					local G1: number = NewR.g
					G = if G1 <= 0.04045 then G1 / 12.92 else ((G1 + 0.055) / 1.055) ^ 2.4
					v13 = R * 0.2126 + G * 0.7152
					G = NewR.b
					R = if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4
					local ControlSelectedFunctionEntry = ControlSelectedFunction[if NewNewR < v13 + R * 0.0722 then "dark" else "light"]
					
					if type(Extra) == "table" and (ControlSelectedFunctionEntry ~= nil and isColor(Extra.control)) then
						ControlSelectedFunction = Extra.control
						
						if Extra.controlHover == nil then
							Extra.controlHover = shade(ControlSelectedFunction, ControlSelectedFunctionEntry.hover)
						end
						if Extra.controlPressed == nil then
							Extra.controlPressed = shade(ControlSelectedFunction, ControlSelectedFunctionEntry.pressed)
						end
					end
					for _, value20 in {
						{ "content", "surface" },
						{ "contentStrong", "surfaceStrong" },
						{ "onAccent", "accent" },
						{ "onDanger", "danger" },
						{ "onSuccess", "success" },
						{ "onWarning", "warning" }
					} do
						local MergeResultEntry = MergeResult1[value20[1]]
						local R1 = MergeResultEntry.r
						local v14 = (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.2126
						local G2 = MergeResultEntry.g
						R1 = if G2 <= 0.04045 then G2 / 12.92 else ((G2 + 0.055) / 1.055) ^ 2.4
						local NewR1 = v14 + R1 * 0.7152
						R1 = MergeResultEntry.b
						local NewNewR1 = NewR1 + (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.0722
						MergeResultEntry = MergeResult1[value20[2]]
						R1 = MergeResultEntry.r
						v14 = (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.2126
						G2 = MergeResultEntry.g
						R1 = if G2 <= 0.04045 then G2 / 12.92 else ((G2 + 0.055) / 1.055) ^ 2.4
						NewR1 = v14 + R1 * 0.7152
						R1 = MergeResultEntry.b
						local NewNewR2 = NewR1 + (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.0722
						local LargestRatio = (math.max(NewNewR1, NewNewR2) + 0.05) / (math.min(NewNewR1, NewNewR2) + 0.05)
						v14 = {
							pair = value20[1] .. "/" .. value20[2],
							ratio = LargestRatio,
							ok = LargestRatio >= 4.5
						}
						table.insert(Contrast, v14)
						
						if LargestRatio < 4.5 then
							table.insert(List1, {
								field = "style." .. theme.name,
								message = value20[1] .. " contrast is below 4.5:1"
							})
						end
					end
					ControlSelectedFunction = MergeFunction
					local Extra1 = NeutralBaseResult.extra or {}
					NewNewR = theme.extra or {}
					Extra = ControlSelectedFunction(Extra1, NewNewR)
					ControlSelectedFunction = Extra.controlSelected
					Extra1 = Extra.onSelected or MergeResult1.content
					
					if type(ControlSelectedFunction) == "table" and type(Extra1) == "table" then
						local R2 = Extra1.r
						local v15 = (if R2 <= 0.04045 then R2 / 12.92 else ((R2 + 0.055) / 1.055) ^ 2.4) * 0.2126
						local G3 = Extra1.g
						R2 = if G3 <= 0.04045 then G3 / 12.92 else ((G3 + 0.055) / 1.055) ^ 2.4
						local NewR2 = v15 + R2 * 0.7152
						R2 = Extra1.b
						local NewNewR3 = NewR2 + (if R2 <= 0.04045 then R2 / 12.92 else ((R2 + 0.055) / 1.055) ^ 2.4) * 0.0722
						R2 = ControlSelectedFunction.r
						v15 = (if R2 <= 0.04045 then R2 / 12.92 else ((R2 + 0.055) / 1.055) ^ 2.4) * 0.2126
						G3 = ControlSelectedFunction.g
						R2 = if G3 <= 0.04045 then G3 / 12.92 else ((G3 + 0.055) / 1.055) ^ 2.4
						NewR2 = v15 + R2 * 0.7152
						R2 = ControlSelectedFunction.b
						local NewNewR31 = NewR2 + (if R2 <= 0.04045 then R2 / 12.92 else ((R2 + 0.055) / 1.055) ^ 2.4) * 0.0722
						local LargestRatio = (math.max(NewNewR3, NewNewR31) + 0.05) / (math.min(NewNewR3, NewNewR31) + 0.05)
						R2 = LargestRatio >= 4.5
						table.insert(Contrast, {
							pair = "onSelected/controlSelected",
							ratio = LargestRatio,
							ok = R2
						})
						
						if LargestRatio < 4.5 then
							table.insert(List1, {
								message = "onSelected contrast is below 4.5:1",
								field = "style." .. theme.name
							})
						end
					end
				end
			end
			if #List1 > 0 then
				return nil, {
					ok = false,
					errors = List1,
					missing = {},
					contrast = Contrast,
					advice = {}
				}
			end
			local List = t2
			
			if Finish == nil then
				table.insert(List, {
					field = "finish",
					message = "The theme does not state its edge and depth, so its plates are the base theme's. Add finish with the values of the direction, or finish = { edge = { width = 0 }, depth = { lift = 0, glow = 0, sheen = 0 } } for flat plates"
				})
			end
			local Typography2 = MergeResult.metrics.typography
			
			local _ = function(p6)
				-- upvalues: Typography2 (copy)
				local TypographyEntry = Typography2[p6]
				local Size = if type(TypographyEntry) == "table" then TypographyEntry.size else nil
				
				return if type(Size) == "number" then Size else nil
			end
			
			local Body = Typography2.body
			local Size = if type(Body) == "table" then Body.size else nil
			local Size1 = if type(Size) == "number" then Size else nil
			
			if Size1 ~= nil and Size1 > 0 then
				for _, value22 in list do
					local TypographyEntry = Typography2[value22.role]
					local Size2 = if type(TypographyEntry) == "table" then TypographyEntry.size else nil
					local Size21 = if type(Size2) == "number" then Size2 else nil
					
					if Size21 ~= nil then
						local SizeRatio = Size21 / Size1
						
						if value22.minimum ~= nil and SizeRatio < value22.minimum or value22.maximum ~= nil and value22.maximum < SizeRatio then
							table.insert(List, {
								field = "metrics.typography." .. value22.role,
								message = value22.message:format(Size21, SizeRatio, Size1)
							})
						end
					end
				end
			end
			local _ = function(p6)
				-- upvalues: Typography2 (copy)
				local TypographyEntry = Typography2[p6]
				local TypographyEntryFont = if type(TypographyEntry) == "table" then TypographyEntry.font else nil
				local Family = if type(TypographyEntryFont) == "table" then TypographyEntryFont.family else nil
				
				return if type(Family) == "string" then Family else nil
			end
			
			local Body1 = Typography2.body
			local BodyFont = if type(Body1) == "table" then Body1.font else nil
			local Family = if type(BodyFont) == "table" then BodyFont.family else nil
			local Family1 = if type(Family) == "string" then Family else nil
			
			if Family1 ~= nil then
				local List3 = {}
				
				for _, value21 in {
					"title",
					"heading",
					"numeral",
					"label",
					"control"
				} do
					local Family2 = Typography2[value21]
					local FamilyFont = if type(Family2) == "table" then Family2.font else nil
					Family2 = if type(FamilyFont) == "table" then FamilyFont.family else nil
					local Family21 = if type(Family2) == "string" then Family2 else nil
					
					if Family21 ~= nil and Family21 ~= Family1 then
						table.insert(List3, value21)
					end
				end
				if #List3 == 1 then
					table.insert(List, {
						field = "metrics.typography." .. List3[1],
						message = ("Only %s uses a display family, so the identity stops at one line per screen. Set the same family on heading and numeral, and on label or control for short labels; keep body and caption readable."):format(List3[1])
					})
				end
			end
			return FrozenFunction(MergeResult), {
				ok = true,
				errors = {},
				missing = {},
				contrast = Contrast,
				advice = List
			}
		end,
		checkCoverage = checkCoverage
	}
end