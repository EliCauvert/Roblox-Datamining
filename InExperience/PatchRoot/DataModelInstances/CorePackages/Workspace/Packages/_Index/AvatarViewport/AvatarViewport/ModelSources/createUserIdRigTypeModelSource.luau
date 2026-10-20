local Players = game:GetService("Players")
local _ = require(script.Parent.Parent.Types)
local FinishModelSetupModule = require(script.Parent.finishModelSetup)

return function(p1, RigType)
	-- upvalues: Players (copy), FinishModelSetupModule (copy)
	return function(p2)
		-- upvalues: p1 (copy), Players (upval), RigType (copy), FinishModelSetupModule (upval)
		local Number: number? = tonumber(p1)
		
		if not Number then
			return nil
		end
		local Success, Result = pcall(function()
			-- upvalues: Players (upval), Number (copy), RigType (upval)
			return Players:CreateHumanoidModelFromDescriptionAsync(Players:GetHumanoidDescriptionFromUserIdAsync(Number), RigType)
		end)
		
		if not p2.isCancelled() then
			return if Success and Result then FinishModelSetupModule(Result) else nil
		end
		if Success and Result then
			Result:Destroy()
		end
		return nil
	end
end