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

local function getSortedEntries(p1: number)
	-- upvalues: DataHydrationModule (copy)
	local GetLastReceivedSortsFunction = DataHydrationModule.MarketplaceCatalogSort.getMarketplaceCatalogSortStore(false).getLastReceivedSorts
	
	if not GetLastReceivedSortsFunction then
		return nil
	end
	local LastReceivedSorts = GetLastReceivedSortsFunction(false)
	
	if not LastReceivedSorts or not next(LastReceivedSorts) then
		return nil
	end
	local List = {}
	
	for Id, lastReceivedSort in LastReceivedSorts do
		table.insert(List, { id = Id, data = lastReceivedSort })
	end
	table.sort(List, function(A, B): boolean
		return (A.data.hydrationPriority or 0) < (B.data.hydrationPriority or 0)
	end)
	
	if p1 then
		local List1 = {}
		
		for i = 1, math.min(#List, p1) do
			table.insert(List1, List[i])
		end
		List = List1
	end
	return List
end

local function collectContent(List)
	-- upvalues: CollectDedupedHydrationContentModule (copy)
	local t = {}
	local t1 = {}
	
	for _, value in List do
		local Content = value.data.content
		
		if Content then
			CollectDedupedHydrationContentModule(Content, t, t1, value.data.hydrationCount)
		end
	end
	return t
end

local function groupContentByType(List)
	local t = {}
	
	for _, value in List do
		local Text = tostring(value.type)
		
		if not t[Text] then
			t[Text] = {}
		end
		table.insert(t[Text], value)
	end
	return t
end

return function(Callback1, p2, Callback, p3, p4)
	-- upvalues: getSortedEntries (copy), PromiseModule (copy), collectContent (copy), groupContentByType (copy), BuildHydrationReduxPayloadModule (copy), Logging (copy)
	local SortedEntries = getSortedEntries(p4)
	
	if not SortedEntries then
		return PromiseModule.resolve()
	end
	local CollectContentResult = collectContent(SortedEntries)
	
	if #CollectContentResult == 0 then
		return PromiseModule.resolve()
	end
	local List = {}
	
	for _, value in groupContentByType(CollectContentResult) do
		table.insert(List, (p3.HydrateWidgetContent(p2, value):andThen(function(Result)
			-- upvalues: BuildHydrationReduxPayloadModule (upval), value (copy), Callback1 (copy), Callback (copy)
			local ResponseBody = if Result then Result.responseBody else nil
			local HydratedContent = if ResponseBody then ResponseBody.hydratedContent else nil
			
			if HydratedContent ~= nil then
				Callback1(Callback((BuildHydrationReduxPayloadModule(HydratedContent, value))))
				
				return
			end
		end):catch(function(Err)
			-- upvalues: Logging (upval)
			Logging.warn("hydrateCatalogSortEntities: HydrateWidgetContent failed: " .. tostring(Err))
		end)))
	end
	return PromiseModule.allSettled(List)
end