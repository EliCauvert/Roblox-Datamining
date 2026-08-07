local tModule = require(game:GetService("CorePackages").Packages.t)
local typesModule = require(script.Parent.Parent.Types)
local maybeAssertModule = require(script.Parent.maybeAssert)
local _ = script.Parent.Parent.Parent.Parent.Flags

return function(value, p0) --[[ line: 12 | named "getSettingsForMessage" ]]
	-- upvalues: maybeAssertModule (ref), typesModule (ref), tModule (ref)
	maybeAssertModule(typesModule.IChatSettings(value))
	maybeAssertModule(tModule.optional(typesModule.IMessage)(p0))
	local userSpecificSettings = value.UserSpecificSettings
	
	if not userSpecificSettings or not p0 then
		return value
	end
	local userId = userSpecificSettings[p0.userId]
	
	if not userId and p0.adornee then
		userId = userSpecificSettings[p0.adornee:GetFullName()]
	end
	return userId or value
end