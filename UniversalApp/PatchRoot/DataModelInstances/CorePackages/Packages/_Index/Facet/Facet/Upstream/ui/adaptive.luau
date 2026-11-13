local FreezeModule = require("./freeze")
local FreezeModuleResult = FreezeModule({ regular = 600, wide = 1000 })
local config = { compact = 1, regular = 2, wide = 3 }

local function _(p1)
	return if type(p1) == "number" and p1 == p1 then p1 else nil
end

return (FreezeModule({
	TEN_FOOT_SCALE = 1.5,
	BREAKPOINTS = FreezeModuleResult,
	HEIGHT_BREAKPOINTS = FreezeModuleResult,
	DEFAULT_STACK_ABOVE = FreezeModuleResult.regular,
	sizeClass = function(p1): string
		-- upvalues: FreezeModuleResult (copy)
		local v1 = if type(p1) == "number" and p1 == p1 then p1 else nil
		
		return if v1 == nil or v1 < FreezeModuleResult.regular then "compact" elseif v1 < FreezeModuleResult.wide then "regular" else "wide"
	end,
	heightClass = function(p1): string
		-- upvalues: FreezeModuleResult (copy)
		local v1 = if type(p1) == "number" and p1 == p1 then p1 else nil
		
		return if v1 == nil or v1 < FreezeModuleResult.regular then "short" elseif v1 < FreezeModuleResult.wide then "medium" else "tall"
	end,
	orientationFor = function(p1, p2): string
		return if p2 < p1 then "landscape" elseif p1 < p2 then "portrait" else "square"
	end,
	axisFor = function(p1, p2): string
		-- upvalues: FreezeModuleResult (copy)
		local StackAbove = if p2 and p2.stackAbove then p2.stackAbove else FreezeModuleResult.regular
		local v1 = if type(p1) == "number" and p1 == p1 then p1 else nil
		
		return if v1 == nil or StackAbove > v1 then "y" else "x"
	end,
	columnsFor = function(p1, p2: number, p3): number
		assert(type(p2) == "number" and p2 > 0, "Facet adaptive.columnsFor: minColumnWidth must be a positive number")
		local Largest = math.max(0, p3 or 0)
		local v1 = if type(p1) == "number" and p1 == p1 then p1 else nil
		
		return if v1 == nil or v1 <= p2 then 1 else math.max(1, (math.floor((v1 + Largest) / (p2 + Largest))))
	end,
	sizeClassAtLeast = function(p1, p2): boolean
		-- upvalues: config (copy)
		local Entry = config[p1]
		local Entry1 = config[p2]
		assert(Entry ~= nil and Entry1 ~= nil, "Facet adaptive.sizeClassAtLeast: expected compact, regular or wide")
		
		return Entry1 <= Entry
	end,
	navPlacement = function(p1): string
		return if p1.tenFoot then "topBar" elseif p1.sizeClass == "compact" then "bottomBar" elseif p1.heightClass == "short" then "bottomBarCompact" elseif p1.primary == "pointer" then "sidebar" elseif p1.primary == "gamepad" and p1.displaySize == "Small" then "bottomBar" else "topBar"
	end,
	isTenFoot = function(p1): boolean
		return if p1.viewingDistance == "ten-foot" or p1.viewingDistance == "near" then p1.viewingDistance == "ten-foot" elseif p1.tenFootInterface == true then p1.touch ~= true and p1.mouse ~= true else p1.displaySize == "Large" and (p1.touch ~= true and p1.mouse ~= true)
	end,
	overscanInsets = function(p1, p2)
		-- upvalues: FreezeModule (copy)
		local Floored = math.floor(((if type(p1) == "number" and p1 == p1 then p1 else nil) or 0) * 90 / 1920 + 0.5)
		local Floored1 = math.floor(((if type(p2) == "number" and p2 == p2 then p2 else nil) or 0) * 60 / 1080 + 0.5)
		
		return FreezeModule({
			top = Floored1,
			left = Floored,
			bottom = Floored1,
			right = Floored
		})
	end,
	resolutionScale = function(Value: number, Value1: number): number
		return if Value == Value and Value1 == Value1 and math.abs(Value) ~= 1e999 and math.abs(Value1) ~= 1e999 then math.max(1, math.min(Value, Value1) / 1080) else 1
	end
}))