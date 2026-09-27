local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local reactModule = require(script.Parent.Parent.Parent.React)

return function()
	-- upvalues: reactModule (ref), robloxGui (ref)
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: robloxGui (copy), var1 (ref)
		local shutterSound = Instance.new("Sound")
		shutterSound.Name = "ShutterSound"
		shutterSound.Parent = robloxGui
		shutterSound.Volume = 1
		
		if not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
			shutterSound.SoundId = "rbxassetid://10066921516"
		end
		var1.current = shutterSound
		
		return function()
			-- upvalues: var1 (copy), shutterSound (ref)
			var1.current = nil
			shutterSound:Destroy()
		end
	end, {})
	
	return reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		if var1.current then
			var1.current:Play()
		end
	end, {})
end