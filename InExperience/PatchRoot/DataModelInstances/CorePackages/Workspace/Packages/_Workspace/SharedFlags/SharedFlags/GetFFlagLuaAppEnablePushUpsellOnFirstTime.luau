local getFFlagLuaEnableShowUpsellMethodModule = require(script.Parent.GetFFlagLuaEnableShowUpsellMethod)
local getFFlagLuaAppPushSystemUpsellDevOverrideModule = require(script.Parent.GetFFlagLuaAppPushSystemUpsellDevOverride)
game:DefineFastFlag("LuaAppEnablePushUpsellOnFirstTime", false)

return function()
	-- upvalues: getFFlagLuaEnableShowUpsellMethodModule (ref), getFFlagLuaAppPushSystemUpsellDevOverrideModule (ref)
	return getFFlagLuaEnableShowUpsellMethodModule() and game:GetFastFlag("LuaAppEnablePushUpsellOnFirstTime") or getFFlagLuaAppPushSystemUpsellDevOverrideModule()
end