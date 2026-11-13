local _ = require("./theme_types")
local AdaptiveModule = require("./adaptive")
local FrozenFunction = require("./theme_support").frozen
local self = setmetatable({}, { __mode = "k" })
local self1 = setmetatable({}, { __mode = "k" })
local Patterns = {
	"TextSize$", "Lines$", "Count$", "Duration$", "Seconds$", "Ratio$",
	"Fraction$", "Scale$", "Opacity$", "Weight$"
}

local function _(Text: string): boolean
	-- upvalues: Patterns (copy)
	for _, pattern in Patterns do
		if string.find(Text, pattern) then
			return false
		end
	end
	return true
end

local function scaleTable(IconSizes, p1, p2)
	local t = {}
	
	for i, iconSize in IconSizes do
		t[i] = if p2 then math.floor(iconSize * p1 + 0.5) else iconSize * p1
	end
	return t
end

local function insets(ContentInsets, p3)
	return if ContentInsets == nil then nil else {
		top = if ContentInsets.top then ContentInsets.top * p3 else nil,
		right = if ContentInsets.right then ContentInsets.right * p3 else nil,
		bottom = if ContentInsets.bottom then ContentInsets.bottom * p3 else nil,
		left = if ContentInsets.left then ContentInsets.left * p3 else nil
	}
end

local _ = function(p3, p4)
	return if p3 then {
		scale = p3.scale,
		offset = if p3.offset then p3.offset * p4 else nil
	} else nil
end

local _ = function(Spread, p3)
	if Spread then
		local X = Spread.x
		local Config = if X then {
			scale = X.scale,
			offset = if X.offset then X.offset * p3 else nil
		} else nil
		local Y = Spread.y
		
		return {
			x = Config,
			y = if Y then {
				scale = Y.scale,
				offset = if Y.offset then Y.offset * p3 else nil
			} else nil
		}
	else
		return nil
	end
end

local function layer(Tbl, p3)
	-- upvalues: insets (copy), layer (copy)
	local Copy = table.clone(Tbl)
	Copy.contentInsets = insets(Tbl.contentInsets, p3)
	Copy.textInsets = insets(Tbl.textInsets, p3)
	Copy.thickness = if Tbl.thickness then Tbl.thickness * p3 else nil
	Copy.margin = if Tbl.margin then Tbl.margin * p3 else nil
	Copy.tile = if Tbl.tile then Tbl.tile * p3 else nil
	Copy.overhang = if Tbl.overhang then Tbl.overhang * p3 else nil
	Copy.outset = if Tbl.outset then Tbl.outset * p3 else nil
	Copy.sliceScale = if Tbl.sliceScale then Tbl.sliceScale * p3 else nil
	local BlurRadius = Tbl.blurRadius
	Copy.blurRadius = if BlurRadius then {
		scale = BlurRadius.scale,
		offset = if BlurRadius.offset then BlurRadius.offset * p3 else nil
	} else nil
	
	if Tbl.tileSize then
		Copy.tileSize = { w = Tbl.tileSize.w * p3, h = Tbl.tileSize.h * p3 }
	end
	local Size = Tbl.size
	
	if type(Size) == "number" then
		Copy.size = Size * p3
	elseif Size then
		Copy.size = { w = Size.w * p3, h = Size.h * p3 }
	end
	local Shadow = Tbl.shadow
	
	if type(Shadow) == "table" then
		local Copy1 = table.clone(Shadow)
		local BlurRadius1 = Shadow.blurRadius
		Copy1.blurRadius = if BlurRadius1 then {
			scale = BlurRadius1.scale,
			offset = if BlurRadius1.offset then BlurRadius1.offset * p3 else nil
		} else nil
		local Offset = Shadow.offset
		local Offset1 = nil
		
		if Offset then
			local X = Offset.x
			local Config = if X then {
				scale = X.scale,
				offset = if X.offset then X.offset * p3 else nil
			} else nil
			local Y = Offset.y
			Offset1 = {
				x = Config,
				y = if Y then {
					scale = Y.scale,
					offset = if Y.offset then Y.offset * p3 else nil
				} else nil
			}
		else
			Offset1 = nil
		end
		Copy1.offset = Offset1
		local Spread = Shadow.spread
		local Spread1 = nil
		
		if Spread then
			local X = Spread.x
			local Config = if X then {
				scale = X.scale,
				offset = if X.offset then X.offset * p3 else nil
			} else nil
			local Y = Spread.y
			Spread1 = {
				x = Config,
				y = if Y then {
					scale = Y.scale,
					offset = if Y.offset then Y.offset * p3 else nil
				} else nil
			}
		else
			Spread1 = nil
		end
		Copy1.spread = Spread1
		Copy.shadow = Copy1
	end
	if Tbl.layers then
		local Layers = {}
		
		for _, layer1 in Tbl.layers do
			table.insert(Layers, layer(layer1, p3))
		end
		Copy.layers = Layers
	end
	return Copy
end

local function build(Base, p4, Distant, Scale)
	-- upvalues: AdaptiveModule (copy), scaleTable (copy), Patterns (copy), layer (copy), FrozenFunction (copy)
	local TENFOOTSCALE = if Distant then AdaptiveModule.TEN_FOOT_SCALE else 1
	local ScaledTENFOOTSCALE = TENFOOTSCALE * Scale
	local Metrics = Base.metrics
	local Copy = table.clone(Metrics)
	Copy.space = scaleTable(Metrics.space, ScaledTENFOOTSCALE)
	Copy.strokes = scaleTable(Metrics.strokes, ScaledTENFOOTSCALE)
	Copy.targetSizes = scaleTable(Metrics.targetSizes, ScaledTENFOOTSCALE)
	Copy.iconSizes = scaleTable(Metrics.iconSizes, ScaledTENFOOTSCALE)
	Copy.radii = scaleTable(Metrics.radii, ScaledTENFOOTSCALE, true)
	local ControlSizes = {}
	
	for i, controlSize in Metrics.controlSizes do
		ControlSizes[i] = {
			height = math.floor(controlSize.height * ScaledTENFOOTSCALE + 0.5),
			paddingX = math.floor(controlSize.paddingX * ScaledTENFOOTSCALE + 0.5),
			iconSize = math.floor(controlSize.iconSize * ScaledTENFOOTSCALE + 0.5)
		}
	end
	Copy.controlSizes = ControlSizes
	local Controls = {}
	local Flag = nil
	
	for i1, control in Metrics.controls do
		local t = {}
		
		for Text, value in control do
			Flag = true
			
			for _, pattern in Patterns do
				if string.find(Text, pattern) then
					Flag = false
					break
				end
			end
			t[Text] = if Flag then math.floor(value * ScaledTENFOOTSCALE + 0.5) elseif string.find(Text, "TextSize$") then math.floor(value * Scale + 0.5) else value
		end
		Controls[i1] = t
	end
	Copy.controls = Controls
	local Copy2 = table.clone(p4.metrics.typography)
	
	for i2, value1 in Metrics.typography do
		Copy2[i2] = value1
	end
	local List = {}
	
	for _, value2 in Copy2 do
		if not table.find(List, value2.size) then
			table.insert(List, value2.size)
		end
	end
	table.sort(List)
	local t1 = {}
	local Largest = 0
	
	for i4, value3 in List do
		if Distant then
			Largest = math.max(math.floor(value3 * TENFOOTSCALE + 0.5), if i4 == 1 then 24 else 28, Largest + 1)
		else
			Largest = math.max(14, value3)
		end
		t1[value3] = math.floor(Largest * Scale + 0.5)
	end
	for i6, value5 in Copy2 do
		local Copy1 = table.clone(value5)
		Copy1.size = t1[value5.size]
		Copy2[i6] = Copy1
	end
	Copy.typography = Copy2
	local Chrome = Base.chrome
	local Assets = Base.assets
	
	if Scale ~= 1 then
		if Chrome then
			local t = {}
			
			for i5, value4 in Chrome do
				t[i5] = layer(value4, Scale)
			end
			Chrome = t
		end
		if Assets then
			local t2 = {}
			
			for i3, asset in Assets do
				local Copy3 = table.clone(asset)
				Copy3.sliceScale = (asset.sliceScale or 1) * Scale
				t2[i3] = Copy3
			end
			Assets = t2
		end
	end
	local config = {
		schema = Base.schema,
		identity = Base.identity,
		style = Base.style,
		metrics = Copy,
		chrome = Chrome,
		assets = Assets,
		icons = Base.icons,
		rules = Base.rules
	}
	
	return if table.isfrozen(Base) then FrozenFunction(config) else config
end

return {
	create = function(p5)
		-- upvalues: self (copy), self1 (copy), build (copy), AdaptiveModule (copy)
		local function derive(p6, Distant, Scale)
			-- upvalues: self (upval), self1 (upval), build (upval), p5 (copy)
			local SelfEntry = self[p6]
			local Base = if SelfEntry then SelfEntry.base else p6
			
			if not Distant and Scale == 1 then
				return Base
			end
			local Text = (if Distant then "far:" else "near:") .. tostring(Scale)
			local SelfEntry1 = self1[Base]
			
			if SelfEntry1 == nil then
				SelfEntry1 = setmetatable({}, { __mode = "v" })
				self1[Base] = SelfEntry1
			end
			local SelfEntry11 = if table.isfrozen(Base) then SelfEntry1[Text] else nil
			
			if SelfEntry11 then
				return SelfEntry11
			end
			local BuildResult = build(Base, p5, Distant, Scale)
			self[BuildResult] = { base = Base, distant = Distant, scale = Scale }
			
			if table.isfrozen(Base) then
				SelfEntry1[Text] = BuildResult
			end
			return BuildResult
		end
		
		return {
			forDistance = function(p6, p7)
				-- upvalues: self (upval), derive (copy)
				assert(p7 == "near" or p7 == "ten-foot", "Facet themes.forDistance: distance must be near or ten-foot")
				local SelfEntry = self[p6]
				
				return (derive(p6, p7 == "ten-foot", if SelfEntry then SelfEntry.scale else 1))
			end,
			forResolution = function(p6, p7, p8)
				-- upvalues: self (upval), derive (copy), AdaptiveModule (upval)
				local SelfEntry = self[p6]
				
				return (derive(p6, SelfEntry ~= nil and SelfEntry.distant, AdaptiveModule.resolutionScale(p7, p8)))
			end
		}
	end,
	resolutionScale = function(p5)
		-- upvalues: self (copy)
		local SelfEntry = if p5 then self[p5] else nil
		
		return if SelfEntry then SelfEntry.scale else 1
	end
}