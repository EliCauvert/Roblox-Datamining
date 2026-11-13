local RobloxTypesModule = require("./roblox_types")
local _ = require("../vendor/compose/core")
local _ = require("./theme_types")
local _ = require("./engine_types")

local function _(p1): number
	local function _(p2: number): number
		return if p2 <= 0.04045 then p2 / 12.92 else ((p2 + 0.055) / 1.055) ^ 2.4
	end
	
	local R: number = p1.R
	local G: number = p1.G
	local v1 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B: number = p1.B
	
	return v1 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722
end

local function contrast(p1, p2): number
	local function _(p3: number): number
		return if p3 <= 0.04045 then p3 / 12.92 else ((p3 + 0.055) / 1.055) ^ 2.4
	end
	
	local R: number = p1.R
	local G: number = p1.G
	local v1 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B: number = p1.B
	local v2 = v1 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722
	
	local _ = function(p3: number): number
		return if p3 <= 0.04045 then p3 / 12.92 else ((p3 + 0.055) / 1.055) ^ 2.4
	end
	
	local R1: number = p2.R
	local G1: number = p2.G
	local v3 = (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G1 <= 0.04045 then G1 / 12.92 else ((G1 + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B1: number = p2.B
	local v4 = v3 + (if B1 <= 0.04045 then B1 / 12.92 else ((B1 + 0.055) / 1.055) ^ 2.4) * 0.0722
	
	return (math.max(v2, v4) + 0.05) / (math.min(v2, v4) + 0.05)
end

local function readableTransparency(p1, Goal, Value: number): number
	local ClampedValue = math.clamp(Value, 0, 1)
	local Interpolated = p1:Lerp(Goal, ClampedValue)
	
	local function _(p2: number): number
		return if p2 <= 0.04045 then p2 / 12.92 else ((p2 + 0.055) / 1.055) ^ 2.4
	end
	
	local R: number = Interpolated.R
	local G: number = Interpolated.G
	local v1 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B: number = Interpolated.B
	local v2 = v1 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722
	
	local _ = function(p2: number): number
		return if p2 <= 0.04045 then p2 / 12.92 else ((p2 + 0.055) / 1.055) ^ 2.4
	end
	
	local R1: number = Goal.R
	local G1: number = Goal.G
	local v3 = (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G1 <= 0.04045 then G1 / 12.92 else ((G1 + 0.055) / 1.055) ^ 2.4) * 0.7152
	local B1: number = Goal.B
	local v4 = v3 + (if B1 <= 0.04045 then B1 / 12.92 else ((B1 + 0.055) / 1.055) ^ 2.4) * 0.0722
	
	if (math.max(v2, v4) + 0.05) / (math.min(v2, v4) + 0.05) >= 4.5 then
		return ClampedValue
	end
	local v5 = 0
	local ClampedValue1: number = ClampedValue
	
	for _ = 1, 20 do
		local ClampedValueRatio = (v5 + ClampedValue1) / 2
		local Interpolated1 = p1:Lerp(Goal, ClampedValueRatio)
		
		local _ = function(p2: number): number
			return if p2 <= 0.04045 then p2 / 12.92 else ((p2 + 0.055) / 1.055) ^ 2.4
		end
		
		local R2: number = Interpolated1.R
		local G2: number = Interpolated1.G
		local v6 = (if R2 <= 0.04045 then R2 / 12.92 else ((R2 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G2 <= 0.04045 then G2 / 12.92 else ((G2 + 0.055) / 1.055) ^ 2.4) * 0.7152
		local B2: number = Interpolated1.B
		local v7 = v6 + (if B2 <= 0.04045 then B2 / 12.92 else ((B2 + 0.055) / 1.055) ^ 2.4) * 0.0722
		
		local _ = function(p2: number): number
			return if p2 <= 0.04045 then p2 / 12.92 else ((p2 + 0.055) / 1.055) ^ 2.4
		end
		
		local R3: number = Goal.R
		local G3: number = Goal.G
		local v8 = (if R3 <= 0.04045 then R3 / 12.92 else ((R3 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G3 <= 0.04045 then G3 / 12.92 else ((G3 + 0.055) / 1.055) ^ 2.4) * 0.7152
		local B3: number = Goal.B
		local v9 = v8 + (if B3 <= 0.04045 then B3 / 12.92 else ((B3 + 0.055) / 1.055) ^ 2.4) * 0.0722
		
		if (math.max(v7, v9) + 0.05) / (math.min(v7, v9) + 0.05) >= 4.5 then
			v5 = ClampedValueRatio
		else
			ClampedValue1 = ClampedValueRatio
		end
	end
	return v5
end

local function copy(List)
	-- upvalues: copy (copy)
	if type(List) ~= "table" then
		return List
	end
	local t = {}
	
	for i, value in List do
		t[i] = copy(value)
	end
	return t
end

local config = {
	default = true,
	hover = true,
	pressed = true,
	selected = true,
	disabled = true
}

local _ = function(List): boolean
	-- upvalues: config (copy)
	if type(List) ~= "table" or next(List) == nil then
		return false
	end
	for i in List do
		if not config[i] then
			return false
		end
	end
	return true
end

local function merge(Colors, Colors1)
	-- upvalues: copy (copy), config (copy), merge (copy)
	local CopyResult = copy(Colors)
	local Colors1_1 = Colors1 or {}
	local Flag = nil
	for i, value in Colors1_1 do
		if i ~= "base" then
			local CopyResult1 = nil
			if type(value) == "table" and type(CopyResult[i]) == "table" and #value == 0 then
				if type(value) == "table" and next(value) ~= nil then
					Flag = true
					
					for i1 in value do
						if not config[i1] then
							Flag = false
							break
						end
					end
				else
					Flag = false
				end
				if not Flag then
					CopyResult1 = merge(CopyResult[i], value)
					CopyResult[i] = CopyResult1
					continue
				end
			end
			CopyResult1 = copy(value)
		end
	end
	return CopyResult
end

local function read(Callback, Callback1)
	return if type(Callback) == "function" then Callback(Callback1 or function(p2)
		return p2:peek()
	end) elseif type(Callback) == "table" and type(Callback.peek) == "function" then if Callback1 then Callback1(Callback) else Callback:peek() else Callback
end

local function frozen(Tbl)
	-- upvalues: frozen (copy)
	if type(Tbl) ~= "table" or table.isfrozen(Tbl) then
		return Tbl
	end
	for _, value in Tbl do
		frozen(value)
	end
	return (table.freeze(Tbl))
end

local ShadowPresets = {
	raised = {
		transparency = 0.35,
		blurRadius = { offset = 14 },
		offset = { y = { offset = 3 } }
	},
	overlay = {
		transparency = 0.45,
		blurRadius = { offset = 24 },
		offset = { y = { offset = 8 } }
	}
}

local function numericMetric(p2, Text: string)
	if type(Text) ~= "string" or Text == "" then
		return nil
	end
	local Value = p2
	
	for _, value in string.split(Text, ".") do
		if value == "" or type(Value) ~= "table" then
			return nil
		end
		Value = Value[value]
	end
	return if type(Value) == "number" and Value == Value and math.abs(Value) < 1e999 then Value else nil
end

local function paletteFor(p3, p4)
	local P13 = p4 or p3.style.defaultTheme
	for _, theme in p3.style.themes do
		if theme.name == P13 then
			return theme
		end
	end
	return p3.style.themes[1]
end

local function typesFor(p5)
	-- upvalues: RobloxTypesModule (copy)
	return p5.types or RobloxTypesModule()
end

local function font(p5, p6)
	if typeof(p6) == "Font" then
		return p6
	end
	local Family = p6.family or "BuilderSans"
	
	if not string.find(Family, "://", 1, true) then
		Family = "rbxasset://fonts/families/" .. Family .. ".json"
	end
	return p5.Font.new(Family, p5.Enum.FontWeight[p6.weight or "Regular"], p5.Enum.FontStyle[p6.style or "Normal"])
end

local function sameProperties(List, List1): boolean
	for i, value in List do
		if List1[i] ~= value then
			return false
		end
	end
	for i1 in List1 do
		if List[i1] == nil then
			return false
		end
	end
	return true
end

local Frozen = table.freeze({ __mode = "k" })

local function weakKeys(p5)
	-- upvalues: Frozen (copy)
	setmetatable(p5, Frozen)
end

local config1 = { style = { themes = true } }

local function deeplySame(Key, Key1, p5): boolean
	-- upvalues: deeplySame (copy)
	if rawequal(Key, Key1) then
		return true
	end
	if type(Key) ~= "table" or type(Key1) ~= "table" then
		return Key == Key1
	end
	for i, value in Key do
		local v10 = if p5 then p5[i] else nil
		local v11 = if type(v10) == "table" then v10 else nil
		
		if v10 ~= true and not deeplySame(value, Key1[i], v11) then
			return false
		end
	end
	for i1 in Key1 do
		if Key[i1] == nil then
			return false
		end
	end
	return true
end

local Callback = getmetatable

local function deeplyFrozen(Key, p6): boolean
	-- upvalues: Callback (copy), deeplyFrozen (copy)
	if type(Key) ~= "table" then
		return true
	end
	if Callback(Key) ~= nil then
		return false
	end
	if not table.isfrozen(Key) then
		return false
	end
	if p6[Key] then
		return true
	end
	p6[Key] = true
	
	for i, value in Key do
		if not deeplyFrozen(i, p6) or not deeplyFrozen(value, p6) then
			return false
		end
	end
	return true
end

local self = setmetatable({}, { __mode = "k" })
local t = {}
setmetatable(t, Frozen)

local function keyOrder(A, B): boolean
	local ValueType = type(A)
	local ValueType1 = type(B)
	
	return if ValueType == ValueType1 then tostring(A) < tostring(B) else ValueType < ValueType1
end

local function describe(Key, p7, List)
	-- upvalues: keyOrder (copy), describe (copy)
	if type(Key) ~= "table" then
		table.insert(List, (typeof(Key)))
		table.insert(List, ":")
		table.insert(List, (tostring(Key)))
		table.insert(List, ";")
		
		return
	end
	local List1 = {}
	
	for i in Key do
		if not p7 or p7[i] ~= true then
			table.insert(List1, i)
		end
	end
	table.sort(List1, keyOrder)
	table.insert(List, "{")
	
	for _, value in List1 do
		table.insert(List, (tostring(value)))
		table.insert(List, "=")
		local v12 = if p7 then p7[value] else nil
		describe(Key[value], if type(v12) == "table" then v12 else nil, List)
	end
	table.insert(List, "}")
end

local function sealed(Key)
	-- upvalues: self (copy), deeplyFrozen (copy), describe (copy), config1 (copy), t (copy)
	local SelfEntry = self[Key]
	
	if SelfEntry == nil then
		SelfEntry = deeplyFrozen(Key, {})
		self[Key] = SelfEntry
		
		if SelfEntry then
			local List = {}
			describe(Key, config1, List)
			t[Key] = table.concat(List)
		end
	end
	return SelfEntry
end

local function neutralBase(p8, Colors)
	local Surface = if Colors then Colors.surface else nil
	local Theme = p8.style.themes[1]
	
	if type(Surface) == "table" then
		local function _(p9: number): number
			return if p9 <= 0.04045 then p9 / 12.92 else ((p9 + 0.055) / 1.055) ^ 2.4
		end
		
		local R: number = Surface.r
		local G: number = Surface.g
		local v13 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
		local B: number = Surface.b
		
		if v13 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722 > 0.18 then
			for _, theme in p8.style.themes do
				if theme.name == "Light" then
					Theme = theme
				end
			end
		end
	end
	return Theme
end

return {
	neutralBase = neutralBase,
	controlSelectedArtwork = function(p9, p10, p11, p12)
		-- upvalues: merge (copy), neutralBase (copy)
		local Control = if p9.chrome then p9.chrome.control else nil
		local T = if Control == nil then {} elseif Control.kind == "layered" then Control.layers or {} else { Control }
		local Selected = nil
		for i, value in T do
			local Asset = if type(value.asset) == "table" then value.asset else nil
			Selected = if Asset then Asset.selected else nil
			
			if Selected then
				local Config = if type(Selected) == "string" then { asset = Selected } else Selected
				
				if p9.assets and p9.assets[Config.asset] then
					for _, theme in p9.style.themes do
						local MergeResult = merge(neutralBase(p10, theme.colors).colors, theme.colors)
						local ColorResult = p12.color(p11, MergeResult.accent)
						local ColorResult1 = p12.color(p11, MergeResult.onAccent)
						
						if ColorResult and ColorResult1 then
							local function _(p13: number): number
								return if p13 <= 0.04045 then p13 / 12.92 else ((p13 + 0.055) / 1.055) ^ 2.4
							end
							
							local R: number = ColorResult1.R
							local G: number = ColorResult1.G
							local v14 = (if R <= 0.04045 then R / 12.92 else ((R + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G <= 0.04045 then G / 12.92 else ((G + 0.055) / 1.055) ^ 2.4) * 0.7152
							local B: number = ColorResult1.B
							
							local _ = function(p13: number): number
								return if p13 <= 0.04045 then p13 / 12.92 else ((p13 + 0.055) / 1.055) ^ 2.4
							end
							
							local R1: number = ColorResult.R
							local G1: number = ColorResult.G
							local v15 = (if R1 <= 0.04045 then R1 / 12.92 else ((R1 + 0.055) / 1.055) ^ 2.4) * 0.2126 + (if G1 <= 0.04045 then G1 / 12.92 else ((G1 + 0.055) / 1.055) ^ 2.4) * 0.7152
							local B1: number = ColorResult.B
							
							if v14 + (if B <= 0.04045 then B / 12.92 else ((B + 0.055) / 1.055) ^ 2.4) * 0.0722 <= v15 + (if B1 <= 0.04045 then B1 / 12.92 else ((B1 + 0.055) / 1.055) ^ 2.4) * 0.0722 then
								return Config, i, true
							end
						end
					end
				end
				return Config, i, false
			end
		end
		return nil, nil, false
	end,
	contrast = contrast,
	readableTransparency = readableTransparency,
	copy = copy,
	merge = merge,
	read = read,
	frozen = frozen,
	shadowPresets = ShadowPresets,
	plateReach = function(p13): number
		-- upvalues: ShadowPresets (copy)
		if p13 == nil then
			return 0
		end
		local Largest = 0
		local Chrome = p13.chrome or {}
		for _, value in { "panel", "control" } do
			local ChromeEntry = Chrome[value]
			local Shadow = if ChromeEntry then ChromeEntry.shadow else nil
			local Shadow1 = if type(Shadow) == "string" then (p13.style.shadows or {})[Shadow] or ShadowPresets[Shadow] elseif type(Shadow) == "table" then Shadow else nil
			
			if Shadow1 and Shadow1.enabled ~= false then
				local function _(p14)
					return if p14 and p14.offset then p14.offset else 0
				end
				
				local Offset = Shadow1.offset
				local Spread = Shadow1.spread
				local X = Offset and Offset.x
				local Magnitude = math.abs(if X and X.offset then X.offset else 0)
				local X1 = Spread and Spread.x
				local Y = Offset and Offset.y
				local Magnitude1 = math.abs(if Y and Y.offset then Y.offset else 0)
				local Y1 = Spread and Spread.y
				local BlurRadius = Shadow1.blurRadius
				Largest = math.max(Largest, (if BlurRadius and BlurRadius.offset then BlurRadius.offset else 0) + math.max(Magnitude + (if X1 and X1.offset then X1.offset else 0), Magnitude1 + (if Y1 and Y1.offset then Y1.offset else 0)))
			end
		end
		local Rules = p13.rules or {}
		for _, rule in Rules do
			local Selector: string = rule.selector
			local Properties = rule.properties or rule.props
			
			if type(Selector) == "string" and string.find(Selector, "::UIStroke", 1, true) and Properties then
				local Thickness: number = Properties.Thickness
				
				if type(Thickness) == "number" then
					Largest = math.max(Largest, Thickness)
				end
			end
		end
		return (math.ceil((math.max(0, Largest))))
	end,
	numericMetric = numericMetric,
	paletteFor = paletteFor,
	typesFor = typesFor,
	font = font,
	sameProperties = sameProperties,
	deeplyFrozen = deeplyFrozen,
	sameBesidesPalettes = function(Key, Key1)
		-- upvalues: sealed (copy), deeplySame (copy), config1 (copy), t (copy)
		return Key == Key1 or Key ~= nil and Key1 ~= nil and (if sealed(Key) and sealed(Key1) then t[Key] == t[Key1] else deeplySame(Key, Key1, config1))
	end,
	sealed = sealed,
	weakKeys = weakKeys
}