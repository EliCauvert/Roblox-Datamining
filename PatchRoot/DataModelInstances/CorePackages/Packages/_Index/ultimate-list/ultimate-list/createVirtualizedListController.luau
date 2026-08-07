-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

local var0 = script:FindFirstAncestor("ultimate-list")
local dataSourceMethodsModule = require(var0.DataSources.DataSourceMethods)
local _ = require(var0.DataSources)
local _ = require(var0.Dimensions)
local dimensionsMethodsModule = require(var0.Dimensions.DimensionsMethods)
local binarySearchIndexRangeInViewModule = require(script.binarySearchIndexRangeInView)
local exhaustiveMatchModule = require(var0.Util.exhaustiveMatch)
local var5 = require(var0.Util.createDebugLogger)("createVirtualizedListController")

return function(p0, p1, p2) --[[ line: 42 | named "createVirtualizedListController" ]]
	-- upvalues: dimensionsMethodsModule (ref), exhaustiveMatchModule (ref), var5 (ref), binarySearchIndexRangeInViewModule (ref), dataSourceMethodsModule (ref)
	local t = {
		scrollSizeAxis = 0,
		range = Vector3.new(),
		canvasSize = UDim2.new(),
		windowSize = Vector2.new(),
		lastDimensions = p1,
		cachedLastResult = {},
		dataSource = p0
	}
	local var7 = 0
	local var8 = 0
	local vector2 = Vector2.new()
	
	local function _(p3) --[[ line: 62 | named "getIndexRangeInViewForSize" ]]
		-- upvalues: var7 (write), var8 (write)
		return Vector3.new(var7 // p3 + 1, (var7 + var8) // p3 + 1)
	end
	
	local function getIndexRangeInViewForUDim2(p4) --[[ line: 69 ]]
		-- upvalues: dimensionsMethodsModule (copy), vector2 (write), p2 (ref), exhaustiveMatchModule (copy), var7 (write), var8 (write), var5 (copy)
		local amountPerNonDominantInGrid = dimensionsMethodsModule.getAmountPerNonDominantInGrid(p4, vector2, p2)
		local var16 = if p2 == "x" then p4.X.Offset elseif p2 == "y" then p4.Y.Offset else exhaustiveMatchModule(p2)
		local var17 = 1 + var7 // var16 * amountPerNonDominantInGrid
		local var18 = (1 + (var7 + var8) // var16) * amountPerNonDominantInGrid
		var5("getIndexRangeInView: amountPerNonDominant = %d, scrollAxis = %d, dominantSize = %d. Going from %d to %d", amountPerNonDominantInGrid, var7, var16, var17, var18)
		
		return Vector3.new(var17, var18)
	end
	
	local function getIndexRangeInView() --[[ line: 97 ]]
		-- upvalues: p1 (write), getIndexRangeInViewForUDim2 (ref), var7 (write), var8 (write), binarySearchIndexRangeInViewModule (copy), p0 (write), p2 (ref), exhaustiveMatchModule (copy)
		if p1.type == "consistentUDim2" then
			return getIndexRangeInViewForUDim2(p1.udim2)
		elseif p1.type == "consistentSize" then
			local size = p1.size
			
			return Vector3.new(var7 // size + 1, (var7 + var8) // size + 1)
		elseif p1.type == "getter" then
			return binarySearchIndexRangeInViewModule(p0, p1.callback, var7, var8, p2)
		elseif p1.type ~= "spaced" then
			return exhaustiveMatchModule(p1.type)
		elseif p1.inner.type == "consistentSize" then
			local var19 = p1.inner.size + p1.spacing
			
			return Vector3.new(var7 // var19 + 1, (var7 + var8) // var19 + 1)
		elseif p1.inner.type == "consistentUDim2" then
			return getIndexRangeInViewForUDim2(p1.inner.udim2 + UDim2.fromOffset(if p2 == "x" then p1.spacing else 0, if p2 == "y" then p1.spacing else 0))
		elseif p1.inner.type == "spaced" or p1.inner.type == "getter" then
			error("Unsupported spaced dimensions")
			
			return
		end
		return exhaustiveMatchModule(p1.inner.type)
	end
	
	local t_1 = {}
	
	local _ = function() --[[ line: 127 | named "callUpdateCallbacks" ]]
		-- upvalues: t_1 (ref)
		for i in t_1 do
			i()
		end
	end
	
	local function update() --[[ line: 133 ]]
		-- upvalues: t (write), var7 (write), var8 (write), vector2 (write), p0 (write), p1 (write), getIndexRangeInView (ref), dataSourceMethodsModule (copy), var5 (copy), t_1 (ref), dimensionsMethodsModule (copy), p2 (ref), exhaustiveMatchModule (copy)
		if t.offsetBoundaries ~= nil and t.offsetBoundaries.X <= var7 and (var8 + var7 <= t.offsetBoundaries.Y and t.windowSize == vector2) and (t.dataSource == p0 and t.lastDimensions == p1) then return end
		local var20 = getIndexRangeInView()
		local byRange = dataSourceMethodsModule.getByRange(p0, var20)
		
		if #byRange == 0 then
			var5("View changed, but no items in list")
			t = {
				range = var20,
				canvasSize = UDim2.new(),
				windowSize = vector2,
				lastDimensions = p1,
				cachedLastResult = {},
				offsetBoundaries = Vector3.new(var7, var8 + var7),
				dataSource = p0
			}
			
			for i in t_1 do
				i()
			end
			return
		else
			local uDimRect = dimensionsMethodsModule.getUDimRect(p1, byRange[1], var20.X, vector2, p2)
			local uDimRect_1 = dimensionsMethodsModule.getUDimRect(p1, byRange[#byRange], var20.Y, vector2, p2)
			var5("View changed: %d..%d (scroll axis: %d, window axis: %d, offset boundaries: %* - %*)", var20.X, var20.Y, var7, var8, t.offsetBoundaries and t.offsetBoundaries.X, t.offsetBoundaries and t.offsetBoundaries.Y)
			t = {
				range = var20,
				canvasSize = dimensionsMethodsModule.getCanvasSize(p1, p0, vector2, p2),
				windowSize = vector2,
				lastDimensions = p1,
				cachedLastResult = byRange,
				offsetBoundaries = Vector3.new(if p2 == "x" then uDimRect.position.X.Offset elseif p2 == "y" then uDimRect.position.Y.Offset else exhaustiveMatchModule(p2), if p2 == "x" then uDimRect_1.position.X.Offset + uDimRect_1.size.X.Offset elseif p2 == "y" then uDimRect_1.position.Y.Offset + uDimRect_1.size.Y.Offset else exhaustiveMatchModule(p2)),
				dataSource = p0
			}
			
			for i in t_1 do
				i()
			end
		end
	end
	
	local var14 = if p0.type == "mutableSource" then p0.methods.bindToChanged(update) else nil
	
	return {
		setScrollAxis = function(value) --[[ line: 208 ]]
			-- upvalues: var7 (write), update (ref)
			var7 = value
			update()
		end,
		setDataSource = function(value) --[[ line: 213 ]]
			-- upvalues: p0 (write), dataSourceMethodsModule (copy), update (ref)
			assert(p0.type == value.type, "Data source type changed, you must keep it the same")
			
			if dataSourceMethodsModule.equals(p0, value) then
				return
			end
			p0 = value
			update()
		end,
		setDimensions = function(value) --[[ line: 224 ]]
			-- upvalues: dimensionsMethodsModule (copy), p1 (write), update (ref)
			if dimensionsMethodsModule.equals(p1, value) then
				return
			end
			p1 = value
			update()
		end,
		setWindowSize = function(value) --[[ line: 233 ]]
			-- upvalues: vector2 (write), var8 (write), dimensionsMethodsModule (copy), p2 (ref), update (ref)
			if vector2 == value then
				return
			end
			vector2 = value
			var8 = dimensionsMethodsModule.getDominantAxis(value, p2)
			update()
		end,
		getWindowSize = function() --[[ line: 244 ]]
			-- upvalues: vector2 (write)
			return vector2
		end,
		get = function() --[[ line: 248 ]]
			-- upvalues: t (write)
			return t.cachedLastResult
		end,
		getCanvasSize = function() --[[ line: 252 ]]
			-- upvalues: t (write)
			return t.canvasSize
		end,
		getRange = function() --[[ line: 256 ]]
			-- upvalues: t (write)
			return t.range
		end,
		bindToUpdate = function(p5) --[[ line: 260 ]]
			-- upvalues: t_1 (ref)
			t_1[p5] = true
			
			return function() --[[ line: 262 ]]
				-- upvalues: t_1 (copy), p5 (ref)
				t_1[p5] = nil
			end
		end,
		destroy = function() --[[ line: 271 ]]
			-- upvalues: var14 (ref)
			if var14 ~= nil then
				var14()
			end
		end
	}
end