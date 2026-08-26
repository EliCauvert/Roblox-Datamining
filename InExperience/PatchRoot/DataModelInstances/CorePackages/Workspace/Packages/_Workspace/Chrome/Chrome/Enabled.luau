local parent = script:FindFirstAncestor("Chrome").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagExperienceMenuGamepadExposureEnabled = sharedFlagsModule.FFlagExperienceMenuGamepadExposureEnabled
game:DefineFastFlag("EnableInGameMenuChrome", false)
local debugEnableChromeOnUnsupportedDevices = game:DefineFastFlag("DebugEnableChromeOnUnsupportedDevices", false)
local VRService = game:GetService("VRService")
local var1 = game:GetService("GuiService"):IsTenFootInterface()
local isInExperienceUIVREnabled = require(parent.SharedExperimentDefinition).isInExperienceUIVREnabled

return function()
	-- upvalues: debugEnableChromeOnUnsupportedDevices (ref), VRService (ref), isInExperienceUIVREnabled (ref), fFlagExperienceMenuGamepadExposureEnabled (ref), var1 (ref), fFlagEnableConsoleExpControls (ref)
	return if debugEnableChromeOnUnsupportedDevices then true elseif VRService.VREnabled then isInExperienceUIVREnabled elseif fFlagExperienceMenuGamepadExposureEnabled then true elseif var1 and not fFlagEnableConsoleExpControls then false else game:GetFastFlag("EnableInGameMenuChrome")
end