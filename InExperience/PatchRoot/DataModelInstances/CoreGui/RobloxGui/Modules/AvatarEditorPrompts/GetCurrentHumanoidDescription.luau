local playersService = game:GetService("Players")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)

return function()
	-- upvalues: promiseModule (ref), playersService (ref)
	return promiseModule.new(function(p0, p1)
		-- upvalues: playersService (copy)
		local ok, status = pcall(function()
			-- upvalues: playersService (copy)
			return playersService:GetHumanoidDescriptionFromUserIdAsync(playersService.LocalPlayer.UserId)
		end)
		
		if ok then
			p0(status)
			
			return
		end
		p1()
	end)
end