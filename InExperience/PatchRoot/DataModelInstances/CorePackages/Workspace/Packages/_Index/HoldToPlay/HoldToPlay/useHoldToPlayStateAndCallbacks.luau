local holdToPlay = script:FindFirstAncestor("HoldToPlay")
local parent = holdToPlay.Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local useButtonHold = focusNavigationUtilsModule.useButtonHold
local constantsModule = require(holdToPlay.Constants)
local buttonHoldStateEnum = focusNavigationUtilsModule.ButtonHoldStateEnum

return function(p1, p2)
	-- upvalues: useButtonHold (ref), constantsModule (ref), reactModule (ref), buttonHoldStateEnum (ref)
	local var1 = useButtonHold(p1 or constantsModule.SIGNAL_HOLD_INTENT_SECONDS, p2 or constantsModule.SIGNAL_HOLD_COMPLETE_SECONDS)
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(nil)
	local var6, var7 = reactModule.useState(nil)
	local var8 = if var1.holdState ~= buttonHoldStateEnum.HOLDING then var1.holdState == buttonHoldStateEnum.COMPLETED else true
	
	return {
		selectedEntry = var6,
		selectedIndex = var4,
		selectedNavigationUniverseId = var2,
		onHoldableFocused = reactModule.useCallback(function(p3, p4, p5)
			-- upvalues: var7 (ref), var5 (ref), var3 (ref)
			var7(p3)
			var5(p4)
			var3(p5)
		end, {}),
		onHoldableUnfocused = reactModule.useCallback(function()
			-- upvalues: var3 (ref), var5 (ref), var7 (ref)
			var3(nil)
			var5(nil)
			var7(nil)
		end, {}),
		shouldRenderHoldToPlayLauncher = var6 ~= nil,
		shouldDisableHoldable = reactModule.useCallback(function(p3)
			-- upvalues: var8 (ref), var4 (ref)
			return var8 and (var4 and p3 == var4)
		end, { var8, var4 }),
		holdState = var1.holdState,
		holdProgress = var1.holdProgress,
		cancelHold = var1.cancelHold,
		holdToPlayEventHandler = var1.eventHandler
	}
end