local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local _ = require(script.Parent.AnimatedChipGroupView)
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UsePreferencesFunction (copy), UseTokensFunction (copy), MotionModule (copy), ReactModule (copy)
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseTokensResult = UseTokensFunction()
	local Seconds = (#p1.chips - 1) * 0.15 + 0.25
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ seconds = if ReducedMotion then Seconds else 0 })
	ReactModule.useEffect(function()
		-- upvalues: UseMotionResult2 (copy), MotionModule (upval), Seconds (copy), ReducedMotion (copy)
		UseMotionResult2(MotionModule.createState({ seconds = Seconds }, {
			default = MotionModule.transition({
				duration = if ReducedMotion then 0 else Seconds,
				easingStyle = Enum.EasingStyle.Linear
			})
		}))
	end, { UseMotionResult2, Seconds, ReducedMotion })
	local ChipAnimationStates = {}
	
	for chip in p1.chips do
		local v1 = 0.15 * (chip - 1)
		ChipAnimationStates[chip] = {
			hasStarted = UseMotionResult.seconds:map(function(p2): boolean
				-- upvalues: v1 (copy)
				return v1 <= p2
			end),
			groupTransparency = UseMotionResult.seconds:map(function(p2): number
				-- upvalues: v1 (copy)
				return 1 - math.clamp((p2 - v1) / 0.25, 0, 1)
			end)
		}
	end
	return {
		chips = p1.chips,
		chipGroupRef = p1.chipGroupRef,
		chipAnimationStates = ChipAnimationStates,
		tokens = UseTokensResult
	}
end