local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local momentContextModule = require(script.Parent.MomentContext)
local playbackToggleIndicatorMachineModule = require(script.Parent.playbackToggleIndicatorMachine)
local useIsPlayingModule = require(moments.Hooks.useIsPlaying)
local fFlagMomentsAutoplayAmpPolicy = sharedFlagsModule.FFlagMomentsAutoplayAmpPolicy
local useSignalState = signalsReactModule.useSignalState
local icon = foundationModule.Icon
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local t = { frequency = 4, dampingRatio = 1 }
local t_1 = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

local function defaultSchedule(p1, p2)
	local delayedThread = task.delay(p1 / 1000, p2)
	
	return function()
		-- upvalues: delayedThread (ref)
		task.cancel(delayedThread)
	end
end

return function(p1)
	-- upvalues: momentContextModule (ref), useTokens (ref), usePreferences (ref), reactModule (ref), reactOtterModule (ref), useIsPlayingModule (ref), fFlagMomentsAutoplayAmpPolicy (ref), signalsModule (ref), useSignalState (ref), t (ref), t_1 (ref), defaultSchedule (ref), playbackToggleIndicatorMachineModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref)
	local controller = momentContextModule.useMoment().controller
	local var1 = useTokens()
	local reducedMotion = usePreferences().reducedMotion
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactOtterModule.useAnimatedBinding(0)
	local var6 = useIsPlayingModule()
	local var7 = if fFlagMomentsAutoplayAmpPolicy then useSignalState(if fFlagMomentsAutoplayAmpPolicy then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: controller (copy)
			return if controller == nil then "Idle" else controller.getState(p2).readiness
		end)
	end, { controller }) else nil) else nil
	local var8 = reactModule.useRef(nil)
	
	function var21.current(p2)
		-- upvalues: reducedMotion (ref), reactOtterModule (copy), t (copy), t_1 (copy), var5 (ref)
		var5(if reducedMotion then reactOtterModule.instant(if p2 == "enter" then 1 else 0) elseif p2 == "enter" then reactOtterModule.spring(1, t) else reactOtterModule.ease(0, t_1))
	end
	
	local var9 = reactModule.useRef(nil)
	var9.current = p1.scheduleOverride or defaultSchedule
	local var10 = reactModule.useMemo(function()
		-- upvalues: playbackToggleIndicatorMachineModule (copy), var9 (ref), var3 (ref), var8 (ref)
		return playbackToggleIndicatorMachineModule({ dwellMs = 800, exitDurationMs = 150 }, {
			schedule = function(p2, p3)
				-- upvalues: var9 (copy)
				return var9.current(p2, p3)
			end,
			setMounted = var3,
			animate = function(p2)
				-- upvalues: var8 (copy)
				var8.current(p2)
			end
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var10 (ref)
		return function()
			-- upvalues: var10 (copy)
			var10.dispose()
		end
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: controller (ref), signalsModule (copy), var10 (ref)
		if controller == nil then
			return
		end
		local var11 = nil
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: controller (copy), var11 (write), var10 (copy)
			local userToggleNonce = controller.getUserToggleNonce(p2)
			
			if var11 == nil then
				var11 = userToggleNonce
				
				return
			elseif userToggleNonce == var11 then
				return
			end
			var11 = userToggleNonce
			var10.notifyUserToggle()
		end)
	end, { controller, var10 })
	local var11 = if fFlagMomentsAutoplayAmpPolicy then var7 == "Ready" and not var6 else nil
	
	return if var2 or fFlagMomentsAutoplayAmpPolicy and var11 then reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center",
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromOffset(64, 64),
		scale = var4:map(function(p2)
			-- upvalues: fFlagMomentsAutoplayAmpPolicy (copy), var11 (ref)
			return if fFlagMomentsAutoplayAmpPolicy and var11 then 1 else p2 * 0.25 + 0.75
		end)
	}, {
		Circle = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-full radius-circle clip bg-over-media-0",
			GroupTransparency = var4:map(function(p2)
				-- upvalues: fFlagMomentsAutoplayAmpPolicy (copy), var11 (ref)
				return if fFlagMomentsAutoplayAmpPolicy and var11 then 0 else 1 - p2
			end)
		}, {
			Glyph = reactModule.createElement(icon, {
				name = if var6 then iconName.PauseLarge else iconName.PlayLarge,
				size = iconSize.Large,
				style = var1.Color.Content.Emphasis
			})
		})
	}) else nil
end