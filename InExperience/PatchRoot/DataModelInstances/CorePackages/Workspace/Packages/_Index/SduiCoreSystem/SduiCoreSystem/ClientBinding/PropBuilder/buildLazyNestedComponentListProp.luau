local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.ServiceContractsProto)
local SignalsModule = require(Parent.Signals)
local BuildInputsForNestedComponentModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildInputsForNestedComponent)
local BuildComponentListModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildComponentList)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local BuildConfigForComponentFunction = require(SduiCoreSystem.ClientBinding.SduiClientBindingBuilder).buildConfigForComponent
local _ = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SplitDottedPathModule = require(SduiCoreSystem.ClientBinding.splitDottedPath)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local _ = require(SduiCoreSystem.SduiComponentType)
local t = {}

local function buildItemList(ResolveTemplateFromDataResult, List, Inputs, Callback, p1, p2, PropSignal, p3, p4, Enabled) --[[ Line: 37 ]]
	-- upvalues: SduiPropUtilsModule (copy), SignalsModule (copy), CryoModule (copy), t (copy), BuildInputsForNestedComponentModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), BuildConfigForComponentFunction (copy)
	local List1 = {}
	
	for i, value in List do
		local Flag = nil
		local InlineComponent = nil
		
		if value and value.inline_component ~= nil then
			InlineComponent = value.inline_component
			Flag = true
		elseif value and value.roblox_component and value.roblox_component ~= "" then
			InlineComponent = p1.getTemplateForRobloxComponent(value.roblox_component) or ResolveTemplateFromDataResult
			Flag = false
		else
			InlineComponent = ResolveTemplateFromDataResult
			Flag = Enabled == true
		end
		if PropSignal and PropSignal[i] then
			local PropSignalEntry = PropSignal[i]
			
			if SduiPropUtilsModule.isComponentVisible(PropSignalEntry, p4) then
				table.insert(List1, PropSignalEntry)
			end
		else
			local ConfigForComponent = BuildConfigForComponentFunction(InlineComponent, SignalsModule.createComputed(function(p5) --[[ Line: 79 ]]
				-- upvalues: Flag (ref), CryoModule (upval), Callback (copy), value (copy), t (upval), Inputs (copy), BuildInputsForNestedComponentModule (upval), p3 (copy), p1 (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval)
				if Flag then
					return CryoModule.Dictionary.join(Callback(p5), value or t)
				end
				local Copy = nil
				
				if Inputs then
					Copy = table.clone(value)
					local Success, Result = pcall(function() --[[ Line: 91 ]]
						-- upvalues: BuildInputsForNestedComponentModule (upval), Callback (upval), Inputs (upval), p3 (upval), p5 (copy), Copy (ref), p1 (upval)
						BuildInputsForNestedComponentModule(Callback, Inputs, p3, p5, Copy, p1)
					end)
					
					if not Success then
						SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
							message = `Failed to build inputs for nested component in list: {SduiParseHelpersModule.stringifyValue(Result)}`,
							name = p1.debugName,
							componentType = p1.currentComponentType,
							parserName = p1.currentParserName
						}, p1.appPage)
					end
				else
					Copy = value
				end
				return Copy
			end), p1, p2, nil, if Flag then p3 else nil)
			
			if ConfigForComponent and SduiPropUtilsModule.isComponentVisible(ConfigForComponent, p4) then
				table.insert(List1, ConfigForComponent)
			end
		end
	end
	return List1
end

local function buildOrderedTemplateDataList(p5, p6, Callback, p7, p8) --[[ Line: 136 ]]
	-- upvalues: SplitDottedPathModule (copy), SignalsModule (copy), SduiPropUtilsModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), BuildInputsForNestedComponentModule (copy), BuildConfigForComponentFunction (copy), SduiParseHelpersModule (copy), PropResultCategory (copy)
	local EntryMapPath = p5.entry_map_path
	local EntryOrder = p5.entry_order
	local TemplateDataMap = p5.template_data_map
	
	if EntryOrder == nil then
		error("Missing entry_order in ordered_template_data")
	end
	if TemplateDataMap == nil or typeof(TemplateDataMap) ~= "table" then
		error("Missing or invalid template_data_map in ordered_template_data")
	end
	local SplitDottedPathModuleResult = if EntryMapPath and EntryMapPath ~= "" then SplitDottedPathModule(EntryMapPath) else nil
	local Kind = if EntryOrder then EntryOrder.kind else nil
	local SplitDottedPathModuleResult1 = if Kind and Kind.type == "binding_path" then SplitDottedPathModule(Kind.value) else nil
	
	return SignalsModule.createComputed(function(p9) --[[ Line: 163 ]]
		-- upvalues: SplitDottedPathModuleResult1 (copy), SduiPropUtilsModule (upval), p6 (copy), Callback (copy), p7 (copy), Kind (copy), SplitDottedPathModuleResult (copy), TemplateDataMap (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SignalsModule (upval), BuildInputsForNestedComponentModule (upval), BuildConfigForComponentFunction (upval), p8 (copy), SduiParseHelpersModule (upval)
		local Success, Result = pcall(function() --[[ Line: 164 ]]
			-- upvalues: SplitDottedPathModuleResult1 (upval), SduiPropUtilsModule (upval), p9 (copy), p6 (upval), Callback (upval), p7 (upval), Kind (upval), SplitDottedPathModuleResult (upval), TemplateDataMap (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), SignalsModule (upval), BuildInputsForNestedComponentModule (upval), BuildConfigForComponentFunction (upval), p8 (upval), SduiParseHelpersModule (upval)
			local Items = nil
			
			if SplitDottedPathModuleResult1 then
				Items = SduiPropUtilsModule.resolveBindingPathValue(p9, SplitDottedPathModuleResult1, p6, Callback, nil, nil, p7)
			elseif Kind and Kind.type == "literal" then
				Items = Kind.value and Kind.value.items
			end
			if Items == nil then
				error("entry_order resolved to nil in ordered_template_data")
			end
			local ResolveBindingPathValueResult = if SplitDottedPathModuleResult then SduiPropUtilsModule.resolveBindingPathValue(p9, SplitDottedPathModuleResult, p6, Callback, nil, nil, p7) else nil
			local List = {}
			
			for _, item in Items do
				local Identifier = if typeof(item) == "table" then item.identifier else item
				
				if Identifier ~= nil and Identifier ~= "" then
					local TemplateData = TemplateDataMap[Identifier]
					local ResolveBindingPathValueResultEntry = if ResolveBindingPathValueResult then ResolveBindingPathValueResult[Identifier] else nil
					local InlineComponent = if TemplateData then TemplateData.inline_component else nil
					local RobloxComponent = if ResolveBindingPathValueResultEntry and ResolveBindingPathValueResultEntry.roblox_component and ResolveBindingPathValueResultEntry.roblox_component ~= "" then ResolveBindingPathValueResultEntry.roblox_component elseif TemplateData and TemplateData.roblox_component then TemplateData.roblox_component else nil
					
					if RobloxComponent == nil and InlineComponent == nil then
						SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.UnknownTemplateDataIdentifier, {
							message = `No roblox_component or inline_component for identifier "{Identifier}" in ordered_template_data (not in template_data_map or feed entry)`,
							name = p7.debugName,
							componentType = p7.currentComponentType,
							parserName = p7.currentParserName
						}, p7.appPage)
					else
						local Success, Result = pcall(function() --[[ Line: 232 ]]
							-- upvalues: SduiPropUtilsModule (upval), RobloxComponent (copy), InlineComponent (copy), p7 (upval), TemplateData (copy), SignalsModule (upval), Callback (upval), BuildInputsForNestedComponentModule (upval), p6 (upval), ResolveBindingPathValueResultEntry (copy), BuildConfigForComponentFunction (upval), p8 (upval)
							local HasInlineComponent = InlineComponent ~= nil
							local Inputs = if TemplateData then TemplateData.inputs else nil
							
							return BuildConfigForComponentFunction(SduiPropUtilsModule.resolveTemplate(RobloxComponent, InlineComponent, p7), SignalsModule.createComputed(function(p10) --[[ Line: 242 ]]
								-- upvalues: HasInlineComponent (copy), Callback (upval), Inputs (copy), BuildInputsForNestedComponentModule (upval), p6 (upval), p7 (upval), ResolveBindingPathValueResultEntry (upval)
								local Copy = nil
								if HasInlineComponent then
									Copy = table.clone(Callback(p10))
								else
									Copy = {}
									
									if Inputs then
										BuildInputsForNestedComponentModule(Callback, Inputs, p6, p10, Copy, p7)
									end
								end
								if ResolveBindingPathValueResultEntry then
									local Value = if ResolveBindingPathValueResultEntry.input_data and ResolveBindingPathValueResultEntry.input_data.kind and ResolveBindingPathValueResultEntry.input_data.kind.value then ResolveBindingPathValueResultEntry.input_data.kind.value else nil
									
									if typeof(Value) == "table" then
										for i, value in Value do
											Copy[i] = value
										end
									end
								end
								return Copy
							end), p7, p8, nil, if HasInlineComponent then p6 else nil)
						end)
						
						if not Success then
							SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
								message = `Failed to build ordered_template_data entry for identifier {Identifier}: {SduiParseHelpersModule.stringifyValue(Result)}`,
								name = p7.debugName,
								componentType = p7.currentComponentType,
								parserName = p7.currentParserName
							}, p7.appPage)
						elseif Result and SduiPropUtilsModule.isComponentVisible(Result, p9) then
							table.insert(List, Result)
						end
					end
				end
			end
			return List
		end)
		
		if Success then
			return { data = Result }
		else
			SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `Failed to build ordered_template_data component list: {SduiParseHelpersModule.stringifyValue(Result)}`,
				name = p7.debugName,
				componentType = p7.currentComponentType,
				parserName = p7.currentParserName
			}, p7.appPage)
			
			return { data = {} }
		end
	end), PropResultCategory.PropSignal
end

local function buildLazyNestedComponentListProp(p10, p11, p12, p13, p14, p15) --[[ Line: 348 ]]
	-- upvalues: SduiPropUtilsModule (copy), buildItemList (copy), PropResultCategory (copy), SignalsModule (copy), BuildInputsForNestedComponentModule (copy), SduiParseHelpersModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), BuildConfigForComponentFunction (copy), buildOrderedTemplateDataList (copy), buildLazyNestedComponentListProp (copy), BuildComponentListModule (copy)
	local CurrentComponentType = p14.currentComponentType
	local CurrentParserName = p14.currentParserName
	
	if p10 == "array_map" then
		local ResolveTemplateFromDataResult = SduiPropUtilsModule.resolveTemplateFromData(p11, p14)
		local BindingPath = p11.binding_path
		
		if BindingPath == nil or BindingPath == "" then
			error(`No bindingPath specified for roblox_component {p11.roblox_component}`)
		end
		local HasInlineComponent = p11.inline_component ~= nil
		local PropSignal = nil
		
		return SduiPropUtilsModule.generateDynamicBindingPropValue(BindingPath, p12, p14, p13, function(p16, p17) --[[ Line: 379 ]]
			-- upvalues: PropSignal (ref), buildItemList (upval), ResolveTemplateFromDataResult (copy), p11 (copy), p13 (copy), p14 (copy), p15 (copy), p12 (copy), HasInlineComponent (copy)
			PropSignal = buildItemList(ResolveTemplateFromDataResult, p16, p11.inputs, p13, p14, p15, PropSignal, p12, p17, HasInlineComponent)
			
			return PropSignal
		end), PropResultCategory.PropSignal
	elseif p10 == "item_list" then
		if typeof(p11) ~= "table" then
			local PropSignal = typeof
			PropSignal = PropSignal(p11)
			error(`Missing or invalid templateDataList {PropSignal}`)
		end
		local Items = p11.items
		
		if typeof(Items) ~= "table" then
			error(`Missing or invalid templateDataList.items {typeof(p11)}`)
		end
		local PropSignal = PropResultCategory
		PropSignal = PropSignal.PropSignal
		
		return SignalsModule.createComputed(function(p16) --[[ Line: 409 ]]
			-- upvalues: Items (copy), SduiPropUtilsModule (upval), p14 (copy), p13 (copy), SignalsModule (upval), BuildInputsForNestedComponentModule (upval), p12 (copy), SduiParseHelpersModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), CurrentComponentType (copy), CurrentParserName (copy), BuildConfigForComponentFunction (upval), p15 (copy)
			local Success, Result = pcall(function() --[[ Line: 410 ]]
				-- upvalues: Items (upval), SduiPropUtilsModule (upval), p14 (upval), p13 (upval), SignalsModule (upval), BuildInputsForNestedComponentModule (upval), p12 (upval), SduiParseHelpersModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), CurrentComponentType (upval), CurrentParserName (upval), BuildConfigForComponentFunction (upval), p15 (upval), p16 (copy)
				local List = {}
				
				for _, item in Items do
					local HasInlineComponent = item.inline_component ~= nil
					local Inputs = item.inputs
					local ConfigForComponent = BuildConfigForComponentFunction(SduiPropUtilsModule.resolveTemplateFromData(item, p14), if HasInlineComponent then p13 else SignalsModule.createComputed(function(p17) --[[ Line: 424 ]]
						-- upvalues: Inputs (copy), BuildInputsForNestedComponentModule (upval), p13 (upval), p12 (upval), p14 (upval), SduiParseHelpersModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), CurrentComponentType (upval), CurrentParserName (upval)
						local t = {}
						
						if Inputs then
							local Success, Result = pcall(function() --[[ Line: 427 ]]
								-- upvalues: BuildInputsForNestedComponentModule (upval), p13 (upval), Inputs (upval), p12 (upval), p17 (copy), t (copy), p14 (upval)
								BuildInputsForNestedComponentModule(p13, Inputs, p12, p17, t, p14)
							end)
							
							if not Success then
								SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
									message = `Failed to build inputs for nested component in item_list: {SduiParseHelpersModule.stringifyValue(Result)}`,
									name = p14.debugName,
									componentType = CurrentComponentType,
									parserName = CurrentParserName
								}, p14.appPage)
							end
						end
						return t
					end), p14, p15, nil, if HasInlineComponent then p12 else nil)
					
					if ConfigForComponent and SduiPropUtilsModule.isComponentVisible(ConfigForComponent, p16) then
						table.insert(List, ConfigForComponent)
					end
				end
				return List
			end)
			
			if Success then
				return { data = Result }
			else
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build item_list component list: {SduiParseHelpersModule.stringifyValue(Result)}`,
					name = p14.debugName,
					componentType = CurrentComponentType,
					parserName = CurrentParserName
				}, p14.appPage)
				
				return { data = {} }
			end
		end), PropSignal
	elseif p10 == "ordered_template_data" then
		local PropSignal = p13
		
		return buildOrderedTemplateDataList(p11, p12, PropSignal, p14, p15)
	elseif p10 == "conditional" then
		local PropSignal = p14
		
		return SduiPropUtilsModule.generateConditionalPropValue(p11, p12, PropSignal, p15, p13, buildLazyNestedComponentListProp), PropResultCategory.PropSignal
	elseif p10 == "component_list" then
		local PropSignal = p12
		
		return BuildComponentListModule(p10, p11, PropSignal, p13, p14, p15)
	else
		local PropSignal = p10
		error(`Could not build prop. Unknown propDefinitionType: {PropSignal}`)
	end
end

return buildLazyNestedComponentListProp