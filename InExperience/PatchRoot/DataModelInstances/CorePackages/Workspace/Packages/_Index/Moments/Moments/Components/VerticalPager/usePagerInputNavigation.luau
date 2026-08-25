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

return function(p0)
	-- upvalues: reactModule (ref), useDescendantHasFocus (ref), useAutoFocus (ref), useLastInputMode (ref), pagerNavigationModule (ref), PREVIOUS_EVENT (ref), inputHandlersModule (ref), NEXT_EVENT (ref), reactFocusNavigationModule (ref), userInputService (ref), constantsModule (ref), KEYBOARD_KEY_EVENTS (ref)
	local active = p0.active
	local keyboardNavigation = p0.keyboardNavigation
	local var7 = reactModule.useRef(p0.goNext)
	var7.current = p0.goNext
	local var8 = reactModule.useRef(p0.goPrevious)
	var8.current = p0.goPrevious
	local var9, var10 = reactModule.useState(nil)
	local var11 = useDescendantHasFocus(var9)
	local var12 = useAutoFocus({ var9 }, 0.1)
	local var13 = active and (var9 ~= nil and (not var11 and useLastInputMode() == "Focus"))
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var12 (ref)
		local var15 = if var13 then var12() else nil
		
		return function()
			-- upvalues: var15 (write)
			if var15 then
				var15.cancel()
			end
		end
	end, { var13, var12 })
	local var14 = reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: PREVIOUS_EVENT (copy), inputHandlersModule (copy), var8 (ref), NEXT_EVENT (copy), var7 (ref)
		return {
			[PREVIOUS_EVENT] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: var8 (copy)
					var8.current()
				end)
			},
			[NEXT_EVENT] = {
				handler = inputHandlersModule.onRelease(function()
					-- upvalues: var7 (copy)
					var7.current()
				end)
			}
		}
	end, {}), reactFocusNavigationModule.useEventMap(reactModule.useMemo(function()
		-- upvalues: pagerNavigationModule (copy), active (ref), keyboardNavigation (ref)
		return pagerNavigationModule.buildEventMap(active, keyboardNavigation)
	end, { active, keyboardNavigation })))
	reactModule.useEffect(function()
		-- upvalues: active (ref), var11 (ref), userInputService (copy), pagerNavigationModule (copy), constantsModule (copy), var8 (ref), var7 (ref)
		if active and var11 then
			local var16 = 0
			local inputChangedConnection = userInputService.InputChanged:Connect(function(p1)
				-- upvalues: pagerNavigationModule (copy), constantsModule (copy), var16 (write), var8 (copy), var7 (copy)
				if p1.KeyCode ~= Enum.KeyCode.Thumbstick1 then return end
				local var18 = pagerNavigationModule.thumbstickDirection(p1.Position.Y, constantsModule.THUMBSTICK_THRESHOLD)
				
				if var18 == nil then return end
				local processTime = os.clock()
				
				if processTime - var16 < constantsModule.THUMBSTICK_COOLDOWN_SECONDS then return end
				var16 = processTime
				
				if var18 == "previous" then
					var8.current()
					
					return
				end
				var7.current()
			end)
			
			return function()
				-- upvalues: inputChangedConnection (ref)
				inputChangedConnection:Disconnect()
			end
		end
	end, { active, var11 })
	reactModule.useEffect(function()
		-- upvalues: active (ref), keyboardNavigation (ref), userInputService (copy), KEYBOARD_KEY_EVENTS (copy), PREVIOUS_EVENT (copy), var8 (ref), NEXT_EVENT (copy), var7 (ref)
		if active and keyboardNavigation == "global" then
			local inputBeganConnection = userInputService.InputBegan:Connect(function(p2, p3)
				-- upvalues: KEYBOARD_KEY_EVENTS (copy), PREVIOUS_EVENT (copy), var8 (copy), NEXT_EVENT (copy), var7 (copy)
				if p3 then return end
				local keyCode = KEYBOARD_KEY_EVENTS[p2.KeyCode]
				
				if keyCode == PREVIOUS_EVENT then
					var8.current()
					
					return
				elseif keyCode == NEXT_EVENT then
					var7.current()
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { active, keyboardNavigation })
	
	return reactModule.useCallback(function(p4)
		-- upvalues: var14 (ref), var10 (ref)
		var14(p4)
		var10(p4)
	end, { var14 })
end