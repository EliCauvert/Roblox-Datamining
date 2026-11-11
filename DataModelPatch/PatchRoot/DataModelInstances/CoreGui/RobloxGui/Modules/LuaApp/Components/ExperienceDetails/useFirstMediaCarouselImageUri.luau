local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GameMediaImageType = require(CorePackages.Workspace.Packages.DiscoveryTypes).GameMediaImageType
local MediaCarouselImageStatus = {
	Loading = "Loading",
	Found = "Found",
	NotFound = "NotFound"
}
local config = { url = nil, status = MediaCarouselImageStatus.Loading }
local config1 = { url = nil, status = MediaCarouselImageStatus.NotFound }

return {
	useFirstMediaCarouselImageUri = function(p1)
		-- upvalues: UseSelectorFunction (copy), ReactModule (copy), config (copy), GameMediaImageType (copy), MediaCarouselImageStatus (copy), config1 (copy)
		local UseSelectorResult = UseSelectorFunction(function(p2)
			-- upvalues: p1 (copy)
			return if p1 then p2.GameMedia[p1] else nil
		end)
		
		return ReactModule.useMemo(function()
			-- upvalues: UseSelectorResult (copy), config (upval), GameMediaImageType (upval), MediaCarouselImageStatus (upval), config1 (upval)
			if not UseSelectorResult then
				return config
			end
			for _, value in UseSelectorResult do
				if value.assetTypeId == GameMediaImageType.Image and value.imageId then
					return {
						status = MediaCarouselImageStatus.Found,
						url = string.format("rbxthumb://type=Asset&id=%s&w=768&h=432", (tostring(value.imageId)))
					}
				end
			end
			return config1
		end, { UseSelectorResult })
	end,
	MediaCarouselImageStatus = MediaCarouselImageStatus
}