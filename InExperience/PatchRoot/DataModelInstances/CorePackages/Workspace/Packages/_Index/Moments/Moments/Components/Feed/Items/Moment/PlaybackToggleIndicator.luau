local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local signalsModule = require(parent.Signals)
local momentContextModule = require(script.Parent.MomentContext)
local playbackToggleIndicatorMachineModule = require(script.Parent.playbackToggleIndicatorMachine)
local useIsPlayingModule = require(moments.Hooks.useIsPlaying)
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
	-- upvalues: momentContextModule (ref), useTokens (ref), usePreferences (ref), reactModule (ref), reactOtterModule (ref), useIsPlayingModule (ref), t (ref), t_1 (ref), defaultSchedule (ref), playbackToggleIndicatorMachineModule (ref), signalsModule (ref), view (ref), icon (ref), iconName (ref), iconSize (ref)
	local controller = momentContextModule.useMoment().controller
	local var1 = useTokens()
	local reducedMotion = usePreferences().reducedMotion
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactOtterModule.useAnimatedBinding(0)
	local var6 = useIsPlayingModule()
	local var7 = reactModule.useRef(nil)
	
	function var18.current(p2)
		-- upvalues: reducedMotion (ref), reactOtterModule (copy), t (copy), t_1 (copy), var5 (ref)
		var5(if reducedMotion then reactOtterModule.instant(if p2 == "enter" then 1 else 0) elseif p2 == "enter" then reactOtterModule.spring(1, t) else reactOtterModule.ease(0, t_1))
	end
	
	local var8 = reactModule.useRef(nil)
	var8.current = p1.scheduleOverride or defaultSchedule
	local var9 = reactModule.useMemo(function()
		-- upvalues: playbackToggleIndicatorMachineModule (copy), var8 (ref), var3 (ref), var7 (ref)
		return playbackToggleIndicatorMachineModule({ dwellMs = 800, exitDurationMs = 150 }, {
			schedule = function(p2, p3)
				-- upvalues: var8 (copy)
				return var8.current(p2, p3)
			end,
			setMounted = var3,
			animate = function(p2)
				-- upvalues: var7 (copy)
				var7.current(p2)
			end
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var9 (ref)
		return function()
			-- upvalues: var9 (copy)
			var9.dispose()
		end
	end, { var9 })
	reactModule.useEffect(function()
		-- upvalues: controller (ref), signalsModule (copy), var9 (ref)
		if controller == nil then
			return
		end
		local var10 = nil
		
		return signalsModule.createEffect(function(p2)
			-- upvalues: controller (copy), var10 (write), var9 (copy)
			local userToggleNonce = controller.getUserToggleNonce(p2)
			
			if var10 == nil then
				var10 = userToggleNonce
				
				return
			elseif userToggleNonce == var10 then
				return
			end
			var10 = userToggleNonce
			var9.notifyUserToggle()
		end)
	end, { controller, var9 })
	
	return if var2 then reactModule.createElement(view, {
		tag = "position-center-center anchor-center-center",
		BackgroundTransparency = 1,
		ZIndex = 3,
		Size = UDim2.fromOffset(64, 64),
		scale = var4:map(function(p2)
			return p2 * 0.25 + 0.75
		end)
	}, {
		Circle = reactModule.createElement(view, {
			tag = "row align-x-center align-y-center size-full radius-circle clip bg-over-media-0",
			GroupTransparency = var4:map(function(p2)
				return 1 - p2
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