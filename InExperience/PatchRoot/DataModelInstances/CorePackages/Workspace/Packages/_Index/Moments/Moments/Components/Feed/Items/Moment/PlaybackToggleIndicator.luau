local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local MomentContextModule = require(script.Parent.MomentContext)
local PlaybackToggleIndicatorMachineModule = require(script.Parent.playbackToggleIndicatorMachine)
local UseIsPlayingModule = require(Moments.Hooks.useIsPlaying)
local FFlagMomentsAutoplayAmpPolicy = require(Parent.SharedFlags).FFlagMomentsAutoplayAmpPolicy
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local config = { frequency = 4, dampingRatio = 1 }
local config1 = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

local function defaultSchedule(p1: number, p2) --[[ Line: 55 ]]
	local DelayedThread = task.delay(p1 / 1000, p2)
	
	return function() --[[ Line: 57 ]]
		-- upvalues: DelayedThread (copy)
		task.cancel(DelayedThread)
	end
end

return function(p1) --[[ Line: 68 | Named "PlaybackToggleIndicator" ]]
	-- upvalues: MomentContextModule (copy), UseTokensFunction (copy), UsePreferencesFunction (copy), ReactModule (copy), ReactOtterModule (copy), UseIsPlayingModule (copy), FFlagMomentsAutoplayAmpPolicy (copy), SignalsModule (copy), UseSignalStateFunction (copy), config (copy), config1 (copy), defaultSchedule (copy), PlaybackToggleIndicatorMachineModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy)
	local Controller = MomentContextModule.useMoment().controller
	local UseTokensResult = UseTokensFunction()
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseIsPlayingModuleResult = UseIsPlayingModule()
	local UseMemoResult = if FFlagMomentsAutoplayAmpPolicy then ReactModule.useMemo(function() --[[ Line: 79 ]]
		-- upvalues: SignalsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p2) --[[ Line: 80 ]]
			-- upvalues: Controller (upval)
			return if Controller == nil then "Idle" else Controller.getState(p2).readiness
		end)
	end, { Controller }) else nil
	local UseSignalStateResult = if FFlagMomentsAutoplayAmpPolicy then UseSignalStateFunction(UseMemoResult) else nil
	local UseRefResult = ReactModule.useRef(nil)
	
	function UseRefResult.current(p2) --[[ Line: 93 ]]
		-- upvalues: ReducedMotion (copy), ReactOtterModule (upval), config (upval), config1 (upval), UseAnimatedBindingResult2 (copy)
		UseAnimatedBindingResult2(if ReducedMotion then ReactOtterModule.instant(if p2 == "enter" then 1 else 0) elseif p2 == "enter" then ReactOtterModule.spring(1, config) else ReactOtterModule.ease(0, config1))
	end
	
	local UseRefResult1 = ReactModule.useRef(nil)
	UseRefResult1.current = p1.scheduleOverride or defaultSchedule
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 111 ]]
		-- upvalues: PlaybackToggleIndicatorMachineModule (upval), UseRefResult1 (copy), UseStateResult2 (copy), UseRefResult (copy)
		return PlaybackToggleIndicatorMachineModule({ dwellMs = 800, exitDurationMs = 150 }, {
			schedule = function(p2, p3) --[[ Line: 116 ]]
				-- upvalues: UseRefResult1 (upval)
				return UseRefResult1.current(p2, p3)
			end,
			setMounted = UseStateResult2,
			animate = function(p2) --[[ Line: 120 ]]
				-- upvalues: UseRefResult (upval)
				UseRefResult.current(p2)
			end
		})
	end, {})
	ReactModule.useEffect(function() --[[ Line: 128 ]]
		-- upvalues: UseMemoResult1 (copy)
		return function() --[[ Line: 129 ]]
			-- upvalues: UseMemoResult1 (upval)
			UseMemoResult1.dispose()
		end
	end, { UseMemoResult1 })
	ReactModule.useEffect(function() --[[ Line: 137 ]]
		-- upvalues: Controller (copy), SignalsModule (upval), UseMemoResult1 (copy)
		if Controller == nil then return end
		local UserToggleNonce = nil
		
		return (SignalsModule.createEffect(function(p2) --[[ Line: 142 ]]
			-- upvalues: Controller (upval), UserToggleNonce (ref), UseMemoResult1 (upval)
			local UserToggleNonce1 = Controller.getUserToggleNonce(p2)
			
			if UserToggleNonce == nil then
				UserToggleNonce = UserToggleNonce1
				
				return
			end
			if UserToggleNonce1 ~= UserToggleNonce then
				UserToggleNonce = UserToggleNonce1
				UseMemoResult1.notifyUserToggle()
				
				return
			end
		end))
	end, { Controller, UseMemoResult1 })
	local NoUseIsPlayingModuleResult = if FFlagMomentsAutoplayAmpPolicy then UseSignalStateResult == "Ready" and not UseIsPlayingModuleResult else nil
	
	return if UseStateResult or FFlagMomentsAutoplayAmpPolicy and NoUseIsPlayingModuleResult then ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center",
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromOffset(64, 64),
		scale = UseAnimatedBindingResult:map(function(p2: number): number --[[ Line: 164 ]]
			-- upvalues: FFlagMomentsAutoplayAmpPolicy (upval), NoUseIsPlayingModuleResult (copy)
			return if FFlagMomentsAutoplayAmpPolicy and NoUseIsPlayingModuleResult then 1 else p2 * 0.25 + 0.75
		end)
	}, {
		Circle = ReactModule.createElement(View, {
			tag = "row align-x-center align-y-center size-full radius-circle clip bg-over-media-0",
			GroupTransparency = UseAnimatedBindingResult:map(function(p2: number): number --[[ Line: 171 ]]
				-- upvalues: FFlagMomentsAutoplayAmpPolicy (upval), NoUseIsPlayingModuleResult (copy)
				return if FFlagMomentsAutoplayAmpPolicy and NoUseIsPlayingModuleResult then 0 else 1 - p2
			end)
		}, {
			Glyph = ReactModule.createElement(Icon, {
				name = if UseIsPlayingModuleResult then IconName.PauseLarge else IconName.PlayLarge,
				size = IconSize.Large,
				style = UseTokensResult.Color.Content.Emphasis
			})
		})
	}) else nil
end