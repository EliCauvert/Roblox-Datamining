local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local SduiBuilderModule = require(SduiCoreSystem.SduiBuilder)
local _ = require(SduiCoreSystem.SduiComponentType)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local SduiErrorType = require(SduiCoreSystem.SduiErrors).SduiErrorType
local SduiBuilderProcessingPhase = require(SduiCoreSystem.SduiBuilderTypes).SduiBuilderProcessingPhase
local CompareSduiAnalyticsContextModule = require(SduiCoreSystem.compareSduiAnalyticsContext)
local ParsePropsModule = require(SduiCoreSystem.parseProps)

local function SduiErrorComponent(_)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 100)
	})
end

local t = {}

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), SduiBuilderModule (copy), CompareSduiAnalyticsContextModule (copy), t (copy), ParsePropsModule (copy), SduiBuilderProcessingPhase (copy), CryoModule (copy), SduiErrorType (copy), SduiErrorComponent (copy)
	local ComponentConfig = p1.componentConfig
	local ComponentType = ComponentConfig.componentType
	local SduiContext = p1.sduiContext
	local DebugName = p1.debugName
	local ParentAnalyticsContext = p1.parentAnalyticsContext
	local LocalAnalyticsData = p1.localAnalyticsData
	local ExtraLocalProps = p1.extraLocalProps
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = SduiBuilderModule.buildAnalyticsContext(ComponentConfig, ParentAnalyticsContext, LocalAnalyticsData)
	else
		local AnalyticsContext = SduiBuilderModule.buildAnalyticsContext(ComponentConfig, ParentAnalyticsContext, LocalAnalyticsData)
		
		if not CompareSduiAnalyticsContextModule(UseRefResult.current, AnalyticsContext) then
			UseRefResult.current = AnalyticsContext
		end
	end
	local Current = UseRefResult.current
	local Copy = table.clone(ComponentConfig.props or t)
	ParsePropsModule(ComponentType, Copy, DebugName, SduiContext, Current, nil, SduiBuilderProcessingPhase.Render)
	
	if ExtraLocalProps then
		Copy = CryoModule.Dictionary.join(Copy, ExtraLocalProps)
	end
	Copy.componentConfig = ComponentConfig
	Copy.sduiContext = SduiContext
	Copy.debugName = DebugName
	Copy.analyticsContext = Current
	local Component = SduiContext.componentDefinitions:getComponent(ComponentType)
	
	if Component == nil then
		SduiContext.dependencies.logger.reportError(SduiErrorType.NoComponentRegistered, { componentType = ComponentType, name = DebugName }, SduiContext.appPage)
		
		return ReactModule.createElement(SduiErrorComponent)
	else
		return ReactModule.createElement(Component, Copy)
	end
end, (require(SduiCoreSystem.compareSduiProps)))