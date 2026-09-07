local parent = script:FindFirstAncestor("DevStore").Parent
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	path = "experience-store/v1beta1/universes/{universeId}/dev-store-see-all",
	base = require(parent.Http).Url.APIS_URL
})

return function(p1)
	-- upvalues: var1 (ref)
	return var1({ universeId = p1 })
end