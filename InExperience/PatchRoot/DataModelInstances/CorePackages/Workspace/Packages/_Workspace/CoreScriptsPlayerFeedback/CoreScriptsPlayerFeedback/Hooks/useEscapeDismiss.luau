local reactModule = require(script:FindFirstAncestor("CoreScriptsPlayerFeedback").Parent.React)
local contextActionService = game:GetService("ContextActionService")

return function(p0, p1)
	-- upvalues: reactModule (ref), contextActionService (ref)
	reactModule.useEffect(function()
		-- upvalues: contextActionService (copy), p0 (ref), p1 (ref)
		pcall(function()
			-- upvalues: contextActionService (copy), p0 (copy), p1 (copy)
			contextActionService:BindCoreActionAtPriority(p0, function(_, p2)
				-- upvalues: p1 (copy)
				if p2 == Enum.UserInputState.Begin then
					p1()
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, 100000, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB)
		end)
		
		return function()
			-- upvalues: contextActionService (copy), p0 (copy)
			pcall(function()
				-- upvalues: contextActionService (copy), p0 (copy)
				contextActionService:UnbindCoreAction(p0)
			end)
		end
	end, { p1, p0 })
end