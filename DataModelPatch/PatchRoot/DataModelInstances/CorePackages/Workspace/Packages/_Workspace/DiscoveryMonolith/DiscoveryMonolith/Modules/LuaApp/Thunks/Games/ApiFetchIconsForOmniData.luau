local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local PromiseUtilities = require(Parent.AppCommonLib).Utils.PromiseUtilities
local OmniRecommendationsContentType = require(Parent.DiscoveryTypes).OmniRecommendationsContentType
local Constants = require(Parent.UserLib).Utils.Constants
local ApiPreloadContentProviderThumbnailModule = require(DiscoveryMonolith.Modules.LuaApp.Thunks.ApiPreloadContentProviderThumbnail)

local function _(CatalogAsset)
	-- upvalues: OmniRecommendationsContentType (copy), Constants (copy)
	return if CatalogAsset == OmniRecommendationsContentType.CatalogAsset then Constants.RbxthumbTypes.Asset elseif CatalogAsset == OmniRecommendationsContentType.CatalogBundle then Constants.RbxthumbTypes.BundleThumbnail else nil
end

return function(_, p1)
	-- upvalues: OmniRecommendationsContentType (copy), Constants (copy), ApiPreloadContentProviderThumbnailModule (copy), PromiseUtilities (copy)
	return function(p2)
		-- upvalues: p1 (copy), OmniRecommendationsContentType (upval), Constants (upval), ApiPreloadContentProviderThumbnailModule (upval), PromiseUtilities (upval)
		local DispatchResults = {}
		
		for i, value in pairs(p1) do
			local List = {}
			
			for i1, _ in pairs(value) do
				table.insert(List, i1)
			end
			local Asset = if i == OmniRecommendationsContentType.CatalogAsset then Constants.RbxthumbTypes.Asset elseif i == OmniRecommendationsContentType.CatalogBundle then Constants.RbxthumbTypes.BundleThumbnail else nil
			
			if Asset then
				table.insert(DispatchResults, p2:dispatch(ApiPreloadContentProviderThumbnailModule(List, Asset, 150)))
			end
		end
		return PromiseUtilities.Batch(DispatchResults)
	end
end