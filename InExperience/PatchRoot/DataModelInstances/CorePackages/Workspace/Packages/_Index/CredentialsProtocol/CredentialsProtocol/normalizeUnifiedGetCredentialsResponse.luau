local constantsModule = require(script.Parent.Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	return if typeof(p1) == "table" then if not (p1.credentialType ~= nil or p1.errorCode ~= nil) then if typeof(p1.id) == "string" and typeof(p1.response) == "table" then {
		credentialType = constantsModule.CredentialsTypes.FIDO2,
		response = p1
	} else p1 else p1 else p1
end