local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local Url = require(SocialExperienceJoin.Parent.Http).Url

return require(SocialExperienceJoin.Networking.myRoduxNetworking).POST(script.Name, function(Callback, p1, p2)
	-- upvalues: Url (copy)
	return Callback(Url.ECONOMY_URL):path("v1"):path("purchases"):path("products"):id(p1):body(p2 or {})
end)