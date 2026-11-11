local Parent = script:FindFirstAncestor("Chrome").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagExperienceMenuGamepadExposureEnabled = SharedFlagsModule.FFlagExperienceMenuGamepadExposureEnabled
game:DefineFastFlag("EnableInGameMenuChrome", false)
local DebugEnableChromeOnUnsupportedDevices = game:DefineFastFlag("DebugEnableChromeOnUnsupportedDevices", false)
local VRService = game:GetService("VRService")
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local IsInExperienceUIVREnabled = require(Parent.SharedExperimentDefinition).isInExperienceUIVREnabled

return function()
	-- upvalues: DebugEnableChromeOnUnsupportedDevices (copy), VRService (copy), IsInExperienceUIVREnabled (copy), FFlagExperienceMenuGamepadExposureEnabled (copy), IsTenFootInterface (copy), FFlagEnableConsoleExpControls (copy)
	return if DebugEnableChromeOnUnsupportedDevices then true elseif VRService.VREnabled then if IsInExperienceUIVREnabled then true else false elseif FFlagExperienceMenuGamepadExposureEnabled then true else (not IsTenFootInterface or FFlagEnableConsoleExpControls) and game:GetFastFlag("EnableInGameMenuChrome")
end