local parent = script:FindFirstAncestor("CollectionViews").Parent
local discoveryTypesModule = require(parent.DiscoveryTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameCollectionItemTypes = discoveryTypesModule.GameCollectionItemTypes
local gameCollectionItemType = gameCollectionItemTypes.GameCollectionItemType
local spanForItemType = gameCollectionItemTypes.SpanForItemType
local fFlagLuaAppEnableNxMRoduxApportioning = sharedFlagsModule.FFlagLuaAppEnableNxMRoduxApportioning
local fFlagLuaAppApportioningInCollectionViews = sharedFlagsModule.FFlagLuaAppApportioningInCollectionViews
local fFlagSduiPoolBackedFeed = sharedFlagsModule.FFlagSduiPoolBackedFeed
local t = {
	[gameCollectionItemType.TwoByOneTile] = { colSpan = 2, rowSpan = 1 }
}

local function defaultGetSpanConfig(p0) --[[ line: 75 ]]
	-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (ref), spanForItemType (ref), t (ref)
	local var5 = p0 and (if fFlagLuaAppEnableNxMRoduxApportioning then spanForItemType[p0.componentType] else t[p0.componentType])
	
	return if var5 then {
		colSpan = var5.colSpan,
		rowSpan = if fFlagLuaAppEnableNxMRoduxApportioning then var5.rowSpan else 1,
		minRowPadding = tonumber(p0.minRowPadding) or 0,
		alignmentType = p0.alignmentType
	} else nil
end

local function processOneGrid(p1, p2, p3, p4, p5, p6, p7) --[[ line: 94 ]]
	-- upvalues: discoveryEventErrorLogger (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref), fFlagSduiPoolBackedFeed (ref), fFlagLuaAppApportioningInCollectionViews (ref), defaultGetSpanConfig (ref)
	local var6 = p5 * p4
	local t = {}
	local t_1 = {}
	local var9 = 0
	local var10 = 1
	local t_2 = {}
	
	local function nextFreePosition(p8) --[[ line: 119 ]]
		-- upvalues: p4 (ref), t_2 (ref)
		repeat
			local var20 = math.floor(p8 / p4) + 1
			local var21 = not t_2[var20] or t_2[var20][p8 % p4 + 1] ~= -1
			if not var21 then
				p8 += 1
			end
		until var21
		return p8
	end
	
	local function writeLayoutCell(p9, p10, p11) --[[ line: 133 ]]
		-- upvalues: p5 (ref), discoveryEventErrorLogger (copy), p4 (ref), t_2 (ref)
		if p5 < p9 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_LayoutWritePastMaxRows", "writeLayoutCell attempted to write past maxRows", { row = p9, col = p10, maxRows = p5, itemsPerRow = p4 })
			
			return
		elseif not t_2[p9] then
			t_2[p9] = {}
		end
		t_2[p9][p10] = p11
	end
	
	local function tryPlaceSpanTile(p12, p13) --[[ line: 153 ]]
		-- upvalues: fFlagLuaAppEnableNxMRoduxApportioning (copy), fFlagSduiPoolBackedFeed (copy), p7 (ref), nextFreePosition (ref), var9 (write), p4 (ref), var10 (write), var6 (ref), p5 (ref), p1 (ref), writeLayoutCell (ref), t (ref)
		local colSpan = p13.colSpan
		local var22 = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then p13.rowSpan else nil
		local minRowPadding = p13.minRowPadding
		local alignmentType = p13.alignmentType
		local var23 = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then nextFreePosition(var9) else var9
		local var24 = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then math.floor(var23 / p4) + 1 else math.ceil((var9 + 1) / p4)
		local var25 = var23 % p4 + 1
		
		if var24 < var10 then
			return false
		elseif not fFlagLuaAppEnableNxMRoduxApportioning and (not fFlagSduiPoolBackedFeed or not p7) and var6 < var9 + colSpan then
			return false
		elseif alignmentType == "LeftPin" and var25 ~= 1 then
			return false
		elseif alignmentType == "RightPin" and var25 + colSpan - 1 ~= p4 then
			return false
		elseif p4 < var25 + colSpan - 1 then
			return false
		elseif (fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7) and p5 < var24 + var22 - 1 then
			return false
		elseif (fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7) and (var22 > 1 and #p1 - p12 < var25 - 1) then
			return false
		elseif fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then
			for i_1 = 0, var22 - 1 do
				for i = 0, colSpan - 1 do
					writeLayoutCell(var24 + i_1, var25 + i, -1)
				end
			end
			writeLayoutCell(var24, var25, p12)
			var9 = var23 + colSpan
			var10 = var24 + var22 - 1 + minRowPadding
		else
			table.insert(t, p12)
			var9 += colSpan
			var10 = var24 + minRowPadding
		end
		return true
	end
	
	local function tryPlaceDeferredSpanTiles() --[[ line: 229 ]]
		-- upvalues: t_1 (ref), tryPlaceSpanTile (ref)
		while #t_1 > 0 do
			local var26 = t_1[1]
			
			if not tryPlaceSpanTile(var26.index, var26.spanConfig) then break end
			table.remove(t_1, 1)
		end
	end
	
	for i, v in p3 do
		if #t_1 > 0 then
			table.insert(t_1, v)
		elseif not tryPlaceSpanTile(v.index, v.spanConfig) then
			table.insert(t_1, v)
		end
	end
	local var16 = p2
	
	for i_1 = p2, #p1 do
		local var17 = p1[i_1]
		
		if not var17 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_InvalidEntry", "calculateSpanAwareGrids called with an invalid entry", {
				allEntriesCount = #p1,
				indexInAllEntries = i_1,
				itemsPerRow = p4
			})
			var16 = i_1 + 1
			continue
		elseif var6 <= var9 then
			break
		end
		local var18 = if fFlagLuaAppApportioningInCollectionViews and p6 ~= nil then p6(var17, i_1) else defaultGetSpanConfig(var17)
		
		if var18 then
			if #t_1 > 0 then
				table.insert(t_1, { index = i_1, spanConfig = var18 })
			elseif not tryPlaceSpanTile(i_1, var18) then
				table.insert(t_1, { index = i_1, spanConfig = var18 })
			end
			var16 = i_1 + 1
		elseif fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then
			local var19 = nextFreePosition(var9)
			
			if var6 <= var19 then break end
			writeLayoutCell(math.floor(var19 / p4) + 1, var19 % p4 + 1, i_1)
			var9 = var19 + 1
		else
			table.insert(t, i_1)
			var9 += 1
		end
		tryPlaceDeferredSpanTiles()
		var16 = i_1 + 1
	end
	return {
		placedIndices = t,
		pendingSpanTiles = t_1,
		nextStartIndex = var16,
		layout = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p7 then t_2 else nil
	}
end

return {
	calculateSpanAwareGrids = function(p14, p15, p16, p17, p18) --[[ line: 322 ]]
		-- upvalues: discoveryEventErrorLogger (ref), processOneGrid (ref), fFlagLuaAppApportioningInCollectionViews (ref), fFlagSduiPoolBackedFeed (ref), fFlagLuaAppEnableNxMRoduxApportioning (ref)
		if not p14 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_MissingEntries", "calculateSpanAwareGrids called without entries", { gridConfigsCount = #p15, itemsPerRow = p16 })
			
			return {}
		elseif #p14 == 0 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_EmptyEntries", "calculateSpanAwareGrids called with empty entries", {
				allEntriesCount = #p14,
				gridConfigsCount = #p15,
				itemsPerRow = p16
			})
			
			return {}
		elseif #p15 == 0 then
			return {}
		elseif not p16 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_MissingItemsPerRow", "calculateSpanAwareGrids called without itemsPerRow", { allEntriesCount = #p14, gridConfigsCount = #p15 })
			
			return {}
		elseif p16 <= 0 then
			discoveryEventErrorLogger.reportError("CalculateSpanAwareGrids_InvalidItemsPerRow", "calculateSpanAwareGrids called with invalid itemsPerRow", {
				allEntriesCount = #p14,
				gridConfigsCount = #p15,
				itemsPerRow = p16
			})
			
			return {}
		end
		local t = {}
		local var28 = 1
		local t_1 = {}
		
		for i, v in p15 do
			local maxRows = v.maxRows
			
			if not maxRows or maxRows <= 0 then
				maxRows = 1e999
			end
			local var30 = processOneGrid(p14, var28, t_1, p16, maxRows, if fFlagLuaAppApportioningInCollectionViews then p17 else nil, if fFlagSduiPoolBackedFeed then p18 else nil)
			t[v.sortKey] = {
				entryIndices = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p18 then nil else var30.placedIndices,
				layout = if fFlagLuaAppEnableNxMRoduxApportioning or fFlagSduiPoolBackedFeed and p18 then var30.layout else nil
			}
			var28 = var30.nextStartIndex
			t_1 = var30.pendingSpanTiles
		end
		return t
	end,
	processOneGrid = processOneGrid
}