game:DefineFastInt("LuaAppCredentialsProtocolTimeout", 20)

return function() --[[ line: 5 ]]
	local luaAppCredentialsProtocolTimeoutFastInt = game:GetFastInt("LuaAppCredentialsProtocolTimeout")
	
	return if luaAppCredentialsProtocolTimeoutFastInt <= 20 then 20 else luaAppCredentialsProtocolTimeoutFastInt
end