local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local User = DependenciesModule.RoduxUsers.Models.User
local Llama = DependenciesModule.llama
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType

return function(p1)
	-- upvalues: User (copy), Llama (copy), PresenceType (copy)
	local MockResult = User.mock()
	
	return Llama.Dictionary.join(MockResult, {
		thumbnail = "rbxassetid://2610133241",
		isPremium = false,
		username = MockResult.name,
		userPresenceType = PresenceType.Offline
	}, p1 or {})
end