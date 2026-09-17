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
local fFlagSduiPerSectionPoolSizing = require(parent.SharedFlags).FFlagSduiPerSectionPoolSizing
local propResultCategory = sduiClientBindingTypesModule.PropResultCategory

local function _(p1, p2)
	if p2 ~= nil then
		return true
	end
	for i, v in p1 do
		if v.sortRankProp ~= nil then
			return true
		end
	end
	return false
end

local function buildItemsFromEntries(p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14)
	-- upvalues: sduiListEntrySorterModule (ref), fFlagSduiPoolBackedFeed (ref), sduiPoolEntryHelpersModule (ref), fFlagSduiPerSectionPoolSizing (ref), sduiListEntryRendererModule (ref)
	if p5 ~= nil then
		local var1
		local var2 = p3
		
		if p4 == nil then
			for i, v in var2 do
				if v.sortRankProp ~= nil then
					var1 = true
				end
			end
			var1 = false
		else
			var1 = true
		end
		if var1 then
			p5 = nil
		end
	end
	local var3 = sduiListEntrySorterModule.applyOrder(p3, p4, p11, p7, p6, p8, p10)
	local var4 = nil
	local entryConfigExtrasFn = nil
	
	if fFlagSduiPoolBackedFeed then
		local var5 = sduiPoolEntryHelpersModule.computePoolSections(var3, if fFlagSduiPerSectionPoolSizing then p14 else nil)
		
		if p13 ~= nil or sduiPoolEntryHelpersModule.sectionsHaveMultiRow(var5) then
			local var6 = sduiPoolEntryHelpersModule.createPoolEntryFns(var5, p6, p7, p8, p9, if p13 ~= nil then nil else p13(p11), p14)
			var4 = var6.inputSlicer
			entryConfigExtrasFn = var6.entryConfigExtrasFn
		end
	end
	if not fFlagSduiPoolBackedFeed or var4 == nil then
		var4 = sduiListEntryRendererModule.createInputSlicer(p6, p7, p8, p9)
	end
	return sduiListEntryRendererModule.buildEntryConfigs(var3, var4, p5, p8, p9, p10, p7, p11, p12, if fFlagSduiPoolBackedFeed then entryConfigExtrasFn else nil)
end

return function(_, p15, p16, p17, p18, p19)
	-- upvalues: sduiLoggerModule (ref), sduiErrorsModule (ref), propResultCategory (ref), sduiListEntryRendererModule (ref), fFlagSduiPoolBackedFeed (ref), sduiPoolEntryHelpersModule (ref), sduiPropUtilsModule (ref), sduiListEntryNormalizerModule (ref), buildItemsFromEntries (ref), sduiParseHelpersModule (ref), signalsModule (ref)
	local source = p15 and p15.source
	local defaultItem = p15 and p15.default_item
	local orderedIdentifiers = p15 and p15.ordered_identifiers
	local itemOverrides = p15 and p15.item_overrides
	local deferItemBuild = p15 and p15.defer_item_build
	
	if source == nil then
		sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
			message = "ComponentList missing source",
			name = p18.debugName,
			componentType = p18.currentComponentType,
			parserName = p18.currentParserName
		}, p18.appPage)
		
		return function()
			return { data = {} }
		end, propResultCategory.PropSignal
	end
	local type = source.type
	local value = source.value
	local var7 = sduiListEntryRendererModule.captureErrorContext(p18)
	local var8 = nil
	local var9 = nil
	
	if fFlagSduiPoolBackedFeed then
		local poolConfig = p15 and p15.pool_config
		var8 = sduiPoolEntryHelpersModule.resolvePoolDataGetter(poolConfig and poolConfig.pool_path, p16, p18, p17)
		var9 = sduiPoolEntryHelpersModule.buildPoolEntryConfigs(poolConfig)
	end
	if type == "binding_path" then
		local var10 = nil
		
		return sduiPropUtilsModule.generateDynamicBindingPropValue(value, p16, p18, p17, function(p20, p21)
			-- upvalues: sduiListEntryNormalizerModule (copy), defaultItem (ref), itemOverrides (ref), p18 (ref), var10 (write), buildItemsFromEntries (copy), orderedIdentifiers (ref), p17 (ref), p16 (ref), var7 (ref), p19 (ref), deferItemBuild (ref), var8 (write), fFlagSduiPoolBackedFeed (copy), var9 (write)
			var10 = buildItemsFromEntries(sduiListEntryNormalizerModule.normalizeBoundData(p20, defaultItem, itemOverrides, p18), orderedIdentifiers, var10, p17, p16, p18, var7, p19, p21, deferItemBuild, var8, if fFlagSduiPoolBackedFeed then var9 else nil)
			
			return var10
		end), propResultCategory.PropSignal
	elseif type == "literal" then
		local items = value and value.items
		
		if items == nil then
			return function()
				return { data = {} }
			end, propResultCategory.PropSignal
		end
		return function(p20)
			-- upvalues: sduiListEntryNormalizerModule (copy), items (ref), defaultItem (ref), p18 (ref), buildItemsFromEntries (copy), orderedIdentifiers (ref), p17 (ref), p16 (ref), var7 (ref), p19 (ref), deferItemBuild (ref), var8 (write), fFlagSduiPoolBackedFeed (copy), var9 (write), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy)
			local ok, status = pcall(function()
				-- upvalues: sduiListEntryNormalizerModule (copy), items (copy), defaultItem (copy), p18 (copy), buildItemsFromEntries (copy), orderedIdentifiers (copy), p17 (copy), p16 (copy), var7 (copy), p19 (copy), p20 (ref), deferItemBuild (copy), var8 (copy), fFlagSduiPoolBackedFeed (copy), var9 (copy)
				return buildItemsFromEntries(sduiListEntryNormalizerModule.normalizeLiteralItems(items, defaultItem, p18), orderedIdentifiers, nil, p17, p16, p18, var7, p19, p20, deferItemBuild, var8, if fFlagSduiPoolBackedFeed then var9 else nil)
			end)
			
			if ok then
				return { data = status }
			end
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
				message = `Failed to build ComponentList from literal source: {sduiParseHelpersModule.stringifyValue(status)}`,
				name = var7.name,
				componentType = var7.componentType,
				parserName = var7.parserName
			}, var7.appPage)
			
			return { data = {} }
		end, propResultCategory.PropSignal
	elseif fFlagSduiPoolBackedFeed and type == "pool" then
		return signalsModule.createComputed(function(p20)
			-- upvalues: p17 (ref), sduiListEntryNormalizerModule (copy), defaultItem (ref), itemOverrides (ref), p18 (ref), buildItemsFromEntries (copy), orderedIdentifiers (ref), p16 (ref), var7 (ref), p19 (ref), deferItemBuild (ref), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy)
			local ok, status = pcall(function()
				-- upvalues: p17 (copy), p20 (ref), sduiListEntryNormalizerModule (copy), defaultItem (copy), itemOverrides (copy), p18 (copy), buildItemsFromEntries (copy), orderedIdentifiers (copy), p16 (copy), var7 (copy), p19 (copy), deferItemBuild (copy), sduiLoggerModule (copy), sduiErrorsModule (copy)
				local section = (p17(p20) or {})._section
				
				if typeof(section) ~= "table" then
					return {}
				end
				local cells = section.cells
				
				if typeof(cells) ~= "function" then
					return {}
				end
				local var11 = cells(p20)
				
				if #var11 == 0 then
					return {}
				end
				local t = {}
				local list = table.create(#var11, 0)
				
				for i, v in var11 do
					if v.item ~= nil then
						table.insert(t, v.item)
						list[i] = #t
					end
				end
				local var12, var13 = buildItemsFromEntries(sduiListEntryNormalizerModule.normalizeBoundData(t, defaultItem, itemOverrides, p18), orderedIdentifiers, nil, p17, p16, p18, var7, p19, p20, deferItemBuild, nil, nil)
				
				if #var12 ~= #t then
					sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.FailedToParseProp, {
						message = `Pool-backed ComponentList dropped {#t - #var12} of {#t} items;` .. " pool templates must resolve to valid templates and must not use is_component_filtered",
						name = var7.name,
						componentType = var7.componentType,
						parserName = var7.parserName
					}, var7.appPage)
				end
				local t_1 = {}
				
				for i_1, v_1 in var13 do
					t_1[v_1] = var12[i_1]
				end
				local t_2 = {}
				
				for i_2, v_2 in var11 do
					local var14 = list[i_2]
					
					if var14 == 0 then
						table.insert(t_2, { isBlank = true })
					else
						local var15 = t_1[var14]
						
						if var15 ~= nil then
							var15.realIndex = v_2.realIndex
							var15.spanOverride = v_2.spanOverride
							table.insert(t_2, var15)
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
				name = var7.name,
				componentType = var7.componentType,
				parserName = var7.parserName
			}, var7.appPage)
			
			return { data = {} }
		end), propResultCategory.PropSignal
	end
	error(`Unknown ComponentList source kind: {type}`)
end