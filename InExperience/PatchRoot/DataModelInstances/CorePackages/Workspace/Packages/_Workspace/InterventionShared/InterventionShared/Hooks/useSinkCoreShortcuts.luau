local ContextActionService = game:GetService("ContextActionService")
local ReactModule = require(script:FindFirstAncestor("InterventionShared").Parent.React)
local NewValue = Enum.ContextActionPriority.High.Value + 1

return function(p1, p2)
	-- upvalues: ContextActionService (copy), ReactModule (copy), NewValue (copy)
	local P1 = p2 or ContextActionService
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), P1 (copy), NewValue (upval)
		if p1 then
			P1:BindCoreActionAtPriority("InterventionDialogSinkCoreShortcuts", function()
				return Enum.ContextActionResult.Sink
			end, false, NewValue, Enum.KeyCode.Escape, Enum.KeyCode.Tab, Enum.KeyCode.ButtonStart)
			
			return function()
				-- upvalues: P1 (upval)
				P1:UnbindCoreAction("InterventionDialogSinkCoreShortcuts")
			end
		else
			return nil
		end
	end, { p1, P1 })
end