local ReactModule = require(script:FindFirstAncestor("CoreScriptsPlayerFeedback").Parent.React)
local ContextActionService = game:GetService("ContextActionService")

return function(ActionName, Callback) --[[ Line: 9 | Named "useEscapeDismiss" ]]
	-- upvalues: ReactModule (copy), ContextActionService (copy)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: ContextActionService (upval), ActionName (copy), Callback (copy)
		pcall(function() --[[ Line: 11 ]]
			-- upvalues: ContextActionService (upval), ActionName (upval), Callback (upval)
			ContextActionService:BindCoreActionAtPriority(ActionName, function(_, UserInputState) --[[ Line: 12 ]]
				-- upvalues: Callback (upval)
				if UserInputState == Enum.UserInputState.Begin then
					Callback()
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, 100000, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB)
		end)
		
		return function() --[[ Line: 21 ]]
			-- upvalues: ContextActionService (upval), ActionName (upval)
			pcall(function() --[[ Line: 22 ]]
				-- upvalues: ContextActionService (upval), ActionName (upval)
				ContextActionService:UnbindCoreAction(ActionName)
			end)
		end
	end, { Callback, ActionName })
end