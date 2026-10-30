local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local InfoTable = require(Parent.AppBlox).InfoTable
local View = require(Parent.Foundation).View
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper

return ReactModule.memo(function(p1)
	-- upvalues: GetSduiComponentWrapperFunction (copy), ReactModule (copy), View (copy), InfoTable (copy)
	local LayoutOrder = p1.layoutOrder
	local Items = {}
	local NumColumns = if p1.numColumns and p1.numColumns > 0 then p1.numColumns else 1
	local CountItems = #p1.items
	local Ceiled = math.ceil(CountItems / NumColumns)
	
	for i, item in p1.items do
		Items[i] = ReactModule.createElement(GetSduiComponentWrapperFunction(item), {
			componentConfig = item,
			sduiContext = p1.sduiContext,
			parentAnalyticsContext = p1.analyticsContext,
			extraLocalProps = {
				numColumns = p1.numColumns,
				isLastInSingleColumn = if NumColumns == 1 then i == CountItems else nil,
				selectionOrder = ((i - 1) % Ceiled + 1 - 1) * NumColumns + (math.floor((i - 1) / Ceiled) + 1)
			}
		})
	end
	return ReactModule.createElement(View, {
		tag = if p1.tag then { [p1.tag] = true, ["col size-full-0 auto-y"] = true } else { ["col size-full-0 auto-y"] = true },
		LayoutOrder = LayoutOrder
	}, {
		Header = if p1.headerComponent then ReactModule.cloneElement(p1.headerComponent, { layoutOrder = 1 }) else nil,
		Content = ReactModule.createElement(InfoTable, {
			LayoutOrder = 2,
			numColumns = p1.numColumns,
			gridTag = p1.gridTag,
			items = Items
		})
	})
end)