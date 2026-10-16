local Players = game:GetService("Players")
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)

return function() --[[ Line: 6 ]]
	-- upvalues: PromiseModule (copy), Players (copy)
	return PromiseModule.new(function(Callback: (any) -> (), Callback1: () -> ()) --[[ Line: 7 ]]
		-- upvalues: Players (upval)
		local Success, Result = pcall(function() --[[ Line: 8 ]]
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