local parent = script:FindFirstAncestor("DevStore").Parent
local var0 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "experience-store/v1beta1/universes/{universeId}/dev-store-see-all",
	base = require(parent.Http).Url.APIS_URL
})

return function(p0)
	-- upvalues: var0 (ref)
	return var0({ universeId = p0 })
end