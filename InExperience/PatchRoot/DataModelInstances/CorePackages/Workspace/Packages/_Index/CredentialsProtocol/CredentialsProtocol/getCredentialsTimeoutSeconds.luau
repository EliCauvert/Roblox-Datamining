local constantsModule = require(script.Parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	return if typeof(p1) == "number" and p1 > 0 then p1 / 1000 else constantsModule.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT
end