game:DefineFastString("DebugDefaultPageOverride", "")

return function()
	local LuaAppDefaultPageOverrideFVariable = settings():GetFVariable("LuaAppDefaultPageOverride")
	
	return if #LuaAppDefaultPageOverrideFVariable > 0 then LuaAppDefaultPageOverrideFVariable else game:GetFastString("DebugDefaultPageOverride")
end