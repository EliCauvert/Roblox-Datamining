local parent = script:FindFirstAncestor("SocialContextToasts").Parent
local tModule = require(parent.t)
local mutedError = require(parent.Loggers).mutedError
local var1 = tModule.strictInterface({
	toastType = tModule.string,
	friendId = tModule.string,
	universeId = tModule.string,
	placeId = tModule.string,
	actionType = tModule.string
})

return function(p0, p1)
	-- upvalues: var1 (ref), mutedError (ref)
	local var2, var3 = var1(p1)
	
	if not var2 then
		mutedError(var3)
	end
	p0:sendEventDeferred("SocialContextToast", "socialContextToastEvent", p1)
end