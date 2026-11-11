local Parent = script:FindFirstAncestor("DevStore").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "experience-store/v1beta1/universes/{universeId}/dev-store-see-all",
	base = require(Parent.Http).Url.APIS_URL
})

return function(UniverseId)
	-- upvalues: NewResult (copy)
	return NewResult({ universeId = UniverseId })
end