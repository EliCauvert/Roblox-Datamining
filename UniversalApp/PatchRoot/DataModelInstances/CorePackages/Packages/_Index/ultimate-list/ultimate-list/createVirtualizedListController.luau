local var1 = script:FindFirstAncestor("ultimate-list")
local dataSourceMethodsModule = require(var1.DataSources.DataSourceMethods)
local _ = require(var1.DataSources)
local _ = require(var1.Dimensions)
local dimensionsMethodsModule = require(var1.Dimensions.DimensionsMethods)
local binarySearchIndexRangeInViewModule = require(script.binarySearchIndexRangeInView)
local exhaustiveMatchModule = require(var1.Util.exhaustiveMatch)
local var2 = require(var1.Util.createDebugLogger)("createVirtualizedListController")

return function(p1, p2, p3)
	-- upvalues: dimensionsMethodsModule (ref), exhaustiveMatchModule (ref), var2 (ref), binarySearchIndexRangeInViewModule (ref), dataSourceMethodsModule (ref)
	local t = {
		scrollSizeAxis = 0,
		range = Vector3.new(),
		canvasSize = UDim2.new(),
		windowSize = Vector2.new(),
		lastDimensions = p2,
		cachedLastResult = {},
		dataSource = p1
	}
	local var3 = 0
	local var4 = 0
	local vector2 = Vector2.new()
	local var5 = 0
	
	local function _()
		-- upvalues: var3 (write), var5 (write), var4 (write)
		local maxValue = math.max(0, var3 - var5)
		
		return maxValue, var3 + var4 + var5 - maxValue
	end
	
	local _ = function(p4, p5, p6)
		return Vector3.new(p5 // p4 + 1, (p5 + p6) // p4 + 1)
	end
	
	local function getIndexRangeInViewForUDim2(p4, p5, p6)
		-- upvalues: dimensionsMethodsModule (copy), vector2 (write), p3 (ref), exhaustiveMatchModule (copy), var2 (copy)
		local amountPerNonDominantInGrid = dimensionsMethodsModule.getAmountPerNonDominantInGrid(p4, vector2, p3)
		local var6 = if p3 == "x" then p4.X.Offset elseif p3 == "y" then p4.Y.Offset else exhaustiveMatchModule(p3)
		local var7 = 1 + p5 // var6 * amountPerNonDominantInGrid
		local var8 = (1 + (p5 + p6) // var6) * amountPerNonDominantInGrid
		var2("getIndexRangeInView: amountPerNonDominant = %d, scrollAxis = %d, dominantSize = %d. Going from %d to %d", amountPerNonDominantInGrid, p5, var6, var7, var8)
		
		return Vector3.new(var7, var8)
	end
	
	local function getIndexRangeInView()
		-- upvalues: var3 (write), var5 (write), var4 (write), p2 (write), getIndexRangeInViewForUDim2 (ref), binarySearchIndexRangeInViewModule (copy), p1 (write), p3 (ref), exhaustiveMatchModule (copy)
		local maxValue = math.max(0, var3 - var5)
		local var6 = var3 + var4 + var5 - maxValue
		
		if p2.type == "consistentUDim2" then
			return getIndexRangeInViewForUDim2(p2.udim2, maxValue, var6)
		elseif p2.type == "consistentSize" then
			local size = p2.size
			
			return Vector3.new(maxValue // size + 1, (maxValue + var6) // size + 1)
		elseif p2.type == "getter" then
			return binarySearchIndexRangeInViewModule(p1, p2.callback, maxValue, var6, p3)
		elseif p2.type ~= "spaced" then
			return exhaustiveMatchModule(p2.type)
		elseif p2.inner.type == "consistentSize" then
			local var7 = p2.inner.size + p2.spacing
			
			return Vector3.new(maxValue // var7 + 1, (maxValue + var6) // var7 + 1)
		elseif p2.inner.type == "consistentUDim2" then
			return getIndexRangeInViewForUDim2(p2.inner.udim2 + UDim2.fromOffset(if p3 == "x" then p2.spacing else 0, if p3 == "y" then p2.spacing else 0), maxValue, var6)
		elseif p2.inner.type == "spaced" or p2.inner.type == "getter" then
			error("Unsupported spaced dimensions")
			
			return
		end
		return exhaustiveMatchModule(p2.inner.type)
	end
	
	local t_1 = {}
	
	local _ = function()
		-- upvalues: t_1 (ref)
		for i in t_1 do
			i()
		end
	end
	
	local function update()
		-- upvalues: var3 (write), var5 (write), var4 (write), t (write), vector2 (write), p1 (write), p2 (write), getIndexRangeInView (ref), dataSourceMethodsModule (copy), var2 (copy), dimensionsMethodsModule (copy), p3 (ref), t_1 (ref), exhaustiveMatchModule (copy)
		local maxValue = math.max(0, var3 - var5)
		local var6 = var3 + var4 + var5 - maxValue
		
		if t.offsetBoundaries ~= nil and t.offsetBoundaries.X <= maxValue and (var6 + maxValue <= t.offsetBoundaries.Y and t.windowSize == vector2) and (t.dataSource == p1 and t.lastDimensions == p2) then return end
		local var7 = getIndexRangeInView()
		local byRange = dataSourceMethodsModule.getByRange(p1, var7)
		
		if #byRange == 0 then
			var2("View changed, but no items in list")
			t = {
				range = var7,
				canvasSize = dimensionsMethodsModule.getCanvasSize(p2, p1, vector2, p3),
				windowSize = vector2,
				lastDimensions = p2,
				cachedLastResult = {},
				offsetBoundaries = Vector3.new(maxValue, var6 + maxValue),
				dataSource = p1
			}
			
			for i in t_1 do
				i()
			end
			return
		else
			local uDimRect = dimensionsMethodsModule.getUDimRect(p2, byRange[1], var7.X, vector2, p3)
			local uDimRect_1 = dimensionsMethodsModule.getUDimRect(p2, byRange[#byRange], var7.Y, vector2, p3)
			var2("View changed: %d..%d (scroll axis: %d, window axis: %d, offset boundaries: %* - %*)", var7.X, var7.Y, var3, var4, t.offsetBoundaries and t.offsetBoundaries.X, t.offsetBoundaries and t.offsetBoundaries.Y)
			t = {
				range = var7,
				canvasSize = dimensionsMethodsModule.getCanvasSize(p2, p1, vector2, p3),
				windowSize = vector2,
				lastDimensions = p2,
				cachedLastResult = byRange,
				offsetBoundaries = Vector3.new(if p3 == "x" then uDimRect.position.X.Offset elseif p3 == "y" then uDimRect.position.Y.Offset else exhaustiveMatchModule(p3), if p3 == "x" then uDimRect_1.position.X.Offset + uDimRect_1.size.X.Offset elseif p3 == "y" then uDimRect_1.position.Y.Offset + uDimRect_1.size.Y.Offset else exhaustiveMatchModule(p3)),
				dataSource = p1
			}
			
			for i in t_1 do
				i()
			end
		end
	end
	
	local var8 = if p1.type == "mutableSource" then p1.methods.bindToChanged(update) else nil
	
	return {
		setScrollAxis = function(value)
			-- upvalues: var3 (write), update (ref)
			var3 = value
			update()
		end,
		setDataSource = function(value)
			-- upvalues: p1 (write), dataSourceMethodsModule (copy), update (ref)
			assert(p1.type == value.type, "Data source type changed, you must keep it the same")
			
			if dataSourceMethodsModule.equals(p1, value) then
				return
			end
			p1 = value
			update()
		end,
		setDimensions = function(value)
			-- upvalues: dimensionsMethodsModule (copy), p2 (write), update (ref)
			if dimensionsMethodsModule.equals(p2, value) then
				return
			end
			p2 = value
			update()
		end,
		setWindowSize = function(value)
			-- upvalues: vector2 (write), var4 (write), dimensionsMethodsModule (copy), p3 (ref), update (ref)
			if vector2 == value then
				return
			end
			vector2 = value
			var4 = dimensionsMethodsModule.getDominantAxis(value, p3)
			update()
		end,
		getWindowSize = function()
			-- upvalues: vector2 (write)
			return vector2
		end,
		setOverscan = function(value)
			-- upvalues: var5 (write), update (ref)
			assert(value >= 0, "overscan must not be negative")
			
			if var5 == value then
				return
			end
			var5 = value
			update()
		end,
		get = function()
			-- upvalues: t (write)
			return t.cachedLastResult
		end,
		getCanvasSize = function()
			-- upvalues: t (write)
			return t.canvasSize
		end,
		getRange = function()
			-- upvalues: t (write)
			return t.range
		end,
		bindToUpdate = function(p4)
			-- upvalues: t_1 (ref)
			t_1[p4] = true
			
			return function()
				-- upvalues: t_1 (copy), p4 (ref)
				t_1[p4] = nil
			end
		end,
		destroy = function()
			-- upvalues: var8 (ref)
			if var8 ~= nil then
				var8()
			end
		end
	}
end