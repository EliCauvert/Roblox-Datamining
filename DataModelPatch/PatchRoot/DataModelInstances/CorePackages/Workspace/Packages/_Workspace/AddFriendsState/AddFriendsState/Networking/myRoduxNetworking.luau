local AddFriendsState = script:FindFirstAncestor("AddFriendsState")
local Parent = AddFriendsState.Parent

return (require(Parent.RoduxNetworking).config({
	keyPath = `{require(AddFriendsState.RODUX_KEY)}.NetworkStatus`,
	networkImpl = require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper((require(script.Parent.myHttpRequest)))
}))