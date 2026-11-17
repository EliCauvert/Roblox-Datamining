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
	local CountChips = #p1.chips
	local NewCountChips: number = if p1.animateChips and CountChips > 0 then (CountChips - 1) * 0.15 + 0.25 else 0
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ seconds = if ReducedMotion then NewCountChips else 0 })
	local Current = ReactModule.useRef({ count = 0, duration = 0, startTimes = {} }).current
	
	if CountChips < Current.count then
		Current.count = 0
		Current.startTimes = {}
		Current.duration = 0
	end
	if p1.animateChips then
		local Value = if ReducedMotion and Current.duration == 0 then 0 else UseMotionResult.seconds:getValue()
		for i = Current.count + 1, CountChips do
			local StartTime: number = Current.startTimes[i - 1]
			Current.startTimes[i] = if StartTime == nil then Value else math.max(Value, StartTime + 0.15)
		end
		if Current.count < CountChips then
			Current.duration = Current.startTimes[CountChips] + 0.25
		end
	end
	Current.count = CountChips
	local Duration = if p1.animateChips then Current.duration else 0
	ReactModule.useEffect(function()
		-- upvalues: Duration (copy), UseMotionResult (copy), UseMotionResult2 (copy), MotionModule (upval), ReducedMotion (copy)
		local Largest = math.max(0, Duration - UseMotionResult.seconds:getValue())
		UseMotionResult2(MotionModule.createState({ seconds = Duration }, {
			default = MotionModule.transition({
				duration = if ReducedMotion then 0 else Largest,
				easingStyle = Enum.EasingStyle.Linear
			})
		}))
	end, {
		UseMotionResult2,
		Duration,
		ReducedMotion,
		UseMotionResult.seconds
	})
	local ChipAnimationStates = {}
	
	for chip in p1.chips do
		local StartTime = Current.startTimes[chip] or 0
		ChipAnimationStates[chip] = {
			hasStarted = UseMotionResult.seconds:map(function(p2): boolean
				-- upvalues: p1 (copy), StartTime (copy)
				return not p1.animateChips or StartTime <= p2
			end),
			groupTransparency = UseMotionResult.seconds:map(function(p2): number
				-- upvalues: p1 (copy), StartTime (copy)
				return if p1.animateChips then 1 - math.clamp((p2 - StartTime) / 0.25, 0, 1) else 0
			end)
		}
	end
	return {
		chips = p1.chips,
		chipGroupRef = p1.chipGroupRef,
		chipAnimationStates = ChipAnimationStates,
		skeletonCount = p1.skeletonCount,
		tokens = UseTokensResult
	}
end