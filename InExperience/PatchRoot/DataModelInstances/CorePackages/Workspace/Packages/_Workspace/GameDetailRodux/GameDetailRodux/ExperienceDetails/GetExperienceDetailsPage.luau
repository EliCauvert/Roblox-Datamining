local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "experience-details-api/v1/get-experience-details",
	base = require(parent.Http).Url.APIS_URL,
	query = { universeId = "{universeId}" }
})

return function(p1, p2)
	-- upvalues: var1 (ref)
	assert(type(p2) == "string", "GetExperienceDetailsPage request expects universeId to be a string")
	
	return p1(var1({ universeId = p2 }), "GET")
end