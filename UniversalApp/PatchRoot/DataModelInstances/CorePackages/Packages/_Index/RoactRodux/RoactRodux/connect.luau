local roactModule = require(script.Parent.Parent.Roact)
local shallowEqualModule = require(script.Parent.shallowEqual)
local joinModule = require(script.Parent.join)
local storeContextModule = require(script.Parent.StoreContext)

local function _(p0, p1) --[[ line: 9 | named "formatMessage" ]]
	return table.concat(p0, "\n"):format(unpack(p1 or {}))
end

local function noop() --[[ line: 13 ]]
	return nil
end

local _ = function(p2) --[[ line: 26 | named "makeStateUpdater" ]]
	-- upvalues: joinModule (ref)
	return function(p3, p4, p5) --[[ line: 27 ]]
		-- upvalues: p2 (ref), joinModule (copy)
		if p5 == nil then
			p5 = p4.mapStateToProps(p2:getState(), p3)
		end
		return {
			mappedStoreState = p5,
			propsForChild = joinModule(p3, p5, p4.mappedStoreDispatch)
		}
	end
end

return function(p6, p7) --[[ line: 50 | named "connect" ]]
	-- upvalues: noop (ref), roactModule (ref), joinModule (ref), shallowEqualModule (ref), storeContextModule (ref)
	local trac = debug.traceback()
	
	if p6 == nil then
		p6 = noop
	else
		assert(typeof(p6) == "function", "mapStateToProps must be a function or nil!")
	end
	local var6 = typeof(p7)
	
	if p7 == nil then
		p7 = noop
	else
		assert(if var6 ~= "function" then var6 == "table" else true, "mapDispatchToProps must be a function, table, or nil!")
	end
	return function(p8) --[[ line: 69 ]]
		-- upvalues: trac (ref), roactModule (copy), p6 (write), var6 (ref), p7 (write), joinModule (copy), shallowEqualModule (copy), storeContextModule (copy)
		if p8 == nil then
			error(table.concat({
				"connect returns a function that must be passed a component.",
				"Check the connection at:",
				"%s"
			}, "\n"):format(unpack({ trac } or {})), 2)
		end
		local var7 = ("RoduxConnection(%s)"):format(tostring(p8))
		local var8 = roactModule.Component:extend(var7)
		
		function var8.getDerivedStateFromProps(p9, p10) --[[ line: 86 ]]
			if p10.stateUpdater == nil then
				return
			end
			return p10.stateUpdater(p9.innerProps, p10)
		end
		
		function var8.init(p11, p12) --[[ line: 92 ]]
			-- upvalues: p8 (ref), p6 (copy), var6 (copy), p7 (copy), joinModule (copy)
			p11.store = p12.store
			
			if p11.store == nil then
				error(table.concat({
					"Cannot initialize Roact-Rodux connection without being a descendent of StoreProvider!",
					"Tried to wrap component %q",
					"Make sure there is a StoreProvider above this component in the tree."
				}, "\n"):format(unpack({ tostring(p8) } or {})))
			end
			local state = p11.store:getState()
			local var11 = p6
			local var12 = var11(state, p11.props.innerProps)
			
			if typeof(var12) == "function" then
				var11 = var12
				var12 = var11(state, p11.props.innerProps)
			end
			if var12 ~= nil and typeof(var12) ~= "table" then
				error(table.concat({
					"mapStateToProps must either return a table, or return another function that returns a table.",
					"Instead, it returned %q, which is of type %s."
				}, "\n"):format(unpack({ tostring(var12), typeof(var12) } or {})))
			end
			local function dispatch(...) --[[ line: 133 ]]
				-- upvalues: p11 (ref)
				return p11.store:dispatch(...)
			end
			
			local var14 = nil
			
			if var6 == "table" then
				var14 = {}
				
				for i, v in pairs(p7) do
					assert(typeof(v) == "function", "mapDispatchToProps must contain function values")
					
					var14[i] = function(...) --[[ line: 144 ]]
						-- upvalues: dispatch (ref), v (ref)
						dispatch(v(...))
					end
				end
			elseif var6 == "function" then
				var14 = p7(dispatch)
			end
			local store = p11.store
			
			local var15 = function(p13, p14, p15) --[[ line: 27 ]]
				-- upvalues: store (ref), joinModule (copy)
				if p15 == nil then
					p15 = p14.mapStateToProps(store:getState(), p13)
				end
				return {
					mappedStoreState = p15,
					propsForChild = joinModule(p13, p15, p14.mappedStoreDispatch)
				}
			end
			
			p11.state = {
				propsForChild = nil,
				stateUpdater = var15,
				mapStateToProps = var11,
				mappedStoreDispatch = var14
			}
			
			for i, v in pairs(var15(p11.props.innerProps, p11.state, var12)) do
				p11.state[i] = v
			end
		end
		
		function var8.didMount(p16) --[[ line: 179 ]]
			-- upvalues: shallowEqualModule (copy)
			local var16 = function(p17) --[[ line: 180 ]]
				-- upvalues: p16 (ref), shallowEqualModule (copy)
				p16:setState(function(p18, p19) --[[ line: 181 ]]
					-- upvalues: p17 (ref), shallowEqualModule (copy)
					local var18 = p18.mapStateToProps(p17, p19.innerProps)
					
					return if shallowEqualModule(var18, p18.mappedStoreState) then nil else p18.stateUpdater(p19.innerProps, p18, var18)
				end)
			end
			
			local state = p16.store:getState()
			p16:setState(function(p20, p21) --[[ line: 181 ]]
				-- upvalues: state (ref), shallowEqualModule (copy)
				local var18 = p20.mapStateToProps(state, p21.innerProps)
				
				return if shallowEqualModule(var18, p20.mappedStoreState) then nil else p20.stateUpdater(p21.innerProps, p20, var18)
			end)
			p16.storeChangedConnection = p16.store.changed:connect(var16)
		end
		
		function var8.willUnmount(p22) --[[ line: 203 ]]
			if p22.storeChangedConnection then
				p22.storeChangedConnection:disconnect()
				p22.storeChangedConnection = nil
			end
		end
		
		function var8.render(p23) --[[ line: 210 ]]
			-- upvalues: roactModule (copy), p8 (ref)
			return roactModule.createElement(p8, p23.state.propsForChild)
		end
		
		local var9 = roactModule.Component:extend(var7)
		
		function var9.render(p24) --[[ line: 216 ]]
			-- upvalues: roactModule (copy), storeContextModule (copy), var8 (ref)
			return roactModule.createElement(storeContextModule.Consumer, {
				render = function(p25) --[[ line: 218 ]]
					-- upvalues: roactModule (copy), var8 (copy), p24 (ref)
					return roactModule.createElement(var8, { innerProps = p24.props, store = p25 })
				end
			})
		end
		
		return var9
	end
end