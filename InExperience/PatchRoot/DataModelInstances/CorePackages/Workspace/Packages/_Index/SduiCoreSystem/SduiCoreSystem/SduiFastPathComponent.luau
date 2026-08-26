local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local sduiBuilderModule = require(sduiCoreSystem.SduiBuilder)
local sduiBuilderTypesModule = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local sduiErrorType = require(sduiCoreSystem.SduiErrors).SduiErrorType
local sduiBuilderProcessingPhase = sduiBuilderTypesModule.SduiBuilderProcessingPhase
local compareSduiPropsModule = require(sduiCoreSystem.compareSduiProps)
local compareSduiAnalyticsContextModule = require(sduiCoreSystem.compareSduiAnalyticsContext)
local parsePropsModule = require(sduiCoreSystem.parseProps)

local function SduiErrorComponent(_)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 100)
	})
end

local t = {}

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), sduiBuilderModule (ref), compareSduiAnalyticsContextModule (ref), t (ref), parsePropsModule (ref), sduiBuilderProcessingPhase (ref), cryoModule (ref), sduiErrorType (ref), SduiErrorComponent (ref)
	local componentConfig = p1.componentConfig
	local componentType = componentConfig.componentType
	local sduiContext = p1.sduiContext
	local debugName = p1.debugName
	local parentAnalyticsContext = p1.parentAnalyticsContext
	local localAnalyticsData = p1.localAnalyticsData
	local extraLocalProps = p1.extraLocalProps
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		var1.current = sduiBuilderModule.buildAnalyticsContext(componentConfig, parentAnalyticsContext, localAnalyticsData)
	else
		local var2 = sduiBuilderModule.buildAnalyticsContext(componentConfig, parentAnalyticsContext, localAnalyticsData)
		
		if not compareSduiAnalyticsContextModule(var1.current, var2) then
			var1.current = var2
		end
	end
	local current = var1.current
	local cloned = table.clone(componentConfig.props or t)
	parsePropsModule(componentType, cloned, debugName, sduiContext, current, nil, sduiBuilderProcessingPhase.Render)
	
	if extraLocalProps then
		cloned = cryoModule.Dictionary.join(cloned, extraLocalProps)
	end
	cloned.componentConfig = componentConfig
	cloned.sduiContext = sduiContext
	cloned.debugName = debugName
	cloned.analyticsContext = current
	local var3 = sduiContext.componentDefinitions:getComponent(componentType)
	
	if var3 == nil then
		sduiContext.dependencies.logger.reportError(sduiErrorType.NoComponentRegistered, { componentType = componentType, name = debugName }, sduiContext.appPage)
		
		return reactModule.createElement(SduiErrorComponent)
	end
	return reactModule.createElement(var3, cloned)
end, compareSduiPropsModule)