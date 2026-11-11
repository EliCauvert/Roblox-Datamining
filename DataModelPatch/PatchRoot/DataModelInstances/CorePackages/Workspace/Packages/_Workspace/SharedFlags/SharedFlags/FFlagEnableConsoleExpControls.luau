local Parent = script.Parent
local FFlagEnableInExperienceHandheldControlsModule = require(Parent:WaitForChild("FFlagEnableInExperienceHandheldControls"))
local EnableConsoleExpControls684 = game:DefineFastFlag("EnableConsoleExpControls684", false)

return require(Parent:WaitForChild("FFlagEnableConsoleExpControlsIXP")) or (FFlagEnableInExperienceHandheldControlsModule or EnableConsoleExpControls684)