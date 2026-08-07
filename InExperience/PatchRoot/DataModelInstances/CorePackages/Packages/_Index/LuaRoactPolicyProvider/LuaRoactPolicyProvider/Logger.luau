local lumberyakModule = require(script.Parent.Parent.Lumberyak)

return if game:DefineFastFlag("RoactPolicyLoggerName", false) then lumberyakModule.Logger.new(nil, "LuaRoactPolicyProvider") else lumberyakModule.Logger.new()