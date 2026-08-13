local _ = require(script:FindFirstAncestor("GameTile").Parent.VideoUtils)

return {
	enableManufacturerDeny = game:DefineFastFlag("LuaAppGameTileVideoManufacturerDeny", false),
	enableDeviceDeny = game:DefineFastFlag("LuaAppGameTileVideoDeviceDeny", false),
	enableMaxMemoryDeny = game:DefineFastFlag("LuaAppGameTileVideoMaxMemoryDeny", false),
	enableAvailableRamDeny = game:DefineFastFlag("LuaAppGameTileVideoAvailableRamDeny", false),
	maxMemoryThresholdMb = game:DefineFastInt("LuaAppGameTileVideoMaxMemoryThresholdMb", -1),
	availableRamThresholdMb = game:DefineFastInt("LuaAppGameTileVideoAvailableRamThresholdMb", -1),
	manufacturerDenyList = game:DefineFastString("LuaAppGameTileVideoManufacturerPipeDenyList", ""),
	deviceDenyList = game:DefineFastString("LuaAppGameTileVideoDevicePipeDenyList", "")
}