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
local FFlagSduiPoolBackedFeed = require(Parent.SharedFlags).FFlagSduiPoolBackedFeed
local FFlagSduiDeferredListItems = require(Parent.SharedFlags).FFlagSduiDeferredListItems
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

local function buildItemsFromEntries(NormalizeBoundDataResult, OrderedIdentifiers, CreateComputed, p2, p3, p4, CaptureErrorContextResult, p5, p6, p7, Callback, p8)
	-- upvalues: SduiListEntrySorterModule (copy), FFlagSduiPoolBackedFeed (copy), SduiPoolEntryHelpersModule (copy), SduiListEntryRendererModule (copy), FFlagSduiDeferredListItems (copy)
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
	
	if FFlagSduiPoolBackedFeed then
		local PoolSections = SduiPoolEntryHelpersModule.computePoolSections(ApplyOrderResult)
		
		if Callback ~= nil or SduiPoolEntryHelpersModule.sectionsHaveMultiRow(PoolSections) then
			local PoolEntryFns = SduiPoolEntryHelpersModule.createPoolEntryFns(PoolSections, p2, p3, p4, CaptureErrorContextResult, if Callback == nil then nil else Callback(p6), p8)
			InputSlicer = PoolEntryFns.inputSlicer
			EntryConfigExtrasFn = PoolEntryFns.entryConfigExtrasFn
		end
	end
	if not FFlagSduiPoolBackedFeed or InputSlicer == nil then
		InputSlicer = SduiListEntryRendererModule.createInputSlicer(p2, p3, p4, CaptureErrorContextResult)
	end
	return SduiListEntryRendererModule.buildEntryConfigs(ApplyOrderResult, InputSlicer, CreateComputed, p4, CaptureErrorContextResult, p5, p3, p6, if FFlagSduiDeferredListItems then p7 else nil, if FFlagSduiPoolBackedFeed then EntryConfigExtrasFn else nil)
end

return function(_, p9, p10, Callback1, p11, p12)
	-- upvalues: FFlagSduiDeferredListItems (copy), SduiLoggerModule (copy), SduiErrorsModule (copy), PropResultCategory (copy), SduiListEntryRendererModule (copy), FFlagSduiPoolBackedFeed (copy), SduiPoolEntryHelpersModule (copy), SduiPropUtilsModule (copy), SduiListEntryNormalizerModule (copy), buildItemsFromEntries (copy), SduiParseHelpersModule (copy), SignalsModule (copy)
	local Source = p9 and p9.source
	local DefaultItem = p9 and p9.default_item
	local OrderedIdentifiers = p9 and p9.ordered_identifiers
	local ItemOverrides = p9 and p9.item_overrides
	local DeferItemBuild = if FFlagSduiDeferredListItems then p9 and p9.defer_item_build else nil
	
	if Source == nil then
		SduiLoggerModule.reportError(SduiErrorsModule.SduiErrorType.FailedToParseProp, {
			message = "ComponentList missing source",
			name = p11.debugName,
			componentType = p11.currentComponentType,
			parserName = p11.currentParserName
		}, p11.appPage)
		
		return function()
			return { data = {} }
		end, PropResultCategory.PropSignal
	end
	local Type = Source.type
	local Value = Source.value
	local CaptureErrorContextResult = SduiListEntryRendererModule.captureErrorContext(p11)
	local ResolvePoolDataGetterResult = nil
	local PoolEntryConfigs = nil
	
	if FFlagSduiPoolBackedFeed then
		local PoolConfig = p9 and p9.pool_config
		ResolvePoolDataGetterResult = SduiPoolEntryHelpersModule.resolvePoolDataGetter(PoolConfig and PoolConfig.pool_path, p10, p11, Callback1)
		PoolEntryConfigs = SduiPoolEntryHelpersModule.buildPoolEntryConfigs(PoolConfig)
	end
	if Type == "binding_path" then
		local CreateComputed = nil
		
		return SduiPropUtilsModule.generateDynamicBindingPropValue(Value, p10, p11, Callback1, function(p13, p14)
			-- upvalues: SduiListEntryNormalizerModule (upval), DefaultItem (copy), ItemOverrides (copy), p11 (copy), CreateComputed (ref), buildItemsFromEntries (upval), OrderedIdentifiers (copy), Callback1 (copy), p10 (copy), CaptureErrorContextResult (copy), p12 (copy), FFlagSduiDeferredListItems (upval), DeferItemBuild (copy), ResolvePoolDataGetterResult (ref), FFlagSduiPoolBackedFeed (upval), PoolEntryConfigs (ref)
			CreateComputed = buildItemsFromEntries(SduiListEntryNormalizerModule.normalizeBoundData(p13, DefaultItem, ItemOverrides, p11), OrderedIdentifiers, CreateComputed, Callback1, p10, p11, CaptureErrorContextResult, p12, p14, if FFlagSduiDeferredListItems then DeferItemBuild else nil, ResolvePoolDataGetterResult, if FFlagSduiPoolBackedFeed then PoolEntryConfigs else nil)
			
			return CreateComputed
		end), PropResultCategory.PropSignal
	elseif Type == "literal" then
		local CreateComputed = Value and Value.items
		
		if CreateComputed == nil then
			return function()
				return { data = {} }
			end, PropResultCategory.PropSignal
		else
			return function(p13)
				-- upvalues: SduiListEntryNormalizerModule (upval), CreateComputed (copy), DefaultItem (copy), p11 (copy), buildItemsFromEntries (upval), OrderedIdentifiers (copy), Callback1 (copy), p10 (copy), CaptureErrorContextResult (copy), p12 (copy), FFlagSduiDeferredListItems (upval), DeferItemBuild (copy), ResolvePoolDataGetterResult (ref), FFlagSduiPoolBackedFeed (upval), PoolEntryConfigs (ref), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval)
				local Success, Result = pcall(function()
					-- upvalues: SduiListEntryNormalizerModule (upval), CreateComputed (upval), DefaultItem (upval), p11 (upval), buildItemsFromEntries (upval), OrderedIdentifiers (upval), Callback1 (upval), p10 (upval), CaptureErrorContextResult (upval), p12 (upval), p13 (copy), FFlagSduiDeferredListItems (upval), DeferItemBuild (upval), ResolvePoolDataGetterResult (upval), FFlagSduiPoolBackedFeed (upval), PoolEntryConfigs (upval)
					return (buildItemsFromEntries(SduiListEntryNormalizerModule.normalizeLiteralItems(CreateComputed, DefaultItem, p11), OrderedIdentifiers, nil, Callback1, p10, p11, CaptureErrorContextResult, p12, p13, if FFlagSduiDeferredListItems then DeferItemBuild else nil, ResolvePoolDataGetterResult, if FFlagSduiPoolBackedFeed then PoolEntryConfigs else nil))
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
	else
		local CreateComputed = FFlagSduiPoolBackedFeed
		
		if not CreateComputed or Type ~= "pool" then
			CreateComputed = error
			CreateComputed(`Unknown ComponentList source kind: {Type}`)
			
			return
		end
		CreateComputed = SignalsModule
		CreateComputed = CreateComputed.createComputed
		CreateComputed = CreateComputed(function(p13)
			-- upvalues: Callback1 (copy), SduiListEntryNormalizerModule (upval), DefaultItem (copy), ItemOverrides (copy), p11 (copy), buildItemsFromEntries (upval), OrderedIdentifiers (copy), p10 (copy), CaptureErrorContextResult (copy), p12 (copy), FFlagSduiDeferredListItems (upval), DeferItemBuild (copy), SduiLoggerModule (upval), SduiErrorsModule (upval), SduiParseHelpersModule (upval)
			local Success, Result = pcall(function()
				-- upvalues: Callback1 (upval), p13 (copy), SduiListEntryNormalizerModule (upval), DefaultItem (upval), ItemOverrides (upval), p11 (upval), buildItemsFromEntries (upval), OrderedIdentifiers (upval), p10 (upval), CaptureErrorContextResult (upval), p12 (upval), FFlagSduiDeferredListItems (upval), DeferItemBuild (upval), SduiLoggerModule (upval), SduiErrorsModule (upval)
				local Section = (Callback1(p13) or {})._section
				
				if typeof(Section) ~= "table" then
					return {}
				end
				local CellsFunction = Section.cells
				
				if typeof(CellsFunction) ~= "function" then
					return {}
				end
				local CellsResult = CellsFunction(p13)
				
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
				local ItemsFromEntries, ItemsFromEntries2 = buildItemsFromEntries(SduiListEntryNormalizerModule.normalizeBoundData(Items, DefaultItem, ItemOverrides, p11), OrderedIdentifiers, nil, Callback1, p10, p11, CaptureErrorContextResult, p12, p13, if FFlagSduiDeferredListItems then DeferItemBuild else nil, nil, nil)
				
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