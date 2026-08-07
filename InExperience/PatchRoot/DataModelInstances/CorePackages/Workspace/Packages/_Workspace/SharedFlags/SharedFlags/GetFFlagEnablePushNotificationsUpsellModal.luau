local getFFlagLuaEnableShowUpsellMethodModule = require(script.Parent.GetFFlagLuaEnableShowUpsellMethod)
local getFFlagLuaAppPushSystemUpsellDevOverrideModule = require(script.Parent.GetFFlagLuaAppPushSystemUpsellDevOverride)
game:DefineFastFlag("EnablePushNotificationsUpsellModal6", false)

return function() --[[ line: 5 ]]
	-- upvalues: getFFlagLuaEnableShowUpsellMethodModule (ref), getFFlagLuaAppPushSystemUpsellDevOverrideModule (ref)
	return getFFlagLuaEnableShowUpsellMethodModule() and game:GetFastFlag("EnablePushNotificationsUpsellModal6") or getFFlagLuaAppPushSystemUpsellDevOverrideModule()
end