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

return function(p0, p1, p2, p3, p4, p5) --[[ line: 31 | named "hydrateCatalogSortById" ]]
	-- upvalues: dataHydrationModule (ref), promiseModule (ref), collectDedupedHydrationContentModule (ref), buildHydrationReduxPayloadModule (ref), logging (ref)
	local marketplaceCatalogSort = dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getMarketplaceCatalogSort(p4)
	local var6 = if marketplaceCatalogSort and marketplaceCatalogSort.data then marketplaceCatalogSort.data(false) else nil
	
	if not var6 or not var6.content then
		return promiseModule.resolve()
	end
	local t_1
	local t = {}
	collectDedupedHydrationContentModule(var6.content, t, {}, nil)
	local _ = nil
	
	if p5 then
		t_1 = {}
		
		for i, v in t do
			local type = p5[tostring(v.type)]
			
			if not type or not type[tostring(v.id)] then
				table.insert(t_1, v)
			end
		end
	else
		t_1 = t
	end
	return if #t_1 == 0 then promiseModule.resolve() else p3.HydrateWidgetContent(p1, t_1):andThen(function(p7) --[[ line: 76 ]]
		-- upvalues: buildHydrationReduxPayloadModule (copy), t_1 (write), p0 (ref), p2 (ref)
		local var9 = if p7 then p7.responseBody else nil
		local var10 = if var9 then var9.hydratedContent else nil
		
		if var10 == nil then
			return
		end
		p0(p2(buildHydrationReduxPayloadModule(var10, t_1)))
	end):catch(function(p6) --[[ line: 86 ]]
		-- upvalues: logging (copy), p4 (ref)
		logging.warn("hydrateCatalogSortById: HydrateWidgetContent failed for sort " .. p4 .. ": " .. tostring(p6))
	end)
end