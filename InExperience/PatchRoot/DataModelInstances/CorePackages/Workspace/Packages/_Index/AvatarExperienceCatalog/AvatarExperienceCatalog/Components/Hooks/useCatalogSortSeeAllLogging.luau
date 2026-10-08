local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local _ = require(parent.AvatarExperienceCommon)
local impressionEnums = require(parent.AvatarExperienceAnalytics).Enums.ImpressionEnums
local useCatalogPageMonolithDependenciesModule = require(avatarExperienceCatalog.Providers.useCatalogPageMonolithDependencies)

return function(p1, p2)
	-- upvalues: useCatalogPageMonolithDependenciesModule (ref), reactModule (ref), impressionEnums (ref)
	local catalogAnalytics = useCatalogPageMonolithDependenciesModule().catalogAnalytics
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useCallback(function()
		-- upvalues: catalogAnalytics (ref), p2 (ref), impressionEnums (copy), p1 (ref)
		catalogAnalytics.widgetInteractionV2(p2, impressionEnums.ActionType.SEE_ALL)
		
		if p1 then
			p1()
		end
	end, { p1, catalogAnalytics, p2 })
	
	if p1 then
		return var1, var2
	end
	return var1, nil
end