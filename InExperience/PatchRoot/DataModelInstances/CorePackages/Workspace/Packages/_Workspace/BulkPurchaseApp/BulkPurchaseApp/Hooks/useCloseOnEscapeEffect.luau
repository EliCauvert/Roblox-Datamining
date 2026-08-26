local contextActionService = game:GetService("ContextActionService")
local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref), contextActionService (ref)
	local var1 = reactModule.useRef(p2)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p2 (ref)
		var1.current = p2
	end, { p2 })
	reactModule.useEffect(function()
		-- upvalues: contextActionService (copy), p1 (ref), var1 (ref)
		contextActionService:BindCoreAction(p1, function(_, p3)
			-- upvalues: var1 (copy)
			if p3 == Enum.UserInputState.Begin then
				var1.current()
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.Escape)
		
		return function()
			-- upvalues: contextActionService (copy), p1 (copy)
			contextActionService:UnbindCoreAction(p1)
		end
	end, { p1 })
end