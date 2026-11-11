local Parent = script:FindFirstAncestor("GameDetailRodux").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "experience-details-api/v1/get-experience-details",
	base = require(Parent.Http).Url.APIS_URL,
	query = { universeId = "{universeId}" }
})

return function(Callback, UniverseId)
	-- upvalues: NewResult (copy)
	assert(type(UniverseId) == "string", "GetExperienceDetailsPage request expects universeId to be a string")
	
	return Callback(NewResult({ universeId = UniverseId }), "GET")
end