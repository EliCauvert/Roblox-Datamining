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
local FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport = require(Parent.SharedFlags).FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport
local FFlagSduiFixEmptyRobloxComponentInPropBuilder = require(Parent.SharedFlags).FFlagSduiFixEmptyRobloxComponentInPropBuilder
local FFlagSduiOrderedTemplateDataSupport = require(Parent.SharedFlags).FFlagSduiOrderedTemplateDataSupport
local FFlagSduiLocalizedLiterals = require(Parent.SharedFlags).FFlagSduiLocalizedLiterals
local FFlagSduiImprovedErrorDimensions = require(Parent.SharedFlags).FFlagSduiImprovedErrorDimensions
local FFlagSduiInlineNestedComponentSchema = require(Parent.SharedFlags).FFlagSduiInlineNestedComponentSchema
local FFlagSduiClientPageScope = require(Parent.SharedFlags).FFlagSduiClientPageScope
local FFlagSduiRenderPerf = require(Parent.SharedFlags).FFlagSduiRenderPerf
local t = {}

local function buildItemList(GenerateConditionalPropValue, List, Inputs, Callback, p1, p2, FormatResult, p3, p4, Enabled)
	-- upvalues: FFlagSduiInlineNestedComponentSchema (copy), FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport (copy), FFlagSduiFixEmptyRobloxComponentInPropBuilder (copy), FFlagSduiOrderedTemplateDataSupport (copy), SduiPropUtilsModule (copy), SignalsModule (copy), CryoModule (copy), t (copy), BuildInputsForNestedComponentModule (copy), FFlagSduiLocalizedLiterals (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), SduiParseHelpersModule (copy), FFlagSduiImprovedErrorDimensions (copy), BuildConfigForComponentFunction (copy)
	local List1 = {}
	
	for i, value in List do
		local Flag = nil
		local InlineComponent = nil
		
		if FFlagSduiInlineNestedComponentSchema and value and value.inline_component ~= nil then
			InlineComponent = value.inline_component
			Flag = true
		elseif FFlagSduiLazyNestedComponentArrayMapItemResolutionSupport and value and value.roblox_component and (not FFlagSduiFixEmptyRobloxComponentInPropBuilder or value.roblox_component ~= "") then
			InlineComponent = p1.getTemplateForRobloxComponent(value.roblox_component) or GenerateConditionalPropValue
			Flag = false
		else
			InlineComponent = GenerateConditionalPropValue
			Flag = FFlagSduiInlineNestedComponentSchema and Enabled == true
		end
		if FormatResult and FormatResult[i] then
			local FormatResultEntry = FormatResult[i]
			
			if FFlagSduiOrderedTemplateDataSupport then
				if SduiPropUtilsModule.isComponentVisible(FormatResultEntry, p4) then
					table.insert(List1, FormatResultEntry)
				end
			elseif FormatResultEntry.isComponentFilteredSignal == nil or not FormatResultEntry.isComponentFilteredSignal(p4).data then
				table.insert(List1, FormatResultEntry)
			end
		else
			local ConfigForComponent = BuildConfigForComponentFunction(InlineComponent, SignalsModule.createComputed(function(p5)
				-- upvalues: FFlagSduiInlineNestedComponentSchema (upval), Flag (ref), CryoModule (upval), Callback (copy), value (copy), t (upval), Inputs (copy), BuildInputsForNestedComponentModule (upval), p3 (copy), FFlagSduiLocalizedLiterals (upval), p1 (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval), FFlagSduiImprovedErrorDimensions (upval)
				if FFlagSduiInlineNestedComponentSchema and Flag then
					return CryoModule.Dictionary.join(Callback(p5), value or t)
				end
				local Copy = nil
				
				if Inputs then
					Copy = table.clone(value)
					local Success, Result = pcall(function()
						-- upvalues: BuildInputsForNestedComponentModule (upval), Callback (upval), Inputs (upval), p3 (upval), p5 (copy), Copy (ref), FFlagSduiLocalizedLiterals (upval), p1 (upval)
						BuildInputsForNestedComponentModule(Callback, Inputs, p3, p5, Copy, if FFlagSduiLocalizedLiterals then p1 else nil)
					end)
					
					if not Success then
						SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
							message = `Failed to build inputs for nested component in list: {SduiParseHelpersModule.stringifyValue(Result)}`,
							name = p1.debugName,
							componentType = if FFlagSduiImprovedErrorDimensions then p1.currentComponentType else nil,
							parserName = if FFlagSduiImprovedErrorDimensions then p1.currentParserName else nil
						}, p1.appPage)
					end
				else
					Copy = value
				end
				return Copy
			end), p1, p2, nil, if FFlagSduiInlineNestedComponentSchema and Flag then p3 else nil)
			
			if ConfigForComponent then
				if FFlagSduiOrderedTemplateDataSupport then
					if SduiPropUtilsModule.isComponentVisible(ConfigForComponent, p4) then
						table.insert(List1, ConfigForComponent)
					end
				elseif ConfigForComponent.isComponentFilteredSignal == nil or not ConfigForComponent.isComponentFilteredSignal(p4).data then
					table.insert(List1, ConfigForComponent)
				end
			end
		end
	end
	return List1
end

local function buildOrderedTemplateDataList(p5, p6, Callback, p7, p8)
	-- upvalues: FFlagSduiRenderPerf (copy), SplitDottedPathModule (copy), SignalsModule (copy), SduiPropUtilsModule (copy), FFlagSduiClientPageScope (copy), FFlagSduiInlineNestedComponentSchema (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), FFlagSduiImprovedErrorDimensions (copy), BuildInputsForNestedComponentModule (copy), FFlagSduiLocalizedLiterals (copy), BuildConfigForComponentFunction (copy), SduiParseHelpersModule (copy), PropResultCategory (copy)
	local EntryMapPath: string = p5.entry_map_path
	local EntryOrder = p5.entry_order
	local TemplateDataMap = p5.template_data_map
	
	if EntryOrder == nil then
		error("Missing entry_order in ordered_template_data")
	end
	if TemplateDataMap == nil or typeof(TemplateDataMap) ~= "table" then
		error("Missing or invalid template_data_map in ordered_template_data")
	end
	local SplitDottedPathModuleResult = if EntryMapPath and EntryMapPath ~= "" then if FFlagSduiRenderPerf then SplitDottedPathModule(EntryMapPath) else string.split(EntryMapPath, ".") else nil
	local Kind = if EntryOrder then EntryOrder.kind else nil
	local SplitDottedPathModuleResult1 = if Kind and Kind.type == "binding_path" then if FFlagSduiRenderPerf then SplitDottedPathModule(Kind.value) else string.split(Kind.value, ".") else nil
	
	return SignalsModule.createComputed(function(p9)
		-- upvalues: SplitDottedPathModuleResult1 (copy), SduiPropUtilsModule (upval), p6 (copy), Callback (copy), FFlagSduiClientPageScope (upval), p7 (copy), Kind (copy), SplitDottedPathModuleResult (copy), TemplateDataMap (copy), FFlagSduiInlineNestedComponentSchema (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), SignalsModule (upval), BuildInputsForNestedComponentModule (upval), FFlagSduiLocalizedLiterals (upval), BuildConfigForComponentFunction (upval), p8 (copy), SduiParseHelpersModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: SplitDottedPathModuleResult1 (upval), SduiPropUtilsModule (upval), p9 (copy), p6 (upval), Callback (upval), FFlagSduiClientPageScope (upval), p7 (upval), Kind (upval), SplitDottedPathModuleResult (upval), TemplateDataMap (upval), FFlagSduiInlineNestedComponentSchema (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), SignalsModule (upval), BuildInputsForNestedComponentModule (upval), FFlagSduiLocalizedLiterals (upval), BuildConfigForComponentFunction (upval), p8 (upval), SduiParseHelpersModule (upval)
			local Items = nil
			
			if SplitDottedPathModuleResult1 then
				Items = SduiPropUtilsModule.resolveBindingPathValue(p9, SplitDottedPathModuleResult1, p6, Callback, nil, nil, if FFlagSduiClientPageScope then p7 else nil)
			elseif Kind and Kind.type == "literal" then
				Items = Kind.value and Kind.value.items
			end
			if Items == nil then
				error("entry_order resolved to nil in ordered_template_data")
			end
			local ResolveBindingPathValueResult = if SplitDottedPathModuleResult then SduiPropUtilsModule.resolveBindingPathValue(p9, SplitDottedPathModuleResult, p6, Callback, nil, nil, if FFlagSduiClientPageScope then p7 else nil) else nil
			local List = {}
			
			for _, item in Items do
				local Identifier = if typeof(item) == "table" then item.identifier else item
				
				if Identifier ~= nil and Identifier ~= "" then
					local TemplateData = TemplateDataMap[Identifier]
					local ResolveBindingPathValueResultEntry = if ResolveBindingPathValueResult then ResolveBindingPathValueResult[Identifier] else nil
					local InlineComponent = if FFlagSduiInlineNestedComponentSchema and TemplateData then TemplateData.inline_component else nil
					local RobloxComponent = if ResolveBindingPathValueResultEntry and ResolveBindingPathValueResultEntry.roblox_component and ResolveBindingPathValueResultEntry.roblox_component ~= "" then ResolveBindingPathValueResultEntry.roblox_component elseif TemplateData and TemplateData.roblox_component then TemplateData.roblox_component else nil
					
					if RobloxComponent == nil and (not FFlagSduiInlineNestedComponentSchema or InlineComponent == nil) then
						SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.UnknownTemplateDataIdentifier, {
							message = if FFlagSduiInlineNestedComponentSchema then `No roblox_component or inline_component for identifier "{Identifier}" in ordered_template_data (not in template_data_map or feed entry)` else `No roblox_component for identifier "{Identifier}" in ordered_template_data (not in template_data_map or feed entry)`,
							name = p7.debugName,
							componentType = if FFlagSduiImprovedErrorDimensions then p7.currentComponentType else nil,
							parserName = if FFlagSduiImprovedErrorDimensions then p7.currentParserName else nil
						}, p7.appPage)
					else
						local Success, Result = pcall(function()
							-- upvalues: FFlagSduiInlineNestedComponentSchema (upval), SduiPropUtilsModule (upval), RobloxComponent (copy), InlineComponent (copy), p7 (upval), TemplateData (copy), SignalsModule (upval), Callback (upval), BuildInputsForNestedComponentModule (upval), p6 (upval), FFlagSduiLocalizedLiterals (upval), ResolveBindingPathValueResultEntry (copy), BuildConfigForComponentFunction (upval), p8 (upval)
							local HasInlineComponent: boolean = FFlagSduiInlineNestedComponentSchema and InlineComponent ~= nil
							local Inputs = if TemplateData then TemplateData.inputs else nil
							
							return BuildConfigForComponentFunction(if FFlagSduiInlineNestedComponentSchema then SduiPropUtilsModule.resolveTemplate(RobloxComponent, InlineComponent, p7) else SduiPropUtilsModule.resolveTemplate(RobloxComponent, p7), SignalsModule.createComputed(function(p10)
								-- upvalues: HasInlineComponent (copy), Callback (upval), Inputs (copy), BuildInputsForNestedComponentModule (upval), p6 (upval), FFlagSduiLocalizedLiterals (upval), p7 (upval), ResolveBindingPathValueResultEntry (upval)
								local Copy = nil
								if HasInlineComponent then
									Copy = table.clone(Callback(p10))
								else
									Copy = {}
									
									if Inputs then
										BuildInputsForNestedComponentModule(Callback, Inputs, p6, p10, Copy, if FFlagSduiLocalizedLiterals then p7 else nil)
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
							end), p7, p8, nil, if FFlagSduiInlineNestedComponentSchema and HasInlineComponent then p6 else nil)
						end)
						
						if not Success then
							SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
								message = `Failed to build ordered_template_data entry for identifier {Identifier}: {SduiParseHelpersModule.stringifyValue(Result)}`,
								name = p7.debugName,
								componentType = if FFlagSduiImprovedErrorDimensions then p7.currentComponentType else nil,
								parserName = if FFlagSduiImprovedErrorDimensions then p7.currentParserName else nil
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
				componentType = if FFlagSduiImprovedErrorDimensions then p7.currentComponentType else nil,
				parserName = if FFlagSduiImprovedErrorDimensions then p7.currentParserName else nil
			}, p7.appPage)
			
			return { data = {} }
		end
	end), PropResultCategory.PropSignal
end

local function buildLazyNestedComponentListProp(p10, p11, p12, p13, p14, p15)
	-- upvalues: FFlagSduiImprovedErrorDimensions (copy), FFlagSduiOrderedTemplateDataSupport (copy), FFlagSduiInlineNestedComponentSchema (copy), SduiPropUtilsModule (copy), buildItemList (copy), PropResultCategory (copy), SignalsModule (copy), BuildInputsForNestedComponentModule (copy), FFlagSduiLocalizedLiterals (copy), SduiParseHelpersModule (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), BuildConfigForComponentFunction (copy), buildOrderedTemplateDataList (copy), buildLazyNestedComponentListProp (copy), BuildComponentListModule (copy)
	local CurrentComponentType = nil
	local CurrentParserName = nil
	
	if FFlagSduiImprovedErrorDimensions then
		CurrentComponentType = p14.currentComponentType
		CurrentParserName = p14.currentParserName
	end
	if p10 == "array_map" then
		local ResolveTemplateFromDataResult = nil
		
		if FFlagSduiOrderedTemplateDataSupport then
			ResolveTemplateFromDataResult = if FFlagSduiInlineNestedComponentSchema then SduiPropUtilsModule.resolveTemplateFromData(p11, p14) else SduiPropUtilsModule.resolveTemplate(p11.roblox_component, p14)
		else
			if p11.roblox_component == nil then
				error("Missing templateData.roblox_component")
			end
			local TemplateForRobloxComponent = p14.getTemplateForRobloxComponent(p11.roblox_component)
			
			if TemplateForRobloxComponent == nil then
				error(`Could not find template for roblox_component {p11.roblox_component}`)
			end
			ResolveTemplateFromDataResult = TemplateForRobloxComponent
		end
		local BindingPath = p11.binding_path
		
		if BindingPath == nil or BindingPath == "" then
			error(`No bindingPath specified for roblox_component {p11.roblox_component}`)
		end
		local HasInlineComponent: boolean = FFlagSduiInlineNestedComponentSchema and p11.inline_component ~= nil
		local FormatResult = nil
		
		return SduiPropUtilsModule.generateDynamicBindingPropValue(BindingPath, p12, p14, p13, function(p16, p17)
			-- upvalues: FormatResult (ref), buildItemList (upval), ResolveTemplateFromDataResult (ref), p11 (copy), p13 (copy), p14 (copy), p15 (copy), p12 (copy), HasInlineComponent (copy)
			FormatResult = buildItemList(ResolveTemplateFromDataResult, p16, p11.inputs, p13, p14, p15, FormatResult, p12, p17, HasInlineComponent)
			
			return FormatResult
		end), PropResultCategory.PropSignal
	elseif p10 == "item_list" then
		local ResolveTemplateFromDataResult = typeof
		ResolveTemplateFromDataResult = ResolveTemplateFromDataResult(p11)
		
		if ResolveTemplateFromDataResult ~= "table" then
			ResolveTemplateFromDataResult = error
			ResolveTemplateFromDataResult(`Missing or invalid templateDataList {typeof(p11)}`)
		end
		ResolveTemplateFromDataResult = p11.items
		
		if typeof(ResolveTemplateFromDataResult) ~= "table" then
			local FormatResult = "Missing or invalid templateDataList.items %*"
			FormatResult = FormatResult:format((typeof(p11)))
			error(FormatResult)
		end
		local FormatResult = PropResultCategory
		FormatResult = FormatResult.PropSignal
		
		return SignalsModule.createComputed(function(p16)
			-- upvalues: ResolveTemplateFromDataResult (copy), FFlagSduiOrderedTemplateDataSupport (upval), FFlagSduiInlineNestedComponentSchema (upval), SduiPropUtilsModule (upval), p14 (copy), p13 (copy), SignalsModule (upval), BuildInputsForNestedComponentModule (upval), p12 (copy), FFlagSduiLocalizedLiterals (upval), SduiParseHelpersModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (ref), CurrentParserName (ref), BuildConfigForComponentFunction (upval), p15 (copy)
			local Success, Result = pcall(function()
				-- upvalues: ResolveTemplateFromDataResult (upval), FFlagSduiOrderedTemplateDataSupport (upval), FFlagSduiInlineNestedComponentSchema (upval), SduiPropUtilsModule (upval), p14 (upval), p13 (upval), SignalsModule (upval), BuildInputsForNestedComponentModule (upval), p12 (upval), FFlagSduiLocalizedLiterals (upval), SduiParseHelpersModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (upval), CurrentParserName (upval), BuildConfigForComponentFunction (upval), p15 (upval), p16 (copy)
				local List = {}
				
				for _, value in ResolveTemplateFromDataResult do
					local ResolveTemplateFromDataResult1 = nil
					if FFlagSduiOrderedTemplateDataSupport then
						ResolveTemplateFromDataResult1 = if FFlagSduiInlineNestedComponentSchema then SduiPropUtilsModule.resolveTemplateFromData(value, p14) else SduiPropUtilsModule.resolveTemplate(value.roblox_component, p14)
					else
						if value.roblox_component == nil then
							error("Missing templateData.roblox_component")
						end
						local TemplateForRobloxComponent = p14.getTemplateForRobloxComponent(value.roblox_component)
						
						if TemplateForRobloxComponent == nil then
							error(`Could not find template for roblox_component {value.roblox_component}`)
						end
						ResolveTemplateFromDataResult1 = TemplateForRobloxComponent
					end
					local HasInlineComponent: boolean = FFlagSduiInlineNestedComponentSchema and value.inline_component ~= nil
					local Inputs = value.inputs
					local ConfigForComponent = BuildConfigForComponentFunction(ResolveTemplateFromDataResult1, if FFlagSduiInlineNestedComponentSchema and HasInlineComponent then p13 else SignalsModule.createComputed(function(p17)
						-- upvalues: Inputs (copy), BuildInputsForNestedComponentModule (upval), p13 (upval), p12 (upval), FFlagSduiLocalizedLiterals (upval), p14 (upval), SduiParseHelpersModule (upval), SduiLoggerModule (upval), SduiErrorsModule (upval), FFlagSduiImprovedErrorDimensions (upval), CurrentComponentType (upval), CurrentParserName (upval)
						local t = {}
						
						if Inputs then
							local Success, Result = pcall(function()
								-- upvalues: BuildInputsForNestedComponentModule (upval), p13 (upval), Inputs (upval), p12 (upval), p17 (copy), t (copy), FFlagSduiLocalizedLiterals (upval), p14 (upval)
								BuildInputsForNestedComponentModule(p13, Inputs, p12, p17, t, if FFlagSduiLocalizedLiterals then p14 else nil)
							end)
							
							if not Success then
								SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
									message = `Failed to build inputs for nested component in item_list: {SduiParseHelpersModule.stringifyValue(Result)}`,
									name = p14.debugName,
									componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
									parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
								}, p14.appPage)
							end
						end
						return t
					end), p14, p15, nil, if FFlagSduiInlineNestedComponentSchema and HasInlineComponent then p12 else nil)
					
					if ConfigForComponent then
						if FFlagSduiOrderedTemplateDataSupport then
							if SduiPropUtilsModule.isComponentVisible(ConfigForComponent, p16) then
								table.insert(List, ConfigForComponent)
							end
						elseif ConfigForComponent.isComponentFilteredSignal == nil or not ConfigForComponent.isComponentFilteredSignal(p16).data then
							table.insert(List, ConfigForComponent)
						end
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
					componentType = if FFlagSduiImprovedErrorDimensions then CurrentComponentType else nil,
					parserName = if FFlagSduiImprovedErrorDimensions then CurrentParserName else nil
				}, p14.appPage)
				
				return { data = {} }
			end
		end), FormatResult
	else
		local ResolveTemplateFromDataResult = FFlagSduiOrderedTemplateDataSupport
		
		if ResolveTemplateFromDataResult and p10 == "ordered_template_data" then
			ResolveTemplateFromDataResult = buildOrderedTemplateDataList
			local FormatResult = p13
			
			return ResolveTemplateFromDataResult(p11, p12, FormatResult, p14, p15)
		elseif p10 == "conditional" then
			ResolveTemplateFromDataResult = SduiPropUtilsModule
			ResolveTemplateFromDataResult = ResolveTemplateFromDataResult.generateConditionalPropValue
			local FormatResult = p14
			ResolveTemplateFromDataResult = ResolveTemplateFromDataResult(p11, p12, FormatResult, p15, p13, buildLazyNestedComponentListProp)
			
			return ResolveTemplateFromDataResult, PropResultCategory.PropSignal
		elseif p10 ~= "component_list" then
			ResolveTemplateFromDataResult = error
			ResolveTemplateFromDataResult(`Could not build prop. Unknown propDefinitionType: {p10}`)
			
			return
		else
			ResolveTemplateFromDataResult = BuildComponentListModule
			local FormatResult = p12
			
			return ResolveTemplateFromDataResult(p10, p11, FormatResult, p13, p14, p15)
		end
	end
end

return buildLazyNestedComponentListProp