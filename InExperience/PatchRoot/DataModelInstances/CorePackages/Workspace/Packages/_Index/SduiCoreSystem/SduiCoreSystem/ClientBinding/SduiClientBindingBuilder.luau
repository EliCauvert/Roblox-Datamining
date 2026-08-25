local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local signalsModule = require(parent.Signals)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local buildDataBindingSourcesForTemplateModule = require(sduiCoreSystem.ClientBinding.buildDataBindingSourcesForTemplate)
local buildAnalyticsContextForClientBindingModule = require(sduiCoreSystem.ClientBinding.buildAnalyticsContextForClientBinding)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiComponentType)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local protoVariableMapperModule = require(sduiCoreSystem.ClientBinding.ProtoVariableMapper)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiOneofPropSupport = sharedFlagsModule.FFlagSduiOneofPropSupport
local fFlagSduiNestedComponentListProp = sharedFlagsModule.FFlagSduiNestedComponentListProp
local fFlagSduiImprovedErrorDimensions = sharedFlagsModule.FFlagSduiImprovedErrorDimensions
local fFlagSduiInlineNestedComponentSchema = sharedFlagsModule.FFlagSduiInlineNestedComponentSchema
local fFlagSduiGenericContainerDispatch = sharedFlagsModule.FFlagSduiGenericContainerDispatch
local fFlagSduiDeferredListItems = sharedFlagsModule.FFlagSduiDeferredListItems

local function buildProp(p0, p1, p2, p3, p4)
	-- upvalues: fFlagSduiOneofPropSupport (ref), buildProp (ref), fFlagSduiGenericContainerDispatch (ref), fFlagSduiImprovedErrorDimensions (ref)
	if fFlagSduiOneofPropSupport and p0.oneof_prop and p0.oneof_prop.value then
		return buildProp(p0.oneof_prop.value, p1, p2, p3, p4)
	elseif fFlagSduiGenericContainerDispatch and typeof(p0) == "table" and p0.descriptor == nil then
		return p3.getPropBuilder("ContainerProp")(nil, p0, p1, p2, p3, p4)
	end
	local type = p0 and (p0.kind and p0.kind.type)
	
	if type == nil then
		error("No propDefinitionType provided")
	end
	if p0.descriptor == nil then
		error(`No propDefinitionType descriptor provided for {type}`)
	end
	local name = p0.descriptor.name
	
	if fFlagSduiImprovedErrorDimensions then
		p3.currentParserName = name
	end
	local propBuilder = p3.getPropBuilder(name)
	local value = p0.kind and p0.kind.value
	
	if fFlagSduiOneofPropSupport and value == nil then
		error(`No propDefinitionValue provided for {type}`)
	end
	local var15, var16, var17 = propBuilder(type, value, p1, p2, p3, p4)
	
	return var15, var16, var17
end

local function buildPropTable(p5, p6, p7, p8, p9)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), protoVariableMapperModule (ref), buildProp (ref), propResultCategory (ref), fFlagSduiNestedComponentListProp (ref), sduiLoggerModule (ref), sduiErrorsModule (ref)
	local t = {}
	
	if p5 == nil then
		error("Attempt to buildPropTable with nil")
	end
	local var19 = if fFlagSduiImprovedErrorDimensions then p8.currentComponentType else nil
	local var20 = nil
	local var21 = nil
	local var22 = nil
	
	for i, v in p5 do
		local var23 = protoVariableMapperModule.mapPropName(i)
		local ok, status = pcall(function()
			-- upvalues: buildProp (copy), v (ref), p6 (ref), p7 (ref), p8 (ref), p9 (ref), propResultCategory (copy), var20 (write), var23 (ref), var21 (write), fFlagSduiNestedComponentListProp (copy), var22 (write), t (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), var19 (write)
			local var24, var25, var26 = buildProp(v, p6, p7, p8, p9)
			
			if var25 == propResultCategory.PropSignal then
				if var20 == nil then
					var20 = {}
				end
				var20[var23] = var24
				
				return
			elseif var25 == propResultCategory.NestedComponentConfig then
				if var21 == nil then
					var21 = {}
				end
				var21[var23] = var24
				
				return
			elseif fFlagSduiNestedComponentListProp and var25 == propResultCategory.NestedComponentConfigListPropSignal then
				if var20 == nil then
					var20 = {}
				end
				var20[var23] = var24
				
				if var22 == nil then
					var22 = {}
				end
				var22[var23] = true
				
				return
			elseif var25 == propResultCategory.Failed then
				t[var23] = var24
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `ClientBinding - failed to build prop {var23}: {var24}, {var26}`,
					propName = `{var23}`,
					name = p8.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then var19 else nil,
					parserName = if fFlagSduiImprovedErrorDimensions then v.descriptor.name else nil,
					value = v
				}, p8.appPage)
				
				return
			elseif var25 == propResultCategory.Literal then
				t[var23] = var24
				
				return
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - unexpected propResultCategory: {var25}. {var23}: {var24}, {var26}`,
				propName = `{var23}`,
				name = p8.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then var19 else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then v.descriptor.name else nil,
				value = v
			}, p8.appPage)
			t[var23] = var24
		end)
		
		if not ok then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - failed to build prop {var23}: {status}. {status}`,
				propName = `{var23}`,
				name = p8.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then var19 else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then v.descriptor.name else nil,
				value = v
			}, p8.appPage)
		end
	end
	return t, var20, var21, var22
end

local t = {
	__index = function(p10, p11)
		return if p11 == "analyticsData" then p10.analyticsContext and p10.analyticsContext.analyticsData else nil
	end
}

return {
	buildPropTable = buildPropTable,
	buildProp = buildProp,
	buildConfigForComponent = function(p12, p13, p14, p15, _, p16, p17)
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), protoVariableMapperModule (ref), fFlagSduiInlineNestedComponentSchema (ref), signalsModule (ref), buildDataBindingSourcesForTemplateModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), fFlagSduiDeferredListItems (ref), t (ref), buildPropTable (ref), buildAnalyticsContextForClientBindingModule (ref), fFlagSduiNestedComponentListProp (ref), buildProp (ref), propResultCategory (ref)
		if not p12 or not next(p12) then
			error("Attempt to buildConfigForComponent with nil template")
		end
		local value = p12.kind.value
		local var27 = nil
		
		if fFlagSduiImprovedErrorDimensions then
			local componentType = value.shared and value.shared.component_type
			
			if not componentType then
				error("Could not determine ui component type")
			end
			var27 = protoVariableMapperModule.mapUiComponentTypeToLua(componentType)
			p14.currentComponentType = var27
		end
		local var30
		local _ = nil
		
		if fFlagSduiInlineNestedComponentSchema and p16 ~= nil then
			var30 = p16
		else
			local var29 = if value.shared then value.shared.data else {}
			var30 = signalsModule.createComputed(function(p18)
				-- upvalues: buildDataBindingSourcesForTemplateModule (copy), p13 (ref), var29 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), p14 (ref), fFlagSduiImprovedErrorDimensions (copy), var27 (write), sduiParseHelpersModule (copy)
				local ok, status = pcall(function()
					-- upvalues: buildDataBindingSourcesForTemplateModule (copy), p13 (copy), p18 (ref), var29 (copy)
					return buildDataBindingSourcesForTemplateModule(p13(p18), var29)
				end)
				
				if ok then
					return status
				end
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToBuildBindingSources, {
					name = p14.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then var27 else nil,
					message = sduiParseHelpersModule.stringifyValue(status)
				}, p14.appPage)
				
				return {}
			end)
		end
		if not fFlagSduiImprovedErrorDimensions then
			local componentType = value.shared and value.shared.component_type
			
			if not componentType then
				error("Could not determine ui component type")
			end
			var27 = protoVariableMapperModule.mapUiComponentTypeToLua(componentType)
		end
		local p17
		local _ = nil
		
		if fFlagSduiDeferredListItems then
			p17 = p17 or {}
			p17.__processed = true
			p17.__isClientBinding = true
			p17.componentType = var27
		else
			p17 = {
				__processed = true,
				__isClientBinding = true,
				componentType = var27
			}
		end
		setmetatable(p17, t)
		local var33 = nil
		local var34 = nil
		
		if value.shared and value.shared.analytics_data then
			local var35, var36 = buildPropTable(value.shared.analytics_data, var30, p13, p14, nil)
			var33 = var35
			var34 = var36
		end
		p17.analyticsContext = buildAnalyticsContextForClientBindingModule(var33, var34, p15, p14)
		
		if value.props then
			local _ = nil
			local _ = nil
			local _ = nil
			local var37, var38, var39, var40 = buildPropTable(value.props, var30, p13, p14, p17.analyticsContext)
			p17.props = var37
			local var41 = var38
			local var42 = var39
			local var43 = var40
			
			if var41 ~= nil and next(var41) then
				p17.propSignals = var41
			end
			if var42 ~= nil and next(var42) then
				p17.nestedComponentConfigs = var42
			end
			if fFlagSduiNestedComponentListProp and var43 ~= nil and next(var43) then
				p17.nestedComponentConfigListPropSignalNames = var43
			end
		end
		if value.shared and value.shared.is_component_filtered then
			local isComponentFiltered = value.shared.is_component_filtered
			local ok, status, var44, var45 = pcall(function()
				-- upvalues: buildProp (copy), isComponentFiltered (ref), var30 (write), p13 (ref), p14 (ref), p17 (write)
				return buildProp(isComponentFiltered, var30, p13, p14, p17.analyticsContext)
			end)
			
			if not ok or var45 or var44 == propResultCategory.Failed then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build is_component_filtered prop: {if var45 then sduiParseHelpersModule.stringifyValue(var45) else sduiParseHelpersModule.stringifyValue(status)}`,
					name = p14.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then var27 else nil,
					value = sduiParseHelpersModule.stringifyValue(isComponentFiltered)
				}, p14.appPage)
			elseif var44 == propResultCategory.PropSignal then
				p17.isComponentFilteredSignal = status
			elseif var44 == propResultCategory.Literal then
				function p17.isComponentFilteredSignal()
					-- upvalues: status (ref)
					return { data = status }
				end
			end
		end
		return p17
	end
}