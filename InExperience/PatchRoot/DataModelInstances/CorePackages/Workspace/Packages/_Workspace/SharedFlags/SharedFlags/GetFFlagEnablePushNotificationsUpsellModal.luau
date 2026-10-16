local GetFFlagLuaEnableShowUpsellMethodModule = require(script.Parent.GetFFlagLuaEnableShowUpsellMethod)
local GetFFlagLuaAppPushSystemUpsellDevOverrideModule = require(script.Parent.GetFFlagLuaAppPushSystemUpsellDevOverride)
game:DefineFastFlag("EnablePushNotificationsUpsellModal6", false)

return function() --[[ Line: 5 ]]
	-- upvalues: GetFFlagLuaEnableShowUpsellMethodModule (copy), GetFFlagLuaAppPushSystemUpsellDevOverrideModule (copy)
	return GetFFlagLuaEnableShowUpsellMethodModule() and game:GetFastFlag("EnablePushNotificationsUpsellModal6") or GetFFlagLuaAppPushSystemUpsellDevOverrideModule()
end