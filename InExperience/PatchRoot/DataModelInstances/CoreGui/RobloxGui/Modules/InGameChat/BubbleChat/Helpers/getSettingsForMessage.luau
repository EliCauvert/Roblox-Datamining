local tModule = require(game:GetService("CorePackages").Packages.t)
local typesModule = require(script.Parent.Parent.Types)
local maybeAssertModule = require(script.Parent.maybeAssert)
local _ = script.Parent.Parent.Parent.Parent.Flags

return function(value, p1)
	-- upvalues: maybeAssertModule (ref), typesModule (ref), tModule (ref)
	maybeAssertModule(typesModule.IChatSettings(value))
	maybeAssertModule(tModule.optional(typesModule.IMessage)(p1))
	local userSpecificSettings = value.UserSpecificSettings
	
	if not userSpecificSettings or not p1 then
		return value
	end
	local userId = userSpecificSettings[p1.userId]
	
	if not userId and p1.adornee then
		userId = userSpecificSettings[p1.adornee:GetFullName()]
	end
	return userId or value
end