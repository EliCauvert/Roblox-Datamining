local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local immutable = require(parent.AppCommonLib).Immutable
local symbol = require(parent.AppCommonLib).Symbol
local roactServicesContextModule = require(script.Parent.RoactServicesContext)
local _ = require(script.Parent.RoactServicesTypes)
local serviceProvider = roactModule.PureComponent:extend("ServiceProvider")
local t = {
	ServiceProvider = serviceProvider,
	createService = function(p0)
		-- upvalues: symbol (ref)
		assert(type(p0) == "string", "Expected serviceName to be a string")
		local var4 = symbol.named(p0)
		
		return {
			get = function(p1)
				-- upvalues: var4 (ref)
				return if p1 then p1[var4] else nil
			end,
			set = function(value, p2)
				-- upvalues: var4 (ref)
				value[var4] = p2
			end
		}
	end,
	connect = function(p3)
		-- upvalues: roactModule (ref), immutable (ref), roactServicesContextModule (ref)
		assert(p3 ~= nil, "Expected some services to connect, found none.")
		
		return function(p4)
			-- upvalues: roactModule (copy), p3 (ref), immutable (copy), roactServicesContextModule (copy)
			assert(p4 ~= nil, "Expected a component to connect, found none.")
			local t = {}
			local var6 = roactModule.PureComponent:extend(("Services(%s)"):format(tostring(p4)))
			
			function var6.init(_, p5)
				-- upvalues: p3 (copy), t (ref)
				for i, v in pairs(p3) do
					assert(type(i) == "string", string.format("serviceMap must be indexed by strings, not %s", type(i)))
					assert(type(v) == "table", "serviceMap must have a service created by createService()")
					assert(type(v.get) == "function", "serviceMap must have a service created by createService()")
					assert(p5.innerProps[i] == nil, "Naming conflict with prop : " .. i)
					t[i] = v.get(p5.services)
				end
			end
			
			function var6.render(p6)
				-- upvalues: immutable (copy), t (ref), roactModule (copy), p4 (ref)
				return roactModule.createElement(p4, immutable.JoinDictionaries(p6.props.innerProps, t))
			end
			
			local connectionWrapper = roactModule.PureComponent:extend("ConnectionWrapper")
			
			function connectionWrapper.render(p7)
				-- upvalues: roactModule (copy), roactServicesContextModule (copy), var6 (ref)
				return roactModule.createElement(roactServicesContextModule.Consumer, {
					render = function(p8)
						-- upvalues: roactModule (copy), var6 (copy), p7 (ref)
						return roactModule.createElement(var6, { innerProps = p7.props, services = p8 })
					end
				})
			end
			
			return connectionWrapper
		end
	end
}

function serviceProvider.init(p9, p10)
	local t = {}
	
	if p10 and p10.services then
		assert(p10.services, "Expected some services to connect, found none")
		assert(type(p10.services) == "table", "Expected the provided services to be a map")
		
		for i, v in pairs(p10.services) do
			if type(i) == "table" then
				i.set(t, v)
			end
		end
	end
	p9:setState({ services = t })
end

function serviceProvider.render(p11)
	-- upvalues: roactModule (ref), roactServicesContextModule (ref)
	return roactModule.createElement(roactServicesContextModule.Provider, { value = p11.state.services }, roactModule.oneChild(p11.props[roactModule.Children]))
end

return t