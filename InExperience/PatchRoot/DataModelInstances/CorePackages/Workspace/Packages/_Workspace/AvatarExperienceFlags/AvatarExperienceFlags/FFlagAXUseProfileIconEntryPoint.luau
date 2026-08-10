local sharedFlagsModule = require(script:FindFirstAncestor("AvatarExperienceFlags").Parent.SharedFlags)

return game:DefineFastFlag("AXUseProfileIconEntryPoint", false) and (sharedFlagsModule.FFlagAXEnableProfileTab and sharedFlagsModule.FFlagAXPPEReturnToEntrySurface)