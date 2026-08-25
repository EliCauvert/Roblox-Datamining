local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local userInputService = game:GetService("UserInputService")
local usePositionOffsetForVirtualKeyboardModule = require(appChat.Hooks.usePositionOffsetForVirtualKeyboard)
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0)
	-- upvalues: useSelector (ref), usePositionOffsetForVirtualKeyboardModule (ref), reactModule (ref), userInputService (ref)
	local var4 = useSelector(function(p1)
		return if p1.GlobalGuiInset then p1.GlobalGuiInset.top else 0
	end)
	local var5 = if p0.parentViewRef then p0.parentViewRef.current else nil
	local var6 = usePositionOffsetForVirtualKeyboardModule({ isNearBottomOfScreen = true })
	local var7 = reactModule.useCallback(function()
		-- upvalues: userInputService (copy), var6 (ref), var5 (ref), var4 (ref), p0 (ref)
		local var8 = 0
		
		if userInputService.OnScreenKeyboardVisible then
			if var6 ~= nil then
				var8 = var6
			elseif var5 then
				var8 = var5.AbsolutePosition.Y + var5.AbsoluteSize.Y - (userInputService.OnScreenKeyboardPosition.Y - var4)
			end
		end
		if p0.onKeyboardOffsetChanged then
			p0.onKeyboardOffsetChanged(var8)
		end
	end, { var6, var4, p0.onKeyboardOffsetChanged, var5 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), userInputService (copy), var5 (ref)
		var7()
		local var9 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(var7)
		local var10 = userInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(var7)
		local var11 = if var5 then var5:GetPropertyChangedSignal("AbsoluteSize"):Connect(var7) else nil
		
		return function()
			-- upvalues: var9 (ref), var10 (ref), var11 (write)
			if var9 then
				var9:Disconnect()
			end
			if var10 then
				var10:Disconnect()
			end
			if var11 then
				var11:Disconnect()
			end
		end
	end, { var7, var5 })
	
	return nil
end