local GetFFlagLuaAppEnableAndroidPushUpsellModule = require(script.Parent.GetFFlagLuaAppEnableAndroidPushUpsell)
game:DefineFastFlag("LuaEnableShowUpsellMethod2", false)

return function()
	-- upvalues: GetFFlagLuaAppEnableAndroidPushUpsellModule (copy)
	return if GetFFlagLuaAppEnableAndroidPushUpsellModule() then game:GetFastFlag("LuaEnableShowUpsellMethod2") else game:GetFastFlag("LuaEnableShowUpsellMethod2") and game:GetEngineFeature("PermissionsProtocolShouldShowUpsellIOSEnabled")
end