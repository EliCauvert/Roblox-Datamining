local HoldToPlay = script:FindFirstAncestor("HoldToPlay")
local Parent = HoldToPlay.Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local UseButtonHoldFunction = FocusNavigationUtilsModule.useButtonHold
local ConstantsModule = require(HoldToPlay.Constants)
local ButtonHoldStateEnum = FocusNavigationUtilsModule.ButtonHoldStateEnum

return function(p1, p2) --[[ Line: 13 | Named "useHoldToPlayStateAndCallbacks" ]]
	-- upvalues: UseButtonHoldFunction (copy), ConstantsModule (copy), ReactModule (copy), ButtonHoldStateEnum (copy)
	local UseButtonHoldResult = UseButtonHoldFunction(p1 or ConstantsModule.SIGNAL_HOLD_INTENT_SECONDS, p2 or ConstantsModule.SIGNAL_HOLD_COMPLETE_SECONDS)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local IsHoldStateMatch: boolean = UseButtonHoldResult.holdState == ButtonHoldStateEnum.HOLDING or UseButtonHoldResult.holdState == ButtonHoldStateEnum.COMPLETED
	
	return {
		selectedEntry = UseStateResult3,
		selectedIndex = UseStateResult1,
		selectedNavigationUniverseId = UseStateResult,
		onHoldableFocused = ReactModule.useCallback(function(p3, p4, p5) --[[ Line: 24 ]]
			-- upvalues: UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy)
			UseStateResult2_2(p3)
			UseStateResult2_1(p4)
			UseStateResult2(p5)
		end, {}),
		onHoldableUnfocused = ReactModule.useCallback(function() --[[ Line: 30 ]]
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
			UseStateResult2(nil)
			UseStateResult2_1(nil)
			UseStateResult2_2(nil)
		end, {}),
		shouldRenderHoldToPlayLauncher = UseStateResult3 ~= nil,
		shouldDisableHoldable = ReactModule.useCallback(function(SelectedIndex): boolean --[[ Line: 38 ]]
			-- upvalues: IsHoldStateMatch (copy), UseStateResult1 (copy)
			return IsHoldStateMatch and (UseStateResult1 and SelectedIndex == UseStateResult1)
		end, { IsHoldStateMatch, UseStateResult1 }),
		holdState = UseButtonHoldResult.holdState,
		holdProgress = UseButtonHoldResult.holdProgress,
		cancelHold = UseButtonHoldResult.cancelHold,
		holdToPlayEventHandler = UseButtonHoldResult.eventHandler
	}
end