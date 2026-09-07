local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local signalsModule = require(parent.Signals)
local collectionViewsModule = require(parent.CollectionViews)
local fFlagLuaAppEnableNxMRoduxApportioning = require(parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning
local _ = require(sduiCoreSystem.ClientBinding.SduiPoolStoreTypes)
local sduiPoolStoreLayoutModule = require(sduiCoreSystem.ClientBinding.SduiPoolStoreLayout)
local getMainCollectionLayoutStore = collectionViewsModule.getMainCollectionLayoutStore
local processOneGrid = collectionViewsModule.processOneGrid
local makePoolGetSpanConfig = sduiPoolStoreLayoutModule.makePoolGetSpanConfig
local layoutToCells = sduiPoolStoreLayoutModule.layoutToCells
local cellsEqual = sduiPoolStoreLayoutModule.cellsEqual
local EMPTY_CELLS = sduiPoolStoreLayoutModule.EMPTY_CELLS
local frozen = table.freeze({})

local function sectionConfigsEqual(p1, p2)
	return p1 == p2 or (if p1 == nil or p2 == nil then false else p1.poolId == p2.poolId and (p1.numberOfRows == p2.numberOfRows and (p1.prevSectionInPoolId == p2.prevSectionInPoolId and p1.prevSectionId == p2.prevSectionId)))
end

local function createSduiPoolStore()
	-- upvalues: signalsModule (ref), sectionConfigsEqual (ref), getMainCollectionLayoutStore (ref), frozen (ref), EMPTY_CELLS (ref), makePoolGetSpanConfig (ref), processOneGrid (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), layoutToCells (ref), cellsEqual (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local var1, var2 = signalsModule.createSignal(nil)
	
	local function _(value)
		-- upvalues: t (ref), signalsModule (copy)
		local var3 = t[value]
		
		if var3 == nil then
			local var4, var5 = signalsModule.createSignal(nil)
			var3 = { get = var4, set = var5 }
			t[value] = var3
		end
		return var3
	end
	
	local _ = function(value)
		-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
		local var3 = t_1[value]
		
		if var3 == nil then
			local var4, var5 = signalsModule.createSignal(nil, sectionConfigsEqual)
			var3 = { get = var4, set = var5 }
			t_1[value] = var3
		end
		return var3
	end
	
	local _ = nil
	
	local var3 = function(p1)
		-- upvalues: t_2 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t (ref), var1 (ref), getMainCollectionLayoutStore (copy), frozen (copy), var3 (write), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
		local var4 = t_2[p1]
		
		if var4 == nil then
			local var5 = signalsModule.createComputed(function(p2)
				-- upvalues: p1 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t (copy), var1 (copy), getMainCollectionLayoutStore (copy), frozen (copy), var3 (copy), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
				local var6 = t_1[p1]
				
				if var6 == nil then
					local var7, var8 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var6 = { get = var7, set = var8 }
					t_1[p1] = var6
				end
				local var9 = var6.get(p2)
				
				if var9 == nil or var9.poolId == nil then
					return nil
				end
				local poolId = var9.poolId
				local var10 = t[poolId]
				
				if var10 == nil then
					local var11, var12 = signalsModule.createSignal(nil)
					var10 = { get = var11, set = var12 }
					t[poolId] = var10
				end
				local var13 = var10.get(p2)
				
				if var13 == nil or #var13.items == 0 then
					return nil
				end
				local var14 = var1(p2) or getMainCollectionLayoutStore(p2)
				local var15 = var14.getItemsPerRow[if typeof(var13.collectionItemSize) == "string" and var14.getItemsPerRow[var13.collectionItemSize] ~= nil then var13.collectionItemSize else "Medium"](p2)
				
				if var15 <= 0 then
					return nil
				end
				local var16 = 1
				local var17 = frozen
				
				if var9.prevSectionInPoolId ~= nil then
					local var18 = var3(var9.prevSectionInPoolId)(p2)
					
					if var18 == nil then
						return nil
					end
					var16 = var18.nextStartIndex
					var17 = var18.pendingSpanTiles
				end
				local numberOfRows = var9.numberOfRows
				
				if numberOfRows <= 0 then
					numberOfRows = 1e999
				end
				if var13.layouts ~= nil or #var17 ~= 0 then
					local var19 = processOneGrid(var13.items, var16, var17, var15, numberOfRows, if var13.layouts ~= nil then nil else makePoolGetSpanConfig(var13.layouts), not fFlagLuaAppEnableNxMRoduxApportioning)
					local var20, var21 = layoutToCells(var19.layout, var15, var13.items, var13.layouts)
					
					return {
						cells = var20,
						actualRowCount = var21,
						nextStartIndex = var19.nextStartIndex,
						pendingSpanTiles = var19.pendingSpanTiles
					}
				end
				local maxValue = math.max(0, #var13.items - var16 + 1)
				local minValue = math.min(if numberOfRows == 1e999 then maxValue else numberOfRows * var15, maxValue)
				
				if minValue == 0 then
					return {
						actualRowCount = 0,
						cells = EMPTY_CELLS,
						nextStartIndex = var16,
						pendingSpanTiles = frozen
					}
				end
				local ceiled = math.ceil(minValue / var15)
				local t_2 = {}
				
				for i = 0, minValue - 1 do
					local var22 = var16 + i
					t_2[i + 1] = { item = var13.items[var22], realIndex = var22 }
				end
				for i_1 = minValue + 1, ceiled * var15 do
					t_2[i_1] = {}
				end
				return {
					cells = t_2,
					actualRowCount = ceiled,
					nextStartIndex = var16 + minValue,
					pendingSpanTiles = frozen
				}
			end)
			t_2[p1] = var5
			
			return var5
		end
		return var4
	end
	
	local _ = function(p3)
		-- upvalues: t_3 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var3 (write)
		local var23 = t_3[p3]
		
		if var23 == nil then
			local var24 = signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var3 (copy)
				local var25 = t_1[p3]
				
				if var25 == nil then
					local var26, var27 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var25 = { get = var26, set = var27 }
					t_1[p3] = var25
				end
				local var28 = var25.get(p4)
				
				if var28 == nil then
					return 0
				elseif var28.poolId == nil or var28.numberOfRows > 0 then
					return var28.numberOfRows
				end
				local var29 = var3(p3)(p4)
				
				return if var29 == nil then 0 else var29.actualRowCount
			end)
			t_3[p3] = var24
			
			return var24
		end
		return var23
	end
	
	local _ = nil
	
	local var23 = function(p3)
		-- upvalues: t_4 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var23 (write), t_3 (ref), var3 (write)
		local var24 = t_4[p3]
		
		if var24 == nil then
			local var25 = signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var23 (copy), t_3 (copy), var3 (copy)
				local var26 = t_1[p3]
				
				if var26 == nil then
					local var27, var28 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var26 = { get = var27, set = var28 }
					t_1[p3] = var26
				end
				local var29 = var26.get(p4)
				
				if var29 == nil or var29.prevSectionId == nil then
					return 1
				end
				local var30
				local var31 = var23(var29.prevSectionId)(p4)
				local prevSectionId = var29.prevSectionId
				local var32 = t_3[prevSectionId]
				
				if var32 == nil then
					local var33 = signalsModule.createComputed(function(p5)
						-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var3 (copy)
						local var34 = t_1[prevSectionId]
						
						if var34 == nil then
							local var35, var36 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var34 = { get = var35, set = var36 }
							t_1[prevSectionId] = var34
						end
						local var37 = var34.get(p5)
						
						if var37 == nil then
							return 0
						elseif var37.poolId == nil or var37.numberOfRows > 0 then
							return var37.numberOfRows
						end
						local var38 = var3(prevSectionId)(p5)
						
						return if var38 == nil then 0 else var38.actualRowCount
					end)
					t_3[prevSectionId] = var33
					var30 = var33
				else
					var30 = var32
				end
				return var31 + var30(p4)
			end)
			t_4[p3] = var25
			
			return var25
		end
		return var24
	end
	
	return {
		getSectionInfo = function(p3)
			-- upvalues: signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t_5 (ref), var3 (write), EMPTY_CELLS (copy), cellsEqual (copy), var23 (write), t_3 (ref)
			return signalsModule.createComputed(function(p4)
				-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t_5 (copy), var3 (copy), EMPTY_CELLS (copy), cellsEqual (copy), var23 (copy), t_3 (copy)
				local var24 = t_1[p3]
				
				if var24 == nil then
					local var25, var26 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var24 = { get = var25, set = var26 }
					t_1[p3] = var24
				end
				if var24.get(p4) == nil then
					return nil
				end
				local var27
				local t = {}
				local var28 = t_5[p3]
				
				if var28 == nil then
					local var29 = signalsModule.createComputed(function(p5)
						-- upvalues: var3 (copy), p3 (ref), EMPTY_CELLS (copy)
						local var30 = var3(p3)(p5)
						
						return if var30 == nil then EMPTY_CELLS else var30.cells
					end, cellsEqual)
					t_5[p3] = var29
					var27 = var29
				else
					var27 = var28
				end
				local var30
				t.cells = var27(p4)
				t.startRow = var23(p3)(p4)
				local var31 = t_3[p3]
				
				if var31 == nil then
					local var32 = signalsModule.createComputed(function(p5)
						-- upvalues: p3 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var3 (copy)
						local var33 = t_1[p3]
						
						if var33 == nil then
							local var34, var35 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var33 = { get = var34, set = var35 }
							t_1[p3] = var33
						end
						local var36 = var33.get(p5)
						
						if var36 == nil then
							return 0
						elseif var36.poolId == nil or var36.numberOfRows > 0 then
							return var36.numberOfRows
						end
						local var37 = var3(p3)(p5)
						
						return if var37 == nil then 0 else var37.actualRowCount
					end)
					t_3[p3] = var32
					var30 = var32
				else
					var30 = var31
				end
				t.actualRowCount = var30(p4)
				
				return t
			end)
		end,
		getSectionStartRow = var23,
		getSectionCells = function(p3)
			-- upvalues: t_5 (ref), signalsModule (copy), var3 (write), EMPTY_CELLS (copy), cellsEqual (copy)
			local var24 = t_5[p3]
			
			if var24 == nil then
				local var25 = signalsModule.createComputed(function(p4)
					-- upvalues: var3 (copy), p3 (ref), EMPTY_CELLS (copy)
					local var26 = var3(p3)(p4)
					
					return if var26 == nil then EMPTY_CELLS else var26.cells
				end, cellsEqual)
				t_5[p3] = var25
				
				return var25
			end
			return var24
		end,
		setPools = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			for i, v in value do
				local var24 = t[i]
				
				if var24 == nil then
					local var25, var26 = signalsModule.createSignal(nil)
					var24 = { get = var25, set = var26 }
					t[i] = var24
				end
				var24.set(v)
			end
		end,
		setSections = function(value)
			-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
			local t = {}
			local var27 = nil
			
			for i, v in value do
				local sectionId = v.sectionId
				local poolId = v.poolId
				local var28 = nil
				
				if poolId ~= nil then
					var28 = t[poolId]
					t[poolId] = sectionId
				end
				local var29 = t_1[sectionId]
				
				if var29 == nil then
					local var30, var31 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var29 = { get = var30, set = var31 }
					t_1[sectionId] = var29
				end
				var29.set({
					poolId = poolId,
					numberOfRows = v.numberOfRows,
					prevSectionInPoolId = var28,
					prevSectionId = var27
				})
				var27 = sectionId
			end
		end,
		setLayoutStore = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end
	}
end

local tbl = setmetatable({}, { __mode = "v" })

return {
	getSduiPoolStore = function(p3)
		-- upvalues: tbl (ref), createSduiPoolStore (ref)
		local var27 = tbl[p3]
		
		if var27 == nil then
			local var28 = createSduiPoolStore()
			tbl[p3] = var28
			
			return var28
		end
		return var27
	end
}