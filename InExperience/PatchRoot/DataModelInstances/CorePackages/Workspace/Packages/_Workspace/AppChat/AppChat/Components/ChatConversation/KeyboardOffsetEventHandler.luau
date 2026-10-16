local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UserInputService = game:GetService("UserInputService")
local UsePositionOffsetForVirtualKeyboardModule = require(AppChat.Hooks.usePositionOffsetForVirtualKeyboard)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1) --[[ Line: 16 ]]
	-- upvalues: UseSelectorFunction (copy), UsePositionOffsetForVirtualKeyboardModule (copy), ReactModule (copy), UserInputService (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 17 ]]
		return if p2.GlobalGuiInset then p2.GlobalGuiInset.top else 0
	end)
	local Current = if p1.parentViewRef then p1.parentViewRef.current else nil
	local UsePositionOffsetForVirtualKeyboardModuleResult = UsePositionOffsetForVirtualKeyboardModule({ isNearBottomOfScreen = true })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 23 ]]
		-- upvalues: UserInputService (upval), UsePositionOffsetForVirtualKeyboardModuleResult (copy), Current (copy), UseSelectorResult (copy), p1 (copy)
		local YDelta = 0
		
		if UserInputService.OnScreenKeyboardVisible then
			if UsePositionOffsetForVirtualKeyboardModuleResult == nil then
				if Current then
					YDelta = Current.AbsolutePosition.Y + Current.AbsoluteSize.Y - (UserInputService.OnScreenKeyboardPosition.Y - UseSelectorResult)
				end
			else
				YDelta = UsePositionOffsetForVirtualKeyboardModuleResult
			end
		end
		if p1.onKeyboardOffsetChanged then
			p1.onKeyboardOffsetChanged(YDelta)
		end
	end, {
		UsePositionOffsetForVirtualKeyboardModuleResult,
		UseSelectorResult,
		p1.onKeyboardOffsetChanged,
		Current
	})
	ReactModule.useEffect(function() --[[ Line: 40 ]]
		-- upvalues: UseResult (copy), UserInputService (upval), Current (copy)
		UseResult()
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(UseResult)
		local Connection1 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(UseResult)
		local Connection2 = if Current then Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(UseResult) else nil
		
		return function() --[[ Line: 53 ]]
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (ref)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
			if Connection2 then
				Connection2:Disconnect()
			end
		end
	end, { UseResult, Current })
	
	return nil
end