local parent = script:FindFirstAncestor("Moments").Parent
local userInputService = game:GetService("UserInputService")
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local useDescendantHasFocus = focusNavigationUtilsModule.useDescendantHasFocus
local useAutoFocus = focusNavigationUtilsModule.useAutoFocus
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local constantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.Types)
local pagerNavigationModule = require(script.Parent.pagerNavigation)
local PREVIOUS_EVENT = pagerNavigationModule.PREVIOUS_EVENT
local NEXT_EVENT = pagerNavigationModule.NEXT_EVENT
local KEYBOARD_KEY_EVENTS = pagerNavigationModule.KEYBOARD_KEY_EVENTS

return function(p1)
	-- upvalues: reactModule (ref), useDescendantHasFocus (ref), useAutoFocus (ref), useLastInputMode (ref), pagerNavigationModule (ref), PREVIOUS_EVENT (ref), inputHandlersModule (ref), NEXT_EVENT (ref), reactFocusNavigationModule (ref), userInputService (ref), constantsModule (ref), KEYBOARD_KEY_EVENTS (ref)
	local active = p1.active
	local keyboardNavigation = p1.keyboardNavigation
	local var1 = reactModule.useRef(p1.goNext)
	var1.current = p1.goNext
	local var2 = reactModule.useRef(p1.goPrevious)
	var2.current = p1.goPrevious
	local var3, var4 = reactModule.useState(nil)
	local var5 = useDescendantHasFocus(var3)
	local var6 = useAutoFocus({ var3 }, 0.1)
	local var7 = active and (var3 ~= nil and (not var5 and useLastInputMode() == "Focus"))
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var6 (ref)
		local var8 = if var7 then var6() else nil
		
		return function()
			-- upvalues: var8 (write)
			if var8 then
				var8.cancel()
			end
		end
	end, { var7, var6 })
	local var8 = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: PREVIOUS_EVENT (copy), inputHandlersModule (copy), var2 (ref), NEXT_EVENT (copy), var1 (ref)
		return {
			[PREVIOUS_EVENT] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: var2 (copy)
					var2.current()
				end)
			},
			[NEXT_EVENT] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: var1 (copy)
					var1.current()
				end)
			}
		}
	end, {}), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function()
		-- upvalues: pagerNavigationModule (copy), active (ref), keyboardNavigation (ref)
		return pagerNavigationModule.buildEventMap(active, keyboardNavigation)
	end, { active, keyboardNavigation })))
	reactModule.useEffect(function()
		-- upvalues: active (ref), var5 (ref), userInputService (copy), pagerNavigationModule (copy), constantsModule (copy), var2 (ref), var1 (ref)
		if active and var5 then
			local var9 = 0
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p2)
				-- upvalues: pagerNavigationModule (copy), constantsModule (copy), var9 (write), var2 (copy), var1 (copy)
				if p2.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
				local var10 = pagerNavigationModule.thumbstickDirection(p2.Position.Y, constantsModule.THUMBSTICK_THRESHOLD)
				
				if var10 == nil then return end
				local processTime = os.clock()
				
				if processTime - var9 < constantsModule.THUMBSTICK_COOLDOWN_SECONDS then return end
				var9 = processTime
				
				if var10 == "previous" then
					var2.current()
					
					return
				end
				var1.current()
			end)
			
			return function()
				-- upvalues: inputChangedConnection (ref)
				inputChangedConnection:Disconnect()
			end
		end
	end, { active, var5 })
	reactModule.useEffect(function()
		-- upvalues: active (ref), keyboardNavigation (ref), userInputService (copy), KEYBOARD_KEY_EVENTS (copy), PREVIOUS_EVENT (copy), var2 (ref), NEXT_EVENT (copy), var1 (ref)
		if active and keyboardNavigation == "global" then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p2, p3)
				-- upvalues: KEYBOARD_KEY_EVENTS (copy), PREVIOUS_EVENT (copy), var2 (copy), NEXT_EVENT (copy), var1 (copy)
				if p3 then return end
				local keyCode = KEYBOARD_KEY_EVENTS[p2.KeyCode]
				
				if keyCode == PREVIOUS_EVENT then
					var2.current()
					
					return
				elseif keyCode == NEXT_EVENT then
					var1.current()
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { active, keyboardNavigation })
	
	return reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), var4 (ref)
		var8(p2)
		var4(p2)
	end, { var8 })
end