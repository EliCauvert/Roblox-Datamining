game:DefineFastFlag("LuaAppEnableWebViewTelemetry", false)

return function()
	return game:GetFastFlag("LuaAppEnableWebViewTelemetry")
end