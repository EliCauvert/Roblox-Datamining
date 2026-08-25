game:DefineFastInt("LuaAppCredentialsProtocolAvailableTimeout", 2)

return function()
	local luaAppCredentialsProtocolAvailableTimeoutFastInt = game:GetFastInt("LuaAppCredentialsProtocolAvailableTimeout")
	
	return if luaAppCredentialsProtocolAvailableTimeoutFastInt <= 0 then 2 else luaAppCredentialsProtocolAvailableTimeoutFastInt
end