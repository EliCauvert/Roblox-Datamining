local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)

return function(p1, _)
	-- upvalues: reactModule (ref), focusNavigationUtilsModule (ref), reactFocusNavigationModule (ref)
	return function(p2)
		-- upvalues: reactModule (copy), focusNavigationUtilsModule (copy), reactFocusNavigationModule (copy), p1 (ref)
		local var1 = reactModule.useRef(nil)
		local t = {}
		local var2 = focusNavigationUtilsModule.useAutoFocus(t, 0.1)
		local var3 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
		reactModule.useEffect(function()
			-- upvalues: t (ref), var1 (ref), var3 (ref), var2 (ref)
			t[1] = var1.current
			local var4 = if var3 and var3.focusedGuiObject:getValue() ~= nil and var2 then var2() else nil
			
			return function()
				-- upvalues: var4 (write)
				if var4 then
					var4.cancel()
				end
			end
		end, { var2 })
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			ref = var1
		}, { content = reactModule.createElement(p1, p2) })
	end
end