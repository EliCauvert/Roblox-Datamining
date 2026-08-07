local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)

return function(p0, _) --[[ line: 9 | named "autoFocusNavigation" ]]
	-- upvalues: reactModule (ref), focusNavigationUtilsModule (ref), reactFocusNavigationModule (ref)
	return function(p1) --[[ line: 10 ]]
		-- upvalues: reactModule (copy), focusNavigationUtilsModule (copy), reactFocusNavigationModule (copy), p0 (ref)
		local var3 = reactModule.useRef(nil)
		local t = {}
		local var5 = focusNavigationUtilsModule.useAutoFocus(t, 0.1)
		local var6 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
		reactModule.useEffect(function() --[[ line: 15 ]]
			-- upvalues: t (ref), var3 (ref), var6 (ref), var5 (ref)
			t[1] = var3.current
			local var7 = if var6 and var6.focusedGuiObject:getValue() ~= nil and var5 then var5() else nil
			
			return function() --[[ line: 21 ]]
				-- upvalues: var7 (write)
				if var7 then
					var7.cancel()
				end
			end
		end, { var5 })
		
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			ref = var3
		}, { content = reactModule.createElement(p0, p1) })
	end
end