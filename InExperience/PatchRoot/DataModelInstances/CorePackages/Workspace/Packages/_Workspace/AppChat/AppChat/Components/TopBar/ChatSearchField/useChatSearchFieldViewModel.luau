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
	-- upvalues: reactModule (ref), useLocalization (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), fFlagLuaAppAllowNilHookDepsCleanup (ref)
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
	local var8 = reactFocusNavigationModule.useFocusGuiObject()
	local var9 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var9 (ref), var8 (ref)
		if var6.current and var9 and var9.focusedGuiObject:getValue() ~= nil then
			var8(var6.current)
		end
	end, {
		var8,
		if fFlagLuaAppAllowNilHookDepsCleanup then var9 else var9 or false
	})
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var10 (ref), var1 (ref), onChanged (ref)
		if p2 == "" then
			var4.current = true
			var10()
			
			if var1.current then
				var1.current.focus()
			end
		end
		onChanged(p2)
	end, { onChanged, var10 })
	local onFocusGained = p1.onFocusGained
	local var12 = reactModule.useCallback(function()
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
		-- upvalues: shouldAutoFocus (ref), var10 (ref), var1 (ref)
		if shouldAutoFocus then
			var10()
			
			if var1.current then
				var1.current.focus()
			end
		end
	end, { shouldAutoFocus, var10 })
	
	return {
		text = p1.text,
		placeholder = var2.placeholder,
		onChanged = var11,
		onFocusGained = if onFocusGained then var12 else nil,
		onFocusLost = var5,
		inputRef = var1,
		containerRef = var7,
		testId = p1.testId,
		LayoutOrder = p1.LayoutOrder
	}
end