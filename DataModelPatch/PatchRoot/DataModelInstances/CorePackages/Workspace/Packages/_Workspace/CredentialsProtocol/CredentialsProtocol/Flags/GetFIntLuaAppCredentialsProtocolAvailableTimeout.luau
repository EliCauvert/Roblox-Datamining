game:DefineFastInt("LuaAppCredentialsProtocolAvailableTimeout", 2)

return function(): number
	local LuaAppCredentialsProtocolAvailableTimeoutFastInt: number = game:GetFastInt("LuaAppCredentialsProtocolAvailableTimeout")
	
	return if LuaAppCredentialsProtocolAvailableTimeoutFastInt <= 0 then 2 else LuaAppCredentialsProtocolAvailableTimeoutFastInt
end