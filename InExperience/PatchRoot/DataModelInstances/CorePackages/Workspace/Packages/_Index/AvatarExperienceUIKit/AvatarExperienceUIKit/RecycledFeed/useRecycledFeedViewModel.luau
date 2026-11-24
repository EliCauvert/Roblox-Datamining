local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local _ = require(script.Parent.RecycledFeedTypes)
local RecycledFeedRowModule = require(script.Parent.RecycledFeedRow)
local _ = require(script.Parent.RecycledFeedRowContext)
local UseInitialScrollOffsetModule = require(script.Parent.useInitialScrollOffset)
local UseRecycledFeedHandleModule = require(script.Parent.useRecycledFeedHandle)
local config = {
	readiness = ViewRecyclerModule.RecyclableViewReadiness.ReadyOnCommit
}
local config1 = {
	recordMeasurementAndShouldUpdateEstimates = function(_): boolean
		return false
	end
}

local function getItemKey(p1)
	return p1.key
end

local RecyclableViews = {}

local function getItemType(p1)
	-- upvalues: RecyclableViews (copy), ViewRecyclerModule (copy), RecycledFeedRowModule (copy), config (copy)
	local RecyclableView = RecyclableViews[p1.kind]
	
	if RecyclableView == nil then
		RecyclableView = ViewRecyclerModule.createRecyclableView(RecycledFeedRowModule, config)
		RecyclableViews[p1.kind] = RecyclableView
	end
	return RecyclableView
end

local function buildRows(Items, Rows)
	local Buffer = table.create(#Items)
	local RowItemsByKey = {}
	local ItemsByKey = {}
	local DuplicateKeys = {}
	local HasRows = Rows ~= nil
	for _, item in Items do
		if ItemsByKey[item.key] ~= nil then
			table.insert(DuplicateKeys, item.key)
			continue
		end
		local RowItemsByKeyEntry = if Rows then Rows.rowItemsByKey[item.key] else nil
		local Frozen = if RowItemsByKeyEntry == nil or RowItemsByKeyEntry.kind ~= item.kind then table.freeze({ key = item.key, kind = item.kind }) else RowItemsByKeyEntry
		table.insert(Buffer, Frozen)
		
		if HasRows and Rows.rowItems[#Buffer] ~= Frozen then
			HasRows = false
		end
		RowItemsByKey[item.key] = Frozen
		ItemsByKey[item.key] = item
	end
	if HasRows and #Rows.rowItems ~= #Buffer then
		HasRows = false
	end
	return {
		rowItems = if HasRows then Rows.rowItems else Buffer,
		rowItemsByKey = RowItemsByKey,
		itemsByKey = ItemsByKey,
		duplicateKeys = DuplicateKeys
	}
end

local function _(Tbl, p1)
	local Copy = table.clone(Tbl)
	
	function Copy.updateItemMeasurement(p2)
		-- upvalues: Tbl (copy), p1 (copy)
		local UpdateItemMeasurementResult = Tbl.updateItemMeasurement(p2)
		
		if UpdateItemMeasurementResult.accepted then
			p1(p2)
		end
		return UpdateItemMeasurementResult
	end
	
	return Copy
end

return function(Frame)
	-- upvalues: ReactModule (copy), buildRows (copy), UseInitialScrollOffsetModule (copy), ViewRecyclerModule (copy), config1 (copy), getItemKey (copy), UseRecycledFeedHandleModule (copy), getItemType (copy)
	local UseRefResult = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: buildRows (upval), Frame (copy), UseRefResult1 (copy)
		return (buildRows(Frame.items, UseRefResult1.current))
	end, { Frame.items })
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), UseMemoResult (copy)
		UseRefResult1.current = UseMemoResult
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		for _, duplicateKey in UseMemoResult.duplicateKeys do
			warn(`RecycledFeed: dropped an item with duplicate key "{duplicateKey}"`)
		end
	end, { UseMemoResult.duplicateKeys })
	local RowItems = UseMemoResult.rowItems
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseInitialScrollOffsetModuleResult = UseInitialScrollOffsetModule(Frame.initialScrollOffset, RowItems, UseRefResult2)
	local OnRowMeasuredFunction = UseInitialScrollOffsetModuleResult.onRowMeasured
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult3 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult3 (copy), UseRefResult (copy), UseStateResult2 (copy), OnRowMeasuredFunction (copy)
		if not UseRefResult3.current and p1.length > 0 then
			UseRefResult3.current = true
			task.defer(function()
				-- upvalues: UseRefResult (upval), UseStateResult2 (upval)
				if UseRefResult.current then
					UseStateResult2(true)
				end
			end)
		end
		OnRowMeasuredFunction(p1.itemKey)
	end, { OnRowMeasuredFunction })
	local UseRefResult4 = ReactModule.useRef(nil)
	local Current = if Frame.estimatedRowLength == nil then UseRefResult4.current else math.max(1, (math.round(Frame.estimatedRowLength)))
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult4 (copy), Current (copy)
		UseRefResult4.current = Current
	end, { Current })
	local IsPropagateEstimates = Frame.propagateEstimates ~= false
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Current (copy), ViewRecyclerModule (upval), IsPropagateEstimates (copy), config1 (upval), UseResult (copy)
		if Current == nil then
			return nil
		else
			local MeasuredResult = ViewRecyclerModule.Layout.measured({
				estimatedItemLength = Current,
				estimationPolicy = if IsPropagateEstimates then nil else config1
			})
			local Copy = table.clone(MeasuredResult)
			
			function Copy.updateItemMeasurement(p1)
				-- upvalues: MeasuredResult (copy), UseResult (copy)
				local UpdateItemMeasurementResult = MeasuredResult.updateItemMeasurement(p1)
				
				if UpdateItemMeasurementResult.accepted then
					UseResult(p1)
				end
				return UpdateItemMeasurementResult
			end
			
			return Copy
		end
	end, { Current, IsPropagateEstimates, UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult1 (copy)
		return function()
			-- upvalues: UseMemoResult1 (upval)
			if UseMemoResult1 then
				UseMemoResult1.destroy()
			end
		end
	end, { UseMemoResult1 })
	local UseRefResult5 = ReactModule.useRef(nil)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult5 (copy), UseRefResult2 (copy)
		local Current = UseRefResult5.current
		UseRefResult5.current = nil
		local Current1 = UseRefResult2.current
		
		if Current ~= nil and Current1 ~= nil then
			Current1.restoreScrollAnchorSnapshot(Current)
		end
		return function()
			-- upvalues: UseRefResult2 (upval), UseRefResult5 (upval)
			local Current = UseRefResult2.current
			UseRefResult5.current = if Current then Current.captureScrollAnchorSnapshot() else nil
		end
	end, { UseMemoResult1 })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: RowItems (copy), getItemKey (upval)
		return { items = RowItems, getItemKey = getItemKey }
	end, { RowItems })
	local UseRecycledFeedHandleModuleResult = UseRecycledFeedHandleModule(UseRefResult2, Frame.feedRef, Frame.scrollingFrameRef)
	local UseRefResult6 = ReactModule.useRef(false)
	local RequestImpressionsSignal = Frame.requestImpressionsSignal
	local UseRefResult7 = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: RequestImpressionsSignal (copy), UseRefResult7 (copy), UseRefResult (copy), UseRefResult6 (copy)
		if RequestImpressionsSignal ~= nil and not UseRefResult7.current then
			UseRefResult7.current = true
			task.defer(function()
				-- upvalues: UseRefResult7 (upval), UseRefResult (upval), UseRefResult6 (upval), RequestImpressionsSignal (upval)
				UseRefResult7.current = false
				
				if UseRefResult.current and UseRefResult6.current then
					RequestImpressionsSignal:fire()
				end
			end)
			
			return
		end
	end, { RequestImpressionsSignal })
	local OnVisibleRangeChangedFunction = UseInitialScrollOffsetModuleResult.onVisibleRangeChanged
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: OnVisibleRangeChangedFunction (copy), UseResult1 (copy)
		OnVisibleRangeChangedFunction(p1)
		UseResult1()
	end, { OnVisibleRangeChangedFunction, UseResult1 })
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: Frame (copy)
		return if Frame.endReachedThreshold == nil then nil else { viewportFraction = Frame.endReachedThreshold }
	end, { Frame.endReachedThreshold })
	local IsHideUntilMeasured = Frame.hideUntilMeasured ~= false
	local NoIsRestoring: boolean = (UseStateResult or not IsHideUntilMeasured) and not UseInitialScrollOffsetModuleResult.isRestoring or #RowItems == 0
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult6 (copy), NoIsRestoring (copy)
		UseRefResult6.current = NoIsRestoring
	end, { NoIsRestoring })
	ReactModule.useEffect(function()
		-- upvalues: NoIsRestoring (copy), UseResult1 (copy)
		if NoIsRestoring then
			UseResult1()
		end
	end, { NoIsRestoring, UseResult1 })
	
	return {
		data = UseMemoResult2,
		layout = UseMemoResult1,
		itemType = getItemType,
		overscan = math.max(0, Frame.overscan or 2),
		listRef = UseRefResult2,
		scrollingFrameRef = UseRecycledFeedHandleModuleResult,
		scrollingFrameProps = ReactModule.useMemo(function()
			-- upvalues: Frame (copy), NoIsRestoring (copy)
			return {
				Selectable = false,
				ClipsDescendants = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 0,
				Name = Frame.scrollingFrameName,
				Visible = NoIsRestoring,
				ElasticBehavior = Enum.ElasticBehavior.Always,
				ScrollingEnabled = Frame.scrollingEnabled
			}
		end, {
			Frame.scrollingFrameName,
			NoIsRestoring,
			Frame.scrollingEnabled
		}),
		onScrollOffsetChanged = Frame.onScroll,
		onVisibleRangeChanged = UseResult2,
		onEndReached = Frame.onEndReached,
		endReachedThreshold = UseMemoResult3,
		tag = Frame.tag,
		horizontalPadding = Frame.horizontalPadding or 0,
		clipsDescendants = Frame.clipsDescendants ~= false,
		rowContext = ReactModule.useMemo(function()
			-- upvalues: Frame (copy), UseMemoResult (copy), UseResult1 (copy)
			return {
				rowViews = Frame.rowViews,
				itemsByKey = UseMemoResult.itemsByKey,
				clearRemovedRows = Frame.clearRemovedRows == true,
				onRowCommitted = UseResult1
			}
		end, {
			Frame.rowViews,
			UseMemoResult.itemsByKey,
			Frame.clearRemovedRows,
			UseResult1
		}),
		Size = Frame.Size,
		LayoutOrder = Frame.LayoutOrder
	}
end