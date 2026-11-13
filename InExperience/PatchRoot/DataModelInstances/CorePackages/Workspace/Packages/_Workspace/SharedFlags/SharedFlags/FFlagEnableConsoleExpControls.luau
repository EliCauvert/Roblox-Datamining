local Parent = script.Parent
local FFlagEnableConsoleExpControlsIXPModule = require(Parent:WaitForChild("FFlagEnableConsoleExpControlsIXP"))
local FFlagEnableInExperienceHandheldControlsModule = require(Parent:WaitForChild("FFlagEnableInExperienceHandheldControls"))
local EnableConsoleExpControls684 = game:DefineFastFlag("EnableConsoleExpControls684", false)

return FFlagEnableConsoleExpControlsIXPModule or (FFlagEnableInExperienceHandheldControlsModule or EnableConsoleExpControls684)