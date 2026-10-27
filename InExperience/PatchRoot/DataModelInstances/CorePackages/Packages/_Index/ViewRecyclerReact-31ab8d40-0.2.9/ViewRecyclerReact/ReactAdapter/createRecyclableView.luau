local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(ViewRecyclerReact.ReactAdapter.Private.CompositionPlacement)
local CompositionPlacementSuspendedModule = require(ViewRecyclerReact.ReactAdapter.Private.CompositionPlacementSuspended)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewContextModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewContext)
local RecyclableViewReadinessModule = require(ViewRecyclerReact.ReactAdapter.RecyclableViewReadiness)
local RecyclableViewRegistryModule = require(ViewRecyclerReact.ReactAdapter.Private.RecyclableViewRegistry)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local SignalsReactModule = require(ViewRecyclerReact.Parent.SignalsReact)
local Signal = SignalsModule.createSignal(true)
local Signal1 = SignalsModule.createSignal(false)
local Signal2 = SignalsModule.createSignal(nil)
local Signal3 = SignalsModule.createSignal(nil)

local function InlineRecyclableView(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), Signal3 (copy), Signal2 (copy), RecyclableViewRegistryModule (copy), RecyclableViewContextModule (copy)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: SignalsModule (upval), p1 (copy), Signal3 (upval), Signal2 (upval)
		local Signal, Signal2_1 = SignalsModule.createSignal(p1.componentProps)
		
		return {
			context = {
				placement = Signal3,
				assignmentSignal = Signal2,
				itemSignal = Signal,
				itemKeySignal = SignalsModule.createSignal({})
			},
			signal = Signal,
			set = Signal2_1,
			value = p1.componentProps
		}
	end)
	
	if UseStateResult.value ~= p1.componentProps then
		UseStateResult.value = p1.componentProps
		UseStateResult.set(p1.componentProps)
	end
	local UseStateResult1 = ReactModule.useState(function()
		-- upvalues: ReactModule (upval)
		return { binding = ReactModule.createBinding(false) }
	end)
	local Metadata = RecyclableViewRegistryModule.getMetadata(p1.viewType)
	assert(Metadata ~= nil, "createRecyclableView: unknown Recyclable view type")
	
	return ReactModule.createElement(RecyclableViewContextModule.Provider, { value = UseStateResult.context }, {
		Content = ReactModule.createElement(Metadata.signalComponent, {
			itemSignal = UseStateResult.signal,
			pending = UseStateResult1.binding
		})
	})
end

local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), InlineRecyclableView (copy)
	return if SignalsReactModule.useSignalState(p1.active) then ReactModule.createElement(InlineRecyclableView, p1) else nil
end)

local function RecyclableViewComponent(p1)
	-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy), CompositionPlacementSuspendedModule (copy), Signal3 (copy), SignalsReactModule (copy), Signal2 (copy), MemoResult (copy)
	local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
	local IsNotUseContextResult = UseContextResult == false
	local UseContextResult1 = if IsNotUseContextResult or UseContextResult == CompositionPlacementSuspendedModule then nil else UseContextResult
	local UseSignalStateResult = SignalsReactModule.useSignalState(if UseContextResult1 == nil then Signal3 else UseContextResult1.placement)
	local UseStateResult = ReactModule.useState(function()
		return {}
	end)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(p1.componentProps)
	UseRefResult2.current = p1.componentProps
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(if UseContextResult1 == nil then Signal2 else UseContextResult1.assignmentSignal)
	local ViewType = p1.viewType
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseContextResult1 (copy), UseSignalStateResult (copy), ViewType (copy), UseStateResult (copy), UseRefResult2 (copy), UseRefResult (copy), p1 (copy), UseRefResult1 (copy)
		if UseContextResult1 == nil or UseSignalStateResult == nil then
			return nil
		else
			local RegisterResult = UseSignalStateResult.register(ViewType, UseStateResult, UseContextResult1.assignmentSignal, UseRefResult2.current, UseRefResult.current, p1.active)
			UseRefResult1.current = RegisterResult
			
			return function()
				-- upvalues: UseRefResult1 (upval), RegisterResult (copy)
				UseRefResult1.current = nil
				RegisterResult.unregister()
			end
		end
	end, {
		UseContextResult1,
		UseSignalStateResult,
		UseStateResult,
		ViewType
	})
	local ComponentProps = p1.componentProps
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), ComponentProps (copy)
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			Current.setProps(ComponentProps)
		end
	end, { ComponentProps, UseSignalStateResult1 })
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
		componentProps = ComponentProps,
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

return function(SignalComponent, p1)
	-- upvalues: RecyclableViewReadinessModule (copy), Signal1 (copy), Signal (copy), ReactModule (copy), RecyclableViewComponent (copy), RecyclableViewRegistryModule (copy)
	local P5 = p1 or {}
	local Readiness = P5.readiness or RecyclableViewReadinessModule.ReadyOnAssignment
	assert(Readiness == RecyclableViewReadinessModule.ReadyOnAssignment or Readiness == RecyclableViewReadinessModule.ReadyOnCommit, "createRecyclableView: readiness must be ReadyOnAssignment or ReadyOnCommit")
	local _definitionIdentity = {}
	
	local function RecyclableViewFacade(Tbl)
		-- upvalues: Signal1 (upval), Signal (upval), ReactModule (upval), RecyclableViewComponent (upval), _definitionIdentity (copy), RecyclableViewFacade (copy)
		local Copy = table.clone(Tbl)
		local ActiveFunction = Copy.active
		Copy.active = nil
		
		return ReactModule.createElement(RecyclableViewComponent, {
			active = if type(ActiveFunction) == "function" then ActiveFunction elseif ActiveFunction == false then Signal1 else Signal,
			componentProps = Copy,
			_definitionIdentity = _definitionIdentity,
			viewType = RecyclableViewFacade
		})
	end
	
	RecyclableViewRegistryModule.register(RecyclableViewFacade, {
		readiness = Readiness,
		hideWhilePending = P5.hideWhilePending == true,
		signalComponent = SignalComponent
	})
	
	return RecyclableViewFacade
end