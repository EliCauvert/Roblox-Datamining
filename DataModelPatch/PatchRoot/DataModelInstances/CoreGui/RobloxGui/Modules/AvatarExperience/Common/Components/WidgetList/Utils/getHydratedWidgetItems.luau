local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local CryoModule = require(CorePackages.Packages.Cryo)

local function sortWidgetIndexes(WidgetInfoDetails)
	-- upvalues: CryoModule (copy)
	local MapResult = CryoModule.List.map(CryoModule.List.filter(CryoModule.Dictionary.keys(WidgetInfoDetails), function(p1): boolean
		return tonumber(p1) ~= nil
	end), function(p1): number
		return (tonumber(p1))
	end)
	table.sort(MapResult)
	
	return MapResult
end

local function flattenHydratedContent(HydratedWidgetData)
	local t = {}
	
	for _, value in HydratedWidgetData do
		for i, value1 in value do
			t[tostring(i)] = value1
		end
	end
	return t
end

local function getItemsForWidget(p1, p2)
	-- upvalues: CryoModule (copy)
	return if p1 then CryoModule.List.filter(CryoModule.List.map(p1.content, function(p3)
		-- upvalues: p2 (copy)
		return p2[tostring(p3.id)]
	end), function(p3): boolean
		return p3 ~= nil
	end) else nil
end

local function buildHydratedItemsForAllWidgets(WidgetInfoDetails, List, p1)
	-- upvalues: getItemsForWidget (copy)
	local List1 = {}
	
	for _, value in List do
		local WidgetInfoDetail = WidgetInfoDetails[tostring(value)]
		local ItemsForWidget = getItemsForWidget(WidgetInfoDetail, p1)
		
		if ItemsForWidget and #ItemsForWidget > 0 then
			table.insert(List1, {
				id = tostring(WidgetInfoDetail.id),
				items = ItemsForWidget
			})
		end
	end
	return List1
end

local function _(p2, p3)
	local v1 = p2[p3]
	
	return if v1 then { [v1.id] = v1.items } else nil
end

return function(p2)
	-- upvalues: flattenHydratedContent (copy), sortWidgetIndexes (copy), buildHydratedItemsForAllWidgets (copy)
	local HydratedWidgetData = p2.hydratedWidgetData
	local WidgetInfoDetails = p2.widgetInfoDetails
	local SelectedWidgetIndex = p2.selectedWidgetIndex
	
	if not WidgetInfoDetails or not HydratedWidgetData or not next(HydratedWidgetData) then
		return nil
	end
	local FlattenHydratedContentResult = flattenHydratedContent(HydratedWidgetData)
	local SortWidgetIndexesResult = sortWidgetIndexes(WidgetInfoDetails)
	
	if not SortWidgetIndexesResult or #SortWidgetIndexesResult == 0 then
		return nil
	end
	if SelectedWidgetIndex and #SortWidgetIndexesResult < SelectedWidgetIndex then
		return nil
	end
	local HydratedItemsForAllWidgets = buildHydratedItemsForAllWidgets(WidgetInfoDetails, SortWidgetIndexesResult, FlattenHydratedContentResult)
	
	if SelectedWidgetIndex then
		local HydratedItemsForAllWidget = HydratedItemsForAllWidgets[SelectedWidgetIndex]
		
		return if HydratedItemsForAllWidget then {
			[HydratedItemsForAllWidget.id] = HydratedItemsForAllWidget.items
		} else nil
	end
	local t = {}
	
	for _, hydratedItemsForAllWidget in HydratedItemsForAllWidgets do
		t[hydratedItemsForAllWidget.id] = hydratedItemsForAllWidget.items
	end
	return t
end