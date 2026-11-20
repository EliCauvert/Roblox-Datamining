local Parent = script:FindFirstAncestor("ExperienceStoreServerDrivenUi").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local SduiCapabilities = require(Parent.SduiSharedUtilities).SduiCapabilities
local FFlagLuaAppDevStoreSeeAllAdvertiseCapabilities = require(Parent.SharedFlags).FFlagLuaAppDevStoreSeeAllAdvertiseCapabilities
local FFlagLuaAppDevStoreSeeAllAdvertiseOpenGameItemDetails = require(Parent.SharedFlags).FFlagLuaAppDevStoreSeeAllAdvertiseOpenGameItemDetails
local NewUrlBuilder = UrlBuilder.new({
	path = "experience-store/v1beta1/universes/{universeId}/dev-store-see-all",
	base = require(Parent.Http).Url.APIS_URL
})

return function(UniverseId)
	-- upvalues: NewUrlBuilder (copy), FFlagLuaAppDevStoreSeeAllAdvertiseCapabilities (copy), FFlagLuaAppDevStoreSeeAllAdvertiseOpenGameItemDetails (copy), SduiCapabilities (copy), UrlBuilder (copy)
	local UrlBuilder1 = NewUrlBuilder({ universeId = UniverseId })
	
	if FFlagLuaAppDevStoreSeeAllAdvertiseCapabilities then
		local t = {}
		local List = { "CAPABILITY_SUPPORTS_FOUNDATION_BADGE_OVERMEDIA_LIGHT" }
		
		if FFlagLuaAppDevStoreSeeAllAdvertiseOpenGameItemDetails then
			table.insert(List, "CAPABILITY_SUPPORTS_OPEN_GAME_ITEM_DETAILS_ACTION")
		end
		SduiCapabilities.addToQueryParams(t, List)
		
		if next(t) ~= nil then
			UrlBuilder1 = UrlBuilder.addQueryString(UrlBuilder1, t)
		end
	end
	return UrlBuilder1
end