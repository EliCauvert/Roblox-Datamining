local UltimateList = script:FindFirstAncestor("ultimate-list")
local DataSourceMethodsModule = require(UltimateList.DataSources.DataSourceMethods)
local _ = require(UltimateList.DataSources)
local _ = require(UltimateList.Dimensions)
local DimensionsMethodsModule = require(UltimateList.Dimensions.DimensionsMethods)
local BinarySearchIndexRangeInViewModule = require(script.binarySearchIndexRangeInView)
local ExhaustiveMatchModule = require(UltimateList.Util.exhaustiveMatch)
local CreateVirtualizedListController = require(UltimateList.Util.createDebugLogger)("createVirtualizedListController")

return function(DataSource, LastDimensions, p1) --[[ Line: 43 | Named "createVirtualizedListController" ]]
	-- upvalues: DimensionsMethodsModule (copy), ExhaustiveMatchModule (copy), CreateVirtualizedListController (copy), BinarySearchIndexRangeInViewModule (copy), DataSourceMethodsModule (copy)
	local config = {
		scrollSizeAxis = 0,
		range = Vector3.new(),
		canvasSize = UDim2.new(),
		windowSize = Vector2.new(),
		lastDimensions = LastDimensions,
		cachedLastResult = {},
		dataSource = DataSource
	}
	local ScrollAxis = 0
	local DominantAxis = 0
	local _Vector2 = Vector2.new()
	local Overscan = 0
	
	local function _() --[[ Line: 64 | Named "getRangeAxes" ]]
		-- upvalues: ScrollAxis (ref), Overscan (ref), DominantAxis (ref)
		local Largest = math.max(0, ScrollAxis - Overscan)
		
		return Largest, ScrollAxis + DominantAxis + Overscan - Largest
	end
	
	local _ = function(p2: number, p3: number, p4: number): Vector3 --[[ Line: 70 | Named "getIndexRangeInViewForSize" ]]
		return (Vector3.new(p3 // p2 + 1, (p3 + p4) // p2 + 1))
	end
	
	local function getIndexRangeInViewForUDim2(Udim, Largest: number, p2: number): Vector3 --[[ Line: 81 ]]
		-- upvalues: DimensionsMethodsModule (upval), _Vector2 (ref), p1 (copy), ExhaustiveMatchModule (upval), CreateVirtualizedListController (upval)
		local AmountPerNonDominantInGrid = DimensionsMethodsModule.getAmountPerNonDominantInGrid(Udim, _Vector2, p1)
		local Offset = if p1 == "x" then Udim.X.Offset elseif p1 == "y" then Udim.Y.Offset else ExhaustiveMatchModule(p1)
		local X = 1 + Largest // Offset * AmountPerNonDominantInGrid
		local Y = (1 + (Largest + p2) // Offset) * AmountPerNonDominantInGrid
		CreateVirtualizedListController("getIndexRangeInView: amountPerNonDominant = %d, scrollAxis = %d, dominantSize = %d. Going from %d to %d", AmountPerNonDominantInGrid, Largest, Offset, X, Y)
		
		return (Vector3.new(X, Y))
	end
	
	local function getIndexRangeInView() --[[ Line: 113 ]]
		-- upvalues: ScrollAxis (ref), Overscan (ref), DominantAxis (ref), LastDimensions (ref), getIndexRangeInViewForUDim2 (copy), BinarySearchIndexRangeInViewModule (upval), DataSource (ref), p1 (copy), ExhaustiveMatchModule (upval)
		local Largest = math.max(0, ScrollAxis - Overscan)
		local ScrollAxisDelta = ScrollAxis + DominantAxis + Overscan - Largest
		
		if LastDimensions.type == "consistentUDim2" then
			return (getIndexRangeInViewForUDim2(LastDimensions.udim2, Largest, ScrollAxisDelta))
		elseif LastDimensions.type == "consistentSize" then
			local Size: number = LastDimensions.size
			
			return (Vector3.new(Largest // Size + 1, (Largest + ScrollAxisDelta) // Size + 1))
		elseif LastDimensions.type == "getter" then
			return BinarySearchIndexRangeInViewModule(DataSource, LastDimensions.callback, Largest, ScrollAxisDelta, p1)
		elseif LastDimensions.type ~= "spaced" then
			return ExhaustiveMatchModule(LastDimensions.type)
		elseif LastDimensions.inner.type == "consistentSize" then
			local NewSize = LastDimensions.inner.size + LastDimensions.spacing
			
			return (Vector3.new(Largest // NewSize + 1, (Largest + ScrollAxisDelta) // NewSize + 1))
		elseif LastDimensions.inner.type == "consistentUDim2" then
			return (getIndexRangeInViewForUDim2(LastDimensions.inner.udim2 + UDim2.fromOffset(if p1 == "x" then LastDimensions.spacing else 0, if p1 == "y" then LastDimensions.spacing else 0), Largest, ScrollAxisDelta))
		elseif LastDimensions.inner.type == "spaced" or LastDimensions.inner.type == "getter" then
			error("Unsupported spaced dimensions")
			
			return
		else
			return ExhaustiveMatchModule(LastDimensions.inner.type)
		end
	end
	
	local t = {}
	
	local _ = function() --[[ Line: 157 | Named "callUpdateCallbacks" ]]
		-- upvalues: t (copy)
		for i in t do
			i()
		end
	end
	
	local function update() --[[ Line: 163 ]]
		-- upvalues: ScrollAxis (ref), Overscan (ref), DominantAxis (ref), config (ref), _Vector2 (ref), DataSource (ref), LastDimensions (ref), getIndexRangeInView (copy), DataSourceMethodsModule (upval), CreateVirtualizedListController (upval), DimensionsMethodsModule (upval), p1 (copy), t (copy), ExhaustiveMatchModule (upval)
		local X = math.max(0, ScrollAxis - Overscan)
		local ScrollAxisDelta = ScrollAxis + DominantAxis + Overscan - X
		
		if config.offsetBoundaries ~= nil and config.offsetBoundaries.X <= X and ScrollAxisDelta + X <= config.offsetBoundaries.Y and config.windowSize == _Vector2 and config.dataSource == DataSource and config.lastDimensions == LastDimensions then return end
		local IndexRangeInView = getIndexRangeInView()
		local ByRange = DataSourceMethodsModule.getByRange(DataSource, IndexRangeInView)
		
		if #ByRange == 0 then
			CreateVirtualizedListController("View changed, but no items in list")
			config = {
				range = IndexRangeInView,
				canvasSize = DimensionsMethodsModule.getCanvasSize(LastDimensions, DataSource, _Vector2, p1),
				windowSize = _Vector2,
				lastDimensions = LastDimensions,
				cachedLastResult = {},
				offsetBoundaries = Vector3.new(X, ScrollAxisDelta + X),
				dataSource = DataSource
			}
			
			for i in t do
				i()
			end
			return
		else
			local UDimRect = DimensionsMethodsModule.getUDimRect(LastDimensions, ByRange[1], IndexRangeInView.X, _Vector2, p1)
			local UDimRect1 = DimensionsMethodsModule.getUDimRect(LastDimensions, ByRange[#ByRange], IndexRangeInView.Y, _Vector2, p1)
			CreateVirtualizedListController("View changed: %d..%d (scroll axis: %d, window axis: %d, offset boundaries: %* - %*)", IndexRangeInView.X, IndexRangeInView.Y, ScrollAxis, DominantAxis, config.offsetBoundaries and config.offsetBoundaries.X, config.offsetBoundaries and config.offsetBoundaries.Y)
			config = {
				range = IndexRangeInView,
				canvasSize = DimensionsMethodsModule.getCanvasSize(LastDimensions, DataSource, _Vector2, p1),
				windowSize = _Vector2,
				lastDimensions = LastDimensions,
				cachedLastResult = ByRange,
				offsetBoundaries = Vector3.new(if p1 == "x" then UDimRect.position.X.Offset elseif p1 == "y" then UDimRect.position.Y.Offset else ExhaustiveMatchModule(p1), if p1 == "x" then UDimRect1.position.X.Offset + UDimRect1.size.X.Offset elseif p1 == "y" then UDimRect1.position.Y.Offset + UDimRect1.size.Y.Offset else ExhaustiveMatchModule(p1)),
				dataSource = DataSource
			}
			
			for i1 in t do
				i1()
			end
		end
	end
	
	local BindToChangedResult = if DataSource.type == "mutableSource" then DataSource.methods.bindToChanged(update) else nil
	
	return {
		setScrollAxis = function(Value) --[[ Line: 240 ]]
			-- upvalues: ScrollAxis (ref), update (copy)
			ScrollAxis = Value
			update()
		end,
		setDataSource = function(Value) --[[ Line: 245 ]]
			-- upvalues: DataSource (ref), DataSourceMethodsModule (upval), update (copy)
			assert(DataSource.type == Value.type, "Data source type changed, you must keep it the same")
			
			if not DataSourceMethodsModule.equals(DataSource, Value) then
				DataSource = Value
				update()
				
				return
			end
		end,
		setDimensions = function(Value) --[[ Line: 256 ]]
			-- upvalues: DimensionsMethodsModule (upval), LastDimensions (ref), update (copy)
			if not DimensionsMethodsModule.equals(LastDimensions, Value) then
				LastDimensions = Value
				update()
				
				return
			end
		end,
		setWindowSize = function(Value) --[[ Line: 265 ]]
			-- upvalues: _Vector2 (ref), DominantAxis (ref), DimensionsMethodsModule (upval), p1 (copy), update (copy)
			if _Vector2 ~= Value then
				_Vector2 = Value
				DominantAxis = DimensionsMethodsModule.getDominantAxis(Value, p1)
				update()
				
				return
			end
		end,
		getWindowSize = function() --[[ Line: 276 ]]
			-- upvalues: _Vector2 (ref)
			return _Vector2
		end,
		setOverscan = function(Value: number) --[[ Line: 280 ]]
			-- upvalues: Overscan (ref), update (copy)
			assert(Value >= 0, "overscan must not be negative")
			
			if Overscan ~= Value then
				Overscan = Value
				update()
				
				return
			end
		end,
		get = function() --[[ Line: 291 ]]
			-- upvalues: config (ref)
			return config.cachedLastResult
		end,
		getCanvasSize = function() --[[ Line: 295 ]]
			-- upvalues: config (ref)
			return config.canvasSize
		end,
		getRange = function() --[[ Line: 299 ]]
			-- upvalues: config (ref)
			return config.range
		end,
		bindToUpdate = function(Key) --[[ Line: 303 ]]
			-- upvalues: t (copy)
			t[Key] = true
			
			return function() --[[ Line: 305 ]]
				-- upvalues: t (upval), Key (copy)
				t[Key] = nil
			end
		end,
		destroy = function() --[[ Line: 314 ]]
			-- upvalues: BindToChangedResult (copy)
			if BindToChangedResult ~= nil then
				BindToChangedResult()
			end
		end
	}
end