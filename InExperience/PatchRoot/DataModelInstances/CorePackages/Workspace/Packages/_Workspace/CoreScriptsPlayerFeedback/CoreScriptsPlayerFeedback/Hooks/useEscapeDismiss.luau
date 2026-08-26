local reactModule = require(script:FindFirstAncestor("CoreScriptsPlayerFeedback").Parent.React)
local contextActionService = game:GetService("ContextActionService")

return function(p1, p2)
	-- upvalues: reactModule (ref), contextActionService (ref)
	reactModule.useEffect(function()
		-- upvalues: contextActionService (copy), p1 (ref), p2 (ref)
		pcall(function()
			-- upvalues: contextActionService (copy), p1 (copy), p2 (copy)
			contextActionService:BindCoreActionAtPriority(p1, function(_, p3)
				-- upvalues: p2 (copy)
				if p3 == Enum.UserInputState.Begin then
					p2()
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, 100000, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB)
		end)
		
		return function()
			-- upvalues: contextActionService (copy), p1 (copy)
			pcall(function()
				-- upvalues: contextActionService (copy), p1 (copy)
				contextActionService:UnbindCoreAction(p1)
			end)
		end
	end, { p2, p1 })
end