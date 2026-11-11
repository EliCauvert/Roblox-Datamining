local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)

return function(p1, _)
	-- upvalues: ReactModule (copy), FocusNavigationUtilsModule (copy), ReactFocusNavigationModule (copy)
	return function(p2)
		-- upvalues: ReactModule (upval), FocusNavigationUtilsModule (upval), ReactFocusNavigationModule (upval), p1 (copy)
		local UseRefResult = ReactModule.useRef(nil)
		local Currents = {}
		local UseAutoFocusResult = FocusNavigationUtilsModule.useAutoFocus(Currents, 0.1)
		local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
		ReactModule.useEffect(function()
			-- upvalues: Currents (copy), UseRefResult (copy), UseContextResult (copy), UseAutoFocusResult (copy)
			Currents[1] = UseRefResult.current
			local UseAutoFocusResultResult = if UseContextResult and UseContextResult.focusedGuiObject:getValue() ~= nil and UseAutoFocusResult then UseAutoFocusResult() else nil
			
			return function()
				-- upvalues: UseAutoFocusResultResult (ref)
				if UseAutoFocusResultResult then
					UseAutoFocusResultResult.cancel()
				end
			end
		end, { UseAutoFocusResult })
		
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			ref = UseRefResult
		}, { content = ReactModule.createElement(p1, p2) })
	end
end