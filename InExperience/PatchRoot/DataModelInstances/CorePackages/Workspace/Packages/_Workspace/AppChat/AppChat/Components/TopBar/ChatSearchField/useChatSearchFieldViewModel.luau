local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local fFlagLuaAppAllowNilHookDepsCleanup = require(parent.SharedFlags).FFlagLuaAppAllowNilHookDepsCleanup
local inputHandlersModule = require(parent.InputHandlers)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.ChatSearchFieldView)

return function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), userInputService (ref), fFlagLuaAppAllowNilHookDepsCleanup (ref)
	local var1 = reactModule.useRef(nil)
	local onExit = p1.onExit
	local onChanged = p1.onChanged
	local var2 = useLocalization({ placeholder = "Feature.Chat.Label.SearchWord" })
	local var3 = reactModule.useRef(Enum.KeyCode.None)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var4 (ref)
		var3.current = if p2 then p2.KeyCode else Enum.KeyCode.None
		var4.current = false
	end, {})
	local var6 = reactModule.useRef(nil)
	local var7 = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(inputHandlersModule.onRelease(function(p2)
		-- upvalues: var3 (ref), onExit (ref)
		local current = var3.current
		local var8 = current ~= Enum.KeyCode.None and (p2.eventData ~= nil and p2.eventData.KeyCode == current)
		
		if not var8 and onExit == nil then return end
		p2:cancel()
		
		if var8 then
			var3.current = Enum.KeyCode.None
			
			return
		end
		onExit()
	end), { onExit or false }), nil, var6)
	local var8 = reactModule.useCallback(function()
		-- upvalues: userInputService (copy), var6 (ref)
		local focusedTextBox = userInputService:GetFocusedTextBox()
		local current = var6.current
		
		if focusedTextBox and current and not focusedTextBox:IsDescendantOf(current) then
			focusedTextBox:ReleaseFocus()
			
			return true
		end
		return false
	end, {})
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), var6 (ref), var8 (ref), var1 (ref)
		local inputBeganConnection = userInputService.InputBegan:Connect(function(p2)
			-- upvalues: var6 (copy), userInputService (copy), var8 (copy), var1 (copy)
			local current = var6.current
			local focusedTextBox = userInputService:GetFocusedTextBox()
			
			if not (if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true) or not current or (not focusedTextBox or focusedTextBox:IsDescendantOf(current)) then return end
			local basePlayerGui = current:FindFirstAncestorWhichIsA("BasePlayerGui")
			
			if not basePlayerGui then return end
			for i, v in basePlayerGui:GetGuiObjectsAtPosition(p2.Position.X, p2.Position.Y) do
				if v.Active then
					if v:IsDescendantOf(current) and var8() and var1.current then
						var1.current.focus()
					end
					return
				end
			end
		end)
		
		return function()
			-- upvalues: inputBeganConnection (ref)
			inputBeganConnection:Disconnect()
		end
	end, { var8 })
	local var9 = reactFocusNavigationModule.useFocusGuiObject()
	local var10 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var11 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var10 (ref), var9 (ref)
		if var6.current and var10 and var10.focusedGuiObject:getValue() ~= nil then
			var9(var6.current)
		end
	end, {
		var9,
		if fFlagLuaAppAllowNilHookDepsCleanup then var10 else var10 or false
	})
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var11 (ref), var1 (ref), onChanged (ref)
		if p2 == "" then
			var4.current = true
			var11()
			
			if var1.current then
				var1.current.focus()
			end
		end
		onChanged(p2)
	end, { onChanged, var11 })
	local onFocusGained = p1.onFocusGained
	local var13 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), onFocusGained (ref)
		if var4.current then
			var4.current = false
			
			return
		elseif onFocusGained then
			onFocusGained()
		end
	end, { onFocusGained })
	local shouldAutoFocus = p1.shouldAutoFocus or false
	reactModule.useEffect(function()
		-- upvalues: shouldAutoFocus (ref), var11 (ref), var8 (ref), var1 (ref)
		if shouldAutoFocus then
			var11()
			var8()
			
			if var1.current then
				var1.current.focus()
			end
		end
	end, { shouldAutoFocus, var11, var8 })
	
	return {
		text = p1.text,
		placeholder = var2.placeholder,
		onChanged = var12,
		onFocusGained = if onFocusGained then var13 else nil,
		onFocusLost = var5,
		inputRef = var1,
		containerRef = var7,
		testId = p1.testId,
		LayoutOrder = p1.LayoutOrder
	}
end