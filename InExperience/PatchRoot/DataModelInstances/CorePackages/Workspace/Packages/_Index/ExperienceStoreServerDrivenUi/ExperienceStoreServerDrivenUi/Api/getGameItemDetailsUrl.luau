local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url
local _ = require(ExperienceStoreServerDrivenUi.Utils.GameItemType)
local FStringDebugGameItemDetailsMockPageIdentifierModule = require(ExperienceStoreServerDrivenUi.Flags.FStringDebugGameItemDetailsMockPageIdentifier)
local NewUrlBuilder = UrlBuilder.new({
	path = "experience-store/v1beta1/universes/{universeId}/game-item-details",
	base = Url.APIS_URL
})
local NewUrlBuilder1 = UrlBuilder.new({ path = "landing-page-api/mock-api", base = Url.APIS_URL })

return function(p1)
	-- upvalues: FStringDebugGameItemDetailsMockPageIdentifierModule (copy), UrlBuilder (copy), NewUrlBuilder1 (copy), NewUrlBuilder (copy)
	return if FStringDebugGameItemDetailsMockPageIdentifierModule == "" then UrlBuilder.addQueryString(NewUrlBuilder({ universeId = p1.universeId }), { itemId = p1.itemId, itemType = p1.itemType }) else UrlBuilder.addQueryString(NewUrlBuilder1(), {
		pageidentifier = FStringDebugGameItemDetailsMockPageIdentifierModule
	})
end