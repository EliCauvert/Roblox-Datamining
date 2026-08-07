local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local url = require(socialExperienceJoin.Parent.Http).Url

return require(socialExperienceJoin.Networking.myRoduxNetworking).POST(script.Name, function(p0, p1, p2) --[[ line: 19 ]]
	-- upvalues: url (ref)
	return p0(url.ECONOMY_URL):path("v1"):path("purchases"):path("products"):id(p1):body(p2 or {})
end)