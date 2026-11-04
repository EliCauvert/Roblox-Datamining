local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local CalculateSliderStepValueModule = require(Foundation.Components.Slider.calculateSliderStepValue)
local CalculateSliderValueFractionModule = require(Foundation.Components.Slider.calculateSliderValueFraction)
local GetThumbOffsetModule = require(script.Parent.ThumbLayout.getThumbOffset)
local ToThumbFractionModule = require(script.Parent.ThumbLayout.toThumbFraction)
local ToThumbTrackFractionModule = require(script.Parent.ThumbLayout.toThumbTrackFraction)

local function _(Vector, p1)
	return if p1 then Vector.Y else Vector.X
end

return function(p1)
	-- upvalues: ReactModule (copy), CalculateSliderValueFractionModule (copy), CalculateSliderStepValueModule (copy), ToThumbTrackFractionModule (copy), ToThumbFractionModule (copy), GetThumbOffsetModule (copy)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: CalculateSliderValueFractionModule (upval), p1 (copy)
		return CalculateSliderValueFractionModule(p2, p1.range)
	end, { p1.range })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), CalculateSliderStepValueModule (upval)
		local NewMin = p1.range.Min + p2 * (p1.range.Max - p1.range.Min)
		
		return if p1.step then CalculateSliderStepValueModule(NewMin, p1.step, p1.range) else NewMin
	end, { p1.range, p1.step })
	local UseResult2 = ReactModule.useCallback(function(p2, p3: number)
		-- upvalues: p1 (copy)
		if p1.step and p1.step > 0 then
			local MinRatio = (p2 - p1.range.Min) / p1.step
			local ScaledLargest = math.max(1, (math.abs(MinRatio))) * 0.000001
			
			return p1.range.Min + (if p3 > 0 then math.ceil(MinRatio - ScaledLargest) else math.floor(MinRatio + ScaledLargest)) * p1.step
		else
			return p2
		end
	end, { p1.range.Min, p1.step })
	local UseResult3 = ReactModule.useCallback(function(p2: number, Largest): number
		-- upvalues: p1 (copy), UseResult2 (copy)
		local Step = if p1.step and p1.step > 0 then p1.step else 0.01 * (p1.range.Max - p1.range.Min)
		local Value: number = p1.thumbs[p2].value:getValue()
		local Largest1: number = Largest
		
		if p2 > 1 then
			local Value1: number = p1.thumbs[p2 - 1].value:getValue()
			Largest1 = math.max(Largest1, Value1, (math.min(UseResult2(Value1 + Step, 1), Value)))
		end
		if p2 < #p1.thumbs then
			local Value2: number = p1.thumbs[p2 + 1].value:getValue()
			Largest1 = math.min(Largest1, Value2, (math.max(UseResult2(Value2 - Step, -1), Value)))
		end
		return Largest1
	end, {
		p1.thumbs,
		p1.range.Min,
		p1.range.Max,
		p1.step,
		UseResult2
	})
	local UseResult4 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (copy)
		if p3 ~= p1.thumbs[p2].value:getValue() then
			p1.onValueChanged(p2, p3)
		end
	end, { p1.thumbs, p1.onValueChanged })
	local UseResult5 = ReactModule.useCallback(function(p2, Value: number)
		-- upvalues: UseResult4 (copy), UseResult3 (copy), UseResult1 (copy)
		UseResult4(p2, UseResult3(p2, UseResult1((math.clamp(Value, 0, 1)))))
	end, { UseResult4, UseResult3, UseResult1 })
	local Fractions = {}
	
	for i = 1, #p1.thumbs do
		Fractions[i] = p1.thumbs[i].value:map(UseResult)
	end
	local CountThumbs = #p1.thumbs
	local UseResult6 = ReactModule.useCallback(function(p2)
		-- upvalues: ToThumbTrackFractionModule (upval), UseResult (copy), p1 (copy), CountThumbs (copy)
		local KnobScale = p1.getKnobScale()
		
		return ToThumbTrackFractionModule(UseResult(p1.thumbs[p2].value:getValue()), p2, CountThumbs, if p1.isVertical then KnobScale.Y else KnobScale.X)
	end, {
		p1.thumbs,
		UseResult,
		CountThumbs,
		p1.getKnobScale,
		p1.isVertical
	})
	local UseResult7 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (copy), UseResult5 (copy), ToThumbFractionModule (upval), CountThumbs (copy)
		local KnobScale = p1.getKnobScale()
		UseResult5(p2, ToThumbFractionModule(p3, p2, CountThumbs, if p1.isVertical then KnobScale.Y else KnobScale.X))
	end, { UseResult5, CountThumbs, p1.getKnobScale, p1.isVertical })
	local TrackFractions = {}
	
	for i1 = 1, CountThumbs do
		TrackFractions[i1] = ReactModule.joinBindings({ fraction = Fractions[i1], knobScale = p1.knobScale }):map(function(p2)
			-- upvalues: ToThumbTrackFractionModule (upval), i1 (copy), CountThumbs (copy), p1 (copy)
			local KnobScale = p2.knobScale
			
			return ToThumbTrackFractionModule(p2.fraction, i1, CountThumbs, if p1.isVertical then KnobScale.Y else KnobScale.X)
		end)
	end
	local Positions = {}
	
	for i2 = 1, CountThumbs do
		Positions[i2] = ReactModule.joinBindings({ fraction = Fractions[i2], knobScale = p1.knobScale }):map(function(p2): UDim2
			-- upvalues: GetThumbOffsetModule (upval), i2 (copy), CountThumbs (copy), p1 (copy)
			local KnobScale = p2.knobScale
			local NewFraction = p2.fraction + GetThumbOffsetModule(p2.fraction, i2, CountThumbs, if p1.isVertical then KnobScale.Y else KnobScale.X, p1.isContained)
			
			return if p1.isVertical then UDim2.fromScale(0.5, 1 - NewFraction) else UDim2.fromScale(NewFraction, 0.5)
		end)
	end
	return {
		fractions = Fractions,
		trackFractions = TrackFractions,
		positions = Positions,
		span = ReactModule.joinBindings({
			first = Fractions[1],
			last = Fractions[CountThumbs],
			knobScale = p1.knobScale
		}):map(function(p2)
			-- upvalues: p1 (copy), GetThumbOffsetModule (upval), CountThumbs (copy)
			local KnobScale = p2.knobScale
			local Y = if p1.isVertical then KnobScale.Y else KnobScale.X
			local NewFirst = p2.first + GetThumbOffsetModule(p2.first, 1, CountThumbs, Y, p1.isContained)
			local NewLast = p2.last + GetThumbOffsetModule(p2.last, CountThumbs, CountThumbs, Y, p1.isContained)
			local YScale = NewLast - NewFirst
			
			return if p1.isVertical then {
				Position = UDim2.fromScale(0, 1 - NewLast),
				Size = UDim2.fromScale(1, YScale)
			} else {
				Position = UDim2.fromScale(NewFirst, 0),
				Size = UDim2.fromScale(YScale, 1)
			}
		end),
		getThumbTrackFraction = UseResult6,
		seekThumbToTrackFraction = UseResult7,
		toFraction = UseResult,
		valueFromFraction = UseResult1,
		clampToNeighbors = UseResult3,
		updateThumbValue = UseResult4,
		seekThumb = UseResult5
	}
end