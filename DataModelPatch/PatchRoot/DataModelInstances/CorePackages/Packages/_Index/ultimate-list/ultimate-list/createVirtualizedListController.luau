local UltimateList = script:FindFirstAncestor("ultimate-list")
local DataSourceMethodsModule = require(UltimateList.DataSources.DataSourceMethods)
local _ = require(UltimateList.DataSources)
local _ = require(UltimateList.Dimensions)
local DimensionsMethodsModule = require(UltimateList.Dimensions.DimensionsMethods)
local BinarySearchIndexRangeInViewModule = require(script.binarySearchIndexRangeInView)
local ExhaustiveMatchModule = require(UltimateList.Util.exhaustiveMatch)
local CreateVirtualizedListController = require(UltimateList.Util.createDebugLogger)("createVirtualizedListController")

return function(DataSource, LastDimensions, p1)
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
	local X = 0
	local DominantAxis = 0
	local _Vector2 = Vector2.new()
	
	local function _(p2: number): Vector3
		-- upvalues: X (ref), DominantAxis (ref)
		return (Vector3.new(X // p2 + 1, (X + DominantAxis) // p2 + 1))
	end
	
	local function getIndexRangeInViewForUDim2(Udim): Vector3
		-- upvalues: DimensionsMethodsModule (upval), _Vector2 (ref), p1 (copy), ExhaustiveMatchModule (upval), X (ref), DominantAxis (ref), CreateVirtualizedListController (upval)
		local AmountPerNonDominantInGrid = DimensionsMethodsModule.getAmountPerNonDominantInGrid(Udim, _Vector2, p1)
		local Offset = if p1 == "x" then Udim.X.Offset elseif p1 == "y" then Udim.Y.Offset else ExhaustiveMatchModule(p1)
		local X1 = 1 + X // Offset * AmountPerNonDominantInGrid
		local Y = (1 + (X + DominantAxis) // Offset) * AmountPerNonDominantInGrid
		CreateVirtualizedListController("getIndexRangeInView: amountPerNonDominant = %d, scrollAxis = %d, dominantSize = %d. Going from %d to %d", AmountPerNonDominantInGrid, X, Offset, X1, Y)
		
		return (Vector3.new(X1, Y))
	end
	
	local function getIndexRangeInView()
		-- upvalues: LastDimensions (ref), getIndexRangeInViewForUDim2 (copy), X (ref), DominantAxis (ref), BinarySearchIndexRangeInViewModule (upval), DataSource (ref), p1 (copy), ExhaustiveMatchModule (upval)
		if LastDimensions.type == "consistentUDim2" then
			return (getIndexRangeInViewForUDim2(LastDimensions.udim2))
		elseif LastDimensions.type == "consistentSize" then
			local Size: number = LastDimensions.size
			
			return (Vector3.new(X // Size + 1, (X + DominantAxis) // Size + 1))
		elseif LastDimensions.type == "getter" then
			return BinarySearchIndexRangeInViewModule(DataSource, LastDimensions.callback, X, DominantAxis, p1)
		elseif LastDimensions.type ~= "spaced" then
			return ExhaustiveMatchModule(LastDimensions.type)
		elseif LastDimensions.inner.type == "consistentSize" then
			local NewSize = LastDimensions.inner.size + LastDimensions.spacing
			
			return (Vector3.new(X // NewSize + 1, (X + DominantAxis) // NewSize + 1))
		elseif LastDimensions.inner.type == "consistentUDim2" then
			return (getIndexRangeInViewForUDim2(LastDimensions.inner.udim2 + UDim2.fromOffset(if p1 == "x" then LastDimensions.spacing else 0, if p1 == "y" then LastDimensions.spacing else 0)))
		elseif LastDimensions.inner.type == "spaced" or LastDimensions.inner.type == "getter" then
			error("Unsupported spaced dimensions")
			
			return
		else
			return ExhaustiveMatchModule(LastDimensions.inner.type)
		end
	end
	
	local t = {}
	
	local _ = function()
		-- upvalues: t (copy)
		for i in t do
			i()
		end
	end
	
	local function update()
		-- upvalues: config (ref), X (ref), DominantAxis (ref), _Vector2 (ref), DataSource (ref), LastDimensions (ref), getIndexRangeInView (copy), DataSourceMethodsModule (upval), CreateVirtualizedListController (upval), t (copy), DimensionsMethodsModule (upval), p1 (copy), ExhaustiveMatchModule (upval)
		if config.offsetBoundaries ~= nil and config.offsetBoundaries.X <= X and DominantAxis + X <= config.offsetBoundaries.Y and config.windowSize == _Vector2 and config.dataSource == DataSource and config.lastDimensions == LastDimensions then return end
		local IndexRangeInView = getIndexRangeInView()
		local ByRange = DataSourceMethodsModule.getByRange(DataSource, IndexRangeInView)
		
		if #ByRange == 0 then
			CreateVirtualizedListController("View changed, but no items in list")
			config = {
				range = IndexRangeInView,
				canvasSize = UDim2.new(),
				windowSize = _Vector2,
				lastDimensions = LastDimensions,
				cachedLastResult = {},
				offsetBoundaries = Vector3.new(X, DominantAxis + X),
				dataSource = DataSource
			}
			
			for i in t do
				i()
			end
			return
		else
			local UDimRect = DimensionsMethodsModule.getUDimRect(LastDimensions, ByRange[1], IndexRangeInView.X, _Vector2, p1)
			local UDimRect1 = DimensionsMethodsModule.getUDimRect(LastDimensions, ByRange[#ByRange], IndexRangeInView.Y, _Vector2, p1)
			CreateVirtualizedListController("View changed: %d..%d (scroll axis: %d, window axis: %d, offset boundaries: %* - %*)", IndexRangeInView.X, IndexRangeInView.Y, X, DominantAxis, config.offsetBoundaries and config.offsetBoundaries.X, config.offsetBoundaries and config.offsetBoundaries.Y)
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
		setScrollAxis = function(Value)
			-- upvalues: X (ref), update (copy)
			X = Value
			update()
		end,
		setDataSource = function(Value)
			-- upvalues: DataSource (ref), DataSourceMethodsModule (upval), update (copy)
			assert(DataSource.type == Value.type, "Data source type changed, you must keep it the same")
			
			if not DataSourceMethodsModule.equals(DataSource, Value) then
				DataSource = Value
				update()
				
				return
			end
		end,
		setDimensions = function(Value)
			-- upvalues: DimensionsMethodsModule (upval), LastDimensions (ref), update (copy)
			if not DimensionsMethodsModule.equals(LastDimensions, Value) then
				LastDimensions = Value
				update()
				
				return
			end
		end,
		setWindowSize = function(Value)
			-- upvalues: _Vector2 (ref), DominantAxis (ref), DimensionsMethodsModule (upval), p1 (copy), update (copy)
			if _Vector2 ~= Value then
				_Vector2 = Value
				DominantAxis = DimensionsMethodsModule.getDominantAxis(Value, p1)
				update()
				
				return
			end
		end,
		getWindowSize = function()
			-- upvalues: _Vector2 (ref)
			return _Vector2
		end,
		get = function()
			-- upvalues: config (ref)
			return config.cachedLastResult
		end,
		getCanvasSize = function()
			-- upvalues: config (ref)
			return config.canvasSize
		end,
		getRange = function()
			-- upvalues: config (ref)
			return config.range
		end,
		bindToUpdate = function(Key)
			-- upvalues: t (copy)
			t[Key] = true
			
			return function()
				-- upvalues: t (upval), Key (copy)
				t[Key] = nil
			end
		end,
		destroy = function()
			-- upvalues: BindToChangedResult (copy)
			if BindToChangedResult ~= nil then
				BindToChangedResult()
			end
		end
	}
end