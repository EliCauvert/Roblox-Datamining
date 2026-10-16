local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local _ = require(Parent.AvatarExperienceRodux)
local DataHydrationModule = require(Parent.DataHydration)
local PromiseModule = require(Parent.Promise)
local Logging = require(Parent.AppCommonLib).Logging
local _ = require(Parent.Http)
local _ = require(AvatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local CollectDedupedHydrationContentModule = require(AvatarExperienceCatalog.Sdui.Utils.collectDedupedHydrationContent)
local BuildHydrationReduxPayloadModule = require(AvatarExperienceCatalog.Sdui.Utils.buildHydrationReduxPayload)

return function(Callback, p1, Callback1, p2, p3, p4) --[[ Line: 31 | Named "hydrateCatalogSortById" ]]
	-- upvalues: DataHydrationModule (copy), PromiseModule (copy), CollectDedupedHydrationContentModule (copy), BuildHydrationReduxPayloadModule (copy), Logging (copy)
	local MarketplaceCatalogSort = DataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(p3)
	local DataResult = if MarketplaceCatalogSort and MarketplaceCatalogSort.data then MarketplaceCatalogSort.data(false) else nil
	
	if not DataResult or not DataResult.content then
		return PromiseModule.resolve()
	end
	local t = {}
	CollectDedupedHydrationContentModule(DataResult.content, t, {}, nil)
	local List = nil
	
	if p4 then
		List = {}
		
		for _, value in t do
			local v1 = p4[tostring(value.type)]
			
			if not v1 or not v1[tostring(value.id)] then
				table.insert(List, value)
			end
		end
	else
		List = t
	end
	return if #List == 0 then PromiseModule.resolve() else p2.HydrateWidgetContent(p1, List):andThen(function(Result) --[[ Line: 76 ]]
		-- upvalues: BuildHydrationReduxPayloadModule (upval), List (ref), Callback (copy), Callback1 (copy)
		local ResponseBody = if Result then Result.responseBody else nil
		local HydratedContent = if ResponseBody then ResponseBody.hydratedContent else nil
		
		if HydratedContent ~= nil then
			Callback(Callback1((BuildHydrationReduxPayloadModule(HydratedContent, List))))
			
			return
		end
	end):catch(function(Err) --[[ Line: 86 ]]
		-- upvalues: Logging (upval), p3 (copy)
		Logging.warn("hydrateCatalogSortById: HydrateWidgetContent failed for sort " .. p3 .. ": " .. tostring(Err))
	end)
end