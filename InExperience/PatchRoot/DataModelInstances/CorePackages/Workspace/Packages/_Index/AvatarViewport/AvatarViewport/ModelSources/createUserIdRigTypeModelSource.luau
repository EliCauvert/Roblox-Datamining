local playersService = game:GetService("Players")
local _ = require(script.Parent.Parent.Types)
local finishModelSetupModule = require(script.Parent.finishModelSetup)

return function(p1, p2)
	-- upvalues: playersService (ref), finishModelSetupModule (ref)
	return function(p3)
		-- upvalues: p1 (ref), playersService (copy), p2 (ref), finishModelSetupModule (copy)
		local var1 = tonumber(p1)
		
		if not var1 then
			return nil
		end
		local ok, status = pcall(function()
			-- upvalues: playersService (copy), var1 (ref), p2 (copy)
			return playersService:CreateHumanoidModelFromDescriptionAsync(playersService:GetHumanoidDescriptionFromUserIdAsync(var1), p2)
		end)
		
		if p3.isCancelled() then
			if ok and status then
				status:Destroy()
			end
			return nil
		else
			return if ok and status then finishModelSetupModule(status) else nil
		end
	end
end