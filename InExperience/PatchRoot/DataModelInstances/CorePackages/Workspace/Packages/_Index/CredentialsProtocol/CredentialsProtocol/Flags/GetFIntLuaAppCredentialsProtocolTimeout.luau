game:DefineFastInt("LuaAppCredentialsProtocolTimeout", 20)

return function(): number --[[ Line: 5 ]]
	local LuaAppCredentialsProtocolTimeoutFastInt: number = game:GetFastInt("LuaAppCredentialsProtocolTimeout")
	
	return if LuaAppCredentialsProtocolTimeoutFastInt <= 20 then 20 else LuaAppCredentialsProtocolTimeoutFastInt
end