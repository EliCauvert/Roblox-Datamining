local urlBuilder = require(script:FindFirstAncestor("BuildExperience").Parent.UrlBuilder).UrlBuilder
local var1 = urlBuilder.fromString("create:advertise")
local var2 = urlBuilder.fromString("create:advertise/manage")

local function getDefaultAdsManagerUrl()
	-- upvalues: var1 (ref)
	return var1()
end

return {
	getDefaultAdsManagerUrl = getDefaultAdsManagerUrl,
	getAdsManagerUrl = function(p1)
		-- upvalues: getDefaultAdsManagerUrl (ref), urlBuilder (ref), var2 (ref)
		return if p1 == nil or p1 <= 0 then getDefaultAdsManagerUrl() else urlBuilder.addQueryString(var2(), { universeId = p1 })
	end
}