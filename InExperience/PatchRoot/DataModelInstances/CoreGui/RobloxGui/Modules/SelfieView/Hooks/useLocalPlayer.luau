local reactModule = require(game:GetService("CorePackages").Packages.React)
local playersService = game:GetService("Players")

return function()
	-- upvalues: reactModule (ref), playersService (ref)
	return reactModule.useMemo(function()
		-- upvalues: playersService (copy)
		local localPlayer = playersService.LocalPlayer
		while not localPlayer do
			playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
			localPlayer = playersService.LocalPlayer
		end
		assert(localPlayer ~= nil)
		
		return localPlayer
	end)
end