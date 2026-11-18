local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local Parent = RecycledInlineLayout.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local RunService = game:GetService("RunService")
local ViewRecyclerReactModule = require(Parent.ViewRecyclerReact)
local ReactiveModule = require(RecycledInlineLayout.Utils.Reactive)
local _ = require(RecycledInlineLayout.Types)
local ViewTypesModule = require(RecycledInlineLayout.Adapter.ViewTypes)
local FlattenModule = require(RecycledInlineLayout.Layout.flatten)
local LayoutModule = require(RecycledInlineLayout.Layout.layout)
local MeasureTextModule = require(RecycledInlineLayout.Measure.measureText)
local UiScaleModule = require(RecycledInlineLayout.Utils.uiScale)
local ReconcileModule = require(RecycledInlineLayout.Layout.Reconcile)
local WarnOnceModule = require(RecycledInlineLayout.Utils.warnOnce)
local Frozen = table.freeze({})

local function createSpanStore(Definition)
	-- upvalues: SignalsModule (copy)
	local Getters = {}
	local t = {}
	
	for i, value in Definition.state do
		Getters[i], t[i] = SignalsModule.createSignal(value)
	end
	return {
		getters = Getters,
		set = function(p1, p2)
			-- upvalues: t (copy), Definition (copy)
			local Entry: (any) -> () = t[p1]
			assert(Entry ~= nil, `{Definition.name} has no Span state "{p1}"`)
			Entry(p2)
		end
	}
end

local function createLayoutController(Inputs, UseRectPlacementResult, Callback)
	-- upvalues: SignalsModule (copy), ReactModule (copy), createSpanStore (copy), ViewTypesModule (copy), ReactiveModule (copy), FlattenModule (copy), ReconcileModule (copy), LayoutModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local SubscribeToBindingResults = {}
	local t = {}
	local t1 = {}
	local t2 = {}
	local t3 = {}
	local t4 = {}
	local t5 = {}
	local ReportSizes = {}
	local Tbl = {}
	local Sizes = {}
	local Signal3, Signal2_2 = SignalsModule.createSignal(0)
	local Flag = false
	local Config = nil
	
	local function sameLayoutProps(Props, Props1, Props2): boolean
		for i, prop in Props do
			if prop.layout ~= "none" and not prop.equals(Props1[i], Props2[i]) then
				return false
			end
		end
		return true
	end
	
	local function reportedSize(p1, p2)
		-- upvalues: t5 (copy), Tbl (copy), sameLayoutProps (copy)
		local Entry = t5[p1]
		local Entry1 = Tbl[p1]
		
		return if Entry == nil or Entry1 == nil or not sameLayoutProps(Entry1.definition.props, Entry.props, p2) then nil else Entry.size
	end
	
	local function _()
		-- upvalues: Flag (ref), Signal2_2 (copy)
		if not Flag then
			Flag = true
			task.defer(function()
				-- upvalues: Flag (upval), Signal2_2 (upval)
				Flag = false
				Signal2_2(function(p1: number): number
					return p1 + 1
				end)
			end)
			
			return
		end
	end
	
	local _ = function(Key)
		-- upvalues: ReportSizes (copy), Tbl (copy), t5 (copy), sameLayoutProps (copy), Sizes (copy), Flag (ref), Signal2_2 (copy)
		local ReportSize: (any) -> () = ReportSizes[Key]
		
		if ReportSize == nil then
			ReportSize = function(Size)
				-- upvalues: Tbl (upval), Key (copy), t5 (upval), sameLayoutProps (upval), Sizes (upval), Flag (upval), Signal2_2 (upval)
				local v1 = Tbl[Key]
				
				if v1 == nil then return end
				local Props = v1.props
				local v2 = t5[Key]
				local v3 = Tbl[Key]
				local Size1 = if v2 == nil or v3 == nil or not sameLayoutProps(v3.definition.props, v2.props, Props) then nil else v2.size
				t5[Key] = { size = Size, props = v1.props }
				
				if Size1 == Size or Size1 == nil and Sizes[Key] == Size then return end
				if not Flag then
					Flag = true
					task.defer(function()
						-- upvalues: Flag (upval), Signal2_2 (upval)
						Flag = false
						Signal2_2(function(p1: number): number
							return p1 + 1
						end)
					end)
					
					return
				end
			end
			
			ReportSizes[Key] = ReportSize
		end
		return ReportSize
	end
	
	local function syncSubscriptions(List)
		-- upvalues: SubscribeToBindingResults (copy), ReactModule (upval), Signal2_1 (copy)
		for i in List do
			if SubscribeToBindingResults[i] == nil then
				SubscribeToBindingResults[i] = ReactModule.__subscribeToBinding(i, function()
					-- upvalues: Signal2_1 (upval)
					Signal2_1(function(p1: number): number
						return p1 + 1
					end)
				end)
			end
		end
		for i1, subscribeToBindingResult in SubscribeToBindingResults do
			if not List[i1] then
				subscribeToBindingResult()
				SubscribeToBindingResults[i1] = nil
			end
		end
	end
	
	local _ = function(Key)
		-- upvalues: t4 (copy), t3 (copy)
		local Entry = t4[Key]
		
		if Entry == nil then
			Entry = function(...)
				-- upvalues: t3 (upval), Key (copy)
				local Callback = t3[Key]
				
				return if Callback == nil then nil else Callback(...)
			end
			
			t4[Key] = Entry
		end
		return Entry
	end
	
	local function withTrampolines(Key, Props, Tbl)
		-- upvalues: t4 (copy), t3 (copy)
		local v1 = nil
		
		for i, prop in Props do
			if prop.delivery == "callback" and Tbl[i] ~= nil then
				v1 = v1 or table.clone(Tbl)
				local Text: string = `{Key}\0{i}`
				local Entry = t4[Text]
				
				if Entry == nil then
					Entry = function(...)
						-- upvalues: t3 (upval), Text (copy)
						local Callback = t3[Text]
						
						return if Callback == nil then nil else Callback(...)
					end
					
					t4[Text] = Entry
				end
				v1[i] = Entry
			end
		end
		return v1 or Tbl
	end
	
	local function recordCallbacks(Items)
		-- upvalues: t3 (copy), t4 (copy)
		local t = {}
		
		local function record(Key, Props, Props1)
			-- upvalues: t3 (upval), t (copy)
			for i, prop in Props do
				if prop.delivery == "callback" then
					local Text: string = `{Key}\0{i}`
					t3[Text] = Props1[i]
					t[Text] = true
				end
			end
		end
		
		for i, item in Items do
			if item.type == "Leaf" then
				record(item.key, item.definition.props, item.props)
				
				for _, span in item.spans do
					record(span.key, span.definition.props, span.props)
				end
			end
		end
		for i in t3 do
			if not t[i] then
				t3[i] = nil
				t4[i] = nil
			end
		end
	end
	
	local function rowsFor(Key, Rows, p1)
		-- upvalues: t2 (copy), ReactModule (upval)
		p1[Key] = true
		local Entry = t2[Key]
		
		if Entry == nil then
			local Binding, Binding2 = ReactModule.createBinding(Rows)
			Entry = { capacity = 0, binding = Binding, set = Binding2 }
			t2[Key] = Entry
		else
			Entry.set(Rows)
		end
		Entry.capacity = math.max(Entry.capacity, #Rows)
		
		return Entry
	end
	
	local _ = function(p1, p2)
		-- upvalues: t (copy), createSpanStore (upval)
		p2[p1.key] = true
		local Entry = t[p1.key]
		
		if Entry == nil then
			Entry = createSpanStore(p1.definition)
			t[p1.key] = Entry
		end
		return Entry
	end
	
	local _ = function(List, p1, p2): boolean
		for i, value in List do
			if not value.equals(p1[i], p2[i]) then
				return false
			end
		end
		return true
	end
	
	local function cachedItem(Key, p3, p4)
		-- upvalues: t1 (copy)
		p4[Key] = true
		local Entry = t1[Key]
		
		if Entry ~= nil and Entry.specs == p3.specs and Entry.spanState == p3.spanState and Entry.rows == p3.rows and Entry.rowCapacity == p3.rowCapacity and Entry.reportSize == p3.reportSize then
			local Props = Entry.props
			local Props1 = p3.props
			local Flag = true
			
			for i, spec in p3.specs do
				if not spec.equals(Props[i], Props1[i]) then
					Flag = false
					break
				end
			end
			if Flag then
				return Entry
			end
		end
		t1[Key] = p3
		
		return p3
	end
	
	local function toSlots(RebindResult)
		-- upvalues: t (copy), createSpanStore (upval), rowsFor (copy), ViewTypesModule (upval), cachedItem (copy), withTrampolines (copy), Inputs (copy), Tbl (copy), ReportSizes (copy), t5 (copy), sameLayoutProps (copy), Sizes (copy), Flag (ref), Signal2_2 (copy), t1 (copy), t2 (copy)
		local Buffer = table.create(#RebindResult.fragments + #RebindResult.decorations)
		local t6 = {}
		local t7 = {}
		local t8 = {}
		
		for _, decoration in RebindResult.decorations do
			local Span = decoration.span
			t7[Span.key] = true
			local Entry = t[Span.key]
			
			if Entry == nil then
				Entry = createSpanStore(Span.definition)
				t[Span.key] = Entry
			end
			local RowsForResult = rowsFor(decoration.key, decoration.rows, t8)
			local Span1 = decoration.span
			table.insert(Buffer, {
				zIndex = 1,
				key = decoration.key,
				viewType = ViewTypesModule.getViewType(decoration.definition),
				item = cachedItem(decoration.key, {
					key = decoration.key,
					kind = decoration.definition.name,
					specs = Span1.definition.props,
					props = withTrampolines(Span1.key, Span1.definition.props, Span1.props),
					spanState = Entry.getters,
					setSpanState = Entry.set,
					rows = RowsForResult.binding,
					rowCapacity = RowsForResult.capacity,
					diagnostics = Inputs.emit
				}, t6),
				position = decoration.position,
				size = decoration.size
			})
		end
		for _, fragment in RebindResult.fragments do
			local config = {
				zIndex = 2,
				key = fragment.key,
				viewType = ViewTypesModule.getViewType(fragment.definition)
			}
			local Key = fragment.key
			local config1 = {
				key = fragment.key,
				kind = fragment.definition.name,
				specs = fragment.definition.props,
				props = withTrampolines(fragment.leafKey, fragment.definition.props, fragment.props)
			}
			
			if fragment.definition.split == nil and Tbl[fragment.leafKey] ~= nil then
				local LeafKey = fragment.leafKey
				local ReportSize: ((any) -> ())? = ReportSizes[LeafKey]
				
				if ReportSize == nil then
					ReportSize = function(Size)
						-- upvalues: Tbl (upval), LeafKey (copy), t5 (upval), sameLayoutProps (upval), Sizes (upval), Flag (upval), Signal2_2 (upval)
						local v2 = Tbl[LeafKey]
						
						if v2 == nil then return end
						local Props = v2.props
						local v3 = t5[LeafKey]
						local v4 = Tbl[LeafKey]
						local Size1 = if v3 == nil or v4 == nil or not sameLayoutProps(v4.definition.props, v3.props, Props) then nil else v3.size
						t5[LeafKey] = { size = Size, props = v2.props }
						
						if Size1 == Size or Size1 == nil and Sizes[LeafKey] == Size then return end
						if not Flag then
							Flag = true
							task.defer(function()
								-- upvalues: Flag (upval), Signal2_2 (upval)
								Flag = false
								Signal2_2(function(p5: number): number
									return p5 + 1
								end)
							end)
							
							return
						end
					end
					
					ReportSizes[LeafKey] = ReportSize
				end
			else
				local ReportSize: ((any) -> ())? = nil
			end
			config1.reportSize = ReportSize
			config1.diagnostics = Inputs.emit
			config.item = cachedItem(Key, config1, t6)
			config.position = fragment.position
			config.size = fragment.size
			table.insert(Buffer, config)
		end
		for i in t1 do
			if not t6[i] then
				t1[i] = nil
			end
		end
		for i1 in t do
			if not t7[i1] then
				t[i1] = nil
			end
		end
		for i2 in t2 do
			if not t8[i2] then
				t2[i2] = nil
			end
		end
		return Buffer
	end
	
	return {
		run = function(p5, Small, Tokens)
			-- upvalues: Inputs (copy), Signal1 (copy), Signal3 (copy), ReactiveModule (upval), FlattenModule (upval), Tbl (copy), t5 (copy), ReportSizes (copy), Signal (copy), syncSubscriptions (copy), Config (ref), recordCallbacks (copy), ReconcileModule (upval), LayoutModule (upval), reportedSize (copy), Sizes (copy), UseRectPlacementResult (copy), toSlots (copy), Callback (copy)
			local ElementsResult = Inputs.elements(p5)
			local SizingResult = Inputs.sizing(p5)
			local AlignmentResult = Inputs.alignment(p5)
			local PaddingResult = Inputs.padding(p5)
			Signal1(p5)
			local SignalResult = Signal3(p5)
			local t = {}
			local FlattenModuleResult = FlattenModule(ElementsResult, function(Callback)
				-- upvalues: ReactiveModule (upval), t (copy), p5 (copy)
				if ReactiveModule.isBinding(Callback) then
					t[Callback] = true
					
					return Callback:getValue()
				else
					return if ReactiveModule.isSignal(Callback) then Callback(p5) else Callback
				end
			end)
			table.clear(Tbl)
			
			for _, value in FlattenModuleResult do
				if value.type == "Leaf" then
					Tbl[value.key] = value
				end
			end
			for i in t5 do
				if Tbl[i] == nil then
					t5[i] = nil
				end
			end
			for reportSize in ReportSizes do
				if Tbl[reportSize] == nil then
					ReportSizes[reportSize] = nil
				end
			end
			local SignalResult1 = nil
			if SizingResult.fit then
				local MaxWidthFunction = SizingResult.maxWidth
				local Value = nil
				
				if ReactiveModule.isBinding(MaxWidthFunction) then
					t[MaxWidthFunction] = true
					Value = MaxWidthFunction:getValue()
				else
					Value = if ReactiveModule.isSignal(MaxWidthFunction) then MaxWidthFunction(p5) else MaxWidthFunction
				end
				SignalResult1 = Value or 0
			else
				SignalResult1 = Signal(p5)
			end
			syncSubscriptions(t)
			
			if SignalResult1 <= 0 then return end
			local Offset = if PaddingResult then PaddingResult.Offset else Small
			local IsWidthMatch = Config ~= nil and (Config.width == SignalResult1 or not Config.result.wrapped and (Config.result.naturalWidth <= SignalResult1 and (SizingResult.fit or (AlignmentResult == nil or AlignmentResult == Enum.HorizontalAlignment.Left))))
			local IsReportVersionMatch: boolean = Config ~= nil and (IsWidthMatch and (Config.fit == SizingResult.fit and (Config.mergeText == SizingResult.mergeText and (Config.alignment == AlignmentResult and Config.padding == Offset)) and Config.reportVersion == SignalResult))
			recordCallbacks(FlattenModuleResult)
			
			if IsReportVersionMatch and ReconcileModule.sameContent(Config.items, FlattenModuleResult) then
				Config.items = FlattenModuleResult
				Config.width = SignalResult1
				
				return
			end
			local RebindResult = nil
			if IsReportVersionMatch and not SizingResult.mergeText and not ReconcileModule.needsRelayout(Config.items, FlattenModuleResult) then
				RebindResult = ReconcileModule.rebind(Config.result, FlattenModuleResult)
			else
				RebindResult = LayoutModule(FlattenModuleResult, SignalResult1, {
					HorizontalAlignment = AlignmentResult,
					VerticalPadding = Offset,
					fitContent = SizingResult.fit,
					mergeText = SizingResult.mergeText
				}, {
					measureText = Inputs.latest.measureText,
					tokens = Tokens,
					reportedSize = reportedSize
				})
				Inputs.emit({ type = "layoutPass" })
				table.clear(Sizes)
				
				for _, fragment in RebindResult.fragments do
					Sizes[fragment.leafKey] = fragment.size
				end
			end
			UseRectPlacementResult.sync((toSlots(RebindResult)))
			Callback({
				fit = SizingResult.fit,
				width = RebindResult.contentWidth,
				height = RebindResult.height
			})
			Config = {
				items = FlattenModuleResult,
				result = RebindResult,
				width = SignalResult1,
				fit = SizingResult.fit,
				mergeText = SizingResult.mergeText,
				alignment = AlignmentResult,
				padding = Offset,
				reportVersion = SignalResult
			}
		end,
		setWidth = Signal2,
		destroy = function()
			-- upvalues: SubscribeToBindingResults (copy)
			for _, subscribeToBindingResult in SubscribeToBindingResults do
				subscribeToBindingResult()
			end
			table.clear(SubscribeToBindingResults)
		end
	}
end

local function _(Frame)
	-- upvalues: UiScaleModule (copy)
	local UiScaleModuleResult = UiScaleModule(Frame)
	
	return if UiScaleModuleResult == 0 then 0 else Frame.AbsoluteSize.X / UiScaleModuleResult
end

local MemoResult = ReactModule.memo(function(p6)
	-- upvalues: FoundationModule (copy), ReactModule (copy), ViewRecyclerReactModule (copy), createLayoutController (copy), UiScaleModule (copy), RunService (copy), SignalsModule (copy)
	local Inputs = p6.inputs
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRectPlacementResult = ViewRecyclerReactModule.useRectPlacement(UseRefResult)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding({ fit = false, width = 0, height = 0 })
	local UseRefResult1 = ReactModule.useRef(nil)
	local Small = UseTokensResult.Gap.Small
	ReactModule.useLayoutEffect(function()
		-- upvalues: createLayoutController (upval), Inputs (copy), UseRectPlacementResult (copy), UseBindingResult2 (copy), UseRefResult1 (copy), UseRefResult (copy), UiScaleModule (upval), RunService (upval), SignalsModule (upval), Small (copy), UseTokensResult (copy)
		local LayoutController = createLayoutController(Inputs, UseRectPlacementResult, UseBindingResult2)
		UseRefResult1.current = LayoutController
		local Current = UseRefResult.current
		local Connection = nil
		
		if Current ~= nil then
			local UiScaleModuleResult = UiScaleModule(Current)
			local XRatio = if UiScaleModuleResult == 0 then 0 else Current.AbsoluteSize.X / UiScaleModuleResult
			LayoutController.setWidth(XRatio)
			
			if XRatio == 0 and not Current:IsDescendantOf(game) and not Inputs.sizing(false).fit then
				local Count = 0
				local Connection1 = nil
				Connection1 = RunService.Heartbeat:Connect(function()
					-- upvalues: Current (copy), UiScaleModule (upval), Count (ref), Connection1 (ref), Connection (ref), LayoutController (copy)
					local UiScaleModuleResult = UiScaleModule(Current)
					local XRatio = if UiScaleModuleResult == 0 then 0 else Current.AbsoluteSize.X / UiScaleModuleResult
					
					if Current:IsDescendantOf(game) then
						Count += 1
					end
					if XRatio > 0 or Count > 60 then
						Connection1:Disconnect()
						Connection = nil
						LayoutController.setWidth(XRatio)
					end
				end)
				Connection = Connection1
			end
		end
		local Effect = SignalsModule.createEffect(function(p7)
			-- upvalues: LayoutController (copy), Small (upval), UseTokensResult (upval)
			LayoutController.run(p7, Small, UseTokensResult)
		end)
		
		return function()
			-- upvalues: Connection (ref), Effect (copy), LayoutController (copy), UseRefResult1 (upval)
			if Connection ~= nil then
				Connection:Disconnect()
			end
			Effect()
			LayoutController.destroy()
			UseRefResult1.current = nil
		end
	end, { Inputs, UseRectPlacementResult, Small, UseTokensResult })
	ReactModule.useLayoutEffect(function()
		-- upvalues: Inputs (copy)
		Inputs.emit({ type = "hostRender" })
	end)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UseBindingResult:map(function(p7): UDim2
			return if p7.fit then UDim2.fromOffset(math.ceil(p7.width), p7.height) else UDim2.new(1, 0, 0, p7.height)
		end),
		ref = UseRefResult,
		[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
			-- upvalues: UseRefResult1 (copy), UiScaleModule (upval)
			local Current = UseRefResult1.current
			
			if Current ~= nil then
				local SetWidthFunction: (any) -> () = Current.setWidth
				local UiScaleModuleResult = UiScaleModule(Frame)
				SetWidthFunction(if UiScaleModuleResult == 0 then 0 else Frame.AbsoluteSize.X / UiScaleModuleResult)
			end
		end, {})
	})
end)

local _ = function(p6)
	-- upvalues: ViewTypesModule (copy)
	return ViewTypesModule.getName(p6) or "unknown"
end

return function(p6)
	-- upvalues: WarnOnceModule (copy), Frozen (copy), ReactModule (copy), SignalsModule (copy), MeasureTextModule (copy), ViewTypesModule (copy), ViewRecyclerReactModule (copy), MemoResult (copy)
	local Elements = p6.elements
	
	if p6.Elements == nil then
		if Elements == nil then
			WarnOnceModule("RecycledInlineLayout: InlineLayout has no `elements`, so it shows nothing")
		end
	else
		WarnOnceModule("RecycledInlineLayout: InlineLayout ignores `Elements`, the old InlineLayout's prop; pass `elements`")
	end
	local Elements1 = Elements or Frozen
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: SignalsModule (upval), Elements1 (ref), p6 (copy), MeasureTextModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(Elements1)
		local Signal1, Signal2_1 = SignalsModule.createSignal(p6.HorizontalAlignment)
		local Signal3, Signal2_2 = SignalsModule.createSignal(p6.VerticalPadding)
		local Signal4, Signal2_3 = SignalsModule.createSignal({
			fit = p6.width == "fit",
			maxWidth = p6.maxWidth,
			mergeText = p6.mergeText == true
		}, function(p7, p8): boolean
			return p7.fit == p8.fit and p7.maxWidth == p8.maxWidth and p7.mergeText == p8.mergeText
		end)
		local Latest = {
			diagnostics = p6.__diagnostics,
			measureText = p6.__measureText or MeasureTextModule
		}
		
		return {
			elements = Signal,
			setElements = Signal2,
			alignment = Signal1,
			setAlignment = Signal2_1,
			padding = Signal3,
			setPadding = Signal2_2,
			sizing = Signal4,
			setSizing = Signal2_3,
			latest = Latest,
			emit = function(p7)
				-- upvalues: Latest (copy)
				local DiagnosticsFunction: (any) -> () = Latest.diagnostics
				
				if DiagnosticsFunction ~= nil then
					DiagnosticsFunction(p7)
				end
			end
		}
	end)
	UseStateResult.latest.diagnostics = p6.__diagnostics
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseStateResult (copy), p6 (copy), MeasureTextModule (upval), Elements1 (ref)
		UseStateResult.latest.measureText = p6.__measureText or MeasureTextModule
		UseStateResult.setAlignment(p6.HorizontalAlignment)
		UseStateResult.setPadding(p6.VerticalPadding)
		UseStateResult.setSizing({
			fit = p6.width == "fit",
			maxWidth = p6.maxWidth,
			mergeText = p6.mergeText == true
		})
		UseStateResult.setElements(Elements1)
	end)
	local UseResult = ReactModule.useCallback(function(p7)
		-- upvalues: UseStateResult (copy), ViewTypesModule (upval)
		if p7.kind == "poolChanged" then
			UseStateResult.emit({
				type = "pool",
				action = p7.action,
				kind = ViewTypesModule.getName(p7.itemViewType) or "unknown"
			})
		end
	end, {})
	local MaxPoolSize = p6.maxPoolSize or 8
	
	return (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), ViewRecyclerReactModule (upval), MaxPoolSize (copy), UseResult (copy), MemoResult (upval), UseStateResult (copy)
		return ReactModule.createElement(ViewRecyclerReactModule.RecyclingScope, { maxPoolSize = MaxPoolSize, diagnostics = UseResult }, {
			Host = ReactModule.createElement(MemoResult, { inputs = UseStateResult })
		})
	end, { UseStateResult, MaxPoolSize, UseResult }))
end