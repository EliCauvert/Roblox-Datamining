local contextActionService = game:GetService("ContextActionService")
local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref), contextActionService (ref)
	local var2 = reactModule.useRef(p1)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.current = p1
	end, { p1 })
	reactModule.useEffect(function()
		-- upvalues: contextActionService (copy), p0 (ref), var2 (ref)
		contextActionService:BindCoreAction(p0, function(_, p2)
			-- upvalues: var2 (copy)
			if p2 == Enum.UserInputState.Begin then
				var2.current()
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.Escape)
		
		return function()
			-- upvalues: contextActionService (copy), p0 (copy)
			contextActionService:UnbindCoreAction(p0)
		end
	end, { p0 })
end