game:DefineFastInt("LuaAppCredentialsProtocolTimeout", 20)

return function()
	local luaAppCredentialsProtocolTimeoutFastInt = game:GetFastInt("LuaAppCredentialsProtocolTimeout")
	
	return if luaAppCredentialsProtocolTimeoutFastInt <= 20 then 20 else luaAppCredentialsProtocolTimeoutFastInt
end