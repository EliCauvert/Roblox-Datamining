local GetFFlagEnableEdpStoreGridPositionLoggingModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging)

return game:DefineFastFlag("LuaAppPassesPageFallbackViewWidth", false) and GetFFlagEnableEdpStoreGridPositionLoggingModule()