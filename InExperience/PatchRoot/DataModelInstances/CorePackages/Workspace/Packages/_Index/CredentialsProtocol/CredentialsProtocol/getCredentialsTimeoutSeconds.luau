local constantsModule = require(script.Parent.Constants)

return function(p0)
	-- upvalues: constantsModule (ref)
	return if typeof(p0) == "number" and p0 > 0 then p0 / 1000 else constantsModule.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT
end