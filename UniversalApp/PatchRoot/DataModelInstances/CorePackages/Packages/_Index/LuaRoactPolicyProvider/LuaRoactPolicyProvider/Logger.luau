local LumberyakModule = require(script.Parent.Parent.Lumberyak)

return if game:DefineFastFlag("RoactPolicyLoggerName", false) then LumberyakModule.Logger.new(nil, "LuaRoactPolicyProvider") else LumberyakModule.Logger.new()