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

local function getSortedEntries(p1)
	-- upvalues: dataHydrationModule (ref)
	local getLastReceivedSorts = dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getLastReceivedSorts
	
	if not getLastReceivedSorts then
		return nil
	end
	local var1 = getLastReceivedSorts(false)
	
	if not var1 or not next(var1) then
		return nil
	end
	local t = {}
	
	for i, v in var1 do
		table.insert(t, { id = i, data = v })
	end
	table.sort(t, function(p2, p3)
		return (p2.data.hydrationPriority or 0) < (p3.data.hydrationPriority or 0)
	end)
	
	if p1 then
		local t_1 = {}
		
		for i_1 = 1, math.min(#t, p1) do
			table.insert(t_1, t[i_1])
		end
		t = t_1
	end
	return t
end

local function collectContent(p2)
	-- upvalues: collectDedupedHydrationContentModule (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p2 do
		local content = v.data.content
		
		if content then
			collectDedupedHydrationContentModule(content, t, t_1, v.data.hydrationCount)
		end
	end
	return t
end

local function groupContentByType(p3)
	local t = {}
	
	for i, v in p3 do
		local var2 = tostring(v.type)
		
		if not t[var2] then
			t[var2] = {}
		end
		table.insert(t[var2], v)
	end
	return t
end

return function(p4, p5, p6, p7, p8)
	-- upvalues: getSortedEntries (ref), promiseModule (ref), collectContent (ref), groupContentByType (ref), buildHydrationReduxPayloadModule (ref), logging (ref)
	local var3 = getSortedEntries(p8)
	
	if not var3 then
		return promiseModule.resolve()
	end
	local var4 = collectContent(var3)
	
	if #var4 == 0 then
		return promiseModule.resolve()
	end
	local t = {}
	
	for i, v in groupContentByType(var4) do
		table.insert(t, p7.HydrateWidgetContent(p5, v):andThen(function(p9)
			-- upvalues: buildHydrationReduxPayloadModule (copy), v (ref), p4 (ref), p6 (ref)
			local var5 = if p9 then p9.responseBody else nil
			local var6 = if var5 then var5.hydratedContent else nil
			
			if var6 == nil then
				return
			end
			p4(p6(buildHydrationReduxPayloadModule(var6, v)))
		end):catch(function(p9)
			-- upvalues: logging (copy)
			logging.warn("hydrateCatalogSortEntities: HydrateWidgetContent failed: " .. tostring(p9))
		end))
	end
	return promiseModule.allSettled(t)
end