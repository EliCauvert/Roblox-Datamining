--!native

local FreezeFunction = table.freeze
local _ = require("../types")
local _ = require("../runtime/children")
local DiagnosticsModule = require("../diagnostics")
local _ = require("../host")
local LayoutModule = require("../collection/layout")
local SupportModule = require("./support")
local _ = require("../reactive/types")
local RetainModule = require("../collection/retain")
local CellModule = require("../reactive/cell")
local config = {
	from = true,
	key = true,
	render = true,
	recycle = true,
	mode = true,
	viewport = true,
	direction = true,
	layout = true,
	overscan = true,
	measured = true,
	follow = true,
	followThreshold = true,
	status = true,
	controls = true
}
local config1 = {
	kind = true,
	columns = true,
	itemSize = true,
	gap = true,
	crossSize = true,
	crossGap = true
}

local function _(p1, p2)
	return if p1 == nil then p2 elseif type(p1) == "number" and p1 == p1 then p1 else p2
end

local IdentityKey = require("../reactive/graph").identityKey

local function geometryOptions(p1)
	-- upvalues: SupportModule (copy), config1 (copy), DiagnosticsModule (copy)
	local OrderedCollectionLayout = SupportModule.optionsOf(p1, "OrderedCollection.layout", "kind = ..., itemSize = ...")
	SupportModule.noUnknownFields(OrderedCollectionLayout, "OrderedCollection.layout", config1)
	assert(type(OrderedCollectionLayout) == "table")
	local t = {}
	
	for i, value in OrderedCollectionLayout do
		t[i] = value
	end
	local Kind = t.kind or "list"
	
	if Kind ~= "list" and Kind ~= "grid" then
		return DiagnosticsModule.raise("collection/unknown-layout", "OrderedCollection was given a layout kind it does not have", {
			primitive = "OrderedCollection",
			expected = "\"list\" or \"grid\"",
			actual = DiagnosticsModule.describe(t.kind)
		})
	end
	local config = { count = 0 }
	local Largest = nil
	
	if Kind == "grid" then
		local Columns = t.columns
		Largest = math.max(1, (math.floor(if Columns == nil then 1 elseif type(Columns) == "number" and Columns == Columns then Columns else 1)))
	else
		Largest = 1
	end
	config.columns = Largest
	local ItemSize = t.itemSize
	config.rowSize = if ItemSize == nil then 1 elseif type(ItemSize) == "number" and ItemSize == ItemSize then ItemSize else 1
	local Gap = t.gap
	config.gap = if Gap == nil then 0 elseif type(Gap) == "number" and Gap == Gap then Gap else 0
	local CrossSize = t.crossSize
	config.crossSize = if CrossSize == nil then 0 elseif type(CrossSize) == "number" and CrossSize == CrossSize then CrossSize else 0
	local CrossGap = t.crossGap
	config.crossGap = if CrossGap == nil then 0 elseif type(CrossGap) == "number" and CrossGap == CrossGap then CrossGap else 0
	
	return config
end

return function(p2)
	-- upvalues: SupportModule (copy), config (copy), DiagnosticsModule (copy), IdentityKey (copy), CellModule (copy), geometryOptions (copy), LayoutModule (copy), FreezeFunction (copy), RetainModule (copy)
	local OrderedCollection = SupportModule.optionsOf(p2, "OrderedCollection", "from = ..., render = ...")
	SupportModule.noUnknownFields(OrderedCollection, "OrderedCollection", config)
	local OrderedCollection1 = SupportModule.sourceOf(OrderedCollection.from, "OrderedCollection", "from")
	
	if OrderedCollection.render == nil == (OrderedCollection.recycle == nil) then
		return DiagnosticsModule.raise("collection/render-or-recycle", "OrderedCollection needs exactly one of render and recycle", {
			primitive = "OrderedCollection",
			expected = "render = function(value, placement, key) or recycle = function(value, placement, key)",
			contract = "render mounts one row per key; recycle reuses rows and passes the key as a readable",
			fix = "pass render, or pass recycle when row content can follow a changing key"
		})
	end
	local OrderedCollection2 = if OrderedCollection.render == nil then nil else SupportModule.builderOf(OrderedCollection.render, "OrderedCollection", "render")
	local OrderedCollection3 = if OrderedCollection.recycle == nil then nil else SupportModule.builderOf(OrderedCollection.recycle, "OrderedCollection", "recycle")
	local IdentityKey1 = nil
	IdentityKey1 = if OrderedCollection.key == nil then IdentityKey else SupportModule.builderOf(OrderedCollection.key, "OrderedCollection", "key")
	local Mode = OrderedCollection.mode or "all"
	
	if Mode ~= "all" and Mode ~= "windowed" then
		return DiagnosticsModule.raise("collection/unknown-mode", "OrderedCollection was given a mode it does not have", {
			primitive = "OrderedCollection",
			expected = "\"all\" or \"windowed\"",
			contract = "the retention policy is explicit; there is no population at which one becomes the other",
			actual = DiagnosticsModule.describe(OrderedCollection.mode)
		})
	end
	local Direction = OrderedCollection.direction or "vertical"
	
	if Direction ~= "vertical" and Direction ~= "horizontal" then
		return DiagnosticsModule.raise("collection/unknown-direction", "OrderedCollection was given a direction it does not have", {
			primitive = "OrderedCollection",
			expected = "\"vertical\" or \"horizontal\"",
			actual = DiagnosticsModule.describe(OrderedCollection.direction)
		})
	end
	local v1: ((any) -> any)? = nil
	local GeometryOptionsResult = nil
	local LayoutFunction = OrderedCollection.layout
	local AsValueResult = CellModule.asValue(LayoutFunction)
	
	if type(LayoutFunction) == "function" then
		v1 = LayoutFunction
		GeometryOptionsResult = geometryOptions({})
	elseif AsValueResult == nil then
		GeometryOptionsResult = geometryOptions(LayoutFunction or {})
	else
		v1 = function(Callback)
			-- upvalues: AsValueResult (copy)
			return Callback(AsValueResult)
		end
		
		GeometryOptionsResult = geometryOptions({})
	end
	local Overscan = OrderedCollection.overscan
	local Largest = math.max(0, (math.floor(if Overscan == nil then 0 elseif type(Overscan) == "number" and Overscan == Overscan then Overscan else 0)))
	local FollowThreshold = OrderedCollection.followThreshold
	local FollowThreshold1 = if FollowThreshold == nil then 4 elseif type(FollowThreshold) == "number" and FollowThreshold == FollowThreshold then FollowThreshold else 4
	local IsEnd = OrderedCollection.follow == "end"
	local Callback = nil
	
	if OrderedCollection.viewport ~= nil then
		Callback = SupportModule.sourceOf(OrderedCollection.viewport, "OrderedCollection", "viewport")
	elseif Mode == "windowed" then
		return DiagnosticsModule.raise("collection/no-viewport", "OrderedCollection mode = \"windowed\" needs a viewport", {
			primitive = "OrderedCollection",
			contract = "a windowed collection retains what the viewport covers, so it has to be told where it is",
			fix = "pass viewport = a cell holding { offset = ..., size = ... }, or use mode = \"all\""
		})
	end
	local OrderedCollection4 = if OrderedCollection.measured == nil then nil else SupportModule.sourceOf(OrderedCollection.measured, "OrderedCollection", "measured")
	local OrderedCollection5 = if OrderedCollection.status == nil then nil else SupportModule.writableOf(OrderedCollection.status, "OrderedCollection", "status")
	local Controls = OrderedCollection.controls
	
	if Controls ~= nil and type(Controls) ~= "table" then
		return DiagnosticsModule.raise("collection/controls-not-a-table", "OrderedCollection cannot fill in these controls", {
			key = "controls",
			expected = "a table, which the collection fills in on mount",
			contract = "controls is an out-parameter: the collection writes its query functions into it",
			fix = "pass a table you keep -- local controls = {} -- and read controls.placementOf after mounting",
			actual = DiagnosticsModule.describe(Controls)
		})
	end
	local v2 = nil
	local v3 = nil
	local NewLayout = LayoutModule.create(GeometryOptionsResult)
	local t = {}
	local v4 = nil
	local Measured = 0
	local Following: boolean = IsEnd
	local v5 = nil
	local OffsetRevision = nil
	local v6 = nil
	local v7 = nil
	local OffsetOfResult = 0
	local First = 0
	local Flag = false
	local PlacementOfResults = {}
	local v8 = 1
	local v9 = 0
	local config1 = { values = {}, keys = {}, states = {} }
	local v10 = nil
	local config2 = { first = 1, last = 0, firstRow = 1, lastRow = 0 }
	local config3 = { first = 1, last = 0, firstRow = 1, lastRow = 0 }
	local config4 = { first = 1, last = 0, firstRow = 1, lastRow = 0 }
	
	local function _()
		-- upvalues: PlacementOfResults (copy), v8 (ref), v9 (ref)
		table.clear(PlacementOfResults)
		v8 = 1
		v9 = 0
	end
	
	local _ = function(Key)
		-- upvalues: PlacementOfResults (copy), LayoutModule (upval), NewLayout (ref), FreezeFunction (upval)
		local PlacementOfResult = PlacementOfResults[Key]
		
		if PlacementOfResult == nil then
			local PlacementOfResult1 = LayoutModule.placementOf(NewLayout, Key)
			FreezeFunction(PlacementOfResult1)
			PlacementOfResults[Key] = PlacementOfResult1
			
			return PlacementOfResult1
		else
			return PlacementOfResult
		end
	end
	
	local function keyIndex()
		-- upvalues: v3 (ref), v2 (ref), IdentityKey1 (ref)
		local v11 = v3
		
		if v11 ~= nil then
			return v11
		end
		local v12 = v2
		
		if v12 == nil then
			return {}
		end
		local t = {}
		
		for i = 1, #v12 do
			t[IdentityKey1(v12[i], i)] = i
		end
		v3 = t
		
		return t
	end
	
	local function rebuild(p3, p4)
		-- upvalues: NewLayout (ref), v3 (ref), v2 (ref), LayoutModule (upval), Flag (ref), PlacementOfResults (copy), v8 (ref), v9 (ref)
		local CreateResult = NewLayout
		v3 = nil
		v2 = p3
		p4.count = #p3
		local NewLayout1 = LayoutModule.create(p4)
		NewLayout = NewLayout1
		Flag = true
		
		if not CreateResult.uniform or CreateResult.columns ~= NewLayout1.columns or CreateResult.rowSize ~= NewLayout1.rowSize or CreateResult.gap ~= NewLayout1.gap or CreateResult.crossSize ~= NewLayout1.crossSize or CreateResult.crossGap ~= NewLayout1.crossGap then
			table.clear(PlacementOfResults)
			v8 = 1
			v9 = 0
		end
	end
	
	local function findAnchorIndex(p3, p4)
		-- upvalues: First (ref), IdentityKey1 (ref), keyIndex (copy)
		local CountP7 = #p3
		
		if First >= 1 and First <= CountP7 and IdentityKey1(p3[First], First) == p4 then
			return First
		end
		local FirstDelta = nil
		local NewFirst = nil
		for i = 1, 64 do
			FirstDelta = First - i
			
			if FirstDelta >= 1 and FirstDelta <= CountP7 and IdentityKey1(p3[FirstDelta], FirstDelta) == p4 then
				return FirstDelta
			end
			NewFirst = First + i
			
			if NewFirst >= 1 and NewFirst <= CountP7 and IdentityKey1(p3[NewFirst], NewFirst) == p4 then
				return NewFirst
			end
		end
		return keyIndex()[p4]
	end
	
	local function applyMeasurements(List)
		-- upvalues: keyIndex (copy), t (copy), LayoutModule (upval), NewLayout (ref), Measured (ref), Flag (ref), PlacementOfResults (copy), v8 (ref), v9 (ref)
		local KeyIndexResult = keyIndex()
		local Flag1 = false
		
		for i in t do
			local KeyIndexResultEntry = KeyIndexResult[i]
			
			if List[i] == nil or KeyIndexResultEntry == nil then
				if KeyIndexResultEntry ~= nil and LayoutModule.setItemSize(NewLayout, KeyIndexResultEntry, NewLayout.rowSize) then
					Flag1 = true
				end
				t[i] = nil
			end
		end
		Measured = 0
		
		for i1, value in List do
			local KeyIndexResultEntry = KeyIndexResult[i1]
			
			if KeyIndexResultEntry ~= nil then
				t[i1] = value
				
				if LayoutModule.setItemSize(NewLayout, KeyIndexResultEntry, value) then
					Flag1 = true
				end
				Measured += 1
			end
		end
		Flag = false
		
		if Flag1 then
			table.clear(PlacementOfResults)
			v8 = 1
			v9 = 0
		end
	end
	
	if Controls ~= nil then
		function Controls.indexOfKey(p5)
			-- upvalues: keyIndex (copy)
			return keyIndex()[p5]
		end
		
		function Controls.placementOf(CreateResult)
			-- upvalues: v8 (ref), v9 (ref), PlacementOfResults (copy), LayoutModule (upval), NewLayout (ref), FreezeFunction (upval)
			if v8 > CreateResult or CreateResult > v9 then
				local PlacementOfResult = LayoutModule.placementOf(NewLayout, CreateResult)
				FreezeFunction(PlacementOfResult)
				
				return PlacementOfResult
			end
			local PlacementOfResult = PlacementOfResults[CreateResult]
			
			if PlacementOfResult == nil then
				local PlacementOfResult1 = LayoutModule.placementOf(NewLayout, CreateResult)
				FreezeFunction(PlacementOfResult1)
				PlacementOfResults[CreateResult] = PlacementOfResult1
				
				return PlacementOfResult1
			else
				return PlacementOfResult
			end
		end
		
		function Controls.offsetOf(CreateResult, First, p5): number
			-- upvalues: LayoutModule (upval), NewLayout (ref)
			local PlacementOfResult = LayoutModule.placementOf(NewLayout, CreateResult)
			local v13 = if p5 == nil then 0 elseif type(p5) == "number" and p5 == p5 then p5 else 0
			
			return (math.clamp(if First == "end" then PlacementOfResult.offset + PlacementOfResult.size - v13 elseif First == "center" then PlacementOfResult.offset + PlacementOfResult.size / 2 - v13 / 2 else PlacementOfResult.offset, 0, (math.max(0, LayoutModule.totalExtent(NewLayout) - v13))))
		end
	end
	return RetainModule({
		primitive = "OrderedCollection",
		source = OrderedCollection1,
		key = IdentityKey1,
		select = function(p5, p6)
			-- upvalues: v1 (ref), geometryOptions (upval), GeometryOptionsResult (ref), v2 (ref), NewLayout (ref), rebuild (copy), OrderedCollection4 (ref), Flag (ref), v4 (ref), applyMeasurements (copy), LayoutModule (upval), Mode (copy), Callback (ref), config2 (copy), config4 (copy), v5 (ref), OffsetRevision (ref), v6 (ref), IsEnd (copy), Following (ref), FollowThreshold1 (copy), v7 (ref), findAnchorIndex (copy), OffsetOfResult (ref), Largest (copy), config1 (copy), IdentityKey1 (ref), PlacementOfResults (copy), FreezeFunction (upval), v8 (ref), v9 (ref), First (ref), config3 (copy), OrderedCollection5 (copy), v10 (ref), Measured (ref), Direction (copy)
			local Callback1 = v1
			local GeometryOptionsResult1 = if Callback1 == nil then GeometryOptionsResult else geometryOptions(Callback1(p5))
			
			if p6 ~= v2 or GeometryOptionsResult1.columns ~= NewLayout.columns or GeometryOptionsResult1.rowSize ~= NewLayout.rowSize or GeometryOptionsResult1.gap ~= NewLayout.gap or GeometryOptionsResult1.crossSize ~= NewLayout.crossSize or GeometryOptionsResult1.crossGap ~= NewLayout.crossGap then
				rebuild(p6, GeometryOptionsResult1)
			end
			local Callback2 = OrderedCollection4
			
			if Callback2 ~= nil then
				local CallbackResult = Callback2(p5)
				
				if Flag or CallbackResult ~= v4 then
					v4 = CallbackResult
					applyMeasurements(CallbackResult)
				end
			end
			local CountP16 = #p6
			local TalExtent: number = LayoutModule.totalExtent(NewLayout)
			local ClampedValue = 0
			local TalExtent1 = TalExtent
			local OffsetRevision1 = nil
			local config = nil
			
			if Mode == "windowed" then
				local CallbackResult = Callback(p5)
				local Offset = CallbackResult.offset
				ClampedValue = if Offset == nil then 0 elseif type(Offset) == "number" and Offset == Offset then Offset else 0
				local Size = CallbackResult.size
				TalExtent1 = if Size == nil then 0 elseif type(Size) == "number" and Size == Size then Size else 0
				OffsetRevision1 = CallbackResult.offsetRevision
				config = config2
			else
				config4.first = 1
				config4.last = CountP16
				config4.firstRow = if CountP16 > 0 then 1 else 0
				config4.lastRow = NewLayout.rowCount
				config = config4
			end
			local IsNotClampedValueMatch: boolean = v5 ~= nil and (ClampedValue ~= v5 or OffsetRevision1 ~= OffsetRevision)
			local ClampedValue1 = if IsNotClampedValueMatch or v6 == nil then ClampedValue else v6
			local DesiredOffset = nil
			
			if IsEnd and Mode == "windowed" then
				if v5 == nil or IsNotClampedValueMatch then
					Following = TalExtent - (ClampedValue + TalExtent1) <= FollowThreshold1
				end
				if Following then
					DesiredOffset = math.max(0, TalExtent - TalExtent1)
				end
			end
			if DesiredOffset == nil and Mode == "windowed" and v7 ~= nil and not IsNotClampedValueMatch then
				local AnchorIndex = findAnchorIndex(p6, v7)
				
				if AnchorIndex ~= nil then
					local OffsetOfResultDelta = LayoutModule.offsetOf(NewLayout, AnchorIndex) - OffsetOfResult
					
					if OffsetOfResultDelta ~= 0 then
						DesiredOffset = ClampedValue1 + OffsetOfResultDelta
					end
				end
			end
			if Mode == "windowed" then
				ClampedValue1 = math.clamp(DesiredOffset or ClampedValue1, 0, (math.max(0, TalExtent - TalExtent1)))
				DesiredOffset = if ClampedValue1 == ClampedValue then nil else ClampedValue1
				LayoutModule.rangeInto(NewLayout, ClampedValue1, TalExtent1, Largest, config2)
			end
			v6 = DesiredOffset
			local First1: number = config.first
			local Last: number = config.last
			local Values = config1.values
			local Keys = config1.keys
			local States = config1.states
			local Retained = 0
			
			for i3 = First1, Last do
				local v13 = p6[i3]
				Retained += 1
				Values[Retained] = v13
				Keys[Retained] = IdentityKey1(v13, i3)
				local PlacementOfResult = PlacementOfResults[i3]
				local PlacementOfResult1 = nil
				
				if PlacementOfResult == nil then
					local PlacementOfResult2 = LayoutModule.placementOf(NewLayout, i3)
					FreezeFunction(PlacementOfResult2)
					PlacementOfResults[i3] = PlacementOfResult2
					PlacementOfResult1 = PlacementOfResult2
				else
					PlacementOfResult1 = PlacementOfResult
				end
				States[Retained] = PlacementOfResult1
			end
			for i1 = #Values, Retained + 1, -1 do
				Values[i1] = nil
				Keys[i1] = nil
				States[i1] = nil
			end
			for i = v8, math.min(v9, First1 - 1) do
				PlacementOfResults[i] = nil
			end
			for i2 = math.max(v8, Last + 1), v9 do
				PlacementOfResults[i2] = nil
			end
			v8 = First1
			v9 = Last
			v5 = ClampedValue
			OffsetRevision = OffsetRevision1
			
			if Retained > 0 then
				First = if Mode == "windowed" then LayoutModule.rangeInto(NewLayout, ClampedValue1, TalExtent1, 0, config3).first else First1
				v7 = IdentityKey1(p6[First], First)
				OffsetOfResult = LayoutModule.offsetOf(NewLayout, First)
			else
				v7 = nil
				OffsetOfResult = 0
				First = 0
			end
			if OrderedCollection5 ~= nil then
				local v14 = v10
				
				if v14 == nil or v14.total ~= CountP16 or v14.retained ~= Retained or v14.first ~= First1 or v14.last ~= Last or v14.firstRow ~= config.firstRow or v14.lastRow ~= config.lastRow or v14.rowCount ~= NewLayout.rowCount or v14.extent ~= TalExtent or v14.following ~= Following or v14.desiredOffset ~= DesiredOffset or v14.measured ~= Measured then
					local config1 = {
						mode = Mode,
						direction = Direction,
						total = CountP16,
						retained = Retained,
						first = First1,
						last = Last,
						firstRow = config.firstRow,
						lastRow = config.lastRow,
						rowCount = NewLayout.rowCount,
						extent = TalExtent,
						following = Following,
						desiredOffset = DesiredOffset,
						measured = Measured
					}
					v10 = config1
					OrderedCollection5:set(config1)
				end
			end
			return config1
		end,
		render = OrderedCollection2,
		recycle = OrderedCollection3,
		equals = function(p7, p8): boolean
			return p7.index == p8.index and (p7.row == p8.row and (p7.column == p8.column and (p7.offset == p8.offset and (p7.size == p8.size and p7.crossOffset == p8.crossOffset)))) and p7.crossSize == p8.crossSize
		end
	})
end