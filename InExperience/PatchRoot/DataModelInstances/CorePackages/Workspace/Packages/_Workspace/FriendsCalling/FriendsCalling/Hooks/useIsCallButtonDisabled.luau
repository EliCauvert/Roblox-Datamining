local UseIsCallPipShownModule = require(script:FindFirstAncestor("FriendsCalling").Hooks.useIsCallPipShown)

return function()
	-- upvalues: UseIsCallPipShownModule (copy)
	return UseIsCallPipShownModule()
end