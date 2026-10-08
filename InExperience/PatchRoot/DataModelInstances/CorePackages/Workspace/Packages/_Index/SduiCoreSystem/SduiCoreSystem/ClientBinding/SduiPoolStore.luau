local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local signalsModule = require(parent.Signals)
local collectionViewsModule = require(parent.CollectionViews)
local sduiErrorsModule = require(sduiCoreSystem.SduiErrors)
local sduiLoggerModule = require(sduiCoreSystem.SduiLogger)
local sduiParseHelpersModule = require(sduiCoreSystem.SduiParseHelpers)
local _ = require(sduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local sduiPoolStoreLayoutModule = require(sduiCoreSystem.ClientBinding.SduiPoolStoreLayout)
local getMainCollectionLayoutStore = collectionViewsModule.getMainCollectionLayoutStore
local processOneGrid = collectionViewsModule.processOneGrid
local makePoolGetSpanConfig = sduiPoolStoreLayoutModule.makePoolGetSpanConfig
local layoutToCells = sduiPoolStoreLayoutModule.layoutToCells
local cellsEqual = sduiPoolStoreLayoutModule.cellsEqual
local EMPTY_CELLS = sduiPoolStoreLayoutModule.EMPTY_CELLS
local fFlagLuaAppEnableNxMRoduxApportioning = require(parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning
local fFlagSduiCollectionGridRevealRows = require(parent.SharedFlags).FFlagSduiCollectionGridRevealRows
local fFlagSduiSkipFeedAnalyticsPosition = require(parent.SharedFlags).FFlagSduiSkipFeedAnalyticsPosition
local fFlagSduiPerSectionPoolSizing = require(parent.SharedFlags).FFlagSduiPerSectionPoolSizing
local fFlagSduiVerticalFeedProgressiveFillOnScroll = require(parent.SharedFlags).FFlagSduiVerticalFeedProgressiveFillOnScroll
local fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui = require(parent.SharedFlags).FFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui
local frozen = table.freeze({})

local function logSkipped(p1, p2, p3)
	-- upvalues: sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref)
	local onSkipped = p2 and p2.onSkipped
	local oneByTwoTileFlowId = p1 and p1.oneByTwoTileFlowId
	
	if onSkipped and p1 and typeof(oneByTwoTileFlowId) == "string" then
		local ok, status = pcall(function()
			-- upvalues: onSkipped (ref), oneByTwoTileFlowId (ref), p1 (ref)
			onSkipped({
				componentType = "OneByTwoTile",
				isSdui = true,
				oneByTwoTileFlowId = oneByTwoTileFlowId,
				contentType = p1.contentType,
				adId = p1.adId
			})
			
			return nil
		end)
		
		if not ok then
			sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.CodeError, {
				name = "OneByTwoTileSkipped",
				message = sduiParseHelpersModule.stringifyValue(status)
			}, p3)
		end
	end
end

local function sectionConfigsEqual(p1, p2)
	-- upvalues: fFlagSduiSkipFeedAnalyticsPosition (ref), fFlagSduiPerSectionPoolSizing (ref)
	if p1 == p2 then
		return true
	elseif p1 == nil or p2 == nil then
		return false
	end
	local var1 = false
	
	if p1.poolId == p2.poolId then
		var1 = false
		
		if p1.numberOfRows == p2.numberOfRows then
			if fFlagSduiSkipFeedAnalyticsPosition then
				var1 = p1.doesNotAdvanceStartRow == p2.doesNotAdvanceStartRow
				var1 = nil
			else
				var1 = true
			end
			if var1 then
				if fFlagSduiPerSectionPoolSizing then
					var1 = p1.entryCollectionItemSize == p2.entryCollectionItemSize
					var1 = nil
				else
					var1 = true
				end
				if var1 then
					if fFlagSduiPerSectionPoolSizing then
						var1 = p1.templateCollectionItemSize == p2.templateCollectionItemSize
						var1 = nil
					else
						var1 = true
					end
					var1 = var1 and (p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId)
				end
			end
		end
	end
	return var1
end

local function _(p1, p2, p3)
	local collectionItemSize = p2.collectionItemSize
	
	if typeof(collectionItemSize) == "string" and p1.getItemsPerRow[collectionItemSize] ~= nil then
		return collectionItemSize
	end
	local entryCollectionItemSize = p3.entryCollectionItemSize
	
	if typeof(entryCollectionItemSize) == "string" and p1.getItemsPerRow[entryCollectionItemSize] ~= nil then
		return entryCollectionItemSize
	end
	local templateCollectionItemSize = p3.templateCollectionItemSize
	
	return if typeof(templateCollectionItemSize) == "string" and p1.getItemsPerRow[templateCollectionItemSize] ~= nil then templateCollectionItemSize else "Medium"
end

local function createSduiPoolStore(p1)
	-- upvalues: fFlagSduiCollectionGridRevealRows (ref), signalsModule (ref), sectionConfigsEqual (ref), getMainCollectionLayoutStore (ref), fFlagSduiPerSectionPoolSizing (ref), frozen (ref), EMPTY_CELLS (ref), makePoolGetSpanConfig (ref), processOneGrid (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), layoutToCells (ref), fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (ref), sduiLoggerModule (ref), sduiErrorsModule (ref), sduiParseHelpersModule (ref), logSkipped (ref), fFlagSduiSkipFeedAnalyticsPosition (ref), cellsEqual (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (ref)
	local t = {}
	local t_1 = {}
	local var1 = if fFlagSduiCollectionGridRevealRows then {} else nil
	local t_2 = {}
	local t_3 = {}
	local var2 = if fFlagSduiCollectionGridRevealRows then {} else nil
	local t_4 = {}
	local t_5 = {}
	local var3, var4 = signalsModule.createSignal(nil)
	local var5 = nil
	
	local function _(value)
		-- upvalues: t (ref), signalsModule (copy)
		local var6 = t[value]
		
		if var6 == nil then
			local var7, var8 = signalsModule.createSignal(nil)
			var6 = { get = var7, set = var8 }
			t[value] = var6
		end
		return var6
	end
	
	local _ = function(value)
		-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
		local var6 = t_1[value]
		
		if var6 == nil then
			local var7, var8 = signalsModule.createSignal(nil, sectionConfigsEqual)
			var6 = { get = var7, set = var8 }
			t_1[value] = var6
		end
		return var6
	end
	
	local var6 = if fFlagSduiCollectionGridRevealRows then function(p2)
		-- upvalues: var1 (ref), signalsModule (copy)
		local var7 = var1[p2]
		
		if var7 == nil then
			local var8, var9 = signalsModule.createSignal(nil)
			var7 = { get = var8, set = var9 }
			var1[p2] = var7
		end
		return var7
	end else nil
	local _ = nil
	
	local var7 = function(p2)
		-- upvalues: t_2 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t (ref), var3 (ref), getMainCollectionLayoutStore (copy), fFlagSduiPerSectionPoolSizing (copy), frozen (copy), var7 (write), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy), fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (copy), var5 (write), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), p1 (ref), logSkipped (copy)
		local var8 = t_2[p2]
		
		if var8 == nil then
			local var9 = signalsModule.createComputed(function(p3)
				-- upvalues: p2 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t (copy), var3 (copy), getMainCollectionLayoutStore (copy), fFlagSduiPerSectionPoolSizing (copy), frozen (copy), var7 (copy), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy), fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (copy), var5 (copy), sduiLoggerModule (copy), sduiErrorsModule (copy), sduiParseHelpersModule (copy), p1 (copy), logSkipped (copy)
				local var10 = t_1[p2]
				
				if var10 == nil then
					local var11, var12 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var10 = { get = var11, set = var12 }
					t_1[p2] = var10
				end
				local var13 = var10.get(p3)
				
				if var13 == nil or var13.poolId == nil then
					return nil
				end
				local poolId = var13.poolId
				local var14 = t[poolId]
				
				if var14 == nil then
					local var15, var16 = signalsModule.createSignal(nil)
					var14 = { get = var15, set = var16 }
					t[poolId] = var14
				end
				local var17 = var14.get(p3)
				
				if var17 == nil or #var17.items == 0 then
					return nil
				end
				local collectionItemSize, var18, entryCollectionItemSize, templateCollectionItemSize
				local var19 = var3(p3) or getMainCollectionLayoutStore(p3)
				local _ = nil
				
				if fFlagSduiPerSectionPoolSizing then
					collectionItemSize = var17.collectionItemSize
					
					if typeof(collectionItemSize) == "string" and var19.getItemsPerRow[collectionItemSize] ~= nil then
						var18 = collectionItemSize
					else
						entryCollectionItemSize = var13.entryCollectionItemSize
						
						if typeof(entryCollectionItemSize) == "string" and var19.getItemsPerRow[entryCollectionItemSize] ~= nil then
							var18 = entryCollectionItemSize
						else
							templateCollectionItemSize = var13.templateCollectionItemSize
							var18 = if typeof(templateCollectionItemSize) == "string" and var19.getItemsPerRow[templateCollectionItemSize] ~= nil then templateCollectionItemSize else "Medium"
						end
					end
				var18 = if typeof(var17.collectionItemSize) == "string" and var19.getItemsPerRow[var17.collectionItemSize] ~= nil then var17.collectionItemSize else "Medium"
				collectionItemSize = var19.getItemsPerRow[var18](p3)
				
				if collectionItemSize <= 0 then
					return nil
				end
				entryCollectionItemSize = 1
				templateCollectionItemSize = frozen
				
				if var13.prevSectionInPoolId ~= nil then
					local var20 = var7(var13.prevSectionInPoolId)(p3)
					
					if var20 == nil then
						return nil
					end
					entryCollectionItemSize = var20.nextStartIndex
					templateCollectionItemSize = var20.pendingSpanTiles
				end
				local numberOfRows = var13.numberOfRows
				
				if numberOfRows <= 0 then
					numberOfRows = 1e999
				end
				if var17.layouts == nil and #templateCollectionItemSize == 0 then
					local maxValue = math.max(0, #var17.items - entryCollectionItemSize + 1)
					local minValue = math.min(if numberOfRows == 1e999 then maxValue else numberOfRows * collectionItemSize, maxValue)
					
					if minValue == 0 then
						return {
							actualRowCount = 0,
							cells = EMPTY_CELLS,
							nextStartIndex = entryCollectionItemSize,
							pendingSpanTiles = frozen
						}
					end
					local ceiled = math.ceil(minValue / collectionItemSize)
					local t_2 = {}
					
					for i = 0, minValue - 1 do
						local var21 = entryCollectionItemSize + i
						t_2[i + 1] = { item = var17.items[var21], realIndex = var21 }
					end
					for i_1 = minValue + 1, ceiled * collectionItemSize do
						t_2[i_1] = {}
					end
					return {
						cells = t_2,
						actualRowCount = ceiled,
						nextStartIndex = entryCollectionItemSize + minValue,
						pendingSpanTiles = frozen
					}
				else
					local var22 = processOneGrid(var17.items, entryCollectionItemSize, templateCollectionItemSize, collectionItemSize, numberOfRows, if var17.layouts ~= nil then nil else makePoolGetSpanConfig(var17.layouts), not fFlagLuaAppEnableNxMRoduxApportioning)
					local var23, var24 = layoutToCells(var22.layout, collectionItemSize, var17.items, var17.layouts)
					
					if fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then
						local onPlaced = var5 and var5.onPlaced
						
						for i_2, v in var23 do
							local item = v.item
							local oneByTwoTileFlowId = item and item.oneByTwoTileFlowId
							
							if onPlaced and item and typeof(oneByTwoTileFlowId) == "string" then
								local ok, status = pcall(function()
									-- upvalues: onPlaced (ref), oneByTwoTileFlowId (ref), item (ref), i_2 (ref), collectionItemSize (ref)
									onPlaced({
										componentType = "OneByTwoTile",
										isSdui = true,
										oneByTwoTileFlowId = oneByTwoTileFlowId,
										contentType = item.contentType,
										adId = item.adId,
										gridRow = math.ceil(i_2 / collectionItemSize),
										gridCol = (i_2 - 1) % collectionItemSize + 1
									})
									
									return nil
								end)
								
								if not ok then
									sduiLoggerModule.reportError(sduiErrorsModule.SduiErrorType.CodeError, {
										name = "OneByTwoTilePlaced",
										message = sduiParseHelpersModule.stringifyValue(status)
									}, p1)
								end
							end
						end
						local v_3
						local var25 = false
						
						for i_3, v_1 in t_1 do
							if i_3 ~= p2 then
								v_3 = v_1.get(false)
								
								if v_3 and v_3.prevSectionInPoolId == p2 then
									var25 = true
									break
								end
							end
						end
						if not var25 then
							for i_3, v_2 in var22.pendingSpanTiles do
								logSkipped(var17.items[v_2.index], var5, p1)
							end
							local t_2 = {}
							
							for i_5, v_3 in var23 do
								local item = v_3.item
								local oneByTwoTileFlowId = item and item.oneByTwoTileFlowId
								
								if typeof(oneByTwoTileFlowId) == "string" then
									t_2[oneByTwoTileFlowId] = true
								end
							end
							for i_3 = var22.nextStartIndex, #var17.items do
								local var26 = var17.items[i_3]
								v_3 = var26 and var26.oneByTwoTileFlowId
								
								if typeof(v_3) == "string" and not t_2[v_3] then
									logSkipped(var26, var5, p1)
								end
							end
						end
					end
					return {
						cells = var23,
						actualRowCount = var24,
						nextStartIndex = var22.nextStartIndex,
						pendingSpanTiles = var22.pendingSpanTiles
					}
				end
			end)
			t_2[p2] = var9
			
			return var9
		end
		return var8
	end
	
	local function getRowCountComputed(p4)
		-- upvalues: t_3 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var7 (write)
		local var27 = t_3[p4]
		
		if var27 == nil then
			local var28 = signalsModule.createComputed(function(p5)
				-- upvalues: p4 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var7 (copy)
				local var29 = t_1[p4]
				
				if var29 == nil then
					local var30, var31 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var29 = { get = var30, set = var31 }
					t_1[p4] = var29
				end
				local var32 = var29.get(p5)
				
				if var32 == nil then
					return 0
				elseif var32.poolId == nil or var32.numberOfRows > 0 then
					return var32.numberOfRows
				end
				local var33 = var7(p4)(p5)
				
				return if var33 == nil then 0 else var33.actualRowCount
			end)
			t_3[p4] = var28
			
			return var28
		end
		return var27
	end
	
	local _ = function(p4)
		-- upvalues: var2 (ref), signalsModule (copy), t_3 (ref), t_1 (ref), sectionConfigsEqual (copy), var7 (write), var6 (write)
		local var27 = var2[p4]
		
		if var27 == nil then
			local var28 = signalsModule.createComputed(function(p5)
				-- upvalues: p4 (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var7 (copy), var6 (copy)
				local var29
				local var30 = t_3[p4]
				
				if var30 == nil then
					local var31 = signalsModule.createComputed(function(p6)
						-- upvalues: p4 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var7 (copy)
						local var32 = t_1[p4]
						
						if var32 == nil then
							local var33, var34 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var32 = { get = var33, set = var34 }
							t_1[p4] = var32
						end
						local var35 = var32.get(p6)
						
						if var35 == nil then
							return 0
						elseif var35.poolId == nil or var35.numberOfRows > 0 then
							return var35.numberOfRows
						end
						local var36 = var7(p4)(p6)
						
						return if var36 == nil then 0 else var36.actualRowCount
					end)
					t_3[p4] = var31
					var29 = var31
				else
					var29 = var30
				end
				var29 = var29(p5)
				local var32 = var6(p4).get(p5)
				
				return if var32 == nil then var29 else math.min(math.max(math.floor(var32), 0), var29)
			end)
			var2[p4] = var28
			
			return var28
		end
		return var27
	end
	
	local _ = nil
	
	local var27 = function(p4)
		-- upvalues: t_4 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var27 (write), fFlagSduiSkipFeedAnalyticsPosition (copy), fFlagSduiCollectionGridRevealRows (copy), var2 (ref), t_3 (ref), var7 (write), var6 (write)
		local var28 = t_4[p4]
		
		if var28 == nil then
			local var29 = signalsModule.createComputed(function(p5)
				-- upvalues: p4 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var27 (copy), fFlagSduiSkipFeedAnalyticsPosition (copy), fFlagSduiCollectionGridRevealRows (copy), var2 (copy), t_3 (copy), var7 (copy), var6 (copy)
				local var30 = t_1[p4]
				
				if var30 == nil then
					local var31, var32 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var30 = { get = var31, set = var32 }
					t_1[p4] = var30
				end
				local var33 = var30.get(p5)
				
				if var33 == nil or var33.prevSectionId == nil then
					return 1
				end
				local var34
				local var35 = var27(var33.prevSectionId)(p5)
				
				if fFlagSduiSkipFeedAnalyticsPosition then
					local prevSectionId = var33.prevSectionId
					local var36 = t_1[prevSectionId]
					
					if var36 == nil then
						local var37, var38 = signalsModule.createSignal(nil, sectionConfigsEqual)
						var36 = { get = var37, set = var38 }
						t_1[prevSectionId] = var36
					end
					var34 = var36.get(p5)
				else
					var34 = nil
				end
				local var39
				if fFlagSduiSkipFeedAnalyticsPosition and var34 ~= nil and var34.doesNotAdvanceStartRow then
					var39 = 0
				elseif fFlagSduiCollectionGridRevealRows then
					local prevSectionId = var33.prevSectionId
					local var40 = var2[prevSectionId]
					
					if var40 == nil then
						local var41 = signalsModule.createComputed(function(p6)
							-- upvalues: prevSectionId (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var7 (copy), var6 (copy)
							local var42
							local var43 = t_3[prevSectionId]
							
							if var43 == nil then
								local var44 = signalsModule.createComputed(function(p7)
									-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var7 (copy)
									local var45 = t_1[prevSectionId]
									
									if var45 == nil then
										local var46, var47 = signalsModule.createSignal(nil, sectionConfigsEqual)
										var45 = { get = var46, set = var47 }
										t_1[prevSectionId] = var45
									end
									local var48 = var45.get(p7)
									
									if var48 == nil then
										return 0
									elseif var48.poolId == nil or var48.numberOfRows > 0 then
										return var48.numberOfRows
									end
									local var49 = var7(prevSectionId)(p7)
									
									return if var49 == nil then 0 else var49.actualRowCount
								end)
								t_3[prevSectionId] = var44
								var42 = var44
							else
								var42 = var43
							end
							var42 = var42(p6)
							local var45 = var6(prevSectionId).get(p6)
							
							return if var45 == nil then var42 else math.min(math.max(math.floor(var45), 0), var42)
						end)
						var2[prevSectionId] = var41
						var39 = var41
					else
						var39 = var40
					end
					var39 = var39(p5)
				else
					local prevSectionId = var33.prevSectionId
					local var42 = t_3[prevSectionId]
					
					if var42 == nil then
						local var43 = signalsModule.createComputed(function(p6)
							-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var7 (copy)
							local var44 = t_1[prevSectionId]
							
							if var44 == nil then
								local var45, var46 = signalsModule.createSignal(nil, sectionConfigsEqual)
								var44 = { get = var45, set = var46 }
								t_1[prevSectionId] = var44
							end
							local var47 = var44.get(p6)
							
							if var47 == nil then
								return 0
							elseif var47.poolId == nil or var47.numberOfRows > 0 then
								return var47.numberOfRows
							end
							local var48 = var7(prevSectionId)(p6)
							
							return if var48 == nil then 0 else var48.actualRowCount
						end)
						t_3[prevSectionId] = var43
						var39 = var43
					else
						var39 = var42
					end
					var39 = var39(p5)
				end
				return var35 + var39
			end)
			t_4[p4] = var29
			
			return var29
		end
		return var28
	end
	
	return {
		getSectionInfo = function(p4)
			-- upvalues: signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t_5 (ref), var7 (write), EMPTY_CELLS (copy), cellsEqual (copy), var27 (write), t_3 (ref)
			return signalsModule.createComputed(function(p5)
				-- upvalues: p4 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t_5 (copy), var7 (copy), EMPTY_CELLS (copy), cellsEqual (copy), var27 (copy), t_3 (copy)
				local var28 = t_1[p4]
				
				if var28 == nil then
					local var29, var30 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var28 = { get = var29, set = var30 }
					t_1[p4] = var28
				end
				if var28.get(p5) == nil then
					return nil
				end
				local var31
				local t = {}
				local var32 = t_5[p4]
				
				if var32 == nil then
					local var33 = signalsModule.createComputed(function(p6)
						-- upvalues: var7 (copy), p4 (ref), EMPTY_CELLS (copy)
						local var34 = var7(p4)(p6)
						
						return if var34 == nil then EMPTY_CELLS else var34.cells
					end, cellsEqual)
					t_5[p4] = var33
					var31 = var33
				else
					var31 = var32
				end
				local var34
				t.cells = var31(p5)
				t.startRow = var27(p4)(p5)
				local var35 = t_3[p4]
				
				if var35 == nil then
					local var36 = signalsModule.createComputed(function(p6)
						-- upvalues: p4 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var7 (copy)
						local var37 = t_1[p4]
						
						if var37 == nil then
							local var38, var39 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var37 = { get = var38, set = var39 }
							t_1[p4] = var37
						end
						local var40 = var37.get(p6)
						
						if var40 == nil then
							return 0
						elseif var40.poolId == nil or var40.numberOfRows > 0 then
							return var40.numberOfRows
						end
						local var41 = var7(p4)(p6)
						
						return if var41 == nil then 0 else var41.actualRowCount
					end)
					t_3[p4] = var36
					var34 = var36
				else
					var34 = var35
				end
				t.actualRowCount = var34(p5)
				
				return t
			end)
		end,
		getSectionStartRow = var27,
		getSectionRowCount = if fFlagSduiVerticalFeedProgressiveFillOnScroll then getRowCountComputed else nil,
		getSectionCells = function(p4)
			-- upvalues: t_5 (ref), signalsModule (copy), var7 (write), EMPTY_CELLS (copy), cellsEqual (copy)
			local var28 = t_5[p4]
			
			if var28 == nil then
				local var29 = signalsModule.createComputed(function(p5)
					-- upvalues: var7 (copy), p4 (ref), EMPTY_CELLS (copy)
					local var30 = var7(p4)(p5)
					
					return if var30 == nil then EMPTY_CELLS else var30.cells
				end, cellsEqual)
				t_5[p4] = var29
				
				return var29
			end
			return var28
		end,
		setSectionDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then function(p4, p5)
			-- upvalues: var6 (write)
			var6(p4).set(p5)
		end else nil,
		setPools = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			for i, v in value do
				local var28 = t[i]
				
				if var28 == nil then
					local var29, var30 = signalsModule.createSignal(nil)
					var28 = { get = var29, set = var30 }
					t[i] = var28
				end
				var28.set(v)
			end
		end,
		setSections = function(value)
			-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy), fFlagSduiSkipFeedAnalyticsPosition (copy)
			local t = {}
			local var31 = nil
			
			for i, v in value do
				local sectionId = v.sectionId
				local poolId = v.poolId
				local var32 = nil
				
				if poolId ~= nil then
					var32 = t[poolId]
					t[poolId] = sectionId
				end
				local var33 = t_1[sectionId]
				
				if var33 == nil then
					local var34, var35 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var33 = { get = var34, set = var35 }
					t_1[sectionId] = var33
				end
				var33.set({
					poolId = poolId,
					numberOfRows = v.numberOfRows,
					doesNotAdvanceStartRow = if fFlagSduiSkipFeedAnalyticsPosition then v.doesNotAdvanceStartRow else nil,
					entryCollectionItemSize = v.entryCollectionItemSize,
					templateCollectionItemSize = v.templateCollectionItemSize,
					prevSectionInPoolId = var32,
					prevSectionId = var31
				})
				var31 = sectionId
			end
		end,
		setLayoutStore = function(value)
			-- upvalues: var4 (ref)
			var4(value)
		end,
		setOneByTwoTileFunnelListener = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then function(p4)
			-- upvalues: var5 (write)
			var5 = p4
		end else nil
	}
end

local tbl = setmetatable({}, { __mode = "v" })

return {
	getSduiPoolStore = function(p4)
		-- upvalues: tbl (ref), fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui (ref), createSduiPoolStore (ref)
		local var31 = tbl[p4]
		
		if var31 == nil then
			local var32 = if fFlagLuaAppEnableOneByTwoTileFunnelTelemetrySdui then createSduiPoolStore(p4) else createSduiPoolStore()
			tbl[p4] = var32
			
			return var32
		end
		return var31
	end
}