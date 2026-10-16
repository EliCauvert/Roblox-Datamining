local ConstantsModule = require(script.Parent.Constants)

return function(Response) --[[ Line: 7 | Named "normalizeUnifiedGetCredentialsResponse" ]]
	-- upvalues: ConstantsModule (copy)
	return if typeof(Response) == "table" and (Response.credentialType == nil and Response.errorCode == nil and (typeof(Response.id) == "string" and typeof(Response.response) == "table")) then {
		credentialType = ConstantsModule.CredentialsTypes.FIDO2,
		response = Response
	} else Response
end