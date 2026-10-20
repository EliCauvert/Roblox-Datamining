local ConstantsModule = require(script.Parent.Constants)

return function(p1: number)
	-- upvalues: ConstantsModule (copy)
	return if typeof(p1) == "number" and p1 > 0 then p1 / 1000 else ConstantsModule.Defaults.CREDENTIALSPROTOCOL_GETCREDENTIALS_DEFAULTTIMEOUT
end