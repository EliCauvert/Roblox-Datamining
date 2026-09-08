local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local _ = require(parent.AvatarExperienceRodux)
local dataHydrationModule = require(parent.DataHydration)
local promiseModule = require(parent.Promise)
local logging = require(parent.AppCommonLib).Logging
local _ = require(parent.Http)
local _ = require(avatarExperienceCatalog.Components.ResultsList.WidgetListInfoViewModel)
local collectDedupedHydrationContentModule = require(avatarExperienceCatalog.Sdui.Utils.collectDedupedHydrationContent)
local buildHydrationReduxPayloadModule = require(avatarExperienceCatalog.Sdui.Utils.buildHydrationReduxPayload)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: dataHydrationModule (ref), promiseModule (ref), collectDedupedHydrationContentModule (ref), buildHydrationReduxPayloadModule (ref), logging (ref)
	local marketplaceCatalogSort = dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(p5)
	local var1 = if marketplaceCatalogSort and marketplaceCatalogSort.data then marketplaceCatalogSort.data(false) else nil
	
	if not var1 or not var1.content then
		return promiseModule.resolve()
	end
	local t_1
	local t = {}
	collectDedupedHydrationContentModule(var1.content, t, {}, nil)
	local _ = nil
	
	if p6 then
		t_1 = {}
		
		for i, v in t do
			local type = p6[tostring(v.type)]
			
			if not type or not type[tostring(v.id)] then
				table.insert(t_1, v)
			end
		end
	else
		t_1 = t
	end
	return if #t_1 == 0 then promiseModule.resolve() else p4.HydrateWidgetContent(p2, t_1):andThen(function(p7)
		-- upvalues: buildHydrationReduxPayloadModule (copy), t_1 (write), p1 (ref), p3 (ref)
		local var2 = if p7 then p7.responseBody else nil
		local var3 = if var2 then var2.hydratedContent else nil
		
		if var3 == nil then
			return
		end
		p1(p3(buildHydrationReduxPayloadModule(var3, t_1)))
	end):catch(function(p7)
		-- upvalues: logging (copy), p5 (ref)
		logging.warn("hydrateCatalogSortById: HydrateWidgetContent failed for sort " .. p4 .. ": " .. tostring(p7))
	end)
end