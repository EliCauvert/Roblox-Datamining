local holdToPlay = script:FindFirstAncestor("HoldToPlay")
local parent = holdToPlay.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local useButtonHold = focusNavigationUtilsModule.useButtonHold
local constantsModule = require(holdToPlay.Constants)
local buttonHoldStateEnum = focusNavigationUtilsModule.ButtonHoldStateEnum

return function(p0, p1) --[[ line: 13 | named "useHoldToPlayStateAndCallbacks" ]]
	-- upvalues: useButtonHold (ref), constantsModule (ref), reactModule (ref), buttonHoldStateEnum (ref)
	local var4 = useButtonHold(p0 or constantsModule.SIGNAL_HOLD_INTENT_SECONDS, p1 or constantsModule.SIGNAL_HOLD_COMPLETE_SECONDS)
	local var5, var6 = reactModule.useState(nil)
	local var7, var8 = reactModule.useState(nil)
	local var9, var10 = reactModule.useState(nil)
	local var11 = if var4.holdState ~= buttonHoldStateEnum.HOLDING then var4.holdState == buttonHoldStateEnum.COMPLETED else true
	
	return {
		selectedEntry = var9,
		selectedIndex = var7,
		selectedNavigationUniverseId = var5,
		onHoldableFocused = reactModule.useCallback(function(p2, p3, p4) --[[ line: 24 ]]
			-- upvalues: var10 (ref), var8 (ref), var6 (ref)
			var10(p2)
			var8(p3)
			var6(p4)
		end, {}),
		onHoldableUnfocused = reactModule.useCallback(function() --[[ line: 30 ]]
			-- upvalues: var6 (ref), var8 (ref), var10 (ref)
			var6(nil)
			var8(nil)
			var10(nil)
		end, {}),
		shouldRenderHoldToPlayLauncher = var9 ~= nil,
		shouldDisableHoldable = reactModule.useCallback(function(p5) --[[ line: 38 ]]
			-- upvalues: var11 (ref), var7 (ref)
			return var11 and (var7 and p5 == var7)
		end, { var11, var7 }),
		holdState = var4.holdState,
		holdProgress = var4.holdProgress,
		cancelHold = var4.cancelHold,
		holdToPlayEventHandler = var4.eventHandler
	}
end