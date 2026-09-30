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
local t = {}

local function buildItemList(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: sduiPropUtilsModule (ref), signalsModule (ref), cryoModule (ref), t (ref), buildInputsForNestedComponentModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), buildConfigForComponent (ref)
	local t_1 = {}
	
	for i, v in p2 do
		local var1, var2
		local _ = nil
		local _ = nil
		
		if v and v.inline_component ~= nil then
			var1 = v.inline_component
			var2 = true
		elseif v and v.roblox_component and v.roblox_component ~= "" then
			var1 = p5.getTemplateForRobloxComponent(v.roblox_component) or p1
			var2 = false
		else
			var1 = p1
			var2 = p10 == true
		end
		if p7 and p7[i] then
			local var3 = p7[i]
			
			if sduiPropUtilsModule.isComponentVisible(var3, p9) then
				table.insert(t_1, var3)
			end
		else
			local var4 = buildConfigForComponent(var1, signalsModule.createComputed(function(p11)
				-- upvalues: var2 (write), cryoModule (copy), p4 (ref), v (ref), t (copy), p3 (ref), buildInputsForNestedComponentModule (copy), p8 (ref), p5 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy)
				if var2 then
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
							componentType = p5.currentComponentType,
							parserName = p5.currentParserName
						}, p5.appPage)
					end
				else
					cloned = v
				end
				return cloned
			end), p5, p6, nil, if var2 then p8 else nil)
			
			if var4 and sduiPropUtilsModule.isComponentVisible(var4, p9) then
				table.insert(t_1, var4)
			end
		end
	end
	return t_1
end

local function buildOrderedTemplateDataList(p11, p12, p13, p14, p15)
	-- upvalues: splitDottedPathModule (ref), signalsModule (ref), sduiPropUtilsModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), buildInputsForNestedComponentModule (ref), buildConfigForComponent (ref), sduiParseHelpersModule (ref), propResultCategory (ref)
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
		-- upvalues: var7 (ref), sduiPropUtilsModule (copy), p12 (ref), p13 (ref), p14 (ref), var6 (ref), var5 (ref), templateDataMap (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), signalsModule (copy), buildInputsForNestedComponentModule (copy), buildConfigForComponent (copy), p15 (ref), sduiParseHelpersModule (copy)
		local ok, status = pcall(function()
			-- upvalues: var7 (copy), sduiPropUtilsModule (copy), p16 (ref), p12 (copy), p13 (copy), p14 (copy), var6 (copy), var5 (copy), templateDataMap (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), signalsModule (copy), buildInputsForNestedComponentModule (copy), buildConfigForComponent (copy), p15 (copy), sduiParseHelpersModule (copy)
			local var8 = nil
			
			if var7 then
				var8 = sduiPropUtilsModule.resolveBindingPathValue(p16, var7, p12, p13, nil, nil, p14)
			elseif var6 and var6.type == "literal" then
				var8 = var6.value and var6.value.items
			end
			if var8 == nil then
				error("entry_order resolved to nil in ordered_template_data")
			end
			local var9 = if var5 then sduiPropUtilsModule.resolveBindingPathValue(p16, var5, p12, p13, nil, nil, p14) else nil
			local t = {}
			
			for i, v in var8 do
				local var10 = if typeof(v) == "table" then v.identifier else v
				
				if var10 ~= nil and var10 ~= "" then
					local var11 = templateDataMap[var10]
					local var12 = if var9 then var9[var10] else nil
					local var13 = if var11 then var11.inline_component else nil
					local var14 = if var12 and var12.roblox_component and var12.roblox_component ~= "" then var12.roblox_component elseif var11 and var11.roblox_component then var11.roblox_component else nil
					
					if var14 == nil and var13 == nil then
						sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.UnknownTemplateDataIdentifier, {
							message = `No roblox_component or inline_component for identifier "{var27}" in ordered_template_data (not in template_data_map or feed entry)`,
							name = p14.debugName,
							componentType = p14.currentComponentType,
							parserName = p14.currentParserName
						}, p14.appPage)
					else
						local ok, status = pcall(function()
							-- upvalues: sduiPropUtilsModule (copy), var14 (ref), var13 (ref), p14 (copy), var11 (ref), signalsModule (copy), p13 (copy), buildInputsForNestedComponentModule (copy), p12 (copy), var12 (ref), buildConfigForComponent (copy), p15 (copy)
							local var15 = sduiPropUtilsModule.resolveTemplate(var14, var13, p14)
							local var16 = var13 ~= nil
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
							end), p14, p15, nil, if var16 then p12 else nil)
						end)
						
						if not ok then
							sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
								message = `Failed to build ordered_template_data entry for identifier {var10}: {sduiParseHelpersModule.stringifyValue(status)}`,
								name = p14.debugName,
								componentType = p14.currentComponentType,
								parserName = p14.currentParserName
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
			componentType = p14.currentComponentType,
			parserName = p14.currentParserName
		}, p14.appPage)
		
		return { data = {} }
	end), propResultCategory.PropSignal
end

local function buildLazyNestedComponentListProp(p17, p18, p19, p20, p21, p22)
	-- upvalues: sduiPropUtilsModule (ref), buildItemList (ref), propResultCategory (ref), signalsModule (ref), buildInputsForNestedComponentModule (ref), sduiParseHelpersModule (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), buildConfigForComponent (ref), buildOrderedTemplateDataList (ref), buildLazyNestedComponentListProp (ref), buildComponentListModule (ref)
	local currentComponentType = p21.currentComponentType
	local currentParserName = p21.currentParserName
	
	if p17 == "array_map" then
		local var15 = sduiPropUtilsModule.resolveTemplateFromData(p18, p21)
		local bindingPath = p18.binding_path
		
		if bindingPath == nil or bindingPath == "" then
			error(`No bindingPath specified for roblox_component {p18.roblox_component}`)
		end
		local var16 = p18.inline_component ~= nil
		local var17 = nil
		
		return sduiPropUtilsModule.generateDynamicBindingPropValue(bindingPath, p19, p21, p20, function(p23, p24)
			-- upvalues: var17 (write), buildItemList (copy), var15 (ref), p18 (ref), p20 (ref), p21 (ref), p22 (ref), p19 (ref), var16 (ref)
			var17 = buildItemList(var15, p23, p18.inputs, p20, p21, p22, var17, p19, p24, var16)
			
			return var17
		end), propResultCategory.PropSignal
	elseif p17 == "item_list" then
		if typeof(p18) ~= "table" then
			error(`Missing or invalid templateDataList {typeof(p18)}`)
		end
		local items = p18.items
		
		if typeof(items) ~= "table" then
			error(`Missing or invalid templateDataList.items {typeof(p18)}`)
		end
		return signalsModule.createComputed(function(p23)
			-- upvalues: items (ref), sduiPropUtilsModule (copy), p21 (ref), p20 (ref), signalsModule (copy), buildInputsForNestedComponentModule (copy), p19 (ref), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), currentComponentType (ref), currentParserName (ref), buildConfigForComponent (copy), p22 (ref)
			local ok, status = pcall(function()
				-- upvalues: items (copy), sduiPropUtilsModule (copy), p21 (copy), p20 (copy), signalsModule (copy), buildInputsForNestedComponentModule (copy), p19 (copy), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), currentComponentType (copy), currentParserName (copy), buildConfigForComponent (copy), p22 (copy), p23 (ref)
				local t = {}
				
				for i, v in items do
					local var18 = sduiPropUtilsModule.resolveTemplateFromData(v, p21)
					local var19 = v.inline_component ~= nil
					local inputs = v.inputs
					local var20 = buildConfigForComponent(var18, if var19 then p20 else signalsModule.createComputed(function(p24)
						-- upvalues: inputs (ref), buildInputsForNestedComponentModule (copy), p20 (copy), p19 (copy), p21 (copy), sduiParseHelpersModule (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), currentComponentType (copy), currentParserName (copy)
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
									componentType = currentComponentType,
									parserName = currentParserName
								}, p21.appPage)
							end
						end
						return t
					end), p21, p22, nil, if var19 then p19 else nil)
					
					if var20 and sduiPropUtilsModule.isComponentVisible(var20, p23) then
						table.insert(t, var20)
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
				componentType = currentComponentType,
				parserName = currentParserName
			}, p21.appPage)
			
			return { data = {} }
		end), propResultCategory.PropSignal
	elseif p17 == "ordered_template_data" then
		return buildOrderedTemplateDataList(p18, p19, p20, p21, p22)
	elseif p17 == "conditional" then
		return sduiPropUtilsModule.generateConditionalPropValue(p18, p19, p21, p22, p20, buildLazyNestedComponentListProp), propResultCategory.PropSignal
	elseif p17 == "component_list" then
		return buildComponentListModule(p17, p18, p19, p20, p21, p22)
	end
	error(`Could not build prop. Unknown propDefinitionType: {p17}`)
end

return buildLazyNestedComponentListProp