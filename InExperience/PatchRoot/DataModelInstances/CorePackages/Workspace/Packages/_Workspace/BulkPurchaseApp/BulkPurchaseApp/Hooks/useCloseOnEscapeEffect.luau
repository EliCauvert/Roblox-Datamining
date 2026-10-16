local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)

return function(ActionName, Current) --[[ Line: 12 | Named "useCloseOnEscapeEffect" ]]
	-- upvalues: ReactModule (copy), ContextActionService (copy)
	local UseRefResult = ReactModule.useRef(Current)
	ReactModule.useEffect(function() --[[ Line: 15 ]]
		-- upvalues: UseRefResult (copy), Current (copy)
		UseRefResult.current = Current
	end, { Current })
	ReactModule.useEffect(function() --[[ Line: 19 ]]
		-- upvalues: ContextActionService (upval), ActionName (copy), UseRefResult (copy)
		ContextActionService:BindCoreAction(ActionName, function(_, UserInputState) --[[ Line: 20 ]]
			-- upvalues: UseRefResult (upval)
			if UserInputState == Enum.UserInputState.Begin then
				UseRefResult.current()
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.Escape)
		
		return function() --[[ Line: 28 ]]
			-- upvalues: ContextActionService (upval), ActionName (upval)
			ContextActionService:UnbindCoreAction(ActionName)
		end
	end, { ActionName })
end