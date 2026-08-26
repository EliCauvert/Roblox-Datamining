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
	local var3 = reactModule.useRef(nil)
	local var4 = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, reactModule.useCallback(inputHandlersModule.onRelease(function(p2)
		-- upvalues: onExit (ref)
		p2:cancel()
		onExit()
	end), { onExit }), nil, var3)
	local var5 = reactFocusNavigationModule.useFocusGuiObject()
	local var6 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var7 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var6 (ref), var5 (ref)
		if var3.current and var6 and var6.focusedGuiObject:getValue() ~= nil then
			var5(var3.current)
		end
	end, { var5, var6 or false })
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), var1 (ref), onChanged (ref)
		if p2 == "" then
			var7()
			
			if var1.current then
				var1.current.focus()
			end
		end
		onChanged(p2)
	end, { onChanged, var7 })
	local shouldAutoFocus = p1.shouldAutoFocus or false
	reactModule.useEffect(function()
		-- upvalues: shouldAutoFocus (ref), var7 (ref), var1 (ref)
		if shouldAutoFocus then
			var7()
			
			if var1.current then
				var1.current.focus()
			end
		end
	end, { shouldAutoFocus, var7 })
	
	return {
		text = p1.text,
		placeholder = var2.placeholder,
		onChanged = var8,
		inputRef = var1,
		containerRef = var4,
		LayoutOrder = p1.LayoutOrder
	}
end