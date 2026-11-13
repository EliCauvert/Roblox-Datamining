local DiagnosticsModule = require("./diagnostics")
local _ = require("./reactive/types")
local config = { x = 0.5, y = 0.5 }

local function _(p1: number): boolean
	return type(p1) == "number" and (p1 == p1 and p1 > -1e999) and p1 < 1e999
end

local function number(Bottom: number, p1, p2)
	-- upvalues: DiagnosticsModule (copy)
	return if type(Bottom) == "number" and Bottom == Bottom and Bottom > -1e999 and Bottom < 1e999 and (p2 == nil or Bottom >= p2) then Bottom else DiagnosticsModule.raise("geometry/invalid-number", ("%s must be a finite number"):format(p1), {
		actual = DiagnosticsModule.describe(Bottom),
		expected = if p2 == nil then "a finite number" else ("a finite number of %s or more"):format((tostring(p2)))
	})
end

local function bounds(Within, Text)
	-- upvalues: DiagnosticsModule (copy), number (copy)
	if type(Within) ~= "table" then
		return DiagnosticsModule.raise("geometry/invalid-rect", ("%s must be a rect"):format(Text), {
			expected = "{ left, top, right, bottom } with finite numbers",
			actual = DiagnosticsModule.describe(Within)
		})
	end
	assert(type(Within) == "table")
	local t = {}
	
	for i, value in Within do
		if type(i) == "string" then
			t[i] = value
		end
	end
	local config = {
		left = number(t.left, Text .. ".left"),
		top = number(t.top, Text .. ".top"),
		right = number(t.right, Text .. ".right"),
		bottom = number(t.bottom, Text .. ".bottom")
	}
	
	return if config.right < config.left or config.bottom < config.top then DiagnosticsModule.raise("geometry/invalid-rect", ("%s has a negative extent"):format(Text), {
		expected = "right at or after left, and bottom at or after top",
		fix = "clamp a computed width or height at zero before building the rect",
		actual = ("left %s, right %s, top %s, bottom %s"):format(tostring(config.left), tostring(config.right), tostring(config.top), (tostring(config.bottom)))
	}) else config
end

local function size(Max, Text)
	-- upvalues: DiagnosticsModule (copy), number (copy)
	if type(Max) == "table" then
		number(Max.width, Text .. ".width", 0)
		number(Max.height, Text .. ".height", 0)
		
		return Max
	else
		return DiagnosticsModule.raise("geometry/invalid-size", ("%s must be a size"):format(Text), {
			expected = "{ width, height } with finite numbers of zero or more",
			actual = DiagnosticsModule.describe(Max)
		})
	end
end

local _ = function(Left, Top, Width, Height)
	return {
		left = Left,
		top = Top,
		right = Left + Width,
		bottom = Top + Height,
		width = Width,
		height = Height
	}
end

local _ = function(p1, p2): boolean
	return p1.left < p2.right and (p2.left < p1.right and p1.top < p2.bottom) and p2.top < p1.bottom
end

local _ = function(p1, p2): boolean
	return p1.left <= p2.left and (p2.right <= p1.right and p1.top <= p2.top) and p2.bottom <= p1.bottom
end

return table.freeze({
	safeArea = function(p1, p2, p3)
		-- upvalues: size (copy), number (copy), DiagnosticsModule (copy)
		size(p1, "viewport")
		local Margin = if p3 == nil then 0 else number(p3, "margin", 0)
		local InsetsLeft = 0
		local InsetsTop = 0
		local InsetsRight = 0
		local InsetsBottom = 0
		
		if p2 ~= nil then
			if type(p2) ~= "table" then
				return DiagnosticsModule.raise("geometry/invalid-insets", "insets must be a table", {
					expected = "{ left?, top?, right?, bottom? } with numbers of zero or more",
					actual = DiagnosticsModule.describe(p2)
				})
			end
			InsetsLeft = if p2.left == nil then 0 else number(p2.left, "insets.left", 0)
			InsetsTop = if p2.top == nil then 0 else number(p2.top, "insets.top", 0)
			InsetsRight = if p2.right == nil then 0 else number(p2.right, "insets.right", 0)
			InsetsBottom = if p2.bottom == nil then 0 else number(p2.bottom, "insets.bottom", 0)
		end
		local NewInsetsLeft = InsetsLeft + Margin
		local NewInsetsTop = InsetsTop + Margin
		local Largest = math.max(0, p1.width - InsetsLeft - InsetsRight - Margin * 2)
		local Largest1 = math.max(0, p1.height - InsetsTop - InsetsBottom - Margin * 2)
		
		return {
			left = NewInsetsLeft,
			top = NewInsetsTop,
			right = NewInsetsLeft + Largest,
			bottom = NewInsetsTop + Largest1,
			width = Largest,
			height = Largest1
		}
	end,
	fit = function(p1, p2, p3)
		-- upvalues: bounds (copy), size (copy), DiagnosticsModule (copy), config (copy)
		bounds(p1, "available")
		size(p2, "desired")
		local T = if p3 == nil then {} else p3
		local Min = if T.min == nil then nil else size(T.min, "min")
		local Max = if T.max == nil then nil else size(T.max, "max")
		
		if Min ~= nil and Max ~= nil and (Max.width < Min.width or Max.height < Min.height) then
			return DiagnosticsModule.raise("geometry/invalid-limits", "the minimum size exceeds the maximum size", {
				expected = "a minimum no larger than the maximum on both axes",
				actual = ("min %sx%s, max %sx%s"):format(tostring(Min.width), tostring(Min.height), tostring(Max.width), (tostring(Max.height)))
			})
		end
		local Vector = config
		repeat
			if T.anchor == nil then break end
			Vector = T.anchor
			
			if type(Vector) == "table" then
				local X: number = Vector.x
				
				if type(X) == "number" and (X == X and (X > -1e999 and X < 1e999)) then
					local Y: number = Vector.y
					
					if type(Y) == "number" and (Y == Y and (Y > -1e999 and Y < 1e999)) and Vector.x >= 0 and Vector.x <= 1 and Vector.y >= 0 and Vector.y <= 1 then continue end
				end
			end
			return DiagnosticsModule.raise("geometry/invalid-anchor", "an anchor needs x and y fractions between 0 and 1", {
				expected = "{ x = 0.5, y = 0.5 } centers; { x = 0, y = 0 } is the top left",
				actual = DiagnosticsModule.describe(T.anchor)
			})
		until true
		local config1 = {
			width = p1.right - p1.left,
			height = p1.bottom - p1.top
		}
		local Width = p2.width
		local Height = p2.height
		
		if Max ~= nil then
			Width = math.min(Width, Max.width)
			Height = math.min(Height, Max.height)
		end
		if Min ~= nil then
			Width = math.max(Width, Min.width)
			Height = math.max(Height, Min.height)
		end
		local Smallest = math.min(Width, config1.width)
		local Smallest1 = math.min(Height, config1.height)
		local NewLeft = p1.left + (config1.width - Smallest) * Vector.x
		local NewTop = p1.top + (config1.height - Smallest1) * Vector.y
		
		return {
			left = NewLeft,
			top = NewTop,
			right = NewLeft + Smallest,
			bottom = NewTop + Smallest1,
			width = Smallest,
			height = Smallest1
		}
	end,
	overlaps = function(p1, p2): boolean
		-- upvalues: bounds (copy)
		local A = bounds(p1, "a")
		local B = bounds(p2, "b")
		
		return A.left < B.right and (B.left < A.right and A.top < B.bottom) and B.top < A.bottom
	end,
	contains = function(p1, p2): boolean
		-- upvalues: bounds (copy)
		local Outer = bounds(p1, "outer")
		local Inner = bounds(p2, "inner")
		
		return Outer.left <= Inner.left and (Inner.right <= Outer.right and Outer.top <= Inner.top) and Inner.bottom <= Outer.bottom
	end,
	firstClear = function(List, p1)
		-- upvalues: DiagnosticsModule (copy), bounds (copy)
		if type(List) ~= "table" then
			return DiagnosticsModule.raise("geometry/invalid-candidates", "candidates must be a list of rects", {
				expected = "an array of { left, top, right, bottom } in preference order",
				actual = DiagnosticsModule.describe(List)
			})
		end
		local T = if p1 == nil then {} else p1
		local Within = if T.within == nil then nil else bounds(T.within, "within")
		local T1 = if T.reserved == nil then {} else T.reserved
		local t = {}
		
		for i, value in T1 do
			t[i] = bounds(value, ("reserved[%d]"):format(i))
		end
		local NoWithin = nil
		for i1, value1 in List do
			local BoundsResult = bounds(value1, ("candidates[%d]"):format(i1))
			NoWithin = Within == nil or Within.left <= BoundsResult.left and (BoundsResult.right <= Within.right and (Within.top <= BoundsResult.top and BoundsResult.bottom <= Within.bottom))
			
			if NoWithin then
				for _, value2 in t do
					if BoundsResult.left < value2.right and (value2.left < BoundsResult.right and (BoundsResult.top < value2.bottom and BoundsResult.bottom > value2.top)) then
						NoWithin = false
						break
					end
				end
			end
			if NoWithin then
				return value1, i1
			end
		end
		return nil, nil
	end
})