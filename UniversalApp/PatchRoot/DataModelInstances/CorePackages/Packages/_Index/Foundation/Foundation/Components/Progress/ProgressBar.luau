local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactIsModule = require(parent.ReactIs)
local constantsModule = require(script.Parent.constants)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local useProgressBindingModule = require(script.Parent.useProgressBinding)
local useProgressVariantsModule = require(script.Parent.useProgressVariants)
local usePulseBindingModule = require(foundation.Utility.usePulseBinding)
local useRotationModule = require(foundation.Utility.useRotation)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(foundation.Enums.ProgressShape)

local function getBarSequenceFromProgress(p0) --[[ line: 27 ]]
	p0 = p0 or 0
	
	if p0 == 0 then
		return NumberSequence.new(1)
	elseif p0 == 1 then
		return NumberSequence.new(0)
	end
	local list = {
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(p0, 0),
		NumberSequenceKeypoint.new(math.min(p0 + 0.001, 1), 1)
	}
	
	if p0 < 0.999 then
		table.insert(list, NumberSequenceKeypoint.new(1, 1))
	end
	return NumberSequence.new(list)
end

local t = {
	size = require(foundation.Enums.ProgressSize).Medium,
	width = UDim.new(1, 0)
}

return function(p1) --[[ line: 63 | named "ProgressBar" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), usePreferencesModule (ref), useProgressVariantsModule (ref), useProgressBindingModule (ref), useRotationModule (ref), usePulseBindingModule (ref), constantsModule (ref), reactIsModule (ref), getBarSequenceFromProgress (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref)
	local var17 = withDefaultsModule(p1, t)
	local var18 = useTokensModule()
	local var19 = usePreferencesModule()
	local var20 = useProgressVariantsModule(var18, var17.size)
	local var21, var22 = useProgressBindingModule(var17.value)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var17, {
		tag = "radius-small bg-shift-400",
		Size = UDim2.new(var17.width, UDim.new(0, var20.bar.height)),
		ref = var17.ref
	}), {
		Fill = reactModule.createElement(viewModule, {
			tag = "size-full radius-small",
			backgroundStyle = var18.Color.Content.Emphasis,
			ref = var17.ref,
			testId = `{var17.testId}--fill`
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Color = ColorSequence.new(var18.Color.Content.Emphasis.Color3),
				Transparency = if var22 then usePulseBindingModule(1 / constantsModule.INDETERMINATE_SHIMMER_SPEED):map(function(p2) --[[ line: 94 ]]
					-- upvalues: var19 (ref), var18 (ref)
					return if var19.reducedMotion then NumberSequence.new(p2) else NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.2, 1),
						NumberSequenceKeypoint.new(0.5, var18.Color.Content.Emphasis.Transparency),
						NumberSequenceKeypoint.new(0.8, 1),
						NumberSequenceKeypoint.new(1, 1)
					})
				end) elseif reactIsModule.isBinding(var21) then var21:map(getBarSequenceFromProgress) else getBarSequenceFromProgress(var21),
				Offset = if var22 then useRotationModule(1):map(function(p3) --[[ line: 109 ]]
					-- upvalues: var19 (ref), constantsModule (copy)
					return if var19.reducedMotion then Vector2.new(0, 0) else Vector2.new(p3 * constantsModule.INDETERMINATE_SHIMMER_SPEED % 360 / 360 * 2 - 1, 0)
				end) else nil
			})
		})
	})
end