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

local function sectionConfigsEqual(p0, p1)
	return p0 == p1 or (if p0 == nil or p1 == nil then false else p0.poolId == p1.poolId and (p0.numberOfRows == p1.numberOfRows and (p0.prevSectionInPoolId == p1.prevSectionInPoolId and p0.prevSectionId == p1.prevSectionId)))
end

local function createSduiPoolStore()
	-- upvalues: signalsModule (ref), sectionConfigsEqual (ref), getMainCollectionLayoutStore (ref), frozen (ref), EMPTY_CELLS (ref), makePoolGetSpanConfig (ref), processOneGrid (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), layoutToCells (ref), cellsEqual (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local var14, var15 = signalsModule.createSignal(nil)
	
	local function _(value)
		-- upvalues: t (ref), signalsModule (copy)
		local var18 = t[value]
		
		if var18 == nil then
			local var19, var20 = signalsModule.createSignal(nil)
			var18 = { get = var19, set = var20 }
			t[value] = var18
		end
		return var18
	end
	
	local _ = function(value)
		-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
		local var21 = t_1[value]
		
		if var21 == nil then
			local var22, var23 = signalsModule.createSignal(nil, sectionConfigsEqual)
			var21 = { get = var22, set = var23 }
			t_1[value] = var21
		end
		return var21
	end
	
	local _ = nil
	
	local var16 = function(p2)
		-- upvalues: t_2 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t (ref), var14 (ref), getMainCollectionLayoutStore (copy), frozen (copy), var16 (write), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
		local var24 = t_2[p2]
		
		if var24 == nil then
			local var25 = signalsModule.createComputed(function(p3)
				-- upvalues: p2 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t (copy), var14 (copy), getMainCollectionLayoutStore (copy), frozen (copy), var16 (copy), EMPTY_CELLS (copy), makePoolGetSpanConfig (copy), processOneGrid (copy), fFlagLuaAppEnableNxMRoduxApportioning (copy), layoutToCells (copy)
				local var26 = t_1[p2]
				
				if var26 == nil then
					local var27, var28 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var26 = { get = var27, set = var28 }
					t_1[p2] = var26
				end
				local var29 = var26.get(p3)
				
				if var29 == nil or var29.poolId == nil then
					return nil
				end
				local poolId = var29.poolId
				local var30 = t[poolId]
				
				if var30 == nil then
					local var31, var32 = signalsModule.createSignal(nil)
					var30 = { get = var31, set = var32 }
					t[poolId] = var30
				end
				local var33 = var30.get(p3)
				
				if var33 == nil or #var33.items == 0 then
					return nil
				end
				local var34 = var14(p3) or getMainCollectionLayoutStore(p3)
				local var35 = var34.getItemsPerRow[if typeof(var33.collectionItemSize) == "string" and var34.getItemsPerRow[var33.collectionItemSize] ~= nil then var33.collectionItemSize else "Medium"](p3)
				
				if var35 <= 0 then
					return nil
				end
				local var36 = 1
				local var37 = frozen
				
				if var29.prevSectionInPoolId ~= nil then
					local var38 = var16(var29.prevSectionInPoolId)(p3)
					
					if var38 == nil then
						return nil
					end
					var36 = var38.nextStartIndex
					var37 = var38.pendingSpanTiles
				end
				local numberOfRows = var29.numberOfRows
				
				if numberOfRows <= 0 then
					numberOfRows = 1e999
				end
				if var33.layouts ~= nil or #var37 ~= 0 then
					local var44 = processOneGrid(var33.items, var36, var37, var35, numberOfRows, if var33.layouts ~= nil then nil else makePoolGetSpanConfig(var33.layouts), not fFlagLuaAppEnableNxMRoduxApportioning)
					local var45, var46 = layoutToCells(var44.layout, var35, var33.items, var33.layouts)
					
					return {
						cells = var45,
						actualRowCount = var46,
						nextStartIndex = var44.nextStartIndex,
						pendingSpanTiles = var44.pendingSpanTiles
					}
				end
				local maxValue = math.max(0, #var33.items - var36 + 1)
				local minValue = math.min(if numberOfRows == 1e999 then maxValue else numberOfRows * var35, maxValue)
				
				if minValue == 0 then
					return {
						actualRowCount = 0,
						cells = EMPTY_CELLS,
						nextStartIndex = var36,
						pendingSpanTiles = frozen
					}
				end
				local ceiled = math.ceil(minValue / var35)
				local t_2 = {}
				
				for i = 0, minValue - 1 do
					local var43 = var36 + i
					t_2[i + 1] = { item = var33.items[var43], realIndex = var43 }
				end
				for i_1 = minValue + 1, ceiled * var35 do
					t_2[i_1] = {}
				end
				return {
					cells = t_2,
					actualRowCount = ceiled,
					nextStartIndex = var36 + minValue,
					pendingSpanTiles = frozen
				}
			end)
			t_2[p2] = var25
			
			return var25
		end
		return var24
	end
	
	local _ = function(p4)
		-- upvalues: t_3 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var16 (write)
		local var47 = t_3[p4]
		
		if var47 == nil then
			local var48 = signalsModule.createComputed(function(p5)
				-- upvalues: p4 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var16 (copy)
				local var49 = t_1[p4]
				
				if var49 == nil then
					local var50, var51 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var49 = { get = var50, set = var51 }
					t_1[p4] = var49
				end
				local var52 = var49.get(p5)
				
				if var52 == nil then
					return 0
				elseif var52.poolId == nil or var52.numberOfRows > 0 then
					return var52.numberOfRows
				end
				local var53 = var16(p4)(p5)
				
				return if var53 == nil then 0 else var53.actualRowCount
			end)
			t_3[p4] = var48
			
			return var48
		end
		return var47
	end
	
	local _ = nil
	
	local var17 = function(p6)
		-- upvalues: t_4 (ref), signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), var17 (write), t_3 (ref), var16 (write)
		local var54 = t_4[p6]
		
		if var54 == nil then
			local var55 = signalsModule.createComputed(function(p7)
				-- upvalues: p6 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var17 (copy), t_3 (copy), var16 (copy)
				local var56 = t_1[p6]
				
				if var56 == nil then
					local var57, var58 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var56 = { get = var57, set = var58 }
					t_1[p6] = var56
				end
				local var59 = var56.get(p7)
				
				if var59 == nil or var59.prevSectionId == nil then
					return 1
				end
				local var62
				local var60 = var17(var59.prevSectionId)(p7)
				local prevSectionId = var59.prevSectionId
				local var61 = t_3[prevSectionId]
				
				if var61 == nil then
					local var63 = signalsModule.createComputed(function(p8)
						-- upvalues: prevSectionId (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var16 (copy)
						local var49 = t_1[prevSectionId]
						
						if var49 == nil then
							local var50, var51 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var49 = { get = var50, set = var51 }
							t_1[prevSectionId] = var49
						end
						local var52 = var49.get(p8)
						
						if var52 == nil then
							return 0
						elseif var52.poolId == nil or var52.numberOfRows > 0 then
							return var52.numberOfRows
						end
						local var53 = var16(prevSectionId)(p8)
						
						return if var53 == nil then 0 else var53.actualRowCount
					end)
					t_3[prevSectionId] = var63
					var62 = var63
				else
					var62 = var61
				end
				return var60 + var62(p7)
			end)
			t_4[p6] = var55
			
			return var55
		end
		return var54
	end
	
	return {
		getSectionInfo = function(p9)
			-- upvalues: signalsModule (copy), t_1 (ref), sectionConfigsEqual (copy), t_5 (ref), var16 (write), EMPTY_CELLS (copy), cellsEqual (copy), var17 (write), t_3 (ref)
			return signalsModule.createComputed(function(p10)
				-- upvalues: p9 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), t_5 (copy), var16 (copy), EMPTY_CELLS (copy), cellsEqual (copy), var17 (copy), t_3 (copy)
				local var64 = t_1[p9]
				
				if var64 == nil then
					local var65, var66 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var64 = { get = var65, set = var66 }
					t_1[p9] = var64
				end
				if var64.get(p10) == nil then
					return nil
				end
				local var69
				local t = {}
				local var68 = t_5[p9]
				
				if var68 == nil then
					local var70 = signalsModule.createComputed(function(p11)
						-- upvalues: var16 (copy), p9 (ref), EMPTY_CELLS (copy)
						local var74 = var16(p9)(p11)
						
						return if var74 == nil then EMPTY_CELLS else var74.cells
					end, cellsEqual)
					t_5[p9] = var70
					var69 = var70
				else
					var69 = var68
				end
				local var72
				t.cells = var69(p10)
				t.startRow = var17(p9)(p10)
				local var71 = t_3[p9]
				
				if var71 == nil then
					local var73 = signalsModule.createComputed(function(p12)
						-- upvalues: p9 (ref), t_1 (copy), signalsModule (copy), sectionConfigsEqual (copy), var16 (copy)
						local var49 = t_1[p9]
						
						if var49 == nil then
							local var50, var51 = signalsModule.createSignal(nil, sectionConfigsEqual)
							var49 = { get = var50, set = var51 }
							t_1[p9] = var49
						end
						local var52 = var49.get(p12)
						
						if var52 == nil then
							return 0
						elseif var52.poolId == nil or var52.numberOfRows > 0 then
							return var52.numberOfRows
						end
						local var53 = var16(p9)(p12)
						
						return if var53 == nil then 0 else var53.actualRowCount
					end)
					t_3[p9] = var73
					var72 = var73
				else
					var72 = var71
				end
				t.actualRowCount = var72(p10)
				
				return t
			end)
		end,
		getSectionStartRow = var17,
		getSectionCells = function(p13)
			-- upvalues: t_5 (ref), signalsModule (copy), var16 (write), EMPTY_CELLS (copy), cellsEqual (copy)
			local var75 = t_5[p13]
			
			if var75 == nil then
				local var76 = signalsModule.createComputed(function(p14)
					-- upvalues: var16 (copy), p13 (ref), EMPTY_CELLS (copy)
					local var74 = var16(p13)(p14)
					
					return if var74 == nil then EMPTY_CELLS else var74.cells
				end, cellsEqual)
				t_5[p13] = var76
				
				return var76
			end
			return var75
		end,
		setPools = function(value)
			-- upvalues: t (ref), signalsModule (copy)
			for i, v in value do
				local var77 = t[i]
				
				if var77 == nil then
					local var78, var79 = signalsModule.createSignal(nil)
					var77 = { get = var78, set = var79 }
					t[i] = var77
				end
				var77.set(v)
			end
		end,
		setSections = function(value)
			-- upvalues: t_1 (ref), signalsModule (copy), sectionConfigsEqual (copy)
			local t = {}
			local var81 = nil
			
			for i, v in value do
				local sectionId = v.sectionId
				local poolId = v.poolId
				local var82 = nil
				
				if poolId ~= nil then
					var82 = t[poolId]
					t[poolId] = sectionId
				end
				local var83 = t_1[sectionId]
				
				if var83 == nil then
					local var84, var85 = signalsModule.createSignal(nil, sectionConfigsEqual)
					var83 = { get = var84, set = var85 }
					t_1[sectionId] = var83
				end
				var83.set({
					poolId = poolId,
					numberOfRows = v.numberOfRows,
					prevSectionInPoolId = var82,
					prevSectionId = var81
				})
				var81 = sectionId
			end
		end,
		setLayoutStore = function(value)
			-- upvalues: var15 (ref)
			var15(value)
		end
	}
end

local tbl = setmetatable({}, { __mode = "v" })

return {
	getSduiPoolStore = function(p15)
		-- upvalues: tbl (ref), createSduiPoolStore (ref)
		local var86 = tbl[p15]
		
		if var86 == nil then
			local var87 = createSduiPoolStore()
			tbl[p15] = var87
			
			return var87
		end
		return var86
	end
}