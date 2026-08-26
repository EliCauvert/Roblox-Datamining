local roactModule = require(script.Parent.Parent.Roact)
local shallowEqualModule = require(script.Parent.shallowEqual)
local joinModule = require(script.Parent.join)
local storeContextModule = require(script.Parent.StoreContext)

local function _(p1, p2)
	return table.concat(p1, "\n"):format(unpack(p2 or {}))
end

local function noop()
	return nil
end

local _ = function(p1)
	-- upvalues: joinModule (ref)
	return function(p2, p3, p4)
		-- upvalues: p1 (ref), joinModule (copy)
		if p4 == nil then
			p4 = p3.mapStateToProps(p1:getState(), p2)
		end
		return {
			mappedStoreState = p4,
			propsForChild = joinModule(p2, p4, p3.mappedStoreDispatch)
		}
	end
end

return function(p1, p2)
	-- upvalues: noop (ref), roactModule (ref), joinModule (ref), shallowEqualModule (ref), storeContextModule (ref)
	local trac = debug.traceback()
	
	if p1 == nil then
		p1 = noop
	else
		assert(typeof(p1) == "function", "mapStateToProps must be a function or nil!")
	end
	local var1 = typeof(p2)
	
	if p2 == nil then
		p2 = noop
	else
		assert(if var1 ~= "function" then var1 == "table" else true, "mapDispatchToProps must be a function, table, or nil!")
	end
	return function(p3)
		-- upvalues: trac (ref), roactModule (copy), p1 (write), var1 (ref), p2 (write), joinModule (copy), shallowEqualModule (copy), storeContextModule (copy)
		if p3 == nil then
			error(table.concat({
				"connect returns a function that must be passed a component.",
				"Check the connection at:",
				"%s"
			}, "\n"):format(unpack({ trac } or {})), 2)
		end
		local var2 = ("RoduxConnection(%s)"):format(tostring(p3))
		local var3 = roactModule.Component:extend(var2)
		
		function var8.getDerivedStateFromProps(p4, p5)
			if p5.stateUpdater == nil then
				return
			end
			return p5.stateUpdater(p4.innerProps, p5)
		end
		
		function var8.init(p4, p5)
			-- upvalues: p3 (ref), p1 (copy), var1 (copy), p2 (copy), joinModule (copy)
			p4.store = p5.store
			
			if p4.store == nil then
				error(table.concat({
					"Cannot initialize Roact-Rodux connection without being a descendent of StoreProvider!",
					"Tried to wrap component %q",
					"Make sure there is a StoreProvider above this component in the tree."
				}, "\n"):format(unpack({ tostring(p3) } or {})))
			end
			local state = p4.store:getState()
			local var4 = p1
			local var5 = var4(state, p4.props.innerProps)
			
			if typeof(var5) == "function" then
				var4 = var5
				var5 = var4(state, p4.props.innerProps)
			end
			if var5 ~= nil and typeof(var5) ~= "table" then
				error(table.concat({
					"mapStateToProps must either return a table, or return another function that returns a table.",
					"Instead, it returned %q, which is of type %s."
				}, "\n"):format(unpack({ tostring(var5), typeof(var5) } or {})))
			end
			local function dispatch(...)
				-- upvalues: p4 (ref)
				return p4.store:dispatch(...)
			end
			
			local var6 = nil
			
			if var1 == "table" then
				var6 = {}
				
				for i, v in pairs(p2) do
					assert(typeof(v) == "function", "mapDispatchToProps must contain function values")
					
					var6[i] = function(...)
						-- upvalues: dispatch (ref), v (ref)
						dispatch(v(...))
					end
				end
			elseif var1 == "function" then
				var6 = p2(dispatch)
			end
			local store = p4.store
			
			local var7 = function(p6, p7, p8)
				-- upvalues: store (ref), joinModule (copy)
				if p8 == nil then
					p8 = p7.mapStateToProps(store:getState(), p6)
				end
				return {
					mappedStoreState = p8,
					propsForChild = joinModule(p6, p8, p7.mappedStoreDispatch)
				}
			end
			
			p4.state = {
				propsForChild = nil,
				stateUpdater = var7,
				mapStateToProps = var4,
				mappedStoreDispatch = var6
			}
			
			for i, v in pairs(var7(p4.props.innerProps, p4.state, var5)) do
				p4.state[i] = v
			end
		end
		
		function var8.didMount(p6)
			-- upvalues: shallowEqualModule (copy)
			local var8 = function(p7)
				-- upvalues: p6 (ref), shallowEqualModule (copy)
				p6:setState(function(p8, p9)
					-- upvalues: p7 (ref), shallowEqualModule (copy)
					local var9 = p8.mapStateToProps(p7, p9.innerProps)
					
					return if shallowEqualModule(var9, p8.mappedStoreState) then nil else p8.stateUpdater(p9.innerProps, p8, var9)
				end)
			end
			
			local state = p6.store:getState()
			p6:setState(function(p7, p8)
				-- upvalues: state (ref), shallowEqualModule (copy)
				local var9 = p7.mapStateToProps(state, p8.innerProps)
				
				return if shallowEqualModule(var9, p7.mappedStoreState) then nil else p7.stateUpdater(p8.innerProps, p7, var9)
			end)
			p6.storeChangedConnection = p6.store.changed:connect(var8)
		end
		
		function var8.willUnmount(p6)
			if p6.storeChangedConnection then
				p6.storeChangedConnection:disconnect()
				p6.storeChangedConnection = nil
			end
		end
		
		function var8.render(p6)
			-- upvalues: roactModule (copy), p3 (ref)
			return roactModule.createElement(p3, p6.state.propsForChild)
		end
		
		local var8 = roactModule.Component:extend(var2)
		
		function var9.render(p6)
			-- upvalues: roactModule (copy), storeContextModule (copy), var3 (ref)
			return roactModule.createElement(storeContextModule.Consumer, {
				render = function(p7)
					-- upvalues: roactModule (copy), var3 (copy), p6 (ref)
					return roactModule.createElement(var3, { innerProps = p6.props, store = p7 })
				end
			})
		end
		
		return var8
	end
end