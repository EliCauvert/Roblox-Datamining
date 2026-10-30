local FFlagViewRecyclerReact08 = require(script:FindFirstAncestor("ViewRecyclerReact").Flags).FFlagViewRecyclerReact08
local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local ComposedRecyclableViewModule = require(ViewRecyclerReact.ReactAdapter.Private.ComposedRecyclableView)
local _ = require(ViewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local CompositionPlacementSuspendedModule = require(ViewRecyclerReact.ReactAdapter.Private.CompositionPlacementSuspended)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewContext)
local RecyclableViewReadinessModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local RecyclableViewRegistryModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local SignalsReactModule = require(ViewRecyclerReact.Parent.SignalsReact)
local SelectViewTypeModule = require(ViewRecyclerReact.ReactAdapter.Private.selectViewType)
local Signal = nil
local Signal1 = nil
local Signal2 = nil
local Signal3 = nil
local Signal4 = nil
local InlineRecyclableView = nil
local MemoResult = nil
local RecyclableViewComponent: ((any) -> any)? = nil

if not FFlagViewRecyclerReact08 then
	Signal = SignalsModule.createSignal(true)
	Signal1 = SignalsModule.createSignal(false)
	Signal2 = SignalsModule.createSignal(nil)
	Signal3 = SignalsModule.createSignal(nil)
	Signal4 = SignalsModule.createSignal(nil)
	
	InlineRecyclableView = function(p1)
		-- upvalues: ReactModule (copy), SignalsModule (copy), Signal4 (ref), Signal2 (ref), Signal3 (ref), RecyclableViewRegistryModule (copy), RecyclableViewContextModule (copy)
		local UseStateResult = ReactModule.useState(function()
			-- upvalues: SignalsModule (upval), p1 (copy), Signal4 (upval), Signal2 (upval), Signal3 (upval)
			local Signal, Signal2_1 = SignalsModule.createSignal({ get = p1.itemSignal })
			
			return {
				context = {
					placement = Signal4,
					assignmentSignal = Signal2,
					indexSignal = Signal3,
					itemSignal = function(p2)
						-- upvalues: Signal (copy)
						return Signal(p2).get(p2)
					end,
					itemKeySignal = SignalsModule.createSignal({})
				},
				set = Signal2_1,
				source = p1.itemSignal
			}
		end)
		
		if UseStateResult.source ~= p1.itemSignal then
			UseStateResult.source = p1.itemSignal
			UseStateResult.set({ get = p1.itemSignal })
		end
		local UseStateResult1 = ReactModule.useState(function()
			-- upvalues: ReactModule (upval)
			return { binding = ReactModule.createBinding(false) }
		end)
		local Metadata = RecyclableViewRegistryModule.getMetadata(p1.viewType)
		assert(Metadata ~= nil, "createRecyclableView: unknown Recyclable view type")
		
		return ReactModule.createElement(RecyclableViewContextModule.Provider, { value = UseStateResult.context }, {
			Content = ReactModule.createElement(Metadata.signalComponent, {
				itemSignal = UseStateResult.context.itemSignal,
				pending = UseStateResult1.binding
			})
		})
	end
	
	MemoResult = ReactModule.memo(function(p1)
		-- upvalues: SignalsReactModule (copy), ReactModule (copy), InlineRecyclableView (ref)
		return if SignalsReactModule.useSignalState(p1.active) then ReactModule.createElement(InlineRecyclableView, p1) else nil
	end)
	
	RecyclableViewComponent = function(p1)
		-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy), CompositionPlacementSuspendedModule (copy), Signal4 (ref), SignalsModule (copy), MemoResult (ref)
		local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
		local IsNotUseContextResult = UseContextResult == false
		local UseContextResult1 = if IsNotUseContextResult or UseContextResult == CompositionPlacementSuspendedModule then nil else UseContextResult
		local Signal = if UseContextResult1 == nil then Signal4 else UseContextResult1.placement
		local UseStateResult = ReactModule.useState(function()
			return {}
		end)
		local UseRefResult = ReactModule.useRef(nil)
		local UseRefResult1 = ReactModule.useRef(nil)
		local UseRefResult2 = ReactModule.useRef(p1.itemSignal)
		UseRefResult2.current = p1.itemSignal
		local UseRefResult3 = ReactModule.useRef(p1.active)
		UseRefResult3.current = p1.active
		local ViewType = p1.viewType
		ReactModule.useLayoutEffect(function()
			-- upvalues: SignalsModule (upval), Signal (copy), UseRefResult1 (copy), UseContextResult1 (copy), ViewType (copy), UseStateResult (copy), UseRefResult2 (copy), UseRefResult (copy), UseRefResult3 (copy)
			local v1 = nil
			local Effect = SignalsModule.createEffect(function(p2)
				-- upvalues: Signal (upval), v1 (ref), UseRefResult1 (upval), UseContextResult1 (upval), ViewType (upval), UseStateResult (upval), UseRefResult2 (upval), UseRefResult (upval), UseRefResult3 (upval)
				local SignalResult = Signal(p2)
				
				if SignalResult == v1 then return end
				v1 = SignalResult
				local Current = UseRefResult1.current
				
				if Current ~= nil then
					UseRefResult1.current = nil
					Current.unregister()
				end
				if UseContextResult1 ~= nil and SignalResult ~= nil then
					UseRefResult1.current = SignalResult.register(ViewType, UseStateResult, UseContextResult1.assignmentSignal, UseRefResult2.current, UseRefResult.current, UseRefResult3.current)
				end
			end)
			
			return function()
				-- upvalues: Effect (copy), UseRefResult1 (upval)
				Effect()
				local Current = UseRefResult1.current
				
				if Current ~= nil then
					UseRefResult1.current = nil
					Current.unregister()
				end
			end
		end, { UseContextResult1, Signal, UseStateResult, ViewType })
		local ItemSignal = p1.itemSignal
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult1 (copy), ItemSignal (copy)
			local Current = UseRefResult1.current
			
			if Current ~= nil then
				Current.setItemSignal(ItemSignal)
			end
		end, { ItemSignal })
		local Active = p1.active
		ReactModule.useLayoutEffect(function()
			-- upvalues: UseRefResult1 (copy), Active (copy)
			local Current = UseRefResult1.current
			
			if Current ~= nil then
				Current.setActive(Active)
			end
		end, { Active })
		local UseResult = ReactModule.useCallback(function(Current)
			-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
			UseRefResult.current = Current
			local Current1 = UseRefResult1.current
			
			if Current1 ~= nil then
				Current1.setPlaceholder(Current)
			end
		end, {})
		
		return if IsNotUseContextResult then ReactModule.createElement(MemoResult, {
			active = Active,
			itemSignal = ItemSignal,
			viewType = ViewType
		}) else ReactModule.createElement("Frame", {
			Name = "RecyclableView",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new(),
			ref = UseResult
		})
	end
end
return function(SignalComponent, p1)
	-- upvalues: RecyclableViewReadinessModule (copy), FFlagViewRecyclerReact08 (copy), ReactModule (copy), SelectViewTypeModule (copy), Signal1 (ref), Signal (ref), ComposedRecyclableViewModule (copy), RecyclableViewComponent (ref), RecyclableViewRegistryModule (copy)
	local P7 = p1 or {}
	local Readiness = P7.readiness or RecyclableViewReadinessModule.ReadyOnAssignment
	local T: boolean = Readiness == RecyclableViewReadinessModule.ReadyOnAssignment or Readiness == RecyclableViewReadinessModule.ReadyOnCommit
	assert(T, "createRecyclableView: readiness must be ReadyOnAssignment or ReadyOnCommit")
	local v1 = nil
	T = if FFlagViewRecyclerReact08 then nil else {}
	
	local function RecyclableViewFacade(p2)
		-- upvalues: FFlagViewRecyclerReact08 (upval), ReactModule (upval), SelectViewTypeModule (upval), v1 (ref), Signal1 (upval), Signal (upval), ComposedRecyclableViewModule (upval), RecyclableViewComponent (upval), RecyclableViewFacade (copy), T (ref)
		local ActiveFunction = p2.active
		local UseMemoResult = nil
		local v2 = nil
		
		if FFlagViewRecyclerReact08 then
			UseMemoResult = ReactModule.useMemo(function()
				-- upvalues: SelectViewTypeModule (upval), ActiveFunction (copy), v1 (upval)
				return SelectViewTypeModule(ActiveFunction == nil or ActiveFunction, v1)
			end, { ActiveFunction })
		else
			v2 = if type(ActiveFunction) == "function" then ActiveFunction elseif ActiveFunction == false then Signal1 else Signal
		end
		return ReactModule.createElement(if FFlagViewRecyclerReact08 then ComposedRecyclableViewModule else RecyclableViewComponent, {
			viewType = if FFlagViewRecyclerReact08 then UseMemoResult else RecyclableViewFacade,
			itemSignal = p2.itemSignal,
			_definitionIdentity = if FFlagViewRecyclerReact08 then nil else T,
			active = if FFlagViewRecyclerReact08 then nil else v2
		})
	end
	
	if FFlagViewRecyclerReact08 then
		v1 = function(p2)
			-- upvalues: RecyclableViewFacade (copy)
			return if p2 then RecyclableViewFacade else nil
		end
	end
	RecyclableViewRegistryModule.register(RecyclableViewFacade, {
		readiness = Readiness,
		hideWhilePending = P7.hideWhilePending ~= false,
		signalComponent = SignalComponent
	})
	
	return RecyclableViewFacade
end