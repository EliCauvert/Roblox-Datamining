local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local _ = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.ChatSearchFieldView)

return function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), inputHandlersModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref)
	local var1 = reactModule.useRef(nil)
	local onExit = p1.onExit
	local onChanged = p1.onChanged
	local var2 = useLocalization({ placeholder = "Feature.Chat.Label.SearchWord" })
	local var3 = reactModule.useRef(Enum.KeyCode.None)
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3.current = if p2 then p2.KeyCode else Enum.KeyCode.None
	end, {})
	local var5 = reactModule.useRef(nil)
	local var6 = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(inputHandlersModule.onRelease(function(p2)
		-- upvalues: var3 (ref), onExit (ref)
		local current = var3.current
		local var7 = current ~= Enum.KeyCode.None and (p2.eventData ~= nil and p2.eventData.KeyCode == current)
		
		if not var7 and onExit == nil then return end
		p2:cancel()
		
		if var7 then
			var3.current = Enum.KeyCode.None
			
			return
		end
		onExit()
	end), { onExit or false }), nil, var5)
	local var7 = reactFocusNavigationModule.useFocusGuiObject()
	local var8 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var9 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var8 (ref), var7 (ref)
		if var5.current and var8 and var8.focusedGuiObject:getValue() ~= nil then
			var7(var5.current)
		end
	end, { var7, var8 or false })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), var1 (ref), onChanged (ref)
		if p2 == "" then
			var9()
			
			if var1.current then
				var1.current.focus()
			end
		end
		onChanged(p2)
	end, { onChanged, var9 })
	local shouldAutoFocus = p1.shouldAutoFocus or false
	reactModule.useEffect(function()
		-- upvalues: shouldAutoFocus (ref), var9 (ref), var1 (ref)
		if shouldAutoFocus then
			var9()
			
			if var1.current then
				var1.current.focus()
			end
		end
	end, { shouldAutoFocus, var9 })
	
	return {
		text = p1.text,
		placeholder = var2.placeholder,
		onChanged = var10,
		onFocusLost = var4,
		inputRef = var1,
		containerRef = var6,
		testId = p1.testId,
		LayoutOrder = p1.LayoutOrder
	}
end