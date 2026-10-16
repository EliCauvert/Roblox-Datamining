local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.SduiCompat)
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UsePulseBindingFunction = FoundationModule.Hooks.usePulseBinding
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseClockFunction = require(Parent.ReactUtils).useClock
local _Color3 = Color3.new(1, 1, 1)

local function generateShimmerGradient(p1): ColorSequence --[[ Line: 37 ]]
	local Interpolated = p1:Lerp(Color3.new(0, 0, 0), 0.2)
	
	return ColorSequence.new({
		ColorSequenceKeypoint.new(0, p1),
		ColorSequenceKeypoint.new(0.25, Interpolated),
		ColorSequenceKeypoint.new(0.5, (p1:Lerp(Color3.new(1, 1, 1), 0.8))),
		ColorSequenceKeypoint.new(0.75, Interpolated),
		ColorSequenceKeypoint.new(1, p1)
	})
end

return function(p1) --[[ Line: 50 | Named "useShimmerText" ]]
	-- upvalues: UsePreferencesFunction (copy), UseTokensFunction (copy), UseClockFunction (copy), UsePulseBindingFunction (copy), ReactModule (copy), generateShimmerGradient (copy), _Color3 (copy)
	local UsePreferencesResult = UsePreferencesFunction()
	local UseTokensResult = UseTokensFunction()
	local UseClockResult = UseClockFunction()
	local UsePulseBindingResult = UsePulseBindingFunction(0.75)
	local Largest: number = if p1.animationSpeed == nil then 0.75 else math.max(p1.animationSpeed, 0)
	local GradientOffset = if p1.gradientOffset == nil or p1.gradientOffset <= 0 then 1.05 else p1.gradientOffset
	local Default = UseTokensResult.Color.Content.Default
	local TextStyle = p1.textStyle or Default
	local _Color3_1 = TextStyle.Color3 or Default.Color3
	local Transparency = TextStyle.Transparency or Default.Transparency
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 67 ]]
		-- upvalues: generateShimmerGradient (upval), _Color3_1 (copy)
		return generateShimmerGradient(_Color3_1)
	end, { _Color3_1 })
	
	return if p1.isShimmerEnabled == false then { children = p1.children, textStyle = p1.textStyle } elseif UsePreferencesResult.reducedMotion then {
		children = p1.children,
		textStyle = UsePulseBindingResult:map(function(p2: number) --[[ Line: 81 ]]
			-- upvalues: _Color3_1 (copy), Transparency (copy)
			return {
				Color3 = _Color3_1,
				Transparency = math.min(Transparency + p2 * 0.1, 1)
			}
		end)
	} else {
		children = {
			Content = ReactModule.createElement(ReactModule.Fragment, nil, p1.children),
			ShimmerGradient = ReactModule.createElement("UIGradient", {
				Rotation = 15,
				Color = UseMemoResult,
				Offset = UseClockResult:map(function(p2): Vector2 --[[ Line: 95 ]]
					-- upvalues: Largest (copy), GradientOffset (copy)
					return Vector2.new(p2 * Largest % GradientOffset - GradientOffset / 2, 0)
				end)
			})
		},
		textStyle = { Color3 = _Color3, Transparency = Transparency }
	}
end