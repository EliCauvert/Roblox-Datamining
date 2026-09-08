local playersService = game:GetService("Players")
local _ = require(script.Parent.Parent.Types)
local finishModelSetupModule = require(script.Parent.finishModelSetup)

return function(p1)
	-- upvalues: playersService (ref), finishModelSetupModule (ref)
	return function(p2)
		-- upvalues: p1 (ref), playersService (copy), finishModelSetupModule (copy)
		local var1 = tonumber(p1)
		
		if not var1 then
			return nil
		end
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), var1 (ref)
			return playersService:CreateHumanoidModelFromUserIdAsync(var1)
		end)
		
		if p2.isCancelled() then
			if ok and status then
				status:Destroy()
			end
			return nil
		else
			return if ok and status then finishModelSetupModule(status) else nil
		end
	end
end