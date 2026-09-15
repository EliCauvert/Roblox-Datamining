local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local signalsModule = require(parent.Signals)
local collectionViewsModule = require(parent.CollectionViews)
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
local fFlagSduiPerSectionPoolSizing = require(parent.SharedFlags).FFlagSduiPerSectionPoolSizing
local fFlagSduiVerticalFeedProgressiveFillOnScroll = require(parent.SharedFlags).FFlagSduiVerticalFeedProgressiveFillOnScroll
local frozen = table.freeze({})

local function sectionConfigsEqual(p1, p2)
	-- upvalues: fFlagSduiPerSectionPoolSizing (ref)
	if p1 == p2 then
		return true
	elseif p1 == nil or p2 == nil then
		return false
	end
	local var1 = false
	
	if p1.poolId == p2.poolId then
		var1 = false
		
		if p1.numberOfRows == p2.numberOfRows then
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

local function createSduiPoolStore()
	-- upvalues: fFlagSduiCollectionGridRevealRows (ref), signalsModule (ref), sectionConfigsEqual (ref), getMainCollectionLayoutStore (ref), fFlagSduiPerSectionPoolSizing (ref), frozen (ref), EMPTY_CELLS (ref), makePoolGetSpanConfig (ref), processOneGrid (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), layoutToCells (ref), cellsEqual (ref), fFlagSduiVerticalFeedProgressiveFillOnScroll (ref)
	local t = {}
	local t_1 = {}
	local var1 = if fFlagSduiCollectionGridRevealRows then {} else nil
	local t_2 = {}
	local t_3 = {}
	local var2 = if fFlagSduiCollectionGridRevealRows then {} else nil
	local t_4 = {}
	local t_5 = {}
	local var3, var4 = signalsModule.createSignal(nil)
	
	local function _(value)
		-- upvalues: t (ref), signalsModule (copy)
		local var5 = t[value]
		
		if var5 == nil then
			local var6, var7 = signalsModule.createSignal(nil)
			var5 = { get = var6, set = var7 }
			t[value] = var5
		end
		return var5
	end
	
	local _ = function(value)
		-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
		local var5 = t_1[value]
		
		if var5 == nil then
			local var6, var7 = signalsModule.createSignal(nil, sectionConfigsEqual)
			var5 = { get = var6, set = var7 }
			t_1[value] = var5
		end
		return var5
	end
	
	local var5 = if fFlagSduiCollectionGridRevealRows then function(p1)
		-- upvalues: var1 (ref), signalsModule (copy)
		local var6 = var1[p1]
		
		if var6 == nil then
			local var7, var8 = signalsModule.createSignal(nil)
			var6 = { get = var7, set = var8 }
			var1[p1] = var6
		end
		return var6
	end else nil
	local _ = nil
	
	local var6 = function(p1)
		-- upvalues: t_2 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t (ref), var3 (ref), getMainCollectionLayoutStore (copy), fFlagSduiPerSectionPoolSizing (copy), frozen (copy), var6 (write), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
		local var7 = t_2[p1]
		
		if var7 == nil then
			local var8 = signalsModule.createComputed(function(p2)
				-- upvalues: p1 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t (copy), var3 (copy), getMainCollectionLayoutStore (copy), fFlagSduiPerSectionPoolSizing (copy), frozen (copy), var6 (copy), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
				local var9 = t_1[p1]
				
				if var9 == nil then
					local var10, var11 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var9 = { get = var10, set = var11 }
					t_1[p1] = var9
				end
				local var12 = var9.get(p2)
				
				if var12 == nil or var12.poolId == nil then
					return nil
				end
				local poolId = var12.poolId
				local var13 = t[poolId]
				
				if var13 == nil then
					local var14, var15 = signalsModule.createSignal(nil)
					var13 = { get = var14, set = var15 }
					t[poolId] = var13
				end
				local var16 = var13.get(p2)
				
				if var16 == nil or #var16.items == 0 then
					return nil
				end
				local collectionItemSize, var17, entryCollectionItemSize, templateCollectionItemSize
				local var18 = var3(p2) or getMainCollectionLayoutStore(p2)
				local _ = nil
				
				if fFlagSduiPerSectionPoolSizing then
					collectionItemSize = var16.collectionItemSize
					
					if typeof(collectionItemSize) == "string" and var18.getItemsPerRow[collectionItemSize] ~= nil then
						var17 = collectionItemSize
					else
						entryCollectionItemSize = var12.entryCollectionItemSize
						
						if typeof(entryCollectionItemSize) == "string" and var18.getItemsPerRow[entryCollectionItemSize] ~= nil then
							var17 = entryCollectionItemSize
						else
							templateCollectionItemSize = var12.templateCollectionItemSize
							var17 = if typeof(templateCollectionItemSize) == "string" and var18.getItemsPerRow[templateCollectionItemSize] ~= nil then templateCollectionItemSize else "Medium"
						end
					end
				var17 = if typeof(var16.collectionItemSize) == "string" and var18.getItemsPerRow[var16.collectionItemSize] ~= nil then var16.collectionItemSize else "Medium"
				collectionItemSize = var18.getItemsPerRow[var17](p2)
				
				if collectionItemSize <= 0 then
					return nil
				end
				entryCollectionItemSize = 1
				templateCollectionItemSize = frozen
				
				if var12.prevSectionInPoolId ~= nil then
					local var19 = var6(var12.prevSectionInPoolId)(p2)
					
					if var19 == nil then
						return nil
					end
					entryCollectionItemSize = var19.nextStartIndex
					templateCollectionItemSize = var19.pendingSpanTiles
				end
				local numberOfRows = var12.numberOfRows
				
				if numberOfRows <= 0 then
					numberOfRows = 1e999
				end
				if var16.layouts ~= nil or #templateCollectionItemSize ~= 0 then
					local var20 = processOneGrid(var16.items, entryCollectionItemSize, templateCollectionItemSize, collectionItemSize, numberOfRows, if var16.layouts ~= nil then nil else makePoolGetSpanConfig(var16.layouts), not fFlagLuaAppEnableNxMRoduxApportioning)
					local var21, var22 = layoutToCells(var20.layout, collectionItemSize, var16.items, var16.layouts)
					
					return {
						cells = var21,
						actualRowCount = var22,
						nextStartIndex = var20.nextStartIndex,
						pendingSpanTiles = var20.pendingSpanTiles
					}
				end
				local maxValue = math.max(0, #var16.items - entryCollectionItemSize + 1)
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
					local var23 = entryCollectionItemSize + i
					t_2[i + 1] = { item = var16.items[var23], realIndex = var23 }
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
			end)
			t_2[p1] = var8
			
			return var8
		end
		return var7
	end
	
	local function getRowCountComputed(p3)
		-- upvalues: t_3 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var6 (write)
		local var24 = t_3[p3]
		
		if var24 == nil then
			local var25 = signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
				local var26 = t_1[p3]
				
				if var26 == nil then
					local var27, var28 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var26 = { get = var27, set = var28 }
					t_1[p3] = var26
				end
				local var29 = var26.get(p4)
				
				if var29 == nil then
					return 0
				elseif var29.poolId == nil or var29.numberOfRows > 0 then
					return var29.numberOfRows
				end
				local var30 = var6(p3)(p4)
				
				return if var30 == nil then 0 else var30.actualRowCount
			end)
			t_3[p3] = var25
			
			return var25
		end
		return var24
	end
	
	local _ = function(p3)
		-- upvalues: var2 (ref), signalsModule (copy), t_3 (ref), t_1 (ref), sectionConfigsEqual (copy), var6 (write), var5 (write)
		local var24 = var2[p3]
		
		if var24 == nil then
			local var25 = signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var6 (copy), var5 (copy)
				local var26
				local var27 = t_3[p3]
				
				if var27 == nil then
					local var28 = signalsModule.createComputed(function(p5)
						-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
						local var29 = t_1[p3]
						
						if var29 == nil then
							local var30, var31 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var29 = { get = var30, set = var31 }
							t_1[p3] = var29
						end
						local var32 = var29.get(p5)
						
						if var32 == nil then
							return 0
						elseif var32.poolId == nil or var32.numberOfRows > 0 then
							return var32.numberOfRows
						end
						local var33 = var6(p3)(p5)
						
						return if var33 == nil then 0 else var33.actualRowCount
					end)
					t_3[p3] = var28
					var26 = var28
				else
					var26 = var27
				end
				var26 = var26(p4)
				local var29 = var5(p3).get(p4)
				
				return if var29 == nil then var26 else math.min(math.max(math.floor(var29), 0), var26)
			end)
			var2[p3] = var25
			
			return var25
		end
		return var24
	end
	
	local _ = nil
	
	local var24 = function(p3)
		-- upvalues: t_4 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var24 (write), fFlagSduiCollectionGridRevealRows (copy), var2 (ref), t_3 (ref), var6 (write), var5 (write)
		local var25 = t_4[p3]
		
		if var25 == nil then
			local var26 = signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var24 (copy), fFlagSduiCollectionGridRevealRows (copy), var2 (copy), t_3 (copy), var6 (copy), var5 (copy)
				local var27 = t_1[p3]
				
				if var27 == nil then
					local var28, var29 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var27 = { get = var28, set = var29 }
					t_1[p3] = var27
				end
				local var30 = var27.get(p4)
				
				if var30 == nil or var30.prevSectionId == nil then
					return 1
				end
				local var31
				local var32 = var24(var30.prevSectionId)(p4)
				
				if fFlagSduiCollectionGridRevealRows then
					local prevSectionId = var30.prevSectionId
					local var33 = var2[prevSectionId]
					
					if var33 == nil then
						local var34 = signalsModule.createComputed(function(p5)
							-- upvalues: prevSectionId (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var6 (copy), var5 (copy)
							local var35
							local var36 = t_3[prevSectionId]
							
							if var36 == nil then
								local var37 = signalsModule.createComputed(function(p6)
									-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
									local var38 = t_1[prevSectionId]
									
									if var38 == nil then
										local var39, var40 = signalsModule.createSignal(nil, sectionConfigsEqual)
										var38 = { get = var39, set = var40 }
										t_1[prevSectionId] = var38
									end
									local var41 = var38.get(p6)
									
									if var41 == nil then
										return 0
									elseif var41.poolId == nil or var41.numberOfRows > 0 then
										return var41.numberOfRows
									end
									local var42 = var6(prevSectionId)(p6)
									
									return if var42 == nil then 0 else var42.actualRowCount
								end)
								t_3[prevSectionId] = var37
								var35 = var37
							else
								var35 = var36
							end
							var35 = var35(p5)
							local var38 = var5(prevSectionId).get(p5)
							
							return if var38 == nil then var35 else math.min(math.max(math.floor(var38), 0), var35)
						end)
						var2[prevSectionId] = var34
						var31 = var34
					else
						var31 = var33
					end
					var31 = var31(p4)
				else
					local prevSectionId = var30.prevSectionId
					local var35 = t_3[prevSectionId]
					
					if var35 == nil then
						local var36 = signalsModule.createComputed(function(p5)
							-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
							local var37 = t_1[prevSectionId]
							
							if var37 == nil then
								local var38, var39 = signalsModule.createSignal(nil, sectionConfigsEqual)
								var37 = { get = var38, set = var39 }
								t_1[prevSectionId] = var37
							end
							local var40 = var37.get(p5)
							
							if var40 == nil then
								return 0
							elseif var40.poolId == nil or var40.numberOfRows > 0 then
								return var40.numberOfRows
							end
							local var41 = var6(prevSectionId)(p5)
							
							return if var41 == nil then 0 else var41.actualRowCount
						end)
						t_3[prevSectionId] = var36
						var31 = var36
					else
						var31 = var35
					end
					var31 = var31(p4)
				end
				return var32 + var31
			end)
			t_4[p3] = var26
			
			return var26
		end
		return var25
	end
	
	return {
		getSectionInfo = function(p3)
			-- upvalues: signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t_5 (ref), var6 (write), EMPTY_CELLS (copy), cellsEqual (copy), var24 (write), t_3 (ref)
			return signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t_5 (copy), var6 (copy), EMPTY_CELLS (copy), cellsEqual (copy), var24 (copy), t_3 (copy)
				local var25 = t_1[p3]
				
				if var25 == nil then
					local var26, var27 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var25 = { get = var26, set = var27 }
					t_1[p3] = var25
				end
				if var25.get(p4) == nil then
					return nil
				end
				local var28
				local t = {}
				local var29 = t_5[p3]
				
				if var29 == nil then
					local var30 = signalsModule.createComputed(function(p5)
						-- upvalues: var6 (copy), p3 (ref), EMPTY_CELLS (copy)
						local var31 = var6(p3)(p5)
						
						return if var31 == nil then EMPTY_CELLS else var31.cells
					end, cellsEqual)
					t_5[p3] = var30
					var28 = var30
				else
					var28 = var29
				end
				local var31
				t.cells = var28(p4)
				t.startRow = var24(p3)(p4)
				local var32 = t_3[p3]
				
				if var32 == nil then
					local var33 = signalsModule.createComputed(function(p5)
						-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
						local var34 = t_1[p3]
						
						if var34 == nil then
							local var35, var36 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var34 = { get = var35, set = var36 }
							t_1[p3] = var34
						end
						local var37 = var34.get(p5)
						
						if var37 == nil then
							return 0
						elseif var37.poolId == nil or var37.numberOfRows > 0 then
							return var37.numberOfRows
						end
						local var38 = var6(p3)(p5)
						
						return if var38 == nil then 0 else var38.actualRowCount
					end)
					t_3[p3] = var33
					var31 = var33
				else
					var31 = var32
				end
				t.actualRowCount = var31(p4)
				
				return t
			end)
		end,
		getSectionStartRow = var24,
		getSectionRowCount = if fFlagSduiVerticalFeedProgressiveFillOnScroll then getRowCountComputed else nil,
		getSectionCells = function(p3)
			-- upvalues: t_5 (ref), signalsModule (copy), var6 (write), EMPTY_CELLS (copy), cellsEqual (copy)
			local var25 = t_5[p3]
			
			if var25 == nil then
				local var26 = signalsModule.createComputed(function(p4)
					-- upvalues: var6 (copy), p3 (ref), EMPTY_CELLS (copy)
					local var27 = var6(p3)(p4)
					
					return if var27 == nil then EMPTY_CELLS else var27.cells
				end, cellsEqual)
				t_5[p3] = var26
				
				return var26
			end
			return var25
		end,
		setSectionDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then function(p3, p4)
			-- upvalues: var5 (write)
			var5(p3).set(p4)
		end else nil,
		setPools = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			for i, v in value do
				local var25 = t[i]
				
				if var25 == nil then
					local var26, var27 = signalsModule.createSignal(nil)
					var25 = { get = var26, set = var27 }
					t[i] = var25
				end
				var25.set(v)
			end
		end,
		setSections = function(value)
			-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
			local t = {}
			local var28 = nil
			
			for i, v in value do
				local sectionId = v.sectionId
				local poolId = v.poolId
				local var29 = nil
				
				if poolId ~= nil then
					var29 = t[poolId]
					t[poolId] = sectionId
				end
				local var30 = t_1[sectionId]
				
				if var30 == nil then
					local var31, var32 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var30 = { get = var31, set = var32 }
					t_1[sectionId] = var30
				end
				var30.set({
					poolId = poolId,
					numberOfRows = v.numberOfRows,
					entryCollectionItemSize = v.entryCollectionItemSize,
					templateCollectionItemSize = v.templateCollectionItemSize,
					prevSectionInPoolId = var29,
					prevSectionId = var28
				})
				var28 = sectionId
			end
		end,
		setLayoutStore = function(value)
			-- upvalues: var4 (ref)
			var4(value)
		end
	}
end

local tbl = setmetatable({}, { __mode = "v" })

return {
	getSduiPoolStore = function(p3)
		-- upvalues: tbl (ref), createSduiPoolStore (ref)
		local var28 = tbl[p3]
		
		if var28 == nil then
			local var29 = createSduiPoolStore()
			tbl[p3] = var29
			
			return var29
		end
		return var28
	end
}