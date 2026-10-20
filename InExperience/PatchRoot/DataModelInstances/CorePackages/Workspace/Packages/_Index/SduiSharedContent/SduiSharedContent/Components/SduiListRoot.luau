local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local List = FoundationModule.List
local InputSize = FoundationModule.Enums.InputSize
local Frozen = table.freeze({})

return ReactModule.memo(function(p1)
	-- upvalues: Frozen (copy), SduiBuilder (copy), SduiErrors (copy), GetSduiComponentWrapperFunction (copy), ReactModule (copy), List (copy), InputSize (copy)
	local Elements = {}
	
	for LayoutOrder, ComponentConfig in p1.items or Frozen do
		local ComponentType = SduiBuilder.getComponentType(ComponentConfig, p1.sduiContext)
		
		if ComponentType then
			Elements[`Item_{LayoutOrder}_{ComponentType}`] = ReactModule.createElement(GetSduiComponentWrapperFunction(ComponentConfig), {
				LayoutOrder = LayoutOrder,
				componentConfig = ComponentConfig,
				sduiContext = p1.sduiContext,
				extraLocalProps = { index = LayoutOrder, layoutOrder = LayoutOrder },
				debugName = if p1.debugName then `{p1.debugName}.Item_{LayoutOrder}` else `Item_{LayoutOrder}`,
				localAnalyticsData = {
					itemPosition = LayoutOrder,
					itemComponentType = ComponentType,
					componentType = ComponentType
				}
			})
		else
			p1.sduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
				name = p1.debugName,
				message = `Nil componentType in SduiListRoot at index {LayoutOrder}`
			}, p1.sduiContext.appPage)
		end
	end
	return ReactModule.createElement(List.Root, {
		size = p1.size or InputSize.Medium,
		hasDivider = p1.hasDivider ~= false and { hasDivider = true, isInset = p1.isInset ~= false },
		isContained = if p1.isContained then true else { isContained = false, hasMargin = p1.hasMargin ~= false },
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, Elements)
end)