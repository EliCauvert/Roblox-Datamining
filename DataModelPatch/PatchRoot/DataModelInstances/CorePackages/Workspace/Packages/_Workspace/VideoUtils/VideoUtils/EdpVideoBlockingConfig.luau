return if require(script:FindFirstAncestor("VideoUtils").Parent.SharedFlags).FFlagLuaAppShareEdpVideoBlockingConfig then {
	enableManufacturerDeny = game:DefineFastFlag("LuaAppEdpVideoManufacturerDeny2", false),
	enableDeviceDeny = game:DefineFastFlag("LuaAppEdpVideoDeviceDeny", false),
	enableMaxMemoryDeny = game:DefineFastFlag("LuaAppEdpVideoMaxMemoryDeny", false),
	enableAvailableRamDeny = game:DefineFastFlag("LuaAppEdpVideoAvailableRamDeny", false),
	manufacturerDenyList = game:DefineFastString("LuaAppEdpVideoManufacturerPipeDenyList", ""),
	deviceDenyList = game:DefineFastString("LuaAppEdpVideoDevicePipeDenyList", ""),
	maxMemoryThresholdMb = game:DefineFastInt("LuaAppEdpVideoMaxMemoryThresholdMb", -1),
	availableRamThresholdMb = game:DefineFastInt("LuaAppEdpVideoAvailableRamThresholdMb", -1)
} else nil