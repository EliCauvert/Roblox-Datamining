local _ = require(script.CredentialsProtocolTypes)

return {
	Constants = require(script.Constants),
	CredentialsProtocol = require(script.CredentialsProtocol),
	CredentialsProtocolErrorCodes = require(script.CredentialsProtocolErrorCodes),
	Flags = {
		GetFFlagLuaAppEnableCredentialsProtocol = require(script.Flags.GetFFlagLuaAppEnableCredentialsProtocol),
		GetFIntLuaAppCredentialsProtocolTimeout = require(script.Flags.GetFIntLuaAppCredentialsProtocolTimeout),
		GetFIntLuaAppCredentialsProtocolAvailableTimeout = require(script.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout)
	}
}