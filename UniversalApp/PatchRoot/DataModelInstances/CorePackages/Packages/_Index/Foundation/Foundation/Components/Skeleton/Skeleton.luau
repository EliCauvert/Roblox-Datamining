local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local useClock = require(parent.ReactUtils).useClock
local components = foundation.Components
local _ = require(components.Types)
local viewModule = require(components.View)
local radiusModule = require(foundation.Enums.Radius)
local usePreferencesModule = require(foundation.Providers.Preferences.usePreferences)
local usePulseBindingModule = require(foundation.Utility.usePulseBinding)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local lerpModule = require(foundation.Utility.lerp)
local t = {
	testId = "--foundation-skeleton",
	radius = radiusModule.None,
	Size = UDim2.fromScale(1, 1)
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 39 | named "Skeleton" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useClock (ref), usePulseBindingModule (ref), useTokensModule (ref), usePreferencesModule (ref), radiusModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), lerpModule (ref)
	local var11 = withDefaultsModule(p0, t)
	local var12 = useClock()
	local var13 = usePulseBindingModule(2)
	local var14 = useTokensModule()
	local var15 = usePreferencesModule()
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var11, {
		cornerRadius = if var11.radius ~= radiusModule.None then nil else UDim.new(0, var14.Radius[var11.radius]),
		backgroundStyle = if var15.reducedMotion then var13:map(function(p2) --[[ line: 53 ]]
			-- upvalues: var14 (ref), lerpModule (copy)
			return {
				Color3 = var14.Color.Shift.Shift_300.Color3,
				Transparency = lerpModule(var14.Color.Extended.White.White_10.Transparency, var14.Color.Extended.White.White_10.Transparency - 0.1, p2)
			}
		end) else var14.Color.Extended.White.White_100,
		Size = var11.Size,
		ref = p1
	}), {
		Gradient = if not var15.reducedMotion then reactModule.createElement("UIGradient", {
			Rotation = 15,
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, var14.Color.Shift.Shift_300.Color3),
				ColorSequenceKeypoint.new(0.5, var14.Color.Extended.White.White_30.Color3),
				ColorSequenceKeypoint.new(1, var14.Color.Shift.Shift_300.Color3)
			}),
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, var14.Color.Shift.Shift_300.Transparency),
				NumberSequenceKeypoint.new(0.5, var14.Color.Extended.White.White_30.Transparency),
				NumberSequenceKeypoint.new(1, var14.Color.Shift.Shift_300.Transparency)
			}),
			Offset = var12:map(function(p3) --[[ line: 81 ]]
				return Vector2.new(p3 * 2 % 3 - 1.5, 0)
			end)
		}) else nil
	})
end))