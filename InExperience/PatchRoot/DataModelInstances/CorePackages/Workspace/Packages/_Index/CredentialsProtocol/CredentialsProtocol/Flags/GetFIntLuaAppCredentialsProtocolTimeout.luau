game:DefineFastInt("LuaAppCredentialsProtocolTimeout", 20)

return function(): number
	local LuaAppCredentialsProtocolTimeoutFastInt: number = game:GetFastInt("LuaAppCredentialsProtocolTimeout")
	
	return if LuaAppCredentialsProtocolTimeoutFastInt <= 20 then 20 else LuaAppCredentialsProtocolTimeoutFastInt
end