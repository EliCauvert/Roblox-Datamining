local CoreGui = game:GetService("CoreGui")
local Parent = script:FindFirstAncestor("FocusNavigationUtils").Parent
local ReactModule = require(Parent.React)
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local ResponsiveModule = require(Parent.Responsive)
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local Input = ResponsiveModule.Input
local UseDescendantHasFocusModule = require(script.Parent.useDescendantHasFocus)

return function(Callback, p1)
	-- upvalues: UseFocusGuiObjectFunction (copy), ReactModule (copy), UsePreferredInputFunction (copy), Input (copy), UseIsSpatialFunction (copy), CoreGui (copy), UseDescendantHasFocusModule (copy)
	local v1 = p1 == nil or p1
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(Gui)
		-- upvalues: Callback (copy), UseStateResult2 (copy)
		if Callback then
			if type(Callback) == "function" then
				Callback(Gui)
			elseif type(Callback) == "table" then
				Callback.current = Gui
			end
		end
		if Gui == nil then
			UseStateResult2(nil)
			
			return
		end
		if Gui:IsA("GuiObject") then
			UseStateResult2(Gui)
			
			return
		else
			warn("useFocusOnMount: ref is not a GuiObject")
		end
	end, { Callback })
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == Input.Directional
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseResult1 = ReactModule.useCallback(function(Object)
		-- upvalues: CoreGui (upval), IsUsePreferredInputResultMatch (copy), UseIsSpatialResult (copy), UseFocusGuiObjectResult (copy)
		if not Object:IsDescendantOf(CoreGui) then return end
		if IsUsePreferredInputResultMatch and not UseIsSpatialResult then
			UseFocusGuiObjectResult(Object)
		end
	end, {
		IsUsePreferredInputResultMatch,
		UseIsSpatialResult,
		UseFocusGuiObjectResult
	})
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseDescendantHasFocusModuleResult = UseDescendantHasFocusModule(UseStateResult)
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult (copy), UseRefResult1 (copy), UseResult1 (copy), v1 (copy), UseDescendantHasFocusModuleResult (copy), UseRefResult2 (copy)
		if not UseStateResult then
			UseRefResult.current = false
			UseRefResult1.current = false
			
			return
		end
		if not UseRefResult.current then
			UseResult1(UseStateResult)
			UseRefResult.current = true
		end
		if v1 and not UseRefResult1.current and UseDescendantHasFocusModuleResult then
			UseRefResult1.current = true
		end
		local DescendantAddedConnection = if v1 and not UseRefResult1.current then UseStateResult.DescendantAdded:Connect(function(Descendant)
			-- upvalues: UseRefResult2 (upval), UseResult1 (upval), UseStateResult (upval)
			if not UseRefResult2.current and Descendant:IsA("GuiObject") and Descendant.Selectable then
				UseRefResult2.current = task.delay(0.1, function()
					-- upvalues: UseResult1 (upval), UseStateResult (upval), UseRefResult2 (upval)
					UseResult1(UseStateResult)
					UseRefResult2.current = nil
				end)
			end
		end) else nil
		
		return function()
			-- upvalues: DescendantAddedConnection (copy), UseRefResult2 (upval)
			if DescendantAddedConnection then
				DescendantAddedConnection:Disconnect()
			end
			if UseRefResult2.current then
				task.cancel(UseRefResult2.current)
				UseRefResult2.current = nil
			end
		end
	end, {
		UseStateResult,
		v1,
		UseResult1,
		UseDescendantHasFocusModuleResult
	})
	
	return UseResult
end