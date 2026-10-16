local SharedFlagsModule = require(script:FindFirstAncestor("AvatarExperienceFlags").Parent.SharedFlags)
local FFlagAXEnableProfileTab = SharedFlagsModule.FFlagAXEnableProfileTab
local FFlagAXPPEReturnToEntrySurface = SharedFlagsModule.FFlagAXPPEReturnToEntrySurface

return game:DefineFastFlag("AXUseProfileIconEntryPoint", false) and (FFlagAXEnableProfileTab and FFlagAXPPEReturnToEntrySurface)