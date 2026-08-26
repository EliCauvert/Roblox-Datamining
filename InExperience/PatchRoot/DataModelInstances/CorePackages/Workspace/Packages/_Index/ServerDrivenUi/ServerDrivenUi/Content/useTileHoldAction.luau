local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigationUtils)

return function(value, p1, p2)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(false)
	local var4 = value ~= nil
	local var5 = if value then value.onHoldCompleted else nil
	
	return {
		tileRef = reactModule.useCallback(function(p3)
			-- upvalues: p1 (ref), var4 (ref), var2 (ref)
			if p1 then
				p1(p3)
			end
			if var4 then
				var2(p3)
			end
		end, { p1, var4 }),
		onActivated = reactModule.useCallback(function()
			-- upvalues: var3 (ref), p2 (ref)
			if var3.current then return end
			if p2 then
				p2()
			end
		end, { p2 }),
		holdDetectorProps = if value and var1 then {
			guiObject = var1,
			onHoldDetected = reactModule.useCallback(function(p3)
				-- upvalues: var5 (ref)
				if var5 then
					var5(nil, p3)
				end
			end, { var5 }),
			setDisabledForHold = reactModule.useCallback(function(p3)
				-- upvalues: var3 (ref)
				var3.current = p3
			end, {}),
			keyCode = value.keyCode,
			focusNavigationEventName = value.focusNavigationEventName
		} else nil
	}
end