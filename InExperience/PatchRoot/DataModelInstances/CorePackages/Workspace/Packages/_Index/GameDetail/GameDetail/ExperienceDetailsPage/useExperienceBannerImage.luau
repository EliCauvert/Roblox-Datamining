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

return function(p0, p1, p2, p3) --[[ line: 37 | named "useExperienceBannerImage" ]]
	-- upvalues: getGameMediaStore (ref), signalsReactModule (ref), experienceBannerImageAllowCustomDimensions (ref), reactModule (ref), dataStatus (ref), experienceBannerImageDefaultFallback (ref), gameMediaImageType (ref), url (ref)
	local andFetchGameMedia = getGameMediaStore(false).getAndFetchGameMedia(p0)
	local var6 = signalsReactModule.useSignalState(andFetchGameMedia.data)
	local var7 = signalsReactModule.useSignalState(andFetchGameMedia.status)
	local var8 = if experienceBannerImageAllowCustomDimensions then p2 or 768 else 768
	local var9 = if experienceBannerImageAllowCustomDimensions then p3 or 432 else 432
	
	return reactModule.useMemo(function() --[[ line: 54 ]]
		-- upvalues: var7 (ref), dataStatus (copy), experienceBannerImageDefaultFallback (copy), var6 (ref), gameMediaImageType (copy), var8 (ref), var9 (ref), p1 (ref), url (copy)
		if var7 == dataStatus.NotReady then
			return { status = "Loading", url = nil }
		elseif experienceBannerImageDefaultFallback then
			if var7 == dataStatus.Failed then
				return { status = "Failed", url = nil }
			elseif var6 then
				for i, v in var6 do
					if v.assetTypeId == gameMediaImageType.Image and v.imageId then
						return {
							status = "Success",
							url = string.format("rbxthumb://type=Asset&id=%s&w=%d&h=%d", tostring(v.imageId), var8, var9)
						}
					end
				end
			end
			return if p1 == nil or p1 == "" then { status = "NotFound", url = nil } else {
				status = "Fallback",
				url = url:getPlaceDefaultThumbnailUrl(p1, var8, var9)
			}
		elseif var7 == dataStatus.Failed or not var6 then
			return { status = "NotFound", url = nil }
		end
		for i, v in var6 do
			if v.assetTypeId == gameMediaImageType.Image and v.imageId then
				return {
					status = "Success",
					url = string.format("rbxthumb://type=Asset&id=%s&w=%d&h=%d", tostring(v.imageId), var8, var9)
				}
			end
		end
		return { status = "NotFound", url = nil }
	end, {
		var7,
		var6,
		var8,
		var9,
		p1
	})
end