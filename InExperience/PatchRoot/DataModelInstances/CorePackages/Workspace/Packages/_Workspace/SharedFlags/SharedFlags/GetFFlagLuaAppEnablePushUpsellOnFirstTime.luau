local GetFFlagLuaEnableShowUpsellMethodModule = require(script.Parent.GetFFlagLuaEnableShowUpsellMethod)
local GetFFlagLuaAppPushSystemUpsellDevOverrideModule = require(script.Parent.GetFFlagLuaAppPushSystemUpsellDevOverride)
game:DefineFastFlag("LuaAppEnablePushUpsellOnFirstTime", false)

return function()
	-- upvalues: GetFFlagLuaEnableShowUpsellMethodModule (copy), GetFFlagLuaAppPushSystemUpsellDevOverrideModule (copy)
	return GetFFlagLuaEnableShowUpsellMethodModule() and game:GetFastFlag("LuaAppEnablePushUpsellOnFirstTime") or GetFFlagLuaAppPushSystemUpsellDevOverrideModule()
end