local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local SignalsModule = require(Parent.Signals)
local MomentContextModule = require(script.Parent.MomentContext)
local PlaybackToggleIndicatorMachineModule = require(script.Parent.playbackToggleIndicatorMachine)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local config = { frequency = 4, dampingRatio = 1 }
local config1 = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

local function defaultSchedule(p1: number, p2)
	local DelayedThread = task.delay(p1 / 1000, p2)
	
	return function()
		-- upvalues: DelayedThread (copy)
		task.cancel(DelayedThread)
	end
end

return function(p1)
	-- upvalues: MomentContextModule (copy), UseTokensFunction (copy), UsePreferencesFunction (copy), ReactModule (copy), ReactOtterModule (copy), SignalsModule (copy), UseSignalStateFunction (copy), config (copy), config1 (copy), defaultSchedule (copy), PlaybackToggleIndicatorMachineModule (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy)
	local Controller = MomentContextModule.useMoment().controller
	local UseTokensResult = UseTokensFunction()
	local ReducedMotion = UsePreferencesFunction().reducedMotion
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Controller (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: Controller (upval)
			return Controller ~= nil and Controller.getState(p2).isPlaying
		end)
	end, { Controller })))
	local UseRefResult = ReactModule.useRef(nil)
	
	function UseRefResult.current(p2)
		-- upvalues: ReducedMotion (copy), ReactOtterModule (upval), config (upval), config1 (upval), UseAnimatedBindingResult2 (copy)
		UseAnimatedBindingResult2(if ReducedMotion then ReactOtterModule.instant(if p2 == "enter" then 1 else 0) elseif p2 == "enter" then ReactOtterModule.spring(1, config) else ReactOtterModule.ease(0, config1))
	end
	
	local UseRefResult1 = ReactModule.useRef(nil)
	UseRefResult1.current = p1.scheduleOverride or defaultSchedule
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PlaybackToggleIndicatorMachineModule (upval), UseRefResult1 (copy), UseStateResult2 (copy), UseRefResult (copy)
		return PlaybackToggleIndicatorMachineModule({ dwellMs = 800, exitDurationMs = 150 }, {
			schedule = function(p2, p3)
				-- upvalues: UseRefResult1 (upval)
				return UseRefResult1.current(p2, p3)
			end,
			setMounted = UseStateResult2,
			animate = function(p2)
				-- upvalues: UseRefResult (upval)
				UseRefResult.current(p2)
			end
		})
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult.dispose()
		end
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: Controller (copy), SignalsModule (upval), UseMemoResult (copy)
		if Controller == nil then return end
		local UserToggleNonce = nil
		
		return (SignalsModule.createEffect(function(p2)
			-- upvalues: Controller (upval), UserToggleNonce (ref), UseMemoResult (upval)
			local UserToggleNonce1 = Controller.getUserToggleNonce(p2)
			
			if UserToggleNonce == nil then
				UserToggleNonce = UserToggleNonce1
				
				return
			end
			if UserToggleNonce1 ~= UserToggleNonce then
				UserToggleNonce = UserToggleNonce1
				UseMemoResult.notifyUserToggle()
				
				return
			end
		end))
	end, { Controller, UseMemoResult })
	
	return if UseStateResult then ReactModule.createElement(View, {
		tag = "position-center-center anchor-center-center",
		BackgroundTransparency = 1,
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
				name = if UseSignalStateResult then IconName.PauseLarge else IconName.PlayLarge,
				size = IconSize.Large,
				style = UseTokensResult.Color.Content.Emphasis
			})
		})
	}) else nil
end