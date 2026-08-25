local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local var0 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "experience-details-api/v1/get-experience-details",
	base = require(parent.Http).Url.APIS_URL,
	query = { universeId = "{universeId}" }
})

return function(p0, p1)
	-- upvalues: var0 (ref)
	assert(type(p1) == "string", "GetExperienceDetailsPage request expects universeId to be a string")
	
	return p0(var0({ universeId = p1 }), "GET")
end