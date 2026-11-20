local Parent = script:FindFirstAncestor("InterstitialAdPlayer").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local config = { frequency = 4, dampingRatio = 1 }
local config1 = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

return function(p1)
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), ReactModule (copy), ReactOtterModule (copy), config (copy), config1 (copy), View (copy), Icon (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), ReducedMotion (copy), ReactOtterModule (upval), config (upval), UseAnimatedBindingResult2 (copy), config1 (upval)
		if p1.toggleCount == 0 then return end
		UseStateResult2(true)
		UseAnimatedBindingResult2(if ReducedMotion then ReactOtterModule.instant(1) else ReactOtterModule.spring(1, config))
		local DelayedThread = task.delay(0.8, function()
			-- upvalues: ReducedMotion (upval), ReactOtterModule (upval), config1 (upval), UseAnimatedBindingResult2 (upval)
			UseAnimatedBindingResult2(if ReducedMotion then ReactOtterModule.instant(0) else ReactOtterModule.ease(0, config1))
		end)
		local DelayedThread1 = task.delay(0.9500000000000001, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		
		return function()
			-- upvalues: DelayedThread (copy), DelayedThread1 (copy)
			task.cancel(DelayedThread)
			task.cancel(DelayedThread1)
		end
	end, { p1.toggleCount, ReducedMotion })
	
	return if UseStateResult then ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center",
		ZIndex = 3,
		Size = UDim2.fromOffset(64, 64),
		scale = UseAnimatedBindingResult:map(function(p2: number): number
			return p2 * 0.25 + 0.75
		end)
	}, {
		Circle = ReactModule.createElement(View, {
			tag = "row align-x-center align-y-center size-full radius-circle clip bg-over-media-0",
			GroupTransparency = UseAnimatedBindingResult:map(function(p2: number): number
				return 1 - p2
			end)
		}, {
			Glyph = ReactModule.createElement(Icon, {
				name = if p1.isPlaying then "pause-large" else "play-large",
				size = IconSize.Large,
				style = UseTokensResult.Color.Content.Emphasis
			})
		})
	}) else nil
end