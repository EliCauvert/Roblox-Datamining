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
		local var1 = t[value]
		
		if var1 == nil then
			local var2, var3 = signalsModule.createSignal(nil)
			var1 = { get = var2, set = var3 }
			t[value] = var1
		end
		return var1
	end
	
	local _ = function(value)
		-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
		local var1 = t_1[value]
		
		if var1 == nil then
			local var2, var3 = signalsModule.createSignal(nil, sectionConfigsEqual)
			var1 = { get = var2, set = var3 }
			t_1[value] = var1
		end
		return var1
	end
	
	local var5 = if fFlagSduiCollectionGridRevealRows then function(p1)
		-- upvalues: var1 (ref), signalsModule (copy)
		local var1 = var1[p1]
		
		if var1 == nil then
			local var2, var3 = signalsModule.createSignal(nil)
			var1 = { get = var2, set = var3 }
			var1[p1] = var1
		end
		return var1
	end else nil
	local _ = nil
	
	local var6 = function(p1)
		-- upvalues: t_2 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t (ref), var3 (ref), getMainCollectionLayoutStore (copy), frozen (copy), var6 (write), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
		local var1 = t_2[p1]
		
		if var1 == nil then
			local var2 = signalsModule.createComputed(function(p1)
				-- upvalues: p1 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t (copy), var3 (copy), getMainCollectionLayoutStore (copy), frozen (copy), var6 (copy), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
				local var1 = t_1[p1]
				
				if var1 == nil then
					local var2, var3 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var1 = { get = var2, set = var3 }
					t_1[p1] = var1
				end
				local var4 = var1.get(p1)
				
				if var4 == nil or var4.poolId == nil then
					return nil
				end
				local poolId = var4.poolId
				local var5 = t[poolId]
				
				if var5 == nil then
					local var6, var7 = signalsModule.createSignal(nil)
					var5 = { get = var6, set = var7 }
					t[poolId] = var5
				end
				local var8 = var5.get(p1)
				
				if var8 == nil or #var8.items == 0 then
					return nil
				end
				local var9 = var3(p1) or getMainCollectionLayoutStore(p1)
				local var10 = var9.getItemsPerRow[if typeof(var8.collectionItemSize) == "string" and var9.getItemsPerRow[var8.collectionItemSize] ~= nil then var8.collectionItemSize else "Medium"](p1)
				
				if var10 <= 0 then
					return nil
				end
				local var11 = 1
				local var12 = frozen
				
				if var4.prevSectionInPoolId ~= nil then
					local var13 = var6(var4.prevSectionInPoolId)(p1)
					
					if var13 == nil then
						return nil
					end
					var11 = var13.nextStartIndex
					var12 = var13.pendingSpanTiles
				end
				local numberOfRows = var4.numberOfRows
				
				if numberOfRows <= 0 then
					numberOfRows = 1e999
				end
				if var8.layouts ~= nil or #var12 ~= 0 then
					local var14 = processOneGrid(var8.items, var11, var12, var10, numberOfRows, if var8.layouts ~= nil then nil else makePoolGetSpanConfig(var8.layouts), not fFlagLuaAppEnableNxMRoduxApportioning)
					local var15, var16 = layoutToCells(var14.layout, var10, var8.items, var8.layouts)
					
					return {
						cells = var15,
						actualRowCount = var16,
						nextStartIndex = var14.nextStartIndex,
						pendingSpanTiles = var14.pendingSpanTiles
					}
				end
				local maxValue = math.max(0, #var8.items - var11 + 1)
				local minValue = math.min(if numberOfRows == 1e999 then maxValue else numberOfRows * var10, maxValue)
				
				if minValue == 0 then
					return {
						actualRowCount = 0,
						cells = EMPTY_CELLS,
						nextStartIndex = var11,
						pendingSpanTiles = frozen
					}
				end
				local ceiled = math.ceil(minValue / var10)
				local t_2 = {}
				
				for i = 0, minValue - 1 do
					local var17 = var11 + i
					t_2[i + 1] = { item = var8.items[var17], realIndex = var17 }
				end
				for i_1 = minValue + 1, ceiled * var10 do
					t_2[i_1] = {}
				end
				return {
					cells = t_2,
					actualRowCount = ceiled,
					nextStartIndex = var11 + minValue,
					pendingSpanTiles = frozen
				}
			end)
			t_2[p1] = var2
			
			return var2
		end
		return var1
	end
	
	local _ = function(p1)
		-- upvalues: t_3 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var6 (write)
		local var1 = t_3[p1]
		
		if var1 == nil then
			local var2 = signalsModule.createComputed(function(p1)
				-- upvalues: p1 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
				local var1 = t_1[p1]
				
				if var1 == nil then
					local var2, var3 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var1 = { get = var2, set = var3 }
					t_1[p1] = var1
				end
				local var4 = var1.get(p1)
				
				if var4 == nil then
					return 0
				elseif var4.poolId == nil or var4.numberOfRows > 0 then
					return var4.numberOfRows
				end
				local var5 = var6(p1)(p1)
				
				return if var5 == nil then 0 else var5.actualRowCount
			end)
			t_3[p1] = var2
			
			return var2
		end
		return var1
	end
	
	local _ = function(p1)
		-- upvalues: var2 (ref), signalsModule (copy), t_3 (ref), t_1 (ref), sectionConfigsEqual (copy), var6 (write), var5 (write)
		local var1 = var2[p1]
		
		if var1 == nil then
			local var2 = signalsModule.createComputed(function(p1)
				-- upvalues: p1 (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var6 (copy), var5 (copy)
				local var1
				local var2 = t_3[p1]
				
				if var2 == nil then
					local var3 = signalsModule.createComputed(function(p1)
						-- upvalues: p1 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
						local var1 = t_1[p1]
						
						if var1 == nil then
							local var2, var3 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var1 = { get = var2, set = var3 }
							t_1[p1] = var1
						end
						local var4 = var1.get(p1)
						
						if var4 == nil then
							return 0
						elseif var4.poolId == nil or var4.numberOfRows > 0 then
							return var4.numberOfRows
						end
						local var5 = var6(p1)(p1)
						
						return if var5 == nil then 0 else var5.actualRowCount
					end)
					t_3[p1] = var3
					var1 = var3
				else
					var1 = var2
				end
				var1 = var1(p1)
				local var4 = var5(p1).get(p1)
				
				return if var4 == nil then var1 else math.min(math.max(math.floor(var4), 0), var1)
			end)
			var2[p1] = var2
			
			return var2
		end
		return var1
	end
	
	local _ = nil
	
	local var3 = function(p1)
		-- upvalues: t_4 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var3 (write), fFlagSduiCollectionGridRevealRows (copy), var2 (ref), t_3 (ref), var6 (write), var5 (write)
		local var1 = t_4[p1]
		
		if var1 == nil then
			local var2 = signalsModule.createComputed(function(p1)
				-- upvalues: p1 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var3 (copy), fFlagSduiCollectionGridRevealRows (copy), var2 (copy), t_3 (copy), var6 (copy), var5 (copy)
				local var1 = t_1[p1]
				
				if var1 == nil then
					local var2, var3 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var1 = { get = var2, set = var3 }
					t_1[p1] = var1
				end
				local var4 = var1.get(p1)
				
				if var4 == nil or var4.prevSectionId == nil then
					return 1
				end
				local var5
				local var6 = var3(var4.prevSectionId)(p1)
				
				if fFlagSduiCollectionGridRevealRows then
					local prevSectionId = var4.prevSectionId
					local var7 = var2[prevSectionId]
					
					if var7 == nil then
						local var8 = signalsModule.createComputed(function(p1)
							-- upvalues: prevSectionId (ref), t_3 (copy), signalsModule (copy), t_1 (copy), sectionConfigsEqual (copy), var6 (copy), var5 (copy)
							local var1
							local var2 = t_3[prevSectionId]
							
							if var2 == nil then
								local var3 = signalsModule.createComputed(function(p1)
									-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
									local var1 = t_1[prevSectionId]
									
									if var1 == nil then
										local var2, var3 = signalsModule.createSignal(nil, sectionConfigsEqual)
										var1 = { get = var2, set = var3 }
										t_1[prevSectionId] = var1
									end
									local var4 = var1.get(p1)
									
									if var4 == nil then
										return 0
									elseif var4.poolId == nil or var4.numberOfRows > 0 then
										return var4.numberOfRows
									end
									local var5 = var6(prevSectionId)(p1)
									
									return if var5 == nil then 0 else var5.actualRowCount
								end)
								t_3[prevSectionId] = var3
								var1 = var3
							else
								var1 = var2
							end
							var1 = var1(p1)
							local var4 = var5(prevSectionId).get(p1)
							
							return if var4 == nil then var1 else math.min(math.max(math.floor(var4), 0), var1)
						end)
						var2[prevSectionId] = var8
						var5 = var8
					else
						var5 = var7
					end
					var5 = var5(p1)
				else
					local prevSectionId = var4.prevSectionId
					local var5 = t_3[prevSectionId]
					
					if var5 == nil then
						local var6 = signalsModule.createComputed(function(p1)
							-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
							local var1 = t_1[prevSectionId]
							
							if var1 == nil then
								local var2, var3 = signalsModule.createSignal(nil, sectionConfigsEqual)
								var1 = { get = var2, set = var3 }
								t_1[prevSectionId] = var1
							end
							local var4 = var1.get(p1)
							
							if var4 == nil then
								return 0
							elseif var4.poolId == nil or var4.numberOfRows > 0 then
								return var4.numberOfRows
							end
							local var5 = var6(prevSectionId)(p1)
							
							return if var5 == nil then 0 else var5.actualRowCount
						end)
						t_3[prevSectionId] = var6
						var5 = var6
					else
						var5 = var5
					end
					var5 = var5(p1)
				end
				return var6 + var5
			end)
			t_4[p1] = var2
			
			return var2
		end
		return var1
	end
	
	return {
		getSectionInfo = function(p1)
			-- upvalues: signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t_5 (ref), var6 (write), EMPTY_CELLS (copy), cellsEqual (copy), var3 (write), t_3 (ref)
			return signalsModule.createComputed(function(p1)
				-- upvalues: p1 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t_5 (copy), var6 (copy), EMPTY_CELLS (copy), cellsEqual (copy), var3 (copy), t_3 (copy)
				local var1 = t_1[p1]
				
				if var1 == nil then
					local var2, var3 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var1 = { get = var2, set = var3 }
					t_1[p1] = var1
				end
				if var1.get(p1) == nil then
					return nil
				end
				local var4
				local t = {}
				local var5 = t_5[p1]
				
				if var5 == nil then
					local var6 = signalsModule.createComputed(function(p1)
						-- upvalues: var6 (copy), p1 (ref), EMPTY_CELLS (copy)
						local var1 = var6(p1)(p1)
						
						return if var1 == nil then EMPTY_CELLS else var1.cells
					end, cellsEqual)
					t_5[p1] = var6
					var4 = var6
				else
					var4 = var5
				end
				local var7
				t.cells = var4(p1)
				t.startRow = var3(p1)(p1)
				local var8 = t_3[p1]
				
				if var8 == nil then
					local var9 = signalsModule.createComputed(function(p1)
						-- upvalues: p1 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var6 (copy)
						local var1 = t_1[p1]
						
						if var1 == nil then
							local var2, var3 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var1 = { get = var2, set = var3 }
							t_1[p1] = var1
						end
						local var4 = var1.get(p1)
						
						if var4 == nil then
							return 0
						elseif var4.poolId == nil or var4.numberOfRows > 0 then
							return var4.numberOfRows
						end
						local var5 = var6(p1)(p1)
						
						return if var5 == nil then 0 else var5.actualRowCount
					end)
					t_3[p1] = var9
					var7 = var9
				else
					var7 = var8
				end
				t.actualRowCount = var7(p1)
				
				return t
			end)
		end,
		getSectionStartRow = var3,
		getSectionCells = function(p1)
			-- upvalues: t_5 (ref), signalsModule (copy), var6 (write), EMPTY_CELLS (copy), cellsEqual (copy)
			local var1 = t_5[p1]
			
			if var1 == nil then
				local var2 = signalsModule.createComputed(function(p1)
					-- upvalues: var6 (copy), p1 (ref), EMPTY_CELLS (copy)
					local var1 = var6(p1)(p1)
					
					return if var1 == nil then EMPTY_CELLS else var1.cells
				end, cellsEqual)
				t_5[p1] = var2
				
				return var2
			end
			return var1
		end,
		setSectionDisplayedRowCount = if fFlagSduiCollectionGridRevealRows then function(p1, p2)
			-- upvalues: var5 (write)
			var5(p1).set(p2)
		end else nil,
		setPools = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			for i, v in value do
				local var1 = t[i]
				
				if var1 == nil then
					local var2, var3 = signalsModule.createSignal(nil)
					var1 = { get = var2, set = var3 }
					t[i] = var1
				end
				var1.set(v)
			end
		end,
		setSections = function(value)
			-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
			local t = {}
			local var1 = nil
			
			for i, v in value do
				local sectionId = v.sectionId
				local poolId = v.poolId
				local var2 = nil
				
				if poolId ~= nil then
					var2 = t[poolId]
					t[poolId] = sectionId
				end
				local var3 = t_1[sectionId]
				
				if var3 == nil then
					local var4, var5 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var3 = { get = var4, set = var5 }
					t_1[sectionId] = var3
				end
				var3.set({
					poolId = poolId,
					numberOfRows = v.numberOfRows,
					prevSectionInPoolId = var2,
					prevSectionId = var1
				})
				var1 = sectionId
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
	getSduiPoolStore = function(p1)
		-- upvalues: tbl (ref), createSduiPoolStore (ref)
		local var1 = tbl[p1]
		
		if var1 == nil then
			local var2 = createSduiPoolStore()
			tbl[p1] = var2
			
			return var2
		end
		return var1
	end
}