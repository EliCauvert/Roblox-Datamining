local getFFlagLuaAppEnableAndroidPushUpsellModule = require(script.Parent.GetFFlagLuaAppEnableAndroidPushUpsell)
game:DefineFastFlag("LuaEnableShowUpsellMethod2", false)

return function()
	-- upvalues: getFFlagLuaAppEnableAndroidPushUpsellModule (ref)
	return if getFFlagLuaAppEnableAndroidPushUpsellModule() then game:GetFastFlag("LuaEnableShowUpsellMethod2") else game:GetFastFlag("LuaEnableShowUpsellMethod2") and game:GetEngineFeature("PermissionsProtocolShouldShowUpsellIOSEnabled")
end