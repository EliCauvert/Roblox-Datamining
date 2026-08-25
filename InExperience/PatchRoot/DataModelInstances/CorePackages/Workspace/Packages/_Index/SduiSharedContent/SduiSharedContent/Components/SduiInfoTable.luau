local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local infoTable = require(parent.AppBlox).InfoTable
local view = require(parent.Foundation).View
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return reactModule.memo(function(p0)
	-- upvalues: fFlagSduiExperienceDetailsSupport (ref), getSduiComponentWrapper (ref), reactModule (ref), view (ref), infoTable (ref)
	local layoutOrder = p0.layoutOrder
	local t = {}
	local var3 = if p0.numColumns and p0.numColumns > 0 then p0.numColumns else 1
	local itemsCount = #p0.items
	local var5 = if fFlagSduiExperienceDetailsSupport then math.ceil(itemsCount / var3) else nil
	
	for i, v in p0.items do
		local var11
		local var6 = getSduiComponentWrapper(v)
		local var7 = if fFlagSduiExperienceDetailsSupport then ((i - 1) % var5 + 1 - 1) * var3 + (math.floor((i - 1) / var5) + 1) else nil
		local createElement = reactModule.createElement
		local var8 = var6
		local t_1 = {
			componentConfig = v,
			sduiContext = p0.sduiContext,
			parentAnalyticsContext = p0.analyticsContext
		}
		local t_2 = { numColumns = p0.numColumns }
		
		if var3 == 1 then
			var11 = i == itemsCount
			var11 = nil
		else
			var11 = nil
		end
		t_2.isLastInSingleColumn = var11
		t_2.selectionOrder = var7
		t_1.extraLocalProps = t_2
		t[i] = createElement(var8, t_1)
	end
	return if fFlagSduiExperienceDetailsSupport then reactModule.createElement(view, {
		tag = if p0.tag then { [p0.tag] = true, ["col size-full-0 auto-y"] = true } else { ["col size-full-0 auto-y"] = true },
		LayoutOrder = layoutOrder
	}, {
		Header = if p0.headerComponent then reactModule.cloneElement(p0.headerComponent, { layoutOrder = 1 }) else nil,
		Content = reactModule.createElement(infoTable, {
			LayoutOrder = 2,
			numColumns = p0.numColumns,
			gridTag = p0.gridTag,
			items = t
		})
	}) else reactModule.createElement(infoTable, {
		LayoutOrder = layoutOrder,
		numColumns = p0.numColumns,
		gridTag = p0.gridTag,
		items = t
	})
end)