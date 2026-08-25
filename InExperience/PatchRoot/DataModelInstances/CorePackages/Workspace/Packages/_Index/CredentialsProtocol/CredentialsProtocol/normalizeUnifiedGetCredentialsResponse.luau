local constantsModule = require(script.Parent.Constants)

return function(p0)
	-- upvalues: constantsModule (ref)
	return if typeof(p0) == "table" then if not (p0.credentialType ~= nil or p0.errorCode ~= nil) then if typeof(p0.id) == "string" and typeof(p0.response) == "table" then {
		credentialType = constantsModule.CredentialsTypes.FIDO2,
		response = p0
	} else p0 else p0 else p0
end