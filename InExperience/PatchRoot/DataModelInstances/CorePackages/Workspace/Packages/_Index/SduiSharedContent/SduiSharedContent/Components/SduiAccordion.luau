local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local GetSduiComponentWrapperFunction = SduiCoreSystemModule.getSduiComponentWrapper
local SduiBuilder = SduiCoreSystemModule.SduiBuilder
local SduiErrors = SduiCoreSystemModule.SduiErrors
local Accordion = require(Parent.Foundation).Accordion
local Frozen = table.freeze({})

return ReactModule.memo(function(p1)
	-- upvalues: Frozen (copy), SduiBuilder (copy), SduiErrors (copy), GetSduiComponentWrapperFunction (copy), ReactModule (copy), Accordion (copy)
	local Elements = {}
	
	for Index, ComponentConfig in p1.items or Frozen do
		local ComponentType = SduiBuilder.getComponentType(ComponentConfig, p1.sduiContext)
		
		if ComponentType then
			Elements[`Item_{Index}_{ComponentType}`] = ReactModule.createElement(GetSduiComponentWrapperFunction(ComponentConfig), {
				componentConfig = ComponentConfig,
				sduiContext = p1.sduiContext,
				extraLocalProps = { index = Index, layoutOrder = Index },
				debugName = if p1.debugName then `{p1.debugName}.Item_{Index}` else `Item_{Index}`,
				localAnalyticsData = {
					itemPosition = Index,
					itemComponentType = ComponentType,
					componentType = ComponentType
				}
			})
		else
			p1.sduiContext.dependencies.logger.reportError(SduiErrors.SduiErrorType.NilComponentType, {
				name = p1.debugName,
				message = `Nil componentType in SduiAccordion at index {Index}`
			}, p1.sduiContext.appPage)
		end
	end
	return ReactModule.createElement(Accordion.Root, {
		size = p1.size,
		isContained = p1.isContained,
		chevronPosition = p1.chevronPosition,
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId
	}, Elements)
end)