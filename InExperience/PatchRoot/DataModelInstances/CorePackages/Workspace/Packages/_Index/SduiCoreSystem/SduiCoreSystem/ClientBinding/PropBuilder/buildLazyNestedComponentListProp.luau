local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.ServiceContractsProto)
local signalsModule = require(parent.Signals)
local buildInputsForNestedComponentModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildInputsForNestedComponent)
local buildComponentListModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildComponentList)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiClientBindingTypesModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local buildConfigForComponent = require(sduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent
local _ = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local propResultCategory = sduiClientBindingTypesModule.PropResultCategory
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local splitDottedPathModule = require(sduiCoreSystem.ClientBinding.splitDottedPath)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local _ = require(sduiCoreSystem.SduiComponentType)
local fFlagSduiLazyNestedComponentArrayMapItemResolutionSupport = require(parent.SharedFlags).FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport
local fFlagSduiFixEmptyRobloxComponentInPropBuilder = require(parent.SharedFlags).FFlagSduiFixEmptyRobloxComponentInPropBuilder
local fFlagSduiOrderedTemplateDataSupport = require(parent.SharedFlags).FFlagSduiOrderedTemplateDataSupport
local fFlagSduiImprovedErrorDimensions = require(parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local fFlagSduiInlineNestedComponentSchema = require(parent.SharedFlags).FFlagSduiInlineNestedComponentSchema
local fFlagSduiClientPageScope = require(parent.SharedFlags).FFlagSduiClientPageScope
local t = {}

local function buildItemList(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: fFlagSduiInlineNestedComponentSchema (ref), fFlagSduiLazyNestedComponentArrayMapItemResolutionSupport (ref), fFlagSduiFixEmptyRobloxComponentInPropBuilder (ref), fFlagSduiOrderedTemplateDataSupport (ref), sduiPropUtilsModule (ref), signalsModule (ref), cryoModule (ref), t (ref), buildInputsForNestedComponentModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), fFlagSduiImprovedErrorDimensions (ref), buildConfigForComponent (ref)
	local t_1 = {}
	
	for i, v in p2 do
		local var1, var2
		local _ = nil
		local _ = nil
		
		if fFlagSduiInlineNestedComponentSchema and v and v.inline_component ~= nil then
			var1 = v.inline_component
			var2 = true
		elseif fFlagSduiLazyNestedComponentArrayMapItemResolutionSupport and v and v.roblox_component and (not fFlagSduiFixEmptyRobloxComponentInPropBuilder or v.roblox_component ~= "") then
			var1 = p5.getTemplateForRobloxComponent(v.roblox_component) or p1
			var2 = false
		else
			var1 = p1
			var2 = fFlagSduiInlineNestedComponentSchema and p10 == true
		end
		if p7 and p7[i] then
			local var3 = p7[i]
			
			if not fFlagSduiOrderedTemplateDataSupport then
				if not (var3.isComponentFilteredSignal ~= nil and var3.isComponentFilteredSignal(p9).data) then
					table.insert(t_1, var3)
				end
			elseif sduiPropUtilsModule.isComponentVisible(var3, p9) then
				table.insert(t_1, var3)
			end
		else
			local var4 = buildConfigForComponent(var1, signalsModule.createComputed(function(p11)
				-- upvalues: fFlagSduiInlineNestedComponentSchema (copy), var2 (write), cryoModule (copy), p4 (ref), v (ref), t (copy), p3 (ref), buildInputsForNestedComponentModule (copy), p8 (ref), p5 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy)
				if fFlagSduiInlineNestedComponentSchema and var2 then
					return cryoModule.Dictionary.join(p4(p11), v or t)
				end
				local cloned
				local _ = nil
				
				if p3 then
					cloned = table.clone(v)
					local ok, status = pcall(function()
						-- upvalues: buildInputsForNestedComponentModule (copy), p4 (copy), p3 (copy), p8 (copy), p11 (ref), cloned (write), p5 (copy)
						buildInputsForNestedComponentModule(p4, p3, p8, p11, cloned, p5)
					end)
					
					if not ok then
						sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
							message = `Failed to build inputs for nested component in list: {sduiParseHelpersModule.stringifyValue(status)}`,
							name = p5.debugName,
							componentType = if fFlagSduiImprovedErrorDimensions then p5.currentComponentType else nil,
							parserName = if fFlagSduiImprovedErrorDimensions then p5.currentParserName else nil
						}, p5.appPage)
					end
				else
					cloned = v
				end
				return cloned
			end), p5, p6, nil, if fFlagSduiInlineNestedComponentSchema and var2 then p8 else nil)
			
			if var4 then
				if not fFlagSduiOrderedTemplateDataSupport then
					if not (var4.isComponentFilteredSignal ~= nil and var4.isComponentFilteredSignal(p9).data) then
						table.insert(t_1, var4)
					end
				elseif sduiPropUtilsModule.isComponentVisible(var4, p9) then
					table.insert(t_1, var4)
				end
			end
		end
	end
	return t_1
end

local function buildOrderedTemplateDataList(p11, p12, p13, p14, p15)
	-- upvalues: splitDottedPathModule (ref), signalsModule (ref), sduiPropUtilsModule (ref), fFlagSduiClientPageScope (ref), fFlagSduiInlineNestedComponentSchema (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), fFlagSduiImprovedErrorDimensions (ref), buildInputsForNestedComponentModule (ref), buildConfigForComponent (ref), sduiParseHelpersModule (ref), propResultCategory (ref)
	local entryMapPath = p11.entry_map_path
	local entryOrder = p11.entry_order
	local templateDataMap = p11.template_data_map
	
	if entryOrder == nil then
		error("Missing entry_order in ordered_template_data")
	end
	if templateDataMap == nil or typeof(templateDataMap) ~= "table" then
		error("Missing or invalid template_data_map in ordered_template_data")
	end
	local var5 = if entryMapPath and entryMapPath ~= "" then splitDottedPathModule(entryMapPath) else nil
	local var6 = if entryOrder then entryOrder.kind else nil
	local var7 = if var6 and var6.type == "binding_path" then splitDottedPathModule(var6.value) else nil
	
	return signalsModule.createComputed(function(p16)
		-- upvalues: var7 (ref), sduiPropUtilsModule (copy), p12 (ref), p13 (ref), fFlagSduiClientPageScope (copy), p14 (ref), var6 (ref), var5 (ref), templateDataMap (ref), fFlagSduiInlineNestedComponentSchema (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), signalsModule (copy), buildInputsForNestedComponentModule (copy), buildConfigForComponent (copy), p15 (ref), sduiParseHelpersModule (copy)
		local ok, status = pcall(function()
			-- upvalues: var7 (copy), sduiPropUtilsModule (copy), p16 (ref), p12 (copy), p13 (copy), fFlagSduiClientPageScope (copy), p14 (copy), var6 (copy), var5 (copy), templateDataMap (copy), fFlagSduiInlineNestedComponentSchema (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), signalsModule (copy), buildInputsForNestedComponentModule (copy), buildConfigForComponent (copy), p15 (copy), sduiParseHelpersModule (copy)
			local var8 = nil
			
			if var7 then
				var8 = sduiPropUtilsModule.resolveBindingPathValue(p16, var7, p12, p13, nil, nil, if fFlagSduiClientPageScope then p14 else nil)
			elseif var6 and var6.type == "literal" then
				var8 = var6.value and var6.value.items
			end
			if var8 == nil then
				error("entry_order resolved to nil in ordered_template_data")
			end
			local var9 = if var5 then sduiPropUtilsModule.resolveBindingPathValue(p16, var5, p12, p13, nil, nil, if fFlagSduiClientPageScope then p14 else nil) else nil
			local t = {}
			
			for i, v in var8 do
				local var10 = if typeof(v) == "table" then v.identifier else v
				
				if var10 ~= nil and var10 ~= "" then
					local var11 = templateDataMap[var10]
					local var12 = if var9 then var9[var10] else nil
					local var13 = if fFlagSduiInlineNestedComponentSchema and var11 then var11.inline_component else nil
					local var14 = if var12 and var12.roblox_component and var12.roblox_component ~= "" then var12.roblox_component elseif var11 and var11.roblox_component then var11.roblox_component else nil
					
					if var14 == nil and (not fFlagSduiInlineNestedComponentSchema or var13 == nil) then
						sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.UnknownTemplateDataIdentifier, {
							message = if fFlagSduiInlineNestedComponentSchema then `No roblox_component or inline_component for identifier "{var27}" in ordered_template_data (not in template_data_map or feed entry)` else `No roblox_component for identifier "{var27}" in ordered_template_data (not in template_data_map or feed entry)`,
							name = p14.debugName,
							componentType = if fFlagSduiImprovedErrorDimensions then p14.currentComponentType else nil,
							parserName = if fFlagSduiImprovedErrorDimensions then p14.currentParserName else nil
						}, p14.appPage)
					else
						local ok, status = pcall(function()
							-- upvalues: fFlagSduiInlineNestedComponentSchema (copy), sduiPropUtilsModule (copy), var14 (ref), var13 (ref), p14 (copy), var11 (ref), signalsModule (copy), p13 (copy), buildInputsForNestedComponentModule (copy), p12 (copy), var12 (ref), buildConfigForComponent (copy), p15 (copy)
							local var15 = if fFlagSduiInlineNestedComponentSchema then sduiPropUtilsModule.resolveTemplate(var14, var13, p14) else sduiPropUtilsModule.resolveTemplate(var14, p14)
							local var16 = fFlagSduiInlineNestedComponentSchema and var13 ~= nil
							local var17 = if var11 then var11.inputs else nil
							
							return buildConfigForComponent(var15, signalsModule.createComputed(function(p17)
								-- upvalues: var16 (ref), p13 (copy), var17 (ref), buildInputsForNestedComponentModule (copy), p12 (copy), p14 (copy), var12 (copy)
								local cloned
								local _ = nil
								
								if var16 then
									cloned = table.clone(p13(p17))
								else
									cloned = {}
									
									if var17 then
										buildInputsForNestedComponentModule(p13, var17, p12, p17, cloned, p14)
									end
								end
								if var12 then
									local var18 = if var12.input_data and var12.input_data.kind and var12.input_data.kind.value then var12.input_data.kind.value else nil
									
									if typeof(var18) == "table" then
										for i, v in var18 do
											cloned[i] = v
										end
									end
								end
								return cloned
							end), p14, p15, nil, if fFlagSduiInlineNestedComponentSchema and var16 then p12 else nil)
						end)
						
						if not ok then
							sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
								message = `Failed to build ordered_template_data entry for identifier {var10}: {sduiParseHelpersModule.stringifyValue(status)}`,
								name = p14.debugName,
								componentType = if fFlagSduiImprovedErrorDimensions then p14.currentComponentType else nil,
								parserName = if fFlagSduiImprovedErrorDimensions then p14.currentParserName else nil
							}, p14.appPage)
						elseif status and sduiPropUtilsModule.isComponentVisible(status, p16) then
							table.insert(t, status)
						end
					end
				end
			end
			return t
		end)
		
		if ok then
			return { data = status }
		end
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
			message = `Failed to build ordered_template_data component list: {sduiParseHelpersModule.stringifyValue(status)}`,
			name = p14.debugName,
			componentType = if fFlagSduiImprovedErrorDimensions then p14.currentComponentType else nil,
			parserName = if fFlagSduiImprovedErrorDimensions then p14.currentParserName else nil
		}, p14.appPage)
		
		return { data = {} }
	end), propResultCategory.PropSignal
end

local function buildLazyNestedComponentListProp(p17, p18, p19, p20, p21, p22)
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiOrderedTemplateDataSupport (ref), fFlagSduiInlineNestedComponentSchema (ref), sduiPropUtilsModule (ref), buildItemList (ref), propResultCategory (ref), signalsModule (ref), buildInputsForNestedComponentModule (ref), sduiParseHelpersModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), buildConfigForComponent (ref), buildOrderedTemplateDataList (ref), buildLazyNestedComponentListProp (ref), buildComponentListModule (ref)
	local var15
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p21.currentComponentType
		currentParserName = p21.currentParserName
	end
	if p17 == "array_map" then
		local _ = nil
		
		if fFlagSduiOrderedTemplateDataSupport then
			var15 = if fFlagSduiInlineNestedComponentSchema then sduiPropUtilsModule.resolveTemplateFromData(p18, p21) else sduiPropUtilsModule.resolveTemplate(p18.roblox_component, p21)
		elseif p18.roblox_component == nil then
			error("Missing templateData.roblox_component")
		end
		local templateForRobloxComponent = p21.getTemplateForRobloxComponent(p18.roblox_component)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p18.roblox_component}`)
		end
		var15 = templateForRobloxComponent
		local bindingPath = p18.binding_path
		
		if bindingPath == nil or bindingPath == "" then
			error(`No bindingPath specified for roblox_component {p18.roblox_component}`)
		end
		local var16 = fFlagSduiInlineNestedComponentSchema and p18.inline_component ~= nil
		local var17 = nil
		
		return sduiPropUtilsModule.generateDynamicBindingPropValue(bindingPath, p19, p21, p20, function(p23, p24)
			-- upvalues: var17 (write), buildItemList (copy), var15 (write), p18 (ref), p20 (ref), p21 (ref), p22 (ref), p19 (ref), var16 (ref)
			var17 = buildItemList(var15, p23, p18.inputs, p20, p21, p22, var17, p19, p24, var16)
			
			return var17
		end), propResultCategory.PropSignal
	elseif p17 == "item_list" then
		if typeof(p18) ~= "table" then
			error(`Missing or invalid templateDataList {typeof(p18)}`)
		end
		var15 = p18.items
		
		if typeof(var15) ~= "table" then
			error(`Missing or invalid templateDataList.items {typeof(p18)}`)
		end
		return signalsModule.createComputed(function(p23)
			-- upvalues: var15 (ref), fFlagSduiOrderedTemplateDataSupport (copy), fFlagSduiInlineNestedComponentSchema (copy), sduiPropUtilsModule (copy), p21 (ref), p20 (ref), signalsModule (copy), buildInputsForNestedComponentModule (copy), p19 (ref), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), buildConfigForComponent (copy), p22 (ref)
			local ok, status = pcall(function()
				-- upvalues: var15 (copy), fFlagSduiOrderedTemplateDataSupport (copy), fFlagSduiInlineNestedComponentSchema (copy), sduiPropUtilsModule (copy), p21 (copy), p20 (copy), signalsModule (copy), buildInputsForNestedComponentModule (copy), p19 (copy), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (copy), currentParserName (copy), buildConfigForComponent (copy), p22 (copy), p23 (ref)
				local t = {}
				
				for i, v in var15 do
					local var18
					local _ = nil
					
					if fFlagSduiOrderedTemplateDataSupport then
						var18 = if fFlagSduiInlineNestedComponentSchema then sduiPropUtilsModule.resolveTemplateFromData(v, p21) else sduiPropUtilsModule.resolveTemplate(v.roblox_component, p21)
					elseif v.roblox_component == nil then
						error("Missing templateData.roblox_component")
					end
					local templateForRobloxComponent = p21.getTemplateForRobloxComponent(v.roblox_component)
					
					if templateForRobloxComponent == nil then
						error(`Could not find template for roblox_component {v.roblox_component}`)
					end
					var18 = templateForRobloxComponent
					local var19 = fFlagSduiInlineNestedComponentSchema and v.inline_component ~= nil
					local inputs = v.inputs
					local var20 = buildConfigForComponent(var18, if fFlagSduiInlineNestedComponentSchema and var19 then p20 else signalsModule.createComputed(function(p24)
						-- upvalues: inputs (ref), buildInputsForNestedComponentModule (copy), p20 (copy), p19 (copy), p21 (copy), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (copy), currentParserName (copy)
						local t = {}
						
						if inputs then
							local ok, status = pcall(function()
								-- upvalues: buildInputsForNestedComponentModule (copy), p20 (copy), inputs (copy), p19 (copy), p24 (ref), t (ref), p21 (copy)
								buildInputsForNestedComponentModule(p20, inputs, p19, p24, t, p21)
							end)
							
							if not ok then
								sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
									message = `Failed to build inputs for nested component in item_list: {sduiParseHelpersModule.stringifyValue(status)}`,
									name = p21.debugName,
									componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
									parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
								}, p21.appPage)
							end
						end
						return t
					end), p21, p22, nil, if fFlagSduiInlineNestedComponentSchema and var19 then p19 else nil)
					
					if var20 then
						if not fFlagSduiOrderedTemplateDataSupport then
							if not (var20.isComponentFilteredSignal ~= nil and var20.isComponentFilteredSignal(p23).data) then
								table.insert(t, var20)
							end
						elseif sduiPropUtilsModule.isComponentVisible(var20, p23) then
							table.insert(t, var20)
						end
					end
				end
				return t
			end)
			
			if ok then
				return { data = status }
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `Failed to build item_list component list: {sduiParseHelpersModule.stringifyValue(status)}`,
				name = p21.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p21.appPage)
			
			return { data = {} }
		end), propResultCategory.PropSignal
	elseif fFlagSduiOrderedTemplateDataSupport and p17 == "ordered_template_data" then
		return buildOrderedTemplateDataList(p18, p19, p20, p21, p22)
	elseif p17 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p18, p19, p21, p22, p20, buildLazyNestedComponentListProp), propResultCategory.PropSignal
	elseif p17 == "component_list" then
		return buildComponentListModule(p17, p18, p19, p20, p21, p22)
	end
	error(`Could not build prop. Unknown propDefinitionType: {p17}`)
end

return buildLazyNestedComponentListProp