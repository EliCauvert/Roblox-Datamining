local Modules = game:GetService("CoreGui").RobloxGui.Modules
local SignUpUsernameModule = require(Modules.LuaApp.Reducers.Authentication.SignUpUsername)
local SignUpPasswordModule = require(Modules.LuaApp.Reducers.Authentication.SignUpPassword)
local SignUpBundlesModule = require(Modules.LuaApp.Reducers.Authentication.SignUpBundles)
local SignUpBirthdayModule = require(Modules.LuaApp.Reducers.Authentication.SignUpBirthday)
local SignUpSelectedBundleIdModule = require(Modules.LuaApp.Reducers.Authentication.SignUpSelectedBundleId)
local ClearSignUpInfoModule = require(Modules.LuaApp.Actions.Authentication.ClearSignUpInfo)
local HumanoidDescriptionPropertiesModule = require(Modules.LuaApp.Reducers.Authentication.HumanoidDescriptionProperties)

return function(p1, p2)
	-- upvalues: ClearSignUpInfoModule (copy), SignUpBirthdayModule (copy), SignUpUsernameModule (copy), SignUpPasswordModule (copy), SignUpSelectedBundleIdModule (copy), SignUpBundlesModule (copy), HumanoidDescriptionPropertiesModule (copy)
	local P0 = p1 or {}
	local T = if p2.type == ClearSignUpInfoModule.name then {} else P0
	
	return {
		SignUpBirthday = SignUpBirthdayModule(T.SignUpBirthday, p2),
		SignUpUsername = SignUpUsernameModule(T.SignUpUsername, p2),
		SignUpPassword = SignUpPasswordModule(T.SignUpPassword, p2),
		SignUpSelectedBundleId = SignUpSelectedBundleIdModule(T.SignUpSelectedBundleId, p2),
		SignUpBundles = SignUpBundlesModule(T.SignUpBundles, p2),
		HumanoidDescriptionProperties = HumanoidDescriptionPropertiesModule(T.HumanoidDescriptionProperties, p2)
	}
end