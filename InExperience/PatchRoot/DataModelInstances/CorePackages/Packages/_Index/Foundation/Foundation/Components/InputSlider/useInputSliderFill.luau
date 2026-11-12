local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local ReactOtterModule = require(Parent.ReactOtter)
local _ = require(Foundation.Components.Types)
local GetDisabledStyleModule = require(Foundation.Utility.getDisabledStyle)
local MapBindableModule = require(Foundation.Utility.mapBindable)
local UsePreferencesModule = require(Foundation.Providers.Preferences.usePreferences)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

local function _(Value: number, p1): number
	local MaxDelta = p1.Max - p1.Min
	
	return if MaxDelta <= 0 then 1 else (math.clamp(Value, p1.Min, p1.Max) - p1.Min) / MaxDelta
end

local function getGradientOffset(p1: number): Vector2
	return if p1 <= 0 then Vector2.new(-1, 0) elseif p1 >= 1 then Vector2.new(1, 0) else Vector2.new(p1 - 0.5, 0)
end

return function(p1, p2, p3, p4)
	-- upvalues: UseTokensModule (copy), UsePreferencesModule (copy), ReactIsModule (copy), ReactOtterModule (copy), ReactModule (copy), MapBindableModule (copy), getGradientOffset (copy), GetDisabledStyleModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UsePreferencesModuleResult = UsePreferencesModule()
	local IsBinding = ReactIsModule.isBinding(p1)
	local Value = if IsBinding then nil else p1
	local Value1 = Value or 0
	local MaxDelta = p2.Max - p2.Min
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(if MaxDelta <= 0 then 1 else (math.clamp(Value1, p2.Min, p2.Max) - p2.Min) / MaxDelta)
	ReactModule.useEffect(function()
		-- upvalues: Value (copy), p2 (copy), p4 (copy), UsePreferencesModuleResult (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseTokensModuleResult (copy)
		if Value == nil then return end
		local MaxDelta = p2.Max - p2.Min
		local ClampedValueRatio = if MaxDelta <= 0 then 1 else (math.clamp(Value, p2.Min, p2.Max) - p2.Min) / MaxDelta
		
		if p4.current and not UsePreferencesModuleResult.reducedMotion then
			UseAnimatedBindingResult2(ReactOtterModule.ease(ClampedValueRatio, {
				easingStyle = UseTokensModuleResult.Ease.StandardOut,
				duration = UseTokensModuleResult.Time.Time_300
			}))
		else
			UseAnimatedBindingResult2((ReactOtterModule.instant(ClampedValueRatio)))
		end
		p4.current = false
	end, {
		Value,
		p2,
		UsePreferencesModuleResult.reducedMotion,
		UseTokensModuleResult
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetDisabledStyleModule (upval), UseTokensModuleResult (copy), p3 (copy)
		local DisabledStyleModule = GetDisabledStyleModule(UseTokensModuleResult.Color.Shift.Shift_300, p3)
		local DisabledStyleModule1 = GetDisabledStyleModule(UseTokensModuleResult.Color.Shift.Shift_200, p3)
		
		return {
			color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, DisabledStyleModule.Color3),
				ColorSequenceKeypoint.new(0.499, DisabledStyleModule.Color3),
				ColorSequenceKeypoint.new(0.5, DisabledStyleModule1.Color3),
				ColorSequenceKeypoint.new(1, DisabledStyleModule1.Color3)
			}),
			transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, DisabledStyleModule.Transparency or 0),
				NumberSequenceKeypoint.new(0.499, DisabledStyleModule.Transparency or 0),
				NumberSequenceKeypoint.new(0.5, DisabledStyleModule1.Transparency or 0),
				NumberSequenceKeypoint.new(1, DisabledStyleModule1.Transparency or 0)
			})
		}
	end, { UseTokensModuleResult, p3 })
	
	return {
		color = UseMemoResult.color,
		transparency = UseMemoResult.transparency,
		offset = ReactModule.useMemo(function()
			-- upvalues: IsBinding (copy), MapBindableModule (upval), p1 (copy), p2 (copy), UseAnimatedBindingResult (copy), getGradientOffset (upval)
			return MapBindableModule(if IsBinding then MapBindableModule(p1, function(Value: number): number
				-- upvalues: p2 (upval)
				local MaxDelta = p2.Max - p2.Min
				
				return if MaxDelta <= 0 then 1 else (math.clamp(Value, p2.Min, p2.Max) - p2.Min) / MaxDelta
			end) else UseAnimatedBindingResult, getGradientOffset)
		end, { IsBinding, p1, p2, UseAnimatedBindingResult })
	}
end