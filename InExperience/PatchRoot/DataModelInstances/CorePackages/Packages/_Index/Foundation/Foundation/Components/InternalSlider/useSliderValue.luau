local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local UseBindableModule = require(Foundation.Utility.useBindable)
local SliderTypeModule = require(Foundation.Enums.SliderType)
local _ = require(script.Parent.useSliderThumbs)

return function(p1, p2, p3)
	-- upvalues: SliderTypeModule (copy), UseBindableModule (copy), ReactModule (copy)
	local IsTypeMatch = p1.type == SliderTypeModule.Range
	local UseBindableModuleResult = UseBindableModule(if p1.type == SliderTypeModule.Range then 0 else p1.value)
	local UseBindableModuleResult1 = UseBindableModule(if p1.type == SliderTypeModule.Range then p1.value else NumberRange.new(0))
	
	return {
		thumbs = ReactModule.useMemo(function()
			-- upvalues: IsTypeMatch (copy), UseBindableModuleResult1 (copy), p3 (copy), UseBindableModuleResult (copy), p2 (copy)
			return if IsTypeMatch then {
				{
					value = UseBindableModuleResult1:map(function(p4)
						return p4.Min
					end),
					testId = `{p3}--min`
				},
				{
					value = UseBindableModuleResult1:map(function(p4)
						return p4.Max
					end),
					testId = `{p3}--max`
				}
			} else {
				{
					value = UseBindableModuleResult:map(function(Value: number): number
						-- upvalues: p2 (upval)
						return (math.clamp(Value, p2.Min, p2.Max))
					end),
					testId = `{p3}--thumb`
				}
			}
		end, {
			IsTypeMatch, UseBindableModuleResult1, UseBindableModuleResult, p2.Min, p2.Max,
			p3
		}),
		onValueChanged = ReactModule.useCallback(function(p4, MinValue)
			-- upvalues: p1 (copy), SliderTypeModule (upval), UseBindableModuleResult1 (copy)
			if p1.type == SliderTypeModule.Range then
				if p1.onValueChanged then
					local Value = UseBindableModuleResult1:getValue()
					p1.onValueChanged(if p4 == 1 then NumberRange.new(MinValue, Value.Max) else NumberRange.new(Value.Min, MinValue))
					
					return
				end
			elseif p1.onValueChanged then
				p1.onValueChanged(MinValue)
			end
		end, { p1.type, p1.onValueChanged, UseBindableModuleResult1 }),
		singleValue = UseBindableModuleResult
	}
end