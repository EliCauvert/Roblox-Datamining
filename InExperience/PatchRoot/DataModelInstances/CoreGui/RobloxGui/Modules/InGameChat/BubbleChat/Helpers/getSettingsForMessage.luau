local TModule = require(game:GetService("CorePackages").Packages.t)
local TypesModule = require(script.Parent.Parent.Types)
local MaybeAssertModule = require(script.Parent.maybeAssert)
local _ = script.Parent.Parent.Parent.Parent.Flags

return function(p1, p2) --[[ Line: 12 | Named "getSettingsForMessage" ]]
	-- upvalues: MaybeAssertModule (copy), TypesModule (copy), TModule (copy)
	MaybeAssertModule(TypesModule.IChatSettings(p1))
	MaybeAssertModule(TModule.optional(TypesModule.IMessage)(p2))
	local UserSpecificSettings = p1.UserSpecificSettings
	
	if not UserSpecificSettings or not p2 then
		return p1
	end
	local UserSpecificSetting = UserSpecificSettings[p2.userId]
	
	if not UserSpecificSetting and p2.adornee then
		UserSpecificSetting = UserSpecificSettings[p2.adornee:GetFullName()]
	end
	return UserSpecificSetting or p1
end