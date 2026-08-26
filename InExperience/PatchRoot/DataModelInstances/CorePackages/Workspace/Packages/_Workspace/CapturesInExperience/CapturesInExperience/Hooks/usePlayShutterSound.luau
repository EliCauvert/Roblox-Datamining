local parent = script.Parent.Parent
local parent_1 = parent.Parent
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local dashModule = require(parent_1.Dash)
local reactModule = require(parent_1.React)
local fFlagCapturesUpdateUsePlayShutterSoundTestingModule = require(parent.Flags.FFlagCapturesUpdateUsePlayShutterSoundTesting)

return function()
	-- upvalues: fFlagCapturesUpdateUsePlayShutterSoundTestingModule (ref), dashModule (ref), reactModule (ref), robloxGui (ref)
	if fFlagCapturesUpdateUsePlayShutterSoundTestingModule or not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
		local var1 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: fFlagCapturesUpdateUsePlayShutterSoundTestingModule (copy), robloxGui (copy), var1 (ref)
			local sound = Instance.new("Sound")
			sound.Name = if fFlagCapturesUpdateUsePlayShutterSoundTestingModule then "ShutterSound" else "ShutterSound"
			sound.Parent = robloxGui
			sound.Volume = if fFlagCapturesUpdateUsePlayShutterSoundTestingModule then 1 else 1
			
			if not fFlagCapturesUpdateUsePlayShutterSoundTestingModule then
				sound.SoundId = "rbxassetid://10066921516"
			end
			var1.current = sound
			
			if fFlagCapturesUpdateUsePlayShutterSoundTestingModule and not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
				sound.SoundId = "rbxassetid://10066921516"
			end
			return function()
				-- upvalues: var1 (copy), sound (ref)
				var1.current = nil
				sound:Destroy()
			end
		end, {})
		
		return reactModule.useCallback(function()
			-- upvalues: var1 (ref)
			if var1.current then
				var1.current:Play()
			end
		end, {})
	end
	return dashModule.noop
end