local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local userInputService = game:GetService("UserInputService")
local usePositionOffsetForVirtualKeyboardModule = require(appChat.Hooks.usePositionOffsetForVirtualKeyboard)
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useSelector (ref), usePositionOffsetForVirtualKeyboardModule (ref), reactModule (ref), userInputService (ref)
	local var1 = useSelector(function(p2)
		return if p2.GlobalGuiInset then p2.GlobalGuiInset.top else 0
	end)
	local var2 = if p1.parentViewRef then p1.parentViewRef.current else nil
	local var3 = usePositionOffsetForVirtualKeyboardModule({ isNearBottomOfScreen = true })
	local var4 = reactModule.useCallback(function()
		-- upvalues: userInputService (copy), var3 (ref), var2 (ref), var1 (ref), p1 (ref)
		local var5 = 0
		
		if userInputService.OnScreenKeyboardVisible then
			if var3 ~= nil then
				var5 = var3
			elseif var2 then
				var5 = var2.AbsolutePosition.Y + var2.AbsoluteSize.Y - (userInputService.OnScreenKeyboardPosition.Y - var1)
			end
		end
		if p1.onKeyboardOffsetChanged then
			p1.onKeyboardOffsetChanged(var5)
		end
	end, { var3, var1, p1.onKeyboardOffsetChanged, var2 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), userInputService (copy), var2 (ref)
		var4()
		local var5 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var4)
		local var6 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var4)
		local var7 = if var2 then var2:GetPropertyChangedSignal("AbsoluteSize"):Connect(var4) else nil
		
		return function()
			-- upvalues: var5 (ref), var6 (ref), var7 (write)
			if var5 then
				var5:Disconnect()
			end
			if var6 then
				var6:Disconnect()
			end
			if var7 then
				var7:Disconnect()
			end
		end
	end, { var4, var2 })
	
	return nil
end