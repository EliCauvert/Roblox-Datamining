local Players = game:GetService("Players")
local _ = require(script.Parent.Parent.Types)
local FinishModelSetupModule = require(script.Parent.finishModelSetup)

return function(p1) --[[ Line: 10 | Named "createUserIdModelSource" ]]
	-- upvalues: Players (copy), FinishModelSetupModule (copy)
	return function(p2) --[[ Line: 11 ]]
		-- upvalues: p1 (copy), Players (upval), FinishModelSetupModule (upval)
		local Number: number? = tonumber(p1)
		
		if not Number then
			return nil
		end
		local Success, Result = pcall(function() --[[ Line: 17 ]]
			-- upvalues: Players (upval), Number (copy)
			return Players:CreateHumanoidModelFromUserIdAsync(Number)
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