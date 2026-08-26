local playersService = game:GetService("Players")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)

return function()
	-- upvalues: promiseModule (ref), playersService (ref)
	return promiseModule.new(function(p1, p2)
		-- upvalues: playersService (copy)
		local ok, status = pcall(function()
			-- upvalues: playersService (copy)
			return playersService:GetHumanoidDescriptionFromUserIdAsync(playersService.LocalPlayer.UserId)
		end)
		
		if ok then
			p1(status)
			
			return
		end
		p2()
	end)
end