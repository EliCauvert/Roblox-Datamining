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
local fFlagSduiRenderPerf = require(parent.SharedFlags).FFlagSduiRenderPerf
local t = {}

local function buildItemList(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ line: 47 ]]
	-- upvalues: fFlagSduiInlineNestedComponentSchema (ref), fFlagSduiLazyNestedComponentArrayMapItemResolutionSupport (ref), fFlagSduiFixEmptyRobloxComponentInPropBuilder (ref), fFlagSduiOrderedTemplateDataSupport (ref), sduiPropUtilsModule (ref), signalsModule (ref), cryoModule (ref), t (ref), buildInputsForNestedComponentModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), fFlagSduiImprovedErrorDimensions (ref), buildConfigForComponent (ref)
	local t_1 = {}
	
	for i, v in p1 do
		local var16, var17
		local _ = nil
		local _ = nil
		
		if fFlagSduiInlineNestedComponentSchema and v and v.inline_component ~= nil then
			var16 = v.inline_component
			var17 = true
		elseif fFlagSduiLazyNestedComponentArrayMapItemResolutionSupport and v and v.roblox_component and (not fFlagSduiFixEmptyRobloxComponentInPropBuilder or v.roblox_component ~= "") then
			var16 = p4.getTemplateForRobloxComponent(v.roblox_component) or p0
			var17 = false
		else
			var16 = p0
			var17 = fFlagSduiInlineNestedComponentSchema and p9 == true
		end
		if p6 and p6[i] then
			local var19 = p6[i]
			
			if not fFlagSduiOrderedTemplateDataSupport then
				if not (var19.isComponentFilteredSignal ~= nil and var19.isComponentFilteredSignal(p8).data) then
					table.insert(t_1, var19)
				end
			elseif sduiPropUtilsModule.isComponentVisible(var19, p8) then
				table.insert(t_1, var19)
			end
		else
			local var18 = buildConfigForComponent(var16, signalsModule.createComputed(function(p10) --[[ line: 102 ]]
				-- upvalues: fFlagSduiInlineNestedComponentSchema (copy), var17 (write), cryoModule (copy), p3 (ref), v (ref), t (copy), p2 (ref), buildInputsForNestedComponentModule (copy), p7 (ref), p4 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), fFlagSduiImprovedErrorDimensions (copy)
				if fFlagSduiInlineNestedComponentSchema and var17 then
					return cryoModule.Dictionary.join(p3(p10), v or t)
				end
				local cloned
				local _ = nil
				
				if p2 then
					cloned = table.clone(v)
					local ok, status = pcall(function() --[[ line: 114 ]]
						-- upvalues: buildInputsForNestedComponentModule (copy), p3 (copy), p2 (copy), p7 (copy), p10 (ref), cloned (write), p4 (copy)
						buildInputsForNestedComponentModule(p3, p2, p7, p10, cloned, p4)
					end)
					
					if not ok then
						sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
							message = `Failed to build inputs for nested component in list: {sduiParseHelpersModule.stringifyValue(status)}`,
							name = p4.debugName,
							componentType = if fFlagSduiImprovedErrorDimensions then p4.currentComponentType else nil,
							parserName = if fFlagSduiImprovedErrorDimensions then p4.currentParserName else nil
						}, p4.appPage)
					end
				else
					cloned = v
				end
				return cloned
			end), p4, p5, nil, if fFlagSduiInlineNestedComponentSchema and var17 then p7 else nil)
			
			if var18 then
				if not fFlagSduiOrderedTemplateDataSupport then
					if not (var18.isComponentFilteredSignal ~= nil and var18.isComponentFilteredSignal(p8).data) then
						table.insert(t_1, var18)
					end
				elseif sduiPropUtilsModule.isComponentVisible(var18, p8) then
					table.insert(t_1, var18)
				end
			end
		end
	end
	return t_1
end

local function buildOrderedTemplateDataList(p11, p12, p13, p14, p15) --[[ line: 171 ]]
	-- upvalues: fFlagSduiRenderPerf (ref), splitDottedPathModule (ref), signalsModule (ref), sduiPropUtilsModule (ref), fFlagSduiClientPageScope (ref), fFlagSduiInlineNestedComponentSchema (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), fFlagSduiImprovedErrorDimensions (ref), buildInputsForNestedComponentModule (ref), buildConfigForComponent (ref), sduiParseHelpersModule (ref), propResultCategory (ref)
	local entryMapPath = p11.entry_map_path
	local entryOrder = p11.entry_order
	local templateDataMap = p11.template_data_map
	
	if entryOrder == nil then
		error("Missing entry_order in ordered_template_data")
	end
	if templateDataMap == nil or typeof(templateDataMap) ~= "table" then
		error("Missing or invalid template_data_map in ordered_template_data")
	end
	local var21 = if entryMapPath and entryMapPath ~= "" then if fFlagSduiRenderPerf then splitDottedPathModule(entryMapPath) else string.split(entryMapPath, ".") else nil
	local var22 = if entryOrder then entryOrder.kind else nil
	local var23 = if var22 and var22.type == "binding_path" then if fFlagSduiRenderPerf then splitDottedPathModule(var22.value) else string.split(var22.value, ".") else nil
	
	return signalsModule.createComputed(function(p16) --[[ line: 198 ]]
		-- upvalues: var23 (ref), sduiPropUtilsModule (copy), p12 (ref), p13 (ref), fFlagSduiClientPageScope (copy), p14 (ref), var22 (ref), var21 (ref), templateDataMap (ref), fFlagSduiInlineNestedComponentSchema (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), signalsModule (copy), buildInputsForNestedComponentModule (copy), buildConfigForComponent (copy), p15 (ref), sduiParseHelpersModule (copy)
		local ok, status = pcall(function() --[[ line: 199 ]]
			-- upvalues: var23 (copy), sduiPropUtilsModule (copy), p16 (ref), p12 (copy), p13 (copy), fFlagSduiClientPageScope (copy), p14 (copy), var22 (copy), var21 (copy), templateDataMap (copy), fFlagSduiInlineNestedComponentSchema (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), signalsModule (copy), buildInputsForNestedComponentModule (copy), buildConfigForComponent (copy), p15 (copy), sduiParseHelpersModule (copy)
			local var24 = nil
			
			if var23 then
				var24 = sduiPropUtilsModule.resolveBindingPathValue(p16, var23, p12, p13, nil, nil, if fFlagSduiClientPageScope then p14 else nil)
			elseif var22 and var22.type == "literal" then
				var24 = var22.value and var22.value.items
			end
			if var24 == nil then
				error("entry_order resolved to nil in ordered_template_data")
			end
			local var25 = if var21 then sduiPropUtilsModule.resolveBindingPathValue(p16, var21, p12, p13, nil, nil, if fFlagSduiClientPageScope then p14 else nil) else nil
			local t = {}
			
			for i, v in var24 do
				local var27 = if typeof(v) == "table" then v.identifier else v
				
				if var27 ~= nil and var27 ~= "" then
					local var28 = templateDataMap[var27]
					local var29 = if var25 then var25[var27] else nil
					local var30 = if fFlagSduiInlineNestedComponentSchema and var28 then var28.inline_component else nil
					local var31 = if var29 and var29.roblox_component and var29.roblox_component ~= "" then var29.roblox_component elseif var28 and var28.roblox_component then var28.roblox_component else nil
					
					if var31 == nil and (not fFlagSduiInlineNestedComponentSchema or var30 == nil) then
						sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.UnknownTemplateDataIdentifier, {
							message = if fFlagSduiInlineNestedComponentSchema then `No roblox_component or inline_component for identifier "{var27}" in ordered_template_data (not in template_data_map or feed entry)` else `No roblox_component for identifier "{var27}" in ordered_template_data (not in template_data_map or feed entry)`,
							name = p14.debugName,
							componentType = if fFlagSduiImprovedErrorDimensions then p14.currentComponentType else nil,
							parserName = if fFlagSduiImprovedErrorDimensions then p14.currentParserName else nil
						}, p14.appPage)
					else
						local ok, status = pcall(function() --[[ line: 272 ]]
							-- upvalues: fFlagSduiInlineNestedComponentSchema (copy), sduiPropUtilsModule (copy), var31 (ref), var30 (ref), p14 (copy), var28 (ref), signalsModule (copy), p13 (copy), buildInputsForNestedComponentModule (copy), p12 (copy), var29 (ref), buildConfigForComponent (copy), p15 (copy)
							local var32 = if fFlagSduiInlineNestedComponentSchema then sduiPropUtilsModule.resolveTemplate(var31, var30, p14) else sduiPropUtilsModule.resolveTemplate(var31, p14)
							local var33 = fFlagSduiInlineNestedComponentSchema and var30 ~= nil
							local var34 = if var28 then var28.inputs else nil
							
							return buildConfigForComponent(var32, signalsModule.createComputed(function(p17) --[[ line: 284 ]]
								-- upvalues: var33 (ref), p13 (copy), var34 (ref), buildInputsForNestedComponentModule (copy), p12 (copy), p14 (copy), var29 (copy)
								local cloned
								local _ = nil
								
								if var33 then
									cloned = table.clone(p13(p17))
								else
									cloned = {}
									
									if var34 then
										buildInputsForNestedComponentModule(p13, var34, p12, p17, cloned, p14)
									end
								end
								if var29 then
									local var36 = if var29.input_data and var29.input_data.kind and var29.input_data.kind.value then var29.input_data.kind.value else nil
									
									if typeof(var36) == "table" then
										for i, v in var36 do
											cloned[i] = v
										end
									end
								end
								return cloned
							end), p14, p15, nil, if fFlagSduiInlineNestedComponentSchema and var33 then p12 else nil)
						end)
						
						if not ok then
							sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
								message = `Failed to build ordered_template_data entry for identifier {var27}: {sduiParseHelpersModule.stringifyValue(status)}`,
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

local function buildLazyNestedComponentListProp(p18, p19, p20, p21, p22, p23) --[[ line: 392 ]]
	-- upvalues: fFlagSduiImprovedErrorDimensions (ref), fFlagSduiOrderedTemplateDataSupport (ref), fFlagSduiInlineNestedComponentSchema (ref), sduiPropUtilsModule (ref), buildItemList (ref), propResultCategory (ref), signalsModule (ref), buildInputsForNestedComponentModule (ref), sduiParseHelpersModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), buildConfigForComponent (ref), buildOrderedTemplateDataList (ref), buildLazyNestedComponentListProp (ref), buildComponentListModule (ref)
	local var37
	local currentComponentType = nil
	local currentParserName = nil
	
	if fFlagSduiImprovedErrorDimensions then
		currentComponentType = p22.currentComponentType
		currentParserName = p22.currentParserName
	end
	if p18 == "array_map" then
		local _ = nil
		
		if fFlagSduiOrderedTemplateDataSupport then
			var37 = if fFlagSduiInlineNestedComponentSchema then sduiPropUtilsModule.resolveTemplateFromData(p19, p22) else sduiPropUtilsModule.resolveTemplate(p19.roblox_component, p22)
		elseif p19.roblox_component == nil then
			error("Missing templateData.roblox_component")
		end
		local templateForRobloxComponent = p22.getTemplateForRobloxComponent(p19.roblox_component)
		
		if templateForRobloxComponent == nil then
			error(`Could not find template for roblox_component {p19.roblox_component}`)
		end
		var37 = templateForRobloxComponent
		local bindingPath = p19.binding_path
		
		if bindingPath == nil or bindingPath == "" then
			error(`No bindingPath specified for roblox_component {p19.roblox_component}`)
		end
		local var39 = fFlagSduiInlineNestedComponentSchema and p19.inline_component ~= nil
		local var40 = nil
		
		return sduiPropUtilsModule.generateDynamicBindingPropValue(bindingPath, p20, p22, p21, function(p24, p25) --[[ line: 441 ]]
			-- upvalues: var40 (write), buildItemList (copy), var37 (write), p19 (ref), p21 (ref), p22 (ref), p23 (ref), p20 (ref), var39 (ref)
			var40 = buildItemList(var37, p24, p19.inputs, p21, p22, p23, var40, p20, p25, var39)
			
			return var40
		end), propResultCategory.PropSignal
	elseif p18 == "item_list" then
		if typeof(p19) ~= "table" then
			error(`Missing or invalid templateDataList {typeof(p19)}`)
		end
		var37 = p19.items
		
		if typeof(var37) ~= "table" then
			error(`Missing or invalid templateDataList.items {typeof(p19)}`)
		end
		return signalsModule.createComputed(function(p26) --[[ line: 471 ]]
			-- upvalues: var37 (ref), fFlagSduiOrderedTemplateDataSupport (copy), fFlagSduiInlineNestedComponentSchema (copy), sduiPropUtilsModule (copy), p22 (ref), p21 (ref), signalsModule (copy), buildInputsForNestedComponentModule (copy), p20 (ref), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (write), currentParserName (write), buildConfigForComponent (copy), p23 (ref)
			local ok, status = pcall(function() --[[ line: 472 ]]
				-- upvalues: var37 (copy), fFlagSduiOrderedTemplateDataSupport (copy), fFlagSduiInlineNestedComponentSchema (copy), sduiPropUtilsModule (copy), p22 (copy), p21 (copy), signalsModule (copy), buildInputsForNestedComponentModule (copy), p20 (copy), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (copy), currentParserName (copy), buildConfigForComponent (copy), p23 (copy), p26 (ref)
				local t = {}
				
				for i, v in var37 do
					local var42
					local _ = nil
					
					if fFlagSduiOrderedTemplateDataSupport then
						var42 = if fFlagSduiInlineNestedComponentSchema then sduiPropUtilsModule.resolveTemplateFromData(v, p22) else sduiPropUtilsModule.resolveTemplate(v.roblox_component, p22)
					elseif v.roblox_component == nil then
						error("Missing templateData.roblox_component")
					end
					local templateForRobloxComponent = p22.getTemplateForRobloxComponent(v.roblox_component)
					
					if templateForRobloxComponent == nil then
						error(`Could not find template for roblox_component {v.roblox_component}`)
					end
					var42 = templateForRobloxComponent
					local var44 = fFlagSduiInlineNestedComponentSchema and v.inline_component ~= nil
					local inputs = v.inputs
					local var45 = buildConfigForComponent(var42, if fFlagSduiInlineNestedComponentSchema and var44 then p21 else signalsModule.createComputed(function(p27) --[[ line: 500 ]]
						-- upvalues: inputs (ref), buildInputsForNestedComponentModule (copy), p21 (copy), p20 (copy), p22 (copy), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), fFlagSduiImprovedErrorDimensions (copy), currentComponentType (copy), currentParserName (copy)
						local t = {}
						
						if inputs then
							local ok, status = pcall(function() --[[ line: 503 ]]
								-- upvalues: buildInputsForNestedComponentModule (copy), p21 (copy), inputs (copy), p20 (copy), p27 (ref), t (ref), p22 (copy)
								buildInputsForNestedComponentModule(p21, inputs, p20, p27, t, p22)
							end)
							
							if not ok then
								sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
									message = `Failed to build inputs for nested component in item_list: {sduiParseHelpersModule.stringifyValue(status)}`,
									name = p22.debugName,
									componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
									parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
								}, p22.appPage)
							end
						end
						return t
					end), p22, p23, nil, if fFlagSduiInlineNestedComponentSchema and var44 then p20 else nil)
					
					if var45 then
						if not fFlagSduiOrderedTemplateDataSupport then
							if not (var45.isComponentFilteredSignal ~= nil and var45.isComponentFilteredSignal(p26).data) then
								table.insert(t, var45)
							end
						elseif sduiPropUtilsModule.isComponentVisible(var45, p26) then
							table.insert(t, var45)
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
				name = p22.debugName,
				componentType = if fFlagSduiImprovedErrorDimensions then currentComponentType else nil,
				parserName = if fFlagSduiImprovedErrorDimensions then currentParserName else nil
			}, p22.appPage)
			
			return { data = {} }
		end), propResultCategory.PropSignal
	elseif fFlagSduiOrderedTemplateDataSupport and p18 == "ordered_template_data" then
		return buildOrderedTemplateDataList(p19, p20, p21, p22, p23)
	elseif p18 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p19, p20, p22, p23, p21, buildLazyNestedComponentListProp), propResultCategory.PropSignal
	elseif p18 == "component_list" then
		return buildComponentListModule(p18, p19, p20, p21, p22, p23)
	end
	error(`Could not build prop. Unknown propDefinitionType: {p18}`)
end

return buildLazyNestedComponentListProp