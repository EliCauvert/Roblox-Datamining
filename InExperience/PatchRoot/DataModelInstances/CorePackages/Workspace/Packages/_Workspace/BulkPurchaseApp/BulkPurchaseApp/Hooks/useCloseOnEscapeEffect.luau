local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)

return function(ActionName, Current)
	-- upvalues: ReactModule (copy), ContextActionService (copy)
	local UseRefResult = ReactModule.useRef(Current)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Current (copy)
		UseRefResult.current = Current
	end, { Current })
	ReactModule.useEffect(function()
		-- upvalues: ContextActionService (upval), ActionName (copy), UseRefResult (copy)
		ContextActionService:BindCoreAction(ActionName, function(_, UserInputState)
			-- upvalues: UseRefResult (upval)
			if UserInputState == Enum.UserInputState.Begin then
				UseRefResult.current()
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.Escape)
		
		return function()
			-- upvalues: ContextActionService (upval), ActionName (upval)
			ContextActionService:UnbindCoreAction(ActionName)
		end
	end, { ActionName })
end