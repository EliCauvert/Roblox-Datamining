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

local function buildProp(p1, p2, p3, p4, p5)
	-- upvalues: fFlagSduiOneofPropSupport (ref), buildProp (ref), fFlagSduiGenericContainerDispatch (ref), fFlagSduiImprovedErrorDimensions (ref)
	if fFlagSduiOneofPropSupport and p1.oneof_prop and p1.oneof_prop.value then
		return buildProp(p1.oneof_prop.value, p2, p3, p4, p5)
	elseif fFlagSduiGenericContainerDispatch and typeof(p1) == "table" and p1.descriptor == nil then
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
	
	if fFlagSduiImprovedErrorDimensions then
		p4.currentParserName = name
	end
	local propBuilder = p4.getPropBuilder(name)
	local value = p1.kind and p1.kind.value
	
	if fFlagSduiOneofPropSupport and value == nil then
		error(`No propDefinitionValue provided for {type}`)
	end
	local var1, var2, var3 = propBuilder(type, value, p2, p3, p4, p5)
	
	return var1, var2, var3
end

local function buildPropTable(p6, p7, p8, p9, p10)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), protoVariableMapperModule (ref), buildProp (ref), propResultCategory (ref), fFlagSduiNestedComponentListProp (ref), sduiLoggerModule (ref), sduiErrorsModule (ref)
	local t = {}
	
	if p6 == nil then
		error("Attempt to buildPropTable with nil")
	end
	local var4 = if fFlagSduiImprovedErrorDimensions then p9.currentComponentType else nil
	local var5 = nil
	local var6 = nil
	local var7 = nil
	
	for i, v in p6 do
		local var8 = protoVariableMapperModule.mapPropName(i)
		local ok, status = pcall(function()
			-- upvalues: buildProp (copy), v (ref), p7 (ref), p8 (ref), p9 (ref), p10 (ref), propResultCategory (copy), var5 (write), var8 (ref), var6 (write), fFlagSduiNestedComponentListProp (copy), var7 (write), t (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), var4 (write)
			local var9, var10, var11 = buildProp(v, p7, p8, p9, p10)
			
			if var10 == propResultCategory.PropSignal then
				if var5 == nil then
					var5 = {}
				end
				var5[var8] = var9
				
				return
			elseif var10 == propResultCategory.NestedComponentConfig then
				if var6 == nil then
					var6 = {}
				end
				var6[var8] = var9
				
				return
			elseif fFlagSduiNestedComponentListProp and var10 == propResultCategory.NestedComponentConfigListPropSignal then
				if var5 == nil then
					var5 = {}
				end
				var5[var8] = var9
				
				if var7 == nil then
					var7 = {}
				end
				var7[var8] = true
				
				return
			elseif var10 == propResultCategory.Failed then
				t[var8] = var9
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `ClientBinding - failed to build prop {var8}: {var9}, {var11}`,
					propName = `{var8}`,
					name = p9.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then var4 else nil,
					parserName = if fFlagSduiImprovedErrorDimensions then v.descriptor.name else nil,
					value = v
				}, p9.appPage)
				
				return
			elseif var10 == propResultCategory.Literal then
				t[var8] = var9
				
				return
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - unexpected propResultCategory: {var10}. {var8}: {var9}, {var11}`,
				propName = `{var8}`,
				name = p9.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then var4 else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then v.descriptor.name else nil,
				value = v
			}, p9.appPage)
			t[var8] = var9
		end)
		
		if not ok then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `ClientBinding - failed to build prop {var8}: {status}. {status}`,
				propName = `{var8}`,
				name = p9.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then var4 else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then v.descriptor.name else nil,
				value = v
			}, p9.appPage)
		end
	end
	return t, var5, var6, var7
end

local t = {
	__index = function(p11, p12)
		return if p12 == "analyticsData" then p11.analyticsContext and p11.analyticsContext.analyticsData else nil
	end
}

return {
	buildPropTable = buildPropTable,
	buildProp = buildProp,
	buildConfigForComponent = function(p11, p12, p13, p14, _, p15, p16)
		-- upvalues: fFlagSduiImprovedErrorDimensions (ref), protoVariableMapperModule (ref), fFlagSduiInlineNestedComponentSchema (ref), signalsModule (ref), buildDataBindingSourcesForTemplateModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), fFlagSduiDeferredListItems (ref), t (ref), buildPropTable (ref), buildAnalyticsContextForClientBindingModule (ref), fFlagSduiNestedComponentListProp (ref), buildProp (ref), propResultCategory (ref)
		if not p11 or not next(p11) then
			error("Attempt to buildConfigForComponent with nil template")
		end
		local value = p11.kind.value
		local var9 = nil
		
		if fFlagSduiImprovedErrorDimensions then
			local componentType = value.shared and value.shared.component_type
			
			if not componentType then
				error("Could not determine ui component type")
			end
			var9 = protoVariableMapperModule.mapUiComponentTypeToLua(componentType)
			p13.currentComponentType = var9
		end
		local var10
		local _ = nil
		
		if fFlagSduiInlineNestedComponentSchema and p15 ~= nil then
			var10 = p15
		else
			local var11 = if value.shared then value.shared.data else {}
			var10 = signalsModule.createComputed(function(p17)
				-- upvalues: buildDataBindingSourcesForTemplateModule (copy), p12 (ref), var11 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), p13 (ref), fFlagSduiImprovedErrorDimensions (copy), var9 (write), sduiParseHelpersModule (copy)
				local ok, status = pcall(function()
					-- upvalues: buildDataBindingSourcesForTemplateModule (copy), p12 (copy), p17 (ref), var11 (copy)
					return buildDataBindingSourcesForTemplateModule(p12(p17), var11)
				end)
				
				if ok then
					return status
				end
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToBuildBindingSources, {
					name = p13.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then var9 else nil,
					message = sduiParseHelpersModule.stringifyValue(status)
				}, p13.appPage)
				
				return {}
			end)
		end
		if not fFlagSduiImprovedErrorDimensions then
			local componentType = value.shared and value.shared.component_type
			
			if not componentType then
				error("Could not determine ui component type")
			end
			var9 = protoVariableMapperModule.mapUiComponentTypeToLua(componentType)
		end
		local p16
		local _ = nil
		
		if fFlagSduiDeferredListItems then
			p16 = p16 or {}
			p16.__processed = true
			p16.__isClientBinding = true
			p16.componentType = var9
		else
			p16 = {
				__processed = true,
				__isClientBinding = true,
				componentType = var9
			}
		end
		setmetatable(p16, t)
		local var12 = nil
		local var13 = nil
		
		if value.shared and value.shared.analytics_data then
			local var14, var15 = buildPropTable(value.shared.analytics_data, var10, p12, p13, nil)
			var12 = var14
			var13 = var15
		end
		p16.analyticsContext = buildAnalyticsContextForClientBindingModule(var12, var13, p14, p13)
		
		if value.props then
			local _ = nil
			local _ = nil
			local _ = nil
			local var16, var17, var18, var19 = buildPropTable(value.props, var10, p12, p13, p16.analyticsContext)
			p16.props = var16
			local var20 = var17
			local var21 = var18
			local var22 = var19
			
			if var20 ~= nil and next(var20) then
				p16.propSignals = var20
			end
			if var21 ~= nil and next(var21) then
				p16.nestedComponentConfigs = var21
			end
			if fFlagSduiNestedComponentListProp and var22 ~= nil and next(var22) then
				p16.nestedComponentConfigListPropSignalNames = var22
			end
		end
		if value.shared and value.shared.is_component_filtered then
			local isComponentFiltered = value.shared.is_component_filtered
			local ok, status, var23, var24 = pcall(function()
				-- upvalues: buildProp (copy), isComponentFiltered (ref), var10 (write), p12 (ref), p13 (ref), p16 (write)
				return buildProp(isComponentFiltered, var10, p12, p13, p16.analyticsContext)
			end)
			
			if not ok or var24 or var23 == propResultCategory.Failed then
				sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build is_component_filtered prop: {if var24 then sduiParseHelpersModule.stringifyValue(var24) else sduiParseHelpersModule.stringifyValue(status)}`,
					name = p13.debugName,
					componentType = if fFlagSduiImprovedErrorDimensions then var9 else nil,
					value = sduiParseHelpersModule.stringifyValue(isComponentFiltered)
				}, p13.appPage)
			elseif var23 == propResultCategory.PropSignal then
				p16.isComponentFilteredSignal = status
			elseif var23 == propResultCategory.Literal then
				function p17.isComponentFilteredSignal()
					-- upvalues: status (ref)
					return { data = status }
				end
			end
		end
		return p16
	end
}