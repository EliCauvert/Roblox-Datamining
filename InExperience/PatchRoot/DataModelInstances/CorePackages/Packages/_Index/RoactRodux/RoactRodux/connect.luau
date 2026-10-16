local RoactModule = require(script.Parent.Parent.Roact)
local ShallowEqualModule = require(script.Parent.shallowEqual)
local JoinModule = require(script.Parent.join)
local StoreContextModule = require(script.Parent.StoreContext)

local function _(List, p1) --[[ Line: 9 | Named "formatMessage" ]]
	return table.concat(List, "\n"):format(unpack(p1 or {}))
end

local function noop() --[[ Line: 13 ]]
	return nil
end

local _ = function(p1) --[[ Line: 26 | Named "makeStateUpdater" ]]
	-- upvalues: JoinModule (copy)
	return function(InnerProps, State, MappedStoreState) --[[ Line: 27 ]]
		-- upvalues: p1 (copy), JoinModule (upval)
		if MappedStoreState == nil then
			MappedStoreState = State.mapStateToProps(p1:getState(), InnerProps)
		end
		return {
			mappedStoreState = MappedStoreState,
			propsForChild = JoinModule(InnerProps, MappedStoreState, State.mappedStoreDispatch)
		}
	end
end

return function(MapStateToProps, Callback) --[[ Line: 50 | Named "connect" ]]
	-- upvalues: noop (copy), RoactModule (copy), JoinModule (copy), ShallowEqualModule (copy), StoreContextModule (copy)
	local Traceback = debug.traceback()
	
	if MapStateToProps == nil then
		MapStateToProps = noop
	else
		assert(typeof(MapStateToProps) == "function", "mapStateToProps must be a function or nil!")
	end
	local ValueType = typeof(Callback)
	
	if Callback == nil then
		Callback = noop
	else
		assert(ValueType == "function" or ValueType == "table", "mapDispatchToProps must be a function, table, or nil!")
	end
	return function(p1) --[[ Line: 69 ]]
		-- upvalues: Traceback (copy), RoactModule (upval), MapStateToProps (ref), ValueType (copy), Callback (ref), JoinModule (upval), ShallowEqualModule (upval), StoreContextModule (upval)
		if p1 == nil then
			error(table.concat({
				"connect returns a function that must be passed a component.",
				"Check the connection at:",
				"%s"
			}, "\n"):format(unpack({ Traceback } or {})), 2)
		end
		local RoduxConnectionName: string = ("RoduxConnection(%s)"):format((tostring(p1)))
		local ExtendResult = RoactModule.Component:extend(RoduxConnectionName)
		
		function ExtendResult.getDerivedStateFromProps(p2, p3) --[[ Line: 86 ]]
			if p3.stateUpdater == nil then return end
			return p3.stateUpdater(p2.innerProps, p3)
		end
		
		function ExtendResult.init(p2, p3) --[[ Line: 92 ]]
			-- upvalues: p1 (copy), MapStateToProps (upval), ValueType (upval), Callback (upval), JoinModule (upval)
			p2.store = p3.store
			
			if p2.store == nil then
				error((table.concat({
					"Cannot initialize Roact-Rodux connection without being a descendent of StoreProvider!",
					"Tried to wrap component %q",
					"Make sure there is a StoreProvider above this component in the tree."
				}, "\n"):format(unpack({ (tostring(p1)) } or {}))))
			end
			local State = p2.store:getState()
			local Callback1 = MapStateToProps
			local CallbackResult = Callback1(State, p2.props.innerProps)
			
			if typeof(CallbackResult) == "function" then
				Callback1 = CallbackResult
				CallbackResult = Callback1(State, p2.props.innerProps)
			end
			if CallbackResult ~= nil and typeof(CallbackResult) ~= "table" then
				error((table.concat({
					"mapStateToProps must either return a table, or return another function that returns a table.",
					"Instead, it returned %q, which is of type %s."
				}, "\n"):format(unpack({ tostring(CallbackResult), (typeof(CallbackResult)) } or {}))))
			end
			local function dispatch(...) --[[ Line: 133 ]]
				-- upvalues: p2 (copy)
				return p2.store:dispatch(...)
			end
			
			local MappedStoreDispatch = nil
			
			if ValueType == "table" then
				MappedStoreDispatch = {}
				
				for i, value in pairs(Callback) do
					assert(typeof(value) == "function", "mapDispatchToProps must contain function values")
					
					MappedStoreDispatch[i] = function(...) --[[ Line: 144 ]]
						-- upvalues: dispatch (copy), value (copy)
						dispatch(value(...))
					end
				end
			elseif ValueType == "function" then
				MappedStoreDispatch = Callback(dispatch)
			end
			local Store = p2.store
			
			local function StateUpdater(InnerProps, State, MappedStoreState) --[[ Line: 27 ]]
				-- upvalues: Store (copy), JoinModule (upval)
				if MappedStoreState == nil then
					MappedStoreState = State.mapStateToProps(Store:getState(), InnerProps)
				end
				return {
					mappedStoreState = MappedStoreState,
					propsForChild = JoinModule(InnerProps, MappedStoreState, State.mappedStoreDispatch)
				}
			end
			
			p2.state = {
				propsForChild = nil,
				stateUpdater = StateUpdater,
				mapStateToProps = Callback1,
				mappedStoreDispatch = MappedStoreDispatch
			}
			
			for i1, value1 in pairs((StateUpdater(p2.props.innerProps, p2.state, CallbackResult))) do
				p2.state[i1] = value1
			end
		end
		
		function ExtendResult.didMount(p4) --[[ Line: 179 ]]
			-- upvalues: ShallowEqualModule (upval)
			local function v18(Value) --[[ Line: 180 ]]
				-- upvalues: p4 (copy), ShallowEqualModule (upval)
				p4:setState(function(State, p5) --[[ Line: 181 ]]
					-- upvalues: Value (copy), ShallowEqualModule (upval)
					local MapStateToPropsResult = State.mapStateToProps(Value, p5.innerProps)
					
					return if ShallowEqualModule(MapStateToPropsResult, State.mappedStoreState) then nil else State.stateUpdater(p5.innerProps, State, MapStateToPropsResult)
				end)
			end
			
			local State = p4.store:getState()
			p4:setState(function(State, p5) --[[ Line: 181 ]]
				-- upvalues: State (copy), ShallowEqualModule (upval)
				local MapStateToPropsResult = State.mapStateToProps(State, p5.innerProps)
				
				return if ShallowEqualModule(MapStateToPropsResult, State.mappedStoreState) then nil else State.stateUpdater(p5.innerProps, State, MapStateToPropsResult)
			end)
			p4.storeChangedConnection = p4.store.changed:connect(v18)
		end
		
		function ExtendResult.willUnmount(p4) --[[ Line: 203 ]]
			if p4.storeChangedConnection then
				p4.storeChangedConnection:disconnect()
				p4.storeChangedConnection = nil
			end
		end
		
		function ExtendResult.render(p4) --[[ Line: 210 ]]
			-- upvalues: RoactModule (upval), p1 (copy)
			return RoactModule.createElement(p1, p4.state.propsForChild)
		end
		
		local ExtendResult1 = RoactModule.Component:extend(RoduxConnectionName)
		
		function ExtendResult1.render(p4) --[[ Line: 216 ]]
			-- upvalues: RoactModule (upval), StoreContextModule (upval), ExtendResult (copy)
			return RoactModule.createElement(StoreContextModule.Consumer, {
				render = function(Store) --[[ Line: 218 ]]
					-- upvalues: RoactModule (upval), ExtendResult (upval), p4 (copy)
					return RoactModule.createElement(ExtendResult, { innerProps = p4.props, store = Store })
				end
			})
		end
		
		return ExtendResult1
	end
end