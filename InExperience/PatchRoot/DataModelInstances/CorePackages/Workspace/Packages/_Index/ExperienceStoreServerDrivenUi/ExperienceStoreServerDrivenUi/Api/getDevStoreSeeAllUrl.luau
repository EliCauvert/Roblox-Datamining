local Parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local NewResult = require(Parent.UrlBuilder).UrlBuilder.new({
	path = "experience-store/v1beta1/universes/{universeId}/dev-store-see-all",
	base = require(Parent.Http).Url.APIS_URL
})

return function(UniverseId) --[[ Line: 12 | Named "getDevStoreSeeAllUrl" ]]
	-- upvalues: NewResult (copy)
	return NewResult({ universeId = UniverseId })
end