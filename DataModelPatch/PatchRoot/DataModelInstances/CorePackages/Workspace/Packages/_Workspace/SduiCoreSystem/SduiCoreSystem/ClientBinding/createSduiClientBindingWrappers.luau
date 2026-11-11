local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
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
local FFlagSduiNestedComponentListProp = require(Parent.SharedFlags).FFlagSduiNestedComponentListProp
local FFlagSduiPoolBackedFeed = require(Parent.SharedFlags).FFlagSduiPoolBackedFeed
local SduiDataBindingShallowEquals = game:DefineFastFlag("SduiDataBindingShallowEquals", false)

local function SduiErrorComponent(_)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 100, 0, 100)
	})
end

local t = {}

local function buildWrappedComponent(Callback, p1, List)
	-- upvalues: FFlagSduiNestedComponentListProp (copy), t (copy), ReactModule (copy), GetSduiComponentRegistryModule (copy), SduiErrorType (copy), SduiErrorComponent (copy), ValidateInterfaceModule (copy)
	local ComponentType = p1.componentConfig.componentType
	local SduiContext = p1.sduiContext
	
	if p1.localAnalyticsData then
		p1.componentConfig.analyticsContext.setLocalAnalyticsData(p1.localAnalyticsData)
	end
	local Copy = if p1.componentConfig.props then table.clone(p1.componentConfig.props) else {}
	local NestedComponentConfigListPropSignalNames = if FFlagSduiNestedComponentListProp and p1.componentConfig.nestedComponentConfigListPropSignalNames then p1.componentConfig.nestedComponentConfigListPropSignalNames else t
	
	if List then
		for i, value in List do
			if not value.isNestedComponentConfig and (not FFlagSduiNestedComponentListProp or not NestedComponentConfigListPropSignalNames[i]) then
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
	Copy.sduiContext = p1.sduiContext
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
	local V23 = v1 or p1.componentConfig.nestedComponentConfigs
	
	if V23 then
		for i3, ComponentConfig in V23 do
			Copy[i3] = ReactModule.createElement(Callback(ComponentConfig), {
				sduiContext = p1.sduiContext,
				componentConfig = ComponentConfig,
				debugName = `{p1.debugName}.{i3}`
			})
		end
	end
	if FFlagSduiNestedComponentListProp and List and next(NestedComponentConfigListPropSignalNames) then
		for nestedComponentConfigListPropSignalName in NestedComponentConfigListPropSignalNames do
			local Entry = List[nestedComponentConfigListPropSignalName]
			
			if Entry then
				local Data = Entry.data
				
				if Data then
					local Elements = {}
					
					for LayoutOrder, entry in Data do
						Elements[`{nestedComponentConfigListPropSignalName}_{LayoutOrder}_{entry.componentType}`] = ReactModule.createElement(Callback(entry), {
							sduiContext = p1.sduiContext,
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
	-- upvalues: ReactModule (copy), buildWrappedComponent (copy), CompareSduiPropsModule (copy), FFlagSduiPoolBackedFeed (copy), SignalsModule (copy), SduiDataBindingShallowEquals (copy), TutilsModule (copy), SignalsReactModule (copy)
	return {
		SduiClientBindingThinWrapper = ReactModule.memo(function(p3)
			-- upvalues: buildWrappedComponent (upval), p2 (copy)
			return buildWrappedComponent(p2, p3)
		end, CompareSduiPropsModule),
		SduiDataBindingWrapper = ReactModule.memo(function(p3)
			-- upvalues: FFlagSduiPoolBackedFeed (upval), ReactModule (upval), SignalsModule (upval), SduiDataBindingShallowEquals (upval), TutilsModule (upval), SignalsReactModule (upval), buildWrappedComponent (upval), p2 (copy)
			local PropSignals = p3.componentConfig.propSignals
			local IsComponentFilteredSignalFunction = p3.componentConfig.isComponentFilteredSignal
			local ExtraLocalPropSignals = if FFlagSduiPoolBackedFeed then p3.extraLocalPropSignals else nil
			local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
				-- upvalues: PropSignals (copy), IsComponentFilteredSignalFunction (copy), ExtraLocalPropSignals (copy), SignalsModule (upval), FFlagSduiPoolBackedFeed (upval), SduiDataBindingShallowEquals (upval), TutilsModule (upval)
				assert(PropSignals or (IsComponentFilteredSignalFunction or ExtraLocalPropSignals), "propSignals, isComponentFilteredSignal, or extraLocalPropSignals must exist")
				
				return SignalsModule.createComputed(function(p4)
					-- upvalues: PropSignals (upval), FFlagSduiPoolBackedFeed (upval), ExtraLocalPropSignals (upval), IsComponentFilteredSignalFunction (upval)
					local t = {}
					
					if PropSignals then
						for i, propSignal in PropSignals do
							t[i] = propSignal(p4)
						end
					end
					if FFlagSduiPoolBackedFeed and ExtraLocalPropSignals then
						for i1, extraLocalPropSignal in ExtraLocalPropSignals do
							t[i1] = { data = extraLocalPropSignal(p4) }
						end
					end
					if IsComponentFilteredSignalFunction and IsComponentFilteredSignalFunction(p4).data == true then
						t.__isComponentFiltered = true
					end
					return t
				end, if SduiDataBindingShallowEquals then TutilsModule.shallowEqual else nil)
			end, {
				PropSignals,
				IsComponentFilteredSignalFunction,
				if FFlagSduiPoolBackedFeed then ExtraLocalPropSignals else nil,
				p3.componentConfig.componentType
			})))
			
			return if UseSignalStateResult.__isComponentFiltered == true then nil else buildWrappedComponent(p2, p3, UseSignalStateResult)
		end, CompareSduiPropsModule)
	}
end