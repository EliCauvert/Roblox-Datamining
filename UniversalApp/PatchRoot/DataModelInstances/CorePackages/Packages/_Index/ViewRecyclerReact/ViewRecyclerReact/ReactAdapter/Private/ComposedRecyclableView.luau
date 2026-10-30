local ViewRecyclerReact = script:FindFirstAncestor("ViewRecyclerReact")
local _ = require(script.Parent.CompositionPlacement)
local ReactModule = require(ViewRecyclerReact.Parent.React)
local RecyclableViewContextModule = require(script.Parent.RecyclableViewContext)
local RecyclableViewRegistryModule = require(script.Parent.RecyclableViewRegistry)
local SignalsModule = require(ViewRecyclerReact.Parent.Signals)
local SignalsReactModule = require(ViewRecyclerReact.Parent.SignalsReact)
local Signal = SignalsModule.createSignal(nil)
local Signal1 = SignalsModule.createSignal(nil)
local Signal2 = SignalsModule.createSignal(nil)

local function InlineRecyclableView(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), Signal2 (copy), Signal (copy), Signal1 (copy), RecyclableViewContextModule (copy)
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: SignalsModule (upval), p1 (copy), Signal2 (upval), Signal (upval), Signal1 (upval)
		local Signal3, Signal2_1 = SignalsModule.createSignal({ get = p1.itemSignal })
		
		return {
			context = {
				placement = Signal2,
				assignmentSignal = Signal,
				indexSignal = Signal1,
				itemSignal = function(p2)
					-- upvalues: Signal3 (copy)
					return Signal3(p2).get(p2)
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
	return ReactModule.createElement(RecyclableViewContextModule.Provider, { value = UseStateResult.context }, {
		Content = ReactModule.createElement(p1.metadata.signalComponent, {
			itemSignal = UseStateResult.context.itemSignal,
			pending = ReactModule.useState(function()
				-- upvalues: ReactModule (upval)
				return { binding = ReactModule.createBinding(false) }
			end).binding
		})
	})
end

local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), RecyclableViewRegistryModule (copy), SignalsReactModule (copy), InlineRecyclableView (copy)
	local ViewTypeFunction = p1.viewType
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: ViewTypeFunction (copy), RecyclableViewRegistryModule (upval)
		return function(p2)
			-- upvalues: ViewTypeFunction (upval), RecyclableViewRegistryModule (upval)
			local ViewTypeResult = ViewTypeFunction(p2)
			
			if ViewTypeResult == nil then
				return nil
			else
				local Metadata = RecyclableViewRegistryModule.getMetadata(ViewTypeResult)
				assert(Metadata ~= nil, "createRecyclableView: unknown Recyclable view type")
				
				return Metadata
			end
		end
	end, { ViewTypeFunction })))
	
	return if UseSignalStateResult == nil then nil else ReactModule.createElement(InlineRecyclableView, {
		metadata = UseSignalStateResult,
		itemSignal = p1.itemSignal
	})
end)

return function(p1)
	-- upvalues: ReactModule (copy), RecyclableViewContextModule (copy), Signal2 (copy), SignalsModule (copy), MemoResult (copy)
	local UseContextResult = ReactModule.useContext(RecyclableViewContextModule)
	local IsNotUseContextResult = UseContextResult == false
	local UseContextResult1 = if IsNotUseContextResult then nil else UseContextResult
	local Signal = if UseContextResult1 == nil then Signal2 else UseContextResult1.placement
	local UseStateResult = ReactModule.useState(function()
		return {}
	end)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(p1.itemSignal)
	UseRefResult2.current = p1.itemSignal
	local UseRefResult3 = ReactModule.useRef(p1.viewType)
	UseRefResult3.current = p1.viewType
	ReactModule.useLayoutEffect(function()
		-- upvalues: SignalsModule (upval), Signal (copy), UseRefResult1 (copy), UseContextResult1 (copy), UseRefResult3 (copy), UseStateResult (copy), UseRefResult2 (copy), UseRefResult (copy)
		local v1 = nil
		local Effect = SignalsModule.createEffect(function(p2)
			-- upvalues: Signal (upval), v1 (ref), UseRefResult1 (upval), UseContextResult1 (upval), UseRefResult3 (upval), UseStateResult (upval), UseRefResult2 (upval), UseRefResult (upval)
			local SignalResult = Signal(p2)
			
			if SignalResult == v1 then return end
			v1 = SignalResult
			local Current = UseRefResult1.current
			
			if Current ~= nil then
				UseRefResult1.current = nil
				Current.unregister()
			end
			if UseContextResult1 ~= nil and SignalResult ~= nil then
				UseRefResult1.current = SignalResult.register(UseRefResult3.current, UseStateResult, UseContextResult1.assignmentSignal, UseRefResult2.current, UseRefResult.current)
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
	end, { UseContextResult1, Signal, UseStateResult })
	local ItemSignal = p1.itemSignal
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), ItemSignal (copy)
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			Current.setItemSignal(ItemSignal)
		end
	end, { ItemSignal })
	local ViewType = p1.viewType
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult1 (copy), ViewType (copy)
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			Current.setViewType(ViewType)
		end
	end, { ViewType })
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		UseRefResult.current = Current
		local Current1 = UseRefResult1.current
		
		if Current1 ~= nil then
			Current1.setPlaceholder(Current)
		end
	end, {})
	
	return if IsNotUseContextResult then ReactModule.createElement(MemoResult, { viewType = ViewType, itemSignal = ItemSignal }) else ReactModule.createElement("Frame", {
		Name = "RecyclableView",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(),
		ref = UseResult
	})
end