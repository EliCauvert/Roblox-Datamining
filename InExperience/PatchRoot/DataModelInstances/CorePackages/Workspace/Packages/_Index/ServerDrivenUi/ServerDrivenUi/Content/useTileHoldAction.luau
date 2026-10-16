local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.FocusNavigationUtils)

return function(p1, Callback, Callback1) --[[ Line: 44 | Named "useTileHoldAction" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(false)
	local v1 = p1 ~= nil
	local OnHoldCompleted = if p1 then p1.onHoldCompleted else nil
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 76 ]]
		-- upvalues: OnHoldCompleted (copy)
		if OnHoldCompleted then
			OnHoldCompleted(nil, p2)
		end
	end, { OnHoldCompleted })
	local UseResult1 = ReactModule.useCallback(function(Current) --[[ Line: 82 ]]
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = Current
	end, {})
	
	return {
		tileRef = ReactModule.useCallback(function(p2) --[[ Line: 53 ]]
			-- upvalues: Callback (copy), v1 (copy), UseStateResult2 (copy)
			if Callback then
				Callback(p2)
			end
			if v1 then
				UseStateResult2(p2)
			end
		end, { Callback, v1 }),
		onActivated = ReactModule.useCallback(function() --[[ Line: 66 ]]
			-- upvalues: UseRefResult (copy), Callback1 (copy)
			if UseRefResult.current then return end
			if Callback1 then
				Callback1()
			end
		end, { Callback1 }),
		holdDetectorProps = if p1 and UseStateResult then {
			disableRegularActionOnHoldIntent = nil,
			guiObject = UseStateResult,
			onHoldDetected = UseResult,
			setDisabledForHold = UseResult1,
			keyCode = p1.keyCode,
			focusNavigationEventName = p1.focusNavigationEventName
		} else nil
	}
end