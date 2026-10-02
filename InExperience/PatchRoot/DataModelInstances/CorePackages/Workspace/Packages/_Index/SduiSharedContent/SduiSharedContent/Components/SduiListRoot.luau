local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local getSduiComponentWrapper = sduiCoreSystemModule.getSduiComponentWrapper
local sduiBuilder = sduiCoreSystemModule.SduiBuilder
local sduiErrors = sduiCoreSystemModule.SduiErrors
local list = foundationModule.List
local inputSize = foundationModule.Enums.InputSize
local frozen = table.freeze({})

return reactModule.memo(function(p1)
	-- upvalues: frozen (ref), sduiBuilder (ref), sduiErrors (ref), getSduiComponentWrapper (ref), reactModule (ref), list (ref), inputSize (ref)
	local t = {}
	
	for i, v in p1.items or frozen do
		local componentType = sduiBuilder.getComponentType(v, p1.sduiContext)
		
		if componentType then
			t[`Item_{i}_{componentType}`] = reactModule.createElement(getSduiComponentWrapper(v), {
				LayoutOrder = i,
				componentConfig = v,
				sduiContext = p1.sduiContext,
				extraLocalProps = { index = i, layoutOrder = i },
				debugName = if p1.debugName then `{p1.debugName}.Item_{i}` else `Item_{i}`,
				localAnalyticsData = {
					itemPosition = i,
					itemComponentType = componentType,
					componentType = componentType
				}
			})
		else
			p1.sduiContext.dependencies.logger.reportError(sduiErrors.SduiErrorType.NilComponentType, {
				name = p1.debugName,
				message = `Nil componentType in SduiListRoot at index {i}`
			}, p1.sduiContext.appPage)
		end
	end
	return reactModule.createElement(list.Root, {
		size = p1.size or inputSize.Medium,
		hasDivider = if p1.hasDivider == false then false else { hasDivider = true, isInset = p1.isInset ~= false },
		isContained = if p1.isContained then true else { isContained = false, hasMargin = p1.hasMargin ~= false },
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, t)
end)