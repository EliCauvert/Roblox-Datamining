local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local SignalsModule = require(Parent.Signals)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local SduiPropUtilsModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local SduiLoggerModule = require(SduiCoreSystem.SduiLogger)
local SduiErrorsModule = require(SduiCoreSystem.SduiErrors)
local SduiParseHelpersModule = require(SduiCoreSystem.SduiParseHelpers)
local SduiListEntryNormalizerModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local SduiListEntrySorterModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiListEntrySorter)
local SduiListEntryRendererModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryRenderer)
local SduiPoolEntryHelpersModule = require(SduiCoreSystem.ClientBinding.PropBuilder.SduiPoolEntryHelpers)
local _ = require(SduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local FFlagSduiPerSectionPoolSizing = require(Parent.SharedFlags).FFlagSduiPerSectionPoolSizing
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory

local function _(List, p1): boolean
	if p1 ~= nil then
		return true
	end
	for _, value in List do
		if value.sortRankProp ~= nil then
			return true
		end
	end
	return false
end

local function buildItemsFromEntries(NormalizeBoundDataResult, OrderedIdentifiers, CreateComputed, p2, p3, p4, CaptureErrorContextResult, p5, p6, DeferItemBuild, Callback, PoolEntryConfigs)
	-- upvalues: SduiListEntrySorterModule (copy), SduiPoolEntryHelpersModule (copy), FFlagSduiPerSectionPoolSizing (copy), SduiListEntryRendererModule (copy)
	if CreateComputed ~= nil then
		local Flag = nil
		if OrderedIdentifiers == nil then
			Flag = false
			
			for _, value in NormalizeBoundDataResult do
				if value.sortRankProp ~= nil then
					Flag = true
					break
				end
			end
		else
			Flag = true
		end
		if Flag then
			CreateComputed = nil
		end
	end
	local ApplyOrderResult = SduiListEntrySorterModule.applyOrder(NormalizeBoundDataResult, OrderedIdentifiers, p6, p3, p2, p4, p5)
	local InputSlicer = nil
	local EntryConfigExtrasFn = nil
	local PoolSections = SduiPoolEntryHelpersModule.computePoolSections(ApplyOrderResult, if FFlagSduiPerSectionPoolSizing then PoolEntryConfigs else nil)
	
	if Callback ~= nil or SduiPoolEntryHelpersModule.sectionsHaveMultiRow(PoolSections) then
		local PoolEntryFns = SduiPoolEntryHelpersModule.createPoolEntryFns(PoolSections, p2, p3, p4, CaptureErrorContextResult, if Callback == nil then nil else Callback(p6), PoolEntryConfigs)
		InputSlicer = PoolEntryFns.inputSlicer
		EntryConfigExtrasFn = PoolEntryFns.entryConfigExtrasFn
	end
	if InputSlicer == nil then
		InputSlicer = SduiListEntryRendererModule.createInputSlicer(p2, p3, p4, CaptureErrorContextResult)
	end
	return SduiListEntryRendererModule.buildEntryConfigs(ApplyOrderResult, InputSlicer, CreateComputed, p4, CaptureErrorContextResult, p5, p3, p6, DeferItemBuild, EntryConfigExtrasFn)
end

return function(_, p7, p8, Callback1, p9, p10)
	-- upvalues: SduiLoggerModule (copy), SduiErrorsModule (copy), PropResultCategory (copy), SduiListEntryRendererModule (copy), SduiPoolEntryHelpersModule (copy), SduiPropUtilsModule (copy), SduiListEntryNormalizerModule (copy), buildItemsFromEntries (copy), SduiParseHelpersModule (copy), SignalsModule (copy)
	local Source = p7 and p7.source
	local DefaultItem = p7 and p7.default_item
	local OrderedIdentifiers = p7 and p7.ordered_identifiers
	local ItemOverrides = p7 and p7.item_overrides
	local DeferItemBuild = p7 and p7.defer_item_build
	
	if Source == nil then
		SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
			message = "ComponentList missing source",
			name = p9.debugName,
			componentType = p9.currentComponentType,
			parserName = p9.currentParserName
		}, p9.appPage)
		
		return function()
			return { data = {} }
		end, PropResultCategory.PropSignal
	end
	local Type = Source.type
	local Value = Source.value
	local CaptureErrorContextResult = SduiListEntryRendererModule.captureErrorContext(p9)
	local PoolConfig = p7 and p7.pool_config
	local ResolvePoolDataGetterResult = SduiPoolEntryHelpersModule.resolvePoolDataGetter(PoolConfig and PoolConfig.pool_path, p8, p9, Callback1)
	local PoolEntryConfigs = SduiPoolEntryHelpersModule.buildPoolEntryConfigs(PoolConfig)
	
	if Type == "binding_path" then
		local CreateComputed = nil
		
		return SduiPropUtilsModule.generateDynamicBindingPropValue(Value, p8, p9, Callback1, function(p11, p12)
			-- upvalues: SduiListEntryNormalizerModule (upval), DefaultItem (copy), ItemOverrides (copy), p9 (copy), CreateComputed (ref), buildItemsFromEntries (upval), OrderedIdentifiers (copy), Callback1 (copy), p8 (copy), CaptureErrorContextResult (copy), p10 (copy), DeferItemBuild (copy), ResolvePoolDataGetterResult (copy), PoolEntryConfigs (copy)
			CreateComputed = buildItemsFromEntries(SduiListEntryNormalizerModule.normalizeBoundData(p11, DefaultItem, ItemOverrides, p9), OrderedIdentifiers, CreateComputed, Callback1, p8, p9, CaptureErrorContextResult, p10, p12, DeferItemBuild, ResolvePoolDataGetterResult, PoolEntryConfigs)
			
			return CreateComputed
		end), PropResultCategory.PropSignal
	elseif Type == "literal" then
		local CreateComputed = Value and Value.items
		
		if CreateComputed == nil then
			return function()
				return { data = {} }
			end, PropResultCategory.PropSignal
		else
			return function(p11)
				-- upvalues: SduiListEntryNormalizerModule (upval), CreateComputed (copy), DefaultItem (copy), p9 (copy), buildItemsFromEntries (upval), OrderedIdentifiers (copy), Callback1 (copy), p8 (copy), CaptureErrorContextResult (copy), p10 (copy), DeferItemBuild (copy), ResolvePoolDataGetterResult (copy), PoolEntryConfigs (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval)
				local Success, Result = pcall(function()
					-- upvalues: SduiListEntryNormalizerModule (upval), CreateComputed (upval), DefaultItem (upval), p9 (upval), buildItemsFromEntries (upval), OrderedIdentifiers (upval), Callback1 (upval), p8 (upval), CaptureErrorContextResult (upval), p10 (upval), p11 (copy), DeferItemBuild (upval), ResolvePoolDataGetterResult (upval), PoolEntryConfigs (upval)
					return (buildItemsFromEntries(SduiListEntryNormalizerModule.normalizeLiteralItems(CreateComputed, DefaultItem, p9), OrderedIdentifiers, nil, Callback1, p8, p9, CaptureErrorContextResult, p10, p11, DeferItemBuild, ResolvePoolDataGetterResult, PoolEntryConfigs))
				end)
				
				if Success then
					return { data = Result }
				else
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
						message = `Failed to build ComponentList from literal source: {SduiParseHelpersModule.stringifyValue(Result)}`,
						name = CaptureErrorContextResult.name,
						componentType = CaptureErrorContextResult.componentType,
						parserName = CaptureErrorContextResult.parserName
					}, CaptureErrorContextResult.appPage)
					
					return { data = {} }
				end
			end, PropResultCategory.PropSignal
		end
	elseif Type ~= "pool" then
		local CreateComputed: (any) -> () = error
		CreateComputed(`Unknown ComponentList source kind: {Type}`)
		
		return
	else
		local CreateComputed = SignalsModule
		CreateComputed = CreateComputed.createComputed
		CreateComputed = CreateComputed(function(p11)
			-- upvalues: Callback1 (copy), SduiListEntryNormalizerModule (upval), DefaultItem (copy), ItemOverrides (copy), p9 (copy), buildItemsFromEntries (upval), OrderedIdentifiers (copy), p8 (copy), CaptureErrorContextResult (copy), p10 (copy), DeferItemBuild (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval)
			local Success, Result = pcall(function()
				-- upvalues: Callback1 (upval), p11 (copy), SduiListEntryNormalizerModule (upval), DefaultItem (upval), ItemOverrides (upval), p9 (upval), buildItemsFromEntries (upval), OrderedIdentifiers (upval), p8 (upval), CaptureErrorContextResult (upval), p10 (upval), DeferItemBuild (upval), SduiLoggerModule (upval), SduiErrorsModule (upval)
				local Section = (Callback1(p11) or {})._section
				
				if typeof(Section) ~= "table" then
					return {}
				end
				local CellsFunction = Section.cells
				
				if typeof(CellsFunction) ~= "function" then
					return {}
				end
				local CellsResult = CellsFunction(p11)
				
				if #CellsResult == 0 then
					return {}
				end
				local Items = {}
				local Buffer = table.create(#CellsResult, 0)
				
				for i, value in CellsResult do
					if value.item ~= nil then
						table.insert(Items, value.item)
						Buffer[i] = #Items
					end
				end
				local ItemsFromEntries, ItemsFromEntries2 = buildItemsFromEntries(SduiListEntryNormalizerModule.normalizeBoundData(Items, DefaultItem, ItemOverrides, p9), OrderedIdentifiers, nil, Callback1, p8, p9, CaptureErrorContextResult, p10, p11, DeferItemBuild, nil, nil)
				
				if #ItemsFromEntries ~= #Items then
					SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
						message = `Pool-backed ComponentList dropped {#Items - #ItemsFromEntries} of {#Items} items;` .. " pool templates must resolve to valid templates and must not use is_component_filtered",
						name = CaptureErrorContextResult.name,
						componentType = CaptureErrorContextResult.componentType,
						parserName = CaptureErrorContextResult.parserName
					}, CaptureErrorContextResult.appPage)
				end
				local t = {}
				
				for i1, value1 in ItemsFromEntries2 do
					t[value1] = ItemsFromEntries[i1]
				end
				local List = {}
				
				for i2, value2 in CellsResult do
					local BufferEntry = Buffer[i2]
					
					if BufferEntry == 0 then
						table.insert(List, { isBlank = true })
					else
						local Entry = t[BufferEntry]
						
						if Entry ~= nil then
							Entry.realIndex = value2.realIndex
							Entry.spanOverride = value2.spanOverride
							table.insert(List, Entry)
						end
					end
				end
				return List
			end)
			
			if Success then
				return { data = Result }
			else
				SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
					message = `Failed to build ComponentList from pool source: {SduiParseHelpersModule.stringifyValue(Result)}`,
					name = CaptureErrorContextResult.name,
					componentType = CaptureErrorContextResult.componentType,
					parserName = CaptureErrorContextResult.parserName
				}, CaptureErrorContextResult.appPage)
				
				return { data = {} }
			end
		end)
		
		return CreateComputed, PropResultCategory.PropSignal
	end
end