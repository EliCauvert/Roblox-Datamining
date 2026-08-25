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

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), sduiBuilderModule (ref), compareSduiAnalyticsContextModule (ref), t (ref), parsePropsModule (ref), sduiBuilderProcessingPhase (ref), cryoModule (ref), sduiErrorType (ref), SduiErrorComponent (ref)
	local componentConfig = p0.componentConfig
	local componentType = componentConfig.componentType
	local sduiContext = p0.sduiContext
	local debugName = p0.debugName
	local parentAnalyticsContext = p0.parentAnalyticsContext
	local localAnalyticsData = p0.localAnalyticsData
	local extraLocalProps = p0.extraLocalProps
	local var10 = reactModule.useRef(nil)
	
	if var10.current == nil then
		var10.current = sduiBuilderModule.buildAnalyticsContext(componentConfig, parentAnalyticsContext, localAnalyticsData)
	else
		local var11 = sduiBuilderModule.buildAnalyticsContext(componentConfig, parentAnalyticsContext, localAnalyticsData)
		
		if not compareSduiAnalyticsContextModule(var10.current, var11) then
			var10.current = var11
		end
	end
	local current = var10.current
	local cloned = table.clone(componentConfig.props or t)
	parsePropsModule(componentType, cloned, debugName, sduiContext, current, nil, sduiBuilderProcessingPhase.Render)
	
	if extraLocalProps then
		cloned = cryoModule.Dictionary.join(cloned, extraLocalProps)
	end
	cloned.componentConfig = componentConfig
	cloned.sduiContext = sduiContext
	cloned.debugName = debugName
	cloned.analyticsContext = current
	local var13 = sduiContext.componentDefinitions:getComponent(componentType)
	
	if var13 == nil then
		sduiContext.dependencies.logger.reportError(sduiErrorType.NoComponentRegistered, { componentType = componentType, name = debugName }, sduiContext.appPage)
		
		return reactModule.createElement(SduiErrorComponent)
	end
	return reactModule.createElement(var13, cloned)
end, compareSduiPropsModule)