local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local signalsModule = require(parent.Signals)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local sduiClientBindingTypesModule = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local sduiPropUtilsModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPropUtils)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local sduiListEntryNormalizerModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryNormalizer)
local sduiListEntrySorterModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntrySorter)
local sduiListEntryRendererModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiListEntryRenderer)
local sduiPoolEntryHelpersModule = require(sduiCoreSystem.ClientBinding.PropBuilder.SduiPoolEntryHelpers)
local _ = require(sduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed
local fFlagSduiDeferredListItems = require(parent.SharedFlags).FFlagSduiDeferredListItems
local propResultCategory = sduiClientBindingTypesModule.PropResultCategory

local function _(p0, p1)
	if p1 ~= nil then
		return true
	end
	for i, v in p0 do
		if v.sortRankProp ~= nil then
			return true
		end
	end
	return false
end

local function buildItemsFromEntries(p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	-- upvalues: sduiListEntrySorterModule (ref), fFlagSduiPoolBackedFeed (ref), sduiPoolEntryHelpersModule (ref), sduiListEntryRendererModule (ref), fFlagSduiDeferredListItems (ref)
	if p4 ~= nil then
		local var13
		local var12 = p2
		
		if p3 == nil then
			for i, v in var12 do
				if v.sortRankProp ~= nil then
					var13 = true
				end
			end
			var13 = false
		else
			var13 = true
		end
		if var13 then
			p4 = nil
		end
	end
	local var14 = sduiListEntrySorterModule.applyOrder(p2, p3, p10, p6, p5, p7, p9)
	local var15 = nil
	local entryConfigExtrasFn = nil
	
	if fFlagSduiPoolBackedFeed then
		local var16 = sduiPoolEntryHelpersModule.computePoolSections(var14)
		
		if p12 ~= nil or sduiPoolEntryHelpersModule.sectionsHaveMultiRow(var16) then
			local var17 = sduiPoolEntryHelpersModule.createPoolEntryFns(var16, p5, p6, p7, p8, if p12 ~= nil then nil else p12(p10), p13)
			var15 = var17.inputSlicer
			entryConfigExtrasFn = var17.entryConfigExtrasFn
		end
	end
	if not fFlagSduiPoolBackedFeed or var15 == nil then
		var15 = sduiListEntryRendererModule.createInputSlicer(p5, p6, p7, p8)
	end
	return sduiListEntryRendererModule.buildEntryConfigs(var14, var15, p4, p7, p8, p9, p6, p10, if fFlagSduiDeferredListItems then p11 else nil, if fFlagSduiPoolBackedFeed then entryConfigExtrasFn else nil)
end

return function(_, p14, p15, p16, p17, p18)
	-- upvalues: fFlagSduiDeferredListItems (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), propResultCategory (ref), sduiListEntryRendererModule (ref), fFlagSduiPoolBackedFeed (ref), sduiPoolEntryHelpersModule (ref), sduiPropUtilsModule (ref), sduiListEntryNormalizerModule (ref), buildItemsFromEntries (ref), sduiParseHelpersModule (ref), signalsModule (ref)
	local source = p14 and p14.source
	local defaultItem = p14 and p14.default_item
	local orderedIdentifiers = p14 and p14.ordered_identifiers
	local itemOverrides = p14 and p14.item_overrides
	local var22 = if fFlagSduiDeferredListItems then p14 and p14.defer_item_build else nil
	
	if source == nil then
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
			message = "ComponentList missing source",
			name = p17.debugName,
			componentType = p17.currentComponentType,
			parserName = p17.currentParserName
		}, p17.appPage)
		
		return function()
			return { data = {} }
		end, propResultCategory.PropSignal
	end
	local type = source.type
	local value = source.value
	local var23 = sduiListEntryRendererModule.captureErrorContext(p17)
	local var24 = nil
	local var25 = nil
	
	if fFlagSduiPoolBackedFeed then
		local poolConfig = p14 and p14.pool_config
		var24 = sduiPoolEntryHelpersModule.resolvePoolDataGetter(poolConfig and poolConfig.pool_path, p15, p17, p16)
		var25 = sduiPoolEntryHelpersModule.buildPoolEntryConfigs(poolConfig)
	end
	if type == "binding_path" then
		local var27 = nil
		
		return sduiPropUtilsModule.generateDynamicBindingPropValue(value, p15, p17, p16, function(p19, p20)
			-- upvalues: sduiListEntryNormalizerModule (copy), defaultItem (ref), itemOverrides (ref), p17 (ref), var27 (write), buildItemsFromEntries (copy), orderedIdentifiers (ref), p16 (ref), p15 (ref), var23 (ref), p18 (ref), fFlagSduiDeferredListItems (copy), var22 (ref), var24 (write), fFlagSduiPoolBackedFeed (copy), var25 (write)
			var27 = buildItemsFromEntries(sduiListEntryNormalizerModule.normalizeBoundData(p19, defaultItem, itemOverrides, p17), orderedIdentifiers, var27, p16, p15, p17, var23, p18, p20, if fFlagSduiDeferredListItems then var22 else nil, var24, if fFlagSduiPoolBackedFeed then var25 else nil)
			
			return var27
		end), propResultCategory.PropSignal
	elseif type == "literal" then
		local items = value and value.items
		
		if items == nil then
			return function()
				return { data = {} }
			end, propResultCategory.PropSignal
		end
		return function(p21)
			-- upvalues: sduiListEntryNormalizerModule (copy), items (ref), defaultItem (ref), p17 (ref), buildItemsFromEntries (copy), orderedIdentifiers (ref), p16 (ref), p15 (ref), var23 (ref), p18 (ref), fFlagSduiDeferredListItems (copy), var22 (ref), var24 (write), fFlagSduiPoolBackedFeed (copy), var25 (write), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy)
			local ok, status = pcall(function()
				-- upvalues: sduiListEntryNormalizerModule (copy), items (copy), defaultItem (copy), p17 (copy), buildItemsFromEntries (copy), orderedIdentifiers (copy), p16 (copy), p15 (copy), var23 (copy), p18 (copy), p21 (ref), fFlagSduiDeferredListItems (copy), var22 (copy), var24 (copy), fFlagSduiPoolBackedFeed (copy), var25 (copy)
				return buildItemsFromEntries(sduiListEntryNormalizerModule.normalizeLiteralItems(items, defaultItem, p17), orderedIdentifiers, nil, p16, p15, p17, var23, p18, p21, if fFlagSduiDeferredListItems then var22 else nil, var24, if fFlagSduiPoolBackedFeed then var25 else nil)
			end)
			
			if ok then
				return { data = status }
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `Failed to build ComponentList from literal source: {sduiParseHelpersModule.stringifyValue(status)}`,
				name = var23.name,
				componentType = var23.componentType,
				parserName = var23.parserName
			}, var23.appPage)
			
			return { data = {} }
		end, propResultCategory.PropSignal
	elseif fFlagSduiPoolBackedFeed and type == "pool" then
		return signalsModule.createComputed(function(p22)
			-- upvalues: p16 (ref), sduiListEntryNormalizerModule (copy), defaultItem (ref), itemOverrides (ref), p17 (ref), buildItemsFromEntries (copy), orderedIdentifiers (ref), p15 (ref), var23 (ref), p18 (ref), fFlagSduiDeferredListItems (copy), var22 (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy)
			local ok, status = pcall(function()
				-- upvalues: p16 (copy), p22 (ref), sduiListEntryNormalizerModule (copy), defaultItem (copy), itemOverrides (copy), p17 (copy), buildItemsFromEntries (copy), orderedIdentifiers (copy), p15 (copy), var23 (copy), p18 (copy), fFlagSduiDeferredListItems (copy), var22 (copy), sduiLoggerModule (copy), sduiErrorsModule (copy)
				local section = (p16(p22) or {})._section
				
				if typeof(section) ~= "table" then
					return {}
				end
				local cells = section.cells
				
				if typeof(cells) ~= "function" then
					return {}
				end
				local var29 = cells(p22)
				
				if #var29 == 0 then
					return {}
				end
				local t = {}
				local list = table.create(#var29, 0)
				
				for i, v in var29 do
					if v.item ~= nil then
						table.insert(t, v.item)
						list[i] = #t
					end
				end
				local var32, var33 = buildItemsFromEntries(sduiListEntryNormalizerModule.normalizeBoundData(t, defaultItem, itemOverrides, p17), orderedIdentifiers, nil, p16, p15, p17, var23, p18, p22, if fFlagSduiDeferredListItems then var22 else nil, nil, nil)
				
				if #var32 ~= #t then
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
						message = `Pool-backed ComponentList dropped {#t - #var32} of {#t} items;` .. " pool templates must resolve to valid templates and must not use is_component_filtered",
						name = var23.name,
						componentType = var23.componentType,
						parserName = var23.parserName
					}, var23.appPage)
				end
				local t_1 = {}
				
				for i_1, v_1 in var33 do
					t_1[v_1] = var32[i_1]
				end
				local t_2 = {}
				
				for i_2, v_2 in var29 do
					local var36 = list[i_2]
					
					if var36 == 0 then
						table.insert(t_2, { isBlank = true })
					else
						local var37 = t_1[var36]
						
						if var37 ~= nil then
							var37.realIndex = v_2.realIndex
							var37.spanOverride = v_2.spanOverride
							table.insert(t_2, var37)
						end
					end
				end
				return t_2
			end)
			
			if ok then
				return { data = status }
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `Failed to build ComponentList from pool source: {sduiParseHelpersModule.stringifyValue(status)}`,
				name = var23.name,
				componentType = var23.componentType,
				parserName = var23.parserName
			}, var23.appPage)
			
			return { data = {} }
		end), propResultCategory.PropSignal
	end
	error(`Unknown ComponentList source kind: {type}`)
end