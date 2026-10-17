local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local FFlagLuaAppAllowNilHookDepsCleanup = require(Parent.SharedFlags).FFlagLuaAppAllowNilHookDepsCleanup
local InputHandlersModule = require(Parent.InputHandlers)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local _ = require(script.Parent.SearchFieldView)

return function(Frame) --[[ Line: 33 | Named "useSearchFieldViewModel" ]]
	-- upvalues: ReactModule (copy), InputHandlersModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), UserInputService (copy), FFlagLuaAppAllowNilHookDepsCleanup (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local OnExitFunction = Frame.onExit
	local OnChangedFunction = Frame.onChanged
	local UseRefResult1 = ReactModule.useRef(Enum.KeyCode.None)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Input) --[[ Line: 46 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
		UseRefResult1.current = if Input then Input.KeyCode else Enum.KeyCode.None
		UseRefResult2.current = false
	end, {})
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseEventResult = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, ReactModule.useCallback(InputHandlersModule.onRelease(function(p1) --[[ Line: 58 ]]
		-- upvalues: UseRefResult1 (copy), OnExitFunction (copy)
		local Current = UseRefResult1.current
		local IsKeyCodeMatch: boolean = Current ~= Enum.KeyCode.None and (p1.eventData ~= nil and p1.eventData.KeyCode == Current)
		
		if not IsKeyCodeMatch and OnExitFunction == nil then return end
		p1:cancel()
		
		if IsKeyCodeMatch then
			UseRefResult1.current = Enum.KeyCode.None
			
			return
		else
			OnExitFunction()
		end
	end), { OnExitFunction or false }), nil, UseRefResult3)
	local UseResult1 = ReactModule.useCallback(function(): boolean --[[ Line: 98 ]]
		-- upvalues: UserInputService (upval), UseRefResult3 (copy)
		local FocusedTextBox = UserInputService:GetFocusedTextBox()
		local Current = UseRefResult3.current
		
		if FocusedTextBox and Current and not FocusedTextBox:IsDescendantOf(Current) then
			FocusedTextBox:ReleaseFocus()
			
			return true
		else
			return false
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 109 ]]
		-- upvalues: UserInputService (upval), UseRefResult3 (copy), UseResult1 (copy), UseRefResult (copy)
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 110 ]]
			-- upvalues: UseRefResult3 (upval), UserInputService (upval), UseResult1 (upval), UseRefResult (upval)
			local Current = UseRefResult3.current
			local FocusedTextBox = UserInputService:GetFocusedTextBox()
			
			if Input.UserInputType ~= Enum.UserInputType.MouseButton1 and Input.UserInputType ~= Enum.UserInputType.Touch or not Current or not FocusedTextBox or FocusedTextBox:IsDescendantOf(Current) then return end
			local BasePlayerGui = Current:FindFirstAncestorWhichIsA("BasePlayerGui")
			
			if not BasePlayerGui then return end
			for _, value in BasePlayerGui:GetGuiObjectsAtPosition(Input.Position.X, Input.Position.Y) do
				if value.Active then
					if value:IsDescendantOf(Current) and UseResult1() and UseRefResult.current then
						UseRefResult.current.focus()
					end
					break
				end
			end
		end)
		
		return function() --[[ Line: 132 ]]
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, { UseResult1 })
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 147 ]]
		-- upvalues: UseRefResult3 (copy), UseContextResult (copy), UseFocusGuiObjectResult (copy)
		if UseRefResult3.current and UseContextResult and UseContextResult.focusedGuiObject:getValue() ~= nil then
			UseFocusGuiObjectResult(UseRefResult3.current)
		end
	end, {
		UseFocusGuiObjectResult,
		if FFlagLuaAppAllowNilHookDepsCleanup then UseContextResult else UseContextResult or false
	})
	local UseResult3 = ReactModule.useCallback(function(p1) --[[ Line: 166 ]]
		-- upvalues: UseRefResult2 (copy), UseResult2 (copy), UseRefResult (copy), OnChangedFunction (copy)
		if p1 == "" then
			UseRefResult2.current = true
			UseResult2()
			
			if UseRefResult.current then
				UseRefResult.current.focus()
			end
		end
		OnChangedFunction(p1)
	end, { OnChangedFunction, UseResult2 })
	local OnFocusGainedFunction = Frame.onFocusGained
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 181 ]]
		-- upvalues: UseRefResult2 (copy), OnFocusGainedFunction (copy)
		if UseRefResult2.current then
			UseRefResult2.current = false
			
			return
		end
		if OnFocusGainedFunction then
			OnFocusGainedFunction()
		end
	end, { OnFocusGainedFunction })
	local ShouldAutoFocus = Frame.shouldAutoFocus or false
	ReactModule.useEffect(function() --[[ Line: 192 ]]
		-- upvalues: ShouldAutoFocus (copy), UseResult2 (copy), UseResult1 (copy), UseRefResult (copy)
		if ShouldAutoFocus then
			UseResult2()
			UseResult1()
			
			if UseRefResult.current then
				UseRefResult.current.focus()
			end
		end
	end, { ShouldAutoFocus, UseResult2, UseResult1 })
	
	return {
		text = Frame.text,
		placeholder = Frame.placeholder,
		onChanged = UseResult3,
		onFocusGained = if OnFocusGainedFunction then UseResult4 else nil,
		onFocusLost = UseResult,
		inputRef = UseRefResult,
		containerRef = UseEventResult,
		testId = Frame.testId,
		LayoutOrder = Frame.LayoutOrder
	}
end