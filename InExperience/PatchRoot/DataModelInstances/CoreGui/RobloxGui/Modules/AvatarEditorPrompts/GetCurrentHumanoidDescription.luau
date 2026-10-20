local Players = game:GetService("Players")
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)

return function()
	-- upvalues: PromiseModule (copy), Players (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: () -> ())
		-- upvalues: Players (upval)
		local Success, Result = pcall(function()
			-- upvalues: Players (upval)
			return Players:GetHumanoidDescriptionFromUserIdAsync(Players.LocalPlayer.UserId)
		end)
		
		if Success then
			Callback(Result)
			
			return
		else
			Callback1()
		end
	end)
end