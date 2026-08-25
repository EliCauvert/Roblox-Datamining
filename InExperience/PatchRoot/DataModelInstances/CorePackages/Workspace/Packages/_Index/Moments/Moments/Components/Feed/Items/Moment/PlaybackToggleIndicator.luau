local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local momentContextModule = require(script.Parent.MomentContext)
local playbackToggleIndicatorMachineModule = require(script.Parent.playbackToggleIndicatorMachine)
local icon = foundationModule.Icon
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local usePreferences = foundationModule.Hooks.usePreferences
local useSignalState = signalsReactModule.useSignalState
local t = { frequency = 4, dampingRatio = 1 }
local t_1 = { duration = 0.15, easingStyle = Enum.EasingStyle.Quad }

local function defaultSchedule(p0, p1)
	local delayedThread = task.delay(p0 / 1000, p1)
	
	return function()
		-- upvalues: delayedThread (ref)
		task.cancel(delayedThread)
	end
end

return function(p2)
	-- upvalues: momentContextModule (ref), useTokens (ref), usePreferences (ref), reactModule (ref), reactOtterModule (ref), signalsModule (ref), useSignalState (ref), t (ref), t_1 (ref), defaultSchedule (ref), playbackToggleIndicatorMachineModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref)
	local controller = momentContextModule.useMoment().controller
	local var11 = useTokens()
	local reducedMotion = usePreferences().reducedMotion
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactOtterModule.useAnimatedBinding(0)
	local var16 = useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), controller (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: controller (copy)
			return if controller == nil then false else controller.getState(p3).isPlaying
		end)
	end, { controller }))
	local var17 = reactModule.useRef(nil)
	
	function var17.current(p4)
		-- upvalues: reducedMotion (ref), reactOtterModule (copy), t (copy), t_1 (copy), var15 (ref)
		var15(if reducedMotion then reactOtterModule.instant(if p4 == "enter" then 1 else 0) elseif p4 == "enter" then reactOtterModule.spring(1, t) else reactOtterModule.ease(0, t_1))
	end
	
	local var18 = reactModule.useRef(nil)
	var18.current = p2.scheduleOverride or defaultSchedule
	local var19 = reactModule.useMemo(function()
		-- upvalues: playbackToggleIndicatorMachineModule (copy), var18 (ref), var13 (ref), var17 (ref)
		return playbackToggleIndicatorMachineModule({ dwellMs = 800, exitDurationMs = 150 }, {
			schedule = function(p5, p6)
				-- upvalues: var18 (copy)
				return var18.current(p5, p6)
			end,
			setMounted = var13,
			animate = function(p7)
				-- upvalues: var17 (copy)
				var17.current(p7)
			end
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var19 (ref)
		return function()
			-- upvalues: var19 (copy)
			var19.dispose()
		end
	end, { var19 })
	reactModule.useEffect(function()
		-- upvalues: controller (ref), signalsModule (copy), var19 (ref)
		if controller == nil then
			return
		end
		local var20 = nil
		
		return signalsModule.createEffect(function(p8)
			-- upvalues: controller (copy), var20 (write), var19 (copy)
			local userToggleNonce = controller.getUserToggleNonce(p8)
			
			if var20 == nil then
				var20 = userToggleNonce
				
				return
			elseif userToggleNonce == var20 then
				return
			end
			var20 = userToggleNonce
			var19.notifyUserToggle()
		end)
	end, { controller, var19 })
	
	return if var12 then reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center",
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromOffset(64, 64),
		scale = var14:map(function(p9)
			return p9 * 0.25 + 0.75
		end)
	}, {
		Circle = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-full radius-circle clip bg-over-media-0",
			GroupTransparency = var14:map(function(p10)
				return 1 - p10
			end)
		}, {
			Glyph = reactModule.createElement(icon, {
				name = if var16 then iconName.PauseLarge else iconName.PlayLarge,
				size = iconSize.Large,
				style = var11.Color.Content.Emphasis
			})
		})
	}) else nil
end