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
local frozen = table.freeze({})

local function sectionConfigsEqual(p1, p2)
	return p1 == p2 or (if p1 == nil or p2 == nil then false else p1.poolId == p2.poolId and (p1.numberOfRows == p2.numberOfRows and (p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId)))
end

local function createSduiPoolStore()
	-- upvalues: fFlagSduiCollectionGridRevealRows (ref), signalsModule (ref), sectionConfigsEqual (ref), getMainCollectionLayoutStore (ref), frozen (ref), EMPTY_CELLS (ref), makePoolGetSpanConfig (ref), processOneGrid (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), layoutToCells (ref), cellsEqual (ref)
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
		-- upvalues: t_2 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t (ref), var3 (ref), getMainCollectionLayoutStore (copy), frozen (copy), var6 (write), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
		local var7 = t_2[p1]
		
		if var7 == nil then
			local var8 = signalsModule.createComputed(function(p2)
				-- upvalues: p1 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t (copy), var3 (copy), getMainCollectionLayoutStore (copy), frozen (copy), var6 (copy), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
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
				local var17 = var3(p2) or getMainCollectionLayoutStore(p2)
				local var18 = var17.getItemsPerRow[if typeof(var16.collectionItemSize) == "string" and var17.getItemsPerRow[var16.collectionItemSize] ~= nil then var16.collectionItemSize else "Medium"](p2)
				
				if var18 <= 0 then
					return nil
				end
				local var19 = 1
				local var20 = frozen
				
				if var12.prevSectionInPoolId ~= nil then
					local var21 = var6(var12.prevSectionInPoolId)(p2)
					
					if var21 == nil then
						return nil
					end
					var19 = var21.nextStartIndex
					var20 = var21.pendingSpanTiles
				end
				local numberOfRows = var12.numberOfRows
				
				if numberOfRows <= 0 then
					numberOfRows = 1e999
				end
				if var16.layouts ~= nil or #var20 ~= 0 then
					local var22 = processOneGrid(var16.items, var19, var20, var18, numberOfRows, if var16.layouts ~= nil then nil else makePoolGetSpanConfig(var16.layouts), not fFlagLuaAppEnableNxMRoduxApportioning)
					local var23, var24 = layoutToCells(var22.layout, var18, var16.items, var16.layouts)
					
					return {
						cells = var23,
						actualRowCount = var24,
						nextStartIndex = var22.nextStartIndex,
						pendingSpanTiles = var22.pendingSpanTiles
					}
				end
				local maxValue = math.max(0, #var16.items - var19 + 1)
				local minValue = math.min(if numberOfRows == 1e999 then maxValue else numberOfRows * var18, maxValue)
				
				if minValue == 0 then
					return {
						actualRowCount = 0,
						cells = EMPTY_CELLS,
						nextStartIndex = var19,
						pendingSpanTiles = frozen
					}
				end
				local ceiled = math.ceil(minValue / var18)
				local t_2 = {}
				
				for i = 0, minValue - 1 do
					local var25 = var19 + i
					t_2[i + 1] = { item = var16.items[var25], realIndex = var25 }
				end
				for i_1 = minValue + 1, ceiled * var18 do
					t_2[i_1] = {}
				end
				return {
					cells = t_2,
					actualRowCount = ceiled,
					nextStartIndex = var19 + minValue,
					pendingSpanTiles = frozen
				}
			end)
			t_2[p1] = var8
			
			return var8
		end
		return var7
	end
	
	local _ = function(p3)
		-- upvalues: t_3 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var6 (write)
		local var26 = t_3[p3]
		
		if var26 == nil then
			local var27 = signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
				local var28 = t_1[p3]
				
				if var28 == nil then
					local var29, var30 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var28 = { get = var29, set = var30 }
					t_1[p3] = var28
				end
				local var31 = var28.get(p4)
				
				if var31 == nil then
					return 0
				elseif var31.poolId == nil or var31.numberOfRows > 0 then
					return var31.numberOfRows
				end
				local var32 = var6(p3)(p4)
				
				return if var32 == nil then 0 else var32.actualRowCount
			end)
			t_3[p3] = var27
			
			return var27
		end
		return var26
	end
	
	local _ = function(p3)
		-- upvalues: var2 (ref), signalsModule (copy), t_3 (ref), t_1 (ref), sectionConfigsEqual (copy), var6 (write), var5 (write)
		local var26 = var2[p3]
		
		if var26 == nil then
			local var27 = signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var6 (copy), var5 (copy)
				local var28
				local var29 = t_3[p3]
				
				if var29 == nil then
					local var30 = signalsModule.createComputed(function(p5)
						-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
						local var31 = t_1[p3]
						
						if var31 == nil then
							local var32, var33 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var31 = { get = var32, set = var33 }
							t_1[p3] = var31
						end
						local var34 = var31.get(p5)
						
						if var34 == nil then
							return 0
						elseif var34.poolId == nil or var34.numberOfRows > 0 then
							return var34.numberOfRows
						end
						local var35 = var6(p3)(p5)
						
						return if var35 == nil then 0 else var35.actualRowCount
					end)
					t_3[p3] = var30
					var28 = var30
				else
					var28 = var29
				end
				var28 = var28(p4)
				local var31 = var5(p3).get(p4)
				
				return if var31 == nil then var28 else math.min(math.max(math.floor(var31), 0), var28)
			end)
			var2[p3] = var27
			
			return var27
		end
		return var26
	end
	
	local _ = nil
	
	local var26 = function(p3)
		-- upvalues: t_4 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var26 (write), fFlagSduiCollectionGridRevealRows (copy), var2 (ref), t_3 (ref), var6 (write), var5 (write)
		local var27 = t_4[p3]
		
		if var27 == nil then
			local var28 = signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var26 (copy), fFlagSduiCollectionGridRevealRows (copy), var2 (copy), t_3 (copy), var6 (copy), var5 (copy)
				local var29 = t_1[p3]
				
				if var29 == nil then
					local var30, var31 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var29 = { get = var30, set = var31 }
					t_1[p3] = var29
				end
				local var32 = var29.get(p4)
				
				if var32 == nil or var32.prevSectionId == nil then
					return 1
				end
				local var33
				local var34 = var26(var32.prevSectionId)(p4)
				
				if fFlagSduiCollectionGridRevealRows then
					local prevSectionId = var32.prevSectionId
					local var35 = var2[prevSectionId]
					
					if var35 == nil then
						local var36 = signalsModule.createComputed(function(p5)
							-- upvalues: prevSectionId (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var6 (copy), var5 (copy)
							local var37
							local var38 = t_3[prevSectionId]
							
							if var38 == nil then
								local var39 = signalsModule.createComputed(function(p6)
									-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
									local var40 = t_1[prevSectionId]
									
									if var40 == nil then
										local var41, var42 = signalsModule.createSignal(nil, sectionConfigsEqual)
										var40 = { get = var41, set = var42 }
										t_1[prevSectionId] = var40
									end
									local var43 = var40.get(p6)
									
									if var43 == nil then
										return 0
									elseif var43.poolId == nil or var43.numberOfRows > 0 then
										return var43.numberOfRows
									end
									local var44 = var6(prevSectionId)(p6)
									
									return if var44 == nil then 0 else var44.actualRowCount
								end)
								t_3[prevSectionId] = var39
								var37 = var39
							else
								var37 = var38
							end
							var37 = var37(p5)
							local var40 = var5(prevSectionId).get(p5)
							
							return if var40 == nil then var37 else math.min(math.max(math.floor(var40), 0), var37)
						end)
						var2[prevSectionId] = var36
						var33 = var36
					else
						var33 = var35
					end
					var33 = var33(p4)
				else
					local prevSectionId = var32.prevSectionId
					local var37 = t_3[prevSectionId]
					
					if var37 == nil then
						local var38 = signalsModule.createComputed(function(p5)
							-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
							local var39 = t_1[prevSectionId]
							
							if var39 == nil then
								local var40, var41 = signalsModule.createSignal(nil, sectionConfigsEqual)
								var39 = { get = var40, set = var41 }
								t_1[prevSectionId] = var39
							end
							local var42 = var39.get(p5)
							
							if var42 == nil then
								return 0
							elseif var42.poolId == nil or var42.numberOfRows > 0 then
								return var42.numberOfRows
							end
							local var43 = var6(prevSectionId)(p5)
							
							return if var43 == nil then 0 else var43.actualRowCount
						end)
						t_3[prevSectionId] = var38
						var33 = var38
					else
						var33 = var37
					end
					var33 = var33(p4)
				end
				return var34 + var33
			end)
			t_4[p3] = var28
			
			return var28
		end
		return var27
	end
	
	return {
		getSectionInfo = function(p3)
			-- upvalues: signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t_5 (ref), var6 (write), EMPTY_CELLS (copy), cellsEqual (copy), var26 (write), t_3 (ref)
			return signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t_5 (copy), var6 (copy), EMPTY_CELLS (copy), cellsEqual (copy), var26 (copy), t_3 (copy)
				local var27 = t_1[p3]
				
				if var27 == nil then
					local var28, var29 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var27 = { get = var28, set = var29 }
					t_1[p3] = var27
				end
				if var27.get(p4) == nil then
					return nil
				end
				local var30
				local t = {}
				local var31 = t_5[p3]
				
				if var31 == nil then
					local var32 = signalsModule.createComputed(function(p5)
						-- upvalues: var6 (copy), p3 (ref), EMPTY_CELLS (copy)
						local var33 = var6(p3)(p5)
						
						return if var33 == nil then EMPTY_CELLS else var33.cells
					end, cellsEqual)
					t_5[p3] = var32
					var30 = var32
				else
					var30 = var31
				end
				local var33
				t.cells = var30(p4)
				t.startRow = var26(p3)(p4)
				local var34 = t_3[p3]
				
				if var34 == nil then
					local var35 = signalsModule.createComputed(function(p5)
						-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
						local var36 = t_1[p3]
						
						if var36 == nil then
							local var37, var38 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var36 = { get = var37, set = var38 }
							t_1[p3] = var36
						end
						local var39 = var36.get(p5)
						
						if var39 == nil then
							return 0
						elseif var39.poolId == nil or var39.numberOfRows > 0 then
							return var39.numberOfRows
						end
						local var40 = var6(p3)(p5)
						
						return if var40 == nil then 0 else var40.actualRowCount
					end)
					t_3[p3] = var35
					var33 = var35
				else
					var33 = var34
				end
				t.actualRowCount = var33(p4)
				
				return t
			end)
		end,
		getSectionStartRow = var26,
		getSectionCells = function(p3)
			-- upvalues: t_5 (ref), signalsModule (copy), var6 (write), EMPTY_CELLS (copy), cellsEqual (copy)
			local var27 = t_5[p3]
			
			if var27 == nil then
				local var28 = signalsModule.createComputed(function(p4)
					-- upvalues: var6 (copy), p3 (ref), EMPTY_CELLS (copy)
					local var29 = var6(p3)(p4)
					
					return if var29 == nil then EMPTY_CELLS else var29.cells
				end, cellsEqual)
				t_5[p3] = var28
				
				return var28
			end
			return var27
		end,
		setSectionDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then function(p3, p4)
			-- upvalues: var5 (write)
			var5(p3).set(p4)
		end else nil,
		setPools = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			for i, v in value do
				local var27 = t[i]
				
				if var27 == nil then
					local var28, var29 = signalsModule.createSignal(nil)
					var27 = { get = var28, set = var29 }
					t[i] = var27
				end
				var27.set(v)
			end
		end,
		setSections = function(value)
			-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
			local t = {}
			local var30 = nil
			
			for i, v in value do
				local sectionId = v.sectionId
				local poolId = v.poolId
				local var31 = nil
				
				if poolId ~= nil then
					var31 = t[poolId]
					t[poolId] = sectionId
				end
				local var32 = t_1[sectionId]
				
				if var32 == nil then
					local var33, var34 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var32 = { get = var33, set = var34 }
					t_1[sectionId] = var32
				end
				var32.set({
					poolId = poolId,
					numberOfRows = v.numberOfRows,
					prevSectionInPoolId = var31,
					prevSectionId = var30
				})
				var30 = sectionId
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
		local var30 = tbl[p3]
		
		if var30 == nil then
			local var31 = createSduiPoolStore()
			tbl[p3] = var31
			
			return var31
		end
		return var30
	end
}