local ReactModule = require(game:GetService("CorePackages").Packages.React)
local Players = game:GetService("Players")

return function() --[[ Line: 8 | Named "useLocalPlayer" ]]
	-- upvalues: ReactModule (copy), Players (copy)
	return ReactModule.useMemo(function() --[[ Line: 9 ]]
		-- upvalues: Players (upval)
		local LocalPlayer = Players.LocalPlayer
		while not LocalPlayer do
			Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			LocalPlayer = Players.LocalPlayer
		end
		assert(LocalPlayer ~= nil)
		
		return LocalPlayer
	end)
end