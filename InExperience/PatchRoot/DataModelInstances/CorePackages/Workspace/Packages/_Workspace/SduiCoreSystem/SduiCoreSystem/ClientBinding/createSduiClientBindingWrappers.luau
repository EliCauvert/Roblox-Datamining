local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local FFlagSduiErrorPaths = require(Parent.SharedFlags).FFlagSduiErrorPaths
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local TutilsModule = require(Parent.tutils)
local CompareSduiPropsModule = require(SduiCoreSystem.compareSduiProps)
local SduiErrorType = require(SduiCoreSystem.SduiErrors).SduiErrorType
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local _ = require(SduiCoreSystem.SduiComponentType)
local GetSduiComponentRegistryModule = require(SduiCoreSystem.getSduiComponentRegistry)
local ValidateInterfaceModule = require(SduiCoreSystem.validateInterface)
local CreateSduiErrorLoggerModule = require(SduiCoreSystem.createSduiErrorLogger)

local function SduiErrorComponent(_)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 100)
	})
end

local t = {}

local function useComponentSduiContext(p1)
	-- upvalues: ReactModule (copy), CreateSduiErrorLoggerModule (copy), t (copy)
	local SduiContext = p1.sduiContext
	local ErrorContext = p1.componentConfig.errorContext
	
	return ReactModule.useMemo(function()
		-- upvalues: SduiContext (copy), CreateSduiErrorLoggerModule (upval), ErrorContext (copy), t (upval)
		local Copy = table.clone(SduiContext)
		Copy.dependencies = table.clone(SduiContext.dependencies)
		Copy.dependencies.logger = CreateSduiErrorLoggerModule(SduiContext.dependencies.logger, ErrorContext or t)
		
		return Copy
	end, { SduiContext, ErrorContext })
end

local function buildWrappedComponent(Callback, p1, SduiContext, List)
	-- upvalues: t (copy), ReactModule (copy), GetSduiComponentRegistryModule (copy), SduiErrorType (copy), SduiErrorComponent (copy), ValidateInterfaceModule (copy)
	local ComponentType = p1.componentConfig.componentType
	
	if p1.localAnalyticsData then
		p1.componentConfig.analyticsContext.setLocalAnalyticsData(p1.localAnalyticsData)
	end
	local Copy = if p1.componentConfig.props then table.clone(p1.componentConfig.props) else {}
	local NestedComponentConfigListPropSignalNames = if p1.componentConfig.nestedComponentConfigListPropSignalNames then p1.componentConfig.nestedComponentConfigListPropSignalNames else t
	
	if List then
		for i, value in List do
			if not value.isNestedComponentConfig and not NestedComponentConfigListPropSignalNames[i] then
				Copy[i] = value.data
			end
		end
	end
	if p1.extraLocalProps then
		for i1, extraLocalProp in p1.extraLocalProps do
			Copy[i1] = extraLocalProp
		end
	end
	Copy.componentConfig = p1.componentConfig
	Copy.sduiContext = SduiContext
	Copy.debugName = p1.debugName
	Copy.analyticsContext = p1.componentConfig.analyticsContext
	local v1 = nil
	
	if List then
		for i2, value1 in List do
			if value1.isNestedComponentConfig then
				if v1 == nil then
					v1 = if p1.componentConfig.nestedComponentConfigs then table.clone(p1.componentConfig.nestedComponentConfigs) else {}
				end
				v1[i2] = value1.data
			end
		end
	end
	local V25 = v1 or p1.componentConfig.nestedComponentConfigs
	
	if V25 then
		for i3, ComponentConfig in V25 do
			Copy[i3] = ReactModule.createElement(Callback(ComponentConfig), {
				sduiContext = SduiContext,
				componentConfig = ComponentConfig,
				debugName = `{p1.debugName}.{i3}`
			})
		end
	end
	if List and next(NestedComponentConfigListPropSignalNames) then
		for nestedComponentConfigListPropSignalName in NestedComponentConfigListPropSignalNames do
			local Entry = List[nestedComponentConfigListPropSignalName]
			
			if Entry then
				local Data = Entry.data
				
				if Data then
					local Elements = {}
					
					for LayoutOrder, entry in Data do
						Elements[`{nestedComponentConfigListPropSignalName}_{LayoutOrder}_{entry.componentType}`] = ReactModule.createElement(Callback(entry), {
							sduiContext = SduiContext,
							componentConfig = entry,
							extraLocalProps = { layoutOrder = LayoutOrder },
							debugName = `{p1.debugName}.{nestedComponentConfigListPropSignalName}[{LayoutOrder}]`
						})
					end
					Copy[nestedComponentConfigListPropSignalName] = Elements
				end
			end
		end
	end
	local ComponentDefinition = GetSduiComponentRegistryModule().getComponentDefinition(ComponentType)
	local Component = ComponentDefinition and ComponentDefinition.component or nil
	
	if Component == nil then
		SduiContext.dependencies.logger.reportError(SduiErrorType.NoComponentRegistered, { componentType = ComponentType, name = p1.debugName }, SduiContext.appPage)
		
		return ReactModule.createElement(SduiErrorComponent)
	else
		local PropInterface = ComponentDefinition and ComponentDefinition.propInterface
		
		return if PropInterface and not ValidateInterfaceModule(Copy, PropInterface) then nil else ReactModule.createElement(Component, Copy)
	end
end

return function(p2)
	-- upvalues: ReactModule (copy), FFlagSduiErrorPaths (copy), useComponentSduiContext (copy), buildWrappedComponent (copy), CompareSduiPropsModule (copy), SignalsModule (copy), TutilsModule (copy), SignalsReactModule (copy)
	return {
		SduiClientBindingThinWrapper = ReactModule.memo(function(p3)
			-- upvalues: FFlagSduiErrorPaths (upval), useComponentSduiContext (upval), buildWrappedComponent (upval), p2 (copy)
			return buildWrappedComponent(p2, p3, if FFlagSduiErrorPaths then useComponentSduiContext(p3) else p3.sduiContext)
		end, CompareSduiPropsModule),
		SduiDataBindingWrapper = ReactModule.memo(function(p3)
			-- upvalues: FFlagSduiErrorPaths (upval), useComponentSduiContext (upval), ReactModule (upval), SignalsModule (upval), TutilsModule (upval), SignalsReactModule (upval), buildWrappedComponent (upval), p2 (copy)
			local UseComponentSduiContextResult = if FFlagSduiErrorPaths then useComponentSduiContext(p3) else p3.sduiContext
			local PropSignals = p3.componentConfig.propSignals
			local IsComponentFilteredSignalFunction = p3.componentConfig.isComponentFilteredSignal
			local ExtraLocalPropSignals = p3.extraLocalPropSignals
			local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
				-- upvalues: PropSignals (copy), IsComponentFilteredSignalFunction (copy), ExtraLocalPropSignals (copy), SignalsModule (upval), TutilsModule (upval)
				assert(PropSignals or (IsComponentFilteredSignalFunction or ExtraLocalPropSignals), "propSignals, isComponentFilteredSignal, or extraLocalPropSignals must exist")
				
				return SignalsModule.createComputed(function(p4)
					-- upvalues: PropSignals (upval), ExtraLocalPropSignals (upval), IsComponentFilteredSignalFunction (upval)
					local t = {}
					
					if PropSignals then
						for i, propSignal in PropSignals do
							t[i] = propSignal(p4)
						end
					end
					if ExtraLocalPropSignals then
						for i1, extraLocalPropSignal in ExtraLocalPropSignals do
							t[i1] = { data = extraLocalPropSignal(p4) }
						end
					end
					if IsComponentFilteredSignalFunction and IsComponentFilteredSignalFunction(p4).data == true then
						t.__isComponentFiltered = true
					end
					return t
				end, TutilsModule.shallowEqual)
			end, {
				PropSignals,
				IsComponentFilteredSignalFunction,
				ExtraLocalPropSignals,
				p3.componentConfig.componentType
			})))
			
			return if UseSignalStateResult.__isComponentFiltered == true then nil else buildWrappedComponent(p2, p3, UseComponentSduiContextResult, UseSignalStateResult)
		end, CompareSduiPropsModule)
	}
end