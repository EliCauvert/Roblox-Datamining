local parent = script.Parent.Parent
local parent_1 = parent.Parent
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local dashModule = require(parent_1.Dash)
local reactModule = require(parent_1.React)
local fFlagCapturesUpdateUsePlayShutterSoundTestingModule = require(parent.Flags.FFlagCapturesUpdateUsePlayShutterSoundTesting)

return function() --[[ line: 17 ]]
	-- upvalues: fFlagCapturesUpdateUsePlayShutterSoundTestingModule (ref), dashModule (ref), reactModule (ref), robloxGui (ref)
	if fFlagCapturesUpdateUsePlayShutterSoundTestingModule or not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
		local var4 = reactModule.useRef(nil)
		reactModule.useEffect(function() --[[ line: 27 ]]
			-- upvalues: fFlagCapturesUpdateUsePlayShutterSoundTestingModule (copy), robloxGui (copy), var4 (ref)
			local sound = Instance.new("Sound")
			sound.Name = if fFlagCapturesUpdateUsePlayShutterSoundTestingModule then "ShutterSound" else "ShutterSound"
			sound.Parent = robloxGui
			sound.Volume = if fFlagCapturesUpdateUsePlayShutterSoundTestingModule then 1 else 1
			
			if not fFlagCapturesUpdateUsePlayShutterSoundTestingModule then
				sound.SoundId = "rbxassetid://10066921516"
			end
			var4.current = sound
			
			if fFlagCapturesUpdateUsePlayShutterSoundTestingModule and not _G.__TEST_SUITE_PACKAGE__ and not _G.__TESTEZ_RUNNING_TEST__ then
				sound.SoundId = "rbxassetid://10066921516"
			end
			return function() --[[ line: 44 ]]
				-- upvalues: var4 (copy), sound (ref)
				var4.current = nil
				sound:Destroy()
			end
		end, {})
		
		return reactModule.useCallback(function() --[[ line: 50 ]]
			-- upvalues: var4 (ref)
			if var4.current then
				var4.current:Play()
			end
		end, {})
	end
	return dashModule.noop
end