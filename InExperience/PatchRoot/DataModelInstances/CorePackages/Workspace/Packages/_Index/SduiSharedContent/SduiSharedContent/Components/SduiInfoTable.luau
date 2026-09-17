local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local infoTable = require(parent.AppBlox).InfoTable
local view = require(parent.Foundation).View
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper

return reactModule.memo(function(p1)
	-- upvalues: getSduiComponentWrapper (ref), reactModule (ref), view (ref), infoTable (ref)
	local layoutOrder = p1.layoutOrder
	local t = {}
	local var1 = if p1.numColumns and p1.numColumns > 0 then p1.numColumns else 1
	local itemsCount = #p1.items
	local ceiled = math.ceil(itemsCount / var1)
	
	for i, v in p1.items do
		local var2
		local var3 = getSduiComponentWrapper(v)
		local var4 = ((i - 1) % ceiled + 1 - 1) * var1 + (math.floor((i - 1) / ceiled) + 1)
		local createElement = reactModule.createElement
		local var5 = var3
		local t_1 = {
			componentConfig = v,
			sduiContext = p1.sduiContext,
			parentAnalyticsContext = p1.analyticsContext
		}
		local t_2 = { numColumns = p1.numColumns }
		
		if var1 == 1 then
			var2 = i == itemsCount
			var2 = nil
		else
			var2 = nil
		end
		t_2.isLastInSingleColumn = var2
		t_2.selectionOrder = var4
		t_1.extraLocalProps = t_2
		t[i] = createElement(var5, t_1)
	end
	return reactModule.createElement(view, {
		tag = if p1.tag then { [p1.tag] = true, ["col size-full-0 auto-y"] = true } else { ["col size-full-0 auto-y"] = true },
		LayoutOrder = layoutOrder
	}, {
		Header = if p1.headerComponent then reactModule.cloneElement(p1.headerComponent, { layoutOrder = 1 }) else nil,
		Content = reactModule.createElement(infoTable, {
			LayoutOrder = 2,
			numColumns = p1.numColumns,
			gridTag = p1.gridTag,
			items = t
		})
	})
end)