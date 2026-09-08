local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local var1 = require(parent.UrlBuilder).UrlBuilder.new({
	base = require(parent.Http).Url.APIS_URL,
	path = require(avatarExperienceCatalog.Sdui.Constants).CatalogSduiUrl
})

return function()
	-- upvalues: var1 (ref)
	return var1()
end