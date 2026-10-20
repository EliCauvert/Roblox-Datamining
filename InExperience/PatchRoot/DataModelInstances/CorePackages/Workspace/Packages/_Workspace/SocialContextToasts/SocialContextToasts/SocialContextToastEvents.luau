local Parent = script:FindFirstAncestor("SocialContextToasts").Parent
local TModule = require(Parent.t)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local StrictInterfaceResult = TModule.strictInterface({
	toastType = TModule.string,
	friendId = TModule.string,
	universeId = TModule.string,
	placeId = TModule.string,
	actionType = TModule.string
})

return function(p1, p2)
	-- upvalues: StrictInterfaceResult (copy), MutedErrorFunction (copy)
	local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p2)
	
	if not StrictInterfaceResultResult then
		MutedErrorFunction(StrictInterfaceResultResult2)
	end
	p1:sendEventDeferred("SocialContextToast", "socialContextToastEvent", p2)
end