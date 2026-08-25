local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local _ = require(parent.FocusNavigationUtils)

return function(value, p0, p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(false)
	local var4 = value ~= nil
	local var5 = if value then value.onHoldCompleted else nil
	
	return {
		tileRef = reactModule.useCallback(function(p2)
			-- upvalues: p0 (ref), var4 (ref), var2 (ref)
			if p0 then
				p0(p2)
			end
			if var4 then
				var2(p2)
			end
		end, { p0, var4 }),
		onActivated = reactModule.useCallback(function()
			-- upvalues: var3 (ref), p1 (ref)
			if var3.current then return end
			if p1 then
				p1()
			end
		end, { p1 }),
		holdDetectorProps = if value and var1 then {
			guiObject = var1,
			onHoldDetected = reactModule.useCallback(function(p3)
				-- upvalues: var5 (ref)
				if var5 then
					var5(nil, p3)
				end
			end, { var5 }),
			setDisabledForHold = reactModule.useCallback(function(p4)
				-- upvalues: var3 (ref)
				var3.current = p4
			end, {}),
			keyCode = value.keyCode,
			focusNavigationEventName = value.focusNavigationEventName
		} else nil
	}
end