local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ReactModule = require(script.Parent.Parent.Parent.React)

return function()
	-- upvalues: ReactModule (copy), RobloxGui (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: RobloxGui (upval), UseRefResult (copy)
		local ShutterSound = Instance.new("Sound")
		ShutterSound.Name = "ShutterSound"
		ShutterSound.Parent = RobloxGui
		ShutterSound.Volume = 1
		
		if not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
			ShutterSound.SoundId = "rbxassetid://10066921516"
		end
		UseRefResult.current = ShutterSound
		
		return function()
			-- upvalues: UseRefResult (upval), ShutterSound (copy)
			UseRefResult.current = nil
			ShutterSound:Destroy()
		end
	end, {})
	
	return (ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			UseRefResult.current:Play()
		end
	end, {}))
end