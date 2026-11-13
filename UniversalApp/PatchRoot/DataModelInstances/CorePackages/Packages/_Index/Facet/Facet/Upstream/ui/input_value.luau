local _ = require("./types")

local function _(Value: number): boolean
	return type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
end

local function defaultFormat(ClampedValue: number)
	if ClampedValue == 0 then
		return "0"
	elseif ClampedValue % 1 == 0 then
		return string.format("%d", ClampedValue)
	else
		local v1 = string.format("%.2f", ClampedValue):gsub("0+$", ""):gsub("%.$", "")
		
		return if v1 == "-0" then "0" else v1
	end
end

return function(p1, Callback)
	-- upvalues: defaultFormat (copy)
	local Min = p1.min or 0
	local Max = p1.max or 1
	assert(type(Min) == "number" and (Min == Min and math.abs(Min) < 1e999 and (type(Max) == "number" and (Max == Max and math.abs(Max) < 1e999 and Min < Max))), "Facet value control: finite min must be below max")
	
	local function _(): number
		-- upvalues: Callback (copy), p1 (copy)
		local CallbackResult: number = Callback(p1.step)
		assert(CallbackResult == nil or type(CallbackResult) == "number" and (CallbackResult == CallbackResult and math.abs(CallbackResult) < 1e999 and CallbackResult > 0), "Facet value control: step must be positive and finite")
		
		return CallbackResult
	end
	
	local CallbackResult: number = Callback(p1.step)
	assert(CallbackResult == nil or type(CallbackResult) == "number" and (CallbackResult == CallbackResult and math.abs(CallbackResult) < 1e999 and CallbackResult > 0), "Facet value control: step must be positive and finite")
	
	local _ = function(Value: number): number
		-- upvalues: Min (copy), Max (copy)
		local IsMagnitudeBelow: boolean = type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
		
		return if IsMagnitudeBelow then math.clamp(Value, Min, Max) else Min
	end
	
	return {
		min = Min,
		max = Max,
		quantize = function(Value: number)
			-- upvalues: Min (copy), Max (copy), Callback (copy), p1 (copy)
			local IsMagnitudeBelow: boolean = type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
			local ClampedValue = if IsMagnitudeBelow then math.clamp(Value, Min, Max) else Min
			local CallbackResult: number = Callback(p1.step)
			assert(CallbackResult == nil or type(CallbackResult) == "number" and (CallbackResult == CallbackResult and math.abs(CallbackResult) < 1e999 and CallbackResult > 0), "Facet value control: step must be positive and finite")
			
			if CallbackResult then
				local NewMin = Min + math.floor((ClampedValue - Min) / CallbackResult + 0.5) * CallbackResult
				local IsMagnitudeBelow1: boolean = type(NewMin) == "number" and NewMin == NewMin and math.abs(NewMin) < 1e999
				
				return if IsMagnitudeBelow1 then math.clamp(NewMin, Min, Max) else Min
			else
				return ClampedValue
			end
		end,
		format = function(Value: number)
			-- upvalues: p1 (copy), Min (copy), Max (copy), defaultFormat (upval)
			if p1.format then
				local IsMagnitudeBelow: boolean = type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
				local Success, Result = pcall(p1.format, if IsMagnitudeBelow then math.clamp(Value, Min, Max) else Min)
				
				if Success and type(Result) == "string" then
					return Result
				end
			end
			local IsMagnitudeBelow: boolean = type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
			
			return defaultFormat(if IsMagnitudeBelow then math.clamp(Value, Min, Max) else Min)
		end,
		fraction = function(Value: number): number
			-- upvalues: Min (copy), Max (copy)
			local IsMagnitudeBelow: boolean = type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
			
			return ((if IsMagnitudeBelow then math.clamp(Value, Min, Max) else Min) - Min) / (Max - Min)
		end,
		fromFraction = function(Value: number)
			-- upvalues: Min (copy), Max (copy), Callback (copy), p1 (copy)
			local NewMin = Min + math.clamp(Value, 0, 1) * (Max - Min)
			local IsMagnitudeBelow: boolean = type(NewMin) == "number" and NewMin == NewMin and math.abs(NewMin) < 1e999
			local ClampedValue = if IsMagnitudeBelow then math.clamp(NewMin, Min, Max) else Min
			local CallbackResult: number = Callback(p1.step)
			assert(CallbackResult == nil or type(CallbackResult) == "number" and (CallbackResult == CallbackResult and math.abs(CallbackResult) < 1e999 and CallbackResult > 0), "Facet value control: step must be positive and finite")
			
			if CallbackResult then
				local NewMin1 = Min + math.floor((ClampedValue - Min) / CallbackResult + 0.5) * CallbackResult
				local IsMagnitudeBelow1: boolean = type(NewMin1) == "number" and NewMin1 == NewMin1 and math.abs(NewMin1) < 1e999
				
				return if IsMagnitudeBelow1 then math.clamp(NewMin1, Min, Max) else Min
			else
				return ClampedValue
			end
		end,
		stepped = function(Value1: number, p2: number): number
			-- upvalues: Callback (copy), p1 (copy), Max (copy), Min (copy)
			local CallbackResult: number = Callback(p1.step)
			assert(CallbackResult == nil or type(CallbackResult) == "number" and (CallbackResult == CallbackResult and math.abs(CallbackResult) < 1e999 and CallbackResult > 0), "Facet value control: step must be positive and finite")
			local v1 = (CallbackResult or (Max - Min) / 100) * (if p2 < 0 then -1 else 1)
			local IsMagnitudeBelow: boolean = type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) < 1e999
			local Value = (if IsMagnitudeBelow then math.clamp(Value1, Min, Max) else Min) + v1
			local IsMagnitudeBelow1: boolean = type(Value) == "number" and Value == Value and math.abs(Value) < 1e999
			local ClampedValue: number = if IsMagnitudeBelow1 then math.clamp(Value, Min, Max) else Min
			local CallbackResult1: number = Callback(p1.step)
			assert(CallbackResult1 == nil or type(CallbackResult1) == "number" and (CallbackResult1 == CallbackResult1 and math.abs(CallbackResult1) < 1e999 and CallbackResult1 > 0), "Facet value control: step must be positive and finite")
			local ClampedValue1 = nil
			
			if CallbackResult1 then
				local NewMin = Min + math.floor((ClampedValue - Min) / CallbackResult1 + 0.5) * CallbackResult1
				local IsMagnitudeBelow2: boolean = type(NewMin) == "number" and NewMin == NewMin and math.abs(NewMin) < 1e999
				ClampedValue1 = if IsMagnitudeBelow2 then math.clamp(NewMin, Min, Max) else Min
			else
				ClampedValue1 = ClampedValue
			end
			if CallbackResult then
				local IsMagnitudeBelow3: boolean = type(Value1) == "number" and Value1 == Value1 and math.abs(Value1) < 1e999
				local ClampedValue2: number = if IsMagnitudeBelow3 then math.clamp(Value1, Min, Max) else Min
				local CallbackResult2: number = Callback(p1.step)
				assert(CallbackResult2 == nil or type(CallbackResult2) == "number" and (CallbackResult2 == CallbackResult2 and math.abs(CallbackResult2) < 1e999 and CallbackResult2 > 0), "Facet value control: step must be positive and finite")
				local ClampedValue21 = nil
				
				if CallbackResult2 then
					local NewMin = Min + math.floor((ClampedValue2 - Min) / CallbackResult2 + 0.5) * CallbackResult2
					local IsMagnitudeBelow4: boolean = type(NewMin) == "number" and NewMin == NewMin and math.abs(NewMin) < 1e999
					ClampedValue21 = if IsMagnitudeBelow4 then math.clamp(NewMin, Min, Max) else Min
				else
					ClampedValue21 = ClampedValue2
				end
				if ClampedValue1 == ClampedValue21 then
					local Value2 = ClampedValue1 + v1
					local IsMagnitudeBelow5: boolean = type(Value2) == "number" and Value2 == Value2 and math.abs(Value2) < 1e999
					
					return if IsMagnitudeBelow5 then math.clamp(Value2, Min, Max) else Min
				end
			end
			return ClampedValue1
		end
	}
end