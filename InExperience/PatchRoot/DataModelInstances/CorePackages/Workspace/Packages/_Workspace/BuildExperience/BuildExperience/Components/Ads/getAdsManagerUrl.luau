local UrlBuilder = require(script:FindFirstAncestor("BuildExperience").Parent.UrlBuilder).UrlBuilder
local CreateAdvertise = UrlBuilder.fromString("create:advertise")
local Manage = UrlBuilder.fromString("create:advertise/manage")

local function getDefaultAdsManagerUrl()
	-- upvalues: CreateAdvertise (copy)
	return CreateAdvertise()
end

return {
	getDefaultAdsManagerUrl = getDefaultAdsManagerUrl,
	getAdsManagerUrl = function(UniverseId: number)
		-- upvalues: getDefaultAdsManagerUrl (copy), UrlBuilder (copy), Manage (copy)
		return if UniverseId == nil or UniverseId <= 0 then getDefaultAdsManagerUrl() else UrlBuilder.addQueryString(Manage(), { universeId = UniverseId })
	end
}