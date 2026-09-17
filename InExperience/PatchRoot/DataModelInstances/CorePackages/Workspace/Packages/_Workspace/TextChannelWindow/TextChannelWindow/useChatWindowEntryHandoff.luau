local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useCoreActionBind = require(parent.ChatUIPrimitives).Hooks.useCoreActionBind

return function(p1)
	-- upvalues: guiService (ref), reactModule (ref), useCoreActionBind (ref)
	local guiService_1 = p1.guiService or guiService
	local enabled = p1.enabled
	local windowInstance = p1.windowInstance
	local focusTargetRef = p1.focusTargetRef
	local var1 = reactModule.useRef(p1.setSelection)
	var1.current = p1.setSelection
	reactModule.useEffect(function()
		-- upvalues: enabled (ref), windowInstance (ref), focusTargetRef (ref), guiService_1 (ref)
		if enabled and windowInstance ~= nil then
			local selectable = windowInstance.Selectable
			windowInstance.Selectable = true
			
			return function()
				-- upvalues: windowInstance (copy), selectable (ref), focusTargetRef (copy), guiService_1 (copy)
				windowInstance.Selectable = selectable
				
				if focusTargetRef.current ~= nil and guiService_1.SelectedCoreObject == focusTargetRef.current then
					guiService_1.SelectedCoreObject = nil
					
					if windowInstance:IsDescendantOf(game) then
						guiService_1.SelectedObject = windowInstance
					end
				end
			end
		end
	end, { enabled, windowInstance, focusTargetRef, guiService_1 })
	useCoreActionBind({
		actionNamePrefix = "EnterTextChannelWindow",
		enabled = enabled,
		active = windowInstance ~= nil,
		keyCode = Enum.KeyCode.ButtonA,
		onAction = reactModule.useCallback(function(p2)
			-- upvalues: focusTargetRef (ref), var1 (ref), guiService_1 (ref)
			if p2 == Enum.UserInputState.Begin then
				local current = focusTargetRef.current
				
				if current ~= nil then
					local current_1 = var1.current
					
					if current_1 then
						current_1(current)
					else
						guiService_1.SelectedCoreObject = current
					end
				end
				guiService_1.SelectedObject = nil
			end
			return Enum.ContextActionResult.Sink
		end, { guiService_1, focusTargetRef }),
		shouldBind = reactModule.useCallback(function()
			-- upvalues: guiService_1 (ref), windowInstance (ref)
			return guiService_1.SelectedObject == windowInstance
		end, { guiService_1, windowInstance }),
		rebindSignal = reactModule.useMemo(function()
			-- upvalues: windowInstance (ref), guiService_1 (ref)
			return if windowInstance == nil then nil else guiService_1:GetPropertyChangedSignal("SelectedObject")
		end, { guiService_1, windowInstance }),
		contextActionService = p1.contextActionService
	})
end