local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local immutable = require(parent.AppCommonLib).Immutable
local symbol = require(parent.AppCommonLib).Symbol
local roactServicesContextModule = require(script.Parent.RoactServicesContext)
local _ = require(script.Parent.RoactServicesTypes)
local serviceProvider = roactModule.PureComponent:extend("ServiceProvider")
local t = {
	ServiceProvider = serviceProvider,
	createService = function(p1)
		-- upvalues: symbol (ref)
		assert(type(p1) == "string", "Expected serviceName to be a string")
		local var1 = symbol.named(p1)
		
		return {
			get = function(p2)
				-- upvalues: var1 (ref)
				return if p2 then p2[var1] else nil
			end,
			set = function(value, p2)
				-- upvalues: var1 (ref)
				value[var1] = p2
			end
		}
	end,
	connect = function(p1)
		-- upvalues: roactModule (ref), immutable (ref), roactServicesContextModule (ref)
		assert(p1 ~= nil, "Expected some services to connect, found none.")
		
		return function(p2)
			-- upvalues: roactModule (copy), p1 (ref), immutable (copy), roactServicesContextModule (copy)
			assert(p2 ~= nil, "Expected a component to connect, found none.")
			local t = {}
			local var1 = roactModule.PureComponent:extend(("Services(%s)"):format(tostring(p2)))
			
			function var6.init(_, p3)
				-- upvalues: p1 (copy), t (ref)
				for i, v in pairs(p1) do
					assert(type(i) == "string", string.format("serviceMap must be indexed by strings, not %s", type(i)))
					assert(type(v) == "table", "serviceMap must have a service created by createService()")
					assert(type(v.get) == "function", "serviceMap must have a service created by createService()")
					assert(p3.innerProps[i] == nil, "Naming conflict with prop : " .. i)
					t[i] = v.get(p3.services)
				end
			end
			
			function var6.render(p4)
				-- upvalues: immutable (copy), t (ref), roactModule (copy), p2 (ref)
				return roactModule.createElement(p2, immutable.JoinDictionaries(p4.props.innerProps, t))
			end
			
			local connectionWrapper = roactModule.PureComponent:extend("ConnectionWrapper")
			
			function connectionWrapper.render(p4)
				-- upvalues: roactModule (copy), roactServicesContextModule (copy), var1 (ref)
				return roactModule.createElement(roactServicesContextModule.Consumer, {
					render = function(p5)
						-- upvalues: roactModule (copy), var1 (copy), p4 (ref)
						return roactModule.createElement(var1, { innerProps = p4.props, services = p5 })
					end
				})
			end
			
			return connectionWrapper
		end
	end
}

function serviceProvider.init(p2, p3)
	local t = {}
	
	if p3 and p3.services then
		assert(p3.services, "Expected some services to connect, found none")
		assert(type(p3.services) == "table", "Expected the provided services to be a map")
		
		for i, v in pairs(p3.services) do
			if type(i) == "table" then
				i.set(t, v)
			end
		end
	end
	p2:setState({ services = t })
end

function serviceProvider.render(p4)
	-- upvalues: roactModule (ref), roactServicesContextModule (ref)
	return roactModule.createElement(roactServicesContextModule.Provider, { value = p4.state.services }, roactModule.oneChild(p4.props[roactModule.Children]))
end

return t