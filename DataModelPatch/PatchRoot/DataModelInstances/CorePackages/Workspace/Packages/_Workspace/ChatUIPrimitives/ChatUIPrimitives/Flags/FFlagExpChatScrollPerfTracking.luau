local FFlagLuaAppPerfTrackerUseLogger = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.SharedFlags).FFlagLuaAppPerfTrackerUseLogger

return game:DefineFastFlag("ExpChatScrollPerfTracking4", false) and FFlagLuaAppPerfTrackerUseLogger