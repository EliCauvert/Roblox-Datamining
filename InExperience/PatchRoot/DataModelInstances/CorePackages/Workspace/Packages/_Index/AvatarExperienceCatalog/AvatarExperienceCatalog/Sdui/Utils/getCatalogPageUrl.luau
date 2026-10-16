local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	base = require(Parent.Http).Url.APIS_URL,
	path = require(AvatarExperienceCatalog.Sdui.Constants).CatalogSduiUrl
})

return function() --[[ Line: 13 | Named "getCatalogPageUrl" ]]
	-- upvalues: NewResult (copy)
	return NewResult()
end