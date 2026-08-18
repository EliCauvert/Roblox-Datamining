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

local function getSortedEntries(p0) --[[ line: 36 ]]
	-- upvalues: dataHydrationModule (ref)
	local getLastReceivedSorts = dataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getLastReceivedSorts
	
	if not getLastReceivedSorts then
		return nil
	end
	local var8 = getLastReceivedSorts(false)
	
	if not var8 or not next(var8) then
		return nil
	end
	local t = {}
	
	for i, v in var8 do
		table.insert(t, { id = i, data = v })
	end
	table.sort(t, function(p1, p2) --[[ line: 54 ]]
		return (p1.data.hydrationPriority or 0) < (p2.data.hydrationPriority or 0)
	end)
	
	if p0 then
		local t_1 = {}
		
		for i_1 = 1, math.min(#t, p0) do
			table.insert(t_1, t[i_1])
		end
		t = t_1
	end
	return t
end

local function collectContent(p3) --[[ line: 76 ]]
	-- upvalues: collectDedupedHydrationContentModule (ref)
	local t = {}
	local t_1 = {}
	
	for i, v in p3 do
		local content = v.data.content
		
		if content then
			collectDedupedHydrationContentModule(content, t, t_1, v.data.hydrationCount)
		end
	end
	return t
end

local function groupContentByType(p4) --[[ line: 95 ]]
	local t = {}
	
	for i, v in p4 do
		local var14 = tostring(v.type)
		
		if not t[var14] then
			t[var14] = {}
		end
		table.insert(t[var14], v)
	end
	return t
end

return function(p5, p6, p7, p8, p9) --[[ line: 107 | named "hydrateCatalogSortEntities" ]]
	-- upvalues: getSortedEntries (ref), promiseModule (ref), collectContent (ref), groupContentByType (ref), buildHydrationReduxPayloadModule (ref), logging (ref)
	local var15 = getSortedEntries(p9)
	
	if not var15 then
		return promiseModule.resolve()
	end
	local var16 = collectContent(var15)
	
	if #var16 == 0 then
		return promiseModule.resolve()
	end
	local t = {}
	
	for i, v in groupContentByType(var16) do
		table.insert(t, p8.HydrateWidgetContent(p6, v):andThen(function(p11) --[[ line: 134 ]]
			-- upvalues: buildHydrationReduxPayloadModule (copy), v (ref), p5 (ref), p7 (ref)
			local var18 = if p11 then p11.responseBody else nil
			local var19 = if var18 then var18.hydratedContent else nil
			
			if var19 == nil then
				return
			end
			p5(p7(buildHydrationReduxPayloadModule(var19, v)))
		end):catch(function(p10) --[[ line: 144 ]]
			-- upvalues: logging (copy)
			logging.warn("hydrateCatalogSortEntities: HydrateWidgetContent failed: " .. tostring(p10))
		end))
	end
	return promiseModule.allSettled(t)
end