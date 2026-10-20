local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local CalculateSliderStepValueModule = require(Foundation.Components.Slider.calculateSliderStepValue)

return function(p1)
	-- upvalues: ReactModule (copy), CalculateSliderStepValueModule (copy)
	local UseResult = ReactModule.useCallback(function(p2): number
		-- upvalues: p1 (copy)
		return (math.clamp((p2 - p1.range.Min) / (p1.range.Max - p1.range.Min), 0, 1))
	end, { p1.range.Min, p1.range.Max })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), CalculateSliderStepValueModule (upval)
		local NewMin = p1.range.Min + p2 * (p1.range.Max - p1.range.Min)
		
		return if p1.step then CalculateSliderStepValueModule(NewMin, p1.step, p1.range) else NewMin
	end, { p1.range, p1.step })
	local UseResult2 = ReactModule.useCallback(function(Value: number)
		-- upvalues: p1 (copy), UseResult (copy)
		local ClampedValue = math.clamp(Value, p1.range.Min, p1.range.Max)
		
		return if p1.step and p1.step > 0 then UseResult(p1.range.Min + math.floor((ClampedValue - p1.range.Min) / p1.step + 0.5) * p1.step) else UseResult(ClampedValue)
	end, { p1.range.Min, p1.range.Max, p1.step, UseResult })
	local UseResult3 = ReactModule.useCallback(function(p2: number)
		-- upvalues: UseResult2 (copy), p1 (copy)
		local UseResultResult = if p2 > 1 then UseResult2(p1.thumbs[p2 - 1].value:getValue()) else 0
		
		if p2 < #p1.thumbs then
			return UseResultResult, (UseResult2(p1.thumbs[p2 + 1].value:getValue()))
		else
			return UseResultResult, 1
		end
	end, { p1.thumbs, UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(p2: number, Largest): number
		-- upvalues: p1 (copy)
		local Largest1: number = Largest
		
		if p2 > 1 then
			Largest1 = math.max(Largest1, p1.thumbs[p2 - 1].value:getValue())
		end
		if p2 < #p1.thumbs then
			Largest1 = math.min(Largest1, p1.thumbs[p2 + 1].value:getValue())
		end
		return Largest1
	end, { p1.thumbs })
	local UseResult5 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (copy)
		if p3 ~= p1.thumbs[p2].value:getValue() then
			p1.onValueChanged(p2, p3)
		end
	end, { p1.thumbs, p1.onValueChanged })
	local UseResult6 = ReactModule.useCallback(function(p2, Value: number)
		-- upvalues: UseResult3 (copy), UseResult5 (copy), UseResult4 (copy), UseResult1 (copy)
		local UseResultResult, UseResultResult2 = UseResult3(p2)
		UseResult5(p2, UseResult4(p2, UseResult1((math.clamp(Value, UseResultResult, UseResultResult2)))))
	end, { UseResult3, UseResult5, UseResult4, UseResult1 })
	local Fractions = {}
	
	for i = 1, #p1.thumbs do
		Fractions[i] = p1.thumbs[i].value:map(UseResult)
	end
	return {
		fractions = Fractions,
		toFraction = UseResult,
		valueFromFraction = UseResult1,
		getSnappedFraction = UseResult2,
		getThumbBounds = UseResult3,
		clampToNeighbors = UseResult4,
		updateThumbValue = UseResult5,
		seekThumb = UseResult6
	}
end