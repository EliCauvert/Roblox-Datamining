local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local DashModule = require(Parent1.Dash)
local ReactModule = require(Parent1.React)
local FFlagCapturesUpdateUsePlayShutterSoundTestingModule = require(Parent.Flags.FFlagCapturesUpdateUsePlayShutterSoundTesting)

return function()
	-- upvalues: FFlagCapturesUpdateUsePlayShutterSoundTestingModule (copy), DashModule (copy), ReactModule (copy), RobloxGui (copy)
	if FFlagCapturesUpdateUsePlayShutterSoundTestingModule or not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: FFlagCapturesUpdateUsePlayShutterSoundTestingModule (upval), RobloxGui (upval), UseRefResult (copy)
			local Sound = Instance.new("Sound")
			Sound.Name = if FFlagCapturesUpdateUsePlayShutterSoundTestingModule then "ShutterSound" else "ShutterSound"
			Sound.Parent = RobloxGui
			Sound.Volume = if FFlagCapturesUpdateUsePlayShutterSoundTestingModule then 1 else 1
			
			if not FFlagCapturesUpdateUsePlayShutterSoundTestingModule then
				Sound.SoundId = "rbxassetid://10066921516"
			end
			UseRefResult.current = Sound
			
			if FFlagCapturesUpdateUsePlayShutterSoundTestingModule and not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
				Sound.SoundId = "rbxassetid://10066921516"
			end
			return function()
				-- upvalues: UseRefResult (upval), Sound (copy)
				UseRefResult.current = nil
				Sound:Destroy()
			end
		end, {})
		
		return (ReactModule.useCallback(function()
			-- upvalues: UseRefResult (copy)
			if UseRefResult.current then
				UseRefResult.current:Play()
			end
		end, {}))
	else
		return DashModule.noop
	end
end