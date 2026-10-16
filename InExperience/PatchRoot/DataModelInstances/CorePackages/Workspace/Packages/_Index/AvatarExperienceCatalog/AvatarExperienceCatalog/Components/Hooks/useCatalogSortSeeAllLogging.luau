local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AvatarExperienceCommon)
local ImpressionEnums = require(Parent.AvatarExperienceAnalytics).Enums.ImpressionEnums
local UseCatalogPageMonolithDependenciesModule = require(AvatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)

return function(Callback, p1) --[[ Line: 26 | Named "useCatalogSortSeeAllLogging" ]]
	-- upvalues: UseCatalogPageMonolithDependenciesModule (copy), ReactModule (copy), ImpressionEnums (copy)
	local CatalogAnalytics = UseCatalogPageMonolithDependenciesModule().catalogAnalytics
	local UseResult = ReactModule.useCallback(function() --[[ Line: 35 ]]
		-- upvalues: CatalogAnalytics (copy), p1 (copy), ImpressionEnums (upval), Callback (copy)
		CatalogAnalytics.widgetInteractionV2(p1, ImpressionEnums.ActionType.SEE_ALL)
		
		if Callback then
			Callback()
		end
	end, { Callback, CatalogAnalytics, p1 })
	local UseRefResult = ReactModule.useRef(nil)
	
	if Callback then
		return UseRefResult, UseResult
	else
		return UseRefResult, nil
	end
end