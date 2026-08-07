game:DefineFastInt("LuaAppCredentialsProtocolAvailableTimeout", 2)

return function() --[[ line: 5 ]]
	local luaAppCredentialsProtocolAvailableTimeoutFastInt = game:GetFastInt("LuaAppCredentialsProtocolAvailableTimeout")
	
	return if luaAppCredentialsProtocolAvailableTimeoutFastInt <= 0 then 2 else luaAppCredentialsProtocolAvailableTimeoutFastInt
end