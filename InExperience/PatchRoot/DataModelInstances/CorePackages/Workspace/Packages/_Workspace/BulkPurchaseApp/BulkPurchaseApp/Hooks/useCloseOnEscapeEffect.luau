local contextActionService = game:GetService("ContextActionService")
local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)

return function(p0, p1) --[[ line: 12 | named "useCloseOnEscapeEffect" ]]
	-- upvalues: reactModule (ref), contextActionService (ref)
	local var2 = reactModule.useRef(p1)
	reactModule.useEffect(function() --[[ line: 15 ]]
		-- upvalues: var2 (ref), p1 (ref)
		var2.current = p1
	end, { p1 })
	reactModule.useEffect(function() --[[ line: 19 ]]
		-- upvalues: contextActionService (copy), p0 (ref), var2 (ref)
		contextActionService:BindCoreAction(p0, function(_, p2) --[[ line: 20 ]]
			-- upvalues: var2 (copy)
			if p2 == Enum.UserInputState.Begin then
				var2.current()
			end
			return Enum.ContextActionResult.Pass
		end, false, Enum.KeyCode.Escape)
		
		return function() --[[ line: 28 ]]
			-- upvalues: contextActionService (copy), p0 (copy)
			contextActionService:UnbindCoreAction(p0)
		end
	end, { p0 })
end