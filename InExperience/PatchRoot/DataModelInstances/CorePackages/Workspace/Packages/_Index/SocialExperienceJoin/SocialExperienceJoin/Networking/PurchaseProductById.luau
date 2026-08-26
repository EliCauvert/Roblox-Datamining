local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local url = require(socialExperienceJoin.Parent.Http).Url

return require(socialExperienceJoin.Networking.myRoduxNetworking).POST(script.Name, function(p1, p2, p3)
	-- upvalues: url (ref)
	return p1(url.ECONOMY_URL):path("v1"):path("purchases"):path("products"):id(p2):body(p3 or {})
end)