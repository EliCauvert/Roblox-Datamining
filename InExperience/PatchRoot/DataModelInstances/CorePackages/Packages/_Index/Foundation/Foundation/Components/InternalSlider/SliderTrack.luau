local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local SizeAnchorModule = require(Foundation.Components.Slider.SizeAnchor)
local ViewModule = require(Foundation.Components.View)
local CalculateSliderValueFractionModule = require(Foundation.Components.Slider.calculateSliderValueFraction)
local _ = require(Foundation.Components.Slider.useSliderVariants)
local _ = require(script.Parent.useSliderThumbs)

return function(p1)
	-- upvalues: ReactModule (copy), ViewModule (copy), CalculateSliderValueFractionModule (copy), FlagsModule (copy), SizeAnchorModule (copy)
	return ReactModule.createElement(ViewModule, {
		tag = p1.bar.tag,
		Size = if p1.isVertical then UDim2.new(0, p1.bar.height, 1, 0) else UDim2.new(1, 0, 0, p1.bar.height),
		testId = `{p1.testId}--bar`
	}, {
		Fill = ReactModule.createElement(ViewModule, {
			tag = p1.fill.tag,
			AnchorPoint = if p1.isRange or not p1.isVertical then nil else Vector2.new(0, 1),
			Position = if p1.isRange then p1.thumbSpan:map(function(p2)
				return p2.Position
			end) elseif p1.isVertical then UDim2.fromScale(0, 1) else nil,
			Size = if p1.isRange then p1.thumbSpan:map(function(p2)
				return p2.Size
			end) else p1.singleValue:map(function(p2): UDim2
				-- upvalues: CalculateSliderValueFractionModule (upval), p1 (copy)
				local SliderValueFractionModule = CalculateSliderValueFractionModule(p2, p1.range)
				
				return if p1.isVertical then UDim2.fromScale(1, SliderValueFractionModule) else UDim2.fromScale(SliderValueFractionModule, 1)
			end),
			testId = `{p1.testId}--fill`
		}, {
			SizeAnchor = if FlagsModule.FoundationSliderAutoSizeFix then ReactModule.createElement(SizeAnchorModule) else nil
		})
	})
end