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
		local var6 = var6[p1]
		
		if var6 == nil then
			local var7, var8 = signalsModule.createSignal(nil)
			var6 = { get = var7, set = var8 }
			var6[p1] = var6
		end
		return var6
	end else nil
	local _ = nil
	
	local var6 = function(p1)
		-- upvalues: t_2 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t (ref), var3 (ref), getMainCollectionLayoutStore (copy), frozen (copy), var6 (write), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
		local var7 = t_2[p1]
		
		if var7 == nil then
			local var8 = signalsModule.createComputed(function(p2)
				-- upvalues: p2 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t (copy), var3 (copy), getMainCollectionLayoutStore (copy), frozen (copy), var6 (copy), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
				local var9 = t_1[p2]
				
				if var9 == nil then
					local var10, var11 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var9 = { get = var10, set = var11 }
					t_1[p2] = var9
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
				local var17 = var11(p2) or getMainCollectionLayoutStore(p2)
				local var18 = var17.getItemsPerRow[if typeof(var16.collectionItemSize) == "string" and var17.getItemsPerRow[var16.collectionItemSize] ~= nil then var16.collectionItemSize else "Medium"](p2)
				
				if var18 <= 0 then
					return nil
				end
				local var19 = 1
				local var20 = frozen
				
				if var12.prevSectionInPoolId ~= nil then
					local var21 = var14(var12.prevSectionInPoolId)(p2)
					
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
			t_2[p2] = var10
			
			return var10
		end
		return var9
	end
	
	local _ = function(p3)
		-- upvalues: t_3 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var14 (write)
		local var26 = t_3[p3]
		
		if var26 == nil then
			local var27 = signalsModule.createComputed(function(p4)
				-- upvalues: p4 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var14 (copy)
				local var28 = t_1[p4]
				
				if var28 == nil then
					local var29, var30 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var28 = { get = var29, set = var30 }
					t_1[p4] = var28
				end
				local var31 = var28.get(p4)
				
				if var31 == nil then
					return 0
				elseif var31.poolId == nil or var31.numberOfRows > 0 then
					return var31.numberOfRows
				end
				local var32 = var14(p4)(p4)
				
				return if var32 == nil then 0 else var32.actualRowCount
			end)
			t_3[p3] = var27
			
			return var27
		end
		return var26
	end
	
	local _ = function(p3)
		-- upvalues: var10 (ref), signalsModule (copy), t_3 (ref), t_1 (ref), sectionConfigsEqual (copy), var14 (write), var13 (write)
		local var26 = var10[p3]
		
		if var26 == nil then
			local var27 = signalsModule.createComputed(function(p4)
				-- upvalues: p4 (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var14 (copy), var13 (copy)
				local var28
				local var29 = t_3[p4]
				
				if var29 == nil then
					local var30 = signalsModule.createComputed(function(p5)
						-- upvalues: p5 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var14 (copy)
						local var31 = t_1[p5]
						
						if var31 == nil then
							local var32, var33 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var31 = { get = var32, set = var33 }
							t_1[p5] = var31
						end
						local var34 = var31.get(p5)
						
						if var34 == nil then
							return 0
						elseif var34.poolId == nil or var34.numberOfRows > 0 then
							return var34.numberOfRows
						end
						local var35 = var14(p5)(p5)
						
						return if var35 == nil then 0 else var35.actualRowCount
					end)
					t_3[p4] = var30
					var28 = var30
				else
					var28 = var29
				end
				var28 = var28(p4)
				local var31 = var13(p4).get(p4)
				
				return if var31 == nil then var28 else math.min(math.max(math.floor(var31), 0), var28)
			end)
			var27[p3] = var27
			
			return var27
		end
		return var26
	end
	
	local _ = nil
	
	local var11 = function(p3)
		-- upvalues: t_4 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var11 (write), fFlagSduiCollectionGridRevealRows (copy), var10 (ref), t_3 (ref), var14 (write), var13 (write)
		local var26 = t_4[p3]
		
		if var26 == nil then
			local var27 = signalsModule.createComputed(function(p4)
				-- upvalues: p4 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var11 (copy), fFlagSduiCollectionGridRevealRows (copy), var27 (copy), t_3 (copy), var14 (copy), var13 (copy)
				local var28 = t_1[p4]
				
				if var28 == nil then
					local var29, var30 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var28 = { get = var29, set = var30 }
					t_1[p4] = var28
				end
				local var31 = var28.get(p4)
				
				if var31 == nil or var31.prevSectionId == nil then
					return 1
				end
				local var32
				local var33 = var30(var31.prevSectionId)(p4)
				
				if fFlagSduiCollectionGridRevealRows then
					local prevSectionId = var31.prevSectionId
					local var34 = var29[prevSectionId]
					
					if var34 == nil then
						local var35 = signalsModule.createComputed(function(p5)
							-- upvalues: prevSectionId (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var33 (copy), var32 (copy)
							local var36
							local var37 = t_3[prevSectionId]
							
							if var37 == nil then
								local var38 = signalsModule.createComputed(function(p6)
									-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var33 (copy)
									local var39 = t_1[prevSectionId]
									
									if var39 == nil then
										local var40, var41 = signalsModule.createSignal(nil, sectionConfigsEqual)
										var39 = { get = var40, set = var41 }
										t_1[prevSectionId] = var39
									end
									local var42 = var39.get(p6)
									
									if var42 == nil then
										return 0
									elseif var42.poolId == nil or var42.numberOfRows > 0 then
										return var42.numberOfRows
									end
									local var43 = var33(prevSectionId)(p6)
									
									return if var43 == nil then 0 else var43.actualRowCount
								end)
								t_3[prevSectionId] = var38
								var36 = var38
							else
								var36 = var37
							end
							var36 = var36(p5)
							local var39 = var32(prevSectionId).get(p5)
							
							return if var39 == nil then var36 else math.min(math.max(math.floor(var39), 0), var36)
						end)
						var29[prevSectionId] = var35
						var32 = var35
					else
						var32 = var34
					end
					var32 = var32(p4)
				else
					local prevSectionId = var31.prevSectionId
					local var32 = t_3[prevSectionId]
					
					if var32 == nil then
						local var33 = signalsModule.createComputed(function(p5)
							-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var33 (copy)
							local var36 = t_1[prevSectionId]
							
							if var36 == nil then
								local var37, var38 = signalsModule.createSignal(nil, sectionConfigsEqual)
								var36 = { get = var37, set = var38 }
								t_1[prevSectionId] = var36
							end
							local var39 = var36.get(p5)
							
							if var39 == nil then
								return 0
							elseif var39.poolId == nil or var39.numberOfRows > 0 then
								return var39.numberOfRows
							end
							local var40 = var33(prevSectionId)(p5)
							
							return if var40 == nil then 0 else var40.actualRowCount
						end)
						t_3[prevSectionId] = var33
						var32 = var33
					else
						var32 = var32
					end
					var32 = var32(p4)
				end
				return var33 + var32
			end)
			t_4[p3] = var27
			
			return var27
		end
		return var26
	end
	
	return {
		getSectionInfo = function(p3)
			-- upvalues: signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t_5 (ref), var14 (write), EMPTY_CELLS (copy), cellsEqual (copy), var11 (write), t_3 (ref)
			return signalsModule.createComputed(function(p4)
				-- upvalues: p4 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t_5 (copy), var14 (copy), EMPTY_CELLS (copy), cellsEqual (copy), var11 (copy), t_3 (copy)
				local var26 = t_1[p4]
				
				if var26 == nil then
					local var27, var28 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var26 = { get = var27, set = var28 }
					t_1[p4] = var26
				end
				if var26.get(p4) == nil then
					return nil
				end
				local var29
				local t = {}
				local var30 = t_5[p4]
				
				if var30 == nil then
					local var31 = signalsModule.createComputed(function(p5)
						-- upvalues: var31 (copy), p5 (ref), EMPTY_CELLS (copy)
						local var32 = var31(p5)(p5)
						
						return if var32 == nil then EMPTY_CELLS else var32.cells
					end, cellsEqual)
					t_5[p4] = var31
					var29 = var31
				else
					var29 = var30
				end
				local var32
				t.cells = var29(p4)
				t.startRow = var28(p4)(p4)
				local var33 = t_3[p4]
				
				if var33 == nil then
					local var34 = signalsModule.createComputed(function(p5)
						-- upvalues: p5 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var31 (copy)
						local var35 = t_1[p5]
						
						if var35 == nil then
							local var36, var37 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var35 = { get = var36, set = var37 }
							t_1[p5] = var35
						end
						local var38 = var35.get(p5)
						
						if var38 == nil then
							return 0
						elseif var38.poolId == nil or var38.numberOfRows > 0 then
							return var38.numberOfRows
						end
						local var39 = var31(p5)(p5)
						
						return if var39 == nil then 0 else var39.actualRowCount
					end)
					t_3[p4] = var34
					var32 = var34
				else
					var32 = var33
				end
				t.actualRowCount = var32(p4)
				
				return t
			end)
		end,
		getSectionStartRow = var11,
		getSectionCells = function(p3)
			-- upvalues: t_5 (ref), signalsModule (copy), var14 (write), EMPTY_CELLS (copy), cellsEqual (copy)
			local var26 = t_5[p3]
			
			if var26 == nil then
				local var27 = signalsModule.createComputed(function(p4)
					-- upvalues: var14 (copy), p4 (ref), EMPTY_CELLS (copy)
					local var28 = var14(p4)(p4)
					
					return if var28 == nil then EMPTY_CELLS else var28.cells
				end, cellsEqual)
				t_5[p3] = var27
				
				return var27
			end
			return var26
		end,
		setSectionDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then function(p3, p4)
			-- upvalues: var13 (write)
			var13(p3).set(p4)
		end else nil,
		setPools = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			for i, v in value do
				local var26 = t[i]
				
				if var26 == nil then
					local var27, var28 = signalsModule.createSignal(nil)
					var26 = { get = var27, set = var28 }
					t[i] = var26
				end
				var26.set(v)
			end
		end,
		setSections = function(value)
			-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
			local t = {}
			local var29 = nil
			
			for i, v in value do
				local sectionId = v.sectionId
				local poolId = v.poolId
				local var30 = nil
				
				if poolId ~= nil then
					var30 = t[poolId]
					t[poolId] = sectionId
				end
				local var31 = t_1[sectionId]
				
				if var31 == nil then
					local var32, var33 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var31 = { get = var32, set = var33 }
					t_1[sectionId] = var31
				end
				var31.set({
					poolId = poolId,
					numberOfRows = v.numberOfRows,
					prevSectionInPoolId = var30,
					prevSectionId = var29
				})
				var29 = sectionId
			end
		end,
		setLayoutStore = function(value)
			-- upvalues: var32 (ref)
			var32(value)
		end
	}
end

local tbl = setmetatable({}, { __mode = "v" })

return {
	getSduiPoolStore = function(p3)
		-- upvalues: tbl (ref), createSduiPoolStore (ref)
		local var29 = tbl[p3]
		
		if var29 == nil then
			local var30 = createSduiPoolStore()
			tbl[p3] = var30
			
			return var30
		end
		return var29
	end
}