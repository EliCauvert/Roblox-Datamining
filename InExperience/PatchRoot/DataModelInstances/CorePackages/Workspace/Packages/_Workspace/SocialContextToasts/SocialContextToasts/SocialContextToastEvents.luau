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

return function(p1, p2)
	-- upvalues: var1 (ref), mutedError (ref)
	local var2, var3 = var1(p2)
	
	if not var2 then
		mutedError(var3)
	end
	p1:sendEventDeferred("SocialContextToast", "socialContextToastEvent", p2)
end