local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local DashModule = require(CorePackages.Packages.Dash)
local _ = require(Modules.AvatarExperience.Common.Types)
local SponsoredItemsCategoryRecommended = require(Modules.AvatarExperience.Catalog.CatalogConstants).SponsoredItemsCategoryRecommended
local MemoizeResult = require(CorePackages.Workspace.Packages.AppCommonLib).memoize(function(p1, p2)
	-- upvalues: DashModule (copy)
	return DashModule.map(p1, function(p3)
		-- upvalues: p2 (copy), DashModule (upval)
		local v1 = p2[p3.id]
		
		return if v1 and v1.product then DashModule.join(p3, { productId = v1.product.id }) else p3
	end)
end)

return function(p1)
	-- upvalues: SponsoredItemsCategoryRecommended (copy), MemoizeResult (copy)
	local SponsoredItem = p1.AvatarExperience.Catalog.SponsoredItems[SponsoredItemsCategoryRecommended]
	local AssetInfos = p1.AvatarExperience.Common.AssetInfos
	
	return if SponsoredItem then MemoizeResult(SponsoredItem, AssetInfos) else nil
end