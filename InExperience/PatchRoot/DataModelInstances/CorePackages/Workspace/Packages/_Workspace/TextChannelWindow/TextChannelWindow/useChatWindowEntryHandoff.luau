local GuiService = game:GetService("GuiService")
local ReactModule = require(script.Parent.Parent.React)
local UseSelectionActivateActionModule = require(script.Parent.FocusNavigation.useSelectionActivateAction)

return function(p1)
	-- upvalues: GuiService (copy), ReactModule (copy), UseSelectionActivateActionModule (copy)
	local GuiService1 = p1.guiService or GuiService
	local Enabled = p1.enabled
	local WindowInstance = p1.windowInstance
	local FocusTargetRef = p1.focusTargetRef
	local UseRefResult = ReactModule.useRef(p1.setSelection)
	UseRefResult.current = p1.setSelection
	ReactModule.useEffect(function()
		-- upvalues: Enabled (copy), WindowInstance (copy), FocusTargetRef (copy), GuiService1 (copy)
		if not Enabled or WindowInstance == nil then return end
		local Selectable = WindowInstance.Selectable
		WindowInstance.Selectable = true
		
		return function()
			-- upvalues: WindowInstance (upval), Selectable (copy), FocusTargetRef (upval), GuiService1 (upval)
			WindowInstance.Selectable = Selectable
			
			if FocusTargetRef.current ~= nil and GuiService1.SelectedCoreObject == FocusTargetRef.current then
				GuiService1.SelectedCoreObject = nil
				
				if WindowInstance:IsDescendantOf(game) then
					GuiService1.SelectedObject = WindowInstance
				end
			end
		end
	end, { Enabled, WindowInstance, FocusTargetRef, GuiService1 })
	UseSelectionActivateActionModule({
		actionNamePrefix = "EnterTextChannelWindow",
		enabled = Enabled,
		active = WindowInstance ~= nil,
		onAction = ReactModule.useCallback(function(UserInputState)
			-- upvalues: FocusTargetRef (copy), UseRefResult (copy), GuiService1 (copy)
			if UserInputState == Enum.UserInputState.Begin then
				local Current = FocusTargetRef.current
				
				if Current ~= nil then
					local CurrentFunction: (any) -> () = UseRefResult.current
					
					if CurrentFunction then
						CurrentFunction(Current)
					else
						GuiService1.SelectedCoreObject = Current
					end
				end
				GuiService1.SelectedObject = nil
			end
			return Enum.ContextActionResult.Sink
		end, { GuiService1, FocusTargetRef }),
		shouldBind = ReactModule.useCallback(function(): boolean
			-- upvalues: GuiService1 (copy), WindowInstance (copy)
			return GuiService1.SelectedObject == WindowInstance
		end, { GuiService1, WindowInstance }),
		rebindSignal = ReactModule.useMemo(function()
			-- upvalues: WindowInstance (copy), GuiService1 (copy)
			return if WindowInstance == nil then nil else GuiService1:GetPropertyChangedSignal("SelectedObject")
		end, { GuiService1, WindowInstance }),
		contextActionService = p1.contextActionService
	})
end