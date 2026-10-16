local UserProfiles = script:FindFirstAncestor("UserProfiles")
local SignalsReactModule = require(UserProfiles.Parent.SignalsReact)
local GetResult = require(UserProfiles.Stores.VerifiedBadgeDisplayStore).get()

return function(Player) --[[ Line: 13 | Named "useVerifiedBadge" ]]
	-- upvalues: GetResult (copy), SignalsReactModule (copy)
	return (SignalsReactModule.useSignalState((GetResult.getBadgeVisibilitySignal(Player.UserId))))
end