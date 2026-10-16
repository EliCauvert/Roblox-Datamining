local Parent = script:FindFirstAncestor("GameDetail").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GameMediaImageType = require(Parent.DiscoveryTypes).GameMediaImageType
local DataHydrationModule = require(Parent.DataHydration)
local DataStatus = DataHydrationModule.DataStatus
local GetGameMediaStoreFunction = DataHydrationModule.Game.getGameMediaStore
local Url = require(Parent.Http).Url
local ExperienceBannerImageAllowCustomDimensions = game:DefineFastFlag("ExperienceBannerImageAllowCustomDimensions", false)
local ExperienceBannerImageDefaultFallback = game:DefineFastFlag("ExperienceBannerImageDefaultFallback", false)

return function(p1, p2, p3, p4) --[[ Line: 37 | Named "useExperienceBannerImage" ]]
	-- upvalues: GetGameMediaStoreFunction (copy), SignalsReactModule (copy), ExperienceBannerImageAllowCustomDimensions (copy), ReactModule (copy), DataStatus (copy), ExperienceBannerImageDefaultFallback (copy), GameMediaImageType (copy), Url (copy)
	local AndFetchGameMedia = GetGameMediaStoreFunction(false).getAndFetchGameMedia(p1)
	local UseSignalStateResult = SignalsReactModule.useSignalState(AndFetchGameMedia.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(AndFetchGameMedia.status)
	local P2 = ExperienceBannerImageAllowCustomDimensions and p3 or 768
	local P3 = ExperienceBannerImageAllowCustomDimensions and p4 or 432
	
	return ReactModule.useMemo(function() --[[ Line: 54 ]]
		-- upvalues: UseSignalStateResult1 (copy), DataStatus (upval), ExperienceBannerImageDefaultFallback (upval), UseSignalStateResult (copy), GameMediaImageType (upval), P2 (copy), P3 (copy), p2 (copy), Url (upval)
		if UseSignalStateResult1 == DataStatus.NotReady then
			return { status = "Loading", url = nil }
		end
		if ExperienceBannerImageDefaultFallback then
			if UseSignalStateResult1 == DataStatus.Failed then
				return { status = "Failed", url = nil }
			end
			if UseSignalStateResult then
				for _, value in UseSignalStateResult do
					if value.assetTypeId == GameMediaImageType.Image and value.imageId then
						return {
							status = "Success",
							url = string.format("rbxthumb://type=Asset&id=%s&w=%d&h=%d", tostring(value.imageId), P2, P3)
						}
					end
				end
			end
			return if p2 == nil or p2 == "" then { status = "NotFound", url = nil } else {
				status = "Fallback",
				url = Url:getPlaceDefaultThumbnailUrl(p2, P2, P3)
			}
		else
			if UseSignalStateResult1 == DataStatus.Failed or not UseSignalStateResult then
				return { status = "NotFound", url = nil }
			end
			for _, value1 in UseSignalStateResult do
				if value1.assetTypeId == GameMediaImageType.Image and value1.imageId then
					return {
						status = "Success",
						url = string.format("rbxthumb://type=Asset&id=%s&w=%d&h=%d", tostring(value1.imageId), P2, P3)
					}
				end
			end
			return { status = "NotFound", url = nil }
		end
	end, {
		UseSignalStateResult1,
		UseSignalStateResult,
		P2,
		P3,
		p2
	})
end