local parent = script:FindFirstAncestor("GameDetail").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local gameMediaImageType = require(parent.DiscoveryTypes).GameMediaImageType
local dataHydrationModule = require(parent.DataHydration)
local dataStatus = dataHydrationModule.DataStatus
local getGameMediaStore = dataHydrationModule.Game.getGameMediaStore
local url = require(parent.Http).Url
local experienceBannerImageAllowCustomDimensions = game:DefineFastFlag("ExperienceBannerImageAllowCustomDimensions", false)
local experienceBannerImageDefaultFallback = game:DefineFastFlag("ExperienceBannerImageDefaultFallback", false)
local _ = {
	Loading = "Loading",
	Success = "Success",
	NotFound = "NotFound",
	Fallback = "Fallback",
	Failed = "Failed"
}

return function(p1, p2, p3, p4)
	-- upvalues: getGameMediaStore (ref), signalsReactModule (ref), experienceBannerImageAllowCustomDimensions (ref), reactModule (ref), dataStatus (ref), experienceBannerImageDefaultFallback (ref), gameMediaImageType (ref), url (ref)
	local andFetchGameMedia = getGameMediaStore(false).getAndFetchGameMedia(p1)
	local var1 = signalsReactModule.useSignalState(andFetchGameMedia.data)
	local var2 = signalsReactModule.useSignalState(andFetchGameMedia.status)
	local var3 = if experienceBannerImageAllowCustomDimensions then p3 or 768 else 768
	local var4 = if experienceBannerImageAllowCustomDimensions then p4 or 432 else 432
	
	return reactModule.useMemo(function()
		-- upvalues: var2 (ref), dataStatus (copy), experienceBannerImageDefaultFallback (copy), var1 (ref), gameMediaImageType (copy), var3 (ref), var4 (ref), p2 (ref), url (copy)
		if var2 == dataStatus.NotReady then
			return { status = "Loading", url = nil }
		elseif experienceBannerImageDefaultFallback then
			if var2 == dataStatus.Failed then
				return { status = "Failed", url = nil }
			elseif var1 then
				for i, v in var1 do
					if v.assetTypeId == gameMediaImageType.Image and v.imageId then
						return {
							status = "Success",
							url = string.format("rbxthumb://type=Asset&id=%s&w=%d&h=%d", tostring(v.imageId), var3, var4)
						}
					end
				end
			end
			return if p2 == nil or p2 == "" then { status = "NotFound", url = nil } else {
				status = "Fallback",
				url = url:getPlaceDefaultThumbnailUrl(p2, var3, var4)
			}
		elseif var2 == dataStatus.Failed or not var1 then
			return { status = "NotFound", url = nil }
		end
		for i, v in var1 do
			if v.assetTypeId == gameMediaImageType.Image and v.imageId then
				return {
					status = "Success",
					url = string.format("rbxthumb://type=Asset&id=%s&w=%d&h=%d", tostring(v.imageId), var3, var4)
				}
			end
		end
		return { status = "NotFound", url = nil }
	end, {
		var2,
		var1,
		var3,
		var4,
		p2
	})
end