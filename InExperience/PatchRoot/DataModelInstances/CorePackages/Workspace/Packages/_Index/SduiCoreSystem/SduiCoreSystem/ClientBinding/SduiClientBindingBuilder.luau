local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local signalsModule = require(parent.Signals)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local buildDataBindingSourcesForTemplateModule = require(sduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local buildAnalyticsContextForClientBindingModule = require(sduiCoreSystem.ClientBinding.buildAnalyticsContextForClientBinding)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiComponentTypeModule = require(sduiCoreSystem.SduiComponentType)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local fFlagSduiExperimentalComponent = require(parent.SharedFlags).FFlagSduiExperimentalComponent

local function buildProp(p1, p2, p3, p4, p5)
	-- upvalues: buildProp (ref)
	if p1.oneof_prop and p1.oneof_prop.value then
		return buildProp(p1.oneof_prop.value, p2, p3, p4, p5)
	elseif typeof(p1) == "table" and p1.descriptor == nil then
		return p4.getPropBuilder("ContainerProp")(nil, p1, p2, p3, p4, p5)
	end
	local type = p1 and (p1.kind and p1.kind.type)
	
	if type == nil then
		error("No propDefinitionType provided")
	end
	if p1.descriptor == nil then
		error(`No propDefinitionType descriptor provided for {type}`)
	end
	local name = p1.descriptor.name
	p4.currentParserName = name
	local propBuilder = p4.getPropBuilder(name)
	local value = p1.kind and p1.kind.value
	
	if value == nil then
		error(`No propDefinitionValue provided for {type}`)
	end
	local var1, var2, var3 = propBuilder(type, value, p2, p3, p4, p5)
	
	return var1, var2, var3
end

local function buildPropTable(p6, p7, p8, p9, p10)
	-- upvalues: protoVariableMapperModule (ref), buildProp (ref), propResultCategory (ref), sduiLoggerModule (ref), sduiErrorsModule (ref)
	local t = {}
	
	if p6 == nil then
		error("Attempt to buildPropTable with nil")
	end
	local currentComponentType = p9.currentComponentType
	local var4 = nil
	local var5 = nil
	local var6 = nil
	
	for i, v in p6 do
		local var7 = protoVariableMapperModule.mapPropName(i)
		local ok, status = pcall(function()
			-- upvalues: buildProp (copy), v (ref), p7 (ref), p8 (ref), p9 (ref), p10 (ref), propResultCategory (copy), var4 (write), var7 (ref), var5 (write), var6 (write), t (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), currentComponentType (ref)
			local var8, var9, var10 = buildProp(v, p7, p8, p9, p10)
			
			if var9 == propResultCategory.PropSignal then
				if var4 == nil then
					var4 = {}
				end
				var4[var7] = var8
				
				return
			elseif var9 == propResultCategory.NestedComponentConfig then
				if var5 == nil then
					var5 = {}
				end
				var5[var7] = var8
				
				return
			elseif var9 == propResultCategory.NestedComponentConfigListPropSignal then
				if var4 == nil then
					var4 = {}
				end
				var4[var7] = var8
				
				if var6 == nil then
					var6 = {}
				end
				var6[var7] = true
				
				return
			elseif var9 == propResultCategory.Failed then
				t[var7] = var8
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `ClientBinding - failed to build prop {var7}: {var8}, {var10}`,
					propName = `{var7}`,
					name = p9.debugName,
					componentType = currentComponentType,
					parserName = v.descriptor.name,
					value = v
				}, p9.appPage)
				
				return
			elseif var9 == propResultCategory.Literal then
				t[var7] = var8
				
				return
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - unexpected propResultCategory: {var9}. {var7}: {var8}, {var10}`,
				propName = `{var7}`,
				name = p9.debugName,
				componentType = currentComponentType,
				parserName = v.descriptor.name,
				value = v
			}, p9.appPage)
			t[var7] = var8
		end)
		
		if not ok then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - failed to build prop {var7}: {status}. {status}`,
				propName = `{var7}`,
				name = p9.debugName,
				componentType = currentComponentType,
				parserName = v.descriptor.name,
				value = v
			}, p9.appPage)
		end
	end
	return t, var4, var5, var6
end

local t = {
	__index = function(p11, p12)
		return if p12 == "analyticsData" then p11.analyticsContext and p11.analyticsContext.analyticsData else nil
	end
}

local function resolveComponentType(p11)
	-- upvalues: fFlagSduiExperimentalComponent (ref), sduiComponentTypeModule (ref), protoVariableMapperModule (ref)
	if fFlagSduiExperimentalComponent then
		local var8 = nil
		
		if p11.experimental_type then
			var8 = sduiComponentTypeModule[p11.experimental_type]
		else
			local componentType = p11.shared and p11.shared.component_type
			
			if componentType then
				var8 = protoVariableMapperModule.mapUiComponentTypeToLua(componentType)
			end
		end
		if not var8 then
			error("Could not determine ui component type")
		end
		return var8
	else
		local componentType = p11.shared and p11.shared.component_type
		
		if not componentType then
			error("Could not determine ui component type")
		end
		return protoVariableMapperModule.mapUiComponentTypeToLua(componentType)
	end
end

return {
	buildPropTable = buildPropTable,
	buildProp = buildProp,
	buildConfigForComponent = function(p11, p12, p13, p14, _, p15, p16)
		-- upvalues: resolveComponentType (ref), signalsModule (ref), buildDataBindingSourcesForTemplateModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), t (ref), buildPropTable (ref), buildAnalyticsContextForClientBindingModule (ref), buildProp (ref), propResultCategory (ref)
		if not p11 or not next(p11) then
			error("Attempt to buildConfigForComponent with nil template")
		end
		local var8
		local value = p11.kind.value
		local var9 = resolveComponentType(value)
		p13.currentComponentType = var9
		local _ = nil
		
		if p15 == nil then
			local var10 = if value.shared then value.shared.data else {}
			var8 = signalsModule.createComputed(function(p17)
				-- upvalues: buildDataBindingSourcesForTemplateModule (copy), p12 (ref), var10 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), p13 (ref), var9 (ref), sduiParseHelpersModule (copy)
				local ok, status = pcall(function()
					-- upvalues: buildDataBindingSourcesForTemplateModule (copy), p12 (copy), p17 (ref), var10 (copy)
					return buildDataBindingSourcesForTemplateModule(p12(p17), var10)
				end)
				
				if ok then
					return status
				end
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToBuildBindingSources, {
					name = p13.debugName,
					componentType = var9,
					message = sduiParseHelpersModule.stringifyValue(status)
				}, p13.appPage)
				
				return {}
			end)
		else
			var8 = p15
		end
		p16 = p16 or {}
		p16.__processed = true
		p16.__isClientBinding = true
		p16.componentType = var9
		setmetatable(p16, t)
		local var11 = nil
		local var12 = nil
		
		if value.shared and value.shared.analytics_data then
			local var13, var14 = buildPropTable(value.shared.analytics_data, var8, p12, p13, nil)
			var11 = var13
			var12 = var14
		end
		p16.analyticsContext = buildAnalyticsContextForClientBindingModule(var11, var12, p14, p13)
		
		if value.props then
			local _ = nil
			local _ = nil
			local _ = nil
			local var15, var16, var17, var18 = buildPropTable(value.props, var8, p12, p13, p16.analyticsContext)
			p16.props = var15
			local var19 = var16
			local var20 = var17
			local var21 = var18
			
			if var19 ~= nil and next(var19) then
				p16.propSignals = var19
			end
			if var20 ~= nil and next(var20) then
				p16.nestedComponentConfigs = var20
			end
			if var21 ~= nil and next(var21) then
				p16.nestedComponentConfigListPropSignalNames = var21
			end
		end
		if value.shared and value.shared.is_component_filtered then
			local isComponentFiltered = value.shared.is_component_filtered
			local ok, status, var22, var23 = pcall(function()
				-- upvalues: buildProp (copy), isComponentFiltered (ref), var8 (write), p12 (ref), p13 (ref), p16 (ref)
				return buildProp(isComponentFiltered, var8, p12, p13, p16.analyticsContext)
			end)
			
			if not ok or var23 or var22 == propResultCategory.Failed then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build is_component_filtered prop: {if var23 then sduiParseHelpersModule.stringifyValue(var23) else sduiParseHelpersModule.stringifyValue(status)}`,
					name = p13.debugName,
					componentType = var9,
					value = sduiParseHelpersModule.stringifyValue(isComponentFiltered)
				}, p13.appPage)
			elseif var22 == propResultCategory.PropSignal then
				p16.isComponentFilteredSignal = status
			elseif var22 == propResultCategory.Literal then
				function p18.isComponentFilteredSignal()
					-- upvalues: status (ref)
					return { data = status }
				end
			end
		end
		return p16
	end
}